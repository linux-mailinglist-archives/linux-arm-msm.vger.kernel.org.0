Return-Path: <linux-arm-msm+bounces-76305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD51BC3538
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 06:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C2DF19E0D89
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 04:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C6C2BE7D2;
	Wed,  8 Oct 2025 04:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NR/lVYcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95B019E98D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 04:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759898353; cv=none; b=dZj9KciK33wMgZoH9zDc8J6ReBri4TB/VVNfnViHzDZM9Uubx5wiISxRi6glKcDiN83XDubs8cJelqxQWiG4ioKiU0KMwyvt8//bExN/5yNQMAw2kHVkJpmzut6eywNtk5pzcIUL/J8TYZaicM1kRz24J6kuYT3PN+k0dAk89jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759898353; c=relaxed/simple;
	bh=hht37/NDv30Oa+aKyOzANv89mcoO4/sEWwQ8//dR9A4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=me+hMmuIqluGb1JDkjpnYP4mqKg3X4LHKcgFtDhZkci6syh8DXPjdF6ezDIqckCITIiWV6TVXPpO5gtv9t70PkTdomWfIk8tYpYfEFOodzzLqIpgx9vPmgflaeGq9bjGuwQ0i2jOdffwiF9dlmJ8ZBY3yT/cmBHjXpEoyCCBDQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NR/lVYcG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803Wnv026381
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 04:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AM/05eypT4oTiP4F+74Cml
	XpUKAPm7pgvBzvSyCTRNE=; b=NR/lVYcGCCSSE3MiQ8/j0if27BExIldgNfuBX0
	Pdnr3BtB50ukEbKZXpsF4nXk4Do71AxhRsbO6Dco2tfuox+WYA21V6VYrrUc6mZq
	DCIHKpmW2BdwoZ0Uoy51gqrZCWxNkL/z8BTjtgoggRF2Rw/F+BlMTjs21VPpRcji
	DsD/n5Xx2dzQo+Fugoot2wVDZGn9Wm3clUpiQsbD/hCuQV3F6v9IUfMTgLbI8q/l
	WgHVqX7tsLPwpvwQOatqTFgwKqD7iPPvKsTugH9xf8BgYkOGagNBbxIzRTlzSNrj
	bhXex+QNo46SrCR18HDRLEGehJqTJTDt7/PBlijyfEzH4sMw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1s9kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:39:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28c58e009d1so123243955ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 21:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759898350; x=1760503150;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AM/05eypT4oTiP4F+74CmlXpUKAPm7pgvBzvSyCTRNE=;
        b=k7p/kHU3tTh3FpLJi1/4gg4sSR+pJb7xwk40uGVz7H8+rmUA+l4CTFAhX3cDNx2sxs
         TX65brOHGCYVIvn9EZUw6Hr9PXg/DzmW2ZgE45VvloN7OBqwSRrCXFMiV6oCfARGyWwM
         IB2jdAOjCh2jSUn4/XPiLpBgDHMLE8mviwlWYAHzDlH6Fq9HqJC3vS5rfjjDT5Zf8DVY
         iWP3rGZQdqvzH24BNudmYQ4yrk4G0MbcRO9YcomAl6za4adZeA7t1HNEUkAxqdOUhh2g
         AjbwY58wGjEZxujBbum6UTYUd/pzhPkuj5J7j/Pp/dxxN8D453jiJ06Crb6+3GI0iiR5
         iR/w==
X-Forwarded-Encrypted: i=1; AJvYcCVJgRRPjQXFLfXRAUpArPPXWvdL0xs7g2NEUvRv9i3sTX4GPtPG+DOEloDfz3KwVgXtKyUHilTghcbGBgCI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy88VvMIlh9sJ2g4Yd/OSuZOKCDL593fNJ8bxmLvc3GSr8KCh42
	mIu4tTW9soWy0s11xsKSItcdwrsTqLhbYr26NxlOBogSgVZe33GWz31HVYZ05Gobpzb7fV1f1gd
	8b4GNPA4tQMhCKQNxnx2o0rBYLeCCXZt2aQkJsrJzgThJ0lYz+eRB8a5P+yQoMtgizqci
X-Gm-Gg: ASbGncvtpauIgIO/q4eEm16D4wMYcHrQO48XI5eBu5dlNNLuomyvRXkfuYMnSBy3yVL
	4yF1967GXRwGen50vFBa64IuNApSNwtuplPCBeLTDgl688KbiwFSoEteHR6Jr4/oSJzsQ7v+C1Z
	K/hZZuIYcT1/T2/PxjtxwkR9NCEsdbA39jdzSUgCm0jZwY9NvwelyB0hq6W/4+44g0N3L2nkBML
	3wv278PYn3hO44aiZ5LCyUqSk6nshDMUSUY1YUNO52+PlBwdAZsrEXFHkCcFeD3aPuxCeG5S+H+
	LC1FbEINe5h/DbE3cws+/pqnFhDgN7XUGo+l3LTm3T0bdEsAdGOq/QsclTtu16M98Pzz9TK4mCd
	XmXQn
X-Received: by 2002:a17:902:f608:b0:263:b8f:77dd with SMTP id d9443c01a7336-2902741d0a7mr29918035ad.57.1759898350200;
        Tue, 07 Oct 2025 21:39:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/H7uGWT+kHZnZwRSf9zZG0Bfh3PNzBiXQtq0/6X7KXre7pZt7oC0KpTvEVEF/9JoGV3pSKQ==
X-Received: by 2002:a17:902:f608:b0:263:b8f:77dd with SMTP id d9443c01a7336-2902741d0a7mr29917705ad.57.1759898349773;
        Tue, 07 Oct 2025 21:39:09 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1f19ddsm184328635ad.127.2025.10.07.21.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:39:09 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 08 Oct 2025 10:08:55 +0530
Subject: [PATCH] arm64: dts: qcom: sm8750-mtp: move PCIe GPIOs to pcieport0
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-sm8750-v1-1-daeadfcae980@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN7q5WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwML3eJcC3NTA91kU4MkCxMjw1QLA0MloOKCotS0zAqwQdGxtbUA8c/
 qlFgAAAA=
X-Change-ID: 20251008-sm8750-c50b8421e801
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759898346; l=1500;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=hht37/NDv30Oa+aKyOzANv89mcoO4/sEWwQ8//dR9A4=;
 b=aOafIbRpHXZVyT85h7kCH8/o2BBLZarrtuiAavbeJ+RXNyCVIk7QvE5EG4Wxbk7ySAXrQ3zdm
 C9HgKyvCRKhBIjYyBbD1VmVxixlOID5tzfg7cl4SqGejCfRnTq5zSl4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 7D7qgchlmlvak27hlJHWYtnnMCAjAUvn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX54qKiUNocN3R
 dIH66whiGsNnEspCKjWhbd3hE5FRpTXKqs5uOt+Gb+Dxl4wnOUWSgaZHBSHgddPJeP91+c3SV5x
 ItVmm9dGu9C5apAkK7DwxAazpLi/4lo8EpMH8u/V34rekptfp+LXmwgdqvCSZM23eiHTJ4QDWl8
 O7NqMMf7ndRkChg+C8NFtLAvgxl7gDP/elvblWC+Ld0XcVMhMYsx+YKz6FwMRZ8qKwPV9IBBcDT
 eVOWU8F2qOs7OYp7A65wP8DQE/un2sIL9bVIHJQE1G+sBfvz8kpoyDQ5Bf+yk3JPFKzn6p7Y6OE
 2++xLDn9eU5yZ7uZfu+lBEJ1H4Uu8GLb/p7LmRUdzAQ3/0QNzXkbhF6/DOypzqSaroJD6GMS/C2
 aHueNUYqtBeXSos4bcBlttr7lmLScA==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e5eaef cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 7D7qgchlmlvak27hlJHWYtnnMCAjAUvn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

Relocate the wake-gpios and perst-gpios properties from the pcie0
controller node to the pcieport0 node. These GPIOs are associated with
the PCIe root port and should reside under the pcieport0 node.

Also rename perst-gpios to reset-gpios to match the expected property name
in the PCIe port node.

Fixes: 141714e163bb ("arm64: dts: qcom: sm8750-mtp: Add WiFi and Bluetooth")
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3bbb53b7c71f3c03faee02fc282fbe4bba9b0a0f..45b5f758156700bf916c4122c93092c68488c1aa 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -960,9 +960,6 @@ &pon_resin {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -977,6 +974,9 @@ &pcie0_phy {
 };
 
 &pcieport0 {
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;

---
base-commit: 0b8b9fa6c35e090950da1d2fcf5ab29b74cead1d
change-id: 20251008-sm8750-c50b8421e801

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


