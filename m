Return-Path: <linux-arm-msm+bounces-111431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PMrIEZjNImp/dwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 15:22:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E156487F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 15:22:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=jkXJIE+i;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111431-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111431-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BBA4E300721F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 13:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B32D40E8E0;
	Fri,  5 Jun 2026 13:19:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA13C40E8D4;
	Fri,  5 Jun 2026 13:19:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665562; cv=none; b=fjVztfSmvAM6WT7VeL/t3FHoISm7VFvc0o7our/vj6uUcqQ8LlkoDbxfy0NTf8X3/4iUGTqb76GHt9mb1GDg1pLgq9KG61il3vt/BqGGvPg0RNYvQxiImTz+sXlmO5XCslRbh7RapnLwRmke5pAbtqBD418uAwO/2mq22IFzKhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665562; c=relaxed/simple;
	bh=J/BBiDOtg87dY6XX/rpTbFHNhKF1CVqcYk+STuw6bIo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CIR8A4Abjzhwz04Xqe/ZMHzqfj3rnA8bJh4IASELp2xFLfZghI9g9i8fj1wkjVAANZYuQbxEfgVY3iFtP/2rLTKAqsM3IA4ZyIgbHSy1liyyQeb3AxbNeWK33K8NCKJdcQ9k88xLPmmqtAX2qnDiLFBE5Srm4HUruPDRY+My3PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkXJIE+i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B5DAC2BCB4;
	Fri,  5 Jun 2026 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780665562;
	bh=J/BBiDOtg87dY6XX/rpTbFHNhKF1CVqcYk+STuw6bIo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jkXJIE+i2tU6A8RMnyOHBN+RjXXgWqZ+4yXYlz+RzSnqGga8c7ofs2Ke6kQechjpU
	 jQI54yH1X5NXCRMMT8ep776OzX5Q5pCu9nbLr64aFaKDvIf9LmacSh494n6OxXdNG8
	 ukLjfWWC8Ibb7jvzMFMNJJbhj8kauZ3ob5wKKfXtmAxMWk0uhRq0VIBsU2OLZEij3C
	 cpQ7kI36zuE7KUUIMdeJDxO0JuA3rpxpXV5kovA1EbHLHgSrcYINDOwgshk1eM5od9
	 WWs62ZUYLHHE/IgSVeoU1+hT14e2hxmKyp56nSLcM7xSWTt/40z3EojVeR/NAY+TWj
	 BHQLEJKd7b/lg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55497CD6E7C;
	Fri,  5 Jun 2026 13:19:22 +0000 (UTC)
From: David Wales via B4 Relay <devnull+daviewales.disroot.org@kernel.org>
Subject: [PATCH v4 0/2] Add initial device tree for Motorola Moto G (2014)
Date: Fri, 05 Jun 2026 23:19:10 +1000
Message-Id: <20260605-device-motorola-titan-mainline-v4-0-08a7be31f05c@disroot.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOzW7CMBAE4FdBPtfVep0ftyfeA3FwnTVsBXZlm
 wgU5d3rUCRa9ZDjSKNvZhKZElMW75tJJBo5cww1NC8b4Y42HEjyULNAwA4aaORQS47kOZaY4sn
 KwsUGebYcThxIet91xmtsO/SiIl+JPF/vA7v9T86Xj09yZVGXxpFzpW73B6Naeo8x1Gtjo5IgS
 RmlLaBxzmwHzinG8hrTQSxzIz7BFnAVxAq6/k1h37u+Afsf1L/BdhXUFTTeeYsGqB3gLzjP8zc
 GGszWggEAAA==
X-Change-ID: 20260404-device-motorola-titan-mainline-ff668f32562f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 David Wales <daviewales@disroot.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1857;
 i=daviewales@disroot.org; h=from:subject:message-id;
 bh=J/BBiDOtg87dY6XX/rpTbFHNhKF1CVqcYk+STuw6bIo=;
 b=owEBbQGS/pANAwAKAW1jV4FG9KFmAcsmYgBqIszXmtullhdX19O3o0UI3LZETYtj6yQqyAecw
 0GWZZfC9/aJATMEAAEKAB0WIQTXikd3yUPmOPWSLPJtY1eBRvShZgUCaiLM1wAKCRBtY1eBRvSh
 ZuSqB/9sSAXxItl+Zc/4i1daKZqk4mpqVE8gdw5+ozK9UxosI684gM/XqmhsbjcuKxQN7dP+es0
 oXWheuLIlSbbd0gt2oKM4iPuXs8EiZHZd4LBBUmESMBUpjW1Ehjn/GQwVQSAbIP3D0xwVIVOjps
 75Nx4wXqqHmhhcb2fq4o3Mf5BVF7LnbSgPaVGwh7N9q0HrDZtruR+ovKgvf4yAywSChfI9QAV6M
 WvovgR5nkb7bgagTtZIkADj6AYqIUbdTKbtuM3G+ANkLG0EF8Bfmo8w6aCTSQ6uiNHmyRGM/b6T
 2Hpo9qWc3ME4mZPc+WA26IJSle3oqLpx5rJd2ndWZ9WHVfmh
X-Developer-Key: i=daviewales@disroot.org; a=openpgp;
 fpr=8F5BAFB15444A769DC3B61684022B817D275D037
X-Endpoint-Received: by B4 Relay for daviewales@disroot.org/default with
 auth_id=737
X-Original-From: David Wales <daviewales@disroot.org>
Reply-To: daviewales@disroot.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111431-lists,linux-arm-msm=lfdr.de,daviewales.disroot.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:daviewales@disroot.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[daviewales@disroot.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,disroot.org:mid,disroot.org:email,disroot.org:replyto,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42E156487F8

The Motorola Moto G (2014) is the second device in the Moto G series,
with codename motorola-titan.

This series documents the motorola-titan, and adds an initial device
tree.

These patches have been previously discussed and merged into the
downstream msm8226-mainline fork:
https://github.com/msm8226-mainline/linux/pull/18

---
Changes in v4:
- Remove reg_vddio_disp_default as it is not used.
- Link to v3: https://patch.msgid.link/20260505-device-motorola-titan-mainline-v3-0-8fcfa280e5d0@disroot.org

Changes in v3:
- Add missing trailers to commits
- Link to v2: https://patch.msgid.link/20260502-device-motorola-titan-mainline-v2-0-c791277c740a@disroot.org

Changes in v2:
- Remove active-high from reg_lcd_default.
- Add reg_vddio_disp_default, which I somehow missed in the last version.
  (Assuming this also shouldn't use active-high)
- Link to v1: https://patch.msgid.link/20260423-device-motorola-titan-mainline-v1-0-e1813a028cc8@disroot.org

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
David Wales (2):
      dt-bindings: arm: qcom: Add Motorola Moto G2 (2014)
      ARM: dts: qcom: Support Motorola Moto G2 (2014)

 Documentation/devicetree/bindings/arm/qcom.yaml   |   1 +
 arch/arm/boot/dts/qcom/Makefile                   |   1 +
 arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts | 350 ++++++++++++++++++++++
 3 files changed, 352 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260404-device-motorola-titan-mainline-ff668f32562f

Best regards,
--  
David Wales <daviewales@disroot.org>



