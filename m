Return-Path: <linux-arm-msm+bounces-53304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B82A7CF82
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D24663A6CB4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 18:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65687158D80;
	Sun,  6 Apr 2025 18:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BEsyaePT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904401CA81;
	Sun,  6 Apr 2025 18:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743964073; cv=none; b=Ofz6AjogSilIyENWhYglR8tVf6c5ikqnSKhGJFCdEJ7JA02g9WPzHJX360MwjEdzj9Kj8y/cIvQE3wh7Bb+kObDcMQYPxGTf8XoNp8/83YGdjmuYffefMaAlrUa5SwH6xhL0gfGL5uB+umZZjdH1v73zvqWeSaDVz+5/tREdrFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743964073; c=relaxed/simple;
	bh=BwPpS2oKQ551zhCehJLMD0g2Y6WTyFi+ycutfIT+iJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fDzcIz6OVwy/HfDkHkq61pn4/pRU1W2VB5RtdiiIhY/pCtkAqkWyuh1bIOOAlmsZh6MqRMWdpPWiHdZJGtAmByjZYeCSyz+O53qwFh2sKO8Kp880sHZLUgHQY2aBAQ1eiAUojGzAleGBAj8zqlIqeOWOYnoH2HrgU6rqrPZLhgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BEsyaePT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536HqBUL027988;
	Sun, 6 Apr 2025 18:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	scg6by3uhORaQLQQ1sXj4UbvlOlCJRzwMOkPbuIQYag=; b=BEsyaePT+RAAyArn
	EWjiZHKMozMfRsB2forgIrgSd7wi1+BN6CXq+gfsrqFxCdaQkxTF4F3KcMxxpZml
	l2RoWz0DicJGo7K79J6sPjRb5suYtbZpAgNZYvXxNkET0s3YZEflzJzX0iwY9SMi
	de5lyWRc/1Pkxr3dSqqUC6tvV01C3DGkTRTroJ9r558tqO1hdwVmMwI6n3r8wDv0
	ff2JcJFkbqBDsYLivbH0kOAFG+td3Zj/dL+FAQRepHlX/sTKRGcdDuWEyv8Ref2/
	g4u5MUtQ/Gl3Z7zd7E1OLlJI1SwcdUdjvspVxlJ/QkEk7U7RXgB8pRn8BUrj/YA6
	YPNQDQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe26tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Apr 2025 18:27:29 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 536IRTRj032154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 6 Apr 2025 18:27:29 GMT
Received: from [10.216.38.226] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 6 Apr 2025
 11:27:24 -0700
Message-ID: <a4dd9b12-982d-41c3-94bf-9dcd9e41c30c@quicinc.com>
Date: Sun, 6 Apr 2025 23:57:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/2] scsi: ufs: Implement Quirks for Samsung UFS
 Devices
To: Manish Pandey <quic_mapa@quicinc.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_nitirawa@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>
References: <20250404174539.28707-1-quic_mapa@quicinc.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250404174539.28707-1-quic_mapa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Eje0g8nowNYB3UETpOdBv18e1rOq6ELZ
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f2c791 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=2QxGnB5Srs7-xjjaHasA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Eje0g8nowNYB3UETpOdBv18e1rOq6ELZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_05,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=973 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060134



On 4/4/2025 11:15 PM, Manish Pandey wrote:
> Introduce quirks for Samsung UFS devices to modify the PA TX HSG1 sync
> length and TX_HS_EQUALIZER settings on the Qualcomm UFS Host controller.
For what purpose, these quirks are required ? Is there any problem 
statement which you can mention first ?
> 
> Additionally, Samsung UFS devices require extra time in hibern8 mode
> before exiting, beyond the standard handshaking phase between the host
> and device. Introduce a quirk to increase the PA_HIBERN8TIME parameter
> by 100 µs to ensure a proper hibernation process.
> ---
> Changes in V2
> - Split patches to add PA_HIBERN8TIME quirk in ufshcd.c
> 
> ---
> Manish Pandey (2):
>    ufs: qcom: Add quirks for Samsung UFS devices
>    scsi: ufs: introduce quirk to extend PA_HIBERN8TIME for UFS devices
> 
>   drivers/ufs/core/ufshcd.c   | 31 ++++++++++++++++++++++++++
>   drivers/ufs/host/ufs-qcom.c | 43 +++++++++++++++++++++++++++++++++++++
>   drivers/ufs/host/ufs-qcom.h | 18 ++++++++++++++++
>   include/ufs/ufs_quirks.h    |  6 ++++++
>   4 files changed, 98 insertions(+)
> 


