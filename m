Return-Path: <linux-arm-msm+bounces-90025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJKkMXvccGnCaQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:02:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5EB58181
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 16E57A22B0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5AB494A11;
	Wed, 21 Jan 2026 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qhc6knRM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ED3494A18
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 13:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769002006; cv=none; b=MrBl29lnwJW3k1wt/s3a5/nlAgN4ZbK8dgtwuOyNMm8yNVd1L2Evv4pr0r194CdvNoHUIjY0rijpYrSp7Iqz0ZoCGWFnxZNCyDGDowleso41c0OmZjL8vg0PgWqe+FfavgT6y8SF4L6M0mJE+KODwb9tFfJ4Bu+QeVq3U/iTeUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769002006; c=relaxed/simple;
	bh=bOS34N3APqGI6AgUcL30CVUFlmgWDAw1B3mfScCEFCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdZDNAyC5yuxmiDUNHU0Vz8maHG+UgbXP+lP8aGhz588xZUxnVUOnWU/IbY+hf2vKQ6YIS4Thidfw0psbZ3A+0IAWY+myXNtJrpOWnL3RY5t9duU3082vtRMcLukPgx0Ekw3xYdJkbB9zJFTysVZ+pmlZsaTcRo3jfiFm1tJjgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qhc6knRM; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c4464dfeae8so4069911a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 05:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769002004; x=1769606804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wsNHq0zgqFRtWN3Q3r2Wx4pD8bNO8exoPE+MC/eMk8=;
        b=Qhc6knRM+5lcyB4yk2sHeDTkITehR4e1Q09x5alijN2pqsrrxWrDG9a6QNP48wL/vr
         qqY6L9Fh0RnDuOTkmcCHf4GYPDD5Rp2g1yjQTMJDgPtqwfw9GGFOII5UcYXgVjMOAmqc
         couxCkC4VZJI7OmWVgqak8CWeSZkkPS+/XyFvH0xRcD9czEacDyyzyysMVjgRgru708/
         ZYU8myMZ3VzPR3AIQ6usYJXRaeAyI/zF/SNrWTIb616q67ClC+gnp7bdOM6bO/SrwMVs
         SWppIbSLqjkgiTyDjQya+fGCGUcbBvgH1912pQrS2dA0AIkPiEKM23Ddry+wX9QVuGoR
         iaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769002004; x=1769606804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+wsNHq0zgqFRtWN3Q3r2Wx4pD8bNO8exoPE+MC/eMk8=;
        b=BmffK0+DMGGOfgNDk4HweG+DLohn9QLuSdjpXfog7RDv5rohZKSDTiAQtVKWNdwaD4
         m+vOLgF9/7EXsKFrQSRGOjbh4i/PlYs1wuucsLxR/lZDmzBilVuXW9rVSgjFKe8xsqxG
         L+eqm7Ya5jFnKjqjd0oWJMh5GNE2QOSdhSsvNUXjMUSZtGZUCJIRasWWRxJhEqL1KKzR
         HUAjh8OQGfqYYuZsJ3zrapM1Gf/9Oyh89vVdFgesZjCZj2mMGiLfkq5zurbkQm40aSOQ
         TJ2bEO2QfBiTdnBLOtsDwy0pGKaRvLOZa7bhVq7TG13SEgBB5vvWJgNdMoBvrRgP7Kil
         p3nA==
X-Gm-Message-State: AOJu0YxhIcyK9248iqUPtC7ThzbuLh2GSXOQr5KOVX+SYhEdPs6iitKc
	DrfBybowPpeampMITofEO5lIVH/ZO7mp0M9qTbLghbXa3dOUdUjSTOf5
X-Gm-Gg: AZuq6aLhJt+JQn6tJ0eN+4gU3/qkI/t9iuIJ6rCLKsVnoKjLlRKelGY5d1OyXgR/h71
	68UKZb2i/73nJt8AcHpRVryAEphzKTaGsvbA9fmdAritgs2dvcSu6w32JfgTsdgCO0z5kp2I/Gz
	82lWPc8IkPGWQmF8W6Qmg679wjC6IZ4vecVCNFxi16rOlwYnk98l4A2ZwunfjgJHB+vQAvb7Nx8
	ibGH/nE1RL6nZqCfkzx1h2KjPsSQJWE/HvIWWHuiDFDueksu6HHW9SPCoV4YimeugZnYAcXR3xD
	kdJY2abjyyz86YGY2oHuz3kIv2siaTh2UUJZN9x7Yem3S1Ar+ZPoU4Tu2iTp66H+sN+e+KsgbrE
	HNzl/j0+Ks//QNTLbfQPJR3u61Yn/eefx/+KJ2sV6PFaczRi3cK3tizNcLlBAoeLQCl3NBc2TjR
	h06V2HO4s5vqTB1ZjQ
X-Received: by 2002:a17:903:3bc3:b0:2a7:c6c8:2cf with SMTP id d9443c01a7336-2a7c6c80a68mr1676125ad.22.1769002004091;
        Wed, 21 Jan 2026 05:26:44 -0800 (PST)
Received: from [192.168.0.101] ([45.113.101.30])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a7194164dfsm151487235ad.88.2026.01.21.05.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:26:43 -0800 (PST)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 21 Jan 2026 13:26:20 +0000
Subject: [PATCH v2 4/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 debug UART
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-xiaomi-ginkgo-features-v2-4-fb3ee94922d0@gmail.com>
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769001984; l=1207;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=bOS34N3APqGI6AgUcL30CVUFlmgWDAw1B3mfScCEFCA=;
 b=Vz2aLtL2O6Wg2x21r38IOz/UfkPhbB7fhWqA+y0R2ZrPCl2JjKXvIuwzILAvT611RVq06r19a
 AT0x+YL7ICYCaN/+mplt04kozP9nqYIZRzFNkhzPD1C4UzCqo2Saavf
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90025-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 4B5EB58181
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the debug uart node in xiaomi ginkgo exposed as test points.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 6e0333378..9a5918abc 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -26,6 +26,10 @@ / {
 
 	qcom,msm-id = <QCOM_ID_SM6125 0x10000>;
 
+	aliases {
+		serial0 = &uart4;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -120,6 +124,10 @@ &pon_resin {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm6125-regulators";
@@ -296,6 +304,10 @@ &tlmm {
 	gpio-reserved-ranges = <0 4>, <30 4>;
 };
 
+&uart4 {
+	status = "okay";
+};
+
 &usb3 {
 	status = "okay";
 };

-- 
2.52.0


