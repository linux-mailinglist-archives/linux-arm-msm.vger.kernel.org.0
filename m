Return-Path: <linux-arm-msm+bounces-103263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOhyCyBe32m5SAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:45:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B31D9402C75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E6E930E723B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DAF33B6DB;
	Wed, 15 Apr 2026 09:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NIX54GiQ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="WR/JgmL6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899FD33D6FD;
	Wed, 15 Apr 2026 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246161; cv=none; b=feu2IOiaXjCMXm290qV1AhNF07jLdiYaDorqFFfvrlYufQVS/mIWaSO+rYVCYfI9HSECJXBslVA+JoA5EVVCcS1wLz0MhLOk0Bu5GItXiQDuvfttbkV7tbytwkfvf4W0B60vnclQ9UsUgIzuIdkQ5dMbmT1qQEvy7vZTKfFlDkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246161; c=relaxed/simple;
	bh=bY/S4hu6X9QJewoEOT4tXALWwNKym1hBsseZvVMfhaA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ufqex8BvPcsbK8zDVhQVCP3cJYK+ROaX1UE8ZD9DLu711PF4L+XLXs0lPu+ZkjJqvR7MkheVsOSh1aOo8N9pyxTIP4FaUARt0w+EZJCIGrysN7h17aE0Mi5kPJt2/5ChWp5PCYzYH9zh5Lnz8NqP1TPyfTVwUs5XRPZupExtvZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NIX54GiQ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=WR/JgmL6; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1776246024; bh=rPQTV++r/ttt16dk20cYZPD
	5nj+WDYeqVAMFbghOh+k=; b=NIX54GiQ4GfPglpD+3w+3nh2bMtUU1Ih5V4IHjkD+1fY2vzTIy
	W2sfrJWkpK6LCyHAoS9ie9nyeLUaCQmesIJVjrHkQo7jGFhV8EEM27GFOIdWiGa6bAaNabZrhmr
	U6z5rAByM/mIM/Z+9x4LohT7oRIJMKtKGCUM/NgDR2gFJZC+jw3viYrM6fpa5NXCkaeTb+UprFY
	J4Zzj+eXTn+w4pnIqnXYVc8wUhLw9S3Zjlj0TLGcdvzI4bpjpEsctZ9QWif2igbVk51u9E9HjLi
	Uiphiyp5Eu0gspGWd8gJu8RbNAiGbL+mGOtqaigM/6dbMq6x44VDRD5jHUcPAJs6/SQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1776246024; bh=rPQTV++r/ttt16dk20cYZPD
	5nj+WDYeqVAMFbghOh+k=; b=WR/JgmL6DiQe71QhoAIcSZYcCvRPJm4bhQEP8k7s5G2rJ9WThC
	HfusK8QXR1KMBVuLNNryjWToL0/e4UztujAw==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH 0/4] arm64: dts: qcom: sdm630/660 FastRPC fixes
Date: Wed, 15 Apr 2026 12:40:22 +0300
Message-Id: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAZd32kC/yWNQQrCMBBFr1Jm7cA0thG8iriIk6mO0DZmUhFK7
 26qmw/vL95bwSSrGJybFbK81XSeKrSHBvgRprugxsrgyHnq2h5fPI9ocfSekKMlDPsMwUpOjLE
 YDvrBSBxO/uio6wNUV8pS71/ncv2zLbencNnlsG1fy/7SvYkAAAA=
X-Change-ID: 20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-d0ca7632045a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776246023; l=1055;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=bY/S4hu6X9QJewoEOT4tXALWwNKym1hBsseZvVMfhaA=;
 b=RFr81dRlKdSe42H3yBpDQj4fEZf2cXqOHf/X26M+kTJKZ0uKqzzu9QG6OgROxs9newDZoBGid
 3I+9FDp8EK5BlF0G1HnoTS4Gs0+H7RpQqwx1auATYDRwBDtzrSdJOGm
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103263-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B31D9402C75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series introduces fixes that make FastRPC on SDM660 work properly.
Currently only the calculator_example test passes on both ADSP and 
CDSP [1].
Also assign adsp_mem region to the ADSP's FastRPC node.

[1]: https://github.com/qualcomm/fastrpc/issues/269#issuecomment-4232125297

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Nickolay Goppen (4):
      arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: describe adsp_mem region properly
      arm64: dts: qcom: sdm630: assign adsp_mem region to ADSP FastRPC node

 arch/arm64/boot/dts/qcom/sdm630.dtsi | 20 +++++++++++---------
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 36 ++++++++++++++++++------------------
 2 files changed, 29 insertions(+), 27 deletions(-)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-d0ca7632045a

Best regards,
--  
Nickolay Goppen <setotau@mainlining.org>


