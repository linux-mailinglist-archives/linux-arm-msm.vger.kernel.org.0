Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC8E61F0FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 11:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbiKGKqc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 05:46:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbiKGKqb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 05:46:31 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB8B17E34
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 02:46:30 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id c25so15558474ljr.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 02:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5MDDAXa8IRw5p9rl+GiC7riEtVmh8Gwkk4sc9znBsQ=;
        b=yjhKeDwzkK7xlEhAN3vJRmSnRn5UsFC0h2qMfFeq7gjYgomws/qFZMamo/TOaD0coK
         jwh7A77oKSRWD0e5edIfuA1zJiWxUqD3JNoy/9erdccKWhLBTNLHTQqiA0JmNnn46WGF
         1QVba+arjBlTCBr3pD2WxfSuyrI2FQPBDxnoJVtuNMC/CUAeJjFXWxnm4Lq5IQ9zDyaa
         ZqqU75SbLONPVqjevkwjeIchO2UEJ57K4wk3Az/zs1iDWdZdt8VS5XUMrD+3y35iASHF
         IrYpMJVoNmwTqyc/lVdYekKSJc7v0eEQXly1oGydiLZzJrWWCeJKRHiEUB6zxF8flWkR
         SBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s5MDDAXa8IRw5p9rl+GiC7riEtVmh8Gwkk4sc9znBsQ=;
        b=mLM9OvlTkwbCmjQj/dUjESoXv4+FEIPAP51/AKuBkm1AYVfD9qnpvadstt62r1msFU
         x9Ic9KQNRAdrvgfaaHivnaAE3YyCsOBp3LDK1AmHYHjgtnwISLmLKM4BTrht2nX8IhnM
         Xo5pVLvKen1ukkMfx1zb686Gw0EQ72t0s6CGBvAmusje3vgstmftpSCoWajVDaKpu/HM
         IDmeTNH7sRPHKYd/RsUg2RffQSYjJe2EUwRQzHA4GAj55/EnBan/Ctc5ZVWFY0f61YlD
         LtQ+wXy9Eqn6fBnqwqtJITxoaTTKsoGaXG97DQHsBHrSZ39sGps646wdvYDZrSCglbGO
         gWQQ==
X-Gm-Message-State: ACrzQf08+sCtphzK2dSIlDEJ9ANpsAofpjc5FkPk6nsNSap4oEcd84d1
        eVPOIymxgqtsFTioXNv8s9K22g==
X-Google-Smtp-Source: AMsMyM4Kvpme3xgciEbA2G0h5fSNqcNALszrO4u+9XgylLUtLBOKkQxUaWnDHLFPPOa3sHtHQqCAYA==
X-Received: by 2002:a2e:a30d:0:b0:277:1c75:b73f with SMTP id l13-20020a2ea30d000000b002771c75b73fmr18044987lje.458.1667817988463;
        Mon, 07 Nov 2022 02:46:28 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id f18-20020a2ea0d2000000b0027776efa48csm1145125ljm.91.2022.11.07.02.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:46:27 -0800 (PST)
Message-ID: <dc19c341-c653-c60e-dd45-5c87ed4c6811@linaro.org>
Date:   Mon, 7 Nov 2022 11:46:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v1 3/5] arm64: dts: qcom: sm8450-hdk: enable display
 hardware
To:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-4-dmitry.baryshkov@linaro.org>
 <20221106043011.pw5fqeame7otzdcn@builder.lan>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221106043011.pw5fqeame7otzdcn@builder.lan>
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



On 06/11/2022 05:30, Bjorn Andersson wrote:
> On Fri, Nov 04, 2022 at 04:13:56PM +0300, Dmitry Baryshkov wrote:
>> Enable MDSS/DPU/DSI0 on SM8450-HDK device. Note, there is no panel
>> configuration (yet).
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> index 38ccd44620d0..e1a4cf1ee51d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> @@ -442,3 +442,21 @@ &usb_1_qmpphy {
>>   	vdda-phy-supply = <&vreg_l6b_1p2>;
>>   	vdda-pll-supply = <&vreg_l1b_0p91>;
>>   };
>> +
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_mdp {
>> +	status = "okay";
>> +};
>> +
>> +&dsi0 {
> 
> Please prefix the labels with "mdss_" so that you can keep them sorted
> alphabetically.
Why such a change all of a sudden? Only downstream (and sc7280 upstream) 
has mdss_ prefixes for dsi. Plain 'dsiN' is more generic.

Konrad
> 
> THanks,
> Bjorn
> 
>> +	status = "okay";
>> +	vdda-supply = <&vreg_l6b_1p2>;
>> +};
>> +
>> +&dsi0_phy {
>> +	status = "okay";
>> +	vdds-supply = <&vreg_l5b_0p88>;
>> +};
>> -- 
>> 2.35.1
>>
