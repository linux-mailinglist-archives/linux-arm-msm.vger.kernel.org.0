Return-Path: <linux-arm-msm+bounces-21533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0318FA623
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 01:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D055DB23C4E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 23:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EDA82D7A;
	Mon,  3 Jun 2024 23:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UbXLYWI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C3729CEC
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 23:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717455734; cv=none; b=i4S69GEjD1cut/OEgXR51Z0cH+6mog5QJ2SJkmgSrppFXugDOq8GLD59wqWp7FGaZg6ye0uyTFGXzNGqjsWCCU0caT2elyLm0JcP1fJDQ9PLuwLoEWz4MZZja4o8bYNZxrzdnXi8TNv645km6gJyYhEkdL0/l7/9jQPXfh5HUl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717455734; c=relaxed/simple;
	bh=0jZi6KDIf1K2W/UDkvFfqguppsND1IA8K+Mx7olaYcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/5ZYaye3GlTsSpL/ZMkEckzUtzhhlrYdz1I52Izz9LwPkTgJy4LIwnnIO7QS5d/hHP8UiJ6RUPYGP1RWXtUDkIP3IHUFKlbz3A1UH31Cr6jGe1CybDG7VSSjWQaopEjaZ9fwNBk8SePq1EildeRX9GibDQcuQyYn9koUo0jMcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UbXLYWI2; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-42125bfa28fso62839425e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 16:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717455730; x=1718060530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kSyt1luXPfolxaJFzIiXo2v2aq7LyOeBXFD6yzHDT/c=;
        b=UbXLYWI2bSmCik3AfdH4ORblsXmoxXBJdygmzYrHyxZzDRHcXc3ND10OD1CydyK0Em
         avASTW01PwupE6iA+h7KDWWbg9/hcIgjIF0VpZvaa6LvBEJsL186abIhVfKJzC4ITsoK
         vazI+DeU9oi2DnnkkGrlOLOsvNjeex4ac8Lqj5bTOiHvYTnJdYC8VQiVfDFwPsgLJw/L
         4MAPey1diXt1vn0wVlI8P/B+i8LNdZwY8htjcwIU1QHDSReoxz+ZlBQDlcTbyuDq+u5h
         pIIwdmQsCIPs4nt1iRNUcxb9Qoe1wjcOaYVIpjFULQXa46SvqL37XsO4rhjKG7wfcurz
         zIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717455730; x=1718060530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kSyt1luXPfolxaJFzIiXo2v2aq7LyOeBXFD6yzHDT/c=;
        b=Lt9Cd9JA/dUd0v9sCn5AfftVIXc743WloJIHg1QhJhxtqDu/cnJMDd0CjbEi/dgFlH
         JX24Oc78rNG5WUvFw6QIpHXnQWCgzAVwK0ayg58fLy+AXve5pueq7NTWthGvVQIMOF8S
         RJDsIHNhAY2J7z8KJ7vGXyyn6t83VD+ZBKtmhFOMWMPX3JBVwL0O60hZyZGhjcsJ+w6K
         suM6SUarzEvmcL6EO9T6CgEdbzIW6TC94iALpZ+iiH7is4FbnC/s97gq/cl1tQzOxL1a
         NpHi8WQoqag3wsHiLyXHEPjWE5806CpP2veDdy2L9y9oFmFNhISZ8kPVqSRIx349+96L
         8Bpw==
X-Forwarded-Encrypted: i=1; AJvYcCVebUtqXrbj2SCKLPHIGc1uM7LY0QOXA4jYsrUoMhKuxS75OblStEdYO4xNmC7mskBt+8xlBZWjwcnUm02fBOMqg8eSQBz17BjiXqvFAA==
X-Gm-Message-State: AOJu0YygYvmDosP/loAWqCi71PZjb+5mXsbyn05eEwtwLDVi5OE0V9XU
	tNOOqCjVr+aCFNMtozejlAF8K8eaw0LVfGNCJKQ72X6wZoR6s1L8L8UURLdozMY=
X-Google-Smtp-Source: AGHT+IFH1dqVFdu0WORd1M0vWphzQ+CUSs7JJzkjEEqfH4oyoXjfHod5f+1x+jjn72SC3LPFAx44cg==
X-Received: by 2002:a05:600c:4f0f:b0:41b:f116:8868 with SMTP id 5b1f17b1804b1-4212e0502e7mr105289885e9.12.1717455729708;
        Mon, 03 Jun 2024 16:02:09 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4214ecbb563sm82895e9.21.2024.06.03.16.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 16:02:09 -0700 (PDT)
Message-ID: <0d254b5e-0dcf-41c2-949e-2edd880b2de6@linaro.org>
Date: Tue, 4 Jun 2024 00:02:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: Constify struct dec_bufsize_ops and
 enc_bufsize_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <9bc4b24a55c42fa49125cae0304c8b0f208550b1.1717313173.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9bc4b24a55c42fa49125cae0304c8b0f208550b1.1717313173.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2024 15:27, Christophe JAILLET wrote:
> "struct dec_bufsize_ops and "struct enc_bufsize_ops" are not modified in
> this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
>     text	   data	    bss	    dec	    hex	filename
>    12494	    822	      0	  13316	   3404	drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.o
> 
> After:
>     text	   data	    bss	    dec	    hex	filename
>    12766	    566	      0	  13332	   3414	drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Changes in v2:
>     - Add missing prefix in the subject
> 
> v1: https://lore.kernel.org/all/9bc4b28a55c42fa4a125c3e03d4c8b0f208550b4.1717313173.git.christophe.jaillet@wanadoo.fr/
> 
> While looking at lore to find the reference above, I found that this
> patch had already been sent by Rikard Falkeborn <rikard.falkeborn@gmail.com>
> See: https://lore.kernel.org/all/20211212123534.4473-1-rikard.falkeborn@gmail.com/
> 
> So, if applied, credits should be for him.
> So feel free to add a Co-Developed-by:, Reported-by:, Suggested-by: or
> whatever makes sense, including removing my Signed-off-by: to put his if
> it sounds better to do it this way.
> 
>   .../platform/qcom/venus/hfi_plat_bufs_v6.c    | 20 +++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> index f5a655973c08..6289166786ec 100644
> --- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> +++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> @@ -1063,51 +1063,51 @@ struct enc_bufsize_ops {
>   	u32 (*persist)(void);
>   };
>   
> -static struct dec_bufsize_ops dec_h264_ops = {
> +static const struct dec_bufsize_ops dec_h264_ops = {
>   	.scratch = h264d_scratch_size,
>   	.scratch1 = h264d_scratch1_size,
>   	.persist1 = h264d_persist1_size,
>   };
>   
> -static struct dec_bufsize_ops dec_h265_ops = {
> +static const struct dec_bufsize_ops dec_h265_ops = {
>   	.scratch = h265d_scratch_size,
>   	.scratch1 = h265d_scratch1_size,
>   	.persist1 = h265d_persist1_size,
>   };
>   
> -static struct dec_bufsize_ops dec_vp8_ops = {
> +static const struct dec_bufsize_ops dec_vp8_ops = {
>   	.scratch = vpxd_scratch_size,
>   	.scratch1 = vp8d_scratch1_size,
>   	.persist1 = vp8d_persist1_size,
>   };
>   
> -static struct dec_bufsize_ops dec_vp9_ops = {
> +static const struct dec_bufsize_ops dec_vp9_ops = {
>   	.scratch = vpxd_scratch_size,
>   	.scratch1 = vp9d_scratch1_size,
>   	.persist1 = vp9d_persist1_size,
>   };
>   
> -static struct dec_bufsize_ops dec_mpeg2_ops = {
> +static const struct dec_bufsize_ops dec_mpeg2_ops = {
>   	.scratch = mpeg2d_scratch_size,
>   	.scratch1 = mpeg2d_scratch1_size,
>   	.persist1 = mpeg2d_persist1_size,
>   };
>   
> -static struct enc_bufsize_ops enc_h264_ops = {
> +static const struct enc_bufsize_ops enc_h264_ops = {
>   	.scratch = h264e_scratch_size,
>   	.scratch1 = h264e_scratch1_size,
>   	.scratch2 = enc_scratch2_size,
>   	.persist = enc_persist_size,
>   };
>   
> -static struct enc_bufsize_ops enc_h265_ops = {
> +static const struct enc_bufsize_ops enc_h265_ops = {
>   	.scratch = h265e_scratch_size,
>   	.scratch1 = h265e_scratch1_size,
>   	.scratch2 = enc_scratch2_size,
>   	.persist = enc_persist_size,
>   };
>   
> -static struct enc_bufsize_ops enc_vp8_ops = {
> +static const struct enc_bufsize_ops enc_vp8_ops = {
>   	.scratch = vp8e_scratch_size,
>   	.scratch1 = vp8e_scratch1_size,
>   	.scratch2 = enc_scratch2_size,
> @@ -1186,7 +1186,7 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
>   	u32 codec = params->codec;
>   	u32 width = params->width, height = params->height, out_min_count;
>   	u32 out_width = params->out_width, out_height = params->out_height;
> -	struct dec_bufsize_ops *dec_ops;
> +	const struct dec_bufsize_ops *dec_ops;
>   	bool is_secondary_output = params->dec.is_secondary_output;
>   	bool is_interlaced = params->dec.is_interlaced;
>   	u32 max_mbs_per_frame = params->dec.max_mbs_per_frame;
> @@ -1260,7 +1260,7 @@ static int bufreq_enc(struct hfi_plat_buffers_params *params, u32 buftype,
>   		      struct hfi_buffer_requirements *bufreq)
>   {
>   	enum hfi_version version = params->version;
> -	struct enc_bufsize_ops *enc_ops;
> +	const struct enc_bufsize_ops *enc_ops;
>   	u32 width = params->width;
>   	u32 height = params->height;
>   	bool is_tenbit = params->enc.is_tenbit;

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

