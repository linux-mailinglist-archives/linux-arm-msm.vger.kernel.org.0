Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D36A362DA70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 13:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240048AbiKQMOH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 07:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240033AbiKQMOF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 07:14:05 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EE5697FD
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 04:14:04 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id be13so2489460lfb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 04:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ASBsFKuEewNKcc6V+qvTiKWEIdGA8lGcj9oKMILA6C4=;
        b=OizyyH6jpymDfxwhYPY1ZjQFuGm0wI/ZDUGRXv1NCePlEDzBGbsF41N4kxwKCwOR/2
         e5GmFmlcmmGQpgpJBo3/cTLMniH9hKGI4XD2tJQEoqZGDiU7TXlbdrTgDxqbaqR7/DQ6
         EBgJwlEKOv2902yamK5JTxU6rPh5xvfL/sY8uq+as8YQK5d2wmjlzqETCctnfvl5Kng+
         NM2VmNfUdNxxOskq0jtSjtqClKKGm1Yg+aSa8DBCUbMXwyS8YgGroYDEKJsDMDuMIHW4
         vYfgu43ba+XoKO6nSq5Q7Qp2YJr4l59hK5cbYN4TSYVDK9/Z+iHiT4EE+OFus1YuXgeW
         nf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASBsFKuEewNKcc6V+qvTiKWEIdGA8lGcj9oKMILA6C4=;
        b=HPzxh/6oDIEO7rabCr4dY9C7zLpiK1aNtE/J/T31oRiWw249ySkIk9cAGEO4c5JVP1
         oY8gAHUxVmKeoN4DB+8XGr3c9pcxly+p9vGIOg6Aeg4LNKek02e/P0O+J5jz6ePvKUDJ
         nthCOcv6Mowg5j+ACy7CBPEHrBnhRAh0f6h3UERT7/ajkyOIchGbP/k9mHWUCWZ6kZ7w
         0XEiXmM5Mio0DRg59UaQq23Uxa2GejxTjhunDEPlR853m/jIMhG/j83V5n9XT+mZRa/r
         ip5Tnj8qMogVpG/kH75Vg56y+q3hpOkEOJpkynEYgjwedIGMb4zMNgKgWc6lISk13oP1
         hn7w==
X-Gm-Message-State: ANoB5pmFlXuWyhF3PjiWczthljNYVieuiKXt/qHrt90VLuj/7ZBUYzCm
        n3vd2XbDaGImqK0yoQ0a42ZNgA==
X-Google-Smtp-Source: AA0mqf5NZECC0LuCmmfm6KLExVXnB+sUDNzVGLvI44r5THoEJgGAEx5Ir3NqDp6WOQ93SDt85//lEw==
X-Received: by 2002:a05:6512:a93:b0:4a2:6337:872d with SMTP id m19-20020a0565120a9300b004a26337872dmr801504lfu.35.1668687242409;
        Thu, 17 Nov 2022 04:14:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m12-20020ac24acc000000b004a240eb0217sm118535lfp.251.2022.11.17.04.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 04:14:01 -0800 (PST)
Message-ID: <b97f6cd7-6d4a-f0d6-7aea-bab16de96621@linaro.org>
Date:   Thu, 17 Nov 2022 13:14:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 01/12] dt-bindings: iio: qcom: adc7-pm8350: Allow
 specifying SID for channels
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh@kernel.org>, andersson@kernel.org
References: <20221103095810.64606-1-manivannan.sadhasivam@linaro.org>
 <20221103095810.64606-2-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221103095810.64606-2-manivannan.sadhasivam@linaro.org>
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

On 03/11/2022 10:57, Manivannan Sadhasivam wrote:
> As per the new ADC7 architecture used by the Qualcomm PMICs, each PMIC
> has the static Slave ID (SID) assigned by default. The primary PMIC
> PMK8350 is responsible for collecting the temperature/voltage data from
> the slave PMICs and exposing them via it's registers.
> 
> For getting the measurements from the slave PMICs, PMK8350 uses the
> channel ID encoded with the SID of the relevant PMIC. So far, the
> dt-binding for the slave PMIC PM8350 assumed that there will be only
> one PM8350 in a system. So it harcoded SID 1 with channel IDs.
> 
> But this got changed in platforms such as Lenovo X13s where there are a
> couple of PM8350 PMICs available. So to address multiple PM8350s, change
> the binding to accept the SID specified by the user and use it for
> encoding the channel ID.
> 
> It should be noted that, even though the SID is static it is not
> globally unique. Only the primary PMIC has the unique SID id 0.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

This was never sent to IIO maintainers, so now next is failing.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

