Return-Path: <linux-arm-msm+bounces-95083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK5JCl+vpmn9SgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:52:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D3A1EC1D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA3F93056657
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 09:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A4D38E130;
	Tue,  3 Mar 2026 09:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9Fu7eN5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB39B38C419
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531544; cv=none; b=ufQpKPG+PaZK+j3Kk66WXrcIISsXeV6mTr81eT8u+dT4fEbwcDjhPFsaefiCyYfX5NlePVhT4WcAR7PlJjRwBE+N76nuOaSiWyJDBP0s+qfAII7/yyHYHJx5UH96g+JG/d11stclpI00i6DlmmL3x8PTZVLo3Myns05ABfQ1sFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531544; c=relaxed/simple;
	bh=80jG9ADr3sRQeZj+6MKfSocFpOPETsZ8Vw/RpGIjP2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/WbaySsJ+YW1lYL5Yv0QZcfOXNLcnxKlKrGd6WL61gq73VcBvPyWm7pnp3K4I0t43yUJQ/QzT31nI8WQwDYwq5yrZXmnXRW0bqI8Xuyyu6+gmo0oMYzzLsfDrcjPQVR+U+GTZGj6H32+FRtoUX917P0CxE+fwqH4L5kVBUGjVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9Fu7eN5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48069a48629so59057175e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 01:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531541; x=1773136341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Czw8AGkm+Fe/UN3W4zP3A5S6h5MUJRS9IWz2PJW9Mk=;
        b=J9Fu7eN51eM68KB2gGREeyazQ5V93MwTD8nZrcodwoXyL/Iayqt7BH5rv68g12WX0q
         6zFpVF7Yz5jZq2tot0UTYs9k/KoHwDDZue0UVUoYqMX8S/XzNwgyxstFdNAs2SzL7dEh
         0Iuuv4pZ2zFU1NA8FjFFGkpvGdLKtSs6PaH/OW03vj13kvlULpqWblkGNKdqRaOTbZj4
         FbHLKhfeMIl0weXhJwIPFDs9wrlk9aZ2zGPEpxQYLP/nn6AGRlou60TMfcROk4tTe0Pm
         n+E7678HemdMnlx5ph8v6bOz+gmVedORW9Qok4QVBUeh1nKplOrqEBt+YNTBiU2Zvhe1
         6R+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531541; x=1773136341;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Czw8AGkm+Fe/UN3W4zP3A5S6h5MUJRS9IWz2PJW9Mk=;
        b=a1/fyuBWHjsaKXhiJSnkTBNptdSqKLOVxvrkZwrZjdNvfM9ZKImV5geJr3NocLThQx
         P7MkxIR3cti9wM6vUtZ/wM8Jk/+igyqEK12+DF9vnFUXuKBDdr10EAgTSJEaMOKp63dy
         zUYtGn8WTl8dTL8b71pi+Dvxovo0YBTPivnc8KP7xlComO7XaLMpksbe2sxGToJPWLAX
         CwPgb+pAp0nB8xQRC+4BKq7rPm3K2gOZxbzjRS/cUOobigPuFRs/iH2JXQ2oiUdwULsr
         xZqAl+HWoQNRubtEW0b1yrPL1b8+qwXy5mphs5kfny1Zg9Srg0ss/k5Mu4unVGo6Wclh
         Tttw==
X-Forwarded-Encrypted: i=1; AJvYcCU2qAGLSp7LGw72/z863U7wqGS7ftwv6mLtssCAtcLWMXoC8tFYbY7GCBNdN+EUwdz9AtFIbh0nA6MmAyem@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/jMpWtRQEaHdWCYlwucUVGCR6pIyupKqPpOe158bzRaQfQNzQ
	m2epiu7bEkFGgRH5HrGRfxJrB2P4fz/5BxXu/tGAnA7NmLo6ELFmYLcQ2v4cVswFuq4=
X-Gm-Gg: ATEYQzyw18Iy5fB3j2rT13RwixW8GOb+z0WvSGKaUimwPd7pblqtnGcnEGwlJqNmfH0
	RtXNtjIdB8kzkl+7bnSLfRonFf8fVUg2RSTm0fElyqPNQhYK9wKkUPtBYhqHV2GK2f9PY69C09p
	VyDJuK0M90a6YL+DIsI+aoL1NV6Oj++AUR3jMmpqR3LQpGGp8tukIFrPltd5cZafjE0XeQbiDkY
	tC3Cmeu8TjM++rX363f3PpLLbxblQy4ZZcj3VU0Mp5C89afAwZB/eFCQHAiCo/y0qss+S+pGEQT
	hnFlr0t5pYQdWpTBk2QwXP2nit0xkawSHJ/dCLAkfOMz13rC2wV80nAvJ86/ym5B5Gz5zc5vDJA
	lcMWqFYmhSCexSp6zdgGJbb69y+SFwAb0ar/lKSHjweCGIcm6WeItJ5Je2k/crBpfDkWdEzq3CW
	yPoMyi/iwuz8SH8yEeuetVbnYrpIOxGmi4E4Vlk7gsJFEIBj3Lu9wuSt7gIELEvntb7qZsYTBrT
	LE=
X-Received: by 2002:a05:600c:3509:b0:483:c3f3:1dad with SMTP id 5b1f17b1804b1-483c9c20d75mr241280155e9.34.1772531541093;
        Tue, 03 Mar 2026 01:52:21 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485135b6900sm11662145e9.22.2026.03.03.01.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:52:20 -0800 (PST)
Message-ID: <3f6673f2-ca75-4367-b1f8-45f4462e07ff@linaro.org>
Date: Tue, 3 Mar 2026 09:52:18 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 2/9] media: qcom: camss: csiphy-3ph: Use odd bits
 for configuring C-PHY lanes
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-2-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-2-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 90D3A1EC1D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95083-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Action: no action

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> So far, only D-PHY mode was supported, which uses even bits when enabling
> or masking lanes. For C-PHY configuration, the hardware instead requires
> using the odd bits.
> 
> Since there can be unrecognized configuration allow returning failure.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |  8 ++--
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 49 +++++++++++++++++-----
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |  5 +--
>   drivers/media/platform/qcom/camss/camss-csiphy.h   |  6 +--
>   4 files changed, 48 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> index 9d67e7fa6366a..bb4b91f69616b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> @@ -94,9 +94,9 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
>   	return settle_cnt;
>   }
>   
> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> -				struct csiphy_config *cfg,
> -				s64 link_freq, u8 lane_mask)
> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
> +			       struct csiphy_config *cfg,
> +			       s64 link_freq, u8 lane_mask)
>   {
>   	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>   	u8 settle_cnt;
> @@ -132,6 +132,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		writel_relaxed(0x3f, csiphy->base +
>   			       CAMSS_CSI_PHY_INTERRUPT_CLEARn(l));
>   	}
> +
> +	return 0;
>   }
>   
>   static void csiphy_lanes_disable(struct csiphy_device *csiphy,
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 4154832745525..cf83c9e062b81 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -14,6 +14,7 @@
>   #include <linux/delay.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
> +#include <linux/media-bus-format.h>
>   
>   #define CSIPHY_3PH_LNn_CFG1(n)			(0x000 + 0x100 * (n))
>   #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG	(BIT(7) | BIT(6))
> @@ -993,13 +994,22 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   
>   static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>   {
> -	u8 lane_mask;
> -	int i;
> +	u8 lane_mask = 0;
>   
> -	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +	switch (lane_cfg->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= BIT(lane_cfg->data[i].pos + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>   
> -	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= 1 << lane_cfg->data[i].pos;
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= BIT(lane_cfg->data[i].pos);
> +		break;
> +	default:
> +		break;
> +	}
>   
>   	return lane_mask;
>   }
> @@ -1027,10 +1037,11 @@ static bool csiphy_is_gen2(u32 version)
>   	return ret;
>   }
>   
> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> -				struct csiphy_config *cfg,
> -				s64 link_freq, u8 lane_mask)
> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
> +			       struct csiphy_config *cfg,
> +			       s64 link_freq, u8 lane_mask)
>   {
> +	struct device *dev = csiphy->camss->dev;
>   	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>   	struct csiphy_device_regs *regs = csiphy->regs;
>   	u8 settle_cnt;
> @@ -1039,9 +1050,23 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   
>   	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>   
> -	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> -	for (i = 0; i < c->num_data; i++)
> -		val |= BIT(c->data[i].pos * 2);
> +	val = 0;
> +
> +	switch (c->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT((c->data[i].pos * 2) + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT(c->data[i].pos * 2);
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported bus type %d\n", c->phy_cfg);
> +		return -EINVAL;
> +	}
>   
>   	writel_relaxed(val, csiphy->base +
>   		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
> @@ -1068,6 +1093,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		writel_relaxed(0, csiphy->base +
>   			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
>   	}
> +
> +	return 0;
>   }
>   
>   static void csiphy_lanes_disable(struct csiphy_device *csiphy,
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 62623393f4144..938600f3defe1 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -265,6 +265,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
>   static int csiphy_stream_on(struct csiphy_device *csiphy)
>   {
>   	struct csiphy_config *cfg = &csiphy->cfg;
> +	const struct csiphy_hw_ops *ops = csiphy->res->hw_ops;
>   	s64 link_freq;
>   	u8 lane_mask = csiphy->res->hw_ops->get_lane_mask(&cfg->csi2->lane_cfg);
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
> @@ -295,9 +296,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   		wmb();
>   	}
>   
> -	csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
> -
> -	return 0;
> +	return ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
>   }
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index d198171700e73..21cf2ce931c1d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -73,9 +73,9 @@ struct csiphy_hw_ops {
>   	void (*hw_version_read)(struct csiphy_device *csiphy,
>   				struct device *dev);
>   	void (*reset)(struct csiphy_device *csiphy);
> -	void (*lanes_enable)(struct csiphy_device *csiphy,
> -			     struct csiphy_config *cfg,
> -			     s64 link_freq, u8 lane_mask);
> +	int (*lanes_enable)(struct csiphy_device *csiphy,
> +			    struct csiphy_config *cfg,
> +			    s64 link_freq, u8 lane_mask);
>   	void (*lanes_disable)(struct csiphy_device *csiphy,
>   			      struct csiphy_config *cfg);
>   	irqreturn_t (*isr)(int irq, void *dev);
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

