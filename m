Return-Path: <linux-arm-msm+bounces-71608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2C3B401D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 15:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9035544443
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 13:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B68A2D9EEA;
	Tue,  2 Sep 2025 12:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAdgjWr2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12A2FF67F
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817898; cv=none; b=BEjUMW8fdBbWAs0KIrIjs7sJf/vvwlTidL+5k3biyHHXYjyU6f0QmyxTa/zJQ1mEzqna6sQnFtRgWxQtGUrq8Dbg1IAS2g5AsMwFwCNYJZFSgy8NDhJ9CPN0sfedO1t3P/AfvCVFUiTkLNqbjiAx9t0n7D6vXYgAHwRpUVNaYrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817898; c=relaxed/simple;
	bh=3r+3aP9oEXGjarOxz+gcoeAHKeXuUgWKYwDy/xBY4E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0BjVT416gport0OeUeEP23p1KhlRf152067asZJ5/C9NDJvV55gWY/4gmTYqtJCBe6RevRcR8V0GdyhobLLR8bVcru8d7k0v7LdZFsX2NS8PGHLbP03d5p7LTrveMHQI2+HxIJWhbO6WP322UAw/ykwypiMJkQUTNXpkw0BtYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAdgjWr2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B5jgF012377
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 12:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fv4hoRlbFBP5N7Upej1+05+LU+4LqfFdEDRxkF1OiEY=; b=YAdgjWr22TSmLYIj
	RYpu73v04tebNgf3SCDlDDdNgb8eP+wTz6lf1FCPytzZ9+iE+1LtnVF4v5i2Srna
	ZwyvDbVGjn9/e/Gnj3lyMc1nn0Ex46w6UoyLbW/fdwomP9R3KPJkOt19j0evxYEg
	0xgWrLRr2v8ZbNxIBbajnZeNOKRfUcuugLII/CtgD/Tg3m5an1N1SJi64tiewzto
	nwOs0h9nD1Jg9L3SdvuUj/ZxquwhM5lXp1UFkgwubG2ji03FbszQ5SRddjL2PVCV
	GFC6UvbklwKUD2boOzCjMPvTRvwoc6OyiZHT9QKTxxwV054nzfVBp0JLQd5XI1M6
	DnIdpw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2ffqrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 12:58:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b3387c826eso7524971cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817895; x=1757422695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fv4hoRlbFBP5N7Upej1+05+LU+4LqfFdEDRxkF1OiEY=;
        b=aY/K0IWdaFVe7sFZGncalQSi5zhAV6HTBzrIdGYxbwj49JHMtAaOwEJl8Ka4eVjjKI
         GqBmO2SdZ6oppiYl68b/pj4NttD3er9kgz0B8FynzFf04MT6oHYPeJrx34uY7tLLgP9X
         KksYQYhfO0bbYOpbQPG0XFxgpBjXqyWll1hzYtuGpHRyB29zvuw/4u42UaRBDv8qByg2
         EAFAmFj+mh9m4uoolRb+AodhQYHVbRzQNf0SEUl23ttwc7X4+W8QU9DfP4le5xJHdnQQ
         H4YOCCfQ6S5fM4JecwCKTAGPgJ8oMAouLJoPGXvn9Vh6Lm6tKJazXZYrpxkCBlVlQwfH
         bOvA==
X-Forwarded-Encrypted: i=1; AJvYcCXj7FhqCW8NQ7xjS8rQ5fXew1LWmo3XvefwjpuOXSGY0ZEylhe+iAkhyIaKRO07UDD4+81n4PWW05OS0bQo@vger.kernel.org
X-Gm-Message-State: AOJu0YykOzenXGmwzEeONmU/HLOO1ECobB9Edbv/QQu7pygVLwOdTpYQ
	+5T4HucUM3+YGwBjDrsGHvDz6FnPD7j7LA44lyWSvFZJxncU0ZPhnGUNCYwsixjSXT73+jXSTgd
	k0UOPslU/0Xs/9gMc5Hbq3eaO/gfL20z162+ILD+ZHBT0siYE6pHrNsXFi24bRqpez/UG
X-Gm-Gg: ASbGnct2V0N4nf2xNmK+FoqNmhR/kWzAQuQCxTu8X6ACWGWMV/X9B8fe+2JLWohnWmq
	/vos8+VCR3PClh7/8Eq6zi7Aa11gnuWPvrpGbq9MSGocH6e/eaP2xQ470IL3jbhQdTxUE9nu4tQ
	5hGMJjQcnIJhsZXamKaPVWGpPmA5wHD3vppgA2maPkzWmrCINzVxZDi/TIwj5p6vVK8LanRiZUs
	jvmP1LrsuvuFrdsSDFYDcw1dFd/0b6qfj0EtRLsnob6E5WbuOEwEcE67wj9PfDlM6gcOE5Ri8IC
	rzXzBxwQzmk+C4CtAImwp0AZP89wCH4bLS2XZy5qejetCgbFSiLdiK4WFr5JCO5m+VueBSTygUq
	KLP6zPQ9lLOhlUb8EUaaCog==
X-Received: by 2002:ac8:5e06:0:b0:4b2:f5a8:21da with SMTP id d75a77b69052e-4b313e1a3c7mr117777921cf.5.1756817894950;
        Tue, 02 Sep 2025 05:58:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1r9Mg5tkUeoabmgdiEQYNKoD9WnuOlezMqzB73RvDFLxn/HEh6CHqvJYTSGP7PrdZTdhTMg==
X-Received: by 2002:ac8:5e06:0:b0:4b2:f5a8:21da with SMTP id d75a77b69052e-4b313e1a3c7mr117777571cf.5.1756817894336;
        Tue, 02 Sep 2025 05:58:14 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b044703f412sm245602866b.56.2025.09.02.05.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:58:13 -0700 (PDT)
Message-ID: <708dc6e4-1566-4c72-9f3a-a34f935ac247@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:58:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: lpass-macro: Add support for channel map
 mixer control
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com
References: <20250902062300.212021-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250902062300.212021-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfXxDxUnUEizbZ1
 zP7LyZSsEMAnABpIYez8eQI43dIOdAQr908Knj10Htk82xSmbci4+UFcTYsPbOCtJ85Dp2kbA3c
 caS2Qxr7YWfZviyDlp7qQ+2jFOWKzNgXOq1f4oaXKJIyr2elG0g+3TvWGwQrfa//MStN5QBj010
 OLDmDmlINgOfW/WtgiQkAv5BF6ABwJafGo3b79GyF9U52l2WIvGYVdbm7F6plGVYO5gdtpFD3zI
 XO7f1r0e84V686DkZhTRar36614ddeLVjyUc9vqzDhwI9kb9Oeby9W8Wraavtu0EQe1N7PD0OYn
 mKsbuAm9wuczu3gj/+AFMoZ4aJOEwnh3/v2dIXYlouEQDqehdWXqGTG7a0grrV6wJxZK/o9VuX3
 6qPnRVz/
X-Proofpoint-ORIG-GUID: 79iP3sEN_PgyiOwuE9cGSSQEKFt9ftdA
X-Proofpoint-GUID: 79iP3sEN_PgyiOwuE9cGSSQEKFt9ftdA
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b6e9e8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XdHql1rsSa6mdbwAZY4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On 9/2/25 8:23 AM, Mohammad Rafi Shaik wrote:
> Introduce the channel map mixer control support for LPASS macro
> codec Digital Audio Interfaces (DAIs). The channel map mixer controls
> are required by APPS to configure usecase-specific audio routing and
> channel mapping.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

[...]

> +int lpass_macro_add_chmap_ctls(struct snd_soc_pcm_runtime *rtd,
> +			       struct snd_soc_dai *dai, int dir)
> +{
> +	struct snd_pcm_chmap *info;
> +	int ret;
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	ret =  snd_pcm_add_chmap_ctls(rtd->pcm, dir, NULL,

double space after '='

Konrad

