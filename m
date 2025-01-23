Return-Path: <linux-arm-msm+bounces-45903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2EA19F32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CC1C18837B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 07:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CAD20B7F7;
	Thu, 23 Jan 2025 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HGKeK+7U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF0020B7EF;
	Thu, 23 Jan 2025 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737618057; cv=none; b=JY8EH1kLk1+plgStBrd/oA4LDX2jN3pDUC1mAlH3QhzHGrQDHMzoVD7ruqpFxX2UZRp59Sd9tm6QbbXdbxxpnOmMux8GWoYTdfRGPui66u/PJWQvWYX/Fr76tI5yeHLu/vSqoNR7JUYdnCWFxCRrxc10Lv65zTjBKTbCFtmR/eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737618057; c=relaxed/simple;
	bh=PVlS6lpQHIWqWw8CLSCLLPNoZCR2oxufSSD/Vjrbh2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hzbJZJuBFTKEXmxVb1Ln+ST/mqo6mGFcw+GTN53EMmCAHhZFS6SPd2yj0vF6GmEPFGn7Ng3ptQh2Vka3F8sUFvpFgBI/mAcpbZaU1xhQ6d1WM3Zp+wm6RwuNau8hQvBI4Q4PnztYTFJzW0OUZ1yrZbdFcu3+xfMMy1cpcGyk+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HGKeK+7U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N6VoZZ008981;
	Thu, 23 Jan 2025 07:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zxotyukJrUUbcEXkl+hJ4/F3vjRxLVqJH3XsYaKQ5S8=; b=HGKeK+7ULGUuAJre
	dOzmYtowz+7vrMlSeI9btG2cGsAzGgjtQLB2k6BxlA4HmlFe8NMmm+qscWBJf2CJ
	wr6zaqkGOZGvv9GhDwK/qORILF37P7Y7k2gcQqu/c+3YxT5taXnF+B7lGj5flnkg
	baLP0NB3XDlC52x5JCnO2/tIZWuctoPl5R2m6T3Dv0dwPldYh1wuea7G8GSrJ52p
	uNmLk6z+pjr2YD51oCBpJoODj/LUdMV4tuOB10Dt37rUCSHWeF6BstRpK9HtXNHS
	F1KIqZQdx13zYhhW3lLvMkC8G0TOzLVRUx9Ao/ti+b2gxbOz8VkeUSZdj/Yg5ak8
	mBDoGA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bgk1g4jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:40:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N7eeoX008672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:40:40 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 23:40:36 -0800
Message-ID: <b998f9b5-9965-4cc5-9e76-4ae743596f6b@quicinc.com>
Date: Thu, 23 Jan 2025 15:40:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] scsi: ufs: core: Add a vops to map clock frequency
 to gear speed
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
        Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-4-quic_ziqichen@quicinc.com>
 <a0359746-2cf0-4db3-891d-b4cb4ff6c163@acm.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <a0359746-2cf0-4db3-891d-b4cb4ff6c163@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u1hnh0irVUipXBCcwpviaNOah9bFWAAU
X-Proofpoint-ORIG-GUID: u1hnh0irVUipXBCcwpviaNOah9bFWAAU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230057



On 1/23/2025 2:30 AM, Bart Van Assche wrote:
> On 1/22/25 2:02 AM, Ziqi Chen wrote:
>> +static inline int ufshcd_vops_freq_to_gear_speed(struct ufs_hba *hba,
>> +                         unsigned long freq,
>> +                         u32 *gear)
>> +{
>> +    if (hba->vops && hba->vops->freq_to_gear_speed)
>> +        return hba->vops->freq_to_gear_speed(hba, freq, gear);
>> +
>> +    return -EOPNOTSUPP;
>> +}
> 
> Please remove "vops_" from the function name. I don't think this part of 
> the function name is useful. Additionally, please return the gear value 
> as the function result and remove the "u32 *gear" argument.
> 
> Thanks,
> 
> Bart.

Hi Bart,

Thanks for your review~

In ufshcd-priv.h , the function name of all vop wrapping APIs have the 
same prefix "ufshcd_vops", I need to use the same format as them.


As for return the gear value as the function result. In our original 
design, we also return gear result for this function, but finally we 
want to use return value to indicate the status , e.g,, if vendor 
doesn't implement this vop, we return -EOPNOTSUPP , if there is no 
matched gear to the freq , we return -EINVAL. Although we didn't check 
the return value in this series, we still want to preserve this 
extensibility in case this function be used to other where in the future.

-Ziqi

