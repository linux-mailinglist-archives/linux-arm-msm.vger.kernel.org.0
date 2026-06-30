Return-Path: <linux-arm-msm+bounces-115350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QuYMLrOUQ2qScgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:04:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 884C66E296D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:04:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mQ7uUYw5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="dQve/GiU";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115350-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115350-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9EAD1306847C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB723E275E;
	Tue, 30 Jun 2026 09:50:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5303368D57
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:50:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813038; cv=none; b=Bv76V3exTYUQ5LhoBEt4C8AbQCoDmLqzUS5ElAXSHkhICwtpw1ClOoYjOCS0+fEEIGQaP+eJeDKBZLzUWEVDzp67SBwMPyf2caj9KH+EMNTN9YS3slaAEgy3iyw0aP1R0Qj4duJUzgzjNaD5oQXoLZzjr21GNHKDAkaLDrK+gUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813038; c=relaxed/simple;
	bh=zeZORPZ4UojQer9WR72uC+r8AHCUtBnWOWagKiIJp6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erqa4XVFM6DMzQhSbbpRaOkcn9sGInGxhQKlsksn9+pG+RYSFbqse/JHNdLfGdwcyaGl9SS0ko6lPpPz7p526V3J0tJ1BODyPUYfQnbiBD8DnYcpQG47DoOaobf3m9BWHJ1cFvOn7r4+EkX3YOLNXZaVug4I7vGfkAHEdWEvGtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQ7uUYw5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQve/GiU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mtRZ1542148
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNb9XBYFqILWYAyDEURGEbUfsIr6u9r9oUv6jsYEpdw=; b=mQ7uUYw5l9oK5D+j
	JMJOBN0Oi//f9hjaNC1qgB9w7dYgvH2SIpx4jXbqnzUH70xoJpVI7STvaQsbiCu0
	BizWfIDaAwPANyRCi7uqS7LP5vVWBB8G7sWS7Ei4DrEJ86ocPW20Tawe9yWCcxGc
	3VlecgwYrmUjXZWSDEiAK9WkC94A3hD9zrE1DOZReSGvUuopljmGuo/7cj6cJlLD
	Ksv9AadQMoO4Fimbwirye4Xk6T1RPmNSvRHAvUFTYc5UuNTzb2kvDqaVClMOXVN9
	J98Jj17rTFDJryR0Sav+/c0NFeocQT+XQ3/bC+ezyMpqoyKrlEGGTZfsgBjMDJNx
	1auoEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4hr4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:50:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bea07880dso7707241cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782813035; x=1783417835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNb9XBYFqILWYAyDEURGEbUfsIr6u9r9oUv6jsYEpdw=;
        b=dQve/GiUexfOMoSo/WSTZwtQCrRJbk6/MRiyAkG9svgJea2LTdOAO3GlHZff3FvGeq
         Vlp+KGP06H92rENN1x0WfsRrhRJvUoW3kh7RC0JZYiQoL3s79xlrZ1e1cA+vNr0F3kgF
         oWot0n+7GVrAtuNiTFtJmldcU+RBgN3WD9Lzz+OUfZr105LxQbBNSyQn1rMeKE4eQa5v
         sDWRpBzSlXWww21trymvaHWUr9lDW5A/C4LhGJhoNgz42WbmH2mUQqHJEco5e2nKNw1j
         exMbj2vH5SaJZoOBHkJyEonP+oqDaTiFLZXvkYEmBcNabd69VU2zRVjdjKziQ7oqMb6w
         9ctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782813035; x=1783417835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNb9XBYFqILWYAyDEURGEbUfsIr6u9r9oUv6jsYEpdw=;
        b=CrM7nDShl9K50yVsANCZeA48gH0iZS7C0G9hlBm0Cwag1VaiLD1OZwXXIvYHoRZrvz
         BoPaPJKfoZPrXf0ROFMf0opCLBDemeuztTDFpct5Wjqo8Ac9yRJ/cqxjXpQd65ggJfIj
         ZICuCccz0yn1T685Xak71l4SFyB6N8L91mQksVwDmofQwWA/FmT51i3OCAqaZ/BShYFe
         jOM5MalywmrgNG+Zwnq8+jGX2ljKW64Vs99wXx6Ez7+e1ecHGNb+60gYdD0byVFYILwX
         Zl6nleoEF5+Hps7mzjnsWdUFcvVnZ00ku9MbsvnQG9U1ciUmrz1RAAod25kL410wAaj8
         015w==
X-Gm-Message-State: AOJu0YyfopjtUNXYSsMih7wnUGSFD+8Ui3Txreb/v+byanhlxLncCCWI
	6/b3od65AN9IAiRxfoz83ixEOeEDll71xTAa9acaF4CErVgXyR3x0BNRsEZW8s8kMIssSHziMZz
	Fnu3P4bPIaNZ64RRxB4u2YhilAmAdHyLHHQEmp4Bx+t/CjhMFcn2Rru+LmLFP5QG/nokY
X-Gm-Gg: AfdE7cmsbnOziC//ID/SvPHzqXKBQF1BFiQltlfh0YhrPnYxrHRo0DniGSKsZUuYHwq
	bqbTBXtNLVBSYZyO4H/huvgVMxc2l5k7g0HwOpDATgPPR/oOcDA6s3RB0aGybuCH3+FYg37aNsT
	KYdtnV6fhYp7Et/WkzKfJCZdASmSBEebCF1JAPHbBySfsz9Us6Y2DzQXT5qFiPHSi6YCFKfnVwO
	tRpJ7somyAvlZ5SD2GkGlOfNbf2qjLrNnQIfkAEn1vFdsnq0aWMBz4LaZ6DbjjsgqbCw/i6ahQE
	bLyoxhPMu4dG6JqXfzxA7DOdzBCGGQjVr2+XXn8i8ADYIlnc270Y4r3b4EnsRtvltDZpZ177NXe
	HwOY3g+fCoS5WgM3AJ2D9YRRA+BKyco/cs94=
X-Received: by 2002:a05:622a:134b:b0:51a:8c9b:64a7 with SMTP id d75a77b69052e-51c10950a04mr22323991cf.11.1782813035008;
        Tue, 30 Jun 2026 02:50:35 -0700 (PDT)
X-Received: by 2002:a05:622a:134b:b0:51a:8c9b:64a7 with SMTP id d75a77b69052e-51c10950a04mr22323741cf.11.1782813034523;
        Tue, 30 Jun 2026 02:50:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cb71sm95166366b.39.2026.06.30.02.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:50:33 -0700 (PDT)
Message-ID: <6f8e6b61-a6cd-490f-84d8-9ddb8638d952@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:50:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] firmware: qcom: scm: Fix NULL dereference in IRQ
 handler before __scm is published
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629141750.996853-1-mukesh.ojha@oss.qualcomm.com>
 <20260629141750.996853-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629141750.996853-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qnI9zqV7r0TcOg8_MF9-U-orY7hkBCYm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4OCBTYWx0ZWRfX8RGU8flSwz/L
 eLqVsgvbnPJhGipJS0hY7qoWthk1eCwdAb2n94JIGJl9UtwWYGx3Rebfx/dRz27qvDN9gUE97/A
 rtKC0vMoOowjA5VwTDkWo23B3q9MGT0=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a43916c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FCaoNH41jgI7cho72MMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: qnI9zqV7r0TcOg8_MF9-U-orY7hkBCYm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4OCBTYWx0ZWRfX651Z+VZxdlXO
 9UvBXhmNaryZOV12WubMVtbwt2Xl7YaROgItxLKhQb2S2V9EqJ7G+BFmIkhtg5azSz8ffVeRDPK
 5GwC+9iefKwjwbydkhNQCxFix68avcmK98uJ3uvMVyNtJBQD2RflWuB+D0UdhgVlY9abW6Vfyae
 Xsjeww5BUQMkH6eMvNPC4ceLuUnxo5heAJdg7Zmxzfjc0vwD8pALY5nykFulYg+JSDJGHiGZOzl
 H92EM8k5NOYDdl8jk0yNzC+a30qKTxyMqaIeijfReRtuawmAagGQMGVsHG7/DyDVLIrM2xjae/A
 EgNyexGkzM3y2cI9nYvq8AXGJvigvUQaJHojPptdjhk+UUK/cp/vy3Hew1DI8Bnfi+PLUfif6m7
 i/rNkoXo7yKP4U6GwmmydzmYs/iPgs+Ir/zYFwuuZ4ncD05ZFUuKRQxJJMCOt5KV9Au5XGeHztt
 t1bvTzpjmnt+Cd8dCyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115350-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:linux@gurudas.dev,m:sibi.sankar@oss.qualcomm.com,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 884C66E296D

On 6/29/26 4:17 PM, Mukesh Ojha wrote:
> In qcom_scm_probe(), devm_request_threaded_irq() is called before
> smp_store_release(&__scm, scm). Two paths can dereference __scm before
> it is published, both causing a NULL pointer dereference.
> 
> The IRQ handler receives scm via its data argument but passes only wq_ctx
> to qcom_scm_waitq_wakeup() and qcom_scm_get_completion(), which then
> dereference __scm directly. Thread scm through both functions so the IRQ
> handler path never touches __scm.
> 
> Non-atomic SMC calls made during probe (e.g. from qcom_tzmem_init via
> qcom_scm_shm_bridge_enable) can return WAITQ_SLEEP, causing
> qcom_scm_wait_for_wq_completion() to run before __scm is published and
> dereference it. Add platform_set_drvdata(pdev, scm) early in probe and
> change qcom_scm_wait_for_wq_completion() to take the device pointer and
> use dev_get_drvdata() to reach scm, removing any dependency on __scm.
> 
> Fixes: 6bf325992236 ("firmware: qcom: scm: Add wait-queue handling logic")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> -int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
> +int qcom_scm_wait_for_wq_completion(struct device *dev, u32 wq_ctx)

I think it logically makes more sense to pass a struct qcom_scm* here
and get the data from the caller, but potayto/potato

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

