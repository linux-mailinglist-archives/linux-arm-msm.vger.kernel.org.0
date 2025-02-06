Return-Path: <linux-arm-msm+bounces-47010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B74A2A2BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 08:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA8E71885462
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 07:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4BA224B11;
	Thu,  6 Feb 2025 07:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZZBnaCRr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5BE2248AF;
	Thu,  6 Feb 2025 07:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828647; cv=none; b=YEGsrh9fPoSxgIoIkE6G3WXoWlUck84VU/6P8lsvpm7F882GPBAXhv0YDS1Wf2WDRg09pUF0S1VP9xZEwWqxDyaoS1nOeiKb30XSO/5MPXqkDHIwaZn/CmrZfdcVrpFxMTkcQSz6YYltYEDsKfjNt4a6wOwCGHtt/0P0eJGE3FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828647; c=relaxed/simple;
	bh=1Bj6lba93KLuSmAPpVxOrp9MBhKfzWBHMunw0lnYiEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lx/+if5DA1q1WJfBbJ/Z6hQtvJxWwJWAMxLCS2keGzro+U+YSNv7HZo9vc50qBr9E8nb44NY0yOF3/Tt/KCp8BCOiNHrQIpgsRGt6H91jwjgtAtVJq0byo3Njx4QOeZ2NxTv+ObxpU/IItLI+XWwq7cLvmma/cuI9xTWoyYdD0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZZBnaCRr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5166VT1v021954;
	Thu, 6 Feb 2025 07:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3g+vnFkTIXb6mEQnaP+6Vf0+eK3QXy5UacwCIO0T4Ek=; b=ZZBnaCRrhKMluE0L
	xdu/fBb8uqVmiJuojgNK6x30HiR0VeualQkCiZP/7lfA3cBItIgKEiWDWkM2WjWY
	kvkYCMiznt0kOMx0zysy0OTEfkMQa3ldNNFidIW3vg3g57dsLia+hqAuqM50xDKR
	JzeLqeQsM5uBV0rmZDG43eYiqf2g3oqR8AkCpf/T2fAbm4bbMjmOB8UQLGG6wGXF
	EbJsRI/twU55rbW0ZudOyFDtOJmELJZkqwEqXZbNnz4mMwtz/3X5/0UGT8Eu0ccZ
	Q1t3nUzLc+EQwQcvaAGWWsNFQJ74RYvH7dDlp0Urje62+5XG52yDu1zi1wHM4m35
	MW9lfA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mqvy063k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 07:56:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5167u94P007122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 07:56:09 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Feb 2025
 23:56:04 -0800
Message-ID: <0c348361-6c6d-46c5-8cc7-d553c389a280@quicinc.com>
Date: Thu, 6 Feb 2025 15:56:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] scsi: ufs: core: Enable multi-level gear scaling
To: Bean Huo <huobean@gmail.com>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>
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
        open list <linux-kernel@vger.kernel.org>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
 <20250203081109.1614395-6-quic_ziqichen@quicinc.com>
 <062a1d50bacc21708fa1738022d9127214049a5a.camel@gmail.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <062a1d50bacc21708fa1738022d9127214049a5a.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aW9EAt-aSw40beQ84svr77ZuEmbJ2QUE
X-Proofpoint-ORIG-GUID: aW9EAt-aSw40beQ84svr77ZuEmbJ2QUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060065



On 2/6/2025 4:01 AM, Bean Huo wrote:
> On Mon, 2025-02-03 at 16:11 +0800, Ziqi Chen wrote:
>> From: Can Guo <quic_cang@quicinc.com>
>>
>> With OPP V2 enabled, devfreq can scale clocks amongst multiple
>> frequency
>> plans. However, the gear speed is only toggled between min and max
>> during
>> clock scaling. Enable multi-level gear scaling by mapping clock
>> frequencies
>> to gear speeds, so that when devfreq scales clock frequencies we can
>> put
>> the UFS link at the appropraite gear speeds accordingly.
> 		       appropraite->appropriate
> 
> Reviewed-by: Bean Huo <beanhuo@micron.com>

Thanks Bean~

-Ziqi

