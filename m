Return-Path: <linux-arm-msm+bounces-54636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C520A91B8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 14:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F5683B1419
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 12:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869412417E4;
	Thu, 17 Apr 2025 12:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A+BXfnyd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8858D2405F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891454; cv=none; b=oHnBKS0OUES1VqkA0kGBnpj0TFQ3+yRzhQRpRtOhHkq3cGIvoLFBp6ZWtswu7mzNmHESzWYgswoVavN31/snrvB+8WmLsFQqVU+i4znrWbBhsdxZqgpuAKr+HC5xkxDp/UPE1f5n435QhxgqMvi3lF49d/2BhPOAFwepCn3Saso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891454; c=relaxed/simple;
	bh=dnPw/6WDA5NvkvubmkIBTjNuGbUeGZwq+sspzVMsaT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KK7sxrKx8+aB/zVy6GIKJPe7yHfD4r46Mj/B/rd3NWQ5iM4aMeS24Ji70xq5m08esZubxZpvYUhEbq28TUZPqBcLI3BozNKrL10l03OrPcz8JVEtK5OWhda5Ju7ufA4wXNNm6HVhFP5NS4XeQ2PBUdLaAIV6od2K1up9nnY07TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A+BXfnyd; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso46339f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744891451; x=1745496251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AIdCl/5qC9ELUd0iM51tsEop4bjwaQ4gO/Adiu/i0gc=;
        b=A+BXfnydeJSmilbhCgUlt9Cas6WVbTGg5FNU6cmMIER8ahwL1W2MbPOchTSqhbXTri
         MpPYU2mgXlm53uPBL1Jsj2xJ2BAAJrDyzYW2FxdulIS4q0S4T9RRiatyo1w0f3+m9ssV
         wVX46kNraOd2BIfnom48kcGkDKT+CA47/LzE41orX47h1vprISGgskaZ6zSM6wJywfn0
         PEWtcMsegHyODpIbGLxQIP16C/ZmhokhhoiqaOFYptW8mKsy0E+Q2RgPtHvNc8xDeltp
         4cR+EX/0W1mUzk5rUNJBiHiRSz/acoUmNuqDj68yzDy5sHVpLd7zzX0ciCiZ009CENna
         owVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744891451; x=1745496251;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AIdCl/5qC9ELUd0iM51tsEop4bjwaQ4gO/Adiu/i0gc=;
        b=lawbvc1t+1CmTO5TRtEPHh3Isgp7zMqh/tkqGtnoCsZQ04EH8Kn++jjiUPmvnAjhOS
         5jtILNFbW/OWulGTiQEyvJhE7VbPfGVT6rNCqw/HUgcAmh7ljHnep6pfTugNY7XQFRor
         bPlG0RJxYGb8oFywyQbHWu9q7gvF+i8dMSLN3Q0uO3+2wfWywuVJTXMhIG8R7/RIbVtP
         cHDA3hV4FixLB9QgrGksCdkQRO5gfdgOqW+Li+xazkETunHMh0t+bYtcCTSt0CI0JDlZ
         57sxVlWeA2RrvLc4D7O7E8EQUJiXHmB/hPQf1ULG2J4byQZB6oocfZ7Hu5Aob3wjf2+z
         KXIg==
X-Forwarded-Encrypted: i=1; AJvYcCUbMd5MFoTRpl15K1yxms7VG9eT4XQPV734eX6rq3NM8dkhEOST5CpBRt37SBaCoPUvmfd4R62bD7XGKFGo@vger.kernel.org
X-Gm-Message-State: AOJu0YwCUyjPIxwy3eSMp55CYZSkmqka2hSv8FptPDpDWUKVC6kaIXJP
	547Fn2plv7tYZWrVvdZ+hqruuORcsmjm1CfzGQlz/d7PgjBVS3ethefKOr6U/UI=
X-Gm-Gg: ASbGnct/gwf7TdeKDtQFS/Wocpsq3RTMIqDb5+IvusUxusNWDR4Yi/FSGwmMmRQFwTK
	XWzTdpPaxpqbHRaNAlFO6RkovkcrmjiuyS9PM8aXMaTMGEuULOlHinOzRwVdgM7SbtU9K6nzYwW
	kDrDRAgCr+5OYjW4IBBcrbh1JM4rLk8j8fcsxm/RqRhE83qF6IM6HChaP+mETpaitD2EsPjcaEp
	1Gi0YBMcK/n+wOVLfSt4MIz0BjfGkNeaBGo7zu9amr+oTrELUahO801hesmXqQ97N1uSVJkIMEj
	hITGcCG93DXdrCIoB/lZ5xriQex0NsnO0Kh1zvuJAwvlOl+kT7+giQT91puQ8yJTcew5LIBo3FL
	hAVObv4h8n+3jb6vB
X-Google-Smtp-Source: AGHT+IED1Xnj9v0JnQwcOVttYnoHyhkKM/R+mA/Fw2SQCf/1dnCXdY6vmR1cIpyP4BRWLBv6GiuwYA==
X-Received: by 2002:a05:6000:4026:b0:391:c42:dae with SMTP id ffacd0b85a97d-39ee8fa23e1mr1035766f8f.4.1744891450761;
        Thu, 17 Apr 2025 05:04:10 -0700 (PDT)
Received: from [192.168.0.101] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c5f2sm20184959f8f.34.2025.04.17.05.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 05:04:10 -0700 (PDT)
Message-ID: <a8f7f571-e81a-49d6-a40d-895960165039@linaro.org>
Date: Thu, 17 Apr 2025 14:04:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: display/msm: dp-controller:
 describe SAR2130P
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
 <20250417-sar2130p-display-v4-1-b91dd8a21b1a@oss.qualcomm.com>
 <20250417-arboreal-turkey-of-acumen-e1e3da@shite>
 <7b559f03-f131-435e-95de-b5faee37b4d5@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <7b559f03-f131-435e-95de-b5faee37b4d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2025 13:12, Konrad Dybcio wrote:
> On 4/17/25 8:03 AM, Krzysztof Kozlowski wrote:
>> On Thu, Apr 17, 2025 at 02:16:31AM GMT, Dmitry Baryshkov wrote:
>>> From: Dmitry Baryshkov <lumag@kernel.org>
>>>
>>> Describe DisplayPort controller present on Qualcomm SAR2130P platform.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Addresses do not match. You re-authored the commit, so now everywhere is
>> mess.
> 
> It's git's fault with replacing the linaro address based on .mailmap
No. You can easily see:
$ git show 51a6256b00008a3c520f6f31bcd62cd15cb05960
top author is like you say - mailmapped, but Sob is my @samsung.com

$ git format-patch 51a6256b00008a3c520f6f31bcd62cd15cb05960 -1
What is in "From" field? Samsung, not mailmapped.

I believe that's a known problem in b4, already reported. I don't
remember if this was fixed, but till it is - you need to use some sort
of workaround.

Best regards,
Krzysztof

