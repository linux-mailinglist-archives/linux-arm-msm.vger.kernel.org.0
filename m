Return-Path: <linux-arm-msm+bounces-68200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 811E1B1F472
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 13:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14DCF7AF89E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 11:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D651274B34;
	Sat,  9 Aug 2025 11:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lWyP8IBi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2055E27CCF3
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 11:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754740294; cv=none; b=rwpLvl2/XRDX7xtZUmZorVeS80zRq7HmP7c3umRICQ7vpuC2GfAF9v/nx/wIoKQyFpuITdIpjoiIOKYnBzmXOKdxf8So0DgrurMRmEtjoy4aqhL8I1zQSg8d/QEoPCiG5uqBMw7VJOkua97o2aQGihX+d9is2JE6fqUWW4e1PIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754740294; c=relaxed/simple;
	bh=uJhqt4WZm6zbKgUtI3s+WwMuCbXej23iFVq2PvOrM1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QAeRS/EsH2PHxqxKtqnn2up+wmvM4N1zq8aEoAzOA3ZRSCSti0Tdkemo5Ca3o+KS02nwC8Ys1tg50yL0Q2mOUfqMCrx/nPb+EJ9xI/TZbYVgCiTLOa5YFcUL69/eEQhoTO1R+W3tJeah6pq/vFpPUhongA2zcVMdsYNisaP8YPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lWyP8IBi; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b8d0f1fb49so1710128f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 04:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754740290; x=1755345090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EYbjCB4xV+1M1pw33WasqXN1dpWvlUReQjDjyIDAOO4=;
        b=lWyP8IBiHmaOtA9wzXdEm8Wy6jrTySBKcv2NsojSibdr51UZd7ECwlcMSvYPRlhA+D
         S9/6fazsn5PxeCnRQZ+Bi/9dy4wdrqVkinPNFI/9tqY7m+nD6g1nW169doD2dJbhsQes
         k+dBHrdRrcvaIlN0brRvy2x03HzWd9wY1BO0iopAd7oN/fnbTUCmFv4sz8AwAkPDmRiD
         p1bUj4g/Mt7CKUHO1Pd5iw/TnEf3s2W8F/w2Qo6rWsv/zsjPJJ7SUf7uJYfOYUjdAkap
         Nt/Z1rN2N3zPW6710UAQ1LuVdOR1SNyvYP3AeXFey4wKmuOZ3AaT0cHCUBjDZyf5sk2u
         H1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754740290; x=1755345090;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EYbjCB4xV+1M1pw33WasqXN1dpWvlUReQjDjyIDAOO4=;
        b=U7W3XcsEUdPHIUoGszRkhxTV/QEQPuxO41wp5F5snODa11+raughmayqvbnFszudgg
         dGYRYXDUZou7au8xMKg3GtkeqOKUG1pB2OcMyElhy3WpGi8DS9S03jbiPFefADgmT29Q
         AoqHjjIpgZpZj0op03IppJP2GKwX13RkErspH99jGsm+OQXOVIyCzOLAWdrWxGKEFmfq
         IZoX0qAm6DT2VhHwVX2zp4qQvtSM43VjJhg0owbVzn/OqRLAq+mrA9nSKQ546jOJmVCt
         tCq/Fli7X26VhQo6mRwyyxhvbFdh6Dim0Mxt9xpGKKZ9RcBj2YtBjW7n+RDhgAPhvJj3
         tu9w==
X-Forwarded-Encrypted: i=1; AJvYcCUN7x7xnXCOpjvmhZ6z7uQ2OMoUbC7PUrfvht+rRwD4ytxCBQDTrZoDh3yO81I5dERGx3MG9UZ+BgBPpjsR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Ckfq9gECWN4uqjwzGbuHquSepk52TOEQ3PgtCVR73fev1d7Y
	ymy+MszaMOn4GyeGNPCJOfA1X+Kwf3JqRq76pWdIaeXHvyigZ52CfirMtnx5Ys3diW8=
X-Gm-Gg: ASbGncsjQgNcUA+qyY23VwKGgTmztUoHXpoXKUAqtKtkl4iB6mL+ZfLYspYPbRJVgAp
	71nE1Q2jyprkUOPGCVjEygFusACDYF3A/7qkj2uq2DTZfqvHKLrSL2EMMOdyha1uhlBneHb8OZR
	Z8pVe0JxFkyJQMKrEoFgspqT38vvQ1LJxiZr3H9V1ZOviOKiqf7Ya6d8Vz5NjeIz/xjj3OMgo0+
	JcdwirabIM4dIcQ/NWzbxCRbwfPojvdCHn3FEIDYi3WsaD+5zkY6gv/5zX0BwXyPRwuRaO/PDcr
	s/kaDLVSarkBjvc7NCUSDyKiEsgzR6jN3xdY3EZAOECL+Ogf9SrHktC0HsyVz/4Zyu56J+RrqLN
	5SXehacTeeds86dz9sbF1NifDk2JxuEMlOwsPCucRG6el22rAQ+u6TheTbXUiTt/3
X-Google-Smtp-Source: AGHT+IE0Rtj5L91NaP0jrX0E/ptkxI8Ma3OVqNKK+/Itrgx5VDSb2ifujnM8t600+LIWY6n/PhpZxg==
X-Received: by 2002:a5d:64c7:0:b0:3a8:38b4:1d55 with SMTP id ffacd0b85a97d-3b900b4b71cmr5229667f8f.28.1754740290375;
        Sat, 09 Aug 2025 04:51:30 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458bb04c612sm295058305e9.0.2025.08.09.04.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Aug 2025 04:51:29 -0700 (PDT)
Message-ID: <ef236f1f-0b54-4b46-b509-2a4a181100a4@linaro.org>
Date: Sat, 9 Aug 2025 12:51:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with
 new CSIPHY subdevices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
 <dcc33f04-1b19-47d7-aca2-03d38173b6b6@linaro.org>
 <eb42d052-1fe0-49a2-9a83-05c5a5b7394e@linaro.org>
 <63ce3c8b-51a3-45a7-a40e-330839d7dbf3@linaro.org>
 <upuv35iaf27dbpr7dwxmmw7qd3ykszh62bbwxltwfexpwzgfvm@qpxeeoiv4zsg>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <upuv35iaf27dbpr7dwxmmw7qd3ykszh62bbwxltwfexpwzgfvm@qpxeeoiv4zsg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/08/2025 10:26, Dmitry Baryshkov wrote:
>> Hmm so that would require splitting the CSIPHY between two CSI decoders
>> which I'm not sure would work on our hardware, perhaps yes, perhaps no, or
>> routing both sensors into the one CSI decoder and then separating the
>> data-streams either in the driver or in user-space.
> The RB5 board provides exactly this setup on the CSI0. It can be
> switched between 4 lanes going to CSI0A and 2 (data) lanes going to
> the CSI0A and 1 (data) lane going to the CSI0B connector.

Yes I see that.

I see the CSID can select which lanes it maps. So you could have one 
CSID map lanes 1-2 and another CSID map lane 4.

Still I don't see how you could have two sensors at different data-rates 
in this setup since what type of frame would the PHY present on the 
internal bus..

It doesn't really matter if its a standards compliant setup if the 
hardware supports it either.

Still though there's no reason to have a custom PHY driver continue to 
live in CAMSS.

---
bod

