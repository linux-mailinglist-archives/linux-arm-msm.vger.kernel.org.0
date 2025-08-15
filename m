Return-Path: <linux-arm-msm+bounces-69392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7FEB2835D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 17:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DA451CE5074
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 15:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E1D308F33;
	Fri, 15 Aug 2025 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXUOjzFB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86177308F2D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755273380; cv=none; b=bex0STECRihVAAh7v84WjT7ceC9XZVykF7rz6quo+hy4Pey4gKt/5NCptT1b+UXnVNi/YlieE6rsZR+MB/YBxhfGiAga5fkSAw84VRjIPHVvwIb9mOmfy9eza4ZV4tUVqkwrcZYrMLjwYLj6rxnxek26ilW0G0NUaPo1s4LkG34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755273380; c=relaxed/simple;
	bh=e7+CGkK/0jqNBy9iBfYp6tx5BNZdLcVWKqrNfa0ZU4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+yCgkWXPLN1aU6peAElm3xCxF2b7OWdLsnJwg85wJUdwk8AiQLrqyLvY+TONGru0/DJ2X4GCpbpXImjJUENSg4XNblg5z8FwsG53a+85JcSaM8zAKwXseLRSMGO0jNCWGBCcViwBTe2FfeV/+re4NpD2f8M3mMgyyY1i0K2QTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXUOjzFB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIniu008462
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 15:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GtvmFet+EnxdEYln5wMNyOiKR4CMbOkykWsS9Ngo+rQ=; b=kXUOjzFBxlntzU8A
	86bHzjkiz7aanX11+w2mlv5XOEplOIn1LUCcM+RBikxrgrT+h850jcpjRb3RA9uX
	17oyJZe/R6bnKnsjms2jnnWLVMVqVS867sbzTqjLymeWS6/JL5ZSrlboF4k1PeMt
	B3E8CR9upuxVXqdKJVsThs9QUDBKiTtyvvReDuonUSXWP5InJ84Xr4cgTR533zfh
	NHmb1SdBjCrT9vTqSRuSQIRC/aGiOkSRBXtSqaPjSrTxKEs9bcvJrhsrKUm8RkyL
	JVuFRgZlxZdv9zkVyRWTT6ta40Dpy/0GN3IySj69qZWpJmEVHQLW/mQaoZFJ1Dmc
	KC1CGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6ycf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 15:56:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e8704ea619so520121285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 08:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755273376; x=1755878176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtvmFet+EnxdEYln5wMNyOiKR4CMbOkykWsS9Ngo+rQ=;
        b=jw14a9P6AwVO1Qlllx844/AY8zScObtiPcXHN3ZpxSylxTW2n+cOP+QSjnfQGTxWYC
         o1NkbQ3tZtMJJeSnS4Q1bd19hpp92OYQGxtpB/WV35do4DOS7DYMK9D+t7HlIR0ofhK1
         cPcfJcaT9p1C/gkNYSk8bUzbck9Q3VbfDuzy/xsW/vaQLFGcuKM0QGh+ROdbkibaIWyW
         0xawPqjljrqmNffTqk3KTIqSvOPFBxDbAsXTa5FcsEHkczyf9GcohdLRsHcXeW4E8NC5
         mnr31PX79FceXPsj5A+BN17mz71q/RtYM162Xmi7qO4rFStrGhQBYVvyeeRyi0kTdQD9
         ubhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk9ESfUX+d5mJ1TluIVczWcrcwcROd4l/q7PslwKxpf1qFSZ7H00n1JBvJODOp3v22WSm/VxZ370xRpqJ9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx23uyS2qb70oBHjoSIpiP4IoAPLXqW5Q4Ur/j5FhngjSk19Hpo
	RYYhhmUV3/KBGSCfwgwabjOw/MpPu+UKOouht6pyRRl11JIHqZVgq0GcXtklqocI0UgXnFA+Wag
	L5EKkHzVVrIom6Qn8+sk2nK5DastiKj7rng/Sz3/mB84vpH8CHmfBEW7+Ahwz3SXXMFRx
X-Gm-Gg: ASbGncssTxELbAD4e1V4EzuRFBfy7txiZ4T0S4E+Q8o8XA46EiwHcDwohsGRBgQGRkH
	KP8NE8l2rchl06gqUMGSPttD3LIwODurvam9AJGxlD/TvtJJJndhHuEtOUCP7YBQUzmLvQwcQy6
	x1VYPpry3vyOWAx2OS3crxC1lQq4LFn7Wuo69Vr+WSabMFT8j4kXPXYrQDM80inl3jqtpcbzgAB
	KmAtAKlJxDJRig+ljCmIof7DdelfxqKSEW1E9knmBLUDtRABCnRahs03uNUweKKG3xOHiAcsK5z
	CE2K04j1l3zJJzV+5X32PHjz6NxsrcXw0duSxkNCn0trGdMNXgPRn3FBnhkqBwz1344=
X-Received: by 2002:ad4:5bca:0:b0:709:f305:705d with SMTP id 6a1803df08f44-70ba7b2af45mr33465436d6.19.1755273376128;
        Fri, 15 Aug 2025 08:56:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGtYcJDcq8eDAcw9IfvaGVDbxDIvlbsBTnFzsMFelmep9vUCDz3Uun21UXZH05EtZRqi1hgA==
X-Received: by 2002:ad4:5bca:0:b0:709:f305:705d with SMTP id 6a1803df08f44-70ba7b2af45mr33464886d6.19.1755273375617;
        Fri, 15 Aug 2025 08:56:15 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45a1c6cd044sm66417085e9.9.2025.08.15.08.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 08:56:15 -0700 (PDT)
Message-ID: <70abcfee-e4c1-42d9-b623-266140aa2ff3@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 16:56:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer
 dereference if source graph failed
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250815113915.168009-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250815113915.168009-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX3wfd8w4wybKb
 16HxTx4kRj3JqWYiKcinjGYuyVfeqqgjNVxSEwWJQvZfW10s+Ga4se/Wga/aZBxkshxNkzaNHJD
 kKjcoyDdzmAqYe7TZGcbyMe+25baZDUAde7lyS7nnKK8dbEBlZCRqzSprlMYplPMru5/cAt7Vdk
 I7ZcYbXdm7leKjBB43kCAihleL/Su8MsGuXwecRyGiMdsb2V+2eaJDs6O8JCZXaS60uVDT//+kA
 MPGCkSY59BAwYIuXOUx2NgxRNTXnqtYANzFJHGkGcPZhNmkWlZUhsdU4Younl16hFJZDi6Ie7Cw
 eDCZklyoK5VWMNP2xFgNEGoGtJP8W9Eg2nr7xAvRFBrYuYPz0bzVQFaF9tTDEew54LAG3LRn3Wg
 krBPZj+C
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689f58a1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=eip7HE7i84Mfdsj7TkoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mayJbcbV_IefSECZkaCHMYWssVzEAESB
X-Proofpoint-ORIG-GUID: mayJbcbV_IefSECZkaCHMYWssVzEAESB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

Thanks Krzysztof,
On 8/15/25 12:39 PM, Krzysztof Kozlowski wrote:
> If earlier opening of source graph fails (e.g. ADSP rejects due to

I think you are referring to the err patch in prepare.

> incorrect audioreach topology), the graph is closed and
> "dai_data->graph[dai->id]" is assigned NULL.  Preparing the DAI for sink
> graph continues though and next call to q6apm_lpass_dai_prepare()
> receives dai_data->graph[dai->id]=NULL leading to NULL pointer
> exception:
> 
>   qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>   qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>   q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: fail to start APM port 78
>   q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on TX_CODEC_DMA_TX_3: -22
>   Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a8
>   ...
>   Call trace:
>    q6apm_graph_media_format_pcm+0x48/0x120 (P)
>    q6apm_lpass_dai_prepare+0x110/0x1b4
>    snd_soc_pcm_dai_prepare+0x74/0x108
>    __soc_pcm_prepare+0x44/0x160
>    dpcm_be_dai_prepare+0x124/0x1c0
> 
> Fixes: 30ad723b93ad ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index f90628d9b90e..7520e6f024c3 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -191,6 +191,12 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
>  			return rc;
>  		}
>  		dai_data->graph[graph_id] = graph;
> +	} else if (!dai_data->graph[dai->id]) {
> +		/*
> +		 * Loading source graph failed before, so abort loading the sink
> +		 * as well.
> +		 */
> +		return -EINVAL;
>  	}
I guess this is the capture graph that is triggering the error, normally
we do not open/close the capture graph in prepare, we do
stop/prepare/start for capture graphs and handle open close in
startup/shutdown.

Can you try this change and see if it fixes the issue, as prepare could
be called multiple times and your patch will not give chance for trying
new parameters incase the failure was due to unsupported params.


--------------------->cut<------------------------------
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index a0d90462fd6a..20974f10406b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -213,8 +213,10 @@ static int q6apm_lpass_dai_prepare(struct
snd_pcm_substream *substream, struct s

        return 0;
 err:
-       q6apm_graph_close(dai_data->graph[dai->id]);
-       dai_data->graph[dai->id] = NULL;
+       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+               q6apm_graph_close(dai_data->graph[dai->id]);
+               dai_data->graph[dai->id] = NULL;
+       }
        return rc;
 }

--------------------->cut<------------------------------

--srini
>  
>  	cfg->direction = substream->stream;


