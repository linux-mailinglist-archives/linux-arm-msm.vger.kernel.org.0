Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE28612622
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Oct 2022 00:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiJ2WHq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 18:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiJ2WHo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 18:07:44 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B14933432
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 15:07:43 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id l8so1589669ljh.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 15:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kH0QVpvpb7zwsERmRHshEbzMpFPeVcyeSJAaIxfPmeA=;
        b=knwXWXI35Z9QHYg/HnqH+NOaEsQ5qMooSHtXrI7QvPMaaQpqlQjkHkKtAVsUzOdF6a
         lzY0X4nhgD7dwm2bVd+DbOB2m3bBWI0NJ+g6TCgNqdBHkCOCt8eVTrv3sWjAIsvVpgOB
         grO3Ebm7UpPd1BQLIxiZQKCGfhcouUyWdwRKVYyaVahrS5H+cxCZjFgqRoO2gVRmCE9x
         pjIcztC2FaUpAyIg6J+QqUeAcOwwcdwfU3UnlQKIhWtg0+Wfr0SXtqCytqJWel+ENGXW
         hqSov814BZCkfEMrZ51GiQTde/ASWWydCPCDu8ZfHP5BRj1F/mTdw1Y9Rq2+5qnm/DKJ
         O6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kH0QVpvpb7zwsERmRHshEbzMpFPeVcyeSJAaIxfPmeA=;
        b=V4ytBjO33mCFcDUkQLPaJSrCGv+uRkj97WjNBEW0cfsDE334eslz979udNvifPP4Tp
         68tqvFb2hEGYDr9NygJtJ1/Gzf5AjDLUZ94enZDeGHUutKVKBehaGP6jA3mDb3G+Hk18
         7VHIQEvKfAlPzbFVg2VtF8dfDBpbGVC917F4YqPkV8Ev3kCugenidJyB1nZ/NtdCNNCV
         XzmCKSNYjXfbqfVE+f1dRujyi8nk74npZlPR68K1b7URGvaTLuiDT36GFDsFnAscRFr7
         Jb6RD5I3lrPm7yc068ISm8DTeoTdTcgtT3/1NadLfePUenEsFSrh9lMH9VHMkj+qZiDj
         3j8Q==
X-Gm-Message-State: ACrzQf2f4BRFSPcx9rHVHn0OnWYCd5TRcVJanjxgiK4J6rFB4j14mgp2
        lsEs9UIq70FO4zFF/8zlcJ85CA==
X-Google-Smtp-Source: AMsMyM4Kim3IsWLAeRiaNmbOWMXPNztIz3EePZlhHCUOgoJB2enCeOLO/ytox+A3fQBULaeUOHQbzA==
X-Received: by 2002:a2e:a601:0:b0:26c:4149:251a with SMTP id v1-20020a2ea601000000b0026c4149251amr2283442ljp.348.1667081262018;
        Sat, 29 Oct 2022 15:07:42 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id h12-20020a2ea48c000000b00277041268absm435049lji.78.2022.10.29.15.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Oct 2022 15:07:41 -0700 (PDT)
Message-ID: <c88b11d2-79db-13af-0252-9b7dafb5314e@linaro.org>
Date:   Sun, 30 Oct 2022 01:07:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 01/12] dt-bindings: iio: qcom: adc7-pm8350: Allow
 specifying SID for channels
Content-Language: en-GB
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org
References: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
 <20221029051449.30678-2-manivannan.sadhasivam@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221029051449.30678-2-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/10/2022 08:14, Manivannan Sadhasivam wrote:
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
> ---
>   .../bindings/thermal/qcom-spmi-adc-tm5.yaml   |  6 +-
>   .../dt-bindings/iio/qcom,spmi-adc7-pm8350.h   | 90 +++++++++----------
>   2 files changed, 46 insertions(+), 50 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

