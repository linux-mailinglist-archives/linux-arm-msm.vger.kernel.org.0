Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA0B78DBF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236003AbjH3Sbb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243638AbjH3LSq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 07:18:46 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CD6CD6
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 04:18:41 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso706151666b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 04:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693394320; x=1693999120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVQlKyhTAWljBmOWLEtpki/gm83Zth480mHz0wQApL4=;
        b=VbmFgB0NlijfrrseWolllIfEB9mVp1ekpezuwRiAsBSmyKLNVwq/ZrwtzDAlxo/Vks
         1hHHxnra8f6TNe3cdaRn00XA6i5/po1oFzcuTOYMDVQiDolBoZmXPLv/0RidWYa9LH17
         7icbAzkOFZ4q0c3n3WDa0aHN8wlHRLDzX3hWNx2Q3Q1ZqiGM1w/hXmooUlyyp1dVyOXI
         OFKghieDY7gx2enCFrBBCQsFvsvOfA33kWK3gcMu1A0vUOtSRzYrwydbaobMS/Fj039e
         UVYpIE8OAA1cH0LYyQSQaULxl3W7N7yj/DHPuiSICaS0cr7s08QLoz1iR+/0Ca79lMA2
         YKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693394320; x=1693999120;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVQlKyhTAWljBmOWLEtpki/gm83Zth480mHz0wQApL4=;
        b=QnpjKcKpYLUEfjYEuO/D7BqJbTT/I16UqLo/hCyRieD70BOCNKxu65gOAvs8RUUP0g
         FOX/xB/Wcq2NVkn0Sz352YQ+XyF4o3uPD6GqFVgPKmqx4Ro9/jK9n/W/TFv4xxkjfeg9
         4OEGM2T6VcEuknuQ+Y0/ZUOKLznQ0FeOfFrNT2P0GzqV0p0idf5/ld5LkW0bzJ2e0TXH
         xoTswtehsBTUrT1Tz1CKssYWXMltQY3PRuUFbWgjyq/1QSeoKTinE60Rw23OsIkaGGBl
         fo/KLJCq1tIcudufpn5BMIWXeSdxK/zerhRGAtOy+/KYb4HDOIFLtKy5lY6g1jPWZkfp
         5X3A==
X-Gm-Message-State: AOJu0YwCSUUUev1P02uQS5QaE3J4G9Ymw7J8NA2TS6dM2/DDAuoxs5bG
        CZW4Bow2dXWTuEyObXpglw9BEw==
X-Google-Smtp-Source: AGHT+IFBisXbMMM4zLaUdtQErTfdcluBuZqJlgfqztP9i7xG9h4hj34KV3TYrjEaid6TuIC/qcz5TQ==
X-Received: by 2002:a17:906:32d8:b0:9a1:c9c5:5fa1 with SMTP id k24-20020a17090632d800b009a1c9c55fa1mr1296163ejk.4.1693394319912;
        Wed, 30 Aug 2023 04:18:39 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id d5-20020a1709067f0500b0099b7276235esm7060725ejr.93.2023.08.30.04.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 04:18:39 -0700 (PDT)
Message-ID: <3b4c873a-a091-51dd-4ce1-84b40886b5cd@linaro.org>
Date:   Wed, 30 Aug 2023 13:18:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: usb: dwc3: Add IPQ5018 compatible
Content-Language: en-US
To:     Nitheesh Sekar <quic_nsekar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        quic_wcheng@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230830111641.19293-1-quic_nsekar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830111641.19293-1-quic_nsekar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/08/2023 13:16, Nitheesh Sekar wrote:
> Document the IPQ5018 dwc3 compatible.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> ---
> Link: https://lore.kernel.org/all/3e4e03b6-380c-ce61-dd93-30669e6f9b5c@linaro.org/
> As per the review comments in the above series
> created a new series for this patchset as per subsystem.

Please provide changelog. This is not v1 anymore.

Best regards,
Krzysztof

