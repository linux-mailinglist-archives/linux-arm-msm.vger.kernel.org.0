Return-Path: <linux-arm-msm+bounces-78518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 215B3C003C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FEE51A624D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F36B30594F;
	Thu, 23 Oct 2025 09:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SInV+6Nv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33E0305940
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211515; cv=none; b=NHCl1uHi0KQgnlB3Z2cxC9VUoAF+aeZ0me/RBaxCSUQylEEjId/jL173siSjMupOACCnSNr4KcB+vuWU+BOLDd/VX/FQ9chW2g4ozBJCXFBv/3lN5ERQVF5fQKmdZmsJzywACHlhgeYcFNogtFapJdIbd23EVaBcv1a5rVLS4ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211515; c=relaxed/simple;
	bh=wmbjSv87Nv9bq7/iWiWTXBzwhGsEf6wKoE1uZMnunns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IIXkF0vjanPLoByBIDDcK+DIcrN93GUKmiuL6OcYi01EQA415LoPEdsBWj5W72eybIiPXAmQxp8YQzyvnhYRApCbUHrWSKj68HmCeXk7PAd1uYvnvTFf4ymkWaIeV/pmEyWIcjmaxZtqnlO/0IXEKXCulglqeuToBS/xmqtInBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SInV+6Nv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7ArGZ011696
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dSvA5ngEs9hohgjB5Ua67zCoZZ2sfiQpQyL73F1VaHM=; b=SInV+6Nv4aMHarb+
	NWFK/2S/OMbzkxzAgBbQF5fe1y5WMLvr/Gyn/ef9MW2NyYydVazkwBFwjuBbS9nI
	1pAtAxCvp8UwDiVj1Gnog3jhXzl7bjXxnbIq5EvPE4Ul5AEsJTHQHLDUd4Q3XYmk
	O9kVuhrdyytNBc2Al6uFoqbDoIOns6dmq3298XOcZgMHyvUDaU62TgFizNx7hNxi
	Cl4z5ZdeCjm0FtqMfIahhSQUIfYQvtyRemw12Dm9ZJQYp3+i5ho6odreg5rh8WrS
	/avTK/LgfSTm533KUqGKFp0w6+KNYrzTO0Tbx+eJ6kPNHyiG+wq9bZ9Z9FVx57wh
	kv7XrA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524a0nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:25:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8a2ef0249so19103521cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761211510; x=1761816310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSvA5ngEs9hohgjB5Ua67zCoZZ2sfiQpQyL73F1VaHM=;
        b=FPJx+Hf2CHuIGNtjprC5ZvNF33rztmSmYkszg+znbkWGn33gPVMmQma5UL0PPMCf/x
         EtaOPX9ymXhJk9vJ5cMjKvCuV+0pVDkcbQ5S419Y8wPNWvxHOjjim4or5v3nRbB96tGl
         Mu4mSdXE8gSRKfqZiCR0D4ILrqhc6VF6rMOFtog1+lhl3lLrujwFcWIeHss1wPNl0hjg
         4kLQisED8BR8JrDucHv1iEZ8sN1AIy2U7jUY6OaTRAu2dpsjUNGYLaA/u4UoAJWucYMX
         FJ6sezSzt86W5FK2bwUC5+sk3BZZZ9mlDtx/8pRZkvxyLPr/MgThEKrFUthEEIOCrBaa
         59XA==
X-Forwarded-Encrypted: i=1; AJvYcCX4HiR+WbxVd2J8gv2GGhuXiPHg+ZJNGJNz4fkk1Z6RJbPyxrn6ilNMCEUkR1yHGzildODK5XDGopURN7XF@vger.kernel.org
X-Gm-Message-State: AOJu0YxECJs9Qo1WMc1o1Of79VqL1rhW6zfPaF0hGmcEtkLMeyKFdpHa
	3fx3nP5uaYgM4dYP5wPvOWYZ2L9iXEtnHHHM5jBKdY/WBFgM0DXERjfrzjkQvr1IulmHaBxzuq7
	17avjh1JrtYv9EAaDKRWNCaX64wBz7unMtjKyjK9zyRDTHdEFEPFzTOWH9W9gBu+tXHyX
X-Gm-Gg: ASbGncvzCmjxPCjo/BRNHkGNCsWJ8GdgsZDZrxwvjqJP0CM+Rq5FhYQjAbTxrF1C2SM
	IMi2BvxSb8GMdQuFPytR5bfo8MrT95ohsy8AFQHR4DXcoK/xW9UmT3J/N1zTzki7ablvmlR+xh8
	nrF4l1SquLQdCgCe3f2gsPIQ6gg8lt2C3bYvD9dApYE+SqJfS/8Gw6vBaBL2PwPEI4P2Dha5Gij
	J5XoQ0QJJnVcdEQ1rqEXCjvhMivqwYqBjI9W/PW4XAXWUDZEA2Kfs9fjsoJ1IGwrbrQWQN0np4/
	WtJsSedpaPnK/XlEP3DHDGR1Xa2PIBnDVOeD/32kPIPt2pBBt9LpRSWSB0yFmVPABpcm/F4agIx
	PICB/iP6g5SnfmRBaU+ADl9qKeQ==
X-Received: by 2002:a05:622a:1a08:b0:4e8:a332:ae5d with SMTP id d75a77b69052e-4e8a332af4emr245184351cf.48.1761211510229;
        Thu, 23 Oct 2025 02:25:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAB+oVptSREj0nu0ZIfPtl07Xl6ZMfqdzD6A25TQqGnq7DB1t0Z5Qr5ZYnfCesq9hliBUFUw==
X-Received: by 2002:a05:622a:1a08:b0:4e8:a332:ae5d with SMTP id d75a77b69052e-4e8a332af4emr245184131cf.48.1761211509684;
        Thu, 23 Oct 2025 02:25:09 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429898cce3bsm2896783f8f.38.2025.10.23.02.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 02:25:09 -0700 (PDT)
Message-ID: <e3bbd92e-57bc-4848-b7e4-1aa10202e9fa@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:25:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] ASoC: qcom: q6asm-dai: schedule all available frames
 to avoid dsp under-runs
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-7-srinivas.kandagatla@oss.qualcomm.com>
 <DDNA1IMADB2J.1RQMGCQKDL7PG@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DDNA1IMADB2J.1RQMGCQKDL7PG@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfXznSD2EAU0+92
 jhFscrZ1lKPs6aXInwuR55z9TUqSh8Zgtesl4lvpOgES8Sr6ooukOGTVyt1Nx6q2DZusNPsHbu4
 THgVLEG/us4qJf+Wn8uRdM0iNXKCgr8M1+wLHFXSgSjzZj0sht1PbxDMCg2J822HkoUMXdWF0bF
 gevUc3bu1T5X0xDNgvxTuFKLIc80r6ggsi/qkEJpiuMQYLmpXzuaTdSvBOn+Rq90XMB60kQvzTU
 C34+MSrgsh5ImtRDA1T016gJgdkr6m1VMEyTaX+1NaXjkvLbiO/rTxd3+bR/b+sHzaJ0J7ZDrcn
 HAGEftePtkvzJyZtPwKbkav4T74x0zf8+rLNZ8igfm+85XibQU5eYF8Io3WADDpCUSdVBKE1dDa
 CzjwVDStsWaN0eMTCWbI/5VadQjteQ==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68f9f478 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YRt9Bv_rGBO17N10jG4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: vNbV_r2d8HtcM5NBOEC4Zu7kW_YHmKWi
X-Proofpoint-ORIG-GUID: vNbV_r2d8HtcM5NBOEC4Zu7kW_YHmKWi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

On 10/20/25 5:06 PM, Alexey Klimov wrote:
> On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
>> With the existing code, we are only setting up one period at a time, in a
>> ping-pong buffer style. This triggers lot of underruns in the dsp
>> leading to jitter noise during audio playback.
>>
>> Fix this by scheduling all available periods, this will ensure that the dsp
>> has enough buffer feed and ultimatley fixing the underruns and audio distortion.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/qcom/qdsp6/q6asm-dai.c | 34 +++++++++++++++++++++++++-------
> 
> [..]
> 
>> +static int q6asm_dai_ack(struct snd_soc_component *component, struct snd_pcm_substream *substream)
>> +{
>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	struct q6asm_dai_rtd *prtd = runtime->private_data;
>> +	int i, ret = 0, avail_periods;
>> +
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && prtd->state == Q6ASM_STREAM_RUNNING) {
>> +		avail_periods = (runtime->control->appl_ptr - prtd->queue_ptr)/runtime->period_size;
>> +		for (i = 0; i < avail_periods; i++) {
>> +			ret = q6asm_write_async(prtd->audio_client, prtd->stream_id,
>> +					   prtd->pcm_count, 0, 0, 0);
>> +
>> +			if (ret < 0) {
>> +				dev_err(component->dev, "Error queuing playback buffer %d\n", ret);
>> +				return ret;
>> +			}
>> +			prtd->queue_ptr += runtime->period_size;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}

We have exactly same logic in q6apm-dai.c I will keep this as it is for
this patch series, we can always improve this over time. Patches welcome.>
> So when I compiled this on a common arm64 desktop machine with defconfig,
> nothing fancy, with gcc, this loop and function really does compile with
> udiv instruction.
> 
> avail_periods = (runtime->control->appl_ptr - prtd->queue_ptr)/runtime->period_size;
>      350:       f9001bf7        str     x23, [sp, #48]
>      354:       f94086a0        ldr     x0, [x21, #264]
>      358:       f9408262        ldr     x2, [x19, #256]
>      35c:       f9400000        ldr     x0, [x0]
>      360:       f9403ea1        ldr     x1, [x21, #120]
>      364:       cb020000        sub     x0, x0, x2
>      368:       9ac10800        udiv    x0, x0, x1  <--- here
>      36c:       2a0003f7        mov     w23, w0
> 
> What do you think about rewriting this loop without division and
> without using additional iterator? I don't think this is a hot path
> but anyway.
> 
> The first iteration that I came up with is (1):
> 
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 97256313c01a..d01f805947b8 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -310,6 +310,23 @@ static int q6asm_dai_ack(struct snd_soc_component *component, struct snd_pcm_sub
>  	int ret = 0;
>  
>  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && prtd->state == Q6ASM_STREAM_RUNNING) {
> +		if (prtd->queue_ptr < runtime->control->appl_ptr) {
This is not going to work, as we need alteast 1 period of data.> +
> +			do {
> +				ret = q6asm_write_async(prtd->audio_client, prtd->stream_id,
> +							prtd->pcm_count, 0, 0, 0);
> +
> +				if (ret < 0) {
> +						dev_err(component->dev, "Error queuing playback buffer %d\n", ret);
> +						return ret;
> +				}
> +
> +				prtd->queue_ptr += runtime->period_size;
This queue_ptr can go over appl_ptr.. can impact sound quality as we
will be queuing something that is not in the data yet.

--srini> +
> +			} while (prtd->queue_ptr < runtime->control->appl_ptr);
> +
> +		}
> 
> No division and no calculation of iterator and avail_periods.
> 
> Rewriting it further (2):
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 97256313c01a..317f06d07a09 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -307,9 +307,26 @@ static int q6asm_dai_ack(struct snd_soc_component *component, struct snd_pcm_sub
>  {
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct q6asm_dai_rtd *prtd = runtime->private_data;
> -	int i, ret = 0, avail_periods;
> +	int ret = 0, diff;
>  
>  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && prtd->state == Q6ASM_STREAM_RUNNING) {
> +		diff = (runtime->control->appl_ptr - prtd->queue_ptr);
> +		
> +		while (diff >= runtime->period_size) {
> +			ret = q6asm_write_async(prtd->audio_client, prtd->stream_id,
> +						prtd->pcm_count, 0, 0, 0);
> +			
> +			if (ret < 0) {
> +				dev_err(component->dev, "Error queuing playback buffer %d\n", ret);
> +				return ret;
> +			}
> +
> +			prtd->queue_ptr += runtime->period_size;
> +			diff -= runtime->period_size;
> +		};
> +
> +
> 
> Surprisingly, in (1) the size of resulting object file is smaller than in (2):
> 
> With original patch:	110008 Oct 20 15:26 sound/soc/qcom/qdsp6/q6asm-dai.o
> with (1): 		109776 Oct 20 16:53 sound/soc/qcom/qdsp6/q6asm-dai.o
> with (2):		109896 Oct 20 16:52 sound/soc/qcom/qdsp6/q6asm-dai.o
> 
> I think the readability won't be damaged as a result of the rewriting
> and the code seems to be smaller.
> Obviusly, this needs to be verified for some corner cases and etc.
> I'd go with (1) but it is up to you. I tested (1) and it seems to work.
> 
> Best regards,
> Alexey
> 
> 
> 
> 
> 


