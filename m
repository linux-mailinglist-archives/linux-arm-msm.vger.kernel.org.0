Return-Path: <linux-arm-msm+bounces-72266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A1AB4553A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C0E53A30CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCDD30BBA3;
	Fri,  5 Sep 2025 10:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/GXWPnn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFCA30C623
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757069198; cv=none; b=iQNGRBLG8xmmtQDeKThFhKzyyJJEFmq7wd7wn5zQB1WoA1D5qNmLUD+LEw03hqpB1TDU0f/kIETQIKEjxp0VUQTUahArgao8vL11FiiX+XeH0KIpbuWUmXasT3r1Ik6ZKSAPd1qqLy6xmbCfhkNGYI4NkfZRtjmHpBMY+N5QNsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757069198; c=relaxed/simple;
	bh=I6p/yTUh+A8pt4l7LAMv/W4PT4a6ow9nByy4vuG00yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9W9MFS0+KKw/kgwRHu+wBw4QhJBg/p74OFwU39Z8IaK7+E3jow2hQ8HZxhR0aHIO98G6ssOweFHK4GL3CjAHmLNfpkichs7f+s/F2gtYjs+jpn8xoYh07hbByxTlwJZs1ODjwmp3nCgwmk0NUqBJum57VwPWNRDK8GGDTTC2HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/GXWPnn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857DLfl002543
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 10:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eNfKE5usjc1AEQtJ4ORFpDrJWu8KVDm4Y0laoBTlgb4=; b=b/GXWPnn6rdIS+ff
	4RS0hdb3r6CKWOuE2ASRJYXEXjln9K4Y9ukHuSsDJt4Op46o63pQbuPwaaittgl8
	eIMr1Ng2lKPpVQ9WR1FRlUDTy9UFh5KNazS6mDBwizQEi7mSQT6jRVCLGYzWk1RK
	chbAZzREu3Lfd1MOe/4CQ5UCVeFsFbSotRuDN6BECbPTlNVStY6bImaVZ7rgQn0a
	onvbD7DbLe10Mla8/Dwf/vXsTFovF3wsWVYsQS91oG6NSXp/sWL2AcRB2fb/8B63
	hWQ8xKXDe0eEFbl6SF8pjmh0t5N3Kuwy2YNzFdtNoPnkRGyY3zM9fJvxHS/FD2w9
	moaWeQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush3aquw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 10:46:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3387c826eso8078151cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757069195; x=1757673995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eNfKE5usjc1AEQtJ4ORFpDrJWu8KVDm4Y0laoBTlgb4=;
        b=gtNknE9uTMCXVqYAgAGPdBVpHA4LNf/LjVLQBYKHRimXNTy+ts1fSdJ3ak8eodzYp+
         1VdnLhoMJRGT93hainUgtyaFdOTvqJeQsxF2WMGooBTzh6Tc+hDw48mNAGxf1Gxw2g67
         5avDhskmRF4IhMNvrpjJlLpZSOaQiQO0SukLoKIHbjFcrDmQGgIzJXo0rDdeXTh1Y/iE
         nG2yTZmVYmp5DxPOseGiB1MJothu9wS5W8QMNqQTqL2Ya019tL93+OCOqiaEbqskc6B8
         2LtZPq516IpAgb8n8jlqeQouIRaFG29hEMkxLXcA27FyQ49A9vnjIaGvcFhENg4oq97c
         SRWw==
X-Forwarded-Encrypted: i=1; AJvYcCXw1fy0JsNJDnxfGjCoj3g5Jsw0x9dbg1OJ2k3ku40qKOlYzG1H83pA4LwfKbeyH6t7lX5yfhiRTLZvu8Hz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuikhb2vS7BPs4DnPx7upWE81Zpe8pbkuFNQ+Ah5j4rWFxYhqV
	t9rkkLs1gUHCyztneD1/zzowoAzcmhBzJ57VTzYgpHVUIYjDYpkZjTMa2qcd1W/URX65FqaUssW
	IICRx1LVMfR87vjfayawyF9lhjR0g6/WUQTbH/6j0sP67dMUr8aDVvfBLYanVajjISEL7
X-Gm-Gg: ASbGncsdCu7idJznB/HWo1aKRPNWYjjGYQpcN5RhRrtCyIlLslKZeR/goCJJ3ja8Kcl
	/e5gi9v6jPtxjM0XTujiqVC5zN1FJx8g4SRRjWaP2jc3g1giQTHBWxDHiZ+gFAY+CjXmvBKHSTv
	+mxieS4wF970WzBhFrb1RUj8UXicaql5OC2PgOwUCbjUdElIMlioLmvnOjCBK8rsOZZtSi5xbaG
	ZStMTllrDuKLopal0Ttx9/XVPjXJbx7jzHFzZzMuYmo3yHIDK4/Xm7QlS0HMP1AXjHc5wbFN9RE
	2d/kHH+SxGUEhvjfu2RZ43WjyoGIOLkEyYBEFwcRL8meOTIaoEirhMGCXO+o8VKqwlrJ+5lGqR3
	A0wBj3TpNBE5gnGqzJHSdvA==
X-Received: by 2002:ac8:5ac3:0:b0:4b5:e391:e3e0 with SMTP id d75a77b69052e-4b5e391eb76mr31070191cf.0.1757069194943;
        Fri, 05 Sep 2025 03:46:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw8Dn21yvKCjUW8kKlGcrNzT5lmLe1h8eGatVckUE6o1c8jbDA7+nCFwuH00rX+I8cOcqToA==
X-Received: by 2002:ac8:5ac3:0:b0:4b5:e391:e3e0 with SMTP id d75a77b69052e-4b5e391eb76mr31069951cf.0.1757069194370;
        Fri, 05 Sep 2025 03:46:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0484e8a4a1sm340288266b.83.2025.09.05.03.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:46:33 -0700 (PDT)
Message-ID: <b321019f-3ff6-4c6b-8285-77ca291492a2@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 12:46:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: qcom: sc8280xp: Fix DAI format setting for
 MI2S interfaces
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905104020.2463473-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905104020.2463473-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX3M0oyOscR1fU
 18DzKcXZqQNmbyoRoigoyI3cKAPhnLcsBPc2TofFlp1qBz6Ly0QfYHIFR8qXsv/dscgLMlppepd
 Kbfh6MRDlOAE/zSE7fMq3vKRBSi7wPbhKctpz4GKhUmHRvghne3gn4oWc5MKvQ/vyoX5YBvJFfu
 oj4xyE1LkcUlQuD5uVnmLhisW+IUo2UqX/MKtUnD8EroCtvm4/FNZozvPt6+Ytm2qa7v1J6k8qx
 gUfdgVdVjusF0GG701EVKrT5JYiDtkcb9+SpHyE85b4zzShwwH8Ip5rXdPnGtPa0P0vM0oLQdT8
 aIfaUByFBC7GADAI5Y1bf0e9phvThyC+aBe+WDr6/i3fWnY79i06WHIpbRVMlxatXw0dIWD9OOj
 liJYGWno
X-Proofpoint-ORIG-GUID: 1LzZ5swlq1_j056iZ5N3nc5cKemkcOg8
X-Proofpoint-GUID: 1LzZ5swlq1_j056iZ5N3nc5cKemkcOg8
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68babf8c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4EjxHe3qrgCn2qlGiy0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 9/5/25 12:40 PM, Mohammad Rafi Shaik wrote:
> The current implementation does not configure the CPU DAI format for
> MI2S interfaces, resulting in -EIO errors during audio playback and
> capture. This prevents the correct clock from being enabled for the
> MI2S interface. Configure the required DAI format to enable proper
> clock settings. Tested on Lemans evk platform.
> 
> Fixes: 295aeea6646ad ("ASoC: qcom: add machine driver for sc8280xp")
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 73f9f82c4e25..2fd06354923a 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -32,6 +32,9 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	int dp_pcm_id = 0;
>  
>  	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:

there's a discontiguous (i.e. asking for another 'case') QUINARY MI2S

there's also a SENARY MI2S, but that we don't define upstream today

Konrad

