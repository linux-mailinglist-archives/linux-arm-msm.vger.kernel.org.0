Return-Path: <linux-arm-msm+bounces-47344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0879A2E2C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 04:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C95BF188792E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 03:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00546130499;
	Mon, 10 Feb 2025 03:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqKuMWwM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D0A85C5E
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 03:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739158214; cv=none; b=PKIveX/oVURhIhkMc7eB/xQzSRNjVHhSUeR3AM1h9x9rVXVdPa7ZXHUxOOwfyyWZT2oII1bCWy0AgGJdyvH89+z30mmotM9Psjss9PD7FODOSvIc4GiFY8IfZ4yaxTOE5DSXA48VIYy/A1Qb0qPOaPfL/rHnavt5yZrxUwtYmYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739158214; c=relaxed/simple;
	bh=72gzcmqBjhe9WUXouRWzvmwGQdYoqPdNUXTtUlGsZHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eWekb/8nFCsOIaWYzFK0fFQqgMge7OIyIL01AWRgCvaq5IDu1R+Y6YA40wdGriTLv155Hj0Fvk26V0LZPDk19NHBK2KQtSnDQDSHJjl1joHD2uWat3utlawxddxPFGlZk3YJUxCsmdf1PwTUjI33Rfw5o0yADABMxixYX+E4+K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqKuMWwM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519MjU4D030071
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 03:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AwkNQeraw0pKo/G2XqtOAJfiNBsbtDJxZ8h6SQj83xs=; b=AqKuMWwMsuIwP33W
	N8yI5qJhjMwqvlopoMggNQeDOdnZBM2Uu3V6lfh6ROiuPczyji+qHPFLYJSPxC6G
	Bw/naBkZlR+BTpZPUnWywBOb/oGaq8Ots3ed/M//mbmPj5ffpYLb4EkrEwmM50Hw
	m/Hp5eLGyFyahH5fIvebBph30YvxiaehFEZtHtOiYtsJrMCcM3DFaMiT0GlmpFog
	W8eGc7H/F3reeV40qmziW7OjoPKH19sPX8sxrFEg7ZKno2Tl6/59GU6IxFnaAf0J
	YuPYRWYTqIjWLPchs+0xgQdYEOgEx19zRb37ajMP30r7hfPrLZ1tiznEi1ZCXsJ9
	svrBQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dqaxs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 03:30:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21f63226a32so40751135ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 19:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739158208; x=1739763008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AwkNQeraw0pKo/G2XqtOAJfiNBsbtDJxZ8h6SQj83xs=;
        b=cqfhvoqxJR8zoihwfOBTTEDuvvCBkciqwd34wUeQR/t8HiCgvapcqeGyTDQ02AFZat
         HHzjZsIBYuP/pvAa8bjOght4G+icHjrGEZqAlEURSzkfNTuzQmlYFw+OXmSjCGGM1yfr
         LeKqU7U5ZEgqdw3xGrF75KHzpOIReqf0QCCWOLm5XE241VVhbfdoRf5aoOZ5eDCP8MW3
         r4Pz63jjxt3bBWabZczCmLVQxPKkr5fUdZlaR4sAwAds0QDKY9FhkWj1xANsRPDFM05P
         78jOQYqzfyK6ZD3W2PvTLVHNYZZGKbp4X7s2b1KnJNk0a6LncfKO3qnC9ArQbKH+Db4B
         XZLA==
X-Forwarded-Encrypted: i=1; AJvYcCWYWv62NssBoTh2n2QpgLwWaJI0Ads8sXZUuRRgfcpp1ZbgPSHdVLz+JYg87qPZEh6UhsACfMcAWEaR3Tp4@vger.kernel.org
X-Gm-Message-State: AOJu0YwbZMN2N4yhmYDYEd/OzEQ5owtPOK+VOTDV5U6qgn79CnL9Lg0b
	uTu2SCs7Jje8iwMQiCv0uKp4kmef7uofBepmVK3Com70OSzblX4LKsVZQm8ZCs00eLZmNKDeR5V
	/maMjf6bsu20lwi6TsLVahbpG6/NgHFWdOkwziLOQdGOpXSGtXKjJBiiPe0SNLJMA
X-Gm-Gg: ASbGncvtye2AbIYkTe4yQ0WWYUr+AWtXb4onpDhbb73kYFT5NPieyi5eg+FzPNs2d96
	P50z65tXeN02TvOcaBTFq4SBY78O5PuGeAFoRUs0xqZFN3j4rzO+QGenLGo0XBsKJCFWr6mIYDz
	XmvB/hAd6YBP11DcGnJPMvh8ZynfePt4EdiBt/o2MOoeFOBLvFyjZYb6JK4bz7uyyWP3ixoUlvU
	4kdHpGQ/3BfiIRR/YHsjosrIZYQDMrMpsbKj0vK+sTbQd10UeC0ODlXmcCokMJ8Bbj+qgFtBS3Q
	QG4hZzF+t2XbVH+PA/jTPv7aVWQg2e22gqrHdP4V8jlLD1WDq5f5pUVw9IYWqW8=
X-Received: by 2002:a17:902:da89:b0:21f:752f:f2b1 with SMTP id d9443c01a7336-21f752ff48bmr90602535ad.30.1739158207931;
        Sun, 09 Feb 2025 19:30:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFamdk8SI/XJe+Ru1g4LCGiJFWB6E2vqUrN3nUeokw/2YAjtYtz5OVPz4ggzDigauAaU7zeuw==
X-Received: by 2002:a17:902:da89:b0:21f:752f:f2b1 with SMTP id d9443c01a7336-21f752ff48bmr90602195ad.30.1739158207565;
        Sun, 09 Feb 2025 19:30:07 -0800 (PST)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d8d3sm66817705ad.156.2025.02.09.19.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 19:30:06 -0800 (PST)
Message-ID: <4ddd6855-3817-4dc4-81c4-d8ddaa039865@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 11:30:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] soundwire: qcom: Add set_channel_map api support
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250206112225.3270400-1-quic_mohs@quicinc.com>
 <20250206112225.3270400-4-quic_mohs@quicinc.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250206112225.3270400-4-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WxDTV06i0cJf52sgn1agaClyprLFCHyO
X-Proofpoint-ORIG-GUID: WxDTV06i0cJf52sgn1agaClyprLFCHyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_02,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100027



On 2/6/2025 7:22 PM, Mohammad Rafi Shaik wrote:
> Added qcom_swrm_set_channel_map api to set the master channel mask for
> TX and RX paths based on the provided slots.
> 
> Added a new field ch_mask to the qcom_swrm_port_config structure.
> This field is used to store the master channel mask, which allows more
> flexible to configure channel mask in runtime for specific active
> soundwire ports.
> 
> Modified the qcom_swrm_port_enable function to configure master
> channel mask. If the ch_mask is set to SWR_INVALID_PARAM or is zero,
> the function will use the default channel mask.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Acked-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/soundwire/qcom.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 0f45e3404756..295a46dc2be7 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -156,6 +156,7 @@ struct qcom_swrm_port_config {
>   	u8 word_length;
>   	u8 blk_group_count;
>   	u8 lane_control;
> +	u8 ch_mask;
>   };
>   
>   /*
> @@ -1048,9 +1049,13 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
>   {
>   	u32 reg = SWRM_DP_PORT_CTRL_BANK(enable_ch->port_num, bank);
>   	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> +	struct qcom_swrm_port_config *pcfg;
>   	u32 val;
>   
> +	pcfg = &ctrl->pconfig[enable_ch->port_num];
>   	ctrl->reg_read(ctrl, reg, &val);
> +	if (pcfg->ch_mask != SWR_INVALID_PARAM && pcfg->ch_mask != 0)
> +		enable_ch->ch_mask = pcfg->ch_mask;
>   
>   	if (enable_ch->enable)
>   		val |= (enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
> @@ -1270,6 +1275,26 @@ static void *qcom_swrm_get_sdw_stream(struct snd_soc_dai *dai, int direction)
>   	return ctrl->sruntime[dai->id];
>   }
>   
> +static int qcom_swrm_set_channel_map(struct snd_soc_dai *dai,
> +				     unsigned int tx_num, const unsigned int *tx_slot,
> +				     unsigned int rx_num, const unsigned int *rx_slot)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> +	int i;
> +
> +	if (tx_slot) {
> +		for (i = 0; i < tx_num; i++)
> +			ctrl->pconfig[i].ch_mask = tx_slot[i];
> +	}
> +
> +	if (rx_slot) {
> +		for (i = 0; i < rx_num; i++)
> +			ctrl->pconfig[i].ch_mask = rx_slot[i];
> +	}
> +
It looks like a hack.
Consider the situation: if(tx_slot) is true and if(rx_slot) is true. So 
the ch_mask always overwritten by rx_slot?

> +	return 0;
I think you dont need the return value here. Just void is ok.

Thanks,
Jie

> +}
> +
>   static int qcom_swrm_startup(struct snd_pcm_substream *substream,
>   			     struct snd_soc_dai *dai)
>   {
> @@ -1306,6 +1331,7 @@ static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
>   	.shutdown = qcom_swrm_shutdown,
>   	.set_stream = qcom_swrm_set_sdw_stream,
>   	.get_stream = qcom_swrm_get_sdw_stream,
> +	.set_channel_map = qcom_swrm_set_channel_map,
>   };
>   
>   static const struct snd_soc_component_driver qcom_swrm_dai_component = {


