Return-Path: <linux-arm-msm+bounces-43269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E50829FBFCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 16:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 629557A1BAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 15:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CACB1CDFBE;
	Tue, 24 Dec 2024 15:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DTd1aYa0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A51193409;
	Tue, 24 Dec 2024 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735055452; cv=none; b=Ei5JKGRK93qoag3W5R0yTnr0I4EDC4JqOzE14nUf2NY32VBeZJCkMj5CkXnopKjW1nuDlCNJy0Zo6hkoV/yas8xG/f17xdd98kLqkhXFdbkQL60JpCe+NKulNJ9LHC9iei7Ja+DcjcvRkcWZDv1wVlswsq733iRiDrmV8mNs4tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735055452; c=relaxed/simple;
	bh=XK9EM62l8D28weOoTNQt4e9ZL1oZ8up/PdVzEuQisFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dy+rAgIA9vwGMRBhlIexBNo66XtcONICWqcsFiY9PxJD7AdaNFRIkx3/7v1qUHRzqNiqzOghtsL4u/BsCCguKvxnBmjuQD5FeZE8rgflvXKk0QBe17nSCqR+61DplXAV2oncLXQLbeOtFPlDBrteDNtwW/WItyW45UeYUkFWfZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DTd1aYa0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BOBLl5w027681;
	Tue, 24 Dec 2024 15:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wt7MCs5Mpet14ES+5dqo1HnNMsp1jNFFPBOKUT0UDQ0=; b=DTd1aYa0FQuvqx8V
	pXkF3FnoAPCbf+F+0ke+pTUj8/NB+2wSTwwnEy/exsjfk1bFoVJr1iLdEkoDSMBY
	tBbx/zhf1jTeBD+h2UGkv/56VQKDl48t5VVR4AT9pWnNp3S6Yc+7V4gRLQXIkiY5
	dF5Q/J8Ku7l5leERM2RAatRUq/DZQQXZ4Bw0hBR7Cn57q0JbCRiOaCRBZHKf+0t7
	UEJS4cJ2wO6JarZ/Tz+vWSBetb0wS7RS9Fsw74zR9gocwGDuI9lhPZWj5if0hAaE
	t3y3aUCZiurZPdZY0u+TxJNy1/s0HaIQmXfrnGg6479kFWF7FajVNfZ6pzARxjZU
	GqgABA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qv0wh1ju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 15:50:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BOFoXZs021103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 15:50:33 GMT
Received: from [10.218.43.20] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Dec
 2024 07:50:29 -0800
Message-ID: <160d04cc-c5be-4fa7-b039-0716ecc52b70@quicinc.com>
Date: Tue, 24 Dec 2024 21:20:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6] scsi: ufs: qcom: Enable UFS Shared ICE Feature
To: Eric Biggers <ebiggers@kernel.org>
CC: <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <andersson@kernel.org>, <bvanassche@acm.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Naveen Kumar Goud Arepalli
	<quic_narepall@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20241223132033.11706-1-quic_rdwivedi@quicinc.com>
 <20241223193130.GA2032@quark.localdomain>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <20241223193130.GA2032@quark.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ecfJjZU8E3qOlW2DD7ku8V9wZfwWdAq_
X-Proofpoint-ORIG-GUID: ecfJjZU8E3qOlW2DD7ku8V9wZfwWdAq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240137



On 24-Dec-24 1:01 AM, Eric Biggers wrote:
> On Mon, Dec 23, 2024 at 06:50:33PM +0530, Ram Kumar Dwivedi wrote:
>>  #ifdef CONFIG_SCSI_UFS_CRYPTO
>> +/**
>> + * ufs_qcom_config_ice_allocator() - ICE core allocator configuration
>> + *
>> + * @host: pointer to qcom specific variant structure.
>> + */
>> +static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
>> +{
>> +	struct ufs_hba *hba = host->hba;
>> +	static const uint8_t val[4] = { NUM_RX_R1W0, NUM_TX_R0W1, NUM_RX_R1W1, NUM_TX_R1W1 };
>> +	u32 config;
>> +
>> +	if (!is_ice_config_supported(host))
>> +		return;
> 
> This is the only place that is_ice_config_supported() is called, so the helper
> function seems unnecessary vs. just checking UFS_QCOM_CAP_ICE_CONFIG directly.
> 
> Also, shouldn't any ICE configuration also be conditional on UFSHCD_CAP_CRYPTO?
> Just in case the ICE support got turned off for some reason.

Hi Eric,
Thanks for review. I have addressed your comments in the latest patchset.

Thanks,
Ram.

> 
> - Eric


