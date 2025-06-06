Return-Path: <linux-arm-msm+bounces-60429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D69EACFAF9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 03:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D45D1891D59
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 01:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25E519CD16;
	Fri,  6 Jun 2025 01:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bTm2NzG4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7702C136672;
	Fri,  6 Jun 2025 01:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175096; cv=none; b=Z67M7Id8ygh8S3YXxaub1e6s/R83W8w4oBHnWSH6iPYlWdksOsbmw2xgmV0WCAmGZ+pssr0xrEGZY3C9Sxjd8K0iZbaGlfZ43Sq/fXhEd+9n/Yz8/XqRwu63DSItDpz/viCz1yzQkB2krQDp508vo+hkOigpgGrB0jkGF4RCDAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175096; c=relaxed/simple;
	bh=MkBvdwK6FNaM0fTErE7K1l3fRohr1KqHDqz4JSkiUIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g3QjmdCKT7x4PRVMOa1cR52LCRiOfDEWKpA8U/KbV8ZokTnXZDg0A6BRMyMsAve4Fl9ChSsqT601YLDuQgmmEsdZdTgAgcm/1Z+h6kpSV/MQLBMwY4bXtJDINLGyx7obSSDH5r+aEyA6SIsMK0Mur66ehxAjiXHgwEcmu4Rj16U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bTm2NzG4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GoJ8L032298;
	Fri, 6 Jun 2025 01:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1eVv25fyJD7fIwowHkr2az93vCNXy8gdcolEbjwyhqE=; b=bTm2NzG48wsYFvrc
	/VrOAaTxPzQS11NxEZN+EX8FCSOicO5tU1iOLy70wXIs116itFzZ4hNYRTAJJMNW
	3kyeyVLAKBpt97SrtcJKapBwBNbKVrsoa7vXCynWD+vST6BTCF9luYUAZYQdWiRi
	oV4QJRi/LunQM7GnhKFPt6Aj2NBkv0zPfvcKqSW8pPiOGAWsyBdAPkUzvnjuebnz
	+kPiVd6E0B870ll/++Lcd5D54lbV2gh+yACv9wMG2aqmYMfs7kgO9eIdXH4+ZDzf
	sPUSR41mPPukkDvJxRSuZssgKfnn2eKeLGA07FJ60wWK8+q63TIjxlWe4Vn5uWP8
	ZqZ1Kg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv2211-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 01:58:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5561wBdv030347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 01:58:11 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Jun 2025
 18:58:09 -0700
Message-ID: <9ab8e8f8-e176-44ab-b8e5-0c27e5eff30b@quicinc.com>
Date: Fri, 6 Jun 2025 09:58:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mhi: host: Add standard elf image download
 functionality
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Qiang Yu
	<qiang.yu@oss.qualcomm.com>
CC: <jeff.hugo@oss.qualcomm.com>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <can.guo@oss.qualcomm.com>, Mayank Rana <mayank.rana@oss.qualcomm.com>
References: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
 <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=68424b34 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6AU4lJIUDbi98Puw4poA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Oht6ufUQ6kt8e6WswzDKGONEyKqAEudZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAxNyBTYWx0ZWRfX8iKnOpL/TbpX
 01jU1OPwGfPGSoi/imxTgHxeJxS6Wi3fzi3FzJT3O5txlcr9lXdiWfDuHIAFAjsas2ocBJo4Kec
 CCYaRy1rkqpqDjrY9dX0vXIwNyIIliM+iCOTc54c64bWYfx2Y5PV+xptc2NEaPS29TdYC5jzUbP
 bJaMtkiJKF/ZBh9QR2wfJFqGcGtNjYfebuzo+Z4JogKP/7+x2o745h+ctj2hwnQnaseV+teReLf
 qefS7x4ueQdHSr1Zs2YsTQAlduGDJlGr2xYCTALEA4i8Ohl+pdLmP7s9+rbcXQCrd6zGbhGKntD
 hx72o00JWwOKT1CBeU82X7Se92JH3sPApaD46xEwamotQu0q2H68/m2j54zG93evp4Hdq4C0aG7
 n29n8jx9gNjb2itLzKXVIsvw06u92vyoGZuOxBx0UoWDIHQLpo3hBqkmEEm6GLHi4HZJDkOE
X-Proofpoint-GUID: Oht6ufUQ6kt8e6WswzDKGONEyKqAEudZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060017



On 6/6/2025 1:04 AM, Manivannan Sadhasivam wrote:
> On Tue, Jun 03, 2025 at 02:05:44AM -0700, Qiang Yu wrote:
>> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
>>
>> Currently, the FBC image is a non-standard ELF file that contains a single
>> ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
>> unable to process this non-standard ELF format and therefore require
>> special handling during image loading.
>>
> 
> What are those "some devices"? Why are they not able to process this format
> which is used across the rest of the Qcom devices?
> 
>> Add standard_elf_image flag to determine whether the device can process
>> the non-standard ELF format. If this flag is set, a standard ELF image
>> must be loaded, meaning the first 512 KB of the FBC image should be
>> skipped when loading the AMSS image over the BHIe interface.
> 
> Please explain what is present in the first 512KiB and why skipping that is
> required.
> 
>> Note that
>> this flag does not affect the SBL image download process.
>>
>> Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
>> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - V1 patch is paused because of no user. WLAN team plan to add support for
>>   new WLAN chip that requires this patch, so send v2.
>> - Change author and SOB with new mail address.
>> - Reword commit message.
>> - Place standard_elf_image flag after wake_set in struct mhi_controller
>> - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
>> ---
>>  drivers/bus/mhi/host/boot.c | 7 +++++++
>>  include/linux/mhi.h         | 4 ++++
>>  2 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>> index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
>> --- a/drivers/bus/mhi/host/boot.c
>> +++ b/drivers/bus/mhi/host/boot.c
>> @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>>  	 * device transitioning into MHI READY state
>>  	 */
>>  	if (fw_load_type == MHI_FW_LOAD_FBC) {
>> +		dev_dbg(dev, "standard_elf_image:%s\n",
>> +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> 
> This print is just a noise even for debug.
> 
>> +		if (mhi_cntrl->standard_elf_image) {
>> +			fw_data += mhi_cntrl->sbl_size;
>> +			fw_sz -= mhi_cntrl->sbl_size;
> 
> Is it possible to detect the image type during runtime instead of using a flag?
> Also, the flag is currently unused. So it should come along an user.

The flag would be used when a new WLAN device getting upstream. So either we merge this
patch alone, or we get it grouped within the WLAN patches. Kindly share your thoughts?

> 
> - Mani
> 


