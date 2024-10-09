Return-Path: <linux-arm-msm+bounces-33687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C29996826
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 13:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04358282CDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 11:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DD51917E8;
	Wed,  9 Oct 2024 11:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mGjffzzI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2147318FDC2
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 11:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472480; cv=none; b=YTBDQ3uxywwrH8U9RTQlxc5uNCXaaL0sPbzOI+cNALE16SWQiZb9ZP3n9NUkIfQns/vu6lLRasXweJz4LVZPIkqd9fEBVU5OpYOMQkSTjQ5mS2MoNH1e8TxnCf+iA602y7BP0JmFScu1LR3OJ8NlAKnYPn/ShHOkwMU54x3/t8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472480; c=relaxed/simple;
	bh=7c54uW3lN5rc1TC5au4z8TqSBDgGhRE5e0/oetoH02Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqGHd+ny2Vjp0Lf++DqSGtpT2pTNh/qnp4UjztcSRHT9kl+8bBEA+epkgaFgdonwYQOjUdcqUq7JWXHc4xCBteBj/R5rD8Z5bxnxVDbF8POrYqUyzTLbnnQsZskpwu7DYhfei+9j48l/9V2bf/89IJx0S5xQW+Ki16gcv/YW+EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mGjffzzI; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e25d164854dso5714248276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 04:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728472478; x=1729077278; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fFC+bB9pGan8WcQNSrPQe6GRFwl+FEQ9GC351PPtFXE=;
        b=mGjffzzIqYr+ZH8poDEJpDtGIb/hnhQrWzEdwG3Js+0IgiZ8r+RkkEvnjeRjB+r4c/
         CJTx42blS/TUkPbtJQhBmfcv/k7W69m7mu2jj/+Za9YAqzqfATn/PU+UPSvcCR5JplB3
         6MRu3s4SdpWZ81zDJ3mZgdzhpR3Q/FTXfOMKbXCN1sBNWfD7qLBjk54IYHJEENV2KPoX
         J7Mgd4TwBWUiFGYOjcUjYwBSy6q+uVigUjOpDuOEGNrnOZRNfn/7fCGtyqtQFIPLgwnR
         QE+/e4Hr83pQIu8W0CFBSgnUNRfZ7IEiLSU1EHLSaWPLcnDneQr74dqngpDO/peT270W
         fE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472478; x=1729077278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFC+bB9pGan8WcQNSrPQe6GRFwl+FEQ9GC351PPtFXE=;
        b=W9qZksD3aS85hLxVXIfOZjbEkGnT+Vqv10AjfRTVvnS23aZ3fMwGe5aV2dcERw/nLP
         nf9zcyWg9Y+DNYMo/+/KDD9sf1UMmagg2nIVe6Y1TWluVX53pf0wSyts77wD8kJbK+Ac
         ZQAsOmOT/YWulCFD5ixBGFAwyDPoflyDxPTkyArTd5U/7xhUuzbh20dNvE4zYrAXY/pc
         mzASoPx0Vog/e5qTjgr2uos9Y0Sl2DjqSQ3WelK0nNMGye9vvqEb9gFFvvMgzg2WGJ1C
         yIMK691DzJPekkP0mHSCxYLdAgY5wHjS+Hi+EA/ZFi9M2AaLTO6TdSLJKFX0d2Gzuxwr
         GMnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTfXa1LXEWVv7aMe3k3muJElTl9MdNpDxakeKdoiIdT0A+2Hq5XoWB3Q2fYO42WnIK7vGpBNtLFLqiOdl2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8vwtCTeWq/Rgsx51XMT+Kan3KF54r5BfzSNNX3Uli+PQA7T6w
	B9PomZtvj+6+KOmw2IWFCBGp7/LpLz4CKr1Whs94v1XTNuDCmqvFj/AQOFDJBs72MdXgLgvv/18
	uzWkiAQYx9eNRqHx7ltWXtfK9aFk7kdJR5vs9kQ==
X-Google-Smtp-Source: AGHT+IGoX0qo0TwHIFzuDhJ8uRvT8liLFL0dVJP7Xz1NBAOVSmENTvV/zOkcv3Wjec8D5Sxd9qEo1roy0l5OEKEWDTI=
X-Received: by 2002:a05:6902:10cd:b0:e28:f0e5:3805 with SMTP id
 3f1490d57ef6-e28fe36482amr1767867276.18.1728472478141; Wed, 09 Oct 2024
 04:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007060642.1978049-1-quic_sibis@quicinc.com>
In-Reply-To: <20241007060642.1978049-1-quic_sibis@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Oct 2024 13:14:02 +0200
Message-ID: <CAPDyKFqnvEy5D6xXTbnYsRKRfXTJ4o+3V1QpVDh1SyqJambd4g@mail.gmail.com>
Subject: Re: [PATCH V3 0/4] firmware: arm_scmi: Misc Fixes
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, jassisinghbrar@gmail.com, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	johan@kernel.org, konradybcio@kernel.org, linux-pm@vger.kernel.org, 
	tstrudel@google.com, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Oct 2024 at 08:07, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> The series addresses the kernel warnings reported by Johan at [1] and are
> are required to X1E cpufreq device tree changes [2] to land.
>
> [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> [2] - https://lore.kernel.org/lkml/20240612124056.39230-1-quic_sibis@quicinc.com/
>
> The following warnings remain unadressed:
> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
>
> Duplicate levels:
> arm-scmi arm-scmi.0.auto: Level 2976000 Power 218062 Latency 30us Ifreq 2976000 Index 10
> arm-scmi arm-scmi.0.auto: Level 3206400 Power 264356 Latency 30us Ifreq 3206400 Index 11
> arm-scmi arm-scmi.0.auto: Level 3417600 Power 314966 Latency 30us Ifreq 3417600 Index 12
> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> arm-scmi arm-scmi.0.auto: Level 4012800 Power 528848 Latency 30us Ifreq 4012800 Index 15
>
> ^^ exist because SCP reports duplicate values for the highest sustainable
> freq for perf domains 1 and 2. These are the only freqs that appear as
> duplicates and will be fixed with a firmware update. FWIW the warnings
> that we are addressing in this series will also get fixed by a firmware
> update but they still have to land for devices already out in the wild.
>
> V2:
> * Include the fix for do_xfer timeout
> * Include the fix debugfs node creation failure
> * Include Cristian's fix for skipping opp duplication
>
> V1:
> * add missing MSG_SUPPORTS_FASTCHANNEL definition.
>
> Base branch: next-20241004
>
> Cristian Marussi (1):
>   firmware: arm_scmi: Skip adding bad duplicates
>
> Sibi Sankar (3):
>   firmware: arm_scmi: Ensure that the message-id supports fastchannel
>   pmdomain: core: Fix debugfs node creation failure
>   mailbox: qcom-cpucp: Mark the irq with IRQF_NO_SUSPEND flag
>

Is there a preferred way to merge this?

I can certainly pick the pmdomain patch, as it looks independent for
the other. Or let me know if you prefer that I take them all?

Kind regards
Uffe

