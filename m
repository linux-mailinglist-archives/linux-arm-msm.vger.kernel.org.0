Return-Path: <linux-arm-msm+bounces-71901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E758CB424BF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 17:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57481188418A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D4A3375BE;
	Wed,  3 Sep 2025 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2q96UPF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F6432ED40
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912464; cv=none; b=Woh5UEIvPPRi4CslRy0IWr4VUhq9ETNVj4zC+vdyDrC2xpQoBtmHJDjBslVwehmAVdvLpSpg5T8oINGoTp/ZMDsvl6/IJwnl8DWsxhTotX13H+9cuvqBxEI1iCZ0+x4/8GBLXQP0SSWzpVJ41cbGJHZHzUyyW0B773LkZp/jmXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912464; c=relaxed/simple;
	bh=RabZyP1MYauqdvXLphTShP4sWVBSim1FNftYv5x7w4I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KYu7GiiFvucfDkaVJzZNPAqmtlgX3asQphGNGDrMnzXqk1cQAKACkNH62UZJeJq+pBtrWM2PEd/iEUnNoMQkkz0zhkOywCBkJkpK4ctaxKsRh+a2C3TVKO9aY0dxDMDW+GvxROQX0hQtTQo0glJSvxZSbG88F03hPOPUKGSauTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2q96UPF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx97K022320
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 15:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zrzVp/Rhi+s
	JKmcSPdWp/qY7dG+tv5mT9DlcBZ2BsY4=; b=P2q96UPFiKiiFh0Rj/IGpgoXzUg
	r4wRG6YFZu2J40tsdgbpx1Geda0qi4s0VsRk48TOCas1TKzHAth4tuwxc7gOkwZV
	bwlpK2MTuFAWsKtJGQNZoYtkFKJXWrJgJxrLxfwKd96lqt2tzqhsUM1/eeEJTcrU
	vYHvo9FgR0aRF/YxpZvl71dce5SoEFSpFDyXhXR6V3UItZJX7ZSlo5NDYeNdLkiD
	T2vyO6cpN6ZyLrnSzfCVe3itKWlpSU32ny+hoVNsB5tlA+ilxzfO1NiKiO039Bby
	HN4B3/aR88JV+SwV2nnhFPIajAWB4mBDnGfbVYk6n1jb4S0c7Rw9EuY78Mg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fm2fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 15:14:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24a94fef521so677805ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 08:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912461; x=1757517261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrzVp/Rhi+sJKmcSPdWp/qY7dG+tv5mT9DlcBZ2BsY4=;
        b=kyASnYUOOq5wzbAMJfVqgGcV2gZ/rQy5S1QASGSAEY4Z/n4l9/rNf06bl4274K/KkS
         S4EKhAX1EV48XsxQ2vuITzuksdqX3syEJAshJM8/CNp0rLNue7lLCjti81h9WziQ7RHJ
         Xstiu1AQyRaIYoj03WTE3C3lYtILedcFVrV/pHGoIHU+goxH+RmpqvymhEbuCzq/QJQD
         c285wMIxBZGSkpXuKwsgGuwrTIsPRsE/Qu/lfdYCP5TPKEg2d7hfknZNfUDdBMOY6zDC
         UbXGtuGhdyvAl2TwKLGfdS44ujVO5yXwVk1MQ+Zt6+6Dg1h69mShyLPPBwM8wdXiqZ0O
         xcxg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ5/Iu6Cui71YhuUPKlX1PE8y07X3c8Byw3ajOddAPoEThikp8Hup+d32O6QORnTghMSJMTzhCL7ukCO1j@vger.kernel.org
X-Gm-Message-State: AOJu0YwBtWWs2vwWmv6xolqgMzIYotOxFAmJGdeidVpKsKb4pBc+gn11
	GYPWy0bAmMLho0A9PFtAoNAc2eHDoer7xfnw9PTPoQZxFkXXgFyK0u5V1QOYL+hR4bX2o+FFnKv
	ZxMmpjMso+4psd3/2/9ftWViigBIdk1eqWLX6DS0EK/ejsWRvRXXw3kwPb+aM6I3Tq41s
X-Gm-Gg: ASbGncs9+o7PkxEex9AVBcIGcm4z/r7sPhQkwccpAyHz0PZR/VaR+t2qxXlAEWRiy5i
	8neBm7qOi8vqDglPVMyetwD47BQ+ybACenqJAPu70EQIRyi3b9FoPG+FcMQEPAlVH3Zjt5knboL
	Qb+qP99ZHwPaML0jfjgoiCsggJbwY+doxq+XBT6CJhIT1Dpxz61f7CkOaJiHxt9SZJ9LIM/19yO
	qReb6P1e1y9vtxVrmBMYp+hu6lFNbfVbRMr2yZoUyay73kapJGQ+V1nOvX8IZAMfZR5YgmT8aJj
	Rt18hATsPZ14Z+wh/EUrXUJExxonsJdt5SCVyeLLxV+5YyH4vAQwvR+RcHfqmfZNl75nPcnzkV0
	x
X-Received: by 2002:a17:902:e783:b0:242:bba6:fc85 with SMTP id d9443c01a7336-24944b75a04mr220940695ad.56.1756912461171;
        Wed, 03 Sep 2025 08:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7blGezTwsbFKyXJPmJrF/cNsvF5Q4e8jj/x6gSiHAPOyOXA2iCqhiw4fdWaghrOg61aMaTg==
X-Received: by 2002:a17:902:e783:b0:242:bba6:fc85 with SMTP id d9443c01a7336-24944b75a04mr220940305ad.56.1756912460699;
        Wed, 03 Sep 2025 08:14:20 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903758b89sm164818945ad.59.2025.09.03.08.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:14:20 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v9 6/8] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
Date: Wed,  3 Sep 2025 20:43:35 +0530
Message-Id: <20250903151337.1037246-7-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX+3QETFBkptr6
 gTIwlfmxuAUCiRWCh0o9AwN+B1FG6P6Hbsz55HTHmmHizN1dtCEWCsAYj3LBEYfITiA1HOnstzL
 hREpgxK3JYz0H3HqsZMVHF+oa1IhW/60JXB+nbWbI5AS08w/qYLxfgy2Nzu2pxG4KB5Qmw3usvx
 pJU9vyw2QqbhvMgtv885s1wxDHK9IJOPmcwWojBmgQpa1ZPInq25CTd8BLEC2cb2iofyBhEYFs2
 GHNTVXar1CL4usu+ZaPzNZOODbz+4fMZFYFgW7Wz6QzjO/Gmd2bF63zSX5h1WXM22rAZawWIBbt
 EifrBcLwSzMw/83SUqxDH74JCYm+gtosnZaJmpk5v0f+bVhwCY6XeO/mWea83CRofXoBOGshHyU
 zAicxA/3
X-Proofpoint-ORIG-GUID: J85bzG9hwJGNlYQYxlPuGdfcC5CT5I8T
X-Proofpoint-GUID: J85bzG9hwJGNlYQYxlPuGdfcC5CT5I8T
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b85b4e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5gXoNHtsKICXUCjegB0A:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

Add the sound card node with tested playback over WSA8835 speakers
and digital on-board mics.

Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 45 ++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 09e2cb9053a6..18cea8812001 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1048,6 +1048,51 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "qcom,qcs6490-rb3gen2-sndcard";
+	model = "QCS6490-RB3Gen2";
+
+	audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+			"SpkrRight IN", "WSA_SPK2 OUT",
+			"VA DMIC0", "vdd-micb",
+			"VA DMIC1", "vdd-micb",
+			"VA DMIC2", "vdd-micb",
+			"VA DMIC3", "vdd-micb";
+
+	wsa-dai-link {
+		link-name = "WSA Playback";
+
+		codec {
+			sound-dai = <&left_spkr>, <&right_spkr>,
+				    <&swr2 0>, <&lpass_wsa_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	va-dai-link {
+		link-name = "VA Capture";
+
+		codec {
+			sound-dai = <&lpass_va_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+};
+
 &swr2 {
 	status = "okay";
 
-- 
2.34.1


