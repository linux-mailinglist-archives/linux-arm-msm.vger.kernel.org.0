Return-Path: <linux-arm-msm+bounces-112148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tAbuEdL9J2oD6wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 13:49:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF4865FA5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 13:49:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=emJEdqc2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112148-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112148-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F7813031EB7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 11:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231DA3FFAD7;
	Tue,  9 Jun 2026 11:43:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293003EBF02
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 11:43:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005408; cv=none; b=Nm+mZYBFhxvUlEHLAaUqHbgz7vzEtlM0J0P6agSlXkLkLmPNtgfEVGfNXOL1s6gJRItRx/MGxjTDjkXDgJuJ7LlQkF+40NENA6Cl6EhA+Q4wA/hB69xLeC7MFGvcZuSKp7jfZBOd/gV1cJFZ+xpCxXm6BQj8cHlHQmLQeUStmAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005408; c=relaxed/simple;
	bh=etwaOqfrv80LIP7Sx6oI0au3Ah0IMLiJ6WXRs3bOmiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEf37jpQ1N2v0TG/rboAKurlAvCm4gMQY+1ZlVQHJZsakNt5eawJcuFwVCsm3nJu4LNSu1zufgocNGvxGM0cxITFa52Hy+wSXbv84vCXgLISiQJZieUHZStfYiU9IPaDznLuoDP7WfWrRnrpFPNPerTOhfx6F2wN8WlPnBBzDRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=emJEdqc2; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45eeea039ebso2838527f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 04:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781005404; x=1781610204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LpMpBpNcZIgzsuu0bBQY/Gbp97K5pRk23WWL6Y8u5xg=;
        b=emJEdqc2FLqXlTxg+bu034XpgQ7GH0KbZX+MFVHqoQX7wkTvz+F4tmDHnqBfQGxP6x
         jBZ9R7AaCb5UKkwuRGynuVPW28WNrOCwW9YcbMWQV5bFigsitriWMADllsG8Ffsi4HUH
         vlYDcQhva7FOE7JgsbykrOIVWPeuemLIDJ/SU7OdTgIw9k0AdQFPjFYaItNEtCYd1hr8
         5e1HG0nIbsipIq67DQ3NRMwVleznVpbDlvao2jKwsU3TwgcQP6sljZMX11ZSRNV7KZ/B
         w6eC+KAd8l3cnnKkr654Z2r9RzBrHw6j0967nQ2Ej/uk4TDRYEqEsigznA+uqB57kbUd
         /NeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005404; x=1781610204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpMpBpNcZIgzsuu0bBQY/Gbp97K5pRk23WWL6Y8u5xg=;
        b=POVWGcMQBKFV1z43wIryEJkV4WPAtMpzsRzK/77UIFCCsevL573CIxzdcPy+Mx+L6n
         72SVQOqEotUe+dpRlXAP0ySFTVsLpOReLiIhrMkipheTAJHSAwmhKfUrNDHX9oOHvIy6
         9GFyFozzaAn4kk7793iChMyryakmmD8ZJi9nyv/DWZPsSWauGBRt/EzRGwSN3ptAXfTZ
         /KazZVSWsLpj4nFlty0YCGlDlrske031ihF7f1XUE46pCQILwCa1QSkxfawt7b0zoUjT
         +dH41oCah6b3fN6S+Iek0tG+JfY9qyu1ydZoJ2W28JjboOtqiD1IyOO4FtMFMy9piaEn
         1skA==
X-Forwarded-Encrypted: i=1; AFNElJ+cDepBqN1ZefaHAbGiwpquOfxaYTwoBn63oa3EtiV330uCnsq3Qq0DLiLPuDiFlqaotayGtO0qzm6EY1T7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn9UfaYen2R6l1Q+6rpdjgUCYNpq5Zuj5IWNIs16A1YMeUybKZ
	csEx80PC00atyiRctDdMmI0LglXzEu2PkHtb+nVQnCKC/4jvPqsqt7iL2gNH8UaIv/M=
X-Gm-Gg: Acq92OG6CA2SZmIwqVVXOuV6XTyllakKUjKraL4jYumvKvtAr6qFbzGysmA12fCu54G
	nCzwhC2n64YPrPGCX9lDtqnmCpIBhxC6ttk1X1BcFQHCmjEDCnX5eEgcOTJBWxspHi7TpKRN2mr
	aHC/zLxh3v1wLB0qHy7bdyXatyDtVZ8N//GacA3rIMYIm49hBPvt4WyaUl7rV97TiOGI09lPw6u
	j+XUn8IcPyCK/ylU4+pgNLfHhWh07qvf8b9KfZI9b4sZKV92umozGSvY//kJDOZT09OL6y+XL3l
	3ETg8siahkK8qY67HlGbhjl7OjGsS0WftGR5CWAmE71flKA+2N4ny0IzjJKmDFV5Ybp6n+H3sEp
	48qVP9b9mfFWwzGUninNKspE+MeU/kMCBVNisWt7fnseUEHRKUfn3WgrBP/X0V5qyuOQND8FX23
	Du7+5kgRxgcAWf8oT3nL1ECMnmrcg45zh1fuoykTEZqgi7TQ==
X-Received: by 2002:a05:6000:2994:10b0:460:3233:f991 with SMTP id ffacd0b85a97d-4603233f9e2mr21994861f8f.40.1781005404400;
        Tue, 09 Jun 2026 04:43:24 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm57355924f8f.8.2026.06.09.04.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:43:23 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:43:17 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <aif8VS0pLYurFEho@linaro.org>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
 <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-112148-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAF4865FA5C

On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> If a subdevice fails to stop, it indicates broken communication with the
> DSP. Continuing to stop further subdevices against an unresponsive
> remote processor could close rpmsg devices that could remove the memory
> mapping from HLOS and in case if remote processor touches those memory
> can result in SMMU fault.
> 
> Change rproc_stop_subdevices() to return int and abort on the first
> failing subdev. Propagate the error through rproc_stop() and
> __rproc_detach() so callers are aware the teardown did not complete
> cleanly.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

But what would callers do about this? If you abort the teardown sequence
half-way through you now have an inconsistent half-stopped state that
neither a new call to stop() nor a new call to start() could recover
from. That doesn't sound much better than the SMMU fault. Or am I
missing something here?

I would expect that we should either be able to tolerate the SMMU faults
with the resets involved in the remoteproc stop/start sequence, or that
DMA gets cancelled by the remoteproc stop sequence, before the buffers
are unmapped. Perhaps the order of our stop sequence is just wrong? Can
we unmap the buffers in the subdev unprepare() callback?

Thanks,
Stephan

