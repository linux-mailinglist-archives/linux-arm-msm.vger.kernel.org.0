Return-Path: <linux-arm-msm+bounces-77836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02877BEBB24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 22:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0B39408537
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 20:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671892417DE;
	Fri, 17 Oct 2025 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YE0P+VuH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89A6354AFA
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 20:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733295; cv=none; b=PvZqw6Nlorl3CR//7Zb8jWzeg+sAoG3V1VBj1EzkO5SuS2TRb7LWsbxaO6QCDJzJlw2PXW0AgKSR4u0eMD4UvNUJtSSYYqUhEbp2q9PWOvGEk9gzKX4oB4ZLIvU3lB0qp6AAYNExNEyDTAlor+aureRy226wgkf3vrYgjWOZ2+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733295; c=relaxed/simple;
	bh=42h9WSzMxsMUKDKrWXddy7f79A2qL8IcQSDKGHUFEPs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T+xhEc7YsEklsRyzWUf/3fXe/zEfQ0sBsaoJQ+Ewur7YMxnz2uQMUpxZNC9HXM/mQ8Fi7aQDRzNK+P/bdv0cym6S7FmM9IZ7rDVqde2VID3+zSwKwlcZLLZHFsbl3O8siQUg6QdsVKxQQF84sOpPwbdZtEx4RCr4bFmjQwbMAF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YE0P+VuH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HJGjBq005384
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 20:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oEl0y/mrPeKiP6ZEhHI8gxlLx/zzQxxwPZk
	FL4UCulg=; b=YE0P+VuHAAntcQPIu2XocWH6w7YDJMBwSwQ9FxrOSkyTvJGBAkj
	S0EGsr93+tWrkjXOyJ2H117yW9hS1Pkw5hsn+meKiA66/SVBr4i1YPEVibM5YTZ7
	cYMaABFuXOFbZOhdTUFkroNa7WBRcEOCkRJO13w5vWthUm/xcgqsnge7QjF24zyx
	Aa6yziQ9K73GZmHkW0qrCzAFrhiU/e5/vF310rOIWkOWTdwIv+GhYNHuRbbLh66C
	fuqYCoOWFnd0Ao6knx20Mp+C0ngXFyoqk9wsOcXjkAUXZtrioC2vesFBSHtQuIVX
	+oCITS47+sqdIATiJNndv5PjzCn5pSMRI3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5wt3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 20:34:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-26e4fcc744dso15511635ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 13:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733291; x=1761338091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEl0y/mrPeKiP6ZEhHI8gxlLx/zzQxxwPZkFL4UCulg=;
        b=MhPoJUGDYsKEx5FdTh73/uTZ4ndb8Z4s7epKR0TgbkuEf5zdmQeIHnD+6GcneNVOAt
         C1MFeBoG31A+3XqLGtiW7qqkRmai+u67ShbM8wvvywCLPZexSZlynLn1Aw7SMdfBkkNh
         rW98KvaOPak0C0oUIz7VM0r+YxcLLOwCpcZd9Yi74tLykHMmqrJg7awCh369kExkOejZ
         eAXWz2UJ0zxGERO/D5/t2Q5+fQuq0d5k28hGeB1hnp68Csc+gJYEc/zv1cYdc1ScYQl5
         Y/0KwW44CVykD5fwnmZuUXMnaq+SILmcIAnKG0yiuwaAL1XNfIM6UryuyHA8HqdYt7o0
         lrHg==
X-Gm-Message-State: AOJu0YwfV8tIdP37i2njNt+gUVeIyuaxwKC2gLG3ntKJEfU1OBsUiRrK
	3y5G65zaBxgGI/baSYHQSgdAHNgE5WURhDQG8YzGBC4MxXXcd7Lcx+FECQS9St30W1BbDRPgeg6
	ao0sGGlEUHo2qbHg2d6oq8Rz5rgbKZxmVa4zyV8ARFhpvztyA8ly58lJcRzP/J7A+zn7l
X-Gm-Gg: ASbGncs0tEbdcF4VSys91f4NSwVqqaUA2+XamkE4lrLrbNz3jpa0AGyspg/9Kb0LEv7
	iJ4uEjvcU2qZyUKTl8+B7eI3dTbWtJ2Eg1KkxZjip3zsgJujttofDBFPS4EC0TA9SpSRu8W+q+j
	GUjwWq0nQL106S+NDSoJLb1Zi7hKf2tOXdw+D71jWpHeMPLHcg9ugREzFfEQOsSdBEO9PSU4OAE
	oWllHgfZ4IHlqHuwCrEuCYmSVduxPEsXQJzkq+4cP+5zTtJnYj/4GuEAThPKrmnRhOkMWtuMd9y
	K6S7v4MkhgMJ4amGJS4N0+Hi4FRGShm/cUuWWp3dRNBEOiD2spftl9ISyM6FOUaxDQ4OOrxvEur
	V+Szv+/D2tgCqia6Ckbp+hWmuu8g+7Rk85V4u
X-Received: by 2002:a17:902:f70f:b0:290:c3ad:8432 with SMTP id d9443c01a7336-290cb65b628mr57435395ad.46.1760733291378;
        Fri, 17 Oct 2025 13:34:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyX8Pk5DWSmJTsM6HLUZcbzX8C/j29RAvl1Yd/dyx9V0AATvuYl8gaM8mWgVvFK0PQX18sbg==
X-Received: by 2002:a17:902:f70f:b0:290:c3ad:8432 with SMTP id d9443c01a7336-290cb65b628mr57435115ad.46.1760733290959;
        Fri, 17 Oct 2025 13:34:50 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b33505sm627897a12.22.2025.10.17.13.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:34:50 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] phy: qcom: qmp-combo: Add polarity inversion support for SAR2130P
Date: Sat, 18 Oct 2025 02:04:38 +0530
Message-Id: <20251017203438.744197-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2-8muAYTVkCRgLA5WVtw4IBmcDosOyPX
X-Proofpoint-ORIG-GUID: 2-8muAYTVkCRgLA5WVtw4IBmcDosOyPX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX7XAPJe9uFoqY
 2BK+7nZBb1jA2SsdfzRLwxLlRZ8aww/EXUua3i82xh4tC9fwwLheV5jh5j9Yht2qHANaHH+StSK
 9mPCWFzqujLmmDg8fWbmfw/AZcssmcNiz4oEY0UBuayPv3SGSDQOVFN69X35MKMfOv8Qs3b9bae
 +U0MJYmpZP2AnY6kilCJT0vDMJXoJ/g70lO7LUuUKPLc880EwWVWhXyJQZ84xg3rPTNjdQLin+c
 Ym6XJ6IVzgryTWSzd5qIe58o+UyOYdYrGWpDkxoPBCA8LdS6dbGNvh48P70TMJIhpy3lq/Mf/W/
 cwvbF+Cvp14kw2jVilytg43E4VvNBa5tlO+yR9d/sGzDS9W6dKiyz+EB6e2eiG4msycWdER9BNt
 Vw869LlUlDdYlOQC9GqytNt/s7FO5w==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f2a86c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=LWLmvgxapxzxGbpwlLUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

On SAR2130P QXR Platform, the CC Lines are inverted and the lane
programming is to be done reverse compared to other targets.

As per the HW specifics, Bit-2 of TYPEC_CTRL register indicates
port select polarity. This bit is to be set for SAR2130P.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7b5af30f1d02..813c88f0a16f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -60,6 +60,7 @@
 /* QPHY_V3_DP_COM_TYPEC_CTRL register bits */
 #define SW_PORTSELECT_VAL			BIT(0)
 #define SW_PORTSELECT_MUX			BIT(1)
+#define INVERT_CC_POLARITY			BIT(2)
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
@@ -1820,6 +1821,7 @@ struct qmp_phy_cfg {
 	/* Offset from PCS to PCS_USB region */
 	unsigned int pcs_usb_offset;
 
+	bool invert_cc_polarity;
 };
 
 struct qmp_combo {
@@ -2010,6 +2012,7 @@ static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.invert_cc_polarity     = true,
 };
 
 static const struct qmp_phy_cfg sc7180_usb3dpphy_cfg = {
@@ -3046,6 +3049,10 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 	val = SW_PORTSELECT_MUX;
 	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
 		val |= SW_PORTSELECT_VAL;
+
+	if (cfg->invert_cc_polarity)
+		val |= INVERT_CC_POLARITY;
+
 	writel(val, com + QPHY_V3_DP_COM_TYPEC_CTRL);
 
 	switch (qmp->qmpphy_mode) {
-- 
2.34.1


