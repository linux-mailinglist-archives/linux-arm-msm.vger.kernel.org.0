Return-Path: <linux-arm-msm+bounces-76185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4EDBC0FE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 12:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8576834DAF6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 10:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83C62D8363;
	Tue,  7 Oct 2025 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKE2394Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8C52D6E6E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759832352; cv=none; b=c4pUnf+Fkz3kZFjlu0GMimF7hyjxUO8RTYxlc0LCli7o2WJ8E5hL527mF/unsSrXGkcEYb0KDI6HA3eR7tdjfrIMZfSJe4k2EDLm3gFlXlMGpuLVzUUgVEdhXVBlsl/GyAXcap0l8O1JbXn0lrUxq/iflNW8G2N1zbN9YPo1hHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759832352; c=relaxed/simple;
	bh=f+IeccJmVNga2AILl1qN2cEOujm+nc2RdTjaS5M1sWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O/H+1R+oMq60N0ISEbRNlAfDDw87zAZFbqLvSoPBRZ2OBqSxtqdi8MAdbkaUXoMLm7nfvGYjt4vH782MOVucvy/SoFCrafJ39nlqoAOEDng4P5U6anmC9wO9EqsFiFdYm/BgZdn9NLRBHtby8v0VOeBRftCeaXw9wSdBhckwuL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKE2394Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59723sDc024045
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 10:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KYl9okkq0B42q222w2hbCFPa5Da9FkjQY+ECn6X4ea0=; b=hKE2394ZTv0/gvyG
	XxcOxDDnByqSoCSfBKS92gOR7vXdltx+KVLnwKTeo1ecvXIhj50UAhM42v7MziO5
	xswhLIOboF93kcWOAn684dwSzrw+2eTg71hAIZLyMcBZ+Et4NnDF2v/wXO+yVcUz
	4Tr9q6JIYXR3qMGB9AVnuJx+GpP1F9WkwlhXFewJOkPdSvLJLxm+ic3/UwuvbFwn
	3/3JQ6nWAFoZBE+nR9mqDgQwKT9i6EWZl28XgamGU6NiwadiuiIe0e0N14D9o3zR
	momEitGtwT+56y6DUGmaNOHpzWkWRb7RjoTz+5lWzeW+qc0/nB74AHSZv/GrbQml
	XmmqWg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvrhpq3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 10:19:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-85a8ff42553so104232685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 03:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759832349; x=1760437149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYl9okkq0B42q222w2hbCFPa5Da9FkjQY+ECn6X4ea0=;
        b=uaLBXOBsD/G/Blslu4V5xB6cNpQVQcgqZRqqRPcnTlYOc9tbrhyNphPlG2rJTxQfGH
         Lm/jbei9o2Su8Tm0RJmz/J/rjwih+tvkQz2Kg0CWI4v5ZLG9GXz2gL61rHkigPrCNg9D
         fEaF2j24sOC/dEsOxQHtH6JVG0i1Nu8IiaxUdPNVfIDy7y/KTDNvsoI/r4DSIOXCDvkb
         9wwF7xg90fDQZXIXwRwRx2S6cU5AzcDO8Bu8xsv25AQKxkXMyM0eXiEjzrZ2xjJ9D2tk
         mjchhQLER8dqV6cGm3ClCruNFzLlLUnWH9CnBJR6+Lj9wcMcowfczyDapOECpPDZNyZP
         PV9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX01jynsZULiaP2dQdDSced0QKD1ZuXVQEL2pcaXAkqIZje1lz2qpllXnXDpDVIam7cdsdP2Uanc++Uv2Pp@vger.kernel.org
X-Gm-Message-State: AOJu0YxEIUJRwl4ZE8cY1jXpMMJVvdSNQQoCWAvvrZ/rrJwMK3Fm4xXu
	wJbv5iVcUylugkNV5RMiLK6gPJnuZjeXwv6KwWEop1CeNyEjYBXqC+0dsJbPonj4KhElu6RsLxW
	KPd8+ZPJSzCLW95ou4G27K/RgbFishcRwI7/k55uk6VqQAjxLQt3omRX079Mpc7kkurpU
X-Gm-Gg: ASbGncvOF9b43YyJn1nzD2//n3d2XsnvxE2ch7MrPXFkZRp4qTtKAgkL84dEu3UAcWl
	8kHvZ/bVOBUAvbmeEuTEhBzRUoPzfbTyTBFbm1W5wnaIpVRjAgUZL63sfIOjNR+pDUTJuMn4HGk
	CtgiyJ73bleIOZCq1vCZoAmxszJw1lFNWMOMBzMOXZbKZu5oQmISzsXkNZkcPkFPakwh/w7vPpw
	OjT+lpYZSdan+f1ARARFtijyJCFrImws7u6x+nxrdqKQU9pEqhaK4XzlZ79U2CTtQEWBG2M/FsO
	Zii5JiMHmU4gbYnEmIEF9/qP/15vuRSRBSMu3MBPXAmVqlGo/dlAljtzBs9/HA4alRbaZNfmeoI
	Zl8KSM/weo/3YtUQWxvSWVGvy5+Y=
X-Received: by 2002:a05:620a:28cd:b0:866:6f75:5928 with SMTP id af79cd13be357-87a396bde94mr1282650585a.10.1759832348739;
        Tue, 07 Oct 2025 03:19:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7oK77CadVtU5NBMC6cv+bqw+nawnX8wVpYFSFkL3EIFnPkTvcFgfYb8qaCxAqZcQCHACdtg==
X-Received: by 2002:a05:620a:28cd:b0:866:6f75:5928 with SMTP id af79cd13be357-87a396bde94mr1282648785a.10.1759832348230;
        Tue, 07 Oct 2025 03:19:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa04bsm1365138066b.6.2025.10.07.03.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:19:07 -0700 (PDT)
Message-ID: <4aa81228-9b25-4b7a-8fd0-7e51e7d77824@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:19:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/6] ASoC: qcom: qdsp6: q6prm: add the missing MCLK
 clock IDs
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
 <20251006-topic-sm8x50-next-hdk-i2s-v1-1-184b15a87e0a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251006-topic-sm8x50-next-hdk-i2s-v1-1-184b15a87e0a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNiBTYWx0ZWRfX9udHwSTr9Wzs
 opZd3CIP3KXBfHEqNUAaqWUVKN2KWF2GgkNAvl5Oz6/gFHJCFt7OGn+hygiXpTFqlI3pxdWgWjm
 tEQTB0AjgFu4m4EmcSseu6oElzIo/S+NETAyI6fEkLVGUrQnsJh+1Vin92Nqclp9qEVtwNO4NEB
 Sni4WPakbhgUsx+Bwz3+X2WXgKHAuFwt8WfRHR4W6mA2kLTwXN+H/vPsuhnDygeycWDCUxmIqeC
 Zzh3o1V8nWu1qRl+9HsC8tTJDK0nZzqbBOPDn1Fw8e/nWTsNF4FNP01TjAxYsSlKWoE96AgZWo9
 Na18MbwFB8o0fqHwMScTOou+G3dJ5lQthdNpYSltYBVgQJdaa4Ivf24mqFwrlWIe5/Yw0y/4t0t
 PSbfUlwAUMBYHZsCoy6MqMYLCSOaAw==
X-Proofpoint-GUID: jYjtWvBWD8QbylhXcTHd6uXXbEKq4cMw
X-Authority-Analysis: v=2.4 cv=XIQ9iAhE c=1 sm=1 tr=0 ts=68e4e91e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=7KAZrCPtG2FJr_zfUZwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jYjtWvBWD8QbylhXcTHd6uXXbEKq4cMw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040036

On 10/6/25 8:37 PM, Neil Armstrong wrote:
> Add the missing MCLK ids for the q6prm DSP interface.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/q6prm-clocks.c |  5 +++++
>  sound/soc/qcom/qdsp6/q6prm.h        | 11 +++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> index 4c574b48ab0040bc39ae16ec324b41dfc152b408..51b131fa95316cff50342ff60bfc9e3608939d6c 100644
> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> @@ -42,6 +42,11 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>  	Q6PRM_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
>  	Q6PRM_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
>  	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_1),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_2),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_3),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_4),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_5),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
> index a988a32086fe105e32c4fd713b8e0a3d17b83bca..7a3f2ad7bbd465a6950568af1ff3839e5cbe4f62 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.h
> +++ b/sound/soc/qcom/qdsp6/q6prm.h
> @@ -52,6 +52,17 @@
>  /* Clock ID for QUINARY MI2S OSR CLK  */
>  #define Q6PRM_LPASS_CLK_ID_QUI_MI2S_OSR                         0x116
>  
> +/* Clock ID for MCLK1 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_1                                 0x300
> +/* Clock ID for MCLK2 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_2                                 0x301
> +/* Clock ID for MCLK3 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_3                                 0x302
> +/* Clock ID for MCLK4 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_4                                 0x303
> +/* Clock ID for MCLK5 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_5                                 0x305

0x304

Konrad

