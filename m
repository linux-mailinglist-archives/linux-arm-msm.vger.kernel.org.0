Return-Path: <linux-arm-msm+bounces-67989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B47B1D5B6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 12:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20A087AEF74
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 10:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79AD22A4E1;
	Thu,  7 Aug 2025 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bOMALAMm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A55D22A4D6;
	Thu,  7 Aug 2025 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754562073; cv=none; b=bdnPchcNXTZrc+JUi3R51hwmXYPJVns32LRGly4gT7zCYScmQZFip366TLXzV6d7JkFTIvjhkTdJRxpSEvNv4xn6rzQkb8xgx44bVCmzsxoXilEnckBxsPTNVZDZgVWrVW+UgA+VyFoSEVB3RxFIfIY+uPW5kkl+2xWQ9xtIkh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754562073; c=relaxed/simple;
	bh=s475RVZAS7x0vUjPOn4vXmXFJXXoo+PLljIhNivpLUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XlIiJ2kDnAnOzmgB/HOXC+P7PdafhpUzutpqhr5L9fp68W6OTDqI8PF2bHj5lWIPz0XMO1yuz7rjbjao+c8km1X8yeH8lfYhtmrG45yYRXMIg5rdSJxaByRFJpYsuVs4jNZPz+o+vbtxoNkh3lTqlgsQsO4FUFz8haGmQe19GjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bOMALAMm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779Cvf7018054;
	Thu, 7 Aug 2025 10:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvY5vL/w1/84Unanjy2ozgrdxb+9PrbcH2pDCHlkKds=; b=bOMALAMmLtM7ZjWj
	A3umGjscO6tT3xXGHbQYsXznsE1r7YjKZ9RGWbeMf+Bck3JnqMX2OitP1buR7bp7
	DjMqZ09TRtAvnoBwTFRWHbj/g7JWadKY2hI2S3EtJryLwaC0gbWk92j+uV+sE/fP
	LbkMFv4FtAHU3T6QH5WjaMNBS0uh5zjqBVGlwSRt/g4Ao/3P69s/2sLMPgZqIT4u
	Unaeob0ZpxvAUp/Xk9MFN+uLAVGXlC98ZWSQKSGABR6SM5tsgnPJtxq42aghd4IP
	BBMXdL+kotX286f5n01LfJ7DK3OAjDImvNmqlQHDEMjsEi5p5JA00yweA09glofc
	xDZTdA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586bjks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:21:04 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577AL3iF014348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 10:21:03 GMT
Received: from [10.216.18.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 7 Aug
 2025 03:21:01 -0700
Message-ID: <3601cdce-a269-4d29-bc21-b925fcc499e2@quicinc.com>
Date: Thu, 7 Aug 2025 15:50:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for UFS controller v5
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>
References: <20250806063409.21206-1-quic_pkambar@quicinc.com>
 <ucr4imzntw6ghcvpeioprmva7gxrqnkphjirjppnqgdpq5ghss@y5nwjzzpvluj>
 <2e655067-cd7e-4584-aa07-998b517ac314@quicinc.com>
 <pewnau4ltrf2yu3xxdq6rs6xhz45zlo3dt3jnkzhxitmezz2ft@2k7pgpoz5iey>
Content-Language: en-US
From: Palash Kambar <quic_pkambar@quicinc.com>
In-Reply-To: <pewnau4ltrf2yu3xxdq6rs6xhz45zlo3dt3jnkzhxitmezz2ft@2k7pgpoz5iey>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xqKdEY3ZkDAYLfT4vvZHRNr3GSTl--_F
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=68947e10 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=fcW2ctK2qZEwMxF1O34A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xqKdEY3ZkDAYLfT4vvZHRNr3GSTl--_F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX3xc3tjtpZ/v1
 0nrK15U8yltNfVe1UVCoKWmg16wGDkEFB0PqW0HF1FBQAINO6BesYn04F8KXXXAbWk7AEvBtEsd
 azY7MH2Tnp8NL7rZ6y3Kc3CMS7v7M+nI2ec4bTrigTpQ3ShW7L43FKQ+LG+X80ZXqTM97ocJJxg
 dZab7PQQriKgAUh5P1mjcitFfZlsYX11oKKaN42rwl8Rf+404oGpWSbI2P5pmM3h5zZ+On6BbZd
 Bg5aaRlIafMHs5rWkGNb621pMFy1AqMj0e/Fmav56ixg2VobKxuzFI76ZNlxcqTcsLeUM/lZ3wx
 CAWXSYHNh8WVvT9vop3Ff9zpDycoHozBPbto4ZdEvhoSdpbVNWMB56hhv95yR+I/onVyT1x3Kzx
 CgiOyn2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064



On 8/6/2025 11:19 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 06, 2025 at 06:11:09PM GMT, Palash Kambar wrote:
>>
>>
>> On 8/6/2025 4:44 PM, Manivannan Sadhasivam wrote:
>>> On Wed, Aug 06, 2025 at 12:04:09PM GMT, Palash Kambar wrote:
>>>> Disable of AES core in Shared ICE is not supported during power
>>>> collapse for UFS Host Controller V5.0.
>>>>
>>>> Hence follow below steps to reset the ICE upon exiting power collapse
>>>> and align with Hw programming guide.
>>>>
>>>> a. Write 0x18 to UFS_MEM_ICE_CFG
>>>> b. Write 0x0 to UFS_MEM_ICE_CFG
>>>>
>>>> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
>>>> ---
>>>>  drivers/ufs/host/ufs-qcom.c | 24 ++++++++++++++++++++++++
>>>>  drivers/ufs/host/ufs-qcom.h |  2 ++
>>>>  2 files changed, 26 insertions(+)
>>>>
>>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>>> index 444a09265ded..2744614bbc32 100644
>>>> --- a/drivers/ufs/host/ufs-qcom.c
>>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>>> @@ -744,6 +744,8 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>>>>  	if (ufs_qcom_is_link_off(hba) && host->device_reset)
>>>>  		ufs_qcom_device_reset_ctrl(hba, true);
>>>>  
>>>> +	host->vdd_hba_pc = true;
>>>
>>> What does this variable correspond to?
>> Hi Manivannan,
>>
>> It corresponds to power collapse, will rename it for better readability.
>>
> 
> What is 'power collapse' from UFS perspective?

As part of UFS controller power collapse, UFS controller and PHY enters HIBERNATE_STATE
during idle periods .The UFS controller is power-collapsed with essential registers 
retained (for ex ICE), while PHY maintains M-PHY compliant signaling. Upon data transfer
requests, software restores power and exits HIBERNATE_STATE without requiring re-initialization, 
as configurations and ICE encryption keys are preserved.

> 
>>>
>>>> +
>>>>  	return ufs_qcom_ice_suspend(host);
>>>>  }
>>>>  
>>>> @@ -759,6 +761,27 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>>>>  	return ufs_qcom_ice_resume(host);
>>>>  }
>>>>  
>>>> +static void ufs_qcom_hibern8_notify(struct ufs_hba *hba,
>>>> +				    enum uic_cmd_dme uic_cmd,
>>>> +				    enum ufs_notify_change_status status)
>>>> +{
>>>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>>> +
>>>> +	/* Apply shared ICE WA */
>>>
>>> Are you really sure it is *shared ICE*?
>>
>>  Yes Manivannan, I am.
>>
> 
> Well, there are two kind of registers defined in the internal doc that I can
> see: UFS_MEM_ICE and UFS_MEM_SHARED_ICE. And hence the question.
> 
>>>
>>>> +	if (uic_cmd == UIC_CMD_DME_HIBER_EXIT &&
>>>> +	    status == POST_CHANGE &&
>>>> +	    host->hw_ver.major == 0x5 &&
>>>> +	    host->hw_ver.minor == 0x0 &&
>>>> +	    host->hw_ver.step == 0x0 &&
>>>> +	    host->vdd_hba_pc) {
>>>> +		host->vdd_hba_pc = false;
>>>> +		ufshcd_writel(hba, 0x18, UFS_MEM_ICE);
>>>
>>> Define the actual bits instead of writing magic values.
>>
>> Sure.
>>
>>>
>>>> +		ufshcd_readl(hba, UFS_MEM_ICE);
>>>> +		ufshcd_writel(hba, 0x0, UFS_MEM_ICE);
>>>> +		ufshcd_readl(hba, UFS_MEM_ICE);
>>>
>>> Why do you need readl()? Writes to device memory won't get reordered.
>>
>> Since these are hardware register, there is a potential for reordering.
>>
> 
> Really? Who said that? Please cite the reference.
> 
>>>
>>>> +	}
>>>> +}
>>>> +
>>>>  static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
>>>>  {
>>>>  	if (host->dev_ref_clk_ctrl_mmio &&
>>>> @@ -2258,6 +2281,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
>>>>  	.hce_enable_notify      = ufs_qcom_hce_enable_notify,
>>>>  	.link_startup_notify    = ufs_qcom_link_startup_notify,
>>>>  	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
>>>> +	.hibern8_notify		= ufs_qcom_hibern8_notify,
>>>
>>> This callback is not called anywhere. Regardeless of that, why can't you use
>>> ufs_qcom_clk_scale_notify()?
>>>
>>
>> According to the HPG guidelines, as part of this workaround, we are required to reset the ICE controller during the Hibern8 exit sequence when the UFS controller resumes from power collapse. Therefore, this reset logic has been added to the H8 exit notifier callback.
>>
> 
> Please wrap the replies to 80 column.
> 
> Well, we do call ufshcd_uic_hibern8_exit() from these callbacks. So why can't
> you reset the ICE after calling ufshcd_uic_hibern8_exit() here?

As per HPG guidance, the ICE Reset workaround is required only after the
controller undergoes a power collapse. In the UFS subsystem, power collapse
is managed via the GDSC (GCC_UFS_MEM_PHY_GDSC), which is part of GenPD
(power domains). Since GenPD is tied to runtime suspend operations, we are
setting the power collapse flag during runtime suspend and checking this
flag during hibernate exit.


> 
>> The ufs_clk_scale_notify function is invoked whenever clock scaling (up or down) occurs, regardless of whether a power collapse has taken place. Hence, the ICE controller reset was specifically added to the H8 exit notifier to ensure it is executed only in the appropriate context.
>>
> 
> Please define what 'power collapse' mean here. And as I said before, you are
> not at all calling this newly introduced callback.

This is not a newly introduced callback, Mani. We are registering for
an already existing notifier. You may refer to ufshcd.c, where this
notifier is invoked.

> 
> - Mani
> 


