Return-Path: <linux-arm-msm+bounces-118983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g7i3LN3tVWrswAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:05:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9759F7522A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:05:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BlpYMD2e;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hjWRcat0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118983-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118983-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96255301A409
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC153EB80E;
	Tue, 14 Jul 2026 08:05:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE92145B3F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:05:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016346; cv=none; b=Jrp+K8Rxs0aE2RW3l/hUx5SsZM0+kajQisIVE/TySlz1aoFS8gwuuEKFo9NsU8n5QNaJVGW71LhE5fase0L4kxRnGrzmvZwAYUaFEczAHIUGHGd54LXaVyls38B5pG2Erq0etZIZHyh1h5ZO1e/B5/4sbz7I9y66ru8XeYXmhfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016346; c=relaxed/simple;
	bh=Q/mAzAEnyUzdm+8TmcejPmSQLuet3VLkLdeBrI5eKf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSDMmgqgJMcn/G+F1budmJgxf/IjJbNd7wUNSjzrIlRLnKBK3iGUwdC9589LQo7Ex0gyEb6RX3HNkOw45KdqMA5yDsxtZ2/DhhU2pjyeKglQbMh/9bWUBPsIqKuiO1m7ijY8XK9zMAKc4k+FwjHsiD0NKNLJG40AEQQk6XOyS1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlpYMD2e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjWRcat0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SYMO3929189
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wllpo+Ct2E0PJkevq3rM61R6xvtSI8oIVPJOoNCBdyk=; b=BlpYMD2eAEdD3amM
	uVrb7n3swLYHkr2oSD1CFHrBa78CpTbdZviu8NHrZzAKapoYBasmUuK2H+Ykeelb
	b7tqxWY5iHwfbwM4WkXOh9Be8Zw9qGTW9VwN2R1l0e33F52tID1q079i+O4weyeR
	WbihyXu3wHm9juJcFx1KtHNICSwaNm3EPDnqy5g1ktLU/NjJFdLK30Cm9OUFsEKy
	ySvIrYdEMbMOHHBKwOY96dy/lLYQ6/8NCe0knWm/YR3e8m/WkEngy76H/Kz3U1lL
	nS4Deg4EVUQTuZq4wYUUyPZ6z3oMjpWF1UIKqBEwb7Xt9Q+GMKa3D9M0sB1/YDpp
	gMTWEw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xb0rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:05:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so90715751cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784016343; x=1784621143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wllpo+Ct2E0PJkevq3rM61R6xvtSI8oIVPJOoNCBdyk=;
        b=hjWRcat0C7Gx5uZ5o08zougUkjtNrplu1OdZ/mJHkt+E/8L+xxlBXog1cyzhdT4gmy
         xE5rmb6+oy4NMRAGFHnE30AOWwSW/PlVuOpYciQHHAl4B/m44JoHQ8sfI1Kem0xDUIHL
         JYg8wxgDDmW0Ru9eAe9bvTQ/lhxjaVZjN4o2Gtmhhxte4mM7LdT/NRSFr6PAfbQdGMoA
         8m68RhD3fXwYDeHoJI9CDbNb2oyeBQ4w/GZerXCpRY+Xe7/ZxtelL4f6ekbs+DQ18bVW
         a+h7dolCN9zS5epUSQ7htdZ415tkYM6o39qYeHVPl4HgbyHQ8M99yJqGK4CG5EcnL4qQ
         jvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016343; x=1784621143;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wllpo+Ct2E0PJkevq3rM61R6xvtSI8oIVPJOoNCBdyk=;
        b=YNteECxSn8hxT/l9MNV6Qs4me0Jvks+hUqcBQeJDe5jWbtcXoYukHKRDQ3jcbmmNna
         kjEslTA5aH5Fy4l0BqoXYjZs/WH4HyWPwc3DDRj50mJMiVqh7rqf3uVbE4B2QdRd3yt9
         UoJr7x1XEHcC+LpUsoKo2egw+1VtiFNjT/3WP8v4oUSB/N//K2MIPfrpaMtDyiJNo6c1
         iYXSpP4Lz+235cRXb5g+6VbndM/kC4BL/G9/QnsyYKMXNzi9oywa3OdmGqpe/MCebzr5
         L0GwWvhj3LANTSmV5RErbmWK5erBf5w5WfFJ/Aa4D2UhurMNqvyRk7TobG4fN04E91Cd
         cQog==
X-Forwarded-Encrypted: i=1; AHgh+RoR9KPN6asVit1dDYTS21+C6OWND6Tg4AYp91F+xq5D26vW0bxxlUPtQ8OfvJpzjLnJ4YJ7BVmcHQGBjfXz@vger.kernel.org
X-Gm-Message-State: AOJu0YxmFag7HWiCSTrl3ilkD1Td6MO86FP7roYKwfMt96198DW+xGoi
	0a0lJRbEUa4NYJImeXH9brhJI3+S5P2ao69sdmCi8lT1v/PUWpw+zuPRLMBn++WZNg/MSYqiXvx
	oGtPmftJjgOjKMRdB9/2iTEmLCQzIg5vTmPEef1OX3wDwmWuNGxgN/rbAlePL/O/fVZqB
X-Gm-Gg: AfdE7cnm2+SFYGMh1Tdzdp4V2WmfmtP9to7Lu2ENuuzMshqarH0hcnKUhmJqJAviwOw
	BetfkYAfRZeqNa84skWBtGF7WFnsT6PHnbh4y2Zy0HOOxx0l18DId+oDROWv82v0gp1pWUa7dx1
	ADRdNAjY7iV9dpkrZDvbB/OhG5A8gDK85ukgHumK6gjqp4JU+dfhLZVpRLxlBxnMijlwCm9V5T2
	F0VHQjfCPpAy1ZX5HzilJ4xZ6TrHMBzcmpJbH9qWoJtYMYHqxsNiGjCpH7SnMlJdlAG1o+92j2B
	6B2Tx66LR4BBK1t1qwCjaIsuz9EQDzGuKg9KCUGhcwB/nSMNci4VmF80yhGoMZhBzaqS8FjVBkP
	M+JEEDZHtgaJx5DksA3T/FVLKqPRzL/twJdnQGw==
X-Received: by 2002:ac8:6f12:0:b0:51c:730:a587 with SMTP id d75a77b69052e-51cbf2ee752mr123336371cf.63.1784016343288;
        Tue, 14 Jul 2026 01:05:43 -0700 (PDT)
X-Received: by 2002:ac8:6f12:0:b0:51c:730:a587 with SMTP id d75a77b69052e-51cbf2ee752mr123336101cf.63.1784016342931;
        Tue, 14 Jul 2026 01:05:42 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1665727517sm53979966b.30.2026.07.14.01.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:05:42 -0700 (PDT)
Message-ID: <3492f6ff-84c2-4694-a677-500320cf1f5f@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:05:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] ASoC: qcom: audioreach: use C-style "/*" comment
To: Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org,
        Charles Keepax
 <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        patches@opensource.cirrus.com, Srinivas Kandagatla <srini@kernel.org>,
        linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
References: <20260714014445.569992-1-rdunlap@infradead.org>
 <20260714014445.569992-14-rdunlap@infradead.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260714014445.569992-14-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX0bA5pPeEBcZq
 iztXuySWA0nuaTMetSHzuodiPu6tEGlnw7sl0eehz9563k7l3N7AAgReIhdFK46GREjhfVWX0ns
 vCcPvJHhE3sdCWxZhm/PxKNynTqOq8hvVHwOhuVsmyS8rsvvlK2MVvTLxT1tk4b/KhLFtSpzen0
 BQtVSJSTJwRgH/T5vQkuXdHsLcVTYMbNauVfX6OlQwPuhF9p5BxSYiHZdYyyPjT+Gh77MM/Rpw3
 FV/OqTyiwydlWqEO9Wxw9GGpk2ltcO/oAHypX2Gc13jD43hqbudJh+s966BkE5hjbioP9mV56LH
 vGPMrM0XHsLBLtgrroWjuPvLbg+/DMIVMmjCl//2rdLhNSPWtsy/mY7S77vBuxHV03s1MDQDYcd
 DFidB+ttTglXf6u8Fdy1t4JVnvfuw9/0cYczR/6v5tvlcCqZPuGM+O7UqN9mtG3lWMSBHnT99rs
 bW1YnXmtIMTNgiBLOGw==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55edd8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=7jdjDwPJLlZbICA8FagA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: K0GN3fgHB9xOSfna1DRK2U0ZAfoKaTEy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX1VJi2Kkx0jy2
 77Ks7h9YZ02acZKqMlpb4A9INCVnuUPDy/Mj9FsAueeQXsbbYk5bnYXwERfJrD0M8Po1pHymwHM
 Mc6rFYAbxJkitK1LBa1l6QmZO2BG6y4=
X-Proofpoint-GUID: K0GN3fgHB9xOSfna1DRK2U0ZAfoKaTEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-118983-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:ckeepax@opensource.cirrus.com,m:mstrozek@opensource.cirrus.com,m:yung-chuan.liao@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:patches@opensource.cirrus.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,lists.ozlabs.org,opensource.cirrus.com,linux.intel.com,linux.dev,kernel.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,infradead.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9759F7522A6



On 7/14/26 2:44 AM, Randy Dunlap wrote:
> Modify the "/**" to use "/*" instead since this is not a kernel-doc
> comment. This avoids all kernel-doc warnings in this header file:
> 
> Warning: include/uapi/sound/snd_ar_tokens.h:61 Cannot find identifier on line:
>  * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:           Sub Graph Instance Id
> Warning: ../include/uapi/sound/snd_ar_tokens.h:62 Cannot find identifier on line: *
> Warning: ../include/uapi/sound/snd_ar_tokens.h:63 Cannot find identifier on line:
>  * %AR_TKN_U32_SUB_GRAPH_PERF_MODE:             Performance mode of subgraph
> Warning: include/uapi/sound/snd_ar_tokens.h:64 This comment starts with '/**', but isn't a kernel-doc comment.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> 
>  include/uapi/sound/snd_ar_tokens.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linext-2026-0710.orig/include/uapi/sound/snd_ar_tokens.h
> +++ linext-2026-0710/include/uapi/sound/snd_ar_tokens.h
> @@ -58,7 +58,7 @@ enum ar_event_types {
>  #define SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX	256
>  #define SND_SOC_AR_TPLG_VOL_CTL			257
>  
> -/**
> +/*
>   * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:		Sub Graph Instance Id
>   *
>   * %AR_TKN_U32_SUB_GRAPH_PERF_MODE:		Performance mode of subgraph


