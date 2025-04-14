Return-Path: <linux-arm-msm+bounces-54155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F855A878B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6FF93A53E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 07:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20111F236B;
	Mon, 14 Apr 2025 07:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MaP2Z4Vl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB33817E4;
	Mon, 14 Apr 2025 07:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744615762; cv=none; b=rUugxOZD642V58Vy0SXCKpxOrQU618jujgSwaa6DJgIM+FNgqYIolB4y9OW5iipU7zmF/pRzad2V1/HMTLS8Xroo+PgDfClHE1qju6fj7SeEiSa4a6twlrA6LS6ONY9s9ychuDnXLZh/M4/hCTIh8f/I6/gPmcqLdO+CHjYzscM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744615762; c=relaxed/simple;
	bh=aHvNCoHK+bQPj9s8Zhsq5DocqZfznckwFA1hbIUygEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hCF3YtlrL6eexAvrgiJUA0kinUmLCmjF/ab0QVNCaEBVPOZaDlQkGhR6t3Z0eHRwd1be+098PbNioR4WSklAZj/AQP7JRudlNcTYBgpvoc2yQ3cbJjodY4VJ9bsDHi2HoqFhCn76AHs2IuxO+dO+XIv8ExQN+LkmnXQeOgWywjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MaP2Z4Vl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DLh0xI023917;
	Mon, 14 Apr 2025 07:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OjiGZC52CHR41PNaeeAYyaoOKNBLCL9gKVDy+5mH/7Q=; b=MaP2Z4VlO/5pHNGr
	xO6b1STe/LtNuIjTRkY746iBYIlXuw3IKIgRm3Gl1SjLG4NbOcE+xRiGy3auNCUA
	CwN0mgDaOFOA0OH+s4Xw+vLYCh3T/Q0CDslUgceiXObCwRQyhVViSs3IXJs9Gp0f
	nMtzSeEXf0J1YOKbWO2mAvyrJCnqF1/GM9t+A13ZKuHjMUeRkaUcSeAgrh/On7IO
	Gl0WXgP7qtu6puS/20JL4IDrj+BenXaBbDiMTKfrakN4EmfGM2Xw/3qwKcgfsqEr
	Jq9HVrVSFrMAMHy5iyO1GMHDfwMtkNRoPwkzPwXR1jLpgTzec4NG1d8lImPH2mg5
	9CvByg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj93n0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 07:28:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53E7SuCw015963
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 07:28:56 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 00:28:51 -0700
Message-ID: <64216a90-e2e0-435c-87bc-388c72a702c0@quicinc.com>
Date: Mon, 14 Apr 2025 12:58:48 +0530
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
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <CAO9ioeXyDWOhe1cbGO_tR=ppZd1aC0GSdeMzQjir4XmDRMQ3Jg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FFeMv0htls74xxJvzSSTQWTcZ4qheAHz
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fcb939 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=i59cu7xprNbt8OyMWn4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FFeMv0htls74xxJvzSSTQWTcZ4qheAHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140052



On 4/11/2025 4:26 PM, Dmitry Baryshkov wrote:
> On Fri, 11 Apr 2025 at 13:42, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>>
>>
>>
>> On 4/11/2025 1:39 AM, Dmitry Baryshkov wrote:
>>> On Thu, Apr 10, 2025 at 02:30:58PM +0530, Nitin Rawat wrote:
>>>> Simplify the qcom ufs phy driver by inlining qmp_ufs_com_init() into
>>>> qmp_ufs_power_on(). This change removes unnecessary function calls and
>>>> ensures that the initialization logic is directly within the power-on
>>>> routine, maintaining the same functionality.
>>>
>>> Which problem is this patch trying to solve?
>>
>> Hi Dmitry,
>>
>> As part of the patch, I simplified the code by moving qmp_ufs_com_init
>> inline to qmp_ufs_power_on, since qmp_ufs_power_on was merely calling
>> qmp_ufs_com_init. This change eliminates unnecessary function call.
> 
> You again are describing what you did. Please start by stating the
> problem or the issue.
> 
>>
Hi Dmitry,

Sure, will update the commit with "problem" first in the next patchset 
when I post.

Thanks,
Nitin

>> Regards,
>> Nitin
>>
>>
>>
>>>
>>>>
>>>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>> ---
>>>>    drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 44 ++++++++++---------------
>>>>    1 file changed, 18 insertions(+), 26 deletions(-)
>>>>
>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>> index 12dad28cc1bd..2cc819089d71 100644
>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>>> @@ -1757,31 +1757,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
>>>>       qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>>>>    }
>>>>
>>>> -static int qmp_ufs_com_init(struct qmp_ufs *qmp)
>>>> -{
>>>> -    const struct qmp_phy_cfg *cfg = qmp->cfg;
>>>> -    void __iomem *pcs = qmp->pcs;
>>>> -    int ret;
>>>> -
>>>> -    ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>>>> -    if (ret) {
>>>> -            dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
>>>> -            return ret;
>>>> -    }
>>>> -
>>>> -    ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
>>>> -    if (ret)
>>>> -            goto err_disable_regulators;
>>>> -
>>>> -    qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
>>>> -
>>>> -    return 0;
>>>> -
>>>> -err_disable_regulators:
>>>> -    regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>>>> -
>>>> -    return ret;
>>>> -}
>>>>
>>>>    static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>>>>    {
>>>> @@ -1799,10 +1774,27 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>>>>    static int qmp_ufs_power_on(struct phy *phy)
>>>>    {
>>>>       struct qmp_ufs *qmp = phy_get_drvdata(phy);
>>>> +    const struct qmp_phy_cfg *cfg = qmp->cfg;
>>>> +    void __iomem *pcs = qmp->pcs;
>>>>       int ret;
>>>> +
>>>>       dev_vdbg(qmp->dev, "Initializing QMP phy\n");
>>>>
>>>> -    ret = qmp_ufs_com_init(qmp);
>>>> +    ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>>>> +    if (ret) {
>>>> +            dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
>>>> +    if (ret)
>>>> +            goto err_disable_regulators;
>>>> +
>>>> +    qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
>>>> +    return 0;
>>>> +
>>>> +err_disable_regulators:
>>>> +    regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>>>>       return ret;
>>>>    }
>>>>
>>>> --
>>>> 2.48.1
>>>>
>>>
>>
> 
> 


