Return-Path: <linux-arm-msm+bounces-68101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82519B1E520
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99A0F1617D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1098C1F9F73;
	Fri,  8 Aug 2025 08:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tej4IWsX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FAB25CC42
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 08:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643507; cv=none; b=r4X257Z00Kh88/cvR37XlYzFuDOau4cFKUs6NhSlIy7uBwnpKsh8uM9I7lZk0BS9Cz7l4P90U5AYdSqDF3qb6qyHJO6lqz31/mmY9XtdJY3ltxNO1kvkTGImP8ckUm/gOfw2GsEPiO9hSY9kD/P1eKSN5YR/zZ/GRB7pJCLyvMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643507; c=relaxed/simple;
	bh=t6DFxcyLHMC844tzFgeCODmtYEMwsh8pJywnazP2Xqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIgkejmZMqW9zLqKutZIuzmuTWQKZ0MM6nnnh5gOyzapUoljfr/km4m27iCU0IsP10VwVJZxkx4iRzo2quojqU41pQgn2W9aFmYisgIr412kh5KxrCIzTNTTUThwg34J0l/t+kKs4MoQQ0TaLgEVZ4PFytDSi0npAW5jSGbdpvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tej4IWsX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787INbj001872
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 08:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R6Q9n1VBcmPjQskeZ/W9TfLHZuyYCWbxE9Bhoq5xM3o=; b=Tej4IWsX+JmGeVih
	QSTcVIuaVYUBxkH2Im54AmnuSffT3Spd1cVyUYPXW8bkSPidIuSLIGmbl0kGo2vz
	k7soJ6D99KF8nTutfdtUlYm75nq8UFgTkWohLTcaNCLAlll2DDDWrOLmlSZDmwrv
	ka6YRXkaylQzKU7E4/W3s9GYhOKZ6r45OFhKMgGSJv7mKy50uTpJk3QqPB1Br70m
	xFqMc+l9ddQW9j0Qb0AuqHqyBmx+AVyjsyDBe4E+a90Gb6qLOZTNEC9OlsjzJ4aB
	aaaT+xbR7fff7DjR17v6OOexpWHE4KE0HiW4BzLu4HePwZfh+bgjw7IoyHUGSETY
	sW/bbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw39au1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 08:58:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e80143e64dso87964485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 01:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643504; x=1755248304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6Q9n1VBcmPjQskeZ/W9TfLHZuyYCWbxE9Bhoq5xM3o=;
        b=R7ZdV0cxDmshVgRAFcvFEPm1iIs3v17JvCy6WaXpYhtOIwre3Sfrn1CF9y26tPcAVI
         ifzr9iYHJWoXoV/Zx78a2VM1rCUFVGhuzQsR4f0doFZ3GYSVgPw0GBOLcN2M6m7yMBbh
         u/8/lyEgwpxcXn9+FK1rx4KX9iRLMu3LPDVt5y9oItwHWPA+qw/IFpOVaTdHxZxVnweq
         oPehoGAvH7HkskbILkQ3NyDLctr8eBjAbtUSnTfXdD1suoanWAHSM3n2QjoXyJqG1u3y
         HtfiMAPYThzlJ5LlPykcjHByqZxOzEeVWLe7VbgTtcQLFFE+0EAqf0pkdCJchZ6NeBfq
         LmRA==
X-Forwarded-Encrypted: i=1; AJvYcCVJNHhIgMjGD7k2mW3GUluEqjYa3l/GBj8cOgEImE1DFr9zZgCkVAh8UhBzzurSp7ReJzHBiuutwcYS8aBq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/xmy4hafnJZ03RjNkWZLrgpQhw/ar9edVC/C+junM5PT2Ijc1
	Bl7UL4w2z91t8rmimGE6dUTJtzvy6+69r3NFhsYLt28riaDTlKVDZ1EKebsGm1UP62oxxTnR5Wo
	O0/8QtK0o7d6Zd9q2Cnng7LjbaHpgP9j7gltllkLwjI+ET7iRDBC4X8Qd938JvRaF5tji
X-Gm-Gg: ASbGncuzar9xJwUG1UBjYDYpISjC3rLNoSRVRlWRFE5pgi5nPnWoKfesxYpGsj+NJiy
	wRK4ThFAqSKsWavga02BxaecVJuub9wqJ4gnCV99hFi77f7Pe4/R5GWaJBUyKLBQJGQnjUhH53t
	ionHBkiKGgsq/xPTO3c+guE1S4FRpkvVNKWABlHGdF+YurpHEmspF6dCtKPGInemYGY6FLAhsvS
	DOqJKp2CT1MzYc+7O1tLhRsZmtZtCZ8sMbf9YgKBWoRzqrKCGAYP70zXKPZKIxlXZz40zfEP4sJ
	yoKVZ0UK0bBBXQNDLtbljMOujN6mX4woov4wGFdL2An84SNyAsKViWam8IRvi5zedre7iRj/t+N
	TGjRZZtgsKJPrbH9Nfw==
X-Received: by 2002:ac8:7e94:0:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4b0aed20c07mr17186181cf.6.1754643503760;
        Fri, 08 Aug 2025 01:58:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh16OD+ZoyT6jx0iozIhaDryFGFQR4TtUyX+fYll//iyn3c+QGTMne8GP/ly3AC+UnMV9iww==
X-Received: by 2002:ac8:7e94:0:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4b0aed20c07mr17186061cf.6.1754643503317;
        Fri, 08 Aug 2025 01:58:23 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a1bf9sm1460998466b.31.2025.08.08.01.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 01:58:22 -0700 (PDT)
Message-ID: <9af71063-0629-4ccc-bc76-3fb588677bf4@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 10:58:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/4] arm64: dts: qcom: sm8750: add max-microamp for UFS
 PHY and PLL supplies
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, conor+dt@kernel.org,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-3-quic_nitirawa@quicinc.com>
 <20250808-calm-boa-of-swiftness-a4a7ce@kuoka>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250808-calm-boa-of-swiftness-a4a7ce@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX1Dp3zhtbBEG/
 qTf4zzbl7SwxeWOnNPQUgmkQ0dabf/9l9q/0HCWkzle2HTutnHz6zgJxs0LEN65hMK/uebS5Erz
 UXeH/1r9/9IrYMbu9YvqI+Lpb6cXeywTO1fgyTSEZpXZEGzQeEOU1DHmLOORnLCunJCcVNwr78X
 Xz0HOPOJq15SxSk+hiFeQZLVHb8Ja7qA5Kutg2eOErd41iyc3z0HoH8d3MdXrCKqvEnqHH1nAOC
 R+6Er4AC9Sfas6xpSyxlqJZ53HjisGlgC2vbSPhF1kNsozAc8uQW/KqYJXr9ST05ZFPX1360gMS
 F0b0kXIDExcs1D7lRBMiujA9tRiY7tZVWdJjEqVzLCRoEhTxxHN13msVHd2hgD0zOseL+NMfiTn
 HfpWy1D2
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=6895bc30 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=WmDcBHyyyws--uAXJ9AA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: AY-IxDfqzLHsf3wdMpTxhx9mz-6FboMx
X-Proofpoint-ORIG-GUID: AY-IxDfqzLHsf3wdMpTxhx9mz-6FboMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

On 8/8/25 9:29 AM, Krzysztof Kozlowski wrote:
> On Wed, Aug 06, 2025 at 09:13:38PM +0530, Nitin Rawat wrote:
>> Add `vdda-phy-max-microamp` and `vdda-pll-max-microamp` properties to
>> the UFS PHY node in the device tree.
>>
>> These properties define the maximum current (in microamps) expected
>> from the PHY and PLL regulators. This allows the PHY driver to
>> configure regulator load accurately and ensure proper regulator
>> mode based on load requirements.
> 
> That's not the property of phy, but regulator.
> 
> Also reasoning is here incomplete - you just post downstream code. :/

The reason for this change is good, but perhaps not explained clearly

All of these values refer to the maximum current draw that needs to be
allocated on a shared voltage supply for this peripheral (because the
supply's capabilities change depending on the maximum potential load
at any given time, which the regulator driver must be aware of)

This is a property of a regulator *consumer*, i.e. if we had a chain
of LEDs hanging off of this supply, we'd need to specify NUM_LEDS * 
MAX_CURR under the "led chain" device, to make sure that if the
aggregated current requirements go over a certain threshold (which is
unknown to Linux and hidden in RPMh fw), the regulator can be
reconfigured to allow for a higher current draw (likely at some
downgrade to efficiency)

Konrad

