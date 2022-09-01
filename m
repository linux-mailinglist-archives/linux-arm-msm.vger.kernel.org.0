Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED7F35A907E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 09:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbiIAHjG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 03:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233951AbiIAHjE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 03:39:04 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909FF118A54
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 00:39:02 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id s15so11847182ljp.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 00:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=M4HvfQcPdaPA2OH09fXKeYQ8XRsv26I21TWdMvoyVdA=;
        b=NKDbhY9mJ3EuT6p6bKAiQiIFsWqv6BrU/dCgxS5wRAFJSwbMlQMlteSiBh3MWpiQ1s
         farZ+guCytYZIHC5b/ZMTdUt4m94dHmK8r0hbPUccprNAxHwilr+jAHFYHly/0GZC6jq
         26vh+u82rKUDuhZYYMF+mLPbjHGz1Ul1Hzcv6Kn23I1k/53UySRypjGQlog1+7xBorn3
         KOZ+txL461fpIW4ehZAbPbutyxv2+oOFXtpgsT2LXli/iZtugWdUoYTLlV9OAj3D6hb4
         Bs0s1X8tPiPR/NTm0CFTdaOW4OHmEdnEMucD6esCnh9wkxvIlS6OJbgQ2GpyzywNaNET
         6bWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=M4HvfQcPdaPA2OH09fXKeYQ8XRsv26I21TWdMvoyVdA=;
        b=eBBNWJZbV6vSjkebjF5ebjnI/pyDN9XOJfPsKOeXIWtlfNg/sihbrjCuhuucMDbGLv
         HhwS+Sp0FALIhO35opMS6J8ar7y6xD94oySUDLBA8lzAlKQPT7mnQrFOMMK91OIHrxgQ
         Y+tfUagZNdQ4EgirhvME2piXYJ2/rcI9w+L2rmWNOcl1JEkLiF/G9zlH45KHDObkveUs
         UsPitc/SGZbfnEOhnFntmYL7Fs1VuDbVfhAagCW9Tc1LtHJfVHKHHWMlyGrM/Yiwpxr4
         r9qGBSKM+lXz+hPb+P5r7rm62fxrvO8UfAdoGkPGyxhYcf24AcMVQT8XK4kwdGM/d5J8
         IzBw==
X-Gm-Message-State: ACgBeo3SQBBmcgpqjUZ0/cfYbx9uYt1W3FgPGufzwoRMN4BLUPm/kR6L
        ABDznAM4qUYZAmdDHHYugiTdYA==
X-Google-Smtp-Source: AA6agR6O+X3XGQw/vOCFuS+z1Fe50p+2SMsAmdfnJCNcvafIN14inBCe9BGHwMGGY+3EjsngPYck7Q==
X-Received: by 2002:a05:651c:198e:b0:25e:6d28:3a0f with SMTP id bx14-20020a05651c198e00b0025e6d283a0fmr9944631ljb.321.1662017940934;
        Thu, 01 Sep 2022 00:39:00 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id c2-20020a056512104200b004949e28273fsm91447lfb.206.2022.09.01.00.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 00:39:00 -0700 (PDT)
Message-ID: <d0111cb8-1104-73a4-aacf-ff0cd803d571@linaro.org>
Date:   Thu, 1 Sep 2022 10:38:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: Add description of camera
 control interfaces
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220901073504.3077363-1-vladimir.zapolskiy@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901073504.3077363-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/09/2022 10:35, Vladimir Zapolskiy wrote:
> Add description of two CCI controllers found on QCOM SM8450.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 142 +++++++++++++++++++++++++++
>  1 file changed, 142 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
