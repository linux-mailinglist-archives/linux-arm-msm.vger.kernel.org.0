Return-Path: <linux-arm-msm+bounces-37704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C179C65B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 01:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 386D9B25580
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 23:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008B721A4D2;
	Tue, 12 Nov 2024 23:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xt+pz0SO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE0F20ADDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 23:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731454464; cv=none; b=SPZNlvHQe5XnMpJDx2wwIxbIxUbz0RbN4omdUDhCceIOM/JDgrscNc3ZgEuVj08ruklk2OhNH9Fj62hTyLWuKawc5J8LnbXlUaynqc/jZtVWPrBm2+g0/rcZ34p+NWb1afsrY8kwRZNp/0QcwJ4teAhCl+tq2paj/xUPgWrcEEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731454464; c=relaxed/simple;
	bh=V7YrvqMxBiDtu1yyjd5HTYFxNev9pFYFi/CbJHPn/GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7mWFr1pxb8ZuyjnSXjFj0NBOJ+WjtCzaqED/mbpmTgB1Y50exDHUfDcsH1l47eriEZM9GAYEGu9A5Kc3oXViu1WWf8X/KxYalYCh2sG34OYq5f/fv6CWggmQfCy/dh29KzlLZxBJNIO3TP5Xq2iBz9duyAwHnF2rE68tTRsYs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xt+pz0SO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so52735295e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 15:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731454461; x=1732059261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDK6Jpe2m/hfg4hQn4ofja0c9FU98DCMFpbVNI55NDw=;
        b=Xt+pz0SOjdIN95RcRiAVuhh3b0dx4jfeab0fNNmMVCLXCz8zguDUujXvHLBfbaLlNw
         yEZ+5dJp5isT327A3Az76TtVQ6eWFrfqi88eeltZcPpXpc4tJ6S49cGrNdhaRWp2bZcW
         oU3VycPUcBVJtXONPQ15X45LLHYnbFK/o2GPgdHnqNzFNK1b924wAV8gMxcLvqeaScDB
         DyjjgmPAu8RUl7aBE80V9OOyLRgHtq7Tt4TNjXATbaVlOJs7xtcuYvFDgwUskH/3nKmd
         l1FgDivKED0r5OERgl8OHW0TLSlD6rek1Rh/B1ZcLohcScfFGs0tGBnLhX14N8j401qo
         kRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731454461; x=1732059261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDK6Jpe2m/hfg4hQn4ofja0c9FU98DCMFpbVNI55NDw=;
        b=V59U15uDn5riXUaQQH7iBK+nb3PLzpqhEyMPip5NIGxsAX6Sn8bQ7OVitjq19G0GJl
         0l/RYHxUWasti3V8ypCbMi285yFEKO1GgNls/caRS2bnYY5yFVOY+TK9jkic0PKFeNVS
         +RJwfbDfUMT9RJt5xvU2b9vmbG9ExW2cGcqZlQ+zTEsdlkG3KVxDLXGGagyxgg9eidH8
         +cXNGJxProX+p18HQIg0OfnlmN6o3ONxLhxJCVj4ajf7h8HdWGMoj0FFq6s5UriLnkMj
         x5Y4Wstc3KrmiuydmqRlDIwlkoNW02BCTGK/qGWFpS6AJVUt4LEp+8t3IPDhyF1L5egM
         gnew==
X-Forwarded-Encrypted: i=1; AJvYcCWzCsnEUKNoBSlY0VwcvWXovloBL1wfM7f1uEb7z1JQip1iyexl+Q1yVyVBNlp/WvPsItuqKy6hdc5W4fal@vger.kernel.org
X-Gm-Message-State: AOJu0YxN5ahNt+6Dk7ZkurbdaOcorI9n0gs495lUnE/bmJIXMPoeYNij
	TwgyFWOm8vPeYBJHrghNVN6HlEiMiLeD52gvf6LAyneWboLjcrrWvpkBZdSk6KU=
X-Google-Smtp-Source: AGHT+IFlTjuNrbTGIsR+0sG4thfT19ptCWMJEbd2b1payDR1CxHa6BLA6qbK+uLJjTdl7xL7zRnAjw==
X-Received: by 2002:a05:600c:5125:b0:430:52ec:1e41 with SMTP id 5b1f17b1804b1-432d4ab80d5mr8680315e9.17.1731454461350;
        Tue, 12 Nov 2024 15:34:21 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d550c14esm2955535e9.28.2024.11.12.15.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 15:34:20 -0800 (PST)
Message-ID: <1cefe6f0-5d08-41a4-b0c6-2291dd5781ca@linaro.org>
Date: Tue, 12 Nov 2024 23:34:18 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] media: qcom: camss: Restructure
 camss_link_entities
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, krzk+dt@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241112133846.2397017-1-quic_vikramsa@quicinc.com>
 <20241112133846.2397017-2-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241112133846.2397017-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2024 13:38, Vikram Sharma wrote:
> Refactor the camss_link_entities function by breaking it down into
> three distinct functions. Each function will handle the linking of
> a specific entity separately, enhancing readability.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c |   6 +-
>   drivers/media/platform/qcom/camss/camss.c     | 196 ++++++++++++------
>   drivers/media/platform/qcom/camss/camss.h     |   4 +
>   3 files changed, 138 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 83c5a36d071f..446604cc7ef6 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1794,9 +1794,9 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
>   				&video_out->vdev.entity, 0,
>   				MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
>   		if (ret < 0) {
> -			dev_err(dev, "Failed to link %s->%s entities: %d\n",
> -				sd->entity.name, video_out->vdev.entity.name,
> -				ret);
> +			camss_link_err(vfe->camss, sd->entity.name,
> +				       video_out->vdev.entity.name,
> +				       ret);

So you're doing the right thing reusing camss_link_err here however

1. The commit log no-longer matches
2. I generally suggest patches should be as granular as possible
3. That means if you want to use camss_link_err in camss-vfe.c
    and BTW I think that's, correct then

a) Refactor this to be two patches
b) First patch is about reducing the repitious string and introducing
    the reduction in camss.c and camss-vfe.c
c) The second patch is about restructiring link_entities in camss.c

Basically this patch now does two things and instead of havin those two 
things contained in the one patch, you should split those two things 
into two separate patches.

---
bod

