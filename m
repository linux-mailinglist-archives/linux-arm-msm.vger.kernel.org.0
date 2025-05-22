Return-Path: <linux-arm-msm+bounces-59022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1057DAC0871
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 11:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 486A31BC48F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 09:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D81221734;
	Thu, 22 May 2025 09:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PBNgtksK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B6E1AED5C;
	Thu, 22 May 2025 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905599; cv=none; b=by7NkBVNvgelR8qEklczDtoPirNWczB4mbViw8XurGMkxMSmrx/v6AZbe/sXvnlpseQlDuFUrEwrPnTvCw3Y0HNdGY9yHgxRmBMfPDr86+VZ1xXyJRx3jWrTXhe6M2rfZiXyxUF4AF0/4pK0N+zLgT7fkLkxvdMgYEWEU6KRabs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905599; c=relaxed/simple;
	bh=Vumn8RZM/ix8NHA+DQjwidiTtBvjSFKLb5W66/ag1Q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ahSy6ePPiqcI/onoDm54exnIjj6gEjV3yd1dXZ0xDml5Gu6cyUk7cOox4EqWOpgqj3sy1/gdyHNn2YFMWDMN5j1gyNrQyzwYcokayLss+1S8EFQC4oIhtMh2UWQhLWRnDmjQz1ZqDE6pIAAc0P41+vv4CFyr9+fNmvqu0yamkfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PBNgtksK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7pNdw029931;
	Thu, 22 May 2025 09:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SluCIdJCTMYmiz7FXaBDUUgy1IMjyMOeFE3QncYRnLM=; b=PBNgtksKxDANN3Pl
	dNuV7+XzYOgNzooFQBC7EZqCK7ZBZY4D5TkpCxirK1SwVby1mQRxaoxzH3IprZa1
	nch18px3yUOtcmxC3eps/jv4gkNF+OBgOuA0COAomA7FV5aXn8vsX32Nvyb4/DUg
	1zF165uknW6SHNK7oumMDdP6MTMW1WvU3GSBit4ylF4uqqfTzjYQvhWBc1EEmf0u
	XnkPecoj2hV8nUJGKuCbdljf8JkdCWiY4LKVlsPL7c+ls3wihT0MvB7VzXjcgmlJ
	1ne5vzJhUYF3xcCTky/EPHICCFUReghgWFITVx0i6FRi53iR3vD/+co250y5qnIR
	Uv+CJg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf45upn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:19:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54M9JZ9u022945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:19:35 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 May
 2025 02:19:31 -0700
Message-ID: <6e3c37d6-7e52-4380-9703-56deb2704992@quicinc.com>
Date: Thu, 22 May 2025 14:49:28 +0530
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
 <5584c019-d435-4d1b-b38c-80fb9b9f00f6@quicinc.com>
 <5z5yfa2xrnkrgz6ol6baaynsy4vugxv3kf7c2xrqjqvrr7dbcr@u3qycb4ucguz>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <5z5yfa2xrnkrgz6ol6baaynsy4vugxv3kf7c2xrqjqvrr7dbcr@u3qycb4ucguz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA5MyBTYWx0ZWRfX6zJFGRM66HCT
 ZO5qBlNLdgrfUfklSOFmVspDSe/nXYzLXLV0O4G4Qy50ITaEf5/WHYxci64qzBY4ZD+mp4p4oiS
 bIMLq7ZvwiPekzhcIZtJ0OpZmOuawN8AoqWQxAfVH9F7ECEWRqb3l8+Q/deceL82AYZopaGFkO1
 WU1Xg/ZcojojRwOsIkAPF30F2FjG9sZSNAlv3kQhcrB209l3FyhfX3wUb0IeQe62WmR9z+KDx7R
 hRpG4pXVippdoxVp6p2eim9l21XTTaMvzBMm6KL44PyDBJcfqVBJ3eqt6AEJtia9QI5W1mifbkh
 yCvi2iEp2yqtXVB3w3jmAJFYfD+1LuDMNFVgz5UeegOSYX8FTcSI1A9oW4R/E1Xsmj5EyUoqv1t
 nfarM3u+RpFbsTJ/M3nLNda/paD1L0Q2DDYdUAvoKHe48gJCkrgJ05295TdGHiBA2KzMoxpj
X-Proofpoint-GUID: gtlR3klHaKuyuHtXAbc_6DuZJcxK3wwt
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682eec28 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=tUN6H4m40X_enmaeLRoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gtlR3klHaKuyuHtXAbc_6DuZJcxK3wwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220093



On 5/22/2025 2:25 PM, Manivannan Sadhasivam wrote:
> On Thu, May 22, 2025 at 03:10:48AM +0530, Nitin Rawat wrote:
>>
>>
>> On 5/21/2025 7:27 PM, Manivannan Sadhasivam wrote:
>>> On Thu, May 15, 2025 at 09:57:20PM +0530, Nitin Rawat wrote:
>>>> Commit 3f6d1767b1a0 ("phy: ufs-qcom: Refactor all init steps into
>>>> phy_poweron") removes the phy_power_on/off from ufs_qcom_setup_clocks
>>>
>>> s/removes/moved
>>
>> Sure, will address in next patchset.
>>
>>>
>>>> to suspend/resume func.
>>>>
>>>> To have a better power saving, remove the phy_power_on/off calls from
>>>> resume/suspend path and put them back to ufs_qcom_setup_clocks, so that
>>>> PHY regulators & clks can be turned on/off along with UFS's clocks.
>>>>
>>>> Since phy phy_power_on is separated out from phy calibrate, make
>>>> separate calls to phy_power_on and phy_calibrate calls from ufs qcom
>>>> driver.
>>>>
>>>
>>> This patch is not calling phy_calibrate().
>>
>> updated commit text to remove phy_Calibrate from commit text
>>
>>>
>>>> Co-developed-by: Can Guo <quic_cang@quicinc.com>
>>>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>>>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>> ---
>>>>    drivers/ufs/host/ufs-qcom.c | 61 ++++++++++++++++++-------------------
>>>>    1 file changed, 29 insertions(+), 32 deletions(-)
>>>>
>>>
>>> [...]
>>>
>>>>    static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>>>>    				 enum ufs_notify_change_status status)
>>>>    {
>>>>    	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>>> +	struct phy *phy = host->generic_phy;
>>>> +	int err;
>>>>    	/*
>>>>    	 * In case ufs_qcom_init() is not yet done, simply ignore.
>>>> @@ -1157,10 +1141,22 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>>>>    				/* disable device ref_clk */
>>>>    				ufs_qcom_dev_ref_clk_ctrl(host, false);
>>>>    			}
>>>> +
>>>> +			err = phy_power_off(phy);
>>>> +			if (err) {
>>>> +				dev_err(hba->dev, "phy power off failed, ret=%d\n", err);
>>>> +				return err;
>>>> +			}
>>>>    		}
>>>>    		break;
>>>>    	case POST_CHANGE:
>>>>    		if (on) {
>>>> +			err = phy_power_on(phy);
>>>> +			if (err) {
>>>> +				dev_err(hba->dev, "phy power on failed, ret = %d\n", err);
>>>> +				return err;
>>>> +			}
>>>> +
>>>>    			/* enable the device ref clock for HS mode*/
>>>>    			if (ufshcd_is_hs_mode(&hba->pwr_info))
>>>>    				ufs_qcom_dev_ref_clk_ctrl(host, true);
>>>> @@ -1343,9 +1339,10 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>>>>    static void ufs_qcom_exit(struct ufs_hba *hba)
>>>>    {
>>>>    	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>>> +	struct phy *phy = host->generic_phy;
>>>>    	ufs_qcom_disable_lane_clks(host);
>>>> -	phy_power_off(host->generic_phy);
>>>> +	phy_power_off(phy);
>>>
>>> This change is not at all needed.
>>
>> In the current code, PHY resources (clocks and rails) remain active even
>> when the link is in a hibernate state and all controller clocks are off.
>> This results in a significant power penalty and can prevent CX power
>> collapse.
>>
>> These rails and clocks are only turned off when a system suspend is
>> triggered, and even then, only at SPM level 5 where the link is turned off.
>> This approach is not power-efficient.
>>
>> As part of this series, the code that enables/disables the PHY's regulators
>> and clocks is now confined to the phy_power_on and phy_power_off calls, with
>> the rest moved to the calibration phase.
>>
>> Therefore, we are invoking the phy_power_off and phy_power_on calls from
>> ufs_qcom_setup_clocks, ensuring that the PHY's regulators and clocks can be
>> turned on/off along with the UFS clocks, thereby achieving power savings.
>>
>> Therefore, this patch is the cornerstone of this series.
>>
> 
> I did not question the patch, but just the change that you did in the
> ufs_qcom_exit() function. You added a local variable for 'host->generic_phy',
> which is not related to this patch.

Sorry about that, Mani. I misunderstood your comments. Sure, will 
address them.


> 
> - Mani
> 


