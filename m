Return-Path: <linux-arm-msm+bounces-48109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B00EA36C6B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 08:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9336E3B1D18
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 07:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A804618C01E;
	Sat, 15 Feb 2025 07:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="u+5RnPZz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4828715A843;
	Sat, 15 Feb 2025 07:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739604301; cv=none; b=nz23OqSVXo0BLhzF66KYzTQytVgYu3UpITFAGQ7QOdSv0dz0e/TB2o2aGfYtkjfm0BVJizt6vyB/JAoPHEMSTFQLdt71d71DrnJ8pbcM/5mNCOJBzobTQ0MhiUi7yvA/cYwxrVcMOlUHXKv51EvZwlitZNLrWXMDTcn7e+6sjQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739604301; c=relaxed/simple;
	bh=g0DserNjnh4CPfXzi6skQIf2mt9+TFY4JYtcJczP3I4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FjZqUSGfoMKPUn5sWLEfRX7hGkO7BmGdcGxxa4Rlj4ANeCZyl6nrRGZEdTQiK6tzSR5/NgS//XHyg6mz5kEY9zCePsDQdOYiwZOOX9FJib3g1DOZAZvcHKIwzuKkFWtz77ogW8pEyWf+0qjlsVre/fevqzF7RqLYDB8zkvmgHhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev; spf=pass smtp.mailfrom=oltmanns.dev; dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b=u+5RnPZz; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oltmanns.dev
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Yw0md5Bcxz9sp0;
	Sat, 15 Feb 2025 08:24:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1739604289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AftpR5FhL9ZRrXGJ0FAdsd9x50d7E72otdacK1ldixc=;
	b=u+5RnPZzkcE2cz10+O8ddBZKRm+ZHb+nqhxMraSTBSK1BHclf1Y6YJ/l9aDVr9z3ld/IFP
	aqZtISvhvhO8Ttrzsfgi5VMttKnXXwOwO5qV55zmTKD9e8LEg65I+tnOeHk0meYnjYhPh8
	gwSyC89DfIycc4wQXa9YqZFYXr2sHYCoAebJXAbpcypoAUxE/WloVK+V2kpmSrB7VesXgg
	DMNOg24pdvkFAtw8pcCW1Ip9o1BdetFuBnhnWssUAJZPnxKHU+7PzmPfDcCz3b+efTDEen
	ubWkZ68bFpQRdIcXmr8zBsA5lvv2if1Uw9ANtf0ZOcRheIZa+NBacA0Nh82Bzw==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,  Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,  Chris Lew <quic_clew@quicinc.com>,
  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,  Stephan
 Gerhold <stephan.gerhold@linaro.org>,  Johan Hovold
 <johan+linaro@kernel.org>,  Caleb Connolly <caleb.connolly@linaro.org>,
  Joel Selvaraj <joelselvaraj.oss@gmail.com>,  Alexey Minnekhanov
 <alexeymin@postmarketos.org>,  stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: defer probing on sdm845
In-Reply-To: <aujp6tbyug66jamddd5mlpdnobiazapyzwtkkwo23uckd6x7yx@b73cwtszcjlr>
	(Bjorn Andersson's message of "Tue, 11 Feb 2025 20:48:36 -0600")
References: <20250205-qcom_pdm_defer-v1-1-a2e9a39ea9b9@oltmanns.dev>
	<2vfwtuiorefq64ood4k7y7ukt34ubdomyezfebkeu2wu5omvkb@c5h2sbqs47ya>
	<87y0yj1up1.fsf@oltmanns.dev> <87msez1sim.fsf@oltmanns.dev>
	<87seon9vq6.fsf@oltmanns.dev>
	<aujp6tbyug66jamddd5mlpdnobiazapyzwtkkwo23uckd6x7yx@b73cwtszcjlr>
Date: Sat, 15 Feb 2025 08:24:40 +0100
Message-ID: <874j0vy8jr.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4Yw0md5Bcxz9sp0

On 2025-02-11 at 20:48:36 -0600, Bjorn Andersson <andersson@kernel.org> wrote:
> On Sun, Feb 09, 2025 at 12:57:21PM +0100, Frank Oltmanns wrote:
[snip]
>> Just wanted to let you know that I've tested Mukesh Ojha's and Saranya
>> R's patch [1]. Thanks, Bjorn for cc'ing me in your response.
>>
>> Unfortunately, it seems to fix a different issue than the one I'm
>> experiencing. The phone's mic still doesn't work. As I wrote elsewhere
>> [2], I don't see the PDR error messages on xiaomi-beryllium, so, as
>> Johan expected, the issue I'm experiencing is indeed a different one.
>>
>
> Yes, it sounds like you have another race following this. [1] resolves
> an issue where we get a timeout as we're trying to learn about which PDs
> exist - which results in no notification about the adsp coming up, which
> in turn means no audio services.
>
> Do you have the userspace pd-mapper still running btw?

I don't.

Best regards,
  Frank

>
> Regards,
> Bjorn

