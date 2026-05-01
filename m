Return-Path: <linux-arm-msm+bounces-105560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFlGI1Yu9WknJQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 00:51:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9D04B0135
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 00:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6564C300846C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 22:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE95E37D10C;
	Fri,  1 May 2026 22:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJHhLW27"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970FD37C917;
	Fri,  1 May 2026 22:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777675856; cv=none; b=fYDIoArput/uF27bnl2qKt6CUOsCKYX81SVgGBJVjMc1VBn1A2uem4L18KUBZIagdgE1k/iNSoQqTEdf7xZ6115V3IH6HbWV7II0+hZ+FbE3CjdpSUTF2fHkD/1lYVVVl5lJc7dIUuIxAY71j6mHde+97ajrH/f7pFQA4heycVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777675856; c=relaxed/simple;
	bh=dPALcF1cGW3yRPLb5Psr4qawY7TyHT8ACn9Ct8gjlBg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hPzaNlQjvmZiPUDgDf4mrhnXyJ7l7I3WfcO24jmXQ21pDBbzNi7+6EGQJ68Frd+4zUSftg6ylgaClHuRhzVB9WDf6fh0BaYc+p9M5lRO/m3Yww8QNSnhKnIVnZLFWkcbBcHWq1CrRvOgvIyKgkZpzFwbzMEjpZNu6ORLb1zAa0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJHhLW27; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 404CDC2BCB4;
	Fri,  1 May 2026 22:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777675856;
	bh=dPALcF1cGW3yRPLb5Psr4qawY7TyHT8ACn9Ct8gjlBg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NJHhLW27P6om2GtTo/ag5EtgP56Fe91s36QvQnKY1/lIwdHgYMiKyelEyhklvlEfy
	 GwpjtgT0dkYQGZpUbK5q8s7TNWLulLVWr1HJ7Div/tuvVLqrwwVMgTdAcbMDjKaitd
	 GccyR6RwpfwBm/zGcsuO1mntOjMrFZ637RRsSSUHeiV9W0gT7hogiwZy/DRm0F2Rkv
	 /i5h9c0DYBCyBxZ1RUoTBFg6+mewwTdwAdB3Jxgf7zr6A9CYB+06y7ygxmZKQmj27X
	 Gjzcxjv7uY07LVeh2Zn4yRpbC2gGiOebeXQvL7MjcCtKXV/mnc+ldz7oWVufBBKE29
	 7cw5EFvSumRmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E45BCCFA13;
	Fri,  1 May 2026 22:50:56 +0000 (UTC)
From: David Wales via B4 Relay <devnull+daviewales.disroot.org@kernel.org>
Subject: [PATCH v2 0/2] Add initial device tree for Motorola Moto G (2014)
Date: Sat, 02 May 2026 08:50:16 +1000
Message-Id: <20260502-device-motorola-titan-mainline-v2-0-c791277c740a@disroot.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOwQ7CIBAFf6Xh7BqglRBP/ofpAenSrmnBADaap
 v8urd49TvIy8xaWMBImdq4WFnGmRMEXkIeK2cH4HoG6wkxyqXjDG+jKyCJMIYcYRgOZsvEwGfI
 jeQTnlNKuliclHSuSR0RHrz1wbb+cnrc72rxZt8VAqaje+4NZbLtfTNb/YrMADii0qA2X2lp96
 SjFEPIxxJ6167p+AOooW2XgAAAA
X-Change-ID: 20260404-device-motorola-titan-mainline-ff668f32562f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Wales <daviewales@disroot.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255;
 i=daviewales@disroot.org; h=from:subject:message-id;
 bh=dPALcF1cGW3yRPLb5Psr4qawY7TyHT8ACn9Ct8gjlBg=;
 b=owEBbQGS/pANAwAKAW1jV4FG9KFmAcsmYgBp9S5IyUOu9TX1vcC3o83yQ2v4nAVUccswWmy/f
 F8zO0iuPuSJATMEAAEKAB0WIQTXikd3yUPmOPWSLPJtY1eBRvShZgUCafUuSAAKCRBtY1eBRvSh
 Zr4PCACMPqBbPwt4ywRJ4lupv8XF6u7uE6/tngeJlhq/+J1vhUGTRV56N3q8j8REZw/9KEVZqB3
 MB515DnHxVW/0qiH+heG8B0WYNZna8gXYCj8rAa1CLG2kUqKCZL0fDhue3G+C0K36p3Mt8jYuzW
 5WPmMdf9mh2LjKIOsq1fJFZq+jGx3yPhhbJ2a69PU23nngS21mdpNOnuMA3xOlv83z+1JMpVbnJ
 xT+F5VQzlQoX3IOrgHykYs4Can4TuEt0xw7cLQqi8kfTik/cGYZ8XRR8hN9GpbXmd3xgjbqeufC
 bGvkwWfEoABxCPRQpGqywNpkep+ZULBX665JVhAIn+ekXhn3
X-Developer-Key: i=daviewales@disroot.org; a=openpgp;
 fpr=8F5BAFB15444A769DC3B61684022B817D275D037
X-Endpoint-Received: by B4 Relay for daviewales@disroot.org/default with
 auth_id=737
X-Original-From: David Wales <daviewales@disroot.org>
Reply-To: daviewales@disroot.org
X-Rspamd-Queue-Id: 8E9D04B0135
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105560-lists,linux-arm-msm=lfdr.de,daviewales.disroot.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[daviewales@disroot.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

The Motorola Moto G (2014) is the second device in the Moto G series,
with codename motorola-titan.

This series documents the motorola-titan, and adds an initial device
tree.

These patches have been previously discussed and merged into the
downstream msm8226-mainline fork:
https://github.com/msm8226-mainline/linux/pull/18

Signed-off-by: David Wales <daviewales@disroot.org>
---
Changes in v2:
- Remove active-high from reg_lcd_default.
- Add reg_vddio_disp_default, which I somehow missed in the last version.
  (Assuming this also shouldn't use active-high)
- Link to v1: https://patch.msgid.link/20260423-device-motorola-titan-mainline-v1-0-e1813a028cc8@disroot.org

---
David Wales (2):
      dt-bindings: arm: qcom: Add Motorola Moto G2 (2014)
      ARM: dts: qcom: Support Motorola Moto G2 (2014)

 Documentation/devicetree/bindings/arm/qcom.yaml   |   1 +
 arch/arm/boot/dts/qcom/Makefile                   |   1 +
 arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts | 357 ++++++++++++++++++++++
 3 files changed, 359 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260404-device-motorola-titan-mainline-ff668f32562f

Best regards,
--  
David Wales <daviewales@disroot.org>



