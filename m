Return-Path: <linux-arm-msm+bounces-58424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D95BABBB87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63A3717BF52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201E326FD85;
	Mon, 19 May 2025 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="If2rhX/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A7B27464F
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652120; cv=none; b=eTWrY/DrJrRot5z7V7XpVnKoZzmzCU/3HyB/fSGhmt9fEsPebIppnZfM9FwqcAFZzrqxDLrg5sNASGdWCqERYWOhZAWOWkEJ8ByJy2rAokFLTpOUV8fMfk+iLjMU/VCvxVXoOnanwr03x23yWQ6b6SSLF/8zBg/V/mEnPK/b3YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652120; c=relaxed/simple;
	bh=PzfkeF67xi2GoMUYcGvqwEOhE8nFTMY+yeJf+y2fnOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbD4iONtaPuKyhCSglZ3o/fZZ1kEBdXcYaPMich0SEqIXkRRUaUczJ/uaG4Mszkd5GKlFHynzgd/lEM3XrZDnhZV5fgHL4frxTYeujyJT9HjvvyXcvvdQEVWQnuC0PnsvnJHrHSkPVw/tBrsCXQ77bO34fhbE/l7BZalypXyMPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=If2rhX/n; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so30183885e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747652115; x=1748256915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueJhJRaSbKSvp1WqYqL5yk7HRHK1xuho6oDidakstGA=;
        b=If2rhX/nr5v8PDP7bji+SCVMK+XXyBD72tweavL7Ip9meDI4Iv3NTfLO1VMrcSl+xs
         OQMLLOTaRpGMvUToyCypuVLr39FYyPkp4x2U6c2yyD44EwJTFoXtoKHnNTnHKL8FF6fm
         n+s+YEXQYtBgHiJw/ev97UNQJo9DOSc/feCVs0gdybUS7vUhRjB6oXQ8mW6i0hCfq259
         Plall4NOjo9LzAayS6jc4MrzOiNs3GST5yO1h71KUdeZhcJiaHwtqZeSYUfYFeqUK4+z
         KP5jKBSWu1qkRfc1zFTk2htUxQjnQ/8doolY7TfW8j4+AyZYBvmIyAXkuV7yRKbKTLdn
         CHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652115; x=1748256915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueJhJRaSbKSvp1WqYqL5yk7HRHK1xuho6oDidakstGA=;
        b=rhBB/G/CxyJtZDFTKGrjFHhBM7CE3d+LejFiJvaNMdxZddMPxi/Dxdt/P0bb4IQMG5
         5bGPHTwLJaZvMFasjQyGRWYrAyCCFZRJAfiuadDvsZp5EerFIPlGcJcLydiHn2JBXrt0
         pCledvDBSl7C6U++45WsJ0J1NzXh3kUDSsWmQg24GVfC86MUzTmMo4cI/JtMoIxSDSkD
         K8JZRnUE4/0DR52RH42kNxVNK1qT2BrZfrHMkNmpjnMHBpJKCZMdBxe9lDzN2dkTj3hk
         x9hEYT1NFYTNBmxCiGBIKjheS9vBgsKFkbNj6JhcwUo9Hd9By4sInaAG7quz1f3O7uwl
         W5Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWQAFZdV7/RZf3/ytWgRVIDSGyQSJJT4i6fo4oskvorjrqXh/SF6SsNmEIL1ERIP4l0SQmgPGWhvUa5Q6gM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8qVNZLtK5HgVRbmnqO6G2ZhCbloQ+26qW22DHCXrTzgxPV5YS
	qHVaxO9GmQihuIVa73M5cgfOisS6DOjZeOxUs8KF8Ig9xO3rAltDIlA/GuryF51f3FY=
X-Gm-Gg: ASbGncv/921dBJOi6f/iF/mdq9Pm46G2oZPZwjDCmJivUQr0NBAaFjRFarQ57gvjsOC
	qu8QNCzSM0+CesoMomOuHac+2c7PK3fGDGOVV9Ubu4HGYx5LFOtq+mNzlXqUyD7WvPyRsihNtbj
	pgYmaLTvH1rKkB4d1nkxujN/GfsJ8bVYblyeUZytF8TIUAfJpkdY8MtQcDTVT/Gug2YSo84JUSY
	oQ24SRDfrJEGK6dH0PYKZ1vglxBeJKYvJDUnj4y3JMaHjY81ewIoqIKnsju0D12k5PqGk4DMg1b
	W3y4J3JAfZhpnyPT6s35jNjETOCa6p9FBTapaE9Kqh0Wgj8p5PZdKRRIil2AAb1v+osy/Eh2gz4
	EgFCIZVmES7/D+4rE
X-Google-Smtp-Source: AGHT+IECzMkl/j8ndcEIBGJahHduWyX4b0BqqSZwZhjdHPF7JoURouc9w8pWFfoFilDuHYffnnZaZw==
X-Received: by 2002:a05:600c:c05:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-442feffb593mr113388045e9.19.1747652115507;
        Mon, 19 May 2025 03:55:15 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm166199545e9.17.2025.05.19.03.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:55:15 -0700 (PDT)
Message-ID: <88f6fea5-89f2-4128-a00b-dff760bc42b8@linaro.org>
Date: Mon, 19 May 2025 11:55:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] media: venus: Add a check for packet size after
 reading from shared memory
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20250519-venus-fixes-v4-0-3ae91d81443d@quicinc.com>
 <20250519-venus-fixes-v4-1-3ae91d81443d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250519-venus-fixes-v4-1-3ae91d81443d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 08:12, Dikshita Agarwal wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> Add a check to ensure that the packet size does not exceed the number of
> available words after reading the packet header from shared memory. This
> ensures that the size provided by the firmware is safe to process and
> prevent potential out-of-bounds memory access.
> 
> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_venus.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index b5f2ea8799507f9b83f1529e70061ea89a9cc5c8..c982f4527bb0b9f9ef9715c6c1dc26729f0fc079 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -239,6 +239,7 @@ static int venus_write_queue(struct venus_hfi_device *hdev,
>   static int venus_read_queue(struct venus_hfi_device *hdev,
>   			    struct iface_queue *queue, void *pkt, u32 *tx_req)
>   {
> +	struct hfi_pkt_hdr *pkt_hdr = NULL;
>   	struct hfi_queue_header *qhdr;
>   	u32 dwords, new_rd_idx;
>   	u32 rd_idx, wr_idx, type, qsize;
> @@ -304,6 +305,9 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
>   			memcpy(pkt, rd_ptr, len);
>   			memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
>   		}
> +		pkt_hdr = (struct hfi_pkt_hdr *)(pkt);
> +		if ((pkt_hdr->size >> 2) != dwords)
> +			return -EINVAL;
>   	} else {
>   		/* bad packet received, dropping */
>   		new_rd_idx = qhdr->write_idx;
> 

Yes, validating the pkt header against the expected/used dwords is a 
valid check.

One thing I'm finding difficult to do with this code is get straight in 
my head why we are continuously shifting >> 2 and then in the other 
direction << 2

Surely a candidate fragment for some rationalisation down to

dwords = *rd_ptr >> 2;
if (!dwords >> 2)
     return -EBAD;

I count six shifts in twenty LOC or at least four shifts more than we 
should be doing if we just worked this over a bit.

Anyway.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

