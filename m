Return-Path: <linux-arm-msm+bounces-95329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBUnKMA4qGkTqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:50:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B37200B8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C554E309839E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EFC37419B;
	Wed,  4 Mar 2026 13:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FP9xCYbS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C203537FE;
	Wed,  4 Mar 2026 13:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632150; cv=none; b=L4efrATiWP13saJSDi39BUCU21lOv+DJ5dLKGvZBkr+ACZBFYFQOQfor0eAM7K1+uucI25FR0b5f/HAPbTEWk/q5pBfTOL0znl63/2M/bPb0G4ZAMszE8hOsqqGNz3QJ8VPYAKrpEeDorQakD75sd6I1by2hFC+x661UnSUI1y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632150; c=relaxed/simple;
	bh=JWDc2j0hV+E3FHXcOmEoLa067HRHjeDXFW7Z13ie7vM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LvWuHz0ejY7XrVIEIHQOqahcRbmNqRNQXDDpspXomzKCUf3gzC5aaxaAdFKV6e/JHAme9bBBEVK50IGqnPvyNTtYimYinscNxKPIQIGYhblpFqsf4Jw9BjI1mxVVlVRCCrIoQldMbDbza0izBp10LWahTV0uIXCBtmjPVrjcm1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FP9xCYbS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28ADC19423;
	Wed,  4 Mar 2026 13:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772632150;
	bh=JWDc2j0hV+E3FHXcOmEoLa067HRHjeDXFW7Z13ie7vM=;
	h=From:Subject:Date:To:Cc:From;
	b=FP9xCYbSUDg9BoqnpZ4jQf/uUSFBARng5biSelO0DXKghx+PBH21j0xgoIMtF4SBh
	 iTCueIH1XcrbYOznBdaNbAWjWfGEaVTPrN+kPJVqiO10m+8nbtLsEDdCiOiHeT6nQL
	 9eBhq0YbazTL1P/69ktdcv68AygufNnPMu9TPBIbFdBSSQ9bJCtwpzhMuSjNARun+v
	 lzPDZnL0e+hYgQyEztRCXi9oq5pNSeC9INzPp0mEHzfTPaHQVRGqBzhFPDR62y9vAA
	 zNjamHatwn4ondNY+nMDmSpZVWXOgpk0zyUQHUOwJPZIz9mzQTeg+3u4V9KPgnLH+9
	 cBqUBBbk4l34Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/5] DSI byte clock setting fixup
Date: Wed, 04 Mar 2026 14:48:26 +0100
Message-Id: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7TjAti74SEZVb7cVELQrx70nHY
 ZiJ4NEReuiLCA5v8nSaDFVZwHrMZkdGOjMILhSXXLJwWlqZ9jQtb8Bpo+eybFZL3coGO60Qcmo
 dZvFvhzGlD5zQkI5mAAAA
X-Change-ID: 20260303-topic-dsi_byte_fixup-a6b4735e8d6e
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772632145; l=1206;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=JWDc2j0hV+E3FHXcOmEoLa067HRHjeDXFW7Z13ie7vM=;
 b=gH0/LWZ3K3Fg0/L/EblKz7UVnPB5Zh6EyJs4dqVZX9aNJYBaVY1hHm3WyRSZVy8xehkP3CW5b
 1VrGy1NcK6fDeDsHGuFLX2EHWvG/CEJDDJ8wf8drP1xfWrF5AUj9ZuX
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 25B37200B8A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95329-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

There's a conflict between the byte and byte_intf_div2 clocks trying to
set_rate on their common parent. The latter should follow the rate of
the former in one way or another anyway, so the fix here is to prevent
the latter from ratesetting the upstream PLL.

This series does just that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (5):
      clk: qcom: dispcc-glymur: Fix DSI byte clock rate setting
      clk: qcom: dispcc-kaanapali: Fix DSI byte clock rate setting
      clk: qcom: dispcc-milos: Fix DSI byte clock rate setting
      clk: qcom: dispcc-sm4450: Fix DSI byte clock rate setting
      clk: qcom: dispcc[01]-sa8775p: Fix DSI byte clock rate setting

 drivers/clk/qcom/dispcc-glymur.c    | 2 --
 drivers/clk/qcom/dispcc-kaanapali.c | 2 --
 drivers/clk/qcom/dispcc-milos.c     | 1 -
 drivers/clk/qcom/dispcc-sm4450.c    | 1 -
 drivers/clk/qcom/dispcc0-sa8775p.c  | 2 --
 drivers/clk/qcom/dispcc1-sa8775p.c  | 2 --
 6 files changed, 10 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260303-topic-dsi_byte_fixup-a6b4735e8d6e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


