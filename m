Return-Path: <linux-arm-msm+bounces-60155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BDAACC95B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 16:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D37A73A298A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 14:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E125239561;
	Tue,  3 Jun 2025 14:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ODIUIMPY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2D722FE0E
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961666; cv=none; b=UA/s+ZDlL5UADzSgRZ0uWZGnFlJFjgMzifkH12Fk0rZL8bzjrdWoiquGS1U/+wpcCgeBD8+KgknoXXEzf7mqlj9dtsylyXx2phrz0pSfCkd/mXBimjtA5KQ6h+2P3m6QFGyfdrbiwGFjOEF9ip0AiZJJpUbcgXPaa62ZQtpNbfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961666; c=relaxed/simple;
	bh=oDFEQ8/8ZMa1R4I35TT2WULoCOjgL6PNxmpPuk8RuJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKb0sZy6aR84YukC+SS9kepdDidHu8VjA1+IYBdHHO0o0fqzJ6tAuK/9DGxpWaikE+yEAEVo97lNG6dYfV96aCnrkJbbBNnDq7VNZbxx984Hal9Do4N6neMJ8cGWrYqeg0JrYr4sBLwXYy6K1MxdglVGynriCG3/0x14U1Lg1vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ODIUIMPY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso1191601f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 07:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748961663; x=1749566463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vLKl+eBINJD8nDmTWsnka77ju1HlxtzNFzg0Kr2clF8=;
        b=ODIUIMPYF76ySXpWH+fZ7E2KAeuH5tKb4VzG79gwPKyPVR4Ct+fwfvcR51KTdTBoAT
         yjJNYWn7lDM+Ar/Bb1YF9DDx8p/KJlsiONVZUl5XLlSH8pIG3s2exPWvLgXRMbEFaNcs
         y5JGMWwB31vDb/D2m4fBeAgKqDro+SDt4WcJEYiwC+O0mSPOq5ItvayEAFEhfj1PA1Xh
         ELTsoLFiXt6tmu3dsZ+8JSfE89iRGcrnD3fe4+TF6/IjsGuv4hxs+BC+LqA7pp1atEXZ
         MK8RRoc72x5NNc7o+UsC7PhRt9wTFm1o7emQa/6i4E0a4XK1mpbPAonLslmcz6ujkEsk
         DrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748961663; x=1749566463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLKl+eBINJD8nDmTWsnka77ju1HlxtzNFzg0Kr2clF8=;
        b=kTCWGmic25EKcOpy0UUhz61dgqzR8aH4qbCDim48lUyN4pLjsK5/vST3XDktlXKwmo
         Xbe5E6Bl3PAVf56gq5cu6yHxGmN2eRn0KlHk5PkQ76d/uiylQCEPh4N43ak/SbMNJF/8
         xWf49azuSHJwCVkhUPWOGJyeXTXPMPcFUoktYP9AnH5XLDSpKP8JyZSpKr5YL2iHgm/b
         efhSKaSVXN2+kT4nQs2IZ5POM9776PmYksV6OsIiayhJF53dd27qGPZSDmqpQzO5vqMA
         yo3hgjZsdVB5KTuIUhtFgchMVu1xFdtXR23gXMMmVDRWevSyZA6ipvEvdxyBZlZ10MKT
         aDBA==
X-Forwarded-Encrypted: i=1; AJvYcCUmOOLbgUxKTyA9KqUigeJrVzm5bcYWY2MjGUqgqyDKqIfQmhi4T8xxZQjXrbbsghYrQkFHtFf9MOwAfawN@vger.kernel.org
X-Gm-Message-State: AOJu0YyDYS6TEfmFQK+7Qp18JNx33Em5C4dbtIJ/CLXAEqvpze1ADYR2
	x2Y4HB9Cd6/jTSZDJEN5yWjL52wvqJHOV1YyJLs1tJtbksXCCge5TiO8gDurUtnPh0E=
X-Gm-Gg: ASbGncv4MWx1CYj2t32BFpwVGaWRtssDQmWWITjEkJVtXqja7HQDxkvmMmxKS9KDY0K
	GC7UUeMpQdJlxTcNsuw6FJ1lD4NW28A53TbZd/W613P2WgiG4HzJ8YdDeoHMLXrb+g4wqF8/3ah
	WhoOqIm1nZ56Gt9uaXkKmyWUiu582+8yBMzr655WdD7HTxlPnxKFTktGnvkPRzWQn8dv+Xd34fi
	bpR0Tu5RQYy2IDDongSqLCVyK2rG0K/R5EiWWJTQig1/Aibrf/hcNZ9Fy69i7lL7bTNFlEyezVh
	5lDRB7bT25xSVqMkiH3wqryBs3m780OsdaDVt3uHmqb1KfXQVOwu2ljr5yIh1qm1Co5BHr3VXmM
	Jl1r4PmXB53s6Px+R
X-Google-Smtp-Source: AGHT+IHwJlidHh+57XeiKH4dEGZm0pFiX1LA59KNB9wSamUPD0lMua3IgRZDkuiH/mUBKnzOBl6REg==
X-Received: by 2002:a5d:584e:0:b0:3a4:f519:9997 with SMTP id ffacd0b85a97d-3a4f7a3dd10mr14815287f8f.9.1748961663156;
        Tue, 03 Jun 2025 07:41:03 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009fdbasm18145340f8f.85.2025.06.03.07.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:41:02 -0700 (PDT)
Message-ID: <47d19ad8-37ad-462f-8cb3-d39c29008709@linaro.org>
Date: Tue, 3 Jun 2025 15:41:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] serial: qcom-geni: move clock-rate logic to
 separate function
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <VkNsXqYDdmwW9dutwc76Dv8ks2pvgcUwpf1UREJXhbXDQRaobVZL8m0hLz6rsOG-v6CjyAW3vHbuKMiPc9kN_Q==@protonmail.internalid>
 <20250506180232.1299-7-quic_ptalari@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250506180232.1299-7-quic_ptalari@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2025 19:02, Praveen Talari wrote:
> -			"Couldn't find suitable clock rate for %u\n",
> +			"Couldn't find suitable clock rate for %lu\n",
>   			baud * sampling_rate);
> -		return;
> +		return -EINVAL;
>   	}
> 
> -	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n",
> -			baud * sampling_rate, clk_rate, clk_div);
> +	dev_dbg(port->se.dev, "desired_rate = %lu, clk_rate = %lu, clk_div = %u\n",
> +		baud * sampling_rate, clk_rate, clk_div);

Separate this stuff out.

Your code should match the commit log. If you want to convert %u to %lu 
make a patch to do that, even if it seems trivial, it is better to make 
granular submissions.

---
bod

