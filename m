Return-Path: <linux-arm-msm+bounces-72267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 441DEB4553C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1869C1CC41D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240AC311C33;
	Fri,  5 Sep 2025 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ilQru3P+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9DE30C63A
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757069211; cv=none; b=BoMBqmQ/F9urpKy5O81TpKFxJ6ahYm631DwoZkn91fFKZdQoWW+vPkZmU5p7kQ2R+QrYWRsupGqP1Z9CsPBO/oL0i1kxGVbmhYHBxrOhCflY88MclVpNur26dV7RcTipGCMhvTFXLCgJaMiz3pMJgL0/A47CuSmHGzMV0DKx+oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757069211; c=relaxed/simple;
	bh=c69T0jgOkThTayMwwmAnD70UzymF4qdce1OqRpAydq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNecmAUVP735XH2rA4EUSeV4dSNnFEMnb/az5nDkjvkSrGJhME36Xto5GdAjY0YaQE0A0SDGScv0Z3PWwfy0fTx5iZjNlZN56NMUcMfMByN0T1EzhKWVeR8Ar6U1xS4NHGx5nNR6s5ZvYwgXrD2Z0hBmWKmPNjF0T0UMw2lPs7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ilQru3P+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856o0HE032207
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 10:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBBHXfngENXI8mT61mc0Kv/t7nDhmuKG6UQNq3EaiCM=; b=ilQru3P+OYSzvG62
	9iH6ynLngfOSL60vYuKJ/LGgeVZvIoJ7QVUwQ6RUQnNBsxOiFJBlgMpp/M0gie2P
	TKVd665l3KcU4B6PRc+/fvs6e4Jkgyfm3rg8dh7mz2QcGr3aoGp5ck7mtaI9P768
	Mut43Zkyr7tLDvxqjdSsGMFN+Lfm4BFwDKJYKESs+Cr9CT8Dq20UxSgiGaItZuOj
	p4UOmz0QTRy4f6UHqXofmyUXo9KMrD0xK3HJomAlX6eFaSGB1+L7f0T7H43agNhS
	28PNKUR9vUC2iVVWydQ2iN+Titn4VSJbta+32o8ixnR5MhkXskrIvXSU2k07Ybbo
	VXcGAQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpjyqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 10:46:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b302991816so40550031cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757069207; x=1757674007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBBHXfngENXI8mT61mc0Kv/t7nDhmuKG6UQNq3EaiCM=;
        b=nNEKAbbs29AlDgy2ZmlNtpQH0fW8b5jaiRQs/4q0z369PKbjzxtvna/2BZhC963nwO
         78L7FDHxDw71ml/ScpNniI4edBovAzgy+f9ojMod1lGen1XnqbiWhQFN23JwBzZN4OiM
         4/Si/QTzyDGATVKegFKKD3fJWOZgOjRdEZMiOIavjZ7wBC+pkvNLDmHn707jhvWujzzl
         4arQozsGHeT58uT7INf7PzeZdATb3zmrG8u/m6KYElaeOpHa3StZYCcSV1US8mzzB4ko
         +QFR5Xg0b6TyFvXSg6Wj+3oW3iGuDomFOJknKOv9uOTvDN2gbUT0aUPrYZ+3t35HlR74
         nnWw==
X-Forwarded-Encrypted: i=1; AJvYcCWqYZR1Qhizs9Ea5pJy16EDZFTGCYLhqyqTFs6OW4Gox2PzK+tj8FWkwNYH3Yptm6WkL7H/xAN/UihCmjim@vger.kernel.org
X-Gm-Message-State: AOJu0YwnPMEz6YzyNTkWWowUfl4+TWeib6900LrXAkuPNtxVyTRqZEgi
	vRku9tteBE0j4OT6ccsJ/JSAltrZyKjdHHFrCDPKpTfIIR1cXr1KAnLxHJY+sinu74UCGD97308
	Sa4lEoxTTPLCBZj/Ozx4Mi0CsDmY1XO54k6EwJs+EjclgvzFI8sSxkcTfbxXwN6gpENkv
X-Gm-Gg: ASbGncugK4ZvBQ/+33runFEpUTAGuY6JJqkgsbVIT04ECQ7qy7AorS339IbHJ3lGZpu
	Q8VmeCirZ9sa62pcm2gS129bIdkHj3QBO9IKfU4b+Cdhw+Ly/roW7Sfc+oeN55ol6Cnj58f7/RK
	yN1WPf5871G68U55d1o/LRNAjiGCVJHtnasgEhcgM96HyUjuWi58SqjmZaRD6FHtqYIZfgULwZS
	2eMzDGSBOieF4QjSKS5n077EopqRX2OWfIUQY21c2HJdye0Mfb921QbPe3AcmvkTYfKvPYqJiny
	q0MAZFcBxF6DmO6cR5rVsNevxTQxceHMQ528+U9z3SPDZZj4pVh2YKPtzHHL4mju4UY=
X-Received: by 2002:a05:622a:1984:b0:4b4:95f9:ada3 with SMTP id d75a77b69052e-4b49608f3a5mr86730821cf.60.1757069207444;
        Fri, 05 Sep 2025 03:46:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQqj6dB7alP5gAR2caFRsDZXzAkiYd+2/yrt4ytCgTJNhHVzYvVg/u/9CJtN/0NcPaN0ITOg==
X-Received: by 2002:a05:622a:1984:b0:4b4:95f9:ada3 with SMTP id d75a77b69052e-4b49608f3a5mr86730591cf.60.1757069206953;
        Fri, 05 Sep 2025 03:46:46 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d1319sm359312055e9.5.2025.09.05.03.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:46:46 -0700 (PDT)
Message-ID: <a9eae2e3-0e75-4ffb-9de1-3b8a9bce86a6@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 11:46:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ASoC: qcom: audioreach: Fix lpaif_type
 configuration for the I2S interface
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905104020.2463473-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250905104020.2463473-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LnMska7Kq1nyfGon5VhF-vPD7KLiCdIu
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68babf98 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=mFzK8rC3iHN2mybPfuwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: LnMska7Kq1nyfGon5VhF-vPD7KLiCdIu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXzTdJcw+cqmeD
 6TY3xD0CjyhPY1Q3xTckSCIhuh2WM1iTgOmdFOvtbquEnujJCf4EF6MtrvztkXOFz7AcCvloXRq
 cPx5ghDE+S059XmVxBLrQsVYSgMN0p4M2HGYrW+OFfuHlTWKDNkoA6IAyMUbL7cd6ZAgWlEBkQ8
 t8nJ8RvnYt46rKRI/8+HhQdxv9zhzGz/76xEvaJkEFNKyGduifq5CI8lLNSbOsMLafh39/IEf/d
 DvRpTe0BhK8VXlfhmSIlspoYda37fQtJuDoCdwkY5jiZu2wPjdvkRTOnAsBOFfVZZ5xDroqWifp
 TcoOoD7Z4VaXyTskf5rXGf5ULl+ZZq8uyQ6ZUQq0D8GD/aPmEhOSwcXwLJbGDAQs7ukJrcnjYrW
 BShjawuX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On 9/5/25 11:40 AM, Mohammad Rafi Shaik wrote:
> Fix missing lpaif_type configuration for the I2S interface.
> The proper lpaif interface type required to allow DSP to vote
> appropriate clock setting for I2S interface.
> 
> Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")

CC stable tag is missing.

--srini
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index bbfd51db8797..be21d5f6af8a 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -995,6 +995,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
>  	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
>  	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
>  
> +	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
>  	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
>  	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
>  


