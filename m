Return-Path: <linux-arm-msm+bounces-78903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AA3C0DB84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 118394F6C52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3210A233149;
	Mon, 27 Oct 2025 12:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPomL/Tu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B117622E406
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761569321; cv=none; b=qHSr3AHQUWkTZScCHXU1a5CkjE4nBsCXKvoTBMF7UfIrIxp12aq/j9hfUJmOUMkcu3bKte8gJ65YJL2wBjdKpVhYqXugnQ/jcQoycP7g9PjlTUbjopX9kGHfGT7qt3KQOVrgmCBBidmt1a/7z0eIVDEML3g7/kYxxvOtb7WA9Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761569321; c=relaxed/simple;
	bh=kwPqXPxICWQRqS6XskDw01xKA1aAhRRks5SxMx/NbcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qq46lcanCBuMCUnXvffNBeKZWeBBiwEw0MhWSnbhAVgMIwXnJ+lD/IA6rLi4Ml3Y+hJ9fiZP9uEcxKp11lRb7xpI+wd/k6lPkVfSXbh8fo5C2y7/hWSxocXmOtGdPUbVMlYfZfiS2xjWtXtl14jaAkY161AgE6abtQr2SQvcdNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPomL/Tu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R84hlJ2232116
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/Uv8H0003TgVcInLi9IzeOjAS6Ozviq/41bAtMg430=; b=KPomL/TuboAPo+sl
	OFjAhcmiPhBOLe+KzbXBZfPL1GnTUPWJxo3IeZghUFgrUJN8pOvrMZSuAReHdxQR
	wckDlE/ZATkF1VKg50GPZ4TkORxLDdZyjCnBB9/b6kHx1x1OUncnc9gSYpNLHxpo
	x7aTMuHYd1OW4Ftn8Ge1Mx1Gb7j5CpM14Bgi9tBOtneblcI6Zkv5edK367lv4MF2
	qJX2BOfmw9GhI6Q8f/Q2ZyEPeD1vjUXO0x9japLYzIltFG/BfZWeSDwZJEQoMFxq
	5uWewu7IIky6BmISPqHJJ1OTis7rfcSEVczyxtnKvR7/znZ390THbegPFAs1bEON
	JDPmOw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wn8sen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:48:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ecf5ea6669so2335741cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 05:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761569318; x=1762174118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/Uv8H0003TgVcInLi9IzeOjAS6Ozviq/41bAtMg430=;
        b=ni1CRQJw6OCWotdTRIvrLVh+A5uQRzeQNIQqKzLdRVrlkbPmZgCrknamQeEhF5Gg4X
         T9SA3tBAgx74Vr7G1sg+pT3wx7qlwGxoC4Qce0wvlYmrKM4BmKcEJxLn/Jshu3Mhp59E
         5FbwNL11ASuyZPVYywLS2nejI3Zo6yTluf81iX2WDd0Ei09UVGVJTYJo8r30wFGvP36P
         mUUNWQNvXDyk/RmZ/9z0Q9TwKbVahNF49cAVbjCGQAIVQc0jFo/VQYJECA0UQ83ZXd2v
         J363TBcYkYvn3rKERdyxvhdFWyP2WlN7kJgKTQZDDDxJXEPbV7T2Y/Ea9WIJood/Jo6c
         QYpA==
X-Forwarded-Encrypted: i=1; AJvYcCWuLnaZ0aHno+wxiiMlW1dLctWz8WJYSrnT7FTWALRMnJihHTyn/F/R1yyxwIfk0M6b4hEDWMYxuVTbNSA+@vger.kernel.org
X-Gm-Message-State: AOJu0YzxQzcPf6WOdMSqJTA+UP7hkRHNoUPFmEhzJMsMkTRzU01Ue7+T
	dgwnwyxIA23PfzAz0mfOOESRWYwAeYtFeP0XSBQxD07ueqtPOpKIId9+yZgohhJPWwwupnZY8iW
	vftZ428PiAf3r0WY2GhJEabgtz2+u8+jjDChflbl00V7rehxHZG/+ZrT0Ajl8kV04atj29WdqMw
	mk
X-Gm-Gg: ASbGnctLIpjxTHcUwSyYtBJFMyFdKDR0uHSTpdXanQDMDh17xV4M3mJCZOImnxF3cIv
	GXKV7I/NfV/23BQ+XhcAIfK1JS8tXR6+5L+gDx+HkrlCZshjvLCwAkD7p2h1/Wn2P6Id586f8Kn
	fJiuXSc89wllUKKn13rCS7vO/hZrpCS0amYjzzWDEf3mI5RGwvYiFvOEGoK6k8DZ4VIXfrXZEC6
	uJucboSP13k34Lyuj9mVq6BFqKvNY/yk291dWI6x72jBcTEtDsYY2kAuXKwPFOmjEU1MWvzm7oF
	ILs2CNhrNk0mivgc1BYpr2IeAMNr41ufyNjQl5y9pdGGmddvD2zVEsIDffMDWJdVWwQK+bjc6vy
	vUiGB7AHEppaGTqsgVZpgvdHd+3BjcJ4EaLDqhEi0p9j6OIxIDqzoks1M
X-Received: by 2002:ac8:5704:0:b0:4ec:eef1:52f7 with SMTP id d75a77b69052e-4eceef16c1emr48423551cf.11.1761569317194;
        Mon, 27 Oct 2025 05:48:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdTHwN9Gandf3Nr8idY1T2xhuzqElR3BXPKvTHU3HR+2RoVvlDvxy/LNpNChn+i95pgTzFOQ==
X-Received: by 2002:ac8:5704:0:b0:4ec:eef1:52f7 with SMTP id d75a77b69052e-4eceef16c1emr48423031cf.11.1761569316647;
        Mon, 27 Oct 2025 05:48:36 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8544f8eesm736062166b.69.2025.10.27.05.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 05:48:36 -0700 (PDT)
Message-ID: <c8cac801-574b-4e4d-b233-56dc5cdbaa26@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 13:48:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=68ff6a26 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=f1DJfOMeYKxADSZecjwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: JV4EZ140CbpcFoubFR7ajnSW1Ch6Rgo8
X-Proofpoint-ORIG-GUID: JV4EZ140CbpcFoubFR7ajnSW1Ch6Rgo8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExOSBTYWx0ZWRfX/2RerpzyZchl
 JnH346JFbC/rYC5GGI2RCTJ7xGzLqsTuJKZXY+3i+Z6oSrIIMWNxwxQ4Gi8dmPuPQJE2Z9pw4tc
 qmQvilh+4UVro+fimNy/b0b7zBAE0nsoBo9GWs5GXMd8TYqkMfH6gD7pxkoz4r6+Mb5sP77g/et
 6bs1Tx3cD16YQygLZ+oi0GOhA2u0jlpkBn9075lZMBlzVK8/7uXORFYlm8esDUOvu10eWb9Nq/N
 5/c+5XqxDkqcFSK4td0RHjuEwe8+jb70qdHm6O0IJXA/ycSHFF2pJM6Vh9QwmeGBg00oirMylQc
 +yC2McZAVPVCYByp+PJN7QF09PinRQr41w3gVX+JMFCpd4JtY2A5bthFUcYdf7jM61GG9zIVUOS
 Nofd4VjQnGHVtYWvmLofG6OwFEzcfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270119

On 10/24/25 5:27 AM, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>
>>>> Add DSI PHY support for the Kaanapali platform.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>> ---
>>
>> [...]
>>
>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
>>>
>>> These two addresses are very strange. Would you care to explain? Other
>>> than that there is no difference from SM8750 entry.
>>
>> They're correct.
>> Although they correspond to DSI_0 and DSI_2..
>>
>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
>> new features. Please provide some more context and how that impacts
>> the hw description.
> 
> Thanks for your reminder.
> 
> Correct here:
> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> 
> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> just some register address change.

Sorry, you're correct. v2.9 had a number of changes instead.

Konrad

