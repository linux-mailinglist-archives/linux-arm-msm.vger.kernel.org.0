Return-Path: <linux-arm-msm+bounces-59921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFE8AC9513
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 19:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 700CB1C22DB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 17:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB928274FF7;
	Fri, 30 May 2025 17:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FdiuEyk9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF1E224D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627269; cv=none; b=SvKYirAnbw5hA0G98hg5oCgWgamEOPacr732Y3Eb/wxJ4s06+Mrw/rOjgQydj0T7n9uYu/tiRgrFJ9i6swm4Pqd/0508anXyiki87C7C++h1vFTIMm5IS7y4zuqtbrNlH62ot30b3sgNKZDTB+6Cj0Vsb17K3mZfbNqt/dXmm5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627269; c=relaxed/simple;
	bh=jtEjy8chK7vSy/5Be8098CXoqGuk29fN/utLUxu+ZOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B39apo50yOzff/n2Y4Ne3vX5DHdP516Eaz+RqJCa6C7oH3dICFPPqicG5EI3ClXO5jwmLv0fN4aAwMRCV73kAlpQduTwo7dvrFSAHEpZGSqgrvhtitwHt7xCHCRqgSLLt6vvg1z597VXO9IR+jjTGdbwe42UAGKXSAEZjmtgJoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FdiuEyk9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U9snIU008028
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 17:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzWFt16chN6vIu9WEyj7pbXUxecSq7Tf1b7Fhb2bIj0=; b=FdiuEyk9LZOIgG2X
	DXUeU3BG9YY9qaVl1cdSaNsa6h0raHzjJnOvQfyRAwi1PGybqKpy+xNQcBzrI2Ku
	cCY/I78JgkyLDEGlxOSTKSIok5xGOxShzI79PVEjrH3k2wb/sEiM+O9tllGeulOT
	ZK6aBtOgpMAXl0RJwE7JDITFKtj8Wrn9bo0pDhVABQXtvxQK9hclPIvehpcWxjpU
	ZV40DScfxuiDgLrOMSxT9NUMydsg88GqRH+UcTsUHike0XJdxMvkkG81blPvoPMV
	Ye/I7ScILFkV5iV1K/4PhU3SA1pIG6Oz6rnxjYu407IRukFC3iRaaEU59QfhBYT2
	sSNfEg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992v62g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 17:47:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-311f4f2e761so2366059a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627266; x=1749232066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzWFt16chN6vIu9WEyj7pbXUxecSq7Tf1b7Fhb2bIj0=;
        b=WmkkCTIyYkMWlAcSi7QlGuhGB6WHEmkHUfdpiJ4msFczMuJ1jye1yhN+5GpteR7EKr
         y6TavS5P2KvgzRKecu7EqMTboOfdekAEaChRD3guZzUFKgDEBSiTv1blzFUDNt/mlF+6
         iJUfyz4CipOBxeW5JzQ9gL1A+jN6uybC4fAWTqzZL0hToX5e5ORdZiBBE38Zb3GVCkIk
         6i48LlNMQzk38tzN52BqtPJp+vHo8L/60JoPTPeRw4+C5W38gyWDBJcDiprwvULQ/Uq1
         AchEiAHWGT98l/VxtrzqNGW6Si9C/g7dN9Lbr1r0Qq8td3b0M11pLNPGVd+dJj5osK7b
         VRKw==
X-Gm-Message-State: AOJu0YzimPc5b8BEEm2vP0lC/2twJdjbCLMtf7NvZjm4+PdqclRcr/jq
	+8LzI4bloesPkeS1x25GDDfUoKZdx0aYhN8kYOpz2XANWPSROP9xPszS3arU8oEakkHE/6EnqCT
	lyTHHZUAq6EvXs9t1tIvBiRtX5mzWEv3dtPG567K0ACGqVqCFcMc8UUspd65GWKEbbRpO
X-Gm-Gg: ASbGnctyK9jjG1bIeh5pyGCRmTs9r8iaFXpwOCd5J3dnZTY0DKDv7VHwWJ4x5iNX2v2
	17JkIhauZGi4ho6qQTjJY0uFIivRblLB0OdKNmoJqXExRbFuHAegVfOgy4px4+1tBAcK4bcmSTZ
	G90k7GBI6aAN/m+qKNFZvg0+IohE3notbXIz1hZTB+zGoPAe1k96ta2ovDAo1zy6yEGae/u5ek6
	aqNCGmGurCcRFrmJwLqxB9bQWZqkOKRcbSSoxdZnn86U8P29EsnkezcUp454xFdgcsvtoCHpaCS
	xX0ULKWgQSgAcTmq5GebkEFH2oXFrEsIDFggIP23B7ZAywe7ZJLes1HAJnyfXGw2kLI5eTpe
X-Received: by 2002:a17:90b:2dcb:b0:312:e9d:3ff2 with SMTP id 98e67ed59e1d1-3124150da88mr7360855a91.7.1748627266614;
        Fri, 30 May 2025 10:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH44Ez8w2kSkFGiWXJyTRDICpcy7Z7sFhIreQn9zU0Akkst+TmIzvezQ7ZxQQV4CDoSwIXaEg==
X-Received: by 2002:a17:90b:2dcb:b0:312:e9d:3ff2 with SMTP id 98e67ed59e1d1-3124150da88mr7360740a91.7.1748627265598;
        Fri, 30 May 2025 10:47:45 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e399b0fsm1615381a91.30.2025.05.30.10.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:47:45 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:47:25 -0700
Subject: [PATCH v2 2/5] dt-bindings: clock: Add SC7280 DISPCC DP pixel 1
 clock binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-dp_mst_bindings-v2-2-f925464d32a8@oss.qualcomm.com>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
In-Reply-To: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748627260; l=862;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=YcjeN4u37rChhC2e9vyygUDR5/9ourQp/Z4Vjz3aqaY=;
 b=4V+1vbUqjNallDMi4o5HtOHP1e5c2KVcVyGeo5DMGTjvm7tRoaV9zFs4DFYTtqTv+nTiRbwRV
 6bG9bGyWiyOA8qrekpoVJYMfqPwDIHSo3Bka5HIDElilp0rnW2u027w
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NiBTYWx0ZWRfX1m/gseWq+L5C
 4AFc13cEpbhuvbSeAUv/EjF1D2XuOpceApDR18gT1Ux9Clkj8cO/vgcHP6fQa1vxYtW1E0yrvKx
 T576r/m/9YPx7UhjQucwT4i/TvC893WY9X1EVJbH7MjXCh7E2FRKOkP1hrsg72vI7Wqo2mThOtd
 +8reWdYoM7aQIF35SibTk/oj8XYdyBYTJdcd1SMHl4JOBAURug+zZrO2WsFmJBVvvLWYAJvH2/s
 sPHxHs1TgSsY6difogwbIW44IW6674cj8IL4kJb4hkZP0oCd76w6Qzaxswqq3Uj/blYcx3H2vui
 qC0Z+Ud75T4xK/ih6bgydT5SvLI0Plu56Y4GFzLVrEBhweJz0dZlcq59zYu1ljWbE5P3GBHRcli
 hzGeYfpgM8frhpSewlRb5VIMkKes4Jqs98b42nfPBUSEcA4wkkt+rpQLhNTe8xzeycAgmP0i
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6839ef43 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=HZRYMJrZkReahVkyUwcA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2wHMn1QzAZvoqLkCkwI5mO_3kJTjIX-Y
X-Proofpoint-ORIG-GUID: 2wHMn1QzAZvoqLkCkwI5mO_3kJTjIX-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=842 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300156

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add DISP_CC_MDSS_DP_PIXEL1_* macros for SC7280

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,dispcc-sc7280.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
index a4a692c20acf..25f736629593 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
@@ -48,6 +48,8 @@
 #define DISP_CC_MDSS_VSYNC_CLK_SRC			38
 #define DISP_CC_SLEEP_CLK				39
 #define DISP_CC_XO_CLK					40
+#define DISP_CC_MDSS_DP_PIXEL1_CLK                      41
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC                  42
 
 /* DISP_CC power domains */
 #define DISP_CC_MDSS_CORE_GDSC				0

-- 
2.49.0


