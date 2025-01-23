Return-Path: <linux-arm-msm+bounces-45898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD3EA19F19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CA5F7A5620
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 07:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3251A201100;
	Thu, 23 Jan 2025 07:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dPqQvTr9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C19179A7;
	Thu, 23 Jan 2025 07:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617902; cv=none; b=jhOzC82gJRIgh713kiL4fJ4CXrWtpaDmIRQ1tmdZEL/2CHT9Hm8+2Zgrpe8YxYUCdROEuZXCSsHHN1vcoo8v15SzpbaL6vDgdEy7K7sAt3DwwQamNIxtWNJ5c5qN99W4V9n6ghMtn37vAhGDPztwoIOiFg0cCsfkLVMFQ/3dN5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617902; c=relaxed/simple;
	bh=waAZu7tTipTbm/hiA/MKEsqHe1zlHko8OZE8jjFYskU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KJgaq+xAr28gAHoFS5E1DxnNcmC74JbtN9KsJDUcQOVIydA6Ou4Jrx0HvCPyVuXveVnlijy3AqpP41IXccqKwYvos6y+8UbSaVMNs+TUTKpiV8QSZddyTCHGrvwOy3IG/vQCSLF2sBRIHHAd0J2+DJMyed+x+ZyYwiPSOSuA0J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dPqQvTr9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N3wf9L017075;
	Thu, 23 Jan 2025 07:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaiEwb9GzSb1/VXlwzCT2CT2IHfMEAwz/tMVIauuf48=; b=dPqQvTr9LyVe1xEn
	MX7AkSZ2PItM6U5xtxpFXHTQZKUrNBttI1catuJNSpsS3gCDPbfKi+Wzt2lltN6A
	iFjVfQr8KgIfPUmFT/fN1vsQTmzIKEryVIgz1TDNhvqTr3rbQxrlVYGxT7lHqkW2
	jtZY2HMKduqe3SExqqWBAH+j7HWGDWeaZNf5dyAVoNOvfumvMG4XNTR3wudDU6AP
	5Uzet0zt/7eoQ8nRZsmBzl7NSUgXxsisbou/vBgM1KV87A9E6xXnV8H+PvpYW1/8
	NI/haH9yJwdGNuavzDjHMhymH8m5maMjtIXb1j3jcstPz3gVMba0/+4rp4DizRkx
	TIqR0A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bebbgd6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:37:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N7bvFb019617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:37:57 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 23:37:51 -0800
Message-ID: <f3a0b0b1-f4a8-4285-96de-8ce2633c7918@quicinc.com>
Date: Thu, 23 Jan 2025 15:37:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vops
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
        Stanley Jhu <chu.stanley@gmail.com>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Andrew Halaney
	<ahalaney@redhat.com>,
        Maramaina Naresh <quic_mnaresh@quicinc.com>,
        "Eric
 Biggers" <ebiggers@google.com>,
        Minwoo Im <minwoo.im@samsung.com>,
        open list
	<linux-kernel@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST
 CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>,
        "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
	<linux-arm-kernel@lists.infradead.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-2-quic_ziqichen@quicinc.com>
 <2e42cc2b-5597-435a-a58d-507c46e1132f@acm.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <2e42cc2b-5597-435a-a58d-507c46e1132f@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1GpTbm2S83pcV9tsyR83haxBRJ49a72g
X-Proofpoint-ORIG-GUID: 1GpTbm2S83pcV9tsyR83haxBRJ49a72g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230057



On 1/23/2025 2:19 AM, Bart Van Assche wrote:
> On 1/22/25 2:02 AM, Ziqi Chen wrote:
>> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
>> index d7aca9e61684..a4dac897a169 100644
>> --- a/include/ufs/ufshcd.h
>> +++ b/include/ufs/ufshcd.h
>> @@ -344,7 +344,7 @@ struct ufs_hba_variant_ops {
>>       void    (*exit)(struct ufs_hba *);
>>       u32    (*get_ufs_hci_version)(struct ufs_hba *);
>>       int    (*set_dma_mask)(struct ufs_hba *);
>> -    int    (*clk_scale_notify)(struct ufs_hba *, bool,
>> +    int (*clk_scale_notify)(struct ufs_hba *, bool, unsigned long,
>>                       enum ufs_notify_change_status);
>>       int    (*setup_clocks)(struct ufs_hba *, bool,
>>                   enum ufs_notify_change_status);
> 
> Please keep the indentation consistent.
> 
> Thanks,
> 
> Bart.

Thanks, Bart, I will improve it.

-Ziqi

