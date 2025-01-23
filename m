Return-Path: <linux-arm-msm+bounces-45904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2350A19F37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47389168D0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 07:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529C920B7FC;
	Thu, 23 Jan 2025 07:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DVIU+q4p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA06420B7EF;
	Thu, 23 Jan 2025 07:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737618106; cv=none; b=AYJEL5i1UIb1fPFVaTCIKSsAQETWADfrGiqiP0hJSlGzXIiDctqcsroOYuo6fWGVIpV0kw0yogOxhdyUfaLiQMD4G6l+m48/v/lr5cR7/x5xD4oB8keJxtDNrvPoeWqAz+lsu8Borq63oKuBKAuniny2pCd8d8yctzI1P0GmOPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737618106; c=relaxed/simple;
	bh=MmHwc0Kp/XgI20IW+d5C5DXTDVhLKVl7ZhY+fHh33CQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uriqonU/4BasyAjJmJC4VfEqE7xA2qFEUtRHd4nK+eX/XlePvdZ2zlaTggFIOn68pZO1uRkMRDWbeFo1d+xoI7BmvSKQ5D5I5cyJxZphKs9Mjdvuk/oMeqMp+qvlmKD9LFtcn+bkX/HpgoWdj8dTg0CaHUFIPeL6KjDs/VKoPXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DVIU+q4p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N4rgUI023157;
	Thu, 23 Jan 2025 07:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXWz5EjpDFCZqKlUys92nJheFOO7DESx+pZLp33r01c=; b=DVIU+q4pfmomhpFB
	aeb5DgmFi40S2cPRCuz+jRx8VR9Vltp8FZgaHA+AU8VvqB5Qwug7Qa3MWDQZe75M
	kWeluQAn+Y39MPzr1GzFa24mmEE3jT2OtJCyErpU8NWVtz98bV+gf0YUmj2713J0
	+qgpPI+wUsI/2wrJ3JpfFgYW2uF+s2La/ltvy6P5ViyIiMckzyfgnKU28eOtYmI1
	yNMxGNKEcRprzzakhleVnUFCtCbTWWOr8J3vOsHQmCNv/QQ+pfCLvckbKYSmO799
	k1L5sIl566ZDghA5FFe2cKfXPRgkiNqgNXzBnvxtDkpk6FxSPwiC+bwJim7NhUGi
	qCg/mw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bf518b18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:41:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N7fRqZ026210
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:41:27 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 23:41:23 -0800
Message-ID: <bd7f88a8-8e59-464b-ac2d-3c75739076ae@quicinc.com>
Date: Thu, 23 Jan 2025 15:41:20 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] scsi: ufs: core: Enable multi-level gear scaling
To: Bart Van Assche <bvanassche@acm.org>, <quic_cang@quicinc.com>,
        <mani@kernel.org>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        Peter Wang
	<peter.wang@mediatek.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Maramaina Naresh <quic_mnaresh@quicinc.com>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-6-quic_ziqichen@quicinc.com>
 <da2df1b2-5d32-4fcf-8298-6d045b4f7d42@acm.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <da2df1b2-5d32-4fcf-8298-6d045b4f7d42@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -VtygqPWW1UILMUGAeJ_CPS59v-H6eld
X-Proofpoint-GUID: -VtygqPWW1UILMUGAeJ_CPS59v-H6eld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230058



On 1/23/2025 2:32 AM, Bart Van Assche wrote:
> On 1/22/25 2:02 AM, Ziqi Chen wrote:
>> +    if (target_gear) {
>> +        memcpy(&new_pwr_info, &hba->pwr_info,
>> +               sizeof(struct ufs_pa_layer_attr));
> 
> Why memcpy() instead of an assignment? The advantage of an assignment is 
> that the compiler can perform type checking.
> 
> Thanks,
> 
> Bart.
> 

Hi Bart,

We use memcpy() here is due to memcpy() can be faster than direct 
assignment. We don't worry about safety because they are same struct 
"ufs_pa_layer_attr" so that we can ensure the accuracy of number of 
bytes and member type.

-Ziqi

