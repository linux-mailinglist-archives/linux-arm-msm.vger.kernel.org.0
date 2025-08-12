Return-Path: <linux-arm-msm+bounces-68792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1FCB229F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 244DD1C248D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029AC286D45;
	Tue, 12 Aug 2025 13:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0rib+nv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723CE28727D
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 13:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755007023; cv=none; b=otDkjXaqgr6q07pBlDLhkIilRzcf8cFT3cLHoOclFBgA3SOWtJOYg2jFb6RawHKWsMsoIuYoHK5MUsOdGL6tEuCvd7GwcgnmPMT/TjppnDDS+QHixbqORuOJaIHvbtPIVZAG7xUkinRwkmunADpbOmKacLzQh7iAYOYVI1UHLj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755007023; c=relaxed/simple;
	bh=x+vJsdB5UbWnDVZfy6kpse5FbjcsZdmkhpaMMIlOSS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qUMbLeEEEpHlaI+2c02BxirCtBJPnPxkLZfZeSUFnKfTuT/ntfXQTvy1ClvYNvfEFlLplVXIuGvQSC7QQhFlC7n9xw/AkxORVTfxC2wu6LIl3W8D7zToZBplui+QNfE5bCO4hlddykjURu89r6gBx8OVOXGtyUiPfrD8xT+Kx1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K0rib+nv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvf1n029550
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 13:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZQ8+tiX7M0E6mUEBR+uWjNOhJ1OIH6kHczo6fKhd1q0=; b=K0rib+nv07uua6VW
	nuXfD0F5HGud5JLVQGV4eLODA20goezDAju+rxuI+/FHMRt5vPu814Qu+FhA4hrT
	KeORaKJ59xgpBhLRIGpVD1VYMuvstOccBvIBF63Jvc2A2XMflxB7fSpuYuoyoPig
	fq2pbWDvFiTzQAN2qBZs/eilUVhs5S8Y+W67DqwJwOalIDAOlEs8zt525rOkOr0G
	cY28WjtXPTzi6XmVzFU9rPWmqd/42IJKWIjbyZV7i1KNkhDg2udOH0MkehdOyCpV
	KMYfdThQ41noldqwqjlfHQzmCtHT6t2cmv1Iwb5c3pJNKn8ekPBAj3n4PnMbGTPq
	JvUdBg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g8an4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 13:57:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b46fa1ba6fcso585834a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 06:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755007021; x=1755611821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQ8+tiX7M0E6mUEBR+uWjNOhJ1OIH6kHczo6fKhd1q0=;
        b=FHWFqlVUGbn4+C19/yh2g35hiRibucGD0wbdu4f/uyaRmJJIJ/MxgCtx5p73vEmZF2
         YxB921ptw4y+ZqNHeqMoir/NZMuGJ/y+LcO4iQ/oq39kgHVi4Q/HqSfT0hFck1/5Pj1o
         ZhjdRNbnph9XjIur2g1BzHDiOf4RE8mMQDTGOMnO7PCeN9Jf5e+R5z9k2QQfTtJR/RVc
         bWoL9dpSaD6xXTmPJ375lka8rU0r7nGTjhf0CN5FinQ3/CTqL1h9EkxtCd4r4TK+d8tF
         pWoDmfkxs/GOj09pa5ihXjs41DNLtuFumLtntQY6fs1X87RUvDI7fni1Jv8nRqAQJC7M
         hdzw==
X-Gm-Message-State: AOJu0Yx9LIy//hOgUI27HsOl8I2bH+6N3Fs0mFpPANHX14UhWNu8SeWY
	QIuJN26I8tfOB8L3RYSjAiOQuw9p/EhNEzcDZ9yPg5oiD3P6FObkS4OgMcMuLZ+x9JfNTPoxWhh
	FjA+Dmwn5Wc497jbeB8ohFSs6Xwgi42XL7gOfq+AvWaiO8dknALd1VHJxcUb60Ep+GQb3
X-Gm-Gg: ASbGnctjDjxVLrduetn+Z6YeFefKEU05kdnoz7jkGedxwZ+0c9uIw5ZTfSJTwJ1dKi5
	PNZBRqkFb4KJS1M3cmQ3KWDr/EWmr0QRom57HQ3Lim6SIWv15mheoqCfsyqTL18FqPWZS7u/bZ5
	0a2o7ywJRs34dABf3S7z2EIAJb+VTF9cdNed1riadgikF0BOBVDUkmZ/NBoWVRmFL3CyS8Pd1/z
	ldyWO5280zWDnzVB9nOwMvN5Y/LWv4YM83PQ361eUcM0SZRep/2iTVwd779l/5uLXC8WTUVesal
	JyLIqel+Fi58lCTbNsxeHOAKbMzmoYo+Bnjkb1a2XjVGe/4HvnLX9XUotk4GmeEVotRSnWkWjE8
	=
X-Received: by 2002:a17:902:f786:b0:243:43a:fa2b with SMTP id d9443c01a7336-243043afee2mr24964755ad.56.1755007020861;
        Tue, 12 Aug 2025 06:57:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/Ll1cwqHkzp4WWLM0KEdu6MBHiByEt78BDHl1i8byC65D++79kI5HRM3rx5blTvOTvRZLdQ==
X-Received: by 2002:a17:902:f786:b0:243:43a:fa2b with SMTP id d9443c01a7336-243043afee2mr24964415ad.56.1755007020412;
        Tue, 12 Aug 2025 06:57:00 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24302e028dcsm16703265ad.91.2025.08.12.06.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:57:00 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 19:26:44 +0530
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document SC7280 PCIe0 phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-sc7280-v2-1-814e36121af0@oss.qualcomm.com>
References: <20250812-sc7280-v2-0-814e36121af0@oss.qualcomm.com>
In-Reply-To: <20250812-sc7280-v2-0-814e36121af0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755007012; l=4032;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=x+vJsdB5UbWnDVZfy6kpse5FbjcsZdmkhpaMMIlOSS0=;
 b=fWhFHgoWQEMAvJ1DN8osk233BTcVPVYyvwBmN6wSuJ/meEyBZHsLk/RFvE/UF0PrIJD76vLP8
 qzTKCqQL7FiB9k/qQ+lM7BF+G1+jXOrrdT7wkLTE54Lpbb1P9GSDCUl
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689b482d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=dTY-U6FrE7cCJ7g73hYA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfXzsB7+HPIQZ2u
 LxxLjvZzBHVyvyDsHGXJCqYQ4I6VQAyL8Xd0byteg72u36qveXLOL0U2FH6amKKWtHSf88plrPA
 lP8wPINsk1hH/Zb7KClUTV27f3zmxO6uNJ0rrEtNhuH9Kcqt2EwHTQtM9QChgkvpPMrMozkKb6M
 yRYWhkts8fHE8NvwKxsuSsqxLTTR/tkJTwqoHtxwZdgmyrWwzU0dnYY6VGMmVXdEdDpJaftzqiK
 VQzoOKTThBa+5bYuBRzQ7C6aleWumkobVxJwG625PfmB6BDj/gt8YdG2FfJ58rH/0/m/OAW96RT
 IKp0KaPWOEbCsfTAGRVYcheoelhoJV+xo2UsXn88s+D2oMFLfcVAJoNsF/bonI/nUTa07nAyMtU
 kgNO/Isi
X-Proofpoint-GUID: 6XhneapMNLzj4EGKe7T9XSjt_TIMIe-n
X-Proofpoint-ORIG-GUID: 6XhneapMNLzj4EGKe7T9XSjt_TIMIe-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

SC7280 PCIe0 PHY is functionally compatible with the SM8250 Gen3 x1 PCIe
PHY. To reflect this compatibility, update the binding schema to include
qcom,sc7280-qmp-gen3x1-pcie-phy using enum within a oneOf block, while
retaining qcom,sm8250-qmp-gen3x1-pcie-phy as a const.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 69 ++++++++++++----------
 1 file changed, 37 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index a1ae8c7988c891a11f6872e58d25e9d04abb41ce..1e08e26892f7b769b75bb905377d30a301e6631c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -15,38 +15,43 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,qcs615-qmp-gen3x1-pcie-phy
-      - qcom,qcs8300-qmp-gen4x2-pcie-phy
-      - qcom,sa8775p-qmp-gen4x2-pcie-phy
-      - qcom,sa8775p-qmp-gen4x4-pcie-phy
-      - qcom,sar2130p-qmp-gen3x2-pcie-phy
-      - qcom,sc8180x-qmp-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x1-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x2-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x4-pcie-phy
-      - qcom,sdm845-qhp-pcie-phy
-      - qcom,sdm845-qmp-pcie-phy
-      - qcom,sdx55-qmp-pcie-phy
-      - qcom,sdx65-qmp-gen4x2-pcie-phy
-      - qcom,sm8150-qmp-gen3x1-pcie-phy
-      - qcom,sm8150-qmp-gen3x2-pcie-phy
-      - qcom,sm8250-qmp-gen3x1-pcie-phy
-      - qcom,sm8250-qmp-gen3x2-pcie-phy
-      - qcom,sm8250-qmp-modem-pcie-phy
-      - qcom,sm8350-qmp-gen3x1-pcie-phy
-      - qcom,sm8350-qmp-gen3x2-pcie-phy
-      - qcom,sm8450-qmp-gen3x1-pcie-phy
-      - qcom,sm8450-qmp-gen4x2-pcie-phy
-      - qcom,sm8550-qmp-gen3x2-pcie-phy
-      - qcom,sm8550-qmp-gen4x2-pcie-phy
-      - qcom,sm8650-qmp-gen3x2-pcie-phy
-      - qcom,sm8650-qmp-gen4x2-pcie-phy
-      - qcom,x1e80100-qmp-gen3x2-pcie-phy
-      - qcom,x1e80100-qmp-gen4x2-pcie-phy
-      - qcom,x1e80100-qmp-gen4x4-pcie-phy
-      - qcom,x1e80100-qmp-gen4x8-pcie-phy
-      - qcom,x1p42100-qmp-gen4x4-pcie-phy
+    oneOf:
+      - items:
+          - const: qcom,sc7280-qmp-gen3x1-pcie-phy
+          - const: qcom,sm8250-qmp-gen3x1-pcie-phy
+      - items:
+          - enum:
+              - qcom,qcs615-qmp-gen3x1-pcie-phy
+              - qcom,qcs8300-qmp-gen4x2-pcie-phy
+              - qcom,sa8775p-qmp-gen4x2-pcie-phy
+              - qcom,sa8775p-qmp-gen4x4-pcie-phy
+              - qcom,sar2130p-qmp-gen3x2-pcie-phy
+              - qcom,sc8180x-qmp-pcie-phy
+              - qcom,sc8280xp-qmp-gen3x1-pcie-phy
+              - qcom,sc8280xp-qmp-gen3x2-pcie-phy
+              - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+              - qcom,sdm845-qhp-pcie-phy
+              - qcom,sdm845-qmp-pcie-phy
+              - qcom,sdx55-qmp-pcie-phy
+              - qcom,sdx65-qmp-gen4x2-pcie-phy
+              - qcom,sm8150-qmp-gen3x1-pcie-phy
+              - qcom,sm8150-qmp-gen3x2-pcie-phy
+              - qcom,sm8250-qmp-gen3x1-pcie-phy
+              - qcom,sm8250-qmp-gen3x2-pcie-phy
+              - qcom,sm8250-qmp-modem-pcie-phy
+              - qcom,sm8350-qmp-gen3x1-pcie-phy
+              - qcom,sm8350-qmp-gen3x2-pcie-phy
+              - qcom,sm8450-qmp-gen3x1-pcie-phy
+              - qcom,sm8450-qmp-gen4x2-pcie-phy
+              - qcom,sm8550-qmp-gen3x2-pcie-phy
+              - qcom,sm8550-qmp-gen4x2-pcie-phy
+              - qcom,sm8650-qmp-gen3x2-pcie-phy
+              - qcom,sm8650-qmp-gen4x2-pcie-phy
+              - qcom,x1e80100-qmp-gen3x2-pcie-phy
+              - qcom,x1e80100-qmp-gen4x2-pcie-phy
+              - qcom,x1e80100-qmp-gen4x4-pcie-phy
+              - qcom,x1e80100-qmp-gen4x8-pcie-phy
+              - qcom,x1p42100-qmp-gen4x4-pcie-phy
 
   reg:
     minItems: 1

-- 
2.34.1


