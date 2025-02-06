Return-Path: <linux-arm-msm+bounces-47008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1B5A2A2B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 08:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C50B13A7427
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 07:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CEF2248BB;
	Thu,  6 Feb 2025 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pKRbuR0c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F36A214239;
	Thu,  6 Feb 2025 07:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828470; cv=none; b=AfWySU/XHdXS3Fu6bggoBY9F1WeFIEC1AFf6XCTUpU6XSbMNZkrCa7D5H5ZDk2k1kPkSvBqqKe89nxXCvcvflxe3Kv4a/C593rrkPfyqPlWx0JqJS4RMAJcprOxXtmsig529xih9rYHkBeEx0PnpmDLjnbu3rYO/tUQ4JXCzeJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828470; c=relaxed/simple;
	bh=JozRtj1csM+dWTaYHQBUpBnYPTzHtvmP3/fMDzl89sY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EwMp6xHDDBybVtqmyRWFG3/lNnryy6sITly6uCdYdGdURU/Gz8fQtVthAzOXPIXZOPCQpwcy/MisLDZPQlyXgQfPdFYo8+V1NjYhA0VgVugG6Wz1lsjKR6NoDD1EtCFCv8BJO9I024JM2p3gBLKIHe8dFeSuXCQJloJ46umjM8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pKRbuR0c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515LDg3t021797;
	Thu, 6 Feb 2025 07:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	284+3BQ0WZGBGAC7tLP5N9xLJQL3CmCuxWZWKxXOvV4=; b=pKRbuR0cKU04BtqO
	b1vaoRDtcUSv7SHhRH9sfpRsP8WD7NQ93MwScRZnKYuNjPCqY8wGRwiyf9ZqaBI2
	8mwJO3keVg3mksfIfsT7B0xLMfH5aPAhg+5EMcpXlmgY25JKiwNTkPNk4SFlDO6n
	SejRTWOHVXSgzF+kn6ZOP4N0KiEAQTqbnTw2pCKkTp9vY4M29GukD1V2FI1AyHlD
	RNkJ3V0Rb6ECFALKIptdU/WJuTA3vrO7lhQngSnymc9/On9ovINSKsQij8AqfByf
	/YtpMjf2h9+pyiXA2KZwQSIgdMLdULXGGx3GyuLHCWBufYGewBCz3RmkFx7z+3oA
	L3v8PQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mfqch6h8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 07:53:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5167r92V008917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 07:53:09 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Feb 2025
 23:53:04 -0800
Message-ID: <feff073b-452f-48d3-b5a8-c308c59baec8@quicinc.com>
Date: Thu, 6 Feb 2025 15:53:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] scsi: ufs: core: Toggle Write Booster during clock
 scaling base on gear speed
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
        Andrew Halaney <ahalaney@redhat.com>,
        Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
        "open
 list" <linux-kernel@vger.kernel.org>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
 <20250203081109.1614395-8-quic_ziqichen@quicinc.com>
 <e0a30d55-5319-48e7-a121-04db8a393f39@acm.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <e0a30d55-5319-48e7-a121-04db8a393f39@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mpT8SQ05G1fkf0IZLyBEFfFxpQM1e8dN
X-Proofpoint-ORIG-GUID: mpT8SQ05G1fkf0IZLyBEFfFxpQM1e8dN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060064



On 2/6/2025 2:09 AM, Bart Van Assche wrote:
> On 2/3/25 12:11 AM, Ziqi Chen wrote:
>> -    /* Enable Write Booster if we have scaled up else disable it */
>> -    if (ufshcd_enable_wb_if_scaling_up(hba) && !err)
>> -        ufshcd_wb_toggle(hba, scale_up);
>> +    /* Enable Write Booster if current gear requires it else disable 
>> it */
>> +    if (ufshcd_enable_wb_if_scaling_up(hba) && !err) {
>> +        bool wb_en = false;
>> +
>> +        wb_en = hba->pwr_info.gear_rx >= hba->clk_scaling.wb_gear ? 
>> true : false;
>> +        ufshcd_wb_toggle(hba, wb_en);
>> +    }
> 
> Both the " = false" initialization and the "? true : false" part are
> unnecessary. Please remove the "wb_en" variable entirely, e.g. as follows:
> 
>      if (ufshcd_enable_wb_if_scaling_up(hba) && !err)
>          ufshcd_wb_toggle(hba, hba->pwr_info.gear_rx >=
>                   hba->clk_scaling.wb_gear);
> 
> Otherwise this patch looks good to me.
> 
> Thanks,
> 
> Bart.

Sure , Bart. Your suggestion looks nice. let me apply it in next 
version, thank you~

-Ziqi


