Return-Path: <linux-arm-msm+bounces-114163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sqizBGpiOmqu7gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:39:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 720A76B6554
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:39:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dB00+i4G;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iTxyV4UK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114163-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114163-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A1C13027719
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3D43CFF4C;
	Tue, 23 Jun 2026 10:39:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B254374E6C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:39:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782211171; cv=none; b=c3vVRE2HAf6rCOp+8pwgVzoya9YbYeSbgLpxKHmHh8H6cvQFvfz5hMO1+0Rdhrc+Qohx4eO+m4eMy4MtKLs9vqcHtsxtyCZTMsjt/sxqyICGMORQ1MfCTWqJD3lTV/dXdB2okai5yn+EQcGDiE7oMa2rXI+c6bd7tLylN6L5UrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782211171; c=relaxed/simple;
	bh=/NUOjGpR06LiuYNhocWRui2/SejORkKPZY7b0Bmr/4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWHv0I2HQ/H6nU8lciSnJnolr3bxcy2HKBv/ZH1fuB0kJMBCt1FLshJmp3DhVXvLK6ejO86fzRTmGirh7kylgkkJNhQULeooesnNZcjNS/Zohz+5G6Nv1Quw4fUvQ87zfg0S0zl2asQ91b/axYwC7qS0KzGwPvqczk0j93FKqk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dB00+i4G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTxyV4UK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8kDGG3354741
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0AnmVE/w9h5hL5i/LojsNUjrWiTJ2fNVG/BGWsEwtbE=; b=dB00+i4GDiRjbw/a
	7UAckYbnj/lhAE5lfGRGiDglwdb8dBk6QfRyNfOKfS47YhzR+xny9mk5GhEy2ROa
	0v3Swl1PPeBA5Q5wpi9Kbi+HkZ/EQWI219fPo8f5EwU+XuN6EXld+xbQjOtYcyQu
	zZ0Cjj5HK1wH7lANlPSHS7pLQk7jjOumesCr1HMeCUbT15KsGdljCTA2E4mUMGG6
	mtpV5nDBPnX4wnrDBkrHWez8/Z36awBL3gTCI4BavjrsQczZGeE+pSKl6bEtSvwZ
	z1AMlD9UggvJWd4/5Jr8VkTKw5oILrBEV//OH6b4tzuOt4hWRvQRL1yvnbk4lQwc
	x7nzeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eypx38h6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:39:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9229581de9eso31648185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782211169; x=1782815969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0AnmVE/w9h5hL5i/LojsNUjrWiTJ2fNVG/BGWsEwtbE=;
        b=iTxyV4UKLe/ul6uNjLOokzhZbqatMk9LAI04Sh9RV/Ym9U9q/oxAzMlG51S/OlfMGL
         juYiN4N7OOodq6MlyZF7hUM9QZcDHBxpKZjQ/Npt899O5FGZYZlr4gI4HM68Ab9nLRHo
         nyn1snECuUhNHOdT4r+2AJ314Vjhz0V+LcZq4AlvFvRMABQT0JwfpwHMR0RShTvsksiH
         ro4rX73VWWrVUnGOjO48iYZ0eoFiG+18lUB9HHxC8VBYuVydLU6xzuqZdJP798WYKiKv
         IkKBiPfS2dDxeYbboVD3zGihZyHLG9yhtySNaxIM92c01Xey9SNDNTsckMrngjpaZJcf
         jxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782211169; x=1782815969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0AnmVE/w9h5hL5i/LojsNUjrWiTJ2fNVG/BGWsEwtbE=;
        b=tWuZ3tCzPMfIGM7amkVPSi7zhW9UKMjxVTrnGC1VtUXW9s2NlQKVQveYLUdGztR/Ot
         woZnpoyRL8fxtpVywqhaPZUdvBlUa/5YtqXzI+Mp90R+26IqtWeVH4EhJB8SByyXvKxS
         ocVZnzWQ0DlzJCbjfadfQzyipJbLbak1DddR4b3M/NcHLobhr1m/zCs1onZOHWdwdPRy
         2e2Va1IESEdn3r1BaZKlMdejt9q5OxG+fCDSjSnoatZS8MQdhkhshf0bYXpNA3Nm7IdW
         ofKaE1Rk6zVJPEl7J39ZajwC4M9nQ5Zp1dUtYjf9GkztkQ+fP8F+OP0ozkT1viXByDZy
         tzjA==
X-Forwarded-Encrypted: i=1; AFNElJ/M4Ow6eCAxeA7X5KV5FWokGZPzE1B4EtmoTuiNDpMuEbmPgqEWjMOnAxwsGfvAcbmVD46hg2FxKZPNL8DS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/LcrvZ8u57qyx0cfOnRz3O9SjChZXe+BjAPg1MJXOyC8u2OB5
	ii9ovMDQIbb42TaAHY/0m5CpqWGk/laQ1OVOGyKf4UnZ4LBx5bsCHUwS2NOT+WDgyBbK5OA6GEF
	T6q2RWDKYFJp7lq1jthaZmpYjIH5hM5vQmacJraXlTv3KNmqR2AYHoEJPcEG5bSqwdfBV
X-Gm-Gg: AfdE7cmGI13cSkLGeYP4yIc1fD+l8SoOs6r7Lj6KHC12qsWN3POVgOFSjLO64XhZryq
	h+LZOjTl5r25+U6XkbJSj3GTdqEq5m5i36+ayX2fK9CrNFPMvZxjheWNjQBUm/bhyCIf7VNp2CD
	xYnoYosby8Iz2yMWIQjobZ60q4izhwbRu8iZyRW0Vcv4Sn4Rx/wVmDbJ+81vDlwpcYEihz7+TOm
	eQLpom7NBY1p8tw3648w0z5yb33oGCLYwxOVOqD/3Gu2m7ibrJBXeo+8RK4xzolnKuJOgdZ9Ocq
	1PHpbLqJkL+GLVwKlQPPhDJg1FF/Msu44NNrK1ZMffIZYtVSANBjubHmtW02THGkkk71DRDclh+
	2ux6EVIWtBtZg+VHeVAS7n6RTRT6wfi6qJ78=
X-Received: by 2002:a05:620a:44d2:b0:8d7:ed38:8189 with SMTP id af79cd13be357-925c393485amr505047385a.0.1782211168543;
        Tue, 23 Jun 2026 03:39:28 -0700 (PDT)
X-Received: by 2002:a05:620a:44d2:b0:8d7:ed38:8189 with SMTP id af79cd13be357-925c393485amr505045885a.0.1782211168118;
        Tue, 23 Jun 2026 03:39:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82f95dsm4759720a12.3.2026.06.23.03.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:39:26 -0700 (PDT)
Message-ID: <89c4fb14-9884-44a0-8921-fc361a9303f9@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:39:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, broonie@kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623071708.2822269-3-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623071708.2822269-3-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EsfiaycA c=1 sm=1 tr=0 ts=6a3a6261 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vZmOQDSLvvN2LDkdrM8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4Tjhvt2h8JE18mrZ3HgQKvocFP79ap_w
X-Proofpoint-GUID: 4Tjhvt2h8JE18mrZ3HgQKvocFP79ap_w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4NiBTYWx0ZWRfXzi+e61t1yRlx
 KgTESq5VKn/vcG5goi3hIAUAhVE1jXBEajLoBDe3lF9fDYX9jmOHR1IwbFLtNweLptQUX8cA71W
 c4b7NBHAQGKVOssvxbUETB3H/X1BZEg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4NiBTYWx0ZWRfX+BbqkYM6DT/c
 C3Nvzhw9glgR10vyEp1oAhrOG6U4e5NmlRpnx2l72H1FcfjPH4hr5CxarKnv3VTgttbM5nJ/Zio
 9n6kv7PtfbhcSoDguOrGqFjI9HB7FebQoXaTSn0ImZxLW0eR8VsDQufmIRsvGVG+avNpkguZ4YN
 nffBMQ53St8oHUxobreP7bT1oJjQaqpjTjAFC7NQ/ZccV8lN9kb45hsWM4ZjokDzpI3dRZraooq
 zbdXAZtvloi69eHJgrtkr9pRNV/6W+oHpBDk+AKaV0VW2lNBW9v72+AstXHse/7gBGDiAvsX/eC
 +VtWrELJvrDzi4DWAGY/Urm6AFPzfBueB3XXuZUewkVM4WAZj5sGLwVvg0o6J5OL4a31NY/vSxf
 qV83ajL6EyrXUvZg0iPZ2+QA5Sqv8339K8kf3aw5HfAS73fphbSRJXkLEw2jCA0LPPFLRZKpZZo
 xTQVzncY/ck/cGbseGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114163-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 720A76B6554

On 6/23/26 9:17 AM, Ajay Kumar Nandam wrote:
> Convert the LPASS VA macro codec driver to runtime PM clock management by
> using the PM clock framework.
> 
> Replace manual macro/dcodec/mclk/npl clock handling with PM clock helpers
> and runtime PM callbacks, and keep runtime PM references around fsgen clock
> gating so PM-clock-managed clocks remain active while fsgen is enabled.
> 
> Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
> after idle while still avoiding suspend/resume churn on short gaps.
> 
> Add a PM_CLK dependency to SND_SOC_LPASS_VA_MACRO since this patch
> introduces PM clock APIs.
> 
> Improve failure unwind paths: handle runtime PM put errors in probe/fsgen
> paths and restore regcache state correctly on resume failure.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

[...]

> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -11,6 +11,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_clock.h>

includes should be sorted

[...]

> +static int va_macro_setup_pm_clocks(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_pm_clk_add_clks(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
>  }

Can't these 2 calls simply be part of .probe()?

Konrad

