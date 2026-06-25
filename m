Return-Path: <linux-arm-msm+bounces-114520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VbvhBbYZPWoKxAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:06:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EB66C55F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:06:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b="SaCFSTE/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114520-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114520-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 302B3300B9E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28973DEFFB;
	Thu, 25 Jun 2026 12:06:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36833DDDAB;
	Thu, 25 Jun 2026 12:06:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389166; cv=none; b=CgHmNRnpP1XnyWH0Z5+rZ5a55w5bB5g2tO2WjzZ19qniE/UE31bTM9PYLWRsheJhXk37V4e9K8r6Dm8b8CtuuQQyUghgcglBrr5PlngOLA2icU6mbtQtlZPkIvPpGb12vLj6enYZMZzjtx1vpbD13N3tbUhuirY5uux2afPR1Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389166; c=relaxed/simple;
	bh=pFqF1zBpz41JDhEMnXn16r2LCAxlQkmMY5CWwrHwwns=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=bNNur3N4hMrGVrc2uw8nJXv4Z696W6pifHitrut9iSJk16kCDsAbmKfqshmDYiOD8g/k6nqb+r8KUXvjvpfEPUSRTImNWrugMNUtPoQ6GPIkavL7y0WrF4DxRVE0c5oYN9tQr2TVaYGE2tFQ8W5tr3qMuxw+p7cmS+Y363AMIl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=SaCFSTE/; arc=none smtp.client-ip=203.205.221.164
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782389155; bh=IiKH9NaHBh0KGOAJeC1Hhwv4hHpajOCLAH4jMC8dVg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SaCFSTE/9fjmlSHQBv4jZDxiidHrNS5FMld5PAT8fYYjDLFU+iTUj8s/c5daHN+PN
	 dHyF5MaitVIs0zw06C2aKlR5n9JUv9jpxHqlSaig362pUj3aYrD5fbSgNBjhJZkzh0
	 X9319MAhCwoug+DxxCAWELG3QiJrFXeDqqnuZ6W8=
Received: from 8qyomHQF3vPjMe ([163.125.234.54])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 1741C071; Thu, 25 Jun 2026 20:05:52 +0800
X-QQ-mid: xmsmtpt1782389152trhg6crms
Message-ID: <tencent_47473BB31C9142449F8C7C1BE69D9071510A@qq.com>
X-QQ-XMAILINFO: NJUALw8dtW3TXYlo8hX683m4XONrtBuG8hBTgHOsqZ+nVFqGx+moSfoZ+L5TBt
	 JwFYAcVgjeDnsDxNU6Ieed2miOGoR3gRyA48kngzco7/grKWgqhbsDDnCdkW7oewDqa9XuQ5SPcK
	 DghOv+AVPo+RE2EQlHgisfkxXR4IzK5a4j39QNjRBboIfhdv4z39N7vZvwZmMkzDY/LW60JdzqQZ
	 5xOXrsczokU1tohNjNOeiAthK68441uZie+ik9IOifHiMbTX7KwSVmWqoHvsRZrhPWHVPkkTYgum
	 MQsYmfSuILjaCaTcTyGg+3fTce7N9yGzl7dZeW7NRzR6hww8OQJUZzVvDq3KNphJ6GSbseggUeXp
	 JLTyxdRX2obbCnKgo/sJZSPHglwb6MST4sp2oE8eZ4I8G51JqFSEwa+Ul39gi1QWUqDDDJdSCB2v
	 U0vKvaihRcpg/FzAxPXQwmOrFfu4p0cIgINbyd+qXfhfL0Cvk/+ivarqDRXnLsiJXxLVpGYi5xba
	 pZ0hK2TaUR2dxHhZAV8OXosiwceMOMjNHf/CpecRbsGoZtSKFuMgmWdYISx0pL5JBlpjibhJX+j8
	 cbI+hmgQgB7KP7V7S5lkPhWxE3NCMmx6d0lNMa4XvS1P3OGDsSRcfTxD7rDSoE/lyzyAeOSOmsJQ
	 aHNkpkfGnupxJk8Phzrldd6m/WVaClacs+J+zeCnQfSF4DgzkRS+Y6npOuJdTrTlKujbJkSqLk4I
	 /O6elu2WN9FCdEPieTH8WDXAZrxj16fkGzUUm46mjg2Alf8cS+avVZthg3lasfYG2awJtf6G4tUl
	 60wJB90K1vtrKwgjOYCvBSWpMB6wJaHuU8IcRZnxIO/anZyR2/waNDFtAQhXP0Tkgal9eRxIHNrQ
	 eOI2mprK0+0Nz4uZjVvXWc6wpKk7NGUoDgGob2DpCUe3a/sBSZ6zbHjqN8WN4IJsrvwyNWq5Ugyn
	 jaTl30u80ZYjO68eHYBhj6bQglxSFeENtx+JClAu0IRWJWW1/gO79do+/BN+6qkAGjVxJ569Xt3F
	 VgCGsr/vxBbLlJPh6xt7e6iF+UYJZ8ixNmszBs0Gz+wGVMISN30xFNpKhEw7fdiAAX0aRAe0u2GH
	 hPXjlEL67vslUIvH9NBWF1ft5FgA==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Xin Xu <xxsemail@qq.com>
To: konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xu <xxsemail@qq.com>
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm8250: Add cam_mclk3_default pinctrl
Date: Thu, 25 Jun 2026 20:05:36 +0800
X-OQ-MSGID: <20260625120536.18470-1-xxsemail@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <tencent_D4AB219A942591742C3A6DA4DFB0EBA49505@qq.com>
References: <tencent_D4AB219A942591742C3A6DA4DFB0EBA49505@qq.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114520-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xxsemail@qq.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[xxsemail@qq.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,qq.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xxsemail@qq.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:dkim,qq.com:email,qq.com:mid,qq.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7EB66C55F9

Add a default pin configuration for CAM_MCLK3 (GPIO97), which is used
as a master clock for camera sensors on SM8250 boards.

Signed-off-by: Xin Xu <xxsemail@qq.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..05e765616112 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -5165,6 +5165,13 @@ mclk-pins {
 				};
 			};
 
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio97";
+				function = "cam_mclk";
+				drive-strength = <4>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				cci0_i2c0_default: cci0-i2c0-default-pins {
 					/* SDA, SCL */
-- 
2.53.0


