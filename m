Return-Path: <linux-arm-msm+bounces-67913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AF1B1C61E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 14:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A37563B3883
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 12:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8A9289808;
	Wed,  6 Aug 2025 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lSpdah93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA80CA5E;
	Wed,  6 Aug 2025 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754484084; cv=none; b=ktUiGS4urwFaQKY1RR3WhcWo+DW3OBe35vjrlPV0rxp4YlHbBEAvmju4yGDA/K5ymeeZLS8zws/CN4sft6Bj6Big9aZ3IYSSoMDMNYYUUTb0fHMUjAzWt+WoK9gVjldWEVLYXZilaCKJ+dBw7cBxw3lhh13UAS45P3wLwZYYln0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754484084; c=relaxed/simple;
	bh=hnIdHHbQiqrM8IDX95keDvQrxjxn1k3aApmusKnqdJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SsX1z6mMiSM6kETkSuLjCYFuxXi0WUKfmEM54ogqO4C+ENSu8mKnSpN/VcByU+ff1CIgm7Tk7Mqhuli0+cFr56Pby3+ExKTi1YWJw5EejxQDOo46lMwV5SM4z/zURjZ1wgj9bgm5yCFrWajyDR4eHuLDCSuiTxmzyqOvMwjZ0cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lSpdah93; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576AMidR017322;
	Wed, 6 Aug 2025 12:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68tyvTM8jfB/ohgKr96ZvIfvfdK+rgKehP7ADxP0fm0=; b=lSpdah93g4GftZTp
	f8fr/6U1U1wQUWK6bFjrXGsjVmh7fDHvlj0vsnBunIRjOvAPdEhBoix8NSpo5XMV
	6iXE4GUCVXl0oKCiHtXW0PPtWqVPNXA8hRpA8Dy186PM90gx4/w+ZahND4P3u1IU
	/k/0oa7MGd2gsOYUlxch2X9k94GLz6siW3DMSMMEZrhalNHmbNqFUihizsQ5LvWA
	f/n2y8kV9uhJeA3fkiChF67g8+p1LBEQnhkguXzHn/34zXQg8T794pvOiF77MUop
	NwUjFK379DNs3vxVDVnTJYVYoQKKvSjf5kGMUu2hiJE3x0dVm7uMcFt293Ti21e7
	QA+6ag==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c5868a5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 12:41:16 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 576CfFsJ017038
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 12:41:15 GMT
Received: from [10.216.18.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 6 Aug
 2025 05:41:12 -0700
Message-ID: <2e655067-cd7e-4584-aa07-998b517ac314@quicinc.com>
Date: Wed, 6 Aug 2025 18:11:09 +0530
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
Content-Language: en-US
From: Palash Kambar <quic_pkambar@quicinc.com>
In-Reply-To: <ucr4imzntw6ghcvpeioprmva7gxrqnkphjirjppnqgdpq5ghss@y5nwjzzpvluj>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YhqQcn8kDTu-GbIkcRuM_kIrd-kiFir0
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=68934d6d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=AVhYfSqF_RTLDIin3-oA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YhqQcn8kDTu-GbIkcRuM_kIrd-kiFir0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX6Z0Wpxn5ADfP
 ZeWMlYCgpAKnk/YGMLa1hTV32fT2J6oDYbaKUtMbgm8mlQuBfpyU5bIB8nhT3klDPvch3pUJyv7
 8zuP/Iyna9VO7PqkZjY/6YBG0cRXDT/al2xz+QUZOnFRT52NgFu08toET/DT7oyCOhOUit8e9WI
 zITW+wDhCrl5Xy86hdpEoM/dheiX3aCc40XhWMeuLe5wtVBpRKkQ5AXFm7WjwZYB+K5JynCTZT5
 vmBvJr5nPYybc0L7FhrJayv/Qd4gXRWU0tafIlJ1oTzYZhU5KymieLZRYUFKcSfFTSUqmKqtxUu
 B+usJa5SYjKOZcduoFHi42jS9ufzSNyx+zWPfhUif3OG8SqEVW83yIe/ZbgiGV+W9+LyvyrSkxN
 cO1/0tDK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064



On 8/6/2025 4:44 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 06, 2025 at 12:04:09PM GMT, Palash Kambar wrote:
>> Disable of AES core in Shared ICE is not supported during power
>> collapse for UFS Host Controller V5.0.
>>
>> Hence follow below steps to reset the ICE upon exiting power collapse
>> and align with Hw programming guide.
>>
>> a. Write 0x18 to UFS_MEM_ICE_CFG
>> b. Write 0x0 to UFS_MEM_ICE_CFG
>>
>> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
>> ---
>>  drivers/ufs/host/ufs-qcom.c | 24 ++++++++++++++++++++++++
>>  drivers/ufs/host/ufs-qcom.h |  2 ++
>>  2 files changed, 26 insertions(+)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 444a09265ded..2744614bbc32 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -744,6 +744,8 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>>  	if (ufs_qcom_is_link_off(hba) && host->device_reset)
>>  		ufs_qcom_device_reset_ctrl(hba, true);
>>  
>> +	host->vdd_hba_pc = true;
> 
> What does this variable correspond to?
Hi Manivannan,

It corresponds to power collapse, will rename it for better readability.

> 
>> +
>>  	return ufs_qcom_ice_suspend(host);
>>  }
>>  
>> @@ -759,6 +761,27 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>>  	return ufs_qcom_ice_resume(host);
>>  }
>>  
>> +static void ufs_qcom_hibern8_notify(struct ufs_hba *hba,
>> +				    enum uic_cmd_dme uic_cmd,
>> +				    enum ufs_notify_change_status status)
>> +{
>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +
>> +	/* Apply shared ICE WA */
> 
> Are you really sure it is *shared ICE*?

 Yes Manivannan, I am.

> 
>> +	if (uic_cmd == UIC_CMD_DME_HIBER_EXIT &&
>> +	    status == POST_CHANGE &&
>> +	    host->hw_ver.major == 0x5 &&
>> +	    host->hw_ver.minor == 0x0 &&
>> +	    host->hw_ver.step == 0x0 &&
>> +	    host->vdd_hba_pc) {
>> +		host->vdd_hba_pc = false;
>> +		ufshcd_writel(hba, 0x18, UFS_MEM_ICE);
> 
> Define the actual bits instead of writing magic values.

Sure.

> 
>> +		ufshcd_readl(hba, UFS_MEM_ICE);
>> +		ufshcd_writel(hba, 0x0, UFS_MEM_ICE);
>> +		ufshcd_readl(hba, UFS_MEM_ICE);
> 
> Why do you need readl()? Writes to device memory won't get reordered.

Since these are hardware register, there is a potential for reordering.

> 
>> +	}
>> +}
>> +
>>  static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
>>  {
>>  	if (host->dev_ref_clk_ctrl_mmio &&
>> @@ -2258,6 +2281,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
>>  	.hce_enable_notify      = ufs_qcom_hce_enable_notify,
>>  	.link_startup_notify    = ufs_qcom_link_startup_notify,
>>  	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
>> +	.hibern8_notify		= ufs_qcom_hibern8_notify,
> 
> This callback is not called anywhere. Regardeless of that, why can't you use
> ufs_qcom_clk_scale_notify()?
> 

According to the HPG guidelines, as part of this workaround, we are required to reset the ICE controller during the Hibern8 exit sequence when the UFS controller resumes from power collapse. Therefore, this reset logic has been added to the H8 exit notifier callback.

The ufs_clk_scale_notify function is invoked whenever clock scaling (up or down) occurs, regardless of whether a power collapse has taken place. Hence, the ICE controller reset was specifically added to the H8 exit notifier to ensure it is executed only in the appropriate context.


Regards,
Palash K 


