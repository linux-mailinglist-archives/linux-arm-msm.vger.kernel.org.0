Return-Path: <linux-arm-msm+bounces-46175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3330A1D019
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 05:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C9B73A67B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 04:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0959524B0;
	Mon, 27 Jan 2025 04:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pVL0tTI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455421E89C;
	Mon, 27 Jan 2025 04:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737951948; cv=none; b=SfJ6e5JlKRT5IGMxv1SxsLIGOsreP5lLl1pifP3oZGBuwrgZysGJpT55Hum/gfy7muP4+wvh9B0x6D7FI3WQH+vzpJrIhi4N790Ja78gmfC/kJhoCw2dszH0W5CMIpyCbE1iCUCtVCbT7mdEyqyrnjdXid8f7E09cH/yogOYnkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737951948; c=relaxed/simple;
	bh=GVAyUfVsHsf79ikFI7ffiuW0ykLyMcbNBNNMzSiub98=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=LR3RJoueixvODihbLMEHkQTQhsIz2N+VD0RHefDOPmgXZ+4eV0EWCOOMoLPY6F57nwpW5ATE9N6pFABwRt665Y8u4Ssl8mhODOyz1DV5IHWxXGLgCn9xb4jGVgaUIBc057N10iYEECFWpxjWto/gGCzOrZdMuiimWpfSrPS8NS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pVL0tTI0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R3Twg1002962;
	Mon, 27 Jan 2025 04:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Agj9TdzPEAi+UN/7+D5zhJ/2bw2ImEuZZss2DghTua0=; b=pVL0tTI03lOegzzW
	Ujc3az80GcKYi6D1CBWMAlRAQkksteEPpxAJPM2XyGMURAk/4B5MzXNGrxrODUHu
	IiHqSwEfMqWD8BkfJzTJIclCCcLcHA2KXyi3E8N9kFY4n7WZhiME9SqNFq6idfgR
	/TCzVG878OysLIzmljh3DPSrrQJRPThG/8svjwC+nU0/istLXrE3cOkkfuLWfRYD
	0H+2RffOmUUwehYTm6GqKQ9BiSpwGdrrmXSjClsbT0Ps+pR25/F2Wsx+u4Ho3EzD
	XcBbr04aAF/2GnAL/3DX2lN5saHZv1Q1ue76/hkubgdWLq/9uhMEJzExHNZxyzoE
	84s6TA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e298826q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 04:25:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50R4P6Gj019252
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 04:25:06 GMT
Received: from [10.253.39.219] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 26 Jan
 2025 20:25:00 -0800
Message-ID: <37fc7aa6-23d2-4636-8e02-4957019121a3@quicinc.com>
Date: Mon, 27 Jan 2025 12:23:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: qcom-qusb2: Add regulator_set_load to Qualcomm
 usb phy
From: Song Xue <quic_songxue@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Vivek Gautam
	<vivek.gautam@codeaurora.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20241121-add_set_load_to_qusb_phy-v2-1-1c5da1befec0@quicinc.com>
 <vbuo2yel2pdcwnmz32f4t5pb6v3ptt2bcs2t6ybab2jxnkd6e7@rjnsbawj4zpb>
 <0a16d52c-eebe-40da-ba02-7f68a7849039@quicinc.com>
Content-Language: en-US
In-Reply-To: <0a16d52c-eebe-40da-ba02-7f68a7849039@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OmUGvyl4CftSN4RAvFxrO03aivc_UYlw
X-Proofpoint-ORIG-GUID: OmUGvyl4CftSN4RAvFxrO03aivc_UYlw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_01,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270033



On 12/13/2024 4:15 PM, Song Xue wrote:
> 
> 
> On 11/29/2024 12:43 AM, Bjorn Andersson wrote:
>> On Thu, Nov 21, 2024 at 04:09:27PM +0800, Song Xue wrote:
>>> Set the current load before enable regulator supplies at QUSB phy.
>>>
>>> Encountered one issue where the board powered down instantly once the 
>>> UVC
>>> camera was attached to USB port while adding host mode on usb port and
>>> testing a UVC camera with the driver on QCS615 platform. The extensible
>>> boot loader mentioned that OCP(Over Current Protection) occurred at 
>>> LDO12
>>> from regulators-0 upon powered on board again. That indicates that the
>>> current load set for QUSB phy, which use the regulator supply, is lower
>>> than expected.
>>>
>>> As per QUSB spec, set the maximum current load at 30mA to avoid 
>>> overcurrent
>>> load when attach a device to the USB port.
>>>
>>> Fixes: 937e17f36a32 ("phy: qcom-qusb2: Power-on PHY before 
>>> initialization")
>>> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
>>
>> The patch looks good. But if we describe the regulator(s) with
>> regulator-allow-set-load; and not all the consumers vote for load, the
>> sum of the load when USB phy is disabled goes to 0 and we will enter
>> LPM.
>>
> Hi, Bjorn
> 
> Thanks for comment.
> 
> We dived into the code and found the other all Qualcomm platform's 
> device tree using the phy-qcom-qusb2's compatible don't use the 
> "regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>" and "regulator- 
> allow-set-load" together at the same time. We think the patch is safe now.
> 
> Therefore, can we merge the patch?
> 
> Thanks,
> Song

Hi, Bjorn

As mentioned in the above comment, the code is safe for setting the 
load. Additionally, we can see that the patch for setting the current 
load for EMMC on QCS615 has been applied.

https://lore.kernel.org/all/20250114083514.258379-1-quic_yuanjiey@quicinc.com/

could you pls help confirm if apply the patch?

Thanks,
Song
>> For this reason we're not doing any load requests today. Can you confirm
>> that this works fine with a dtb where only HPM is permitted (as well as
>> LPM and HPM)? If so I'd be in favor of us merging this change, but
>> keeping the dts HPM-only until someone confirms that all consumers of
>> these regulators specify load-votes.
>>
>> Regards,
>> Bjorn
>>
>>> ---
>>> Changes in v2:
>>> - Removed "---" above the Fixes.
>>> - Link to v1: https://lore.kernel.org/r/20241121- 
>>> add_set_load_to_qusb_phy-v1-1-0f44f3a3290e@quicinc.com
>>> ---
>>>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 13 ++++++++++++-
>>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/ 
>>> qualcomm/phy-qcom-qusb2.c
>>> index 
>>> c52655a383cef008552ed4533b9f31d1cbf34a13..80f0d17c42717e843937255a9a780bbae5998535 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>>> @@ -722,16 +722,27 @@ static int __maybe_unused 
>>> qusb2_phy_runtime_resume(struct device *dev)
>>>       return ret;
>>>   }
>>> +#define QUSB2PHY_HPM_LOAD 30000 /*uA*/
>>> +
>>>   static int qusb2_phy_init(struct phy *phy)
>>>   {
>>>       struct qusb2_phy *qphy = phy_get_drvdata(phy);
>>>       const struct qusb2_phy_cfg *cfg = qphy->cfg;
>>>       unsigned int val = 0;
>>>       unsigned int clk_scheme;
>>> -    int ret;
>>> +    int ret, i;
>>>       dev_vdbg(&phy->dev, "%s(): Initializing QUSB2 phy\n", __func__);
>>> +    /* set the current load */
>>> +    for (i = 0; i < ARRAY_SIZE(qphy->vregs); i++) {
>>> +        ret = regulator_set_load(qphy->vregs[i].consumer, 
>>> QUSB2PHY_HPM_LOAD);
>>> +        if (ret) {
>>> +            dev_err(&phy->dev, "failed to set load at %s\n", qphy- 
>>> >vregs[i].supply);
>>> +            return ret;
>>> +        }
>>> +    }
>>> +
>>>       /* turn on regulator supplies */
>>>       ret = regulator_bulk_enable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
>>>       if (ret)
>>>
>>> ---
>>> base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
>>> change-id: 20241121-add_set_load_to_qusb_phy-d1327c797ffe
>>>
>>> Best regards,
>>> -- 
>>> Song Xue <quic_songxue@quicinc.com>
>>>
>>>
> 
> 


