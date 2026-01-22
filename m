Return-Path: <linux-arm-msm+bounces-90199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GARnO3AecmmPdQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:56:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6125E66EE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3626C8A8173
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC56F329369;
	Thu, 22 Jan 2026 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwYuwLkB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kc11u/3b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26DC3164C8
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085165; cv=none; b=ZRa6btjoPSAPgpYj4LRrcYHKGAVzp22UGTypoxdruW83TGCrklmxPjwSmsSzAsHNsYOxMELZrrnQcvZkPrycx/zb2xpeovQsQh3QigAvhX3CVCUfRABfn8WXEEnpJJuq8wiY/XsKTMcMnTCo9rdnFPcuFc3eMz0oJ9YtfLNV5Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085165; c=relaxed/simple;
	bh=/mQKKB8o5PT+6nT5bLXeqTkThJ0jemmU7hrsEjvu7TM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYSuZPVTiGAuzBbpgC+l+qsqCM/Mguh27K30ZXKh1+KOl6kL4cHCNVGWXk2XNJSelJwZZiNoZr+FTzgT2IivdWSYIdMcFqqxs3DEyVzzAqcEjRFQt5DlArYdrGtrlRCZ6PuEnp9KWb0nfT0MUfjzufwsgjnk2ctrAT/AKbPvfaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwYuwLkB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kc11u/3b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7NLqV816384
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 12:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a8/JK4eqU4aRzpBRsI/cvSNMP41mjw7eC77JpWPbvF4=; b=XwYuwLkBpfvjyciU
	NOJ/owNFJRDwwqthMhuZihEu9N+lUjDYRnbBnO/e7th0fgXv9oKWIgHZ2xyEvzVR
	DM4kuC3rwqU2GSE+cUEFBP16mrUpTdIyF0HT0hNBTsH35WuiVbw/yc/oqd4IHSUO
	v/uf7I7YHzC8EA5NJUUpoCSXXQ1kIPjGbomcjtJ8yTqJWIV68gGfG+Xm7NsSnVPQ
	0LAdI6+FQde2ouLYS+pavdq6dNG64wZ9ZLSHL8pwGKGzrLxATOJLJPVWdkQ/4ChX
	67xJVpRn5i2fW2g6cKP5YoSTkDuJ98kV0wu7LB+Nx7Xto1er4i8kLW2/4c36Dep9
	kNZnAg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu65v2fp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 12:32:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7fc82eff4adso882605b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 04:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769085161; x=1769689961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a8/JK4eqU4aRzpBRsI/cvSNMP41mjw7eC77JpWPbvF4=;
        b=kc11u/3byAxFaWEnVz8h+KGtZBEaZw27t7K2v6N1lREMUzOqMR9j4g7SRi+wlaup9n
         Uq1IeGd6Y/3NIdu9ErdBGssb1sFWq5ofxahM3b2TlkLM6+y0BFGJXV5+K7Yqc4+X5pSJ
         QpdjRv1OLRcnLeQyr//HbUSAjTJKplwe9McpgSZeJVveJNuhpL3JAvFmOinsblCWJn+l
         oOjdQgtdQm5k5dUL2G5QmZKthWaMryrjdr8tGk1aITvJQfz7qYBT7hdu5o9KmKjwCSCQ
         Tv+xK9Bz9GsEbbphfUBiOzPl2DpE4PAkKYX9voqe4ekUC8Eoq12LFsbW/b59birFJ2Uy
         MgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769085161; x=1769689961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8/JK4eqU4aRzpBRsI/cvSNMP41mjw7eC77JpWPbvF4=;
        b=dKChcPpLaVeqLNVzG/Jkl+M/CpGpJewCiZGSpRC2FCscc669Pmab9/NstEn9fMRMgi
         pKOCBIY3JT/6aW7fXV9OicBtMGxQp0jaosTAK1+Pto4TDbbusFMvJ4rb3p9JPv+jb/gB
         ObEIdq+nypk+OxS4wOxfxVUDjj1dSkYt0Zcxteqy0iPyjl6TEr0FMQWq1Bz+JbhUMrSD
         rjNCJwqkoxh9wfie9OkoNo73lmUHxo7gm/RtCqJON6t+m5sy4UdSHoDnA9BdLoVvBRUA
         hne73Ne3SZ0xhNcQ8WmkLBMbflMNZIF8zhKc31r6bUSPDCeXp1OyZxLtO2g+mukDnLZo
         sCRA==
X-Forwarded-Encrypted: i=1; AJvYcCVjACYi4dSBwuJyX1vgePY8FmwbMKnYrnI7n4RrArj2zIW/FGcFTC08m4inJ2jkeGUxqHS1X/hOIhKyjpeN@vger.kernel.org
X-Gm-Message-State: AOJu0YxVi9VJBcbUYQxSuzEfCmy9EwuOnK8jVAtT0qy1jgnZh4MW+IIK
	3nhF9p4ee6fzlycJ0nwR9vBTmXa1y2hcJahxgtufs0Qab5rKDqv3i/OiToEJ6CfsCVEC3a0teoO
	WubLUHFBQ4Adn1BvMpGwrsDASERAvYRbotJf3RN2TigZGcTpwomqk1us8FXY0QJiJUY2WeKXJRL
	XR
X-Gm-Gg: AZuq6aIhQ9YyRhBXdFhO/75V9kirRcy1ZS0GQpkJVyUZ5zWSSrLaF7EAokZQk4Atyod
	VVmXGa+vtWHSvxY1PtwCk3wCeTbLg+0nPExNQ+kHjtGHGvp5S/RxaiE1LPvZwg7iUdxZFKzz5Es
	p7PBe/EtJZkrQaIqBXPY3aAvYyRLYC3+Ta1ZaZMpcC9WtPEdNkOdqpIOyJST9D4QBxDOwqeAgUq
	7U7RFbCOPRSXQKfn9ljBOVoIfJ5G59wSZsBgOzgGLX6n9K9QDAU6snKhR49OWLvyNVVcsi08byT
	QajwyIcW+rMv665t4LShul2Pms4Tddusy/sLHQWvoIvCPLz52IdWIvICcZYHrVyUy0TX7Duvuoy
	m+RiAifSwVXOeCg1ZzhJi98euJN5FVZsisywJWwLtX+BAkw==
X-Received: by 2002:a05:6a00:998:b0:81f:c6d1:5608 with SMTP id d2e1a72fcca58-821978d8e7cmr2655007b3a.1.1769085160308;
        Thu, 22 Jan 2026 04:32:40 -0800 (PST)
X-Received: by 2002:a05:6a00:998:b0:81f:c6d1:5608 with SMTP id d2e1a72fcca58-821978d8e7cmr2654963b3a.1.1769085159705;
        Thu, 22 Jan 2026 04:32:39 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108b21fsm18026681b3a.13.2026.01.22.04.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 04:32:39 -0800 (PST)
Message-ID: <4ce28526-6900-44ee-a63c-d9099c0a1325@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:02:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] arm64: dts: qcom: kaanapali: Add TSENS and
 thermal zones
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-3-a6cc9e45de93@oss.qualcomm.com>
 <4c44mmkpsnj4cn2eh2xzraiw73xmhtx4qm3xiyhecm4vyou7os@skyj646r63d2>
 <3cbdae12-af7f-47ee-89dd-6c00660fa6da@oss.qualcomm.com>
 <vjx3bd75zdgdh6hzhrmlv5tlarnf6ea3yklwhg7jx6momknase@kstxwngyicd3>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <vjx3bd75zdgdh6hzhrmlv5tlarnf6ea3yklwhg7jx6momknase@kstxwngyicd3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nHDUVd7XY0Fo9F90lb8gHysWBz7d20mu
X-Proofpoint-ORIG-GUID: nHDUVd7XY0Fo9F90lb8gHysWBz7d20mu
X-Authority-Analysis: v=2.4 cv=J8qnLQnS c=1 sm=1 tr=0 ts=697218e9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8VeMtYcsI4s2KzZ7CggA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA5MSBTYWx0ZWRfX1skESsVWcqO8
 LaA48tYDXejAaoGPV6jxLjeJdCezu2ICs2z3/gD2VOSHMTMUkQbwHRIv+ajFdCakEAcTgPiGORo
 J3P7Lp2JPaEk6/xVGmrPqBiqppDFn36f+zQOKyhyNrrGNJOt9gkczN+1Zy4jfjV4AhvDVmUmU12
 IhcW5QPsfojHcv6VZftNmn2Xz89Q/L997s749v7kQcYGGNWVIBlvdSfx+hCih5gtLhijvM5Qg/R
 +3510Jsdeirgcp3vKlWqoIPb8HkZQJQ+GudaHmwuMNbZCgEoqaIm2xMtnHIc/RIxRFsaKOOMgNP
 0ccHqfhC6+VPOodbcUsmOP7PYVic22hMYtFA0W+pkfzYZsY4MWO/ejf9c/eEAOU8jP+9QE5sXYk
 U4HpDh2KWxp927JbVss15ubxEkpJEOGN0s9+VstQuJ2rI5CLn+A0apf38JY4mSfzggSjEtie8oA
 KsqoualmfXAepKNBdqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90199-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.100:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6125E66EE8
X-Rspamd-Action: no action

Hi Dmitry,


On 1/16/2026 2:12 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 15, 2026 at 11:22:57AM +0100, Konrad Dybcio wrote:
>> On 1/15/26 8:09 AM, Dmitry Baryshkov wrote:
>>> On Wed, Jan 14, 2026 at 10:49:05PM -0800, Jingyi Wang wrote:
>>>> From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>>
>>>> The Kaanapali includes seven TSENS instances, with a total of 55 thermal
>>>> sensors distributed across various locations on the SoC.
>>>>
>>>> The TSENS max/reset threshold is configured to 130°C in the hardware.
>>>> Enable all TSENS instances, and define the thermal zones with a critical
>>>> trip at 125°C
>>>>
>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 745 ++++++++++++++++++++++++++++++++
>>>>   1 file changed, 745 insertions(+)
>>>>
>>>> @@ -4795,6 +4879,667 @@ pdp_tx: scp-sram-section@100 {
>>>>   		};
>>>>   	};
>>>>   
>>>> +	thermal-zones {
>>>> +		cpullc-0-0-thermal {
>>>> +			thermal-sensors = <&tsens0 0>;
>>>> +
>>>> +			trips {
>>>> +				cpullc-0-0-critical {
>>>> +					temperature = <125000>;
>>>> +					hysteresis = <0>;
>>>> +					type = "critical";
>>> I'd really suggest having several "hot" trip points at a temp less than
>>> 125°C. (And 125°C for critical looks way too critical for me).
>> LMH and the firmware make sure this never happens, the critical trip
>> point is a last resort safety mechanism
> Looking at e.g. SM8650, I can't stop but notice "hot" trip points at
> 110°C and "critical" at 115°C. I think, LMH is a replacement for
> "passive" trip points. But for the thermal shutdown we should give users
> more warnings.

Sure, I will add a hot trip at 120C for all thermal zones in next revision.

Thanks,

Manaf

>

