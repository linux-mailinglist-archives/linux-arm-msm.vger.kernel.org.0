Return-Path: <linux-arm-msm+bounces-54965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8A7A9726E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 18:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 032871884F55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 16:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB0528F527;
	Tue, 22 Apr 2025 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cSPvgvY3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C7E28CF6A;
	Tue, 22 Apr 2025 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338813; cv=none; b=YnCa3Sf0Q/03bChXshXADAZER0x0XDtGXN7qV/kzalpdKXWRrfDUnhUUl5/3uhzQMtIn3fhyysAZcRaLbCNdMlnbzrcLPAuh/MchfBnneKKz0FSd/jLSN87rzsPxwPBTfn0RW0vDK/Y7UbHiXid/9zZF3LdmfG72yoyCz5H+MEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338813; c=relaxed/simple;
	bh=AjR65iK/w82Yd0ONt9sy6wBZZcPLPWcTXlsg5w2lefk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=NlcxOzKXCGVJKfX2wN6uVf3QEJKu1ZIzTmSFz3gpGWYKMjm17HGz6JC7Vl2xeEHrN+KjeY6ut2EmFMUPy0ZN6jzwp3enJo1ZPqpTGiQEsF/nzXTFQMLxK7ocETJHbF3DUVnYawO+/XiEbK8hly7qf2deo0voCJ2LX/OeWA03gdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cSPvgvY3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCVMAT006547;
	Tue, 22 Apr 2025 16:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AjR65iK/w82Yd0ONt9sy6wBZZcPLPWcTXlsg5w2lefk=; b=cSPvgvY3JBS5hOTL
	n8U0oYMmblnF6dZ6nRdzhvC8Dq2XdjUPBo5pG9LhrRzwWKqFYiEwrkXK8TabPsL5
	Mlge37M2ouYiL2ShTmeD3wYQ0vmWOiyf3Cnn6XV8AecbXdip+Lqg2Ui0rkea/fiA
	wHKIu3IFlPEKKj3OtS24Nx/0YY1WRkwLHvmluGKSoqarhSEdmm1bipA7il/6tbOH
	FWkv17nu5sfOynqJTj/ln6Q/BL4W3pCQe96myU4YpgVvVKIsmZfqzqAUyp59cy68
	MfwdO+jQGVXbpMg3+BUhUCp+N0iEdDhfX0NGBiScxleFxSSRWBozrt/i3brRN5qC
	ZGGFHQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426r6fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 16:20:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53MGK4XT027719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 16:20:04 GMT
Received: from [10.216.4.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 09:19:59 -0700
Message-ID: <9dba191e-90a9-4a86-bbe1-a31bd17d73af@quicinc.com>
Date: Tue, 22 Apr 2025 21:49:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Subject: Re: [PATCH v1 1/8] arm64: dts: qcom: sc7280: Add gpr node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <99Kmw5-BXfX05ZwNUzOT9v3wiUXyJRCIyH_U5oOlBvz6-3i6cCbHAnDSD2431sH3adMtdNWeAwbc-05oPm405Q==@protonmail.internalid>
 <20250317054151.6095-2-quic_pkumpatl@quicinc.com>
 <bd73de09-bf5f-43af-bdfa-70b3c9d82698@linaro.org>
Content-Language: en-US
In-Reply-To: <bd73de09-bf5f-43af-bdfa-70b3c9d82698@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GdvcIemxKx6bBALMlDO0jPt2ouIsEzA5
X-Proofpoint-GUID: GdvcIemxKx6bBALMlDO0jPt2ouIsEzA5
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=6807c1b5 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=nRkKSLIZbybYfZE8hccA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_08,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=573 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220122


On 3/27/2025 4:21 AM, Bryan O'Donoghue wrote:
> On 17/03/2025 05:41, Prasad Kumpatla wrote:
>> Add GPR node along with APM(Audio Process Manager) and PRM(Proxy
>> resource Manager) audio services.
>
> Nitpick.
>
> You've defined APM and RPM but not GPR.
>
> Your triumvirate of TLAs is missing 1/3 !
>
> Please add.

Ack, Will update in next patchset version.

Thanks,
Prasad

>
> ---
> bod

