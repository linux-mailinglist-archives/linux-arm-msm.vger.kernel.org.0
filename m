Return-Path: <linux-arm-msm+bounces-93299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GzaK5rxlWlTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:06:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E415812B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43A15303A90A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 17:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E6933F389;
	Wed, 18 Feb 2026 17:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBtIZ5Kx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxmCcK7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA74344DB7
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434366; cv=none; b=ut6htKQ1bPjAVzxTeki1ZiaYAaJA9wAOTbvKRUqOoYFY9cbRDwvDvB+GESK7gf0PYJmnguRRrzMXDfxZyzbKQ07Z5J5o04+nLrlAUqy3zQ3/YKokJsJWQ3v2FbsmtMiq0GNkK4h/EG265SEue8p1j/2/5CfCLtjfNqksSrrDnZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434366; c=relaxed/simple;
	bh=u2eRsBUY+B10Fy1cOP701TseAeeal9rQhmGwHyNHybQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XurAwF4riYIAC928FKQWvL2SYted/3U4RiunhzpT/BTYsnzjOSqx4d5HjFfotdPALbzmHUF33tXC+XX4iARERmNByKVWELjV/SrFcTwo2gVCvKU+99WeUzHK1IpCB01CEOTxRavBPEruJLdIFEoG/j+7nIZmeu5M7fAyi1uS808=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KBtIZ5Kx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxmCcK7Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IFOG6q4024975
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DYhGzZeDjEEmqrkNxzJpeDV/QE+cJir1CEiuwrGhhyA=; b=KBtIZ5KxD4r9di3t
	rXKt4XC21kPaK9flpzBC+pax7xVDOokRwaw57FKbYSCJPZcFsbCk8rTzLWlAoFfd
	sYfxd3Bxh1cr7f3myiC02Vb1Yz87BSM0jo2wChkB1G8Dfu69n5+PclUuJ8xff/9h
	G3suCDLJyKArPMg0FFfu2rFiIpqdQxvnSeHwKXrjsLHby8SOjbUocWbezrCTJxLY
	U5azdMx15HQwN7/G5DdeaQSCKypa90FLcsOO1za6rvbCTw8HkwyG3WfnHsq22x3a
	bf0AUDlQ3he2+PDGF2NuyOc7HQotc4R3vY1e4S1x7aREMokjJ0vGplpEztO4CYF4
	vEICaA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd78c1tv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:06:01 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5fdede3f1ceso223127137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771434361; x=1772039161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYhGzZeDjEEmqrkNxzJpeDV/QE+cJir1CEiuwrGhhyA=;
        b=jxmCcK7QqUVzNH91JL5MnrcIgh15jj46W14aLpWWwCDHwGQPZHm0zF0++Eu3nzRJC0
         jYwzO8wfP4dTkoK7WB5zhdrQQ6OaUNUNZCFbOHlK5hM0J2/0KOZkCBZwWW1qMuzix2Zx
         5cALpNKHTqTstWHebR8o0k7j+D8NUs/FDTbU5Lwv6Me3166ORt0DzLYaua6wpcB1jTqD
         4WW6lVsM0SkyMGRMqMFg2NRuXM/StnVA3Y38gc0K44jpduJywgnoGaXL6xd81u4QYwR3
         +hRIUZ0vX9+Gj+B+HI51qNihbk1+FW8W/hd9PY3yq6K36l+oYNIOsHDlg3bJsyj0Zt/u
         F+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771434361; x=1772039161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DYhGzZeDjEEmqrkNxzJpeDV/QE+cJir1CEiuwrGhhyA=;
        b=gBJM+lMMDh+ZrGN/6Bg0O1xOF9AlWI1DM158uIRzAmfCGTMCUvuTfbGCuI82Gppahi
         xn7K8fwy7GKC83AlkUJQTYIsVHrL3r8UBUxE8+FJ4P1VeCkwV6e91g/C+AaW++FAt8z+
         EQ9/L2s3p2ewcj3qjYzbkhc4Cc1U80Pg3hGSJcBHqSaRGtgo3oJ9N86O743QiAzxc2I9
         4l1nqY+PPgWsG+K+a79mcwA4FyNykbeoWptzLE4vSTilSmEyu8xJ8t3fn8QVxrX2YlZU
         CnT8VAo7EqGT1djGSLvGFxSo0azyPXJQetWwt4cnRDLXPM/KWg9sqKDPZg2MZ56YogW8
         44bg==
X-Gm-Message-State: AOJu0Yy0LvFr81VkGx51XLYeZdRmx182bWltYwlqGviZDemAYpc2Eg7F
	ONXK8c5rQajvwHVQ2q0MSvmrF4322jEktljKkeWIHZg6m4jJZm3jiTlNdppVwJciiOaxRsuZ5OI
	4WAas/S4zrcOhNj+EzEx2mvOvabua8unDU/rSttzSLJZt6CtGRgBeBv8eyGq9/BBcmYS/
X-Gm-Gg: AZuq6aLYiR99s1T8QGjaLTJjY2wecLWUJ+ZJ8fPsTspR6MgDDPcV7Vo5nFE4H0h5ZUc
	TdCOdRWF+LeTCoZXrrpxgdcBmq/8PaBToPVrpXYHimEJZtBoiAfKhIuEEu1y/aUdto8uSxtGQd7
	VKPnvsTamzQILWDtZiwkVGkpo6yK6OeUgbqnYmmJmsmvXkGfXdr5KJo9k0sKpNuEc6ZCCDgjRvf
	7E3H2wWr7FeQ388KSGPK24MiaZa6NWHNfmK0q1soYGu2TRMk/Dzm3jXhlvZuo2zrbMWN3mWW3Ty
	KvRHaa8nCQzMVe8KVecZHQWVuVCy2n2g9+xMcjPonHdpmLKnjnco0kgPvG8a8COnhqsQYvKmxet
	+/QYv/LE/HHFX9FTLgAC/qJr3rJyyrPjxMZ3IUtmvNSOtZg==
X-Received: by 2002:a05:6102:370e:b0:5f7:24e9:6e91 with SMTP id ada2fe7eead31-5fe2afc9788mr7080996137.36.1771434361099;
        Wed, 18 Feb 2026 09:06:01 -0800 (PST)
X-Received: by 2002:a05:6102:370e:b0:5f7:24e9:6e91 with SMTP id ada2fe7eead31-5fe2afc9788mr7080952137.36.1771434360534;
        Wed, 18 Feb 2026 09:06:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d994670sm482188845e9.4.2026.02.18.09.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:05:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 18:05:42 +0100
Subject: [PATCH v4 1/4] arm64: dts: qcom: sm8750: Add display (MDSS) with
 Display CC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-sm8750-display-dts-v4-1-1743e9848864@oss.qualcomm.com>
References: <20260218-sm8750-display-dts-v4-0-1743e9848864@oss.qualcomm.com>
In-Reply-To: <20260218-sm8750-display-dts-v4-0-1743e9848864@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12234;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u2eRsBUY+B10Fy1cOP701TseAeeal9rQhmGwHyNHybQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplfFwvWrE7/pkHfx5lLlO1JU9Ezh77K7Fm0CMz
 WLR01T/gP+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZXxcAAKCRDBN2bmhouD
 1xS6D/9XkWph5R+O3L+VDyiOgqzsWOGAyxoUGk0Km9dgbVimUfKGb6UFO1Ue1CaSUHO8ONIzWK3
 t3kaEwd12n20dcMIY8qpvflhtm25nmp0vcM+ZlxBnejXjl0YWAiBZzE6HO6dMYqHQk1WeZuJrEF
 VNRjYPLj7ALu3pW0wbfSmvrLwngTifd5vSrnjUyRMxQaYaQFdbVR+WGEoeeamQOhLESP1TnVGWU
 JgSiX8uvd5iatYQc/IAZTm3UmsDbF1eFSFrAyXslx3bnHn7MVsg1H0g7ONDcr02MDccRb2cBVNa
 VBBUCRvsezqHKvDHFgYs7Sr3kkkXAiFl9ujcbBxNQ6NCludD4li2XRxFYxSs2GofU6NwgeGxGT0
 3KTpNYbkUqNU6ek3l9mbMYlOEILbVG8pKPq7X5J+tfKYKiy7Ix8Y8Qzkygttennpike5ESInRrd
 UGLlikIbjTmtpb4nJw22PEu/HQdjCajt/3HEgIQsTkgpv+KwcFJLhynIlZUh5iWK9wM1KpqN0e3
 pKvz4aMKIgVTTxCjE3B2yREPzhm2SEOOuGQn8RTGlPQW1LFi6wmD9UBruRNS+Qk6qqJbo6jYc57
 Ep8dSXomPv3vjOs068v6kwMu9yIxoJkyJfd+EgByIAQjkI599Qbyzl3mEUqpYgaJ4JXKUpVxCrL
 GLxLeusrN3rqZSA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: UBAsqnunTe_60i_Jb8lKSsrLmBsOBjMk
X-Proofpoint-ORIG-GUID: UBAsqnunTe_60i_Jb8lKSsrLmBsOBjMk
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6995f179 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=UlFr-3dliyVKfTjn4ygA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0NiBTYWx0ZWRfX0WKnR2kDuoKX
 TQ68lbJ/uVf/mc4RdPb+LV+3W7aoTufNW2pezWwokadH6qcZx7MyKvUvswHLRbxxmLfllI/YVmV
 kBipsH5ZLrrlZQj6mqv2Zcb4KddUgEABI9pmuWjEgGKrV5n7tbb45aZ9pKtajKMYm6KCzaHK6ON
 v1ZNnGkEsM9HtoZiUSh/Sl6HzBbUqXe5yTysxQ7zOVpaSVKTD6ZyMkCe0xCwYVACAv1voRjGPfL
 O9PZY3gNDdK2/7hQFU3j8Te27qs0xyBu5TgiUJbcsyktOzVYXvxi0C1P+TQZFzSCTeK6m76oUMy
 cG1aArq9g43ocGM3xSvkiT1X0SMGivwwdw1sHhD+WG55LfZ5UZHfw8mr1UnM4/F28iinFLmeFsk
 A1RO1Q1n9+NP89M++iRB9Lv4ztBi5ThvbFqJb7lQZYYGUp/9P5ZuUnViqHQlwYhBqBAIsQbU9YZ
 eK2+rRRUx+5jVacoijQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180146
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93299-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C0E415812B
X-Rspamd-Action: no action

Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
DisplayPort and Display Clock Controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 437 +++++++++++++++++++++++++++++++++++
 1 file changed, 437 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f56b1f889b85..82963f4a6a55 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3,7 +3,9 @@
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8750-dispcc.h>
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
 #include <dt-bindings/clock/qcom,sm8750-videocc.h>
@@ -3001,6 +3003,441 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,sm8750-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc MDSS_GDSC>;
+
+			iommus = <&apps_smmu 0x800 0x2>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,sm8750-dpu";
+				reg = <0 0x0ae01000 0 0x93000>,
+				      <0 0x0aeb0000 0 0x2008>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupts-extended = <&mdss 0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu_intf2_out: endpoint {
+							remote-endpoint = <&mdss_dsi1_in>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-156000000 {
+						opp-hz = /bits/ 64 <156000000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-207000000 {
+						opp-hz = /bits/ 64 <207000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-337000000 {
+						opp-hz = /bits/ 64 <337000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-417000000 {
+						opp-hz = /bits/ 64 <417000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-532000000 {
+						opp-hz = /bits/ 64 <532000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-575000000 {
+						opp-hz = /bits/ 64 <575000000>;
+						required-opps = <&rpmhpd_opp_nom_l1>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@ae94000 {
+				compatible = "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+					 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+					 <&dispcc DISP_CC_ESYNC0_CLK>,
+					 <&dispcc DISP_CC_OSC_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus",
+					      "dsi_pll_pixel",
+					      "dsi_pll_byte",
+					      "esync",
+					      "osc",
+					      "byte_src",
+					      "pixel_src";
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&mdss_dsi0_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+
+				mdss_dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-140630000 {
+						opp-hz = /bits/ 64 <140630000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@ae95000 {
+				compatible = "qcom,sm8750-dsi-phy-3nm";
+				reg = <0x0 0x0ae95000 0x0 0x200>,
+				      <0x0 0x0ae95200 0x0 0x280>,
+				      <0x0 0x0ae95500 0x0 0x400>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&bi_tcxo_div2>;
+				clock-names = "iface",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss_dsi1: dsi@ae96000 {
+				compatible = "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae96000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 5>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+					 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+					 <&dispcc DISP_CC_ESYNC1_CLK>,
+					 <&dispcc DISP_CC_OSC_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus",
+					      "dsi_pll_pixel",
+					      "dsi_pll_byte",
+					      "esync",
+					      "osc",
+					      "byte_src",
+					      "pixel_src";
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&mdss_dsi1_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi1_phy: phy@ae97000 {
+				compatible = "qcom,sm8750-dsi-phy-3nm";
+				reg = <0x0 0x0ae97000 0x0 0x200>,
+				      <0x0 0x0ae97200 0x0 0x280>,
+				      <0x0 0x0ae97500 0x0 0x400>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss_dp0: displayport-controller@af54000 {
+				compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
+				reg = <0x0 0xaf54000 0x0 0x104>,
+				      <0x0 0xaf54200 0x0 0xc0>,
+				      <0x0 0xaf55000 0x0 0x770>,
+				      <0x0 0xaf56000 0x0 0x9c>,
+				      <0x0 0xaf57000 0x0 0x9c>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&dp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-192000000 {
+						opp-hz = /bits/ 64 <192000000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+							data-lanes = <0 1 2 3>;
+						};
+					};
+				};
+			};
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8750-dispcc";
+			reg = <0 0x0af00000 0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&gcc GCC_DISP_AHB_CLK>,
+				 <&sleep_clk>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+				 <0>, /* dp1 */
+				 <0>,
+				 <0>, /* dp2 */
+				 <0>,
+				 <0>, /* dp3 */
+				 <0>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;

-- 
2.51.0


