Return-Path: <linux-arm-msm+bounces-92754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gObGBNnpjmlqFwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:07:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4CB1344EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3CF93043009
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 09:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A475430E0F0;
	Fri, 13 Feb 2026 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2vd52Pm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A52FFFB8
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770973637; cv=none; b=aQI3/+Y1XkjdTZt2bn77y8hX/+nNGPqM7+HtHsRuuFRM1H7PO5m7L19WxofrmJlFVsCgzDfIBqeoTPivOxpLNLy9SlJkvMKrYI1KNu0bp2rnG7xTqY4ERVF/MLbQNbI8dolxsJnDsTPQ3mT9h0zKnmqnkkCN6LhNHhofpbnQ8lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770973637; c=relaxed/simple;
	bh=W/LWsnvp3cad7tMldpHh4EFXdjZoGYCeGPUJl8RNGb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uj51TuO/D67eyD/zUL/xlfCTTO9qv7OtdBSdTmYdKndO4AemJs/NLHtCt9Xwdl/1ZNHSP4C+LmorRy10b6n3oav/Vbr46Rtx+oyW0uaFlvhXJvBy/5VwlGpl/dbLdGPAn3WP+uC5hoUpVl3pLi8mv0mof/XwXncdp3yz/Jte+eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2vd52Pm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7A0C116C6;
	Fri, 13 Feb 2026 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770973637;
	bh=W/LWsnvp3cad7tMldpHh4EFXdjZoGYCeGPUJl8RNGb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2vd52PmJQgdASKdlWc6ve9iWZBraTdFqNTTAPGlN1cKbeZK/uuD90QuviImzNxOH
	 Qgq7iOYKSjgfoEfz8SlqkcjJR0lBil/a6QPrll5Kf/i5FTyeACypyP2Z+pXqv+7teL
	 NHU88uEKaluujOctZRjaMNnV/jvX68ellOkULMz3crjpyiSqA0vFz17Rg7BSegF5hl
	 dcXIorwvYNzFkNc1Nysu3lrut0iqSEn3fAHwnysorBbUIixUy2ckG5RJ2AUIvcPyDX
	 kGbxqQCHaVLwWrYtLI9a7f8gxcv4DAHiQfr8vUFy1/xGcjNk33zcletS8Pgl3MZGwn
	 RLLba5cASco1g==
Received: from johan by rho.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vqp8n-000000001AK-2OWV;
	Fri, 13 Feb 2026 10:07:09 +0100
Date: Fri, 13 Feb 2026 10:07:09 +0100
From: Johan Hovold <johan@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] phy: qcom: snps-femto-v2: Fix possible NULL-deref
 on early runtime suspend
Message-ID: <aY7pvakkOnaYsd5p@hovoldconsulting.com>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
 <20260205160240.748371-6-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205160240.748371-6-loic.poulain@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92754-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: 5B4CB1344EE
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:02:40PM +0100, Loic Poulain wrote:
> Enabling runtime PM before attaching the hsphy instance as driver data
> can lead to a NULL pointer dereference in runtime PM callbacks that
> expect valid driver data. There is a small window where the suspend
> callback may run after PM runtime enabling and before runtime forbid.

So here too, the commit should reflect that this cannot really happen in
practice.

> Attach the hsphy instance as driver data before enabling runtime PM to
> prevent NULL pointer dereference in runtime PM callbacks.
> 
> Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
> short window where an unnecessary runtime suspend can occur.
> 
> Use the devres-managed version to ensure PM runtime is symmetrically
> disabled during driver removal for proper cleanup.
> 
> Fixes: 0d75f508a9d5 ("phy: qcom-snps: Add runtime suspend and resume handlers")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Johan

