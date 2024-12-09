Return-Path: <linux-arm-msm+bounces-41068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471C09E9428
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E657728279B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CC222759A;
	Mon,  9 Dec 2024 12:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oOMo9384"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3B22248A1
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747529; cv=none; b=hnw5Td1wVYGj29iZ5V27dfPBHOaXBOwbOj7I9ki4dExhFRpOlE6ly9AjQ8IjamY5S4eBXmu3VsFoKK3dL4bmYn19HNPQO3TS+fuSWvXyxtOrj7vPZ0MYH8VvDtwKGrjeTmI4GGlMm/HgCI1OC6Z3rCtc8dq7Ssi+HftbwTxFrnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747529; c=relaxed/simple;
	bh=FGLn2JnnbPgNLHqbV6sAQ+LR5fP9D0IYaul+g1G6DaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdSHT99MK04xpEHQ76v6aa+lJPVdQeTGYwDJTMnv38afHvwe+tu0eGBF19Z06cRm4X1MnC0UNwhlFDhBndLmzE+E1toPk9mNwxvATJG4Bz/jZjxdPE8lRJLbCpFX0sffv0GTz2z4muwhdHtX/L2y5kMUgoqJoM+7esxG7AG6gXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oOMo9384; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3862a921123so2193152f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 04:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733747526; x=1734352326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uViGPV/v+nHuHOrvq6Ruv9ExCngCDQh5fTkCG1Yq1vE=;
        b=oOMo93841/umVk3Qx7QhGPmZQC7QVQ/r+ZRdIL5PckE6esOUP+I5Tt7bnPT4UL24bL
         HeYelRCOeH2Qz2gv70OQaugTMt3tiagT6Mx6OJ/GeP2kTkofLrpvJLFQNLCjrUbL/Pkb
         FlM8lknfYxN7t+l7ZVm7Se/HU05E0suuquA4HA8QSWc1Guxhel6x0rP1dA6uvsZIHqGF
         x41kt36x073fcrpPtXk9ZJ7k3TiJ+AUMY3XpSRkBJ+NV59Jw+1DYcWvDKuYkw3SEAN3k
         5rMeWS6R2E1y5PWJZEjKqEyEdXSryIG/CdSd2XxhhZisTM64XG54z/Fj2Nn9aZ0LGSnR
         FJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747526; x=1734352326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uViGPV/v+nHuHOrvq6Ruv9ExCngCDQh5fTkCG1Yq1vE=;
        b=hmeVssXPy+VeGlcXzpuJyfSTCgBkz12JE9k+9ka0t5QKw/xH+ZnFvWeSlRbvAmfu/N
         kyTvRMkHFNsrtNZhhmw64xcLvNGYrUMgPqIG7/cQj7SS1xSJ5vSI/pH5FY1ObWaLANBt
         Izyr/hB3B7FKgPnIE80ELDAQfPRuy7nDopvKIempBshwE0XNO5VUU6WtItJdRQ74ZREl
         HpyNAqfmD4qd7e+ch+SrTNm00TfRfEj7ojgSdPNkLG0f5oDW54KR4UIujYduBA0Q7fEX
         Lo2LMlVHmDE7LvBshKZl7AuDpc8x4RqyBnnsOjfkeAo9TQrX+iYPxpBIGqqiOywL8SbA
         h62Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+fJgy8KXGZIGRI9KpPj0elWl/dfuhizezmqXZlKwBszePQpM88uXaQxx5e4qzP2vbtyfpcmmRpPifuW/2@vger.kernel.org
X-Gm-Message-State: AOJu0YzJUB+BUKgaGRaypnE9BkRERqTo6902pi50fAjosD+QwT4H5xni
	k9TUTU4iMX93340uiIwR73PD9FFux+1DTn0NOhFSL/vRMd+uxc/C9YzdfQm4v2c=
X-Gm-Gg: ASbGncuRja1aeWfx5oSj4tgkkHQ9IS8w+hjZOdL2pqigablLNfgcDMH0Wig3aDSpGVz
	1sEeZnVKHTxvj6ug2xMWfk7QgGn694mxBJ6wf/cDgOFOR7b19K6WpPDydRl1FKJkZYiBOw2IkWJ
	tZv/vC445ASSUmvMYpYYsAYEF28eULZYZIkBufnox3ohyD8ILbl/Eya+1ES09LJ0i/G/ev/0a6h
	InCwyB5dglPGocKd1Jsf1S4geRrHn5NnBocSrYUtn3JLmFU6HZmp0i8W4Q1BDo=
X-Google-Smtp-Source: AGHT+IF0QxPe4hKMnzuRcXAHmSvyPWaavGQlC4qzDsq4v/j6r5ozfzx2v6ivK+DXs+Z/GbfSnPDNuQ==
X-Received: by 2002:a5d:5f8f:0:b0:386:1cd3:8a00 with SMTP id ffacd0b85a97d-3862b3d0963mr7831264f8f.40.1733747526115;
        Mon, 09 Dec 2024 04:32:06 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38621909739sm12864233f8f.66.2024.12.09.04.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:32:05 -0800 (PST)
Message-ID: <9c89e6f4-a9af-4270-b266-537f3464ee32@linaro.org>
Date: Mon, 9 Dec 2024 12:32:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: Restrict endpoint bus-type to
 D-PHY
To: Luca Weiss <luca.weiss@fairphone.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Barnabas Czeman <barnabas.czeman@mainlining.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, David Heidelberg <david@ixit.cz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <20241209-camss-dphy-v1-2-5f1b6f25ed92@fairphone.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241209-camss-dphy-v1-2-5f1b6f25ed92@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2024 12:01, Luca Weiss wrote:
> Currently the Qualcomm CAMSS driver only supports D-PHY while the
> hardware on most SoCs also supports C-PHY. Until this support is added,
> check for D-PHY to make it somewhat explicit that C-PHY won't work.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 9fb31f4c18adee886cd0bcf84438a8f27635e07f..b99af35074cdf6fa794a0d2f0d54ecf12ac354d9 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1855,6 +1855,15 @@ static int camss_of_parse_endpoint_node(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> +	/*
> +	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
> +	 * D-PHY is supported in the driver.
> +	 */
> +	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> +		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
> +		return -EINVAL;
> +	}
> +
>   	csd->interface.csiphy_id = vep.base.port;
>   
>   	mipi_csi2 = &vep.bus.mipi_csi2;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

