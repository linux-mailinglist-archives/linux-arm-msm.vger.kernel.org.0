Return-Path: <linux-arm-msm+bounces-87629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F44CF6CE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 06:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A8613011743
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 05:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528B826B0B7;
	Tue,  6 Jan 2026 05:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNjpBhlc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KyA7cJYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7327B340
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 05:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767678306; cv=none; b=a/JI7wgS/jVRtvylhSMuO3XyybOqwfv0n1LdmwALF7Wlz797/bdYnLKl/U5sG/NtCQ2+xEfhMWeDgXEuPjSybhDSDGo56Xi8rtHZs9hUvM3ZYYr17Uga6P+SIz6yh+z+LuJOYKFE/X6Xhg9JJOCSJjcODKiC1ILtzYdM5doqw+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767678306; c=relaxed/simple;
	bh=nhhPR2KGGypD0IOWrskYEzwOrl/r2smGfV8MmKReoEY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=KbW0M0Uc+kNC3/K5cCkeZJYIdjaxUWVaqjzW/ou0QxiO7E+fKahnnINgzZEEHnhFD0Ogk2GQgAgFq3b7WRNkA2T0qieXErndeslq4/4rwtEMUbIizy7KOkDIXNm9Mpvc0Xl5rauT6JVEBSi/5shS1veePplWFiJ8kzpAnKoN0c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNjpBhlc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KyA7cJYb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QRRx3301262
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 05:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3zpdyzigLAjEo7mQktxaqaYyn6oPOGD+daHjfoP8rTo=; b=cNjpBhlci4RXG7f/
	WpuKMcXPCebOffdR9rccjQQqGLFTgtpOb0B2xXWgZBEI83+Cw8fOO+05BakxnJ2a
	TpIHbvqgzARE/YVydnszl3HsIp3K7XoH0jLSmc2gon+dhVAeEcb5E0gwtAinL6Xf
	M8zHqhiXAySZL7zNbZGwNXWPTe55N6K0MHv6jkF8hv/SQEE3YVTTJxYt65wtQvu6
	KIxNsM/W5aByYuQ1udABgCP/6LFWtu6X86w+WUbCfyM+BdX5O2ojvPHL18EYiEzy
	wbBArrv1Fl/083q0FuFMc/viKyY6b5CA0N6I1uRFjelYBOn5So81dIWfJ6yC4LWm
	WXlAYA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggsvsx4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:45:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f13989cd3so19759855ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 21:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767678301; x=1768283101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zpdyzigLAjEo7mQktxaqaYyn6oPOGD+daHjfoP8rTo=;
        b=KyA7cJYbx5ZHL+uCG5QdCGFNkggwBzbQZCI7NqlL2++wvJredG/zc9T85Tu/zyDqZo
         SmBnw/yJ3eZowbKF7XmZ+UNRh09Jwb1OeiDXoSUvIowFkoEZBb0i3XOu3HWwEwpo/G2O
         erAHlEiD083nY450sccnSFIuwUh1pM+7u7q5NeGG/29DhcOO2QASVD9x4Y/dEnuNsHxl
         8kXfJ0fWNemAaF6jnLp491ivh6acIHLh3Bhz/W7QzVyyS+8yBQnw/2Ng2QgwP15knNYv
         GqcKzLgLBGZhtOkh8BMHPaD9uX4wQZJfr4TR7aG0O8BCZwYScEpuPP/MP28E8CL7a8Wt
         84mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767678301; x=1768283101;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zpdyzigLAjEo7mQktxaqaYyn6oPOGD+daHjfoP8rTo=;
        b=kB03K1pDd2/CXlbAgfsPPm2YdevRs4dSzMbDkKAEaTSWkgyeqvZw5ATTAX2loRRoOB
         oFnm7wCKSOKfspt044TQq/cKnesX3/11kwJodBQ64rCm7r55k418Fxt0mivGA/FkA9lH
         x7wFMDPnLTBuT87kaN8VJr4ya31aeX9pc4TJ6z5BTiHBZD296fE82mubb+SpxLVh8XoC
         rusVOJKjEMJImxNH2p5GGpHN4C1Pfrlyjwc0RJULblCdwGYgPq0Ma2NqZMKBqYPcta3Z
         Yii3MKHkpjKHFX3ltpEwslU1uF0WAnelMHtG5w5MN/S+FixBAWRKytAxEm4Bzm3Z9MpA
         sTWg==
X-Forwarded-Encrypted: i=1; AJvYcCWh75ypiXSMtqmiOJvluU08NhowhOLY/3CbTx44UrxY7gKhFO8mScM577lMQ4Gf/a7pV1whdmG58wHHqZVc@vger.kernel.org
X-Gm-Message-State: AOJu0YwBcPZNxJoe1jhNSfCwAq86N0mN76fwLJc/LX+8a8zOH/9MNQ7I
	xo7ZMyEm2DBMP1G/ybl5gpBe/MPMKzBshV+NZrUfaoAj30g3OfGDufJUooUR57cERzcy7D/sS2d
	3DbvYZOBKYWMcgIeaYL2ixUDsLGvR3hZHHAFmh6/qPE08UBh+0jTlj/AE/C7dfpcbNswM
X-Gm-Gg: AY/fxX4cT+KM+mgqdbRklRZv5lPRZcATVURbfwRR80jiKNcHMb13SMC2rZd7UGDm7bF
	YTDbEHoNyzhoBBIDcBv5kJ7OpgpAxgwsjfpJHTeQ5GNg1WN47x8SZxK9ieP224Vxkoh52D/jlpe
	vC4Ih8eMLWoGE1QwoazKqlQ57YrQjvf9zOUyj8Cg8Te+fQYuGMC0JnoyaUulaAzCVhygtDQBxwz
	bIoRBPsqUqYpr9nMsEsRDFW7e98MEJoJU1HOkZ7VYDnuC+5Q5btMyy2FE8l13esrU5XtCAUhU2H
	f6tt6YAMvKUe6OAnmJgKJtU27GKUwQe8K6CJj0tUrlNnb+7C0jr+Bt3yhSqcUKkr5l75PhXYqra
	OwlEAB/JUe9NIACf0C2rjpEYSGL3qvkJhbqfcWFQ=
X-Received: by 2002:a17:903:2bcc:b0:29f:f91:35ee with SMTP id d9443c01a7336-2a3e2e09985mr18925335ad.43.1767678301256;
        Mon, 05 Jan 2026 21:45:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUtNajfA7FB86ejavhfAB7wkkTftBtj9lGaOd+v6dEs+toS1jZxcAiP9qDj7UtcBG6dBv76A==
X-Received: by 2002:a17:903:2bcc:b0:29f:f91:35ee with SMTP id d9443c01a7336-2a3e2e09985mr18924985ad.43.1767678300689;
        Mon, 05 Jan 2026 21:45:00 -0800 (PST)
Received: from [10.217.223.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a204sm9227275ad.1.2026.01.05.21.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 21:45:00 -0800 (PST)
Subject: Re: [PATCH v3] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Eric Biggers <ebiggers@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@quicinc.com, Neeraj Soni <quic_neersoni@quicinc.com>,
        Ram Prakash Gupta <quic_rampraka@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Sachin Gupta <quic_sachgupt@quicinc.com>,
        Bhaskar Valaboju <quic_bhaskarv@quicinc.com>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>,
        Sarthak Garg <quic_sartgarg@quicinc.com>
References: <20250718110217.1929526-1-quic_dmukhopa@quicinc.com>
 <a569a2c3-2fb2-4a40-8d54-898e7c36f4b3@oss.qualcomm.com>
 <CAPDyKFqgo4ewJxPOUmY-GE+CG2XUVGQvEqgTQnvo0MfryMemGw@mail.gmail.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <e1f689d0-523b-5842-3a6e-10b431d617ce@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 11:14:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqgo4ewJxPOUmY-GE+CG2XUVGQvEqgTQnvo0MfryMemGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dCliXmPIM1KB78oxU22IFkkLw51ktInt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA0NiBTYWx0ZWRfX04L+jUWpC+vd
 C8mAsdMuv6Hkk6y57G2aqxLOhHhNZjBlfRdKOXLi1AeCWWMJO/fXOSEJlldgghsK3BrzdCO9AA2
 gCRvlwfQ9Py7qJt1GLvOqs144p3MP13j1W7KUx/gYdaxqgczNTKPd+G4i/+E11OBedM8vW5toiE
 g086SJua1L9BVaVevw4FKFAItJhkNZfyKxwn40AHLlQ0xiEJsEZtSNaeyUHbaFn2lH9VCo1Ytmz
 VtwQpRQvRTHXOyk3v9sU2hB+uOgN9YU1hh9BBm8TeDzu15z6qtjBEr21S3BSsz26OQ32mD7YqBV
 tVqUU6dU5DIu0WFk9JrKPZOJftDg1hubRaTF7k5NZbwEXYkJYof1rDA3gDGhreIgK+Mvqc6s+Il
 8Zxp9tBn7tYQis0OTTK69UpreAYfHxecZuT5tjHD3/6YIaRZSyeCQzYwagqwVCPDehn1CiueYyw
 tmxtdGUVbZKU+qyTwEA==
X-Proofpoint-ORIG-GUID: dCliXmPIM1KB78oxU22IFkkLw51ktInt
X-Authority-Analysis: v=2.4 cv=Yv4ChoYX c=1 sm=1 tr=0 ts=695ca15e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=Uhzaoubin1Cl4d7E7s8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060046

Hi,

Apologies on replying so late to the queries.

On 7/18/2025 6:27 PM, Ulf Hansson wrote:
> On Fri, 18 Jul 2025 at 14:05, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/18/25 1:02 PM, Debraj Mukhopadhyay wrote:
>>> Crypto reprogram all keys is called for each MMC runtime
>>> suspend/resume in current upstream design. If this is implemented
>>> as a non-interruptible call to TEE for security, the cpu core is
>>> blocked for execution while this call executes although the crypto
>>> engine already has the keys. For example, glitches in audio/video
>>> streaming applications have been observed due to this. Add the flag
>>> MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control reprogramming
>>> keys to crypto engine for socs which dont require this feature.
>>>
>>> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
>>> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>>>
>>> ---
>>
>> Let's take a step back - do we need to ever program this more than
>> once on QC? What about other devices (e.g. the generic cqhci-crypto)?
>> Do they also lose the crypto context over a runtime pm cycle?
> 
> I agree!
> 
> I also think it's important to also understand what runtime PM cycle
> we are discussing here. It's a bit blurry for me currently, can we
> please clarify this.
> 
> A runtime PM cycle of the card, means that the eMMC card is
> power-cycled and re-initialized (assuming MMC_CAP_AGGRESSIVE_PM is
> set, which I guess is a downstream patch as the upstream sdhci-msm
> driver doesn't have this bit set, at least not yet). The mmc host is
> probably also runtime PM power-cycled when the card is, but it's
> orthogonal to the runtime PM cycle of the card - that's a really
> important point here, I think.
> 
> As I understand it, the crypto context is not tied to the card, but to
> the mmc host. What happens with the crypto context when the mmc host
> is runtime PM cycled? Is the context preserved? I assume so, or?
Yes the crypto context is tied to the host not to the card. In QC case when 
the host is runtime pm cycled the crypto contexts are preserved hence reprogramming
is not needed.
> 
>>
>> If our hardware is fine with set-it-and-forget-it approach, maybe
>> we could limit this to a small if-condition sdhci-msm.c
> 
> Yes, maybe. Let's see> 
> [...]
> 
> Kind regards
> Uffe
> 
> 

