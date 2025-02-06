Return-Path: <linux-arm-msm+bounces-47011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48840A2A2CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 09:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 430C7167348
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 08:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFB022540A;
	Thu,  6 Feb 2025 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ipUvpeTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0CC2248BB;
	Thu,  6 Feb 2025 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828767; cv=none; b=Yx+IQ+0fsDLfl3cjedY42V9msLMl/4reJTlvWEfz/GYm2KkURY/Vb24qy3JejdqHR5XwciZrB5yTmGQC5qC5nwB8IVzZSRz10Gf6tRtDDlx9z6Irs0nwa8/CgqkjNtVdOEo2sV7PRhki04nxubFT2ZJsF1A5rvLkS0YhJXHypVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828767; c=relaxed/simple;
	bh=sXdPlzFdX38bZcgd9vwTBFAPFn3zfKQhgIFjawLSlzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c7EBfELkrCJkR+R6xv8lj9yCjuQvD6KlikFynVDgegOQaLB6yAvFDjBRYTI1SBIrOTzKqnPwh6iXYrdOGL/DESh835tOBqsD27+yaHmexVGUqaKNC/M/3jvgPMlz28FaDUT/unAHDu0kPiIl2Y8GPYXQ+tQy1RPa8clPPPJj57o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ipUvpeTp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5166Vq9q022414;
	Thu, 6 Feb 2025 07:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MhxgoLBPLa96l70xr1cM+BoHNW/7tBfIP50wGCnf9rg=; b=ipUvpeTpedKQhXMl
	BCgMBH5PGVQAdtq/SuJ5LdfLrJIMLJS32ZHNz7D+sDCPZkTQB3e/RICaDV1JDIbK
	9+xhlHi2wwDU+8cx3ZFYR5BM63cvqg1waCGhsfjB2xUAnz8lW1xkSGFHR+1Hk9al
	BWws+qPSPynn2QgnemowDMOxvCgXL4FKDfqMYeoYrdoqIYUpZfpHgZg5zXDfkhiN
	ZSJCVKM1Ectu/48hZ4/Ffjfq3Wew1V0mE6rQPHqqIGXat9IduySBUTQViQYA3uNE
	X8ZDWaLfIoOoRuVGa1l+embVaZoQ/WaWAO6BQ4l18KnQls3R9CpqThWYoZ/bI+OM
	Z3N5mw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mqvy0675-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 07:58:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5167w67O006332
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 07:58:06 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Feb 2025
 23:58:00 -0800
Message-ID: <c764a953-0094-4df9-8f4e-2bde89a894a6@quicinc.com>
Date: Thu, 6 Feb 2025 15:57:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] scsi: ufs: core: Toggle Write Booster during clock
 scaling base on gear speed
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
        Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
        "open
 list" <linux-kernel@vger.kernel.org>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
 <20250203081109.1614395-8-quic_ziqichen@quicinc.com>
 <20655da3044d03777d85d97d1ca82b68a4c54056.camel@gmail.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <20655da3044d03777d85d97d1ca82b68a4c54056.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tEHbMYINfFQm_0pU2Bq3UWYrxHeyUOLh
X-Proofpoint-ORIG-GUID: tEHbMYINfFQm_0pU2Bq3UWYrxHeyUOLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=993 lowpriorityscore=0
 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060065



On 2/6/2025 4:03 AM, Bean Huo wrote:
> On Mon, 2025-02-03 at 16:11 +0800, Ziqi Chen wrote:
>>> +       if (!hba->clk_scaling.wb_gear)
>>> +               hba->clk_scaling.wb_gear = UFS_HS_G3;
>>> +
> 
> Hi Ziqi,
> 
> Initializes wb_gear to UFS_HS_G3, mabye add comments in the commit why.
> 
> 
Sure , I will add this comment, thank you~

-Ziqi

> Reviewed-by: Bean Huo <beanhuo@micron.com>


