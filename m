Return-Path: <linux-arm-msm+bounces-60308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF41ACEF7F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 14:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EAE73AC70B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 12:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F127C21D590;
	Thu,  5 Jun 2025 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tid6uU+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3871C1E7C1B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 12:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749127692; cv=none; b=DUphtd//9JIvohxFp9tJ/07+mHmH6tcaDq7pSc+hrLBh15oKrx/e12XQQJI1rJo6IIij5xYqDnVwK4ePscmpyEV1cXatw+2JSrvmnjG4ok5zHMcODV9m0XmluVt4zNvWNbgjaIu0uOFYMfGzXZUAlDqEbEJx4EAwMbGbawUTUZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749127692; c=relaxed/simple;
	bh=wWC8vTRxd4PCSHw6ozhyBpPg3oAWX6S9agX0DtmSV7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swLuYs2r61FFy1xbFQ/9P/cupRJLOg/4e7T6Jw6TjUNURwF7hG9TZc8cZIHLiw5dOYb6KCS9z1HH9zv+Hd74xxzI5GuhQXhIaTfq6suf7lcDG8nXQUNdchPQN2ZkpcKMQmXbOn4zQTLKRXfuSBRTDbpEb1yjgCOh/mRbGc8+iLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tid6uU+A; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a375e72473so452066f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749127688; x=1749732488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DD3X3bkoKyLMyd5gKvCIGY/mSWv524B+viUEHfNcoG4=;
        b=tid6uU+AkAHmk57IwrAFgnQ9ZjzvLpPOIF5/QkAMcrZH8jTdkF6z0KgRUv+ZsQYfvP
         zRyvtxXBxW9D+JXadJMvphKJLF29X1veMxoRLQOfGlKjZHHmYFi+LDEcbkEHfOqn/GQo
         O6GWiKMmyOm9lCxQNhz/JliXgpvIHYTkOrdQmxQQr0spex8l8IZ9qg+RVDcPNYXf8Yly
         6cIcBxeKi0mh6RxgyFXILLZ4TFNRm89UN3D6x4cXbBWJOSlEetFtaWIZoPMRfL95QuhY
         9B1ekyM62fHkz71YcAczCLxGKnzvSMA8x86gR+NLqdvIvKy28eekPLMI+DWWKleRxdcJ
         v/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749127688; x=1749732488;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DD3X3bkoKyLMyd5gKvCIGY/mSWv524B+viUEHfNcoG4=;
        b=hoLJrCX/q5g2mek2T+Mxz3Ir1xV+Dwm808SCC2TnHLsxYfJRRodvIN/pW0taIfxtkP
         Qg1OCjEJY36LFtqevCrihWzblthVs+4WauwGsTp8Z/UVugox4a0WZCW6MOX15SE6yhoF
         IyjlY/9pMyRFGEpTTznJGBK/KIbFvb/oxBRWi6i/kEmngge8vCPUea4ZK5jC45RQjEAh
         9wR/h3t3Cus9b1tgs1GzBrlU1d8ks1Mu6CNQbjXv7WV2pCFocZw/TNvFhT2y/wZbTjM6
         mcPGnkMptS2AHo7VmkeGjIpbqBm4Rsyyls22zGNF0yPoPBu3a4rPrrfCYsBeM2hGZ4Sn
         fDww==
X-Gm-Message-State: AOJu0Yza59DVenVpL6HEXxh6u5kdVO/Xf3B+1F0/Y31Jopxn+wH1VEsK
	4tcf5F5abwH3kBDDToPDa3O/FH2O16NxAmirfWfVGASir+aCxECwWI3JTBdqFgV/vluCVithPbC
	+Vw5tUoE=
X-Gm-Gg: ASbGnctNvxHyN2h/UJHO1IJjJnt4FuCFZhJPHKlSch6uZQLytxCHEER4K2IvrNW2o8b
	XbRNTYtqNovxgriygPqXuH+WnvZRy44PBZu6yEJOzEzqYcWZz6UfCaovdoMy3SQIyp8i+sAIGFl
	XZ7TzgpOjZ/Z3O+aJAOAdTscj8Uewk/oAtvFYQHeXCxfw2dDWvI8+iM3y1GDeEu/56p6w7S0md8
	EgaZ/QRJV4xW+E9PxPlDsRlYwWhbpp5IWdMRUNiILx6QaYzeCAD9OjzaiJSoCVXMsLnNs3/Ztrk
	ZtCUTjIWCpAT1VEHzgvFrC+tQJwPw8gEBjHTo30AIPtwIzyngYSDaE5Drp0=
X-Google-Smtp-Source: AGHT+IEwmO65LIe9TsZFLYgqhHXDd2a/mab3lz1o4pMeJkOsxlaOnFsXZyBKpwTgYdWa5aLH5sL/BA==
X-Received: by 2002:a05:6000:2210:b0:3a4:f7ae:77e8 with SMTP id ffacd0b85a97d-3a51dbcd100mr5959406f8f.15.1749127688507;
        Thu, 05 Jun 2025 05:48:08 -0700 (PDT)
Received: from [192.168.1.221] ([5.30.189.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00971e4sm24840719f8f.65.2025.06.05.05.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 05:48:08 -0700 (PDT)
Message-ID: <550a7ead-99a8-44ac-af49-c0e9d79c35c9@linaro.org>
Date: Thu, 5 Jun 2025 15:48:04 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/3] arm64: dts: qcom: sc8280xp: Add GPI DMA
 configuration
To: Pengyu Luo <mitltlatltl@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250605075434.412580-1-mitltlatltl@gmail.com>
 <20250605075434.412580-3-mitltlatltl@gmail.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20250605075434.412580-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/5/25 10:54, Pengyu Luo wrote:
> SPI on SC8280XP requires DMA (GSI) mode to function properly. Without it,
> SPI controllers fall back to FIFO mode, which causes:
> 
> [    0.901296] geni_spi 898000.spi: error -ENODEV: Failed to get tx DMA ch
> [    0.901305] geni_spi 898000.spi: FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode
> ...
> [   45.605974] goodix-spi-hid spi0.0: SPI transfer timed out
> [   45.605988] geni_spi 898000.spi: Can't set CS when prev xfer running
> [   46.621555] spi_master spi0: failed to transfer one message from queue
> [   46.621568] spi_master spi0: noqueue transfer failed
> [   46.621577] goodix-spi-hid spi0.0: spi transfer error: -110
> [   46.621585] goodix-spi-hid spi0.0: probe with driver goodix-spi-hid failed with error -110
> 
> Therefore, add GPI DMA controller nodes for qup{0,1,2}, and add DMA
> channels for SPI and I2C, UART is excluded for now, as it does not
> yet support this mode.
> 
> Note that, since there is no public schematic, this configuration

Device tree should describe the hardware, not hold a configuration. If
you are configuring hardware, DT is not the place for this. Same goes
for the commit short message.

> is derived from Windows drivers. The drivers do not expose any DMA
> channel mask information, so all available channels are enabled.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>



