Return-Path: <linux-arm-msm+bounces-119240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rc8sGDh8V2prPAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:25:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA0075E0FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:25:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Nmd5qbkr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119240-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119240-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D7C23010BDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DCD466B65;
	Wed, 15 Jul 2026 12:25:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB1445BD67
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:25:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118326; cv=pass; b=kDYdy5WqCU5uvStAobyb+Iw7hRz96MFspENGM1sTYhdM5kzZicHDaFcCQGbvsDO0JlZJUvReGAeQ6cIvXRKL53eM8WUqyT+aUb9jdhbpaXI3ysSS4yT3eE9sO3ulYqYYAp/KAWpZQYAbt1BNblbQkpCZT+Yf+z8sWaivwuTIZSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118326; c=relaxed/simple;
	bh=s1XP3CBX1vjLoCZEqWTUBRju6xstvuxvI2ntg39GLR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IwQINXy1bTzgIUluye1nxFNN+C1z7CIGED5lrk4rYy5MUcTYn/9QvfRVUiMkA6PUTA8WANKaMOUD5XJYMg45yKpdnfcPJED9VbFmCyZ8/+/DYSPRwIlRRtTtvWWm6hMrDJucUGvKGWHixG/aUNCxgHujvBvxgJhJRQf2Rc5hBXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nmd5qbkr; arc=pass smtp.client-ip=209.85.208.180
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c7ac9b8c3so18938371fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784118323; cv=none;
        d=google.com; s=arc-20260327;
        b=ZGQZ54mAJu3BiKJntVHzVJUyfFruJUG/0TAd10B6zJhWyomRMbsBVCs/cct/gPvbs3
         eOPCxjU2of7/HEvPG/V+EuvH87398Elnx8tuMtvuv5QntidPRPd9UtWgUPoKbh7uMGkV
         0HnRYCli8gY/kqhJWDPpHfPUFHBq0pW7FBEEQJiF+Ggfj9D+bI3O5VYxRglyCnB2V/WO
         TeCpGneMXkxcESV8s8y1qwMg+kGz780CFT8/Q87U3qUtWJCKdye0UFbaR8esQC7Fy2oT
         GtIDyzvdp2wexdE+Y5DDRcIl1T3Y2YbbQ4crqz4pWALhZVDe3SE2Zatp/MSSrXFdJPkV
         +BsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=phmAAV/S+5KnjhMYpBu8jVRdoI1pgmVSU2EZUZpX/q0=;
        fh=bVJvPcq9GtX0f71t0Y5DbXuHUuhSpb+XridBhMdBUjs=;
        b=Xmxx2VcCSbPZQycLTI5Iq4IsZ3Fde2pBfutkwgOaSbZvE9hneGU4ufEsqp84+rGOtG
         GVpc4I762f0vdbybROYspq01QANsW5U8afsUxATJJ9DrVLE+O5ZNLK/I9tcGw/PIKJw+
         zDHr8pRKDSTs5EgBv/GPAyrNdQXh2EMdyvaqtPJNwqq2h0wu4Ss1LfYVVvtG5mtFc/B3
         PdC84CshNdx1qHUJx/HHU4LDM9rSHfLkLGaHOnDAQoFSomKnHjdb/BM+EhIRXLWNN/0H
         g6lQeOS8G++0Mfmp7Y2Tu8eF+ZxnQlTG1rKJ5NIX3M6HW2fpu7TLfFark6tAkZc0CAsC
         T+eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118323; x=1784723123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=phmAAV/S+5KnjhMYpBu8jVRdoI1pgmVSU2EZUZpX/q0=;
        b=Nmd5qbkrQU1E/3wSaxS0GjfkyNQPU/XKhIN0gqXHgslyspryt/Ry8Qeh3y3DUvwToD
         xtL88Z5iqc29xv5Lf5VQmdGs/hwfJ7GMSjZa3ww0Jp8xdG7wZB3M/Wovsuz8BxAfY3P+
         XRWbePAgM+9J6wXomvVr2AUmTvsFA/5ZmJkzw9MYkC0sD8Ye3Oc4MI2WWOHFJEe6r0tH
         kqWH+i1gyku9/bsUMfgktvZ3PbwNJ01N9n36vcsi3l6266boZ2T2Xxpj/vptRSRy/8Bm
         DcleDt6cRa4WBSWevcJXlf+JVDmZjremtqQZP/qzkcYSrKLrlYW5mRbbItDD6Hn4Kdtx
         q8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118323; x=1784723123;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phmAAV/S+5KnjhMYpBu8jVRdoI1pgmVSU2EZUZpX/q0=;
        b=SEvC9hRpR+4szOtJ1EBm8A+9C06ZiBmTM5RmE/Oy4YdzC+gCpgBTlVNEk2FFFAvP/r
         wOveqMgm4BTVNK4YF01JYevrY7e0N7lKYZDYsxezJusM77pJR/MSEP/zTu2tPSPkvNdv
         RWCx5MOFyl27xyei1/MseFvTxlHfcviMmffFkTPYRahcULCewb6/vePaSM6BjGbCHQTY
         qADlXS3kpsl+M/IETOxKsYeGitNNKg5QvUK/DtK/QZSXl1ObBp7Hwjlj1cCyplbVgKR7
         TMsKP9pDtVuKbwp8hlT2W5LRd7c3upOARie0lGNZQe/00sjggKwHc2JQTSjVocSayP7h
         CLbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIevJuHUIoqjOskIUlCH3UlqOKkSreqTswKKJI/jAv72ykcTOnvH2g1heI7Ld7okilGLaNqBr4c7rMyqms@vger.kernel.org
X-Gm-Message-State: AOJu0YxbCgUZswn4aZTOpQU0aavP4SVUc+OnGIn/qSWuE1r3pUeUAPdP
	yYDkynbxIckpu0LqjiHrZjvq0mURi6Z6QPS1w4+58mGIgIRtMESM71WXIVrF4EfXz0z90fitll8
	Nxvoc9JmtL8vJXbyLLBkHYLiTpSFRPhU=
X-Gm-Gg: AfdE7cmLjA3Aga/twCt/66FQZ/g5tvvxNJXtxckTtv6h8FxOXf74yHX44MPJAzgs+lj
	sXCjZVhDE09k+sbFKyZzWnfabonDz1ElRqp33qXaTXkhZuiGWS1gf2bbmJ+ufYbXqpuuN5dthAQ
	ktPPWnu6YltvuLibG0ywCq65PMocqQAexgtk0NLJ2sXq0KgyCQAn5C8nEJPUSmDF261bjSpCR3a
	rrdhpO2wPSi3t1MxtYasQsWwjkghQX+cu9dxvvZJJZ8Zi8Q1+/z99ywwmSW0PYzD1mvktO2VN4l
	MenLnRkh9P4stpLnoQqSe/HMv/Iuhk2AJmCKoE4EnyKzfwKKXXog9w==
X-Received: by 2002:a2e:a994:0:b0:394:3b62:b6aa with SMTP id
 38308e7fff4ca-39caa14ea59mr36819751fa.12.1784118322672; Wed, 15 Jul 2026
 05:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <178370682987.2572738.13491033810212556744.b4-ty@kernel.org> <jhl7fic36ec36pyaduw6xtmgvr75sxurngdykljbovdbt2j23g@ezon25dsv3hg>
In-Reply-To: <jhl7fic36ec36pyaduw6xtmgvr75sxurngdykljbovdbt2j23g@ezon25dsv3hg>
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Date: Wed, 15 Jul 2026 07:25:11 -0500
X-Gm-Features: AUfX_mxYH4-79PzEKbul0S_jMoxLx16udW5ZOUTVeJXUFPAxj9_qNMvYlkM_evo
Message-ID: <CADi83T4bioudCtHk03hLkOf7PG2up0gwoDTWGaseGh2m3R7ecA@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native
 ipq9574 support
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, krzk+dt@kernel.org, 
	mturquette@baylibre.com, linux-remoteproc@vger.kernel.org, 
	mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
	konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:marek.behun@nic.cz,m:andersson@kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk+dt@kernel.org,m:mturquette@baylibre.com,m:linux-remoteproc@vger.kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:sboyd@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119240-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mrnukeme@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mrnukeme@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nic.cz:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBA0075E0FA

Hi Marek,

On Wed, Jul 15, 2026 at 2:58=E2=80=AFAM Marek Beh=C3=BAn <marek.behun@nic.c=
z> wrote:
>
> Bjorn, Alexandru,
>
> there is another, much newer series by Varadarajan adding ipq9574 to
> wcss PIL driver,
>
>   https://lore.kernel.org/linux-remoteproc/20260713-rproc-v13-0-41011cbcd=
a3e@oss.qualcomm.com/
>
> I suspect these two series are incompatible.

The compatibility of the two series was discussed [1] with the Qualcomm fol=
k,
with agreement that "it is good to have [native IPQ9574]". I don't see an
incompatibility with how Bjorn applied this subset.

[1] https://lkml.org/lkml/2026/1/14/300

Alex

