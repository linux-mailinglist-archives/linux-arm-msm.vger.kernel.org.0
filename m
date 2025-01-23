Return-Path: <linux-arm-msm+bounces-45899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1747EA19F1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58F357A62F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 07:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EB920B7ED;
	Thu, 23 Jan 2025 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iA6NlXTC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7FD179A7;
	Thu, 23 Jan 2025 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617915; cv=none; b=hmMOQYYf7pzMgugQB1c8iHQ9Sd6tgj6MTgVAM8YV7BHjANfd4yl2ZdA1dFifCkpmonQgbPDMhudWkWVmmfRjZMbltuGe9FRq2p33rpPynBSmlNTc/XjYtDFhrmLH84+RioiNBqLHFUWQb9G7kr+frUdhCjfIvI9LdUmMiudGZ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617915; c=relaxed/simple;
	bh=yGzItM4dgAofV9TmwehA/MqZBs9FW/z2r1wxsHygeVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P0ygl1aOox8an7q0jXYyvv+dJ3m9IY9nNRpSgDA2b6ElDxVBQSBZ6KT7vM2HmtQ8RP5SA1xknTtFsKOATtY2E+WRDhPLn/Iwgrbkanq7FF9k/Ucfv8zJBVi5cbEWEp5G2tNgbk1z8VjWM8IYivPdi1/+X3GNVQDozGRGojAWsk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iA6NlXTC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N0bgAg030508;
	Thu, 23 Jan 2025 07:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pcrgU7xG4gB/DjKcRxKvpbGmYCWhHQJXrVqcY+jGOyc=; b=iA6NlXTCcGz2jxUs
	L5FwCX4eahr5TorO1fNpNfivqpmzPnwMAkejCoUmec5QP/7UbQl1HOnIHAuFDrAS
	6vjmkrZ0P6g6xI3wb56I1nHzEXYbiVZNWlRpy0I2IufBB5WFDQM3mEG9UETbGA7g
	m8reKjkd5m3FDLeijhx4H9DXmfFgwC7FB1kPYdzvFXNDEL4oghUuynKuHth3NVcx
	OWShkYXX3nBo6g8p3Mj+2tLaLPlCcJ//xK/YNtVtMhte2ZVrVF6iVwsrJVhtvVAZ
	ea9qghji4xUDnk3W8GDg0no2hG3CTxbc3EgEKUeQ15+Jubw05bS7/EdbqnhNs9SB
	77bz9g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bbd2gs3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:38:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N7cIUe019960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:38:18 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 23:38:15 -0800
Message-ID: <b1a9e94c-3b13-4c04-ae2f-cd108d569508@quicinc.com>
Date: Thu, 23 Jan 2025 15:38:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] scsi: ufs: qcom: Pass target_freq to clk scale pre
 and post change
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
	<linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-3-quic_ziqichen@quicinc.com>
 <032a703e-1a96-4d6e-a4b1-bb4153550f1d@acm.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <032a703e-1a96-4d6e-a4b1-bb4153550f1d@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qY74wc1Y39N3LEM7FQRKMfQbWc2i3uC9
X-Proofpoint-ORIG-GUID: qY74wc1Y39N3LEM7FQRKMfQbWc2i3uC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230057



On 1/23/2025 2:20 AM, Bart Van Assche wrote:
> On 1/22/25 2:02 AM, Ziqi Chen wrote:
>> scaling up, the devfreq may decide to scale the clock to an intermidiate
> 
> intermidiate -> intermediate
> 
> Thanks,
> 
> Bart.

Sharp insight! I will fix this typo in next version.

-Ziqi

