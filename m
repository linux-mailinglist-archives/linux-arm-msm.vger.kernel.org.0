Return-Path: <linux-arm-msm+bounces-57537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5CCAB2403
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 15:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 774264C0FD4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 13:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D3422259A;
	Sat, 10 May 2025 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T14Tbftt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762B9222599;
	Sat, 10 May 2025 13:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746885006; cv=none; b=llxn1N3+Tna3bBwr55JiDFn+MK6XAqVaGAigY+kHX/xBec1GOlLC3KakWVqHOboOCDkgXmKyd/vONjpY4CdP6WREyEJZrT8SGh0fJZTNFSsKZxvziPmb9uLIOn7Eg01hAQUzCiS0Yp1YcCosVaTWbRCbq2dQCTY5ahhd98/G5lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746885006; c=relaxed/simple;
	bh=f+G/cjnyKT5yoFP2OM6bQOMPKODgZNapnWrSZt0VPq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YXncVI/K3Bw7/aMDZdZrT7EXYI72fMEaFLgtE3sKbu6rsFDWzH89hTRcJg7DIA5CnIF5CotmfKZyeoKWGUVvFk9IhOjzXSQ8ZAGIWeXGL8iBcgumV+TCsdjEwJA6u+/HaSfzZ8fffusA7Z4aB2UKm4yft32IiPnYKMNBcIbvza8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T14Tbftt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ABmdU5023152;
	Sat, 10 May 2025 13:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QI5MdJNvPxptwrSHZ/+tFrMWva0CsITk7LKryGpub4=; b=T14Tbftt9mYS0Nj1
	c+jShrN8JlRqrYhLG5stHSVwwgsmJQ5bkd9ucAJZw0j5FwCewursgQMdrlziviBs
	Avz08gyP0bttXYH7vCEOrH8g06eKoQx8tDOnUtzzMvFMHhWu7izcMyOV08SwKZc+
	MzSUDx1I+q9v1Gd6Z+vtYgVRDs70tbAZHskHJCDygikHUrI5n1OvJoMheCbajPa/
	VqKIr13v11VrUL2mo4GvXUvQSpbYGESxjIM+VcMBFwgaPY3dkWeRaEChfaksM2CE
	Xa27B93ZwIQ5wk8Fe5H5x4N4VfXHK26iByCcoRJACKwL8fUPHqkGqRlPZipib7ix
	vzETOw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hy68gnm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 May 2025 13:49:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54ADne58028513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 May 2025 13:49:40 GMT
Received: from [10.216.13.129] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 10 May
 2025 06:49:35 -0700
Message-ID: <812a9905-a8f6-40b2-a603-6c0be18239da@quicinc.com>
Date: Sat, 10 May 2025 19:19:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 09/11] scsi: ufs: qcom : Refactor phy_power_on/off
 calls
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>
CC: <quic_rdwivedi@quicinc.com>, <quic_cang@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-10-quic_nitirawa@quicinc.com>
 <780d84ca-4004-41ef-a9ae-17532053f8a5@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <780d84ca-4004-41ef-a9ae-17532053f8a5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEwMDE0MCBTYWx0ZWRfX1h+K6Uf6o6PN
 K/c4kgXFHJGJ1vLM9MnFnoPNsGfxw0QjAxTejOP3cLttcog6P6pJnZPmTixd9J233KYITEm/1Hg
 NDrhW284Ke5rcF4uE2gYALWUDPaElTqWEqiVwMYQqpjDs2WBZWpK4oAKEay4fDEXTsSv7DVyI2Y
 JINvCqGZmXxL9ROKo7Uw8vgZ7aHTzzjOcLekgIfZtbxHVAxmmvPOk6N6cjmNHflTgNyKYW68G8Y
 wvvzUgpJczTlbcB1EIuJO5MOwVZ+eqLVZzu9etjipICSq9w0pqXFa8I68+7dC2l4F3n291Bmcez
 Rzyo6FAxNpHkeQmHKrgAZvx9NVkJ4usxij3mOnKIMJvf7PVFeMDRK58rIx7tRKWIVnVgwz5lGiC
 c2vMZRIj83/j7qRAbClLQi2V4YSYLNbqvhVNtu98TPy5QBYjxS++vi+7jDphzPQ8TD61CQfh
X-Proofpoint-GUID: WbuIQtUqq6SOkPhJTB31z1TbFyt35Vh5
X-Proofpoint-ORIG-GUID: WbuIQtUqq6SOkPhJTB31z1TbFyt35Vh5
X-Authority-Analysis: v=2.4 cv=c5irQQ9l c=1 sm=1 tr=0 ts=681f5975 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=iv0NEw3qHnIl1jiBOd0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-10_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505100140



On 5/9/2025 5:05 PM, Konrad Dybcio wrote:
> On 5/3/25 6:24 PM, Nitin Rawat wrote:
>> Commit 3f6d1767b1a0 ("phy: ufs-qcom: Refactor all init steps into
>> phy_poweron") removes the phy_power_on/off from ufs_qcom_setup_clocks
>> to suspend/resume func.
>>
>> To have a better power saving, remove the phy_power_on/off calls from
>> resume/suspend path and put them back to ufs_qcom_setup_clocks, so that
>> PHY regulators & clks can be turned on/off along with UFS's clocks.
>>
>> Since phy phy_power_on is separated out from phy calibrate, make
>> separate calls to phy_power_on and phy_calibrate calls from ufs qcom
>> driver.
>>
>> Co-developed-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 55 ++++++++++++++++---------------------
>>   1 file changed, 23 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 2cd44ee522b8..ff35cd15c72f 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -639,26 +639,17 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>>   	enum ufs_notify_change_status status)
>>   {
>>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> -	struct phy *phy = host->generic_phy;
>>   
>>   	if (status == PRE_CHANGE)
>>   		return 0;
>>   
>> -	if (ufs_qcom_is_link_off(hba)) {
>> -		/*
>> -		 * Disable the tx/rx lane symbol clocks before PHY is
>> -		 * powered down as the PLL source should be disabled
>> -		 * after downstream clocks are disabled.
>> -		 */
>> +	if (!ufs_qcom_is_link_active(hba))
> 
> so is_link_off and !is_link_active are not the same thing - this also allows
> for disabling the resources when in hibern8/broken states - is that intended?

Yes is_link_off and !is_link_Active is not same thing. !is_link_active 
also include link in hibern8 state where lane clock is intended to be
disabled because PHY is powered down in hibern8.



> 
>>   		ufs_qcom_disable_lane_clks(host);
>> -		phy_power_off(phy);
>>   
>> -		/* reset the connected UFS device during power down */
>> -		ufs_qcom_device_reset_ctrl(hba, true);
>>   
>> -	} else if (!ufs_qcom_is_link_active(hba)) {
>> -		ufs_qcom_disable_lane_clks(host);
>> -	}
>> +	/* reset the connected UFS device during power down */
>> +	if (ufs_qcom_is_link_off(hba) && host->device_reset)
>> +		ufs_qcom_device_reset_ctrl(hba, true);
> 
> similarly this will not be allowed in hibern8/broken states now
> 
>>   
>>   	return ufs_qcom_ice_suspend(host);
>>   }
>> @@ -666,26 +657,11 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>>   static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>>   {
>>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> -	struct phy *phy = host->generic_phy;
>>   	int err;
>>   
>> -	if (ufs_qcom_is_link_off(hba)) {
>> -		err = phy_power_on(phy);
>> -		if (err) {
>> -			dev_err(hba->dev, "%s: failed PHY power on: %d\n",
>> -				__func__, err);
>> -			return err;
>> -		}
>> -
>> -		err = ufs_qcom_enable_lane_clks(host);
>> -		if (err)
>> -			return err;
>> -
>> -	} else if (!ufs_qcom_is_link_active(hba)) {
>> -		err = ufs_qcom_enable_lane_clks(host);
>> -		if (err)
>> -			return err;
>> -	}
>> +	err = ufs_qcom_enable_lane_clks(host);
>> +	if (err)
>> +		return err;
>>   
>>   	return ufs_qcom_ice_resume(host);
>>   }
>> @@ -1042,6 +1018,8 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>>   				 enum ufs_notify_change_status status)
>>   {
>>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +	struct phy *phy = host->generic_phy;
>> +	int err;
>>   
>>   	/*
>>   	 * In case ufs_qcom_init() is not yet done, simply ignore.
>> @@ -1060,10 +1038,22 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>>   				/* disable device ref_clk */
>>   				ufs_qcom_dev_ref_clk_ctrl(host, false);
>>   			}
>> +			err = phy_power_off(phy);
> 
> a newline to separate the blocks would improve readability> +			if (err) {
>> +				dev_err(hba->dev, "%s: phy power off failed, ret=%d\n",
>> +					__func__, err);
>> +					return err;

Sure will add in next patchset.

> 
> please indent the return statement a tab earlier so it doesn't look
> like it's an argument to dev_err()

Sure will add in next patchset.

> 
> putting PHY calls in the function that promises to toggle clocks could
> also use a comment, maybe extending the kerneldoc to say that certain
> clocks come from the PHY so it needs to be managed together
> 
Sure will add a comment or update in kernel doc in next patchset.

> Konrad


