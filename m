Return-Path: <linux-arm-msm+bounces-96296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLjPEtDnrmlRKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:31:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B9D23BB55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DED35305CA91
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 15:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FB03D7D6D;
	Mon,  9 Mar 2026 15:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oJhxtnvN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2A13D75D8
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 15:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069996; cv=none; b=e7c7BxQhplBForIBaWxTrcoR1Y6Q5qDpeZQLC5HKO/a7P16qU4iYEE6PrYHAjnF4GHXNqX9avIfbeVRqYEu1iA17hVvGxhM/pG5bASOQUg0yRDcO/kisgnUudBM1iRc6197cbJuZQXO5iHqCTR6OVQSdXA2iGhnol6yCRatDVqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069996; c=relaxed/simple;
	bh=fLdlgK54rTn34EKZI8AHzVRLbm2SJ8RTjlamikvXF3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewLwM+/0f1UC/P8lQKgoOYF4SS9SI3QcFs5nrSaacDuVVengcDtvFObA4Fif2SW2BQ33972SACVBHrx3OzXbJbSskHG8b7PARbOsXKLjZXbxvzm+uxlhNdYbWRet3hw+QqSIsH/9IhMp3USy2T89LRWRAw/QTvDuXQ6OrZcIbYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oJhxtnvN; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so6158639e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 08:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773069993; x=1773674793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKq8ulzy5MHQKDxfFMVcrLftpi/uwWVl0kgu6a2rhEE=;
        b=oJhxtnvNSLAwxcoegdD3yehAgPXTS0Ww+A0ZrHOixHu0+C1b5j7nE/gTefUBdBmSSk
         gcmlAiXLOXRzX6l0BwCK0eUmpb84q4sBnmFwdDsSinJoe7FKuvJNPW9FFZT1Sf84YCop
         DqXKcQ2D8LInEyR9eDPeSlNMs7mGAVTnhclfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069993; x=1773674793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKq8ulzy5MHQKDxfFMVcrLftpi/uwWVl0kgu6a2rhEE=;
        b=VvZrTVtdBCZ1v3TPQqMJUrWvBJ7zCcZ0U2CLu7YLXTzzaPZ60mOeoal6BRs3xiqCeT
         DCRqERN2MnStgWEakFhv7AVhTBIvMIvLUH1JIB2c3Tr7RXAbsD21gPexnyQnV2ZVJbZM
         JevVBwq1aW+lrfKDvLu0bMFBBpr1jZTRKl08AtudZyncMY4rbifZQHZL/VDE2sujf+8c
         0TwXqup28lQbJ12a2tLBOKp2a14ZPxf6uaQrdtJyWodoAIYHgLuSn/XiGOMhcy8Q5C/8
         CURoJxbZaHBKc2dzTusjbHVkcgFNEsjf1C5Lj+eU3M1QZ+S4OkQu6ZOzgDh9bItvqR6A
         JxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzVYoItNy4XOg26xO8w/AeK/onGo/ZVwmkq6boFw87hDkkknV/qYcHQrF0hSBFfuGacXYHsQ858iCg0syy@vger.kernel.org
X-Gm-Message-State: AOJu0YzkPxicCUPIw3rUD4+ujqcyPBzTzDqmlwd4XmuvRCpgn/hAm6E1
	YvC1PZngsQBik1YRS74tc1JiNhgj6DFIkrNNarU+3GRj+I1y197wuo1Lt/ABFL/lTbb4XqgJrgj
	agIsyW+CY
X-Gm-Gg: ATEYQzwHmAZOlRvFhDsH0Sca1vu4/ROztmtOHzX/lK+y1leMG8JgG/RMy/VjnMwLz5m
	iWFtZ28gXM8c3TBTOxyLrhPZuqwoA1mqeTJDOYwqZ/jIiKsysBk3ECopr1/Yng0uHM+odl4wR5M
	F5Iu8QiO+ZooapmBaT0DlNVR3yG3P6gm2ltGv37FNt5lRYBhrNYS5ZxS2l6E1CCjdbuf5ZUcqrI
	70TfBjY+Bz5/gFtvYPaBm2wo6J3jZueggeVqqNJpwDtTjtbb+jGKWYttk1jrYzE6VwLy78PeE5r
	QPxFo/J543xVnLcmlgGBLz/052tTNcPipc2IxBnuLx3VpCBxhwOS1JVoaLxGFD97fW0bouosJCt
	PSwq9k2byiAVvh6rW65xmNk7JtupYIupPCSiNyZZzkzPucFkiYJuLDM3j0egwlqkTrvbbe6z0QP
	4biMb/pHwR+YupLeExmx9j2/dnbivxyBuRVaiFMdP5zuIzzgB2W9pQ1AGUb9pgcQ==
X-Received: by 2002:a05:6512:3f10:b0:59e:24e5:a3a5 with SMTP id 2adb3069b0e04-5a13cceb81cmr3723079e87.29.1773069992565;
        Mon, 09 Mar 2026 08:26:32 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d269sm2215491e87.84.2026.03.09.08.26.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 08:26:32 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e4989dacdso6205057e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 08:26:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqyXyiRJfj14+YdnEXF5n49tOtTJ9B31/iOb/RGlUx1wHnoRkyZ1C7lSYZPpw0y1eQhZoet2R7XzZcjjj+@vger.kernel.org
X-Received: by 2002:a17:907:1c2a:b0:b96:dcc0:2e19 with SMTP id
 a640c23a62f3a-b96dcc03e2bmr431706766b.56.1773069586848; Mon, 09 Mar 2026
 08:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Mar 2026 08:19:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XosP+rpT7w1Dcr=Xu7K8MCnA-=hndCgvsdwRAeVXuUdA@mail.gmail.com>
X-Gm-Features: AaiRm52PitiYzwSf40xttz_JauQBZgQS8kA13tji_SRNQ2F75XcOox36FcsJy20
Message-ID: <CAD=FV=XosP+rpT7w1Dcr=Xu7K8MCnA-=hndCgvsdwRAeVXuUdA@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] mailbox: Stop sending NULL mailbox messages
To: jassisinghbrar@gmail.com
Cc: Frank.Li@nxp.com, Santosh Shilimkar <ssantosh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, daniel.baluta@nxp.com, festevam@gmail.com, 
	imx@lists.linux.dev, jay.buddhabhatti@amd.com, jonathanh@nvidia.com, 
	kernel@pengutronix.de, konradybcio@kernel.org, krzk@kernel.org, 
	lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, lucaswei@google.com, marco.crivellari@suse.com, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, shawn.guo@linaro.org, 
	sudeep.holla@kernel.org, tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: F1B9D23BB55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96296-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,pengutronix.de,vger.kernel.org,arm.com,gmail.com,lists.linux.dev,amd.com,nvidia.com,lists.infradead.org,google.com,suse.com,linaro.org,ti.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Jassi,

On Mon, Feb 16, 2026 at 10:11=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> As talked about in the first patch in this series, passing NULL as the
> 'mssg' argument to mbox_send_message() ends up causing confusion and
> quirky behavior inside the mailbox core. Despite this, there are a
> number of drivers that pass NULL.
>
> It is plausible that some of the drivers passing NULL may have been
> taking advantage of the quirks of the mailbox core. Specifically, they
> may have been taking advantage that calling "tx_done" wasn't truly
> necessary for NULL messages (it was a noop) or that NULL messages were
> passed onto the mailbox controller right away without queuing.
>
> This series introduces a new API call: mbox_ring_doorbell(). The new
> API call tries to mimic the specific quirks that were helpful in the
> old behavior and it's expected to be a nearly drop-in replacement.
>
> There are some subtle differences between the new call and the old
> behavior, but it's expected that all of these differences are only for
> cases where the old behavior made little sense. The description of the
> first patch details these differences.
>
> The series attempts to convert all in-tree users to stop passing NULL
> for mssg. As per above, there are some slight differences in behavior.
> If any of the patches are causing problems, they can safely be
> reverted while debugging the problems. Eventually, all code should be
> converted over to stop passing NULL mssg.
>
> Changes in v3:
> - Suggest mbox_ring_doorbell in the warning message
> - Updated patch description based on Cristian's response.
>
> Changes in v2:
> - Instead of just documenting NULL, introduce a new function
>
> Douglas Anderson (15):
>   mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
>   ACPI: PCC: Use mbox_ring_doorbell() instead of NULL message
>   firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
>   firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
>   firmware: tegra: bpmp: Use mbox_ring_doorbell() instead of NULL
>     message
>   irqchip/qcom-mpm: Use mbox_ring_doorbell() instead of NULL message
>   remoteproc: xlnx: Use mbox_ring_doorbell() instead of NULL message
>   rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL
>     message
>   rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
>   rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: aoss: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: smp2p: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: smsm: Use mbox_ring_doorbell() instead of NULL message
>   soc: ti: wkup_m3_ipc: Use mbox_ring_doorbell() instead of NULL message
>   drivers: firmware: xilinx: Use mbox_ring_doorbell() instead of NULL
>     message

Just checking to see if there is any addional changes you need from me
on this series. It looks like it's -rc3 which is maybe an ideal time
for this series to get some linux-next bake time? A good number of the
patches in this series have Acks from maintainers so they could all go
in your tree, I think. For those that don't, I guess worst case they
just don't land right now and I can re-post them later. ...or if you
think they would be OK to pickup that would be cool too.

Thanks!

-Doug

