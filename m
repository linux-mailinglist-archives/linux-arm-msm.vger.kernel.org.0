Return-Path: <linux-arm-msm+bounces-64517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DDCB01765
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FA1B5A14C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF7F26561E;
	Fri, 11 Jul 2025 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vau20nAm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6AC265CA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752225263; cv=none; b=nYqwaS114MNxXI32U+C4N6e46v3tBC6ArkkBwTd1dDkfXO/fx7v0NmHwWzqg/vC00z4UeTKcEewhAmjETRjqyiQqOahJ9AjxGBFYIiLRMoRtWF/oukXHmLq4/MGd0AG8MTKtRBBnXU2Itj18vjM4qblFsq0hH+RxIeEUflDjrwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752225263; c=relaxed/simple;
	bh=HEY3+a6Na11WJGgaFcXW+Lx7J/dYzicZ2lW2cEvHFm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MW97Td3a3fGkP7pmt89uwsvoyz+TOuO8Tvwh4wL4Xs7VLgn5bSmEndW890Xx8rH5P1QVPifac2uRNIOjWF06msQNRcFhPz3wOQKs76ysoMl4n1LFz4tlWi24Vfu0ADhWPQEDu0Faqi12OoNa5vJ/RyKt54prVVO3RzmDrgGfiA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vau20nAm; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so1261384f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 02:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752225259; x=1752830059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zveXDkGflW/W206j1WhNPQvT6C+QoRFQ6e1mLG+GAL4=;
        b=Vau20nAmXqip2omHxWpaedjsUV7yFsvCpSyDnxn5PhnXMLXHPcBViCYYZPbydHKOdm
         1RuCzsY7atRwUnui4Np4plQcqHpYwShBErur1VwWHRbLT+Ruu0Lk24FJ6GdoGfALQzd5
         G4n7ODwiC92uNbcSQJGXwPyyp2x5OYSedCBAHcbn0oiCtZyCfqqEZKbVkPJ7WQUsAbw7
         0xLLU/JRRPMfcQ1uF3mYY3ZRsiMLwecfqQAHxUxqI1ZUsp5Sbogpscpq+ZMxIwauMIK1
         J6AP4Jq3OtIVfD/0QzkmbP7wNzXkwlNbaoE6T8/8gT2YpUZZm1XJftLzlyHr5ov6aqQX
         ZUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752225259; x=1752830059;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zveXDkGflW/W206j1WhNPQvT6C+QoRFQ6e1mLG+GAL4=;
        b=C38JnkrcVFAW6KRF2Y9quT/UXwTJQvoagn5ziJGDjGpSdlLcynB2i5Fz/t/yoWaMnA
         IBVH2YDN4O8FkWCNwfHHc1kapsVKjW+z+6rxoOA8WYwBw6mSF+Yqotr+gr/hvfg50ZbK
         EPsAbvoBr8X0rTft+6nx1L2YCaAoMuqguMK7ZXXqZ+55I4pejoDmc4pHlQrGycc7Z93N
         V0WeZ1ZXWSOL5+e4U4uR4dph3i4XnFeb4Q2CWloVjlHTtjbqcMzzzpWXx7oNRQhxLF58
         T3+yVi5jYdH5XWxo+wIlTbAiQIiBIppdFbl6lmUL8BpAGN9XaOdp1nyneVrstOxrf7NC
         B+CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ36J+UoBF9wKkw0mLMSXeke7FdaHaCOmFuybzqlMEyTu3pgKaLc49GCx7H+LKbecYLLfepCYhV+wCbr+x@vger.kernel.org
X-Gm-Message-State: AOJu0YxnWrwAMqKMosguLLPhS6Lhws1ihegXwAlG0e+Qci2ht1gap/u9
	IUnoV2Jg6fuM7JzSVV/rSsVBFhEG03NVRNNAyamAs33xxn4eiOKDUgHQdIxkNQGyl9s=
X-Gm-Gg: ASbGnctHqZBFnrHlQCUapWj6/kfvevb3E+KtnSQKRFgv8ejwprrykLUU+QrTdYkQfAk
	tOJGT5aNgJ3Uespcipckzch7j5dldne3Lfl3En3SDTXK04wao8ZX/XA0mLQqWkz0Yj1TBN5FUXt
	57qBWdEme9dq70gVsjd4KrLVTIA0102qX9SvvitLGVtI6ZG0lJRhROJ1Ia4GqZCAn6GHad1y8eA
	lM6J1Qk0caW/aoNGbLBqbGyim2poJ3Hv5W187YxiY3ydIkzojMWvFm58U9HHCTJpmXAr9WPSDzQ
	zmwLZC7KaYyTrYyFlffNHDP2PO4gmG+JwsiloQcokN7mjWP8BPmIr8weh1pqRpe4HkTAAH0upC1
	Kmo7udiDp5J1pufw4ix71AW9PBHAGTAkr/rCtTERi1xAf3BJkTBfwR63uUTiYvfwQ01s5gIgb5g
	==
X-Google-Smtp-Source: AGHT+IE4wNMehan56/tf9ftQcw6oC1Kgo7xNHw/kaLYkC6XYBhBtLBBp0KJg69qX2zGHPIAKWIbRWw==
X-Received: by 2002:a5d:5f51:0:b0:3b5:e6bf:f86b with SMTP id ffacd0b85a97d-3b5e7f11908mr6482501f8f.11.1752225258413;
        Fri, 11 Jul 2025 02:14:18 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd55b068sm41340715e9.38.2025.07.11.02.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 02:14:17 -0700 (PDT)
Message-ID: <8377b6bf-8823-4bcc-aee1-af17db0fbfdf@linaro.org>
Date: Fri, 11 Jul 2025 10:14:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <895b931d-15a4-4922-b52f-6c6cf7fc6243@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <895b931d-15a4-4922-b52f-6c6cf7fc6243@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/07/2025 18:08, Konrad Dybcio wrote:
> On 7/10/25 6:16 PM, Bryan O'Donoghue wrote:
>> Add a new MIPI CSI2 driver in D-PHY mode initially. The entire set of
>> existing CAMSS CSI PHY init sequences are imported in order to save time
>> and effort in later patches.
>>
>> In-line with other PHY drivers the process node name is omitted from the
>> compat string while the soc name is included.
>>
>> At the moment we follow the assignment of lane positions - the bitmap of
>> physical input lanes to logical lane numbers as a linear list per the
>> existing DPHY @lanes data-member.
>>
>> This is fine for us in upstream since we also map the lanes contiguously
>> but, our hardware can support different lane mappings so we should in the
>> future extend out the DPHY structure to capture the mapping.
>>
>> The Qualcomm 3PH class of PHYs can do both D-PHY and C-PHY mode. For now only
>> D-PHY is supported.
>>
>> In porting some of the logic over from camss-csiphy*.c to here its also
>> possible to rationalise some of the code.
>>
>> In particular use of regulator_bulk and clk_bulk as well as dropping the
>> seemingly useless and unused interrupt handler.
>>
>> The PHY sequences and a lot of the logic that goes with them are well proven
>> in CAMSS and mature so the main thing to watch out for here is how to get
>> the right sequencing of regulators, clocks and register-writes.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
> 
> This is a good opporunity to refresh the code a bit

>> +}
>> +
>> +static irqreturn_t phy_qcom_mipi_csi2_isr(int irq, void *dev)
>> +{
>> +	const struct mipi_csi2phy_device *csi2phy = dev;
>> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>> +	int i;
>> +
>> +	for (i = 0; i < 11; i++) {
>> +		int c = i + 22;
> 
> Please add some comments regarding these number choices
> 
>> +		u8 val = readl_relaxed(csi2phy->base +
>> +				       CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, i));
>> +
>> +		writel_relaxed(val, csi2phy->base +
>> +			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, c));
>> +	}
>> +
>> +	writel_relaxed(0x1, csi2phy->base +
>> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 10));
>> +	writel_relaxed(0x0, csi2phy->base +
>> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 10));
> 
> No need for any delays?
> 
>> +
>> +	for (i = 22; i < 33; i++) {
> 
> Please provide some context here too
> 
>> +		writel_relaxed(0x0, csi2phy->base +
>> +			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}

TBH I think I will just drop this function in v2.

If someone comes up with a good reason for this ISR on this generation 
of hardware they are free to submit a patch to eludicate why.

During bringup/debug of this - including when I was getting RX CRC 
errors on the CSIPHY due to lacking one of two clocks, I never saw this 
ISR fire once.

I didn't enumerate the callback and you're entirely right these fixed "i 
= 22; i < 33" is to put it politely "questionable".

Just in case this code is useful on some SoC I haven't tested in the 
CAMSS source, I've left well enough alone.

Happy to drop this in the PHY driver version though.

>> +
>> +/*
>> + * phy_qcom_mipi_csi2_settle_cnt_calc - Calculate settle count value
>> + *
>> + * Helper function to calculate settle count value. This is
>> + * based on the CSI2 T_hs_settle parameter which in turn
>> + * is calculated based on the CSI2 transmitter link frequency.
>> + *
>> + * Return settle count value or 0 if the CSI2 link frequency
>> + * is not available
>> + */
>> +static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
>> +{
>> +	u32 ui; /* ps */
>> +	u32 timer_period; /* ps */
>> +	u32 t_hs_prepare_max; /* ps */
>> +	u32 t_hs_settle; /* ps */
> 
> picoseconds? you can suffix the variables with _ps
> 
> Also, a reverse-Christmas-tree sorting would be neat
> 
>> +	u8 settle_cnt;
>> +
>> +	if (link_freq <= 0)
>> +		return 0;
>> +
>> +	ui = div_u64(1000000000000LL, link_freq);
> 
> PSEC_PER_SEC
> 
>> +	ui /= 2;
>> +	t_hs_prepare_max = 85000 + 6 * ui;
>> +	t_hs_settle = t_hs_prepare_max;
>> +
>> +	timer_period = div_u64(1000000000000LL, timer_clk_rate);
> 
> ditto
> 
> [...]
> 
>> +	for (i = 0; i < array_size; i++, r++) {
>> +		switch (r->mipi_csi2phy_param_type) {
>> +		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
>> +			val = settle_cnt & 0xff;
>> +			break;
> 
> what about CSIPHY_SETTLE_CNT_HIGHER_BYTE?
> 
>> +		case CSIPHY_SKEW_CAL:
>> +			/* TODO: support application of skew from dt flag */
> 
> Why? What are these?

> +			continue;
>> +		case CSIPHY_DNP_PARAMS:
>> +			continue;
> 
> "do not program"? why are they in the tables then?

We try to import downstream init sequences, which themselves are 
sometimes 1:1 from the original Si testbenches unmodified, DNP_PARAMS 
come from those sequences.

I think the testbench/downstream idea here is to allow a series of 
delays and/or readback post write.

I'm certainly willing to drop anything not in the _current_ init 
sequence list.

>> +		default:
>> +			val = r->reg_data;
>> +			break;
>> +		}
>> +		writel_relaxed(val, csi2phy->base + r->reg_addr);
>> +		if (r->delay_us)
>> +			udelay(r->delay_us);
>> +	}
>> +}
>> +
>> +static bool phy_qcom_mipi_csi2_is_gen2(struct mipi_csi2phy_device *csi2phy)
>> +{
>> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>> +
>> +	return regs->generation == GEN2;
>> +}
> 
> You only used this once, I don't think it's very useful
> 
> [...]
> 
>> +
>> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
>> +					   struct mipi_csi2phy_stream_cfg *cfg)
>> +{
>> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>> +	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
>> +	u8 settle_cnt;
>> +	u8 val;
>> +	int i;
>> +
>> +	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
>> +
>> +	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>> +	for (i = 0; i < cfg->num_data_lanes; i++)
>> +		val |= BIT(lane_cfg->data[i].pos * 2);
>> +
>> +	writel_relaxed(val, csi2phy->base +
>> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
>> +
>> +	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
>> +	writel_relaxed(val, csi2phy->base +
>> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>> +
>> +	val = 0x02;
>> +	writel_relaxed(val, csi2phy->base +
>> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
>> +
>> +	val = 0x00;
> 
> Can we get some names for the magic (un)set bits?
> 
> [...]
> 
>> +static void
>> +phy_qcom_mipi_csi2_lanes_disable(struct mipi_csi2phy_device *csi2phy,
>> +				 struct mipi_csi2phy_stream_cfg *cfg)
>> +{
>> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>> +
>> +	writel_relaxed(0, csi2phy->base +
>> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
>> +
>> +	writel_relaxed(0, csi2phy->base +
>> +			  CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
> 
> Does the former write need to complete before the latter?

One assumes so. All of this _relaxed() stuff is way too flaithiúlach for 
me. We tolerate it as legacy code in CAMSS but, you're right, I don't 
think its logical at all.

Dropped.

> 
>> +}
>> +
>> +static int phy_qcom_mipi_csi2_init(struct mipi_csi2phy_device *csi2phy)
>> +{
>> +	return 0;
>> +}
>> +
>> +const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_1_0 = {
>> +	.hw_version_read = phy_qcom_mipi_csi2_hw_version_read,
>> +	.reset = phy_qcom_mipi_csi2_reset,
>> +	.lanes_enable = phy_qcom_mipi_csi2_lanes_enable,
>> +	.lanes_disable = phy_qcom_mipi_csi2_lanes_disable,
>> +	.isr = phy_qcom_mipi_csi2_isr,
>> +	.init = phy_qcom_mipi_csi2_init,
> 
> You're never calling init(), remove it. If you need it in the future,
> make it non-obligatory so that you don't need the above stub
> 

y

>> +};
>> +
>> +const struct mipi_csi2phy_clk_freq zero = { 0 };
> 
> 'zero' is a terrible global variable name

ah, I forgot to make these static.

> 
>> +
>> +const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy = {
>> +	.freq = {
>> +		300000000, 400000000, 480000000
>> +	},
>> +	.num_freq = 3,
>> +};
>> +
>> +const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy_timer = {
>> +	.freq = {
>> +		266666667, 400000000
>> +	},
>> +	.num_freq = 2,
>> +};
> 
> These operating points *require* different RPMh levels, let's
> grab them from an OPP table and do the ratesetting through the
> related APIs

You're right.

I'll also add regulator_set_load() in v2.

> 
>> +
>> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>> +	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
>> +	.reg_info = {
>> +		.init_seq = lane_regs_x1e80100,
>> +		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
>> +		.offset = 0x1000,
> 
> common_regs_offset
> 
>> +		.generation = GEN2,
>> +	},
>> +	.supply_names = (const char *[]){
>> +		"vdda-0p8",
>> +		"vdda-1p2"
>> +	},
>> +	.num_supplies = 2,
>> +	.clk_names = (const char *[]) {
>> +		"camnoc_axi",
>> +		"cpas_ahb",
>> +		"csiphy",
>> +		"csiphy_timer"
>> +	},
>> +	.num_clk = 4,
>> +	.clk_freq = {
>> +		zero,
>> +		zero,
>> +		dphy_4nm_x1e_csiphy,
>> +		dphy_4nm_x1e_csiphy_timer,
> 
> Throw the ratesetting clocks into opp_config and grab the rest
> through clk_bulk_get_all()
> 
>> +	},
>> +};
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..1def2d1258d9dd3835c09c6804e08dfffc184248
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -0,0 +1,281 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2025, Linaro Ltd.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/phy/phy-mipi-dphy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/reset.h>
>> +#include <linux/slab.h>
>> +
>> +#include "phy-qcom-mipi-csi2.h"
>> +
>> +#define CAMSS_CLOCK_MARGIN_NUMERATOR 105
>> +#define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
>> +
>> +static inline void phy_qcom_mipi_csi2_add_clock_margin(u64 *rate)
>> +{
>> +	*rate *= CAMSS_CLOCK_MARGIN_NUMERATOR;
>> +	*rate = div_u64(*rate, CAMSS_CLOCK_MARGIN_DENOMINATOR);
>> +}
> 
> I can't find downstream doing that

Inherited from CAMSS where it really does something useful.

I'm relucant to change this... I'll try it though.

> 
> [...]
> 
>> +	/*
>> +	 * phy_configure_opts_mipi_dphy.lanes starts from zero to
>> +	 * the maximum number of enabled lanes.
>> +	 *
>> +	 * TODO: add support for bitmask of enabled lanes and polarities
>> +	 * of those lanes to the phy_configure_opts_mipi_dphy struct.
>> +	 * For now take the polarities as zero and the position as fixed
>> +	 * this is fine as no current upstream implementation maps otherwise.
>> +	 */
> 
> Can we at least grab the data and make sure it matches the
> default hw configuration now, so that we won't break bad
> DTs in the future?

Hmm. I'll have a think about that.

---
bod

