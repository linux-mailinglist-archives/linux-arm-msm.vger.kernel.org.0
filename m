Return-Path: <linux-arm-msm+bounces-57475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E680AB194D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 17:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F17063B368D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 15:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB56231C87;
	Fri,  9 May 2025 15:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtiMTzwy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0828822F76B
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805953; cv=none; b=BYO5+6DxTBjPg/YatM3FECkGORN6rLsXvFLJaU4deMVsB5WfGCKDc40HSc0Sxs9dg7SYn2xn5v0EYcEU0GW12HzVV619Xdp0RlkAbFD9lxvQWEZHHn0337ZmwesbIGv+QvwsH5tykx0bIpRyEW+uaEtx6VOYnjzd0812FaX2qIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805953; c=relaxed/simple;
	bh=Y/eSZfZFtNCyAe118lul7Kok5V99+6/bpsXa3isPhD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXn33BU5G3R3EOSdjtoUiag6dS2AMS+5gSRZd36TShLKDaDucBcLEJ70QoBYbyxA5K9FMK89Od+mj6aPVCHr6E/TQ51xItB6/S689evSOGQnvv1pD2kpmANKS8EkNMdaC8iWKVp49vFQxJx9DX+wRV6ARSzb6UEPCX0Zse0W7HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtiMTzwy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BDrpn030761
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 15:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OgpdIMOzRk6f6Ol3Oo2lwgI+bdt0V38jDJzDqsqNV2I=; b=RtiMTzwybNjNSW9c
	hufGWZfhosdUtfaaQQpgabcB9SXAXgjLDCwLxsSwvX2vNoWCHBJpoUPQsndrBofM
	Xkgxc3VJEJI2fKbS01gbsjT1nF+vUg8TR66RfujbvDP1cnAQ1E75gAAIF48wfBA2
	yN9KLaOl+SI4YRLqesP07oxJRzYlHmgN+56B38so4tS79n5UF8/OInK0ZttWCnSl
	uk9Fqn8uVbDYwc9a+sRM0qSNyg55INx2dw+ZRirlA/1YlSHsPTcnJNGaRzfcY6d+
	EXqc/NlBWno0PBEQzkMf6Q9oH+VZa0wtxxmyOtaNanf7cJJ7Db/2fro3BmnCAT2h
	qxWTmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgn3kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 15:52:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54788bdf7so9044385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 08:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805950; x=1747410750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OgpdIMOzRk6f6Ol3Oo2lwgI+bdt0V38jDJzDqsqNV2I=;
        b=ZV193w37HNEHfl0voRoyuqT/Mx0wH7DTZswXlXy8NksygQpErJemKGlUMEo77a60c5
         WD9c1GMRurIUPMkXxX9St4FMaLVDkV1syW38v69A9l+t4OXsEcGvRXS5+/oEI+KVzBXH
         pIAocvYW+agIXg3p91DpEId+EzIGc8Lv7CgXRMLO/pWRaaOC/CAhVm0rGt0eJPlvnnaH
         ulPDCqcSq8MXg0mSJcWd9bWE9XHTEw8LZkmqqw4G6ju4inI0t0/ZKtjwyl5vfUYyeOqg
         OyFuMNV2eKw45FDCddR0cNq+eySAnr6XxCvwePc8Aus23Lp7fRnX2NS1Hbwuf88iNWVt
         jvwg==
X-Forwarded-Encrypted: i=1; AJvYcCW64n+SK9c2ooiKuBPDR8pFRWoRnwhOg8ZB6zu3QiOx6tIz2rfCqescRHdxXd3aOQw8NMR185+okCtxkYZh@vger.kernel.org
X-Gm-Message-State: AOJu0YzT6qu+gNQOS8qwXE/INJcJpQX4P82S8mxwkEgZH0cqeCJ26neB
	v4pq6KPxIE2GFORiq5bFAjVPWGu4WH8Sh4gq5Lb0lfZJbE2E8ibl8npDIHB8J3l2hI6FkICG/A4
	S8CcCUIS9p6EooOwtPIr0YOhYdn9ruwWWWBOb9YHzwAXvDr6TXq3msYD+voKLDJZH
X-Gm-Gg: ASbGncvnGxSdA2HLCTiiAnZnkZseNXFRMCQUZwAdxoxKDLfKFubm6beezIpoWgnSEBb
	d0SZrt43zjsCf0rXZRsq6Gm4buRWMJRVaiuMkk4pvh/26lABrL3tWKITky+qSAV0greT4OXsQRs
	XqVleTPWgDHY+qdKak2NOuMgETgdGM6QrHiJIeplW5m5T6CtbfoxjIhQ8mCaH/iyifIBmcv9Lqn
	kYaQQcezt87f9Og3FqiFwq1i80HmXUQUCzeImZXS+55S4CbpBUIolys0BE8H4a4p744OFRMqljk
	bTLP2EwSP5nm/ai0uiyWd3IW+BEpoH6gH4wN3DfE0OG/u3n+hsKzW5WHGWFWu3qZaF0=
X-Received: by 2002:a05:620a:290b:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7cd01108cb6mr239887485a.8.1746805949858;
        Fri, 09 May 2025 08:52:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6vSB51mdOZghOfvmG4yP63LfVUtSo1UHFOlSG6Oe5suFemWAMe5tcTQ95NoXx3vY6htX1hw==
X-Received: by 2002:a05:620a:290b:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7cd01108cb6mr239885385a.8.1746805949419;
        Fri, 09 May 2025 08:52:29 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd37dsm166816666b.124.2025.05.09.08.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:52:28 -0700 (PDT)
Message-ID: <9010219f-a3f1-4869-84b3-b4f6c5e9f05f@oss.qualcomm.com>
Date: Fri, 9 May 2025 17:52:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
 <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
 <dedbfb2f-012a-404f-87d1-2f3cd04b0e74@oss.qualcomm.com>
 <CACu1E7EfgPFcSgGA5TkAVqpO=K2G1AjNVbRij60TknCx5PcoqA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7EfgPFcSgGA5TkAVqpO=K2G1AjNVbRij60TknCx5PcoqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681e24be cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=0-j0KOu8P3_yQaFSRvsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1NiBTYWx0ZWRfX9pmbPkIXVcPC
 VEAd90Wrbc20Pm+0THH39WU+DAoxuQ4WTNRXI9FsBnat70w24QS4ZWNQn2JA+wKKCMBUKZn4DlW
 uTfW28TSKbwXgNO5+UZzNQTzFJHcXh6UU4DGkNawA9CdiF90ARVFOmUjCRI+4LJdC+J2z5nfz6a
 ZGax7lJfHSmh/4t6LEU3PGDBxCrur0eqTCJsHbcZsZxFA5v+gjkYsfWQmXW4XZfb1p4eebZMtvd
 9IKqkqrO8MmbGnbgEKt3YipSpaVmx+Od2493/fwq98c9hsJP/NfFrrLJKffof+KK58Fo2PNnORB
 0VszRC6QLyUw3aEVZwCdxNQp2+pinJf2kuwY0usDjqDVXm2fE8QUrRYziqxgQAJjrpuzEf2I9OJ
 +a0Sy9jxehMEflNCTdJUgFUP5BiTUrJ2IGthlbJHOScvxAPxQlSgfzlqOWXY2bzFyIKhPFG5
X-Proofpoint-GUID: KBRU5yhiiGrEw81kOGJb5Wies2pbffJZ
X-Proofpoint-ORIG-GUID: KBRU5yhiiGrEw81kOGJb5Wies2pbffJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090156

On 5/9/25 4:48 PM, Connor Abbott wrote:
> On Fri, May 9, 2025 at 9:37 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/9/25 3:17 PM, Konrad Dybcio wrote:
>>> On 5/8/25 9:26 PM, Connor Abbott wrote:
>>>> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>>
>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>
>>>>> On A663 (SA8775P) the value matches exactly.
>>>>>
>>>>> On A610, the value matches on SM6115, but is different on SM6125. That
>>>>> turns out not to be a problem, as the bits that differ aren't even
>>>>> interpreted.
>>>>
>>>> This is definitely going to break userspace, because the kernel
>>>> doesn't expose the UBWC version, instead exposing just the swizzle and
>>>> userspace expects that it sets the right value for older UBWC versions
>>>> before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
>>>> It looks like the data for SM6125 is just wrong.
>>>
>>> Oh that's sad.. I'll drop this commit
>>
>> Wait uh, we have this data in the common config.. why would it break
>> userspace?
>>
>> Konrad
> 
> As you said in the commit message SM6125 has ubwc_swizzle = 1 which
> seems wrong to me (it should be 7), it just didn't matter before that
> it was wrong. You should probably just fix that.

Oh so you meant that the 6125's value would break userspace - gotcha

Konrad

