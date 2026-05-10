Return-Path: <linux-arm-msm+bounces-106818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uINJL5l7AGrJJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:35:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E9503F6C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEE553048F15
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 12:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F399D38228B;
	Sun, 10 May 2026 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuE7mAu7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62E8367F22;
	Sun, 10 May 2026 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416322; cv=none; b=P0Dpi5t0Mw8KcI0hC6uSp/t0lBaVPuw/22EcH3v8fVmIsdM+ekrScU6JF1SBtXVum3s0cguryRdU3yoX5evMVVhZ+ae1dt87ADk3JZF4X6sBFpOEmztrH3fvj5ajzzY4lep+B7dXJVYW25QnGJbks4/Ut7tZN0TpuskYI2Hvqf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416322; c=relaxed/simple;
	bh=vl/9MvkiblHAaPuDAQLv8KzOLc/tqBrxBmo1A4yiqGg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RlCe/CB9lSUwD4AqdxvhjzK0cK7iXzZYlyHoqDpv6EDRW/mkaOlTwmxXEBMZpFrHdTw6RK4guIQ7cAU0Lsp3IjJmYNXnQA5WVR9HsFH7DtTC8agEksdshfFZhxacQjCsckCItUZiqoGWty2vLNEA6vd4HQzGnAlQ//cxiMeGN4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EuE7mAu7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1F2C2BCB8;
	Sun, 10 May 2026 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416322;
	bh=vl/9MvkiblHAaPuDAQLv8KzOLc/tqBrxBmo1A4yiqGg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EuE7mAu7fP8Dnlp3qjz6t9jFXA1pltfOTzAMg5CqOv7HXZtT5upIrGId+YI+PWXDW
	 IK43iGeb/jMsxErpwgSt0+eGRoyz2AF3eM6sttmHp8x+bGmfY+bDwmMEi3MQYQecCO
	 RHN4pbiBV0q3wtRwluEJYFlm/9vNIrjtfZIjx1kc4VcBEt2V9LFlZSMoh2fVhQJOqH
	 Ld2fZvWjXTsB2C80Tda1Pd59Ir41h+qf1tmPnM82KsWsOeW7Prizl60lq5c7SX5Dd0
	 QZEl2okN//1l9UqYTAs00BWs+WfUDwGrFLZ6XkdJYLhx2EaS/n0R6fbuk/QXWrm+HO
	 hWPowEnANsCxQ==
From: Vinod Koul <vkoul@kernel.org>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev, 
 sean@poorly.run, marijn.suijten@somainline.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org, 
 konradybcio@kernel.org, mani@kernel.org, 
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com, 
 kishon@kernel.org, cros-qcom-dts-watchers@chromium.org, 
 Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, quic_vproddut@quicinc.com
In-Reply-To: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
References: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
Subject: Re: (subset) [PATCH v4 0/2] Add edp reference clock for lemans
Message-Id: <177841631271.434434.15769354853011852826.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:01:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: 5B7E9503F6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106818-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,quicinc.com,HansenPartnership.com,oracle.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1d87000:email]
X-Rspamd-Action: no action


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

[1/2] dt-bindings: phy: qcom-edp: Add reference clock for sa8775p eDP PHY
      commit: 0cc64561b03d755bba54cbd0cf05e9210ab40a13

Best regards,
-- 
~Vinod



