Return-Path: <linux-arm-msm+bounces-98592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SA8nGH1uu2nGjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:33:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE59A2C5877
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93AAB3199455
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C733E36AB72;
	Thu, 19 Mar 2026 03:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmLoQK3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43DE274FE9;
	Thu, 19 Mar 2026 03:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891095; cv=none; b=kosCt2hOAUXOqgCRDO5esnVmFD1H4HTSkFz6JkMOuXxuxo9OowBDgYjYpJtsTt8ZORFehZpleSY1xbjc7RQOVOTUSsofkpGQiVKuMv3kCK1lU9zyAb0r2PpvPRucOG6PcP7oKrnTwHDWphckHrFNKPivmv0ahf+rWx9qiyynIzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891095; c=relaxed/simple;
	bh=jYdS1JAFUH4KiBByAAseP22ZgTxkYtDr/Z7IC4KmmgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mr6VBDblKjblOm8dvBC/8Fy0vMSmXpIAAhH0WrLZMM8jNIV8I9AzkHouqkwU0IzL0ZRGbFd2NexONB2VLHQJerpgXKQmO6mrsbGicBCbjoEBK3BqN1UZvGtmp3qv4T10VSxvzzXJg5qjkOYWTk525UwJnerBjlYQGMe+ohdYFxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmLoQK3D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5D7C19421;
	Thu, 19 Mar 2026 03:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891095;
	bh=jYdS1JAFUH4KiBByAAseP22ZgTxkYtDr/Z7IC4KmmgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LmLoQK3DYkZOKmwArhUnBq4tdAh8KPLWm82a4Rv8XnWDcRRUTUs1Jc78o7RKlEOiB
	 KxBapClFHK1pPFoZcGXYv+29uAUGTW5tF4NoDaM4OwkuHRGOelOKu31wB2JkOZxtsp
	 zd05D+e2TByZHeS9rygHy+3uQx43DGUfxNCsrnM2v3nr5jhWLBb+lwEpoEh8i7XRGw
	 Zj4wIzVda7wN3LQG1w9yvMt5Dx7mDMMaPDfztvk3CMmgMMktffl0ui4o1asSbcogCZ
	 Zw//7WQnQyNXdMPEfuOWeS4n49cJD2x9MyJLPHPwg3lYmTB83Rc8DCt9ujjvMy5XpX
	 SllTLwxNQRaNQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Fix TBT->SAFE->!TBT transition
Date: Wed, 18 Mar 2026 22:31:15 -0500
Message-ID: <177389107875.16612.13167583903605634684.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317-topic-tbt_pg_fixup-v1-1-325b8647bc82@oss.qualcomm.com>
References: <20260317-topic-tbt_pg_fixup-v1-1-325b8647bc82@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98592-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.986];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BE59A2C5877
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 17 Mar 2026 15:14:40 +0100, Konrad Dybcio wrote:
> Similar to the case of commit d48708500610 ("soc: qcom:
> pmic_glink_altmode: Fix SVID=DP && unconnected edge case"), leaving the
> TBT altmode makes pmic_glink_altmode report a SVID=TBT && mux_ctrl=0
> message.
> 
> Said commit reordered the check such that the SVID is processed before
> checking for NO_CONN. Rework this to take into account valid values of
> mux_ctrl first and hopefully solve this for good..
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pmic_glink_altmode: Fix TBT->SAFE->!TBT transition
      commit: a343fb1e03cfc9f6dc83a5efb2a8d33e9cdaf6b9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

