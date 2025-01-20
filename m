Return-Path: <linux-arm-msm+bounces-45583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3612BA16BFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 13:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4D2718807F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 12:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1161DF987;
	Mon, 20 Jan 2025 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UNM+ZzQx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056C11B87EE;
	Mon, 20 Jan 2025 12:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737374698; cv=none; b=Qnlev5pu+Tg3QeUXomKHOjy/0hhqnLVC3JyPW9WzRonYmITxz/O4fxFwlLc2WFX9XcaK5t1y0asZ5z+fBeYBKIe2fMfsqz+nSYpLmFNQ2Uf0QSP0J6MOOYZANYC1uYA2oh9dGUStta0Thu5yyStTo7r3oXET6bsZgY6vlfLi91U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737374698; c=relaxed/simple;
	bh=77uKlVUVfIf5cnGhjsrH7C5zfsr5CH00+rovo8wtBhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SjwQN6jbvrLBUcgdKQMgimYdsOxpsXMYHcpMyzmMZY+2AtOhDfh/QUNQx0UfEn24rBP8Zyxk1anQ1Sdty4/aCRuOl6V/Z/ks9/MPdTPlS3xOXRW4phazYGJtCVO6ACaMWm/b8dmRpoSHdJ7lJ4qCyh+sLqb7J3ZJ8hK/Dwirv8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UNM+ZzQx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KAKsS5009790;
	Mon, 20 Jan 2025 12:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FRsgkzoNqih4K7odd+Rs2FcSLmyHax+wH9W/qkftptw=; b=UNM+ZzQxgJ/vlkNN
	vefMVXpaO49JWYh6ONq9M1tBpYE16ALKcQR7Po7cP/Eaxb0NAy7AQJOyQA3Jv1hu
	rP/tHyls1k8HR+AtNzlDQQdJ63YvU0jn2zGkNyWGy4SbwoPyDnYnKjIAdZoEd1Re
	4yodklMg0djgMIVGGnBe2bN/lKTMNVaaSDKb9QbX7gNI0UNFjGqi5auv4JXW/x8j
	v3AkV+rD8XUzQrQpnypToIjNBDNgU3G6UNbKYW10Bw27u16YqjzbyRbhMCp1zdou
	mTq4PmZgPZt2ffDbSVJE+fg4wq6mkVbcEoCz8nj+xpV4EeTvF+CFt1bIDhtBNNm0
	dKU/0Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449mng87pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 12:04:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50KC4YqM014130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 12:04:34 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 04:04:30 -0800
Message-ID: <72e476a3-4b62-446a-8284-0558561917bc@quicinc.com>
Date: Mon, 20 Jan 2025 20:04:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] scsi: ufs: qcom: Implement the freq_to_gear_speed()
 vops
To: Avri Altman <Avri.Altman@wdc.com>,
        "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "mani@kernel.org" <mani@kernel.org>,
        "beanhuo@micron.com"
	<beanhuo@micron.com>,
        "junwoo80.lee@samsung.com" <junwoo80.lee@samsung.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
        "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
        "quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        "open list:ARM/QUALCOMM MAILING
 LIST" <linux-arm-msm@vger.kernel.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-5-quic_ziqichen@quicinc.com>
 <DM6PR04MB6575AEC570DA0E05BCDFADCDFC1A2@DM6PR04MB6575.namprd04.prod.outlook.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <DM6PR04MB6575AEC570DA0E05BCDFADCDFC1A2@DM6PR04MB6575.namprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WNPEHWjHJ9-UhGlhgyv5b9Bo58uCL_hE
X-Proofpoint-GUID: WNPEHWjHJ9-UhGlhgyv5b9Bo58uCL_hE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200100


Hi Avri,

Thanks for your review~

On 1/17/2025 5:40 AM, Avri Altman wrote:
>> From: Can Guo <quic_cang@quicinc.com>
>>
>> Implement the freq_to_gear_speed() vops to map the unipro core clock
>> frequency to the corresponding maximum supported gear speed.
>>
>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 32 ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c index
>> 1e8a23eb8c13..64263fa884f5 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -1803,6 +1803,37 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
>>          return ret;
>>   }
>>
>> +static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned
>> +long freq, u32 *gear) {
>> +       int ret = 0;
>> +
>> +       switch (freq) {
> Maybe you can use here the UNIPRO_CORE_CLK_FREQ_xx
The UNIPRO_CORE_CLK_FREQ_xx is used for "cycles_in_1us" which be handled 
by ceil() function.  It is not an exact frequency number and is not 
appropriate for use here.

> 
> Thanks,
> Avri

-Ziqi

>> +       case 403000000:
>> +               *gear = UFS_HS_G5;
>> +               break;
>> +       case 300000000:
>> +               *gear = UFS_HS_G4;
>> +               break;
>> +       case 201500000:
>> +               *gear = UFS_HS_G3;
>> +               break;
>> +       case 150000000:
>> +       case 100000000:
>> +               *gear = UFS_HS_G2;
>> +               break;
>> +       case 75000000:
>> +       case 37500000:
>> +               *gear = UFS_HS_G1;
>> +               break;
>> +       default:
>> +               ret = -EINVAL;
>> +               dev_err(hba->dev, "Unsupported clock freq\n");
>> +               break;
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>>   /*
>>    * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
>>    *
>> @@ -1833,6 +1864,7 @@ static const struct ufs_hba_variant_ops
>> ufs_hba_qcom_vops = {
>>          .op_runtime_config      = ufs_qcom_op_runtime_config,
>>          .get_outstanding_cqs    = ufs_qcom_get_outstanding_cqs,
>>          .config_esi             = ufs_qcom_config_esi,
>> +       .freq_to_gear_speed     = ufs_qcom_freq_to_gear_speed,
>>   };
>>
>>   /**
>> --
>> 2.34.1
> 

