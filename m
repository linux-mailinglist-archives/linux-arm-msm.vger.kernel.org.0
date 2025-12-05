Return-Path: <linux-arm-msm+bounces-84445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 431FECA7C9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B00031FCA83
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 10:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DAA8325717;
	Fri,  5 Dec 2025 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wIDmaRxL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB68309F1D
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764931135; cv=none; b=K8d5d6plW9VwwzvScoh3LBdmLn1ytw8hLmcfSUNBib0lGNtWVOb63gQLy5lJRf9TU+Yr8zYVTT0CN7RObf5CudmK6L88Rae/wC8LDBqNg7bK/o/Unu77Tk9v0agLaXNoAi54j7ZFRbaMzM8ySFMiTrgrYgE4Cj9Sj7fE52ZZgVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764931135; c=relaxed/simple;
	bh=7Ti0/hGGkcg6vgg8ymr8rwSgVKCe99zuGiU54ocDWAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Igt9s8dUC9TrnEc8NJY1hfi5/S5bJ0jPbMlpHJopHWL9/EBPfydxujVPZQDP8CwG8SseTh+wXpX0x2vrJCI+pGd+J9kA2JRQ4Vh2yFtf5De8CL6Xf3uFHxLzuWW1DTHsRpeqN/9vHUx2OMIFrZCpXN/UiuSCIXyZGRATK4pFijI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wIDmaRxL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so13200655e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 02:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764931126; x=1765535926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fk2Qe6UttCBY6LSv0m45hYHnxidbxniuJXbEECMv7UY=;
        b=wIDmaRxLRmZmtfvpWC8v9C8oFKrswPcglDTp0Uj0bJbjhlYvIIAGm6yncpWdAS9txT
         4/g1IVxSDaXapSvcKOHxPScqV4nGRmfFyOeZq6Ux7+SUPlyK3/i9q+vj/tMzDLxpG3kI
         Fn7yBexlS+sURVrzqwB/jfTBB2fomGqj5P+Kny+809oscQe8vlymxDjN2/tyXYzFMvYX
         u0Nkc16YDYdYL2OO3s7NlQrVzZ34DZT7UXJTOUDzLMxkEX2ToHmniNJFObvRgMSwFrrR
         y4oBS3NYRnlHEMjujPr7I4DoTyBN6iqYOy8rPGVGvpm/kT6W8qD+iW2dd1MEGTNV5yr8
         TBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764931126; x=1765535926;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fk2Qe6UttCBY6LSv0m45hYHnxidbxniuJXbEECMv7UY=;
        b=WtmQdiQLEBXQ+DMvjevS3LThdCEJ70SCOvef6Fu9TDX8mlJS82E92EBiy114+5x/Yi
         r0nJ9APBCja/rtqRXpuPcKSqXJzrWf+QWwZOe3tn+tPEgUfQHjbgvoo/3zK1nR8+3qAl
         +wA+RFxG3/sT0k5i67z6QiQ2LgqYr8YmuhbJtfF+MO+tw44uXAXuDNff/sEXBUxvMw2c
         ZHVPYRxuYUtk53ja0P2S+WRF5R3kc864bko1nLpGyuEIsGwnRj+f6wCKGXptGZSu9t8/
         2+mlYZpsO7pXtW3+im0QWh+v4QOQic8NEzF2DXwArQhN8bq/wMg52cCYr6wHLakJdyN8
         TXrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0nuz406jCgOXb9TV1vd61ESYYo/pGU6e6pQ0CeAyFDnDo4erQpLxOGof7/6RYZl8GN4Le+E7IaxBE6d+R@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj+vDIeE3jErAr++s3TNAEday5fZVyMkxzo/5NP+WXL1WyvQKL
	sDUhWDAYx+awAuFyKF9OBLVEbGwo4AY8CYAirNba55ImiEu9dbxWwx/1xPsabdVBZr4=
X-Gm-Gg: ASbGncvnY5GDFEAgrKgqaX6qp4Z6tySnLxGlDzL8dxALVgjHqIdS+S9o1/wfbg/zr6R
	OePOFm+Y6Lit13xZuVJ6tbQWJPvha0CjRnU6mN5JvDoJGxqfx2+R2y8DT001lrVtQwY5YjYRB6/
	0Bds6dZI3ZbaPzew8VDDdvchul5C5RtRJDcYiPaTOhUanOFwkm+x5wIJXavevKkw+yleqYPq4c5
	O8WOs6Ptrb5vLEC5Bn9DcEz7VBUnIGGh2Rjfla30QkQ4c10hgdiabaub6EBkz8YJnv4AG8eEoaB
	lMNoWNI4IU+kgr/YLEfe0MEii9s3pbODbhw9tD+Bt27EsRcbNq0shHKzhEx9hyEwKJG+2aMtx4/
	H7N3fRacyEUeqN1Eq/cBci3vuHEk7cEW8F/3YIxhlnOE4ATW9V1drrfZ//wGlwbYrTFWGqHXdlR
	4KQY+euR3Ni6gLjt6d+zjP50+AYA9V0uwk88gwOBsqJi+ELhU/7kZ1dtXkHQdb8r0=
X-Google-Smtp-Source: AGHT+IEniZY9x6ScJP/72sFnDswrZrFy73p5tN4uqWyYm+lhn3NmJsuyIGi2aQ1n3YuJ/2WMhpQq1Q==
X-Received: by 2002:a05:600c:35ce:b0:479:2651:3f9c with SMTP id 5b1f17b1804b1-4792f268a6bmr70857545e9.14.1764931126466;
        Fri, 05 Dec 2025 02:38:46 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311ed466sm72223685e9.13.2025.12.05.02.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:38:45 -0800 (PST)
Message-ID: <418e11df-1e17-46a7-813c-045a31d5c657@linaro.org>
Date: Fri, 5 Dec 2025 10:38:44 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 7/8] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2025 16:32, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Make sure we have proper lane registers definition in-place for each
> generation, otherwise C-PHY won't work.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 48 ++++++++++++++++------
>   1 file changed, 36 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 6d6dd54c5ac9c..c957f7dbfb243 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1222,8 +1222,12 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		}
>   		break;
>   	case CAMSS_2290:
> -		regs->lane_regs = &lane_regs_qcm2290[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);

Is this error possible ?

If so we want to trap it earlier and throw a meaningful error up the 
callstack to NAK the configuration.

i.e. you could make this function return and int and throw the error 
upwards.

But is there no opportunity to trap this error before this point ?

Either way just printing out something like "critical error can't 
continue" without returning logical result codes to that effect is wrong.

> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_qcm2290[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		}
>   		break;
>   	case CAMSS_7280:
>   	case CAMSS_8250:
> @@ -1236,25 +1240,45 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		}
>   		break;
>   	case CAMSS_8280XP:
> -		regs->lane_regs = &lane_regs_sc8280xp[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sc8280xp[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> +		}
>   		break;
>   	case CAMSS_X1E80100:
> -		regs->lane_regs = &lane_regs_x1e80100[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_x1e80100[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> +		}
>   		break;
>   	case CAMSS_8550:
> -		regs->lane_regs = &lane_regs_sm8550[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8550[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> +		}
>   		break;
>   	case CAMSS_8650:
> -		regs->lane_regs = &lane_regs_sm8650[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8650[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
> +		}
>   		break;
>   	case CAMSS_8300:
>   	case CAMSS_8775P:
> -		regs->lane_regs = &lane_regs_sa8775p[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);

You could trap this up the top of the function.
Make this function return and int.

Or better yet find this error earlier ?

Anyway rather than replicate the if (cphy) { do stuff } in each case of 
the switch, just move the error handling to the top of the function once 
and return a real error.

> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sa8775p[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> +		}
>   		break;
>   	default:
>   		break;
> 

---
bod

