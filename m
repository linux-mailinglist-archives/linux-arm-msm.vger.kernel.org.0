Return-Path: <linux-arm-msm+bounces-58797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27610ABE504
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 22:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1C434A83F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 20:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6580E1E22E9;
	Tue, 20 May 2025 20:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYhnnGI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB355288C35
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773902; cv=none; b=Vd3/FQso/vsuNNAyan6fWH+Rlwv9ehLKbfuSzLnKK7BZ2RKp3WfHnuU68MinVTG29z2thnqUddqXJQMjpy/Q7qOeVdUJDRXdcqH6p42qdzcj2U1tF1BhuUJEFZbX0tz12iIFgSwfss6nZbQtNqbbmFU91STO31tYg9RFOPzeJ7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773902; c=relaxed/simple;
	bh=Xmg1LtYxJaJI2EQ0Va4Q2f9jN887//vucqiSmZrGx6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5QMI8SehuGoYA6QIomEoq8SxYxzX5z3s5qFWULoPzvkmd304Pu8vRueIKcC8KhxzNXpGrpnkWz3sYqRmvaekPyZvt5ngeSCk8TWEk8B1nbckvEDz0YXcMNnPoiosacblk4AHX6WXCRGfENBjREAw1BNYBLfmDBI1lZgtslgfvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYhnnGI/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGerWr017043
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tanQOqYw0Cihj8lfa4clmi+xNJuQzns3UjTESaZfuxI=; b=YYhnnGI/6urAaUJt
	SIQ1bUssucmm9QNEHgHjq2IDhtaxgRuCNEtwhRGFy4mfaZ7n0b6qo4/RgQmxqj3T
	H/N5w3OcP44YEtf+GFyFkQzHiHYiXDx+h+SIFCfTEhKR7ja7rgKWPcZRMGCCvqAw
	rpZl9HjVPm5/25bh0d+e5CaQPpkq0ctlgffAIaO1a0Ht4+fhuhpYN5X29PA5bFIP
	mvgTnar1Xf4UK+65i1kxxZEN5G4bQl69K1ZpOGmRzk49RGTXvQROtWCnC6tSnn2H
	M/TKLER9Ja9cGB179eP96RSUYic+9Kx5CWstt2zW+3nqXKPvM4b7SgsAlszEzwUO
	gsWNbw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb0k8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:44:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8bdefcb39so74176536d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747773898; x=1748378698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tanQOqYw0Cihj8lfa4clmi+xNJuQzns3UjTESaZfuxI=;
        b=rpzC4YguPIIvS20Nw71EFMTKtvGfqynUsN5EWW7iPmfPmJdJtH1P3yOlhN+vIJSi8k
         qNl41qSdiuB26v98vr/lEpQSvWtFXPiH8rcf9sQkx+2g1fWotgqQHSq30c8aUUeu+z67
         89JBnnqSmP7EivvDxgQ5D7HzOCfWLkES/p72hkYuRlolasULa7KhiWI6DbLx7eAF87lx
         7RU7gbYhETsTbnyTKmIrUkqwfIutPl2EJs0v5l00qa5ynZ9O/TcZfJH0SuMk8uM/FoaS
         5Tf1NGL5+B6Ii5kdvCdTJ/6OkZOz5q2GZNdxUi5rbHte6sH9RHsVojQk1QWSVuZPan3y
         DeIg==
X-Forwarded-Encrypted: i=1; AJvYcCXvceaGxJxH2l1c7V0R/djp13ksdymfiWNeiei/PYoxe9CPNazG1mmmGLwg7AcBVCZ2oCHrZj+LTGEnJMyI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4g9Q9wI8UurkZOVRP1KHOiT4QIryAP6LhaEAAM/L7m4NpJteX
	dsjXz2SA7LZUCyuM88R3dTMEmvNDn4Rnpm8arRYpeJShwlYaA22N2esPPDG4ULabeby/acNsr3j
	LLPQR5267HecgWnO2k/qpJjSyZrYQoR/6wM8dQrtgDVdJARpEgmje1HuD/3r6NNI/fYGE
X-Gm-Gg: ASbGncvLr2CiTC7JxbatwNPBtHOkGSVn29lyUmhyXdGR1hd6YuGxtHs12iYK0yq1sjG
	G8QDw/UpOjywnR7/HLueW9aYSYAI6OxO7wQp0PwjRgJbVDCuBSOT63KhWLVnoFvn6XpFbz8v/ho
	7rXIgrnPJKHeifapIBhWNPwEOTgx1g05QEB5sg8oTKOAx4JoCAru0umNGGwwTtroIEMqTrYOBDJ
	W/aFmlhHItk8D+HOjSlb+agkFdQK4LSUTpC2e/hqpMbKTIwVQENEfW/RAl4Fn9hVme6XolW17h7
	4UtJvnXy1wE82g3J8osCuPpbS4F5kiamwNhrJ0LhUn6wR8o8leiNULt1lMX4O0eYA2iPYCV6fFE
	oxvM3z7mNGPln9Xt7FcmXVtvU
X-Received: by 2002:a05:6214:2481:b0:6f8:e208:2ff3 with SMTP id 6a1803df08f44-6f8e2083315mr84783786d6.3.1747773898565;
        Tue, 20 May 2025 13:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsmwNxdG/HYMxqSROppvUBzj8rzZOT8nKj3cJAd2Y9WI6WTWrLs2D6LA3ZQ5SDaLunJEwAYQ==
X-Received: by 2002:a05:6214:2481:b0:6f8:e208:2ff3 with SMTP id 6a1803df08f44-6f8e2083315mr84783476d6.3.1747773898221;
        Tue, 20 May 2025 13:44:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f163ccsm2497950e87.39.2025.05.20.13.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:44:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 20 May 2025 23:44:45 +0300
Subject: [PATCH v4 3/5] phy: qcom-uniphy: add more registers from display
 PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-fd-hdmi-phy-v4-3-fcbaa652ad75@oss.qualcomm.com>
References: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
In-Reply-To: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2529;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Dgc1ExVnp711AdXhWA9ncnFbHeGjGDWinEG7f2MOuNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoLOnAVhF+aEhT/5ZT81bqALxrU41/0xO1XWmyf
 RZ0clayhAuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCzpwAAKCRCLPIo+Aiko
 1aqlB/wP43HCfQCLGS9i7ddYdAIIbjlSbr5UDLEkG3+Kk3jWOsbmMt3q5BY/ALb3NaTatSpTklk
 T6FqUtNTOP8ZBbL6ls1eecOO03aY9Q+bA085G1Z0KsRTxGLsjWvluDGqzvpogHCDV7fB1hBukoP
 9ZYARb32vhuLXccFhoGMWJxfeR6+luUc0rGeQqDaj3tKV1Q7s2FcWRiRHpmEWvSxEzIlY51sqbw
 fPhYxUYKHlYziwUryEzNZsRStghA2Z91DbHB/u5N7QSyzeF21RGPeEqJjbwbarP2bwVEH4mrG4M
 ClWUCoxcZrWDEf8ObBzsu515WhCClUqzM2jB+cR/yu0N2jd9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: kR5cUSkciRtKO3T1wwHFEth51xbnDX7u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2OCBTYWx0ZWRfXwdeb0SQtXozt
 ii8RxXilsqaHFdAGkiAtWvhzRORAdKU0ES4OabH9d7ryaAaDUxGQqm1ZQ0E8MXJT/gtcWNAIhiZ
 S+IvyNPgXna4slIyBc7tUHUcaQis3jqTfOC2XXmwzXATCkRO2MMLbX/br/7efb7u+Ro+6NFY+5R
 nDtxiZmZUIAzKbkXpMmH53fylBwsdJvKzNG0Xrsov1RjKiDzuDTbNGW1ULYCII4cLPdEUXh469Y
 rUqHwG1Xxdu0CE84+9WKWKDt5I/7Ncx8uu5s02aiR3pR1pZdIvImmBGdNxM0mgr2buT8C5/HBaN
 2fXsp3noSbsucWbbHxxMIUJpBQOsNdlnwscVz2a0qo+blJKhsQSdoDbAk/bPJtDEr9a0/0QqcXa
 nTxraMwzRosORH8feeQIadV5TC4Rh1+IPxX+g5/vJ7Lz/aI2DpQkVD/fzqmDqzAHrScs2S1p
X-Proofpoint-GUID: kR5cUSkciRtKO3T1wwHFEth51xbnDX7u
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682ce9cb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UZIV0CQzuhujAGWTQQkA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=847 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200168

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Import register definitions from 28nm DSI and HDMI PHYs, adding more UNI
PHY registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-uniphy.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
index e5b79a4dc270f25d8979f51bf4acd6c76998032e..ce782018124b5431ee647575289c963d8fd0de1f 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy.h
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
@@ -8,8 +8,19 @@
 
 /* PHY registers */
 #define UNIPHY_PLL_REFCLK_CFG		0x000
+#define UNIPHY_PLL_POSTDIV1_CFG		0x004
+#define UNIPHY_PLL_CHGPUMP_CFG		0x008
+#define UNIPHY_PLL_VCOLPF_CFG		0x00c
+#define UNIPHY_PLL_VREG_CFG		0x010
 #define UNIPHY_PLL_PWRGEN_CFG		0x014
+#define UNIPHY_PLL_DMUX_CFG		0x018
+#define UNIPHY_PLL_AMUX_CFG		0x01c
 #define UNIPHY_PLL_GLB_CFG		0x020
+#define UNIPHY_PLL_POSTDIV2_CFG		0x024
+#define UNIPHY_PLL_POSTDIV3_CFG		0x028
+#define UNIPHY_PLL_LPFR_CFG		0x02c
+#define UNIPHY_PLL_LPFC1_CFG		0x030
+#define UNIPHY_PLL_LPFC2_CFG		0x034
 #define UNIPHY_PLL_SDM_CFG0		0x038
 #define UNIPHY_PLL_SDM_CFG1		0x03c
 #define UNIPHY_PLL_SDM_CFG2		0x040
@@ -22,11 +33,33 @@
 #define UNIPHY_PLL_LKDET_CFG0		0x05c
 #define UNIPHY_PLL_LKDET_CFG1		0x060
 #define UNIPHY_PLL_LKDET_CFG2		0x064
+#define UNIPHY_PLL_TEST_CFG		0x068
 #define UNIPHY_PLL_CAL_CFG0		0x06c
+#define UNIPHY_PLL_CAL_CFG1		0x070
+#define UNIPHY_PLL_CAL_CFG2		0x074
+#define UNIPHY_PLL_CAL_CFG3		0x078
+#define UNIPHY_PLL_CAL_CFG4		0x07c
+#define UNIPHY_PLL_CAL_CFG5		0x080
+#define UNIPHY_PLL_CAL_CFG6		0x084
+#define UNIPHY_PLL_CAL_CFG7		0x088
 #define UNIPHY_PLL_CAL_CFG8		0x08c
 #define UNIPHY_PLL_CAL_CFG9		0x090
 #define UNIPHY_PLL_CAL_CFG10		0x094
 #define UNIPHY_PLL_CAL_CFG11		0x098
+#define UNIPHY_PLL_EFUSE_CFG		0x09c
+#define UNIPHY_PLL_DEBUG_BUS_SEL	0x0a0
+#define UNIPHY_PLL_CTRL_42		0x0a4
+#define UNIPHY_PLL_CTRL_43		0x0a8
+#define UNIPHY_PLL_CTRL_44		0x0ac
+#define UNIPHY_PLL_CTRL_45		0x0b0
+#define UNIPHY_PLL_CTRL_46		0x0b4
+#define UNIPHY_PLL_CTRL_47		0x0b8
+#define UNIPHY_PLL_CTRL_48		0x0bc
 #define UNIPHY_PLL_STATUS		0x0c0
+#define UNIPHY_PLL_DEBUG_BUS0		0x0c4
+#define UNIPHY_PLL_DEBUG_BUS1		0x0c8
+#define UNIPHY_PLL_DEBUG_BUS2		0x0cc
+#define UNIPHY_PLL_DEBUG_BUS3		0x0d0
+#define UNIPHY_PLL_CTRL_54		0x0d4
 
 #endif

-- 
2.39.5


