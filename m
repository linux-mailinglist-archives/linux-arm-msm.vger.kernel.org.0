Return-Path: <linux-arm-msm+bounces-111601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vjpjBCrYJWqDMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:44:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6253C65188C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:44:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cCmcEv5R;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Wm7Ux+WZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111601-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111601-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B52D3005AC5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 20:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D18A30DD1D;
	Sun,  7 Jun 2026 20:44:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACE72E0914
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 20:44:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780865062; cv=none; b=W2lwaaOvqK+WLgTG0lD7TYFVvkwpUjA/6963hdyrf0Gt9OHfLpii7EYwT6bCgXcXDNCMxEPNqxsbH2Yqax/z/6aA6cDxr1iK57DjlX97dcmlwJft7rfEUp2RtRfvoE45sM2392ictbaOJxwRa3E6P7pylGn1AIzfJ8cvCMwclE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780865062; c=relaxed/simple;
	bh=tquqogWj6GSh8fmWxquG8FqU/tSOEW6bII4HXmMjDTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkadtK7OoYFsGBOFQ/L3+6rAa9Fit9y0Es9ekYEdSQtTp9i03DGU8iboajphDGf7chtHtAkTio6VU1xnOZl9hQVqaTZL7FIemmLH+3A/nA2JsI2w8trI/QZ8FQ1u26wjk53b4wMw9ak0pkMzlS3749Top5kRUBg/XZmTHjgZFpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCmcEv5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wm7Ux+WZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657JU9Gq967045
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 20:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KQvxeR13aB49mDUdwZizzQKT
	jruFNIwIR8/KYRAVC40=; b=cCmcEv5RicEIe9BO66g570dfbttLjJiD3zt5OuRx
	V3bwYiGXWn0HzR9CM61pzBQUJNgjoAGWrAMFx++ajIUEayvf4QMbrkr2BV6ohdDx
	h7Ggo1nWdKaUqee+gpcRgAEanAKz8yDU9RmuwS8m2J0JROkb5p34+Gd1KZOimDqF
	939Kc+Rb+gjiJ9iRxvdBBy0XzzSTHqW266ZLkopByfMdf6bDBVlz7b+koOLp7VsJ
	f3n1QXyWfdxnQxhsT3iNyNA2bGToCKV3LsanPVodRGNAsiZs0I/jgxqIxDxoAhIn
	YCHA1i8pBvyKXnIA9fk5jit+82un1085NsWba8ZfrFBMDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrd1cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:44:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177bddf6e0so92015301cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 13:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780865059; x=1781469859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KQvxeR13aB49mDUdwZizzQKTjruFNIwIR8/KYRAVC40=;
        b=Wm7Ux+WZdzHwkrpSsVDEVYZxGXQcq1Ox3iO6V1hEsFdlEEhTCpvAPDvbfG31vK191E
         JC0fOkfYgquJnkSEkFPZ/8KpjzBFZaCtzepGcJPWMoVDp9CANXCm+GApb+E2v4q6L2kT
         0paBEBijjDCECCytfZNn9qXbOh3xBdTViGLfzBdCOGJ2xQ8cLNAMRG8mh7DzFfH8anop
         wm3m3VvwWsKETESkoMsdtA9/Ik8GcufSuzFScb1ihdNeT6exxdRg8Kgx2TyOZ3d0Ku4g
         sv2fBVaSKTSnOgFWdju7b7mCqrA4Sw3GBMDo1T43mTfwz2T/G/gkdhz8ork34DjjKlFW
         No+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780865059; x=1781469859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQvxeR13aB49mDUdwZizzQKTjruFNIwIR8/KYRAVC40=;
        b=goPhfDT8/VUX7bmum/ks99gjiZ5rCR2DM6bCKo4ZcO+kM0ZqZ0tjcNUnGRmrAeuToj
         BRb/fOahSjM6x9J0lbtKVqy319VFQfa6ohSbSOEDSRPzJI6Ez8G3aVJ+4ZaXoukrPF4U
         Ev/bOuoY7sk0+az//Q2sSfd7T/Ya9kPkZozpU/eo4xy+B/pTopOcMWmGB2kGYU723Yoz
         vK3Nv+sEXqspR9D9N0KKfaZhUBvgLK6Jv61fs2nLW6iknI0z9BH7MFYzswDeDFZYaom3
         1PJ6hGecEhcZI/Hqq/kgJdNmxN5jzLai8bLt/pIOYhTOxkCLk8uRCBSnAa7J5cjnbUUi
         TgRA==
X-Forwarded-Encrypted: i=1; AFNElJ8x22GTVeCSBl6m8J7evsM+OdzxgQHWFWNgRbAap1/Jl/OtxtpZtxAyud94GaX6Art5DdpILz5odkHuYMuw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy91WojkD76boo0kss8HgAYHm9z62qW9YlDZC1YyQMuFqUhGnMu
	K+hF22l+f8ShEiYhUmDrYvVCn3A7RmDLxxODT2/Ns6fQLy1ubFh/QFzUzUU057/+6EPHtBbd3Qh
	0YTm4I69ViJ7YsUtz0okHalL0Z7XWPRg56l/FOKf/UlKYFb7T7cUJH7PwtlMkTjz3bl+RwqUyb8
	J4
X-Gm-Gg: Acq92OF29pG/1SpCUZLxHlpQ7BozNpI4p97ImLoGgNah9kiNKIfZfdT3iGtzX1nnV/L
	jLm+owg+s9eS5a+6uFIgzGFxsrGFD17UFyfoTB8qTGXvdShgCqjpkvZKHJEu1gCGZQJLwii0Vzy
	etwxvt0uto/Ue0DOALx+Noj72Ggbi0u5riU0LvCo8DnCZXI/LR5Nu0ZZBFtjvyEGY6oc6di185H
	BtQVkyxkvk3ayRbqy0zFI7aloAL7jGOoD91qfQ91Xs7PjkrHC3JX1zaoUWbp4R23NdFDfo9Q+DR
	nzuQfeccfq4l41AzwVJQ4xD+61N4YTfpu+165+csO34uRrJRXOkzLo7epqTl3Y+QFveTNTqhYld
	dkdnsIwIbuQgE1jz6jYdrNPVoqdlZWc/3DlRgVlFH1NWdtw85BF4RKfKMkN8xbkSR9YL5FNG+OV
	jAaipODrA7u2zJP3yDpKtAUZqzi2dInToFMCxPSWak7aaJbA==
X-Received: by 2002:a05:622a:28f:b0:516:6818:6d74 with SMTP id d75a77b69052e-5179882d40dmr134197731cf.34.1780865059644;
        Sun, 07 Jun 2026 13:44:19 -0700 (PDT)
X-Received: by 2002:a05:622a:28f:b0:516:6818:6d74 with SMTP id d75a77b69052e-5179882d40dmr134197621cf.34.1780865059285;
        Sun, 07 Jun 2026 13:44:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abd6cbe6sm41043201fa.0.2026.06.07.13.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:44:16 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:44:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        abhinav.kumar@linux.dev, stefan.schmidt@linaro.org,
        hverkuil@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: iris: cancel sys error work on driver
 removal
Message-ID: <f7e6d7xcn6llkzmwy42kegtnegh7ygdrlyh2fzlkthnj5stddo@za6vkbfhxyq5>
References: <20260604054708.42426-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604054708.42426-1-dennylin0707@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwNyBTYWx0ZWRfX1sGlDAjH1TL/
 mt6HOotlxaAYNftE6etpLVwt7qFL1P58SwhcZNMT9JKE7Eo8CCNJMgz9c48LQHUT52aL8SZ7Vln
 0Vmf2DAFJf94ElpAq66b1zqGVDuJwlj+VSn+e9dU1VZ6x3HE++SVlry6lXJuA3RaAomDBGatI6C
 qJ+LKFRFzR/PtTFEOheG6ML6MzyKy4mYgWnrVXyUzQvbYRf+tXq6bMt8NJ5JYsjGf8OFV9wQrDF
 PPPfnTaNsMSQ8AG79MxYjqYQ1xBx8vsfEfdfeAtafEMHVXhFK1ypFwfvPJR3icvDFUVDjk1a1eY
 CGfYkalu+oSU82gk5GxJQMDpkup7mD9vVU70fU+dw4dsX+Gsh0EfcxRbAa6TksGpJlJW4aPxTEF
 J+JWIxbzE2fXVSObDMfLtnNDaXikRGY97NbRkJIOeXtMUq5ED7/vjq3W17Rs0QapcLS2ko1xUez
 bcgUSdOPpR5j1sGlEAQ==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a25d824 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Frj_RsusioBgzsWQpiQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: J8sV5DWRPq6iNQ_5Yh3xCXo1bFBVTeSa
X-Proofpoint-GUID: J8sV5DWRPq6iNQ_5Yh3xCXo1bFBVTeSa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070207
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111601-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:abhinav.kumar@linux.dev,m:stefan.schmidt@linaro.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6253C65188C

On Thu, Jun 04, 2026 at 05:47:08AM +0000, Hungyu Lin wrote:
> Cancel sys_error_handler before tearing down the driver.
> 
> The delayed work may still be pending when iris_remove()
> runs. Since iris_core is allocated with devm_kzalloc(),
> allowing the work to execute after driver removal could
> result in accessing freed memory.
> 
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

