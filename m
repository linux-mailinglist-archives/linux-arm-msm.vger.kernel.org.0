Return-Path: <linux-arm-msm+bounces-109458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE6OMlQQEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:26:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F305BCAC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C2793031C27
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7819A37BE8C;
	Sat, 23 May 2026 02:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3kSZj3u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B3C330B14;
	Sat, 23 May 2026 02:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502838; cv=none; b=CpbVfIOCegpb340XaX7y/zKwht5z+jfgrhb/ibQ7iBYh7EaRrcA1Ra2f6IafRMcSafvmV1aoN15+KKx1Ll5Tyzls8mBQfGnIFwkiRUQZUs96rqHhdnzNZs5D+Ie0iee//uPZhj6G1Nogt3+TfxIyI9iSTJNU9M3xITEP1tFTqi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502838; c=relaxed/simple;
	bh=UmQYm34vYP2ENdkwyZNxGga4qD0x0KcDAm1qVllzKHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CMTsBh58gtc/DWM9Sl0hFowDo7AwDgu5+Oac7Cfi8SLzrxqhXoNEbxufANsiCZaIvgvUkg21Qtvdne8YV69Ny+UtNvimiCOtQu46iTTstB+qDIzjC17FUKk3OzdvCxJ1zzxp5/gFM1ZS/jUQK0FAiNZJWoy0DUTzwmORTbDm5kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3kSZj3u; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF8B1F00ACF;
	Sat, 23 May 2026 02:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502836;
	bh=fBqQY9ZHL/9cRLn8Occ+Ug3mEK4c+qwKMVy6BmevSGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S3kSZj3u8L9wzn3G0IySJ/qib8kxdjnTrF5+H9P2Q/MLQmpUIAQLBfmZMi/wX6sr7
	 Pe+xbSNDmhnFtf5FODb38MDAfPysadCA/pIxypN2s4DPeTqhkxX8+yzrjLyraz6Ers
	 0OXBcqilsc0/RrfpbKbvb1FLBU5BKOPg7GmHj1zLgkHhrnzRXi5mmynSRXZhTltx74
	 KlwKmksUHzwDrSR4I+fKg9gYJTHYBrYpLUc1z+3+SSWtCaioSAZCsED5dMANX2lGtV
	 lTFMgXzx6skzbFFILszhlSTAhgYtD2JVxO8mAH0yzkF3FHmGOg3nIfvWjM62gBG7J7
	 ZzuboHbBnY1jQ==
From: Bjorn Andersson <andersson@kernel.org>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_mahap@quicinc.com,
	konradybcio@kernel.org,
	mani@kernel.org,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	cros-qcom-dts-watchers@chromium.org,
	Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	quic_vproddut@quicinc.com
Subject: Re: (subset) [PATCH v4 0/2] Add edp reference clock for lemans
Date: Fri, 22 May 2026 21:20:02 -0500
Message-ID: <177950280338.1097700.6276233449765894719.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
References: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109458-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,quicinc.com,HansenPartnership.com,oracle.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[30];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C9F305BCAC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 28 Jan 2026 17:18:48 +0530, Ritesh Kumar wrote:
> On lemans chipset, edp reference clock is being voted by ufs mem phy
> (ufs_mem_phy: phy@1d87000). But after commit 77d2fa54a945
> ("scsi: ufs: qcom : Refactor phy_power_on/off calls") edp reference
> clock is getting turned off, leading to below phy poweron failure on
> lemans edp phy.
> 
> [   19.830220] phy phy-aec2a00.phy.10: phy poweron failed --> -110
> [   19.842112] mdss_0_disp_cc_mdss_dptx0_link_clk status stuck at 'off'
> [   19.842131] WARNING: CPU: 2 PID: 371 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x174/0x18c
> [   19.984356] Hardware name: Qualcomm QCS9100 Ride (DT)
> [   19.989548] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   19.996697] pc : clk_branch_toggle+0x174/0x18c
> [   20.001267] lr : clk_branch_toggle+0x174/0x18c
> [   20.005833] sp : ffff8000863ebbc0
> [   20.009251] x29: ffff8000863ebbd0 x28: 0000000000000000 x27: 0000000000000000
> [   20.016579] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000001
> [   20.023915] x23: ffff0000c53de980 x22: 0000000000000001 x21: ffffb4b57fd8d710
> [   20.031245] x20: ffffb4b5bb238b88 x19: 0000000000000000 x18: ffffffffffff7198
> [   20.038584] x17: 0000000000000014 x16: ffffb4b5bb1e2330 x15: 0000000000000048
> [   20.045926] x14: 0000000000000000 x13: ffffb4b5bd386a48 x12: 0000000000000dfb
> [   20.053263] x11: 00000000000004a9 x10: ffffb4b5bd3e5a20 x9 : ffffb4b5bd386a48
> [   20.060600] x8 : 00000000ffffefff x7 : ffffb4b5bd3dea48 x6 : 00000000000004a9
> [   20.067934] x5 : ffff000eb7d38408 x4 : 40000000fffff4a9 x3 : ffff4b58fb2b7000
> [   20.075269] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000ec4fc3480
> [   20.082601] Call trace:
> [   20.085127]  clk_branch_toggle+0x174/0x18c (P)
> [   20.089705]  clk_branch2_enable+0x1c/0x28
> [   20.093829]  clk_core_enable+0x6c/0xac
> [   20.097687]  clk_enable+0x2c/0x4c
> [   20.101104]  clk_bulk_enable+0x4c/0xd8
> [   20.104964]  msm_dp_ctrl_enable_mainlink_clocks+0x184/0x24c [msm]
> [   20.111294]  msm_dp_ctrl_on_link+0xb0/0x400 [msm]
> [   20.116178]  msm_dp_display_process_hpd_high+0x110/0x190 [msm]
> [   20.122209]  msm_dp_hpd_plug_handle.isra.0+0xac/0x1c4 [msm]
> [   20.127983]  hpd_event_thread+0x320/0x5cc [msm]
> [   20.132680]  kthread+0x12c/0x204
> [   20.136011]  ret_from_fork+0x10/0x20
> [   20.139699] ---[ end trace 0000000000000000 ]---
> [   20.144489] Failed to enable clk 'ctrl_link': -16
> [   20.149340] [drm:msm_dp_ctrl_enable_mainlink_clocks [msm]] *ERROR* Unable to start link clocks. ret=-16
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: lemans: Add eDP ref clock for eDP PHYs
      commit: 4bd073e00fd79c0aead74ad64ade48c904221245

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

