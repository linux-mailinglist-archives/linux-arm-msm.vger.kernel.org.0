Return-Path: <linux-arm-msm+bounces-84215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB19EC9EDF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 12:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6ACDD4E4FB1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 11:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948F32F5463;
	Wed,  3 Dec 2025 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B7h3H8WI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5632F5467
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 11:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764762115; cv=none; b=GNz7zewa55TxkEgYawxru9m8HLtBObQUOk5pRx5ZxxatluykifO74zo4JbiNGJRiuZst1EkldMuLEk+sOjUqAjvxYOwCHraxbEeQjW2EdrhOHt1KPE/urr8fxKk98bzXhMwB9Eyv6VW7jp1sZla45lMhIxanAmbeDOy1fpLyQtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764762115; c=relaxed/simple;
	bh=NZfWwXUdM1N8hWGPoLMUun4FAnEIkz/8GtgT2xrGdP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SF5PHCvFNCSx+eBZx3Er/atyiHJghgVGWwHAuDX/uUqxNTa97KG8mMjdky8q98CStrIxWEm/I4LSM0eLduzuOj6xD5Qbvp9sa+SvoN9BabhAcg+X1dnFDPugUFKvu8DM6OFGHENDrFTvUhWEB0383Xb6VluHDgkpVIhXtfy5FEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B7h3H8WI; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59474f1308cso462392e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 03:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764762112; x=1765366912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YT9NAZMbKjHwVuYxESthg1Ziab3zAEt8ty7uKrcDriQ=;
        b=B7h3H8WIdDMCMmOd9CC9y9MV1fotb/Bg9Yy+kUEy8lcRHf861Jt13VA+PVwWMRn+5D
         fPNPEPsP9sFv2FpAvYbYyD6m2w3xIWOzt9dRtB8rJGWS6shQQDzn+gDNWsG6r7tZYx4o
         OCcVU5FEMfoXNMT6EabYxz7Kcp3LDNNp03008gZ4oCicnV5/d1ZdjjPAKuCApfeG45MM
         6Ge3n3F9hlx7oc2W/HzUtgd7SBMhpM2GZcLuV1HvQ8C3zIOyhja+Y6rH4xWl7frMGXJu
         r60xaIdFj76U/DQx+ocIvV9APJq2smd2h/GyKHQ2Ae82vZSqjUJmfj2CIkEf4JabyuIg
         i6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764762112; x=1765366912;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YT9NAZMbKjHwVuYxESthg1Ziab3zAEt8ty7uKrcDriQ=;
        b=LLKT3CnCaYKP6eqlI5o5Vmc3M2nvOskGOoPx59hWhvv+9v7UJNZDFEN4kxKzCuYuKC
         vkL6Zu0/l2q622bHeMEn5mTwdZ9jYS7FOSentD+oVmrAqtJF/x4Mc+3RxQuvqnjUXvUO
         0NGWTxvw4qKKroeTm8wUJSVDUHtvV5MZG63+BdqJIKHIOcM4DVPjWn/08arW0YwC9Vln
         CeZ25fCGKUeK4/KnkMsQmI3GcXRY1kFhdDO+VAuzs8ReQ+HwCzLmS50olBReBLM/rqJE
         WKpZF71duPUcaskH5rrsBurT4vWS8UFU/5o1lxYkcwtFT09spQ4lZEUTCXPGhm7x+RrO
         ZskA==
X-Forwarded-Encrypted: i=1; AJvYcCWz4FcRFSx0u+xzgXtPUsHe7Kvfz9SzXc+U4PHtfm7EtTZDxSMoemlVbRqm2pKEMiUunMu6uvHR25j7bKMq@vger.kernel.org
X-Gm-Message-State: AOJu0YzF1ew4tGb569rFBl2MASAbn59FdHjhErdl1wvXQ45t+62P047f
	WhX543J4kbW9+KLxkanVwPkCWKYG4PS9+ha0QDgvwyXOYcgb1fGvoJ1cT/DgFr4bkn0=
X-Gm-Gg: ASbGnctfwMTYMGEBlqeMvmlcGozrpTRKF+GlQ/cYCDTqERKt76FNrMB3+FHx2nuk9e1
	nVSmrPCqHTQmd5YU0XoAjXl/uvPeEVuhr90reIVuIPmYsBew/HQkcYtLx7TXWWFbBEiiJhJpnEl
	eSKCs34qRu7sMKKLDGE1LLobpG6OnrE1ni5WkYHgjyqaLzn4CptaMWi6LL+y/BFE0gWAyY4XFv6
	+0ufHb1F/WboiP/Jx1YifMIIvYw8hDzh/DW0GwtuompncrRNajos9z3OaGGADQsoUFWDvgpJmfi
	Aw8deoAf8mZG6X6Vbz2vhMoXEdQzOWTTPmZEtB64BXvAaXLUEfw6JlAd9JhbycuFa6dZEgOB+dh
	8MXadg7w1DzkyOKQ4ZovsNCx/Ni0hJm3kgjTFusN+g1IikhPoW0BadBs9uYvsNnYd/BKmd9pMUs
	vcPpMps5+q1V6HhUXD8zxEvSjMy4MFjZDCEgcA5PSEkZCt4ijmThVlKLbgFIi3pRTdFw==
X-Google-Smtp-Source: AGHT+IHZYJ3v8N4m+tfsV1kg9naZCMOnd85Ke/4k3M/zcy8OG5fna7oWAdtTIBLeUOImwgoAihGktQ==
X-Received: by 2002:a05:6512:15a8:b0:592:f383:3aad with SMTP id 2adb3069b0e04-597d4b22844mr263435e87.8.1764762111652;
        Wed, 03 Dec 2025 03:41:51 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48a9fsm5633460e87.67.2025.12.03.03.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:41:51 -0800 (PST)
Message-ID: <40980eac-9e9b-4293-8986-bff46f30a50b@linaro.org>
Date: Wed, 3 Dec 2025 13:41:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8550-qrd: remove data-lanes
 property of image sensor
Content-Language: ru-RU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
 <20251203040538.71119-3-vladimir.zapolskiy@linaro.org>
 <9252338e-c775-46db-9376-53002edf429a@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <9252338e-c775-46db-9376-53002edf429a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/25 13:11, Konrad Dybcio wrote:
> On 12/3/25 5:05 AM, Vladimir Zapolskiy wrote:
>> Samsung S5K3M5 image sensor supports only 4-lane MIPI CSI-2 interface,
>> which makes the sensor data-lanes property redundant, and it can be
>> safely removed from the board dts file. Noteworthy that the property
>> value is incorrect, because conventionally lanes enumeration of image
>> sensors starts from index 1.
> 
> This seems to vary between sensors
> 

It should not, from Documentation/devicetree/bindings/media/video-interfaces.yaml
the clock lane has index 0, data lanes enumeration starts from 1:

   data-lanes:
   ....
     description:
       An array of physical data lane indexes. Position of an entry determines
       the logical lane number, while the value of an entry indicates physical
       lane, e.g. for 2-lane MIPI CSI-2 bus we could have "data-lanes = <1 2>;",
       assuming the clock lane is on hardware lane 0.

-- 
Best wishes,
Vladimir

