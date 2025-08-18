Return-Path: <linux-arm-msm+bounces-69468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A04AB29768
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 05:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 231E4161E08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 03:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3544325A2CF;
	Mon, 18 Aug 2025 03:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UXj6Zr0j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E3A1F3D56;
	Mon, 18 Aug 2025 03:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755488539; cv=none; b=nBIXvAkUkqAfrG4EfnFwyLCe4HbVRvS+fyBv7k16L9J2gb4i0wMIwJ2mQB415kB2Ln9G2P5p0VyOUm6ovQN1mNrlTEaCSB0AWouc9+jupv3EdVi6aZ1Z0RbN8wq0ujKzN/U904gJnvlSBK3gPBmhRulgqJPnXTaHNwvyCsfYrmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755488539; c=relaxed/simple;
	bh=6fS1wMayG1qMSovCo7em0mI7uuytL3TQ+TfxOxiZa2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j6bRMLsCv/TEU6eHbxIOv2RsC9UMYf1vqg/KNjTDsOUoBzHnjGtizam/hGFYL4fWbjUeeqOyebOZ4KpEIdQzlDM5SWZBNMbQ+Dfev8nzBC4pRq4ibdW50FrSJGCGzxTvZALiRuQfQRQgDqrZG/Jz1zlVstM9hpBBeGZi8UXNOQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UXj6Zr0j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HNlWE7001578;
	Mon, 18 Aug 2025 03:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8BjQkZEE/luGhcD91trRVTrG6ojQ29DixOF5fUlHPo=; b=UXj6Zr0jouRZNnB2
	ycm8cDfhhkZLcFtgHdks9CimOzGBzOVu3HHzHmxOkb9hyTs3KBboBUvweahTKohl
	XwHP0lZ26o5R3DGJuK4NerVJd6bGdrcJ1KRxsT9BPTjZLuV2bpf3ef+bJeFIo9L3
	UlVIGm+IpwktJW/FDGcZ701pIc8inj+sKu+NpfE0aWlUNpwSJiDmCuhEhy6NF92Q
	WhQSJS5KCjVgpQ1cUnm+22tfpfLk5r+jg59Omb60+LCtnmT5TdvhnXIYv0q7+ds5
	C5WmM0kO+8vIr642WlOcF0X6Gs73vtSxR1glujesSTw34VZreNRaChE6w6u0BTC9
	5Di79w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99k23q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 03:42:11 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57I3gA6H032375
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 03:42:10 GMT
Received: from [10.216.59.136] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 17 Aug
 2025 20:42:07 -0700
Message-ID: <04f8746c-0ba4-4024-9625-0686a85d8606@quicinc.com>
Date: Mon, 18 Aug 2025 09:12:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -v4] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for UFS controller v5
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>
References: <20250814065830.3393237-1-quic_pkambar@quicinc.com>
 <330ba090-8036-4451-a74a-9055a811b2c4@oss.qualcomm.com>
Content-Language: en-US
From: Palash Kambar <quic_pkambar@quicinc.com>
In-Reply-To: <330ba090-8036-4451-a74a-9055a811b2c4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ytBPPCTkArm3gamw7YQSm9GWVTXQ3kho
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfXyAwi2XkJnq4j
 KWl5vy+RPAez3tHGKit4im1hOko0yWSw1FMjT5JL12l89kHJuWgobUgqzRp7RyxaWDgn+TbiM7j
 OJxh4hwn1P2S20A2Y06p7lUkhVv+K70g0dJ1yck7JktaGU6ABwrpYQuT5/L/S6mFhLsXiPO/T1x
 FdU+SquqDV5w+1ZqXOjQb5s1+vv0T3LhnKqv1k+glD19npziU2he4hA3UMP90zC4VnnxKa8RfGN
 cMtHcV5OJIEYnaRo1cczHUV+ZKNGe6zbqx3sD4NLEA/b10cFEF/nDBRx39T1Hx7YCbdci9El3U4
 VU+PEVeQGHarX9cNYHT4aL6nyX0UqBBE5zcm+t6xRVLsqxCAlDDcaCTZ/mV//Oy2hQy0reDfSS0
 wtmcVl3j
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a2a113 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=6RlZPKq-T-IvfKrPRg8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ytBPPCTkArm3gamw7YQSm9GWVTXQ3kho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045



On 8/14/2025 2:40 PM, Konrad Dybcio wrote:
> On 8/14/25 8:58 AM, Palash Kambar wrote:
>> Disabling the AES core in Shared ICE is not supported during power
>> collapse for UFS Host Controller v5.0, which may lead to data errors
>> after Hibern8 exit. To comply with hardware programming guidelines
>> and avoid this issue, issue a sync reset to ICE upon power collapse
>> exit.
>>
>> Hence follow below steps to reset the ICE upon exiting power collapse
>> and align with Hw programming guide.
>>
>> a. Assert the ICE sync reset by setting both SYNC_RST_SEL and
>>    SYNC_RST_SW bits in UFS_MEM_ICE_CFG
>> b. Deassert the reset by clearing SYNC_RST_SW in  UFS_MEM_ICE_CFG
>>
>> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
>>
>> ---
>> changes from V1:
>> 1) Incorporated feedback from Konrad and Manivannan by adding a delay
>>    between ICE reset assertion and deassertion.
>> 2) Removed magic numbers and replaced them with meaningful constants.
>>
>> changes from V2:
>> 1) Addressed Manivannan's comment and moved change to ufs_qcom_resume.
>>
>> changes from V3:
>> 1) Addressed Manivannan's comments and added bit field values and
>>    updated patch description.
>> ---
>>  drivers/ufs/host/ufs-qcom.c | 19 +++++++++++++++++++
>>  drivers/ufs/host/ufs-qcom.h |  2 +-
>>  2 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 444a09265ded..9195a5c695a5 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -38,6 +38,9 @@
>>  #define DEEMPHASIS_3_5_dB	0x04
>>  #define NO_DEEMPHASIS		0x0
>>  
>> +#define UFS_ICE_SYNC_RST_SEL	BIT(3)
>> +#define UFS_ICE_SYNC_RST_SW	BIT(4)
>> +
>>  enum {
>>  	TSTBUS_UAWM,
>>  	TSTBUS_UARM,
>> @@ -756,6 +759,22 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>>  	if (err)
>>  		return err;
>>  
>> +	if ((!ufs_qcom_is_link_active(hba)) &&
>> +	    host->hw_ver.major == 5 &&
>> +	    host->hw_ver.minor == 0 &&
>> +	    host->hw_ver.step == 0) {
>> +		ufshcd_writel(hba, UFS_ICE_SYNC_RST_SEL | UFS_ICE_SYNC_RST_SW, UFS_MEM_ICE_CFG);
>> +		ufshcd_readl(hba, UFS_MEM_ICE_CFG);
>> +		/*
>> +		 * HW documentation doesn't recommend any delay between the
>> +		 * reset set and clear. But we are enforcing an arbitrary delay
>> +		 * to give flops enough time to settle in.
>> +		 */
>> +		usleep_range(50, 100);
>> +		ufshcd_writel(hba, UFS_ICE_SYNC_RST_SEL, UFS_MEM_ICE_CFG);
> 
> This was supposed to be '0', IIRC

Thanks for catching the error Konrad, will update.

-Palash K



