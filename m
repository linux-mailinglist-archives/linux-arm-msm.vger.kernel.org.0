Return-Path: <linux-arm-msm+bounces-100946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCqAI1Rjy2nCHAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:01:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF6736454A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EBF353022F42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 06:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551E5371D0A;
	Tue, 31 Mar 2026 06:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScSHgSp4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08902C11DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 06:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774936896; cv=none; b=FeW7shGeCARjEmCxeg8CyFKAVdFLSTIEtd9Wf5x9U30vCmvvxiaQkB+8IiZ255GXNVLJ5SPj0/14b3qEdSwm2bkwY0kSzz7wK5sa45xOpjFVXC/i+rLLDKP9g1SCCjEyIciTlHjD9XqSG2mZoOldmycshAOC+bYaLN6LW7WLx50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774936896; c=relaxed/simple;
	bh=8ae474NXZrrydHMsATLrUWRjmEgnPj/0dLRNWL+Kxq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MQBHhxEit6yW2HrsrYUJmQwJ7K/yDXaKEFtRnMD9HofUaffRWiADce7Au4MGUwFfppreO9M0ppoH81X0rtyu8G36JjMOFHzVTQ+5A5numjZcYPCpRHY0ihKKCrHUlvTJLWkWuV8Bo7zKI6Drj2UrHSdu9YmC8nQAetfpnV83j5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScSHgSp4; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d9923eec5so1664017a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 23:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774936893; x=1775541693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3coBers9c9QNUbHYcA2MMP7ZkcufEz9mkmk8HsvnaI=;
        b=ScSHgSp4mrdDUi2nIhGfEOXSSfkufjh8lm8uLKM5VxiB69DW6TvTl0k0n7BHOC6oU2
         XnkEq7eDALl4ZpgmfJXVYlX2YEsIrj4WlsmtD3puI704VY9HhvirJhSYNkHT9Wu2Iikb
         la2D8S902cxCq92BXuAKWWYyCFejoo1tdhvQX6oD4WXw14dznd5IuU4Lzqpe8X9J46Kw
         0W2pDY/JbgEk0kXYspsnoQsHFxoyp5WV6Ru+vv/w14P971TYMU5ugGcZpiWR/8UwVxrS
         YGxfkkejTTfrpBANpNy45GUThAiEGP6emI6jGcTOhDfuVc9fKCJhb9SLW2hX5AKMhg8N
         RObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774936893; x=1775541693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v3coBers9c9QNUbHYcA2MMP7ZkcufEz9mkmk8HsvnaI=;
        b=MxWNi4XOwCnJI7TSWCp9TJUcRh5L4w8gilEzBtOR+4ne7tyWpECfA7kLbqKXHEmheE
         mcAjxGeoqv2bm6U0Y6CURUTzEZFW5cNhksUwzHYqzcwDQQluLV44xVTC/UvT0hOxe5TX
         Ne3NYBgjI4B6oKNofFUGe4dHNila5NGqEvtGQPXO2Qrdls4GEyBXM2LdnLk9+xqrkhqz
         yAY9MQaHbyxLPslo4kIvC9zfSbPYAmQaucMdt/ZhWZrZorfyfFCCU04Jwme/p6ZZFuvg
         LQCQF5gVCLC+q+dNANtRC0BxSnghh7anXnWYv6oiKNMlmfhIEYXDnWqBTOFqr01UwAac
         rLeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOyfkXnrlkUosDsxrZ1smjPYjPXD+04OYUSUwu9QmzWWJpRQqFysiYMhNs9ZYMBstrBmDQIY8jWBCjlnSV@vger.kernel.org
X-Gm-Message-State: AOJu0YxD0lzKchgh/bQUjO4JeBl5qWJjFGbEPTDf/pqIBGg8cUxFq7zP
	XexNh1xcu17cxGnlQOAtVcYngUf6TxjNWj+nEWbNyad9gXOkWIK8URZXDfzFQg==
X-Gm-Gg: ATEYQzwXBMDDg2OSw6LhAshj9dTF7x2ymxJ9BQeXdmx2GtTkYQOcyu9JehpHcVOhHhf
	BJSwnpNNxG89EtUhlwKtGVD6BPjKMxVsWO/MWCLManSyt4yTSQcBsYXQ/pVMva6MCfvO+M+PNa5
	BDGc3gzifPFUTnK+dBV6b6Odh1XtCMAumoCoJx1q4a7GY15WkGllNNFkCRIIgm/L8ummM3Pl6Sp
	pctsDka03o+6EHswXR2VowNcSaRAO5UR06a3L0KYZaWuobAz+ihuXn+mOH4RDu++VGf1OV0lTEP
	j9Y3HOMFR6mIuUft/3YlZ6xVJyqS7RueBYN/treBwBXwy8zIqdVrNjgfRiv4zXpziiv9sTnV086
	jFKoCNwafqZbERxcF+cHRDW4UiHDuIOWHxWdRmc6ES2zCga+fUuRzv22ZQ6289k8Ugr7tObefyK
	KwB5zxt+BnkQwuEyHd1wiWctGzdX+vtGByNXalP1V1j/fSUOrvqVXNwVZLCQU=
X-Received: by 2002:a17:90b:4c:b0:354:a57c:65db with SMTP id 98e67ed59e1d1-35c300558aamr13147798a91.20.1774936893257;
        Mon, 30 Mar 2026 23:01:33 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe606dd2sm575343a91.3.2026.03.30.23.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:01:32 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v16 2/3] arm64: dts: qcom: talos/qcs615-ride: Fix inconsistent USB PHY node naming
Date: Tue, 31 Mar 2026 11:31:06 +0530
Message-Id: <20260331060107.501561-3-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331060107.501561-1-tessolveupstream@gmail.com>
References: <20260331060107.501561-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100946-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,a800000:email]
X-Rspamd-Queue-Id: 4EF6736454A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The USB PHY nodes has inconsistent labels as 'usb_1_hsphy'
and 'usb_hsphy_2' across talos.dtsi and qcs615-ride.dts.
This patch renames them to follow a consistent naming
scheme.

No functional changes, only label renaming.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 2 +-
 arch/arm64/boot/dts/qcom/talos.dtsi      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5064ca4f1158..9f6cc31f1fc7 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -634,7 +634,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_hsphy_2 {
+&usb_2_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
 	vdda-phy-dpdm-supply = <&vreg_l13a>;
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 9be1e523e9ce..32b7346f4548 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4447,7 +4447,7 @@ usb_1_hsphy: phy@88e2000 {
 			status = "disabled";
 		};
 
-		usb_hsphy_2: phy@88e3000 {
+		usb_2_hsphy: phy@88e3000 {
 			compatible = "qcom,qcs615-qusb2-phy";
 			reg = <0x0 0x088e3000 0x0 0x180>;
 
@@ -4608,7 +4608,7 @@ usb_2: usb@a800000 {
 
 			iommus = <&apps_smmu 0xe0 0x0>;
 
-			phys = <&usb_hsphy_2>;
+			phys = <&usb_2_hsphy>;
 			phy-names = "usb2-phy";
 
 			power-domains = <&gcc USB20_SEC_GDSC>;
-- 
2.34.1


