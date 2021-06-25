Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48ED13B41D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 12:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhFYKlM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 06:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbhFYKlL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 06:41:11 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5286C061574;
        Fri, 25 Jun 2021 03:38:49 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id d16so10905192ejm.7;
        Fri, 25 Jun 2021 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1/eMB3oQaBdiNnJ8Y7zIUo7wsM74vurfSXPEhMmhvYs=;
        b=S6gTqGkyCpj6tWjYvKcj2hxMaFjtOKlftr3pLPzXRS/qJMKpoizgtjxrHLuQxGyBBZ
         aT+hsLuIanjKqN3JJMjY+BCLS+82VHoQ6qRB1LVP6z+LNVcUa5pH3yZVEbtj8GJybIdD
         bS37wQRe8oGOis5ty6gaRv9w+PTZjBHOK3sYQdf7LcJceHoSPGFcPRTUXiBqK8HPK4VK
         8vWIbCcmtjkoSNn4ueDCqm2+ustdOXgQZOWKdh+TK6dcrjwPBkLDR5yb8A9phu8wBjr3
         dM27CY1v/c36Ucb7Ss/8dy/xYpQYRf8coz2svmF38P6cI4dBxGirXcxYelHzfCEXC7F8
         7nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1/eMB3oQaBdiNnJ8Y7zIUo7wsM74vurfSXPEhMmhvYs=;
        b=bu3rX1BDOlv2PPumqxC8/+4sEdnfQwTL2O9PY85fplTvKXaHfyE2BtlxRNew6ou+jM
         fYOG67c3CVdiIP6rAPCclK5jLRE9I8yRefm0RL/78TycJ5gCRB70yzcC9g3PWqPRZBih
         1fsxBnobar7drjo+vH1nwYuZAUz9201LtJft9b7Han0sScOotzaYmnYcVmQkS/kxDNav
         MNrYt/PqGi5UEhWT2kfTy5k3wU0hfDj0l0fl/O4F+K/sNsuDB/dRnGMc8SPf0KqrnAOM
         50Iv7+hveQUnMjpQS9E8fRpiOPwPaHNThfXd2vBJd+TFvh+SfX3Nf6V9uOnITrbrow7j
         Fnvg==
X-Gm-Message-State: AOAM533HYpJAzU/qGqN7iju7tcNjh3aw1hHu2ysbg3HMwUpGbl0iWfGE
        ve8LEo64qEzF1e3Va10O8SA=
X-Google-Smtp-Source: ABdhPJy3Xru8aPPdjqoS2npd604GtoiksX0HIHMgARWGwYa+NMWrAjYQPNV4yRdyiJty+RcEM1364Q==
X-Received: by 2002:a17:906:3a8e:: with SMTP id y14mr10204723ejd.153.1624617528371;
        Fri, 25 Jun 2021 03:38:48 -0700 (PDT)
Received: from [192.168.74.106] (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id h24sm2492325ejf.20.2021.06.25.03.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 03:38:47 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] phy: qcom-qusb2: Add configuration for SM4250 and
 SM6115
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20210622203240.559979-1-iskren.chernev@gmail.com>
 <20210622203240.559979-4-iskren.chernev@gmail.com> <YNKshSbsf5d5Uyew@yoga>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <d42b6bfd-4010-29d2-1701-41979e19d987@gmail.com>
Date:   Fri, 25 Jun 2021 13:38:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNKshSbsf5d5Uyew@yoga>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/23/21 6:37 AM, Bjorn Andersson wrote:
> On Tue 22 Jun 15:32 CDT 2021, Iskren Chernev wrote:
> 
>> The SM4250 and SM6115 uses the same register layout as MSM8996, but the
>> tune sequence is a bit different.
>>
> 
> Didn't review the initialization sequence, but it's different from the
> existing ones so adding a new compatible and init_tbl seems to be the
> right choice.

Here is the init sequence I'm using [1]

[1] https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250/blob/oneplus/SM4250_Q_10.0/arch/arm64/boot/dts/vendor/20882/bengal-qrd.dtsi#L130

> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 34 +++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> index 8f1bf7e2186b..3c1d3b71c825 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> @@ -219,6 +219,22 @@ static const struct qusb2_phy_init_tbl msm8998_init_tbl[] = {
>>  	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_DIGITAL_TIMERS_TWO, 0x19),
>>  };
>>  
>> +static const struct qusb2_phy_init_tbl sm6115_init_tbl[] = {
>> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xf8),
>> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x53),
>> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE3, 0x81),
>> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0x17),
>> +
>> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
>> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
>> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
>> +
>> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TEST2, 0x14),
>> +
>> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9f),
>> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
>> +};
>> +
>>  static const unsigned int qusb2_v2_regs_layout[] = {
>>  	[QUSB2PHY_PLL_CORE_INPUT_OVERRIDE] = 0xa8,
>>  	[QUSB2PHY_PLL_STATUS]		= 0x1a0,
>> @@ -342,6 +358,18 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
>>  	.autoresume_en	 = BIT(3),
>>  };
>>  
>> +static const struct qusb2_phy_cfg sm6115_phy_cfg = {
>> +	.tbl		= sm6115_init_tbl,
>> +	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
>> +	.regs		= msm8996_regs_layout,
>> +
>> +	.has_pll_test	= true,
>> +	.se_clk_scheme_default = true,
>> +	.disable_ctrl	= (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
>> +	.mask_core_ready = PLL_LOCKED,
>> +	.autoresume_en	 = BIT(3),
>> +};
>> +
>>  static const char * const qusb2_phy_vreg_names[] = {
>>  	"vdda-pll", "vdda-phy-dpdm",
>>  };
>> @@ -888,6 +916,12 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
>>  	}, {
>>  		.compatible	= "qcom,sdm660-qusb2-phy",
>>  		.data		= &sdm660_phy_cfg,
>> +	}, {
>> +		.compatible	= "qcom,sm4250-qusb2-phy",
>> +		.data		= &sm6115_phy_cfg,
>> +	}, {
>> +		.compatible	= "qcom,sm6115-qusb2-phy",
>> +		.data		= &sm6115_phy_cfg,
>>  	}, {
>>  		/*
>>  		 * Deprecated. Only here to support legacy device
>> -- 
>> 2.31.1
>>
