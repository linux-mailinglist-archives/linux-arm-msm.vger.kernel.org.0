Return-Path: <linux-arm-msm+bounces-82235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA4C68A0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D824E4E479B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6100430748C;
	Tue, 18 Nov 2025 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZIlT2ByV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8121A26A1B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458996; cv=none; b=WQH2sUqQL+BdTXEZxqZRCuSf1wA3/Js+hRXpgg5Vm6muWQqR2RL06UYnLTH+IxNrfegUMh+iJoRCIc4bZIamRksRRTRf7+RInjUnT9BR/IJyNW2w3czXPjkYuCLdX2yAUl0UMILRsvEZ/a1aOYEtaeGbKpArUyyd39hcpQu2v7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458996; c=relaxed/simple;
	bh=1SKTsuMZ09cU2qi7YSDt1PNXOc9+i0J0/0Ce2PFpCVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D2Jc83RP5tWLLas0Hgc2OD6XyTFbGOOcVt6dj5DfpXAuwA/rLcOWWnx4DBYsie1TEHrOVX9J0LYhYrnCH2PYG4GOEch9wLqxJbDe0dUpZR+0YsIz7iI9c7OjaWIrHAuqshtzsnu3o7Gcb9/JEGXP54pXondXcsmV7C3SwmZQrgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZIlT2ByV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477563e28a3so35843975e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763458993; x=1764063793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iB0FYmKAkv20ezZVBmoH4VVIfKxjQ8IHeyF2X6WY62c=;
        b=ZIlT2ByVDyD6ecIYWq103w3m2CVQeu8v4FJYHZwtkCV1/kVLG9wo0oLVi1whge+ZyW
         ywAEr1sYWPjOEZmcQcBC/c6nY+fdNp5Yjr2SWTM9p1gQRDtxUsvgRkpDNUVnHlQzj78U
         ALciZ4AVddctkJpvV5rKQNokwulZ0jvjrrQrk435ifrQRzRf4vuF18xGmFC+y9qHvFBr
         dquatW8jpcw1C96c2fSZGeZqrXt0k4VFr8lfO+mpZCA7Rr1EIoau5QR43P3+rQqc+oEg
         1YXtwq5C69hXp7duZj8N6gZXBsmqzJySl/RSAsCaITtF0jARvemGDz4t8tOW/Z5/JDfl
         DPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458993; x=1764063793;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iB0FYmKAkv20ezZVBmoH4VVIfKxjQ8IHeyF2X6WY62c=;
        b=mZNfwvNKcb+wPxMvEBi568fBdWHCPgUfPrsvcO+KiGAOiql233SzYcxx7Mr3yLT65l
         hIXgRR0JcBQlpxLtKgaT0zapGnMZDAPf6J5EYk5e3rXCaarS6vvPx1NfMyZ+bxjwFMdl
         nksZozsrh3GE6vjnCG1kqHxEb3pcYuOun3arLb5emyErYwLGsXOPcIs7twcSIdTafmZe
         qlB9EXo9Z1/0YlM642CWJCBDInh8ANySGNes0wk4ru6KBX/761pSRZZzzceWriKacq3I
         o6gl7ke9z13OHHr0gprascSEhhPrTWWIuwglVKKPjyh9PtBtMJVHCcPF7AhhqlJZuGre
         yi4w==
X-Gm-Message-State: AOJu0YwJLb3v0s2G5wSjcXHC+gTuCyZyIgliUlh4rTNNYID37PaVJPgw
	71SqUjrhHQCsTVzBzJcF5MdhavFUd9MPp3JmeYyAX9gkWFBjPUNKzFZ0pTPo2Epl/s8=
X-Gm-Gg: ASbGncsBuv8wo6I8ZpT4PTl+vxH3DowAwRKsrqxOajbnE2kCX3enJPjgOJv44zBCMNH
	R8v1bdO7mTSVTXJsd2tnYBk4eWuEY00yPf7HB5ZcM5e/QFprlGyZnG4z1SPs3pOPStjx1Vdi1Cg
	57IMez4eUbhkuF1LCQNgAQMNcSvLo9c7BVhPM2b+gWC1gE7imgdA2lpRQmbrHOOAbskfTKKhpAq
	45T2GN3uTWng2XJ16zEWj1RFX9UqdTQnJtynHr/JvFOUCjDek99zxlW+aAAjU/SD6uTHw3Omdj2
	YsUp8L13HVOwYKHLwNtBCjjOw8pgb+TeXi4AH30u9McuQQPufakTK/XxCWvqLhpuinUA4BO6/nz
	NX8Mqk82niWvQmumplO1uGYVb1buhVE9AONkMcbfYx4Mug2B5JhjPhlk347ZhBaCsBt8Az4Magc
	0mCwzc6y6Rxf6MoW/qW1xfBt51XQFNt6EHna6Dx6N2N9YPjSvwcBx0WX470jxbuHQ=
X-Google-Smtp-Source: AGHT+IHHdoFqpKUQLxIM3QeSwIPeudb1hZjwgw5UdoKIA0vKRvCW44lxSj82+G822eE3K7XX/YCudg==
X-Received: by 2002:a05:600c:4e8b:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-477a94fce0dmr24988945e9.14.1763458992803;
        Tue, 18 Nov 2025 01:43:12 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e35b7esm363766205e9.4.2025.11.18.01.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:43:11 -0800 (PST)
Message-ID: <79097e86-1570-440d-b18c-43b143f9ab54@linaro.org>
Date: Tue, 18 Nov 2025 09:43:09 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] media: qcom: camss: csid: Add support for CSID
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-4-1e6038785a8e@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251113-add-support-for-camss-on-kaanapali-v6-4-1e6038785a8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2025 03:29, Hangxiang Ma wrote:
> +			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
> +				/*
> +				 * buf done and RUP IRQ have been moved to CSID from VFE.
> +				 * Once CSID received buf done, need notify VFE of this
> +				 * event and trigger VFE to handle buf done process.
> +				 */
> +				camss_buf_done(csid->camss, csid->id, i);
> +			}

Somebody needs to have a conversation with the Si design people to tell 
them to stop moving this functionality around... its completely demented.

---
bod

