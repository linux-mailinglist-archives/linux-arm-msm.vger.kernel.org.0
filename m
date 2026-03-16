Return-Path: <linux-arm-msm+bounces-97778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIqVCAVlt2kMQwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:03:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B57D293C4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BAA1301DECA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554E030C61B;
	Mon, 16 Mar 2026 02:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZjBdcW0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319B630C617;
	Mon, 16 Mar 2026 02:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773626564; cv=none; b=P9Jkjl4iMayuvMdlM61hc9A+vlYOYF2ATKHY6SmIgGGwCW647hWQCSkwsJzvZm6Aamkyf06fhhCNMijT54YaoDXRj9r95txuB6Ih8u2QI+LxX7fDPzMNLhUuu8WruiGGuXxdH19H2Vm1UF/rfcYzOZFhOJyfWaOhM+ouRWH+70A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773626564; c=relaxed/simple;
	bh=1rniWbs8wKJFLAz52IKvGUUEMXY14VYrjP9NXuQUYa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kXUZwkhrMeRmYuDnOTgfY/AF20aGwCdPfwk4uzgbBZESLHd6/v7D49LinGg9KWHxW3JsBH2ybSekYSYpZw0WCzKC0sF2pLcXgIPqm9otldTUF/USolYiltcYJPPjezIJhuhLtPDhaxGpN7JVZ8MhXvvaoEk9de/oCYucqmL2unk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZjBdcW0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C10C4CEF7;
	Mon, 16 Mar 2026 02:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773626563;
	bh=1rniWbs8wKJFLAz52IKvGUUEMXY14VYrjP9NXuQUYa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZZjBdcW0PEtedHR5OXtKy94ae41Vr74gB1wsXVcaSG+Lx1CgdqxdBW1W+RJHUKmL9
	 UDW8FXD3KYeeTLNZp5pNjdVpUdsD3K7YflVibEnvkVMGuY3H7/OD/8CAm11KJZuu15
	 qgAaYRgs1Izxa/t5Et5NfrZVcl7S9e2zCUSjumBTw3tsupHDdxOWQlhmrXUGw3qKRj
	 3UhLFy0d7X107K2DzHkGJaTlM4O4RGA+eT/6g1jhPVZ1p/7HZ1YTy2QuSPv4TdaJxl
	 3dQUq3aR8a1d+aqfcVp43F0jbhjnFeAdRVGA8If2MESaSyIuDB+MPRpygCGWmngmmc
	 cTuNqEJLRk2gw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Chris Lew <chris.lew@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] soc: qcom: smp2p: Add support for remoteproc early attach
Date: Sun, 15 Mar 2026 21:02:28 -0500
Message-ID: <177362655067.7429.10097680594827277371.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97778-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B57D293C4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 27 Jan 2026 16:08:44 +0530, Deepak Kumar Singh wrote:
> Some remoteproc will boot during earlier boot stages, add callback
> .irq_get_irqchip_state for remoteproc to check the states in smp2p
> and mark the state "attached", also add smp2p v2 support.
> 
> 

Applied, thanks!

[1/2] soc: qcom: smp2p: Add irqchip state support
      commit: 8a9a7b9d14c21d060301a8dd4a676ccb4ade5870
[2/2] soc: qcom: smp2p: Add support for smp2p v2
      commit: 42c4cf5d482813067789dd5ea2e33f3b7805e7e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

