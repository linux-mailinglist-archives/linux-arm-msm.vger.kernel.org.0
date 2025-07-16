Return-Path: <linux-arm-msm+bounces-65198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FBCB072F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0DABA40693
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A9A2F2C6D;
	Wed, 16 Jul 2025 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KQGVK2iM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7302701CC;
	Wed, 16 Jul 2025 10:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752660934; cv=none; b=Wst04Y2rP6k6a9hwnccWf+hLKuZVZLC0iWCOC2rRXGeZL+hASHAfRWSE43yfwHjfbwh3nvU/7HLJgH8Y+rpU94er1NRDxPZqGuDGz3AqEVYVNaeE2BJJxIOhJ/A8L0ubdBjnp49rQALHjh5XfxVj3t3ILK0hcFV47CLA/x1c4YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752660934; c=relaxed/simple;
	bh=yd0DIPJ3XCcV12QesWB9zzqcuiXU9dXewiyh+EuEqSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PNgF9+vz6gemkGmPyQMIrLgo4IK+5gBcDKF15N2NKQl9hmXl4ePqVEyKIWsuCG08ZnDt7CdpUI0adxDmZGy6jzMU+xAgxQS+bo8YCypBAMViUzs0LIcqmaaBcJ1lgeRo7rdRd1QoJkLYB3U7uj6wkf3ZCIQSF26FYWrXxRo2dUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KQGVK2iM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5PQaZ029739;
	Wed, 16 Jul 2025 10:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sfk8rrLFPzanXiTxEEwVLneEkAsexCjwMjawuqeCRaQ=; b=KQGVK2iMNQfL50E9
	VvzuaiIWqhBcbGG/rofZPLpshuwAOZwTSIyIIrvb1z8xtFucgL+mqYl2e7B5J6HD
	LUJVB81cQqFrzxel91JCBTu4NwYVckRnjhdL3rmCXr7/7BOEz49AhbUi61QgZju9
	qISpcPPFo6UhGgIn7mtfhi9VUlq2FYQItW9YIJ73734Q8UD/MSmz4MmDU9IBP0vX
	zEjRwaCisOpaWKZ+CKPIBN2V+iLMCy9wyf9YRQD/KTygAEj9IWw1RdBCoDyuRD35
	HNkT0rpK5kt4b2Rxvz8Cr6DjRqx/b1TEvj0dOUC47iGLsNXoCeAVK6qaOYespXdD
	8nMGWA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb3j98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 10:15:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56GAFFfn029847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 10:15:15 GMT
Received: from [10.253.73.252] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Jul
 2025 03:15:12 -0700
Message-ID: <23ab18e6-517a-48da-926a-acfcaa76a4e7@quicinc.com>
Date: Wed, 16 Jul 2025 18:15:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] net: phy: qcom: Add PHY counter support
To: Andrew Lunn <andrew@lunn.ch>
CC: Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
	<linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250715-qcom_phy_counter-v3-0-8b0e460a527b@quicinc.com>
 <20250715-qcom_phy_counter-v3-1-8b0e460a527b@quicinc.com>
 <e4b01f45-c282-4cc9-8b31-0869bdd1aae1@lunn.ch>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <e4b01f45-c282-4cc9-8b31-0869bdd1aae1@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M5X2zcMiwn-irENWv7xRaP0a71Xn4O9p
X-Proofpoint-ORIG-GUID: M5X2zcMiwn-irENWv7xRaP0a71Xn4O9p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA5MSBTYWx0ZWRfX1/T8Q/bRrCk6
 0mXZ4Rv8xbbR65tp19tFb+Ycay/IdxXf/0JAbfCZoYoG58SNFYRMQ8z8d65MvsEWrDIz5x5q0xC
 W1Tq8djecVAvhxuzVL4HISGs7IYtMH3uiYSRmIhcWW1R5BTRp0gDH0G7/Su7pYM+lBoNk/Y/OJk
 9kjAGegEeReFdDStIaig8dqXR1+prKKOxzT4KQPLCO8d7BaljJRSreVh/AR4yawSCGle2MoHysA
 uDzARWvy0OxvTvQ3EaZW2yGuWrSAxvAecrhyQdg3j+pm1TU59WsvtOLoojQFv5liBkbJwT8tv2U
 ufE7yBkg/uxOeAk1HB23RnITdPPNFlcicI9+9rtlGGrdPYlitQ8Q4WqsPe6wwqcOk2HCW2gr8Uz
 sZ2HWEINvAjUcSSU1SBkcbT7RpUmbVxfxKOVUYlbQP/0Jg+Xjs2t6sbCq3DxH06XVO+foaAH
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68777bb4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=dx8Nv9QYUwUAvIcoxGYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160091



On 7/16/2025 12:11 AM, Andrew Lunn wrote:
>> +int qcom_phy_update_stats(struct phy_device *phydev,
>> +			  struct qcom_phy_hw_stats *hw_stats)
>> +{
>> +	int ret;
>> +	u32 cnt;
>> +
>> +	/* PHY 32-bit counter for RX packets. */
>> +	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_RX_PKT_15_0);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	cnt = ret;
>> +
>> +	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_RX_PKT_31_16);
>> +	if (ret < 0)
>> +		return ret;
> 
> Does reading QCA808X_MMD7_CNT_RX_PKT_15_0 cause
> QCA808X_MMD7_CNT_RX_PKT_31_16 to latch?

Checked with the hardware design team: The high 16-bit counter register
does not latch when reading the low 16 bits.

> 
> Sometimes you need to read the high part, the low part, and then
> reread the high part to ensure it has not incremented. But this is
> only needed if the hardware does not latch.
> 
> 	Andrew

Since the counter is configured to clear after reading, the clear action
takes priority over latching the count. This means that when reading the
low 16 bits, the high 16-bit counter value cannot increment, any new
packet events occurring during the read will be recorded after the
16-bit counter is cleared.

Therefore, the current sequence for reading the counter is correct and
will not result in missed increments.



