Return-Path: <linux-arm-msm+bounces-68972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCA2B2487B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 084BB189F778
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 11:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9881C2F3C05;
	Wed, 13 Aug 2025 11:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B0vGNV2z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C492D5C9F;
	Wed, 13 Aug 2025 11:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755084721; cv=none; b=H/X1fjQAeCSGz5IY/a84ZdG9Zu5GXnziD0Yta/LCflD60Hl5TwKT6EaV/ccbqV5NOAlE4NIyab+bU998C5JKJez+W9+B5QoLsc1/REDOesQKKK9hEznBlOalHqio4ipE0hawze+caLf7EraKqsSvGGYSEfDnVESMKYzhqBoxyjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755084721; c=relaxed/simple;
	bh=nQReW5Q1N4wii3hPq5nn6aUOD6DXoAQdcxmsDr4D2KE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qlt/caKC6sMhg2h+yLFUomE1D+i5vCsdLvDVlw4kBqOO6LdCOwr8LXVwS27Q55YH2HtvHOkSxA0BduQ9ix4Csn62NqjToAAc6Y4L6MFMp37orPe+m9DZwSGG8PmZrDKp7rivw4rPpjmkhS5n+V4KUv5uvtq0VO4uI+vr1DGFcAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B0vGNV2z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBM9d7027025;
	Wed, 13 Aug 2025 11:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZRdnKXF/5l9YDjvYj77VM/YOlA0nA1gep9VTIB6zpbw=; b=B0vGNV2zMzLmODvU
	KDrloARmTWme1Tf3XPHodJl71tV2c5fHP2JJHqaTtBnjKf5wAlNZ4FW48pHoLHFk
	gdhsRdaW6gQuW3mHY/4PYflvvIQC4YTdjLQIllBoxUtDuprG49Ks3vKm5Vn6XRi0
	2989F4tl8wN9YtOvBfJR+oQlx8vFkbSSupO7736M9BvZcKfEU+OyZK6+zquqYXTj
	cOuY5W15M1aYNrLbiG8hddiwTbUKbjBn4JfsMppkfIUl5608xgqtPWNCTtRPCmok
	wyf51yUjO45qmjPoPG/9rEcofosQgfyCF74A+FGH4hheTzfCOQlO2LJVPe/dP/n7
	a1+VRQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gbjqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 11:31:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57DBVrM9027677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 11:31:53 GMT
Received: from [10.216.47.241] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 04:31:51 -0700
Message-ID: <9caa5f38-db78-4a0a-9eea-1df2ab9f1ffa@quicinc.com>
Date: Wed, 13 Aug 2025 17:01:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ufs: ufs-qcom: disable lane clocks during phy hibern8
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>
References: <20250715160524.3088594-1-quic_pkambar@quicinc.com>
 <w5mkkhxhhndrqhlfomvwohssndtl2njcw7khupyh7qechsynns@kl5ykxtwqawt>
Content-Language: en-US
From: Palash Kambar <quic_pkambar@quicinc.com>
In-Reply-To: <w5mkkhxhhndrqhlfomvwohssndtl2njcw7khupyh7qechsynns@kl5ykxtwqawt>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689c77aa cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=J-IEUe4sd1PreNxf69YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX83rqCJbkABsG
 saVHulk4ofbhDXSCqpjyYMhXoYNrY0KW+fzCZDC95+i/bITd3BU/IsyFBs4xjXDzeBCEfQTJHVC
 2nPxlNAKzW8wdBcFBCBI1hnqHEnnB69F0QsmxdY2c/HAz8f1IErANe4KguEkmIIyfWnZ6EnRuYC
 7FqnlyvgngZJo2NOZDM5rYmNEH/VYqkcjZRWIMSfUYRvlEtfyDS+04hc8BMXUOQGNrs56Uo9XTO
 d+8FVmboaaWlRm2hrQePXm3j03sHY5jci9qOCdX+DRsMKSqg/acNUMmi3sFeMNm7VJNM/T/PO3U
 c//5y7GUdFNVFNfkuEXvk/NjjmcryKOjYpDeq3d3kLmxqgxPvbRUxb4F5Z8KOEVMLpff3j+kQnP
 H+tqGCdp
X-Proofpoint-GUID: 8cNfn1nlnDh-aZUQowYriVj4gnv9puGb
X-Proofpoint-ORIG-GUID: 8cNfn1nlnDh-aZUQowYriVj4gnv9puGb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031



On 8/13/2025 3:49 PM, Manivannan Sadhasivam wrote:
> On Tue, Jul 15, 2025 at 09:35:24PM GMT, Palash Kambar wrote:
>> The UFS lane clocks ensure that the PHY is adequately powered and
>> synchronized before initiating the link. Currently, these clocks
>> remain enabled even after the link enters the Hibern8 state and
>> are only turned off during runtime or system suspend.
>>
>> Modify the behavior to disable the lane clocks immediately after
>> the link transitions to Hibern8, thereby reducing the power
>> consumption.
>>
> 
> This statement is technically misleading. You are disabling lane clocks in
> ufs_qcom_setup_clocks(), which gets called during suspend/resume/clk_gate phase.
> 
> But if you want to disable the clocks immediately after Hibern8, you may want to
> add the disable/enable logic in hibern8_notify() callback.
> 
> If that is not a strict requirement and you want to do it in
> ufs_qcom_setup_clocks(), you have to reword the description.
> 

Hi Mani,
Hibern8 entry and exit can be initiated from various contexts, including
clock scaling. Given this, it may not be ideal to toggle the lane clock on
every Hibern8 transition. Moreover, since all resources related to the PHY
and controller are managed within ufs_qcom_setup_clocks(), it seems more
appropriate to handle this logic within that function. Additionally, since
ufs_qcom_setup_clock() is invoked immediately after the link enters
Hibern8 via gate work, any delay appears to be minimal.

I’ll ensure these points are clearly reflected in the commit message.

-Palash K

> 
>> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
>> ---
>>  drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 318dca7fe3d7..50e174d9b406 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -1141,6 +1141,13 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>>  	case PRE_CHANGE:
>>  		if (on) {
>>  			ufs_qcom_icc_update_bw(host);
>> +			if (ufs_qcom_is_link_hibern8(hba)) {
>> +				err = ufs_qcom_enable_lane_clks(host);
>> +				if (err) {
>> +					dev_err(hba->dev, "enable lane clks failed, ret=%d\n", err);
>> +					return err;
>> +				}
>> +			}
>>  		} else {
>>  			if (!ufs_qcom_is_link_active(hba)) {
>>  				/* disable device ref_clk */
>> @@ -1166,6 +1173,9 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>>  			if (ufshcd_is_hs_mode(&hba->pwr_info))
>>  				ufs_qcom_dev_ref_clk_ctrl(host, true);
>>  		} else {
>> +			if (ufs_qcom_is_link_hibern8(hba))
>> +				ufs_qcom_disable_lane_clks(host);
>> +
>>  			ufs_qcom_icc_set_bw(host, ufs_qcom_bw_table[MODE_MIN][0][0].mem_bw,
>>  					    ufs_qcom_bw_table[MODE_MIN][0][0].cfg_bw);
>>  		}
>> -- 
>> 2.34.1
>>
> 


