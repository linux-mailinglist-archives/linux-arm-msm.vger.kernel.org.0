Return-Path: <linux-arm-msm+bounces-110268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBtBId+NGWpTxggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:00:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E7960296E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E72F630A2673
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8872F28FF;
	Fri, 29 May 2026 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LeKw7myT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B7F2EA48F;
	Fri, 29 May 2026 12:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059350; cv=none; b=shqcNmCZcpyAixFADmGEyLVCK49JPRXoU43bxuZJ8wufjshkBnqJamkHw6czKLMaL+hBMaVHPSERN8T0jXATVc/rZESnhPIkZ5D9gIoPiIRRlMItYeXAN1AznmyTxzBhgPwClmiRgfTP1a/9Aki8DGjl5kZFGU6p7FbG3t+2Rkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059350; c=relaxed/simple;
	bh=Cn70iXiN7GEsThER13h//uqGvyj33evtVnnhzgqFTbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tEf25Gcsx4LDBBosyT5RMOmCVawD4ScUMaSRsgmptALnCDTWlEsCXeLXjvSCYWTksaaDYJOWSOvxqtUbD86ObjCRxvLXWTgw/5p3o4dgG5c+rJZZVGuC6a2PwyDXHthcgcvIw+t6ezgh65DtD8OYtNG34XY2hBInyezQUHQOlh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LeKw7myT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484041F00898;
	Fri, 29 May 2026 12:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780059349;
	bh=RbXyoH4Nrr1WYwjRZrT+HZoP2iiipvR6SO5E7QjQ6tc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LeKw7myTow9pSuOLfYrwl/JYQGWw+RzEGUvGOeGo65b16+TR+KdQreNHGVDwDdnT8
	 HpBpl7PGg/ain3Qdqdd95b5MYhbPAzNcE71HDU0LzhMfgVhfdWBPdMhJ/cDkDNjkpr
	 zIOGrWC2QRKpXNaNc74SXuaqJtgD/S5HZV+tCNB4Ni9JJIFCF4aWoLHrm/qszjxj+J
	 xTyI+XcDQWnbi9EUC9s/y02OBaUYNq+xKnBogcyPFjbaLVmVIooksWnYnyCxwAohJH
	 uD6iySTBaaTEuJDX8rEnL4G3r85Aw86eDsvWrZeYR0LV/TqJ4XzKMaznN/IBTU/arN
	 Mgkfg2nBIla6A==
From: Srinivas Kandagatla <srini@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
References: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/7] slimbus: qcom-ngd-ctrl: Fix some race
 conditions and deadlocks
Message-Id: <178005934698.9337.1596896791668971268.b4-ty@kernel.org>
Date: Fri, 29 May 2026 13:55:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110268-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 06E7960296E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 31 Mar 2026 22:22:42 -0500, Bjorn Andersson wrote:
> When the qcom-ngd-ctrl driver is probed after the ADSP remoteproc, the
> SSR notifier will fire immediately, which results in
> qcom_slim_ngd_ssr_pdr_notify() attempting to schedule_work() on an
> unitialized work_struct.
> 
> The concrete result of this is that my db845c/RB3 now fails to boot 100%
> of the time.
> 
> [...]

Applied, thanks!

[1/7] slimbus: qcom-ngd-ctrl: Fix up platform_driver registration
      commit: 9c1a88eb69355a7baaa6d0001538f200e3de5548
[2/7] slimbus: qcom-ngd-ctrl: Fix probe error path ordering
      commit: a0b85655673d5edb678cae5faa7488c7d2adc89d
[3/7] slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup ownership
      commit: c0e4faaace5f2ce54b32d08494126e828cfd4ee6

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


