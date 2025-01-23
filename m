Return-Path: <linux-arm-msm+bounces-45902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3CFA19F36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB4B77A6CDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 07:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF4B20C019;
	Thu, 23 Jan 2025 07:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VNYsuJV/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D656820B800;
	Thu, 23 Jan 2025 07:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617988; cv=none; b=aO7sK27Z3nfjbVFxEW3l6lSF4k428WHnJxXvm3NXlmvof4jLvj1sKbhoDdc2kQSBoE+Hi1N1wyL+PHbGuNB0RmPMbnSgFuOHsqCZCL39Hnx2t4RowKAsb4alnbDLZ9LwZpgtZysozvqsR7H7edKRjWGz98m8159uILrNxUNcb3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617988; c=relaxed/simple;
	bh=MjhXXvMWhIN4nrLMqcGhbTUQDDq9p8sWJAPgra8geMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gzIcHAnO9/hiwaetw5TQ7hisOxT4+yCM72kuTE9aGJCMDhLp5pP0nSygX9Zb+QhRl4SueHlTWiGrqTVoTV6e0iRk1jBP3t7rY7Qjt6VbJabK1CowwyzMLSoCdn7ARVvotCKzlGobj0MenFT0K1a0O75eMXBM6cfsDD1xZCwafSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VNYsuJV/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N6foTo015678;
	Thu, 23 Jan 2025 07:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XWRuDwHT0XJXF9GMBEm/O7XyGKEF/lyRRQLKxt+L9ig=; b=VNYsuJV/OpEc25lp
	n8CXGWBjGXgWRjigDA1ktisTJzIJgYoSdVFIEbtyXWFOjkoyeA8UWb3MM5ipWLZB
	rdrRYVF8obr6myvcAD+MOhdkk2Cp/ioRdu9WTQ+kak4QQd7n9FIGQ1kthN9rmn9h
	fPJd0VqiiytrY0TQAEtzyjS+39sV3aep2PI98rWdc/vqWa5fyPQT9SmaAbFtKMoO
	/LSzJHMnsNA4+9iNXlx588DQGkpn7ASChZBgFWxHzkiAHu/e+i+l158mubX1uyJF
	aRSL4ybY5weCnNxMvrFfPp8FMyS4Ge5eZ8nii6q1UKd20sRbcCk1uENGiHW08mwJ
	7ccb6w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bgqrg405-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:39:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N7dNwx025011
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:39:23 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 23:39:19 -0800
Message-ID: <0d6190e8-138c-4c74-aaa0-153f24996be7@quicinc.com>
Date: Thu, 23 Jan 2025 15:39:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] scsi: ufs: qcom: Implement the
 freq_to_gear_speed() vops
To: Bart Van Assche <bvanassche@acm.org>, <quic_cang@quicinc.com>,
        <mani@kernel.org>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        open list
	<linux-kernel@vger.kernel.org>,
        Eric Biggers <ebiggers@kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-5-quic_ziqichen@quicinc.com>
 <f03f0cf0-a89f-46a8-a8b7-3c62294b040c@acm.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <f03f0cf0-a89f-46a8-a8b7-3c62294b040c@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IB83njZ8Da2ksTKaWc2aTXeT4kFr3pm4
X-Proofpoint-GUID: IB83njZ8Da2ksTKaWc2aTXeT4kFr3pm4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230055



On 1/23/2025 2:23 AM, Bart Van Assche wrote:
> On 1/22/25 2:02 AM, Ziqi Chen wrote:
>> +static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned 
>> long freq, u32 *gear)
>> +{
>> +    int ret = 0;
>> +
>> +    switch (freq) {
>> +    case 403000000:
>> +        *gear = UFS_HS_G5;
>> +        break;
>> +    case 300000000:
>> +        *gear = UFS_HS_G4;
>> +        break;
>> +    case 201500000:
>> +        *gear = UFS_HS_G3;
>> +        break;
>> +    case 150000000:
>> +    case 100000000:
>> +        *gear = UFS_HS_G2;
>> +        break;
>> +    case 75000000:
>> +    case 37500000:
>> +        *gear = UFS_HS_G1;
>> +        break;
>> +    default:
>> +        ret = -EINVAL;
>> +        dev_err(hba->dev, "%s: Unsupported clock freq : %lu\n", 
>> __func__, freq);
>> +        break;
>> +    }
>> +
>> +    if (!ret)
>> +        dev_dbg(hba->dev, "%s: Freq %lu to Gear %u\n", __func__, 
>> freq, *gear);
>> +
>> +    return ret;
>> +}
> 
> Please simplify the above function by returning early in case of an
> unsupported clock frequency and by removing the 'ret' variable.
> 
> Thanks,
> 
> Bart.
> 
Hi Bart,

looks like a good way , thanks~

-Ziqi

