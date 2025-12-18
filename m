Return-Path: <linux-arm-msm+bounces-85700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F59CCC10D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2892300AC4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0481E32ED4A;
	Thu, 18 Dec 2025 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AV8USH3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MTjCjkyy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E85E330321
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766065447; cv=none; b=d5M0NlStSC9QX8oZe51TrmAn50ygZWrCL/XKY9+Aq0jOTVIwBB1On4RDv9JofV8/Bfnn8EEE2JH11Koj3zC96tG7VuZA7AHvB5oTjf4zS0lXifbDJL4ypNKiS1yw4EBvwh4P5GBRh35gZbCoqvsOpw2z0FWWE5OLb7Ji/oI1Y8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766065447; c=relaxed/simple;
	bh=Sh3nU8l++Ux2dtqy/VhnCDybc5nvFmNk8BBSoqTEYFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EcsAR1qaFWn1UNr7EpCAngmge4X7cEarCCHwEYgCfE5P/R9rCjY0swrbirvSkhrPFu3G3RevE4Q53lCM9UGhVtLkkAOQF7EX1JlANqRsf8AfHjYcbV9B3KLZKeBo6ImXQ7cWFtOmnwq8f99BlN04TrJUQ4Mm/HNKqNH1AWv/iFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AV8USH3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MTjCjkyy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIAMZqK754949
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCmcqY4oHVyAXgvmdllyZDx/cRjjLaxj8tymQ3e47+M=; b=AV8USH3VZ0WUHojp
	wu+Mcq2xMK4K3K5+qIkMMpSxUVbH/V7VYuyX3v2iwZed5a20URa7A3WVI8zgupI2
	wbMCweTvchjOoYWe8r8Dx06D4Zdyo9Nqb6BKBE4aH4CcEUBzym/SFjzMAJTkKjib
	vRadA2M3kLQO8XHt83CnFdEnARpdzkhCXPV0PJhsa5UM+rpH8GsTxaYyWgGFskVy
	/rZmpORtSF7EAa/Fd6bwPncP7JYDHhpbtxIsIQAty5Z1YYyQEkWCtdoBeDLLTqgA
	v5eQOX3SetrOcvRxJA0feTpJV4VKs2wCy0UyDO5D0kJZsB7ZD6eo9yMu1EOP3jsn
	86VwnQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b49v0ss8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:44:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee07f794fcso1694211cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 05:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766065445; x=1766670245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FCmcqY4oHVyAXgvmdllyZDx/cRjjLaxj8tymQ3e47+M=;
        b=MTjCjkyy6Iw7UkUdibhPbLC3lFRte7gCfSS/kMDTy+5N/V+vM4fN21wQ2twxpsILOF
         exuQ9rY1QY0U9YukrJiw8/+PeZkQ/rNkdnEni/5w6DOgm8R6/FlpdhjG6XOjZ7yNaBps
         NHSMh/5fDP44s6DiRrGuMCd54o3qfSsESehgwbKwevU6VqrCTAYAPd7JK/VoSKpzF+dH
         ucSdUL9960PiDiHDP73WYu6OAyLoGEr2PjxiPP3xrXBvKyRfkt/uvwO8S/+IdV93xK+k
         3WmJnLQk2ZWuj3KECtgj8nTbqp7y2MQ07iLC31rziqkIs6UjctFwFvb4vw22sCmTrQ0i
         vFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766065445; x=1766670245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCmcqY4oHVyAXgvmdllyZDx/cRjjLaxj8tymQ3e47+M=;
        b=iWu/x10nveLjX7yHhKcatfuD5iyvQkyJjlbatHRx0WK1RELDpeuW/Z9y/MuNLwQRAW
         W8hIMeoVsfXGrJX1UNHlBrO7R9sAimSDSzbk1LPHOlgK64VQhXkpfZuJ4WL2fvj0mHyU
         O43VU7w7Hi41rSwkRU/tjs+fN3mZbf6bP6olW2Vi4vSnX59HD+p5omqO5y1I6M48QFHm
         8pe2U275O1uNYyQw5ucrIjbHrj+E51o+0eInQ21ipPF9nLZcWBNGLjrUXKUrYquF4LGz
         jfKugkGsf/zuBzBfSz3f1Tq61KEtYfaKylATRGsFnc8uzczENzCssYm2sl8CLKTN9pC0
         BxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz4dJb3WBeFzpWE5mkj1z1Wsw7hS+YlRNZYGeZAmjclRalZA0+C1YWdViBUuo+1GrvFRK5CDIwoFN7PggH@vger.kernel.org
X-Gm-Message-State: AOJu0YxeeSH41+wp6FCUThWYYv5/tXjSOifpU6FKF5iWn0hb+21AJEzG
	aQF3LgbFlSHObLWdH8roxwAZXhlkPvImu5+Rdq2w648/Hx9eo6gdzq9JSoMNhkAvbT6eRGbBTQZ
	KtjiRmPfszkArf66DQvnOax+SwJ+4MvftFig2+Jah9J9Kf98axViD942na1S6asYy4sLD
X-Gm-Gg: AY/fxX4qwEzL/oeOlXYvNCV+JRGJhBeSWAOpq1b+aKCAJv6M5p+Jw5A+WvsQRQVvhCY
	l7EPDyuXB0R7g4s28OgCa9KGlTjJMEof162rjje70nLs7xzIqhjQmD8T9EzeUdKMEI25e4Fy76K
	IAC3MCqihrw6eYVWlW+1fz5ii8IwHsMLmC8pn9wziHlX7LoeAKxtY2Rc+H333jCNU29OvH25P42
	EFCo0XAnJx4IJemqHNHHYMgqn0zOWIaH0hT5kWsDMAMIEga+lPLM1jUQ8yDwf5iGEUzXPtAdcIw
	nD4HKapUq/1X9/4MmnPbslfyQWGOvEdvjjuq+3h7xPxt60jqTtqWg9RqRQtzce8kYwX9k+TigF4
	r3Q/N0KTQoXUAYnGUoc0GjcS5qjP6OXrtVbH8hElysPOYhrVKCjyTUnXRZKDVc3UFFg==
X-Received: by 2002:ac8:5f8c:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4f361153914mr20293521cf.8.1766065444951;
        Thu, 18 Dec 2025 05:44:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGy2YLbHYuIVJJZd7FeQ6nssY/Zo3SH9ah3ftdjlIsWOeG3teiAIViN3hyRdsBNYer9Dp4j3Q==
X-Received: by 2002:ac8:5f8c:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4f361153914mr20293201cf.8.1766065444513;
        Thu, 18 Dec 2025 05:44:04 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8022f9531asm235427966b.14.2025.12.18.05.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 05:44:04 -0800 (PST)
Message-ID: <a709a83a-326e-4555-9431-1c7654793157@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 14:44:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add '#cooling-cells' for CPU
 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251015065703.9422-1-mani@kernel.org>
 <itksdoavfha6xnozfrh5jcc4g75gcfyxp7ns75yz7xfb6wruy3@qwkcavvxrljp>
 <qzpeft3wmmh7idysviyevrmfs72oeoz3c4dddizfovd7ix7yoq@6vtqz5fhknij>
 <b2bff591-807b-4041-bdd2-feeb89d4f7ae@oss.qualcomm.com>
 <isjyk3ngoyzzhf3c7edntb23n3smh2uazgeyhwqnzjvdnafzmq@42x35y3emgkv>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <isjyk3ngoyzzhf3c7edntb23n3smh2uazgeyhwqnzjvdnafzmq@42x35y3emgkv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qtmD84Ara_oqnZ-IVKX-sxOPAnITcL0D
X-Authority-Analysis: v=2.4 cv=Q/HfIo2a c=1 sm=1 tr=0 ts=69440525 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sh6TG1aJ_FEJaHHsNW4A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: qtmD84Ara_oqnZ-IVKX-sxOPAnITcL0D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExMyBTYWx0ZWRfXx4k0JaXUXh8h
 41cZnD4+OGdZ6HkGh4bmkbDLM5Mxm69aAwD1/l8WePgsUYVqqFVhmRBBXY6TgVn+Eh9Ggy3YV0q
 PFBEmOIc+ph34i6qKXXaMnqW7CeC2qs0d/7nLfVNQeyRKkljmy1GaSkizEKMwuDvCcEs5Hg/STJ
 4vC6I4sNHwh+Us17atNR4LyHm0F6CnVVGSntAuUtDMghOZmVf8l15hVhA4X0x1ri5ctsB1whpF9
 /+JnowEUOjlwjS+iRhe5pWNFr1lGOXA3+v5fS2aemcBbi4/iIE55GlceeHHpxvBoib7pIGdDXRD
 ky1GHJ11uvVcHv5nZlL9fzWuFLNi13IPIJ+hZ6OTqIIdJWJn5VOW7fRURpY6IF74vb+0NYcIP/x
 iqCE5WF1GDQBzOcCIXgxseCrK+dcJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180113

On 12/18/25 2:40 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 18, 2025 at 01:54:30PM +0100, Konrad Dybcio wrote:
>> On 12/8/25 6:13 AM, Manivannan Sadhasivam wrote:
>>> On Sun, Oct 19, 2025 at 07:01:30PM +0300, Dmitry Baryshkov wrote:
>>>> On Wed, Oct 15, 2025 at 12:27:03PM +0530, Manivannan Sadhasivam wrote:
>>>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>>>>
>>>>> Enable passive cooling for CPUs in the X1E80100 SoC by adding the
>>>>> '#cooling-cells' property. This will allow the OS to mitigate the CPU
>>>>> power dissipation with the help of SCMI DVFS.
>>>>
>>>> #cooling-cells isn't enough, the devices need to be listed in the
>>>> thermal maps.
>>>>
>>>
>>> Not strictly required unless the cooling device and trip points are wired in DT.
>>> But I don't want to do that yet, and just expose the cooling devices to
>>> userspace so that I can experiment with something like thermal-daemon.
>>
>> Rob, Krzysztof,
>>
>> Would it be an overly ambitious idea to make #cooling-cells required for
>> CPU nodes? I'd imagine some sort of cpuidle or cpufreq is desired on almost
>> all platforms, which could be used as a cooling/throttling measure..
> 
> Looking at my museum, i.MX devices don't have #cooling-cells before
> i.MX6.

Right, but they are still arm platforms so they have the wfi instruction,
meaning *some* sort of idle injection could happen as a cooling measure

I was wondering if there's any ancient platforms (probably from the 90s?)
that wouldn't even feature such things (and hence it wouldn't make sense
to define CPUs as cooling devices).. such old platforms would probably be
single-core, so turning off auxiliary ones as a last resort wouldn't work
either

Konrad

