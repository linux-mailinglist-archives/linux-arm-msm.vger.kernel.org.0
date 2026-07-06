Return-Path: <linux-arm-msm+bounces-116740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H6DmKpmKS2qHVAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:59:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D0E70F92D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:59:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UsRTGlzE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JvYrD855;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116740-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116740-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 611B8318218C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8081442131;
	Mon,  6 Jul 2026 10:01:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40282442112
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 10:01:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332104; cv=none; b=VX0SEQrLBMfzfX4ZH2byjzgt/tKyBWQ79zw5O8i4LATQwBvof7cE4SvV7Olem2g8ZWTAYZDjVculK+GjXEBlxZEqqNtjNJCLraVDpxIHM1wZ0e516qLZ8DQB8efERvwVZU/j2p8AYMtlEaXBARqSRIRDbyEzmoejSo/wsAYCBFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332104; c=relaxed/simple;
	bh=5lvqsLreZgpRiMPvdwViP6yei5AxtDeN2pMz8QSuiKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rW6A9+jpmZOALY0B88RKJYbbfQ00jaXtJpAobxY4W4l3Tj0KYzPs7us3lJrmnRXE+1kKsJAtVdRAbzxwK3g4ySQoKrEdTz+8DFVVS3ycmuoFyned+pjiFJBlgTt7B7X7zknTiw0DAlfJ3buG3wqBAehoFYC7WNCknQq624gtBAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsRTGlzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JvYrD855; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669pb6j237503
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 10:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Pn4D1mxk78apQDigyQkSHW199npveIVfCxLkbbVxUg=; b=UsRTGlzEgJ8u+eZg
	nK0eSfsPnpzhjNq6Ctq2lntv9oWXgRmC2EP6fHiSHweSFJnJ9fRy61m88+8bDidq
	AdkgYMfU9O452toObFu9bS7oBGg9h+b41csfpBl9mhhiKZEtAs2NE1Qyls6AheSP
	8OTYu9n0CZVwqx7pJIRaLD8KWNcI2qAlVOsSdiFKOFg2s6k5lxeusyKKunH5Z2fi
	WBPliHbmh5AE4uTBpXISJRgShdaV9ZKq2VpFSHd4VLqxRp1qGEMHN0ewap15z2ls
	itqkNUmKU6CCfEDD7nPMbLeG1FoU0lkEoVyeVs3uzIp8jopnXt9n+7XfSfHIiN48
	8SyaIA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r01kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:01:42 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9691f63552fso49873241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783332101; x=1783936901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Pn4D1mxk78apQDigyQkSHW199npveIVfCxLkbbVxUg=;
        b=JvYrD855QY31YG+gcptty5GA3/fX7u20PGFkPe/oLGvOU2HLdpEojuN/o8A/bmclJQ
         rWnqCZ3MaEpgIZJj/bkeWHYu8EGHgKTiuzHx+DG659MlphnCb4oFQPxiiBp8Ok5wgweD
         8fWveT/v7oaTNFAMkZMjO3XqTJ/2mieRjwcmm8ebm+XyjhoYp7y17ila78W+J35QKNxJ
         nkc0zIpYtHBb+jvN9JVaZqcd5ZFpfrr02aZlaF9nM3sCR92sNtd0FJaGzxlHbbRcq93y
         wP8nO130y7GRKp97qOSCkh+NbildG2QLn81BWu/x7eCbopJKtZQYOo6gfKgTSlX5UHVO
         yKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332101; x=1783936901;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Pn4D1mxk78apQDigyQkSHW199npveIVfCxLkbbVxUg=;
        b=LBETP62NiXcSJdNtHSpVuGqfJWm2Tg8aNiH6M9UVs++pMBoGwlggurcTEMXtXTTvx3
         Kxa3/KhuJC3mdbnfqZYFUMO1ckNR3Lk3ZM+rsi548e/X/D3mRom/aJCdm2E7egygCos0
         WxoN6pvjgfMLbSyOv7YcXm1HIh2U5un6ntixJ7ThE0A3RhEPkItZWcezSs3DFlgQAXGb
         MK58B9O7EBkxhe67MiXopUErOonPzkklmFMYgo0fFojPm5fmHeII1+a/fM539fW0j5Yk
         pI/KjMgY+z1iDuBMbw2yJtbs9rifrjCln/R5UsLl1Uh75eJfcp82XjVT3SgcDiDauuzh
         G2pg==
X-Forwarded-Encrypted: i=1; AHgh+RqzXhtPEMQdWfmkTQ5e8H/1GdIpaXLWelsmTsrIQqhnQeALRgcvuiM66cHv7PEbbQYgFEdwQwGeqbfYhhk1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr+/fY2AW+lLAblOmBCMx+MusRSSd4VGzqQSzggpDUjsy+aOxn
	TueZSmo5d7sgjrjTU9Ud8ZzWvFoAObbf5OeOb/WMdX0V11Sym+3cRO/SHR+oL7JlKBLUJWVKiRf
	ruzLno/Qt1tDAntlZhmokNPXDDf4RydGbMSgKK6P7g+ZEHqSj0Cep4uDLxQomGCk9dzL3
X-Gm-Gg: AfdE7cmmkn9+bO9VidYQVJJBb/0o9tcCDjzuXgr7KM+bfIKdZNZprniO0gyGXLgXcme
	4ERiVd5fR1knyszuy5RnjJLXteM/0t286XUGi2yO4ousS2aJS7YkK67gXCBef1I6h4VS0QRiuLx
	jq07ruAxnMiBjM0C74R5DiIjIvgeRUMrU0pJtpl7vJK3s6WkalLn7Jg34ZCG8vJXLqfEzjCVV8d
	jKQl/kcLlo+rj/eyuvCMQxcu1NWX0QBMSw7xowRHWad9S/TfSYiSDKPjbdjo8CwwvQFi0NHqAP9
	IGTN1D8LpXhvdFzToIu3LYrf8dG7VjIjahjFAPk5A16syrlH0SvIGtZruCFS6d6s30Q2rffs+YK
	dHSz3kTni4nboL7nVBYoQKXID4yhRHJKWbwM=
X-Received: by 2002:a05:6102:1625:b0:740:178:770f with SMTP id ada2fe7eead31-742079e8eb2mr1153588137.7.1783332101300;
        Mon, 06 Jul 2026 03:01:41 -0700 (PDT)
X-Received: by 2002:a05:6102:1625:b0:740:178:770f with SMTP id ada2fe7eead31-742079e8eb2mr1153477137.7.1783332099093;
        Mon, 06 Jul 2026 03:01:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091ba1sm703470066b.17.2026.07.06.03.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:01:38 -0700 (PDT)
Message-ID: <e15976de-bbc6-4a26-a16f-a20961f32bc2@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:01:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-tx-macro: switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
References: <20260703-xo-sd-codec-tx-rx-v1-0-a3cf683533d7@oss.qualcomm.com>
 <20260703-xo-sd-codec-tx-rx-v1-1-a3cf683533d7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-xo-sd-codec-tx-rx-v1-1-a3cf683533d7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5OSBTYWx0ZWRfX4cHAEBN7LUE+
 6JmUNQ/oY8xPxBO+b63+4HVPElQUlz8WOOjIEspfWYIqi7Yi5CCdIATlN/rEluOQq3n5W3Ya3Ad
 wNTYSCLUbF7HZQ+e9AfcLZQcT2jWRHgq6VVxpupj0wxmUQRTxsL57S5pA6c1KrjOzgkNvBNSee+
 1GfnF1Pajt/Nc1SST960awzOOh8nXJgzxDjtDrmhoIYUnlQlZIJ33epNu6ceqAW3Lp6LneCLAit
 3XHHWnpYsrgia9Woq+LJoaiTaw5Mh1/vm4GjQX84rJBDtxDfF3PXnSYXcepY4xwfZzwB1DyvDXE
 6DH/cPyfTD0GgHV5vHim2gYzlv2B6p+fsjLYfxxJz1/B1PdAytxn1PlRgSB1f/zeaJz9o7/ppde
 Gyf6dCZHFalOTq4d2m1onbfBK1ml2aJvDyRCuQOa3IA5bLjTHeOvdQNCLaqSxaiaqlL54Z3vywG
 9AuVpEIotXUHKygOLxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5OSBTYWx0ZWRfXzjmJGLWefDM4
 wyGgxhG4HPqpJLTzxQK0tg8G8VJReSeG3gg4WHHfYMeIjeplrR92/iuIjISAt0y4YLKDVtKvIbW
 NuBpa8Wy2v5kPbBDkxGpl5j2Wgs+Ey8=
X-Proofpoint-GUID: 8QLE_V25590UN4EOcEPAyVoVSjOml7EQ
X-Proofpoint-ORIG-GUID: 8QLE_V25590UN4EOcEPAyVoVSjOml7EQ
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4b7d06 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WtABQFq307eh6Gfc3VgA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116740-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ravi.hothi@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18D0E70F92D

On 7/3/26 1:08 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS TX macro codec driver to runtime PM clock management
> using the PM clock framework.
> 
> Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
> helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
> from SWR clock enable until disable so autosuspend does not gate clocks
> while SWR is still prepared.
> 
> Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
> after idle while still avoiding suspend/resume churn on short gaps.
> 
> Add a PM_CLK dependency to SND_SOC_LPASS_TX_MACRO since this patch
> introduces PM clock APIs.
> 
> Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe
> and by restoring regcache state if pm_clk_resume()/regcache_sync() fails.
> 
> Co-developed-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

[...]

>  	/* set MCLK and NPL rates */
>  	clk_set_rate(tx->mclk, MCLK_FREQ);
> -	clk_set_rate(tx->npl, MCLK_FREQ);
> +	if (tx->npl)
> +		clk_set_rate(tx->npl, MCLK_FREQ);

This is an (unnecessary) unrelated change - clk APIs happily eat
null pointers

If you want to follow up this series with a nice change, the retval
of clk_set_rate() should be checked

Konrad

