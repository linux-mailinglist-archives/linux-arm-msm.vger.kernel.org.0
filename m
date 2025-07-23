Return-Path: <linux-arm-msm+bounces-66283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD68B0F1CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B67ED583B4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F50F2E54AB;
	Wed, 23 Jul 2025 12:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BW98oNvL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C139927EFFA;
	Wed, 23 Jul 2025 12:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753272141; cv=none; b=T0GbC20w2PPxEwB/Lyj/S3IKOcVPF4ECZCT3/ganJArwmOxsuN8ds09FWjw96w7Cr0lNfh+3gU0P6inVEpU1cEdmG6q/U5kRHkh+rQwZhqcz4wNL32tIL4+gqLmk1Qz5kmzLALVQwplCexG1fre4hoflhaGpFujxvJ8VWsdFkzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753272141; c=relaxed/simple;
	bh=CkKjgnEQmJVd2OP0s93avmQZVx/eePjuxybaZaQNKoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qVG0e51fuOcqCDqstqzrKxTkTkYmzmVCjO4xfWZbc0RcSdgiPng0FUVmDduFjm8DrsXZ+wP9Yui6NZQHVVL850mmOckjuGegCFAYiJ+PB27IgwBLOUnuR5E0Ier4N6IK58cBwSkpHsJqlAixcV8wM0AJGOOYwhp/CPN//YyhuFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BW98oNvL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9eqHQ029007;
	Wed, 23 Jul 2025 12:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TEvEQiW49fNbu/AqMq+65QvNvjsfXFoeBkvDf1yQs1A=; b=BW98oNvLAckmQbsQ
	WWvuZrskhWBkHmEfNNsTOFS8METbY/zmT8u1fnpXny0uyhrb+nZC2r5siyBEiO7V
	ecLFC4vJyAjbC+XXrShee7WpJ+rG3JIyKIfuB9YJ6gKXcD91DjU3+6HQjrKr+ovw
	BWpm9O6EwjXmoo0K9fyTjRtqeYjfPX0uJjmQUzmiHdKP/3oEbSLfWRBZu0hOIJ92
	FQpcik0XYWuemtqtoUCj6p8bUMaTFuxq1aj/uA+0jSIHzNNkCqqZJwFGnLP/40UD
	oFsx4YbjA/1u7phuLFUwbC2WzkyCarqX9z0YdrfG33BsepZBlH+F63cv48vZReLz
	xk8hSg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6q7ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 12:02:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56NC2DYA028450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 12:02:13 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Jul
 2025 05:02:07 -0700
Message-ID: <68f6c2e1-a1ae-9a10-9a30-b971499815de@quicinc.com>
Date: Wed, 23 Jul 2025 17:32:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 3/4] mmc: sdhci-msm: Add Device tree parsing logic for
 DLL settings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sachin Gupta <quic_sachgupt@quicinc.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sartgarg@quicinc.com>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-4-quic_sachgupt@quicinc.com>
 <6xvsnmbnnvpmlgvmi42pt4d3ugkrxhrgrkp56szqhgh2foxe72@z4ildfxufq7j>
 <c6ca33b2-f8c5-66e7-bb3b-dd595ed040c5@quicinc.com>
 <d0af754d-8deb-041f-8e34-1c1214fccb09@quicinc.com>
 <2182b484-9ccc-4ebf-89f4-519646958413@oss.qualcomm.com>
Content-Language: en-US
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <2182b484-9ccc-4ebf-89f4-519646958413@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=6880cf46 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=mJ9L9Ta1JIxo18AwAt8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ztn_V7Mtt55hj79Akz-t4SeKeDIuY4dc
X-Proofpoint-GUID: ztn_V7Mtt55hj79Akz-t4SeKeDIuY4dc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEwMiBTYWx0ZWRfX4W9SMu8Arz3N
 c6veNRSXGdYz9Hf+ojz2xR6WtrTXrMrhogTyqEMFtpgxMWZHBWBbA1KmmR3xIBV9A+xbxNgE+mJ
 nQcDQLZbYvQp4E967/vOhfl51ws8+4NOVGi6HlfDnvc0fYUVGnzcUdjjhVjyyHxZ+EjfPvf4+Lb
 Vq7GhYE/X3MM0lO7Pz6Yyxa8ava+/+MYXJ2aANqlCu3oqJOd3ej9W79f9su32NpvbD+nHb1tOSw
 Da1hG1K7XfsTK0PmnWo+siLdgu5LROQLFWTOOALRCP8xrw8UDWPtr0ISoS1craYbH34ux3e0ttL
 rZYw5yYgPC6rRXYGlKktg0GP37/+IsokLrNVYfSeIpAzvr8bJu3ybyOIEHpSgbbA6ZLsXGcRzJX
 r3Ajz5VX061f5+uMyO3zH9qDapFQwqEafs+56ToMxdN2TSULCpSgqLHBOF2l59X/blaE5+gg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230102


On 7/23/2025 4:07 PM, Konrad Dybcio wrote:
> On 7/23/25 12:14 PM, Ram Prakash Gupta wrote:
>> On 6/10/2025 5:47 PM, Ram Prakash Gupta wrote:
>>> Hi Dmitry,
>>>
>>> As updated in [PATCH V3 2/2] of this series, I have started now to continue
>>> this work. Will address your comment next.
>>>
>>> Thanks,
>>> Ram
> [...]
>
>>>> And the pointer to dll_table is lost, lingering for the driver lifetime.
>>>> Please drop the devm_ part and kfree() it once it is not used anymore.
>> ok, I ll allocate memory using kzalloc in function  sdhci_msm_dt_get_array
>>  and kfree() after copying data in this function.
> You can use __free() nowadays (see e.g. drivers/soc/qcom/mdt_loader.c :
> mdt_load_split_segment), which will dispose of the memory when it goes
> out of scope, limiting the need to clean it up every error path
> separately
>
> Konrad

ok thanks, I will use __free()


