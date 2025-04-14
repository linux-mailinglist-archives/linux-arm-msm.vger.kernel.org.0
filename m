Return-Path: <linux-arm-msm+bounces-54269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EDEA88D2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 22:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2DD73AD10B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 20:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6756C1D6DB4;
	Mon, 14 Apr 2025 20:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eZSXaXe3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97741DDC3;
	Mon, 14 Apr 2025 20:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662890; cv=none; b=V3xTptPzzbkVBGkb1RTWUzzEQ8CD7QBdtZVQ4jtU6pi1jAam2cI7M8Uj+4riYbbvL/dywPklTsP/lB4cQ0Z1Um3/cdYVa1TWDjrzMMFKrJnQJNbK69pTZ/RSBuv+JzXRvmUh15GyCEbD6nuIkH6vNsA9Faz8EiWd6vlM53JzN7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662890; c=relaxed/simple;
	bh=tV/hMg/EKG81JwxgWzyEoxieuIkBvXgliVleyvhEAsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LnRHOGeWfwoIkIDn2xTi4yem3bS35gM4x9M2JBFqQDIFlkMd682nIPDxW2olsB8Z/7yXm55FAbXChfHKFJ8rs4f1mpnMZ+04yEe+kZvr5FM1Z6QH9zlh8wZcPfKgldVnLH0WhKGgDZgg+iqnO0ox3wBbxuJqpSvO6FC2e3gg16U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eZSXaXe3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EIZGYM011445;
	Mon, 14 Apr 2025 20:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0gng3sqqxIlJmhQilx3F09jbWC+oiPHZRB5KQiL612k=; b=eZSXaXe3VUEwwm/T
	mDurgoQw0r6IUPkgyXY4QC6WMyYJ29M3JlFEuyRI+bGpinqAu8ZplT4/PAPmZAaS
	KnSH552QxDIPQvcydZj4XtQWFdjuFnm5RnadKFJPXtkVVWbSD805W969uR09o4D4
	S9VA0Besl0DMbw/47nTAa9CaL7Ji8BFdt0HHQfkdpLis8CiVucxfl8PL2H7eHmF5
	I4PX7MKwIXA3/vdxT1G5pHEvkE6knK2OehjP0DWrqlMHq2mRthbRLr8M5TvQoXQJ
	2O190R9W4880PLXhZRXUA+kogQLI6I7RzHW+rdW1gB3oXf/HwCSQCLdoVV4aRUcK
	r7OJRQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wdqra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 20:34:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53EKYPRg011037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 20:34:25 GMT
Received: from [10.216.50.219] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 13:34:19 -0700
Message-ID: <2820908b-4548-4e0a-94b2-6065cb5ff1f3@quicinc.com>
Date: Tue, 15 Apr 2025 02:04:15 +0530
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
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <CAO9ioeXnnbNzriVOYPUeBiWdrPfYUcMk+pVWYv0vZpJbFeByoQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fd7152 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KyqiolPXePoYZYstDAYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Qp6V9r-XsKanonvNaC6fF3HXP4mYl63i
X-Proofpoint-GUID: Qp6V9r-XsKanonvNaC6fF3HXP4mYl63i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140149



On 4/11/2025 4:38 PM, Dmitry Baryshkov wrote:
> On Fri, 11 Apr 2025 at 13:50, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>>
>>
>>
>> On 4/11/2025 1:38 AM, Dmitry Baryshkov wrote:
>>> On Thu, Apr 10, 2025 at 02:30:57PM +0530, Nitin Rawat wrote:
>>>> Refactor the UFS PHY reset handling to parse the reset logic only once
>>>> during probe, instead of every resume.
>>>>
>>>> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
>>>> qmp_ufs_probe to avoid unnecessary parsing during resume.
>>>
>>> How did you solve the circular dependency issue being noted below?
>>
>> Hi Dmitry,
>> As part of my patch, I moved the parsing logic from qmp_phy_power_on to
>> qmp_ufs_probe to avoid unnecessary parsing during resume. I'm uncertain
>> about the circular dependency issue and whether if it still exists.
> 
> It surely does. The reset controller is registered in the beginning of
> ufs_qcom_init() and the PHY is acquired only a few lines below. It
> creates a very small window for PHY driver to probe.
> Which means, NAK, this patch doesn't look acceptable.

Hi Dmitry,

Thanks for pointing this out. I agree that it leaves very little time 
for the PHY to probe, which may cause issues with targets where 
no_pcs_sw_reset is set to true.

As an experiment, I kept no_pcs_sw_reset set to true for the SM8750, and 
it caused bootup probe issues in some of the iterations I ran.

To address this, I propose updating the patch to move the 
qmp_ufs_get_phy_reset call to phy_calibrate, just before the 
reset_control_assert call.

This change will delay the UFS PHY reset as much as possible in the 
code. Additionally, moving it from phy_power_on to calibrate will ensure 
that qmp_ufs_get_phy_reset is called only once during boot, rather than 
during each phy_power_on call.

Please let me know your thoughts.
=====================================================================================================
  static int qmp_ufs_phy_calibrate(struct phy *phy)
  {
         struct qmp_ufs *qmp = phy_get_drvdata(phy);
@@ -1793,6 +1826,12 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
         unsigned int val;
         int ret;

+       pr_err("%s %d\n", __func__, __LINE__);
+
+       ret = qmp_ufs_get_phy_reset(qmp);
+        if (ret)
+                return ret;
+
         ret = reset_control_assert(qmp->ufs_reset);
         if (ret)
                 return ret;
@@ -1817,7 +1856,7 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
                 dev_err(qmp->dev, "phy initialization timed-out\n");
                 return ret;
=====================================================================================================


Regards.
Nitin
> 
>>
>> Regards,
>> Nitin
>>
>>
>>>
>>>>
>>>> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>>>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>>>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>> ---
>>>>    drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 61 +++++++++++++------------
>>>>    1 file changed, 33 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>> index 636dc3dc3ea8..12dad28cc1bd 100644
>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>> @@ -1799,38 +1799,11 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>>>>    static int qmp_ufs_power_on(struct phy *phy)
>>>>    {
>>>>       struct qmp_ufs *qmp = phy_get_drvdata(phy);
>>>> -    const struct qmp_phy_cfg *cfg = qmp->cfg;
>>>>       int ret;
>>>>       dev_vdbg(qmp->dev, "Initializing QMP phy\n");
>>>>
>>>> -    if (cfg->no_pcs_sw_reset) {
>>>> -            /*
>>>> -             * Get UFS reset, which is delayed until now to avoid a
>>>> -             * circular dependency where UFS needs its PHY, but the PHY
>>>> -             * needs this UFS reset.
>>>> -             */
>>>> -            if (!qmp->ufs_reset) {
>>>> -                    qmp->ufs_reset =
>>>> -                            devm_reset_control_get_exclusive(qmp->dev,
>>>> -                                                             "ufsphy");
>>>> -
>>>> -                    if (IS_ERR(qmp->ufs_reset)) {
>>>> -                            ret = PTR_ERR(qmp->ufs_reset);
>>>> -                            dev_err(qmp->dev,
>>>> -                                    "failed to get UFS reset: %d\n",
>>>> -                                    ret);
>>>> -
>>>> -                            qmp->ufs_reset = NULL;
>>>> -                            return ret;
>>>> -                    }
>>>> -            }
>>>> -    }
>>>> -
>>>>       ret = qmp_ufs_com_init(qmp);
>>>> -    if (ret)
>>>> -            return ret;
>>>> -
>>>> -    return 0;
>>>> +    return ret;
>>>>    }
>>>>
>>>>    static int qmp_ufs_phy_calibrate(struct phy *phy)
>>>> @@ -2088,6 +2061,34 @@ static int qmp_ufs_parse_dt(struct qmp_ufs *qmp)
>>>>       return 0;
>>>>    }
>>>>
>>>> +static int qmp_ufs_get_phy_reset(struct qmp_ufs *qmp)
>>>> +{
>>>> +    const struct qmp_phy_cfg *cfg = qmp->cfg;
>>>> +    int ret;
>>>> +
>>>> +    if (!cfg->no_pcs_sw_reset)
>>>> +            return 0;
>>>> +
>>>> +    /*
>>>> +     * Get UFS reset, which is delayed until now to avoid a
>>>> +     * circular dependency where UFS needs its PHY, but the PHY
>>>> +     * needs this UFS reset.
>>>> +     */
>>>> +    if (!qmp->ufs_reset) {
>>>> +            qmp->ufs_reset =
>>>> +            devm_reset_control_get_exclusive(qmp->dev, "ufsphy");
>>>
>>> Strange indentation.
>>>
>>>> +
>>>> +            if (IS_ERR(qmp->ufs_reset)) {
>>>> +                    ret = PTR_ERR(qmp->ufs_reset);
>>>> +                    dev_err(qmp->dev, "failed to get PHY reset: %d\n", ret);
>>>> +                    qmp->ufs_reset = NULL;
>>>> +                    return ret;
>>>> +            }
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static int qmp_ufs_probe(struct platform_device *pdev)
>>>>    {
>>>>       struct device *dev = &pdev->dev;
>>>> @@ -2114,6 +2115,10 @@ static int qmp_ufs_probe(struct platform_device *pdev)
>>>>       if (ret)
>>>>               return ret;
>>>>
>>>> +    ret = qmp_ufs_get_phy_reset(qmp);
>>>> +    if (ret)
>>>> +            return ret;
>>>> +
>>>>       /* Check for legacy binding with child node. */
>>>>       np = of_get_next_available_child(dev->of_node, NULL);
>>>>       if (np) {
>>>> --
>>>> 2.48.1
>>>>
>>>
>>
> 
> 


