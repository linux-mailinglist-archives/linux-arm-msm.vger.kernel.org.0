Return-Path: <linux-arm-msm+bounces-29540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A16B29600CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 07:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 487A11F2267F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 05:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF294374CB;
	Tue, 27 Aug 2024 05:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UO5f3t0u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8EF4C92;
	Tue, 27 Aug 2024 05:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724735194; cv=none; b=I0Qx0Cukw9k5gjycqt0pDpkbG96mmKzefuiHIv4bRCCqFSek5lydeXVbOAjbqynfpC5wakZfLlCf/RCf/Qt0vX67D7Z29y1Z8UkTYbKODO7Cqm5Jmbt+tCVT7DKekxWlpaxw8tjJGhEQk54AsigoafiT3QqP+y0BRbkO0XS/CaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724735194; c=relaxed/simple;
	bh=XwbMjVHH0AuUfCI+3AJDGCet6dUgI5476UcxqTp0KMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S4ELdlImT7kMo2PfcjxvuQ83PWebf5XFyXaIJmhq+DOz31N1k2tWKHJmqH+qvYUWgJGjzxO7O+b0qCKjFkHQ45olkkJESIX0aiW7QSYobDc7p6/aGsb/sYms/IQD03Sm6olm893PYnQl5jO0lmaNU/60ukrXikcU0afu5wEUcqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UO5f3t0u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QJGUPl011881;
	Tue, 27 Aug 2024 05:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vYNxu/gCy9eu9jcsYYy++tNXVX/yq9NX8B9cUSJp5As=; b=UO5f3t0ujVxQTz6G
	RAQBepUYVyp/2Ib4egMV1Eqdzso96ghHZSqtHXh5jHwpTeS/AIC9Cb9c11KsCudZ
	Cv28iJ/VT+x7kH0TkBE2V3qHA6T/A7QBCVkh47qpv9g7uC+Uo1c5vDWnt3HmxyQ6
	IKgIjust8042vlXwOvdGiro7Epp3RMxvzBhuM1WKxbasp3DblB7MqLgx4wINHevx
	vKQ/sQhi7mJZVCTTSabdIn+XYO9tA6qRw0bxdl7ecg9x6AyWML0myFKWFpyo/oxv
	ht4ooEPMzqbD8alB4x8n2bvWIocjYWdvw6hScw9f/z7wQ+ifDLjP5GJAQiB9GuRC
	HfqV7g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4179a1wnmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 05:06:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47R56Cr7018336
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 05:06:12 GMT
Received: from [10.216.58.121] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 26 Aug
 2024 22:06:08 -0700
Message-ID: <9881058a-5897-4f01-a5ed-7ae6c58b0906@quicinc.com>
Date: Tue, 27 Aug 2024 10:36:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] scsi: ufs: ufs-qcom: Apply DELAY_AFTER_LPM quirk for
 Toshiba devices
To: Bart Van Assche <bvanassche@acm.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_rampraka@quicinc.com>
References: <20240820123756.24590-1-quic_mapa@quicinc.com>
 <20240820123756.24590-4-quic_mapa@quicinc.com>
 <7527d15c-9318-47f7-99f8-028c865a698b@acm.org>
Content-Language: en-US
From: MANISH PANDEY <quic_mapa@quicinc.com>
In-Reply-To: <7527d15c-9318-47f7-99f8-028c865a698b@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: efXMBKb3sXKBN7Yb7LSCd8ejDfCe7uCV
X-Proofpoint-ORIG-GUID: efXMBKb3sXKBN7Yb7LSCd8ejDfCe7uCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_03,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=709
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270035



On 8/21/2024 3:05 AM, Bart Van Assche wrote:
> On 8/20/24 5:37 AM, Manish Pandey wrote:
>> +    { .wmanufacturerid = UFS_VENDOR_TOSHIBA,
>> +      .model = UFS_ANY_MODEL,
>> +      .quirk = UFS_DEVICE_QUIRK_DELAY_AFTER_LPM },
> 
> Isn't three patches a bit much for these changes? I think all three
> patches can be combined into a single patch without making it harder for
> reviewers to understand what is going on.
> 
> Thanks,
> 
> Bart.
> 
> 

Thanks Bart for quick review.
I will merge all 3 changes to a single change in next patch set [V2].

Regards
Manish

