Return-Path: <linux-arm-msm+bounces-111756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vWb3LkaFJmr1XwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:03:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBEC65456C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:03:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KhLLirOn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TK5iPseB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111756-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111756-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3CF630254E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633FC3B19D2;
	Mon,  8 Jun 2026 08:47:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391A33B0ACD
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:47:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908445; cv=none; b=fSlKsKsUgHHcoOMQh++wQmfjYexgAvZOwOSGwdUN2SuzjaDaXwZLdvgo49NV7VLWdx8219BUo5OiV6GWtIZfaDwxHRzT3mAEBIM9sEZSk9b0r95GTfpFmp+7Bobx51l2QiWlc+F8LAESgy+iOrjPugrMtYlpwtUDT7Ss8AElBkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908445; c=relaxed/simple;
	bh=6xNCPJlDGmDF9Xp6ttUWKlED/iCUdRMCN83uMzmYsz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7QjIgW1OV8xC4uuXHtwvLPHRz2jcv5bVbKxLUGPwPaN1mpWqzkl/29obakm1oRRTemZRllp2qsWTGT/l3PktlHuU9SMNABT4TIW51F3zK5qAv72ig7XtF5O46iYik5SRkxOzwO0uwErwGoFX6+QK0IfghOh992CNyl1QZKbiLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhLLirOn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TK5iPseB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OsnX2274553
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5c1IdhnDyBdLWOxAQ9HMrfbElKxjABUy9YPSRIBmho=; b=KhLLirOn2lfldufB
	NNINJFSUqjyC4IvyV4oCXa9OQbXHnUzcTKC2WRyYS45IIDvR6bktexaJjFm19imd
	XlMQG4M5UBUK+75Rft7R9YA9N/79QGxKfZjjHFZpkKbcnkSoePnGRgBsEfd9hw5W
	9FucQ4TetdCF2ewkp/EiiJfF0ycB0wpqNUxOEurYBo/Re0M9eMB3AQV55cW4tPXj
	xuM545oayEnhMkhwbOqvWae3hmHghnX+HuOQx/Oh1xmwKkFkXxjrQ56USiL41ItM
	+H8J5E/fOeFCp1FS4VprZbWYPstz3Ij5TP11aLfuN1dsBuweatYJ4Zba5X4jLF9a
	Kvm0oQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgxke9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:47:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517865e6219so8820771cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780908442; x=1781513242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5c1IdhnDyBdLWOxAQ9HMrfbElKxjABUy9YPSRIBmho=;
        b=TK5iPseBj1N+vrm/suqSQJH6KXy28OKAt+lK2ymqqceAy8Hwxq4TgGezEReZlsNTin
         JUjQi0P5742qVx5k64EcfpoRUqAzqCPxmCcAbZeEPFVeEdtk+z9G1VYMt8QE8bchE1yA
         S9tlFxARNaHwrNJ/E3M2Urs7QE7RUgVJC3H5cSKkAZvYjaH1dRofcyGIgqjXVPQC9LNW
         xasjJDO+LNWWr0Mday21gsBcou5d8ZLYLXMho2ip+ZFZ24qgxtNYalgVzWslaFtQKtWg
         1nPLDYCo5vOt+iuG6eSRkjb/LsNrKvrdbzTCxq9eo0ko458v9mxFOBk3cRUEo4pvt/+4
         2fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908442; x=1781513242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5c1IdhnDyBdLWOxAQ9HMrfbElKxjABUy9YPSRIBmho=;
        b=MvtxsJweFu467pTn7NCpZBcsMATEQKOo0ILnP0arkftaUaaAA0zmvLCZFWQmEvg7Ax
         FQ7fo7OnzqJEhQ/0KeH3miNSsXfQ8EemksF8QtWp2okatLffothxoEOgV9jtAkdhkZA/
         vZjgTdwt1VEOPtkNX/dPXqIGCViYeFGcoXwP9z8F1EEplUnpGod9Pw5Eza0FX9AcQmof
         LIf9IdB3v0IqOJzMtW2A0Sdz2qClw0KsjlGLaFDv8IZoYZE+pNKSURxRCKfq3O9TsmTr
         9QrDP0c2IWvGgHInLtl9OD8lonJ6HHhg53yl4ds10ylOpPZ01tOtPJdyyeXIVVlttsyR
         My7g==
X-Forwarded-Encrypted: i=1; AFNElJ8xmB88ijgfJ9LH2QX0NRFoKxmYP2sXt2a5j6ONvxLlFj9qfy2QvZ+j296eZrfdxjXMhfdAcAVYWSc6qXqY@vger.kernel.org
X-Gm-Message-State: AOJu0YwHiBclxLlJqaTrVRaatWhSMlV17hkjexP5htHDxn5BokIKjrGT
	2yf97A5Lulm7K0PTMm97dTwcoJEwZp56LcUaGCQtmiia/2jg29vlKlFdYkn3lLQ6UV29fQVOV9H
	f5AfnKMZ4edVuf1FA9qdJKGlixBXRNEsU2GE16GKdWHLyx1SFmnFKuKPZ4IoU9GZLBb4r
X-Gm-Gg: Acq92OF9CeLSgFWdSSFJjBBIHXolwzl/eKkAt4JxblP4EGnMe7Lp4CLlgjwj9ZbdaRk
	wQVmfX5tcIStKlzKvhB/pBJkVetaJKcPsQUIf1OxfqSu3En9duqkDdNItAyXO7joihLCTV1s8DS
	HORvKJklS2NrbFnLRPn5ayw++9IYsnGwcyYyfKgWJ5qdNdsizUhnu3Y0kogUAq+/ZvpgEWYF9Pg
	9gY/c2ry1+bgJoPppOcssXq2IaXLaoCobToyCIOj12xzLEGca9wDDw6tAoS5zNNmYyQeh8VD/DO
	TfLCGJN169vUPBRHenuxcjtA9lzTQaHDnq2L1z1cFKLhjZx6NVoOgXwyldfpRJCiFdWXYMDJEsL
	mPl/O3FokcjUFkHucZOb0nCeuX8RkSSz+tE9FKrB2EyFr96x1i4p2B4mV
X-Received: by 2002:a05:622a:1809:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-51795958520mr129035961cf.0.1780908442402;
        Mon, 08 Jun 2026 01:47:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1809:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-51795958520mr129035761cf.0.1780908441925;
        Mon, 08 Jun 2026 01:47:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm6934134a12.9.2026.06.08.01.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:47:21 -0700 (PDT)
Message-ID: <f3ee213e-078c-4366-8acf-d86e4c81b6ce@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:47:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
To: Brian Masney <bmasney@redhat.com>, Saravana Kannan
 <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a26819b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=0rD7byl_W-EYyDmgqW0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: hnnirKUw1ydk_XlUjvgw_4kgyZyg4q9X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MCBTYWx0ZWRfX2PyPmHnvPg+l
 Av0RODB7yG636eXkJFc/Q9RnQXxoC2rPVoER0etY6PYHSTcQD40WkFZFMtVK2lzrJyXLnWZnVI0
 Bg0QqWv5bOuC005WX4coPyCvOFWwwww2FvrddGKgCsrArEolJprJ/RZgUoiHzA1DUmA1fcJsQ3k
 5nxHQxcybYlrNSlb6bUJgjL4XGvuwScZgV61a6R8FsxCIOU88uhG6F3PKvXcSLueU01fv3Zr3jm
 z6s6CV+pY6KkJ9MA8vZVa8HE8/Xmzp00z+XP0NzN3amGQwAhnwp8wM9nJNpzb5TGnRqxyCKk/Oz
 Pf53N41nTW4hVYoam+M7/auRXw6Znj9nFaxzkUEhzrw0SRyrb94bkjJvnU2DAGg8JC905a7zOP2
 Z57LZPStAPpy7+Nih2KBTzU1BL7Yw7eavHUQtowJIpn00Sqdu61WJ36bBFtqgi/nKg8nmc3zFT2
 uH16rwKm70cBDOt5Plw==
X-Proofpoint-ORIG-GUID: hnnirKUw1ydk_XlUjvgw_4kgyZyg4q9X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111756-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5EBEC65456C

On 6/3/26 4:21 PM, Brian Masney wrote:
> Several qcom clk providers currently have a sync_state helper set to
> icc_sync_state(). With an upcoming change to the clk framework, if
> sync_state is not defined for the device, then the clk framework sets it
> to clk_sync_state().
> 
> Clk providers that require their own sync_state will need to call the
> framework level clk_sync_state(). Let's introduce a new common helper
> qcom_cc_sync_state() that calls icc_sync_state() and clk_sync_state().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/qcom/common.c | 9 +++++++++
>  drivers/clk/qcom/common.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index eec369d2173b..31382c49c948 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -3,12 +3,14 @@
>   * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/export.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
>  #include <linux/platform_device.h>
>  #include <linux/clk-provider.h>
>  #include <linux/interconnect-clk.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset-controller.h>
>  #include <linux/of.h>
> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>  }
>  EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
>  
> +void qcom_cc_sync_state(struct device *dev)
> +{
> +	icc_sync_state(dev);
> +	clk_sync_state(dev);
> +}

Do we expect more things to appear here? Currently it's only the qcom
clock controllers that use icc_sync_state, but I wouldn't be surprised
if that list grew

OTOH, as Dmitry suggested, we may need to check some of the
driver-specific data..

Konrad

