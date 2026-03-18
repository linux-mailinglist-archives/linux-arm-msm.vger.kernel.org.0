Return-Path: <linux-arm-msm+bounces-98511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN9dM8u5umk4bQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:42:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8445D2BD5E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E95030FBFF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB933DC4D0;
	Wed, 18 Mar 2026 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHsdSivm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF6A3DC4BB;
	Wed, 18 Mar 2026 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844478; cv=none; b=ky4r843Kjkq6UJqOR1Af2lXehXrxdYh5E2N2NH2yvEoKFA9HN1WXHIQX1Lusiwc7uhCSBaIFCulTS0PTZsK4zlO80Bp1gesrfzctSdPgvguMvGc6aq8Ufj3BmDtA6cBh6WpMjaLFd+sjI2caO+T0xH0iM1dkVC/f6eBd10JJ04U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844478; c=relaxed/simple;
	bh=ZegwjzOxofSoi9+5URns67w35sZfMK6aMZyQWU17DHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rxps81m9SmbHbIR0X46iEXljZi9G7jK507CWPbLu7trq8jvYxoB/HCOH/8dI3yGoiHXgcPVJe2Qgw15dOEU0KExd/W09z0DTWcV7ciAyvPosqvmNuVYZNJ0yPenqnvZDIlZjB9jv/oeMx3iLsqFaPNuKuRwT3BPmkb+kcbqchC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHsdSivm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84EDC2BCB1;
	Wed, 18 Mar 2026 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773844478;
	bh=ZegwjzOxofSoi9+5URns67w35sZfMK6aMZyQWU17DHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CHsdSivmZxv5bTR7occX06Hi771/+GrGCNitaA4qNiHr5+zZYGxLJYLIG2smNADYj
	 Dmq6EYu5mVz17pJ8xoYaOxYSGNfT/MyY27z16ssuku7VKht0c6jbBcQhR67YjZZHck
	 czT+l0Ry3UsSJehnLsG0Q+AYvJ+6JdIOMfcuIkO6z+yiPhkN6p8V/cEF0aWUFinPrB
	 0HLLEuRHkbxTfK4WoWXcC6c5IHId4BCgJnPASI9DSleV/5sTIILJr0tnqq5XxRVVPY
	 YSL1f+TQk1Sx/ItwAIMMd26+STYtw1uSfAFL4KQ4W93M9RlFfZ48Mxp2vEwo13U3sa
	 8YwjFQwxrCejw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_jingyw@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Reserve full Gunyah metadata region
Date: Wed, 18 Mar 2026 09:34:29 -0500
Message-ID: <177384446643.22424.11496360893478141356.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302142603.1113355-1-loic.poulain@oss.qualcomm.com>
References: <20260302142603.1113355-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98511-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8445D2BD5E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 02 Mar 2026 15:26:03 +0100, Loic Poulain wrote:
> We observe spurious "Synchronous External Abort" exceptions
> (ESR=0x96000010) and kernel crashes on Monaco-based platforms.
> These faults are caused by the kernel inadvertently accessing
> hypervisor-owned memory that is not properly marked as reserved.
> 
> >From boot log, The Qualcomm hypervisor reports the memory range
> at 0x91a80000 of size 0x80000 (512 KiB) as hypervisor-owned:
> qhee_hyp_assign_remove_memory: 0x91a80000/0x80000 -> ret 0
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: monaco: Reserve full Gunyah metadata region
      commit: 85d98669fa7f1d3041d962515e45ee6e392db6f8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

