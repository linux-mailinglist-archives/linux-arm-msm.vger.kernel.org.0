Return-Path: <linux-arm-msm+bounces-54816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E50A94562
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 22:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C94F1897003
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 20:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE801DE2BD;
	Sat, 19 Apr 2025 20:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oOJZKpkk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA92188CDB;
	Sat, 19 Apr 2025 20:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745093362; cv=none; b=hjF1O5frnHX4s5Tnao944XYYNjRO/6Klb66Ug0mHPHYSgZ41j83Lfu9cJ4g2uxGKcYq5HeE2ftk0AJVM7oAC4QVUCSmAfWjgdnMjiNaCn2psTejCZIJVd6ABvXKhZfV64U9vxabAeKDwYU3BluQ7k3ElKRJQGQxRR2pjYJf7kIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745093362; c=relaxed/simple;
	bh=9XikV973ZL6dz8kwzy1HjcE0B3XPQdFSVDliDolOyw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XTbGdIGbgvhZZNsXqUHhuZZLDebJgqKtbjbOTF2bQ7zsSvIHnHCOkExurhYGQrPhnVDIeiCb5au1ThiQItoXM3DFg1AzOJcxse7vTDbFx95CM04L2VShEoKvHZGwrcpLzQFLCU3OZbtBwjM2NQRa+iGz8YWAwrqtbABTNvlkf84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oOJZKpkk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53JJqtWE024291;
	Sat, 19 Apr 2025 20:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6+NpKZ7gqgcoEwQPOm/EI7HAda5WGlRaDZuMVRMruU=; b=oOJZKpkkUCWsSqJY
	ymau2aZ4Q+Fz1XgEOG5pbPP1fNhQN0GnS35oRtqeyhpWHktTsTYbfy6fOZUuULbO
	TVMgepDgZ9ltKxtZjA7aAUmR0A6j0PN/WcfBMMpeG9k0jwgiC6nGGO06+d5DjrfJ
	e791o5ULiKyQphV29KMau3PpfHkUqZGgz5ZJf0YT/JqllRZ5OCN7C2NzPa0yIOH5
	bogvECOOkC8zy/VhWajquLiPurSln8aQVQ37YxVueAqxZopMp/jRVzwacvMfevEo
	YQKbFEX4p5EdbYgz8pIJiFJrw/dOQ5ALjCXguk5h6HUFhsCKmSxHRYUs9LHcqj9A
	IZxkag==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435j91hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Apr 2025 20:08:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53JK8qvG024707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Apr 2025 20:08:52 GMT
Received: from [10.216.62.173] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 19 Apr
 2025 13:08:45 -0700
Message-ID: <0d763853-5b1a-433e-9fa1-23ea0184b9bb@quicinc.com>
Date: Sun, 20 Apr 2025 01:38:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/9] phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
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
 <20250410090102.20781-6-quic_nitirawa@quicinc.com>
 <zvc3gf7mek7u46wlcrjak3j2hihj4vfgdwpdzjhvnxxowuyvsr@hlra5bmz5ign>
 <4557abf9-bcd2-4a06-8161-43ad5047b277@quicinc.com>
 <CAO9ioeXyDWOhe1cbGO_tR=ppZd1aC0GSdeMzQjir4XmDRMQ3Jg@mail.gmail.com>
 <64216a90-e2e0-435c-87bc-388c72a702c0@quicinc.com>
 <sajcoh34gyfcvhik3yairil65guvp2rt2xdmbmlpmlcjvst5ci@qojbxhmrnrxj>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <sajcoh34gyfcvhik3yairil65guvp2rt2xdmbmlpmlcjvst5ci@qojbxhmrnrxj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=680402d6 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=JfrnYn6hAAAA:8 a=COk6AnOGAAAA:8 a=PNvhjDC_c5CfWSYif1gA:9
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: O95NvhS4UrMRpq3tkLm5GO6Yujv1slXV
X-Proofpoint-ORIG-GUID: O95NvhS4UrMRpq3tkLm5GO6Yujv1slXV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-19_08,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504190168



On 4/14/2025 1:13 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 14, 2025 at 12:58:48PM +0530, Nitin Rawat wrote:
>>
>>
>> On 4/11/2025 4:26 PM, Dmitry Baryshkov wrote:
>>> On Fri, 11 Apr 2025 at 13:42, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 4/11/2025 1:39 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, Apr 10, 2025 at 02:30:58PM +0530, Nitin Rawat wrote:
>>>>>> Simplify the qcom ufs phy driver by inlining qmp_ufs_com_init() into
>>>>>> qmp_ufs_power_on(). This change removes unnecessary function calls and
>>>>>> ensures that the initialization logic is directly within the power-on
>>>>>> routine, maintaining the same functionality.
>>>>>
>>>>> Which problem is this patch trying to solve?
>>>>
>>>> Hi Dmitry,
>>>>
>>>> As part of the patch, I simplified the code by moving qmp_ufs_com_init
>>>> inline to qmp_ufs_power_on, since qmp_ufs_power_on was merely calling
>>>> qmp_ufs_com_init. This change eliminates unnecessary function call.
>>>
>>> You again are describing what you did. Please start by stating the
>>> problem or the issue.
>>>
>>>>
>> Hi Dmitry,
>>
>> Sure, will update the commit with "problem" first in the next patchset when
>> I post.
> 
> Before posting the next iteration, maybe you can respond inline? It well
> might be that there is no problem to solve.a

Hi Dmitry,

Apologies for late reply , I just realized I missed responding to your 
comment on this patch.


There is no functional "problem" here.
===================================================================
The qmp_ufs_power_on() function acts as a wrapper, solely invoking 
qmp_ufs_com_init(). Additionally, the code within qmp_ufs_com_init() 
does not correspond well with its name.

Therefore, to enhance the readability and eliminate unnecessary function 
call inline qmp_ufs_com_init() into qmp_ufs_power_on().

There is no change to the functionality.
==================================================================


I agree with you that there isn't a significant issue here. If you 
insist, I'm okay with skipping this patch. Let me know your thoughts.


Regards,
Nitin


> 
>>
>> Thanks,
>> Nitin
>>
>>>> Regards,
>>>> Nitin
>>>>
>>>>
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>>>> ---
>>>>>>     drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 44 ++++++++++---------------
>>>>>>     1 file changed, 18 insertions(+), 26 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>>>> index 12dad28cc1bd..2cc819089d71 100644
>>>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>>>> @@ -1757,31 +1757,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
>>>>>>        qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>>>>>>     }
>>>>>>
>>>>>> -static int qmp_ufs_com_init(struct qmp_ufs *qmp)
>>>>>> -{
>>>>>> -    const struct qmp_phy_cfg *cfg = qmp->cfg;
>>>>>> -    void __iomem *pcs = qmp->pcs;
>>>>>> -    int ret;
>>>>>> -
>>>>>> -    ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>>>>>> -    if (ret) {
>>>>>> -            dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
>>>>>> -            return ret;
>>>>>> -    }
>>>>>> -
>>>>>> -    ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
>>>>>> -    if (ret)
>>>>>> -            goto err_disable_regulators;
>>>>>> -
>>>>>> -    qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
>>>>>> -
>>>>>> -    return 0;
>>>>>> -
>>>>>> -err_disable_regulators:
>>>>>> -    regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>>>>>> -
>>>>>> -    return ret;
>>>>>> -}
>>>>>>
>>>>>>     static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>>>>>>     {
>>>>>> @@ -1799,10 +1774,27 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>>>>>>     static int qmp_ufs_power_on(struct phy *phy)
>>>>>>     {
>>>>>>        struct qmp_ufs *qmp = phy_get_drvdata(phy);
>>>>>> +    const struct qmp_phy_cfg *cfg = qmp->cfg;
>>>>>> +    void __iomem *pcs = qmp->pcs;
>>>>>>        int ret;
>>>>>> +
>>>>>>        dev_vdbg(qmp->dev, "Initializing QMP phy\n");
>>>>>>
>>>>>> -    ret = qmp_ufs_com_init(qmp);
>>>>>> +    ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>>>>>> +    if (ret) {
>>>>>> +            dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
>>>>>> +            return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
>>>>>> +    if (ret)
>>>>>> +            goto err_disable_regulators;
>>>>>> +
>>>>>> +    qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
>>>>>> +    return 0;
>>>>>> +
>>>>>> +err_disable_regulators:
>>>>>> +    regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>>>>>>        return ret;
>>>>>>     }
>>>>>>
>>>>>> --
>>>>>> 2.48.1
>>>>>>
>>>>>
>>>>
>>>
>>>
>>
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 


