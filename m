Return-Path: <linux-arm-msm+bounces-113193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3vE1MPYKMGp/MQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:23:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA07687173
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:23:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AKPnCOjr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113193-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113193-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 974213019037
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11BB3FC5C3;
	Mon, 15 Jun 2026 14:22:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6013FDBE9;
	Mon, 15 Jun 2026 14:22:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533341; cv=none; b=GhCihV61WAiCY3LVj/S4XblVzV23YdlfevTvRRfobIFeZsYnzP9MJPw8VHuNwfQh7J5/0vQvQNRSUn8lWihIKDsh7y5QGQCduQPpKcRY6bhiJzLbFb6VRpv/RFhUiYCGf+t1tknHFqMAMbYUQBwf3+CktU9fnAvKFyJ3Azql4hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533341; c=relaxed/simple;
	bh=DMvDV0PdI+XOWrp4wndGFxByVnN+mTziqwNKg5Pq7vM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RmUAB8BvEZTXbGU/iAiRUXqQ7uOY1kyzAY9SdeCZgOJsmjPFUhWR0RDE3X2gIR0jb8IA8Mubz95d82NBjT1bAczh2LRfUrYb8LhN2Gi/3d2qsWTvhy1Mi8/afCn2C82t+UqvRKQB8R6q149H0GWenKY0f7p2NlotnTU/hfBXv5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKPnCOjr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA25A1F000E9;
	Mon, 15 Jun 2026 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781533336;
	bh=GJJENi7/AfA5TPgHZBr2kb/pQbvdLSP6Qdm41nCKAr0=;
	h=From:Subject:Date:To:Cc;
	b=AKPnCOjrsXDTecAgyK/Br/g7HnPNm/ZtHAKMdB5eYXc8FQtiYud6jMDQyXLsh0YlW
	 xZYtdG2OOKJz8he0gjFOn+KZCiVdV4Q/tqdfsGefd5UxT16pHOZEw+/9igFkCQnG5k
	 03pncVNhJxTioxtBdLsjtYVZr/fIKZ24EVf/oSrzM4Iq+0KmAwa3PVSVt49bPw9k1f
	 FzyCyuX5NLMfdzeSVzdcWAziFQ+YOdETQEvz1hHu0QB71xLA4IjyelwvSQ5FdFlV8o
	 kWkve00V9DuS0yUbKGczeftTbOM47Wg/LZoDrJz+57rlvrK/nrGl/1ARYaxJH0Xk97
	 BzvN8NwBKgNKA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/4] Describe display voltage regulators on SC8180X devices
Date: Mon, 15 Jun 2026 16:22:03 +0200
Message-Id: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrA0ksVrpVUSkZkY7XZiQ8acg3
 r1Rl9/ivR2EIpPAK9sh0srCfkoweQbu855GUozJYLWtdGVKNfvATtWm1h2yhC74jaJC88ChKC2
 6/gmpDZEG/l3fpr0tS/8lN58zOI4/YQtjy3kAAAA=
X-Change-ID: 20260615-topic-8180_disp_power-d14df352dcb7
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781533332; l=1140;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=DMvDV0PdI+XOWrp4wndGFxByVnN+mTziqwNKg5Pq7vM=;
 b=oz6/GP/+d0UHVPR+WfYWIuzyfjhFMsOCb/+n9UisM6kRrfNze0r4d7gIyC0yTW6tJDjql2QCJ
 QNmwcjRFVzKCGwAHKPyiQcITaLYhua2OYMj8VBgdQh0NvXwB+fgz18Y
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113193-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FA07687173

Let Linux control these supplies to both ensure a known state and allow
for some power savings.

This series is compile-tested only, but verified against schematics.

Resolves the following kind of DT checker warnings:

sc8180x-lenovo-flex-5g.dtb: panel (edp-panel): 'power-supply' is a required property

Making the SC8180X platform warning-free.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (4):
      arm64: dts: qcom: sc8180x-primus: Rename regulator nodes
      arm64: dts: qcom: sc8180x-primus: Describe the display power net
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: Rename regulator nodes
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: Describe the display power net

 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 57 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        | 56 +++++++++++++++++++--
 2 files changed, 103 insertions(+), 10 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260615-topic-8180_disp_power-d14df352dcb7

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


