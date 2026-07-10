Return-Path: <linux-arm-msm+bounces-118210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XLpkB728UGpp4QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:34:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3397391DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:34:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b="jjUNeS9/";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118210-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118210-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB9EE30BDABF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A31C3F4100;
	Fri, 10 Jul 2026 09:23:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEDA3ED3CC
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:23:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675383; cv=none; b=MYzSWB/WzFxmalHTOuPNFtbOHnYDhEfEygbxdmvsWN+rnjHkR+fPSCrRYCQCEhbJa4Y5TD9F9Mn0ksYWdX2Ln40cwRm1WEiG56+hS0fHPVEnSAvDwi+H1rPaywtwxmE/7u2JiMH9Ah8X+kyNZfi+9ITlrEokZN/gjk3jyKPMcNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675383; c=relaxed/simple;
	bh=6vvvoS+Br7JM4+bO6PoXZDcYhJ0TxtZIz5yf5h8lYBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdDqiIxsxlzZM2nT23L7bYFIFs89RX0V4Q3sKmhD3XVuuhd7Tslvhco+HaRX+UjW+bbZaGsp51uD4QGZku9Ig9Znz3WyazCXh4Sh1LRZ2SgtGFs0PFeuODIKK1a4CXpoX0sxbUTuZD+8LtELgrDIRKZ/UFqD0NwjIID2N96W9DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jjUNeS9/; arc=none smtp.client-ip=209.85.218.54
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c12614b81c9so131471866b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783675378; x=1784280178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yg7ioh22XhaJVGdlXVxo6srFg4mbOi5uMGV4uuYdkyg=;
        b=jjUNeS9/hfWAi9hAA0YlXGQp5Cz7gFKWy/Ne7FzGYNLMi33sudxUlGYS2EtPs01nl6
         cGIYxfPK0+d17zg6pScVd2aONuSJrIlukGpKrK6iDlbyJXxf6vWqKsBk6R9sbqxEApDG
         51yPiXCa0q1WzlgiUC9SznzG4IplD/Yt1+P9Eju0fjbyoba+nnXd0+sJtK/AB6FTffuA
         7LnMkFaqCQ0GgxfIEVE2ZT1NN1hCkNdrsvnC9gFI3jHWm2IWhG74QxRGl8MBqbrlsXNV
         sVgdxxjDKQsWmVkTf9lJgyoHtsUyc6rCJJEg7iRKKYfClbTey++8xqPRI+eIKrBPC0FL
         VcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675378; x=1784280178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yg7ioh22XhaJVGdlXVxo6srFg4mbOi5uMGV4uuYdkyg=;
        b=E1EySvW4TEv+jaibvUEUPzVcKAJI6p4R3cicNMdbm49wMZsFVn+x1rU4rI7eovbWJS
         GXIBZeB6ReVimh5TwVhk5iwWsFfJMG5ZVG4NRnxJd2zdWrlC75IlLarlSGGrqjMFje/i
         jNRzc4ILyIL6l5QpmyINmzjZocHDQdiHSVuatZBgWQAKLyxIMfpzY8W9P0heOXUi3XY8
         WYLftD8IVVGp4TWhm6E42QuOOckPEPLfbFY36tkS1n1ewLALluSElQnIxuniCV2YrX3W
         mQjKfQ9NXBL2XZiMWJ3cp3n9/bafgoRLkooxR9OWD/HPexlH+V9MLTqn9LzQErSG2MFT
         4OUw==
X-Forwarded-Encrypted: i=1; AHgh+RrhQ7rDDQc50jD3/Q4/mCgXE+UXHX3b2kt7hB0H8ba2FsYRwsqolgtQ8WEv+l2VE5fTA+vMYjNb7JHnWQCy@vger.kernel.org
X-Gm-Message-State: AOJu0YyKNqpRwPYNTi8BHx6CjsZdm6xsJ28IYoVuTRkYEAK4npr4rBcI
	EWegrtvUqQLUO/j3duU6LQMHC01SiCuU3CmtNjqFWTkkTCt+2vy4MiGwuY/W1ljOOyO+sb7wJUT
	WzmARsik=
X-Gm-Gg: AfdE7cmHQwjbcRFQolfJ90bTtpVYY2oldAhCIzjga2TnujKPf7xzBLdpm9vOWQ0tlHq
	yg1yEaPPcTxkYnDKNwAB3TAe8jFMw4rI9Baxdl7ZYk1eJIKpfbxyRFEWZpCijxiCetoIYtT4ybd
	xC6zVcAZ4ikMw+yNJ+eYgT3li1YU1lMrourMWbgGZ/KOBq0lfZrmVb87ldTSkRRjqf01KA+zEMq
	ysX0TvUzu7RJWD35pQ8tXMy4zN+luF3wmCw/AlRjdQwXwx4PZd4BhmfoFhPn1jpKSSY9D6boJfZ
	ox/yb9hCMn4yjedMmQ31xlOJuIycquEIOILbfrwfvIRT88+DP2ag7tlA9GrFCPMJGqJ4Nr/JQki
	kRGWzegNBNENzO7KD0943UY+fnIVE4CgpSHhzT6eH8DeDsEV+x0MWxCCrcsjaSO5KSK1VtMh0Rv
	rbfiknWeClFSNssKratsaPhAu65JwLx5JFnWO6EtaS81d7WhZ+JEXTabxrfXv6fFY33zY=
X-Received: by 2002:a17:907:76f3:b0:c12:330e:ea76 with SMTP id a640c23a62f3a-c15ce18c17amr333319866b.37.1783675378323;
        Fri, 10 Jul 2026 02:22:58 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm261785566b.36.2026.07.10.02.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:22:57 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Jul 2026 11:22:42 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: milos: add CPU OPP table with DDR &
 L3 bandwidths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-milos-cpu-opp-v1-4-ae7f4b09bc77@fairphone.com>
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
In-Reply-To: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783675372; l=10846;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=6vvvoS+Br7JM4+bO6PoXZDcYhJ0TxtZIz5yf5h8lYBI=;
 b=Yb7cyVD/7L9tLGDe6hKl9sNaOsQlKvBsiS9fkifLaKpyqyWG+flOdZL2RtSne7+2XIIDwbEAf
 icPmeNZ27FKCLt4BEeFtjzeN+6c6M5/YxtfWI2SO1Q+8lsYzXotXcy2
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118210-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akoskovich@pm.me,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luca.weiss@fairphone.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,fairphone.com:from_mime,fairphone.com:email,fairphone.com:mid,fairphone.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D3397391DC

Add the OPP tables for each CPU clusters (cpu0-3, cpu4-6 & cpu7) to
permit scaling the DDR and L3 cache frequency by aggregating bandwidth
requests of all CPU core with reference to the current OPP they are
configured in by the LMH/EPSS hardware.

The effect is a proper caches & DDR frequency scaling when CPU cores
change frequency.

The OPP tables were built using the downstream memlat ddr & l3 tables
for each cluster type with the actual EPSS cpufreq LUT tables from
running devices. Note, that higher frequencies than SM7635 are available
on QCS6690, those have been added here as far as possible but may not be
fully complete. Additional OPPs may need to be added for that SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 291 ++++++++++++++++++++++++++++++++++++
 1 file changed, 291 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 8e288b5dfc58..974afd7a582e 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -66,6 +66,8 @@ cpu0: cpu@0 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			operating-points-v2 = <&cpu0_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -104,6 +106,8 @@ cpu1: cpu@100 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			operating-points-v2 = <&cpu0_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -129,6 +133,8 @@ cpu2: cpu@200 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			operating-points-v2 = <&cpu0_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -161,6 +167,8 @@ cpu3: cpu@300 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			operating-points-v2 = <&cpu0_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -186,6 +194,8 @@ cpu4: cpu@400 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			operating-points-v2 = <&cpu4_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -218,6 +228,8 @@ cpu5: cpu@500 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			operating-points-v2 = <&cpu4_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -250,6 +262,8 @@ cpu6: cpu@600 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			operating-points-v2 = <&cpu4_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -282,6 +296,8 @@ cpu7: cpu@700 {
 
 			qcom,freq-domain = <&cpufreq_hw 2>;
 
+			operating-points-v2 = <&cpu7_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -435,6 +451,281 @@ memory@0 {
 		reg = <0 0 0 0>;
 	};
 
+	cpu0_opp_table: opp-table-cpu0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-441600000 {
+			opp-hz = /bits/ 64 <441600000>;
+			opp-peak-kBps = <(547000 * 4) (364800 * 32)>;
+		};
+
+		opp-595200000 {
+			opp-hz = /bits/ 64 <595200000>;
+			opp-peak-kBps = <(547000 * 4) (556800 * 32)>;
+		};
+
+		opp-787200000 {
+			opp-hz = /bits/ 64 <787200000>;
+			opp-peak-kBps = <(547000 * 4) (710400 * 32)>;
+		};
+
+		opp-902400000 {
+			opp-hz = /bits/ 64 <902400000>;
+			opp-peak-kBps = <(547000 * 4) (806400 * 32)>;
+		};
+
+		opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <(547000 * 4) (998400 * 32)>;
+		};
+
+		opp-1113600000 {
+			opp-hz = /bits/ 64 <1113600000>;
+			opp-peak-kBps = <(547000 * 4) (998400 * 32)>;
+		};
+
+		opp-1228800000 {
+			opp-hz = /bits/ 64 <1228800000>;
+			opp-peak-kBps = <(768000 * 4) (1094400 * 32)>;
+		};
+
+		opp-1344000000 {
+			opp-hz = /bits/ 64 <1344000000>;
+			opp-peak-kBps = <(768000 * 4) (1209600 * 32)>;
+		};
+
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <(768000 * 4) (1363200 * 32)>;
+		};
+
+		opp-1593600000 {
+			opp-hz = /bits/ 64 <1593600000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (1363200 * 32)>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (1497600 * 32)>;
+		};
+
+		opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2054400000 {
+			opp-hz = /bits/ 64 <2054400000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (1804800 * 32)>;
+		};
+	};
+
+	cpu4_opp_table: opp-table-cpu4 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			opp-peak-kBps = <(547000 * 4) (364800 * 32)>;
+		};
+
+		opp-633600000 {
+			opp-hz = /bits/ 64 <633600000>;
+			opp-peak-kBps = <(547000 * 4) (556800 * 32)>;
+		};
+
+		opp-787200000 {
+			opp-hz = /bits/ 64 <787200000>;
+			opp-peak-kBps = <(547000 * 4) (556800 * 32)>;
+		};
+
+		opp-940800000 {
+			opp-hz = /bits/ 64 <940800000>;
+			opp-peak-kBps = <(547000 * 4) (556800 * 32)>;
+		};
+
+		opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 768000 */
+			opp-peak-kBps = <(768000 * 4) (710400 * 32)>;
+		};
+
+		opp-1190400000 {
+			opp-hz = /bits/ 64 <1190400000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 768000 */
+			opp-peak-kBps = <(768000 * 4) (710400 * 32)>;
+		};
+
+		opp-1286400000 {
+			opp-hz = /bits/ 64 <1286400000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (902400 * 32)>;
+		};
+
+		opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (1209600 * 32)>;
+		};
+
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (1209600 * 32)>;
+		};
+
+		opp-1612800000 {
+			opp-hz = /bits/ 64 <1612800000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (1363200 * 32)>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <(1708000 * 4) (1363200 * 32)>;
+		};
+
+		opp-1824000000 {
+			opp-hz = /bits/ 64 <1824000000>;
+			opp-peak-kBps = <(1708000 * 4) (1497600 * 32)>;
+		};
+
+		opp-1920000000 {
+			opp-hz = /bits/ 64 <1920000000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 2092000 */
+			opp-peak-kBps = <(2092000 * 4) (1497600 * 32)>;
+		};
+
+		opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 2092000 */
+			opp-peak-kBps = <(2092000 * 4) (1497600 * 32)>;
+		};
+
+		opp-2073600000 {
+			opp-hz = /bits/ 64 <2073600000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 2092000 */
+			opp-peak-kBps = <(2092000 * 4) (1497600 * 32)>;
+		};
+
+		opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 2092000 */
+			opp-peak-kBps = <(2092000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2400000000 {
+			opp-hz = /bits/ 64 <2400000000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2707200000 {
+			opp-hz = /bits/ 64 <2707200000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1804800 * 32)>;
+		};
+	};
+
+	cpu7_opp_table: opp-table-cpu7 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			opp-peak-kBps = <(547000 * 4) (364800 * 32)>;
+		};
+
+		opp-633600000 {
+			opp-hz = /bits/ 64 <633600000>;
+			opp-peak-kBps = <(547000 * 4) (556800 * 32)>;
+		};
+
+		opp-787200000 {
+			opp-hz = /bits/ 64 <787200000>;
+			opp-peak-kBps = <(547000 * 4) (806400 * 32)>;
+		};
+
+		opp-960000000 {
+			opp-hz = /bits/ 64 <960000000>;
+			opp-peak-kBps = <(547000 * 4) (806400 * 32)>;
+		};
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 768000 */
+			opp-peak-kBps = <(768000 * 4) (998400 * 32)>;
+		};
+
+		opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 768000 */
+			opp-peak-kBps = <(768000 * 4) (998400 * 32)>;
+		};
+
+		opp-1324800000 {
+			opp-hz = /bits/ 64 <1324800000>;
+			opp-peak-kBps = <(1555000 * 4) (998400 * 32)>;
+		};
+
+		opp-1459200000 {
+			opp-hz = /bits/ 64 <1459200000>;
+			opp-peak-kBps = <(1555000 * 4) (1209600 * 32)>;
+		};
+
+		opp-1651200000 {
+			opp-hz = /bits/ 64 <1651200000>;
+			opp-peak-kBps = <(1708000 * 4) (1209600 * 32)>;
+		};
+
+		opp-1766400000 {
+			opp-hz = /bits/ 64 <1766400000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 2092000 */
+			opp-peak-kBps = <(2092000 * 4) (1363200 * 32)>;
+		};
+
+		opp-1900800000 {
+			opp-hz = /bits/ 64 <1900800000>;
+			/* TODO: ddr4 = 2092000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1497600 * 32)>;
+		};
+
+		opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			/* TODO: ddr4 = 2092000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1497600 * 32)>;
+		};
+
+		opp-2304000000 {
+			opp-hz = /bits/ 64 <2304000000>;
+			/* TODO: ddr4 = 2092000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2496000000 {
+			opp-hz = /bits/ 64 <2496000000>;
+			/* TODO: ddr4 = 2092000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2707200000 {
+			opp-hz = /bits/ 64 <2707200000>;
+			/* TODO: ddr4 = 2092000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1804800 * 32)>;
+		};
+
+		opp-2918400000 {
+			opp-hz = /bits/ 64 <2918400000>;
+			/* TODO: ddr4 = 2092000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1804800 * 32)>;
+		};
+	};
+
 	pmu-a520 {
 		compatible = "arm,cortex-a520-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster0>;

-- 
2.55.0


