Return-Path: <linux-arm-msm+bounces-73429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EA4B56A56
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 17:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1DC4189D1D4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 15:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541CB2DCF47;
	Sun, 14 Sep 2025 15:57:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA42F2D9EC5;
	Sun, 14 Sep 2025 15:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757865450; cv=none; b=Yx/1SU4fUZUYtru90pKZ+WyH+lNPO920kacpUTJPfl7p+F5YWZuREQwfHwskjwExIOdVe5wmJ4Xfc0//1XEo/n+cruoZ53W8Ejw7R5LvuNFkvxe8gBTjb/Sj61p1cFJLuvkE7bQK6vjKgQM6Uo+yE5uJPUS7I4inPG8KOyPLl34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757865450; c=relaxed/simple;
	bh=+iv5zRGMLQo5WENFMbbcB6yHAuv5xbx2teATjhd7cMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2F/KiNGljCnMiaWvgiUyVpLhbOJV4JUtJzpzHD/lJ3cyeQ04P0kVCXNpYkRPk+2xz0SJSBMSS5grSPSR/zR24rKcgkn6BWF8ZLL3G7BMdsfOFw0vneVQz/BwWuglvvjJm0X7BiT+GsizUVlR9pfB8XziLXVd7FSZYlvMtJ3IIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1757865431t0c66b8ab
X-QQ-Originating-IP: S7nT+GMUYRpDXn7Z8+1Fwd49cQqEch6LdR1e2x1FIPg=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 14 Sep 2025 23:57:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2342445468012948641
EX-QQ-RecipientCnt: 13
From: Xilin Wu <sophon@radxa.com>
Date: Sun, 14 Sep 2025 23:57:04 +0800
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: Add Radxa Dragon Q6A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-radxa-dragon-q6a-v2-1-045f7e92b3bb@radxa.com>
References: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
In-Reply-To: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, Xilin Wu <sophon@radxa.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757865427; l=921;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=+iv5zRGMLQo5WENFMbbcB6yHAuv5xbx2teATjhd7cMM=;
 b=lIBliRBEifCegCHHvAD3Ro5Lo7s+VC/wQ3Xd/SUpe+Yz2/Go5nVIGWfUbpC3sVa6K8cY9J4Nm
 onNzwi2QWyNDWBX2+bOY+GKV5rs6ZmEaOjODsQCuIqCBHS8zWlD6LKT
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NzSDQCFWCzVT6b19V2z28JcCDzIM/bv/KgvfEJI2ROevhotP0OOSRKin
	/F3U0jr4sO4Q9jVvI9HaiFQxAObmIMo32vPwuUEkPYzokyFf0YUqElpV4PkC8l3Jen88qnn
	OLnvQXOFBoVQv9e+JNK0w19Ks6057RjqRWAcB+xklUWxIF3918Q6G1CCMT6mS6/IiCnRGL6
	tXx2iEc9zVnnoAteQJ3Ar6336Dd6JU3p+0oScKW2+EiCJliR6yf1pO4eG12CG8cjNKhSKMM
	vW4aJ3FSZl8q8TE06+5fTkCDSjrL06Vzg4YZ3q1m0EfNNTZoaHKdgVvMdyAlAiH2sGdax3Y
	X8+Rem5I+JWC6GAiqgXHTm0bGlFLcRHQlLmK0Q2/5jwYiWiUcjVmLfBLYnQNdHETlXnPhxb
	5JchFy1TNjRDQ7cyj8hVCJPdRhqqn73AbtcKfFM7JqedssGl/Z4L152SAuipYsWsp86A0b7
	s2EEAAfQpb1MPY0aVoxrdJOLRI7PxIcbQzzQcDpdAR/ft3iGKdIxteHQeY0b/UI0f6vZTOX
	vFmTi6aHWplcoms5rSD4KinXfphZGqimY7DCvOxsZD/nkZoDafn+CAHYqn12Y6ggdn1d1SJ
	wr9T/vk6w/wVxkXyX5f5Mt8c9luK87K2Uw/U9h4H1Gg5bM7dKWFIfXYLnQrFZRDk9lo6iBN
	R/ctP/8F2/9WW9lt2hZtpe680A5L2/COHCxterkf4gaerFEfwDELdukC4DAMBNQkjv+OYTX
	62V9ArnaAQ9/bagnewRwHeVtfXT+MHazMmVPbIwRCJxk+jBADr5cLxU+nXkOfqMYj/EG24z
	2Xlj572NPYapa5ZZBSaKkgv2eRod3E5Ba7wVGe/MqJpbaiuLrX0S7UD+t/KvPAXKoVgBTKj
	uiqGUvLHrvCDisQ8Plm9UUj3FhqPKnfZDDeqaw8NPnlxT3pmRYMnF0WZeBD7tKq2fTzxTZT
	MZ+BgTy/q/vhoIwx3HQHBDokaPrFATZG6YaAEEuQAlBsmMitu0aSLjsgu
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

Radxa Dragon Q6A is a single board computer, based on the Qualcomm
QCS6490 platform.

Document the top-level compatible for this board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0a3222d6f3686f1647b9e2ea192c175b0b96d48a..a7469a51adf0d6ebc1bf25acce8f125a844dcdbf 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -339,6 +339,7 @@ properties:
               - fairphone,fp5
               - qcom,qcm6490-idp
               - qcom,qcs6490-rb3gen2
+              - radxa,dragon-q6a
               - shift,otter
           - const: qcom,qcm6490
 

-- 
2.51.0


