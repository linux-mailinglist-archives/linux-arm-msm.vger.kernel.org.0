Return-Path: <linux-arm-msm+bounces-42975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC9D9F917B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 12:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB7F47A1637
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 11:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86ED31BEF60;
	Fri, 20 Dec 2024 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g6ZpuQE2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB03B182B4;
	Fri, 20 Dec 2024 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694755; cv=none; b=MwW0Os/LsnImOBvd0dt1KroiFFPpMc+sdOeLZcyJko0+7uelYS2e+EqJOMVr+RtrLHrfsJQIcfY97sNHvYFYSTk/o3tUL+cU9LfAtvzMlEf0UhQvX0nyTa1p8GBrRjUL5cSpEBozslcG3mxvHwwhfYYdBePQB8yMHjU00lgIHBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694755; c=relaxed/simple;
	bh=3Y5P2iLDMHV7TelN3lbxVpnLBetdICzsuCgDHCvVsw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T02zpvmIacqQxJK02QoU8TK3ioR8rL77PFiqXWoNfr5yU/fGj/9ePljY46P4XUqw5v1EBP/XgBuRD34jtnfvgmhwvaD3Mko+CQ1renLTKtN0em9rgs3pu+l4O4MDPmWtrNQVofCk6F3OfjpvzUD9Cmy2STKmd6oaJD2xdhhlQOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g6ZpuQE2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKA4WXe016197;
	Fri, 20 Dec 2024 11:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2reHl71yPviop2jw11dCLzSPN7jxrfNGGXDev2cP5SQ=; b=g6ZpuQE2NxWe7h5H
	CTRvMDxIY0U1YtDKYlekTwkiVjmwAV9HwgPkJ7OsRgOjrVB/iHMerqRvALdiQC20
	wQF3oOaVei35Pq/SCShMmll+CTrd0WjecEFao/64JNS6L3abteyDiEH25clmu0lN
	ZQYPrEWPM/F5H2Vq9J2EoMKe9VRVc2Y2QJjOy3DUTOf05jdn8VRGq6NeqcSG7d5h
	4N18hoPU1L+kwYC6vnFkqi47WMXaJZw4wsDkM9q3C+jKRFVX6HfNlIDHs7itz/vg
	h5/XniQgnKsoWHbQNT3tMQUMXabP9bzyi7wKU4hqnYWb7VuV3Tdi/9K/skLdWNex
	FllvxA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n6gug7jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:39:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKBd4ag007308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:39:04 GMT
Received: from [10.216.16.88] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Dec
 2024 03:38:57 -0800
Message-ID: <b98cc6ea-d215-2200-1537-1a53c2587c81@quicinc.com>
Date: Fri, 20 Dec 2024 17:08:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 6/7] arm64: defconfig: enable cpu idle injection and
 cpu idle cooling device
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Wasim Nazir
	<quic_wasimn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@quicinc.com>
References: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
 <20241217064856.2772305-7-quic_wasimn@quicinc.com>
 <59e96784-9efc-4958-baf0-a51e766e47e8@kernel.org>
From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
In-Reply-To: <59e96784-9efc-4958-baf0-a51e766e47e8@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UMBrxD59iLYTlJhHSVNlXpfTRgB4c2cW
X-Proofpoint-GUID: UMBrxD59iLYTlJhHSVNlXpfTRgB4c2cW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1011 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200096


Hi Krzysztof,

Thank you for reviewing this patch.

On 12/18/2024 1:32 PM, Krzysztof Kozlowski wrote:
> On 17/12/2024 07:48, Wasim Nazir wrote:
>> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>
>> Enable cpu idle injection framework and thermal cpu idle cooling device
>> to throttle the cpu by injecting idle cycle during high thermal condition.
> I know what they do, but why do we need it in the defconfig? This is not
> a product defconfig, just in case you mirrored downstream patches.

We believe these defconfigs serve as a generic framework rather than 
being tied to specific product features. Therefore, we have enabled them 
in the defconfig to ensure the end-to-end feature is available in the 
pristine upstream build. However, if you think this would introduce 
overhead for other products, we will exclude this patch in the next 
revision.

Best regards,

Manaf

> Best regards,
> Krzysztofthe

