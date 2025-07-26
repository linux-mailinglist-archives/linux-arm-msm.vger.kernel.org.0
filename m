Return-Path: <linux-arm-msm+bounces-66749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F1EB128B3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 05:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5141B7ABAE7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 03:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC181F8723;
	Sat, 26 Jul 2025 03:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMT5JU7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF221F790F
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Jul 2025 03:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753500725; cv=none; b=B2Qo7Ep68YgkIKzKXx1R+7RK6kDm6wnute5mT0YSv2FI9MXSCwlrgOCcOJnBBGOnwECIq+UajRpq55QFHRZnKSqHk7s+0xF0hNqmNBKezypWhOjLQ6/was5e96IhEtJQKfQSVx4SGuGdSwA/4t2IwqtV9wkjfOgnXvlSfQ5zLqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753500725; c=relaxed/simple;
	bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C266Hvf9r8JNCCoK29q0qnQdqiit8hDmJPXS4Mamg8mxU60iGpH0i4uLyDroTiDfckVM51p7bKEqwN7a40j2FihPsNRd4Y/tquhPNEuE2nNPjOH8xWSvxuT/mSt7FjTLY4a1QLRWhfqSYWYzzJwUv0fxNTXgnJTVD6jSgShN59E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMT5JU7+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q3W2rs021551
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Jul 2025 03:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=; b=BMT5JU7+OJ4IgIUi
	pGNHw37UW/K+S49N8BWEYXqhg2GzY1OJNPosJoSftnbPEjDHh9lecNTiKyXac3Ho
	W3FxD0/W8KJPCMAywtpzPWlvLiQJoL2veTbTmaZgQQBdPenF+S7KjjLRoHdBE9Dq
	D2W4vZpY2PgiXdnMRto5YhJfAVMzSw+Cjdm/2kdq4nUMwtZsSOb+C1wcWAGNwX6V
	w9sfN43jRwQ2EsVnt7Mln4OEa+HAi+/pYgoXbPrsF0gKvF7Rj96S2N1JU0WzdW7/
	+3GkeWaVSq/HhwWFYQpkM4dorkKPH+ny/mYOQ38OkwflLhfWuaAwp+DpGxB9uuV5
	zawS3Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm281dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Jul 2025 03:32:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74ea83a6c1bso1242499b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 20:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753500705; x=1754105505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=;
        b=qyZ2ujUdun1XLVFV7uit3G9cowKyIUPB+Y8qPK04bYZsXe9olkWaglthMavwTh56wT
         YcYauKKfypCIu430AQZ+p2pDJ6chgqFCik94z/+0kUEfpITkscUJb1EMyq0xY1MYTeED
         4UgTfwD7J0KczSPLHQdrovNDGVeAs1R8xYE+QvWp1JvapTegqXG7qsTgz2fFPEbnKlk7
         g1pP8S4hAfmm5JujssFYF1U3F/VACDTy7Q/IkEAL/d2duFbFlgzhsxb5VmfwecKk7rRl
         aSwFfhKppJYxc6bgXgs2KPcnA26M9KaRocgWA7j6qaqAhv+py7RTpvTnYIEKNURFBlmv
         xbXQ==
X-Gm-Message-State: AOJu0YwqnidTYPCu3SKyN01q6J6OBsYUi0z7ME41dZ3nkXLrra3Xnh+i
	a8hOaDew15bwzpODgiMoxKltB/TWceC2Tct4TLQCi5LuvlJfO5AM6vAt6l/0EhvpxCZaKynLlGR
	DRB7YQvOxy6tjok6l2peS54n30fFBHV7Em0Zhw0yhKLBGyGwiSYKF5wZNfna5o5GO1U8F
X-Gm-Gg: ASbGncvEB0Y+jb9ZTgCXJFqCbMdfkGkP34lviWy19ReIij15Ecc8OLked4ORNHeFAm8
	v5Tm9Rw+noTcxysBBil27igzPbDJeJ55fhfcUKkKAD5v6yECIqoFiAqso3CnZH8rTxPIWoJr8yx
	t1+cdfm3YjXRWoDeN1FG3JKZwXK/wZ5wYGZhnDhT+d1D0c8u0W9Sl7DyFQSHOWNrd9GN2JP46gF
	CaPs6q4smTnIRzKEPBSyLAul5ictqFUX20j497gK30zgoDGFggxqW6FjSyYGqYxRdwrI+C9TF/F
	mVWQfk8DoC0UmvTMGgrUXPRZFNxOFIflUh2d5oDKObaVAwfxNWqxyw0zGFj/4tiy71aGCAGA1aU
	GpgZ9CGbSFWvtjEXhz7LU7cbX4NnCsc7UAQ==
X-Received: by 2002:a05:6a00:2181:b0:742:a77b:8c3 with SMTP id d2e1a72fcca58-7633626dbe3mr7112518b3a.4.1753500705306;
        Fri, 25 Jul 2025 20:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9CpBOldzsPc7XQYxn6ooEk4Cyi0eUr7vpgo9SewKKFuiWYpZZUrxBuSeqFIqOwowSg6JdsA==
X-Received: by 2002:a05:6a00:2181:b0:742:a77b:8c3 with SMTP id d2e1a72fcca58-7633626dbe3mr7112483b3a.4.1753500704872;
        Fri, 25 Jul 2025 20:31:44 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640881f5a1sm724917b3a.23.2025.07.25.20.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 20:31:44 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Sat, 26 Jul 2025 11:31:30 +0800
Subject: [PATCH v6 1/2] arm64: dts: qcom: qcs615: add a PCIe port for WLAN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250726-615-v6-1-42b8150bcdd6@oss.qualcomm.com>
References: <20250726-615-v6-0-42b8150bcdd6@oss.qualcomm.com>
In-Reply-To: <20250726-615-v6-0-42b8150bcdd6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753500699; l=943;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
 b=gicAAL41NCEWm9ldVtMZGmp4iQo2zQ32Hf7OM5brjjSE878jH5mKlp/cz/SxraZ/wEwE+Sldc
 UM+bKlJXp2YD3leJw8p0WFGkmPHUACeUEZCT8TD/K7UqeYkKUqUrA8r
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Proofpoint-GUID: 3pcESZWaGZxWJ6Oj50DTaK_8E5ZRiLoj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDAyNyBTYWx0ZWRfXx6TW7vBHsFe7
 b+rNwpy1jcMQoNTI/eoci8ZFaPG6tXbJD2Jtl8zy48zH1ivBYDd8GIyQ5APBIGE6kyUot2h51Oa
 gbqszVk6ALoZrnk9PDxYYaxRSruJWwKDEY8nYBhMBuwT8MRK+Ktb+64l5YeCwq0EjrUGfUvYupP
 7hjCKyW2zdMsvCnc0Npsh5mEaJ1L0iAbv6WNBYQxSiXEUIUfZlKZfHWd/aoQPkJJ8Rr5S7ndkAS
 Flk73oAmJKDZcD96G3tjPDhdpyXGbgQE5UkZUMlfieuXCRMPPNR3y1Sgnk64nV3wylM7yTHgn38
 3+SQeA2dNlbQkN4TILCnRCZ1u3Zzbp/2m/ni1vPh6oHE/0Jf18/dh9rmYNkGIs1ocP64GlTmnPQ
 HaaPOn1WtbSff0SKmKUyKyHfy+K1uh8zC+Y50g3z1rwXhFMmBplIF5zjN3SCiOJmVt8Zis5/
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=68844c32 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dI-8CA4c5Xf8_vBnWYsA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 3pcESZWaGZxWJ6Oj50DTaK_8E5ZRiLoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=991 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507260027

Add an original PCIe port for WLAN. This port will be referenced and
supplemented by specific WLAN devices.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f4b51cca17de5518aad4332330340a59edfdc7ec..b4fbed517cde18e088096d182fe6b482363e403d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -1173,6 +1173,15 @@ opp-5000000 {
 					opp-peak-kBps = <500000 1>;
 				};
 			};
+
+			pcie_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				bus-range = <0x01 0xff>;
+			};
 		};
 
 		pcie_phy: phy@1c0e000 {

-- 
2.34.1


