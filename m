Return-Path: <linux-arm-msm+bounces-51648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F4FA65B50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 18:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CDC418987B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 17:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137F31DFD89;
	Mon, 17 Mar 2025 17:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4Cqq/sa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED521E1E06
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 17:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742233506; cv=none; b=ZkPp6DBhFhuCrLjkybRSnedNGWErYhEISEa1D+olXPcmZybxT1SfU+AEv43qiBw5/r5NzyR9/3YV8XIUh92HwWhjIzkwrQMYyZ9RGVklYgOl16G5UQtdYMJpLMrlvRQN8lsSHRW5qSeklE9GiFLhJxf3lAfTctdffZJuh3VXSPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742233506; c=relaxed/simple;
	bh=jexDBYn9BNqo5ubVBhdyniVFq50lVyAorid4LoYZ4a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q3A43jEYLNU2npaxuOg536sz9mOe2Fpr1bMsdo1ScLDsHVpyyBaVhyQQlFJjET/+dtAtfcVubMepACtj4H1/mye/uPBTnECTGonTPK8y2L/pOYsn2ScOhVYCM19UXK668rSDqgz3wnBy0B0ijqk8tZTg/1bxPvJV1G6A1aCdvTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4Cqq/sa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HA70AC020750
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 17:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PZ4TVLTWNx/gGQLOA3+7bg0q2y6wNvK2yyuXjQgEGjk=; b=J4Cqq/saBNeR6xDU
	KdCrWM3ZHY8mdkcj8vR59Q2rf5RCerBW1LVUBGyUnw7p5x5hwGkiWW0Ft3ULr7+i
	ui7YSWnnOTNLdtFFkles5Wx936lVAAv3SFsjtB/ZUxr6xYWv3cs4UFu+udQVBJZO
	beYFqSey1eR3oJUhDVaLAMgko4kGN5UmuXl2t2Fh1T/TwrpJqyx/BQRciq8azisX
	VEtchdXjufztadLVxnngZIRxAYbLKpKzkVsVgjyqonsQMmG/torf1UhCsof+Jn1/
	w8FzLXig7wzvX6FiSreKYG19M7m89rhcZjjioFTj6fjcyz73JUPQ5wC2/91mhUJl
	L6gpTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1s3wjww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 17:45:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4768f9fea35so126448401cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 10:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233502; x=1742838302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZ4TVLTWNx/gGQLOA3+7bg0q2y6wNvK2yyuXjQgEGjk=;
        b=jdkpgN6MkfK+U3t3oEYFfPmksztCsQ5pNAcTImbhoCT5VQgR/kWcLa7IK01MroKcd3
         JdipWpjkUqtnPrO9ofHifqu/+XDT0x0E0uSFvfLJ5wG5wNELbgEI2BS8n6bgOnmiVWM3
         hZP8BENCjDzLtXeUJzaWdHadGtDXxGVHezlFswgW6+mw8pSVuGFKxeujKxzO3t0BsGcq
         o/9dzKy2ppPtVpROKFcGkBznIeqhLcJZyR6LGNx/ZYPxXk0A9m3b5pdbEEUKhXh2cUyJ
         NEbx5e6fEDm7ZO0rW4B/uXk8Fbq0t87KisVfFw5pFpZgCX5pa3+NxgC06gLnaZA+K73L
         SjkA==
X-Gm-Message-State: AOJu0YzMHmu3FR+ZWMrG925YAe4ye6Z/ivtlbaq0zMT9vbhp8DGVfRKs
	f6mqLo+esqYYilJAuxyRqnjOBtdJQxXf/K0spdgGlA/ZJUXieAbhnERGSKWcan/mcVB2oUxxPo6
	oUxKgHSVp3ptYR9selwakMgr8t1g51JiWf76afgoTKtfI42hl3AyogfEnHC3dzfON
X-Gm-Gg: ASbGncuRPnPNp7Cmjqk5XnffFXVXLzYPIXTncw80RAePRjDjX6ixfw6RLsLRxuM4PTm
	QHjZxjimypEpOqffCUSntvVJ4r11wRYNrJqUxDRhq7MMfzSQwB0U2win3H2X6heqELfkicQBfSu
	9RAw7q+6URmv/hlK6H2k3Rlmz0rgyiuM+tr9/S0pssWck9+Ao/cIl3m7StUFblwuiCsZWDEp0AX
	p9mMyc9gjN12Dg4awBGqnVZ9tt/YHd/uSvdbBn35wkw5rfioGVUEjowvLwlTlSBnPcMwAFYsngr
	2yMaxDy9IcD5QnwBdMs+xvLmrUmKarTeEq1dBK/zUfBKWxBClaC+Q18r/1U3A8TovEZjLaWrAZB
	Oq/7dcC0K9kftE3NNv6VCx+gUTRo8
X-Received: by 2002:ad4:5f46:0:b0:6d4:238e:35b0 with SMTP id 6a1803df08f44-6eaea9fac05mr187988796d6.17.1742233502189;
        Mon, 17 Mar 2025 10:45:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbtkhZoh7ZKjpQve+rs4/e9Pgietbgyg5OyGK6q/QtHdKWWg1YEVRp+W9jdcYyAx96l9bmHw==
X-Received: by 2002:ad4:5f46:0:b0:6d4:238e:35b0 with SMTP id 6a1803df08f44-6eaea9fac05mr187988106d6.17.1742233501747;
        Mon, 17 Mar 2025 10:45:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:44:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:41 +0200
Subject: [PATCH 6/9] ARM: dts: qcom: apq8064 merge hw splinlock into
 corresponding syscon device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-6-655c52e2ad97@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jexDBYn9BNqo5ubVBhdyniVFq50lVyAorid4LoYZ4a8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+HrvJahQkZGPwOjUg+kkUB7W4G48kd9aCWw
 r7W1ash9DeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhwAKCRCLPIo+Aiko
 1RTFCACyTCsSbBBguAPI+l9LhhuDNYE3CZwWSivzYEB+8936g5PZxR2jhNUfSJYvtsA7/yTN3EN
 etytkcTaqPPy14Y3mJaIxfR1Grm1XTWQaIRWHOY6s1K1RiutiCO98ZTLqaLIerm89N7XZEehCSy
 OcXVKt64FJU0PZIABwDELDc8yJs8DNqZqBH98+8e9Aw0DBFnKMJVLwVehz+dcp20QkHJxtmD1UO
 TaBEK9puloembdOTAJ2jlWX4HTi07+l4KPJ1sPmVREy3IUSRwOpslwJggxzH9h7003j1ueEAvUw
 HBoBovqszxUPCunPJADDKteSoyLz9dbcuNk/Vfs3ozzeykV3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WbQMa1hX c=1 sm=1 tr=0 ts=67d85f9f cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=rbKIQ1AqokDPPu1yVMsA:9 a=QEXdDO2ut3YA:10 a=FZlSnJes_g73BORgF-R2:22
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: vflL0JgSX6nnqoLoJ4S-k6k78p2pKaRu
X-Proofpoint-ORIG-GUID: vflL0JgSX6nnqoLoJ4S-k6k78p2pKaRu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=546 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128

Follow up the expected way of describing the SFPB hwspinlock and merge
hwspinlock node into corresponding syscon node, fixing several dt-schema
warnings.

Fixes: 24a9baf933dc ("ARM: dts: qcom: apq8064: Add hwmutex and SMEM nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e..3728875a5506397b36a4c0d6a5ad12c067bbdd8c 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -213,12 +213,6 @@ sleep_clk: sleep_clk {
 		};
 	};
 
-	sfpb_mutex: hwmutex {
-		compatible = "qcom,sfpb-mutex";
-		syscon = <&sfpb_wrapper_mutex 0x604 0x4>;
-		#hwlock-cells = <1>;
-	};
-
 	smem {
 		compatible = "qcom,smem";
 		memory-region = <&smem_region>;
@@ -305,9 +299,10 @@ tlmm_pinmux: pinctrl@800000 {
 			pinctrl-0 = <&ps_hold_default_state>;
 		};
 
-		sfpb_wrapper_mutex: syscon@1200000 {
-			compatible = "syscon";
+		sfpb_mutex: hwmutex@1200000 {
+			compatible = "qcom,sfpb-mutex";
 			reg = <0x01200000 0x8000>;
+			#hwlock-cells = <1>;
 		};
 
 		intc: interrupt-controller@2000000 {

-- 
2.39.5


