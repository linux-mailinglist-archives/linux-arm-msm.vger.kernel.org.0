Return-Path: <linux-arm-msm+bounces-72035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C66DB43978
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 13:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCF133ADBD1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 11:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8ED2FB96A;
	Thu,  4 Sep 2025 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHEqwVnP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341F52FB626
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 11:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983852; cv=none; b=E/C/2/pF67/1Nj2FabRp1GHXhzvp3TNzhZ51IkanQUjWKhQ8dH+98xwpNjOL4eEiYfloSsC9VP2cdGTg+TT+EfKYcZ3w6eS6SmWdd92PR+p1YQMM1GC/kYoJH9FIoIMcfncGzAoJMsW+txGtPOVuqHPRyZpA1FhbWPwDlj7segQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983852; c=relaxed/simple;
	bh=QjsIzOjiLkqmeUN7HOVaPIL7oU9r3h2GtT5k5IIb8wI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EVgKq5IgtJrMh9HOl9PwicDHGVqaLpts9BS8Bzhgi6kcjoEB4x2e/w73trgU24cNksXSjIUke28ToR9094JmoFMOctbjeL0MWIOOYOLQm0rQekkJZ5Nj5xchjdjXsjGGRz6vIHs1ArBMd7Ar0SSl+ovUozqNV9IKg3zN4Cel2cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHEqwVnP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X8Ru002342
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 11:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xNdNABuSYEsbe4+HKubTrqHVQ5x7i1zjHvXMg0jlse4=; b=RHEqwVnPTq92NNuc
	UohUVxTdUd7+/+YWA76yryypSQPvnY3bxKiz+hxZyRpl/01apSuQTcmgn8cQfhzX
	fjDaav8j7ldgug77xzeP0AYoO4DWIY0/D4KyY0Y9knCa4IPkAP/Fnmf6fKpo6Ghr
	HjeeFUfxl+u/bQS6tsD00SJteu44w3k7Pq8JgwC4h0gy9vMylh+sBo4PBKhvapV8
	wcKsIHk21Md0RuTToShftuPfjyrdo5hCL4vFMpbkvbUwU4GRVvnz4FiAGUSUCZie
	eHLRvxwPP2/9M0Ca9O7ZrK8ILuaKTuSBVRKElNBa8NFlgRZR4XwQDsrCmWBcZMz+
	ojbZoA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush374x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 11:04:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b339e7d107so20534051cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 04:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983849; x=1757588649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNdNABuSYEsbe4+HKubTrqHVQ5x7i1zjHvXMg0jlse4=;
        b=hv5S2I/5O0A9HmIf4XwUdAwY5Sh6mDTXKkqjXXHf9OQ9llcoy467U5LJ+mVF2Q8GRc
         /SXsIZMy9gUH/GPLfrFDYVVEa8lTU+JNTnogjQjaIjUAD9UAmA3cY0F9uEPU83NZTO41
         4wCRi0l20uXexDoOAMW+WiToVer6ZQ/L6RmUwx0NEUuYPBLm/adLxpHMjCicQfHSPJbx
         Vm44L4eE321rCtqEJCywxn47SJwHBvhqxNU421e81waCZ78ufsf1Xy6DtutmVLkoqo3I
         LSGuLhxrGhtyXRJJQnAkxzx2XVU6DVmC8zjlqTTd2wnFLC+yFmmWmhS+xxd7UfJIjHjL
         hAZw==
X-Forwarded-Encrypted: i=1; AJvYcCX5iSWI09nYMg1Lx4T2fH9M0nZuQe18biXpFvq9FOtnEQGs880X0jhU+TaKEFNJk2G1Rj/017YfEQureEFH@vger.kernel.org
X-Gm-Message-State: AOJu0YxCOPPb1aJF0u6duP2E6ZRej5qnppkxYdTttsjpxtLZ0H08+loL
	8X8al5b3kS8BUnau53mwpatYXpMdXl6gKqZGUOvXj3jJmiD1P8TMC/iO/YYI6+WBk2Mm6WAxtLf
	kjowWOB/IieB3imT2PEdCEi+GgqvObjVy+QQfbwaYxMGha8AYUFMnfq0UcfAq9EDYVegN
X-Gm-Gg: ASbGncuPyxNeDXLthuXHt8gYpQ8R7Jrl/uEWt1ggrYJMroFTzPCCI69/5VeVpUURs3i
	HnrHzeDYhO3h1M/VOkjx50krxVEEdlQyQT1uErY1dHn+N4ZSjXE/4Dag0Gff33oAPbLloXb5NRv
	bP5GeZNHTe+J6I/i06fF5ZTpR1QDJrlrilZU2B2KhuLz2EDlCm0ReyHaf8ntl2qTFkvKAxZR4uI
	2lrmheGLkYMGU00Lzu67Bx9bkiy1Zu8Yksm9xmxhdf81+DjqvLDepbveLAFIyQlV05KmLlJ9gVC
	1FiVK2p40l13b+L307YVutE3j/0owhc/yeMSUz+ql2CmhXOBJN4oyZjQEjps2lN60eY=
X-Received: by 2002:a05:622a:4a8f:b0:4b5:de44:4ec2 with SMTP id d75a77b69052e-4b5de44524bmr9547411cf.78.1756983848815;
        Thu, 04 Sep 2025 04:04:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAIkjJX64TcWdyq3xxLdTjtxkU4I8xfAaee5dwnGcTaqYCdV2E4yyxcq0eFxGzzPynPGYG5g==
X-Received: by 2002:a05:622a:4a8f:b0:4b5:de44:4ec2 with SMTP id d75a77b69052e-4b5de44524bmr9546681cf.78.1756983848081;
        Thu, 04 Sep 2025 04:04:08 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45dd2304e16sm17959025e9.7.2025.09.04.04.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 04:04:07 -0700 (PDT)
Message-ID: <79274958-52a0-4041-b4f3-365ee84fb088@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 12:04:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: qcom: audioreach: Add support for VI Sense
 module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250904102558.143745-3-krzysztof.kozlowski@linaro.org>
 <20250904102558.143745-4-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250904102558.143745-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXwuV8ZQeZvFKA
 cdaRZCTknD59QxoS16CFm9LlxSckUEoaheYIS3BpFXmfUyYuzsGRhyL5CQqZ/dC8B95qy31pnDg
 wlG/cBPlhabvFhCRgaYTGPDZcx/u0as3i5WVQx5mjnbHzN3kts2Za3AU7fByU6QxINPY3MaLBmP
 ZKXXEWZxejJfymQT3GJcO0HDmc8Sf4W5MBjGUy9bJqYSUPqKnYhMdYtfaHnr0EDQ4pL6T9DwWXc
 5tXbEIvcHqgqe0P1ETmW9nbsZMc43R67ukQbSL0Irqrurkpm71n0U47Cc0gXFEwjwBo8y4xZl2s
 RiFvbbQ9ALWDjeFLZUy/zn4z7mDmb1fO4O5IohVSLuo95xrOmJjNGvoSPdeh/Ahe1hUA6eh+o9x
 uWIok3yg
X-Proofpoint-ORIG-GUID: R4mq-BZNEBZXSVaz-H5lkWTYm1QnMrWz
X-Proofpoint-GUID: R4mq-BZNEBZXSVaz-H5lkWTYm1QnMrWz
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b9722a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=zgq_qGFzbcYR-VCCdk8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032



On 9/4/25 11:26 AM, Krzysztof Kozlowski wrote:
> VI Sense module in ADSP is responsible for feedback loop for measuring
> current and voltage of amplifiers, necessary for proper calibration of
> Speaker Protection algorightms.  Implement parsing
> MODULE_ID_SPEAKER_PROTECTION_VI from Audioreach topology and sending it
> as command to the ADSP.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Use PARAM_ID_SP_VI_OP_MODE_NORMAL
> 2. Make num_channels u32
> 3. I did not change uint32_t type in the header for consistency
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 112 ++++++++++++++++++++++++++++++
>  sound/soc/qcom/qdsp6/audioreach.h |  27 +++++++
>  2 files changed, 139 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index 3b7dffd696e7..f344ce80676f 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -202,6 +202,31 @@ struct apm_display_port_module_intf_cfg {
>  } __packed;
>  #define APM_DP_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_display_port_module_intf_cfg), 8)
>  
> +struct apm_module_sp_vi_op_mode_cfg {
> +	struct apm_module_param_data param_data;
> +	struct param_id_sp_vi_op_mode_cfg cfg;
> +} __packed;
> +
> +#define APM_SP_VI_OP_MODE_CFG_PSIZE(ch) ALIGN( \
> +				sizeof(struct apm_module_sp_vi_op_mode_cfg) + \
> +				(ch) * sizeof(uint32_t), 8)
> +
> +struct apm_module_sp_vi_ex_mode_cfg {
> +	struct apm_module_param_data param_data;
> +	struct param_id_sp_vi_ex_mode_cfg cfg;
> +} __packed;
> +
> +#define APM_SP_VI_EX_MODE_CFG_PSIZE ALIGN(sizeof(struct apm_module_sp_vi_ex_mode_cfg), 8)
> +
> +struct apm_module_sp_vi_channel_map_cfg {
> +	struct apm_module_param_data param_data;
> +	struct param_id_sp_vi_channel_map_cfg cfg;
> +} __packed;
> +
> +#define APM_SP_VI_CH_MAP_CFG_PSIZE(ch) ALIGN( \
> +				sizeof(struct apm_module_sp_vi_channel_map_cfg) + \
> +				(ch) * sizeof(uint32_t), 8)
> +
>  static void *__audioreach_alloc_pkt(int payload_size, uint32_t opcode, uint32_t token,
>  				    uint32_t src_port, uint32_t dest_port, bool has_cmd_hdr)
>  {
> @@ -1258,6 +1283,89 @@ static int audioreach_speaker_protection(struct q6apm_graph *graph,
>  					 operation_mode);
>  }
>  
> +static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
> +					    struct audioreach_module *module,
> +					    struct audioreach_module_config *mcfg)
> +{
> +	u32 num_channels = mcfg->num_channels;
> +	struct apm_module_sp_vi_op_mode_cfg *op_cfg;
> +	struct apm_module_sp_vi_channel_map_cfg *cm_cfg;
> +	struct apm_module_sp_vi_ex_mode_cfg *ex_cfg;
> +	int op_sz, cm_sz, ex_sz;
> +	struct apm_module_param_data *param_data;
> +	int rc, i, payload_size;
> +	struct gpr_pkt *pkt;
> +	void *p;
> +
> +	if (num_channels > 2) {
> +		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
> +		return -EINVAL;
> +	}
> +
> +	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_channels);
> +	/* Channel mapping for Isense and Vsense, thus twice number of speakers. */
> +	cm_sz = APM_SP_VI_CH_MAP_CFG_PSIZE(num_channels * 2);
> +	ex_sz = APM_SP_VI_EX_MODE_CFG_PSIZE;
> +
> +	payload_size = op_sz + cm_sz + ex_sz;
> +
> +	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
> +	if (IS_ERR(pkt))
> +		return PTR_ERR(pkt);
> +
> +	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
> +
> +	op_cfg = p;
> +	param_data = &op_cfg->param_data;
> +	param_data->module_instance_id = module->instance_id;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_SP_VI_OP_MODE_CFG;
> +	param_data->param_size = op_sz - APM_MODULE_PARAM_DATA_SIZE;
> +
> +	op_cfg->cfg.num_channels = num_channels;
> +	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_NORMAL;
> +	op_cfg->cfg.quick_calibration = 1;

This field is only valid in calibration mode, we can remove it.

Other than that, it LGTM

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini


