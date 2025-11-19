Return-Path: <linux-arm-msm+bounces-82445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B05B8C6D7CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C4A7534242F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009D12F6593;
	Wed, 19 Nov 2025 08:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oq0HMLXY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B3B235C01
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541709; cv=none; b=uc0YGYNI/De18BwfywE+usAZrOuDaCqXTdVt/KwxcL5gP0QD57kz4mx4bwOyxH/PAqahZhUmgsoj0J2zOVMBqWJoBuxe5CeYkdbQ6m+9tzUQpjx2T3mnSY4+VlS1r+nbGo+gsftc+CxjBdfDfuv3TSeXV/dvHRBkB6w1QhecSvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541709; c=relaxed/simple;
	bh=9GzWNEUbh14ySiX9cC9rQKC6XtIRN2wQb7ehSwenTSk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=OzD8gFZqPkHomE15q/4eSNgqCHS29hV4w7QKcv7+iEeJnRo7Gn0HlDjj7fmCk41NYAMp0xtHZjb0svR081jw7gwVQaMEN6ff26oFx3/Aksm6rw3KF4NMG9HOMHJPPaNGZdcMDhZd/d/QkuL7hQEq8HMnRywF7XJWLedk4MxCZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oq0HMLXY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so46263715e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763541705; x=1764146505; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B38cCNHEIiFRoBT5tfPUwxAQfE53n8AjY5vTLhKGZRg=;
        b=Oq0HMLXYXsyYK1Q1kqK/0Jg1ELl6SUmdRcGZt7sv2/Pt0xO0WC+v7Ab7w7AsPwBly4
         EDEkBWjLdz4lB90s40QIb7EPN5hyPJmt62d7uL+M4Z++5b9pgfhLatFa2hPtMM3j/HCx
         iq4Ag4JvbeuEAB/sgjr84hLW34i4UJEf6UgosZ8bqvGZzFvi0hBxVAcnHUuLAnEC6uPu
         tQIggDUAXKQZP80xP5BvRSl8CzcBIe92jyba0Yl98VBN2B7YuhEniHcd1NSyFDRwi83z
         f2ePN11hOxR8jQJd7BizX48pCyCgX5nMWyrrzciYSPSYeIMm7+Tn6Zd4KHHra0pD+1hm
         Z9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541705; x=1764146505;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B38cCNHEIiFRoBT5tfPUwxAQfE53n8AjY5vTLhKGZRg=;
        b=FPrjohyn5bOmjMHgqLPfHnEcIKtnkSrLZyv1qn3+BzhnOni8Fx7QWCrVG05MGtSACt
         0dj/7JZuuB+jE5yiK9LgzbRWJ+NghNYvOC8BjakJB1TJqh05jdh1Kh36oEVoahxgA40r
         RVhxpORFcJ4+yKpmYndCzeXW3jl3T53lzQYs/dgAibAdzf40Dp7SVN1SkBPlaP5ZmRKY
         kkA7xmRc6n1x33Grp2KEuhQscT0qZRgLZ30OdurtpOSCNVLAg0yWtbfzAeInp/8ht3GG
         VOBk9pdgdtCyPaaHEWVO/SPLdK0jH0L5GKuLl3ZnzTXEtezgWtAwIaYwCn8/oTVvxcXR
         glJw==
X-Forwarded-Encrypted: i=1; AJvYcCVtuNdOVTHhLdQ0qjD8miVVHGvfmpYvboWTVmdyGcNz+br3bi5CuzwpFCgkiiSxyN1bEZgxfUWjmDkqYsYW@vger.kernel.org
X-Gm-Message-State: AOJu0YxcgPLRzppjJqmqJo9KyUbX+qR9QxL+yZwWI/U0rNI99Fnlf9/n
	dTgF6VrXHuXpN0VPi9LPmX5igzm1SfydPGiPnj+LSqrixuSuHmJ4xoQeBUXV6WKbIE4=
X-Gm-Gg: ASbGnct8JZ847GkQd3ucAgIcMWAeWJeFQ2CexGIRN197nFol4+ztqlv1l10ETJ3uBFI
	wbzM+ulKFaLWuq7qucm3QWF1CPJbupvoDG3Zw3q/mtI83/EJFHvqqf/E+6B/+1FZQoDyAHHxmg2
	gHT+xMJwe2pp71u/sf/2kdOy/pN+nFCssuiLgTaMh9lUwaGWCuyi24Rml+XpX4A+P3nB9tKXxOO
	zcSE2MQ/vw5uRddnm0WVNqVtYu5W+ruzwTd7OCi3IURN60BvPUwIjtepZyfQf707mPxwacIg/2i
	fr/XoMZHGKu86lAr4ruXoN8dtS6wdFOfsIynVgkV7l+LRBBckGZCbJH+ciwOgrjJb8kgAFoCnOy
	mCz7Hv+WkG0uWWQOvnn5RJZq7nRsRyv0m5Q1c2pf7Iiologp5VU/SJ+vX0MyN6Q7GUAvd/H1mwi
	y7Fr8+g8WEqHmao5cf3cl1WNCcGdiTMMe4DX5g383w59LomYJ+Pimw1JCX7Xw7BIsqN38haYPH9
	g==
X-Google-Smtp-Source: AGHT+IE7QRxp9Ipzy2DFnLBSlO7Q8Aq7iSpY4noVScdDKaIbMEMvRmchKALFaeoev2EnwQ3DjU6Nzg==
X-Received: by 2002:a05:600c:630d:b0:471:1765:839c with SMTP id 5b1f17b1804b1-4778fea2bf7mr165071695e9.20.1763541705081;
        Wed, 19 Nov 2025 00:41:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad? ([2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9e051d8sm35832865e9.5.2025.11.19.00.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:41:44 -0800 (PST)
Message-ID: <615111b0-b2ad-4ace-b9b0-70e92389db83@linaro.org>
Date: Wed, 19 Nov 2025 09:41:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] phy: qcom-qmp-combo: Use regulator_bulk_data with
 init_load_uA for regulator setup
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Johan Hovold <johan+linaro@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Konrad Dybcio <quic_kdybcio@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250922135901.2067-1-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250922135901.2067-1-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/25 15:59, Faisal Hassan wrote:
> Replace the custom qmp_regulator_data structure with the standard
> regulator_bulk_data and use the init_load_uA field to set regulator
> load during initialization.
> 
> This change simplifies the regulator setup by removing manual
> allocation and load configuration logic, and leverages
> devm_regulator_bulk_get_const() to automatically apply load settings
> before enabling regulators.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 49 +++--------------------
>   1 file changed, 6 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index f07d097b129f..97262ed63700 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -1636,14 +1636,9 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_usb_tbl[] = {
>   };
>   
>   /* list of regulators */
> -struct qmp_regulator_data {
> -	const char *name;
> -	unsigned int enable_load;
> -};
> -
> -static struct qmp_regulator_data qmp_phy_vreg_l[] = {
> -	{ .name = "vdda-phy", .enable_load = 21800 },
> -	{ .name = "vdda-pll", .enable_load = 36000 },
> +static struct regulator_bulk_data qmp_phy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 21800, },
> +	{ .supply = "vdda-pll", .init_load_uA = 36000, },
>   };
>   
>   static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
> @@ -1801,7 +1796,7 @@ struct qmp_phy_cfg {
>   	const char * const *reset_list;
>   	int num_resets;
>   	/* regulators to be requested */
> -	const struct qmp_regulator_data *vreg_list;
> +	const struct regulator_bulk_data *vreg_list;
>   	int num_vregs;
>   
>   	/* array of registers with different offsets */
> @@ -3403,39 +3398,6 @@ static const struct dev_pm_ops qmp_combo_pm_ops = {
>   			   qmp_combo_runtime_resume, NULL)
>   };
>   
> -static int qmp_combo_vreg_init(struct qmp_combo *qmp)
> -{
> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
> -	struct device *dev = qmp->dev;
> -	int num = cfg->num_vregs;
> -	int ret, i;
> -
> -	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
> -	if (!qmp->vregs)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < num; i++)
> -		qmp->vregs[i].supply = cfg->vreg_list[i].name;
> -
> -	ret = devm_regulator_bulk_get(dev, num, qmp->vregs);
> -	if (ret) {
> -		dev_err(dev, "failed at devm_regulator_bulk_get\n");
> -		return ret;
> -	}
> -
> -	for (i = 0; i < num; i++) {
> -		ret = regulator_set_load(qmp->vregs[i].consumer,
> -					cfg->vreg_list[i].enable_load);
> -		if (ret) {
> -			dev_err(dev, "failed to set load at %s\n",
> -				qmp->vregs[i].supply);
> -			return ret;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>   static int qmp_combo_reset_init(struct qmp_combo *qmp)
>   {
>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
> @@ -4003,7 +3965,8 @@ static int qmp_combo_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	ret = qmp_combo_vreg_init(qmp);
> +	ret = devm_regulator_bulk_get_const(dev, qmp->cfg->num_vregs,
> +					qmp->cfg->vreg_list, &qmp->vregs);
>   	if (ret)
>   		return ret;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

