Return-Path: <linux-arm-msm+bounces-43337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A209E9FC7FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 05:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E235A7A1386
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 04:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92728147C91;
	Thu, 26 Dec 2024 04:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nhtWyONl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57D615AF6;
	Thu, 26 Dec 2024 04:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735188917; cv=none; b=devpBmDmLxkUXECxkVdTKpTCKslD6xrPzWFi2PypCV3P9KvHJkJGZXhF1NGDqpBoxoVh1cslilediTH/ZYTHk1f37MptOTg/h5H2leXuQo+Ho4LbLDuiS6Vv59fAo06GWzYJUH2pEufCaERHOfbfuB0Co6oQ7rZGUYyBD5o0Kz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735188917; c=relaxed/simple;
	bh=/qThjvN3YVqFbkC41773NPkXNJfYduXCYrThSvdKoDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s/m+GEkiIjWLOoNdfLyv/Fg5BYjRwQhzJ0/UiHE5lsMkVBtRBM8CIWGxYC5Lsav/GLGC6bUBmKxFpu5iBoj+LSxe2KqcoVRsc4raz7pFn6msyPM81gReBlTiCjJPvbVfRppgmn+jahOjypGzsr12yejMGkYiQfFc22cChA70peI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nhtWyONl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BPNvPEH011066;
	Thu, 26 Dec 2024 04:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APPIJmoiGWjXLczelco+S12pVIxDJjQEyBH7n73jFdc=; b=nhtWyONltKIAkv7r
	na/2jikqQ+eJk1D1Acza+MBWZViMkN6anSreGUSeqi9QbilOhWntvkwVq0gZc8Qw
	QIOnovnR2Wai5r/CEaxGnyeXaGKrFWCBqhB5rRJVUf7BJC7blPKAzFcAJ5DBq2QL
	TW5opJcyXSjifoSFds7XG4J3rCANsan2MTPAH6CfUOzDzbfGbeBlC1hQcwOxKwY6
	D7fF225QSVJ1SVwS174xdWXtnVQTPDas4tx2wnkq9VTF1OmZlMZQ97aE94b0uDTi
	LNkPXPGULM7QJm4VPOIgMajMTJNzMVzvQZEBMuzHJROsmpJrdY03u60FvZLH3Av1
	5uRmpQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rq2p22tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 04:55:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ4tAHX009318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 04:55:10 GMT
Received: from [10.218.35.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 20:55:07 -0800
Message-ID: <756d26dc-da89-4478-acf9-136f662874d1@quicinc.com>
Date: Thu, 26 Dec 2024 10:25:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/19] Disable USB U1/U2 entry for QC targets
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <cros-qcom-dts-watchers@chromium.org>
References: <20241218102707.76272-1-quic_prashk@quicinc.com>
 <whfe57qqbe2chb75igiidzmruhgwpc6ueeghnf552wsa3yrru6@m4tuyfnsoqvo>
Content-Language: en-US
From: Prashanth K <quic_prashk@quicinc.com>
In-Reply-To: <whfe57qqbe2chb75igiidzmruhgwpc6ueeghnf552wsa3yrru6@m4tuyfnsoqvo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i26qy1tnr7A9Ps5j7B5aeGR9oGzHbU1Q
X-Proofpoint-ORIG-GUID: i26qy1tnr7A9Ps5j7B5aeGR9oGzHbU1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 mlxlogscore=472 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412260040



On 26-12-24 10:13 am, Bjorn Andersson wrote:
> On Wed, Dec 18, 2024 at 03:56:48PM +0530, Prashanth K wrote:
>> Enabling U1 and U2 power-saving states can lead to stability and
>> performance issues, particularly for latency-sensitive or high-
>> throughput applications. These low-power link states are intended
>> to reduce power consumption by allowing the device to enter partial
>> low-power modes during idle periods. However, they can sometimes
>> result in unexpected behavior. Over the years, some of the issues
>> seen are as follows:

[...]

>> Krishna Kurapati (8):
>>   arm64: dts: qcom: Disable USB U1/U2 entry for SM8350
>>   arm64: dts: qcom: Disable USB U1/U2 entry for SM8450
>>   arm64: dts: qcom: Disable USB U1/U2 entry for SM8150
>>   arm64: dts: qcom: Disable USB U1/U2 entry for SM6125
>>   arm64: dts: qcom: Disable USB U1/U2 entry for SM8250
>>   arm64: dts: qcom: Disable USB U1/U2 entry for SM6350
>>   arm64: dts: qcom: Disable USB U1/U2 entry for SC7280
>>   arm64: dts: qcom: Disable USB U1/U2 entry for SA8775P
> 
> Thank you for submitting this, changes looks good and this is very
> welcome corrections!
> 
> But patch subject is not okay. The prefix should match other changes in
> these files, and no "for XYZ" suffix.
> 
> As such, these should all look like:
> 
> "arm64: dts: qcom: <soc>: Disable USB U1/U2 entry"
> 
>>
>> Prashanth K (11):
>>   arm64: dts: qcom: Disable USB U1/U2 entry for SDM630
>>   arm64: dts: qcom: Disable USB U1/U2 entry for SDM845
>>   arm64: dts: qcom: Disable USB U1/U2 entry for SDX75
>>   ARM: dts: qcom: Disable USB U1/U2 entry for SDX65
>>   ARM: dts: qcom: Disable USB U1/U2 entry for SDX55
> 
> I merge Arm and Arm64 patches through different trees, so I would
> appreciate if you send these two as a separate series (also v4).
> 

Sure, will update the subject for all patches, and split it into 2
series (v4 for for both arm and arm64). I hope its fine to keep the
Reviewed-by tag from Konrad on next version.

Thanks for the review,
Prashanth K

