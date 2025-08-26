Return-Path: <linux-arm-msm+bounces-70943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39855B37229
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 20:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5582C1B28009
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 18:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E4136C071;
	Tue, 26 Aug 2025 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDtwhsfl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A192371EA5
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756232507; cv=none; b=YpwC7BcV2Tac3vQIzq/bv8/5u7Y3TIyOi+9drjJhCnY9w2a1DY2PwNN8iOMBPje9T4ZlfWfAVM5i92kyoX94lCIaEEG/P4o5UEvCYWjmwqi0lppIzafQDETSwfheZsXzDXiGFErjB86PJCtj6N5+OncjMncljlBtzMMqSKF2GII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756232507; c=relaxed/simple;
	bh=bIBcAYpVmFWgxOVMtIDqpSvu09YY+NiCzJTZkWhGL/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrFhX1hsD2261MZVLDNPHVzKsSogxDTOkSopPKRGs7WdRVLx0s+HYiw4Bu02Tj2vs+4bpFJUeAMueAY3yTBHC3PkBliBeR3FOk7eMbRoNMZNT4z4/1OydNU1KERv1OI2MEPPL2gnCgUV05ZHl0U4WINYaIpIXrYHr11AtvLNqIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDtwhsfl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QDBIUm021029
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZqG1x0C2Vi/fvgd89OKAZucnUy94PXEwuDfboAV8Cbo=; b=bDtwhsflUNbP/o1x
	AcazB4a+GFs2pD7dD1h643kybLc7UWML5+gP/pqDzrZJkHT/NT39fg7Txeo4Gmrd
	5Y6NCTSYnmiN2/j08mr3GzApkHBH1X2C5RYcSEPka/QWfI+4wOzaBX+irOdKpI7T
	L8hSmKTBmlHaZeVS+fl+iU6mfh+eDj0NORRBziAkCj34ta5fK7AyiHNmuTqHSBpz
	PLuT8u+9aNDOOKZwL9dC/Uq6NYE4h8Yaf0rUoIJ98GM9q6w2lXn8ofOVXRJMpJum
	UGu9QRGpdCAAeIs6I9p+jLlVp9sB8rWFVyTbuAIDxVwsAeJbmBNYCRst4ggNLLNV
	xZCYQw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x8a1d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so5901292b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756232504; x=1756837304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqG1x0C2Vi/fvgd89OKAZucnUy94PXEwuDfboAV8Cbo=;
        b=bo9TWezBiG/tvwOY5HMWr6hrk2DGboknqsD7rDTsvcmGvjfJc0JooUsAgMemxzUAB9
         +FtpRGdTu9Q97+BI30Iur3HYdGLqghSc/JPXhBkNwervn7+k9mwtgHsfaz5cxrpy6PEx
         +h18dL2Guo1hq9tvlAqlQGBxjjUfaH8oXUyhXlGFkkKHsoECsgfxc1Vz6XJkHXdD536r
         gOOW61W1AGJ55tNspoaMnsBdQuJTDovBoeF5VXHqLgEqsYuPmu8nG8/AlQ0FyWTU3ul0
         isQaJ9cJzFI9HTtOeprZ5cfiGseeTluqcT5ja9qbSiwqG1g0F8j+QizYM1+1ak30tEJE
         /lyw==
X-Forwarded-Encrypted: i=1; AJvYcCVwtgSr5ITyTN2xtebthw/dd/Nf1REde8iy411HnBtL9YCrFtLO1hPUrOe6FvSS1ioHJbJWvruyxU9Uwltx@vger.kernel.org
X-Gm-Message-State: AOJu0YzYgmUsHkmMSc/5cfCLXfb1Pnx7VszWNzY64TXmvdK4M7ek72i5
	6xRBPiAlSkbGohaWhmNDIMMIgbYdBBF8NpjVaZqrD2b1AAYsU8kJGWHArbWtXqx4n2DjaG9eKtz
	x66ETteQ3Wcj0wEsc9aRmtYRgOhUnrad+syP5nsiGqiX5Uwn7+unGJU0EQa8PXEF3ag7h
X-Gm-Gg: ASbGncszKmCRcEDtjce6QlM8OB/iHe+gc2DRdPw0t4X7fkYGEcbLH95GooBoqErBibt
	SMz3U/bwk7IaXgBRGwkB0J11uEaA292KzWU1wvsKBP7wVD8Xz7WCZFJTaxT2nJlbuuLADmfHy1C
	6hALTaZ5VbEWg30Ia1RAf+hxajrMkbuRxIY36henbVsvo0IE0EU9iS4vNsjABNPDaudlb3XXlNp
	X6t/3q9MeTVKIcLMLvEm0QrCYJu8cuL0esumr8uzcz8HNDweDQeiVL+WR9I5nyJigEtM+96xSqH
	2mRI2k28M2Jb7TWev41TKfVRDVd2DjpVLid/45OdZs2UXT+Q5aN/koK4i+FKwDo1KuYX
X-Received: by 2002:a05:6a20:7495:b0:243:78a:826a with SMTP id adf61e73a8af0-24340dca336mr25779263637.48.1756232504003;
        Tue, 26 Aug 2025 11:21:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi/T/3A+ZcqC2AyUm9So880Y60J/r0weCuRK5mB8bTebqwx94ASLUPJmyFLFQGaQpDcSY+eg==
X-Received: by 2002:a05:6a20:7495:b0:243:78a:826a with SMTP id adf61e73a8af0-24340dca336mr25779228637.48.1756232503505;
        Tue, 26 Aug 2025 11:21:43 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77048989fe6sm9881803b3a.51.2025.08.26.11.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 11:21:43 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 23:51:03 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: lemans: Add gpr node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-lemans-evk-bu-v1-4-08016e0d3ce5@oss.qualcomm.com>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
In-Reply-To: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756232476; l=2037;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=40OWUv9iedJbCp6fZ7M8XF7kvnUUAqEsRqjGx3RvYOU=;
 b=y6s8OZMnYzKwwtVKaCt6Eoe6yyzw+1yqHwQFGnEHHe+s9/+8MtfFNQGbYa/ABeAkLkDe5ZYZp
 WUnLen66DySA+GDKrVSluY8ZYNI9Fzmrgkbx8xGWSauNgfqCD6xGISL
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: FXGkqXo2o2aYzHwBuTgGYBH5Vs9jziua
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfXzDzvfg0GOr0/
 WGE8Rm7PbaxUQ8rVc+yJK7dcfd1IA8w8IU+BngtifiheqRHAusdKMe98Bl0cfFX2jLH9aEOA0QR
 pIZyumemNymZc+2V1AEaSn7yqVhQgI0tMRYJkaeaTwkGOB72qI0hAjo7Ryspiug2gS2GHxLobQw
 C3//7mnWISodlQEPnxLn4U1D3GvgQJQ2fAgkupGYsdQCievZVwGEkNabNt/VgJA1f94RQyPzX9U
 yicz03++RX5Na5+jICxBcl19EfKWVVhuhIHTlPtfQnrt0dQgB4pt1M3kMKTlYZHAMEO9wMpMSHM
 +nlidqieMF/avGmpLln4hSwp1dlG80TgFHCBYpRoli+UWg0utYWnTmPpzlVeDIhXjC35X8cl8vc
 tQGMZJEz
X-Proofpoint-GUID: FXGkqXo2o2aYzHwBuTgGYBH5Vs9jziua
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68adfb38 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vHYnVJDjh8PKMNTngWAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index a5a3cdba47f3..28f0976ab526 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -6679,6 +6680,45 @@ compute-cb@5 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x3001 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 	};

-- 
2.51.0


