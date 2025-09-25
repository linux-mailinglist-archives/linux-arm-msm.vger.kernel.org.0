Return-Path: <linux-arm-msm+bounces-74897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28356B9D43E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D92CD3274FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF832E6CB2;
	Thu, 25 Sep 2025 02:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYh8zZdb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC95E2E6CA6
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758769173; cv=none; b=Z4yfJHxrDwRE1qQ3DnLOrLGK2/0paO7aUAo5dLDkPdDSoV7NQXVJNBHuZHIlMilbMhyrTQ94fXiLnCHFMPj9FeCWASpg6501nodneAuRdiGtFG3eUPtyD/OJc4+Lo1s9FyqcRzKW7/c8nOKHokV9vb4ovhlN4nAGJqEyfDEkXR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758769173; c=relaxed/simple;
	bh=gWp+RwukaHXXQOdYQ68gcT6pxRzuW8r0v6Od5sh551w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjiomiM5aL+j39yotwEjLR2Vx4wQbfxL9InTD/5DNxGtMGH95HG9avemNv57nwEEbeqEqFBVcellIC7vPsWYojFHYJiQ3qY1zai7dG9rQ8l5IPa6eNlAMoPUbGjlL19D/WS1GhCeplEJ3ELynY66eK+3nPhSJsuDEMsNI4oVWGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYh8zZdb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0Wnf8020144
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KUkSZrEB+7wwDzk+xOPFFNAq
	wUcknZyQi2qYnntju00=; b=hYh8zZdbVDFXMYczFtJMbxYdsxLlUZcdvGF3pBgJ
	VR7KtARJOu4YQOfC6VikKMumYVzwdIQfAXqIrYakbSc0jkCWNRJojipltMVyPgTg
	osG/2z9n+wRlyhQetruurCd0mnSf2WQT0YTjZvJpa7AONpZKshCZAaGQICt6W3uX
	EhTgbjHo8rAaQ9iTzAqJSVRM84W5A4hhM+o3Zx/QMD0ko7uKGMwu3PSUgerlJi63
	WWqr6dMDDXP1ngLH6LL8KYVX4mkJ5PSTbUiZqt7/0veMGuYl7HHDYIDdU+ImTlsu
	T7PDZmOaymH96DLUmfUGpWhAhymH6W+soaoU4BdFsVf7uQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdyr4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:59:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78e30eaca8eso13529596d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758769169; x=1759373969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUkSZrEB+7wwDzk+xOPFFNAqwUcknZyQi2qYnntju00=;
        b=XjnkKMANyExhhY3QY6DtuTg4WmT7GPX6LzVshHvQEjiqvjdLxNz78tLTTlk7Lb0fje
         dvmfy//bkUkqfcTBEQ8gd0c4iPeEF36LYXCZL+CHCeg0pSlVDi+OUlLJsrhwCqk0wCgK
         4cgT4Tp7JrqjzZLKAaojFWkOLezIQPZOF2RtCnyaOgcp2Lyd9SJ9BEBU7bx5P+jrpqYn
         Icfbggg4gYlwhCupBprX3rG8u9DbeG6jEfzc3/TwCfrKgG9if9+LZUDIZRK4or4vvCTz
         rZpTPC/ok5BvUIb4ylv85B9Kfz68knCJfd5x1xY+rlabJF4cmE5q4Rlk6QVObzaiQUxq
         sXPA==
X-Forwarded-Encrypted: i=1; AJvYcCWsv1d+BPIb5KtQk+wcL/psqSteL/H1QMPHbDXjBmiF0FeZkEiUNFKj5cXsg35sD5EI1I7etIQEsUVOHiVW@vger.kernel.org
X-Gm-Message-State: AOJu0YwUBHIDTx4rKxMbcOfc0ReJDWPvvUEy6i19FZTkS6B7rMqzktIY
	dvLed5wnru7q7cdxmZ9mHI5iL+Ld10/fXd0fBKS2EjstG+U1UrcGTbUmBfJ3cxzq8PpYVSueLY5
	hHz3i/HRfLFU7OL3UMmqSMKgvr+zxzLUgroB/TARBPxJjgqBs3krj5yqfmm+jdeqm+xSf
X-Gm-Gg: ASbGncsm5cGyvJic3DhysQRrnEvOmelpYaa27/KELYW53wZNGqamlSOJivsnPpfCZMi
	sUrTHrv1QuKMp6P988K4c/DIoOT8JznYxfGJN8aTjBZlz+swfNEh/8v30zvImLyu+ZQ30d/govx
	tM0/suQfuNfkNfkHCrc3yNWSo9MierxqwBNq9zelIyaUI8qIw9i1wohxhupLq8yg/+Y4VYtdEXo
	G9QmABUunoFnJZfNz//4s3bZbRVs63Q97qGBvgT+3yXQzIlE4QjBmaTzhmHPzxQRyHR27P3JE2C
	8+2X/tQYAdwRS6ofG3aK3KoYr4gVmxGShquAO6lVHM4sTu7baDxpOjdPKcFKcWGx/GOgu+SGXAz
	5l/HrQoosOit7RlIITY4FkA0dNdz/rco2WA7vw5ia57je5o7MV57z
X-Received: by 2002:ac8:57c9:0:b0:4b5:de80:10f0 with SMTP id d75a77b69052e-4da4dcc498dmr26475001cf.69.1758769169468;
        Wed, 24 Sep 2025 19:59:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbU2tPJev/yLAjKJPRsx1oGdBDYTwvY4oft/2UNElSiRbI6I5eMzUIs0+rpDewl6Pepf+DcQ==
X-Received: by 2002:ac8:57c9:0:b0:4b5:de80:10f0 with SMTP id d75a77b69052e-4da4dcc498dmr26474761cf.69.1758769169048;
        Wed, 24 Sep 2025 19:59:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561a9sm263826e87.74.2025.09.24.19.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:59:28 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:59:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] ASoC: qcom: sc8280xp: Add support for Kaanapali
Message-ID: <ru7km6vtbxwnoqtt2zf24si5envayqh7qy45mc5molevrgt5pv@g32atkcwqyan>
References: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
 <20250924-knp-audio-v1-3-5afa926b567c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-audio-v1-3-5afa926b567c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lTttvxVCwUC2TauKVmNTSNBPoaS6d28e
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4b012 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4OgBFdbP32ImLjEHi4sA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: lTttvxVCwUC2TauKVmNTSNBPoaS6d28e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX3o8uCKs/gxIr
 fswFrgFqQqm6vh5akYRznU24t3YopRB3rpmru2XgZuVuwr/Zhmwc7LgTVZQ99ZKBhm6nFlFHhqP
 bUiasTPmDcBF91jZI1ohFtWnh7sELZZYs0C3YyWzV25Hg6fH8D3paAUcICCkAUthDUKD3rNr26K
 cd0yhTLSko8W+xfG1h6Yo3AVTn4gzqlKPse7mssKiwEl41GoQwSjg2wDOGu323YYb0irpFziffF
 AnGh/AoDK3BKm+/NSg7WovdWhXEcGzibccJtuq7jQHCouoHimozI4Ozq+RG+qCA8SOVjiX01dy7
 GB+Ted0+pMvZFRP9lNDPhwongjN2qeagtp+CfneC0VR1xFjEcSKeTv0l7kHbeI7vFh+TDqajYm4
 CyccBxNM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

On Wed, Sep 24, 2025 at 05:01:17PM -0700, Jingyi Wang wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Add compatible for sound card on Qualcomm Kaanapali boards.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 288ccd7f8866..e231112175d9 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -198,6 +198,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
>  	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
>  	{.compatible = "qcom,sm8750-sndcard", "sm8750"},
> +	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},

sorting

>  	{}
>  };
>  
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

