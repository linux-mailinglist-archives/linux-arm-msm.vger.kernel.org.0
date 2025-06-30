Return-Path: <linux-arm-msm+bounces-63102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFF6AEE65B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B72E1887437
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 18:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A9228C5BF;
	Mon, 30 Jun 2025 18:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qH12ulsv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="e5ME2pO/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D302AD2F;
	Mon, 30 Jun 2025 18:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306517; cv=none; b=d92OWUBPgXz4ubltFEYki6PqFWtut0pyh8MrImfc/lMgk3ugBss81+iQisP8jKgc6W7+/1wn7S/+AbpB5fP6YGVSAOZp62Pjbo10GsyK2hUJ+dcJWuILOtc9mGcgPkcyC4r8wHwbCfZf/jQdbpy3ToSSXX5tzw+XgNVqNZSetk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306517; c=relaxed/simple;
	bh=2CdHhVOb6QOFAXn5nPtsQtb0VEq4W/kzQjDGV2qloK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f+cmPy1gV0RbpjAeAmbR8n9NJEdz011DLLd8E8tVf/xQCT831Q/WJ/RAYUlM81hBiqbl+yx+8jtkG7ZbNi/Q/laAM/LNCwroEBqjoMrb5S/C2/PgdCMcNu4cBNtM5e0kQxrcwCdm10BSOaqNmcgSeKHjqdvV+vtzCMqXkzOVD74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qH12ulsv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=e5ME2pO/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751306514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tftqhASxSuFhs2w6Q/oxpiCMdlVV1z7bwMd/v7V5wew=;
	b=qH12ulsvWl8JiMlBZKVMUuxOamI7DwhtYmch5JcTFY2qbHf6TvAUP1NctCjP7h1BxAcdzh
	/1N5Q2Iex/JXpqA6TxU7NGVwmEcNYsJI50zFsT+r1Qslldmd5zeCOdPqm4mj5MEqRdzHel
	v/bZh453oWU93aMgeQp3As44V5A7gvkwHViHJcO3dn8kv0Ccl60/9kh53xHncXuWjDuDE+
	+FsK8UP04gZuInOH/D/+w4SQowsynfMHuM4bg3JGaPeqrhfb2W2AbP8ftuobY/WzrwuDqI
	7K0T4zquNT76KVTUD2pU67y19dJXaGaevfnBllH3ghlhKeQVDfkum/T2MgydSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751306514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tftqhASxSuFhs2w6Q/oxpiCMdlVV1z7bwMd/v7V5wew=;
	b=e5ME2pO/uqlLZaqbfwleJHIP+wLIWpcwJBBzMoxE6iEqndC/YIaA4X8vol+6lXRBz00J8h
	AxOrHvjcluCc/2Cg==
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Agustin Vega-Frias
 <agustinv@codeaurora.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Markus
 Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end
 in _driver
In-Reply-To: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
References: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
Date: Mon, 30 Jun 2025 20:01:53 +0200
Message-ID: <87ldp9m7la.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30 2025 at 19:23, Uwe Kleine-K=C3=B6nig wrote:
> The modpost section mismatch checks are more lax for objects that have a
> name that ends in "_probe". This is not justified here though, so rename

That's a truly bad design or lack of such.

Why can't this muck use foo_driver(name) foo_probe(name) annotations to
make it entirely clear what is tested for instead of oracling it out of
the name itself. That would make it too easy to understand and analyse.

Sigh...

Thanks,

        tglx



