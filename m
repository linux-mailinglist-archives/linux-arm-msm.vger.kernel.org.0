Return-Path: <linux-arm-msm+bounces-55122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3A3A988CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18BD31B65A01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293D126FDBF;
	Wed, 23 Apr 2025 11:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X4SBt5lq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623921B0F31;
	Wed, 23 Apr 2025 11:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745408642; cv=none; b=dZbpQ0+5zRof/NJ3irpTsLp2fIPnjlMheZNTPJQ6M73+vou/tSIwW5VW4Wo2lWNNTNEDUVjjyFhTkQVnYTdNOgSEAhdR6GJ1qJGWDtpkifoQJXgjxWs7Sr+74cRhorZwv7Pctk7v+0Q9AmyYK9kFje354F4zyowKHiBhhoVgcJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745408642; c=relaxed/simple;
	bh=JIjwVKXtAeB4GqTeChK7VSPESKKk4P+F60P8EOVY2+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OS1+xLUm29mYvUuZdHifveufGhkUtJspoC7yr/+mJRp21fXoF68uVynnBU8vSpbUV0v3e4U+SnXiQ1IUa5Ii5pYdwpWloXJEKRqE+Vs47/pNfSp1ojK4GymI6eo6IF9lq6+uTUOfsRV9bDT68vQNehXS9FKt5QreOBdzIOC8Mcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X4SBt5lq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NApPoD023624;
	Wed, 23 Apr 2025 11:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cTJDhj6eqMoV//Notj+3amni4JS+GXeRT+hpB9+jKIY=; b=X4SBt5lq1093olXm
	HMkv+NV/FRHqvUPcB6EiWokGCRhQqe+NMncaIYa5LAci8PCclba+lLXTbDLPfiGg
	MGNA3sL3oV1WfdUqmzdZTGERe/r6O3jC9c6wU1rJaii94R4ncsIwcvCFHSxOlIxq
	9gbAKw5qTxKolJCQnosCjKZYAZp5LRHZGbJ39KOoC1zMSpWU9z2aY1TKujZ/nI3j
	NpPRzAIA3e2DkXzsL+QZrilbQ/+E0O5xPDnHA5ORxs9E38wUxlfO41UDWzVA1+bO
	np/f5WmqmZ6bg6K0TR+dIINbcg64p7181NjSJGviGlfbuKQazLUga9VKO+RIbVN3
	yTs28Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2a0a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 11:43:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NBhcnb012881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 11:43:38 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 04:43:33 -0700
Message-ID: <200007be-fe80-43b6-9ce2-4e4695265599@quicinc.com>
Date: Wed, 23 Apr 2025 17:13:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/9] phy: qcom-qmp-ufs: Refactor UFS PHY reset
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <bjorande@quicinc.com>,
        <neil.armstrong@linaro.org>, <quic_rdwivedi@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-5-quic_nitirawa@quicinc.com>
 <pur4y63xhfmqlyymg4pehk37ry4gg22h24zceoqjbsxp3hj4yf@4kptase3c4qp>
 <317faeaa-3130-4e28-8c5d-441a76aa79b4@quicinc.com>
 <CAO9ioeXnnbNzriVOYPUeBiWdrPfYUcMk+pVWYv0vZpJbFeByoQ@mail.gmail.com>
 <2820908b-4548-4e0a-94b2-6065cb5ff1f3@quicinc.com>
 <c2ec6b7c-421d-43c3-8c0a-de4f7bdd867c@oss.qualcomm.com>
 <a24ff510-2afd-4aa7-a026-199fb6d87287@quicinc.com>
 <CAO9ioeUDzYLMvqmsOQ-VfgLQLavHqn=QVYxyHzetjSfmhjKFjw@mail.gmail.com>
 <1a623099-40bb-4884-8d93-132138a4150b@quicinc.com>
 <b7027077-e9a3-462b-92a8-684a42d23604@oss.qualcomm.com>
 <7a0eb7bf-d6d9-4e8e-829b-2df726651725@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <7a0eb7bf-d6d9-4e8e-829b-2df726651725@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IuJ8B3mIAby0BkYVCTLiNaxImH6OLJWS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA4MSBTYWx0ZWRfXzsU/pbRPi/w2 MdNdeXDa2N0tSfe8q9hS1CWANMq5KMtQ1GGaqNzTNcTTlinqhnIU8nDxWipjm02l82dFH4O601A 4EbNzkMQrWpYdqgWy/N4aEtA2E4vK0AQh4R/f590Q20teb8Fre6htN7du7MKu1Ck65A46uz6Azm
 Sxh1odAZLTZbUysShiFcuWzgNt0ObVaBFrx5QguGOHTSe2zP2hpfIT/1+GQ7TIu8sPKtF2gfk/e hg2PBudFe8p5xgCm1TQx6pTcoyXUbqqG7bpG1MWO0HIXL+l81PemadnJ2jEFSa52+ikH+Z+c+bX 2zE4S9kFloeCB7OCHk+D3VZFB9uombihez8r1bdZHkxOgbMQv+agCSm7Jj3ZOaZOISroQjvtXd2
 rHd26+URXVK+20beD6tfy6t3RUIyZWz5MKGCW8I3k50k78wrjFL4G7wpP7BHsuNus+G1I8g8
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6808d26b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=I0qkcEgCn53fLrtcp2gA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: IuJ8B3mIAby0BkYVCTLiNaxImH6OLJWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230081



On 4/23/2025 4:51 PM, Konrad Dybcio wrote:
> On 4/23/25 1:09 PM, Konrad Dybcio wrote:
>> On 4/16/25 2:26 PM, Nitin Rawat wrote:
>>>
>>>
>>> On 4/16/2025 5:43 PM, Dmitry Baryshkov wrote:
>>>> On Wed, 16 Apr 2025 at 12:08, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 4/15/2025 2:59 PM, Dmitry Baryshkov wrote:
>>>>>> On 14/04/2025 23:34, Nitin Rawat wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 4/11/2025 4:38 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Fri, 11 Apr 2025 at 13:50, Nitin Rawat <quic_nitirawa@quicinc.com>
>>>>>>>> wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 4/11/2025 1:38 AM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Thu, Apr 10, 2025 at 02:30:57PM +0530, Nitin Rawat wrote:
>>>>>>>>>>> Refactor the UFS PHY reset handling to parse the reset logic only
>>>>>>>>>>> once
>>>>>>>>>>> during probe, instead of every resume.
>>>>>>>>>>>
>>>>>>>>>>> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
>>>>>>>>>>> qmp_ufs_probe to avoid unnecessary parsing during resume.
>>>>>>>>>>
>>>>>>>>>> How did you solve the circular dependency issue being noted below?
>>>>>>>>>
>>>>>>>>> Hi Dmitry,
>>>>>>>>> As part of my patch, I moved the parsing logic from qmp_phy_power_on to
>>>>>>>>> qmp_ufs_probe to avoid unnecessary parsing during resume. I'm uncertain
>>>>>>>>> about the circular dependency issue and whether if it still exists.
>>>>>>>>
>>>>>>>> It surely does. The reset controller is registered in the beginning of
>>>>>>>> ufs_qcom_init() and the PHY is acquired only a few lines below. It
>>>>>>>> creates a very small window for PHY driver to probe.
>>>>>>>> Which means, NAK, this patch doesn't look acceptable.
>>>>>>>
>>>>>>> Hi Dmitry,
>>>>>>>
>>>>>>> Thanks for pointing this out. I agree that it leaves very little time
>>>>>>> for the PHY to probe, which may cause issues with targets where
>>>>>>> no_pcs_sw_reset is set to true.
>>>>>>>
>>>>>>> As an experiment, I kept no_pcs_sw_reset set to true for the SM8750,
>>>>>>> and it caused bootup probe issues in some of the iterations I ran.
>>>>>>>
>>>>>>> To address this, I propose updating the patch to move the
>>>>>>> qmp_ufs_get_phy_reset call to phy_calibrate, just before the
>>>>>>> reset_control_assert call.
>>>>>>
>>>>>> Will it cause an issue if we move it to phy_init() instead of
>>>>>> phy_calibrate()?
>>>>>
>>>>> Hi Dmitry,
>>>>>
>>>>> Thanks for suggestion.
>>>>> Phy_init is invoked before phy_set_mode_ext and ufs_qcom_phy_power_on,
>>>>> whereas calibrate is called after ufs_qcom_phy_power_on. Keeping the UFS
>>>>> PHY reset in phy_calibrate introduces relatively more delay, providing
>>>>> more buffer time for the PHY driver probe, ensuring the UFS PHY reset is
>>>>> handled correctly the first time.
>>>>
>>>> We are requesting the PHY anyway, so the PHY driver should have probed
>>>> well before phy_init() call. I don't get this comment.
>>>>
>>>>>
>>>>> Moving the calibration to phy_init shouldn't cause any issues. However,
>>>>> since we currently don't have an initialization operations registered
>>>>> for init, we would need to add a new PHY initialization ops if we decide
>>>>> to move it to phy_init.
>>>>
>>>> Yes. I don't see it as a problem. Is there any kind of an issue there?
>>>
>>> No issues. In my next patchset, I would add a new init ops registered for qcom phy and move get ufs phy reset handler to it.
>>
>> I don't really like this circular dependency.
>>
>> So I took a peek at the docs and IIUC, they say that the reset coming
>> from the UFS controller effectively does the same thing as QPHY_SW_RESET.
>>
>> Moreover, the docs mention the controller-side reset should not be used
>> anymore (as of at least X1E & SM8550). Docs for MSM8996 (one of the
>> oldest platforms that this driver supports) also don't really mention a
>> hard dependency on it.
>>
>> So we can get rid of this mess entirely, without affecting backwards
>> compatibility even, as this is all contained within the PHYs register
>> space and driver.
> 
> Well hmm, certain platforms (with no_pcs_sw_reset) don't agree.. some
> have GCC-sourced resets, but I'm not 100% sure how they affect the CSR
> state

Hi Konrad,

I agree with you, but there are still some targets (Sdm845, SM7150, 
SM6125, and MSM8996) that have upstream support and require a 
controller-side GCC reset. Therefore to align with HPG we can't remove
gcc reset for these targets.
Please let me know your opinions.

Regards,
nitin


> 
> Konrad


