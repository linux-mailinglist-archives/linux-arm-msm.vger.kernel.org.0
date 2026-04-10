Return-Path: <linux-arm-msm+bounces-102597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPFJISio2GkhgggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:35:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C9B3D3636
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84538302A058
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536A6387591;
	Fri, 10 Apr 2026 07:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DauG6lXE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5293A1A3D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 07:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806299; cv=none; b=bK1DJVwHbllBY5ZALQVRwuDhCE2MKeKAp3Ur7fSR3CbqLBq4KdD2KoCrXdEaesJDV9vJYDoOKXvIXzKK+ZM1LFWwCKyauM4aGXOyC+UZ68PGfoqBc+UQ3YemKjO9X6smzC3P67F4SFEFyneeI18SmLU7VzsvkT3r4CbrvhZ7nTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806299; c=relaxed/simple;
	bh=Yuyp8/DcNzTxLCLZ/KgPEbXxPMI+WxTMHBAv85H+9yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VXVsbBfhfDib0mM/aaGTG9auVqqtVQZfyIZ+TuRKpV2joCNFL8eELHgskAh69SqTxIOe6bDAguH1G2Dr2OTs4xw4tyal4OTI2RoUVXTFWPTpu4YqPE1aAx07sabtTwRjrpFTIBBJ15GIertS2SH5KmVzaEUgHSGn8qsFl5urmhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DauG6lXE; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66c17372965so164536a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 00:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806296; x=1776411096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3/xbbG4SZjH2WvQ1mzO3ILWOaX1Zj4QauzsBGBMWwM=;
        b=DauG6lXEd1dnITlocJJMBxJDrD/FvfCCloYH/BYjkueBTcEfCfcfgKq3fkay3DXj39
         OAgq/faN7MBCZez3nuruR8/Eqi1ze65Gi3W3xE1a2eZpUy5iJpty+8Lbb2UjOKHqeE8q
         pIZJOGM6pQkYgj/fk5VU6lVf+atjqpRMv5R73sxpA4sUBQf/u12YXnDJIGc4oYyDT5T2
         uTt2kAjhGlUU0aqMu2tzorttY6d6en7+N2AHsNedAGAq8mImkBX2Q7gi8vOr9NMwKoKl
         blf6geIurHKK89irbHuF+W9IBR7NkzUkfYwBCzE44RQapIcM02TsN147WUu0PrPKjpVZ
         dlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806296; x=1776411096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h3/xbbG4SZjH2WvQ1mzO3ILWOaX1Zj4QauzsBGBMWwM=;
        b=GxMXIHmHHR7JZ7G0CIpS+fVGT0ub31lv2rlir4y7B7ZT8yD7lX1STefb4lsM23dAcz
         OKryL02ucz54vxARuNm2wtymFfkk47wSTZASlHv/fI8BGw00MMUWiGryIXsGtCKH8ogJ
         xlzGCEezwd2t3nuVtu8/DBK3dUlV33ZJKI/riBtLXx2lSdqjvILZEhplmLCf7ZnTQlAg
         VhXdvaelPmlOXLlnCU2un9YBTjYXr1AB4hoFuV2cSgiTSy34j3OS95YXahu1dpWLU4XC
         4CALuLr7YvnE/nOIkRerTBnVqilaEcyqKaKvzUmJ0dzF/3Vrc0+UhZa5wQMS/l0OVOSi
         2REA==
X-Forwarded-Encrypted: i=1; AJvYcCUL/WrJnGQPHPDVIZQqaKnKh55kkYG2LLPQGpETYbW/oc9Xwm/IX6VpxaGGtgyCl0Q7OmKKDVlIbG+MHySG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy86b61OPHoppRD19nVwwj9LMNHnCTwN5NWXhgXWioH9FUXcD0E
	vc9r3+xa0YDkGdMRbh0+IfcTGiaN5X9scEnVWYJ496aOKTDJ4XrqRG2opwc1bQgGMFY=
X-Gm-Gg: AeBDieu6aoqbsILroU0GITpZN32WgM+8+/kRxO2fvMt0GkBKbv7ncWzMbaeElVtXKlx
	v3E8vVpNLtGx9rBJT92iSK3tyPYmhdhTGSV54Fx0iWekzvzYGaXssEKxO+viUEwSXGQp5lyq7Qq
	tbEXwIugRL212cMgyJuLai2Nhw0yM7SwXw67kjUwpBzk0F7TIz7cvRZTG351rV0cb5qsj0S6ILB
	n8p2bZmfpOQP7Hy+ctpc2mabAkrBZkuBZtk4bmEvp2M2vvVUWm1abv38l2LF89/Srmup1tZAY4o
	MX57QB0wUhY8w/0mKFgvo278QFJ+yfRbZX5jUTlg0h0rJ/l0niUJVCCQWGIjsG5Bo24owsX0TL/
	JAi2HTLrtFuZfqKHYKwrau5e+YM2ZUhnRPg+1r0HFy8Ac+1QhYcjoYgkbgFuaGYEy2Jr70YVn/7
	j0M/UuxZ61OOp602uQp4alcwpswy4+OeJ3fuUm5K1fr6iYOeGjbnJ4YZMJJDrSi46ashBW86Hyv
	x8IqA==
X-Received: by 2002:a05:6402:4250:10b0:66f:8fbd:cc45 with SMTP id 4fb4d7f45d1cf-6707aa3f0b3mr689165a12.22.1775806295719;
        Fri, 10 Apr 2026 00:31:35 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670706252f3sm365513a12.18.2026.04.10.00.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:31:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Apr 2026 09:31:07 +0200
Subject: [PATCH v3 2/2] arm64: dts: qcom: milos: Add IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-milos-imem-v3-2-d215385fa5ab@fairphone.com>
References: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
In-Reply-To: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806292; l=1142;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Yuyp8/DcNzTxLCLZ/KgPEbXxPMI+WxTMHBAv85H+9yQ=;
 b=anuJUyoSQASzl44t4/DE5U2gzQoc25PFfbPsVXMRc+IlvfGKqC2m2B55S5K15oo0ecofEkH9d
 KIKIZ/5DRMxDjafRrzNqw7pqGNE/AZ2IAA7sKYFJpnBZ0jOMN68GS5q
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102597-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.228.225.192:email,94c:email,0.223.255.192:email,0.0.11.184:email]
X-Rspamd-Queue-Id: D3C9B3D3636
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a node for the IMEM found on Milos, which contains pil-reloc-info
and the modem tables for IPA, among others.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..a8536a873c69 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2289,6 +2289,26 @@ scl-pins {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,milos-imem", "mmio-sram";
+			reg = <0x0 0x14680000 0x0 0x2c000>;
+			ranges = <0x0 0x0 0x14680000 0x2c000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-reloc-sram@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+
+			ipa_modem_tables: modem-tables-sram@3000 {
+				reg = <0x3000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,milos-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;

-- 
2.53.0


