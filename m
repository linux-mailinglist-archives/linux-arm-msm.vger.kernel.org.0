Return-Path: <linux-arm-msm+bounces-116432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OcsiFyxMSGqvogAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 01:56:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B38F27062D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 01:56:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mn75JHuM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RDMGQLk1;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116432-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116432-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64E233030B2C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 23:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4423314C4;
	Fri,  3 Jul 2026 23:56:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC70D31F9A0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 23:56:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783122967; cv=none; b=FukWM7OBockYHdBI/fl2kv/EqPdZ9kkto9MGuBW/dEMgpEzYhLGwDI26PZ9nDFjN22xNoEdmaMwJYRbqHhzIAuZTgnEV9Vggje/8DNhTlvoiHHTsD04z46rM/IBz7SevP2rvUy6dmNPjk3Jq5FUcZUnA0EL29DDTnJriXy1f1Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783122967; c=relaxed/simple;
	bh=ftRClBeYK8uSlbQPZhD1okyTCzkY7r+1vIQYxu6vxhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+o+Y4QW7puuWD5NX1JVeHvzNj/6qgHCEJxS8sja1FXWdsge66qGWoQzuTAOGHNU0NX2Y+BUe0ECEynRQUvqsCPEN0bWBr1VYb3FNFglr4VbIF1ohLiy+IrafoB/PcSNKT+1pV081wscvx/APpHdjN8M3d4mEPEWj6tFJTxvEMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mn75JHuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDMGQLk1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPWHd888369
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 23:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=831YkkMtfz85xC+Ki05XtBOm
	3sqOTqm30sA4vibS6XY=; b=mn75JHuM9d9DcziUCoj7eC4I3diociCa+WIkVbDD
	F+9etyGe2nOFh5ooPwbolCQKZrwj+uIuzzEfVGE87mg9kTRaD2CmPESHScaGCw6Y
	5neSQ4OUnuMNlMPRPBIbnXdjqq4wKoPu3wAcr+Dz9WRZBHM/loDC5TUCTor32nFF
	Z+Z7Q34DEDmjb0k3xufCswKmr5IBjeynhilXXqBKsOq/1qXG5anbJIdGFfhBKK5z
	dHCcoLNZHyrrItWKsaWzhWwDSJs6bUa6YgTcQkmUvSm7D7opHa8Tky72S37cMv0v
	p7SWvzNSu/2pIInjNGb+XOViF4DBDy5jDzcTlz3HWPuWKg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bu8fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 23:56:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so12694171cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 16:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783122963; x=1783727763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=831YkkMtfz85xC+Ki05XtBOm3sqOTqm30sA4vibS6XY=;
        b=RDMGQLk1B0ysakg5JrWKprSIXA0WV2GnXs8jq4uuQMZxzSQmNjCt0ccWP4pO0Fd/C8
         UF1slX8x6G0TaBt95/mCg20phDRww74Et9cTXseNJ+KWmZr/qQ23JI5VgTPnP1+pTpsO
         QgLZVnArtZS8UoLP6FLJzAMA9zgyDCcz1gpbnyOOIpBOydtNl6a4Hevtpx7LSVrSSvj4
         a728T87qvDmiaxykIITDxW1YeX/gycsSRJZCPdJbY838TpQmNGbTFIOfHvu9ZgAPtp0c
         Nit8ewhB5o0s69i+EGZ0MHmvPVL++pp1FnYi8dshM4XuutSPdIYncXAxWia0nlWiM24j
         z8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783122963; x=1783727763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=831YkkMtfz85xC+Ki05XtBOm3sqOTqm30sA4vibS6XY=;
        b=VPcia3sKAgEE623xGrl26B0TJ6EyoudBLeKnlFo32lbMasGElOSDySFVu9QKHYn7nS
         6/NIYPGmQRP20z7GV7TZ2QaRcskk0QHiCRasNKHbCpfjgfWPqskZ+LlpVafpu3fR2oZa
         AtOjnG+9Gq3f0zPTfwc74/VLbKwinnzjvwy2wFFLXxJhHQaWefyxcIM042keqL85ASvs
         1R4JtXbBwQOelWC5+GxueM71qTAcyf3+3SoyR3qsRe81rhWAyUMA0YWaAuLbwm+H1V2f
         Emk7HWyBj85kJp5uCPDBglA7PhuK351C3B0iC0OStrW1qqJS7w3ybU7JWzKMsWmUr0dB
         UbCA==
X-Forwarded-Encrypted: i=1; AFNElJ+d+KDmUr0d3CHIL35LDfYrH0wtMwTmyAugf7O8y/69RTLjGQYL1lnm0UYn5+mAe5ZpdkDYEebgnqWe27qr@vger.kernel.org
X-Gm-Message-State: AOJu0YzLFJ9q+Q5cx9LrwhjX3p0W38e4Ih3Y5z2vDCexgj08pQwYFhyU
	ByMogm6eNkQknNQ+Z6RhUgdQa4Qnlzq3fEOxlVIP/kWFWfGFz8/6cHP4dOJLoL/uAzGE/S5hxh+
	mmsVIYwUceR7+4iqz9zyNsIkbvEY3Ron4scMHyH7mmcf4HGeYvBrIe/yGrgTYJ9llu63U
X-Gm-Gg: AfdE7cmsvpogtIMhJTbh2oPDS4I8Iga0Ao+18Orf698qe02nmL7v7oancUsYw1qi90B
	L1ryT6WdOsoizhN9JCn0HosKBan4BjL3ePQkiC/awO8/5aBlRqHy5l8Jo3Q6UGtta8hc3J1bJBu
	3ckgu01gUBItjWhQanr/kOkJDVs0l1iblIzqSmWb9ucqrcn5m8PD5G8PR8//fT4Uaak2uWwk79r
	Vd7NDblx97YL+hPdVbldRuOkaGk+qcDif098PIuQ3RQZ6iZFDz534gDeWm+MXom0rSUPAgTcITI
	MPUYjdVqpQcv4OSH17rOonOPexQ9v5OSlL/48aNoAAMSkNrjXbqKLGAFwek8jYrx+q4rs1OaQhX
	NTbrFCi8nAeEG4gHjr0nVKZyZJW8FhsFl9Dlr9O6vVnXrfXneY/XI+2FgM1PNwScfMiMhJVsa5S
	2HcfDASBeAzqvDZcHzIgNaA7oV
X-Received: by 2002:a05:622a:1196:b0:51c:1fa1:80d3 with SMTP id d75a77b69052e-51c4c307336mr24520691cf.49.1783122962897;
        Fri, 03 Jul 2026 16:56:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1196:b0:51c:1fa1:80d3 with SMTP id d75a77b69052e-51c4c307336mr24520261cf.49.1783122962434;
        Fri, 03 Jul 2026 16:56:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb714sm833240e87.51.2026.07.03.16.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:56:01 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:55:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] ASoC: codecs: lpass-tx-macro: Use correct config
 for sc7280
Message-ID: <4rd4l5ioccdiggvlwl623qsdoy2udy5cr6sigyxrg5pbdll37g@sboebzvzlr6m>
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
 <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MiBTYWx0ZWRfX+bq0/4p1j/00
 FvwF0mvr9ijMp/Aa2tgFCsRuRjyGEmgr0gHvxwENUlBNUxnFWolv8/voyalh1OygkgEJFOAIRcb
 GRtmyg0VFHnICwihU+ybCgh3uZo7zpLkFBvO57MDiJATVgby2dnK40LlFzndl5o0XuFLXGZhfiM
 V8M6T2Vz/oZ6lUTsUiZKPsiBV6AW1B6FBNgzQstkJasxFnc3phNePNiYYmh1gzGYSkIBYQdiEs2
 eg23I8GHGF/zY4BvuH7nnH2yVJ5ok+qP6ds6Sca3zwdY6XEv54BXJMpwtkk0DRtvKkLGQYN+tFk
 8ihisFWjuP2oVuF+LbKtDqXMFNed6PQma8ycvDz1g2w02ioH+cySvyjN1U/S5zLvsmMKTgx4yzE
 pUVy3x1J8Mte89gOP8EoymeJ60D6r/IYsxksTH5V8nPjgVP5tQTNJcS6qCzEjLvSMP4FEcKtzmN
 PEwLjJE5cFHCtMJUPmQ==
X-Proofpoint-ORIG-GUID: Vb2bWhIiKteOxw-APbibLbzT2-mZOUDb
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a484c13 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=6H0WHjuAAAAA:8
 a=SMZjMqxzaKuBaJ7l-ysA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MiBTYWx0ZWRfX1DlKFr1ffiED
 dsVvKZHRMJCw+TOxVPn2phA/fcamc1aQmSKb+lBHOk+JXAfkxlOetDy9hBEv0YVWJePDXXPOfEg
 YC0f76gp0BKL0dMiMikflY72HiaBax4=
X-Proofpoint-GUID: Vb2bWhIiKteOxw-APbibLbzT2-mZOUDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030242
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116432-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,chromium.org,lists.sr.ht,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B38F27062D8

On Tue, May 26, 2026 at 05:29:54PM +0200, Luca Weiss wrote:
> With the v9 data, the controls will have completely wrong names and
> using wrong code paths that do not apply to v9.4.
> 
> Note, that this will change control names so it's a breaking change.

Is it something that we want to keep as compatible for the old DTs? Or
is it completely broken and unusable?

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/codecs/lpass-tx-macro.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

