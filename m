Return-Path: <linux-arm-msm+bounces-80939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE08C4570B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 09:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AB443B108A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 08:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3A02FD1C1;
	Mon, 10 Nov 2025 08:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0qE3gZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaFAHx+F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ED824E4B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762764630; cv=none; b=jeKkouuwIavCWZLYDbkICqWJr5kkJd+Wt3zn0aakzzLG+fd/oSK1XLjowquLGX3cau/HFGmBrYcqXj5OYTiUeWNsr3Fb3KzVrf/R1wpDA3OniMIJSZK4U0tnLnzpMkt23AmefNBCAcZLFiEj7lzW+HkkrVYbGhoett4F01jPNYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762764630; c=relaxed/simple;
	bh=YQULvWXIj1x9ufK1mpHrkLVEKt4zYKeDM3h2lSn5UeU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q/g3qXp3tubX3LBob13UTcQvjVH3Yx1o3BBIBGvaPITNG66Gyh9gphnRZQXmaxKyNkPYnIaIV95odPaQpyfKz4fXLw+l9N8xrvYCv8p6OSu7+Jx7KDO6rAUMy0BAJZRE9Gu2rwYoJzxB0vTL1KxtqF+WUoHC5YvqapRtR0EyF4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0qE3gZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaFAHx+F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA8P5Hm1366351
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yKLzu85jaUL
	/+O5SNLEN/HKd5eW9ayVnpB/bCsypyP4=; b=X0qE3gZSkbj9vdGKgAhbvJEN6vP
	IP6m3az/i7vwxb4kBCM9JY76s3iKR1mTsi5+0U05nOPYDl+AsowD++fNAT/ptriy
	bDNm6MvWJaWzjw4eMKsoWKAAZP45hbszlimryfcurF/kJMSSUHheZmpea5FiVXOT
	U4fzPPTkrz0ykzXeGJSan70tZHB97FGEOBN3Mu1A+fcpQ0Ad5wTwU0YGtyGkpSSG
	zcCk1gGcg6Uj5uvAmrcJLOmghb7uKi7vv/SB8HzzafHxdaGFPV1Uc0TrCPbtHc6X
	aunJgDfyu1Vm3SUNGxrVw+hOBpnx6FxZpg61b94j6G3enGG2AZ7sLwt23YA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab2nxhb7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:50:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295ac7012acso15900945ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 00:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762764628; x=1763369428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKLzu85jaUL/+O5SNLEN/HKd5eW9ayVnpB/bCsypyP4=;
        b=LaFAHx+F6BIntdCquf8r+N6asRUwSS27tOhtXrETLumKJNELBingYRqMKiJFrC3Toz
         UPFOySLY3VBBDIjQG60N2vFO5LhT1ycqDo3kOsblD6xkQOa5LajoX1vN+UFoYBzdY+uc
         GwUfqW90vlbNsnkNg4jlssmEzig7OgiGkyiXXc5h9bpHzE4UPmVOyoEdNGBKM9AfkNjF
         HQbssrjFk3huAOfPYonMgWIIApONOyjyMPy9uY7sleXoX0+oc2mqzuriAWV8rnRpgDN4
         rGL6TUc0oVzWWNPZYHwK9OxUtBOz9Rg2eB1Cn0ggN6188USHpkWwnd2MZeB8Mb8DG748
         tIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762764628; x=1763369428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yKLzu85jaUL/+O5SNLEN/HKd5eW9ayVnpB/bCsypyP4=;
        b=b30MpF/VHtOFN1cN2Jj9zuUsIbDNM6Pe/eS9HFC+rStuDRsGpL0OApo/KXjTifMX0A
         e8/Xt0b683n2DyjETDTYjp7guAUP5CFq0bVWfZeycqZSmJGz3Gcfhv9bsNjGm1zmrZgU
         pK7kWOg6kIwBuLqwjn5yvMbssKxWLaE8aAbhKjd102jnMjntHqSWN57H9tWWIL7KLwWm
         /0Y96mz0PAXv1dqivYXRkVNeWYesIzgD2auPWX4j0FD7PZVfIcZchY76a3+v+0e9dC13
         FbbhBCa/QWw8B60Tcz0+H7iuMAes4ApSkreLZgtbBz10ntflGeNR/OQ0AupQ2+FKEhb+
         ZwjQ==
X-Gm-Message-State: AOJu0YzX9PQiUWi8vEW0hcMXu+H9NtpA+S5r2mar8d7yz7Ge8Hz2Z6Xv
	6aSv7kEMb1ZFtJCNh2Qd/GXrkJjZ0azao9qa9UubkZeok9/mioERjdQTMeJ4HR2r7oSdxfXG+BE
	7+05MFmTsh9WMV2TWdhgSidnmRGGe1gPveQIUknnuzTEzn7tc9J+i/zjw3HBogKQ1ttA=
X-Gm-Gg: ASbGncvSCTv1pQ5AsYnutBfsuGmK1P2gTWbQTxAr5K7gXakjqKLOJ+eDcADlX2gaZ9H
	OLLILEqUUSVUlwjUdvE8IUA9JoKiugx7g5/aQNDFvsQSEYZUqPcuI5TjFE0fnJWE6NCO0u6ZIau
	AQAJGrSgOHQKMkcmMpji/t18bgWDKl3pNsAVRqPEJzqqpY8I8ZHppVXQKHF2TNVewJDvs688v4Q
	hXJAfWQERvmnxfBGuvg/x2PHkXNjTZ+pDdHoSSR1Ifmn7Br2qt0pNgfD+BamqUvoZbaBqNyAPza
	Z+a0DJlyEuF7/8lbOY8fwyx35wyb0+rUdM72WmVw5KaVQzkip9zoeuSMFL3nPhPGmINs1cfD/4Q
	lTNu4l8pqypZZvb81ouvCu97hwhWvyA==
X-Received: by 2002:a17:902:eccc:b0:272:2bf1:6a1f with SMTP id d9443c01a7336-297e5657e71mr54355005ad.4.1762764627958;
        Mon, 10 Nov 2025 00:50:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYiDplfXjD6F3e7OdfDGmoNHYS8BiclFTivQKXe3d64dP2nibKnJ/RUAYYB8os1L7ydoFyuA==
X-Received: by 2002:a17:902:eccc:b0:272:2bf1:6a1f with SMTP id d9443c01a7336-297e5657e71mr54354775ad.4.1762764627483;
        Mon, 10 Nov 2025 00:50:27 -0800 (PST)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5f94fsm138691365ad.40.2025.11.10.00.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 00:50:26 -0800 (PST)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V4 1/3] arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
Date: Mon, 10 Nov 2025 14:20:11 +0530
Message-Id: <20251110085013.802976-2-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110085013.802976-1-sarthak.garg@oss.qualcomm.com>
References: <20251110085013.802976-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NWK_05d9Fa4-HKrlSOg6AdwmSOFrl-LJ
X-Authority-Analysis: v=2.4 cv=DJSCIiNb c=1 sm=1 tr=0 ts=6911a754 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AsSGxY1rZHGoL8xKvT8A:9 a=-28uLqxQgLFJUJnP:21
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: NWK_05d9Fa4-HKrlSOg6AdwmSOFrl-LJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA3NyBTYWx0ZWRfX7ePfljmW/8pl
 suZMy1qI22/oErD3te/B/k+odaUhqkkd22qN7PqbuD4uYbwWmi+lP3Y1SkeOsVE4WztRSQmT3Jr
 i1qFH7Yb44cld4XbKWS1ZdFexekRZIrcgocov+2+QbwxeLItHyHfjp/2H7LEfzycBD3fRNKAElL
 gua6J0YzoR+KdzQxfbntjeCxbbZmTxCNe4bdvTalnC356h2HgM/ZV1psZUmBR+RSgQ+wh1exgIs
 E1QSHoylgFXj/AcFmlDrxFOWiqSEJ3Opcv2k/RGS8SXJMbHRTGpxKwDRflVL7CZDFJEmCpo/fRW
 rkY+xlCBYmzV9AY12Dcyou4kwvcPUxVxCoBsIUoAuPs/o84owmFbeSn8nS8ucC5rFl+/9pb4dqB
 VMnBIgzan9KYcuORx4wul+Fbb/eAMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100077

Add SD Card host controller for sm8750 soc.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index a82d9867c7cb..95b210fbfead 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3482,6 +3482,60 @@ pcie0_phy: phy@1c06000 {
 			status = "disabled";
 		};
 
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,sm8750-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x08804000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					&config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x540 0x0>;
+			dma-coherent;
+
+			bus-width = <4>;
+			max-sd-hs-hz = <37500000>;
+
+			resets = <&gcc GCC_SDCC2_BCR>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		ufs_mem_phy: phy@1d80000 {
 			compatible = "qcom,sm8750-qmp-ufs-phy";
 			reg = <0x0 0x01d80000 0x0 0x2000>;
-- 
2.34.1


