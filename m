Return-Path: <linux-arm-msm+bounces-44653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE8FA07EB4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 18:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 743EC188D0DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 17:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B7718FC80;
	Thu,  9 Jan 2025 17:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iw1g/gHf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8737018E756;
	Thu,  9 Jan 2025 17:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736443641; cv=none; b=Vf/TPhKI66So61u8wTsL69DJWMhxcawaLTQ99sP+YzMQDDo/QuMlyVqlPoZ2BrAllgdMwpJdreLn8T7ftXwDkUa0zzhX63K1Tf7/VugTi9MfQerl3xia0GGuGhTLK9Tsd8YuU/WAZrP6I+SblTg+fSAuNUnH2AXVCZp+X9fW+6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736443641; c=relaxed/simple;
	bh=k6dSHtIzHPXjCi55pFzcPs0hQ6RidrPUUyk4gC3kNmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbXZATN5Q9CunAPiL3YxtnMj4KOHuc3qDYpOcNlJKNxG1PM3Nnm/EyidH1dic94bfGNOks7iEryynt9a0OVGH6OQ6jc49myq32mGTdkyj6AMfevrMOvS771tSJ5cBw/8NjXllL3VSJ9qtJhtLmN6G06MFqmPnID4dHq2mzyJX6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iw1g/gHf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E216C4CED2;
	Thu,  9 Jan 2025 17:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736443641;
	bh=k6dSHtIzHPXjCi55pFzcPs0hQ6RidrPUUyk4gC3kNmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iw1g/gHf9UnQ6FPaRmdIh69NJ2JP4qyUVC7TdimvhOvT39hb8cevQEIQZR2wac6LZ
	 /wPyHWsWBAq0Y4Bk5qIMRY1X8UgoEECnc/XTfTa6q+BqUzST6zcpVBA5TmVR/PK8Lp
	 nWcrvKqkNFQbNQvP7bYrP7TJS3vmELKIf5yy/REnM9H+J+e+tPHo/ACLd+GjhQM8r3
	 aZtFdyyskZ/TdjuExwsO+M1hA5HM99NiUuu3egJinnB4FT1EfiG5RzdwM6fpROxQ65
	 6LpB+rTv6jNwhDbdA6XLDMaX+NsXYidNsPV1TFavPfHfyw0RGbmuNj7BZiq5AA8kZb
	 6nHuTNpJ0Fo2Q==
Date: Thu, 9 Jan 2025 17:27:14 +0000
From: Simon Horman <horms@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lei Wei <quic_leiwei@quicinc.com>,
	Suruchi Agarwal <quic_suruchia@quicinc.com>,
	Pavithra R <quic_pavir@quicinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	john@phrozen.org
Subject: Re: [PATCH net-next v2 04/14] net: ethernet: qualcomm: Initialize
 PPE buffer management for IPQ9574
Message-ID: <20250109172714.GN7706@kernel.org>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-4-7394dbda7199@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-qcom_ipq_ppe-v2-4-7394dbda7199@quicinc.com>

On Wed, Jan 08, 2025 at 09:47:11PM +0800, Luo Jie wrote:
> The BM (Buffer Management) config controls the pause frame generated
> on the PPE port. There are maximum 15 BM ports and 4 groups supported,
> all BM ports are assigned to group 0 by default. The number of hardware
> buffers configured for the port influence the threshold of the flow
> control for that port.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>

...

> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c

...

> +/* The buffer configurations per PPE port. There are 15 BM ports and
> + * 4 BM groups supported by PPE. BM port (0-7) is for EDMA port 0,
> + * BM port (8-13) is for PPE physical port 1-6 and BM port 14 is for
> + * EIP port.
> + */
> +static struct ppe_bm_port_config ipq9574_ppe_bm_port_config[] = {
> +	{
> +		/* Buffer configuration for the BM port ID 0 of EDMA. */
> +		.port_id_start	= 0,
> +		.port_id_end	= 0,
> +		.pre_alloc	= 0,
> +		.in_fly_buf	= 100,
> +		.ceil		= 1146,
> +		.weight		= 7,
> +		.resume_offset	= 8,
> +		.resume_ceil	= 0,
> +		.dynamic	= true,
> +	},
> +	{
> +		/* Buffer configuration for the BM port ID 1-7 of EDMA. */
> +		.port_id_start	= 1,
> +		.port_id_end	= 7,
> +		.pre_alloc	= 0,
> +		.in_fly_buf	= 100,
> +		.ceil		= 250,
> +		.weight		= 4,
> +		.resume_offset	= 36,
> +		.resume_ceil	= 0,
> +		.dynamic	= true,
> +	},
> +	{
> +		/* Buffer configuration for the BM port ID 8-13 of PPE ports. */
> +		.port_id_start	= 8,
> +		.port_id_end	= 13,
> +		.pre_alloc	= 0,
> +		.in_fly_buf	= 128,
> +		.ceil		= 250,
> +		.weight		= 4,
> +		.resume_offset	= 36,
> +		.resume_ceil	= 0,
> +		.dynamic	= true,
> +	},
> +	{
> +		/* Buffer configuration for the BM port ID 14 of EIP. */
> +		.port_id_start	= 14,
> +		.port_id_end	= 14,
> +		.pre_alloc	= 0,
> +		.in_fly_buf	= 40,
> +		.ceil		= 250,
> +		.weight		= 4,
> +		.resume_offset	= 36,
> +		.resume_ceil	= 0,
> +		.dynamic	= true,
> +	},
> +};
> +
> +static int ppe_config_bm_threshold(struct ppe_device *ppe_dev, int bm_port_id,
> +				   struct ppe_bm_port_config port_cfg)
> +{
> +	u32 reg, val, bm_fc_val[2];
> +	int ret;
> +
> +	/* Configure BM flow control related threshold. */
> +	PPE_BM_PORT_FC_SET_WEIGHT(bm_fc_val, port_cfg.weight);

Hi Luo Jie,

When compiling with W=1 for x86_32 and ARM (32bit)
(but, curiously not x86_64 or arm64), gcc-14 complains that
bm_fc_val is uninitialised, I believe due to the line above and
similar lines below.

In file included from drivers/net/ethernet/qualcomm/ppe/ppe_config.c:10:
In function 'u32p_replace_bits',
    inlined from 'ppe_config_bm_threshold' at drivers/net/ethernet/qualcomm/ppe/ppe_config.c:112:2:
./include/linux/bitfield.h:189:15: warning: 'bm_fc_val' is used uninitialized [-Wuninitialized]
  189 |         *p = (*p & ~to(field)) | type##_encode_bits(val, field);        \
      |               ^~
./include/linux/bitfield.h:198:9: note: in expansion of macro '____MAKE_OP'
  198 |         ____MAKE_OP(u##size,u##size,,)
      |         ^~~~~~~~~~~
./include/linux/bitfield.h:201:1: note: in expansion of macro '__MAKE_OP'
  201 | __MAKE_OP(32)
      | ^~~~~~~~~
drivers/net/ethernet/qualcomm/ppe/ppe_config.c: In function 'ppe_config_bm_threshold':
drivers/net/ethernet/qualcomm/ppe/ppe_config.c:108:23: note: 'bm_fc_val' declared here
  108 |         u32 reg, val, bm_fc_val[2];
      |                       ^~~~~~~~~

> +	PPE_BM_PORT_FC_SET_RESUME_OFFSET(bm_fc_val, port_cfg.resume_offset);
> +	PPE_BM_PORT_FC_SET_RESUME_THRESHOLD(bm_fc_val, port_cfg.resume_ceil);
> +	PPE_BM_PORT_FC_SET_DYNAMIC(bm_fc_val, port_cfg.dynamic);
> +	PPE_BM_PORT_FC_SET_REACT_LIMIT(bm_fc_val, port_cfg.in_fly_buf);
> +	PPE_BM_PORT_FC_SET_PRE_ALLOC(bm_fc_val, port_cfg.pre_alloc);
> +
> +	/* Configure low/high bits of the ceiling for the BM port. */
> +	val = FIELD_PREP(GENMASK(2, 0), port_cfg.ceil);

The value of port_cfg.ceil is 250 or 1146, as set in
ipq9574_ppe_bm_port_config. clang-19 W=1 builds complain that this
value is too large for the field (3 bits).

drivers/net/ethernet/qualcomm/ppe/ppe_config.c:120:8: error: call to '__compiletime_assert_925' declared with 'error' attribute: FIELD_PREP: value too large for the field
  120 |         val = FIELD_PREP(GENMASK(2, 0), port_cfg.ceil);
      |               ^
./include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
  115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
      |                 ^
./include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
   68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
      |                 ^
./include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^
note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
././include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
  530 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^
././include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
  523 |                         prefix ## suffix();                             \
      |                         ^
<scratch space>:95:1: note: expanded from here
   95 | __compiletime_assert_925
      | ^
1 error generated

> +	PPE_BM_PORT_FC_SET_CEILING_LOW(bm_fc_val, val);
> +	val = FIELD_PREP(GENMASK(10, 3), port_cfg.ceil);
> +	PPE_BM_PORT_FC_SET_CEILING_HIGH(bm_fc_val, val);
> +
> +	reg = PPE_BM_PORT_FC_CFG_TBL_ADDR + PPE_BM_PORT_FC_CFG_TBL_INC * bm_port_id;
> +	ret = regmap_bulk_write(ppe_dev->regmap, reg,
> +				bm_fc_val, ARRAY_SIZE(bm_fc_val));
> +	if (ret)
> +		return ret;
> +
> +	/* Assign the default group ID 0 to the BM port. */
> +	val = FIELD_PREP(PPE_BM_PORT_GROUP_ID_SHARED_GROUP_ID, 0);
> +	reg = PPE_BM_PORT_GROUP_ID_ADDR + PPE_BM_PORT_GROUP_ID_INC * bm_port_id;
> +	ret = regmap_update_bits(ppe_dev->regmap, reg,
> +				 PPE_BM_PORT_GROUP_ID_SHARED_GROUP_ID,
> +				 val);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable BM port flow control. */
> +	val = FIELD_PREP(PPE_BM_PORT_FC_MODE_EN, true);
> +	reg = PPE_BM_PORT_FC_MODE_ADDR + PPE_BM_PORT_FC_MODE_INC * bm_port_id;
> +
> +	return regmap_update_bits(ppe_dev->regmap, reg,
> +				  PPE_BM_PORT_FC_MODE_EN,
> +				  val);
> +}

...

-- 
pw-bot: changes-requested

