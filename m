Return-Path: <linux-arm-msm+bounces-26650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86872937CA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 20:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EC0D2817DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 18:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AAD1474DA;
	Fri, 19 Jul 2024 18:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y/tfv/JC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545C4147C86
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 18:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721414534; cv=none; b=c5Npl0tzVAZPPSk5HL2d4l5xqpHWKo4WFXn84m8j9XPFaDtGoPXZznlj4TMQFeLsNPDc1a4mXMCyJdLxWS/XG7tWewaVS2YagAaEE4eSR6hdA6yIAJ0xN7EBC2j8FU40gheC29uaeLDhUmukAWlu1GvcgfSgAvKTH3z3xyha650=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721414534; c=relaxed/simple;
	bh=oltVxzNyvv77lf/BW3tNvz5FdxtrRpL5oGQZxptXz3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tHsNsAZS0sbmbxEly08Q5vcrA8zI5lQdcQqihRjall9/dM5fRvRO2IIet/WbrFFzxFiiqOSeRZi2bx67bY605SUuDtNFISPjHjBIgnGVP+e03XF9AHclt4oflWCEXNT5SI/s1fheGeTdG9z83HL+foiyGfR9t8Gj8qkiHxIAK78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y/tfv/JC; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ea2f58448so2770459e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 11:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721414531; x=1722019331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EMLi4/RLuYJzBVsjdG68JYfnV4VRSle+/uP4y/1zEDQ=;
        b=Y/tfv/JCmThpVTxSNDhYhAwrQcUYzkZkTog2k00AWOc0sKiVbV6W3bXHHA2pSQVOYG
         KFoswiMTnR5IRUk8315Q0T56UfSe7QK9hf7VcqFnbjTcwE2IfiqqBoM4EbGQj6Jt435M
         j2T9rAFIDFeY4w8vtRMVcUPfu52OGGprhJy8guvY5K1UwBFHYgYYYr7MHOBlYaYmfgVA
         +fIozHwpKwyAKKMDahNU/SmiGPcTxClI67HIh1ttPriguHI6F2dmCF0NFgk2PvaCXq0q
         UX04HDk0xu7bJShMwsHYp5XaTqyRFZwm7MupIDpJcuLq96BdKhC1fdRRjroen1kiQ8md
         walA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721414531; x=1722019331;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMLi4/RLuYJzBVsjdG68JYfnV4VRSle+/uP4y/1zEDQ=;
        b=hDa95r/egOmPVtXSIMkPmlJrLahEEvZw8ngLi6txmIyJT1KuRRIGiNvk2kQPkbuHXz
         fXZ6qW/Mfmx7YbX/UnUd1qTzCFNJaOLzjwl699I2CEJ9/03cH/nDk2RZ3sInlUA+FpEp
         D3DYBr7bQSXaABRYFWS6rgO9VBEwT7CCKAJ7+M/sBEgarBM9dtPXsfU3sdcoaHxgsp28
         +kRJO8MvzVmZBCgaGxcWxoSfyrceEYALmKGprPZoy+Ba39EddRYVbsibveGBw84I5hT5
         4EoTWvQbH3cDDad+kuRZ7nBZKFPSnb13BvjPnym3WyYbX8zMwVNnxIaWClMA00zpiG8F
         VtWg==
X-Forwarded-Encrypted: i=1; AJvYcCVjzMGBy29BJoGYcM34FevwcMGfuNdzcUJeKN4i2G3ewWb8h/KRBY7SGhUD2Okbj6cHcyeyHlJ2lpTBjLyN0B5LH5fQRppP7ygP1Z9PfA==
X-Gm-Message-State: AOJu0YyOgFs38ZpwvRxxSYbCMJjPqX0pgRJhumy/y8XgstIOtX07zD3W
	abFBJsWM4OCq2a6ytiaybVyFRxpdCqUYVb7ePPXlyqHufpnk6z7hrNh1KNx2Dzs=
X-Google-Smtp-Source: AGHT+IGjgUc8q8CuJVc2puKr/aAWGj5LpuLQMgFlj2AU5AveDFbYtHWsax9LqLtyeDndamYLDvFT6g==
X-Received: by 2002:a05:6512:23a1:b0:52e:97dd:327b with SMTP id 2adb3069b0e04-52ee53b2ae5mr6943763e87.23.1721414531266;
        Fri, 19 Jul 2024 11:42:11 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c8beb09sm63341666b.135.2024.07.19.11.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 11:42:10 -0700 (PDT)
Message-ID: <4bf8bf1a-a63d-4674-856b-f66e9eacb09c@linaro.org>
Date: Fri, 19 Jul 2024 20:42:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: x1e80100: fix PCIe domain numbers
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240719131722.8343-1-johan+linaro@kernel.org>
 <20240719131722.8343-3-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240719131722.8343-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.07.2024 3:17 PM, Johan Hovold wrote:
> The current PCIe domain numbers are off by one and do not match the
> numbers that the UEFI firmware (and Windows) uses.
> 
> Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
> Cc: stable@vger.kernel.org	# 6.9
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

can confirm dsdt calls them this

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

