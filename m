Return-Path: <linux-arm-msm+bounces-83793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84829C925D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 15:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21423AC524
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 14:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A44E329C56;
	Fri, 28 Nov 2025 14:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="f3TSc92r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3506E27AC21
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 14:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764341410; cv=none; b=SjpDRlHlvINKj5fjKPj6kH3Dqp1f+sWCY8azqdFO5VK1ckT2ESOtHNiapT4wKWaKMFTn+6vh7jUWszjZdA1sP0kcyMbjl9wqAab0p1HTLtsbItNbBJKa/d/MPW5cyLsP3RFCz/yxOgoHQNBlaDQSX/S3pJ8fCp8xUBpdm7rda8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764341410; c=relaxed/simple;
	bh=nTkbVvpUtjAIHCBonM33WYaWtmIemiIMbxDkrx+Twqk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=haQQeri3d1JcPfLNZS+zVdphFYDGRjJR/5dCRTBcqSjnLQX0pXSIKy2jYxeFH3KMUOtfCrejloVJEdWMtP9rz55lEzgZaLQQzJuPkl/qbos60ISGzl8ZFNGelEvlIiasl1j/nQd4o4pdqgE7tcYyLPW/q9D7uvdA2YufYhInUMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=f3TSc92r; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4edaf8773c4so22715301cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 06:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1764341408; x=1764946208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpfAFQMp1xHMgOgHhrR5E+/fQJMd6mYb+jU9coTyvY8=;
        b=f3TSc92rkdX6eYHM3NRYrVUZIQFi9MbOvLz7OufLVNEiRH4mLXlXFxCwDvzhcNRD+c
         GfoGhsiuF93IBDnKMSXUBShAATJBkRX63/xm5ddmsKzhLnoq0OvXkzaQQrhgmGxdjl2E
         L6SajQTCR5KE7HYUA7/v/4Bg03yHHCZbYOlVlve6vAhRWn2o1ufHZeTzMQ99gdo5hYcc
         VC4fnaZEiQfWfoTB1l97OH1KsZp4W0YD7qeMGMYm6YKsW4oYSa3EYJ45cO5vaT8m3hdL
         esUTzMt9WrY019xnsRfx7B4hVw7EEdplEokMdEYL46HkwV2LeyIhomSjIxZ6bhxmI4cG
         taGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764341408; x=1764946208;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpfAFQMp1xHMgOgHhrR5E+/fQJMd6mYb+jU9coTyvY8=;
        b=LeB2K/daJFcWMNJVSEJaSXgglA/KqAYng3e3VTzMa4fUiwd2+W43qGGqi1V3Zj6fUH
         KQIKJzChAkDC1yZYcl61w2D3rI6IIT1C679y3FAejTT95gCFIx/wN51Pp8SPZG2MSRQj
         RZZ87S6Tsnvjl2Q5sF6r2P4HwETcNMjQRH/g8xNWgeuzY4J4ntnYV5uKlSv2eqLCWvkH
         3ec2DRPgg5/9Szr+RUbJvnASNKPx9LIcZYuFV3uKoiKqzjd/1BjMdrRAjNDYxpi/XMVs
         3el879z+ldv8yoDtEB9qI7t3Oj7myqozDpGvcdWL9E79nJWx8Nb/vFJSAejKXGAHoAtm
         VpoA==
X-Gm-Message-State: AOJu0Yx0N2N/mWfr614hIe4tKqd/ZnYmnFTqBSVl00ie/A0YUWa3rlrD
	3fUWasaZVH6T1Sa/EAaWls3je9eKm90wYcrZ/t9adAasUMxqIQl0jsVvTswW7FnZh6w=
X-Gm-Gg: ASbGnctRYHZR/fYYnR8S9cmYRiD+xNE4eZ8Ztz2ZhAO8qMk23Bu/TmLFq1/329TGsVq
	nCmE26G0FD17Ij+GGCXQfHChQ3bVPeiyxO4+bKP4YJKZEiTsDr3euVSdKp5ZZv9bqeNoH4uzbBW
	12sZAhA5dN02Br5JhgYRQVWofGJzxx7Zp5iDhTA7sCCt5mWTwi+oWWKsKUSqgaGwHwEtAGlKS/Z
	y60gmBPcvPeMCYFSzVtpPKkTwOYMsaDn9t1i5GgSKLOPk9rAMYMkMEA2hdUIoItXPdJxT1eI4ur
	cqwl3h45DVX4tE24SCVjePLSkInVkFwrcJgBuSjDDQVRG3JLxh0OG7AolPN8h/vJ+5HwbdksLA4
	AA1cz5/2dp1qwK8AattRbAhIcXY5R7WKk3Hiy5zWfuXaKkT6uiqs9LTzOyFPEYnyY8k0cPlxIli
	mT8A4CUgSN/+Trr+mnDyA+jjWjS6d5ursk3R+HAuJtEwc+6rqo32be1THgIQ==
X-Google-Smtp-Source: AGHT+IEGpjV3bSnYDTTWhr58JDFbUqpfq94fzqL86V2vpJeh6MsJfw9tDhQWpWylfqV/kNO8QyYE8A==
X-Received: by 2002:ac8:5889:0:b0:4ed:6324:f53f with SMTP id d75a77b69052e-4ee58ad4ea2mr422901721cf.39.1764341407930;
        Fri, 28 Nov 2025 06:50:07 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd3444557sm26556521cf.30.2025.11.28.06.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 06:50:07 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20251127212943.24480-1-jonathan@marek.ca>
 <aSl48gV9laFb-MR1@linaro.org>
 <1f2c4e5b-2d7d-41cd-9772-374e3de46a50@oss.qualcomm.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <45bee524-d960-5b24-83bd-4dfb3e78fb1d@marek.ca>
Date: Fri, 28 Nov 2025 09:49:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1f2c4e5b-2d7d-41cd-9772-374e3de46a50@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/28/25 5:52 AM, Konrad Dybcio wrote:
> On 11/28/25 11:26 AM, Stephan Gerhold wrote:
>> On Thu, Nov 27, 2025 at 04:29:42PM -0500, Jonathan Marek wrote:
>>> Unlike the phone SoCs this was copied from, x1e has a 40-bit physical bus.
>>> The upper address space is used to support more than 32GB of memory.
>>>
>>> This fixes issues when DMA buffers are allocated outside the 36-bit range.
>>>
>>> Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>> ---
>>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>> index cff34d1c74b60..cd34ce5dfd63a 100644
>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>> @@ -792,8 +792,8 @@ soc: soc@0 {
>>>   
>>>   		#address-cells = <2>;
>>>   		#size-cells = <2>;
>>> -		dma-ranges = <0 0 0 0 0x10 0>;
>>> -		ranges = <0 0 0 0 0x10 0>;
>>> +		dma-ranges = <0 0 0 0 0x100 0>;
>>> +		ranges = <0 0 0 0 0x100 0>;
>>>   
>>
>> Could you clarify which "issues" (crashes?) you are referring to?
>>
>> We need to distinguish two distinct use cases here, which are both
>> (somewhat) supported upstream: Running in EL1 with the Gunyah hypervisor
>> with the regular DTB and in EL2 with the x1-el2.dtbo applied.
>>
>> # EL2 with x1-el2.dtbo
>>
>> For EL2, I think the 40-bit dma-ranges should indeed work correctly, so
>> we could add your proposed change inside x1-el2.dtso. I'm not sure which
>> issues we are fixing with that though (besides correctness of the
>> hardware description). In EL2, all DMA devices should be behind an
>> IOMMU. In this case, the dma-ranges limit the size of the I/O virtual
>> addresses (DMA addresses) that are given to the devices. The IOMMU maps
>> the DMA buffers to arbitrary physical memory addresses (including
>> outside of the 36-bit range, dma-ranges limits only the DMA address).
> 
> I've been carrying something similar in my working tree for quite
> some time too.. The USB4 PCIe controllers have BAR spaces in the >36b
> region, so this will be necessary anyway.
> 
> As for the broken-firmware laptops, there's only so much we can do.
> A fix for this has been *long* released, but it's up to the OEMs to
> pull it in.
> 
> 
> I'm not fully sure, but I think certain subsystems still have the 36b
> address limitation (camera?), so it would be good to know whether that
> needs to be accounted for
> 
> Konrad
> 

Most devices only support 32-bit address space, and use a 32-bit DMA 
mask (which is the default, I think?) to only get 32-bit virtual 
addresses. Camera driver can set a 36-bit DMA mask if it wants to use 
its whole range.

This patch is about the physical addresses, not virtual. Every device 
can access the full range (without this, the iommu dma driver thinks 
buffers with physical addresses outside 36-bit range are not accessible, 
and tries to use bounce buffers)

