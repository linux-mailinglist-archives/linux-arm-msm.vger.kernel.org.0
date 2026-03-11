Return-Path: <linux-arm-msm+bounces-96898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGPpMfIjsWkOrQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:12:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5078C25EBE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B110732A1BCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1540F37700D;
	Wed, 11 Mar 2026 08:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KfGn8+3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EB7359A7B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216231; cv=none; b=eBkTCi8qs420yIkCfyBKD9mqYx1LtQTGUzS5beuJ9k8Qh0qm7Tp3vyGwNJlU4uFY9fkee7U8FAeo1G9suHT1QJ+Ssg777XLwIp11XNksYd6SYfJTY1PL+DgAa0W8sd7a2Po8yUaDKeI2lqP0wPnL1agFzzPak8s2KgsQayt2ENI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216231; c=relaxed/simple;
	bh=rsre+xoqF4I8t3EjmEwHt5ty2n0tD2K+A5STG+RJ75I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzzCnS3M/Y+Ak8efTdC+vUOQCWbIemjJF/ycHwVhA5WS1vbvnlZGHHXcUs9q7/usxMF5Fmw6qNDPBqkTrFeNKqomL2e9S1jOEx7+Nk4lrgncoSdhPTJrinLFKCRlUn/9QaS4U+1a47L5MAtichR0YTrQ52TxlZxbo5KPB2OWf6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KfGn8+3h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFFBC2BCB4
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773216230;
	bh=rsre+xoqF4I8t3EjmEwHt5ty2n0tD2K+A5STG+RJ75I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KfGn8+3h4e+NMyMcPHyts0qH8oqHt+9fe7SodTbWjSMFtJMfxJGc5fAqgo7/gZ9Fu
	 TK6CGVYpw2V7Jn3Pk6Sr4T90twLsulLZusgTbQ8WHLqiQqNCG/q+E+lBlvaftngUjD
	 qzRacpn59BVVJOOyCqKl+2j8Yb+VDlVS150bL9AXasECFXcPa7gIIm5FhjOT8ew92L
	 nLliZhql25w3YTt9eGqZoiM/cRUgqgMRZUbiKnhpRnjxIqB9KKRQhsIDEvtHRPrgRC
	 XxTCD1T9kvH9no+l8uex8ICN8Bsmmfkewjd30/SeHhZM6Q2M5gW6DPWnQmtrn4JTUV
	 qBoPZL9pEX4hg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a3066b68bso73857481fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:03:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwKODsH8oyx3u/il/X48conBSxkfYEh/JYgPGrP61Sx5BxzdezyPE1owZ95llw7fx1j0MMUQkaagaMW3+q@vger.kernel.org
X-Gm-Message-State: AOJu0YxOGS6ACqhYxVo0mn2jeKyQV1HnxQkUvFU2GLx7iZ7evuXQr60c
	VwEfjVhhbZPZyZGDFXm6/OWnnjMn+oSif8TBogIy8A5EwSrBQRpzOGvZjRs4gG6/3MCL45xGK4T
	O1PNHAgom4SueQNyY9IC7mtDRt8hqWg3mbdpS7OFIbQ==
X-Received: by 2002:a2e:b8d1:0:b0:387:4ee2:1cbe with SMTP id
 38308e7fff4ca-38a67dc9220mr6423881fa.2.1773216229237; Wed, 11 Mar 2026
 01:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Mar 2026 09:03:37 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdzjY2UJ3uSUgCabCLqWJcpaVq5eSx3-Ph-AZXcBf-JTw@mail.gmail.com>
X-Gm-Features: AaiRm52ABCAk0kCFZ61a8pO0V-WhkvSQun4HTuAkOrhvrkcmKuT442r4SF3useQ
Message-ID: <CAMRc=MdzjY2UJ3uSUgCabCLqWJcpaVq5eSx3-Ph-AZXcBf-JTw@mail.gmail.com>
Subject: Re: [PATCH v12 00/12] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5078C25EBE4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96898-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com,vger.kernel.org,lists.infradead.org,linaro.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 4:44=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> This iteration is built on top of the v11 RFC with remaining issues
> fixed and the mechanism for communicating the scratchpad address from
> clients to the BAM driver changed from slave config to descriptor
> metadata.
>
> However: during stress-testing I noticed that sometimes a transaction
> would end with an error. The engine was indicating that a write/read to
> the config registers was performed while the engine was busy (bit 17 of
> the STATUS register was set). It turns out that we must not just
> unconditionally append the UNLOCK descriptor to the "issued" queue, we
> must wait for the transaction to end before we queue it so this version
> takes this into account and queues the UNLOCK descriptor from the
> workqueue.
>
> With this all stress tests and benchmarks from cryptsetup work fine.
>

Mani, Stephan: sorry, I forgot to update the cover letter to Cc you.
Doing it now here.

Stephan: I tried to use READ command but it would crash on sm8650, so
I went with WRITE. :(

Bartosz

