Return-Path: <linux-arm-msm+bounces-104366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCfHNIpS6mkhxgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 19:10:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DF03E4555B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 19:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AC8EB3038C50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 16:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53189383C8D;
	Thu, 23 Apr 2026 16:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="CL5aZxjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43453806C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 16:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776963047; cv=none; b=q5qc0MKDaRIfmBArkK7N4GHLPY1HoH//+KSiUpMzekPzOEHLgK/HvKCOyKPu4vmAUNhGeUgQw5Jt/2f39M8hYr3K9cuyEs4gS7mKnO6HVmoW8iVsy2U5JBKTC98T8nKFXq5F5QrSbCwf/cFCmD5JsRmq/4JsYOoxtiHgphZxDS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776963047; c=relaxed/simple;
	bh=rS4hUoC/4HYht4I0BMRV5/JcGv4WplCHyNyNQb8pSqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NhwHXY7WyyCu6uqweY0cM26on8ZpxbWoy8UXZN786ZlR7Yv/HMZmBgW7nZyYlkuyWqSqPZq++jdkkxyxiHBGIpalUSYYtIQiLJAm1/CxiUCL084IQAhNNInGwb2vIySQbmQmxYFBlcWxF/niFbyrVtNeVIFs3+40o74JkiEtvRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=CL5aZxjB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d734223e4so4762789f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1776963044; x=1777567844; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2EeSdYfWoTiuD63VKetL3V9sK1DuMijL8TRltuUAE/E=;
        b=CL5aZxjBzuPYhKSXsiBispFbtuzQHLWcYj07yGKOJ2IH0ZeO3JAVf2wKDCOrtH1oQy
         +Oc1tX+7qWUvnrEBsKCkGDfhLMCPOL4Tq5Sl3HVIBEs3VODLBaSquDsASvKNFr0TUNzf
         N+KcXf1yrWNXYw6NcDAI2bKLZIj+G9EuSBMgihO4Ea4CkPa30FS/XTYRi8/9yQT0en1M
         4v/ukH3DL1ILWSOC9lujRYjcFxNuENvvoYi2b0YLs3Ayz/dbIKYH9j3k4qc0R9T4d4j0
         RR6c+AnpzGkVWU8f/+kv+0NIx32oZcYQLfh5aBtthYAz/0qfXbejP6Gjz1JKnBWOHXH9
         9oKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776963044; x=1777567844;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EeSdYfWoTiuD63VKetL3V9sK1DuMijL8TRltuUAE/E=;
        b=dUnC3dUOPh14sEtK8M/FL4azsuhYG094slHLaGB0NUC169oFtqgqWsHlWbOwhbqD/x
         xfWe7yQOjIrfrUtumgo36fp3J3owyexXsC2LIV2oLBvBtT/VEzs8wJDP1X0Dof1UZOnv
         WDQvDlWvGo+B7uPtzxohV+P8dXQkNsIrsyTH3tcit1m1JA63pLOiQ4keWO9PW37fu1VC
         laeX7WvsuiqVYDe9+EM1B/HSZRiDVVjHxUaLxkM2XK2TuU7/nT8Ggi+R9tjyMRI5fzRO
         umWUOq/vDlrDAQ5Kx/bGcMsHLQYWYVrXxZJzS/jlHfaoq9cteuBJTzdZkkmRkYOZXaUd
         cKHA==
X-Gm-Message-State: AOJu0YxUOqoxqMb+mn1EhXAHPVlYTrDTRb6ln/ZhNcyteNfB+LrMWIfH
	dIiRx2ARWJqOYkPTsqEdxmr0dPTynAXWrA+XmvsmBaWJ8GqoJfXYGgMZhY673YNLxpw=
X-Gm-Gg: AeBDiesVCvyKHytu4KWOt364WQNRQfRlfqaI6VjVSgz7Nx4Q6LNcuicSHsuVPeJyOTC
	+O7nW5WrG1pZ52AUvwCPkUn2qhHgntjKGFZZkr/FLiRoE+h24HCJh0ypYOWgnXCG8oBFPVU9f4D
	nUCWRpgNyyb7ytmzun1YNpIipKP5U+AYkeq7Z+eoIdtl0LbprX0eGMNavVGpBzPgCD0PQGao0Rw
	LG/x9vnFg+1enAUo+dGl/9RMVcBQkeA7O5DK99jfLqqR0EM6ToMZlmATqWHhTg1D65leE87Ra3V
	aM9QupMK0XMvDmTAWKxZxjUb7EpwrvMYYw/NE9dHVvEhDd7UK0NYkB2R8VGTqHBU6hc1ndGtGhR
	cRBOeanTltk41OIWDkGvHLNczS0fzx0/LOui/BTr3ucPMh2opGSYujhn73aUhnpARsg+nQm+eML
	5a/f3Rmgn5ez22kANGgtVoyXTr9WwX/hTJBfhH8KgVJTbN6H5Ne1f2UoQNnhhOXyTiq1OtY9TgK
	Noj68dCX0oRdtzX/LPTui2ZjRTsu4JMLw==
X-Received: by 2002:a05:6000:208a:b0:43e:531f:720c with SMTP id ffacd0b85a97d-43fe407383cmr42200378f8f.11.1776963043960;
        Thu, 23 Apr 2026 09:50:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:ecb5:414:3f67:410b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46471sm52418423f8f.28.2026.04.23.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 09:50:43 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 23 Apr 2026 17:50:07 +0100
Subject: [PATCH] arm64: dts: qcom: sm8550: add SDHC4 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-sm8550-sdhc4-support-v1-1-93fd81fea5d9@imd-tec.com>
X-B4-Tracking: v=1; b=H4sIAL5N6mkC/yXMQQqEMAxA0atI1gZqbUW8irjQGscMqKWxw4B4d
 6su3+L/A4QCk0CTHRDox8LbmlDkGbi5Xz+EPCaDVrpSRpcoS22tQhlnZ1Ci91vYsbT1MOnKOGU
 IUuoDTfx/tm33WuLwJbffLzjPCzpZMpl4AAAA
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104366-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,aa00000:email,0.134.242.224:email,imd-tec.com:email,imd-tec.com:dkim,imd-tec.com:mid]
X-Rspamd-Queue-Id: DF03E4555B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the SDC4 SDHCI controller node for the SM8550 SoC.

SMMU stream ID 0x80 was sourced from the UEFI bootloader IORT tables,
as SDCC stream IDs are not documented in the register reference manual.
Unlike SDC2, the data path is routed via aggre1_noc, matching
MASTER_SDCC_4 in drivers/interconnect/qcom/sm8550.c.

Tested on the IMDT QCS8550 SBC at high-speed (HS) mode. UHS modes were
masked out as they failed to initialise; the root cause has not yet
been determined. This board is not currently supported in-tree.

Co-developed-by: Tendai Makumire <tendai.makumire@imd-tec.com>
Signed-off-by: Tendai Makumire <tendai.makumire@imd-tec.com>
Signed-off-by: William Bright <william.bright@imd-tec.com>
Tested-by: William Bright <william.bright@imd-tec.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 54 ++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..5abbe519781b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3280,6 +3280,60 @@ opp-202000000 {
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
+			qcom,dll-config = <0x0007642c>;
+			qcom,ddr-config = <0x80040868>;
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
+			status = "disabled";
+
+			sdhc4_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmhpd_opp_min_svs>;
+				};
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
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


