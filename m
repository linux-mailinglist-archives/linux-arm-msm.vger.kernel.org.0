Return-Path: <linux-arm-msm+bounces-1863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCE57F75CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 14:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C573328289F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 13:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3EE2C1B8;
	Fri, 24 Nov 2023 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcNs11VY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53BCA198D;
	Fri, 24 Nov 2023 05:57:36 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-28041176e77so1512762a91.0;
        Fri, 24 Nov 2023 05:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700834256; x=1701439056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPgQmqgsB4VA8sM0/4BuwIbl5ukliYjBNcn9c+Qv2X8=;
        b=GcNs11VY79q4TQfVfLRmqplDvJ1U38amZVVE2b+ByC5xrbROg51pu9BL8dHIk9xLFp
         qFhqjzNQE7x63SefJUUJMVjNurm5wW1P6WfakFKx5OO3dv7DQP+WCW2SYEJ6fyTWx1g4
         xgYGdPvZgr1xwNn8cB73PGej0irwFZ8EP05MZnZKK0tVqbKTREL7lNoPGH0BOP+3CoyZ
         oRQvc/0eRs09LNkFCYngl6seXf0VirVQwVWvrwJ6Pl9tEv//yq7IyHMhHmJ+5b0mF85F
         kL2iyBgr0PcY7QI8wCWkXiCbmAc59dBd4AMcAFO+LKFOrrIc9HZGf8Dcl6HYweB0J/yV
         dMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700834256; x=1701439056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPgQmqgsB4VA8sM0/4BuwIbl5ukliYjBNcn9c+Qv2X8=;
        b=GA+vjy4np3vaqPwzpOLfrOC3kR/k0jQSO37SqIgSSaDCSxTSNtB46UKPSWO4LDTblV
         ctx+5FVB8Tdz/54AuiM5l2+cACWIBdU28iQTSi+BRK7J/ehKRCWgMzFqB8Hk7JyO36sV
         7Y4o97cFgJy8gR2i+qdozVwfAhxzDAAyJsC8kfUWzmM6gSHLIuMp269bM9UMdCRBYFTo
         I0OMZUAlC/quimkHe3+uwFe8IRKZA1EpSwpMWhCyQYQKWfNgtLb55BPVBFBpTrIEoXtN
         zGpQpbYaAkACflA4CvHd5NtbaaNsRC9nLC306BqFYAOT5QZMNFMZDs+irkFP2Ff2/76i
         yJaA==
X-Gm-Message-State: AOJu0Yz3VwPlRAgwTJdG9EaFQ7/gaUqhpMtaOSPQMC8fhpda+FNQCDBU
	iAYVbhaFqbtjxV4v1BKS7GMyukyR+so=
X-Google-Smtp-Source: AGHT+IF1DR1aKTqIPsiab5wZPOO/ew65cdKB63CfMrIFsv8jDzM6kWwmqNq//44UE044H+FOQKy/Eg==
X-Received: by 2002:a17:90b:3005:b0:27d:3be:8e13 with SMTP id hg5-20020a17090b300500b0027d03be8e13mr2684534pjb.12.1700834255812;
        Fri, 24 Nov 2023 05:57:35 -0800 (PST)
Received: from localhost.localdomain ([192.166.114.90])
        by smtp.gmail.com with ESMTPSA id o9-20020a170902d4c900b001c3be750900sm3179417plg.163.2023.11.24.05.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 05:57:35 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Sort ufs node
Date: Fri, 24 Nov 2023 21:57:12 +0800
Message-ID: <20231124135713.5610-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124135713.5610-1-lujianhua000@gmail.com>
References: <20231124135713.5610-1-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ufs node isn't in a right place, 'f' is front of 's', so move it to
above usb node.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 3d4ea428e4cb..3de7cb918448 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -657,6 +657,22 @@ &tlmm {
 	gpio-reserved-ranges = <40 4>;
 };
 
+&ufs_mem_hc {
+	vcc-supply = <&vreg_l17a_3p0>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l6a_1p2>;
+	vccq-max-microamp = <800000>;
+	vccq2-supply = <&vreg_s4a_1p8>;
+	vccq2-max-microamp = <800000>;
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+};
+
 &usb_1 {
 	/* USB 2.0 only */
 	qcom,select-utmi-as-pipe-clk;
@@ -678,22 +694,6 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&ufs_mem_hc {
-	vcc-supply = <&vreg_l17a_3p0>;
-	vcc-max-microamp = <800000>;
-	vccq-supply = <&vreg_l6a_1p2>;
-	vccq-max-microamp = <800000>;
-	vccq2-supply = <&vreg_s4a_1p8>;
-	vccq2-max-microamp = <800000>;
-	status = "okay";
-};
-
-&ufs_mem_phy {
-	vdda-phy-supply = <&vreg_l5a_0p88>;
-	vdda-pll-supply = <&vreg_l9a_1p2>;
-	status = "okay";
-};
-
 &venus {
 	firmware-name = "qcom/sm8250/xiaomi/elish/venus.mbn";
 	status = "okay";
-- 
2.41.0


