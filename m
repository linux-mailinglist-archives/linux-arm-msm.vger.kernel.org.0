Return-Path: <linux-arm-msm+bounces-46397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A16A20BA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 15:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED95D1885CBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 14:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35AA41A0B08;
	Tue, 28 Jan 2025 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEjsu8eG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B0B199FC9
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 14:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738072928; cv=none; b=nW2sH3AVpFXzHBoWMNnsZ4RwtHYCxyiNufwqJGxhnax+GQUHU5VhEnNAM/WhRI1XTTcdQEXQ2Uso+VSn7YmD4ma2Un1jCiHCKR745JDaETfu04dBX0Zwcl5Zt5vXIou1SG2Wuh+TCYjswUqk5UNp+2W47p9A8a9kZhvL7Wn75yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738072928; c=relaxed/simple;
	bh=lZJhaI7R53LVqt2oDaGKMqPIRJm35ooTV/qoBhkpKiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOlVTZY4VNEPlQBf3g/J9TBTZG8nd+ea8cHfjLjpV7LBJZynJFVAKWCyvT1Vxrgu+H5atFLKH6G28dhwA0EkTinb+wItelSzTHsyzZMGc4QrIZusmJ+G1KmH9u8Ym132P+TGe9JiwrjbsQM1X1H6AXwmOSG67PTXmHtPeXZuScg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEjsu8eG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SD9pZU015816
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 14:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wkfzJJ60/aMGLiwYPruxPx4t783WmHkOX7jYEhFtcv0=; b=NEjsu8eGVp7+kWF6
	nOlnVeSsPSmRL/3WqXdFaNEfO5kWf2D/R0LzQxyHGoPKZbiiprRpp8uigOIGd6qv
	05hahUZlyrx1hct8MW7AnSpuxmkY4+x/fO3U2s8iuP1JpNZlwb1uix4PjfoE4gXp
	kBW1yF2DBwBWHrgBweXzkB0NWjvV743wU1a4tkxrLEJrZVRULVVuej0cLKGuTR5G
	d37BODPR+73bHxcXsYmGBILRdpxmC5ScOnQKa0kMaWwhlLqs2jZfZxfWkbBc3NcM
	IFRUgZl1LLcPVPIzx/L/nggDG3YDLeAhmgq2nNKzOG5ZcD/2C59osUUFoWSbAP1s
	0172gg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44eyvq83yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 14:02:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467a0d7fb9fso11385821cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 06:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738072924; x=1738677724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkfzJJ60/aMGLiwYPruxPx4t783WmHkOX7jYEhFtcv0=;
        b=ZDvGparpAMrKrq7RzEtLjkjgnu7SUFI23qq+6HnkA3AQLPYYQJ6EMOHIeAVPyr7wxf
         J6KmBrQ3S08VqLZ/ZsbWwuYHRRvp9s5weYXTh43S/oHEeiToVrc7kgYZNL2WdigRU2iF
         /LdyAuIbYsOUJZhucN5M3tQ64jOqejPeZHLJZkOHCCwXx3GqS5EzZO9i5LA6H8RVUR+K
         eBavrzIJw2pDrvoAmhavpcqks3PhzSibBtMehe/codZvfxZofGECB7PnqKZyACg7KFjL
         R88lCRROxbhu3MmFCqy8uqwfcsdSBtu0QA1YFu9Egs35MoYbUD6Fk9XMXsidrC6fAqoN
         EakA==
X-Gm-Message-State: AOJu0YxQmto9Ooiq6Iz3qtsrRHLbnixyW92S7Y6PX7YjR/vSZ3a2yEs+
	RUk5HzdTqk4XPfJ+w3T32Gum86qrpn488PXJZgLjyRjeaGPeUjJczuH3YyyKbrSP5nWsDmwmn/R
	nP0JtSX0kLFH3DWOyl+9YHdRIuAkabBdgcrsGGgf6OpdSjBolyx9K4qlZM0/ugP87
X-Gm-Gg: ASbGncvRzcpN9x2/ySylt/YVWNaoepQOubVIdmtpMZwZAx1XVRld9E2ZLoOTrW6t+0U
	amyOVvoGwzQlhgJJTMRuIL4+our6rp2dRhoKJupFqnmQftTBKmWxQunzDNsEf8/UUv1G2/TiFn8
	86ZUF5m2X7SuSzeZ1BBhcSYn6M6iU2BbyRAqlCa2emMOhrw7Whku8SOW/8LofOD6JVYAIpt2++J
	BAdNMJO1pR+5eU7xEgK7MAeWb1NlPfAmkhAUu1TM1+8elnfBllZgPlV4T9jdwUqyYkDnAgTsHww
	8stK3ZyuQlcP/vruKPHLKVFAAmECecITLFyPtvmpe+WWbpOeu13yeX00uqs=
X-Received: by 2002:a05:622a:453:b0:467:95c2:d8a3 with SMTP id d75a77b69052e-46e12a55c9cmr233033081cf.6.1738072924021;
        Tue, 28 Jan 2025 06:02:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhNGSvSfmBdavgSx+QyBVWufL9QacRQteWfpfYvS5eJvwEp6TH1/iSFkazTxn+uZowD/wxKQ==
X-Received: by 2002:a05:622a:453:b0:467:95c2:d8a3 with SMTP id d75a77b69052e-46e12a55c9cmr233032681cf.6.1738072923222;
        Tue, 28 Jan 2025 06:02:03 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6924486dbsm545064266b.161.2025.01.28.06.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 06:02:02 -0800 (PST)
Message-ID: <0b574941-30f3-41ec-ad6a-094371ef4d95@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 15:01:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
To: Melody Olvera <quic_molvera@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
 <20250113-sm8750_llcc_master-v1-2-5389b92e2d7a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250113-sm8750_llcc_master-v1-2-5389b92e2d7a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WwLqt9n-WVLVQfQabYv3B3NmiVaMXyEU
X-Proofpoint-ORIG-GUID: WwLqt9n-WVLVQfQabYv3B3NmiVaMXyEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280104

On 13.01.2025 10:26 PM, Melody Olvera wrote:
> Add support for LLCC V6. V6 adds several additional usecase IDs,
> rearrages several registers and offsets, and supports slice IDs
> over 31, so add a new function for programming LLCC V6.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c       | 212 ++++++++++++++++++++++++++++++++++++-
>  include/linux/soc/qcom/llcc-qcom.h |   8 ++
>  2 files changed, 216 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 56823b6a2facc4345265e29b60da24a391e3707d..4379b5baa011aa850a2b65ec20b32519d9331be4 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -35,6 +35,9 @@
>  #define ATTR0_RES_WAYS_MASK           GENMASK(15, 0)
>  #define ATTR0_BONUS_WAYS_MASK         GENMASK(31, 16)
>  #define ATTR0_BONUS_WAYS_SHIFT        16
> +#define ATTR2_PROBE_TARGET_WAYS_SHIFT 4
> +#define ATTR2_FIXED_SIZE_SHIFT        8
> +#define ATTR2_PRIORITY_SHIFT          12

I'd be a great fan of defining these as fields with GENMASK, which you
would later fill with FIELD_PREP, so as to avoid potential leakage into
neighbouring bitfields

>  #define LLCC_STATUS_READ_DELAY        100
>  
>  #define CACHE_LINE_SIZE_SHIFT         6
> @@ -49,6 +52,10 @@
>  #define LLCC_TRP_ATTR0_CFGn(n)        (0x21000 + SZ_8 * n)
>  #define LLCC_TRP_ATTR1_CFGn(n)        (0x21004 + SZ_8 * n)
>  #define LLCC_TRP_ATTR2_CFGn(n)        (0x21100 + SZ_4 * n)
> +#define LLCC_V6_TRP_ATTR0_CFGn(n)     (0x41000 + SZ_64 * n)
> +#define LLCC_V6_TRP_ATTR1_CFGn(n)     (0x41008 + SZ_64 * n)
> +#define LLCC_V6_TRP_ATTR2_CFGn(n)     (0x41010 + SZ_64 * n)
> +#define LLCC_V6_TRP_ATTR3_CFGn(n)     (0x41014 + SZ_64 * n)
>  
>  #define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21f00
>  #define LLCC_TRP_PCB_ACT              0x21f04
> @@ -62,10 +69,22 @@
>  #define LLCC_TRP_ALGO_CFG7	      0x21f28
>  #define LLCC_TRP_WRSC_CACHEABLE_EN    0x21f2c
>  #define LLCC_TRP_ALGO_CFG8	      0x21f30
> +#define LLCC_V6_TRP_SCID_DIS_CAP_ALLOC	0x42000
> +#define LLCC_V6_TRP_ALGO_CFG1		0x42008
> +#define LLCC_V6_TRP_ALGO_CFG2		0x42010
> +#define LLCC_V6_TRP_ALGO_CFG3		0x42018
> +#define LLCC_V6_TRP_ALGO_CFG4		0x42020
> +#define LLCC_V6_TRP_ALGO_CFG5		0x42028
> +#define LLCC_V6_TRP_ALGO_CFG6		0x42030
> +#define LLCC_V6_TRP_ALGO_CFG7		0x42038
> +#define LLCC_V6_TRP_ALGO_CFG8		0x42040
> +#define LLCC_V6_TRP_WRSC_EN		0x42080
> +#define LLCC_V6_TRP_WRSC_CACHEABLE_EN	0x42088
>  
>  #define LLCC_VERSION_2_0_0_0          0x02000000
>  #define LLCC_VERSION_2_1_0_0          0x02010000
>  #define LLCC_VERSION_4_1_0_0          0x04010000
> +#define LLCC_VERSION_6_0_0_0          0X06000000
>  
>  /**
>   * struct llcc_slice_config - Data associated with the llcc slice
> @@ -3161,6 +3180,33 @@ static const struct llcc_edac_reg_offset llcc_v2_1_edac_reg_offset = {
>  	.drp_ecc_db_err_syn0 = 0x52120,
>  };
>  
> +static const struct llcc_edac_reg_offset llcc_v6_edac_reg_offset = {
> +	.trp_ecc_error_status0 = 0x47448,
> +	.trp_ecc_error_status1 = 0x47450,
> +	.trp_ecc_sb_err_syn0 = 0x47490,
> +	.trp_ecc_db_err_syn0 = 0x474d0,
> +	.trp_ecc_error_cntr_clear = 0x47444,
> +	.trp_interrupt_0_status = 0x47600,
> +	.trp_interrupt_0_clear = 0x47604,
> +	.trp_interrupt_0_enable = 0x47608,
> +
> +	/* LLCC Common registers */
> +	.cmn_status0 = 0x6400c,
> +	.cmn_interrupt_0_enable = 0x6401c,
> +	.cmn_interrupt_2_enable = 0x6403c,
> +
> +	/* LLCC DRP registers */
> +	.drp_ecc_error_cfg = 0x80000,
> +	.drp_ecc_error_cntr_clear = 0x80004,
> +	.drp_interrupt_status = 0x80020,
> +	.drp_interrupt_clear = 0x80028,
> +	.drp_interrupt_enable = 0x8002c,
> +	.drp_ecc_error_status0 = 0x820f4,
> +	.drp_ecc_error_status1 = 0x820f8,
> +	.drp_ecc_sb_err_syn0 = 0x820fc,
> +	.drp_ecc_db_err_syn0 = 0x82120,
> +};
> +
>  /* LLCC register offset starting from v1.0.0 */
>  static const u32 llcc_v1_reg_offset[] = {
>  	[LLCC_COMMON_HW_INFO]	= 0x00030000,
> @@ -3173,6 +3219,13 @@ static const u32 llcc_v2_1_reg_offset[] = {
>  	[LLCC_COMMON_STATUS0]	= 0x0003400c,
>  };
>  
> +/* LLCC register offset starting from v6.0.0 */
> +static const u32 llcc_v6_reg_offset[] = {

It's sort of weird to have some registers be version-define with a common
name and keep others with a version-in-the-macro-name

> +	[LLCC_COMMON_HW_INFO]	= 0x00064000,
> +	[LLCC_COMMON_STATUS0]	= 0x0006400c,
> +

Stray newline

> +};
> +
>  static const struct qcom_llcc_config qcs615_cfg[] = {
>  	{
>  		.sct_data	= qcs615_data,
> @@ -3869,6 +3922,149 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
>  	return ret;
>  }
>  
> +static int _qcom_llcc_cfg_program_v6(const struct llcc_slice_config *config,
> +				  const struct qcom_llcc_config *cfg)
> +{
> +	int ret;
> +	u32 attr0_cfg, attr1_cfg, attr2_cfg, attr3_cfg;
> +	u32 attr0_val, attr1_val, attr2_val, attr3_val;
> +	u32 disable_cap_alloc, wren, wr_cache_en;
> +	u32 stale_en, stale_cap_en, mru_uncap_en, mru_rollover;
> +	u32 alloc_oneway_en, ovcap_en, ovcap_prio, vict_prio;
> +	u32 slice_offset, reg_offset;
> +	struct llcc_slice_desc *desc;
> +	const struct llcc_slice_config *slice_cfg;
> +	u32 sz = 0;

Reverse-Christmas-tree, please

> +
> +	slice_cfg = cfg->sct_data;

This one it would make sense to initialize at declaration time

> +	sz = cfg->size;

This one seems unused?

> +
> +	attr0_cfg = LLCC_V6_TRP_ATTR0_CFGn(config->slice_id);
> +	attr1_cfg = LLCC_V6_TRP_ATTR1_CFGn(config->slice_id);
> +	attr2_cfg = LLCC_V6_TRP_ATTR2_CFGn(config->slice_id);
> +	attr3_cfg = LLCC_V6_TRP_ATTR3_CFGn(config->slice_id);
> +
> +	attr0_val = config->res_ways;
> +	attr1_val = config->bonus_ways;
> +	attr2_val = config->cache_mode;
> +	attr2_val |= config->probe_target_ways << ATTR2_PROBE_TARGET_WAYS_SHIFT;
> +	attr2_val |= config->fixed_size << ATTR2_FIXED_SIZE_SHIFT;
> +	attr2_val |= config->priority << ATTR2_PRIORITY_SHIFT;
> +
> +	attr3_val = MAX_CAP_TO_BYTES(config->max_cap);
> +	attr3_val /= drv_data->num_banks;
> +	attr3_val >>= CACHE_LINE_SIZE_SHIFT;
> +
> +	ret = regmap_write(drv_data->bcast_regmap, attr0_cfg, attr0_val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(drv_data->bcast_regmap, attr1_cfg, attr1_val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(drv_data->bcast_regmap, attr2_cfg, attr2_val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(drv_data->bcast_regmap, attr3_cfg, attr3_val);
> +	if (ret)
> +		return ret;
> +
> +	slice_offset = config->slice_id % 32;
> +	reg_offset = (config->slice_id / 32) * 4;
> +
> +	if (!cfg->skip_llcc_cfg) {

Do we have about this case on any v6 platform?

> +		disable_cap_alloc = config->dis_cap_alloc << slice_offset;
> +		ret = regmap_write(drv_data->bcast_regmap,
> +			LLCC_V6_TRP_SCID_DIS_CAP_ALLOC + reg_offset,
> +			disable_cap_alloc);
> +
> +		if (ret)
> +			return ret;
> +	}
> +
> +	wren = config->write_scid_en << slice_offset;
> +	ret = regmap_update_bits(drv_data->bcast_regmap,
> +			LLCC_V6_TRP_WRSC_EN + reg_offset,
> +			BIT(slice_offset), wren);
> +	if (ret)
> +		return ret;
> +
> +	wr_cache_en = config->write_scid_cacheable_en << slice_offset;
> +	ret = regmap_update_bits(drv_data->bcast_regmap,
> +			LLCC_V6_TRP_WRSC_CACHEABLE_EN + reg_offset,
> +			BIT(slice_offset), wr_cache_en);
> +	if (ret)
> +		return ret;

So the initial ATTRn configs are different for v6, but this part and later
are identical, bar the register offset difference. Let's try to abstract
that through cfg->reg_offset

> +	stale_en = config->stale_en << slice_offset;
> +	ret = regmap_update_bits(drv_data->bcast_regmap,
> +			LLCC_V6_TRP_ALGO_CFG1 + reg_offset,
> +			BIT(slice_offset), stale_en);

Updating these calls to use bitfields instead of opencoded shifting would
be a welcome addition as well, but perhaps that could be stuck at the end
of the series as a general/housekeeping improvement

Konrad

