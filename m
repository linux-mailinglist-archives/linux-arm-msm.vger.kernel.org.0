Return-Path: <linux-arm-msm+bounces-75870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0010FBB64D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 11:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EADC189E1D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 09:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E353F280025;
	Fri,  3 Oct 2025 09:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MduUiZA/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D8228033C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759482282; cv=none; b=sJVcETFBHP2S3h2IAm9YPNxtC0kL77Y1xbJx5aEJPGXg+TsQStw0dP9Yd99h1C7tbJGUGjrqaXyB5wSLVr21gn80YOkNt1NLq40ddT4doQFv+N3R7qhRnQFNg/I1xGtPSZXabHkPoKXJ1fWfbOldvIvbkqextA05jmDtSpSD+j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759482282; c=relaxed/simple;
	bh=BuT24nSXvzllvHpbGMwermrZuD8IyeMFRfXE9Wlb4xM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ko1grJCcYXR+v/kw/UZhu00ogmsDHqkVXhFXRDPH3YV521TKzMmaF+ShuUx5cx5V52Kxa773DYsFIZqtT3oWbCAOYL3j9tJXEFE6XXGlT+doMHD6Ixm9zd1YteyJG+/uk842kUY/5SZKOB0eHwDV2f1WDf5pTWUBJJmrSdauNIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MduUiZA/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592MMpPU012624
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 09:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qLWZtUs5fVCswzg3NxSw0ymwhU21Dbhg4Nf1Ubu3B3k=; b=MduUiZA/NDh0Esax
	BTQNOqyqAHSO9Vww0gxpBsbXOIuZarsajaYJ0+bKqzAo0SsIoR361XBB7Q1bb2dv
	cjha7pakwKPu/H8qK/+RQeMyzcDwULQFXUqsYsovoee2e1AgUIFv8ytwfobSQcTW
	bydV0EmrlfK9UojlHtOdWSR87KzUCi1bcRrY6Utfag8uHkTJMif2H+s51F/XXMz5
	KaQ3WIBHJBb6Fd2NvTnZ5EY8X540f4AiwsMVS2P23ThHHUwROzf81d6Ah68OLcb5
	BmVVWLmfr2xAUatTbwu9YL6IE06WhRIXj0ZRNDjEtM526tRKC7X1IDncPLo+kox4
	xpeUiw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80u2gmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 09:04:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2699ebc0319so21306335ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 02:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759482279; x=1760087079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qLWZtUs5fVCswzg3NxSw0ymwhU21Dbhg4Nf1Ubu3B3k=;
        b=U6KqPAxqmjlexVcEG1/08TlmYqpqzQGL0rM3GYWrV7oyTm+6+q6Blf5jLx3cwV+WfY
         3/0pxH0Eyt89Bo+BK3KDW7wdXM6XkzmJmRzUIAJ6cdCJqfx2MwzEKrZxtrrPcg7MCTbo
         h2XNcNqOUAu4TevHuIU0mPScY7rQVv3dtV3fXdIYTpiA+vSCACadSn/5h1HX3ipZE2qn
         N9SHxMrrKgOat2QJ7BwjVDs/5VFRrTATkvNrynquR03pwy6YGuukB/GO2tNZDVVNO++R
         g81l1FPZkLDQ8FoBR3C2RMnBNPGyJDbVpuxQbhQaNaBuwowAZIZlq2O0inK/GCXBZTNl
         FMRg==
X-Gm-Message-State: AOJu0YwopPkASQWh/+vEiVFzaJW5KnjRDb+FP9lkLOpuC5vODjohVJJx
	GjXc2g7K7sWB3TlDZ3uW0oy1EDBSdzbP81MCyzipLXQcKw6z7nc86hLKt2btSLB9b9dFiNUEk/L
	SU7yw1Zp0ln9MGqhgMhtZxz3BWIcHNObmRw800nkuqXSjC5Fyl7XJbYd2S6vrNpEdCytr
X-Gm-Gg: ASbGncv+luEuoGSzHeb49FbaH5Td7QhOqI+MrYL5zhBhE99n0Lsk91ThXWPLyv4g9xV
	jEtZdroOXGmHGg5Z19yeKbuSW2u2wnUyCCrbarW/0vQ0Agua2BVXaCl4Lqbu/BF0ragy5wcwH5M
	yw9ZGixYGFDHPe/+dLDz1UJgmD79ctyQRsz8a7TVulOIU5G9dR0wQEsAsiJKhbTC06caawXN9tj
	7S6AIwavF/DEC/bKr06xEHQ6uGYoyAaqub6Z/wKnRQeUL1oRotHwtqx5LqEws3Usu7fQHS/YgCL
	DpuKMR1/X1/dakNjBC+a1huyRA1jPjj2S88/FNUH8+7GKgp4sohJ3L5aPFLpoBWJFCegQOpHMx+
	VP2WW0E/oPiUnfw==
X-Received: by 2002:a17:903:fa7:b0:256:2b13:5f11 with SMTP id d9443c01a7336-28e9a645c5emr30186795ad.40.1759482278651;
        Fri, 03 Oct 2025 02:04:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8osZ94IBlmYS6mfN6OxharIdntATWBnaR1H/rolxzIfSfK2AidWvRxzbO2yAgkm6oFVwbqA==
X-Received: by 2002:a17:903:fa7:b0:256:2b13:5f11 with SMTP id d9443c01a7336-28e9a645c5emr30186365ad.40.1759482278141;
        Fri, 03 Oct 2025 02:04:38 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d95bdsm43659375ad.119.2025.10.03.02.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 02:04:37 -0700 (PDT)
Message-ID: <3cb50330-effc-4089-b80c-d454bccc63f3@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 14:34:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 0/9] Add PWM support for IPQ chipsets
To: george.moussalem@outlook.com,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Devi Priya <quic_devipriy@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Baruch Siach <baruch.siach@siklu.com>
References: <20251001-ipq-pwm-v16-0-300f237e0e68@outlook.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20251001-ipq-pwm-v16-0-300f237e0e68@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX/K7ROIPsawtw
 u+sNsCZqHSTUPjgeyH7dBx9PRL/u4Wcn3e2m4Q99fgsYrLikDVeY4uNvUArb+4ys28ciqCNlFo3
 Pc9UmZD8W9Aw6Evt6+wBJwQgr57NxgSBrh8rIiinYUyiThYs7ZAcp6pIGWs+rVGPguxOH/O9Gca
 yIilhJ/W3HeGF9BFY5oB1O4zfev791d8imPvQzPKlU0PB+Yc++eIVc6Yk7716peX2R4NmLZCMOA
 tD0nov7oK/oCZho2h9hJfVsnIMV3h9dRDIjasq2nMW6NQDEUX/BAYfr0iGfnSHDNXrnJ8aaG5IY
 3gV49+dIdTJq3zHL28fEODgbrwXlsUyHpxL8a/0LQp62RlJxVH20zdz2ssHGZ3gosBRnxv0dvGg
 7cgkUpChETb/rCpOZ2LOMh/SRBjL/A==
X-Proofpoint-GUID: CmSv2z-maIeRyXQFsyw1EeVfIuTEHCEi
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68df91a8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=MaTjDNABAf216yt7wJUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: CmSv2z-maIeRyXQFsyw1EeVfIuTEHCEi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_02,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029


On 10/1/2025 7:34 PM, George Moussalem via B4 Relay wrote:
> Add PWM driver and binding support for IPQ chipsets.
> Also, add nodes to add support for pwm in ipq6018, ipq5018, ipq5332, and
> ipq9574.
>
> I've picked up work based on Devi's last submission (v15) which dates
> back to 05 October 2023 as below SoCs are still active.
>
> V16:
>
>    Removed reg description in bindings as the offset is not relative to
>    the TCSR region anymore since simple-mfd support was dropped and PWM
>    nodes defined as their own nodes, not child nodes. Updated the example
>    too.
>
>    Dropped patch to add simple-mfd support to the qcom,tcsr bindings

George, thanks for taking up this series.

Can you elaborate on why the qcom,tcsr binding change is dropped and 
made the PWM as an independent node? IIUC, it should be child of TCSR 
node. In V15, I see the qcom,tcsr binding is applied and *dropped only* 
due to dependencies / lack of information on the "pwm-cells" property.

Thanks,

Kathiravan T.


