Return-Path: <linux-arm-msm+bounces-57822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A293AB6923
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 12:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77F8E7A7E15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 10:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C2D25E453;
	Wed, 14 May 2025 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P5MN/a/l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86F34C9F;
	Wed, 14 May 2025 10:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219751; cv=none; b=K2L+LO6X39ekNWrffpwRyPB2lA0ewSUCNOSlX8TH1ePwjk/4n9tj9hfSdN4hwGpt0Uce4Aqd2NxNA5JDo8Cy+VA4i+Q7OFMzo8c6YEUZs0EbLf7Qqr5J9W8mKTeDVBis+IqxV0OHg4VEUeTBPvW/NpDGzx3TmS16GeWTA8lDYHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219751; c=relaxed/simple;
	bh=H33ToQ/C0pFqArlWaJwPefzpoYTEl8ndBnbv++E0xvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r89xOcX2ThM2caQB9NDJinO0uwJAaAjcdFprhs5QW+wPr58lb0jEL/DwjGb1k5z/efZCmd+xeCGFTkmqYK0xBlkYVMJerqNwFHNbakPPAVedw9zu8UGjxUEkTFYve2Z0YK+Tc4ECOKb4vK1ly0mKjL9rZc0IRXUgQkZufJ4LU/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P5MN/a/l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAKkcs005071;
	Wed, 14 May 2025 10:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIm3tAFlHE9z6sSXgKFJxec6FczCa2GoB0pjgCPfrgs=; b=P5MN/a/l6s/N34oe
	ptnCxnbgHgHWXcoYlbYky4XwAQMaJkhxqh/qJZaGy+SCgr1//rjex3q7XLn02SZY
	zAnxlRx0ci3013iHU5jAarNtAX9eOdyUzgoiV4CHqDX3Fgk0aIIQK691DxLlmarz
	3fOgjUf3p3T/baPDclbAdaBgd5Bc7YVfZpCBpXlO/Z2N8zin7gO56kfLVIx/S9oJ
	oWiqlg8r9vCiJt+UwF+MdNaJc2XaiBc2xYfNBIkb9ymIGIcc/szf5NLs1i34egcY
	fpjvDbOWmS0lll3wykA4QLEnfECP6x8LmsH+cM4DQ3wvmw+sHrd2AIp8az7DStTq
	iDveGg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr2bcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 10:48:58 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EAmvld001647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 10:48:57 GMT
Received: from [10.218.0.120] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 03:48:52 -0700
Message-ID: <6a1f0cef-d5b6-4b50-98c0-be4af9add3db@quicinc.com>
Date: Wed, 14 May 2025 16:18:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/2] mmc: core: Introduce new flag to force hardware
 reset
To: Adrian Hunter <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_kamasali@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, Jens Axboe <axboe@kernel.dk>,
        Avri Altman
	<Avri.Altman@wdc.com>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        =?UTF-8?Q?Christian_L=C3=B6hle?= <CLoehle@hyperstone.com>,
        Bean Huo
	<beanhuo@micron.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Dmitry Osipenko <digetx@gmail.com>, Stephen Boyd <swboyd@chromium.org>
References: <20220603051534.22672-1-quic_sartgarg@quicinc.com>
 <20220603051534.22672-2-quic_sartgarg@quicinc.com>
 <bbcd824b-457a-1009-835d-3e51ed04c1c2@intel.com>
Content-Language: en-US
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <bbcd824b-457a-1009-835d-3e51ed04c1c2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Rw-LTEmRQIZXHC4vcXk0QgwwhHv54qs8
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6824751a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=QyXUC8HyAAAA:8 a=5c94v814E0oW15qpEbMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Rw-LTEmRQIZXHC4vcXk0QgwwhHv54qs8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA5NCBTYWx0ZWRfXxjtIswERloOp
 K+Ax2E5qXdNB+FDEhKjwy3dpdhGx8C4gxkTNr2isJXSGCCE6ArMcCp3rCNhWqERPMHXpEnpNJ/n
 INTdgqf4JQmWcJbD1Hyjf/UtJZItVMc8JiwMZbKQk+H4WGB7Xmc+1EYCCIhHuiFKk7KPU8/uBbu
 vSMiwobQ6XxXyhB8xSHfALj7CUGYb0L8WlGnAYgeXB2ds7zNBuXIG9JM0UTABWAmxkZxi//EIFX
 XxAj9x+N3cwySB/mtbOvJv7OyXm8pL7E6sF/QR/2VINNdNdJcWt5C4m9dP2oHvOQlGxOuONtIlI
 f7/z/7+JlQb1QzHGjg5Yz9y2i5rOELbvEsYZakDUCYGQONJaPjOn2ddijA7Ka9fTd5P071DYVju
 /eQdpcGLxAo9q0p0+diJPQQ4K6AXa7jUaHIiED/GWUB5p4BaMuIVJiwcn6rvxE0iN3Ozyrcr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_03,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140094



On 6/3/2022 11:03 AM, Adrian Hunter wrote:
> On 3/06/22 08:15, Sarthak Garg wrote:
>> Introduce new flag cqe_recovery_reset_always to allow vendors to force
>> hardware reset during cqe recovery.
>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> 
> You should re-base on top of "mmc: block: Fix CQE recovery reset success"
> 
> Also you may want to consider fixes / stable tags.
> 
> Otherwise, for both patches:
> 
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> 

Missed your minor comment. Seems like above mentioned rebase change is 
merged now so will repost in V2 by rebasing on the tip.
Moreover no fixes / stable tag needed.

>> ---
>>   drivers/mmc/core/block.c | 2 +-
>>   include/linux/mmc/host.h | 1 +
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
>> index 1259ca22d625..496cdd8a2999 100644
>> --- a/drivers/mmc/core/block.c
>> +++ b/drivers/mmc/core/block.c
>> @@ -1497,7 +1497,7 @@ void mmc_blk_cqe_recovery(struct mmc_queue *mq)
>>   	pr_debug("%s: CQE recovery start\n", mmc_hostname(host));
>>   
>>   	err = mmc_cqe_recovery(host);
>> -	if (err)
>> +	if (err || host->cqe_recovery_reset_always)
>>   		mmc_blk_reset(mq->blkdata, host, MMC_BLK_CQE_RECOVERY);
>>   	else
>>   		mmc_blk_reset_success(mq->blkdata, MMC_BLK_CQE_RECOVERY);
>> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
>> index c193c50ccd78..3e2fe950b4ec 100644
>> --- a/include/linux/mmc/host.h
>> +++ b/include/linux/mmc/host.h
>> @@ -492,6 +492,7 @@ struct mmc_host {
>>   	int			cqe_qdepth;
>>   	bool			cqe_enabled;
>>   	bool			cqe_on;
>> +	bool			cqe_recovery_reset_always;
>>   
>>   	/* Inline encryption support */
>>   #ifdef CONFIG_MMC_CRYPTO
> 

