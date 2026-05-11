Return-Path: <linux-arm-msm+bounces-106950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIUkFfniAWoEmAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:08:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF4750FBE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D9213003602
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E453F54AE;
	Mon, 11 May 2026 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F98Hcl7P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBAE3F54AB
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508171; cv=none; b=T5T/vF8FfhNAY4yidv2QSvh3Rk1WYu4da/LIezwf7o2cCT1nCOl1oCgDeehRGD/Zc/iKoCf3XXgeWbTF58rWk0DKlvv2i1rEedqqxE/XpxgJdW/cmupP2/L+3PEuslOaFlXbsHiJ0rsbRRcPeOCPySRsIxHFYRK5y/jZdyI952k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508171; c=relaxed/simple;
	bh=xBV3ooU7HJctQKbetHsRzhQj9tWOVcLJfxWQJUIu/0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaxMWJiiywiO1mIS1/5FrZj9yLW+TFxJjBDNpnXL4NEEEG4JUVX5xqhn065KYbXBtb8Zvv/vgPx63e3/LYAlQ74wTgGBHEqBpZANZiYZH+it1XRzcA82IOMXU+wdPBz7s24AEzyKiHvIvrHDcrLAPbMrFn7QRZrblGkca4iAivg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F98Hcl7P; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48e72b02bf6so2322445e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 07:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778508169; x=1779112969; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H7fD4bUEAsspIYeU1XCz4Z33/IVcGrlxp4VIfHS9bo8=;
        b=F98Hcl7P/GkVx3S8DlAQ2HIHM6O3zIUhgefhoVCXHywg10M+KAV4jY2v/gG1j3Y6FB
         pag212h5+/SsIneZhImK9MTjSiIzfJIu8bELI8Wg9bYe5oOR7u5FhBo/PynNbrzglwN/
         I9oV4sR2ojElUyfJhzi87XwzxwgkIAh0F6SKGwBpkY90d3e8eBvLSpvQtPcbK9fFN6W5
         tcdrpnZUZTD5AZHtPyQ6bcWRUp+eYtgQLOHHk+SR5bM2kdRrJYpPNDIIFt0dQA5eJdWW
         aFM4xkFINvevdkN+02k8YDpxYWqRG0i1U0Mf7mkj0gJBr6ZgsBnbn0Yo2Ni0u1zUYtI7
         6o0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778508169; x=1779112969;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7fD4bUEAsspIYeU1XCz4Z33/IVcGrlxp4VIfHS9bo8=;
        b=tLLvOk9bWjyybA9Fj3b52JjtSUjdU/rFj6wkwmNqiKaNvoRsSora3xY00e70QROB6J
         1P05dFeTepb2sxBsV92XvbeAGmQK5F9PqDxkll3TWKfZxPriL9R3r3Wdcn1akFeqRwSG
         z3L+3xoq7jDBy4HmphN4nitsbhGLYjO1YOtFnSlKPirUBCwQjIcwyZLgoNsDlKqcQ9Uj
         NrXJBMOmbm4F/GaHHvXrBTcu6YkFDAendyKn86WvpdzMa8dbMIbYoYtShHWofjI6kUPQ
         7vfJiZzAxYnb9Aw4/KXyng0lJIbloRhFEH++DSc78EfDnT/u6oB+wBEUV8ZI0SXBmm5m
         aBDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uJju4w1vPkWmsm7bwapYgj8c5KuVCgcCLKjzLANvQLOa3r1FHh2o4+thoMv0/Lq4tdjKK/mw/N0XyPgnv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5FmInDHsTNws6x0AiBMXdm0IZSkJJRXtG/+jAa8IY2sSfESa8
	LLCJZDHglYfhQwye6WQti0GmKgdw0f4h5tClxz4ID9mhqfia5EuJuZ9f
X-Gm-Gg: Acq92OHJMTVz3K417oPN8yMRNWKXhazF2cTsDUW7Esiz9YIPvbhzlHNHMSQvG15L4/4
	f8WXv4Lu5QEmfoU97xe/V6T0PpIR5TU0YodYX8izabT73j2PF0mwwP95IU/+K3Q8aU1ZvpUVd0n
	mvAHqPoW/i9Zzdw2SSShwzNV2ebGuGxHj5Hy62Pp4iNRJl4hiaGPdTNSdpNn8dwmdvz+9JJlPW4
	eMmh0q4zQMOYutG1Yd69YxJAEXVimMpGLPjZMnD+WPMGBbSoekLGDbqsMMnjryJOMkhdOtATMIi
	lB8Tt/JQWPbjQXGEmAtLdMtXn4oN+q4MtQnMPY4qKLoXjd+bOKTTXrpzhKzdp3H44rAKgOqaXj6
	7yMi5O/yHIAEFP5Y+SfeEEvXP+nfUrKM2K8B8U1UO0B/xZcQRtL/Q1OWUvoRTlKQ09Oh+rlil0i
	2iyQFGQCP4nYC05KY=
X-Received: by 2002:a05:600c:4510:b0:48a:79da:c87 with SMTP id 5b1f17b1804b1-48e5310852amr175491285e9.8.1778508168488;
        Mon, 11 May 2026 07:02:48 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d403:cf00:a128:7a98:678b:6a30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6fff9c91sm201254695e9.1.2026.05.11.07.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:02:47 -0700 (PDT)
Date: Mon, 11 May 2026 17:02:45 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v3 0/5] phy: qcom: Fix possible NULL-deref and runtime PM
 race conditions
Message-ID: <20260511140245.5gftwzynmke6m5ro@skbuf>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
X-Rspamd-Queue-Id: EDF4750FBE3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106950-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:02:35PM +0100, Loic Poulain wrote:
> Address potential NULL pointer dereferences and race conditions related
> to runtime PM in several Qualcomm PHY drivers. In all cases, enabling
> runtime PM before the PHY instance is fully initialized can lead to
> crashes during early runtime suspend callbacks.
> 
> - Attach driver data before enabling runtime PM.
> - Introduce initialization flags where needed to avoid dereferencing
> uninitialized pointers.
> - Reorder pm_runtime_enable() and pm_runtime_forbid() calls to prevent
> unnecessary suspend/resume cycles during driver probe.
> - Use devres-managed PM runtime helpers for proper cleanup.
> 
> Changes in V3:
> Rebase on next and remove 2/6 (obsolete)
> 
> Changes in V2:
> Split patches 2/4 and 3/4 so that the null‑pointer dereference fix and
> the runtime‑PM enable/forbid reordering are logically separated.

Evicting this set from Patchwork, which does not even apply on linux-phy/next.
Loic, please follow up with an updated set if you want a different form
of this to be merged.

