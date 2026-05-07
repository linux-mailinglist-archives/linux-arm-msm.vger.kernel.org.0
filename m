Return-Path: <linux-arm-msm+bounces-106297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENLBJBJR/GlOOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:45:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5D34E50AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC516309465B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8602375AC3;
	Thu,  7 May 2026 08:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBqjBGGO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E840B374170
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142833; cv=none; b=dHXpFlGA9iQafSs2B2rmfRmtxCuOvOUB6rJr54A0tMI6hDlTFTh/np5iUqEffH4ee77FVMwRMDAoP5FBqE20eUaNdgA2KpLKXLDxHjfmdA7xmOWQhv4Jf8xxK4vWUcL9qzU+FKZSYGO6JZ32U/fkCnrMR+7gPsMxQhkEPUnnLwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142833; c=relaxed/simple;
	bh=lEdP/gLqj9JlLEHbjI0fI3boaFBdOzlJrficJFhY4hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c6OLpAglsTBBDbyIBAKMsOp/UJ5JVTKc2fGPti0gzKeBWwuFC0n9TQg/vvt+UX6Yz5LCFsMOWM4WTIJzEneN4O72/16zZa7cDL7x7+g7WgJzu/BeOUC5bv6/C5w8BJuUzJRsAz36AmJp7IGsbZWId2xHmtODpzWXAUveZT3uHE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBqjBGGO; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79495b1aaa7so5048057b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142828; x=1778747628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zxu6jfb8KQTr4q0ip95qIz9W/TDOwx+LsiVMhFYa06k=;
        b=cBqjBGGO6W5rgXKaRMmJV26oGDFrVsbVIffDclAXGQKRzf/zQP+AZm1Xg6xbm6eb6N
         nGtDrhc3hlZSw3o8k3yspUaz8wLJ/RIEMmZo4JBgMVXyCqPZd0Jkk+twoCAej50EH/6G
         vLR8Ly262PRKAYJHgnVoy4La7kJ30XE9QnoVsuJw/Ihv+boEwfD51q+uNOrVw9Bcas2U
         qBG7F8ZIHStyTBECem7Qcqq4fv/RBj+7u2/NeMBIWBnNdpeOaRDzD4lfNN40ZGHu863u
         vgHpzHeeGncq+ZciTs8R3PoZVyLYreFyJrENZEPFUIRjP1zhusT1jzHGif7I+tQCxnCN
         vEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142828; x=1778747628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zxu6jfb8KQTr4q0ip95qIz9W/TDOwx+LsiVMhFYa06k=;
        b=suOTrTciE5JCqNZug786QTl+3sp2FQxu1SFzra1Ty//CGaH8KfxiI+ZaLrTOE8Tus2
         p9zpFccxeo6OA8Cn5EcnvWtJxhW8qu/dSAi4qobfTo0crm/ul/fKIBrNk/oug1a0LsY3
         wSCUEePK0FTjhiu3b0BIi8hTEiCwq4Nf93gFuvEyXv3rQmhowkCjqhrM5dgoW8u8wNsD
         adka7BH7/B039881PUbVmV5U6NwhnbE08bQoVc9S/G/y1vrpuhFuEQjgrg1y9MP9S+KQ
         TbnFZK1JI8J0QIzOKvaIKWY86VSdLsFbNsgv84elXXpEYAVQ+8QB3i/hcHfnrEveMwGI
         e2jQ==
X-Forwarded-Encrypted: i=1; AFNElJ968cCaOEpxd3qcmLxol8K/RnTl6IkI7jVyA4PCTStZbVHj9uElgNrcoVz/UwsTvQwEzOilUDbKlKQq5O9W@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/SUJMsQyr5FQ9rS//qg0+TDJ2EOjr6pekpsaqsLpcUtpzdet0
	zR3QQTPgA6EETAhQN03OxN+QHyYnKQzsze5ERM/KE2aDzh/biYknRKku
X-Gm-Gg: AeBDietbKrxUWdNrkjgiQVfFJyLsT2nd1/cxwb+NJxe4NC+vYj2IPAUAeU+SZxpJ+eG
	SVUWMvG+mdtbjlIh0pce13ZsuBZUDm9AJwhdk2uiuA45unvsKvkSABC/5jcKxykVW6FLUz2NcpG
	WBqw2Ef45ygSWNAJ7ZkmkBlSGkjUvFg5LSB7MsDrvSTY/BjDnGV/qiBKb1feuaLZ+L1p60q5iKD
	82B/7JNrW41L67CEZA3jEwqeL/0ouzl/Rz9w9cOnjXsCL6Av5eYulYYRdkmdY8j60Xx6ZntOPao
	DYjisrFG/5VXSnFc4ugLYWdWvSHUU6naECChamttr390Ntcl4E2EU5zZg1z/9cLU6hHHKCUdPbk
	iEgBDHe/gB6k/uLcNKzZiPCfWSmeX/QCcYuMonrIakY9SDRTAev58W5glwrOZPf0Y2YM1HN3xcT
	w53rYz1XKJ7+AcThF72LqK7ES0D2TZoLbiNN1w4azncZJI0x0=
X-Received: by 2002:a05:690c:5c0f:b0:7bd:9391:b5ca with SMTP id 00721157ae682-7bdf5e7c904mr68027307b3.30.1778142827969;
        Thu, 07 May 2026 01:33:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:33:46 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:17 +0300
Subject: [PATCH v5 2/8] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260507-msm8939-venus-rfc-v5-2-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 2E5D34E50AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106297-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,apitzsch.eu:email,1d00000:email]
X-Rspamd-Action: no action

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..71e22584a46b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,29 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>,
+				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec1_core";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0


