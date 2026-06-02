Return-Path: <linux-arm-msm+bounces-110857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eGdMDU9UH2p5kgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:08:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B30C63258F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:08:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=t5LcHcZS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110857-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110857-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4C3F3038BB0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 22:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D7339A061;
	Tue,  2 Jun 2026 22:07:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67C125228C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 22:07:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438041; cv=none; b=WXLWjO2Dl8sVjfitC7iWuDYOnqvjU4Oa5ZrP65C6Ujb7rUsr+EGiMJj3aaHXsrgvhjmCw+woGnUhxGlsbJmj+E2LzAA3PEkeb8kHg6R0r5hxPd3Q+0fc5/mHyvnY4eUU7P8B8D1OmuC5v4SBFrz77xPMu3L+1sEyu83x5lssjDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438041; c=relaxed/simple;
	bh=6x9fMJ7t6HJunG2X30tVVOCMTH7Bh31dGiwtTPzjvGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5jBgDYwzukIJHiiYcuVwgicJEXzKplsjoyyOqPSLuZtIHU3kqqX/n3ctuHBdOXFpq0Xg0YPJDEtR3uGPV+ZtsmrChXsj1FFec/rGOzioyxyh8/nx82SwqYrurUwF/PMsGND8m1MYVREzyIH/168U9UncYga2CLJuAVGTGiKREM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5LcHcZS; arc=none smtp.client-ip=209.85.208.180
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-396773734e8so4625621fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 15:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780438038; x=1781042838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SRIMl3FmmdDZgXTjOCnwja2kX4Az8p1cvuxpefmzXA=;
        b=t5LcHcZSENbyyLkEdcs6i69kMQJUXbGtascfl+o5b0hklk1lowJhY/wzrsrQQFPPE9
         yfzUbLzOTem79ZLgDz22snf0bkyYDuCpwBEUn0O0YcXtivKq042OgRWDxbhpDdmLmzvo
         zPd9oBLvmPC9SeyBxj/Zu6dewc/fOcTFDXc1u79qXJS/d9GAPdT4UUPXCMxNTuRA2C8Y
         n57h+0lOCoRpoubZF65txza/LU/6ZwYY1IEAs/eOYrvB4prXzUEiGZbtf9duY/spKwjP
         v7+WQtvRU6sIo6EngzngmN9PBjXuQSqs051SheGPNeutSTto8giYLiP/10VqynW6ctKn
         V9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780438038; x=1781042838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7SRIMl3FmmdDZgXTjOCnwja2kX4Az8p1cvuxpefmzXA=;
        b=qu7BSSOFZYByVkjCyz6l+mB/vrUr4sX8YUFlaXJbkf2uZ/YxExlJ4hbm+y/iKi0Z2n
         jb/LCXeoB/N9j3d4ZdTblLSPgNnrAVgOZYPq86QJmY0QcTMbc6OxIYfuIR/cLfqOq/Ag
         ciuja4YQn/qvqZOPsMvVqv1faZvrrVMUlPy7aQBtsmR/czMZ/rmE3fLpP2C6kKhXmJkH
         9eJ4KgWX9ReW0Hx+qfg9TVq0fP3hOaoiDXIbBqwIYVdcEow55JkKKYfqb817pgTgLSMQ
         bRXRJrvSQSop+E430qtC3R9IMlVJTlRrKOoQomwg3EHcVuIl5fcY6y9aKp5yt6s2mdzf
         lkBw==
X-Forwarded-Encrypted: i=1; AFNElJ9nFfxFU8vAJfpiRwkJhtKWZnAQx4CB1nR+W01aJ/N2L4QaPPC122CSR5W00qngnxjnnKn8DAr55pNtsbQZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzDekHzZBcnv+C4D5RZLXXtRTq+5+2HSrysavag3Q8wuEvX0Hry
	gXHkuTPflAgk7auax/ZMsSR77E7Whc3BSrJZPuigac5yX1DqdT5mH1Ot3+EFsThT2fl+LnO0iko
	+rzXUcoM=
X-Gm-Gg: Acq92OFu00YcJXEQPGFTodSWspKulshR/KVPfO/ZFFL2HgDTHu5QK59+5viXwCZjDxP
	L+5424j/jMO/+VLAKmFV+DwGlsilPfnAbDb2CoMb0uwWERh/AzAqQamQpM0k5LKnu3fNG4FiHFG
	fa28SDyjX2+a1CDsjBXBzgZUSogySD3IHdaWHJKFUNRaqj5hNPSfxo4kZaq6e/ZiyEMAjyb3XGb
	VkPiWZwjLDvnQOzdnE1bNdhfM58HoruAAoB/fJQH8l55WdCHBP5bbFHjuh0y9Di3eo1lPlWfJfN
	eaoR7Wqgx7V72zFNWBe5aWLbsZz1vXELHgdgm87WAjgGWy4nwc0xOcnPndrlvB1oFDwaQPbwoCe
	zOxeEj/B5ppnOHy1hOwpF0EFylpx3ipEqvFMgu7nXlruk0cW+VyV/jG0YAe7wZOTN/Fn6g9nWHi
	zcbOT5zipE7KeahSGaJ69pOvZl6FpKkZqgetfkuqM5655nZ7I/TBGwdpt3edadebDLN2UB1/lFv
	NRXyoy8V3j6t5JJ
X-Received: by 2002:a2e:bc2a:0:b0:396:975f:c384 with SMTP id 38308e7fff4ca-396ac314d06mr1902761fa.6.1780438038099;
        Tue, 02 Jun 2026 15:07:18 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66ea9sm3570671fa.2.2026.06.02.15.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 15:07:17 -0700 (PDT)
Message-ID: <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
Date: Wed, 3 Jun 2026 01:07:16 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110857-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B30C63258F

On 5/23/26 05:48, Bryan O'Donoghue wrote:
> Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
> 
> The following devices are supported in this drop:
> "qcom,x1e80100-csi2-phy"
> 
> In-line with other PHY drivers the process node is included in the name.
> Data-lane and clock lane positioning and polarity selection via newly
> amended struct phy_configure_opts_mipi_dphy{} is supported.
> 
> The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now only
> DPHY is supported.
> 
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
> 
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
> 
> The PHY sequences and a lot of the logic that goes with them are well
> proven in CAMSS and mature so the main thing to watch out for here is how
> to get the right sequencing of regulators, clocks and register-writes.
> 
> The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

<>

> +static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
> +{
> +	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
> +	u32 lane_polarities[CSI2_MAX_DATA_LANES + 1];
> +	u32 data_lanes[CSI2_MAX_DATA_LANES];
> +	struct device *dev = csi2phy->dev;
> +	struct fwnode_handle *ep;
> +	int num_polarities;
> +	int num_data_lanes;
> +	u32 clock_lane;
> +	int i, ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 1, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (ep) {
> +		fwnode_handle_put(ep);
> +		dev_err(dev, "DPHY split mode is not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> +	if (!ep) {
> +		dev_err(dev, "Missing port@0\n");
> +		return -ENODEV;
> +	}
> +
> +	num_data_lanes = fwnode_property_count_u32(ep, "data-lanes");
> +	if (num_data_lanes < 1 || num_data_lanes > CSI2_MAX_DATA_LANES) {
> +		ret = -EINVAL;
> +		dev_err(dev, "Invalid data-lanes count: %d\n", num_data_lanes);
> +		goto out_put;
> +	}
> +	stream_cfg->num_data_lanes = num_data_lanes;
> +
> +	ret = fwnode_property_read_u32_array(ep, "data-lanes", data_lanes,
> +					     stream_cfg->num_data_lanes);
> +	if (ret) {
> +		dev_err(dev, "Failed to read data-lanes: %d\n", ret);
> +		goto out_put;
> +	}
> +
> +	ret = fwnode_property_read_u32(ep, "clock-lanes", &clock_lane);
> +	if (ret) {
> +		clock_lane = CSI2_DEFAULT_CLK_LN;
> +		dev_info(dev, "Using default clock-lane %d\n",
> +			 CSI2_DEFAULT_CLK_LN);

Why CSI2_DEFAULT_CLK_LN is set to 7, what does it mean and how is it used?

Since "7" is a meaningless number in the context, I believe it's practically
not used at all, and if so, 'clock-lanes' property should be just removed.

> +	}

-- 
Best wishes,
Vladimir

