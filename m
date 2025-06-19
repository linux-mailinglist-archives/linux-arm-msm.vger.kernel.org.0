Return-Path: <linux-arm-msm+bounces-61816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19384AE08A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 16:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94A971892201
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 14:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC8221A43D;
	Thu, 19 Jun 2025 14:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bK+UQPn8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EE321883E
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343005; cv=none; b=Bs911Ic+XGYB5RyhWdmD08Hl5jsfDxr8Jjeh5lbSyKMF6XsTyjcAlIC/pRMXGxL6GxxncLi5E1pqv/YUnWkxi7FOey5AIFitwITFTqSuoAxTy050HESR05dMXuYbY01leRpgKC3CdKXxCL+wGGXMAPhoH7/sN9RDRGvIvxJcpJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343005; c=relaxed/simple;
	bh=6kzgpoC/6r42t3YE4N/s+jy2WCWfT8as0yTg6s3TFZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDLdrjAtET+M0S+cndW81JSwxV2U+7p7Z35TNRaWRbzgTtx71UKdsTVOo/eNC/vTMvEvq6zbXoQ1XNK4gpXTzwy4wc7VrN8Dg3vaUI53jMfQf02ZbXQdp0z8RTAXL8rTHaqpBmv+hL7oZ6cKSOd1MsyMFsM9sAX86agrrsYZZhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bK+UQPn8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a52874d593so818481f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750343002; x=1750947802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRuOPGj+1FvnFYpArdk/uAbPOCfkau6emWeICNDblLU=;
        b=bK+UQPn80TDUMaDAdGEP+Jnjqm+Phi18quF1sDStfxEotLI2IcwkfmrNTvEKWoKTX5
         MYXPkKtbY0XzX5pffEoUQe85bd6xC7Eq9NJRPCw6F2qPV71H/nnqZcdUaubXlBIWOSWz
         zEzcsHVzU88ym0mSE4uqKEUF156SLwL2uTIDIGkCst4j1yfMdORhL4EbPiX3yyQzRh/x
         uqRxQA/htu8pN4/lWGt2NzFMm6QPAjHSaS16PeyPLftcEz201a/6SbWOhEW7fXBaYy3H
         8e+ZQdCTDDjdYHK6QUuXYte7VZgBqzsmEOFQZiN7h8Hc1ecKlmj/URONo09b6uSpwJk2
         gdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343002; x=1750947802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRuOPGj+1FvnFYpArdk/uAbPOCfkau6emWeICNDblLU=;
        b=MuD2GxVral7c0VdoQgpsfqavLW8pR+aLsaHN/7bWPGIcMU55ZDgLwTyaGVhEOgFQTl
         N7jOOFLHmrNZ8qrZlwoExvoS2qT2hRuxXliRA4NaF4MuotN5WmjL7ijBbptRdXfic2G5
         FDgcMwAjkYd8RWmOwsFnscezX0LMo0h+fSH79/j3qIM+T7jFblCtvPB0KngWtdm4tVLk
         pUPhPd+ZapQg2YH5YLRtG7ikWJPrzluzdes+i1Wh5a7HlXp9fo3xA/IOKppv3v3cAheV
         mB4uWmr1PBOwBWPI1DW17UyvfniM6xR8Vcuq82pqHAegYFY0rRMGV1hu8xe1uxrBpWYN
         hzTw==
X-Gm-Message-State: AOJu0Yx9TH6xHJvwQGMFaTYm1SRpCYvAJzAJJEL3MYPIxzajyFBa1Fan
	BsBN6/wnQ5UOqAIsDD1qO8Updvj+gBrj0qfHsB+aqIwa8DLsbEy7BZStqgCkdeVZIXhb66a/n0E
	epSVebFQ=
X-Gm-Gg: ASbGncuk8x8rOqOam8WGkJjkJfRmF77nbH62TFr/GqjgWUbRTRCluXpJkbEh91klH6N
	wVjAlgwAoV/UTxt0QNWFGq/alqIpMady9dsH/J9LrS/eZLQgoYRaOHoe1oW2wIWCWdyf8z90Lxu
	Kgkj1WI4LjwXrsvV6qCRMyWcP71jSfXQk10m+litUkAJ27ZWSuzeBYZhZ4w1bQVOXslsREla2um
	X1jj4qJ7gVkI2tzs89xZ/uCkYASLUA4rgEarvUYNFEXoEJ6SiXHWgEEKl2ZGBgrej1i8JGScFbK
	HlzdcXZ+fJpDPH1PfxFBTJgaQDF6b8vh6Zw0aryoRbBFdvdI36ptuvxumOgZuOPk92H/KYLLep0
	CrCjWEKCCyE6Ih98gGwi60VRi+9g=
X-Google-Smtp-Source: AGHT+IHp+ZdhxuAAGQlqFZ4R4iZi67IGZtlL61Gzmpey7v/7Hirij3KEhOesLK5659xblWS4V6bLHQ==
X-Received: by 2002:a05:6000:2884:b0:3a5:2ef8:3512 with SMTP id ffacd0b85a97d-3a572373cdamr19566371f8f.14.1750343002467;
        Thu, 19 Jun 2025 07:23:22 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4b67bsm19368026f8f.83.2025.06.19.07.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 07:23:21 -0700 (PDT)
Message-ID: <620f9281-208f-43ae-ba38-4c3da04fe5af@linaro.org>
Date: Thu, 19 Jun 2025 15:23:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: venus: Add qcm2290 dt schema
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, stanimir.k.varbanov@gmail.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-2-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250619142012.1768981-2-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2025 15:20, Jorge Ramirez-Ortiz wrote:
> +maintainers:
> +  - Stanimir Varbanov<stanimir.k.varbanov@gmail.com>

I think this is the wrong maintainer entry at this stage.

You can ^should list yourself and/or Vikash, Dikshita and me.

Other than that, LGTM.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

