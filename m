Return-Path: <linux-arm-msm+bounces-57342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FB2AB0969
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 07:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B3749E756D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 05:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FD5264A83;
	Fri,  9 May 2025 05:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wpk0xIXj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D47139D1B;
	Fri,  9 May 2025 05:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746767003; cv=none; b=OiZWJfsyqTMQv2l0sNpzl5FzwLeeIRb5hIP+bgsHrjsWQn3PxnI4SAYa2XiXcortNnbD+UPmuRfaGF2URpzShEQmD7ObEfxcftfqvkiQ5f8q7d16pvw+Gh1pcteD1zX4NiTo5g7bRrij6uLHiErsNIqvI4+HCKcy1uFU4QY+Vco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746767003; c=relaxed/simple;
	bh=xbOGB7izE0lOUCVHPMcETHodRDciZrjYwgfcA/Zxs74=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K1u2I5gkw5ZC46LzJZuTuOJJZBtMIzNRWdRaS7G7PIBP34OuY82L9mhrihRH/tUzgircUKhWW54T9CIcQ6FYpRhwWqVakAhBIQJh1zOyh/9VZctqv0PP02mvtGKLTvGC6lyj46/Xj/s5krcGwhTy+7CxfEwUX+mUx1KakRcp6oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wpk0xIXj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548I1I4p021350;
	Fri, 9 May 2025 05:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qjlYofGatGRAiUmyQmq+6GXYuIy1QKIWTHRJYUSH5OQ=; b=Wpk0xIXjxfXDKr0v
	eBjtXDDeLQ6XWeE1Gu6bOQ/NWNP28DnlzHyIaEQa0LHIymkMtMDxk3xWY5mDNXeb
	C0xVZNSGUDbdey3F4jgjPBHDgL7Ad9FKuJzChS6F/bQlbSeaGopd68/Oe2d2o0Q3
	a9Jn36IGSHG3r2I9my+pkhRcG9wSwPXuuTmJY2eEOfY1srap2BevPhDAw14HLtto
	zV4AaB/CuC9RDwaqhlf+KOB92YI8IxvhlusC5bvtcJ99Y6pwoPt0uobTvyjFbDG1
	3Zl/5/dyKyYM+hU9d+4dT80xv+OOl5TwZZXr4r2RkeyiM5CfAhWhI+AF3+XKc9Ue
	axZHcw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj2un7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 05:02:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54952rCx019997
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 05:02:53 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 22:02:49 -0700
Message-ID: <5748d0cc-a603-4b44-bbfc-d39d684b2ea6@quicinc.com>
Date: Fri, 9 May 2025 13:02:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] scsi: ufs: core: skip UFS clkscale if host
 asynchronous scan in progress
To: Bart Van Assche <bvanassche@acm.org>, <quic_cang@quicinc.com>,
        <mani@kernel.org>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <neil.armstrong@linaro.org>,
        <luca.weiss@fairphone.com>, <konrad.dybcio@oss.qualcomm.com>,
        <peter.wang@mediatek.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250508093854.3281475-1-quic_ziqichen@quicinc.com>
 <fd13e179-f2d8-4085-86da-c6b0fce2de5b@acm.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <fd13e179-f2d8-4085-86da-c6b0fce2de5b@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681d8c7e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=H7B4ieK4C1KPzknp_EoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA0NiBTYWx0ZWRfXwEaaIBZNg/DI
 4lPdfVl31yPZlSneqVeeKwe/ipY121VnsIn7INw0Io3RT86fL1mZnqCQ032yhBJiPGm71Cs08Sj
 2gGV1VBbfnmJc8uE2yT7JWzt7F4qk9AgqPK50MqVgINebm8lkSZpGiyXfwETdW2dmYCWLHlJvj8
 9ea5KCM/yVkCwLLm6Fw/NJt3gUKBXne2g40mwPmpQshbD7gf8VYu5AM1fJ9dG6k8L/FCCacPJhZ
 cjne/uXCPhP1hJz+3kU4ZCX2mMefqCPb6lrmvePJhUiogvub3I/jiFiyl5lQynPE3DyjX5jgzhW
 k/dZBhkO+gZ5dCZNWuPOwXzl/eRPrFYC/aQB3Fp2R0ENJLP130ocZyl+UrcoDpda28UE+ArSwx4
 oFYjN2i8IpqFCA6h/InAIgIt+50p2aIgXvd1epHki3+0Mv+QhsCThs44NMvZyg6/rhbZ8oxg
X-Proofpoint-GUID: YvBBlEA34M66njag9DWaFOMVKtfpMOJy
X-Proofpoint-ORIG-GUID: YvBBlEA34M66njag9DWaFOMVKtfpMOJy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_01,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090046



On 5/9/2025 12:06 AM, Bart Van Assche wrote:
> On 5/8/25 2:38 AM, Ziqi Chen wrote:
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 1c53ccf5a616..04f40677e76a 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -1207,6 +1207,9 @@ static bool 
>> ufshcd_is_devfreq_scaling_required(struct ufs_hba *hba,
>>       if (list_empty(head))
>>           return false;
>> +    if (hba->host->async_scan)
>> +        return false;
> 
> Testing a boolean is never a proper way to synchronize code sections.
> As an example, the SCSI core could set hba->host->async_scan after this
> check completed and before the code below is executed. I think we need a
> better solution.

Hi Bart,

I get your point, we have also taken this into consideration. That's why
we move ufshcd_devfreq_init() out of ufshd_add_lus().

Old sequence:

| ufshcd_async_scan()
   |ufshcd_add_lus()
     |ufshcd_devfreq_init()
     |  | enable UFS clock scaling
     |scsi_scan_host()
        |scsi_prep_async_scan()
        |    | set host->async_scan to '1'
        |async_schedule(do_scan_async, data)

With this old sequence , The ufs devfreq monitor started before the
scsi_prep_async_scan(),  the SCSI core could set hba->host->async_scan
after this check.

New sequence:

| ufshcd_async_scan()
   |ufshcd_add_lus()
   | |scsi_scan_host()
   |    |scsi_prep_async_scan()
   |    |    | set host->async_scan to '1'
   |    |async_schedule(do_scan_async, data)
   |ufshcd_devfreq_init()
   |    |enable UFS clock scaling

With the new sequence , it is guaranteed that host->async_scan
is set before the UFS clock scaling enabling.

I guess you might be worried about out-of-order execution will
cause this flag not be set before clock scaling enabling with
extremely low probability?
If yes, do you have any suggestion on this ?


BRs,
Ziqi


> 
> Bart.


