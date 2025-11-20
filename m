Return-Path: <linux-arm-msm+bounces-82675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BD021C73D91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 13:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 345ED351970
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 12:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2E032F774;
	Thu, 20 Nov 2025 11:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NpaJjxLB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8C42E54B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763639997; cv=none; b=fXQhkKkdxFqU4a+krNRK02UclCDGXHGLVHt0sqYibcbtxhXUofOWrnYSY8zVdKAjHfnUU07MqxHBK5uGcv1UHtO4t9hP1WaueoUzT4Yvx6Z7CasT17uDgGcSpednmNOi2OJeR+znwRh2J/zG9dT3ENIXmE2IiFD+YYsEsDYdfYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763639997; c=relaxed/simple;
	bh=+27EvZGUU7fLobI1Iluq1zH5n6l0zITHqKByAvvXcsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxjzwAGsz0ATnlKH9gFdhkizIPFiA1bovTg1tl0E67pXb/34XbLx8j22YGygdCTPnN4i5c7q5mpvFKZGuEoX77CX/xMDumCKSjPkmWVzvE04qKcGlYROXZrCvTE7Q2V6lDCR0wB6WnNxGN1UvjYHeqwVLGgJLZfL3t/lBMLW5XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NpaJjxLB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b566859ecso708494f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 03:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763639994; x=1764244794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dgb2r86YchJG8dMU5ZJNdIhsSzyhyNbVEjatHJ3Bhi8=;
        b=NpaJjxLBZt9jTS7TJCW7DtGed6Gi4dZ7Eh1k3OdEB5ntqJN9Shgm9qxoaRTODKLkh1
         6FS1wnSCxytzCmlFZhRc4vkbG4dmlcjHzF8/7+mK6fLNDHP7Tm0QBcx2A7zkD+B7dP0a
         eiHcEM2Q9MzwNKqzA6MAVgZZXvu9WAYfTsPEs3ic7mVg2jaAue86e4Wt469mkX30LbAU
         Xvm9b6VMIpwKnhWGV/Bh2n5K4Sfu/w+eoQvBPnoSgGeKD28cH2N36Uda0vQiRLbwHbLM
         nJ8YKM84bdV71TOb0cHq6gSdowe2clB7780mAoQcA17HaJtgaKu/YepaKGdtS0EYzfDY
         LzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763639994; x=1764244794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgb2r86YchJG8dMU5ZJNdIhsSzyhyNbVEjatHJ3Bhi8=;
        b=nY4tcjRkJPBOU/YVYrjv5n+bqHHTQhOQ2JqXHabRGOeEDtibUqZg5Ooedbb0hkWddh
         +Yi2BhL66kZMw57C5Yj2VJjxIiVbw9wwzrTB8EUNVow9OxPH/GXZkac1xJdJx6AvpJok
         ZwuwAAQLUv51REA4CZ9ndaRBbqHeviYaOXnrgkaUqLX71WIsofEXKjTg2D/i2qLlNGRH
         ziFGr4/qJ1XHnA6DtvrVmAEfPbvuiGCSBtolSWJERsfCtb9MMSZpyHLcIzUVdtOUXwRC
         MA4SAYsWYSC3VEUvZuO3oWBpnQxYVjWEIuYIwK/IUKI88mqcZ+e0QSjaMGKbyL/wWzY2
         xZAA==
X-Forwarded-Encrypted: i=1; AJvYcCX/zi5Kz8eWstA6CNkkagp+Vej3CkXJtlqneIwl5k12bW1ReNXN3U5gMRuLFUyVW8tsU4ezVoEA8nuYxjJp@vger.kernel.org
X-Gm-Message-State: AOJu0YyJd8kx0rFpTO8QcHQx5oHNZfTRr0xrcjtHOiNLdhvWjVMrLD0h
	wCasZYU9ThwFqHYw+lMGtc5bchETcOKtBYRKVXMiqh8wy9XaGUz1maP3d/VCi91zLKA=
X-Gm-Gg: ASbGncs+ou+wSbaCxRv4M5dN5YCkiCWHMV4RW3/Z0vzGDNu2PFlBu3Ev5IrUvAs7Hcu
	BdWfQNjzhJgjKxOHqWZO3MvrP9lMNZXg7p578spazUcMCXMbP7X7qFTko1/N5j77YDyWstPDiQh
	1LlGpNSmeb4G+5XBYq4FJx6NmAVShaI2Qi23LQ6i/iKwdjtTWZUw0+05ytcbwMnBpg4l8GHLeqW
	WBk/+Tt3LoRV7Yer0+Ec+xO5HuWcJiDp2hGcczWCAWzrxjpEb7QUFNa5YCs5HRaX9OzzmGhjnGr
	zOVo4cCIp85KCxQx07HsAeQbvzmJN4w4LuFThDgdxurMldilZp8JM64TXIJgJoO6WXt9+wJJs9k
	LAfE5Yy5lUZnyHuNPnlvUqLwd4ird3DYiS1AyJ/9txm5b1x6o/JimJ8qiDSW2HyNMzHVD+HxS2n
	a0I92Qhic=
X-Google-Smtp-Source: AGHT+IGnDYCY6mvzq3LLx5gIgFELEuCB5lFAO3VrBiNuZzyVRhfCrMUbnUy68Xx5EliKZpxSKRzFkQ==
X-Received: by 2002:a5d:5d0d:0:b0:425:742e:7823 with SMTP id ffacd0b85a97d-42cb9a197b9mr2617004f8f.12.1763639993821;
        Thu, 20 Nov 2025 03:59:53 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ffesm5864356f8f.10.2025.11.20.03.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:59:52 -0800 (PST)
Date: Thu, 20 Nov 2025 13:59:51 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: qcom: dts: sm8750: add coresight nodes
Message-ID: <pvfyri6wm4ejrldgm5rfduwnrfeowamly6djbcc5n74iffpm3y@mblfoujoqpbv>
References: <20251120-add-coresight-nodes-for-pakala-v2-1-3f09ec715dea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120-add-coresight-nodes-for-pakala-v2-1-3f09ec715dea@oss.qualcomm.com>

On 25-11-20 10:12:23, Jie Gan wrote:
> Add CoreSight DT nodes for AOSS, QDSS, CDSP, and Modem blocks to enable
> the STM and TPDM sources to route trace data to the ETF for debugging.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

