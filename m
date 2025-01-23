Return-Path: <linux-arm-msm+bounces-45900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FA8A19F31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23F5C7A56B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 07:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3392720B7F7;
	Thu, 23 Jan 2025 07:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pecT0777"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C55120B7EF;
	Thu, 23 Jan 2025 07:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617957; cv=none; b=NTXGIt6OzIJ+2MpCimCcx7iZ4pJJTaXWNzcitCvJlgwKGzlYwr8D8FiA8rSEV5mDygJ7DCdqVcKNfiR1X/sqSKf4iZvgOlCi/b6Ndws7AkXKgBKs/tXEly4tRK3NoVlGDhIBTg3/sAC8KH44VVCeSPw3jYXjCARBzH0jJXihIg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617957; c=relaxed/simple;
	bh=SdSZk1qjQjrKAbsHwGr7dZWwKIQud8aeE35hUXVP+2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FfJj2izILSeBlf8bshlKnEgmxOYeoNbfr0kXpfpluwY1T6Cu7SxwhZeCOPodyHODUHBRl1FJoT5AVXl/ylEw9jujDTU+i0PYQ2mZFMqFGBtODuZtP2m8giBpYN6OugJb2B6gKpIKBp8L32FfX9PaQ1Fn49MvLcfSTBPBZYa+fOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pecT0777; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N5DAKP021581;
	Thu, 23 Jan 2025 07:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fQbeMGVQtX+Y9evhMpY//Lh/aj4ZCpEuYCof66lEzv8=; b=pecT0777l4hO+ulG
	o8kO8bVrnTvbFaAuWT24om3+740BVEl4qXHoj4Rpo5iFZxGltVErp9Jlqu1DWRtI
	/1KtZkunx2yW6HUowFen7cqFnMHd6a75CyfPWxsxLzGPUMH4xWGt4eXxXYVQvixg
	qUePJsNOD0oIkuq2tMDkTmRAzgMzAQKk+Pd+ohAa8wQKoU1SzMS4J0mhQ2kqz6zc
	UFM0D9a/d5U3kvaBx8b3rzOJ+rUQLOpI6Cc3UcuwJaqMsUPhScdhczQ7Trmc81HR
	QKfuJUFEjTUVdSxD+SSafbqmM2hU5CDUC1FwPAnViJoAmGRWO51Ld8mtNoH5Olx5
	CRl1Sw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bfe4r9qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:38:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N7ch3R023551
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:38:43 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 23:38:39 -0800
Message-ID: <ae566dc8-a72e-406e-aed9-88f6707c3c0b@quicinc.com>
Date: Thu, 23 Jan 2025 15:38:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] scsi: ufs: qcom: Implement the
 freq_to_gear_speed() vops
To: Eric Biggers <ebiggers@kernel.org>
CC: <quic_cang@quicinc.com>, <bvanassche@acm.org>, <mani@kernel.org>,
        <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-5-quic_ziqichen@quicinc.com>
 <20250122182108.GA2924475@google.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <20250122182108.GA2924475@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eOH7Gx5obSPIJPDBhG8Ya5rr0o4uK6C2
X-Proofpoint-ORIG-GUID: eOH7Gx5obSPIJPDBhG8Ya5rr0o4uK6C2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1011 mlxlogscore=851 mlxscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230057



On 1/23/2025 2:21 AM, Eric Biggers wrote:
> On Wed, Jan 22, 2025 at 06:02:10PM +0800, Ziqi Chen wrote:
>> From: Can Guo <quic_cang@quicinc.com>
>>
>> Implement the freq_to_gear_speed() vops to map the unipro core clock
>> frequency to the corresponding maximum supported gear speed.
>>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> 
> vop, not vops.  It's one operation.
> 
> - Eric

Sure, Eric , I will modify it. Thanks for your review.

- Ziqi

