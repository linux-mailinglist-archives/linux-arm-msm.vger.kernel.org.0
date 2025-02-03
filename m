Return-Path: <linux-arm-msm+bounces-46820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A48C2A263C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 20:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 407893A74BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 19:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2861DC9B5;
	Mon,  3 Feb 2025 19:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MGR5paI7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0AB2AF10;
	Mon,  3 Feb 2025 19:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610914; cv=none; b=il2QLsTIXCYab9kIz2G7/A1CFCVFYiRL87kOEcF3YVxdn4L6Lc6XXHHUMkxsByRS/mzzjfs5V6G/S6Uy8zqravgEoYXGjclfwhp9TKbwNGBJnOHXtYUf/kvCR6y4dFyfWhc3GYynvS+21PNyXUR1GMPmQyRsCDUMfqhgctTJkCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610914; c=relaxed/simple;
	bh=oijApHXXVYwpLxcEH6bptuirH3kIVpa683QkgZ9dEoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=vFfZ15nLTnsKVAIg8dRHoFbZr/QSDL8VBgu0i0novqwdEJB7QFiOdt9MhF5r1Z5p0exE7p0OcyRZwL0YA4vldauWUDG5+ubGE6jeXM7gf7bS6ETLmf/rsjTVZI2bQDs+Iuwf4W8iocL0z9KgvBpsVruzvcDuH8LgyykJC1K0eY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MGR5paI7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513E6wtg005738;
	Mon, 3 Feb 2025 19:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fUZ3qpjdH8VxFJdAKetwNy2C9ZImZ5JTVEfFi+umL6M=; b=MGR5paI7PLjnBZIh
	58U4MeRVKNuv94ye6/SoIgvf91JWM2S1K69CLVSjuZlavtVIRHryHumIUcuJkxfv
	OjSTOPMgobu9lgCTjo5Z9YiAjf9TXuFuLojnl0Fu90owv1yRjwhDPrU+JbqEr9wR
	iIMiTnTP9kVx0Cdia44PV06mnXtpM0aGiQ0fvLkLeXpCZ9qFvYs0J1fNN9hCrUTU
	CT093KxqSLWKMs8SjQl0MSTpEdGDZf6Uoaj7h2dMwyhb6XLy6uZyZasraoX59Lqi
	f+Bvqe4eazwpehgp5Vfo+aP1HTwSRfjLD8TLSokdivsD3U+yjen+rDzIIfIYxZDR
	wZDVQA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jy9g0s43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 19:28:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 513JSTWR016942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 19:28:29 GMT
Received: from [10.110.24.255] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 11:28:28 -0800
Message-ID: <1200f51b-2ee3-446d-9098-df946ef3a359@quicinc.com>
Date: Mon, 3 Feb 2025 11:28:27 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
 <20250113-sm8750_llcc_master-v1-2-5389b92e2d7a@quicinc.com>
 <0b574941-30f3-41ec-ad6a-094371ef4d95@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <0b574941-30f3-41ec-ad6a-094371ef4d95@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pQAagOz-bXQzEhnyYApEKU3CBc-LjLDQ
X-Proofpoint-ORIG-GUID: pQAagOz-bXQzEhnyYApEKU3CBc-LjLDQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_08,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030141



On 1/28/2025 6:01 AM, Konrad Dybcio wrote:
> On 13.01.2025 10:26 PM, Melody Olvera wrote:
>> Add support for LLCC V6. V6 adds several additional usecase IDs,
>> rearrages several registers and offsets, and supports slice IDs
>> over 31, so add a new function for programming LLCC V6.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   drivers/soc/qcom/llcc-qcom.c       | 212 ++++++++++++++++++++++++++++++++++++-
>>   include/linux/soc/qcom/llcc-qcom.h |   8 ++
>>   2 files changed, 216 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
>> index 56823b6a2facc4345265e29b60da24a391e3707d..4379b5baa011aa850a2b65ec20b32519d9331be4 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -35,6 +35,9 @@
>>   #define ATTR0_RES_WAYS_MASK           GENMASK(15, 0)
>>   #define ATTR0_BONUS_WAYS_MASK         GENMASK(31, 16)
>>   #define ATTR0_BONUS_WAYS_SHIFT        16
>> +#define ATTR2_PROBE_TARGET_WAYS_SHIFT 4
>> +#define ATTR2_FIXED_SIZE_SHIFT        8
>> +#define ATTR2_PRIORITY_SHIFT          12
> I'd be a great fan of defining these as fields with GENMASK, which you
> would later fill with FIELD_PREP, so as to avoid potential leakage into
> neighbouring bitfields

Ack.

>
>>   #define LLCC_STATUS_READ_DELAY        100
>>   
>>   #define CACHE_LINE_SIZE_SHIFT         6
>> @@ -49,6 +52,10 @@
>>   #define LLCC_TRP_ATTR0_CFGn(n)        (0x21000 + SZ_8 * n)
>>   #define LLCC_TRP_ATTR1_CFGn(n)        (0x21004 + SZ_8 * n)
>>   #define LLCC_TRP_ATTR2_CFGn(n)        (0x21100 + SZ_4 * n)
>> +#define LLCC_V6_TRP_ATTR0_CFGn(n)     (0x41000 + SZ_64 * n)
>> +#define LLCC_V6_TRP_ATTR1_CFGn(n)     (0x41008 + SZ_64 * n)
>> +#define LLCC_V6_TRP_ATTR2_CFGn(n)     (0x41010 + SZ_64 * n)
>> +#define LLCC_V6_TRP_ATTR3_CFGn(n)     (0x41014 + SZ_64 * n)
>>   
>>   #define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21f00
>>   #define LLCC_TRP_PCB_ACT              0x21f04
>> @@ -62,10 +69,22 @@
>>   #define LLCC_TRP_ALGO_CFG7	      0x21f28
>>   #define LLCC_TRP_WRSC_CACHEABLE_EN    0x21f2c
>>   #define LLCC_TRP_ALGO_CFG8	      0x21f30
>> +#define LLCC_V6_TRP_SCID_DIS_CAP_ALLOC	0x42000
>> +#define LLCC_V6_TRP_ALGO_CFG1		0x42008
>> +#define LLCC_V6_TRP_ALGO_CFG2		0x42010
>> +#define LLCC_V6_TRP_ALGO_CFG3		0x42018
>> +#define LLCC_V6_TRP_ALGO_CFG4		0x42020
>> +#define LLCC_V6_TRP_ALGO_CFG5		0x42028
>> +#define LLCC_V6_TRP_ALGO_CFG6		0x42030
>> +#define LLCC_V6_TRP_ALGO_CFG7		0x42038
>> +#define LLCC_V6_TRP_ALGO_CFG8		0x42040
>> +#define LLCC_V6_TRP_WRSC_EN		0x42080
>> +#define LLCC_V6_TRP_WRSC_CACHEABLE_EN	0x42088
>>   
>>   #define LLCC_VERSION_2_0_0_0          0x02000000
>>   #define LLCC_VERSION_2_1_0_0          0x02010000
>>   #define LLCC_VERSION_4_1_0_0          0x04010000
>> +#define LLCC_VERSION_6_0_0_0          0X06000000
>>   
>>   /**
>>    * struct llcc_slice_config - Data associated with the llcc slice
>> @@ -3161,6 +3180,33 @@ static const struct llcc_edac_reg_offset llcc_v2_1_edac_reg_offset = {
>>   	.drp_ecc_db_err_syn0 = 0x52120,
>>   };
>>   
>> +static const struct llcc_edac_reg_offset llcc_v6_edac_reg_offset = {
>> +	.trp_ecc_error_status0 = 0x47448,
>> +	.trp_ecc_error_status1 = 0x47450,
>> +	.trp_ecc_sb_err_syn0 = 0x47490,
>> +	.trp_ecc_db_err_syn0 = 0x474d0,
>> +	.trp_ecc_error_cntr_clear = 0x47444,
>> +	.trp_interrupt_0_status = 0x47600,
>> +	.trp_interrupt_0_clear = 0x47604,
>> +	.trp_interrupt_0_enable = 0x47608,
>> +
>> +	/* LLCC Common registers */
>> +	.cmn_status0 = 0x6400c,
>> +	.cmn_interrupt_0_enable = 0x6401c,
>> +	.cmn_interrupt_2_enable = 0x6403c,
>> +
>> +	/* LLCC DRP registers */
>> +	.drp_ecc_error_cfg = 0x80000,
>> +	.drp_ecc_error_cntr_clear = 0x80004,
>> +	.drp_interrupt_status = 0x80020,
>> +	.drp_interrupt_clear = 0x80028,
>> +	.drp_interrupt_enable = 0x8002c,
>> +	.drp_ecc_error_status0 = 0x820f4,
>> +	.drp_ecc_error_status1 = 0x820f8,
>> +	.drp_ecc_sb_err_syn0 = 0x820fc,
>> +	.drp_ecc_db_err_syn0 = 0x82120,
>> +};
>> +
>>   /* LLCC register offset starting from v1.0.0 */
>>   static const u32 llcc_v1_reg_offset[] = {
>>   	[LLCC_COMMON_HW_INFO]	= 0x00030000,
>> @@ -3173,6 +3219,13 @@ static const u32 llcc_v2_1_reg_offset[] = {
>>   	[LLCC_COMMON_STATUS0]	= 0x0003400c,
>>   };
>>   
>> +/* LLCC register offset starting from v6.0.0 */
>> +static const u32 llcc_v6_reg_offset[] = {
> It's sort of weird to have some registers be version-define with a common
> name and keep others with a version-in-the-macro-name

I agree. There exists a version of this change which moves the offset
macros to these structs if that's preferred; I wanted some feedback
on what folks would prefer here.

>
>> +	[LLCC_COMMON_HW_INFO]	= 0x00064000,
>> +	[LLCC_COMMON_STATUS0]	= 0x0006400c,
>> +
> Stray newline

Ack.

>
>> +};
>> +
>>   static const struct qcom_llcc_config qcs615_cfg[] = {
>>   	{
>>   		.sct_data	= qcs615_data,
>> @@ -3869,6 +3922,149 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
>>   	return ret;
>>   }
>>   
>> +static int _qcom_llcc_cfg_program_v6(const struct llcc_slice_config *config,
>> +				  const struct qcom_llcc_config *cfg)
>> +{
>> +	int ret;
>> +	u32 attr0_cfg, attr1_cfg, attr2_cfg, attr3_cfg;
>> +	u32 attr0_val, attr1_val, attr2_val, attr3_val;
>> +	u32 disable_cap_alloc, wren, wr_cache_en;
>> +	u32 stale_en, stale_cap_en, mru_uncap_en, mru_rollover;
>> +	u32 alloc_oneway_en, ovcap_en, ovcap_prio, vict_prio;
>> +	u32 slice_offset, reg_offset;
>> +	struct llcc_slice_desc *desc;
>> +	const struct llcc_slice_config *slice_cfg;
>> +	u32 sz = 0;
> Reverse-Christmas-tree, please

Ack.

>
>> +
>> +	slice_cfg = cfg->sct_data;
> This one it would make sense to initialize at declaration time

Sure thing.

>
>> +	sz = cfg->size;
> This one seems unused?

Lemme double-check; will remove if so.

>
>> +
>> +	attr0_cfg = LLCC_V6_TRP_ATTR0_CFGn(config->slice_id);
>> +	attr1_cfg = LLCC_V6_TRP_ATTR1_CFGn(config->slice_id);
>> +	attr2_cfg = LLCC_V6_TRP_ATTR2_CFGn(config->slice_id);
>> +	attr3_cfg = LLCC_V6_TRP_ATTR3_CFGn(config->slice_id);
>> +
>> +	attr0_val = config->res_ways;
>> +	attr1_val = config->bonus_ways;
>> +	attr2_val = config->cache_mode;
>> +	attr2_val |= config->probe_target_ways << ATTR2_PROBE_TARGET_WAYS_SHIFT;
>> +	attr2_val |= config->fixed_size << ATTR2_FIXED_SIZE_SHIFT;
>> +	attr2_val |= config->priority << ATTR2_PRIORITY_SHIFT;
>> +
>> +	attr3_val = MAX_CAP_TO_BYTES(config->max_cap);
>> +	attr3_val /= drv_data->num_banks;
>> +	attr3_val >>= CACHE_LINE_SIZE_SHIFT;
>> +
>> +	ret = regmap_write(drv_data->bcast_regmap, attr0_cfg, attr0_val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(drv_data->bcast_regmap, attr1_cfg, attr1_val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(drv_data->bcast_regmap, attr2_cfg, attr2_val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(drv_data->bcast_regmap, attr3_cfg, attr3_val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	slice_offset = config->slice_id % 32;
>> +	reg_offset = (config->slice_id / 32) * 4;
>> +
>> +	if (!cfg->skip_llcc_cfg) {
> Do we have about this case on any v6 platform?

AFAICT no; I can remove it.

>
>> +		disable_cap_alloc = config->dis_cap_alloc << slice_offset;
>> +		ret = regmap_write(drv_data->bcast_regmap,
>> +			LLCC_V6_TRP_SCID_DIS_CAP_ALLOC + reg_offset,
>> +			disable_cap_alloc);
>> +
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	wren = config->write_scid_en << slice_offset;
>> +	ret = regmap_update_bits(drv_data->bcast_regmap,
>> +			LLCC_V6_TRP_WRSC_EN + reg_offset,
>> +			BIT(slice_offset), wren);
>> +	if (ret)
>> +		return ret;
>> +
>> +	wr_cache_en = config->write_scid_cacheable_en << slice_offset;
>> +	ret = regmap_update_bits(drv_data->bcast_regmap,
>> +			LLCC_V6_TRP_WRSC_CACHEABLE_EN + reg_offset,
>> +			BIT(slice_offset), wr_cache_en);
>> +	if (ret)
>> +		return ret;
> So the initial ATTRn configs are different for v6, but this part and later
> are identical, bar the register offset difference. Let's try to abstract
> that through cfg->reg_offset

Agreed.

>
>> +	stale_en = config->stale_en << slice_offset;
>> +	ret = regmap_update_bits(drv_data->bcast_regmap,
>> +			LLCC_V6_TRP_ALGO_CFG1 + reg_offset,
>> +			BIT(slice_offset), stale_en);
> Updating these calls to use bitfields instead of opencoded shifting would
> be a welcome addition as well, but perhaps that could be stuck at the end
> of the series as a general/housekeeping improvement

Ok; will do.

Thanks,
Melody


