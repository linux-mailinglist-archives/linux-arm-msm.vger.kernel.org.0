Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 817A7659176
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 21:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233943AbiL2USz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 15:18:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233854AbiL2USx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 15:18:53 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AC9E140F1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 12:18:51 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id j17so19444307lfr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 12:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/hmS7ZRFlU0egPJonOLLnIksGJ4WM2luDpw9hwYG3Q=;
        b=eHAiGv5O8Aa1wXevv+zHD0COpXXHaIA7lDxNXDiKPt1xdy7U8DNM0UGEiDAf46G0BM
         u17zuPzl9kMwLuqfZk48F6n3gqum4L8Clr7PL9sEiIaccZcTnOoExgpUrtJaoG2nKf4N
         IF0RPWncS4kzB9qba6SxPHQA/ugs3NpSYXrFQE1Nojx83X61/aJxJR1gV76R6igZjBAu
         PdQYRvctqAS+Bc1sT2j0YUhcNSImV4eL7pAs45DOmzGjMGXnh+Hj0MQpOGyLBIdLyrb0
         OI0bDMwNFsLF0hTcFNyBDY8CKdzBV6+Y0OGQvaVCxyYctFTVpawl87vxBvdzqTF9hJtG
         cgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/hmS7ZRFlU0egPJonOLLnIksGJ4WM2luDpw9hwYG3Q=;
        b=HksQLRfz2L+tUjc0Wp/HDZbk0p1YZCRNfRL8M8U2oDKU2vUVQ3v0KVaKK88TEvFLrm
         j77iBM8g+dPUrPwlN24Qq2Hlzyx4JPEPGewOtxnRsrRsjqjnjzC058rjbyJyKG6RPUYx
         yYLe/ilCk/K/mXpO/nLA+dqPYCxJto6pu+mEBwOu57Ga5ReOLtHcKbLt8Cd310hEfaCI
         W5QRVGoHxBkE/hQ04d53KjtNPJW7IzgR+aKpWW9zMXRJXxoAi18m7A/zICjDafbkWA0O
         sAKk7KHCWxojqqu28tFtEaWAxi/GYBf367Vnk0Jhyl8yNwkzC798EvUjZP/Zjt23u+fn
         oK8g==
X-Gm-Message-State: AFqh2krkRkbuATPLlsmox8VASj09PMqNm5TbE+71pkBUU/7Tv1J/CRib
        WOIotwwsxdaUH7oKaYOBJQU86Q==
X-Google-Smtp-Source: AMrXdXunGXgJpFiwRGFbyxOCnKhEl+sDDFXycFjfBygCMWiBMf0aMVHepfLueVDIBeWNUuED2KPunA==
X-Received: by 2002:a05:6512:2385:b0:4b5:90be:33c8 with SMTP id c5-20020a056512238500b004b590be33c8mr8991769lfv.48.1672345129590;
        Thu, 29 Dec 2022 12:18:49 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bq8-20020a056512150800b00492e5d31201sm3152576lfb.7.2022.12.29.12.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 12:18:48 -0800 (PST)
Message-ID: <c8a05a9f-823e-57a5-da18-0a199d96c99f@linaro.org>
Date:   Thu, 29 Dec 2022 22:18:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom,pcie2-phy: convert to YAML
 format
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20221229115932.3312318-1-dmitry.baryshkov@linaro.org>
 <20221229115932.3312318-2-dmitry.baryshkov@linaro.org>
 <1b11ca6d-3e28-f019-435d-06daea38d00c@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1b11ca6d-3e28-f019-435d-06daea38d00c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/12/2022 16:01, Krzysztof Kozlowski wrote:
> On 29/12/2022 12:59, Dmitry Baryshkov wrote:
>> Convert the bindings for the Qualcomm PCIe2 PHY into the YAML format
>> from the text description.
> 
> You got here Rob's tag.

True, missed it

To save a repost:

Reviewed-by: Rob Herring <robh@kernel.org>

For the reference:
https://lore.kernel.org/all/167209187655.72399.4038954760167968816.robh@kernel.org/

-- 
With best wishes
Dmitry

