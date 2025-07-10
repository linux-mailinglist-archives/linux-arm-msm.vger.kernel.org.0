Return-Path: <linux-arm-msm+bounces-64423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 897AFB0082B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 18:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3580916A646
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 16:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A243274FDE;
	Thu, 10 Jul 2025 16:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YuwH1qLe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BDD25A357;
	Thu, 10 Jul 2025 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163488; cv=none; b=bASF8uKeLsJSV9viVRAWaogIV8t0kzFz9OyQ19GmEi65CnG338/oekfM2hUhp5F8+XVgGuLbu6neLES8ctfKJaSVQVpZ2ojUwe6gvABFoiO0/cLcT8++/jsBZyRt2zlIjoWkU47sWAa9yPGmWQzr9wuy5erv48a2Dy0aRdbl064=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163488; c=relaxed/simple;
	bh=FGf4q5hztgzVCdux+zRUILgKrtKBdehR7hBmROdpzOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lNXOMMj0xraRlKHUGA/UI77aWnh16TjxfY+VgDZciiQQPmlwSMyk+94nPYA/sTb08FDnZaN/aCPdOP9FxvIHx6bzGwjneCGrjFu1/Q2Ie5mnGcft/fdog9P3+zCbKRrNKjVLnfFTMGuTV/VxwIALdosZnycwww7dUHOJLeaCJNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YuwH1qLe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9I82A023159;
	Thu, 10 Jul 2025 16:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkQ24UGXdkLuRVHQusKOkOxPfLVwUbbY2M3P/F1da2I=; b=YuwH1qLe9MaWCfzT
	AM9MC5SFsY01hhtYbsw0yOhe63mqn3H+eZgpqkfy/ipSpDv5bdXIIUua04ZHuQvk
	9twSdGG/OiS6/YiXCAXi+l/Wmz61YiPSXA9z9IVXsDPAeZHYdb8zd4AFwMbkEYcM
	l7xVa12JvrBMH61enE2iQhZgcaftXCvKTvcH/xpXBQtfiMn9IgBlaWpCdt1FA0Hg
	OqAD7jsPLRNETVMvlz/ft5evBQkoxSm4HliuTLgljwBp8UVoESztALUkttrlwtpk
	9hS5SdLdOHi/mqWkOhU03QCm5RtNKc6lT1dXGNTrQTdmt8sVJ3PYV+rzxjs4NvwA
	cw4cHw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbenkbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 16:04:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56AG4XaZ032030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 16:04:33 GMT
Received: from [10.216.28.220] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 10 Jul
 2025 09:04:28 -0700
Message-ID: <6ebad87b-1d04-432b-82b0-928349a6c78c@quicinc.com>
Date: Thu, 10 Jul 2025 21:34:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/3] ufs: ufs-qcom: Enable QUnipro Internal Clock
 Gating
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Avri Altman
	<Avri.Altman@sandisk.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "ebiggers@google.com"
	<ebiggers@google.com>,
        "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
References: <20250708212534.20910-1-quic_nitirawa@quicinc.com>
 <20250708212534.20910-4-quic_nitirawa@quicinc.com>
 <PH7PR16MB6196F9B8C676FA18AAC10F3FE549A@PH7PR16MB6196.namprd16.prod.outlook.com>
 <f4654034-a94b-473b-907a-2687acf11af4@quicinc.com>
 <90d21fe5-97f6-40e6-98e5-378a7809e8dc@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <90d21fe5-97f6-40e6-98e5-378a7809e8dc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEzNyBTYWx0ZWRfXx266nqUjg3O4
 ZrWWpy8434/FY05L2m5qmjUeoe7jzjazYEWFCjKuYZl/lkEp1LYwzMvPgidJ0ASuKnhV1cUh5No
 m+Ryva04ZNubhXVd5VdGnQ6R/iuEt8/YZA6FAUAL+M9+eIgWp/IP5HpFOEjB/NKV66ri+CwP9Xf
 AWS4jOGol3OUmGzTPocuI9xCIucniH4KXHr2o7M0o7j8IHZ7oK9O6uz/q2Pg8H6Ojrj+MOU4KhO
 /ysvfXflVNx2WoS5qMm1DFuTAHeB4zZmHmrzEflniCCDdYYpGMSoLKX1gb9aARKSGefz6gjyMi5
 Pkf31IS1EZTbgzS9EV6f73q+NrzeXZFwVnBRl4L2qpzCk3FUPrRRjVdrrxxmruI0BUVwHcCWIaa
 ql+PZJSokaqudwUTCJ1vbgnEvP8rX7pJhzXxnFumvg15qx8NslxA9BmsRIq2f66saIPB8I4Q
X-Proofpoint-GUID: mJp6X7GXOykMSuXWklgRJcP5hiDFoIXt
X-Proofpoint-ORIG-GUID: mJp6X7GXOykMSuXWklgRJcP5hiDFoIXt
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=686fe492 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=AeJAosCkvdW3Q2PLLsYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=763 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100137



On 7/10/2025 2:54 AM, Konrad Dybcio wrote:
> On 7/9/25 11:13 PM, Nitin Rawat wrote:
>>
>>
>> On 7/9/2025 10:46 AM, Avri Altman wrote:
>>>> Enable internal clock gating for QUnipro by setting the following attributes to 1
>>>> during host controller initialization:
>>>> - DL_VS_CLK_CFG
>>>> - PA_VS_CLK_CFG_REG
>>>> - DME_VS_CORE_CLK_CTRL.DME_HW_CGC_EN
>>>>
>>>> This change is necessary to support the internal clock gating mechanism in
>>>> Qualcomm UFS host controller. This is power saving feature and hence driver
>>>> can continue to function correctly despite any error in enabling these feature.
>>> Does this change offloads clock gating?
>>> i.e. no need to set UFSHCD_CAP_CLK_GATING ?
>> No , this change does not offload sw based UFS clock gating. Host controller has its own internal clock gating mechanism
> 
> Does QUnipro == "the UFS controller found on Qualcomm platforms"?
yes its same. I'll update the commit text of next patch set.
It's applicable for all Qualcomm UFS Controller version.

> 
> If so, please use some version of the latter name to make it more
> easily discernible
> 
> Konrad


