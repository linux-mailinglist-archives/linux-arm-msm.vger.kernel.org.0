Return-Path: <linux-arm-msm+bounces-65288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E82B07990
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E4AA3AE680
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910892F546A;
	Wed, 16 Jul 2025 15:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lStun/B9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0377B2F5339
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679250; cv=none; b=F9ZgEBLAsIUfCUkrqAymDcrSY/l5e3QfMr7J2ZQw7qf83RznCvIzra8/I/tGaWtszrjeT4pcN1m++u9abhrnLRwqozNwZ7HoECEAz7j/zV+4Qq26Utlu7qr2lpOvKDH9qvQQiyAXJ+05IdNXvuyOGw97Z2X4qP7jT4fJ9IEr4ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679250; c=relaxed/simple;
	bh=6JQf4O8NMe/CubAcA+bvLEOkTG1XpMAvA3q5EVQGE+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b67R+Pt7y5nam+rrH8ZaXNigSJL5ghgIkLVWJzeD00Yn+SWjQuOgekfmWl8KZMP76r+p7DMXGuhP1j94zry5es5KwjegC1XRIvVPqWT88hse2swCjL8RMeeN0wwqczbQs+4myecmpd7akyjufA1yDG8/t/yARlC/LUO7Bj878tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lStun/B9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD1WKS024690
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i/UzvBI9fx7
	W4AtWjhd/P7aklE++DS1Rd0idD9jTzhc=; b=lStun/B9UnbPZcXc8vZVg0cFYh6
	bseqFKGgZJ2vt8SpuVcL3cbx2BZ7f9hDpYRd+++a7fWwwNxkVjuCN/i5ViazOzE/
	eqFszgXfrOK8yill0nmrbz3YFVPILOgNo7T4SPRVjYPoucqts4m0oxn9jK7HGXvk
	+FceQ+SNuzxRsrtC83riYIlAQCGBqA4XLl3fnRyItFaIhnOKN7LX6HoBhRW4E82M
	T6XFx8B9O0PNuqPBS117+Elxb/P3N81CEMGl50oHJ9LEG0dOYx7/2S4lDc0kpaHx
	uXO1yNSOwyYV//E/3TJQiK70U9Cat9HfAzPlpiriN1wHOThk7oiqpG3cYJw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8cb7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74ad608d60aso32877b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679247; x=1753284047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/UzvBI9fx7W4AtWjhd/P7aklE++DS1Rd0idD9jTzhc=;
        b=PI9qUKL67tAwON+aU6m4yMFcsTUGS7xn890NWDKZszbEbqsxjsGzH9Vi0+9yfQOyL6
         m9ZWVl+/sF+GHMSkIaOBNrEQNp39RQSEigP6wDWjjUPiEF21ggEuWTZxRrgG/MlQ7rPv
         1s7WepUIzBiqwJcxsOwXOxyO6rl7e8GXh5a7EnZAvm07b6W2TO7MIzoscANVOKLni8CN
         7d0+e6gft5vkLYAiRV2w9/76WxCm44r+uEeDlrW0aZv9XAvfustLcNdaTuqU0zlRma98
         I5bv7Fad7CJUwPl9youHY07ELVUDbcIF1GHvoRqz8jAEhCgGfavNxR4KGXLCbS9No3Ru
         StMw==
X-Forwarded-Encrypted: i=1; AJvYcCWkYjneCP05RznGTtH3/bMksuorqlsLIdieTQlUHjcttTfDPx4Lntoo2d+ptrge/rMEIjgXofTarYlaSBEA@vger.kernel.org
X-Gm-Message-State: AOJu0YzvmKBM6AWX7cOk2D3UVk9gr3/W342zgK7/74OFH6UB56G1cFs0
	1mgvHJbrfMxPJ5pP5ekG2H9/PVa700lBjs5Wvus/xxzB3njbe1+jkMUfjYlyGxPhWzPvkwpupmG
	SU151jKzknYHX8FRKsDMRGfV8uXxXirKmvWZDouo0+CouJc3g/w7XHrygTHvfrn57dutZ
X-Gm-Gg: ASbGnctRMNGgVDRFPhIRtCPgX6aTKKnaI27FGIaYLzTHf1vJ7OtmJjdbjy9IiER6Ktf
	MbbQ9gurwZmNfmM8788b+X3CoHrzpk+uWHoN+UZKYsOvbJqzny8MpWmW6awGXwRUbrDzBhDoWWy
	898+Kf2e+CNxv1odPgkznnWPeA/vsY9YvV2fgJeHQ3mlad9VuAZOoU83NpMGiDSwubkFcf3HgZ6
	3BK+NLkRAt7AZ4DMTPzf6aF+qscuX48lfA4YqXVLAbb3xoHQZ2k1oAj2nJEyco0XsSVUtad5b5Y
	hXZT9GhlTDsK478KtplyNTAD7g8eG5uy4BucFWLaqAekFRRYMBQKr8O3ZjIDI1U5hOTnBCGu12Y
	SeC0ZAUYqBEUirBV9MKlHtG8zygbX+a9xIxZHyMqA6szE2GhM9qbx780N0VgQ
X-Received: by 2002:a05:6a21:648a:b0:1f5:6c7b:8920 with SMTP id adf61e73a8af0-23810666ffbmr4906023637.9.1752679246745;
        Wed, 16 Jul 2025 08:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKLc+0bFiDHzoomsqf9Ui03eq/1TMOrYjYRIlLvU0csjZfUBwRKUHtvMxEGuec0rVMcA4QtA==
X-Received: by 2002:a05:6a21:648a:b0:1f5:6c7b:8920 with SMTP id adf61e73a8af0-23810666ffbmr4905980637.9.1752679246306;
        Wed, 16 Jul 2025 08:20:46 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd8f8sm13912054a12.38.2025.07.16.08.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:20:46 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] clk: qcom: clk-alpha-pll: Add support for Taycan EKO_T PLL
Date: Wed, 16 Jul 2025 20:50:15 +0530
Message-Id: <20250716152017.4070029-6-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfXyvVwq7asZ9pj
 KwQBdYD/vUHPGHoGcHpJMw8n7IZVOuZ4zdiOUm1p96lusltRkIJKO1uCyLJ4rXfrkDNgJmnr/re
 nvdnqkEAurGfM8mNcaNg8/tsSo++JRrREDd6+PtGxyatikS3Orf5smi16Gg2KMwq/wwVvYzHSdI
 bxk6yiMeReGnP3S+V6ShCsnO7IzI5ci3fjkT6ZIbAjU38yA94UYU8rSbqMPVCRKiTFheZ5r5YSa
 gJnhETWRnN79QIVsXZr6EV8NBsSBdZ7geeBKT8B38OMlIA2jwpu+F2ISNrcZWl14wDx3/G3fR+4
 VO7jhBXilYitLMGC0R7orrSSWLweUE5Ayi2GOvG+2N+6RiArEguRxubYWbowx1cIIbcrxvHyRYW
 A18ny5YCmhEjdtzEBKFHrMgtb+wIJUiy023jHv0StdPqtjr32Il4gqp9V+06HgccubR8HLRp
X-Proofpoint-ORIG-GUID: Hy5iNtMfiQRKOxPbuxmFoLvMH6CIXnPB
X-Proofpoint-GUID: Hy5iNtMfiQRKOxPbuxmFoLvMH6CIXnPB
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6877c350 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=9yNAuCQw4ehsCnPPvT8A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160138

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add clock operations and register offsets to enable control of the Taycan
EKO_T PLL, allowing for proper configuration and management of the PLL.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 7f35aaa7a35d..2294ae99cff3 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -29,6 +29,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
@@ -192,14 +193,17 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 #define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
+#define clk_alpha_pll_taycan_eko_t_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_eko_t_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
@@ -232,6 +236,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 				 const struct alpha_pll_config *config);
 #define clk_taycan_elu_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);
-- 
2.34.1


