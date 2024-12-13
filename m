Return-Path: <linux-arm-msm+bounces-41907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0C49F0628
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9C221604FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 08:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2B8186607;
	Fri, 13 Dec 2024 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nv0OBx/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73D17DA8C;
	Fri, 13 Dec 2024 08:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734077762; cv=none; b=EG3rfrrhzW6wjDco3bXGzS1nVKGtPTd6RzpGeFClB3j368S4s9dz4JrecHFX47rYeNMQWL9jVC+9cuWpOn01d4uZBrUlX9Dt02YxoAwPjLlhxT7sDQLNIBCIVXGT+VesTT0prQ2TRqhKra7WbvvGgPJV/Xmh44BmubC0STFSemU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734077762; c=relaxed/simple;
	bh=OvkHUmlOfntVSnhKJVDcCAy/inJbHd8hNdTsJ24NYwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QTQdxJB8kvJAbRI+T2LpkZZosJB1pw88TeuX0MBKBdM80ORqRsaqVPB/E2Qaa8BGMWCe1HVmpoSAQXnK+BylWwQ1UOA078rgO/zBwLdCrhgVWXsQ/Gy+Aa02EseRP5LzXqwB2lDk1zt6XpCutlocmAPlsAih25vm0ysHeoHZFd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nv0OBx/H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD7ulu5029837;
	Fri, 13 Dec 2024 08:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLAICILLjIfyIA1ULZ2JLrUpUY1KfziegLW0IZav2cE=; b=Nv0OBx/HJFOjOxk7
	6rQtYFHUiPcIxQSVx845QsOUt5CI20VBxjXiks3ab2hgYmwm1jnQPnsGv6rvlFv6
	1eL73g9grkNwOTgrUanoX4yzxEOLlUczWpertv/mDnBT/9IySjEGES6G7S1HN8V8
	aE/O6NrXSI7FdJ9kD6J3Ygxc5c6fbCmLaF4xFtBlUqj0f9z/ZjWoRWS+EfWA1bmM
	NKJY77MUbV7OSy+OSZGJ4RLKWmf3l7u7zatAci6oS4HGPUZQ5D4VSBxLh2Te3uLm
	NyCqKfd2N51loCbj6Z1klbjQDJUN0R62kvXFrbsigy4oQJgxbB+fu45Op31v/1G4
	XFanRA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw4dy53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 08:15:19 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD8FImL009787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 08:15:18 GMT
Received: from [10.239.133.118] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 00:15:13 -0800
Message-ID: <0a16d52c-eebe-40da-ba02-7f68a7849039@quicinc.com>
Date: Fri, 13 Dec 2024 16:15:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: qcom-qusb2: Add regulator_set_load to Qualcomm
 usb phy
To: Bjorn Andersson <andersson@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Vivek Gautam
	<vivek.gautam@codeaurora.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20241121-add_set_load_to_qusb_phy-v2-1-1c5da1befec0@quicinc.com>
 <vbuo2yel2pdcwnmz32f4t5pb6v3ptt2bcs2t6ybab2jxnkd6e7@rjnsbawj4zpb>
Content-Language: en-US
From: Song Xue <quic_songxue@quicinc.com>
In-Reply-To: <vbuo2yel2pdcwnmz32f4t5pb6v3ptt2bcs2t6ybab2jxnkd6e7@rjnsbawj4zpb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XnpzsuXAGzRKEPNTTywcpOk98YOndc0Q
X-Proofpoint-GUID: XnpzsuXAGzRKEPNTTywcpOk98YOndc0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130056



On 11/29/2024 12:43 AM, Bjorn Andersson wrote:
> On Thu, Nov 21, 2024 at 04:09:27PM +0800, Song Xue wrote:
>> Set the current load before enable regulator supplies at QUSB phy.
>>
>> Encountered one issue where the board powered down instantly once the UVC
>> camera was attached to USB port while adding host mode on usb port and
>> testing a UVC camera with the driver on QCS615 platform. The extensible
>> boot loader mentioned that OCP(Over Current Protection) occurred at LDO12
>> from regulators-0 upon powered on board again. That indicates that the
>> current load set for QUSB phy, which use the regulator supply, is lower
>> than expected.
>>
>> As per QUSB spec, set the maximum current load at 30mA to avoid overcurrent
>> load when attach a device to the USB port.
>>
>> Fixes: 937e17f36a32 ("phy: qcom-qusb2: Power-on PHY before initialization")
>> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> 
> The patch looks good. But if we describe the regulator(s) with
> regulator-allow-set-load; and not all the consumers vote for load, the
> sum of the load when USB phy is disabled goes to 0 and we will enter
> LPM.
> 
Hi, Bjorn

Thanks for comment.

We dived into the code and found the other all Qualcomm platform's 
device tree using the phy-qcom-qusb2's compatible don't use the 
"regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>" and 
"regulator-allow-set-load" together at the same time. We think the patch 
is safe now.

Therefore, can we merge the patch?

Thanks,
Song
> For this reason we're not doing any load requests today. Can you confirm
> that this works fine with a dtb where only HPM is permitted (as well as
> LPM and HPM)? If so I'd be in favor of us merging this change, but
> keeping the dts HPM-only until someone confirms that all consumers of
> these regulators specify load-votes.
> 
> Regards,
> Bjorn
> 
>> ---
>> Changes in v2:
>> - Removed "---" above the Fixes.
>> - Link to v1: https://lore.kernel.org/r/20241121-add_set_load_to_qusb_phy-v1-1-0f44f3a3290e@quicinc.com
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> index c52655a383cef008552ed4533b9f31d1cbf34a13..80f0d17c42717e843937255a9a780bbae5998535 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> @@ -722,16 +722,27 @@ static int __maybe_unused qusb2_phy_runtime_resume(struct device *dev)
>>   	return ret;
>>   }
>>   
>> +#define QUSB2PHY_HPM_LOAD 30000 /*uA*/
>> +
>>   static int qusb2_phy_init(struct phy *phy)
>>   {
>>   	struct qusb2_phy *qphy = phy_get_drvdata(phy);
>>   	const struct qusb2_phy_cfg *cfg = qphy->cfg;
>>   	unsigned int val = 0;
>>   	unsigned int clk_scheme;
>> -	int ret;
>> +	int ret, i;
>>   
>>   	dev_vdbg(&phy->dev, "%s(): Initializing QUSB2 phy\n", __func__);
>>   
>> +	/* set the current load */
>> +	for (i = 0; i < ARRAY_SIZE(qphy->vregs); i++) {
>> +		ret = regulator_set_load(qphy->vregs[i].consumer, QUSB2PHY_HPM_LOAD);
>> +		if (ret) {
>> +			dev_err(&phy->dev, "failed to set load at %s\n", qphy->vregs[i].supply);
>> +			return ret;
>> +		}
>> +	}
>> +
>>   	/* turn on regulator supplies */
>>   	ret = regulator_bulk_enable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
>>   	if (ret)
>>
>> ---
>> base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
>> change-id: 20241121-add_set_load_to_qusb_phy-d1327c797ffe
>>
>> Best regards,
>> -- 
>> Song Xue <quic_songxue@quicinc.com>
>>
>>


