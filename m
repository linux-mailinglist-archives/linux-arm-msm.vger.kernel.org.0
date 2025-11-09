Return-Path: <linux-arm-msm+bounces-80867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA627C43DBF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 13:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C89F3A63F3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 12:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1830B2E9EB5;
	Sun,  9 Nov 2025 12:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AKmndVwy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E0C2E975A
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 12:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762691760; cv=none; b=ejgJPEQVcjHLxoNtdrpsPeJfV1UK0CtRWHwtjwvkVtQwN+miXkOXeBJLBjYQ3AQx4iM4RkoL2VBTCcPXVUumDcF5AkIbsKUuGlcCkaB6rZgy0UchgJCYxzNT2UNqwFFUAmDiXcLmUUrlfo0NCvgaBXbk9kyJB9YfTh6ODU7ipsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762691760; c=relaxed/simple;
	bh=aipiftIL6cxlw0GmgAzYCOHVmHzME3ZaXt6XC5G+Nz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkKUuXbXUrbgwqWEmGd6gA71u/sgJCrQEJMET84PBtfl1sU7ZoABbWSKcq2w+P5EGP3hC4VL/v4vv8nZs9o8h3li1fv9JO4rZhOCNLwAasVKXM051a2pWaHlCTFBEsnbg/a3s7HbAxvWdhH+p28ZuMDztBtlKbRtPcgHoY9Qp6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AKmndVwy; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b4736e043f9so299256766b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 04:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762691755; x=1763296555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+0Qyhz1x92lWHWIws7RgtXksw84DNzrjoWDqoYr7AO8=;
        b=AKmndVwyCCdfIuvbYslfOaz43nYUeQLkQFvyscJDKS6u4GGhwp+q2LAcOmfnREbnly
         F6PjfVWxM9VI1joImX+CfXhVyK/iVZ5whptNyuYGEukSwzyrMWRfZ8TZVoqaIEWbHtkG
         WLnhTGiLsTosV3+miPaqJVfO6Wsu2ciiobAEHUMXWdAPWjO8H5VhLLxPaXjBbmxi5huF
         LxVwNdo8s2Dl39vsokC1Ja3X0Izjy9ZSnDbXyLFhKNWRcNwR0cPzIji0MJY2TEMl6HAP
         H6+pDPYUz7IeCeJKEjRILOY7yv3F26Wc9FuKX7skhFgMUQTWkZrle4kUHrPR7UEFWuiB
         JJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762691755; x=1763296555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0Qyhz1x92lWHWIws7RgtXksw84DNzrjoWDqoYr7AO8=;
        b=HQ8dhSRB9gm03wpkZfUpwL2AmL3dXsdLSonIGKXgKbusN1Wik/DGDEhyqrDHN3+kAt
         47Hf3m2IjNc0KjgdAMSy2ksH7BCqTAEJ9q7h9Kd2/Ht8SBLHB+lerh+5LrRqFEV8SnqY
         nXJYPa9DHUNVbhAJpRnap9YTiXM1CPlhtBJOLuNAyQcETHa2MHQy5lYtiQHTNZ6jfp7T
         WTF1P1mbXKRYIB5KtSsoS8jcuEAYCgAneyaPRC9U31gRUf2j9HJxS0/JlkqTLjsnfOoD
         AJds345MCvTmLOt5TkkhbaVjFstbx1bntdpLvMxlTXmYA6D3Q0I23UMO8KAGEYi8O5G+
         XsAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbrgdhcz6PIZ1e5l9CK36XRWsok58PKvOJCGChrBLLPaF3g8h9oLnX9rm6xSNi/OatPJpwG9Y9q+9HVvre@vger.kernel.org
X-Gm-Message-State: AOJu0YxnIHq/u0YPqJrpWBcNqi8H0yM6o76B68G079YZP7lEAxCSA1lr
	FyrMldebF6VG3rKoMu52soII8M9KpE/BGmMQ2FDvJFxwe9xhuIMHxkS1iMOR/wQ3P6g=
X-Gm-Gg: ASbGncvCqfFQlRpicdglgmYMHABST3Lt9TZ6mD+oQtpP2t87j93wZTZm+PQgGcO4NNR
	72Tpl3tqKlKE2ewBNSSJOGr72Fs8cd85Ihk7W2uMfWXEwpYGEWTmTzqhaa07xlo/oVP/IQxVjrk
	ifeL9U3MCNejZc1MM1r7saFPTC5dirRopbMPqpRJ6UKAwCEDwjABfZF5TtNo60w0oF53cBXOi4j
	wPkyKwv22VcouFxKF8zFPDpnC+YMt5knfXGSsr3QhshQhPzEFoWbCtr/yNTf9nfC16DOjpNWd0n
	DFYu7I4lvRA9P4kql0BDNBUgK33NGWAwhOVaxNGPtIWZmf9QZttQTjbOe1BmXR9B3t5nlcDRgZg
	U+uYFsr/SL6cLD0vhqagPXd/p3qdxuJC3VeUlMXIw4DQm/1rlSiaaNgKktxrAqaT8bHG7g7RTH1
	ZhAKy8HueCsMwDDU3y0xZSifrQFiY6pkPKXu8KoF/P2xbcKZx+tGHdB+40LgFxUwTZMld5rXp8/
	gPep6N+EE/36xxCg8t/inFyqvgkeUQKp7GOEJhARq2pPGP/xzYyWyCNQkoW0luxJP6kEm4sM4w0
X-Google-Smtp-Source: AGHT+IHyykZNktMvLQKNtgxSniaCk3u7efAcZ163+WwM1eqdehxI0ewxnn6NYoG1aJsp8Lj9a6zjlA==
X-Received: by 2002:a17:907:2d8d:b0:b72:a899:169f with SMTP id a640c23a62f3a-b72e028a446mr537437266b.4.1762691755219;
        Sun, 09 Nov 2025 04:35:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:3b8a:ea00:4729:b0ef:dcc4:b0b6? (2001-1c00-3b8a-ea00-4729-b0ef-dcc4-b0b6.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:4729:b0ef:dcc4:b0b6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97ea95sm811509566b.44.2025.11.09.04.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 04:35:54 -0800 (PST)
Message-ID: <f3a5c965-6bf7-4e0a-bccf-f0342928150f@linaro.org>
Date: Sun, 9 Nov 2025 13:35:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/8] media: qcom: camss: csiphy: Introduce C-PHY
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-2-165f7e79b0e1@ixit.cz>
Content-Language: en-US, en-GB
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20251109-qcom-cphy-v1-2-165f7e79b0e1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

On 11/9/25 10:39, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Read C-PHY from the device-tree bus-type and save it into the csiphy
> structure for later use.
> 
> For C-PHY, skip clock line configuration, as there is none.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.h | 2 ++
>   drivers/media/platform/qcom/camss/camss.c        | 8 ++++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 895f80003c441..8f7d0e4c73075 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -28,11 +28,13 @@ struct csiphy_lane {
>   
>   /**
>    * struct csiphy_lanes_cfg - CSIPHY lanes configuration
> + * @cphy:     true if C-PHY is used, false if D-PHY is used
>    * @num_data: number of data lanes
>    * @data:     data lanes configuration
>    * @clk:      clock lane configuration (only for D-PHY)
>    */
>   struct csiphy_lanes_cfg {
> +	bool cphy;

Bit of a nit, but it would read better to use an enum here I think, then 
one doesn't have to infer that "!lncfg->cphy" means dphy mode.

Kind regards,
Casey (she/they)

>   	int num_data;
>   	struct csiphy_lane *data;
>   	struct csiphy_lane clk;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index fcc2b2c3cba07..549780f3f948b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4055,9 +4055,13 @@ static int camss_of_parse_endpoint_node(struct device *dev,
>   	csd->interface.csiphy_id = vep.base.port;
>   
>   	mipi_csi2 = &vep.bus.mipi_csi2;
> -	lncfg->clk.pos = mipi_csi2->clock_lane;
> -	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
>   	lncfg->num_data = mipi_csi2->num_data_lanes;
> +	lncfg->cphy = vep.bus_type == V4L2_MBUS_CSI2_CPHY;
> +
> +	if (!lncfg->cphy) {
> +		lncfg->clk.pos = mipi_csi2->clock_lane;
> +		lncfg->clk.pol = mipi_csi2->lane_polarities[0];
> +	}
>   
>   	lncfg->data = devm_kcalloc(dev,
>   				   lncfg->num_data, sizeof(*lncfg->data),
> 


