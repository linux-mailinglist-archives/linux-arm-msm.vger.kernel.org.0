Return-Path: <linux-arm-msm+bounces-55464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3878BA9B431
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 18:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09CEE9A01C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04577281501;
	Thu, 24 Apr 2025 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uw995cOL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6512289345
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512279; cv=none; b=sAL9xECCD5pTemKuf8+CRuTAK+F3VNoxi0/vxuVWy/9dG2qzy49r4FCFZHqZPKKwehJwnUy0bAr0fCtVBBIR/YNoMDSldWX5dNL9mfPMOWUUKC2CsWQhw+1D2uGn7ld6zSC1rJ6CT6mbW6D2lEBfsQOriqQE+J7AIeGxpwwG5I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512279; c=relaxed/simple;
	bh=UAun3YEtTgPgMwE+w7DEgN0LbIsouqCKO6JRGb863do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=okd5RyN92vaVnpEv/x0ZYX5Y8HZ4dTDB7rL6RxuCovMosEoAN1x9fbcRGuTDDi/yZAAGSrzNvS+Soqt1Q6dRYifO5S3mYOPF1ZSvB2zYadlfDUlYn6QMKMv/+OrGW5skf6XWDYt5CjlaSFJNNMD5a2xirjOxvrv9AuKfn7wB59o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uw995cOL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so11121725e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745512276; x=1746117076; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=avxTnMgGL9T40vr6mJrf1WvZTctYjb1/k2GZpu6aG4I=;
        b=uw995cOLjZwzeGqWzsIvKSkgFjkoSI46eX9fcI/spIiTFqa2rxWeEAbnaJAebdXaUT
         QU/mqGPbovsBUkaucszIaHJ6/i+tdfK9MT61AcBkNF4RCx2EINbdL/5+c1q0oumHFdy+
         2I0WuLeR3Ap5mBH6/HcKFsoV6AKYoYTIeeURG6WKphDTQ5kDtItWnk1XGPdxqOD3xRPn
         TFwiSnll6qgm4LxHKKmsRJBFlXESMlV2Qq46Zdu0Bvj07abU8ZvUA0nCQFfDxblNOIwo
         5lB7Ds5Tppqv/uwNz1nwAuBCqmnBoayvMzpPE4LmB7YgiFUqgr1gF4AB+9lPsdGXDJ+s
         GLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745512276; x=1746117076;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avxTnMgGL9T40vr6mJrf1WvZTctYjb1/k2GZpu6aG4I=;
        b=W8E8nzJhsQh3J+Vf3MGSAj/Kvg4PoVkwVsROo7B8UlAoymxmOhIW0/Ii1b3/Q/snD5
         91J6y2W8mTcNP3kQud1wXsYNMsDDVmRs3Fx3A9f4l9PFLeAvW3wtAPhbgQZxyV7Hqy8W
         m4SdqI2rUnOOUjJw3LdsAHaW8MRIpYFbjghNXbK5rM4XShb8NuLGcQLFIpeaK3oRui+1
         kxHDESSrq0KnxEmU+3zo6+Qc0ZPTlSn1QhlA/hFoJwXXWyw0oMwktEolrZwXWaZ31CnG
         6zdEGLZFHmJs/3Xj5s01f+i9f+Q7J2wT/o1XJ4zWgICZs1dC/NvATqrmGszcNxv4wGaW
         a1uQ==
X-Gm-Message-State: AOJu0YznDOnZa8+b/cx7aS063MRUbDS6LAPIGttCtkyVXcK86ASVdiDe
	L2W87RayzldPh7bIDpe3++Bb70k6faDz6uyH9p+s6rlxGuobbfG/79riS84RKwufw4eux0aaljD
	Y
X-Gm-Gg: ASbGncuCLK6BHxWchXW8wxpE30qhHSWejQRcPmI1fGM8n7LWSMj5vaYjGwcGVs3nNhS
	PfxbXIzeAq+Xf8BoJjo9gLlzruDDPdlrAocbU3ZTbUVAE9WzSdy/X1yM5XKQl0IP1MLaph86tmy
	Z7zePnLhGSVI33f+YtxM5QMf6Zn8djyy9RepVBpDExEqwgJ421qn8w+hcV/my+U5DJq2BNUhZi6
	u1I0vNsNCmsrQktEbiKIV3VHmaV6MPy9J84jobXLdc89v04O1dTRWM66FPXoP3I+bk9C+whNOHn
	ED07AcKP0fBWXDKorOMu5X/xHz5FSMzXzsLaMvZbULrvrTfJHt75McfGSBTIorPI3fCqhop6
X-Google-Smtp-Source: AGHT+IE0EMp5xPhisna7tNIjNRMs+HpoVRzi9CmGQqlk2xMkSDZBQf/blm/OBKXxO2IKyVALcYS/Ig==
X-Received: by 2002:a05:600c:4fc8:b0:43d:7413:cb3e with SMTP id 5b1f17b1804b1-4409bd0a445mr30673535e9.1.1745512276069;
        Thu, 24 Apr 2025 09:31:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29c02fsm28874265e9.7.2025.04.24.09.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:31:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 24 Apr 2025 18:31:14 +0200
Subject: [PATCH] arm64: dts: qcom: sc7280: add UFS operating points
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-topic-sc7280-upstream-ufs-opps-v1-1-e63494d65f45@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFFnCmgC/x3NwQqDMAyA4VeRnBeopc6yVxk7uCadOWhDo2Mgv
 vuKx+/y/wcYV2GDR3dA5a+YlLWhv3WQ5mn9MAo1g3d+cMEH3IpKQkujjw53ta3ytOCeDYuq4Ts
 SZRrjvacALaKVs/yuwfN1nn/tfuytcAAAAA==
X-Change-ID: 20250424-topic-sc7280-upstream-ufs-opps-b8ddfd7861d4
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UAun3YEtTgPgMwE+w7DEgN0LbIsouqCKO6JRGb863do=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoCmdTePAyUcm4zpv0Vdc2bXZ9PUTPnmGhoawgp2rr
 Z5ugRmKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaApnUwAKCRB33NvayMhJ0YMkD/
 0bAmmHq07b9C+W3kvOFug0WOYe/CizNs+Pjau803x5yYHKPJ5zaASxaETPrFsYtxaiAX0AwVcT63rk
 Uy20KCpHgfugg3Z6EElpypsir/MU+o2F6K2pihJF7bTF2fnGxFDD5oY/h2N97E5qgEj0mJceC60GfS
 PtCBSEUyiQgJL9WKGeXN1uQ+XYe7/KX746GOU55NEkKoTzCIT2+nzuqdWiLetxGCEeUmFbDB2RAOMH
 luDx1uF1fQ7nqM2hW8fAXUQGgmqbA0sY0OwsFklGeMSRPa6MUcgwXiQxZID6R7jBKt0PjadJy8ytzl
 4ID9WgYhWxOsaDDv05B64KYOsxkCxpx+X884VXQNtHLH45hLHsjJrfE6v1r+Tu1Ia/63qf6aUB7I1v
 wgvphgwxw2bGPiRib4r5hxoz6Uu5c+fc9xJEYkDJqM5Zh7IjbsEHCY5ISi+sSLG3Pk0oU7sI8vshum
 PMSlfFUEX1VsUqKh0tGunytRQE7hJL98reXKfnEC+RdeelDRxs8nM5q3iWp1yALrgFkekLifeR2dKk
 k/+Z3xW3u1A17mLG03+8EIoeBK02PiOov8uClBjkBn/IhRfReplqEhK09LHpcuo7SdbE7E0C6v3jf0
 NBhgJFhfmY0kIK8b0wH88FX0Ax/EJlDwLDWTglinPJ/lWJF4rkRtN1onnEaA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Replace the deprecated freq-table-hz property with an operating
points table with all supported frequencies and power levels.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 52 +++++++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8e86d75cc6b4929f6cf9592a3f1ae591a19e6d78..911e104a219d2ce8cd5adaf34c6731bb2d3769c3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2364,18 +2364,52 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 				      "tx_lane0_sync_clk",
 				      "rx_lane0_sync_clk",
 				      "rx_lane1_sync_clk";
-			freq-table-hz =
-				<75000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<75000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>;
+
+			operating-points-v2 = <&ufs_opp_table>;
+
 			qcom,ice = <&ice>;
 
 			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <75000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <150000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <300000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		ufs_mem_phy: phy@1d87000 {

---
base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
change-id: 20250424-topic-sc7280-upstream-ufs-opps-b8ddfd7861d4

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


