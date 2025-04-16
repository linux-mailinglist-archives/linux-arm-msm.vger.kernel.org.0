Return-Path: <linux-arm-msm+bounces-54480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 934EAA8B4E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 11:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF9657AFE3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 09:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA0823534A;
	Wed, 16 Apr 2025 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NJ48zDBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EC8234987;
	Wed, 16 Apr 2025 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794546; cv=none; b=U6D9Pf4R1QhjKLM4wo11ih2wS9dbpRphbJUUbPzUL0mxjHh0N3NC+hnROwvTN2l090mcNhlLs+Mo9LRRPMV7fttnsV813syKGnxRe/rj04Bgg2Zn7bxSI0dA9VwFxBi2YkTIY68NqacIeXll8QY//CxGT6Is6CoybRNJryEW7z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794546; c=relaxed/simple;
	bh=jFhBd9BFwy1JcG/oVj8I5if+kZRrNaoJw+Ji6xyGSIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gT7nEnfuWp43aWN/84vdb5EUMK8aXXdHwSSJ+zj/xSrx9TqayTl1tTPYbFr42x7J7+9hM7rqOaBuS+0vrpPYOqE0gh+n9KA5DIGaCYG85OWfdshS+6gx91GwlPSfzL9AqAJN/7yREItWCjNREzHM8YjfaznuQwlVCWk1o40qFdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NJ48zDBA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G7Jqxk003482;
	Wed, 16 Apr 2025 09:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVNSHHWbl8mdqUD40GAezRu9QUwIuSmoYMdmG6aQeuc=; b=NJ48zDBAhX3vuUQN
	DM0TRT9pMMq+vSIu57LWiPwl0yhriJYd2fk9Atl2ErYYV7GO0AcjmPguUS6PGfpN
	A8j9G/GflWIQqRtwqGXkAN/wNkkYn/nMmYUEDWNDFlJExFCEJ4c5KRyaz8AiqrEY
	qZzN4AyjgAFRCMoSagB6Niz3idRjyuhk618KseZyvRRIzrWdJWoiMCUi1oJ0qyam
	CZHtyY6KUPjBSuNRZrP+jSdO21H6c8XdJlmihPEDr29Qkya1c7M85xGjtzvReeSc
	B6iC2OSFzp2y2yFBKRvdnyPY8cvl1e7HFqJtNZ6Ofim7xkLDdOwx7tbuoiv7yY4Y
	3wPKIw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wjych-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 09:08:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53G98eum001994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 09:08:40 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Apr
 2025 02:08:36 -0700
Message-ID: <a24ff510-2afd-4aa7-a026-199fb6d87287@quicinc.com>
Date: Wed, 16 Apr 2025 14:38:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/9] phy: qcom-qmp-ufs: Refactor UFS PHY reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <bjorande@quicinc.com>,
        <neil.armstrong@linaro.org>, <konrad.dybcio@oss.qualcomm.com>,
        <quic_rdwivedi@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-5-quic_nitirawa@quicinc.com>
 <pur4y63xhfmqlyymg4pehk37ry4gg22h24zceoqjbsxp3hj4yf@4kptase3c4qp>
 <317faeaa-3130-4e28-8c5d-441a76aa79b4@quicinc.com>
 <CAO9ioeXnnbNzriVOYPUeBiWdrPfYUcMk+pVWYv0vZpJbFeByoQ@mail.gmail.com>
 <2820908b-4548-4e0a-94b2-6065cb5ff1f3@quicinc.com>
 <c2ec6b7c-421d-43c3-8c0a-de4f7bdd867c@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <c2ec6b7c-421d-43c3-8c0a-de4f7bdd867c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67ff739a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=4vh3ibDLHFHjjJMVvK0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kbJF3o6xxtz7UL9pi4T1ulOmAu021lmX
X-Proofpoint-GUID: kbJF3o6xxtz7UL9pi4T1ulOmAu021lmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160074



On 4/15/2025 2:59 PM, Dmitry Baryshkov wrote:
> On 14/04/2025 23:34, Nitin Rawat wrote:
>>
>>
>> On 4/11/2025 4:38 PM, Dmitry Baryshkov wrote:
>>> On Fri, 11 Apr 2025 at 13:50, Nitin Rawat <quic_nitirawa@quicinc.com> 
>>> wrote:
>>>>
>>>>
>>>>
>>>> On 4/11/2025 1:38 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, Apr 10, 2025 at 02:30:57PM +0530, Nitin Rawat wrote:
>>>>>> Refactor the UFS PHY reset handling to parse the reset logic only 
>>>>>> once
>>>>>> during probe, instead of every resume.
>>>>>>
>>>>>> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
>>>>>> qmp_ufs_probe to avoid unnecessary parsing during resume.
>>>>>
>>>>> How did you solve the circular dependency issue being noted below?
>>>>
>>>> Hi Dmitry,
>>>> As part of my patch, I moved the parsing logic from qmp_phy_power_on to
>>>> qmp_ufs_probe to avoid unnecessary parsing during resume. I'm uncertain
>>>> about the circular dependency issue and whether if it still exists.
>>>
>>> It surely does. The reset controller is registered in the beginning of
>>> ufs_qcom_init() and the PHY is acquired only a few lines below. It
>>> creates a very small window for PHY driver to probe.
>>> Which means, NAK, this patch doesn't look acceptable.
>>
>> Hi Dmitry,
>>
>> Thanks for pointing this out. I agree that it leaves very little time 
>> for the PHY to probe, which may cause issues with targets where 
>> no_pcs_sw_reset is set to true.
>>
>> As an experiment, I kept no_pcs_sw_reset set to true for the SM8750, 
>> and it caused bootup probe issues in some of the iterations I ran.
>>
>> To address this, I propose updating the patch to move the 
>> qmp_ufs_get_phy_reset call to phy_calibrate, just before the 
>> reset_control_assert call.
> 
> Will it cause an issue if we move it to phy_init() instead of 
> phy_calibrate()?

Hi Dmitry,

Thanks for suggestion.
Phy_init is invoked before phy_set_mode_ext and ufs_qcom_phy_power_on, 
whereas calibrate is called after ufs_qcom_phy_power_on. Keeping the UFS 
PHY reset in phy_calibrate introduces relatively more delay, providing 
more buffer time for the PHY driver probe, ensuring the UFS PHY reset is 
handled correctly the first time.

Moving the calibration to phy_init shouldn't cause any issues. However, 
since we currently don't have an initialization operations registered 
for init, we would need to add a new PHY initialization ops if we decide 
to move it to phy_init.

Please let me know if this looks fine to you, or if you have any 
suggestions. I am open to your suggestions.

Regards,
Nitin


> 
>>
>> This change will delay the UFS PHY reset as much as possible in the 
>> code. Additionally, moving it from phy_power_on to calibrate will 
>> ensure that qmp_ufs_get_phy_reset is called only once during boot, 
>> rather than during each phy_power_on call.
>>
>> Please let me know your thoughts.
>> =====================================================================================================
>>   static int qmp_ufs_phy_calibrate(struct phy *phy)
>>   {
>>          struct qmp_ufs *qmp = phy_get_drvdata(phy);
>> @@ -1793,6 +1826,12 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
>>          unsigned int val;
>>          int ret;
>>
>> +       pr_err("%s %d\n", __func__, __LINE__);
>> +
>> +       ret = qmp_ufs_get_phy_reset(qmp);
>> +        if (ret)
>> +                return ret;
>> +
>>          ret = reset_control_assert(qmp->ufs_reset);
>>          if (ret)
>>                  return ret;
>> @@ -1817,7 +1856,7 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
>>                  dev_err(qmp->dev, "phy initialization timed-out\n");
>>                  return ret;
>> =====================================================================================================
>>
>>
>> Regards.
>> Nitin
>>>
>>>>
>>>> Regards,
>>>> Nitin
>>>>
>>>>
>>>>>
>>>>>>
>>>>>> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>>>>>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>>>>>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>>>> ---
>>>>>>    drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 61 ++++++++++++ 
>>>>>> +------------
>>>>>>    1 file changed, 33 insertions(+), 28 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/ 
>>>>>> phy/ qualcomm/phy-qcom-qmp-ufs.c
>>>>>> index 636dc3dc3ea8..12dad28cc1bd 100644
>>>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>>>> @@ -1799,38 +1799,11 @@ static int qmp_ufs_com_exit(struct qmp_ufs 
>>>>>> *qmp)
>>>>>>    static int qmp_ufs_power_on(struct phy *phy)
>>>>>>    {
>>>>>>       struct qmp_ufs *qmp = phy_get_drvdata(phy);
>>>>>> -    const struct qmp_phy_cfg *cfg = qmp->cfg;
>>>>>>       int ret;
>>>>>>       dev_vdbg(qmp->dev, "Initializing QMP phy\n");
>>>>>>
>>>>>> -    if (cfg->no_pcs_sw_reset) {
>>>>>> -            /*
>>>>>> -             * Get UFS reset, which is delayed until now to avoid a
>>>>>> -             * circular dependency where UFS needs its PHY, but 
>>>>>> the PHY
>>>>>> -             * needs this UFS reset.
>>>>>> -             */
>>>>>> -            if (!qmp->ufs_reset) {
>>>>>> -                    qmp->ufs_reset =
>>>>>> -                            devm_reset_control_get_exclusive(qmp- 
>>>>>> >dev,
>>>>>> - "ufsphy");
>>>>>> -
>>>>>> -                    if (IS_ERR(qmp->ufs_reset)) {
>>>>>> -                            ret = PTR_ERR(qmp->ufs_reset);
>>>>>> -                            dev_err(qmp->dev,
>>>>>> -                                    "failed to get UFS reset: %d\n",
>>>>>> -                                    ret);
>>>>>> -
>>>>>> -                            qmp->ufs_reset = NULL;
>>>>>> -                            return ret;
>>>>>> -                    }
>>>>>> -            }
>>>>>> -    }
>>>>>> -
>>>>>>       ret = qmp_ufs_com_init(qmp);
>>>>>> -    if (ret)
>>>>>> -            return ret;
>>>>>> -
>>>>>> -    return 0;
>>>>>> +    return ret;
>>>>>>    }
>>>>>>
>>>>>>    static int qmp_ufs_phy_calibrate(struct phy *phy)
>>>>>> @@ -2088,6 +2061,34 @@ static int qmp_ufs_parse_dt(struct qmp_ufs 
>>>>>> *qmp)
>>>>>>       return 0;
>>>>>>    }
>>>>>>
>>>>>> +static int qmp_ufs_get_phy_reset(struct qmp_ufs *qmp)
>>>>>> +{
>>>>>> +    const struct qmp_phy_cfg *cfg = qmp->cfg;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    if (!cfg->no_pcs_sw_reset)
>>>>>> +            return 0;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Get UFS reset, which is delayed until now to avoid a
>>>>>> +     * circular dependency where UFS needs its PHY, but the PHY
>>>>>> +     * needs this UFS reset.
>>>>>> +     */
>>>>>> +    if (!qmp->ufs_reset) {
>>>>>> +            qmp->ufs_reset =
>>>>>> +            devm_reset_control_get_exclusive(qmp->dev, "ufsphy");
>>>>>
>>>>> Strange indentation.
>>>>>
>>>>>> +
>>>>>> +            if (IS_ERR(qmp->ufs_reset)) {
>>>>>> +                    ret = PTR_ERR(qmp->ufs_reset);
>>>>>> +                    dev_err(qmp->dev, "failed to get PHY reset: 
>>>>>> %d\n", ret);
>>>>>> +                    qmp->ufs_reset = NULL;
>>>>>> +                    return ret;
>>>>>> +            }
>>>>>> +    }
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>>    static int qmp_ufs_probe(struct platform_device *pdev)
>>>>>>    {
>>>>>>       struct device *dev = &pdev->dev;
>>>>>> @@ -2114,6 +2115,10 @@ static int qmp_ufs_probe(struct 
>>>>>> platform_device *pdev)
>>>>>>       if (ret)
>>>>>>               return ret;
>>>>>>
>>>>>> +    ret = qmp_ufs_get_phy_reset(qmp);
>>>>>> +    if (ret)
>>>>>> +            return ret;
>>>>>> +
>>>>>>       /* Check for legacy binding with child node. */
>>>>>>       np = of_get_next_available_child(dev->of_node, NULL);
>>>>>>       if (np) {
>>>>>> -- 
>>>>>> 2.48.1
>>>>>>
>>>>>
>>>>
>>>
>>>
>>
> 
> 


