Return-Path: <linux-arm-msm+bounces-51651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D0CA65B5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 18:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C115F179A32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 17:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA4F1F4E38;
	Mon, 17 Mar 2025 17:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgMYlpOR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDDF1F5848
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742233517; cv=none; b=hPfSORAep5FUSR+zkMP+0asIvoh0oGjyrtI8EJaypFA+2K5rWOkv02rZIBoBgKCf0FkvjnMdnp4+WyZm30zbSZwZVn3rS8iW5YA1gV7sAeKdWAlnOfjz+jCKe0pfaMZeQsiOYpJ/bCI6hzu/XViC6yQ+rTGlqEWqPOZx2/R7WjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742233517; c=relaxed/simple;
	bh=cXGjXqVy8K2SBVw5sm4rAWVu9NhYJGWmhFXtjX3HVog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mhb5I3OA1MwIXd4FWZsKHBebiAcNSM0FnLoOu+Dly8jawsQ8Lsvr6/C4gBHVs15igzC48whw8TiDluHpuby0H/Pl3e5B3QhpFFq5XlhXf49NN8MLWeKoFuQZO+vG4oWQJXS5lVNfLa2GwjdoRXcvLoVFt8/rQZhc82duGCL0blE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgMYlpOR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HARDaB025388
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 17:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIfQsL2iT8Vojwl752N46gCkIs1NOpwnmBShRu8QyCE=; b=ZgMYlpOR55GnVOj7
	fBBw1lk7w+B7mvp39telgV+7q2pQ2PgqVjVzXtvUHuFv2X+p/o4RZTEAKRXocECB
	ouNQo9rS21GzhPkEMNKwjVqfOfkap4OXbFtlcbHuuGwXpbff0bL8RoGIqYUWYffl
	VesEkk3UAmA6qS1hkg7D/KP3uLro1YHlVnRcBzjTUlGr36Od4/oyTrqPUTo7ybeu
	5C8BjLXr4FAE6MEDreSJFznvHEvyZXbf2qPt3sNM01kf23hTZUJAuYhGeQyoilbq
	nptJ7e7gd05Gwk1U9dCvMPpc2+4MVfShexwxSygP58byvgNeiVs6oybcssCU50jA
	PnxU3Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1t4nhun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 17:45:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f4367446so58613566d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 10:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233513; x=1742838313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIfQsL2iT8Vojwl752N46gCkIs1NOpwnmBShRu8QyCE=;
        b=H81vNkF5TzE0Ax2VGe2QU5+PNb5Gm1Bk4YVQKpkwIQjLxYtzF5evHiJjr761CJC3RS
         Wd6vRQikDsJPkpoppdZwgXcp0jD2YQOkylq+mJaK5RXhTzHWo9ZQFcMASgYhFRDH3PaD
         Vn1s2jGCSNvYs04d1+fQkrk2otpfxu1ajJVW7TMTVhaJo+W+eTjh7t+4VWWxFjZxr6IO
         LuCdVVSEijbApDqampUSYY5FNJsv9MaaM78DgIUYmGk4Dp6Y3GgBICULCywHAwrI+c/O
         yTEj5rgdkap8IyTKMJwxsxndrythErp24VBpYF8XJ10GyL2nldz6H5gBFaHr63ihWWIF
         c7Cw==
X-Gm-Message-State: AOJu0Yy8PEUcoQTThzVMgHKF56JLwfZ87ASy+U6GJVYk8+2rPIEij+W9
	LGLOtzWzxYADseMiu5uSS7Akp2DRl0ZuklO8ZL9hAof62EojrYnGiIrT0S4wVxOuBfdQgAZzl+I
	7RaJH9AvIC6WwvwBmvV0O6kRHmxqhD1dBRAIDAn0pl0Je5wP5H/V4GxwIrIQ4YBD1
X-Gm-Gg: ASbGnctVUU076IY37WXSFi/ru32IMKNE3rR7NX0Mzr9eU7WP9/UpiMvlA2kbcB8jaR5
	ltvOhWmZW/1QLro7NHArBPA5dP2Z+B3FcRXYEpY2LUnNYFAb9gMSIRMu7kJEoDM2tq9ii2N8FzA
	QWc8msdUuNf3LxraVPO+A5j88Po5fiC8KeGbQ44YNzhPjRX2YLWv4tgunJ0v5fxfsG4G4I7HL3h
	PgicTGxDrjdzyNZCrEmwOFnOy/rsKs9G26n0tVe96LdpzIIF8ZNlDuCDmbW9GPJCadxpvVCkJzb
	dKjn4twDqNHdF2iU7iIbFFJS6ZaMV6UlXivgVUM0wheeWvQCC4qhQx+Y9s4/Eg8U5p92pCaTPgz
	RQ6+awWqu7heMVImsUnTe18yEeYBq
X-Received: by 2002:a05:6214:20ee:b0:6e8:f5db:d78d with SMTP id 6a1803df08f44-6eaeaa5a6b7mr224159376d6.23.1742233513513;
        Mon, 17 Mar 2025 10:45:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYgxdPJBjLMewB5Os7FteoqkvzgM2ai7zlUrwns9EoES+m5mpM+FpX3PxuwQRQFq5RiVor7g==
X-Received: by 2002:a05:6214:20ee:b0:6e8:f5db:d78d with SMTP id 6a1803df08f44-6eaeaa5a6b7mr224158606d6.23.1742233513034;
        Mon, 17 Mar 2025 10:45:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:45:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:44 +0200
Subject: [PATCH 9/9] ARM: dts: qcom: apq8064: move replicator out of soc
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-9-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cXGjXqVy8K2SBVw5sm4rAWVu9NhYJGWmhFXtjX3HVog=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+Hk+AmZlISZmVl7Lpy8dz0TRbk8xjIClt1/
 8vj+7Cr/ZSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhwAKCRCLPIo+Aiko
 1QEOB/9oIWXP9+8fWr3P541oQaJjWj4TBJmLvCUTleczJ/+JGOLGxqemoc3v7V0oXDhOpswBqDi
 WEt/pceqTFyCcwIhooUPzKq4CCjbj2bA710wPPkkSzjyZkxMltoHOB+Z1SDWBd9Tk0hjZX4WZC0
 YYPrAUbnKPrcDFPEKpM2Z8Xlxh4xLbwPKvRBzcrWeqCzqgszf/LSY6/OBCWBYJo++JPbPUSDDTj
 wJMCFMNLkg+MWXK0ssjlsEKwEcJ6rlAb6REz/gRwhXTv/XWHUS3F/NwyAykfJ6BPtCR6Lq42bvK
 BndmfW5J9cf4mJoWj1QPk8q9wYriamZbAm+lwV6u1T3zYgbR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VLPdn8PX c=1 sm=1 tr=0 ts=67d85faa cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=VZa1NNXYgzzwgHkDN88A:9 a=QEXdDO2ut3YA:10 a=usmIGj8zAoogrc2OpcRK:22
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: D0mceKqtRkze_5pVZ_U5GrYW1KYJ1nBs
X-Proofpoint-GUID: D0mceKqtRkze_5pVZ_U5GrYW1KYJ1nBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=850 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128

The CoreSight replicator device isn't a part of the system MMIO bus, as
such it should not be a part of the soc node. Follow the example of
other platforms and move it out of the soc bus to the top-level.

Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 66 ++++++++++++++++----------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index a106f9f984fcb51dea1fff1515e6f290b36ccf99..acd94f3ba0350c5dcdd8f80885ee643d8cbddac7 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -278,6 +278,39 @@ scm {
 		};
 	};
 
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+
+		clocks = <&rpmcc RPM_QDSS_CLK>;
+		clock-names = "apb_pclk";
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				replicator_out0: endpoint {
+					remote-endpoint = <&etb_in>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				replicator_out1: endpoint {
+					remote-endpoint = <&tpiu_in>;
+				};
+			};
+		};
+
+		in-ports {
+			port {
+				replicator_in: endpoint {
+					remote-endpoint = <&funnel_out>;
+				};
+			};
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1529,39 +1562,6 @@ tpiu_in: endpoint {
 			};
 		};
 
-		replicator {
-			compatible = "arm,coresight-static-replicator";
-
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-
-			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					replicator_out0: endpoint {
-						remote-endpoint = <&etb_in>;
-					};
-				};
-				port@1 {
-					reg = <1>;
-					replicator_out1: endpoint {
-						remote-endpoint = <&tpiu_in>;
-					};
-				};
-			};
-
-			in-ports {
-				port {
-					replicator_in: endpoint {
-						remote-endpoint = <&funnel_out>;
-					};
-				};
-			};
-		};
-
 		funnel@1a04000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x1a04000 0x1000>;

-- 
2.39.5


