Return-Path: <linux-arm-msm+bounces-61721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3AFADECC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 14:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE2DD4A5253
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 12:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A449B2EA486;
	Wed, 18 Jun 2025 12:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/mqFCxW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5682EA155
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 12:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750250051; cv=none; b=Ily5fWqF/WIQkn+IBxpK2USKIYh1YVp4qJNLktD0u7glAwnjs3U08XPpsfZ6335PK9ujRdJXRK6ucqT6F3Qv1sgfXPQe9doo7mPsANFa1paPxIjG36WYSNwwNh9RahN/cJ4SN2PZM+E6XkR8w44p23QsZ2h9qOExJKJFQCNy2M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750250051; c=relaxed/simple;
	bh=LHuWM7ztPWhVr2EVCa7CXadp0RwlRl4KOvg2bTSK20A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQN423N530iduE2P1SiiYuv7Wd6b2qCHKjcwPxhNdX3ZAPZ6+pmCTFJw3M/rYs6b+BCQ73B/TRFm2W5h4TWWBbRhBEtQbTd+ZmFB3E5a9s0PBM0KXOlEUzlJvgt75ab6eQgPxRwUJWQIFwSASLnZ1YTgM7kidCTuSnpOrZK3gsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/mqFCxW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9GblC024672
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 12:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eRMFOT/3PMbmmB1Uw0yQJVEOADQQc5KkeNtsfpN1UNE=; b=P/mqFCxW/4QSRV1/
	37pIrJw4kzfdLphMJ07MHJF1jNz/3/49ZJHyje/rOwfUztGMP5HFGRp6i4Jh1G4Q
	mh4gHE4scAXHlSKGBxSyI3m/BBSC82GI+uDd26BlAn4qz/Rj7PETOR0HVlyRKZI/
	iTTSdV3NzjfTkDGBLngLKlVF7dmhppQhzkNF0P1t9YJ7G4cpFao1jC9EpAVdozXT
	RatuJjCPu4SFYtDE7ux2SbJktRcQ0lA4z/AEw0lR+SifCLArMGgMsCzw3D+gIjPE
	RsUnOetSpOvO1D98A8LizC33cQuIe66Sp4i/mo5DSrEhZ5FdScD82Nfqg/JZhjLy
	EtLt2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca47cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 12:34:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c791987cf6so162921585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 05:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750250046; x=1750854846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eRMFOT/3PMbmmB1Uw0yQJVEOADQQc5KkeNtsfpN1UNE=;
        b=BownOoxrFgyx2jLGlZE/uWdBGBFYEYeJr5h368wo12c6GBzJkRge53gLhgVApqsxkA
         P2+AfOAbcU4bLFaSnPMXz66EvRU9AlIeXI1HfSfRG+0QwW5rYpVGD12YUtlbz0OHhcjc
         3yFej7uTzy6ep73IwOpvApIJA6mFPKJRagW0RCUWz7cw/7UKHuktAxr0VEaR4snbPris
         mLFPK7F0MaZ8IBV8CHHV7NbBMH3miki8IrhsdgDlFSgrus9/kQn6yeghLmpG4ME6dxtt
         2GNpZZrADmdaGUwPlW6KEJxAlS+8EMP/cTH81HwATPR3L7wTFIn9jbVWCS8CZcQxV4e7
         AOSw==
X-Forwarded-Encrypted: i=1; AJvYcCU27Itzeq7HA6N86nAuw6snHUnJLyvBtsrAhHcNIPyjBa6EtWmzb95ivz1y3mqziSaZq2HSZjXMeHnYxphx@vger.kernel.org
X-Gm-Message-State: AOJu0YweMvJERUTehuI5o8gjPpvNEliwbAiEqJYRVVcm3fheiasez+u0
	RquEa78JvuxiAYaM+nIl5/IylKPCUK7HZ2L1JB3JzhQEeUXAANUZZ2CcLWkGrVnndEmbvpbXxKR
	hg2FJupKwsigwhZTfzHWlqq7b0EIgmxnbWuMwpVwekctymREeryveFVHMlgExFFgk134A
X-Gm-Gg: ASbGncuQWtuv01p05qe89BAml0Pu0SZiRc22zmrNios4jGLBXELN88gpk4zI27nIO0W
	8RBCb+yCk6Pw9+gYdt5s4I2qqSI8IVKL/ZcBhVJMhrialjhBkIPfZUG8JqI77xCMg5Swb3vTI0C
	Sx04LH26ZeJ+9jdmnQci8Mk48Y4kER+CGCgWH1jNYSQJheRY6S42XMx3Gy86AkWr3D/r2WvAX82
	dqmofk2gxIRR2EvVXwVCdbaSUVnHrU5mlxzusmtfSwCPgFXELgTYSf2TpYz84KueG2pgnbrUQoS
	xfe+hI3Utve9QfAe0xQNevx/5rwdHYx29lY8v2FTnkDPyZBl
X-Received: by 2002:a05:620a:a20d:b0:7d3:e83c:951d with SMTP id af79cd13be357-7d3e83ce085mr412952285a.21.1750250046577;
        Wed, 18 Jun 2025 05:34:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmOq0+HrAD5r/cYf5XwPht6kA6wl8WHkSrFkKeJLapYf8ANWSDAI5kyUuHdTLnUrshNBaNyA==
X-Received: by 2002:a05:620a:a20d:b0:7d3:e83c:951d with SMTP id af79cd13be357-7d3e83ce085mr412947885a.21.1750250046135;
        Wed, 18 Jun 2025 05:34:06 -0700 (PDT)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4535969b60asm13435595e9.0.2025.06.18.05.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 05:34:05 -0700 (PDT)
Message-ID: <c4d934c1-0218-4147-882f-279795bcd1f4@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 13:34:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] ASoC: qcom: qdsp6/audioreach: add support for
 offloading raw opus playback
To: Alexey Klimov <alexey.klimov@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Patrick Lai <plai@qti.qualcomm.com>,
        Annemarie Porter <annemari@quicinc.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel@oss.qualcomm.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
References: <20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org>
 <20250616-opus_codec_rfc_v1-v1-2-1f70b0a41a70@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250616-opus_codec_rfc_v1-v1-2-1f70b0a41a70@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KPKUwUCJkGhFqzZGCDS2-kd1g0JFFAlv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNiBTYWx0ZWRfX6rS1ip2cgV3O
 pII9qBSASNk/sc8QV8fFQpkVBNg+c7AueQ3y3inxUoq9RixcL25QZsjx/a+c0xo87H5aGjWsyBp
 y8CDVA6kqbRjVtsnONXB/onoiFCwWkdTzeBzhpOO3ESgmYCwfEED7uwkEZvDjJ4meyPojXriD1z
 dgX45tz/FCcSFNcdbzTOpMHU4gftp/CiF8SWr7g8qSgD5UEEGjesQP9hGJLIZZSol3j01jelQh9
 aQ1ihCgGWMEMmHEgpW3Bxa3NKOs48IHum/i2WfNCpeshSX/v2X2zEcQ3xUnbw0oKsbtNsrfq75q
 BIZkAAF0Iq5y4svIT817VU99ApUA6e0zrthBUDqIz9yURKKci9rGCPuNBHz9j1AYcEJ3k08dnjq
 NeqDni37x3+qwCQ90+9zYmRw3nmhmSzVpbi0wle8cjTAhO4z1uNj562tN7lm91etWyhizWEa
X-Proofpoint-ORIG-GUID: KPKUwUCJkGhFqzZGCDS2-kd1g0JFFAlv
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=6852b240 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=9AdGPr7lSesGDd7r4mQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180106



On 6/16/25 4:26 PM, Alexey Klimov wrote:
> Add support for OPUS module, OPUS format ID, media format payload struct
> and make it all recognizable by audioreach compress playback path.
> 
> At this moment this only supports raw or plain OPUS packets not
> encapsulated in container (for instance OGG container). For this usecase
> each OPUS packet needs to be prepended with 4-bytes long length field
> which is expected to be done by userspace applications. This is
> Qualcomm DSP specific requirement.
> > This patch is based on earlier work done by
> Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Thanks for picking this up Alexey,

Same, co-dev by should be good attribute for such things.


> 
> Cc: Annemarie Porter <annemari@quicinc.com>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 33 +++++++++++++++++++++++++++++++++
>  sound/soc/qcom/qdsp6/audioreach.h | 17 +++++++++++++++++
>  sound/soc/qcom/qdsp6/q6apm-dai.c  |  3 ++-
>  sound/soc/qcom/qdsp6/q6apm.c      |  3 +++
>  4 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index 4ebaaf736fb98a5a8a58d06416b3ace2504856e1..09e3a4da945d61b6915bf8b6f382c25ae94c5888 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -859,6 +859,7 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
>  	struct payload_media_fmt_aac_t *aac_cfg;
>  	struct payload_media_fmt_pcm *mp3_cfg;
>  	struct payload_media_fmt_flac_t *flac_cfg;
> +	struct payload_media_fmt_opus_t *opus_cfg;
>  
>  	switch (mcfg->fmt) {
>  	case SND_AUDIOCODEC_MP3:
> @@ -901,6 +902,38 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
>  		flac_cfg->min_frame_size = mcfg->codec.options.flac_d.min_frame_size;
>  		flac_cfg->max_frame_size = mcfg->codec.options.flac_d.max_frame_size;
>  		break;
> +	case SND_AUDIOCODEC_OPUS_RAW:
> +		media_fmt_hdr->data_format = DATA_FORMAT_RAW_COMPRESSED;
> +		media_fmt_hdr->fmt_id = MEDIA_FMT_ID_OPUS;
> +		media_fmt_hdr->payload_size = sizeof(struct payload_media_fmt_opus_t);

maybe sizeof(*opus_cfg)?

> +		p = p + sizeof(*media_fmt_hdr);
> +		opus_cfg = p;
> +		/* raw opus packets prepended with 4 bytes of length */
> +		opus_cfg->bitstream_format = 1;
> +		/*
> +		 * payload_type:
> +		 * 0 -- read metadata from opus stream;
> +		 * 1 -- metadata is provided by filling in the struct here.
> +		 */
> +		opus_cfg->payload_type = 1;
> +		opus_cfg->version = mcfg->codec.options.opus_d.version;
> +		opus_cfg->num_channels = mcfg->codec.options.opus_d.num_channels;
> +		opus_cfg->pre_skip = mcfg->codec.options.opus_d.pre_skip;
> +		opus_cfg->sample_rate = mcfg->codec.options.opus_d.sample_rate;
> +		opus_cfg->output_gain = mcfg->codec.options.opus_d.output_gain;
> +		opus_cfg->mapping_family = mcfg->codec.options.opus_d.mapping_family;
> +		opus_cfg->stream_count = mcfg->codec.options.opus_d.stream_count;
> +		opus_cfg->coupled_count = mcfg->codec.options.opus_d.coupled_count;
> +
> +		if (mcfg->codec.options.opus_d.num_channels == 1) {
> +			opus_cfg->channel_mapping[0] = PCM_CHANNEL_FL;
> +		} else if (mcfg->codec.options.opus_d.num_channels == 2) {
> +			opus_cfg->channel_mapping[0] = PCM_CHANNEL_FL;
> +			opus_cfg->channel_mapping[1] = PCM_CHANNEL_FR;
> +		}

Pl use audioreach_set_default_channel_mapping() to fill in the channel
mapping data.

Why are we not using channel mapping info from the snd_dec_opus struct here?


> +
> +		opus_cfg->reserved[0] = opus_cfg->reserved[1] = opus_cfg->reserved[2] = 0;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
> index 61a69df4f50f6cc90b56697c272ade6f1411bbf2..512ea24fd402c95f98db790313b756a5ba3dcca1 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -29,6 +29,7 @@ struct q6apm_graph;
>  #define MODULE_ID_MP3_DECODE		0x0700103B
>  #define MODULE_ID_GAPLESS		0x0700104D
>  #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
> +#define MODULE_ID_OPUS_DEC		0x07001174
>  
>  #define APM_CMD_GET_SPF_STATE		0x01001021
>  #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
> @@ -255,6 +256,22 @@ struct payload_media_fmt_aac_t {
>  	uint32_t sample_rate;
>  } __packed;
>  
> +#define MEDIA_FMT_ID_OPUS	0x09001039
> +struct payload_media_fmt_opus_t {
> +	uint16_t bitstream_format;
> +	uint16_t payload_type;
> +	uint8_t version;
> +	uint8_t num_channels;
> +	uint16_t pre_skip;
> +	uint32_t sample_rate;
> +	uint16_t output_gain;
> +	uint8_t mapping_family;
> +	uint8_t stream_count;
> +	uint8_t coupled_count;
> +	uint8_t channel_mapping[8];
> +	uint8_t reserved[3];
> +} __packed;
> +
>  #define DATA_CMD_WR_SH_MEM_EP_EOS			0x04001002
>  #define WR_SH_MEM_EP_EOS_POLICY_LAST	1
>  #define WR_SH_MEM_EP_EOS_POLICY_EACH	2
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index 2cd522108221a2ec5c7bbbb63f7d4ae4f8001cf6..7da91ed297f4a5ed39ca0747804cabd579634b50 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -550,10 +550,11 @@ static int q6apm_dai_compr_get_caps(struct snd_soc_component *component,
>  	caps->max_fragment_size = COMPR_PLAYBACK_MAX_FRAGMENT_SIZE;
>  	caps->min_fragments = COMPR_PLAYBACK_MIN_NUM_FRAGMENTS;
>  	caps->max_fragments = COMPR_PLAYBACK_MAX_NUM_FRAGMENTS;
> -	caps->num_codecs = 3;
> +	caps->num_codecs = 4;
>  	caps->codecs[0] = SND_AUDIOCODEC_MP3;
>  	caps->codecs[1] = SND_AUDIOCODEC_AAC;
>  	caps->codecs[2] = SND_AUDIOCODEC_FLAC;
> +	caps->codecs[3] = SND_AUDIOCODEC_OPUS_RAW;
>  
>  	return 0;
>  }
> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index b4ffa0f0b188e2c32fdfb863b9130d1d11e578dd..0e667a7eb5467bdd65326099132e8ba9dfefa21e 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -354,6 +354,9 @@ int q6apm_set_real_module_id(struct device *dev, struct q6apm_graph *graph,
>  	case SND_AUDIOCODEC_FLAC:
>  		module_id = MODULE_ID_FLAC_DEC;
>  		break;
> +	case SND_AUDIOCODEC_OPUS_RAW:
> +		module_id = MODULE_ID_OPUS_DEC;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> 


