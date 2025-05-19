Return-Path: <linux-arm-msm+bounces-58389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE6FABB7F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D7F43A5F56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 08:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BB31FDE14;
	Mon, 19 May 2025 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tg49GI5R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4BB4B1E76
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747644958; cv=none; b=eQmbC7O0KPtH2Iv+UGr46RDntkvJFL8G5iByg8smt1nbIv/LcKU2ygHHnF9zkTfMjrOaz5KS28LM3MSF5yNkWbdm80IsrdSJttDR9Xqluo3FiGbn53BeCrmkohSy24i4GXhNKW3SzmlB09vJUSwxry9tUvrS4XXOXEWdiCqyTD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747644958; c=relaxed/simple;
	bh=K0vti24UgOSsQ4ruq6gZQvCZo2mbAS4mzkYfBLYUldI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogbidP7gZZsDq0zjYFa8nXPVM8BPB6NvGjrGCF61Ks4fxmb2Ao1iPXisljrUX3+KiO+TWOZC36dso/S02fgDctxv0MOjVGOb56Lkx10d+zKSMRsb8aqMp4/+WULQchylYZ8trsOvOxeyWYHVk1cRPpgbp98ElUO8CdIWHpmdtHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tg49GI5R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8dkNM002941
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJDrsvBMltYMjK35MmAzj2BbAZsdbSWYh/aKVvhjTsY=; b=Tg49GI5RYdEpbsFT
	GUJKTFbPoaIHSIUfT+TlVxqmYhV7LLkdTxJo1v1oNHP7A7q3dZftqy7lGfIEyeEN
	duPsmDLheDz8AfsTHE/Okv9dkTqkdsI4VYFQYID3crWt/xV4tRPs2/4dMUksx/0E
	Y5aQNpFIdXcmve+D09cik8hntNtLa/wgwjH/eCzkmz2K3XDkP6XOwQYxmoe1cAQu
	4Ys5eDgq2tqYzp1uTXULGZJdEx+ockK4x3vvKYuBxppAmoVTfbezU/WMpaC7dn6C
	YTx8mnq0K7gkUkk5EcN1x43k4/otOaL3ndAx4qVYPvqWWD1r1xx/dbmL7aKoycEK
	Jhk/BQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atg1qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:55:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8cc1c047dso24576786d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747644954; x=1748249754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJDrsvBMltYMjK35MmAzj2BbAZsdbSWYh/aKVvhjTsY=;
        b=AN7vwSCMZxD794ZUmraKm5Y34w56a3t3f9tqvFeqvq+Tzhj7CXRB9tT6B1gD1PvQYw
         eqEFCcMK9oaOpuYvChwZwNEXS+TvNpO1MbuUx0Kty/z9esVwznepkBH6qZOjoLFgglOy
         SyskWwjA8LuZuIPhHpHQAIigOU2as+09HXNlbrta2q4+/2by0D3TJz1ulObuNcw+20VQ
         m6p6puzRi+zcR/uzua4jUTKYW7S1Xm0JfgKVtaHcnhZnGGeNEL//YHSDBJ/c0barmzBj
         pq7qDJyL2jAa/dL+/4bRN3/iE72CZ1zt5WKki65+pCVT8UvludrbrJlYp2dXNDZQ/mEY
         Ba1g==
X-Forwarded-Encrypted: i=1; AJvYcCV09yRRwYbH3sImE9bKQRIygh92xGfkIoBICOjqQ8vZQ15NPfJSxjE2XsfJfaerVnqqnvQnRkfbtIO/NNC3@vger.kernel.org
X-Gm-Message-State: AOJu0YyGur6OijMK3nBy1T3C2bXSzSskKNXW6s10bw+dUNYnzvGMzu2V
	40bCL+k7ezHaMpoBR6yjz6TNFTTs+GjWUkEcJXVNMqsR5Lvav+04jYiqoIWl0YZJHhDFYaP2xhO
	9urXaaujPk/1XQmKnO6LoO6sJet3g/A/flA1FFEvC/okF/KJ8EjzzDY08dkNnl7B4AMIA
X-Gm-Gg: ASbGncvbSORMm+N03U+aDoVn0oCRxOgkySa0cf6zPmgveW2xdcZ6BTqY5lv7ZNlSQUa
	8yn+MEYa746G+oLw6Q1wRGbAY9K+ifnVUsDOvYdZI5ATTgFgO6xGYAMR6ernM6iSRGaHgRNjkuC
	5cbtFnE9hnyFaxgyxV1Q05lJ5pio2sRAnNCcmpMZMrLGnXae9vNoyHX0uFY3LzXUWDSLPPxSPEP
	ZNuPbQhqymIdYwD4debsRh1JyhMNX7ZVQ+KKukg69v5z/50ig9+un0B5TiMHO5cESzxB/KC22u5
	ZedKig6YG9taLSLfMSzzZDFhE7AVKo02dzRWIw==
X-Received: by 2002:ad4:5e8f:0:b0:6f4:c15a:62d2 with SMTP id 6a1803df08f44-6f8b0877c06mr205380516d6.20.1747644954535;
        Mon, 19 May 2025 01:55:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErzNEm9Jhf+vM6qFifeQXZGioPWFCKXVSnYAhJt7/k+6Qe2F/OgdHap1Eg9GiydsmOPQVlaw==
X-Received: by 2002:ad4:5e8f:0:b0:6f4:c15a:62d2 with SMTP id 6a1803df08f44-6f8b0877c06mr205380316d6.20.1747644954157;
        Mon, 19 May 2025 01:55:54 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a367205338sm8348074f8f.98.2025.05.19.01.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:55:53 -0700 (PDT)
Message-ID: <9d59167e-6fd7-462c-8a5e-5781babdae02@oss.qualcomm.com>
Date: Mon, 19 May 2025 09:55:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add sound card support for
 QCS9100 and QCS9075
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
References: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682af21b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JQYwrvYeIx7NCKdDp24A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 8oUg5CSZtlsdEWQEtDYBKHypB_-T38OG
X-Proofpoint-GUID: 8oUg5CSZtlsdEWQEtDYBKHypB_-T38OG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4NCBTYWx0ZWRfX9mY0KSu0eZdc
 V+y2D2HTtLDTCHS3PwRlPJD85gEYgWZvvmu3zDRjR8aprTRuFbTjA5jhmIAvtTt3gZy7ZknsYaL
 M4pO++FCXm6O76LH1DD4bxwL59aA/9m8RWo86/UDwR322cUoMfPUD+pLq5aOdyy0whzPl2Kits7
 zb7hGYlJpkkurqGUCb5NH2SyQnCZAFqtBVsRA/XEwmrAi3pGYeRL11ukHtgQDLP9eLf8wicOLQK
 ZnDcBP0dJ8OQoP0SZrTx6vDtmLZrZ9gMlVvUQFupz+BSZ5loFUAFpUujYinepesR5RFKG6Lsn9I
 Owflu1Uftv7qSthLigTKrLxiFirnxQp54bZYgmdBHh82tEYCiRPmGrm9hE+SeVtdz4FgLz20/PJ
 Z0YWdYz3WS5IXkzPHSRYza6ZRC6rblE3Fkcoa4knI3Z115TjiJqPRy+qQ/INr75rHjONG3EX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=959
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190084



On 5/19/25 09:32, Mohammad Rafi Shaik wrote:
> Add compatibles for sound card on Qualcomm QCS9100 and
> QCS9075 boards.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---


LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/sc8280xp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 311377317176..99fd34728e38 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -186,6 +186,8 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>  static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
>  	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
> +	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
> +	{.compatible = "qcom,qcs9100-sndcard", "qcs9100"},
>  	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
>  	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
>  	{.compatible = "qcom,sm8550-sndcard", "sm8550"},


