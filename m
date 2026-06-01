Return-Path: <linux-arm-msm+bounces-110487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Gc8NIbmHGrKTwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 03:55:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E635618B27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 03:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60EE030078FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 01:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB60D1DDC07;
	Mon,  1 Jun 2026 01:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PEd+vJ4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BBC1A681B;
	Mon,  1 Jun 2026 01:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780278807; cv=none; b=UgXXRZS/fO+UP/vxk5m7x6Nc9Lb9B6eYx7rGDH3FRFTplOFAWVvJBIrzNU8KvZvtweWKkbVqQVBAI8E7+OHP4hv7UaxCXRiEWzxMhKqImfE8//NZbjbd9n95QRMICAiflrS+DhIajn6TULNA6Y/BBRZ4HfI1j/DTiErBpGuVxHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780278807; c=relaxed/simple;
	bh=1tXD2xhmekr5ecO4sDSyF23VCacgqXeiI4y0UZkwGMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FjDzMHAooCNoqrqAwTj8/+WMN4YnC2kn7HFr6B3ihYc7JKOact0mXSi1ngVInxFcHTa7d39yqKdfm3pJ+e07kacQxLZwMS/oKTk2ePWIJaPvB4/FNQneJimdaAwMhlnpbUle7pYhuebNZEqwQBWwUVQi3XU6bKcGZBhlTfojbVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PEd+vJ4e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VMD4BC2718818;
	Mon, 1 Jun 2026 01:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJYbbLzK9EefT64p05anlG1DGPE+frac7uWyR7nFhaY=; b=PEd+vJ4eMz8/T2ey
	ccldjgkQjcxPVqEDnSN1z7jdg/lihUj3phQ7jFoFdAn8rQbq9HM3cysDlYne4sXe
	8YlaadfFeXE8EYCwk9tDgYkEEeRc6pB3EUiRV67QpWLqAMCdpCmxqtruZH3m9dTu
	pJ4+aj/wOOzuuTz+kaWeZ5nZ8dUoMKbeSTACwLwrz0Zmxl6uy8NfaufCXBb/uIQ6
	o0weavbrsnExNIkydUQ2xeDjg3oUcvHqxUHT16G+BOd1IhOXEEi8g1WQ6LbfLUyo
	kPAoQJ0sTjH3OjOksEzIVeFq+ankNpi8WeKyR7Ef+2lgNEUhy/uN26SL9aJtaIkl
	Z+w9NQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7n9hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 01:53:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 6511rEKv008708
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jun 2026 01:53:14 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 31 May
 2026 18:53:11 -0700
Message-ID: <e4b25ab7-a50e-416c-b2dd-1c8e8ef40019@quicinc.com>
Date: Mon, 1 Jun 2026 09:53:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] coresight: cti: use __reg_addr() helper for
 register access
To: Leo Yan <leo.yan@arm.com>, Yingchao Deng <yingchao.deng@oss.qualcomm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <jinlong.mao@oss.qualcomm.com>, <tingwei.zhang@oss.qualcomm.com>,
        <jie.gan@oss.qualcomm.com>, Yingchao Deng
	<quic_yingdeng@quicinc.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-2-d21f4f92c51e@oss.qualcomm.com>
 <20260529144055.GK101133@e132581.arm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20260529144055.GK101133@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-GUID: 3uacSbypB3AIsYf0Uhq2w69alFu_BQNp
X-Proofpoint-ORIG-GUID: 3uacSbypB3AIsYf0Uhq2w69alFu_BQNp
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1ce60b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OcBUPQTv9d3dhylU4BIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAxNiBTYWx0ZWRfX78AoZme1zhjJ
 BZ/KjFBats99yD1iCvEc+w5GrkO4sVBP6NBXH1FHBvAO64CxNpI2wd3Te8nIUkZLxQ65/BGOY9/
 kyF9sSqj35ILb58hIn8KRoxeqnjilODCgDH9ORFXxexczQLL5Y5M6/dVERQ1xrC/WMSq6oI/Ji7
 Pg8bkBSauffZOkvfF1FZgNlY9j1IGCMDLq21Rw4U4OsV4KAez5vzAE0jjH+7cSgtoCwo18mo4Iv
 aq8V7ySK1dY8AspOqlnF4u+cmKolvy6Te3DyoBaNKb1+iBU4EVOf7Z7/FNYOdPe/djXN9r3aplC
 v1feC3Gh6YgROgYVQNL7Wa0dr82Ljel1zTf3aTT7Na+aXTh7LD/GVOZCLdSEuMaIqPvSngouDIJ
 hodtGeJ6I1lTaFOyP3qU2PCWGCa1RL+XKnCqWcavqKzrRlZPtQloumOYx4edwstwlNe0X2Fj+LE
 pFi+JQhWzBYKef3f2eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010016
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-110487-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quicinc.com:mid,quicinc.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_yingdeng@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E635618B27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/29/2026 10:40 PM, Leo Yan wrote:
> On Thu, May 21, 2026 at 08:16:28PM +0800, Yingchao Deng wrote:
>
> [...]
>
>> +static void __iomem *__reg_addr(struct cti_drvdata *drvdata, u32 off,
>> +				u32 index)
>> +{
>> +	return drvdata->base + off + sizeof(u32) * index;
>> +}
>> +
>> +#define reg_addr(drvdata, off)		__reg_addr((drvdata), (off), 0)
>> +#define reg_index_addr(drvdata, off, i)	__reg_addr((drvdata), (off), (i))
>> -u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
>> +u32 cti_read_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index)
>>   {
>> -	int val;
>> +	u32 val;
>>   
>>   	CS_UNLOCK(drvdata->base);
>> -	val = readl_relaxed(drvdata->base + offset);
>> +	val = readl_relaxed(reg_index_addr(drvdata, off, index));
>>   	CS_LOCK(drvdata->base);
>>   
>>   	return val;
>>   }
>>   
>> -void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value)
>> +void cti_write_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index,
>> +			  u32 value)
>>   {
>>   	CS_UNLOCK(drvdata->base);
>> -	writel_relaxed(value, drvdata->base + offset);
>> +	writel_relaxed(value, reg_index_addr(drvdata, off, index));
>>   	CS_LOCK(drvdata->base);
>>   }
> I prefer to move the register helpers into coresight-cti.h and add two
> additional helpers: cti_read_single_reg_index() and
> cti_write_single_reg_index().
>
> I also found circular dependency between coresight-cti.h and qcom-cti.h.
> Since qcom-cti.h only contains register definitions and a small inline
> function for register conversion, we can simply fold it into
> coresight-cti.h and dismiss the circular dependency.
>
> Based on this idea, I played around with the code a bit (see the snippet
> below). Would you be okay with applying this approach to patches 02/03?
> If have any questions, please let me know.
>
> ---8<---
>
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -60,6 +60,31 @@ struct fwnode_handle;
>    */
>   #define CTIINOUTEN_MAX		128
>   
> +/* QCOM CTI extension */
> +#define QCOM_ARCHITECT		0x477
> +
> +#define QCOM_CTIINTACK		0x020
> +#define QCOM_CTIAPPSET		0x004
> +#define QCOM_CTIAPPCLEAR	0x008
> +#define QCOM_CTIAPPPULSE	0x00C
> +#define QCOM_CTIINEN		0x400
> +#define QCOM_CTIOUTEN		0x800
> +#define QCOM_CTITRIGINSTATUS	0x040
> +#define QCOM_CTITRIGOUTSTATUS	0x060
> +#define QCOM_CTICHINSTATUS	0x080
> +#define QCOM_CTICHOUTSTATUS	0x084
> +#define QCOM_CTIGATE		0x088
> +#define QCOM_ASICCTL		0x08C
> +/* Integration test registers */
> +#define QCOM_ITCHINACK		0xE70
> +#define QCOM_ITTRIGINACK	0xE80
> +#define QCOM_ITCHOUT		0xE74
> +#define QCOM_ITTRIGOUT		0xEA0
> +#define QCOM_ITCHOUTACK		0xE78
> +#define QCOM_ITTRIGOUTACK	0xEC0
> +#define QCOM_ITCHIN		0xE7C
> +#define QCOM_ITTRIGIN		0xEE0
> +
>   /**
>    * Group of related trigger signals
>    *
> @@ -222,9 +247,8 @@ int cti_enable(struct coresight_device *csdev, enum cs_mode mode,
>   int cti_disable(struct coresight_device *csdev, struct coresight_path *path);
>   void cti_write_all_hw_regs(struct cti_drvdata *drvdata);
>   void cti_write_intack(struct device *dev, u32 ackval);
> -void cti_write_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index,
> -			  u32 value);
> -u32 cti_read_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index);
>   int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>   			enum cti_trig_dir direction, u32 channel_idx,
>   			u32 trigger_idx);
> @@ -237,6 +261,78 @@ struct coresight_platform_data *
>   coresight_cti_get_platform_data(struct device *dev);
>   const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
>   
> +static inline u32 cti_qcom_reg_off(u32 offset)
> +{
> +	switch (offset) {
> +	case CTIINTACK:		return QCOM_CTIINTACK;
> +	case CTIAPPSET:		return QCOM_CTIAPPSET;
> +	case CTIAPPCLEAR:	return QCOM_CTIAPPCLEAR;
> +	case CTIAPPPULSE:	return QCOM_CTIAPPPULSE;
> +	case CTIINEN:		return QCOM_CTIINEN;
> +	case CTIOUTEN:		return QCOM_CTIOUTEN;
> +	case CTITRIGINSTATUS:	return QCOM_CTITRIGINSTATUS;
> +	case CTITRIGOUTSTATUS:	return QCOM_CTITRIGOUTSTATUS;
> +	case CTICHINSTATUS:	return QCOM_CTICHINSTATUS;
> +	case CTICHOUTSTATUS:	return QCOM_CTICHOUTSTATUS;
> +	case CTIGATE:		return QCOM_CTIGATE;
> +	case ASICCTL:		return QCOM_ASICCTL;
> +	case ITCHINACK:		return QCOM_ITCHINACK;
> +	case ITTRIGINACK:	return QCOM_ITTRIGINACK;
> +	case ITCHOUT:		return QCOM_ITCHOUT;
> +	case ITTRIGOUT:		return QCOM_ITTRIGOUT;
> +	case ITCHOUTACK:	return QCOM_ITCHOUTACK;
> +	case ITTRIGOUTACK:	return QCOM_ITTRIGOUTACK;
> +	case ITCHIN:		return QCOM_ITCHIN;
> +	case ITTRIGIN:		return QCOM_ITTRIGIN;
> +
> +	default:
> +		return offset;
> +	}
> +}
> +
> +static inline void __iomem *__reg_addr(struct cti_drvdata *drvdata,
> +				       u32 off, u32 index)
> +{
> +	if (unlikely(drvdata->is_qcom_cti))
> +		off = cti_qcom_reg_off(off);
> +
> +	return drvdata->base + off + index * sizeof(u32);
> +}
> +
> +#define reg_addr(drvdata, off)		__reg_addr((drvdata), (off), 0)
> +#define reg_index_addr(drvdata, off, i)	__reg_addr((drvdata), (off), (i))
> +
> +static inline u32 cti_read_single_reg_index(struct cti_drvdata *drvdata,
> +					    u32 off, u32 index)
> +{
> +	u32 val;
> +
> +	CS_UNLOCK(drvdata->base);
> +	val = readl_relaxed(reg_index_addr(drvdata, off, index));
> +	CS_LOCK(drvdata->base);
> +
> +	return val;
> +}
> +
> +static inline u32 cti_read_single_reg(struct cti_drvdata *drvdata, u32 off)
> +{
> +	return cti_read_single_reg_index(drvdata, off, 0);
> +}
> +
> +static inline void cti_write_single_reg_index(struct cti_drvdata *drvdata,
> +					      u32 off, u32 index, u32 value)
> +{
> +	CS_UNLOCK(drvdata->base);
> +	writel_relaxed(value, reg_index_addr(drvdata, off, index));
> +	CS_LOCK(drvdata->base);
> +}
> +
> +static inline void cti_write_single_reg(struct cti_drvdata *drvdata,
> +					u32 off, u32 value)
> +{
> +	cti_write_single_reg_index(drvdata, off, 0, value);
> +}
> +
>   /* Check if a cti device is enabled */
>   static inline bool cti_is_active(struct cti_config *cfg)
>   {
Thanks for the detailed suggestion and the reference implementation,
the approach looks clean. I'll adopt it in v11.


Thanks,
Yingchao


