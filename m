Return-Path: <linux-arm-msm+bounces-21532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CCD8FA61D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 01:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18E7C1F23A83
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 23:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB677839F7;
	Mon,  3 Jun 2024 23:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2ztZNZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199D35028C
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 23:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717455703; cv=none; b=OVCY0fMdBco0o9VIDc5J7/NotUzs6igpWwDhBGR2EBaF27+TV71OAAX6GYT/76xfP2N+fOLT5+YOrLHCm7ZkLLU1VhjZWV0UlvZw21irOzwe2BQTnA2caPxgM5sRKjGwUbilOwoBYpg/kEsQ0ZQXCm1W1fpzeohDmEppkFpt3S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717455703; c=relaxed/simple;
	bh=Qo4ylDWHCKBDpGUaTOGShTLPUnG4DbAeLHxJqlni0ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qm7We16TFgakMik+RmxPyvi7YOiqRRx00qS0Dn2pYdd9zMZNY5I5UKHvTo/FxvXbEipfCqtk5L9xaoCVIEPyuhUwRUEhKKDaLX60NoL3WDHzqzm+E51Rx1ytCG6t061qtVtrlywZEv5FsgbHNk2WKU/eurXFoTaej2YZaNTxEKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2ztZNZC; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-42125bfa28fso62836195e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 16:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717455700; x=1718060500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J1iDRH/Hpo3TypBtE8AeJr13ufvedDoMcC4PukyspSI=;
        b=C2ztZNZCliIs/ZSrT0hzV+VF8GvWpLoGQ13vy/3jlPsSvoyv3EV+ltI/UobKPwcwjs
         OoV7fbEcFIuMyaq8rl0FFMVndVzGXF7dYkHyg9xECmgHcbjJp/AyP0a88Ofx8/wjxhzp
         vdQmQ7VFWqsxfwnRc0qEDb7NpvW7h3h/ECLOMgQEcDxigXHeO7CmUkaVvnS5jQhCuBym
         L/wN/kwOxF8s1/60cFZCxlqWttfLdpgqoCqDyLBjjaTJB9enP9JVhBOlrnkk78tpedKz
         t8kYMBnYQKAsE/2USsdCYW3vbYYjL8Vi4ydrr7SF2mOBl1TAsiWNoJCZRM4N934+NGUS
         91Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717455700; x=1718060500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1iDRH/Hpo3TypBtE8AeJr13ufvedDoMcC4PukyspSI=;
        b=dfzq1YjBy7zhOak7sPMbNG8L5bcaiF84C6uYPwE5JJx9kCjUmKKgrHOXS3YI91prS1
         mi2qez/LRpos185uSibZ+hH1aDhb7eb6Ko01hXQasc3fe9Ylgl5p+TywXrkwI1BtFDPx
         FTaGmEVoM4a8yjO9Vrr8zEQTpEG4kbCFmiI2+vO80JBrIVVem+pOrVGdCBrCMh9ywJeq
         udbwFqZjQxCaSynLoWbower+iRx+PLsLiplTrbiumd+GRbERUuOglyRq01O+JbZOXn7o
         vgUSpf/WzonIIYIhnq6Y+o+dkXVCN7Mm2isJqLyINaWuirr2yjvBwmEnBWAnCea7eNgW
         KvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0FOkX8ZCYxoOHvAEJ7KMh4fQ/IUIB2mtzLUAci2IEtUEj1A2CL0WSyF7JvsDeQiK3biNJK8xD/RVeUbZSSvgUpb4FPBfUUyNsIrjqXQ==
X-Gm-Message-State: AOJu0YwQL1GYA2wXvKmOQ+BIw4xGjN+vkTr/eYsIHI/C2Pto+gj1zOvP
	ip8DR/jyzXuEw1yeWH365D7OHgstWODz2Ce8Gl0LTtiHdDyH1vO9nPYHpZ/RC3k=
X-Google-Smtp-Source: AGHT+IGhXTioXRyealCIteCy2/hNRfcH/xTXI+2nFxC4USmBjCi67rMfEgRNKtv2TokNUdou6KOusQ==
X-Received: by 2002:a05:600c:5248:b0:421:4ecb:bd68 with SMTP id 5b1f17b1804b1-4214ecbbf7amr132595e9.31.1717455700327;
        Mon, 03 Jun 2024 16:01:40 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42129de0cf9sm148954215e9.13.2024.06.03.16.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 16:01:39 -0700 (PDT)
Message-ID: <aa3170c8-5bc3-44a8-a623-8558dc60e803@linaro.org>
Date: Tue, 4 Jun 2024 00:01:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Constify struct dec_bufsize_ops and enc_bufsize_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <9bc4b28a55c42fa4a125c3e03d4c8b0f208550b4.1717313173.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9bc4b28a55c42fa4a125c3e03d4c8b0f208550b4.1717313173.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2024 08:26, Christophe JAILLET wrote:
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

