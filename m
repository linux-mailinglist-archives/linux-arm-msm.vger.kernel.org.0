Return-Path: <linux-arm-msm+bounces-67646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C22B19CFE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 09:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D3923A8C98
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 07:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AB523B63C;
	Mon,  4 Aug 2025 07:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A3ZHFk3H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646D0215175;
	Mon,  4 Aug 2025 07:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294170; cv=none; b=L/S5/3nT0eeuXaojKaR+6YsOpltHW2t+u5EPfKoYHkxfDDbExeDw8HBjm8jj23kR2mo+HjEhJb3WM2P43u+eIQVKXlMHs50ZvkOirt1A8OPRPFFYS5j6Pw9HtYWSUhnO3RExtBeZwGYz/64cRLch0ugNNLh+wXYJ1tCnZmqYhKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294170; c=relaxed/simple;
	bh=lm17tgLKjJF4SzPXWVZGaDlWlAX255lSnXGwss8XjE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QJ2LhDaoXVTCG+/XvqCzVrto1MEpIKVG3LajE6ngDEz4SX9V7r0hac+n9gLHxzajPCKQKLz7n5xpWr/B7M4eA2hb0HJlbyCo6E1W1J8yXdG7eI5gLePEaHpqMsG4PUW03dk5p1Xd6vqlHqKII48h1DLJksxZUavQnSJw5JLLRpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A3ZHFk3H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573MqVgW017513;
	Mon, 4 Aug 2025 07:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WYVf3T2qWGt3FlgJYqHsrgLL3dcTk1Xx1KJWsOAO5ZM=; b=A3ZHFk3HZmRMyx0q
	RXzF3WSjQZcJ1akiU6hkO4zcPRLe8DN7Z069rxeHcnmDZD47MLzQEc3OUwc2tD7U
	HGWOVR8Ii5b56oyBPb0HmHq9DMFfkxvB/hfiiZiYB+80MTrbDBIetfJmm5xDL5Sn
	MVARXb22+vmSu++wYiLzamlE1bFUpxJWAmdLFGp+nweM7gp6xIwdQ/cTXFwWG5nn
	MUegBTl3j21+tR/5hnb56QhWuXZ2lRFlpESnBwdcnW++PMWYIupacWipqFoPDGNB
	FNXWV+I8asDOxmYdzyoL/IklHVYNji+PjyY/wFlULGWV36BB/fUpaHhGOdvuKny5
	N9f7fw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc3xgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 07:55:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5747sHeR014809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Aug 2025 07:54:17 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 4 Aug
 2025 00:54:12 -0700
Message-ID: <8a918075-627b-4707-94db-cc86b2f7a5e4@quicinc.com>
Date: Mon, 4 Aug 2025 15:54:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] scsi: ufs: core: Don't perform UFS clkscale if host
 asyn scan in progress
To: Bart Van Assche <bvanassche@acm.org>,
        =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
        "beanhuo@micron.com" <beanhuo@micron.com>,
        "avri.altman@wdc.com"
	<avri.altman@wdc.com>,
        "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>,
        "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
        "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
        "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
        "luca.weiss@fairphone.com" <luca.weiss@fairphone.com>,
        "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>,
        "quic_rampraka@quicinc.com"
	<quic_rampraka@quicinc.com>,
        "junwoo80.lee@samsung.com"
	<junwoo80.lee@samsung.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        =?UTF-8?B?VHplLW5hbiBXdSAo5ZCz5r6k5Y2XKQ==?= <Tze-nan.Wu@mediatek.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
 <5f3911ffd2c09b6d86300c3905e9c760698df069.camel@mediatek.com>
 <1989e794-6539-4875-9e87-518da0715083@acm.org>
 <10b41d77c287393d4f6e50e712c3713839cb6a8c.camel@mediatek.com>
 <673e1960-f911-451d-ab18-3dc30abddd79@quicinc.com>
 <418bfbe4bfb3f04e805af8fa667144f148787aeb.camel@mediatek.com>
 <08dcffa6-6cf9-4c79-8aa9-a82bd42d3932@acm.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <08dcffa6-6cf9-4c79-8aa9-a82bd42d3932@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mfVgWPSsa3GAE0xpR8f5ZVOXSaoOk1Yn
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=6890676a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=6jBOxqxfYNOoAjozJqoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: mfVgWPSsa3GAE0xpR8f5ZVOXSaoOk1Yn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA0MSBTYWx0ZWRfX5O9qv0J5lkrF
 lWIQWnJjyWWPGNrzfxs2yoUzG9SVe25uqv6Kl7Ra3+7eR7z7/u31CUjjIfo8WyF+tz+8FKNLxLJ
 uk9pcm+4eNC8yN5teZM0/bOzkHGipuSLH4y71WYuQkkT3+W310s50CyXl5mxpUV4n1GpwByZ7cI
 i3dGF6X+VM2/DXPbXEeNNlIsEXjPKLpeo8Z8rU3U1AF+ZPRf/RkNOebQWBl4Wa41zjmL3VqGjMn
 HtgmSOTFa29Eecd8Z4eD8XwfIEUX689crWJdhFHW/TC4JqmjE9ozfydOAsyRNWnh+wPafTe77UQ
 SxojC8KW3Sui8RnYzliRiafOJZ5nLsJzSZEbmp9YXmJGZMPT2dN+NCNp7By5xDqmX1K7ev3oX5e
 Nb/0HBXy3HYHLp6V63TstbKXLDuUGCtBRriLh4t2SgzLcrc4qVfZBKu1I0gWEK4QIgJ0eGMt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040041



On 7/30/2025 11:50 PM, Bart Van Assche wrote:
> On 7/30/25 5:55 AM, Peter Wang (王信友) wrote:
>> Another idea is to only start ufshcd_devfreq_init
>> when shost->async_scan = 0.
> 
> Hmm ... I don't think that this is a solution. There are multiple
> ways for triggering a LUN scan and my understanding is that the
> clock scaling code should be serialized against LUN scanning.
> 
> Here is an example of how LUN scanning can be triggered from user
> space by writing into the 'scan' sysfs attribute, even if
> shost->async_scan = 0:
> 
> echo "- - -" > /sys/class/scsi_host/host.../scan
> 
> Bart.

Hi  Peter && Bart,

How do you think about using

if (!mutex_trylock(&hba->host->scan_mutex))
	return -EAGAIN;

instead of

mutex_lock(&hba->host->scan_mutex);

But this way will cause one line print of devfreq failed.

BRs
Ziqi


