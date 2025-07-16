Return-Path: <linux-arm-msm+bounces-65302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4137EB07A8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 18:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 764A0171770
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 16:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF412F4A03;
	Wed, 16 Jul 2025 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2RIXezB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86AF273D72
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 16:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752681624; cv=none; b=NhNhJ/zN54svE6lpDHeTphQK2aYYfDdfByxarKkaUT/g7GhiFAjv/9hjhY0Y3JuNL4bHoMspbKnnqAtBYgVPiAOvVpsPzwcdYr2975FBhm7y9x5i2dBt4BPE61kSrMFbGzkkoGA+chlyT0SS6jsm/mrOHVLJPYfl5ZOBgeJIoIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752681624; c=relaxed/simple;
	bh=ADfJz7MDETMJX4ewoMWeIUjHHd+wXJLC8WGJglMDlo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TiWpeiRL/bmh8H/imjN5r4ZnQPpR0sg0CJE0JhBXbhuPNFfHT/lBBiwjja6LIOfwBRnAa0aD2aT4ZFwoz3XrqIQIIvUCzTGyUTwIilkohsBbJGWJK246pnJoIOWUVHUoUtLwzR3JhI0uSYJA2dqJbbpXK3r3XpSnGK5qoyuyhQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2RIXezB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GC8bpa019476
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 16:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lj+0IuuDHDUmFIdwpugsUGXQmeDRIR2QIraen0zZdPw=; b=P2RIXezBtOZUtoCo
	dCu0E3V0aCFawd4kNaX0k+sNp4yFzOd8fmTgSDDzD/YcO9ct1P5oMVipzHc+ejuj
	cqpAuxQ60o2Qirb989CUCowLHUuOsU2LnAkjT+/jpA2oq3aX1i9OPkEkM6staE1A
	Rd8G/bNp2J/YTcJvO/fP7LwMGaiymm9rHl0UJfg2r6eQ8wL99wNhuCatfK59IznS
	9mJfP5nipEAt3E0ET6lzW5nbm5ITCF7M8whpvKlVFIfUEA/SR5Pe6RD3cPCPGfyU
	eSiKN9BbJaUOFvaSjVvi/WOXk5fVbOnUVyP7AKt0ZqRBecraELBQ0rkFvJiQwJIU
	cMyDSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsq8sg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 16:00:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab61b91608so74531cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752681607; x=1753286407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lj+0IuuDHDUmFIdwpugsUGXQmeDRIR2QIraen0zZdPw=;
        b=P0szTpsUaOk83PbOt0jLJI1gynVNOd5/IwQFh1nVjNCnU9+NZJ8N+6X/I4dopjSl47
         PRHTNHco4YGhNFnetk2LBeyicbXGdKfykoUWtVqqEnWDTuXK+OEW+1mA55vI2rIUlyxx
         cCP8qp+IwARWW0biN4G108w3SXsaw0FCzMN5OBgznzCKwIoVYy8LiC5qtMzubS8nLLKh
         Bk8NT52Jc+4WOAP41+fq5akHI0bvnof0jDrgw3dDzVR0DDQPkTYvPGs1+dMYMNgc9kHK
         YJ0prLT5g2sXDEnF2UYWbfngg8X6XB+jECN3mIphb31d7QutLRPdpDkbRcLSJLia0bPz
         GK+g==
X-Forwarded-Encrypted: i=1; AJvYcCW1n0cOCNIqGbx7D+0Jkj+1cuxNBSkfT8QSlcCfgMscZs9YIs7COT+fny0bYAJxL8/Wz11ME+TVNKPiOYIp@vger.kernel.org
X-Gm-Message-State: AOJu0YzavZCIHp7NIFYkLioQiYg7NtmBGuj4OZXVkpRksLFq7x5NMLl+
	kbzeGCvLp/mBaA6jBx8AcTrLpIAgO33SAv0by7QxH9QpErytVj/GPNDk4dF8herFVEh7Jjy+EjI
	XjPbQrkY2vqjKquSKccVOapFf9xAVvyX5xoZ3o3c82WhyaFxDJHNNPd3nf2OEL2aj5zEt
X-Gm-Gg: ASbGncuRX8Mlf/d0sq3fJTw06B2fh7nM52CumxwCnRfn3Sa0JFz9ss7Ae2eu/lD336E
	k5t3kzhtQxYaWW8R6/ZsBb/IexbsA4q6wgLjoy3K+x5FvCRkEMzmu5rdgMy/4Vnn9uzsr0rh2ER
	Udvd7X9JrSm+IVeKLaNl2tVgBoV52+4zbSqZcRW/G17LeZTkRFnG4uBm7HTs9fP//AY71GmJteF
	CZr9uo8e0Gg403GPyjYV6X6CsXxooiVUxS6BeadhdTarZsh0yS+QHwdvsvZGYSd/iESeDKwCqhD
	EnlqfOpN3Tb+sDEcpfrI90uvwFbFw8fyEpwqCykHDbVFLpDruwJaqF6+4zRlkcV725Ow+3ONGbT
	7ujfA+J8Dzz8RcdRnoPRn
X-Received: by 2002:a05:622a:1493:b0:4ab:63f8:ef30 with SMTP id d75a77b69052e-4ab909a993emr26718331cf.3.1752681606784;
        Wed, 16 Jul 2025 09:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERe9JVAY73uRoPOiv1ZYx9NVNl6QHqwUVE2Ldheh7YUqMzUCoLVYSOkjII3/ToglVnN0G05Q==
X-Received: by 2002:a05:622a:1493:b0:4ab:63f8:ef30 with SMTP id d75a77b69052e-4ab909a993emr26717951cf.3.1752681606283;
        Wed, 16 Jul 2025 09:00:06 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c973439bsm9070642a12.47.2025.07.16.09.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 09:00:05 -0700 (PDT)
Message-ID: <9429c00a-b044-4da9-b380-a03d298da7a1@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 18:00:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop unused
 bq27z561
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Arseniy Velikanov <me@adomerle.pw>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luka Panio <lukapanio@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250716141041.24507-1-me@adomerle.pw>
 <20250716141041.24507-2-me@adomerle.pw>
 <c6od65q2e6bnz6jxq65ox7burhjavjmooe3vq6nhhfq3ikglz7@4ufcxbjhp23o>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c6od65q2e6bnz6jxq65ox7burhjavjmooe3vq6nhhfq3ikglz7@4ufcxbjhp23o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=6877cc95 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=bjYnimzL4-PixQkOYsUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 6aavi2GVDTBR9jZ_nosh5Xutjw1Vr89M
X-Proofpoint-GUID: 6aavi2GVDTBR9jZ_nosh5Xutjw1Vr89M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE0NCBTYWx0ZWRfX8JqJd7B9M0/M
 wRCgP5ekniLZpqDnR+hKwMOfHtn6Db8eaNGCxMoAGJ1ZQFG62f12+4RMRGwCCq2HremsbItB/cc
 ScHJpL2A0nS24JrGlxjx23sc63wGRqP2TrOhDJOFWBwaMefr+ImjpgkxtcgkdwmVTuNwEkBMOBL
 OzPbpONnoktdbaankNP5cnbQyIEO2DPdMDO+4qOJ8oOwoInHUHkGnfq7HNHpdy1e7bgHAksq2NQ
 bS7nrGoeiJvnFhUL0CYzue1T77IxOM4zZXmU36g7uC4wZRLSSpIswkDn7YhXaP6QSwvEsaDXzUN
 7yqAwlvvxH3rbFPr6IDi0hnzDf4kOWQ8zhce3VKeAxOGrg5WVKE46liA1D12jjCfGdhHQ1FcwBf
 gqAt2F4EfF5SpIGeTlx+ckGnllr1XTImjEJq1Gi2+OJMyIm1LnZjfMk/LIcFkuhGHy3+3X7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=842 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160144

On 7/16/25 4:59 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 16, 2025 at 06:10:40PM +0400, Arseniy Velikanov wrote:
>> It looks like the fuel gauge is not connected to the battery,
>> it reports nonsense info. Downstream kernel uses pmic fg.
> 
> If you have to repost the patches for any reason, please sched more
> light on the 'nosense' you are observing.

Since it's actually onboard, it would be fair to assume it's there
for a reason.. Does it also report nonsense when running a
downstream build?

Konrad

