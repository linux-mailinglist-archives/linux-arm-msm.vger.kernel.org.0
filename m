Return-Path: <linux-arm-msm+bounces-89535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F22F7D39140
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 22:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F01653004D09
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 21:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786D22EC57C;
	Sat, 17 Jan 2026 21:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hXlNgR3b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C898A2DA75B
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 21:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768686867; cv=none; b=JgIQStWIKbAt3fKv9o6sV5uu++oKrGKsBproM1LypvFqohU5hyygHlo7jt9mT0B0Og4NNcfK1qmq1NFp1tmQaO61l0rTdLwjzxLqwkRZuHAfg9pj4tBplo3zjvUrsPpZiu+tuq5qtFEQdLUAP+4IRdVo/CEQDn0UVRiZ7wlQhE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768686867; c=relaxed/simple;
	bh=61farPWAS3rdz5Y29Ms/plzBMDmfaogO+QU+97XcWXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwpjiZYXlSPZ768Za3g4tj6GpIe5br7B/oAKK/xNC4wq7eTLlXIqLdolzCfMXCTs8oB77NPYPzCn2O4YyyOER1MBg9mw9SnhEhYWkAcP4QSn6ESrWajcKCRsGESe5E4+woNnusyaQfrbJW0iGrCRLfH9AAH2GqUUpIONM/jd3tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hXlNgR3b; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso17152495e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 13:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768686864; x=1769291664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwPNYfeXiQuitQb++/nMJ12hS+N4b8LejrqLKmJ1Kx8=;
        b=hXlNgR3barPPKa/aL5zVbt7XW8e/0iu5L6x7pnN9dGm7rinFAK0FBwMbD5K8+hWm+0
         FC/iUTkndob1IZDmLNln/UeDyr3r5bBgVv4/iT0xRhdiUFrXyTwLLReSt9KpOm36mSLc
         /GBD9oYMlVvg8MhS6qfGWb6KjcrHIEtbIwBXApmH0gzdeiV7zifF2I/VTXe92WUB6ch+
         hLIiee6yOpNBcDflBG5rHejvF+rL9g98u2NcOSLCXw0dE8yaB8k+ycuz2y8hBvxB1VjQ
         BEabnDHwCsWfFLRHs7WzIr9z7XkD3dFLQoQeENNUT2zsiuRvPtUHhvfw7IGOAaEKw9rn
         3jxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768686864; x=1769291664;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwPNYfeXiQuitQb++/nMJ12hS+N4b8LejrqLKmJ1Kx8=;
        b=uBhnH8FDt/3z7g5L1yMhbniRnLvogUkU5eI4N+oOgYtOYKBuXC3f2TP0yRPIQ/yXjE
         yUyHxH8GIOOLwM1iszLqgJfanP/Jc7BiLpUkgD9JPIHN6PPTd+IzN+oq2l9JQtGKpHYm
         zkUIA3tetV1ePLMfm4+mBBhvfm4GQt7uNZVfoZxk4ULcXu2o8XpCfkYxTcnx3Apm2plL
         z9lXnHQNBDd/R8tvfUZ4bUmRkPBXkEdcWcTRR2a8ZJ79c7yz2hZPZJsQwnnTpJKwz4e1
         a4dBuSLiudqAvibNY/Wwg8w4GDbKDg7YoYX4AkwKsIoWZT+CQLSealpjcUY5HgalyRTI
         FTbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOFPCr4lXtJen3m7XwpagGyg+mZIoHu1hZMvmn63LVWp5Lpyo8ewEktN6huTm9xYRVTAlOwNrGxgfTFBxI@vger.kernel.org
X-Gm-Message-State: AOJu0YzTGL4zimPELue9/W21+8o8n2+WCBuXPFbO6+sqQSxxIa5gjDVM
	QXH2sTlQeEHb/P5zaq6a4X1D6k1mwk45fIzU012Ij+wEAdvq8ol9cEM8HClQiIguI+Y=
X-Gm-Gg: AY/fxX77ew7nO+Z6u97O9U8iCWNJ2AMmLsdbqeaJEwCHQ3TT9GHks1o5ZiDX2lg4N0v
	N2HdvQ9PZjBTZW+M5edrFoUrJBfZWlY+8c3NIVmY70FsAD9oaAgnek/DM++BnVlphojHIFXFvtT
	5aPmnBYQiWKFiA8pxcthWnvbW22caBfQbQBfxfuXoLgk874E6a2iaOwevkccsrIJSp/erP+MSF+
	ewHF2cLQciPPw4Ful0w7okxhjSBjwH92VC4vftaxn7U0lhvMCIlJCJVeBsLQPcFXTJObeUE5dTH
	2rq+4QiHrozM7rT1Tp73baDexoP4RNwE68RHVR7hBHMoJ0gPPU0GLHDzL6kxVsPJFrTO2IJQfPo
	oHfYiHhcYScA6JbnaA0iLvEOkJ/iLhkridXES5Km85nb/4S7XvEZYK5iDOaJAdHS2OqovgbMiQo
	o/q7Ci0mzUqKNdj8My7SGKJ2S3+hfLAgpk4h5VAZDtveUzts+o1ReS
X-Received: by 2002:a05:600d:6413:10b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-4801e400518mr65526585e9.29.1768686864184;
        Sat, 17 Jan 2026 13:54:24 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6cdsm14234007f8f.31.2026.01.17.13.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:54:23 -0800 (PST)
Message-ID: <25313d70-2d7b-483a-b1cf-493f0697c6cd@linaro.org>
Date: Sat, 17 Jan 2026 21:54:19 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] media: qcom: camss: csiphy-3ph: C-PHY needs own
 lane configuration
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
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-7-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-7-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Catch when C-PHY configuration gets used on SoC with CAMSS missing C-PHY
> configuration lane registers.
> 
> Hopefully this check will disappear as these lane regs gets populated.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index d82a88dad74b5..89bfe3710fc3a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1217,6 +1217,22 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>   	u8 val;
>   	int i;
>   
> +	if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +		switch (csiphy->camss->res->version) {
> +		case CAMSS_2290:
> +		case CAMSS_8280XP:
> +		case CAMSS_X1E80100:
> +		case CAMSS_8550:
> +		case CAMSS_8650:
> +		case CAMSS_8300:
> +		case CAMSS_8775P:
> +			dev_err(dev, "Missing lane_regs definition for C-PHY\n");
> +			return -EINVAL;
> +		default:
> +			break;
> +		}
> +	}
> +
>   	switch (csiphy->camss->res->version) {
>   	case CAMSS_845:
>   		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> 

Proliferating special cases in switch statements on a per-SoC basis is 
verboten.

Please find another way to do this, you already have a bool to indicate 
cphy in struct csid_phy_config {} so at some level CAMSS already has a 
bool to indicate what to do.

Please make that logic accessible to logical consumers throughout, in 
this case the CPHY code.

---
bod

