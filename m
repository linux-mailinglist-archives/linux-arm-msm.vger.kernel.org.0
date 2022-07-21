Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0218B57D18E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 18:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbiGUQbi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 12:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbiGUQbi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 12:31:38 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6653D48C83
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 09:31:35 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id n18so3650940lfq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nX66Dtq0rn4DfdnmpDQrphG1tUixsaeOUKA4fMQVjEA=;
        b=zeBoSvtsGjr1+H6h3J4McJ0kCNRn833BMaWEI4fiCdpe4If/PX573XyHqOtApo0Twd
         z1lSOdmFkAqEVpVYmxn6vK3F85vfd/qszcwjjjLbdq8UVFHav2X/L3YucIimEVP8wKjo
         3CW16aaZA6IPo0r7A3TzapmXKwBGseKH3M9te2C6e1jv1+DCVAIK68Q7lUv3gqCBpfFr
         62RRnLItbV8du6m3BqE+G64R4WVRSrbZTzFP1OG7wcirwpV/NEJUes3z8VpawKEd6fO1
         B6UUsrgioWcNPXdkO8d6TQaoaQ0yiUykyQs20df9EjnbxbF8hB3jJ3RHK0h/Mkt2X3L1
         F8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nX66Dtq0rn4DfdnmpDQrphG1tUixsaeOUKA4fMQVjEA=;
        b=hgbAuVg8zOvCJKfuEhzb7nnLAAruYyLY2q8XZ5HKavkuLfOBtKZRsVdHaggnc8gwvM
         Uw4Y/5x7onKWP0B8uNuUlo+yuvJYENgwlvXak857BZNcvkXuWf8MtkbprEl0itqlmo/F
         oT1P38SEkGtZDEW35TRF6e0jaWD6jDb7rvs4C6PV5NVZei0HS2vHuQYN7LDNr+QOfTkU
         rTnhK4rE2+Iv6fpx5fArY9RrxVhF/Gy4LFwq6YePg1hf3hWwwXaXYu6MHPt+dLtXOyi6
         8VvS4STTNIsPaKkRn9mriDSlzyC6zdpYMsqhHsUjzU68MXcG6tv0D4oHDUpXUc6G92+A
         WaRA==
X-Gm-Message-State: AJIora9j6C/wQyJcOCnU8nCBhL9d63GsPpX9vt5Mryw7FEddR4WhrdQy
        iXd9ZyawNYnSOmRMib6C49b/ceMqFKnDlyoK
X-Google-Smtp-Source: AGRyM1vMKKGhIcT2KMK9GliNNg+Wtb3Bd8tuhgg6esYdmRWuQwTp2IL/bZyMJm0R5YLW//S9fZEK0g==
X-Received: by 2002:a05:6512:3501:b0:48a:712b:a99 with SMTP id h1-20020a056512350100b0048a712b0a99mr1287885lfs.608.1658421093499;
        Thu, 21 Jul 2022 09:31:33 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id q20-20020a056512211400b00489d438ad8esm525094lfr.261.2022.07.21.09.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 09:31:33 -0700 (PDT)
Message-ID: <7effef70-f829-4677-888c-dcd4e5b063c7@linaro.org>
Date:   Thu, 21 Jul 2022 18:31:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] dt-bindings: arm: qcom: Document additional sa8540p
 device
Content-Language: en-US
To:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220721154413.15578-1-quic_ppareek@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721154413.15578-1-quic_ppareek@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/07/2022 17:44, Parikshit Pareek wrote:
> Add the ADP ride device to the valid device compatibles found on the
> sa8540p platform.
> 
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>

Bindings are always first commit, otherwise your patchset is not bisectable.

Best regards,
Krzysztof
