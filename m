Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC0E616E41
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 21:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbiKBUGV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 16:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiKBUGU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 16:06:20 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 623F81DE
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 13:06:19 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id cg5so3310664qtb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 13:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yw7xr6XGV942HI1J/P1VOnNmIWz05zkG8h6oceBNmc0=;
        b=JngsSnSxIC/YekEx4ZEBTJJvvioI6sOwWqXosLVCPfzfJQJZbPdJT8WaV7IUGbK9oR
         NFHvbiH5pzKLr7oMbroMX59jkFL0/5rP72YNqUxBMO3nSSO0aTelRRy/0Uxtiadatmuf
         LTlBmThoAkSI6t9uRgg5CD5eHaIZmS7ZqO0gkLP26JzZQa86J/p9ZWhcvm9tKnXnGCKg
         FScv2c/55CMaj/PanRz6MWIDZAqOtkUg/ikbrCyrh4k5/DdbZkdb0iLGvUfD2m5IU3RU
         0EKDZrEPUOb2bTemJuP4TlzEEHrVyJO3ycfR+zZGW3NNsGqfP1E/jaBiipIqFKrCKafU
         jqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yw7xr6XGV942HI1J/P1VOnNmIWz05zkG8h6oceBNmc0=;
        b=gqoG8KSPovAaAj/j0r6vQlru8OrZ4QMkU77tTZ3D/quMLyX1aeGSP8wO5JbIMcckdl
         XFkTFf94to4f088o8rjm6bhphRwbEMr5N4fgH1nfqTRuxg56oh+rchhiU3TGf5w0ekw6
         oIzNsxQvMuSgO+Dp3Q7HbWIgHvmEES1is5JO8M1AvYFCJobDIRJfSXEUWsQSV83m6S1l
         TqVX36HRLhDjDdj3g+kMr19s1gTpWeaa2ujjF3MxfOM4AHKzhjfQWCL3WO6GLmxMjiCc
         xV893rA0wSmGDLqLGBM1VlUiFVA2kb++TwlUZ2EQ4ovp1vaxekvz2flOQILKMIZz1Z/D
         dKrA==
X-Gm-Message-State: ACrzQf1RxONcP35eyrPjd81oXr5GZV2ZAP2rEJqDJ1FRa1/+t07jT39a
        Q5uYKqyXrMzdCm0dPMGqcwc0yQ==
X-Google-Smtp-Source: AMsMyM4+iCbqXBQXz4vGzEYC7mRS7z+zxBq2W2XAwbMqKkCl+y9E1xVuBKCnNVcL3Ar0vxWoyM/yXQ==
X-Received: by 2002:a05:622a:407:b0:39a:836:acfe with SMTP id n7-20020a05622a040700b0039a0836acfemr21162494qtx.133.1667419578577;
        Wed, 02 Nov 2022 13:06:18 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id n17-20020a05620a295100b006ce2c3c48ebsm9267702qkp.77.2022.11.02.13.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 13:06:18 -0700 (PDT)
Message-ID: <86314819-6842-cfea-73d8-c991109742df@linaro.org>
Date:   Wed, 2 Nov 2022 16:06:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 01/12] dt-bindings: iio: qcom: adc7-pm8350: Allow
 specifying SID for channels
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org
References: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
 <20221029051449.30678-2-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221029051449.30678-2-manivannan.sadhasivam@linaro.org>
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

On 29/10/2022 01:14, Manivannan Sadhasivam wrote:
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
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

