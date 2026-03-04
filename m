Return-Path: <linux-arm-msm+bounces-95325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEzVMHQvqGlPpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:11:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 520FB2001F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70AB83008266
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C650281530;
	Wed,  4 Mar 2026 13:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4MADDEG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahD2t2fG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A8A26ED28
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629872; cv=none; b=gQRsqPdNnbq4i3b49WOS4aN7Qy50WrCFyGFjQCIQKLb3OWep3XP1B5TOi19N+DEKazO77cbivVyU5LdJEt0XW1GzmdS/ByJfDQ2IwS6ZPoYiglOmL/f+OFoillp+TMBN6mwZSy9xiIy4hkkprokfxMXprBBuQ4bz309UYgZzZMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629872; c=relaxed/simple;
	bh=R7NNq0TYpafNVIR4YBQJYswkPA7OfWitp7rnUJrG5Qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jooB5xIPl/ONHuXtEqR45GkvpEh0/caz0riePS2IeObk5cvEqc6v1CgWbwvkkosmJtCDYHTaJdLgY2TPVD98Vz1kNtedASUifRRdef8eDE6WmxWjSPMcwMN6WdnmB43cfqqRcsXLjE0gUByfrsCx6jRpC55ob1smAv/JnrRD8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4MADDEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahD2t2fG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624Cu9jx1421894
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 13:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TvfmM/TogOa0lMN03Ox0SizpVks4RopHDgrK6sm/hDA=; b=B4MADDEGUiKPawTq
	pYH3SaK1KQkMvMfEpEF/97MNIUQuZ8OwXADe3zKNg+wBIWa7ABJ8V8YXuUgbtBXx
	ty5/mYQHzmfau6Kt3PYIRfwRn99+dgQaN1a/YmQN3vc/h9IL/7v4NV1aWjnM/d9E
	Apsi8Kb+2Nux9su0/gfPWzbjryJakZ9N03ic//z92NI/3EVcT7u0KQzh0t83XUzV
	dLNCo1FtmVo3XLbNnOkJiFEgEJG4Spq/7JRe/5qGhIaaa3ADwVDF2v2uAZBU2Y4n
	VvEQzeiXlZLl/9h7KCag0phfoT+94lsv6DTMSPO3D132u6FE6ZuC142NTLzOvMG/
	dFbb9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u1g5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 13:11:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cff1da5so3986746985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 05:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629869; x=1773234669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvfmM/TogOa0lMN03Ox0SizpVks4RopHDgrK6sm/hDA=;
        b=ahD2t2fG+VQ744EimdGpQW/bJojdlXJqLbc8IyAEFIGvvGIi/5uSdwBHr9TjB4yw0D
         DaxAg2dHtT/EeWu/0lixIJnRX4kr8wyN64/pmfun3hkPd7fmDxWhGTaP2+HnL24zkVSY
         u1W67vYCQGAP37rXLV238fgM1MpRVOZIJcyIloXcYZMtEVp+xYiyjwlKLuJ2qddieffd
         MOWPFo220xiy5t1HGR9N/Lj+qZw+6zsKVLVS9dMQfyitC6opI7VH79nbnhgKv9EqxK2N
         PAp3T41hCvxwjibFD69oRxIV3W+5ZoMbfUikKxw/KM2NcKNk0F99YrA/3k9QeBe32JbN
         zyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629869; x=1773234669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvfmM/TogOa0lMN03Ox0SizpVks4RopHDgrK6sm/hDA=;
        b=G3S2EtbagCdQ/T32kgKOOc9ZV1s+xLMn0oIu0qd95SYQ1NnKg0p321m9fKNs1Q9HsG
         Khp1AxK/3RSbO4hE+rM0W5sN/YZnkNY3R8XwVog8K02woaYzF05fnMWqp/WKVX7XmffY
         ug48/10nyIuxUWPs3ASKxJQqhhYiXHs/9Ps2N+ZnhidAxx2n++mbd0RsD/QmUYf6Iuhu
         mwvs3yl4hS+WVPlJrzn4xSpjDwl8aDx5720T//M86rJTF5dsosKMEwjAfCvLcNsd/gQq
         W1oJetpS3oEl3TtycTtOwcWUPVXVcomg7AhZm6HxpKt2h2s3DVllUVvPqkgkzx4U4j/D
         JShA==
X-Forwarded-Encrypted: i=1; AJvYcCW0H+jpqpljrjlSl6cny9DG58ai1OmZWFinAcJYVGSGyypQpCSbnuoqSl17E6mbPUgDo4WnIG/lSmnHQjRl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9M8Ho7RbH3nbOC1fnm0tqHY36cW9mnXfIj7rbMgK35ENrJ+4N
	BBJVwqq1TMLiBiK6K4B5Ll4HCj41+t4dnkv92bEWRofU1a0CIp5NSLrL43w3gSwJ28zwdYD7mJ0
	Qx/zVj5kL168cFPl9VN43TlaX4lD5iHe0iWRdR2DNhVnE1TwLt6djqPnoQJcBEj6LZI1o
X-Gm-Gg: ATEYQzwoGzRu9KBs/jSuLwfsSGjbGyU3vx/CFYPfUIKl6qPqGchdfMLYXBcEvEueH54
	f5JBLcnMcxh6VmBR7WLB1Y3wWw4LKGv8Of0FFPve+9ZXmCqQi6zUwA5+u2QkiAlPm0jcrVLyAQW
	T0Za6Ds6lGeFp3OrQ+LZiG0ssTe30e++xoVeLtPdoxUIU10XIDujMG4+f1sQwqdDPlqFh7u2lx0
	1MYxuiBiWM/zf8NaEzVPN8gbyVjIgmxgpX2JU1u5/KlNOtn0LgeA3WV+9dRL06ZC4ASiB91HOz/
	2WSwdV1+viXqWP7zWnIkJopfOybmhcYABxr0ijBh23uaOEhiHjoWJHj5ySftMWIzpxX2K2MfTDG
	A6xqPfQ+mO5GwG/wpWps19Awp6HOErFr1q+WSv5IvJ2S/Z3Eg
X-Received: by 2002:a05:620a:4892:b0:8cb:32eb:e02e with SMTP id af79cd13be357-8cd5afc7fa0mr214197185a.76.1772629869359;
        Wed, 04 Mar 2026 05:11:09 -0800 (PST)
X-Received: by 2002:a05:620a:4892:b0:8cb:32eb:e02e with SMTP id af79cd13be357-8cd5afc7fa0mr214192885a.76.1772629868823;
        Wed, 04 Mar 2026 05:11:08 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4851883a012sm98913855e9.3.2026.03.04.05.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 05:11:08 -0800 (PST)
Message-ID: <968169e5-59c4-476b-b656-cc10049dcfdc@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 13:11:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: qcom: qdsp6: Fix q6apm remove ordering during
 ADSP stop and start
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260227144534.278568-1-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260227144534.278568-1-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 24QOpVk7p8KQqM0m1grC9jcx9OVwbCl1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNiBTYWx0ZWRfX9+4ziQgHaoPy
 DjXvXy9pa0Sk4CXj/xoB6NJWMdF4K5Qmat0Qosuclru6hUmqx0+U0kWvso1rGjS2W9UOCTc/hXC
 gtHIKjNPem88YwZrGWzKWRvqWUL1932LzYk7o82EZoCYB4pggU/NCZ9hIgUYMNamGCnWzBWmcTA
 3C04XXLCzChnUEu64lZ3YAHZY4P3aCGEM0Ha4acnKi4EOZDIOxLgHNme0QZNPzw5BhOFOb4JXox
 hX6c8qbCt9+CueyWwRLYsu8rNn7qyLQUjmP+ipy4f2ebEb90ry+v4QGNRaJLc2Q0tjgRZ+rmTG/
 P/fnnU3DUXbgubVqP1DnCk2y9ay46IHx/PzLuEzXISVmlElDVYQTNGljgMRu4bjDJIu/8Yu0rAE
 C6qYG10nU2n2eVDeobe4gP8UyESFHSCJJeUCd8Uadz4vVru8SIHLGn6DbI5Ov1NnVqNfuvfLcKe
 Je4+Aqpf7nMXwEc5fRw==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a82f6e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lunvCU_K9DOFleREHiQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 24QOpVk7p8KQqM0m1grC9jcx9OVwbCl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040106
X-Rspamd-Queue-Id: 520FB2001F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95325-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com,linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Thanks Ravi for fixing this,
On 2/27/26 2:45 PM, Ravi Hothi wrote:
> During ADSP stop and start, the kernel crashes due to the order in which
> ASoC components are removed.
> 
> On ADSP stop, the q6apm-audio .remove callback unloads topology and removes
> PCM runtimes during ASoC teardown. This deletes the RTDs that contain the
> q6apm DAI components before their removal pass runs, leaving those
> components still linked to the card and causing crashes on the next rebind.
> 
> Fix this by ensuring that all dependent (child) components are removed
> first, and the q6apm component is removed last.
> 
> [   48.105720] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000d0
> [   48.114763] Mem abort info:...
...
this has been an issue for a long time, hopefully with this patch, we
can get the card rebind working audioreach with all the lpass codecs.

> Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
>  sound/soc/qcom/qdsp6/q6apm-dai.c        | 1 +
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
>  sound/soc/qcom/qdsp6/q6apm.c            | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index de3bdac3e791..168c166c960d 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -838,6 +838,7 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
>  	.ack		= q6apm_dai_ack,
>  	.compress_ops	= &q6apm_dai_compress_ops,
>  	.use_dai_pcm_id = true,
> +	.remove_order   = SND_SOC_COMP_ORDER_EARLY,
>  };
>  
>  static int q6apm_dai_probe(struct platform_device *pdev)
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 528756f1332b..5be37eeea329 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -278,6 +278,7 @@ static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
>  	.of_xlate_dai_name = q6dsp_audio_ports_of_xlate_dai_name,
>  	.be_pcm_base = AUDIOREACH_BE_PCM_BASE,
>  	.use_dai_pcm_id = true,
> +	.remove_order   = SND_SOC_COMP_ORDER_FIRST,
>  };
>  
>  static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index 44841fde3856..970b08c89bb3 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -715,6 +715,7 @@ static const struct snd_soc_component_driver q6apm_audio_component = {
>  	.name		= APM_AUDIO_DRV_NAME,
>  	.probe		= q6apm_audio_probe,
>  	.remove		= q6apm_audio_remove,
> +	.remove_order   = SND_SOC_COMP_ORDER_LAST,
>  };
>  
>  static int apm_probe(gpr_device_t *gdev)


