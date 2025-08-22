Return-Path: <linux-arm-msm+bounces-70375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8349EB315F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B38FAAC7C1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07746222581;
	Fri, 22 Aug 2025 10:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fv0G3qhu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9562F4A10
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755860124; cv=none; b=S4TrMdhX4sW5Bej36yx8ZcWdG9iU/Pda/3A/8pksgpvI8a/NvtQ/TPba7153sPs3JFmo5kb1ZrRHbZ4y480Q2Yiib0YjYwUB7/jEAAmAH6l59XghCh2rQTDTSbLTeKqtozTbFOe4nmMKgdDdCU4ztabO06ZPuEJgg6+W4GkwRms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755860124; c=relaxed/simple;
	bh=XbuOpXqYiunKbSbSNp+OTWaA/M6GReq0/U3LNHNvyJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OXzC+NQZhO09GrnzSRyKV1FF5SQp+64LXKOuTqi9ERFYauhko+NZIOzoat4Um3YnfnWuGNqaVzppKRktXphVbz4p4v1wGz3nEcmesUcSFUu/f3Cf8KpBQhcIwuGHSis5ze6Tl8EIciGVn8Nt3CqR+vZ0apLEJbSWNrqTKk8ypKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fv0G3qhu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UMVo011149
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DuF30ydN2ZQeTy/GA6e65bX7Ud15XFT+k/NW2dRJT08=; b=fv0G3qhuMi+JwZjZ
	fDd/WJHvc+3p7aAa1iuCx1JfoEqbnvusj/teXgfsAahoEdrT6TEX5f0Mw0KMFWZy
	uv4EEt5ZMrsdXCSi0A+SvOBtx9Fyevvt4aDKm2arJ+/r4pgzYSEEaKPWOxnP+6si
	DPuWrFcGSSf3pY5AXy44MfZiSruyPT2TKHfA8lEbGiTbXwGlYg2p45/QDMkmIvuJ
	PeeXhv3ywBWxdQY5HTkamYtgrowWRWE63xMe1AkAl8DseHkGj+qG2Du82pWxked7
	XajWyqvYQAUO8JGWc78y0oa4w1hn2Vir2FvMo0t13f/dLVnAvjoVWfZ7lqS10NU9
	xbTQtQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8ers3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:55:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d93f579ceso24123606d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755860117; x=1756464917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DuF30ydN2ZQeTy/GA6e65bX7Ud15XFT+k/NW2dRJT08=;
        b=kG50VFBIacXiA2vlsVWXUcWZH+AQFRFsvCthl+qSaq8LOEUPGNinLh968BHgHcFPse
         bUexMFW+pfsvH7gVd3OFX2yKLcaJLk7GRipFtfI2JEOTLP3XtFiVB42Z0DZwlSUinA1M
         inJlqkYbxi1fOwmxf4drKXKXzztDmrbwK85N7mvai86xeswDogA3PHtii9svdRX9KhRx
         mNkKpo/JaFKPP9AUCC6AfDkZm8Vd4ypDu4RPLRkqCbv/CVhVHp+i9sBgl9pr50mmm7N3
         j/3OsCRN73qEtnihqxnDDtEoAUDqR8DJe6WXPHFZWfhCaqDHYr2f5EBy60djK8yBq03C
         rTTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz9CATWIohaApwMFDzp+9YiuW6O1vbaOuHdZapCwxZI99q9fsnOhw6dYlh5iSsEkVn817wn/eQOL9j+cLM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/s1urbVJ408hAW4WVXZvA1jYCBixl/SN903fR9NtFOll4TD/S
	HmpGJc6x7uqHEknBQ8Y3qYJX5LVmml5jdF7O7RmRHcbSxorflAjalgUIYr3VrKhh+n4kNkaOesJ
	xBjPBzBtJlfQ5Q2s0tZp2gkhtCaR4CCwuBSvwAEJawZ43VRLnuMK/ClU5tLBrjPFaiwqI
X-Gm-Gg: ASbGnct9e8N/XU6jHVjHLvBcCp3aduHYCL45FyToQH1zj2MFEWsxHLiM1OXutm1xVIt
	UE15kY1IGy9QySlqh9za3AwnbZNVl5oEyAENjGm/cY0XFUX9J4cN+w3O55lkVuadok3JWdm1m2O
	vb6jbexj+HJrbWG6yzN3IWQjSFHA0jBTzV76b8+vbXq/7mZyqycQxgFQEfkRcNaGFcv5ONxmXj/
	pgb/inmg5PaDNL65EJDdFuXhZFUFLk+o9z6THBKwlD/LVL631WaaPyxygkRZWn5St2igpn/n97Z
	zeAR8MTNcYhNSydo4Sa9BjVJdNgNn+uMMdeGIRUIiuOmG3IimsknLBRw26zwFngKGSs=
X-Received: by 2002:a05:6214:1c86:b0:70d:6de2:50ba with SMTP id 6a1803df08f44-70d9733f326mr29342186d6.55.1755860116925;
        Fri, 22 Aug 2025 03:55:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5yaFihF5akudpDZ3q6UIvfl9qSPo9Ne7xAKkzui1FD6I2i7DxTmdLR4xBlr/nHdiY7Lf+kA==
X-Received: by 2002:a05:6214:1c86:b0:70d:6de2:50ba with SMTP id 6a1803df08f44-70d9733f326mr29341916d6.55.1755860116255;
        Fri, 22 Aug 2025 03:55:16 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b50e1852asm32076825e9.25.2025.08.22.03.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 03:55:15 -0700 (PDT)
Message-ID: <6a4a601b-937e-441f-80a7-3f733fc86445@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 11:55:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: qcom: audioreach: Add support for VI Sense
 module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250821141625.131990-3-krzysztof.kozlowski@linaro.org>
 <20250821141625.131990-4-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250821141625.131990-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX3b1QU/1o6QNG
 U7dda0Ptv6I5ffe3tTiLWBTbpHDqUDKwgf8W+VvnZt4KW74KDEokQNhKLeKVXncgsmc8o1zC+5p
 w34Um6Cz5YgQPmp4+QLqUN6NW6rWVSaN1lrOEmi2SuCHcOY5iTNwtijdRt/jlAI9aHtXOyY5CP0
 Nl7+PvM6csUcl5ny//kvm7PegQ/ClKEq6BzZKuuX1mTihZaGWL39n7HCs6yl8XnnoNY34HcETRb
 fEjs2PiD9g/CDdrkpobqH7JqIr634+ekR5CzcH1sjyCN7OAYiMiOeiDwbvpo+RAA//TwvBZg88c
 6G6IK8mfkP0VD/Ewc1dDoYIV5wG2pUNcaojz0RlZSWdR0r47H6Ou4l8hbyOKOGrfnO1V//D5agx
 qSLoHbgkaKdqo8IFAUbC+zNlyJMhrw==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a84c9a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=zgq_qGFzbcYR-VCCdk8A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: acDsdKtGRYH_rg9gipm7PFPYZR0ILHm0
X-Proofpoint-ORIG-GUID: acDsdKtGRYH_rg9gipm7PFPYZR0ILHm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134



On 8/21/25 3:16 PM, Krzysztof Kozlowski wrote:
> VI Sense module in ADSP is responsible for feedback loop for measuring
> current and voltage of amplifiers, necessary for proper calibration of
> Speaker Protection algorightms.  Implement parsing
> MODULE_ID_SPEAKER_PROTECTION_VI from Audioreach topology and sending it
> as command to the ADSP.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 112 ++++++++++++++++++++++++++++++
>  sound/soc/qcom/qdsp6/audioreach.h |  27 +++++++
>  2 files changed, 139 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index b7f1fc835dc2..f2b7f18e29ae 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -202,6 +202,31 @@ struct apm_display_port_module_intf_cfg {
>  } __packed;
>  }
>  
> +static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
> +					    struct audioreach_module *module,
> +					    struct audioreach_module_config *mcfg)
> +{
> +	uint32_t num_channels = mcfg->num_channels;
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
> +	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_CALIBRATION;
> +	op_cfg->cfg.quick_calibration = 1;
> +	/*
> +	 * op_cfg->cfg.r0_t0_selection should be set only for normal mode, keep
> +	 * as 0 for calibration

How do we move from calibration to a normal mode?

--srini
> +	 */
> +	p += op_sz;
> +
> +	cm_cfg = p;
> +	param_data = &cm_cfg->param_data;
> +	param_data->module_instance_id = module->instance_id;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_SP_VI_CHANNEL_MAP_CFG;
> +	param_data->param_size = cm_sz - APM_MODULE_PARAM_DATA_SIZE;
> +
> +	cm_cfg->cfg.num_channels = num_channels * 2;
> +	for (i = 0; i < num_channels; i++) {
> +		/*
> +		 * Map speakers into Vsense and then Isense of each channel.
> +		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
> +		 * [ 1, 2, 3, 4]
> +		 */
> +		cm_cfg->cfg.channel_mapping[2 * i] = (mcfg->channel_map[i] - 1) * 2 + 1;
> +		cm_cfg->cfg.channel_mapping[2 * i + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
> +	}
> +
> +	p += cm_sz;
> +
> +	ex_cfg = p;
> +	param_data = &ex_cfg->param_data;
> +	param_data->module_instance_id = module->instance_id;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_SP_VI_EX_MODE_CFG;
> +	param_data->param_size = ex_sz - APM_MODULE_PARAM_DATA_SIZE;
> +
> +	ex_cfg->cfg.factory_mode = 0;
> +
> +	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
> +
> +	kfree(pkt);
> +
> +	return rc;
> +}

