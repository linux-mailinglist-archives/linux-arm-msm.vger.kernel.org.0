Return-Path: <linux-arm-msm+bounces-30704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B2696BA82
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 13:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2AAA1F239A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 11:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113731D47AA;
	Wed,  4 Sep 2024 11:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eMEKJ+po"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488B51D04A7
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448974; cv=none; b=DKzus95QrPMw17IpQX50WMsvUUYp8Xarfk+5V+c4tT3a3lDipq2AuIUpFPdlMBfA6yBuHGBU6UoXhHXP4ILQRhQC4Ww7oyC8S2EIZQ4lF9KGy2d77WIOdZ7dceD1nBY2nZjg77OpjvSZjK68bdg5c7X2fb+cLHdncLTAj5D4T8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448974; c=relaxed/simple;
	bh=PcrFgpDkn50Q165eUFY8BrJ1SaOyvBQGLSKOHPiZ39k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=J5YYR3O76O7YhEmfrNKjBbiIcNaE1smIpvt0hBUQEnfjK1wNeZL/AZSZcEC2M01IszOQZwbAOLKOImPEB1sZ1uzFI+zfYGZPeYLVcSGUK3k5YkjgN0ZkN+7thd5V2b1CD/e52Gj71Bp/XiWHaCCdech8ulNYpfcj4hDxW5j4D/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eMEKJ+po; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c3c3b63135so519343a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 04:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725448971; x=1726053771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mXcgyount9FIa988qWiuGCSNSad2TY4cycGUqv4MAcE=;
        b=eMEKJ+poMaUoMLaoQl4/MJ8qmYejIDtE6TGRb55KL06o/G1nVVAwDOvv76xA6CDMZC
         kE/1j0/gUfrTfAGbNXBVRA/5jEyKulRyPU3vwbbwR9TyN1x+ZR17KCs2o/uogY2dpD/n
         H8eqYeMk0+KOulPbvRsq947GzQF3QHGeAVbOwh0vW2AxQ+iCt1wM+k06uHntEim/UNJw
         J/RcOmAaWsAqRaniwcfXLqpOoQ2SoqxFKdDDQ/ZtfF+TEp9gfDU5Tv1NCCTTfPvKOTh/
         TzLS8XEhK4bcbu9D3BlNFtY3p8V3Dn8m1JCb9BfM4tVO5CHE2JEkxQHZz0yKwJJBPQzP
         KB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725448971; x=1726053771;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mXcgyount9FIa988qWiuGCSNSad2TY4cycGUqv4MAcE=;
        b=Gq7Yu3KKOMtez1fKzVzlVxAYPFiYGYkMx5/g/onI214+yMEfrkUqzmCkjgn3EUr3c7
         WWwGSEdBB6ABSToqaUByWefVWGvRJhTSgGW/p2IY36RZa7kyvsbYRLngKMmHpP+FvCVm
         sbB0Vv7Km9IyEnLPihMoDzH3rbZuDViqbCYuYBTai8rob48Dbvc16t2Ye4g5eiRFlwgU
         HSyWSD0W10jnWQzsZaitIFYDBwfxJYEaBuaSKofzEHh01KeRCR7lDEpJvrW2uU6pL8DF
         a/vKw2o0d58E7etgMly4YjxF/iA4J1RKM3/ppuB/1P0v01i9sCzUOsCvpeNBFOPAmlh0
         0D0w==
X-Gm-Message-State: AOJu0YzN6+lbuwgHYsKYrp2w3a/IUDFthiAfJ3hAbjvP2QzaVSuQKrcV
	c7TCBz011nvt/s6GquoPq4wr/pEorUHQ9V9pyEVi0awvIW36LG+mhItRLF+MQls=
X-Google-Smtp-Source: AGHT+IGABy8yJ6gIVqPxqOGLJAZPBvqQIMiwgmXxYJH0VAwdvLE5ifagcTmvrdZkt3pAKO8bdRK9WA==
X-Received: by 2002:a05:6402:354e:b0:5c2:43a0:47e3 with SMTP id 4fb4d7f45d1cf-5c27584b805mr2244804a12.36.1725448970452;
        Wed, 04 Sep 2024 04:22:50 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226cd20basm7459660a12.65.2024.09.04.04.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 04:22:50 -0700 (PDT)
Message-ID: <5fb85de5-9162-4c63-9b49-96c7d22ed999@linaro.org>
Date: Wed, 4 Sep 2024 12:22:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] (no cover subject)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 cros-qcom-dts-watchers@chromium.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>, stable@vger.kernel.org,
 Hariram Purushothaman <quic_hariramp@quicinc.com>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
 <4e0529d2-0277-4a41-8d4d-915e4ec0baa1@linaro.org>
Content-Language: en-US
In-Reply-To: <4e0529d2-0277-4a41-8d4d-915e4ec0baa1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2024 12:21, Bryan O'Donoghue wrote:
> On 04/09/2024 12:10, Vikram Sharma wrote:
>> SC7280 is a Qualcomm SoC. This series adds support to
>> bring up the CSIPHY, CSID, VFE/RDI interfaces in SC7280.
>>
>> SC7280 provides
> 
> Please RESEND with a subject !
> 

And don't forget to include the V number V3 ? perhaps.

---
bod

