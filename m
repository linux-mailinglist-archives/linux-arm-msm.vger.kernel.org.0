Return-Path: <linux-arm-msm+bounces-64054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9074EAFCD53
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C90D17B6F12
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5793F2E06D2;
	Tue,  8 Jul 2025 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qh/MNwF7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64792E041F
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751984436; cv=none; b=YIGap2Jku4lue6d+s4/aeAwBzzZx9CQyyK8nHQ+cKneKN+vRZGfrv0zALOcHtdiWy/h4EXKqGeZiSuomU4ZW7z3h4y4lzEEcwTbq1Wg/HV9TdmvZBAcbYKUM7PMNHKD1IpxOmRL/NU42p9OB+nbvUJsDXlzue9zw/WyrqIqxCLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751984436; c=relaxed/simple;
	bh=ugicuqbU1yS1yCvIzcXqiNr1oJADRuqRGHGqN3D/WO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwkMbaGnEyY3F6NzLUUjfR5IumaSnzW4X85vi2brnQ2y6A+JcDrSom3bSGcaomxf/lFzvy6O+6WnSKCe8TKjdWOSIYnHgBG1ygLg0pJLNHFCuL637oeSsGJbGyLDSmC0r4cK4nAf2DcmTP6CO/3yd9jhB4txRHlsKLhFnusC9PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qh/MNwF7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AASkd025427
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 14:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQuSWDFSA70+qgC1klmaXdIjk5aF+kYMGvQICocunPY=; b=Qh/MNwF7SRV0euQb
	YMp7a+6AkLGtKjF0AimX7Xmm9HT9Prog+tHhaJmgL4Xuy2oT3WoN6jdX700wTiMW
	d9gVQl+BYER3+Kp0SUbVfD3f+hamKIorZ3ZFeU3t6yi3uaLOsFre/mO/Xtq76ixM
	t+wt+pt8huE652GmWeKEUgYt1MG1T9aBWcnBRyfbCzer8shMW231s4n8zUDfZ2VB
	6msy5sV28nCslRSbED+6p9JNHQn0Y70V+8iee5khpM3fu1iTM6XyvWkN56xRTbGT
	7W/rPKc4jzohLc7K3qLpTtZduUK+9LdgWF3iSLVfSFdEUiq28AaHalp6zrYVuXIj
	h0eY3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0we10w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 14:20:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0979e6263so26919585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 07:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751984433; x=1752589233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQuSWDFSA70+qgC1klmaXdIjk5aF+kYMGvQICocunPY=;
        b=qWJHDY8TlTA3I6evVbEjWCVHN8zG5/2cFScuv0JJgS7ijpyc4yg9dpBwdgDO4pvxXU
         oYYhBL7S43Ej5jMwz3HNNnsS9qFst1ULUp7RjtB6uqU6+LDDeCllaDlfTr3sChdUPG3A
         rEi0I3ZEGhJzD7A47UO4dSwTAlA5fUMMEMQj//WcvshGhanR3otpYqXPAHetn1oIBxag
         qsVbFTj/jMf4MTve1jVR95RdPbsJwWQ2YgycXtuolSMya85tA+sJ+Ke3momh6xWmyXp9
         VxX/mOU75ekjkPiNQ/zPoTLlN1gVhHhDNbo1F1YSDZH6CxfY2YWwHFE/K4FFYkG+b82j
         EQlg==
X-Gm-Message-State: AOJu0Yx4u1hiaFQSrj9Kgy4yV5OUSQJsRmPjqKmdprjkK0F5VZHxv5bg
	no2JBnhGK2lVeSobzbAtZJEhHEX8LFBaljDMytVZMgPnz7y0tpFz/ruW03vj/j+bIhpIiOH7e6f
	nDkUI+wSce/zKsiBfO/T5wgxHUABnvOmEfM2h9WBJWUnu1QxY7of+CZyly93WQmAMlyxZ
X-Gm-Gg: ASbGncvLDBeql4w/IyVlF40je5iF97RdSvIOdU/IwGkdOeVOGP3i9aLZ30XlNQUtSRs
	z8RB7WqDyhZoxnB1G3iskUpP7ps1jBCAu4QJhYr53GDW1mV4v99ToiMKKAzaMaY//2MQIOXCSUM
	5E6eIHQo63f63NdQ31nV7Mvj17RdzNvEZO5Kq+mVmrY2y+oxy4fS03/+SnTkcWJoXEvZZHYHyQQ
	TdkD084QRus7hyjQK+Vb4JuhJeE1AHtK32pdorqfAsu76+/QKPoU2sYjImS7lahfVyULW0JnUV6
	l8tUa9Ak2X4RvOMXhJe8T5MpGlWF1Mx96DxLhNyLF7q1V9T9okBmSr2vxuiXBMJOeVokKWOpU2K
	WdfA=
X-Received: by 2002:a05:620a:6284:b0:7d3:c688:a590 with SMTP id af79cd13be357-7d5ddb7222amr682445685a.4.1751984432543;
        Tue, 08 Jul 2025 07:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGQfU3IAQ16JyA/2/logP1lSj0oVrbcVrPhvRhtLenSjjIj9jAf8svRkGdzskpKDe5H2LReg==
X-Received: by 2002:a05:620a:6284:b0:7d3:c688:a590 with SMTP id af79cd13be357-7d5ddb7222amr682442685a.4.1751984431967;
        Tue, 08 Jul 2025 07:20:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1060sm909050266b.177.2025.07.08.07.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 07:20:31 -0700 (PDT)
Message-ID: <861bca9a-bf6e-400c-b4e5-58f3617698d6@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 16:20:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: ipq5018: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
 <20250708-imem-v2-4-692eb92b228e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250708-imem-v2-4-692eb92b228e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v4wyGYCvy3B_Olf3hjwK1_kBtg1wRWhd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEyMCBTYWx0ZWRfX3z/bQW6+TQjA
 FxTAzhCdFGxGCnGmiShdAej61tnQJYNLkJ3PrV9YxHVus1s+xKvLcfz0pHW9eNWgjvRz+u2bCJ2
 Oa2VqRgD8jy/O+/imodC6qhvMVYulwSQS08NvXMd6O9kbl4+GgAYhrz6X1f8pMc63fTH97hoIuP
 lVNFFzubI7guwWbMKqz6w4R+Q1r0Pm2Rp5kRHBXi5dKO6YInrc9aNmEWML24Jwg3SojclC7t1fU
 XrNvISnyG/j9ixeo9o4zBgrhryHoRR6Y7x7gP5EC5DLv6T5Zn1cj6EOEL4aSOmGLkQKe629FD95
 LDm4DRgLwKt+GR/QTG6tAMeYNei5ee2qj5gB2HTOLGApglYOOhi4NfGfRHyzoNsWmmEaoz4oIKt
 q2Y5QRKcEd/FRaJ/vcZuHDeqs4jAltl5DPnoFsawfdDnJcDXdqqU/S4uy711TI66zloZmvBi
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686d2932 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=owAxAYLDMf__z6yt7SIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: v4wyGYCvy3B_Olf3hjwK1_kBtg1wRWhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=743 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080120

On 7/8/25 7:39 AM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is 80KB but only initial 4KB is
> accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

