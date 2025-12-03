Return-Path: <linux-arm-msm+bounces-84165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 396F9C9E3DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 09:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3F06434A7EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 08:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF1A2D595F;
	Wed,  3 Dec 2025 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbOlu439";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EaxOax7p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861BB2D5C9B
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764751019; cv=none; b=Pf2pewnFp3tX6P72+UrgK/ECU1uXX/0Pwrb7ltyVteF1oEHWIx9aGTRy2Enp2U6K7OitOfPzI8WH3TZI2frIm4wQ4jOHLeLrv09ggP2zEUMLbzZDCYUZqr5Hjxl7k99dWpa6Lb/G+NuJFD+6Ooy1IWriNtBGDVq4iPTQxL05x7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764751019; c=relaxed/simple;
	bh=WxpXnnN20aE66OnX2c4EcUlc1l6NOpQAiYXXZVeIIRU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UaeQNrrslqfZqQCyjF5kPXskhJ2alvUzSgGjubkXjUTQ5TJtnk/IGPXB6mAab8gDBuHUdGheOnBtYaMv7H8t555JfVRNnGWEilzS+BCPIerldPaiAzjwWJ9HjaJx39zUeQ7RNWx+hjHXM6KtaVDkdHrexUTCcRLGrS2/HEzjQf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbOlu439; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EaxOax7p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B381chE4011051
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 08:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=d6KQ332SY4r
	oUde3OPXCoCkBr8FmmOBZNjlgBZOAEB0=; b=VbOlu439wpGIzTQDA1WANwZj63c
	twgl4KAJXLQK/GPtky17VJewD4WCzru/6oVeSwJZtevM0zUoJuUi/NAFRzMlEOE1
	nnNZUm/oJV5TDI+RmB6vv1eV1R9RwtECNjOx50P8X+Ai1EbIFCr7xYMug2IZsb6I
	n31OGsatnywavimX7g3rzjq7og+lwfy9xNRYOmnc//WxyJ8BDoCpY/+nFwleH29I
	RtR9PUOG5x92GEkWwA4q/+a6AYe8aNAWkKIdl5ZtDVo3v8XnissxPd/uodsU++Kq
	h9JKfYLCpKJCYARoO/vWPzx12xfwGIt8UpAYH3qcoqoN2g8TkFu2loucV9Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at8d9hngx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 08:36:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f48e81b8so10475885ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 00:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764751017; x=1765355817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6KQ332SY4roUde3OPXCoCkBr8FmmOBZNjlgBZOAEB0=;
        b=EaxOax7pLj6NGxNBlvUlsuAZfCWVfaelTKTDU7rIL+XNODozniy+/Vl6rkqdBz0SDU
         P8lNGFuDbvNdrKjtdce1waCADeUen0xbY5p6yxCMnxw14X3iq7Xym3aL/5Li6o8z/RYq
         DBoIEud2X0rQjz57nNlWZi4GQjqW/ap+xAyfYKJqc4Qpi9wRHW/gnKOiUA68Fx8WufSL
         clKrc+2dsibzpMHqER0cZwLr5MQaGgif5en4n2UCLKB2O1LFGi+zFrMrSE6SRDEdLp7Q
         yrXHSK4SwWxcGI3bVJF9IaBkSkjCA6yW69fEiPd7r3FiA2+esElSIT/JQcrBSpvHJ3mf
         S+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764751017; x=1765355817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d6KQ332SY4roUde3OPXCoCkBr8FmmOBZNjlgBZOAEB0=;
        b=aE+AzPJO644SDuv6MWfOFZmC9drim4E2pXUxMSyzPCeAvljv6aAIi2L8tWKL3sp4e9
         smV/UFw0dD3jIvi7R1WBhTjcXpUHEX7YcZCSRaltQ6rOYoZRuMuGe9jjHtOyGAqaXQ0O
         I4lQxt8xgVZFCDupJ2lwh28uY+vzvY/ffgAcv98Hck+vXYKEd80hRz3eXMvuxK6w/ocO
         RuooGhC1VA6cYliNNmcEj32SHyCLzg2RLdBxP94bj1gZh4owP3u7n7LibyeKGUWoJ08u
         N7SBuJ5DQZ0wxhQFt+lmk+BizNJZTVy70UqoDueynagxQJJWsLnIyRuolZ77ajJO2SLU
         oUnQ==
X-Gm-Message-State: AOJu0YxGNHNFF70lsXGttvOpx40N5URyHUWz7kKVdIvL1Jquwl7geBWG
	gc3NIwowpFuAOCOqhkUbsi0gmDNieTWtawAWhLWiHVZL81JL6m6DKUW33ahGWWJ0nztrIHXNwOp
	W4xK7DCVvjkTCXk703GtwK3KWlPPZUsN/J4orNCLQcrtozkfGXzIFwgWdct02MBJY2F6o
X-Gm-Gg: ASbGncuQ0xlbMucv0KTpAw7rkoa0f1YBnP9F3/463k0cuahswwaP7aju9+RjTyoUn7W
	PE1OXFk/cRq2CmVQJ2HBs+axm/loZ19I8RGzOQ9nvPfLnm3rlIGj+GUbyzyt9iFM4YL4qLs3Kl+
	6tqs/Pc6DOzOiJt68spI9DLmrNZwzkwk/OIbQU0MJbA0ysg506e9FSkx5KamDrdd18d4UTo/eSw
	NYGWOZfHUA7KbnV81p7Bwthy5f0YQwwYnQreWB3adkm860W4Ra64HKZH/zMe+CyeyIHJ6O0FoC3
	/naAwtM7Sh/pczLw7pURCeqJscXRoyKl0GKQ39IAVc9vbA0Jdl7RzIizqaoM9DdMvB3VT8kFzcR
	TLJC81s2Ao4KvRvzMK854S6LB/37ErQrsXeNQd57+G5rblA0=
X-Received: by 2002:a17:902:e950:b0:24b:1585:6350 with SMTP id d9443c01a7336-29d67e715b2mr24140375ad.11.1764751017117;
        Wed, 03 Dec 2025 00:36:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvnUwQGxzUwaUaVXvisTvu2yas0UaIAw6ZXo//eLlY4iKyWBDrY1+fylW8imkOBcqLQYzFSQ==
X-Received: by 2002:a17:902:e950:b0:24b:1585:6350 with SMTP id d9443c01a7336-29d67e715b2mr24140055ad.11.1764751016604;
        Wed, 03 Dec 2025 00:36:56 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce41785bsm175707985ad.20.2025.12.03.00.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:36:56 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 2/3] phy: qualcomm: phy-qcom-eusb2-repeater: Add squelch detect param update
Date: Wed,  3 Dec 2025 14:06:28 +0530
Message-Id: <20251203083629.2395451-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203083629.2395451-1-krishna.kurapati@oss.qualcomm.com>
References: <20251203083629.2395451-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA2NyBTYWx0ZWRfXy3f5Q2xxuqkJ
 tSMEJbo4Cs2A60C0+rKGZ4hT/JgAq5Bk1JhD+H+g/O6cQUpgjc2W0NkrchrBZN8ZPpuwZl+cItN
 orGCqjwwrKVAuCAc2V84iVCPZe0atB/XcVxguL20kKrm1JQfhgRdUXOXgn4wwojyz3mjsFwUGHO
 ZCn9f+T6499OlZ46C7XXBWDTszLoQCGlXdv8lNLqYJISktCPKgsOhKHJFJStP1ZLK/IIt1DT8cW
 cdUXJzvXKljBEbo087hOCLyM/G2nkQrz6BEQADh1Qq50PLVfd2OyZM0RmH5cPdK6MTDlBfYgTmg
 +IMgcWVMV/mqbqK1YU2ssjuSdzpK9Tb0XCXPx7o9ll0whWZgEknBramZdyj3NDm2iHivqpZJfnj
 YxKDa6A+v4VeSrLiAZjFKqeB4GqT4Q==
X-Authority-Analysis: v=2.4 cv=A7th/qWG c=1 sm=1 tr=0 ts=692ff6a9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1szMwrN-8cuOqQ1sM4MA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: aqWtdn4vmfKOKGXDSVUt52k5sx_8eWDi
X-Proofpoint-GUID: aqWtdn4vmfKOKGXDSVUt52k5sx_8eWDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030067

Add support for overriding Squelch Detect parameter.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index 651a12b59bc8..e5812626a871 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -37,6 +37,17 @@
 #define EUSB2_TUNE_EUSB_EQU		0x5A
 #define EUSB2_TUNE_EUSB_HS_COMP_CUR	0x5B
 
+static const int squelch_detector[] = {
+	[0] = -6000,
+	[1] = -5000,
+	[2] = -4000,
+	[3] = -3000,
+	[4] = -2000,
+	[5] = -1000,
+	[6] = 0,
+	[7] = 1000,
+};
+
 struct eusb2_repeater_init_tbl_reg {
 	unsigned int reg;
 	unsigned int value;
@@ -120,7 +131,9 @@ static int eusb2_repeater_init(struct phy *phy)
 	struct regmap *regmap = rptr->regmap;
 	u32 base = rptr->base;
 	u32 poll_val;
+	s32 dt_val;
 	int ret;
+	int i;
 	u8 val;
 
 	ret = regulator_bulk_enable(rptr->cfg->num_vregs, rptr->vregs);
@@ -147,6 +160,14 @@ static int eusb2_repeater_init(struct phy *phy)
 	if (!of_property_read_u8(np, "qcom,tune-res-fsdif", &val))
 		regmap_write(regmap, base + EUSB2_TUNE_RES_FSDIF, val);
 
+	if (!of_property_read_s32(np, "qcom,squelch-detector-bp", &dt_val)) {
+		for (i = 0; i < 8; i++) {
+			if (squelch_detector[i] == dt_val)
+				val = i;
+		}
+		regmap_write(regmap, base + EUSB2_TUNE_SQUELCH_U, val);
+	}
+
 	/* Wait for status OK */
 	ret = regmap_read_poll_timeout(regmap, base + EUSB2_RPTR_STATUS, poll_val,
 				       poll_val & RPTR_OK, 10, 5);
-- 
2.34.1


