Return-Path: <linux-arm-msm+bounces-69057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C617B255A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 23:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 376DF1C851A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 21:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F342C2F39A3;
	Wed, 13 Aug 2025 21:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OFH2tCi9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFBD2F39A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 21:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755120829; cv=none; b=URqhJPxQ66dT0cAS6lNCLS4vphX6PL2eju/j3gKgMSwK3ouI4fXRNrnGE4gLppY/BWpbLzVaAuYv9XZ4jqbQHvK96EC+/49NGxPeCnHtiuUmRtBCarAR3i9vpK2IfEnQRO9CIPXPAPOUKwy7UUOp+H93U91wx7XiFogFlF3fUeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755120829; c=relaxed/simple;
	bh=uTx6cOJQtxOfCRA/41WV7CyIUJyXISfLg3bbXqEPSrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXM41tjUEKx/cY5vddWvvXgP5u0vJ/A/wZJLvlzOCCEqJiGadCDPBy+nSV2DmDr2iYxuNxPzP29w4TcY27os15qNM6gZv6Zq+HsjU8+KLHuz5qypSYzhb8TQLsXEbsSgaG0FSuzBnhHd/Lbv5k7gaK5Uk/kny14oxiM/+vA26XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OFH2tCi9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso1087525e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 14:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755120826; x=1755725626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcsR2lpNDjubFi27+my/+Mvy0uMimCUXPssMeKK9hBQ=;
        b=OFH2tCi9mQ1+W/+FczKPse7GMceU9IVGVn+0B+31sqL91iWd0eruGawnbmGTEmK5gs
         957nVTD80EwQQNA8HSeRNqJA60K2OVqc+9sJvY3Q5EzllRFSQEgK8xGLt1FOwHyq6fdL
         xZXVERSySw6OSj2/MGnowBvA5+McRuG6VeH4EnXA9sfWQjkprjRO/W9rzs8mLnEqz7gt
         1WkCzGoNlXuY0wJnho5q6HGK6LR/DMDTXeyfsgcXORTQYl/yOKxoTGOFyoVPBhWdwgSs
         YQvjfYqaA9KG6o/oWlorwvPm8dFaJYOhZp8/s8DY6xVV4XEbRQFzbP6DFuEUMPXoPCLH
         QhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120826; x=1755725626;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcsR2lpNDjubFi27+my/+Mvy0uMimCUXPssMeKK9hBQ=;
        b=dA5J6Q8m+K110HLQZPO2f0zUXmXBiT6dgSAVzhs/KqmVO6lKiJwEwQid5O1pErrNxp
         GJ+KP5XAnB48I+d0k8rfTNooK4opCCUphovoOjm7n7AB2DXqWyp3hQn1uYqhox0aVaua
         SA2+A6vPG8T07Ijxu23VrujfJ/AFk7r7joLQkiLsDyw1Qd3mi0M+9FJMY71eZuFCwX/Q
         jpm691k5yJS+xhwmkS6pCP1FJjeSTZciC80s/z7wunmOfu4VuNxLp355U00H0TQWQPeo
         AlzwQcbJ/EufbnM96GzSatcGrWZ/K8e/KiuZ46yMOFmybuQVIOeLEPHlODTb82+RGD3x
         ZMwA==
X-Forwarded-Encrypted: i=1; AJvYcCUcmLJ9BJhpM8BC7aeVgs88efnFIYNasdapOkLKp/0Wfw575ScvNHj+2wdeQMDYsnH5xH2c5AotwLYXZUz8@vger.kernel.org
X-Gm-Message-State: AOJu0YzORiP1bHJGEHgtdjFxWJLD19IgCnnUR15LSjlW0TBWqhQw8uqM
	Yn9uJIMg/woAnxIeCzbuwzenNF6kytFtcH7VKjB+MYuFgvhJ8Q1St90lq0FMK81hpYI=
X-Gm-Gg: ASbGncsUgm6EF29m3BPinZaX371LdeLHJATzKcdcTcLSXWRg3O/fdNwnsottuWFtnvx
	eOldMS3IVebMo9PzepOEzO+9KT7i+MSkI/CZh7DpIWDX2Yt7aNGa4u7nyOv5sQ4MvzDRd06SEf7
	wORjDnoTtM2gTmewJtVSei5CLRNwt8ygSwAv35epvD/SwWYVvql8jUkxGFRG55oWpnwrA92CShb
	724eIA6XlQzuq0yF/u/SXvCjfSO1uUOQUocCoPbdUaCuCekpByr9k4dUjwTb3t+lFD2p5jlBOwi
	5/1l7OdAsJt3harZmtnDomM/r49KhJ7h9T8UwYI/THgj3jXoIdHOWW09YEVVSVyXqZd2EvpZFVc
	T1ZQxpFEuAiC2rs2dtfSKHfFOnXcT/XUIJS6EzZcDYDvBYgHYCVIQXsaPw+9pdPj1
X-Google-Smtp-Source: AGHT+IFQrbl5wtElBhTcltssVqQElSDpYxXU1Tfejew44z/pIJJpOOHXcbKrIs4k71QsMA33PxUImg==
X-Received: by 2002:a05:600c:4708:b0:459:e025:8c5b with SMTP id 5b1f17b1804b1-45a1b674677mr2714735e9.30.1755120826249;
        Wed, 13 Aug 2025 14:33:46 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a53a5e3sm15602925e9.24.2025.08.13.14.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:33:45 -0700 (PDT)
Message-ID: <c467e3a9-2c67-4231-9d64-d64de08ec2ce@linaro.org>
Date: Wed, 13 Aug 2025 22:33:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] media: qcom: camss: enable csid 690 for qcs8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-5-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813053724.232494-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 06:37, Vikram Sharma wrote:
> The CSID in qcs8300 is version 690, it is same as csid used in
> lemans(sa8775p). csid gen3 have support for csid 690.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-gen3.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index fc6a9787febe..664245cf6eb0 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -45,7 +45,8 @@
>   #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
>   #define CSID_CSI2_RX_IRQ_SET		0xA8
>   
> -#define IS_CSID_690(csid)	(csid->camss->res->version == CAMSS_8775P)
> +#define IS_CSID_690(csid)	((csid->camss->res->version == CAMSS_8775P) \
> +				 || (csid->camss->res->version == CAMSS_8300))
>   #define CSID_BUF_DONE_IRQ_STATUS	0x8C
>   #define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
>   						1 : (IS_CSID_690(csid) ?\

This really feels like it should be a property of the CSID not of the 
SoC but... anyway it'll do for now.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

