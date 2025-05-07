Return-Path: <linux-arm-msm+bounces-57169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 635B0AAE3E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 17:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 711601BC59FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 15:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DD628A1C9;
	Wed,  7 May 2025 15:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kk0fa7Ti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6E6145B16;
	Wed,  7 May 2025 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630409; cv=none; b=RnrsQCsaM6/ovA6JeX0aLNBj92LO+RT3pQYVy35+TCthM7fQl5OICdgKjPITn0799EZneZoMa5MASSg4FVyDHAJh1V5GUjqUQSEoSlB9LmvhFWL10Hm4bI/pmkExwjMIkxjbyV0agSDjs5yM+LU66xhGgf6Xit/2y2Ym1NP9Iik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630409; c=relaxed/simple;
	bh=N1rwgRRnDqs/M9QA2Mc7JZlhCWle/rl+V84fvGvfCDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=J+meyvNGHUxbAt/aAHzvXKJj5SwqhMSmLmKf+lbTxTIJHTiIVgZ5oGEYxn4iWfwRVLvOc13maba+AEnR+aHwdAV9KAstJyQYmvTkp67NfInlUT3ef4V3DICjZOdYZU4IC/H9lHtszxnoxdTlT1GAo2WTvLmB2oV6opMM/4F+n3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kk0fa7Ti; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547Da8xt011186;
	Wed, 7 May 2025 15:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8No8/KPTSLU3O+50ue4WHZSN0FQGaSfa9yafjJ6UAs=; b=Kk0fa7Tibq9z5ln0
	DbzpkNOGMLuGeYA/Q1kzjo1UvdmlnYg0eR+/+JMEM7EsU74Etp+C/SPxISB0kctx
	wFgJmMmsiBeYIvCxRISL/IqmFb1/GSdscdxnmBUHuoN01IU/STJd3O19DbQxobXg
	edpPW/Ktlf4uAhLr9dZ9QwjzbW9GBs4W2EyR3/Ix14EMTP3rM9pSiwTEE3Y40Tw9
	k9bKpL5pENbRz+JbyACqfD2JVP09FiW9RVlThDyztbdP4AbUkh+0RrdgZAhq6MP5
	ode0g8hpRFHBtXGgnWPN1zdfAA70y0xrjUJJ7fBFB73+UxzatALQJ+gXP4Jz+EQC
	8WJPjA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46g13vsrcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 15:06:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547F6334006734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 15:06:03 GMT
Received: from [10.216.23.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 May 2025
 08:05:58 -0700
Message-ID: <626f208c-7060-4fce-9aac-4c48606fc56d@quicinc.com>
Date: Wed, 7 May 2025 20:35:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 06/11] phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>, <konrad.dybcio@oss.qualcomm.com>,
        <quic_rdwivedi@quicinc.com>, <quic_cang@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-7-quic_nitirawa@quicinc.com>
 <prbe2guxzsea6aqonf32m44zp6oa3vzdf5ieazcontv4fmx3d3@2r4tu5nr2k4x>
 <2191c270-f4fc-47e4-8bb7-ba6329332ef3@quicinc.com>
 <qhblitwmuhnb7axrflsqh7pmshmhrehh2hina23k6zqq7mhafv@xtsl376cyooy>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <qhblitwmuhnb7axrflsqh7pmshmhrehh2hina23k6zqq7mhafv@xtsl376cyooy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8lyCi0D8an1jr1kZOvVJkHON42edOAn2
X-Proofpoint-ORIG-GUID: 8lyCi0D8an1jr1kZOvVJkHON42edOAn2
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=681b76dd cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=JfrnYn6hAAAA:8
 a=COk6AnOGAAAA:8 a=zV9PPM8jW_R1-xSbYZ8A:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0MSBTYWx0ZWRfX3IyhT/6pcPLz
 IjYIlt5taCWiRLorU3mTzOIsmVoLgiTi0SJPA8CpnA92PCdbzcGl4msb20iVjXu09TSbQp2fO5u
 JdYdKeo00nE2tdNMVsq4WSkf/Grj39xroJiSwNiQ4ooJTs2DQJKA8MSjBeft9maPekLVn1EF/Pi
 8kb77g/LOysrc+wPsqD5XgAUGAFOGgVH6JtUSX6J0Mz8NE4TbzS/r6Xt2Ncz7l6ekQgxJEi0PZr
 Wt1mNBjqdwuRWSekXkXHV4r1MA+WhbXYCCvSlAU5Abm1vIOmMojkpkuzrHOFkypd9wQza9sIV+/
 i04hzhk3HcSKV8eBVBbmgdyHdUJRuod9esL8+6WQH9iCuMgegb5RYXwDxaV+j04BE5hoDPbONYA
 u7t301y0QVMJrlAP0ndjp4NOGBMLl6wL6asS+euzgXg34I1vrTSDoitZMSaJeW1gWVgD5azy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_04,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070141



On 5/6/2025 5:23 PM, Dmitry Baryshkov wrote:
> On Sun, May 04, 2025 at 09:22:06PM +0530, Nitin Rawat wrote:
>>
>>
>> On 5/4/2025 9:07 PM, Dmitry Baryshkov wrote:
>>> On Sat, May 03, 2025 at 09:54:35PM +0530, Nitin Rawat wrote:
>>>> Rename qmp_ufs_disable to qmp_ufs_power_off to better represent its
>>>> functionality. Additionally, move the qmp_ufs_exit() call inside
>>>> qmp_ufs_power_off to preserve the functionality of .power_off.
>>>>
>>>> There is no functional change.
>>>>
>>>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>> ---
>>>>    drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 30 +++++++++----------------
>>>>    1 file changed, 11 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>> index 94095393148c..c501223fc5f9 100644
>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>> @@ -1835,6 +1835,15 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
>>>>    	return 0;
>>>>    }
>>>>
>>>> +static int qmp_ufs_exit(struct phy *phy)
>>>> +{
>>>> +	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>>>> +
>>>> +	qmp_ufs_com_exit(qmp);
>>>
>>> Just inline it, unless you have any other plans.
>>
>> Hi Dmitry,
>>
>> I have inlined qcom_ufs_com_exit in patch #7 of the same series. I separated
>> it into a different patch to keep each patch simpler.
> 
> You have inlined qmp_ufs_com_exit() contents. Here I've asked you to
> inline qmp_ufs_exit(), keeping qmp_ufs_com_exit() as is.


Sure Dmitry. I'll update this in next patchset. Thanks
> 
>>
>> Could you please review patch #7 and share your thoughts.
>>
>> [PATCH V4 07/11] phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and Inline
>> qmp_ufs_com_exit().
>>
>>
>> Regards,
>> Nitin
>>
>>
>>>
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>    static int qmp_ufs_power_off(struct phy *phy)
>>>>    {
>>>>    	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>>>> @@ -1851,28 +1860,11 @@ static int qmp_ufs_power_off(struct phy *phy)
>>>>    	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>>>>    			SW_PWRDN);
>>>>
>>>> -	return 0;
>>>> -}
>>>> -
>>>> -static int qmp_ufs_exit(struct phy *phy)
>>>> -{
>>>> -	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>>>> -
>>>> -	qmp_ufs_com_exit(qmp);
>>>> +	qmp_ufs_exit(phy);
>>>>
>>>>    	return 0;
>>>>    }
>>>>
>>>> -static int qmp_ufs_disable(struct phy *phy)
>>>> -{
>>>> -	int ret;
>>>> -
>>>> -	ret = qmp_ufs_power_off(phy);
>>>> -	if (ret)
>>>> -		return ret;
>>>> -	return qmp_ufs_exit(phy);
>>>> -}
>>>> -
>>>>    static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
>>>>    {
>>>>    	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>>>> @@ -1921,7 +1913,7 @@ static int qmp_ufs_phy_init(struct phy *phy)
>>>>    static const struct phy_ops qcom_qmp_ufs_phy_ops = {
>>>>    	.init		= qmp_ufs_phy_init,
>>>>    	.power_on	= qmp_ufs_power_on,
>>>> -	.power_off	= qmp_ufs_disable,
>>>> +	.power_off	= qmp_ufs_power_off,
>>>>    	.calibrate	= qmp_ufs_phy_calibrate,
>>>>    	.set_mode	= qmp_ufs_set_mode,
>>>>    	.owner		= THIS_MODULE,
>>>> --
>>>> 2.48.1
>>>>
>>>
>>
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 


