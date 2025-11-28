Return-Path: <linux-arm-msm+bounces-83797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C13AFC9263A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 16:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DA09134B818
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 15:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2904C32FA17;
	Fri, 28 Nov 2025 15:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3P8P2oh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ClUN+unc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8CA32F77C
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764342124; cv=none; b=t+9pcGR8ZCfNCHBR4LQUXpKl44gwf3248LCqpWC2+O/stSujhaL4y0+po/yxVwRyG7kzIDtpc0Itt0GNWLPifweZa2ZAlef8idB3mK5716Z8sOivc1EPg00b+Tutg52gSMb1QFNI+QNou6Ryzc2284aFCfzbx8oKIEHgH0lroak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764342124; c=relaxed/simple;
	bh=UU33rsjB6cwkxiQZjs9flKSwaQBjR62L8vGfNNoDXYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=RrDAA4bTdihNkj3T37SfA8Y8a0k7Zjfyy5bjb9TV5eTeloIS13U8QMjO7PgS1/HdS1pWjabftauzRm1N9FUH3R/z0oasoCDkophj/jAfrfjpKvumqs3+CC8uDz7WvJa5n5BvkYUzAqykIMjPM5tHGsG7otJ1Hei1/Vg5FGCYtLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3P8P2oh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClUN+unc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ASEb0mw573913
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 15:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=poPZ6JaN1QNodsl/vhNAHQ1cQ2m75xykuLF0QgSfxXw=; b=m3
	P8P2ohFmef2Ja/2/+q2JtZ17oPf1GLNl6AP+1MiloBWs/7PLA6tOonf3L2Qxb2Q+
	dt1ZN5LVqBemcqo8yoDx+gS/H14NdSGrdizQh1I+koTHNnqb5smt93IuhY1bdnyi
	BxpTWQ+xC7xyAphoxOR7Ht6M3oiPzPa8bAuhJ/AcR0Q+4o/g+/ZjHc6SdaEUstip
	UQQtl4cDJLnLX4Qw2MjSHdWG2Gg8l2LuyHs9VLpViN6TVuHskGkHxRK6e4UiSJll
	32dTdZvI+36savujiuWiOg176qrNiEl2+Jm/XoaGJ74EyyMOrIzWii+yYgd0RN4f
	8+QzpG0G/WOQJG0lat6g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqdnfr21f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 15:02:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295592eb5dbso32681645ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 07:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764342119; x=1764946919; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=poPZ6JaN1QNodsl/vhNAHQ1cQ2m75xykuLF0QgSfxXw=;
        b=ClUN+uncCWDLkXeA04XmJfDkEkujYxacsuqEZqGIq3aQcr2i+/aggwPZZ3dqqc/gaw
         mkfI6m/cFMmJTF01sQA2CtGHjsZMKybWtVLimbxypp+fPRkrSAroI+MTxU9nVxluHoeH
         OHPJ8J3oMtEaHwY+OmdhYAL4J3rmTJ6aFLeC32d7YqOPTWKkQGAr9yJ5zmcLTzU0Zvx6
         HSZ6WWR41AK//dLT94japhGnEiJn52kRqYhwqE7vMHf3B3uIq5lIB+ce3ZTWrK9b4u22
         OIt+sj1O9eiQDToDln0gLLWsgNXNsR5ObkEfe5C2t27KDIWPuJWKt0uI5yAbd5vc2x3J
         OyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764342119; x=1764946919;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=poPZ6JaN1QNodsl/vhNAHQ1cQ2m75xykuLF0QgSfxXw=;
        b=DnzmKJtsgloAaszIj2bfBig0xo+y3ip9zLX+gMu+mfyVw3z/scwyPX0v7UPKhZtymF
         FJPsXAxw0j6ykrRBjvWVFLR+kSnzRaT3pAsilfP0E7BP8E4BSTAj4ggQ+3chUmgfz77z
         LlYSSINKoz6FUuPeDaihLMznoRTnxgdib3wS83ZaZXko8a1X0ep4RnjZuUwKJgmBNPP5
         nu3bmB65sj6gzhXKkGYSew53PBwq3VQ/UchpiTU7K2DJRdupcA0SgX6Zhl4NdsHL1L3f
         khY5YRwXeKt7WmWc3CpvUBciUA+Fh1uB4X73tDmcJ3qF7vjG5ZJpskgEXROJS3jeC3eD
         6ClQ==
X-Forwarded-Encrypted: i=1; AJvYcCXukhuCgs8O3KdU8193sebnXXXdzKWqb6vYziJ5NKnudrVUZGG1ZA7s6lq00nlU5w4XGcMv0B+Ox7JvitWz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzkn8fc9w2k2V3jJBEvWPaVTqgUsdMGXVHk+NX8yConv7fa0KZ
	GNVnD79dM7vsOIqlVXi7F5k2Np3YbvDZAH1ndrG4qhDWKYxVoErJDc2wC1smOLcBqJzynXM10gL
	mZRK4lykH1ZEPwW606mMeCxmbx9q8BIi8oRI83ZBUXnRX9q3S0L0GAxSedEAOZae89hZB
X-Gm-Gg: ASbGncs6AN0f8ptU+4KWGTWngIMBz51yfMn0eB7EkLZTk1ZuCXh13DViIijov0FYelS
	XZA+RzxYhCi4cwWiQ6NcMAOZF0lhXyi1c0uYcsK3sHpAzjv53l4rQEq78tDhqDy/VUBIj68kyew
	6TA4sqcn+DnYkceQauRxHZHwEzSmsxmHifQkN6dYTYtRyHa8rUrY3C5xOU4kSsOUBlffhMXnTtN
	2pXJ+M4+Qo3otcer4nsuJFVJQjbE5juwetAdRvtldHnpJ5wH0K5nfSxRPWz/tVa2WxJCa473VNH
	H6g3sXUuxaL2lhHORvvG4N3+4qsuYs2bs96poJXL/dNzwPg8KP6uETfkdlDzDoQmWoTrKEJDRhI
	7yLPI/DaAdnMmbCKnJHe6nkuVVhl4qDg8iksDbc+JnKw=
X-Received: by 2002:a17:903:2349:b0:296:3f23:b909 with SMTP id d9443c01a7336-29b6c5767d4mr358754255ad.39.1764342119353;
        Fri, 28 Nov 2025 07:01:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFW3/L7cLZ+hDAXvD8QfActpsccZMuajQkivaccixnsOCM/x9NoRUUj+OFFkquvpAv6OgjhJg==
X-Received: by 2002:a17:903:2349:b0:296:3f23:b909 with SMTP id d9443c01a7336-29b6c5767d4mr358753595ad.39.1764342118720;
        Fri, 28 Nov 2025 07:01:58 -0800 (PST)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb7cf89sm48930635ad.99.2025.11.28.07.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 07:01:58 -0800 (PST)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: qcs8300: Add clocks for QoS configuration
Date: Fri, 28 Nov 2025 20:31:06 +0530
Message-Id: <20251128150106.13849-4-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128150106.13849-1-odelu.kukatla@oss.qualcomm.com>
References: <20251128150106.13849-1-odelu.kukatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PIUCOPqC c=1 sm=1 tr=0 ts=6929b968 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lpgrqeBui4GLTciQF88A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: kZ3BmdPYSmiVhzsw9L2UfzM3h0msKrcN
X-Proofpoint-GUID: kZ3BmdPYSmiVhzsw9L2UfzM3h0msKrcN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDExMCBTYWx0ZWRfXw58L12gICHac
 KHIZY2yFcKZYPvBH34++146ns0AV5l/zKzIYEisixrYTQKodzqFITR5J2BtI1eLCnj/87Ie2b/Q
 42TZzLx1gDlm9RxpjQgBpcgSlkN6hwEXUzoA6+Sg71d5vMbte2IUZWsX1Jhn4yuudmNMKrq4mt9
 6cu8blDWzu3UWdKEwUmJ8oEVMo63GitvA33q57ortjbVUG9nKmrZQGhuV2+YbNVwn2i9jTRZpKm
 snvwsT7ZrduN1m/5XK8JLDmbOnbH2dD3hqKFm7qHrg4y7SsIQzRoRtX2gWU3zlF6yujlS4HrO34
 8bkI1uPdJLAw6QqMZ9glMcdZTRdDfJMpNfyRhrx1Tw2Z5XEKqiWPvOS/Cvg1RKjIMajILufBWW7
 9V8xboMVUbsX3HMqv9BIxW1q/hsghA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280110
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add clocks which need to be enabled for configuring QoS on
qcs8300 SoC.

Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 816fa2af8a9a..6139511ea525 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2226,6 +2226,10 @@
 			reg = <0x0 0x016c0000 0x0 0x17080>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_QUPV3_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
 		};
 
 		aggre2_noc: interconnect@1700000 {
@@ -2233,6 +2237,7 @@
 			reg = <0x0 0x01700000 0x0 0x1a080>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
 		};
 
 		pcie_anoc: interconnect@1760000 {
@@ -4560,6 +4565,7 @@
 			reg = <0x0 0x9100000 0x0 0xf7080>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&gcc GCC_DDRSS_GPU_AXI_CLK>;
 		};
 
 		llcc: system-cache-controller@9200000 {
-- 
2.17.1


