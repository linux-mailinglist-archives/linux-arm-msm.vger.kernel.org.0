Return-Path: <linux-arm-msm+bounces-77142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9688BD89E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2EDF19241FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0819308F23;
	Tue, 14 Oct 2025 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wh4QxIL/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F86E3081B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435959; cv=none; b=PRcJ3hw19MnYiQU41RJBB3njm8ZPxzkkCUGOSbCQPgiE8jmnOWm5GsEUrINpndhDnJR+YDRZEFBKF627aCs66H6XAH2N0Ztg0IwzeDo30FoQ3mL8semSs9x772N0gSiqCCXuLJzGZsFk5Smex2crbCZ+fqc8sjWywXtSKenkFFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435959; c=relaxed/simple;
	bh=GpI/jVWA1HQ8B8zZbIRCyIhWFL7UNuSPmhtgPuRgUBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZVzJuf9RLy7o5UIgAK35zo+SY58kWLX/5VEpyj0cmd9fqYOSNiypesjhgGfYI6LcIDq3Hhndk4IPC4ZIX1ukN6kDxSXeuE8VaZ69Omg0yyO3xPicm9Tk/yJ4PX9mF6W9cQtaRyHGjdhBJGJiYt6SKFR/djpEnxD+2bFLhKyKIVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wh4QxIL/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87O0R018280
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZiM+msz2/xu7IuhsRR5eS2JwAIpcWvTBpY6mVrIXXx8=; b=Wh4QxIL/w8P0pDUb
	RQNyBsR0DixeIN4SDnrpiRguB9XB3E1DNfRULVf8/XUSiGe7lwe6zgWP561GVtiU
	MsYYb9PQHUJHq3mScnUT1iMWt1I7swlAsRnStm7I6Q9NMvjYWXOXG4ySBsVRQEYT
	L7MG4TEKaCeIjMKTV4zebeRWxHySCezsPxC3EsGE0ydifOey6t4HdNuaIamDC6Ca
	OKuoWfxcH2PSbYV/7LJ2C1mBdypHXDYS6gnG4XTkG5ttuD9T2mgeTYr45kpLglzX
	g96NkwNm2t3+OyYCxAnDI8t/C6Q64ILiIJhHlgl5sawYf2n8Z2At8uHI2piV1Nqu
	73mbMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1acbbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:59:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-860fe46b4easo289984385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760435956; x=1761040756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiM+msz2/xu7IuhsRR5eS2JwAIpcWvTBpY6mVrIXXx8=;
        b=qryx07xD4a2X+sqaom2QiAB6k8pXTt6aH5lCS5U/C8/PwYVda0UAYn9DK49wNjstrS
         XHq1+aIPmJ14GktRTwqE+T9oigtTsy03qyd9Am+RhH/igp8BGV55gNMh9QZtDk0Asn86
         HDRaM80EuQt0SomNO7UtOXATHvQ+cAJSOnqFRBpvMstbhhDtGbRk2xgOQo63tXM6v1qy
         sWfzrcB6SlSFdsT2UxpSi34NyQ3PjDsFHA/u0SZm0rUcVyThyG6PUvsIn3oXhhAkv1Vp
         7+m3620Rds5XugBTUipmDKJwGPwtA8O3bNy9HKvcet6Mlk54ye1TfqL0Xjr//duquZzB
         dpQw==
X-Gm-Message-State: AOJu0YxKvD+Y7akAwpenpXWmyNfzobEkaSUe3y3W1LgiGVtxVu1d3pQK
	DeCBS1v9majG8/MX+W6qtugor4S3EmWFPPKSX+YCQ1O6Y+LeuuW/V1Nc4EBd51tRbs5Lb3VO9Nc
	Pnihm4pAXKa5n9SaOVxo0U7QhD7BSlmcf4jv1mHJ8v33yPuOFcAM3qSQkgU0xfZqPx89h
X-Gm-Gg: ASbGncuNaK2Q8D/+5BWsKcw9pELz9/PgmPOPLfoN8DD4RmqVVl4F9GdmADKkdRUjdhV
	O/S+Qq7uY5MZsAhIgL260XRCaKVkts6QF0pU2wiNTI13peWl9/zTD08tBsptSu5VwDL1j9cqnFU
	+wfQchWjux4lCbV3gkXuUQQVrYYu/RDWUXrKfnkuAld8ON+mGrv2eC/hrjWz4oTlcGEGhl+svJ7
	IzJRYLLHOwSofKgwTGpT5PTlfXLa/BFW0OU0cFM9bdR8EXamL1kLfzlTAsPoXyXZO9cXwt7x/+P
	xRQDO5kTHG5FQgFbeEMkXO0DY/g+hXOCm2486/q+hT3lm3GN9X9zNRFv4iJvuEunGrppj10Cnug
	piEkT1Aycv8dQqPi9ZCurlQ==
X-Received: by 2002:a05:620a:7014:b0:864:a09a:e860 with SMTP id af79cd13be357-88353e1debcmr2106195785a.10.1760435956015;
        Tue, 14 Oct 2025 02:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVHkA1lSvpK0GyjJ8jKaSkv6pRKShgtaR7/kW4udBNApVj/YUAiOSDrO/HaCh3UHQSF3UsJw==
X-Received: by 2002:a05:620a:7014:b0:864:a09a:e860 with SMTP id af79cd13be357-88353e1debcmr2106194185a.10.1760435955541;
        Tue, 14 Oct 2025 02:59:15 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d9113a67sm1136953966b.70.2025.10.14.02.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 02:59:15 -0700 (PDT)
Message-ID: <16170710-63eb-4292-a519-f9daeb222e49@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:59:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: r0q: add gpio keys
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251014044135.177210-1-ghatto404@gmail.com>
 <20251014044135.177210-3-ghatto404@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014044135.177210-3-ghatto404@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ee1ef5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=qz-H3Q_c1Qorb1ohe4MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Up9iDE1rbAkA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: wBIfL6-GGNMkRAyL68eKxVc3qQ31Ri9A
X-Proofpoint-ORIG-GUID: wBIfL6-GGNMkRAyL68eKxVc3qQ31Ri9A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX2yufOlteiiXI
 ZxqouvB5ZX+1n+3ff1XoiZtCvyIcAlD8AUzmBbuFHIxMIDpoUcPIpRRXWXfSWf/jGJMr3nBvVLA
 KMnjMPO3RH6Cc8u3nE86nQinO5TG7ZDda+IYuRVoCr97kmnDLGcz+mrhX1amlhR/5ZZeODcNPlo
 COqILjt2KHDlrxuoXFHJb5N49zhV6KYON98aibHIikeww6A2PcdDhutjnlkPorpNinqX7dlikAF
 iSwLWfn6nI4vUZnLqHibFUPXLpquaj/LbIjqvbi983dRqvTSEnX8dEyvG9ZmE7Y3LbvNcRz8Zyr
 k2QVZiPTnB85VcWEy33Yi2w1kbQ9BOmeqP1yjss29AIsx01PM9tpeboRcMIZSdGOgWaVcyPOJMb
 OprH8yJWA+SUXkhln3SZOLzp2v9d3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

On 10/14/25 6:41 AM, Eric Gonçalves wrote:
> Add GPIO keys support to Samsung Galaxy S22 (r0q).
> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

