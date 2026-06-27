Return-Path: <linux-arm-msm+bounces-114728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8tJzB66/P2qeXwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 14:18:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 054436D1E7E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 14:18:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=VAhpU2Ey;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114728-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114728-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1923230095DE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 12:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF8832B99E;
	Sat, 27 Jun 2026 12:18:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE4223394B;
	Sat, 27 Jun 2026 12:18:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782562728; cv=none; b=YsPYddJ6bQLmgnFNLR+Jx3B8VpZoOGuNNDJJ9ePG81p95XbbY+5s+w5cDyWcQCWW9C4EKS5XAn+UXXOI7vVFaPFEYu/joFejB4KNeHDm8R/b6U6A8xQZkxMMTXNvy7s8HA8fSMYd98PhL2w36nMMCEqUvDEU8ifw/lg9orJkjbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782562728; c=relaxed/simple;
	bh=eivawmkvEg3QOzOWv3jCpgD4FqmH/lPvupBZyhy3T98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W5BZf0vqt7eKHEWl79c7PsKTNc9dAkwrSwUDZlboF2MDKH7jjq9Y0vuhap5q1WIIv6P1RGxqaZMI4aArMaOh7ZwaO+WNoNOaZro8pe572/O5k9icl3gzSolhxi6/G4Fo5a08IdqydHXC9H/W6mLY1z7jLIYiVTTI4e2s0ogOtPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAhpU2Ey; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0375EC2BCB3;
	Sat, 27 Jun 2026 12:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782562728;
	bh=eivawmkvEg3QOzOWv3jCpgD4FqmH/lPvupBZyhy3T98=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=VAhpU2EyEL2zGGmgO60SjJbLfc4ka1tLn5BfvUAOnmI62ieB4UNM1bHJZPy+ElNbW
	 YF77HbFRdHvoPQRs5BUG2QnkHLhD+RA5byMIEEfkmLp6JEwAJGXMc+jzQ94ti5nSdx
	 qdx/daGmodFXM5vE9gu/R/3Nx4xSHkJgWtDHge4bUMkTvOlVC9XcqU2BVppPCoNJvg
	 4YCqJ1YQ0wzVlboBgBVjNiPoCvRy+S6jMZINwmMbba4GtALxrWtOcr6KUQHu1uaoFa
	 qv2lh9rexxBtAgS03GHDM67ebuqCSJUqUfkJjlHyao/58t5CUd7NgM7HXIhLkaPB9a
	 rO0xnkubU28Tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA16C43458;
	Sat, 27 Jun 2026 12:18:47 +0000 (UTC)
From: Sam Day via B4 Relay <devnull+me.samcday.com@kernel.org>
Date: Sat, 27 Jun 2026 22:18:45 +1000
Subject: [PATCH RFC] drm/msm/mdss: keep mdp1-mem interconnect alive during
 suspend on SDM845
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-rfc-sdm845-interconnect-collapse-workaround-v1-1-608a38de3715@samcday.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NPQ7CMAxA4atUnrHUlhIqVqQegBUxBMcBi+JUT
 vmRqt6diPFb3lsgswlnOFQLGL8lS9KCZlMB3b3eGCUUQ1u3rnbtHi0S5vDsux2KzmyUVJlmpDS
 OfsqMn2QPb+mlAa++odh3jvw2QilOxlG+/9sZTsMRLuv6A65c+oGCAAAA
X-Change-ID: 20260627-rfc-sdm845-interconnect-collapse-workaround-ba1cf846ca3f
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Sam Day <me@samcday.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782562727; l=3411;
 i=me@samcday.com; s=20240502; h=from:subject:message-id;
 bh=BMiudGPsxROy8BnSvYjoc4O7qJ+BrrRqh/a8bYRWcC0=;
 b=PsiWZuMwX4x8LrKzl/Bcpfpzq6k3TOSP+hKPP+Lr33iH54+T1jbS5Lx9oIUOWAal8GqgdqqRe
 4sGzPTD4htnBmYL4x356+P81ZtZfsL07HxZUmvi3bp68XLqVc1LCe6q
X-Developer-Key: i=me@samcday.com; a=ed25519;
 pk=bzyS0akxWMqr9+AXzgBRIp28KKpEOs+GjYMc2yf+aeU=
X-Endpoint-Received: by B4 Relay for me@samcday.com/20240502 with
 auth_id=595
X-Original-From: Sam Day <me@samcday.com>
Reply-To: me@samcday.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:me@samcday.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-114728-lists,linux-arm-msm=lfdr.de,me.samcday.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[me@samcday.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samcday.com:replyto,samcday.com:email,samcday.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 054436D1E7E

From: Sam Day <me@samcday.com>

If the peak vote for mdp1-mem is allowed to drop to zero, it seems to
cause the fabric to collapse that path entirely, which causes the device
to bus stall and fatally reset.

This issue was identified specifically on sdm845-oneplus-fajita, so this
workaround is applied narrowly to SDM845's MDSS.

---
This RFC patch is a spiritual successor to the "Addressing stability
issues on SDM845 with the -next tree" series sent by David and Petr 6
months ago.

As Dmitry pointed out, the patch introduces leakages to the runtime PM
refcounting. In practice, this means that MDSS never actually gets
suspended, which is why the patch appeared to "fix" the issue.

The deeper root cause is that, when msm_mdss_disable() runs and unvotes
the mdp1-mem interconnect bandwidth, that seems to collapse the fabric
entirely and causes the bus stall -> hang -> reboot behaviour.

I've confirmed that a tiny non-zero peak bandwidth vote keeps the fabric
alive and avoids the issue.

Of course, this is still a fairly egregious hack, but it *does* allow
blanking to suspend and resume DSI + DPU + MDSS properly without the bus
stall.

Here's what I've validated with instrumentation:

 * DSI host disable, IRQ disable, PLL state save, host power-off, link
   clock disable, regulator disable, SFPB disable, and PHY disable all
   complete successfully before the fatal reset occurrs.
 * DPU runtime suspend also completes. The bandwidth accounting was
   checked and confirmed to reach runtime suspend with 0 refs, with no
   pending frame state.
 * The device survives through MDSS clock disabling and mdp0-mem
   zero voting, it's really just the mdp1-mem zero vote that is isolated
   as the cause of the stall + reset.

So, I'm not really sure where to go from here. I'm sure that this
workaround is not suitable for inclusion upstream as it still seems to
be papering over an underlying issue... But it's unclear to me if this is
some kind of hardware quirk on SDM845, a problem with the SDM845 DT
wiring, a driver issue, or something else entirely.

I'd appreciate any advice on how to further diagnose this issue and what
direction to take from here.

Kind regards,
-Sam

Link: https://lore.kernel.org/phone-devel/20251213-stability-discussion-v1-0-b25df8453526@ixit.cz/
Signed-off-by: Sam Day <me@samcday.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290db..c635380b2ac3 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -284,8 +284,12 @@ static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 
 	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
 
-	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
-		icc_set_bw(msm_mdss->mdp_path[i], 0, 0);
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++) {
+		if (of_device_is_compatible(msm_mdss->dev->of_node, "qcom,sdm845-mdss") && i == 1)
+			icc_set_bw(msm_mdss->mdp_path[i], 0, 1);
+		else
+			icc_set_bw(msm_mdss->mdp_path[i], 0, 0);
+	}
 
 	if (msm_mdss->reg_bus_path)
 		icc_set_bw(msm_mdss->reg_bus_path, 0, 0);

---
base-commit: 5a66900afbd6b2a063eebad35294038a654de2b0
change-id: 20260627-rfc-sdm845-interconnect-collapse-workaround-ba1cf846ca3f

Best regards,
-- 
Sam Day <me@samcday.com>



