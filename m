Return-Path: <linux-arm-msm+bounces-87777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E43CCFC0C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 06:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9273B30407E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 05:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020712620DE;
	Wed,  7 Jan 2026 05:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQrBYa9s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29A33C2D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 05:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767763000; cv=none; b=cso/FNwygMQrPR4uclTv1rG51R9pvTZkl3dKFpYLzdy3upA/uJhER9klGaV0pl2+Tg/MqK8gAvnN5wmN1wIXXPBE0L/oeAMcctQaPwOezM8omfF6Ytb2ubQTNeVxdYh8mTwpfmn53mPToEWcjZ+gzv501KsCBnBxbWbE1GfPsRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767763000; c=relaxed/simple;
	bh=r0Z/FGLdNUJcWaP0KFFmDyvF1sQpF0U/FrXBPBCEVeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnC4YlMmuxNLh1UUXzI1sKoaAVwCcd80WT0Aac8Gx78KWI5wJa/7A2PlI4eIYmYNQT+WRgVan6SLSFzVcJNFs19ur1Y720SoR79VAR3CurF771hnw4fVEjs1x5nKRgGriuIJ0zzn/1EPj4C5PVrlbbVx/qMwNN4A99vs3/xls4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQrBYa9s; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b6babd619so114541e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 21:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767762996; x=1768367796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqAELyi4+X9hoxR9GKK5xZxWKWw4/73gk/G+MxbQFVg=;
        b=YQrBYa9s8m08TXv6+GSJc9guZIiPsJ6VjOe3NCsO/Y/A9koHl6fW1JFGy3hFpNlAHb
         YEjSh2ppdiMHy//btSKDx/HzctBzqRz9Zv51BBmLkw898f3Y7vF/+34VS/kRhYtZGIdT
         nqz7UOZ9q9ywLy287cmeniOqrOAteX+a/4LJA1kZksTuC/5V41skF1btJmviznJAwr7n
         +nAH7X7T1R8RtKrty8qTwUg9+J93XpifS4fkcASzZZ96FXT72yTgX5xilqvc5KDeeo3L
         3yK7cvDwqgmnx+wtscwbieJLAalqAvZifclU3DRmfE6ymnCG534AWPQ0QbS82WcZ5SWw
         3R7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767762996; x=1768367796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqAELyi4+X9hoxR9GKK5xZxWKWw4/73gk/G+MxbQFVg=;
        b=qHfqL23fFo/M+Sig4N9RFenu8JmOzVmBqEmNEugJKGcime+uk/5/rPocvbv+G+iULA
         OqzWuK9jifdR7AsIBI3kuy1i1DwDhlXPA98Kqw5au2NZy4dTHIvy9eMIlCJxQWmBDP9y
         q3DxqMRCYqWJcZPlByWQAgK8/43f9clSTSPOmup1ehjulyt1Ofpg8foJOSkLLtXZReNZ
         hx+pg3DqDf+3b8atv3kFeBcInouuYdM3SXnQOFAkpgfG9WOLLFLrwUVvf8SY3OhzA3uC
         i4JBZihTqwD2k8v4ESFGH9tZSEjC0J51T65yeELBxa4ZofksgBwUJ7T6OFkfVdrvssMJ
         JhYA==
X-Forwarded-Encrypted: i=1; AJvYcCXaC5Aqu8OtsU/ik1+lbZtnoikK0aSr/9zRKKSmog8dw9ohvKi0mkLhhn3eqHKLU1aB8KoPudag+HtLE4mT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo7ggucNfqJsKzO0VFRPC/4oMXUxB0vGSp35zCmhS33IDiSe5r
	fJvdLUHytzxSDuKrP4kUcZ4kcBIZo2A/LDvIRHacSw5rdxM9VLWxWdhh3o4mlSVFGYcIR2QCg4I
	uJXRB
X-Gm-Gg: AY/fxX4HG5eiMIAlVYuCR2pqg3JVuIZyx9iUUmfmcrygsIrl1vEv0Eeh0LB+yODsOTj
	RM913ZZmIhWc1C05/f9l/sHfnF5pNE0y5pUQrxKapQUodi/JvaZPkq7M+hEIXnVAXoUXlnf1CwH
	MhgaaB3G2y4/FA8qceSgmkSFbmL26ee1hRG6w2UHJxi61/h1AaqfzA/hj009ChIYIplhdDkWuRx
	p5LdbKxEBrGyyvIPYS8wSu40+jC6pxO/OBaZ9bZibn/3tEMjonywvFHn6QLayKUE6KV01XKMW3L
	U24U1pj8NsIdpdCEUoZrifvdeISAaE7LoPHcxvjzmcQx7SDvoV7JXlK46zSH/L9jQfcTAMPzJMy
	lQQeZyoIEP3Bb8dlGAqmIjs7S0Z0v9Ie1BK0zXVgZzuO/r7w5j+GVbM6qfw47LQecC1ZsfXpi84
	YLVIBoaA3h8vgu7QgtDMuOjQ38WQZGB1uIS4fRhxW/h/jS2hEGY+JiXptJEByPfPHrhw==
X-Google-Smtp-Source: AGHT+IHpD7HZvIJALwMPTqhikXe6Kx/ivzmXk1SXf0Q/2OaBXAZk7P6dm/tG48Z5K4TR/Q3NzHJ81w==
X-Received: by 2002:a05:6512:4016:b0:595:9161:f837 with SMTP id 2adb3069b0e04-59b6f047f21mr207025e87.4.1767762995882;
        Tue, 06 Jan 2026 21:16:35 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d5db5fsm1087038e87.56.2026.01.06.21.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 21:16:35 -0800 (PST)
Message-ID: <e91414c6-fc89-4b38-a5be-f282c8601b5f@linaro.org>
Date: Wed, 7 Jan 2026 07:16:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
 <ndexzb5bo2rxjsj7jkf3bevbb6vmtjpuuhxbonpf3v5csxnjtu@sotufkkvfc4r>
 <f09670ed-1aba-4622-94b2-85ade831f7fa@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <f09670ed-1aba-4622-94b2-85ade831f7fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/26 05:05, Wenmeng Liu wrote:
> On 1/7/2026 2:23 AM, Dmitry Baryshkov wrote:
>> On Tue, Jan 06, 2026 at 05:39:56PM +0800, Wenmeng Liu wrote:
>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>
>>> The Talos EVK board does not include a camera sensor
>>> by default, this overlay reflects the possibility of
>>> attaching an optional camera sensor.
>>> For this reason, the camera sensor configuration is
>>> placed in talos-evk-camera.dtso, rather than
>>> modifying the base talos-evk.dts.
>>>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>>    arch/arm64/boot/dts/qcom/Makefile              |  2 +
>>>    arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 ++++++++++++++++++++++++++
>>
>> Is it possible to attach other sensors? If so, overlay name should
>> depicit which sensors are attached (compare this to the RBn boards where
>> specifying "vision kit" defines all sensors attached to the device).
> 
> Okay, we previously had a discussion on this. I will rename the file to
> talos-evk-camera-imx577.dtso.
> 

Other camera or display .dtso names commonly repeat the name given by
the vendor, and the bare minimum is to name it the commit message or in
the code. Is it Arducam 12.3MP IMX577 Mini Camera Module or something else?

-- 
Best wishes,
Vladimir

