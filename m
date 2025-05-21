Return-Path: <linux-arm-msm+bounces-58957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A44E1ABFF0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 23:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2F363B12EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 21:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284581FFC48;
	Wed, 21 May 2025 21:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RIT0jz+4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2F21624CE;
	Wed, 21 May 2025 21:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863694; cv=none; b=mqUaUEAsQuEM8W1QsBY+97XkkHRXPLzZieHSFut2SQoxs9+ohvhapV8JJe5jcX9Egs/GTZuwrlZVo1szH8f98wZew9zZie5QHk0EfZO44FW0ZT0QkG//JlwcBCTVRyXepsQ5n4SPCHDPYtafuqbTUkRTVn7kPNSNnr7qGISpoHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863694; c=relaxed/simple;
	bh=86YikLEAm53ZQ+DpRhq1plnNLLqM6U2pOeH8gHqB71A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qU2F+6EO/6I4/IrPaKtVmgHWrY+YTF9vDg5G3FS5lFUqD55gyo2D/ykzqrqLlADRVTv+7eKMUXBoO+sOZWNRo2a2CTkW9mKFnJkyIWYBXtcTkiTkPqPOyzdArCpZvQGBOswkTGLga6oGwLP4qK2KuO+CfyEYPayPn9U+3hlygwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RIT0jz+4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIPRnl001233;
	Wed, 21 May 2025 21:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdW8b9KcuqNQA7rPRzFrtgEw/40FcL5EXfuGBTXg0so=; b=RIT0jz+4xCOeUAA0
	qix9pajW+Wa4l/N0nS6JjwS2Y5muVNjaOYh5+16RNAWGSEWKS6U4napYXUoHF1NQ
	P5VARtlT+514tzsKRLV8qMeJi1QQUdcVbbA61lj0ZUj0zsl9GLlf6uMogrC8H8hp
	96V3J1t1PdzXQBjdKivBEUn09s0n0lddo4FnlBuoHY+V3St6H8CQ+jO1qjDm4kvO
	2mN3MDPQgpAy8bXjkk26nTvoLoRKzPSHhDhLYV1cwj40pZyivPinL805ZKbSdvF7
	+0ifwfI8tkuo4cFA6idzbYjR/2Dy5krnqg0hqO7SFbckg2iXTp2p81JvXCGq0j1W
	CtjLow==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6v879-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 21:41:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LLexa5024405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 21:40:59 GMT
Received: from [10.216.45.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 14:40:53 -0700
Message-ID: <5584c019-d435-4d1b-b38c-80fb9b9f00f6@quicinc.com>
Date: Thu, 22 May 2025 03:10:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 09/11] scsi: ufs: qcom : Refactor phy_power_on/off
 calls
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <konrad.dybcio@oss.qualcomm.com>, <quic_rdwivedi@quicinc.com>,
        <quic_cang@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-10-quic_nitirawa@quicinc.com>
 <knlhbl3mwo3b7xc4rjp4y7yka2nwythumjacmvn236v72ykddo@r3cp2w4uomol>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <knlhbl3mwo3b7xc4rjp4y7yka2nwythumjacmvn236v72ykddo@r3cp2w4uomol>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vps-OOowh3yznaNn_750c9vFtF-5w0f2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIxNSBTYWx0ZWRfX26+UD3SP4Ydg
 q4qpi+OgcG6HdDHPrRQglHuJEbfb+ucJxnjt1c/hu3WQjoyXWpFVrNDe+4NDnOI993YwbsHYOWE
 io+KfWEpg82wU9w0Y1XRgX3IRkwJO9Gf9LQRDuzqUHlNh/h/90W2hkt3TGfkkEM0MOAYOU+dmik
 sAQOhinvdur8dgRlWBtAT7Mp8dmCJ511txZHdJZVCLjK8c3YEZ1jzVuegLyzmvgPBT4DPlaZ8eN
 zEJg9M7coXNnkm3EqUOrPcXKrrw0bnZ1DTdh2572vP75FfhzXX0Aa/RdWmIGnGuty2WOCHDogjL
 D5IiyxjVKmSNkN+qwURSGHuD6OTdIZYsF0sFEDcrejBsFE1h/Jm095UEDLE4Nn71ELEA53HN1hI
 5d4g3aS2DacpJ9huwxV7D2Aqvqe5Ajlq755gaW0bq8Sf0m0hP8tIYH0Wi5l+voT0YzURgF0Z
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682e486c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=NAncGNguUiBsChi5r5oA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vps-OOowh3yznaNn_750c9vFtF-5w0f2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210215



On 5/21/2025 7:27 PM, Manivannan Sadhasivam wrote:
> On Thu, May 15, 2025 at 09:57:20PM +0530, Nitin Rawat wrote:
>> Commit 3f6d1767b1a0 ("phy: ufs-qcom: Refactor all init steps into
>> phy_poweron") removes the phy_power_on/off from ufs_qcom_setup_clocks
> 
> s/removes/moved

Sure, will address in next patchset.

> 
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
> 
> This patch is not calling phy_calibrate().

updated commit text to remove phy_Calibrate from commit text

> 
>> Co-developed-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 61 ++++++++++++++++++-------------------
>>   1 file changed, 29 insertions(+), 32 deletions(-)
>>
> 
> [...]
> 
>>   static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>>   				 enum ufs_notify_change_status status)
>>   {
>>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +	struct phy *phy = host->generic_phy;
>> +	int err;
>>   
>>   	/*
>>   	 * In case ufs_qcom_init() is not yet done, simply ignore.
>> @@ -1157,10 +1141,22 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>>   				/* disable device ref_clk */
>>   				ufs_qcom_dev_ref_clk_ctrl(host, false);
>>   			}
>> +
>> +			err = phy_power_off(phy);
>> +			if (err) {
>> +				dev_err(hba->dev, "phy power off failed, ret=%d\n", err);
>> +				return err;
>> +			}
>>   		}
>>   		break;
>>   	case POST_CHANGE:
>>   		if (on) {
>> +			err = phy_power_on(phy);
>> +			if (err) {
>> +				dev_err(hba->dev, "phy power on failed, ret = %d\n", err);
>> +				return err;
>> +			}
>> +
>>   			/* enable the device ref clock for HS mode*/
>>   			if (ufshcd_is_hs_mode(&hba->pwr_info))
>>   				ufs_qcom_dev_ref_clk_ctrl(host, true);
>> @@ -1343,9 +1339,10 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>>   static void ufs_qcom_exit(struct ufs_hba *hba)
>>   {
>>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +	struct phy *phy = host->generic_phy;
>>   
>>   	ufs_qcom_disable_lane_clks(host);
>> -	phy_power_off(host->generic_phy);
>> +	phy_power_off(phy);
> 
> This change is not at all needed.

In the current code, PHY resources (clocks and rails) remain active even 
when the link is in a hibernate state and all controller clocks are off. 
This results in a significant power penalty and can prevent CX power 
collapse.

These rails and clocks are only turned off when a system suspend is 
triggered, and even then, only at SPM level 5 where the link is turned 
off. This approach is not power-efficient.

As part of this series, the code that enables/disables the PHY's 
regulators and clocks is now confined to the phy_power_on and 
phy_power_off calls, with the rest moved to the calibration phase.

Therefore, we are invoking the phy_power_off and phy_power_on calls from 
ufs_qcom_setup_clocks, ensuring that the PHY's regulators and clocks can 
be turned on/off along with the UFS clocks, thereby achieving power savings.

Therefore, this patch is the cornerstone of this series.

Regards,
Nitin


> 
> - Mani
> 


