Return-Path: <linux-arm-msm+bounces-79103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AD7C13207
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 07:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8843F189B9B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C3A29BDA0;
	Tue, 28 Oct 2025 06:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1n6JZwd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0577288522
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632671; cv=none; b=KUgMT8QYjqx2uzMDnjvZal+YMjVHsxIyqvsClxhstGgd5p2zEnxKx4K/eDCBE6rSAxzPZFr6IrbC5VPfZCKJzdBgqro0lZojk+YWccQ0l48R5QnPP/WDCWmwCDJ/JxTpSm8H0RSIPbMQ6jR3i1x95W95w/Ls1MI++WQtCoEF3Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632671; c=relaxed/simple;
	bh=0uYy3VEBlwctl3AQekMYkBOmduDP+jjiBD7nvoV/WB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3mnko+JWKOaUD43sjLZnSKGNwBTsvgCwseG8JR3z+wsofgbsuHvd+k5IFb3+JlQkYZf3k1ZLWmb/qi+jzBsIDxMNB882drP45jMlL8bpHiiSucr2q8qD8+20pGx+WN36Mt5qgktPXPRgkjZqYBja4JQQH37HRQyqj8awayIuYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1n6JZwd; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-780fc3b181aso3454300b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 23:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761632669; x=1762237469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdmp4Me7wQgWGSINcaaO6DB12X776uykd1AanqKsIrg=;
        b=F1n6JZwd1+cViSIl79XOCKqLOcd8rGP5zauQ4l85cfRHEcFDVgxVKqA9ohaJ+K9gbJ
         o9xgS3pJAltgd16KMYRFR+++9x/mEqcBSw7CeUA/LCN2JEh6tKRJjh+FxGnP6TY32stU
         5c0zlftP87JKM/JWJtfXvu3StXBCxXbGxPw9jhUFPoNgKbjItp+Uh050hMecdjxrTqWm
         d6m3oU40je3x5FBIEhsTucF76x3zeiJC6GUr/6WjSzydUx5yxx2n2RUhn7zo6YWqbmT0
         g1BX5fByYgBZuVJQVDEUt96eMhSjxVCG75SRQYpAqGbyJgmDYpcKYNB15ly8/ne1JZDa
         2E7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632669; x=1762237469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xdmp4Me7wQgWGSINcaaO6DB12X776uykd1AanqKsIrg=;
        b=WHgPfQVubrfaJAKf4CYI9v/K7p+Of4ONPC4MhCM0hUU3k1Y3eZxioTXFMi/cExKWho
         u4GTS0LPrLuXR0oCOh6czlSSbZ4nRo4VWfbRzrSy5Xp5naao3g/N+B8GrbHLRHkU13ML
         jbOXttmSkeuFjec4Nb1/sGfgtF/WbwTc8wAFLoBW+x9xJzYgMSmzdtYKXLNOYDmJQS4W
         pPxdwFI6muHPFgrZuPV/Bf2xp0CUswP4T2GNFUUyf4Ecc/elJoqD/8sH4GCvRenf+/Uz
         AimRwAa/kBaAVRiRODB/PC6fgPc+SnVgzpbFUoe435/sT7tO7fBnpl/XSgXG2cbenC3q
         a/Iw==
X-Gm-Message-State: AOJu0YzwD2vJohaM7vzwlRXEo/QlRLjlrfw7UPN5CMfZXYtgOKU1aXWV
	8C6y6EnmZQwpL5DyF5LR3pd+ZdQ9jzeRJCMvW+VweL/W1HTnSS1O3SEg
X-Gm-Gg: ASbGncvfhN2pZkjNvEgQkguu3DufJ0dwCkbzY/wsaDacroQkbIKjYWMgcix4hbCM7aG
	+7vSINTqTyUaDiuUJ79zApLv5PF2khpdrcZA8NGEs3IsZllmhbIUpitSsLGQgnBGGPgBlRQvsD4
	thv3Ox6DXtK8CB41TaSMdwqx2ZG4WmKoZyTu/QAj5bZHmW7sP8UJZ32Gk/OZbG5RX37DFwK6HYx
	L2QO1Cq2aVn93R5U7XPpHP45bEJLt7HXwOms4GlP5K4qp4K6L59dX8vErr5GrAUbGA11pKtLf6p
	RZrSnkmVr5B/AQJriMIusxScQJqyFdmnxZ+dSguJias2uh1q9SAgPNcCraDdZl0mofy9OrG2hQI
	f4Bwov+p/XQHFcq0zdXByu3Yb/sCopBwcCW+efSNyuWjCLFiWfSbDj2vcj5hqUS/vD2XDrxa6g6
	lE7qcE/b9/DeRPEDYsbpJHwH9maVuR5p+exGjLFKE5Peudl6zz3+R3/w==
X-Google-Smtp-Source: AGHT+IGv+D4wp24FT68CnJLR5oLyMpLV/E78aYjMLl1V6sgXD7UwHIdmxv8JaQ7oQ0PzT0e74dyMKQ==
X-Received: by 2002:a05:6a21:9989:b0:334:8239:56c9 with SMTP id adf61e73a8af0-344d3e45ee7mr3169929637.49.1761632668919;
        Mon, 27 Oct 2025 23:24:28 -0700 (PDT)
Received: from ?IPV6:2600:8802:702:7400:1c69:7897:d90:375b? ([2600:8802:702:7400:1c69:7897:d90:375b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7128e41a2esm9174084a12.22.2025.10.27.23.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 23:24:28 -0700 (PDT)
Message-ID: <49308ca0-ebd1-4915-9ef4-0a5e31793da4@gmail.com>
Date: Mon, 27 Oct 2025 23:24:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jesszhan0024@gmail.com>
In-Reply-To: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/2025 6:35 AM, Dmitry Baryshkov wrote:
> The commit a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for
> HW blocks") dropped all dpu_hw_foo_destroy() functions, but the
> prototype for dpu_hw_dsc_destroy() was omitted. Drop it now to clean up
> the header.
> 
> Fixes: a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for HW blocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jesszhan0024@gmail.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> index b7013c9822d23238eb5411a5e284bb072ecc3395..cc7cc6f6f7cda639b30bad7632c6e73aacedfcb8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> @@ -71,12 +71,6 @@ struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
>   				       const struct dpu_dsc_cfg *cfg,
>   				       void __iomem *addr);
>   
> -/**
> - * dpu_hw_dsc_destroy - destroys dsc driver context
> - * @dsc:   Pointer to dsc driver context returned by dpu_hw_dsc_init
> - */
> -void dpu_hw_dsc_destroy(struct dpu_hw_dsc *dsc);
> -
>   static inline struct dpu_hw_dsc *to_dpu_hw_dsc(struct dpu_hw_blk *hw)
>   {
>   	return container_of(hw, struct dpu_hw_dsc, base);
> 
> ---
> base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
> change-id: 20251027-dpu-drop-dsc-destroy-a1265a9b8d99
> 
> Best regards,


