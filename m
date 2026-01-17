Return-Path: <linux-arm-msm+bounces-89530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 418D5D3912E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 22:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 523E73005006
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 21:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05AD2DAFAC;
	Sat, 17 Jan 2026 21:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JkHOYd9I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A151DF73A
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 21:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768686344; cv=none; b=KXehHAtfysv1cLyVYhacAbN2O0RcrcIwh8veTjWzjy7OJ0aBmPsn/jxMmRs2RIL9X83iS0iS7IFoiPq4VVOuZmjoO8UXp4yOpUPjrrcMtEjY8bTLkHQgKVbehWckpA4qZPiErHQj1krXRzF11IvcwnNXUjAhK5TBI1O7W35zTYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768686344; c=relaxed/simple;
	bh=0uz81NtG/vkuLGFutGR+aZqXQZBLoZNngy5nYCQ664s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsxcnp21G+ChV47IG10j/gJyKVUkkV7Nyhfhh3ojM9jMPhddYTwcZz7tu9LaYrfmOrkJNDJdz0wFkjrWMowjuUxxnEQLohJFj5rZgD7mLAwytifEZMOBNfGoaGk8E0BUf1pbziwLCR+4QgnoJAWX1gaofFL7cTFKafzW5OdTMHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JkHOYd9I; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801c314c84so17471345e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 13:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768686342; x=1769291142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iKeeQEgigGP3fsz7r8SWZQKQz3VCZgZtDO1jaED0ANw=;
        b=JkHOYd9IxhzDrifYRDn6k6b2J6NkfOvukeY8uoS20HYGL4STIt8KkpU69T/9S3oOWZ
         AWJQlndagjSD6NVjMYyMR0OkDu+Ty3h1BEQgv3ek4kFV6Cc2lF69FoFaP61AiIaIjwY1
         LTy7UZWw90UJ6kNjBc3lcVHmSkkknkRE++xgO56XLsdud+7GtsoRcXNWGgZhDnccmApO
         ePj1sNkD5RbmuqyWpFtCSOd5ChHukyfQ8qNL+7kqwMxj5tlZjLBg0dBBPufroWrp7rKv
         qIfdl3kxIQQXkmBzqiYGGdv7lHtyoW9zJ1qnbB0gijUuaEcgXbW4iKKgi78Jvdaf4EwO
         8Pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768686342; x=1769291142;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKeeQEgigGP3fsz7r8SWZQKQz3VCZgZtDO1jaED0ANw=;
        b=wVXFCmH1De6ZYlJVGgWk4p+shstlO0SGpTcz82aIl2PTnDPuwYjVoETRBNJGRDCqvA
         E2cKXMVG+JFHSg1/gF/5Vqy8IHr8RZB1xwE3kqxjK6oTc5uGGYg1vxsj21NbJJdI4uVR
         kC93nIVkokG55CeozglZ+Sl0SK0rU1VVriqel5JarJFKTcBsrSY6OMveAeIHPZjsdCBH
         2jg4JS3XyjU2/6MfCcntRyAaB21FjdVVXVF9MsCeoMAunyCK/hpv9dUb5HLgHq42+aTR
         FSd6dCY4wwV/LwWmlZPTacXTEOTwUkkO1xWZIjX6sFtBCMsxzPsE/OX2aXWIWvNZi4Y+
         zQAw==
X-Forwarded-Encrypted: i=1; AJvYcCUJhj2lumjqg5zasvNExtZr/jNujdvcQWVukHd21nUuDv+tmpGKNZsupN8cSRvHXot8+0/7eK2o0GqGbhB+@vger.kernel.org
X-Gm-Message-State: AOJu0YyVh69D7YoSfe83jyyHhD3sF9T6J5HFeHM1AM6h2FDiB8+qoq6F
	g+7IUFIoqDceiXlFVh5sg/UC+txnlpCPNKieeqL6R8LJZZ6BUQCAuuoDNnvfnNJrH1U=
X-Gm-Gg: AY/fxX6l0m++am+VRGRiCQGXl1kQbpANsoWWMfLp5YHdv9aAfFIxRaRzJcHaTK6HHQP
	cxFBNsGkvY2BXp8Ic4A/dhXeNuok9YU8aXjdzuSo8x8v2AeEMU41z8lPGui7xkcYMcThJqP9ylv
	xNTwMFL1eeHq6YVI+5/ydMCPHQW4suHi9sUiWkh2+AqXZkXkjl1L3iVOLbe5sAYgPuDw0fvR7wX
	UfW51RkPyJYcj7luHdUOtETP1UNwfDHtpXDGNafH/peiLDo1UiFGl2LWduQtEPx0dduaYSmNXAn
	73owqQJ3lup1rVuNiG7VS0jkyYVnJ82ri40X1uUvo93AIwLin93/vln8cdCbqFaYGh1+UYXErw4
	z6sGdcofqH4QAuJNPZjzj5cYMoWkW25HiDFBUUHTLoIOT3k+7L7vtVlDAnirPqq6w3U4DBUEBC/
	8250fLSeXZyYA2RPhZgzHImnDt+oP7VUnIUJh1SJidtrNunWxbeV+S7o3PEgaJws0=
X-Received: by 2002:a05:600c:8b78:b0:47e:e8c2:905f with SMTP id 5b1f17b1804b1-4801e30a790mr89523405e9.8.1768686341602;
        Sat, 17 Jan 2026 13:45:41 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e886829sm111346115e9.8.2026.01.17.13.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:45:41 -0800 (PST)
Message-ID: <6fd412e1-31d4-4f8b-9aa3-e2d7423fca66@linaro.org>
Date: Sat, 17 Jan 2026 21:45:31 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] media: qcom: camss: Initialize lanes after lane
 configuration is available
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
 <20260117-qcom-cphy-v3-4-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-4-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
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
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 91 ++++++++++++++--------
>   1 file changed, 57 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index f3a8625511e1e..9e8470358515f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1048,6 +1048,62 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>   	u8 val;
>   	int i;
>   
> +	switch (csiphy->camss->res->version) {
> +	case CAMSS_845:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sdm845[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> +		}
> +		break;
> +	case CAMSS_2290:
> +	case CAMSS_6150:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_qcm2290[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		}
> +		break;
> +	case CAMSS_7280:
> +	case CAMSS_8250:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8250[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
> +		}
> +		break;
> +	case CAMSS_8280XP:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sc8280xp[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> +		}
> +		break;
> +	case CAMSS_X1E80100:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_x1e80100[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> +		}
> +		break;
> +	case CAMSS_8550:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8550[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> +		}
> +		break;
> +	case CAMSS_8650:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8650[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
> +		}
> +		break;
> +	case CAMSS_8300:
> +	case CAMSS_8775P:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sa8775p[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
>   	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>   
>   	val = 0;
> @@ -1119,49 +1175,16 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		return -ENOMEM;
>   
>   	csiphy->regs = regs;
> -	regs->offset = 0x800;
>   	regs->common_status_offset = 0xb0;
>   
>   	switch (csiphy->camss->res->version) {
> -	case CAMSS_845:
> -		regs->lane_regs = &lane_regs_sdm845[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> -		break;
> -	case CAMSS_2290:
> -	case CAMSS_6150:
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

Subject to testing.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

