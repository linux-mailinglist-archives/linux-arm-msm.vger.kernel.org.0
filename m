Return-Path: <linux-arm-msm+bounces-104701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFmRHotI72n+/gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:29:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCBF471B7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F4363065A60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509733B7B91;
	Mon, 27 Apr 2026 11:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="BvLZvC18"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C383B7763
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289131; cv=none; b=Pp/7feydwPkNnlm1UL8TWURyMDEZhaw3lJCer5MqOBqdCwDRSz4loDGXo2Ut+w+dUXyVU788p/kkBRE6Tf1TRNOsuy6KWBF+R0+dlBCb03A5jTABGfdIkayymCNW6Q+xtVfxoKJLbkn1RUqCTRN+NjPcJlBM+p4a2Tt6exAhbM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289131; c=relaxed/simple;
	bh=36ylXDXSIJmKrupKE39SKH2uABtoGcwA1RY3pukZQYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bUHSlx4mfONPRnJQQ0tjOFcJbh77vDhAEnmM0gD/OZ5OqaHLRK/42tmlRmULGNtcyQ+/UxQuJBXUL8FG/pWtYN+r7CwAZVNCvLowkVk3fGEgpIyWvr1KHLk6nNW628lqe8tIe9UMEkI4il6LW+Ayf6V3xsWayU1Gnk8+EAQ2gOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=BvLZvC18; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d73352cf2so8500254f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 04:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1777289128; x=1777893928; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NQu+gLeRF62Qtcp0mVuCqBaFzWftxOyfVqPR71FypOY=;
        b=BvLZvC18CYxRMec2L3AL8UwJUApTHn1BT74V0uB8GpPZTCTtNVm5dmMUPWj5bqDKc7
         lk7aWzINXP7qqQfaPo4umaToT/1WMr1ZOlTRTnqO9FLm4ICyPtgXOrzJKk3ycih+crqg
         1e9acxYVhtq/6DY1LG0I8HH5V6caNjcmetlbwUb+YC55qQ3Qd+YAORxpK5DLCOUOAFvE
         3LrIrpMonEvinbwV+sjwtEn2xO53aaUpeRoBFZ+okFs+jjVxFBU7I0b/spyNqnhQy1lK
         O89zuEeh4D25GtVE63uIM6KXEa+fL+McoEsr8glHiYjxMLu/Ach+P+Sl0Aju0EyAamr7
         1THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777289128; x=1777893928;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQu+gLeRF62Qtcp0mVuCqBaFzWftxOyfVqPR71FypOY=;
        b=Y/fBFqgMAr1w+Uo8Ilx0YTgSZFgTFJbQyXRtGe2+XvEZZW3dQDbTvKWhVtTootL3cH
         JQqTPWQUcFPi5b3zacfnwYVZ0MA1zzIHamEyghv7lktjlTkARdS3vsIGmXVxwzFLFtCy
         Z4Cyu5UE9EZ65ZYW6cOjD9JNV7vYjAUBS7ubgfWPZXhqxAZ9cs7z0yhghCg6hnQB/nDR
         xA4cWZENc7EfPrsZObqLE/CZvHlHJ/24n/RVVIr7znSCBXB67yUG2ozLKVa2p9WohLb1
         OQ2BfuESeVHUpW8UrSXYntAx0XP2+QD0y06Ghsx5R2gSLfK5Gq6IFjDu9lSrjerapC/u
         1z8g==
X-Gm-Message-State: AOJu0YwaFLYTuZBGxW3M/bNJhToqDHDjMvMVj/xlM4Ga81goNcLkZfoM
	nDLJWZU6E0CWi9pr8rgm4dTqzPtin5uEy6UM/qNj85tCzy40zJVUC4Kq8WXGqGRB2/U=
X-Gm-Gg: AeBDieuiiXn4jXdvyHBbLS6gO10JxdFoVXQDtDEPpcQY8J6r8m1D12vjOXb9D/cA+xC
	4h6kwclsX2gMHIjfJ5Ufz37FXLYAcq2Y38aEpiMv2uglKikCNXWSUErOVe+7CuFQk1w8zF/v1/n
	Xd/qJh+0CN74lCbA7L2xmqfsTKFlhANeA8xIATW6HujHKzFjF1QlkYcotD+bAHG+pnatbXebyw9
	mZacFzfiUBZhSLsEN+YwVfQChkg/dxSNQeS/D5RJmwKppgWHz//b0537xvWtLG2fV4ZHpR1XyQx
	vAiK9u6mgxadoMvDoErTM+kFkazZ7QbPkwGzdgwY9eHPn0jBPavEycLEQ4RgGPJl8CJtmjBNLn0
	DgJcDzGS3nOCYISseblU6HlNNdx1J+JX8rTCHaKwRrQvJtSYyyjWwUS0wNXv3eNXOPhy3wuwsvT
	gqC3rS1tbCl/dRAcgw3tgQtSLmAldiNrTFWBKzJ7IS289u+p8wRsp/huY5sZsJ09QIeKT9iSkmD
	n23CZSW5nkVIijlHPgkcWeZv7OvedIqBnyvdlIj
X-Received: by 2002:a05:6000:2212:b0:43d:68dc:9ca6 with SMTP id ffacd0b85a97d-43fe3dc7b4bmr63708040f8f.18.1777289127740;
        Mon, 27 Apr 2026 04:25:27 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a7b4sm74459748f8f.22.2026.04.27.04.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:25:27 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 27 Apr 2026 12:24:51 +0100
Subject: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
X-B4-Tracking: v=1; b=H4sIAIJH72kC/4WNQQ6DIBBFr2JYdxpAMNpV79G4UBgqTRTCoGljv
 HvVHqDLl7z//soIk0dit2JlCRdPPkw7yEvBzNBNTwRvd2aSy4orWQKNtdYcyA5GAc0xhpSh1HX
 vZKUMV8j2aUzo/PvMPtof09y/0OSjdRiDpxzS5/xdxOH9uVgECGhKZ2vhsNO2ufvRQkZzNWFk7
 bZtX6f4i1rMAAAA
X-Change-ID: 20260423-sm8550-sdhc4-support-358bf264c04e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ram Boukobza <ram@imd-tec.com>, 
 Tendai Makumire <tendai.makumire@imd-tec.com>, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: CBCBF471B7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104701-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.134.242.224:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aa00000:email,msgid.link:url]

Add the SDC4 SDHCI controller node for the SM8550 SoC.

SMMU stream ID 0x80 was sourced from the UEFI bootloader IORT tables,
as SDCC stream IDs are not documented in the register reference manual.
Unlike SDC2, the data path is routed via aggre1_noc, matching
MASTER_SDCC_4 in drivers/interconnect/qcom/sm8550.c.

The SDHCI capabilities register on this SoC advertises SDR104
and SDR50 but these UHS-I modes are broken on SDHC4.
Mask them via sdhci-caps-mask, this keeps the bus in HS mode,
which initialises reliably.

Tested on the IMDT QCS8550 SBC. This board is not currently
supported in-tree.

Co-developed-by: Tendai Makumire <tendai.makumire@imd-tec.com>
Signed-off-by: Tendai Makumire <tendai.makumire@imd-tec.com>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
Changes in v2:
- Drop qcom,dll-config and qcom,ddr-config; these properties are not
  valid for this SDC instance (Konrad Dybcio)
- Reduce the OPP table to a single 75 MHz / low_svs entry matching the
  SDCC4 operating point on this SoC (Konrad Dybcio)
- Forbid SDR104/SDR50 via sdhci-caps-mask, matching the previously
  existing sdhc_2 workaround in the same file.
  The SDHCI capabilities register on this SoC advertises SDR50/SDR104
  modes that are broken on sdhc_4; without masking them the MMC
  core selects SDR50 and fails DLL tuning with
  -ETIMEDOUT during SDIO card initialisation.
- Rework the commit message to reflect the above understanding and
  drop the "root cause not yet determined" note
- Drop self Tested-by tag (Konrad Dybcio)
- Link to v1: https://patch.msgid.link/20260423-sm8550-sdhc4-support-v1-1-93fd81fea5d9@imd-tec.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..07161a873b2d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3280,6 +3280,46 @@ opp-202000000 {
 			};
 		};
 
+		sdhc_4: mmc@8844000 {
+			compatible = "qcom,sm8550-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0 0x08844000 0 0x1000>;
+
+			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC4_AHB_CLK>,
+				 <&gcc GCC_SDCC4_APPS_CLK>,
+				 <&bi_tcxo_div2>;
+			clock-names = "iface", "core", "xo";
+			iommus = <&apps_smmu 0x80 0>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc4_opp_table>;
+
+			interconnects = <&aggre1_noc MASTER_SDCC_4 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_4 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr", "cpu-sdhc";
+			bus-width = <4>;
+			max-sd-hs-hz = <37500000>;
+			dma-coherent;
+
+			/* Forbid SDR104/SDR50 broken hw! */
+			sdhci-caps-mask = <0x3 0>;
+
+			status = "disabled";
+
+			sdhc4_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+			};
+		};
+
 		iris: video-codec@aa00000 {
 			compatible = "qcom,sm8550-iris";
 

---
base-commit: 4f5b4b748ac75683d61c304ee3ee0db235e8f312
change-id: 20260423-sm8550-sdhc4-support-358bf264c04e

Best regards,
--  
William Bright <william.bright@imd-tec.com>


