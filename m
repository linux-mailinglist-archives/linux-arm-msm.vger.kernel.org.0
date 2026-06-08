Return-Path: <linux-arm-msm+bounces-111837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1jWBAzqeJmqKZwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:49:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF13655514
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:49:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nrDDqden;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YrsYq21U;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111837-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111837-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08D7F301FAD4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4B534572B;
	Mon,  8 Jun 2026 10:45:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E65318ED6
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:44:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915500; cv=none; b=EcPFRsNgBcPGPZXzNcJ+6G5p9EHMJ2pYoj1GjtgpnvaP+nH5at9vocUKF2S1GUm7zIAuRFAZJTfOzEYubd1L/LqtgOLcm3Kc37+VGcAvIcCcAe/xVbcRpZKFDyun6nRZUCOMg5IRixxVPXl31sdtk5rJCKU9fQsWS5IVIlCYLG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915500; c=relaxed/simple;
	bh=OQ97Cl/j+8mNGrPW+dDWj5Pi8p/nlY2y0qd6lnknoRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JSfA9mIA44gZjT+QX7ZqKAw3Qo/LkAKWhTvX0DI6Zhd4aXXNWCtpiH/aQXzekrnBailRjepSRbQueingyUA3ogitw729gQjdVXa7n1vP36CA4MxrdVPo0WjU7oDM41fSOFJLDoVnZ7qQLaKZPFYiGthNNszkvT62IY/fWj8cVbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrDDqden; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrsYq21U; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OtYH2384581
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41jb4hFcUfRoTHuONKjpdm59JB4WXIc01LJAry3rtD0=; b=nrDDqdenRSeY3pXx
	5CZfMJp/i7PtpoAor3mrjCDbtVylku7vRpGYm8pQjGrQ5nnm1l7ReHFEbNfZgq6z
	HylNp6B9dB7yZ3qrkfO4et2+s1SHMmMgAKrmJHwhjL648ISp58XxV5qkOc1Rxgd8
	+Nbuc7HfUv6QGrCYwCp/p/Bha4q+lFNEsZmHC3aFQQX9nNTBfGbdCyy1ErQfzITc
	+Ca4IqnWz9GaQ41zH+m6xU+MJdlUkGDMB7cPxG+e3C6HrHg6jZ8KqquFQWzijD0o
	VG+gzVFvpXiT/TU5tyfdy9Ng6E/g2s2jsQx7VZWvXsmNgTB20avQMhrWUvQGIkIC
	URIPwA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1fahk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:44:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5175bf22b2bso7838511cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915497; x=1781520297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=41jb4hFcUfRoTHuONKjpdm59JB4WXIc01LJAry3rtD0=;
        b=YrsYq21UMAig6JYV1O6wtRI/HJMfZNm344B+DjXmBmZw7daJlGBzMV3hEvL9oYnHUE
         nxOtTi5mQPL3l6T9OieM5S3LmRP0iy43bAZMKMWIulUexMVtzTg1DLUz89bIWvd8WlDp
         FSb7nPSwdz8FI6F8oMBfXqzVHIz36EqgqWU41NvNPBrdlyIYTPt2xn29vx25qVVb1ti2
         3rAF0qiqbjasnUI17YrKlz1yFE0bH8QGBlCkQGYJPb84mW8Oo0Ri2aE6X2TU2ksZswYJ
         2lFJixplWc0XeB8GpchzR01NWXtpXZMDrhMyOft7H9+IKDRiexoUt5KHykXZ7z0AGbGT
         LV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915497; x=1781520297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41jb4hFcUfRoTHuONKjpdm59JB4WXIc01LJAry3rtD0=;
        b=mqWBXPdgBEpaA1ap0WF3D9zVarq5k4kr3cuSb6V9F+wjHC1BsIlFTJPyNk/ObBEq1B
         gtXa1koY+XSdFD9354c61oHrhdywvtrasDwlUkuMeh9DVTCBc0hmESz7IHONDij2iT38
         BOdCf0liZXeE1GZUbmoeaaNVzMrLutyZIx7JO6cW97BakIhno0IUUvURtKYJJdMDK0NZ
         LCeGsjWwQFmB7coOTY8qJSt4oikP9lM28XhOtgzZB+q8GtmewVt+5y9ijMO32vTEXpB4
         jemH9WMpjExWFyRQjxwc2oYVT2tssvqMMYI/Uc/pJkTDdr9fIt5Ee7whPisTtKmcxH7V
         shNw==
X-Gm-Message-State: AOJu0YzX4K8W2T0rXIfzCzas9jHPZIyJxnRh/uHfmuHTRMzFZ5F3ZyBn
	fJbgwmMh35ZOtsMj/RsPK+XGEXrt+hDCzsWMwBU+Jg6dgWer/JJzH+EcNumdyf7HKSx2cVMxB1q
	3w7wTQSkPIV7QzOi1I0sjCUPVFqCvsdwRB6mxMBxlIB/pF7RpLmRDLYlBFr4BijNTRl6M
X-Gm-Gg: Acq92OGr0uvQw5A4Tb1XqzZKHjTbBvPHT5F+74KQouT7jVylMXcA8rIMMRtyPSaY5C5
	5mQI+DzHYIQVCqz3aHX03D9cMtk/NP3tbXqIemfZaNv6FfYoFLRYQBcA5eATnByx4OPV0ti6wsD
	7W9Iw+LlpGl+QTZNOi2eYKkRolrjtLSHAynXrQCKEKde05ZnyUn3oORhDTBxlrOK7y2ttpNWBeg
	056YmrvOUXJjXwnd+ecnvcseeu3l+UBXNxaljg5Jrgq+R8z2yEd2BNnKwrWGc4es2yvVFWxfrXu
	eI1YoeU8T5qhuvx6ICdkcTcE9ZiARNFDrKkSacpZXyfCYQ28iynJt1YsU/Nwqnwl/01YtrtfQ2i
	v9fHI0yFdCA4mAzihzmlIhjlqmXkpZyyuEJqdzMlxxL8t+VOB4KEVhqSR
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr109931981cf.6.1780915496973;
        Mon, 08 Jun 2026 03:44:56 -0700 (PDT)
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr109931761cf.6.1780915496521;
        Mon, 08 Jun 2026 03:44:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b58596sm6943544a12.30.2026.06.08.03.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:44:55 -0700 (PDT)
Message-ID: <18f5e5a0-de70-4d6a-bc5a-93d402059aff@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 12:44:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
 <20260522-shikra-dt-v3-3-80ffde8a3dc4@oss.qualcomm.com>
 <63752557-6468-4aef-a847-06aa39ce108d@oss.qualcomm.com>
 <3758be2d-4553-40b3-8ae6-bc3e502d0531@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3758be2d-4553-40b3-8ae6-bc3e502d0531@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMSBTYWx0ZWRfX2dE8jt3UJ4BH
 OMgCjp1UDmweMgVuuvnbTijprNNupqPpg90xfc0k98kmwsdlc4taJMiQoCuGLX8HKsLoarSdh0Z
 LG5DlplW/l11nsZfLQnAjLczw5LnfdNlC77bWpenAvCjhXEGB/xnu+gSraTMY7HEiCuXTimVH54
 q3nogWvJUB85n82SAJlOCNcisBA0yGmr2kRxfdeNDdpPgB4qKIDpro9gntS7Ic9Wdncmp9DUv1S
 YjJL/vk7Fxj9J2CIhHikeV6RnfZ5PpOquqKE+v+K5WjyUsDRcXpYlv8pX/IbqQLa1cbtYP/z5QZ
 seSSkRsPdnmYaXUOkZVNh5DQ6Cpdj3k09D+IbKc2E+xLSA3YaWsxbI123AFMVBDc1HwKyu9yc+P
 A1R4zXP174YBEHtuL8HZvZhA1T72NTMEnUambARTZ0Hue8RMPJSTxSzSarJR6/BJeW21gBkPJ4r
 NOGZzanwEuH9LS2h0cg==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a269d2a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jymwzkz8D7XtJHPt1hQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: KYuEVEUlqbgQJNK8Q7FOrRoRzJClEa9d
X-Proofpoint-GUID: KYuEVEUlqbgQJNK8Q7FOrRoRzJClEa9d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111837-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CF13655514

On 5/27/26 3:32 PM, Komal Bajaj wrote:
> On 5/25/2026 6:46 PM, Konrad Dybcio wrote:
>> On 5/22/26 8:02 PM, Komal Bajaj wrote:
>>> Add device tree include for the CQ2390M variant of the Shikra
>>> System-on-Module, a compact compute module integrating the Shikra SoC
>>> and PMIC for IoT applications, designed to mount on carrier boards.
>>>
>>>    - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)
>>>
>>> The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
>>> regulator definitions specific to this variant.
>>>
>>> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>> ---

[...]

>>> +&pm8005_regulators {
>>> +    status = "disabled";
>>> +};
>> ?
> 
> Already there's an ongoing discussion over the thread [1].
> PM8005 regulators are controlled by rpmpd so it's not expected to be enabled here.
> 
> [1]: https://lore.kernel.org/all/20260525093453.edmqryggp5kcqxxy@hu-kotarake-hyd.qualcomm.com/

Right. Downstream, MSM8998 (the other user) binds it to the GFX CPR,
which probably has the benefit lower latency than if it were to go
through RPM (although I was sorta hoping this would be an instance
of cargo cult that we could just rip out..).

If you add /omit-if-no-ref/ above the definition of the pm8005_regulators
node in pm8005.dtsi, does it get correctly skipped (i.e. if you do
dtc -I dtb shikra.dtb -O dts | grep qcom,pm8005-regulators, is is there)?

Konrad

