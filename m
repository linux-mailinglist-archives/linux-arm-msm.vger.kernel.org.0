Return-Path: <linux-arm-msm+bounces-21852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1C48FDE84
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 08:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA2481C2193B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 06:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613234644E;
	Thu,  6 Jun 2024 06:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rBTpQDSo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20D245012
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 06:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717654407; cv=none; b=OPe3BHWVBcCsY4ZvByIMxUtn84JGDC/X6GaH2GR4Jb9GXAanGpLpM9tRdbZk1oYzlxENtT7PwYtcZcL0o1FJU4Qof2lB99KC+QlxyAoFqFJm+xyvOy42kKivG8oqTkfTRKb4nEynmrNFqsepYhY1mZojlc6RjudC3wPP/OHEwu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717654407; c=relaxed/simple;
	bh=TCEmfUhx5NW8tX4+3pFLKOppFW7aeQNfaGuzeZ6O/XU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/PxvvrfGPIi6fOSkbfttVnwFuybr4nQVLCT7rPephU8VlKJrQKkHofl8QjdUjiENBwxqwKszM4A5SvBGb/tZNdVpTyBFnB3B6Y8hR3e/Y599UjTLyNVX4GIGLdo+yVdrLTlFPXSjJZvQyp/eUG1LRqEKj0h+Xm9cUsKXJ+t/vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rBTpQDSo; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b938587a4so642024e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 23:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717654404; x=1718259204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8sQ5CkvXW1H/O7XRlffCbc9bM4I1KOOxElkjM2VolH4=;
        b=rBTpQDSoELBXB1AZ1d2sFnZGrPufKaB7cMX3Z8gL1BduPqd9BNCVQKa4l4Tsyizk6l
         d2rH1kF3b8sBLjNQ7HKNCgZ6VtKdBmHkMYkc8vKP2vbPwg8JYSc+ozQDVa92yaU3tbSh
         l6+OSsvi0nVy+gqnlfw0uRTPWVk2KeX0Lats7M6jTxCUs250NIsZQJrDMNQLluA+D23H
         xKiFR1xvifQ7qtKSND7zQTNRZaVwcw7WeQ7Q4LCij4x/BJZi9ln/PyyAQqIMGNz6ROHG
         mctGNfjxYx8BROod7rTv3LF6T//X9yILssKBqG/lnzgGHiFOGSsz/wPCKWilwGUfi4/X
         YYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717654404; x=1718259204;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sQ5CkvXW1H/O7XRlffCbc9bM4I1KOOxElkjM2VolH4=;
        b=tbWNa+gvaeIi6Lnp4vGw5D6kt9KreGsj1sTa5nBiAEWmXufZ4Z5l6PknpLaBoTZGu0
         WbYEFbojFMLZugEU8se1MYDwNbltFrbvBvrJbAPsI87U4ApxJFWwoIe+IVwVphUuQUbP
         cu7Q6698VxLs/icSzim4qPomjeW/vIu5EFRiTPjS2lTge/9zm4JwHxLgY2r+4WvCFq17
         Be0kCHkGDmCyfrxdV2atacdhBS0N/Bx5fp2munvtBajYB0TuMKXc8P+cwl+6n57yJb/n
         3dxmig5hj1BrbRAC2yjc/x6FXSWpONdXbr5hqOTcs+y0RNcSzBFSfkaFK3RbyQoMM+0f
         ahbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3HfgJl85yf3X6DQq/XXwcHP+/odMlKXk5AdIrABkxuqZGOo9jN5N4LbdlOYpARDc70QVMM2hLPvM/ONvGnf2Hg6rBIvxSRkzIhcA1Wg==
X-Gm-Message-State: AOJu0Yxfu2yykTcVHRzwd5991K6lZyanLAQNgAJamd8vEHEk7ZBGPTNE
	lUEMfPVlquMbw2VVfE6n62TVEBmi3mjJJUrnglAmMO133RDJpfczhi9beHCLCGI=
X-Google-Smtp-Source: AGHT+IH6GDxAjS0FP0Fzu4H4EKEOYscrl/Q2tDMYt8/w5DcMnYe+h9UOrzA/5POt0zk/gnrf2oQv7w==
X-Received: by 2002:ac2:5583:0:b0:523:b7ec:a222 with SMTP id 2adb3069b0e04-52bab4fc76bmr2487345e87.51.1717654403584;
        Wed, 05 Jun 2024 23:13:23 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c19e567sm9925265e9.1.2024.06.05.23.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 23:13:23 -0700 (PDT)
Message-ID: <ad665e7c-a299-422b-b280-e80c9960b006@linaro.org>
Date: Thu, 6 Jun 2024 08:13:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-crd: add USB DisplayPort audio
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240604094947.98191-1-krzysztof.kozlowski@linaro.org>
 <gqcbvowfma7l4lmqeom4pczjnl5anxtn5brsp3ttu4fisgcw7u@ax4eqlpfqnc4>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <gqcbvowfma7l4lmqeom4pczjnl5anxtn5brsp3ttu4fisgcw7u@ax4eqlpfqnc4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/06/2024 04:47, Bjorn Andersson wrote:
> On Tue, Jun 04, 2024 at 11:49:47AM GMT, Krzysztof Kozlowski wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> [..]
>> @@ -836,6 +868,7 @@ &mdss {
>>  };
>>  
>>  &mdss_dp0 {
> 
> I don't seem to have this node, did I loose a patch somewhere?
> 

I rebased my branch on top of Abel's work/next branches for x1e80100,
assuming he sent the USB display port. Apparently this is not the case,
so this makes little sense now. Sorry for the noise, I will come back
once Abel's work get posted or merged.

Best regards,
Krzysztof


