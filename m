Return-Path: <linux-arm-msm+bounces-97780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMX4Olplt2kMQwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:05:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F3293C84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 616E5301E493
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB76730E84B;
	Mon, 16 Mar 2026 02:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNPGIIEB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FCC30E82D;
	Mon, 16 Mar 2026 02:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773626566; cv=none; b=HcurgHUpX/4Qu7HbN20ahnsPoRikJShDcQirlTndHXl7WCW1RApBz/TkMmZG79EcGpG8T+kz2mgIn763C5hE0YGiWAZyRSOWHPwK4kHnw1LN11s5HtjffNs2k+iZFmEZF1vPWez5wpM3NMrrC0HMENQtSv9UCKas9rZzWJt96vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773626566; c=relaxed/simple;
	bh=CWVLZ9wJ1dzg/bo68zx3fJlJwkL0UfuuDOVP+esLTF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PQZd021jCZvoTkHq2aufU9az9azrNLdjTAmahSTjynysd4fCW1CVTIoH5VNX+tyacSTafq3+QMNSo2rwC3RBdMqD1mP+gepQoDTW3uIeGn1ZNy2eqFjvgFzEluBgNGqGG4KaSuOc3Ga8fPRL7LoZmrrFkEjZIAUdu7slHWQDADw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNPGIIEB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA84C4CEF7;
	Mon, 16 Mar 2026 02:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773626566;
	bh=CWVLZ9wJ1dzg/bo68zx3fJlJwkL0UfuuDOVP+esLTF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dNPGIIEBtLIIBCfgZGkkb+wjku5DyK6w/6SH+ouSxxfo7a68maqDQq3YFDUc+n/h4
	 zWgv9slMd0beGTrIm4xra8Ycbp3tdq1v16DxKwJCiZX26650Pd+3sH1y3o2TiQIitL
	 PcY/DkrSJIWJlwBBi7SJMlGSvSWna8rHgzIWIbMQMs0Le7iaf5Z8X67MC6+8lw3MpY
	 9CTy3Hegv6PlKz9HZ2RaOzeM0q+0D7ttHRGJwKQmMUZ0rJa8cOyTSFNxD2d1jWFDIl
	 Ug/RPa2sJ+R+xeq96gK9JyNnEDPqhXNDZvtSALmV+oSNfq+Ko7/34cc5RH5k4kDrpb
	 BxGa0hqSk2K1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Jack Pham <jack.pham@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Fix SVID=DP && unconnected edge case
Date: Sun, 15 Mar 2026 21:02:30 -0500
Message-ID: <177362655076.7429.3868048981197120360.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306-topic-pgaltmode_fixup-v1-1-ec154b2d8e89@oss.qualcomm.com>
References: <20260306-topic-pgaltmode_fixup-v1-1-ec154b2d8e89@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97780-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D6F3293C84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 06 Mar 2026 12:20:14 +0100, Konrad Dybcio wrote:
> The commit referenced in Fixes started evaluating the value of
> alt_port->mux_ctrl before checking the active SVID. This led to
> drm_aux_hpd_bridge_notify() no longer being called for the 'DP unplug'
> case.
> 
> Perhaps somewhat interestingly, the firmware sends a notification with
> SVID=DP, mux_ctrl=MUX_CTRL_STATE_NO_CONN and pin_assignment=0 on
> unplug. 'pin_assignment' was previously interpreted as a bitfield
> excerpt from the second byte of the DP pg_altmode payload (and stored
> as an u8).
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pmic_glink_altmode: Fix SVID=DP && unconnected edge case
      commit: d487085006109e5981e059476818243759d2e925

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

