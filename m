Return-Path: <linux-arm-msm+bounces-20283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCCF8CCBD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 07:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AB5528107E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 05:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2861537F8;
	Thu, 23 May 2024 05:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j1WEB2tb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D64B39AF9;
	Thu, 23 May 2024 05:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716442948; cv=none; b=Jdy8Gd2qffrniuwc/ZW8a1vy/s8/3DWZ07lCOjp34/AFkkprlrLvqpJNmZPoIcUka8zs2QgeT6UvM00F4eeDNWIkpYxGSVVnNZztDpjbf1LkIU/NiszUfAQsAXFCBtWB7QxMn8jjRXuZPDJXqsc0kEIGl1s7eYUcySBiF4DonUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716442948; c=relaxed/simple;
	bh=Y1VXwDvxGAnVnlR04JsLrkNPdKxtHxOw44VCzccAUPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TbkT2w9jo5m0Z3jf8TFnK7mGidUYlpligN8hGsqqlKmiXJMZcsFVcs+WYEvtNX93SZkG3FaMeFpVcCPphd3T3ThV8JHZ/GoLpTfhQuEyjiuMP7yMUdhFt4hB5Xu8yOU36MD5Hy98oDg7/s7U4bmzv5TY6uMyjEZvwDQ0lOwDhFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j1WEB2tb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44N4bTfS017045;
	Thu, 23 May 2024 05:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/U9ryxChaVrHIu5gC0OQEG+gB2a/wA1FmQs1ySyoP90=; b=j1WEB2tbbVqkfzZS
	0qW+F64TFxGj3Sm9ZKeKCvzcEcs+A+EyRdVxgTFhRbr/qmBU5cmlzOtYeM998V2a
	a45WwCfaBoYLaj5o4ppQ7TH5uyT0udG500qJ5TlkH7QHwGT1QrI2Rutlq4EISuhD
	B3jpikfCptGmcKrlbGo3J/1DDNDxh7Hf0MGWyb61fJmIv1TH21rK/xwUUwKwEIKF
	XyXVMOHl4FYM0ZZ/MzG0aNXM6g1xLGXkPOsgKaWUuv3MIwp7waO+KEm7zLwhCqk0
	aoRldNN+rgHVgLkjpVZ9xLgPho0GXoXAAIQNFSnbC8dmOoEACaIkOVVqUA/WkmlF
	+T4FbA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y9xxe03ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 05:42:16 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44N5gEwm022938
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 05:42:15 GMT
Received: from [192.168.143.77] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 May
 2024 22:42:14 -0700
Message-ID: <a6950702-536c-af82-4eae-6f9cc2c3baaa@quicinc.com>
Date: Wed, 22 May 2024 22:42:14 -0700
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
To: Avri Altman <Avri.Altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
        "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
        "quic_nitirawa@quicinc.com"
	<quic_nitirawa@quicinc.com>,
        "beanhuo@micron.com" <beanhuo@micron.com>,
        "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>,
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
 <DM6PR04MB6575FAF59F9F3499BEC4128CFCF42@DM6PR04MB6575.namprd04.prod.outlook.com>
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
In-Reply-To: <DM6PR04MB6575FAF59F9F3499BEC4128CFCF42@DM6PR04MB6575.namprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l7PSWFsDcmJaTaLfgHQQRpLzC6ozpM-u
X-Proofpoint-ORIG-GUID: l7PSWFsDcmJaTaLfgHQQRpLzC6ozpM-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_02,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405230036

On 5/22/2024 8:18 PM, Avri Altman wrote:
>> On 5/22/24 13:56, Bao D. Nguyen wrote:
>>> On 5/22/2024 11:18 AM, Bart Van Assche wrote:
>>>> Since the described issue is only encountered during development, why to
>>>> modify the UIC command timeout unconditionally?
>>>
>>> The vendors can enjoy the default 500ms UIC timeout if they prefer.
>>> As long as they don't write to hba->uic_cmd_timeout in the vendor's
>> initialization routine, the default value of 500ms will be used.
>>
>> Since this issue is not vendor specific, I think it would be better to
>> modify the UFSHCI core driver only. Has it been considered to introduce a
>> kernel module parameter for setting the UIC command timeout instead of the
>> approach of this patch? As you probably know there are multiple mechanisms
>> for specifying kernel module parameters, e.g. the bootargs parameter in the
>> device tree.
> Since the problem statement is "During product development...", why not just a debugfs?

Hi Avri, if I am not mistaken, debugfs is not available at the initial 
stage of ufs probe/init time right?

> 
> Thanks,
> Avri
> 
>>
>> Thanks,
>>
>> Bart.
> 


