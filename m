Return-Path: <linux-arm-msm+bounces-99547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA88KVoJwmliZAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:47:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F0E301D5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98627313B43C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F24E3A3826;
	Tue, 24 Mar 2026 03:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNWQRy0C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B85C3A169F;
	Tue, 24 Mar 2026 03:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323743; cv=none; b=FUfcA/EZvdUT2FnoRy2b80+Ev/KTnUM8LULhpavJikzxgl51wsWi4GwpPNkVEru/JFMy1Z6g5M0rPIUtKABiJRClWa2YjZeeMgF+dkF6VK7sJXSDJyD3jWxgEGvGWoYVc481xRmSgLUSk185ppXJY0yHRGlL6sZNeE30QNTLXBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323743; c=relaxed/simple;
	bh=10TlgMSe/q2uzmOIAr2NJuiOT/Ea2pw8WEGad038rjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CswoelZN1yMp214DQgXLG+zcl0kgKL5x9bmMtAMoiFIFuKBucRMmzsIyVwTd7yqRnzopiIV9OH9I/5GutvjhNfZ0I1xsQ6rf0tQFYygDeacfKu5cUxt2bM587zqouj9TCk+uoRsc875HN0iBia4x7LJl7yGM5lBdjVht9YVGOTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNWQRy0C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCA1C2BCB4;
	Tue, 24 Mar 2026 03:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774323743;
	bh=10TlgMSe/q2uzmOIAr2NJuiOT/Ea2pw8WEGad038rjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MNWQRy0CeOEomSjRkP1NFw5rRp+i5ObbWx3AV3LrZtyG+vCgNvj+rViNAO+JM7nwU
	 ZNSnQ8cGTOPK7dMnhYFP/2ixaTYCV7UVYVB3YtPPeivgEiiiqa2ANgul6UjepVLRV6
	 JtGTQpGkK8ehN3E1/xuHfNJ+vDym0AXhFcFDZ8+Ju6q9eFWtWRD7IrU6k63YEH3OCt
	 rAiFQQTSAUR5Y+d5MC4aeaW9Y2AsfiwO2CNCHnzQCbe8IQsqb6o3341QCbMOijwcYu
	 XJ0Phjol5wDfi8GhIsDZznVrHyzi4WpYNA63NoaxEEJl+ThsPJJ5rJO5ToFVA+403F
	 BuNQiqCquwXqQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mohd.anwar@oss.qualcomm.com,
	krishna.chundru@oss.qualcomm.com,
	monish.chunara@oss.qualcomm.com
Subject: Re: (subset) [PATCH v3 0/1] Introduce Monaco EVK Interface Plus Mezzanine
Date: Mon, 23 Mar 2026 22:42:08 -0500
Message-ID: <177432372688.35532.2521561502034738726.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303164314.886733-1-umang.chheda@oss.qualcomm.com>
References: <20260303164314.886733-1-umang.chheda@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99547-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10F0E301D5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 03 Mar 2026 22:13:13 +0530, Umang Chheda wrote:
> Introduce device tree support for the Interface Plus [IFP] Mezzanine
> expansion card used with the Qualcomm Monaco Evaluation Kit (EVK).
> 
> The Monaco IFP Mezzanine is an additional add-on card which can be
> stacked on top of monaco-evk board to extend peripheral capabilities of
> monaco-evk used for industrial applications.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: monaco-evk: Add IFP Mezzanine
      commit: 1ef1cbb7239d9dad754b7b048618e2a2f48d07f3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

