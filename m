Return-Path: <linux-arm-msm+bounces-112438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wjyQASNUKWogVAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:10:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 754AD669195
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:10:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jWlP5gEi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112438-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112438-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34FAC30A2643
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4D9404BE2;
	Wed, 10 Jun 2026 12:04:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E053DDDCD;
	Wed, 10 Jun 2026 12:04:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093071; cv=none; b=EFSD6fDwLo/AZTXvaICw9GsJPvYNTOeVudbHdyfox1euFJMjpLhFFjWwz4nbY7x4aM+5hAJNM2AXNbKgZP+5IlHqwfBMV4eZt+1IO8msL0Kc7ls5RM0yCtzCF1RQYYjbTUcetGKq1+B4ZyOUcXyspTBoh2Cg0Kv1/Mn9VZlmVu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093071; c=relaxed/simple;
	bh=bOB0AGGYszRk8rdclHAm2uGM6gHRVDNyn12YRlDVLfU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RamnIsXfklDOeMZSCjAbOQFogGnLfSwUnFAzhUHlO6DCB8OA0D2QIWfSvpCqeHLuJIOJ+rNGyJfw367oclUf6RpcMkOw3GfjVpLOO1H2VgqHUcx6spmWfNbrLeBms8AFOEtwOefUuZB6kI6czHQvJb33VNx8xFXQfwVULHZ01GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWlP5gEi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE961F00893;
	Wed, 10 Jun 2026 12:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781093069;
	bh=S4ACn8G1qS/jxxSppQTORw0fclxZxMlqldRqBXSGWms=;
	h=From:Subject:Date:To:Cc;
	b=jWlP5gEi4x/Hph6kQmh+OQS//Qbt9cMqqiKUdamgTpTr53nisXQMpgp2wLuQQi8me
	 zJyl5nCjxl8SaePyo6NpxMrBNrxL8wQsBtQ4VeauHYc8CFdPN5aIzi3wsRTBxILwUb
	 F5MhdM2Jto7+7x+VgUdzqLijx85tJmzt0wOgrT0iZA/Zw/sEig/ryZYMDVYBTL/eNR
	 3QT290e/BJzKedY1i/cCFkTLj6mesTqcWgcbIZh+dR+XgpB0gBHAUZfIz7NudZF545
	 Gj2K1SZd3hU06wdLLP5CZ7eC8XikwlZF5+lL+XH4hStQ6TSEpFWPco+gKqLmiPPTgA
	 hUfREgsGO2/7Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/4] Fix up QUSB2 PHY description for MSM8996/SM61[12]5
Date: Wed, 10 Jun 2026 14:04:13 +0200
Message-Id: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrA0kAUOnVykiJpnW6ULTjIoi3
 t20Xb7F/wcIZSaBe3VAppWFp7HA1BWEoR9fpDgWg9XWaWe0mqfEQd0QXefM1nSfRbxNw676qBv
 rEQkjQclTpidvv/Wj/VsW/6Ywf39wnhehaurafAAAAA==
X-Change-ID: 20260610-topic-8996_61x5_qusb2phy-ad052b99e9de
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Iskren Chernev <me@iskren.info>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781093064; l=1144;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=bOB0AGGYszRk8rdclHAm2uGM6gHRVDNyn12YRlDVLfU=;
 b=E0PII49h2C/XxqCZEJsN1/iwnwdlzXHu/G6Au1rVCEZlwL5sjiHsYzRSk+H6rLRHlyT0DJZJD
 MEXTCWlIPU5AgLxj88cJKbPpe/44IGWUpeUGxamPCQOcm2k3lldzYVO
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:me@iskren.info,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112438-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 754AD669195

The MSM8996 QUSB2PHY was not being guaranteed a power source.
The SM6125's QUSB2PHY was believed to be idential as the 96 one. It
wasn't. This series tackles that, freeing us of some dt checker
errors about vdd-supply not found on MSM8996 boards.

Compile-tested only, but docs confirm my findings..

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (4):
      dt-bindings: phy: qcom,qusb2: Straighten out SM6125 and MSM8996
      phy: qcom-qusb2: Fix SM6115 init sequence
      arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
      arm64: dts: qcom: sm6125: Fix QUSB2 compatible

 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 31 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 10 +++++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |  3 ++-
 drivers/phy/qualcomm/phy-qcom-qusb2.c              |  4 +--
 4 files changed, 43 insertions(+), 5 deletions(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260610-topic-8996_61x5_qusb2phy-ad052b99e9de

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


