Return-Path: <linux-arm-msm+bounces-80992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 085EDC46540
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD2E24EBF72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FB830AACE;
	Mon, 10 Nov 2025 11:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aDasOyGa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975533074B7
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774736; cv=none; b=p9kZ750/Uu2UvIppAVQqQBvYWdsFIKAjwPPA8VreXYh0Jf8VqurIVPyrUfRqgDxW8EVOwWBrSGtkDFSteirtaXv36JcNCOyQ5huoZ9m/j4ikB4Qw9nO7DsMzu2aWu9OspRNJCJXamn+YW+kGyrLvfjdSzd/Mp5QzHiOcqFHtpyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774736; c=relaxed/simple;
	bh=442tawppyk6VW4zUh6UCP/rG01cfIHZsqjC14wtPq6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2GS47/oCaBzENAzoVB4mLeuvm5/v/rW43SIDfwnZQH33hYd8t5+kaixfbDQbruv9H9WlEFWMeeL6QiZ3l9VUA6jJjzxkBZ+ffSmIhWcZCivcnNgwnEI14u9Til3uO0G99LnmrEYFQGONfQGgD2tSpSLQgoHOFndclKHeVwap8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aDasOyGa; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4775ae77516so34783215e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 03:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762774733; x=1763379533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PDGyqZKTc6nb0bCAbSIQ1bmZ2i6gcCfwYTLcd5wNs/k=;
        b=aDasOyGavf9cMAYOVFCg8V0Bts9qDcLZ0U4MZWY5IBd1UjKRuD8Bk7J6p3+XsWOZ7J
         An45SH6ebNL+8/Dgnj6jkLoJ5YCEdMudgRmr4una4/tsPeAfOgJ87uDsdiMsSfTLvoJO
         GowvWZl8np0p3ky+/Mn3BbXl4i3W1+wtaoMrZissmKo0t3L3DZKDBqcwDq9J2H/vKdOX
         Z5RBf6E1o8/7TLhawbW2eSvMgzs8v8wTz09bmiem9BAG3elJ4yqHT3ot5GqwBjJ9hp4E
         fHWXJSKRegWjDFMcMasqoGfifk47kx4mdjO0FX2s2iVifHJF+ei2Iiq3JncykkQLVORs
         sJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774733; x=1763379533;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDGyqZKTc6nb0bCAbSIQ1bmZ2i6gcCfwYTLcd5wNs/k=;
        b=rrPz68wbbP83Q8P6CR2JWuTVSwAn0t7X6TkY59XZbcW1UBihoRIlwAIBapZNPmIdNs
         o37IX3zeQA8GHYtNgguyeTwSlQjtmjZEhzLzJeXxaWcF14kRu18AAX0/ArwQp/RrkxQb
         jlH/nvE+t0QDpelUES04nfxPVkr2zUreKUPLsDL3XHo2tFjRVsvHYTp+vbq0cv10u/L7
         yvfyBpCOL9Q/5814pKlu0IBTQRMMNJzzBG6f0kyDokGiOyTCtc8Sy8GwziF5PD/E0Lu8
         7ibfjUZ68S+c/eHEnECcz99Br+ONf50r8VTN/PgqJZ5Cxf+5pcA1pPf8yZwmCsQRtQFw
         zLAA==
X-Forwarded-Encrypted: i=1; AJvYcCV5Ml0EHQiqHeW47Zmbp3vNH+GLKUApFZi1YKw3xfa4TaxDvX6moBQ1wssPxaLuyUMSP8GCjuuL96gR3d+1@vger.kernel.org
X-Gm-Message-State: AOJu0YwlZ2JlZqfFTqJxIKaKZL3V+8BqlH8aZmH94oQKf9S9dXPpyOqi
	OsbkmZwWtJYLa7DRwqFfDeVhK58bXvbmYLeD+fjyYS0wlySA3VQHiB8FUIWw0RUv9Jo=
X-Gm-Gg: ASbGncvb8TKS69F3vSaG6CKWXcGPJy/LSvyFBSRUsMXIxtCMfF3OB1Hmhae1hmxNOLs
	36Fg/Ei4Vqh7yyDKoOcBLQvg5709cdKRgVFu85W7If6AQqQ6QjIPcNpJdENAjYvp+5jhv0QZavn
	ilbXbQYyBxm7cda+6BbisN3U0ebTGMABLmw4YqEa4AS/8u8Y8+1rsb5amSVIVFXAA5TTAoi/mny
	ufuivZsTOktXVM5q+1xBYtS086pXfResVSjC1SAQ8zi1d/MvuFGPXIR2uPjpOmSiNOBCMS8/HPF
	GVIeJyRvXsI0kG/dsisbK54ujCTjjD9Quf6ZoK0Upd0VY/xl2gWlF6kcqarmGU6hbtVlK08KQlu
	NnOy+OBYuCkXePS/SCHT87dWWMkLga6lqOCU7xKUbsWxbTG8YPVmLo605KaFzWAo51HPvA7YQo8
	XlWj1i9gTjLYZwUV68Jb95AWC+yzOZO4GwfnCZ0Pm5gw==
X-Google-Smtp-Source: AGHT+IG+JUAf6UVQVsqEmCn1XhFTq5TWQOptKskoiqVgM/FKW2sNC6jwfwM3QRHOYWASpaXOTouW+A==
X-Received: by 2002:a05:600c:4fcb:b0:46e:5b74:4858 with SMTP id 5b1f17b1804b1-477732341e9mr73691505e9.13.1762774732654;
        Mon, 10 Nov 2025 03:38:52 -0800 (PST)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce20ee3sm314783285e9.9.2025.11.10.03.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:38:52 -0800 (PST)
Message-ID: <150cee0d-6c5f-4380-8c3b-ff29c4ca679b@linaro.org>
Date: Mon, 10 Nov 2025 11:38:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/8] media: qcom: camss: Initialize lanes after lane
 configuration is available
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-5-165f7e79b0e1@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251109-qcom-cphy-v1-5-165f7e79b0e1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2025 09:39, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <phodina@protonmail.com>
> 
> The lanes must not be initialized before the driver has access to
> the lane configuration, as it depends on whether D-PHY or C-PHY mode
> is in use. Move the lane initialization to a later stage where the
> configuration structures are available.
> 
> Signed-off-by: Petr Hodina <phodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 70 ++++++++++++----------
>   1 file changed, 37 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 348b8cd18327e..c2adbde6b4e0d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1101,6 +1101,42 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   	u8 val;
>   	int i;
>   
> +	switch (csiphy->camss->res->version) {
> +	case CAMSS_845:
> +		regs->lane_regs = &lane_regs_sdm845[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> +		break;
> +	case CAMSS_2290:
> +		regs->lane_regs = &lane_regs_qcm2290[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		break;
> +	case CAMSS_7280:
> +	case CAMSS_8250:
> +		regs->lane_regs = &lane_regs_sm8250[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
> +		break;
> +	case CAMSS_8280XP:
> +		regs->lane_regs = &lane_regs_sc8280xp[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> +		break;
> +	case CAMSS_X1E80100:
> +	case CAMSS_8550:
> +		regs->offset = 0x1000;
> +		break;
> +	case CAMSS_8650:
> +		regs->lane_regs = &lane_regs_sm8650[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
> +		regs->offset = 0x1000;
> +		break;
> +	case CAMSS_8300:
> +	case CAMSS_8775P:
> +		regs->lane_regs = &lane_regs_sa8775p[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> +		break;
> +	default:
> +		break;
> +	}
> +
>   	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>   
>   	if (c->cphy) {
> @@ -1160,47 +1196,15 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		return -ENOMEM;
>   
>   	csiphy->regs = regs;
> -	regs->offset = 0x800;
>   
>   	switch (csiphy->camss->res->version) {
> -	case CAMSS_845:
> -		regs->lane_regs = &lane_regs_sdm845[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> -		break;
> -	case CAMSS_2290:
> -		regs->lane_regs = &lane_regs_qcm2290[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> -		break;
> -	case CAMSS_7280:
> -	case CAMSS_8250:
> -		regs->lane_regs = &lane_regs_sm8250[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
> -		break;
> -	case CAMSS_8280XP:
> -		regs->lane_regs = &lane_regs_sc8280xp[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> -		break;
>   	case CAMSS_X1E80100:
> -		regs->lane_regs = &lane_regs_x1e80100[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> -		regs->offset = 0x1000;
> -		break;
>   	case CAMSS_8550:
> -		regs->lane_regs = &lane_regs_sm8550[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> -		regs->offset = 0x1000;
> -		break;
>   	case CAMSS_8650:
> -		regs->lane_regs = &lane_regs_sm8650[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
>   		regs->offset = 0x1000;
>   		break;
> -	case CAMSS_8300:
> -	case CAMSS_8775P:
> -		regs->lane_regs = &lane_regs_sa8775p[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> -		break;
>   	default:
> +		regs->offset = 0x800;
>   		break;
>   	}
>   
> 

Agreement in principle.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

