Return-Path: <linux-arm-msm+bounces-48175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F5EA37FA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BADF03A7ABF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D563217645;
	Mon, 17 Feb 2025 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OnKUXCsa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ACA216E26
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787311; cv=none; b=MjqJkb5zpjGeJ9HL1N1yrQggr/ib9c8AoJgigbuxfTwU6BIaAC0qYIFuHgcOPjrS5UFIllkeHX0JYcb+MZ7oHcHvPPmiDAFRwFX34YtBs9ZPb0xlhPD++zg1/8FXCHH1ZhmSt1TCio9X+/CybHqMJQ29gSebZHcIiklHN/GUcWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787311; c=relaxed/simple;
	bh=dne9VD/QMXtkETw4PANW+vEuOsy5CvmmIA/lPWWCUok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOU5/qdrvxJrCZ76ZVJG/nvUUeg6QbQL4MrTvh++p+lkqgfqCbuQjDZzcnYd4rHc4Z4WoQU6/kk39GinGHjs8ey/vPO1Ww61ubWI+7EC7FTXnH6hSushtgEZJX/y+7eUcWKq+tMktYR6Ag5r5Ul2hUSI+JZIrF7v0EIFNIL3MLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OnKUXCsa; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4396a82daf5so26873355e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 02:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787308; x=1740392108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ftkNWd4c/YelArxk10BfYvoCsFMdXg1/IszoU/W8X0w=;
        b=OnKUXCsaGVCVjOtbvQmhFkEDpTIauIgp9BBsJeLDPHiMbeJFZ7WqUNncW1eTIpBAon
         K4OXEHJBG+TkhjODq/uy2B7vLhAa2XgY50l7kmzsBApqXDCXelinS6xVRNrq5S9bJtEZ
         84/1GKY2gVwMuZob+HgcMh2G5z2OkNf+KC59YmUHcScO0UuSnfcleSyDzGitOfCvI1U7
         A4hiQypJ1CyT8h8Ad5Ekv9oLRe/TZQ2F95gvTLJswSz3t5kH6if2W+devUzx1fuVeMzO
         ba8t0atTb8oA4YPrai/bcoXZ2NQWuqL0672fEhwOHEucE4axY9u+GLj32Jnud3+ktZdX
         SZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787308; x=1740392108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftkNWd4c/YelArxk10BfYvoCsFMdXg1/IszoU/W8X0w=;
        b=XiyjLQ//SI8xnosX/Lj40gtgq35xQM2qsCWtpucBA2ypNqGqXAzi/iAfMllrefzbfw
         9udZ/0PFN5c2L6gRdPaA3iZCfHABUW4aCfqM+yOhFULnnd+q6J2E+kwsKRkNbY2Bg7e/
         g4isDY+PT65sZJAP/XbE8OUjkbb7GSNnlSa4XbioSx3meTQ8Ul3X3OmXm4sKqBV83dTo
         aGOsqep39sCKbNZIj87g6674IcxqJlYcxZQ0DPQw+jQxY0Jfz0ope5pnxIgK5k/No3nG
         0xNnu5CigQi5qMFALjI9qPA2dUG8xietfbWRc9xokc8TgLrG5pLc3kOggf4DQbnl98qm
         8o/A==
X-Forwarded-Encrypted: i=1; AJvYcCUUyurOUyRdM3nVD2sOTXBvF+yclOpWyhDO+HdONErAoSDfpwm5iCprPEHm+Lt5pFsCikb3+xN1W2ivjXr5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdq6EUkhhKoI1s+c5L0aqe7bC7Kw7iCEYWQVDSmPtqP0wTIzSC
	cpaskIvbpTx+Jkua28ssD34lRSsSWAfsduICyhPKn3ko+C9ZepiuU2p+2s/oXRs=
X-Gm-Gg: ASbGncvhhrT1u9ux9gnPdn1BFupVieDhOcuj74I/0oN+ksawg4gbhRy6FzkAOdXggiz
	pSFmulvLrYNhlJypgkBRAe+UcY827it9lLUl6zUDtWw/58DAhTm1eDl2c6Y9lwWGDuv4SoBOCRy
	QJJBcR7jaQssCRBOmX9ula23DqSFRLuNsY6G07XiGhjrJlWJGND6uT0FtlyjTKHV2NIMSjgowaF
	rFIoHt2oXB+TpIrPVaB5y0rPgBG0vzLySq55qCg5CENhhDwK9n8Tk0U7KK7QgFDtF9VL8CFvDaL
	Q2t5nRn9x8t3bmEzfGYX/hb9J3BLgF1t1w==
X-Google-Smtp-Source: AGHT+IEpVM7jAz0OITQltGV+w8fg/KzsWnLxTrTeGkfCPWadT3WQy0gOqvx9NNKzCHvWx8Ds1hAgBQ==
X-Received: by 2002:a05:6000:1f87:b0:38f:2297:66d6 with SMTP id ffacd0b85a97d-38f33f4e64bmr8700351f8f.52.1739787307716;
        Mon, 17 Feb 2025 02:15:07 -0800 (PST)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38f25913f5asm11991928f8f.52.2025.02.17.02.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 02:15:07 -0800 (PST)
Message-ID: <ed1952e4-697f-40e1-a878-d8f9d34f3176@linaro.org>
Date: Mon, 17 Feb 2025 10:15:06 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] nvmem: core: fix bit offsets of more than one byte
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
 <20250109-sar2130p-nvmem-v4-1-633739fe5f11@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20250109-sar2130p-nvmem-v4-1-633739fe5f11@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/01/2025 04:35, Dmitry Baryshkov wrote:
> If the NVMEM specifies a stride to access data, reading particular cell
> might require bit offset that is bigger than one byte. Rework NVMEM core
> code to support bit offsets of more than 8 bits.


If the plan is to support bit offset above 8 bits, please update 
./Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml to 
reflect this too.

--srini

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/nvmem/core.c | 24 +++++++++++++++++-------
>   1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index d6494dfc20a7324bde6415776dcabbb0bfdd334b..7fa85b0804db360035d7471002dbf79658d5830b 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -834,7 +834,9 @@ static int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_nod
>   		if (addr && len == (2 * sizeof(u32))) {
>   			info.bit_offset = be32_to_cpup(addr++);
>   			info.nbits = be32_to_cpup(addr);
> -			if (info.bit_offset >= BITS_PER_BYTE || info.nbits < 1) {
> +			if (info.bit_offset >= BITS_PER_BYTE * info.bytes ||
> +			    info.nbits < 1 ||
> +			    info.bit_offset + info.nbits > BITS_PER_BYTE * info.bytes) {

>   				dev_err(dev, "nvmem: invalid bits on %pOF\n", child);
>   				of_node_put(child);
>   				return -EINVAL;
> @@ -1627,21 +1629,29 @@ EXPORT_SYMBOL_GPL(nvmem_cell_put);
>   static void nvmem_shift_read_buffer_in_place(struct nvmem_cell_entry *cell, void *buf)
>   {
>   	u8 *p, *b;
> -	int i, extra, bit_offset = cell->bit_offset;
> +	int i, extra, bytes_offset;
> +	int bit_offset = cell->bit_offset;
>   
>   	p = b = buf;
> -	if (bit_offset) {
> +
> +	bytes_offset = bit_offset / BITS_PER_BYTE;
> +	b += bytes_offset;
> +	bit_offset %= BITS_PER_BYTE;
> +
> +	if (bit_offset % BITS_PER_BYTE) {
>   		/* First shift */
> -		*b++ >>= bit_offset;
> +		*p = *b++ >> bit_offset;
>   
>   		/* setup rest of the bytes if any */
>   		for (i = 1; i < cell->bytes; i++) {
>   			/* Get bits from next byte and shift them towards msb */
> -			*p |= *b << (BITS_PER_BYTE - bit_offset);
> +			*p++ |= *b << (BITS_PER_BYTE - bit_offset);
>   
> -			p = b;
> -			*b++ >>= bit_offset;
> +			*p = *b++ >> bit_offset;
>   		}
> +	} else if (p != b) {
> +		memmove(p, b, cell->bytes - bytes_offset);
> +		p += cell->bytes - 1;
>   	} else {
>   		/* point to the msb */
>   		p += cell->bytes - 1;
> 

