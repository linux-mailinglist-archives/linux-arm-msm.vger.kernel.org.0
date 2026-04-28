Return-Path: <linux-arm-msm+bounces-104844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHThA50Y8GmNOQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 04:17:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70147CAB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 04:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F05313020AB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 02:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9081838E5DA;
	Tue, 28 Apr 2026 02:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XOj2SBZe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6FE1B4223;
	Tue, 28 Apr 2026 02:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777342618; cv=none; b=bDhn+/GtJ/z3XDr/gXihmYfmTs617bsOWLnDlx45qHuWgeR4LgHBJzVxX3+SuUdy4nyWiJBuRgnxbYjEZAdPlo45KOF8fDTqwIUwBzK+1KZCSDRjQEmo8NvLVCjWaUCmkSNxPJeSxiEWjDOVjYEIWe1uzWpw3uQhENbl+iqdRos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777342618; c=relaxed/simple;
	bh=gjtJSvuxk2+nAubxyRoH0u6RI7n2eEu+AkWiaaWBi04=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VisdKv4+uooqEIT50LlMzpdyRGFtbmInhylvHGY+jYH68tRkTZb1DQfurGEVXNsEirGBmP5V+1QlMVartqHSw2/M2dO91Y5d6kQfsGxrEcrctfy25Omyn8TczrqrMNSMijXx1Ijr2oO+9Y94eBHxbxyytDSNLTjjjJewIL473Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XOj2SBZe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S0OIXJ440498;
	Tue, 28 Apr 2026 02:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cV1BCnsuUa4ahFfJrpke28rGo2z4kYcKdI0ooHoKqtw=; b=XOj2SBZeqfUE/fwF
	F2Ja1MLAbDZD/+DNg0P/tTZKFoCAJe2O463MXzNs9JA8trJA0e9A6e00TQtx5W/G
	t2cRdVq6pCkdlDxEdlqvyoPHFaSrIDd8AXOC8S1Ywt25TZuTeZmIYbaIH8SfmPey
	quxMAQplE3la4KUaWRJC2nEVkEGVPLCmXJqjAEeoTxiJHWGz6ZPl9MZ91W4iHx2m
	PQKHomyCvk0gl3PhDvyJk6QnWEL6HYqUP0IQzNjQ4Aqz8bBl4ejNnLq2anRjMb5w
	3XQK9GCJLMQz8qm8+Arq6dNqXl1gaFFi2Csq/a0MaXwfb9g0hG2VdMIxv0X1KdCS
	bpJB6w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac4264s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 02:16:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 63S2Gm53013124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 02:16:48 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 19:16:45 -0700
Message-ID: <d862f03e-87df-41fe-9ff9-6d2bfad1235e@quicinc.com>
Date: Tue, 28 Apr 2026 10:16:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] coresight: cti: encode trigger register index in
 register offsets
To: Leo Yan <leo.yan@arm.com>, Yingchao Deng <yingchao.deng@oss.qualcomm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan
	<jie.gan@oss.qualcomm.com>,
        Yingchao Deng <quic_yingdeng@quicinc.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-2-23b900a4902f@oss.qualcomm.com>
 <20260427174800.GB16537@e132581.arm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20260427174800.GB16537@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-GUID: 7a7ZrWO6uzj8_ad-ZFMd1I12SFGJw56S
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f01890 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IYfcq8Jd9aPnBDRZR34A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 7a7ZrWO6uzj8_ad-ZFMd1I12SFGJw56S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAyMCBTYWx0ZWRfX1lR7ktILEJsy
 XYJp5HoC40j7ni5DylURFYEzMPERCGFoT39l6jy6B4s+cNswR5aNAQsYGQGj3aIlYL+OZkHJE6R
 h2tEN7ZWCoZVahqNEOWoYu0LX/ydNnCfrgAXEB+RoO/6y706O7LhHFSkR2frLmupn3saPhJmIXN
 TaAmKC+sC5C08Q8sVvJYKn3QD5jZCJPF85dBfG4uBGGrYUwDnCD4cycwCr5HD8lM1buLRzuvklY
 aQZv/7nYgzewau1hys7utwcl0gXunTCGuzcIDvPZ9Tx2/H1lcwNjvjH/abiU+qDqQk5SPAu8aRJ
 SY3Ev5DG1fWqLN4wK3Ww6KATTSnjoWgJAFR3tMPAY0XhMV/uRNyoJomzb0E3AscaZvPVpcPVf0r
 /uV7b6gGI0gEgztmR8+6LrKPHZtPNC/tfIj1721P3TQwbmJ0qVAW789XMIvwKUaCc0S6b2NMuKv
 P7aIjLJtvjFXuHFguAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280020
X-Rspamd-Queue-Id: 5E70147CAB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104844-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:dkim,quicinc.com:mid];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_yingdeng@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/28/2026 1:48 AM, Leo Yan wrote:
> On Sun, Apr 26, 2026 at 05:44:39PM +0800, Yingchao Deng wrote:
>> Introduce a small encoding to carry the register index together with the
>> base offset in a single u32, and use a common helper to compute the final
>> MMIO address. This refactors register access to be based on the encoded
>> (reg, nr) pair, reducing duplicated arithmetic and making it easier to
>> support variants that bank or relocate trigger-indexed registers.
>>
>> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-cti-core.c  | 31 +++++++++++++++--------
>>   drivers/hwtracing/coresight/coresight-cti-sysfs.c |  4 +--
>>   drivers/hwtracing/coresight/coresight-cti.h       | 16 ++++++++++--
>>   3 files changed, 36 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
>> index 4e7d12bd2d3e..c4cbeb64365b 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
>> @@ -42,6 +42,14 @@ static DEFINE_MUTEX(ect_mutex);
>>   #define csdev_to_cti_drvdata(csdev)	\
>>   	dev_get_drvdata(csdev->dev.parent)
>>   
>> +static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, int reg)
>> +{
>> +	u32 offset = CTI_REG_CLR_NR(reg);
>> +	u32 nr = CTI_REG_GET_NR(reg);
>> +
>> +	return drvdata->base + offset + sizeof(u32) * nr;
>> +}
> Could you try below change, which is more straightforward?
>
>    static void __iomem *__reg_addr(struct cti_drvdata *drvdata, int off,
>                                    int index)
>    {
>    	return drvdata->base + offset + sizeof(u32) * index;
>    }
>
>    #define reg_addr(drvdata, off)                 \
>          __reg_addr((drvdata), (off), 0)
>
>    #define reg_index_addr(drvdata, off, i)        \
>          __reg_addr((drvdata), (off), (i))
>
>> +
>>   /* write set of regs to hardware - call with spinlock claimed */
>>   void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>>   {
>> @@ -55,16 +63,17 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>>   
>>   	/* write the CTI trigger registers */
>>   	for (i = 0; i < config->nr_trig_max; i++) {
>> -		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
>> +		writel_relaxed(config->ctiinen[i],
>> +			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIINEN, i)));
>                  writel_relaxed(config->ctiinen[i],
>                                 reg_index_addr(drvdata, CTIINEN, i));
>
>>   		writel_relaxed(config->ctiouten[i],
>> -			       drvdata->base + CTIOUTEN(i));
>> +			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIOUTEN, i)));
>                  writel_relaxed(config->ctiouten[i],
>                                 reg_index_addr(drvdata, CTIOUTEN, i));
>
> [...]
Will try.

Thanks,
Yingchao
>> +/*
>> + * Encode CTI register offset and register index in one u32:
>> + *   - bits[0:11]  : base register offset (0x000 to 0xFFF)
>> + *   - bits[24:31] : register index (nr)
>> + */
>> +#define CTI_REG_NR_MASK			GENMASK(31, 24)
>> +#define CTI_REG_GET_NR(reg)		FIELD_GET(CTI_REG_NR_MASK, (reg))
>> +#define CTI_REG_SET_NR_CONST(reg, nr)	((reg) | FIELD_PREP_CONST(CTI_REG_NR_MASK, (nr)))
>> +#define CTI_REG_SET_NR(reg, nr)		((reg) | FIELD_PREP(CTI_REG_NR_MASK, (nr)))
>> +#define CTI_REG_CLR_NR(reg)		((reg) & (~CTI_REG_NR_MASK))
> I know this might come from my suggestion, and it is also will be
> heavily used in patch 04.  We can have strightforward way to
> implement this, please drop these macros.
>
> I will reply in patch 04 separately.  Sorry my review might cause
> extra effort.
>
> Thanks,
> Leo

