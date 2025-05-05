Return-Path: <linux-arm-msm+bounces-56737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98114AA8B71
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 06:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6567C1890DA7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 04:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453AC1A8F9A;
	Mon,  5 May 2025 04:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHomb34U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A378D1A840D
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 04:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746419408; cv=none; b=S3RmbWu1jIj6BVedeP9lPMk3A9c94Qh/CK6KAY3m89yWzD3bVF+XfxwaeZ+pfJsXgMMfMExSg3U4iNSgfn8OdKHFzSzT2Gg4UKkOCAsnAfut51SzX2xpz/1yWn6TtdvDr5aW5vbx1wag5vD3oX4WA1i7OC0RCtbuOjMXtJ4X318=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746419408; c=relaxed/simple;
	bh=tat/UdOeVW9y9E5UvXaU8Epq8XucIiru3S2OvjCiOjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o696SvrSBjefaapKOTzdOBkAfaIuaEC00a1//ZdR+c4yECi4BfzHd2qxcNpRbTK9fHrd5763r6SqANp5xKe4P0Vd/LTMiZpn/2DBSN6QQMnNEyZlfZ3I0zty9ffnCQKBoIrMwLESw6cD3OkeQb6iTElvcvhTuGbJkVhf1ywJ3oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHomb34U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MXmUh016559
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 04:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RT+Thy0QvLCO4okTddVASjhzNC6Tj2+mPt9xU6TKuOo=; b=RHomb34UiVgOC5K2
	9NiA45A56iqz7xDXjr/EgzN5mTO0YQrwnUff82B7vZdBGBmKjYIKhOQnXM+MlMN0
	JNlWdgKaQD4owkq5l/rji1iquiF0QWFQ+fR5pZdud+5+rzM0C25A8p/55k17Hzso
	C3oMjQ7rjfbM4F1VmUBSoXmEU8GLHTbSPEPJRDPeoV9ILgdqTSR7RhqF8Df11Ne9
	s+xfInsU6X+pzzRmwDFGRx+17sm/5XRa5vnvX6IN6kiUdXkKNAlJnc6xQYtXC8hF
	X35gXKhNkgSmUhl1jAg8t3TD5noIwbZPWDvgwSr1xnxMsDQxh/IAyqnBHljJO/8S
	Tio9EA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg2y6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 04:30:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af2f03fcc95so4219483a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 21:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746419404; x=1747024204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RT+Thy0QvLCO4okTddVASjhzNC6Tj2+mPt9xU6TKuOo=;
        b=gx4sxh3w//LnQIwK9ZdBAlFx4X22JD2Q+gzAzA+els3IlNzhOzpi92nGY4HuKXaKX0
         2a9w1agq59NGsptNVySVv6UC1XGPjswrBWc6XKsymktjCCjaJnyXbOcqIYzANSx3xKGp
         oftyq+iRJekb8vivaJE4vwu10SNgnjed+5lHqfWpFjHe4sliQcRcS4VX/odlJMmjhqeE
         P+VVRq0COLiw3zUwAb4D1NrZE8XV0BOW/2KoubyUH/KEDN5xulQNxGjXtdfRaKXOCC6c
         Th9YFm+5AIc60HJwwgq+7O0bTKRBbYogCknkeJpexFXC2OklQSOr8uAr9t1mlfzyMFOe
         mRsg==
X-Forwarded-Encrypted: i=1; AJvYcCUupN4tiShAglZmv5+RIxQIySDGp1c/rpU4t40G6rvEKf8HateQvSNx+7t+6GnIOKT3mXZF58i9DlEfc4d9@vger.kernel.org
X-Gm-Message-State: AOJu0YxFY5ohywxXROQ40SzcZMuJ/weyNFEvHX7g7uorbvcboRb1Tktd
	eotTJtgA9CHWblvPjpPs3Zsd5Y4UiMPKDaLzgcLhuxgRVFysysB3Z4q/XdtXyWnomaSXWE93Ude
	+w1LTDcx3MAf50jsTtINHpx1Oc0A0dFyT/GGR5YJzifmg7fOxsmef/vtOgTtSIu6N
X-Gm-Gg: ASbGncuqV6TH+yvZfLW1y5vRCGKxfo0HPI6nquaPWbaUOttsRJBWkp/9XtDZ39VJJk9
	2QqGD3OrLgFQhEF5UT7RYMj0zETHAp2v+uFIf2r5GZfHFCqsg3VhQJZjy7sxHiCTFkFm6+cdDPV
	XXTo4hhZyH9zAxP1Lrtjw891ZNKmhBIAjj3PDynyWfERY/Bq3oaXVLME/0qk6TKcHNqRSp3Jcjd
	LAXcTfuXLmrUA2LNsTad0SZGdMom5FzOAB8ZsPbV4sJtcD8s5t24rRAOvMIJS6LynOHLvZClyKo
	Tfryw1OxzwkxWaGHW34cYhI6sxDHud7zUFpmbLpc
X-Received: by 2002:a17:90b:3d50:b0:309:f407:5ad1 with SMTP id 98e67ed59e1d1-30a6198dbf4mr9352641a91.14.1746419404074;
        Sun, 04 May 2025 21:30:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqUmOMTDYpmv11950TW1BS1e0LDkivXBdXi//Md6qRiIa4KrFjTB/t9ogC6F9TPBb4UttJXA==
X-Received: by 2002:a17:90b:3d50:b0:309:f407:5ad1 with SMTP id 98e67ed59e1d1-30a6198dbf4mr9352620a91.14.1746419403762;
        Sun, 04 May 2025 21:30:03 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522f8c1sm44772135ad.246.2025.05.04.21.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 21:30:03 -0700 (PDT)
Message-ID: <3d03e70f-b1c5-48f9-9aa4-421e48ff7c7f@oss.qualcomm.com>
Date: Mon, 5 May 2025 09:59:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 2/6] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-3-gokul.sriram.p@oss.qualcomm.com>
 <23f0efae-9d37-45cd-85df-7122843fece0@kernel.org>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <23f0efae-9d37-45cd-85df-7122843fece0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3xzcLLOt9-6yty47r4ErFiXQD78rAMkA
X-Proofpoint-ORIG-GUID: 3xzcLLOt9-6yty47r4ErFiXQD78rAMkA
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=68183ecd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=lbk28AChQbnHTQvtX8QA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAzOSBTYWx0ZWRfX8bqoNGygxr4g
 Ef6KazpLeLtYYR2c7JDWUruYN3cNohuWZJsGhylcJd/byEtGsogMJj0baS0BxmXBoo69vnNulMS
 AP1vtnw2MiDi4GCQ84kDLS3yYQcfHAFUfhWYtV6+1PkHZliwr3lZB4nTcXXz4UDJuNebyynR4+S
 qEsKnAagYpJqZ8qqnkp+5BTGi1I71P9vQMijQ9jCNc5RV9QGV77y0caFoTYRAlndPh+XHqtVrEJ
 0FZqHeieNcsNH1HCnT6QSZg5p9VbfNcrN0G7XsMP93KiXpXIxgRPnfUesVpJVmO0zHxTq0aIIkA
 k3bNW2UIWVJ5LoKV6aJmEWO27dXFC8H0sSYRXVeC/kxjqM8v1yKxAG6caNYndoEfSs5XtEyfFzQ
 kbGfE9oMg2h/e5wcUq7QojUctFogirYuz8vUbgv3fMRTPFThxR9F+cfxOBNiYUHJPdk2ud2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=817 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050039


On 4/25/2025 11:52 AM, Krzysztof Kozlowski wrote:
> On 17/04/2025 08:12, Gokul Sriram Palanisamy wrote:
>> +  interrupts:
>> +    items:
>> +      - description: Watchdog interrupt
>> +      - description: Fatal interrupt
>> +      - description: Ready interrupt
>> +      - description: Handover interrupt
>> +      - description: Stop acknowledge interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: wdog
>> +      - const: fatal
>> +      - const: ready
>> +      - const: handover
>> +      - const: stop-ack
>> +
>> +  clocks:
>> +    items:
>> +      - description: sleep clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: sleep
>> +
>> +  mboxes:
>> +    maxItems: 1
>> +    description: A phandle for the TMECom mailbox driver
> This is also a new property.
>
> Phandles cannot point to drivers. It is just impossible. It is a phandle
> to some device (as in "device node", but we describe here hardware)
>
> Anyway, either drop description if obvious or use simpler form:
>   items:
>     - description

ok, will update. Thanks


Regards,

Gokul


