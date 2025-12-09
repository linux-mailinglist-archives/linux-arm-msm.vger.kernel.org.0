Return-Path: <linux-arm-msm+bounces-84775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA05CAFF95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 13:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C3BF300960F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 12:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0E5322753;
	Tue,  9 Dec 2025 12:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l2iqCT2C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77056224B0D;
	Tue,  9 Dec 2025 12:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765284718; cv=none; b=QcYhdIdROGZURjLTCuKR+6AfRKuKePNEgIQPeBnaaLQIzvVj9yfu3NYGk04aImewNtnUCyDV1nl/B94JVDi7K7spFPkfyU4w8ha9ZrEGHz/ieaa2KvZmvpqMPHiftHAdD2vjxGw7EV182B83TdOvJPVNWJeakSzsVxNYpHfNRG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765284718; c=relaxed/simple;
	bh=afkjml2djHl3gxQamKG0OxDtQ8Y3Aj7fXQtwTKjdb1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n+BWKKwwWXhlhdPgnsAynjJYnHHsAeWH095RJjAALbhIAkao062vUFFTt4WqLV/AQuIVAGsclG86H94IgHnziogXNfd8bSIi4Qfyi2+20/ACr199VEZrCas7lThmgMNbF4DWRzPixaofSfK29LY04KqDjJhdQoHtdT454Xp383E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l2iqCT2C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B99N77X3474206;
	Tue, 9 Dec 2025 12:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcopow1qSFwvd9fNyuwAU04J2biGOz8GFQZ+auPheQ0=; b=l2iqCT2CTcn3Zh8X
	BDZ9mYVHruwPFB7UPFktDAJNElQFs5R+vw63qC4y14mdLOBTL5DKei4wA4KhrRZW
	0fcusZj1N7gKdHIzemiThzgsjXLKlax+vR1MemnQQrqlWy/3eB9Itvojk6DFZgCe
	ySe5RGa5y4ty9+nuGMIXh4dWa7X78nZW1pVn4R+Kup0OlnL2PKJFvYeaAiyruJbj
	UywPs1kjEZZbNQFi3Ki01Ir1QF0lObhUibEmAkyVq3F9O4DECJLoGI+6VdW/X6dV
	si0/H1L2zc7RZ0zzqiN/3Kuwclj7h71XDdqwz9uhWZtkZQo981/AYA6NZo0csk/J
	hGB3zw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axa0bsvgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 12:51:47 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5B9CpkNZ014161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Dec 2025 12:51:46 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 04:51:42 -0800
Message-ID: <1fbe140c-b960-4f13-83e2-b0a0733a67bc@quicinc.com>
Date: Tue, 9 Dec 2025 20:51:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Leo Yan <leo.yan@arm.com>, Yingchao Deng <quic_yingdeng@quicinc.com>
CC: <mike.leach@linaro.org>, <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <james.clark@linaro.org>,
        <jinlong.mao@oss.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_jinlmao@quicinc.com>, <suzuki.poulose@arm.com>,
        <tingwei.zhang@oss.qualcomm.com>
References: <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
 <20251209081649.105623-1-yingchao.deng@oss.qualcomm.com>
 <20251209121916.GT724103@e132581.arm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20251209121916.GT724103@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5MyBTYWx0ZWRfX2X19jiaI8qzD
 gzqAC7hTx3GgLYSTltpLcD/NdPWx+1LJAYPu2oDw5iJO3HSzCPAZZH/ZcaNgYg+7ZgEN3HliPdA
 43kUp4AO4+DrgBnWupsCq0RMxmNO2NIWHhq7rznF0EXOie7RMup+V5q2SfX//DjOiyJpuBtVQ1T
 LQzkMcu0DaVOI6fxtThkkbhW9yQE3Gs/CcVna4H8lz60DJOtfIMwo18akRcNbBGpxV3fUMng4ze
 7JdQoPTQ+oTuP0e9+Maut6hsPvM1d+47EwWnL2wYODvUUBp54WW3Eps0zyPceDsjc6IOv4StBn2
 L0LxySKmgjPJkutTXA2Jcb1LmUVewKaeiE8ANKtpolQOTPDXCQ3i+SR1OT6Z+R0GAMIn0apsxYG
 h1zTeuI0hyTPkNtqSJ39icJBUdYZVA==
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69381b63 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=uuXvdfZ7YpPWpv2YKKMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: a_YW54CdoEYm6JHiOuscNg71q_wUEHUl
X-Proofpoint-ORIG-GUID: a_YW54CdoEYm6JHiOuscNg71q_wUEHUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090093

Hi Leo,

On 12/9/2025 8:19 PM, Leo Yan wrote:
> Hi Yingchao,
>
> On Tue, Dec 09, 2025 at 04:16:28PM +0800, Yingchao Deng wrote:
>> Hi Leo & Mike
>>
>> Based on Leo’s suggestions, I created a new patch, but there are three points that do not fully align with his recommendations:
>>
>>      1. The helper function for returning the register address now returns only the offset, because returning the full address would conflict with cti_write_single_reg.
> No need to change each callsite for cti_write_single_reg().  You could
> update cti_write_single_reg() instead:
>
>    void cti_write_single_reg(struct cti_drvdata *drvdata,
>                              int offset, u32 value)
>    {
>            CS_UNLOCK(drvdata->base);
>            writel_relaxed(value, cti_reg_addr(drvdata, offset));
>            CS_LOCK(drvdata->base);
>    }

However, since we also need to handle cti_reg_addr_with_nr, it will be 
necessary to add an additional parameter "nr" to cti_write_single_reg?

Thanks
Yingchao
>>      2. For registers such as triginstatus1...3, I defined additional macros CTITRIGINSTATUS1...3. This is because CTITRIGINSTATUS + 0x4 equals CTITRIGOUTSTATUS, and to avoid conflicts with existing macros, I chose numbers starting from 0x1000 for the new definitions.
> To avoid the register naming pollution, please don't define the common
> names but only used for Qcom registers.
>
> AFAIK, you even don't need to define these registers.  These registers
> are only used for sysfs knobs, we can define an extra "nr" field (e.g.,
> bits[31..28] for indexing these registers, something like:
>
>    #define CIT_REG_NR_SHIFT          28
>    #define CIT_REG_NR_MASK           GENMASK(31, 28)
>    #define CTI_REG_GET_NR(reg)       FIELD_GET(CIT_REG_NR_MASK, (reg))
>    #define CTI_REG_SET_NR(reg, nr)   ((reg) | FIELD_PREP(CIT_REG_NR_MASK, (nr))
>
>    static struct attribute *coresight_cti_regs_attrs[] = {
>    ...
>      coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
>      coresight_cti_reg(triginstatus1, CTI_REG_SET_NR(CTITRIGINSTATUS, 1)),
>      coresight_cti_reg(triginstatus2, CTI_REG_SET_NR(CTITRIGINSTATUS, 2)),
>      coresight_cti_reg(triginstatus3, CTI_REG_SET_NR(CTITRIGINSTATUS, 3)),
>    ...
>
> Then, you just need to decode "nr" fields in cti_qcom_reg_off().
>
>>      3. Regarding the visibility of attributes for triginstatus1...3, since coresight_cti_reg produces an anonymous variable that cannot be directly referenced, I used coresight_cti_regs_attrs[i] to obtain the attribute corresponding to triginstatus1.
> Okay, I get the meaning for "an anonymous variable" - there have no
> field naming when define attr with the macro coresight_cti_reg().
>
> but you could comparing the attr string?
>
>    if (!strcmp(attr->name, "triginstatus1") ||
>        !strcmp(attr->name, "triginstatus2") ||
>        !strcmp(attr->name, "triginstatus3"))
>        ...
>
> Thanks,
> Leo

