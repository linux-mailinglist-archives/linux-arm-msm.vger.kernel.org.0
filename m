Return-Path: <linux-arm-msm+bounces-20282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7B48CCBCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 07:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEF4E1C2115F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 05:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61395537F8;
	Thu, 23 May 2024 05:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Rb//aCy7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6539AF9;
	Thu, 23 May 2024 05:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716442472; cv=none; b=arqkkCKBjOeU4BGaTBsMKhJTwLXHkrTvQEBXM960qROyx5eRXC+g+8VqseU/m3OMwyUjSBZnGAiNkkLoDqR8GoB/JxmqRNZATcSGtE6LLePkF19tTAB6lflU9OTT5gdZzarfyY6eVdLCJPCLO1z7IboEm6IVqsgLSHZYWqFpnMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716442472; c=relaxed/simple;
	bh=E1+GhCRQlYYBxQ40XhLAHyOCsamK05NaoIq6WUuBjt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sT3cyFxYkyYlJDjc9oBDrSCXcpL6TXZYbsSGvzIR9pL1Q2kLzfMaY+y4+PnK8uEpRLZEe5EZtmbR5Uj9LDy2D/nR/eTChQlM6m8o5/g9joEG/ndez/lBY0hCaIJ58jfeUY/1526m4CIeh3U9sv/xRPqtq+jAjYEIUpMHS0+FsnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Rb//aCy7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44N4kq1Z016760;
	Thu, 23 May 2024 05:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgKVUL89+PifOagCpEXhssK6ZCPIGpsjwpvdTh5PvIU=; b=Rb//aCy7ojlykzfH
	BFBI0vlMHYRzRcTQOxDxTDut24YfblepYIXLZenPPz1wonN50dMue37r7NF+Ynd3
	uNbATwFknf4D6jv8KW1J7vkeqzfq9nMCg5MP4YYz2XEeHl9L8A8t4j1g1hQuWzJo
	DUTm3vepaRtIzZyMBWOn2tTsz8L3o9pPm6xDQpwZBaxyJNKb27KG/4uTSX4HBD/J
	HlWHx4uUXpavv/oBeIH3UZLaArpoqcaS68iU4821HaZ6EmTUmQOeMKwQoYeOQn6U
	3Cb2FeLPK2QlO3FMWfgYbzJF5TEXC6KkejxI5yR5JWHLhy7ogReqyYrYlZWfM2I9
	5R99xw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y9y20g2gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 05:34:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44N5YFjU017507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 05:34:15 GMT
Received: from [192.168.143.77] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 May
 2024 22:34:14 -0700
Message-ID: <60cd9300-d022-65a2-2804-1539a648b3a4@quicinc.com>
Date: Wed, 22 May 2024 22:34:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 2/2] scsi: ufs: qcom: Update the UIC Command Timeout
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, <quic_cang@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <avri.altman@wdc.com>,
        <beanhuo@micron.com>, <adrian.hunter@intel.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<jejb@linux.ibm.com>,
        "open list:ARM/QUALCOMM SUPPORT"
	<linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <cover.1716359578.git.quic_nguyenb@quicinc.com>
 <8e5593feaac75660ff132d67ee5d9130e628fefb.1716359578.git.quic_nguyenb@quicinc.com>
 <2ec8a7a6-c2cd-4861-9a43-8a4652e0f116@acm.org>
 <f9595b82-66f9-dce2-7fba-c42b1eacf962@quicinc.com>
 <bdd52dc0-85dd-4000-b5dd-c2c22f5b8ba1@acm.org>
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
In-Reply-To: <bdd52dc0-85dd-4000-b5dd-c2c22f5b8ba1@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5guV2Ji9zj_JPjtwyPjpYs_x3MjeUFTG
X-Proofpoint-GUID: 5guV2Ji9zj_JPjtwyPjpYs_x3MjeUFTG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_02,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405230035

On 5/22/2024 2:01 PM, Bart Van Assche wrote:
> On 5/22/24 13:56, Bao D. Nguyen wrote:
>> On 5/22/2024 11:18 AM, Bart Van Assche wrote:
>>> Since the described issue is only encountered during development, why to
>>> modify the UIC command timeout unconditionally?
>>
>> The vendors can enjoy the default 500ms UIC timeout if they prefer.
>> As long as they don't write to hba->uic_cmd_timeout in the vendor's 
>> initialization routine, the default value of 500ms will be used.
> 
> Since this issue is not vendor specific, I think it would be better to
> modify the UFSHCI core driver only. Has it been considered to introduce a
> kernel module parameter for setting the UIC command timeout instead of the
> approach of this patch? As you probably know there are multiple mechanisms
> for specifying kernel module parameters, e.g. the bootargs parameter in the
> device tree.

The proposal here uses similar implementation as the auto hibern8 timer 
(hba->ahit). The ahit mechanism has been working well and stable, so I 
thought why not keep using it? Let see if other members have any 
comments about kernel module parameter/bootargs suggestion.

Thanks, Bao

> 
> Thanks,
> 
> Bart.
> 


