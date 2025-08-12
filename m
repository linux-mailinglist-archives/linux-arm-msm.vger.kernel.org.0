Return-Path: <linux-arm-msm+bounces-68642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F0B21CAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 07:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C3FA1891B16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB9B2C21CA;
	Tue, 12 Aug 2025 05:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PIJdZe+m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5572C13B;
	Tue, 12 Aug 2025 05:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754975084; cv=none; b=B2guxTwC4tMlryratrocl+KJjHb/8pA7uZJaAnYoZrMdeSwAxb3u8SliTVIOCSyV0Q4wf7AFs3vtT56Dr/cLxq2NQNreRLzUW/AiSjNHx/7/luE0GjX569bZa1ynKQIvngS6ub7snj6omZRP7WNOY7QUaWGUB3bqCDnj2uohF7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754975084; c=relaxed/simple;
	bh=QCjOBXPQUnrhGirSu0BA8xOITyqq5mxLhUNynRYIzcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UIpdjZ2Aaont16eFCUrSJopUJClQ/kdnWgJdGzlNFi0LLx5TnlSxBdLpWKN0qh9QKTNze+fvri0VfGpLFq1NUO/x7AyQgHolqkxFKBuLR6KXYkgZc5GWlXUL/wbbFG+vbJDoJ9EQy325b58c5gENqWp5PzoZRap6a35exoR3sz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PIJdZe+m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BH4gD1018323;
	Tue, 12 Aug 2025 05:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gyk8nTn/w4XA7A6fcdgGrOSMV0k0C1DVcXZvhZhLu40=; b=PIJdZe+mgosElZDm
	OR8hkzxZ5cGlr1elr6mQOH88eIaae269vcshbBpCKzuY6LkYckNRlL+hg4Fl0jTA
	nivadYiR14nTDR1kKP1ESh2I3j/TQEr3+OAuF7qtIe6tjvOmOtRYpB9D1qMbkdZv
	R+B51Ardf2M50B5vY7nZzCSviCgCJiFLCB9RmiYum/p/XOS8vT8TkmfhdPP8/hQI
	OiE0jo6ss/aFH0y3KmiYELRyf/PAtgQP1xUbAs6SQKpr8r0aZTOEILLeS4CN+il6
	Dp1bSRjKsT303c62OAykCQX0uei3gOIgnYlQ/rtnp7kZwhRrqv8JsenZQKcPmVhB
	NIK0Nw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g6snk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 05:04:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57C54aTw006170
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 05:04:36 GMT
Received: from [10.216.40.226] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 11 Aug
 2025 22:04:34 -0700
Message-ID: <738eb16b-68c2-4582-9858-e2cb8465a00b@quicinc.com>
Date: Tue, 12 Aug 2025 10:34:31 +0530
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
 <3601cdce-a269-4d29-bc21-b925fcc499e2@quicinc.com>
 <edrf3bobjnknwydzeitfwns7lehgf65p5prcohmc7eexhzoami@ywlamyweunmn>
Content-Language: en-US
From: Palash Kambar <quic_pkambar@quicinc.com>
In-Reply-To: <edrf3bobjnknwydzeitfwns7lehgf65p5prcohmc7eexhzoami@ywlamyweunmn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689acb65 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KL1xR9xCuBu-OXqa_t4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX3mNRXt56U5a+
 wIjlUwDxL2sLmgjUkXqPa/28xX6SiQ+/ACbTQf23fDWv8c2s+c2ef/mQaKic/opEkvrGBS9xu3N
 CPbIzSOdDboQyBHD1rjoyB85QRR0tqr98TORV8J/jH52DiPPCLNinr5vM/tqx5YCfL1q+6fcSEf
 0JzWiGYqQjsOZw2l1biZw+qJmq4UPUUcF/+eA4IFtEZK2AcQismRVRic4+B7N05D2xTJULbz6lk
 8nSBdT758JVOprm3zrHlSb76g+2H2dZn7x2zY9Y1DadYJLTU+D0BNXcYvNuZtv397y5CbGr2n2+
 DXnoVJdC1bu5OwhEY4wzqYg2Zs3cOm79rlikMj94WRnAk3MPeNcngs05YrxTgEWGXG456W2zWNX
 zBlGF22N
X-Proofpoint-GUID: wklxtPwH5igRfyD7rIpgqqKqnFkVwMT2
X-Proofpoint-ORIG-GUID: wklxtPwH5igRfyD7rIpgqqKqnFkVwMT2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031



On 8/11/2025 1:46 PM, Manivannan Sadhasivam wrote:
> On Thu, Aug 07, 2025 at 03:50:58PM GMT, Palash Kambar wrote:
>>
>>
>> On 8/6/2025 11:19 PM, Manivannan Sadhasivam wrote:
>>> On Wed, Aug 06, 2025 at 06:11:09PM GMT, Palash Kambar wrote:
>>>>
>>>>
>>>> On 8/6/2025 4:44 PM, Manivannan Sadhasivam wrote:
>>>>> On Wed, Aug 06, 2025 at 12:04:09PM GMT, Palash Kambar wrote:
>>>>>> Disable of AES core in Shared ICE is not supported during power
>>>>>> collapse for UFS Host Controller V5.0.
>>>>>>
>>>>>> Hence follow below steps to reset the ICE upon exiting power collapse
>>>>>> and align with Hw programming guide.
>>>>>>
>>>>>> a. Write 0x18 to UFS_MEM_ICE_CFG
>>>>>> b. Write 0x0 to UFS_MEM_ICE_CFG
>>>>>>
>>>>>> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
>>>>>> ---
>>>>>>  drivers/ufs/host/ufs-qcom.c | 24 ++++++++++++++++++++++++
>>>>>>  drivers/ufs/host/ufs-qcom.h |  2 ++
>>>>>>  2 files changed, 26 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>>>>> index 444a09265ded..2744614bbc32 100644
>>>>>> --- a/drivers/ufs/host/ufs-qcom.c
>>>>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>>>>> @@ -744,6 +744,8 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>>>>>>  	if (ufs_qcom_is_link_off(hba) && host->device_reset)
>>>>>>  		ufs_qcom_device_reset_ctrl(hba, true);
>>>>>>  
>>>>>> +	host->vdd_hba_pc = true;
>>>>>
>>>>> What does this variable correspond to?
>>>> Hi Manivannan,
>>>>
>>>> It corresponds to power collapse, will rename it for better readability.
>>>>
>>>
>>> What is 'power collapse' from UFS perspective?
>>
>> As part of UFS controller power collapse, UFS controller and PHY enters HIBERNATE_STATE
>> during idle periods .The UFS controller is power-collapsed with essential registers 
>> retained (for ex ICE), while PHY maintains M-PHY compliant signaling. Upon data transfer
>> requests, software restores power and exits HIBERNATE_STATE without requiring re-initialization, 
>> as configurations and ICE encryption keys are preserved.
>>
> 
> AFAIK, Hibern8 is a UFS *link* specific feature, not controller specific. In
> other peripherals, power collapse means powering off the controller entirely and
> then relying on the hardware logic to retain the register states. I believe the
> same behavior applies to UFS also.
> 
> In that case, I would expect you to check for the power collapse in
> ufs_qcom_resume() using some logic and toggle the relevant bits in UFS_MEM_ICE.
> 
> The current logic you proposed doesn't really make sure that the controller is
> power collapsed. You just assume that ufs_qcom_suspend() would allow the
> controller to enter power collapse state, but it won't. If the user has opted
> for 'spm_lvl' to be '0', then I don't think the controller can enter power
> collapse state.

Sure Mani, will modify as per your suggestion.

- Palash K> 
>>>
>>>>>
>>>>>> +
>>>>>>  	return ufs_qcom_ice_suspend(host);
>>>>>>  }
>>>>>>  
>>>>>> @@ -759,6 +761,27 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>>>>>>  	return ufs_qcom_ice_resume(host);
>>>>>>  }
>>>>>>  
>>>>>> +static void ufs_qcom_hibern8_notify(struct ufs_hba *hba,
>>>>>> +				    enum uic_cmd_dme uic_cmd,
>>>>>> +				    enum ufs_notify_change_status status)
>>>>>> +{
>>>>>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>>>>> +
>>>>>> +	/* Apply shared ICE WA */
>>>>>
>>>>> Are you really sure it is *shared ICE*?
>>>>
>>>>  Yes Manivannan, I am.
>>>>
>>>
>>> Well, there are two kind of registers defined in the internal doc that I can
>>> see: UFS_MEM_ICE and UFS_MEM_SHARED_ICE. And hence the question.
>>>
>>>>>
>>>>>> +	if (uic_cmd == UIC_CMD_DME_HIBER_EXIT &&
>>>>>> +	    status == POST_CHANGE &&
>>>>>> +	    host->hw_ver.major == 0x5 &&
>>>>>> +	    host->hw_ver.minor == 0x0 &&
>>>>>> +	    host->hw_ver.step == 0x0 &&
>>>>>> +	    host->vdd_hba_pc) {
>>>>>> +		host->vdd_hba_pc = false;
>>>>>> +		ufshcd_writel(hba, 0x18, UFS_MEM_ICE);
>>>>>
>>>>> Define the actual bits instead of writing magic values.
>>>>
>>>> Sure.
>>>>
>>>>>
>>>>>> +		ufshcd_readl(hba, UFS_MEM_ICE);
>>>>>> +		ufshcd_writel(hba, 0x0, UFS_MEM_ICE);
>>>>>> +		ufshcd_readl(hba, UFS_MEM_ICE);
>>>>>
>>>>> Why do you need readl()? Writes to device memory won't get reordered.
>>>>
>>>> Since these are hardware register, there is a potential for reordering.
>>>>
>>>
>>> Really? Who said that? Please cite the reference.
>>>
>>>>>
>>>>>> +	}
>>>>>> +}
>>>>>> +
>>>>>>  static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
>>>>>>  {
>>>>>>  	if (host->dev_ref_clk_ctrl_mmio &&
>>>>>> @@ -2258,6 +2281,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
>>>>>>  	.hce_enable_notify      = ufs_qcom_hce_enable_notify,
>>>>>>  	.link_startup_notify    = ufs_qcom_link_startup_notify,
>>>>>>  	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
>>>>>> +	.hibern8_notify		= ufs_qcom_hibern8_notify,
>>>>>
>>>>> This callback is not called anywhere. Regardeless of that, why can't you use
>>>>> ufs_qcom_clk_scale_notify()?
>>>>>
>>>>
>>>> According to the HPG guidelines, as part of this workaround, we are required to reset the ICE controller during the Hibern8 exit sequence when the UFS controller resumes from power collapse. Therefore, this reset logic has been added to the H8 exit notifier callback.
>>>>
>>>
>>> Please wrap the replies to 80 column.
>>>
>>> Well, we do call ufshcd_uic_hibern8_exit() from these callbacks. So why can't
>>> you reset the ICE after calling ufshcd_uic_hibern8_exit() here?
>>
>> As per HPG guidance, the ICE Reset workaround is required only after the
>> controller undergoes a power collapse. In the UFS subsystem, power collapse
>> is managed via the GDSC (GCC_UFS_MEM_PHY_GDSC), which is part of GenPD
>> (power domains). Since GenPD is tied to runtime suspend operations, we are
>> setting the power collapse flag during runtime suspend and checking this
>> flag during hibernate exit.
>>
>>
>>>
>>>> The ufs_clk_scale_notify function is invoked whenever clock scaling (up or down) occurs, regardless of whether a power collapse has taken place. Hence, the ICE controller reset was specifically added to the H8 exit notifier to ensure it is executed only in the appropriate context.
>>>>
>>>
>>> Please define what 'power collapse' mean here. And as I said before, you are
>>> not at all calling this newly introduced callback.
>>
>> This is not a newly introduced callback, Mani. We are registering for
>> an already existing notifier. You may refer to ufshcd.c, where this
>> notifier is invoked.
>>
> 
> Okay, my bad. You could've mentioned something about this callback in the commit
> message to make others aware that you are reusing an existing callback.
> 
> - Mani
> 


