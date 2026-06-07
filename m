Return-Path: <linux-arm-msm+bounces-111592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GMK8IvbPJWr6MAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:09:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0FC651737
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:09:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EeSf8JHL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Duk42Ey/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111592-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111592-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 425A93002D1B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 20:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FA331F98C;
	Sun,  7 Jun 2026 20:08:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB1B31E857
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 20:08:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780862935; cv=none; b=fvDt2dMK2itcN2gxNxG1Fr00yHUUxkQNuM5dDxP6DuxYnUJek4PqSyGmjZsWL/TwpQb2ZLTfSF9FFyqV6yf5C36HVVtKLvjbnwebFEXtdzM1RNHPIWjEM93ElnsXCSt1NIwaGyq2xxE7rNHJ034NCkdRDp+DEuesTsm2j/dlgwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780862935; c=relaxed/simple;
	bh=qzLzWGP9HuDRMM6ea6QxhwfJ92WImSxG1EGx7TEbb20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BybF7bGD4lr6IcLKT3Uag3cDQO508oGIPdGtp+Kt1UT/oR6FshXyQUjjCjceS9XZZItSzG6QbiiPvSgN7kkA6sz2ukIyzlPcXrdmL5CK2/DQCP0FdH5oExpZ7pMDv3L7cwj29fdVN95jYlYuGOWiwMlbJMs56uIaWiOXdjPfIDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EeSf8JHL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Duk42Ey/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Eljjg401553
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 20:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iFcW9UHS68mSqlmGCliD70Ys
	nB3Zs+FG+TvxvsOMESE=; b=EeSf8JHLi3YfF5SsQHVHrRwGVu6l98VMf3dBRkj2
	Rd1MH/p6v4lmDi/rgpD0la4vBh9aD9DxhefvPRluk5oDAfDLyFz54MjLLTdXsl64
	e0COl9FcDNDEYsR1CohGgTZUjG+xojM/7LcUcAD1mET85WRWSkxNuqehfhkhkNsA
	J8PoDhiN2fRFnyUj+DUsCO/ewfCiY5AO0zLKpjTUejoHn1/eIHvZ8jzUmNEimjFp
	uxcfTCBpEYoKJxT4/mI3L69pn6VCjzNx4f7oV7yR7uuX1xViyzBlJH4+GNxvxnII
	a0v+hjqd+M9Q7YB4m7m7cylaEBexWlzqZ3MI+LOw+ZU1Lg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrcy9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:08:45 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5a77f8bdc24so569066e0c.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 13:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780862924; x=1781467724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iFcW9UHS68mSqlmGCliD70YsnB3Zs+FG+TvxvsOMESE=;
        b=Duk42Ey/BYyyjzHaYFdrlXi872Ly2v9kNfyskrg47GFN41Tr0+/qWNVAVsILNxPRpc
         YVXVn+75r1/HUF+enRG//PbRdEZDokpIh2qVGZhTuM7x+kY63pO9vWkcEoldfkClcDta
         UXVOQeWX1TCaC90izjoOPDLN57kL99FU9HJ1xaqsPGjMdjwhehyqXNYt9ZbMTu4eY9Qw
         4Twh4WpXjwq0bZOlTLTbm8rl2qu6RuEGgZnl6nEwP7FF9W89HkoxGfVerqTwY4JhSAlC
         bYYIJ2jRpaU3Uzi2DMTGlNSxHqh/PHqT0FDvf7msoFH2+oxT/RLXr+W9QZEIqtUdch4m
         vdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780862924; x=1781467724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFcW9UHS68mSqlmGCliD70YsnB3Zs+FG+TvxvsOMESE=;
        b=hVuXmdnANfNIk/Sg6ya+U0bXCVerbttDz2sS5MTV+v5fNrAW5cDwZ65B3nuLhOL/E+
         5KTR0rwQJyrIt6+iYVDMcldLzm5+5aK2paIQn0j7cnHfClj6IZbKr4SRxgDCisd0Wigr
         y14Y6e0noy5FNJCn0fV9lQ/hKTr0mz0m+TKGwLNLmmGqR4QfdTBX6xlvAsr+mscNL5fV
         oeHkx7Ulc9YW14JlSKKVQhwD1U0m9duD5sqvutPmiZ1CNkK7axzgs7Te4UGh4v5t106O
         g1stQz2d/cGecNOaTDlIAXi75XIyCsQBJKcvQUU0p2SQWRUsI3afsVv33TIFJ65oVJXY
         VXYg==
X-Forwarded-Encrypted: i=1; AFNElJ+DW8AzV2Xjgc1XmSZF5ZnSv2Rpzz2RQBkHkoL4HvQl41Qwo7SgzFQnrc4p057HBEB26qyz5YWAdZqvWJQc@vger.kernel.org
X-Gm-Message-State: AOJu0YwklYbyZbWNpABPuWdF0GUP8DG2+SA/tBW4h6w8KFd8JPbzF/E7
	KfY7D0tTVyBSD2bXSPFDa0SGO2Giy5nC73xfU1QW+rehrcq9IrTeF1O84W43deQ4qRuX+wwXUxk
	+izvH8d/HtIC5tkUrWUdm8nw/J62F/GXqVi5Vmpe+bYGIzwU20Ek6anjzJhgck7fbgBuV
X-Gm-Gg: Acq92OEVSO5Lf4yyEtEBZvjpYP/kvfliHc31kkrPgGMVs7FeuecDvC2zzbApI0AZh5U
	cE6DhOL98+poV5cxT8lrKkc6WBJYKxT4isHgsOF62kJdUL4xYWwYG82ynRKVpoG/vKcH7O25kyr
	2WFFcGaoyVxi0+gGNhlUAZ7T6zB9DOqFkpmRS52ZM7TXARShocXczXalTXkaAj9RtfpUnrJ6Vna
	YLqJheLRntKA8kwuwdRIrvcNFmonz1rLNTdh/vaPCWE8zDBEDGgOXzIW5bHZLdtaKSnS+1+DK+9
	vo5Zb79jS1TNMrrw5iSVSpFrZM3sewbBJ8PsbyNYqgxIePWh20G8sM9UsyNGY1YxnJkQtTT/vR3
	YSdjNQpwLS3UE0HJruZlZ9yfbljt85i+MmA2Z6MovRi15k5RZfwCdRz5xyi8YvFPIunW1LbFtr2
	hvLussaklnG6EdI/dET05aw8mUQVXaxm43hBbASm+VFVxa8A==
X-Received: by 2002:a05:6102:370f:b0:631:4e9a:ba3 with SMTP id ada2fe7eead31-6fefb0a73c3mr5674128137.21.1780862924067;
        Sun, 07 Jun 2026 13:08:44 -0700 (PDT)
X-Received: by 2002:a05:6102:370f:b0:631:4e9a:ba3 with SMTP id ada2fe7eead31-6fefb0a73c3mr5674113137.21.1780862923653;
        Sun, 07 Jun 2026 13:08:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9903e9sm3239345e87.69.2026.06.07.13.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:08:41 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:08:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
        stefan.schmidt@linaro.org
Subject: Re: [PATCH v3 2/2] media: qcom: iris: rollback OPP vote on PM resume
 failure
Message-ID: <i56ir2zcypgfyiqcorsbzqbk63y2nutvxvs3e3vdl74c26foio@hvi6ifirifs4>
References: <20260604090059.46355-1-dennylin0707@gmail.com>
 <20260604090059.46355-3-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604090059.46355-3-dennylin0707@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMiBTYWx0ZWRfXy3QFvutXfJaQ
 u3k/0c2pC5WJ2hF2s+a2448Nlrm2ORJtbwQKYO/dfcmfJYm4DWcZlE92GO5sZy2Mfewl2rAUIKc
 pUK4mVp+yJx/F/22KTdAMHNslrn1BVwJhtu78epQIkwtX7IrFEh2XEjJOvgmRCBNHNllJd8Vgvm
 SuS528/o0AYIMA+wRpjS/w1SeUj8fKdP6r0uZebu3CPK4Po7gfWGil70x7Fykajb9bZmEMriP/K
 Qekp7HGlmGl62I1wEExKsKZrQaMoD5fVXyUud9deLQo/8WdYdy86LI0EdXAryoy+Vn/dlM9ETCh
 itLznNOTTk8e98qNPw0MvRrUe9gD8jtZRYFoZQKg+jiXii3N3XNcBLlUGy3owIgzJD6esQqagMw
 2Vu57MIDPP4hGY612JzG1U/BFtZlYGIRx1RQl9anSDqJTDWlY+/W3WlsMwTzeuMLLUGaNBerD0a
 K9slnGgO8z3ChZ1x+sA==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a25cfcd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=yux4S2Ae747FxQivS5cA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: LzD2LeSOv-BpqBHZ1HGWWHYyOVfjXWKU
X-Proofpoint-GUID: LzD2LeSOv-BpqBHZ1HGWWHYyOVfjXWKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070202
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111592-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp,hvi6ifirifs4:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A0FC651737

On Thu, Jun 04, 2026 at 09:00:59AM +0000, Hungyu Lin wrote:
> Rollback the maximum OPP vote when
> pm_runtime_resume_and_get() fails in
> iris_enable_power_domains().
> 
> This ensures the performance state vote is released when
> power domain enablement does not complete successfully.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_resources.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Please implement standard rollback code, using goto's.

> 
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index f5e3341e1430..a7d25f7a201a 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -79,8 +79,10 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>  		return ret;
>  
>  	ret = pm_runtime_resume_and_get(pd_dev);
> -	if (ret)
> +	if (ret) {
> +		iris_opp_set_rate(core->dev, 0);
>  		return ret;
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

