Return-Path: <linux-arm-msm+bounces-71987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11427B43487
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 09:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964431C80F9B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 07:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859A02BDC0A;
	Thu,  4 Sep 2025 07:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oqUBqmAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7AC29DB88
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 07:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756972156; cv=none; b=W/FCuDZXtPzkF2FMLZ2JeQkm6xeSKwjN8RX4/0klvPnj/TXXYt8kBX2JFuBV6qUto/gaXYgN9z2jUH0Q8n8UcGFAmSUU5vAlMRq1FLTBwsg1P/XfHDW/WWpFUiv/g3QJHWAGjnG6BXB6OyCAfGGfb3jcDJcLJUJR85CbGMZc8xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756972156; c=relaxed/simple;
	bh=ES0C/eHUJ0vZMSiE7e9k3eopudAsRoEFpDfAJn+GlGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BcNqxabImDAFSrBzQuaNrz7ZC3X3LALiF5Qp/fEFmYjW8ookHwW/qzXo0dE1uNIZ4Dan9UufExD4EQnJ3u0rVKFbkxT3wuQVOX82PpxgYLmQHW9v4+NSVD+dm2VK4++V0DPqdR0F0kCGBmcephkpiqx7HxEWu/LXcCxMah+eGv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oqUBqmAb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840lpcl005265
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 07:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWgEnfKM2T8SN4ZowpfF7xlxhdEVJCQ/+pQl9CKBY4Q=; b=oqUBqmAbYvjzY4to
	H2OaZVo+EJMQndkcmMiujq+3+/CLy2NJGNqn6FHALGy2eF7m7mxCxL2KpHxO4v0O
	mmEpQmoD8lbvV5yZSlQeRAvpOX0ANDwjSI917fMlntMczD8plpW1LqL5Z/BL9PEt
	9WCyirBTkuycr8/1gnQhgE87quDrjy8qa4X73Dzq5ZK5e1bM7WaL9X6fc5/3k+D7
	wW1RfoqKcLXBlvH5aTIj7pV5GMB1V7dhx+g4+RSecFcsQ9e+FE4+NwLbHnvFTu6E
	wx/zy8PZDb0fSQq/Le/T0AOTQMuZ0Xywo0Oo71jdXK7lUMKkQOoJ7rhEfFxVF2JC
	V0WOrg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjpm8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 07:49:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581953b8so8931775ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 00:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756972153; x=1757576953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWgEnfKM2T8SN4ZowpfF7xlxhdEVJCQ/+pQl9CKBY4Q=;
        b=QMR1tNkz2J6Ln+4WYpS5Y/39k8E4DPVLPWl8/jU+hmCUThgwBlv8YUTBOgZYPpFTLt
         QqJdRA2N/Q5mFeaGKM0yC+WGiQegrJd6oq0H2LQIgOgOekKXwL/hbQcwzSH0lENQyyjL
         NOcmTC+2WVvearLuONZNRgppkCk6PompzQ2E8z8g2SaGNzR/sbe1lvPt4hitOXnT5Xtg
         neNWJC/VlkHDvjJ9pxFYqC5X8uDWKpcpvW0BccCedaFZSrOTbyJLC187W8i8qya4WcWH
         2dOxPYnX9STJv4w9K2Fbvqui07KEfXveulWF5Hdwt1fH7ruXukYQFD6JUDQoFrL2kQWP
         zTVA==
X-Gm-Message-State: AOJu0Yz5esHG3oAWCM2oCndpY9tRh+xUhBw10eW5UtT34mOHTxxl/a/r
	Sdgy8vR4wlScrNjL0xo2dreDjBuGuWCyzFElRiE/jqi5KepttwbsL3A2GXCPTB2nOXOiQwAGXZL
	VmIBS28UKOT4okB62xFmjupOZVD6+zWMbiF1j8daYUNaAtVZImqENsnFj1SOjWEvWVlP4
X-Gm-Gg: ASbGncsh7wjkvfmWPn2nN/wiZG1WECX5DgCP95TvxL8cu1TxxJ8EwinSs2bhrr/nlZR
	yZWltsuOpNfqNX/J1r75jbcpC8sduJtjfYexZ6n0jR9XdUenQiWVe4+n22FFYiqZ6pdmqhk6dNJ
	u1Y+NQrjtquxH5NKCX5EzoAas2DRQ7Q+8VEjdgIRenVMQSiwIf/5+9JomtEjEIZukGc8r2wWoUs
	eeCJQsiwJOpMFNc6i3/TJ4T6Xl2DoQH+AavGqrKCA9/F7Js3O/My2rswSMEzxVfFy6/AGaTnBWI
	aP1/iFJudIO26QpuvJcp2MXB16rSDzoxIK2uECKEu4p/Jfc+D6X2Hn9ICGXIsOJjt8BOIpBWNLE
	gSlKiyTaQFSuWngqU4sIyLRY8NDpPuZXvKQ==
X-Received: by 2002:a17:903:32c8:b0:24c:cf7e:e48b with SMTP id d9443c01a7336-24ccf7eea02mr8148985ad.8.1756972152672;
        Thu, 04 Sep 2025 00:49:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9jqm8hZ7eobJ5rdqP6nJIGu6TDdPi9+/1PLXXMoBnIiAyw8MT+BFKlnVFqVwgqYqg5L730A==
X-Received: by 2002:a17:903:32c8:b0:24c:cf7e:e48b with SMTP id d9443c01a7336-24ccf7eea02mr8148675ad.8.1756972152159;
        Thu, 04 Sep 2025 00:49:12 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249065ad5b7sm182194525ad.128.2025.09.04.00.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 00:49:11 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 15:48:32 +0800
Subject: [PATCH v9 1/3] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-hamoa_initial-v9-1-d73213fa7542@oss.qualcomm.com>
References: <20250904-hamoa_initial-v9-0-d73213fa7542@oss.qualcomm.com>
In-Reply-To: <20250904-hamoa_initial-v9-0-d73213fa7542@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756972145; l=1177;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=ES0C/eHUJ0vZMSiE7e9k3eopudAsRoEFpDfAJn+GlGw=;
 b=nB8ww9lydz16Dn9sA/bZEdlI6JTzeEpOBjUEVVYuf44iAhXRqM6bDu0lK4udhiiNRjoQf+uc2
 TrZXfNKMu4UB0hela9f7a0at2+faIbpCh2kg28udj7IBHHlBI8o90bE
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b9447a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Bh1HEMNN3wmc11-eFpoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CuZLNqoR1b7Z_aBdYM7iL84WeM3O-lco
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX6gx5SM+A6IZ/
 v6adn91Lj5idQSP01rsTNDJ4tUtJUwMBqXM95osSlgHWiUUABQbdV3cWwG/G1ghpxsZ9nKyscQz
 7sb5JLzebpdRAkpoxC3yyJba5GMmBy70B+f7fIREcVboxtOMftp6tsXBgutZg0JAX7ywHW/0FAT
 OK+xalwBYq5e0vv/9k7oTmaLOlW12GeYYxj0SiDOHWHDTFUuf0U3EiIzfKxkFeyPNnJ5nld2y8G
 CJCQZELoqNJOqhH7hm03teUwUKEfxDMJKfjoOTodQ4FQBFYnAvV82CE+wi7jOg7wri1VOsU8JMf
 1bHoDAOlU+FRBzHSah65WpKG9KVD23h2hTOv+7RyzoXasaDitsdooXr8l5/4R59VWoKe5m1H1xz
 r3ZMyBPY
X-Proofpoint-ORIG-GUID: CuZLNqoR1b7Z_aBdYM7iL84WeM3O-lco
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Document the device tree binding for the HAMOA-IOT-EVK board, which uses
the Qualcomm X1E80100 SoC.

The EVK consists of a carrier board and a modular System-on-Module (SoM).
The SoM integrates the SoC, PMICs, and essential GPIOs, while the EVK
carrier board provides additional peripherals such as UART and USB
interfaces.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 55e5eb75af89..6b6503181ad6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1069,6 +1069,12 @@ properties:
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,hamoa-iot-evk
+          - const: qcom,hamoa-iot-som
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa

-- 
2.34.1


