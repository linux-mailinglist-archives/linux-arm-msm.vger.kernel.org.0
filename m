Return-Path: <linux-arm-msm+bounces-28304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0106D94EBD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 13:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB4FD2811CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 11:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43647175D2B;
	Mon, 12 Aug 2024 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dS781GUs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898D917108B
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723462336; cv=none; b=jUle1p9wKy9ddzMHA79Og2rDlQWoyXDJFbQFjg73zY+zJ9t8Ypi0Chqlt4A+i4bNgFskb/DxGr1ysbPVLpP+4P1QZrxiWuTEwcnkzC7kCsCqlgHPBdXsapnNTS8j8lS4o4TVfAg35iwfMQu9pt5C8fuVVmOmGChlxDqHPA4dV5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723462336; c=relaxed/simple;
	bh=Sn9icOhMEkpoF0A6tI3yE7WA9lul1v5onDCX2r2+Qrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vd3x7fv1owoI222U++tvaU2YZuMgk2nl8FbVviOUtxQhoywoRZEAujN/8rGTjLM+H5SWyWNLMVMXcu9WW/uWIySFQ1F4VRKFLNJufObVXdGHnUVMNh2r5wParehX+pNytgKDvRfu9vpXLDTYelP1U4w5je7hsxeu6JicAm2VzbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dS781GUs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428178fc07eso28872845e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 04:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723462333; x=1724067133; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pcyTK/oFMaR/LKJwL+lhFRbctKc9N7kd/DA0SliDqNw=;
        b=dS781GUsOJpq/5SPqVVB60Ti90hTdYQZEfWn90Ul/xJzZp0drpkmPJf30f5VEKKphU
         aSle2ZnKdc9DLiP3XgICnWzzh2u/9ceeRvR4pHs05A9Tk7uigBhn9cVjMza+fgNGHcZb
         wNy+yY9uIheV/5u0It4vqdzx+zVBCwYIXWdj32wvTs02MMxkpXB0VB/8jNhpmm9wnkOX
         q9roSdAkYntSq7X9JZhupgJiZmS4ol8fSX1d1PoXY3PkwkdRLIafH2eHFOsvKkkY7sGv
         DoOZVkSEX9lJHtzMDIinS1ukDLu+jcgmig5z1K43om4tENRPcU7pS+PpAUcfZ634yCvG
         umVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723462333; x=1724067133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcyTK/oFMaR/LKJwL+lhFRbctKc9N7kd/DA0SliDqNw=;
        b=rM7TrA5noe3hAU5Fn/Mgpl9sLojDOpfxxm/lYDg9AtIBblMip/oENvMzgP0jeTrt5N
         vMeDUy2e46vgvpLQ6MnTULQBXkuSfmwPAwnNqc3nb2F3vVFUESWVrDlg/nPl7UdmmHHs
         ToKPEs3u3aG7H92axg9nrusLjgMQShpqols0qQDyQyAreldpOm25Dq0rtT5uG2NegNtu
         HT5zUVRMKzx1xNzm/O3zV2KTqgMtiSg8vfiUkC8ovuuF3X6h/Z9wMVh4FWStTE7Hxa95
         n2ohes0uQHkUGZVrwwTgqBB93SweeBYjX0AZW5nRMDFZBvwxPKgH/57lhZu1eGoCJ3GD
         c89Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWOPRcR12u9CESmjj2JpRlQiHETIArtzdrL9H6uTwyq9FWwaw7FBgOmvqoZionYnZ3RapLLeL33Lfjub/a@vger.kernel.org
X-Gm-Message-State: AOJu0YzP/uwdyr9Tc1mRA1PxvXJrlFuwPoFA5fCkM15LWBsi3II0ULou
	+K+GM8QNY1v6IdVU2LC70WMoF/LwlRTPHtTkXYhWajB+gkq8KKkWJRNEqRNd4AJfTamOYKFK3Zm
	JuQA=
X-Google-Smtp-Source: AGHT+IFKMt3nGJr3TmBQHVfbwLzP7ID+7QLqJpZ8Bb1C7l06gp6nyMd4PGALNfePozuyllzfm0jwZg==
X-Received: by 2002:a5d:4ad1:0:b0:362:8ec2:53d6 with SMTP id ffacd0b85a97d-36d61cd3550mr8292553f8f.61.1723462332792;
        Mon, 12 Aug 2024 04:32:12 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c937b6esm7261016f8f.32.2024.08.12.04.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 04:32:12 -0700 (PDT)
Message-ID: <e7476a09-4e11-4171-89ed-61b41c9f5cc9@linaro.org>
Date: Mon, 12 Aug 2024 12:32:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] media: qcom: camss: csiphy: Add an init callback to
 CSI PHY devices
To: Depeng Shao <quic_depengs@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-5-quic_depengs@quicinc.com>
 <6dfc2c79-fc6d-4eed-bf3f-94396130cb4f@linaro.org>
 <fafda7d5-3853-428a-b0eb-9993fc2d4f56@linaro.org>
 <4426c0e0-f877-409c-b2d2-a5aac5e8c645@linaro.org>
 <1226d080-d1fc-4e06-ac81-84e93cb314e0@quicinc.com>
 <8f935a7d-87b5-479c-a98e-c95671dbe259@linaro.org>
 <7c03280f-908d-435d-acef-b6bf4f865029@quicinc.com>
 <ff12ce12-41d6-4aa5-ab97-222b07146e36@linaro.org>
 <3241cc15-c920-4c88-ac53-005903baf9e7@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3241cc15-c920-4c88-ac53-005903baf9e7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2024 15:02, Depeng Shao wrote:
> I'm updating the code based on above comments, but I meet crash issue if 
> I move the offset assignment to csiphy_gen2_config_lanes, since the 
> csiphy->res->hw_ops->reset(csiphy) is called earlier than 
> csiphy_gen2_config_lanes, so if we don't have the .init interface, we 
> only can move this offset value to `struct csiphy_subdev_resources`, but 
> if we add the offset to `struct csiphy_subdev_resources`, then below two 
> patches are also can be dropped.
> 
> 
> [PATCH 05/13] media: qcom: camss: csiphy-3ph: Move CSIPHY variables to 
> data field inside csiphy struct
> [PATCH 06/13] media: qcom: camss: csiphy-3ph: Use an offset variable to 
> find common control regs
> 
> 
> Could you please comment on if I need to add the CSI_COMMON_CTR offset 
> to res directly?
> Or add back the .init interface?

Ah, I hadn't recalled why the .init was added -> because sequencing.

Lets retain the patch but expand the commit log to explain why the init 
is being added, instead of jumping through hoops to restructure to get 
rid of it.

---
bod

