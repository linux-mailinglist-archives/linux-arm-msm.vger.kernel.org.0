Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6C66721E13
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 08:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjFEG0T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 02:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjFEG0R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 02:26:17 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81013EA
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 23:26:15 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-977c8423dccso326054566b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 23:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685946374; x=1688538374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKNxhsEFUtYjzQxD0J9q5LbYbALidtpnh+E1K51aRgc=;
        b=DfT8Qmh3d0Z8MndjKU4WDIDM5R4fi8RaQjuJ3Gu318n1xtvZKBsj3qglFm1KwZtHfC
         JGHn7hFoLui5gzXAWn9inVA1ZRrFMHbFT4X55JZhJAVxkW5e1ZGGObg5g2dhavmd5LiR
         v1v+G5Lyt5MN2kq1fGZ3hLJAdDaNS7Uo9ulWxgJyPmW02CG0DvaEiaovCkzZ3+NbU6JC
         jaVR9/xcrz+MuT75tz3MpkvdfLubRlvj2pl8Y69ogLvAHMwentNIsCXOyDIR2ZME6dom
         DKm9fl/yq+O5bSVOclLemPKJ2fFu8fZe2FnXaPd88U2qVe60cYgUtQrP3o+5J99KHp6H
         qS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685946374; x=1688538374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JKNxhsEFUtYjzQxD0J9q5LbYbALidtpnh+E1K51aRgc=;
        b=G1BC2LnzNzGT3n247q9+/LYSuH85+ZN/PFVH/FWUveAWVq15V6gREh5V3IGfs2KyaV
         RVeBkrmbHsgTzPwyG4vMQvjL/73R9RktTRwM0dc7T29fJFhnK+kIY34ETCFl8Iy3/r6u
         43wG/nigFN2cOesHIi1n30KJ/VOENkxvCQHTSaT+oT79OMSCUsJ+0fNLBl/mfQlBnhCc
         vUqIKK7sqdPmDntKg5zob9VUOQB72G4LOtCGciDlI1mDeWHtbYYDUpiWFfT7SaEqZOZk
         hAk5nPCQ8bdor1fpbRTIpgOFBw8iTfr5Z3/OsosQ+eYlWS7P9DfgeyVeLaNJ0WASYyg5
         pPuQ==
X-Gm-Message-State: AC+VfDzdBV+VCWr4w2uF+BGY/xb2sD7c7XrLnXUcibN2adiLDDE7umU1
        aU7IyMyRLHLxzBpWIcmOfRYggQ==
X-Google-Smtp-Source: ACHHUZ4I1WSNJJSHpNb+jq73kUifdOulRKcOLRCfEgk8bjsqMW/HDusbgfA+8LYUBWK+Zo1wnqD2Mw==
X-Received: by 2002:a17:907:1c0a:b0:977:daec:4017 with SMTP id nc10-20020a1709071c0a00b00977daec4017mr1525296ejc.30.1685946374070;
        Sun, 04 Jun 2023 23:26:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qh8-20020a170906eca800b009600ce4fb53sm3871846ejb.37.2023.06.04.23.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 23:26:13 -0700 (PDT)
Message-ID: <35e62a74-c86e-b274-a013-a2f8f312c265@linaro.org>
Date:   Mon, 5 Jun 2023 08:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: qcom,msm8996-mss-pil: Add
 SDM660 compatible
Content-Language: en-US
To:     Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230604061421.3787649-1-alexeymin@postmarketos.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230604061421.3787649-1-alexeymin@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/06/2023 08:14, Alexey Minnekhanov wrote:
> Mention sdm660-mss-pil in compatibles list.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

