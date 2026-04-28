Return-Path: <linux-arm-msm+bounces-105050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0InYCfjo8Gn2awEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:06:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFD648994B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD272311CE76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D57329E47;
	Tue, 28 Apr 2026 16:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZycoP5E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSvt3TUU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A39E3264DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394410; cv=none; b=CYTyPA+MmFnRelhpS9U6u2kSi3Ug8dJRaIjEqzQjdMDRygj1jhjinmAKyLQKWbkwgLmV6uPJlgVTjYhjtgq823P6txtx5oBE32tUKiXgmEQvV0GnORmCrioK4ghBlinGq8Wp7c7vTKxViXL5kpEkTiY8J/UhRotBC18LbJSPKJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394410; c=relaxed/simple;
	bh=gKOXVeias1jedSZPTgvhaZ/9ErYEG/haW6BO6Usnqlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7xEGbjoXHFiJNoNKuVYlCIZ6/AiplnLSdGmaL2B62GnsQbhaNCVjtImE3KbA3RnmlQre1lVgwklH0B0oNItzj2ziuAIguPampP0o4sxAfcohqxrErLQXKCyYGe97/ogqyVcC3Xezw3XFCJaIWJAIg5hcdq797oQOxlHV6J8ZU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZycoP5E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSvt3TUU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsaC12890684
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jSwLJ8qoJ4k0g3ywERijbSEuPMU7O1XadiH6FINTJ3o=; b=dZycoP5EZv6A2AA0
	VQ8Adz/TjFW+tgpAWctWG0d+1Su/2mqSOk9NmtaMfCd7slusLFt04ZOkYqGRs3qc
	nEpucIDhrx2mJHnNjfK9kF8Yr5+0TmPeDY2ucB/jj5qraMieBg1xYUQWy3lSpY7Y
	Xe+wgUKYnF5oHnHmXD6nvfvBsJcV1zmN9w9zwEGc/T7BZ1kY2FXDNTt1/hpLdMJj
	oRoIDgzKAC7U+GLLFCaXkoPE0B35gGjjxb/ilAP6gL018njd9IMurlJBQveEHM2z
	5nPAfwZPUgZt9g5lEpEe10B38Qq8+9ivNEib58ZpfUAZ+2nDOzfegRBWwz54U4Bl
	YqCTBA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgyspst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:40:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso6905569b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777394408; x=1777999208; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jSwLJ8qoJ4k0g3ywERijbSEuPMU7O1XadiH6FINTJ3o=;
        b=RSvt3TUUTGlXZP8L8nDSKr+9ZtBE1GrM7usBmYvK/uQKXy221g02A/nJ4XRog8Ei9W
         pxDrKcVku+bxDD5fBKcdM2q6s6WbvKYlXL/NtmeKZG0UnhZV1qhYR1M9ZLT7X3ZCOgjF
         L95cLjB1vZOJoOGBAFH3T3BVJTrQqLB3pn/e66eLCGkHEYystG4JK3W23q+n8jlCbX1d
         pwPMSpc1HRjMhjtCPkLWtNxL4Rn1FJOAmqknS/IIUivJ8C9ogH6BbuEKIvbbR4FU9vVc
         AjnD6mHqhoMRlNIXMq2Obr9ASqgQ24yoEsknzE+mP3Uv3rfL+2IsEpWbT2YIm9fwo8ZG
         Yv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394408; x=1777999208;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSwLJ8qoJ4k0g3ywERijbSEuPMU7O1XadiH6FINTJ3o=;
        b=d26f3ugO9T3W7IYJFvSTkJIL0kQ2fxaXr2WhEo5WB0+vG3emuyMt9cYlu85+OfnI+F
         Smock+PiSttejPyVO02gHdWoGSj2oK/ZuLeVXUQw5QMdR0DMMMwlOL1i8eFONVM7FiRU
         oxLDdmj0NaprlI8d8iRRDbP20CsnyXMqeeqsaca2dEdnvvIzo1cfe5oJwFGhQreb3QKn
         J/fs+rm7Ro/+oUqZh2umXRIf06z9Oq7eVnjS1mLtMY5ADiHCuoBThxwRQjVq/yJGAhYw
         ZAbD+Xnujo1jvXpgKwq11chEPubMC3LX6i4B5SAA1buY2q0zXul7UVek2jPuwpjOwr96
         TMfg==
X-Forwarded-Encrypted: i=1; AFNElJ8JVE9DmSKubLz1MNU0E0BT//DYv3buByF4yCVFBPGgTOUkwUG4dJbfRQWefk8yaqfEZ5JP0iQGhkEMWajU@vger.kernel.org
X-Gm-Message-State: AOJu0YxBOOp94DGT4iMvWmS5oqUYG33QPC+SyVfMeNMeQBxu5IXkAkNr
	gB99MC2XY5ijpOBbpyYnigL0iSriUmzpTv5+ptC2NjQzBZMuBNqvH+qgYxy4Bppx2WyQqxwNbtA
	LSUbxHZRb2FDG7f8Gq5y6RRm4FQrawYGMgMYdyp4xj0WrMmBE9AiT/+X5RDeLgI1oijih
X-Gm-Gg: AeBDiet7acH0Oiw5VvNYLLfm4Y5Vggx1Bx6JdEK8kd4stYTNirP5M33A35Vj4WpIK6w
	gqWvj7GhgsIuF69Dvs7sgr9vKQzN+/56TADxhfIa6SiojuVtVI5nDsOnh8Dr6nsQrUnXV8hRXbd
	siERRBxVaL8GaqXOhh3kaiF2vLqTpO2LtpeTFqCJCFwKrp4eSfbMY0rqoe+FuuT3gU4vm6B45eZ
	5FWih2RPudiVAUGyQHBW19XyV+IoJI/MjE+KLSxquhRGFr72W2X+3aAn3u/jySBaUh0xi0KK1ac
	er+80wdgxhmZbeed1IksyBu8ApSL1TROqDrEnhCngbUvPWmoQwiH5vqVbDW/bWznfWirTB97Loi
	e9Bwacx4BFVCIBg9cnpnYCKZD7/A5VcJ6We4FU90JbQ5nTAYDMmhN0A==
X-Received: by 2002:a05:6a00:12c1:b0:82c:eb46:acb9 with SMTP id d2e1a72fcca58-834ddbec5d7mr3739919b3a.24.1777394408075;
        Tue, 28 Apr 2026 09:40:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:12c1:b0:82c:eb46:acb9 with SMTP id d2e1a72fcca58-834ddbec5d7mr3739883b3a.24.1777394407479;
        Tue, 28 Apr 2026 09:40:07 -0700 (PDT)
Received: from [10.91.112.28] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae00e40sm4009175b3a.12.2026.04.28.09.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:40:07 -0700 (PDT)
Message-ID: <59bd0773-5c12-44d1-99b3-9ddfac8b1a4a@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 22:09:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Don't use UTS_RELEASE directly
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>, Kees Cook <kees@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260428144553.1103785-2-u.kleine-koenig@baylibre.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260428144553.1103785-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LHilKk4X2DSm2ttOdIQO3CW88MAT8COu
X-Proofpoint-GUID: LHilKk4X2DSm2ttOdIQO3CW88MAT8COu
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f0e2e8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=7nqr_66b8YCbs3nQVBwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2MCBTYWx0ZWRfX1PxJwrsE26xa
 v3Yn6nQMZb+mGS/r6YXgiRkW7q/+fEI99waiedCLq8TdJsl30dQIdWQPMFzpE/gvACx+TKLDuRe
 vhTEmjzU8UnH5CuAT5dvloFe01sn7J62wCY5fusQ+MPWCFbKgmIq3aea3q8qXbmOxIF3xTkCcGt
 VQgjXMjB7U4/LZ0cAAaIjWPlsbNf/oLgqvZ3KW9FNn/86ECl2StxdsntbNUsmX92jqbIac8YZ+a
 tvcYMxqKXtlxqWLVwyVbs0eJtIh/ctZxCX4cQRVxoJ3PYiMyBZFJVd2xbHJSNmTkq5E/5mg6Zk6
 Y5McjhXX3moyt6Q52hOdPfU7qcnOWMG1dxWG3Q2M81HJIhXJft7h5Cr6a337V/TrSfmvKpr5gi/
 P0JBNQZHcMFH5KL5MiNeJr/uyvwVvjWGvDnDo5pF6lXDsLO+QzN5G+XwU+AUDAEB+9xlb7EEsYE
 u6QuigHgmo9R5yaTW9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280160
X-Rspamd-Queue-Id: 8DFD648994B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,linux.dev,gmail.com,poorly.run,somainline.org,kernel.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-105050-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,baylibre.com:email];
	FREEMAIL_TO(0.00)[baylibre.com,oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/2026 8:15 PM, Uwe Kleine-König (The Capable Hub) wrote:
> UTS_RELEASE evaluates to a static string and changes quite easily (e.g.
> uncommitted changes in the source tree or new commits). So when checking
> if a patch introduces changes to the resulting binary each usage of
> UTS_RELEASE is source of annoyance.
> 
> Instead of using UTS_RELEASE directly use init_utsname()->release which
> evaluates to the same string but with that a change of UTS_RELEASE
> doesn't affect msm_disp_snapshot_util.o or msm_gpu.o.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.

> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 4 ++--
>  drivers/gpu/drm/msm/msm_gpu.c                     | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> index 427d3ee2b833..c6eda3cf2e62 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> @@ -5,7 +5,7 @@
>  
>  #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
>  
> -#include <generated/utsrelease.h>
> +#include <linux/utsname.h>
>  
>  #include "msm_disp_snapshot.h"
>  
> @@ -79,7 +79,7 @@ void msm_disp_state_print(struct msm_disp_state *state, struct drm_printer *p)
>  	}
>  
>  	drm_printf(p, "---\n");
> -	drm_printf(p, "kernel: " UTS_RELEASE "\n");
> +	drm_printf(p, "kernel: %s\n", init_utsname()->release);
>  	drm_printf(p, "module: " KBUILD_MODNAME "\n");
>  	drm_printf(p, "dpu devcoredump\n");
>  	drm_printf(p, "time: %ptSp\n", &state->time);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 930e54d1b0a7..3f3925b11eea 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -13,11 +13,11 @@
>  #include "msm_gpu_trace.h"
>  //#include "adreno/adreno_gpu.h"
>  
> -#include <generated/utsrelease.h>
>  #include <linux/string_helpers.h>
>  #include <linux/devcoredump.h>
>  #include <linux/sched/task.h>
>  #include <linux/sched/mm.h>
> +#include <linux/utsname.h>
>  
>  /*
>   * Power Management:
> @@ -196,7 +196,7 @@ static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
>  	p = drm_coredump_printer(&iter);
>  
>  	drm_printf(&p, "---\n");
> -	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> +	drm_printf(&p, "kernel: %s\n", init_utsname()->release);
>  	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
>  	drm_printf(&p, "time: %ptSp\n", &state->time);
>  	if (state->comm)
> 
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731


