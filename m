Return-Path: <linux-arm-msm+bounces-109917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDC5Cz/qFWqXegcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:45:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A09A5DB81B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89D56304B255
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 18:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4309742314E;
	Tue, 26 May 2026 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7Qg8y4I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rt9m5s7Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BCF4219FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821071; cv=none; b=rqm3ixZ0xV8aZHge4C/qdlHJw6wtVHPGFi2EI2Dqs/+Y93PUpw2Acw3bbylhTBdZRPSlqmCqLPyYznQSbe8YiX/S6FuWXqu2S5kEVHduD2ZngSPy9yFdvTMVhzZOkwfTSgkAUeSDlALn/Vf7Sd58g6KZc6jXT9mbC/gMl6Guv94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821071; c=relaxed/simple;
	bh=/LlUqPuzoUpJYpzlWz2H2jaV5dcA4iW+0yMXMr/0Y5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NeWHI294Wfh95kSEeqqYVYlIV+mZSbZli9VCT15k23mW0k46FLbOmhvpIj0D7RANOef+mQHO9t8o2eA+yM6NYlzhfagCeaCQ/oan9Y5UfYm9Z8+Ay7oa0ATinv0tBZUDp6t1yf4Z7RgyTAOVZZBegWp9r2dIiFC8GiPSYf0xpF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7Qg8y4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rt9m5s7Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH11aT2022534
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ebSLJLn0Ajn
	KDVdWuV+bTMoNjWxQYHmA6naRcJL5OMM=; b=U7Qg8y4ISg5uFvom+4wT/4cWjYG
	ovNnIUBkw/pqVN0125Oft3dXxosYV1JD/ifdQ5bJ0KQ6nkmlCLw16Kbz46Z8x5x/
	TIkHt38VT98+0LusTeAyNnigCVqPRyF89tRWFrGUXJO/rg37qXUrk9HL8fbtNaAP
	Drm+efjjF4+O0MSDQR9NDTZ3VzrdxQ/kKC3IjGwVjH3aMjee3WtlEAT8jcJM7VSO
	jkMzUKF5mcuSeILce9d63X56LSanzs0+KJmtD8VGLyBsjZXbLrX0osJNvaRQasVT
	AHkc2bi6LKre/tmObZVXrWqBnMlKujrCQCleNH6vXEgLNeh7eOUF2u3takg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edefugun8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:44:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3663818cb1dso2363172a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779821068; x=1780425868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebSLJLn0AjnKDVdWuV+bTMoNjWxQYHmA6naRcJL5OMM=;
        b=Rt9m5s7YWg3uEVLWjPFtGbUbXhhYIFaSitLcG2PgrTf8xnQ9VE0B99JZVVooUi6ZEh
         T8GlUG8yUliF+oBTcZQrCJ/x1Ei4s1PgRuJtpd1RIQWaV9XZ/paoq7RL/c3uTV1Vws3k
         qDFuYYWo8PJX7WHQDEj/sRBjpyC3vUltMA/Zm8N7nCzCA9jr72Mdg7d7esjpeJwtgzrr
         QsLhk30A6YFBg9+Xvl57L0cxsKhNOMd89L1lov0As1U85u4ivBsPOXB5geQ3VNmZzFCC
         Xq6BALedx5BrTjTvDg5fnAf7u+8byl5aHSIz/MeOnSPkGfiTIRjI0N5tMaxubkQvf2Mn
         SLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821068; x=1780425868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ebSLJLn0AjnKDVdWuV+bTMoNjWxQYHmA6naRcJL5OMM=;
        b=mzfBmd+Vzl0OWJHmwLbctIFjtaR/zRFrul5xG0c4hFMc+DWLJ+E7DldN8JB+OdQi+l
         ILhyx7r40qpdALAjyuZtJPDCvL4JnAVVcTWkb9mSwkpKFgH/ckaTT3Uv3lwvt3HITIRs
         GRIneO6ksINl9an0JgqLKEQpuhnpRzTNkSovfEn3bWCW83O/v+/7vNLGc0Yu+FQtQYfM
         5EzkWnFgqIDDZz/F2e+cJviMqi4VIrmfBIJcgOdNTK07nwLdn6htyGn8pB4RysabCuYc
         XUQmzr1iPHe3/K/0+YIgIk/oWIGNa/06se5z4IwgG0Oyu/DksQbi6fJRFx8YP54CS98y
         i+sg==
X-Gm-Message-State: AOJu0YzVR8SzB/FsDrY2Oyc9xaE95rtzX9/+xSBkELNhK9VYf0Asgcby
	TcNkrWzBF1u0chOkUj5nI9tGPc48vmXUFBTYWUaQIAIW9A1HW9umQ7MrHOkDVR8o/1TD3KqNOLw
	+O5HhooS1MSSXgPg9VEYCO63hzrbriT9zwE3hP/TQPZckS3Ca7kkuUat31aZGg2yx6Og=
X-Gm-Gg: Acq92OGLzjGKEudK5hdWL/EWgEhDOLdnKHiZgZvIVLROYZ+gQC02yPxrngVLrtPCLpA
	z8pUj4rclA5l9qvCM/41rIKdye0miLhH3t5GudEchLsHwV7F2LvSLIhWDhO4a2fPp6tB27KGmRJ
	6ehBgubcLkn98wzQHVijpXngVj6/af9FSIANN+UCosDgJG9VX+x+3Yd9FSKm3oCbk8LVqxuKcri
	7Pm7ZuYHi+gPrdg14SINPJiXRhh/OP0mkI9N30wm0YErJiEQ2+gZ4F7+hCXlG1ZvyQ1Fe8PqFMZ
	ZXn5w7vRZ3B7tMLLJmaooBX73b+KNIXAvsPkJ6LDV8fiixPprLpyrL2y597Yx5fOgfKbXjk9d3j
	HigHaX/g5qLmN9dOeCq9akgzJE4lt6BlOUK65iQIxj9NLXr02F9+Q6Q==
X-Received: by 2002:a17:90b:3a08:b0:35f:bf50:b4b6 with SMTP id 98e67ed59e1d1-36a67449419mr10110983a91.1.1779821068291;
        Tue, 26 May 2026 11:44:28 -0700 (PDT)
X-Received: by 2002:a17:90b:3a08:b0:35f:bf50:b4b6 with SMTP id 98e67ed59e1d1-36a67449419mr10110973a91.1.1779821067803;
        Tue, 26 May 2026 11:44:27 -0700 (PDT)
Received: from hu-ppratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm16866628a91.9.2026.05.26.11.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:44:27 -0700 (PDT)
From: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>
Subject: [PATCH v3 2/4] dt-bindings: phy: qcom,qcs615-qmp-usb3-dp-phy: Add support for Shikra
Date: Wed, 27 May 2026 00:13:59 +0530
Message-Id: <20260526184401.3959717-3-pratham.pratap@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE2NCBTYWx0ZWRfXzYs8j4KKKCGM
 vHePoODoE3VgorZmFB6+1IPyw1s70KeQs7J9suzkKaBFVCcMrQsZs3uWFlOD0Z4HTGoErpDHNHo
 8pLB6j6ABMQ6VQepyJtsQLQIErb38leYBA4nDaS89W9tfNQcSFZGRmJQSnMMZqDXdCC5f/WM9HF
 37cARkjFygETNGzWx4RFQxT694THOvXl3p/NANdCg+KpvgmINFkFtu/NjhhUAXRiOl7FGUDb/P4
 c/1ZK3jpfcFH85vLs4t4d6Tt/KHETIQbQXknt0UxPhDBBrWZzFIjznQNM64MUimwAoGRpDDr2jl
 qOvZ9aEJDKnz+Az2x9MsCQaa0A6w7GmVyZBHvcomfMMiX0B1Biuo8cB0qtaT7cewfU066Tu1xYA
 +aLivh0K4t2eUMssk2Y35EoHW7uZaKCI0EfyhxfmENpH6yvdQh6GpIZduj/myqvkJ/Yxx4Ah3h+
 0qNdu93eMod2AevY7oA==
X-Proofpoint-GUID: 4zpJyag0MKFF3X7Zlbyzyimh-cF7gYdz
X-Proofpoint-ORIG-GUID: 4zpJyag0MKFF3X7Zlbyzyimh-cF7gYdz
X-Authority-Analysis: v=2.4 cv=cPnQdFeN c=1 sm=1 tr=0 ts=6a15ea0d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=xUBqWrrpq4f8rQ7XQh0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260164
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109917-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pratham.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A09A5DB81B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Declare the USB QMP Phy present on Shikra SoC. On this SoC, although
there are DP registers, the required internal pins have been removed
and hence DP wouldn't be operational.

Shikra needs 3 resets (dp/ phy/ phy_phy) to be asserted and de-asserted
as per hardware recommendation. Extend the bindings to accommodate the
additional reset.

Use QCS615 as a fallback since the software interface is compatible with
Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
---
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml    | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
index efb465c71c1b..65ae4c6e09db 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,qcs615-qmp-usb3-dp-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-qmp-usb3-dp-phy
+          - const: qcom,qcs615-qmp-usb3-dp-phy
+      - const: qcom,qcs615-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
@@ -33,12 +37,15 @@ properties:
       - const: pipe
 
   resets:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   reset-names:
+    minItems: 2
     items:
       - const: phy_phy
       - const: dp_phy
+      - const: phy
 
   vdda-phy-supply: true
 
-- 
2.34.1


