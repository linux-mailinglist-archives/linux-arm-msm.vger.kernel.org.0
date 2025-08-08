Return-Path: <linux-arm-msm+bounces-68097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5042B1E4FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C6C15868B6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91CA6270571;
	Fri,  8 Aug 2025 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IuJZ4YkC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E5270579
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643198; cv=none; b=DI7dXvLdnUdyuI+NNvxVY6HwSF3L9HS+BT5GfJw2827UYKEdNz298zc6b7pO0Cm1OUeGMdnvNrdloZ+K06dOG1UaJnRprZxo/3QOdTHSSkjZwxVedcD2TQgCl/su6e91yOv9iWZ5+F9Y2+mWmr8Hw+L8MVSxfkcHwQDaxcHY28g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643198; c=relaxed/simple;
	bh=n+vg5ydQ7X4wyVt0+s72ttQVBKiwA0hDbAZIqS23E6A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UqwDiEMkIiHupHJgS+Go+MU2O8mg4sf81upfnxOH92zLYV2NMwLRiMA1qQgk76Qtkif+fhhQIJgPSwLYOkc5Q4mCLwgE27eL+l41e8ABDBBZvhlf9hD3bOGqcApk7xwRcs9TYspitg9HSGH9HDx/mxEj2Za24B3rxll631V0uvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IuJZ4YkC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5788HoP8006399
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 08:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MPC6xd2VF/s
	mOBIHZ6B9pOI38D2n59UvsoeVG2Ya7rA=; b=IuJZ4YkC4SMY/uswBnY9zq3PDT6
	zjNeleX82/5fqyCYuzZR0DHvdzhY2Gi29t50ceeb8CPg3lt/HoU6+Vc7IYKmGVps
	a0M4gd2YpU0e3jstTzgZGOps5NN0D07z1daFLVKVdw0J+0lOxHXdCnqe5F+guSOb
	HcKXK3FCKo66QL3JmNja0Z1tVByB/cRkK/lkGom91jarnrRuKwS9eA6DSmtKFOra
	M0yhOUNwS+XTyy+a2JiLhyn4goTYNtYJHaPtX5SGTiVHVLz8VJRi/WXT0jhrDBA1
	yS/HOA6iX0wF6RnxKHtN74Mlia6yUvxeqPYQ1BAFDTUjxW7KaR1Hbicnr0w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ddkkr35p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 08:53:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7073f12d546so55513046d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 01:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643193; x=1755247993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPC6xd2VF/smOBIHZ6B9pOI38D2n59UvsoeVG2Ya7rA=;
        b=wBWtrWnS40Os2s/KLA5F4MCRhKbBk4Z7C7F4YMfgcLFtg5xWGmIYKH+muZkzEbwxcA
         FDAGcPvQgZuWlQDEhNlPDOCeKQDtS1jtkWf1YndeyeLJhPYN+CrmKNyDAl0gixYvVyRb
         pNoceQ0rWJstcxZFl1G9gWOBVFw5nFyIodAnEL/x4qGXjqUDpKcn9SNZeqnxrmYRRT47
         T//EQ6PGu1iox3KuyqfzzlZCOj2m58bERIlQ3kKDz8e/ENDGfa5mtr8KnKHYeKvk7ukM
         +dixfzpjcBCA2MxNuA+A4CcoYtb5KH9WSd6fCjpy5DOtkvi/LsNXWWE3ofW+wzQx1q60
         xNFw==
X-Gm-Message-State: AOJu0Yyn7UdLgbOGauFRWOzbGiTErgSEpqX9o/YDZUtpqljLVn1IUO4k
	89mqrKh8VF7f3nalLfxv5aSM0J/kSFONBAwSulxhLd3rkZhU1txJcGCRPXn54v6PQ7DjOOUYALu
	lmNGiuV/1ItkhN6c8bfEFr7Y/EitTwa/87pLbMSNBGeFIYU1WJsvzLDCgHcMeUtEF/jgr
X-Gm-Gg: ASbGncsY+tiHczxKs+0DXqoeLJtGoKDIyeIOZdWgzh9LLPtFxEfWSGl/wv9ie+yucgh
	0JhEL4b5rpeWmqjzaYkLZ1uy17UnOHqbnwfh+66q2DyLj6FlGgGmaTXY2j/naA/vNohgJerLMdJ
	BaNel5awSQQPbA5rApGRoQyyCItglaLN9dujvQSOlSlKH9bDkt5sJcuoPXgPb1Yn1Fdmmldb8Ms
	pKBToigQ5EJT5+uw3uDz81l7lsqR/UMcQS4dbd89lV8U86oNeOmsiRhUC9kfwrhlM8Esr189Tn5
	aS/TszvjRL4FY6w/kghbgmYuqD4k0Zq2ZXHui5U2ZUNaciwqCexhRywavm58EUxK9SN6tpbUFPe
	bH/ktsJgXKQ3v
X-Received: by 2002:ac8:5ac6:0:b0:4ab:7f61:4339 with SMTP id d75a77b69052e-4b0aedd7c91mr33072571cf.31.1754643192711;
        Fri, 08 Aug 2025 01:53:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENcrcraDY6LBXO1gjbtLVDBfn7FrMDJw6q6bfeHZSZ7FkUb6pMWmIgogO8E4kcuIn9LS8VNg==
X-Received: by 2002:ac8:5ac6:0:b0:4ab:7f61:4339 with SMTP id d75a77b69052e-4b0aedd7c91mr33072381cf.31.1754643192309;
        Fri, 08 Aug 2025 01:53:12 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5e99e04sm123818745e9.11.2025.08.08.01.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:53:11 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 5/8] media: venus: core: Sort dt_match alphabetically.
Date: Fri,  8 Aug 2025 10:52:57 +0200
Message-Id: <20250808085300.1403570-6-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA2NiBTYWx0ZWRfX+QasQQ+/mPOn
 CkVNwdm4ELuTvGvUhCXTL5njdf2tR6F9vMw3r0Vg4Jr45iHXNHtor7G8bWurxdX8lvlX+ly6/Aj
 cBW4/gMSfituKY8QwB2yjZni3ce2t7Oj0flxXwrWkgR2jDULw9KcnpPseW/CbQryxHcbIAdNX5W
 oQYX+Z0AXkDTpeGHl2qqCcr0UqWq5WQEbuLMMOZwPwFliul6rf8DXmEFr2PY8YaOwXJ6TvjeFXM
 E3z5H/4vuArB79ojUi5Kmf8Z4ytjZbQpp2H/4ZC966nrcPGYndan7KzHdHVGL+rTzCM+QTlQ9fh
 nfTLYEksEN6e4B4rfkjyetg68Zz3i7Euq8ekaztOScl/M2C4X3CXGz+MXESyHqXfJcY8AeSN0hS
 a9OEPekN
X-Proofpoint-GUID: KNch--vTMxeXaluXkbzm7RcFTTq_p6sS
X-Proofpoint-ORIG-GUID: KNch--vTMxeXaluXkbzm7RcFTTq_p6sS
X-Authority-Analysis: v=2.4 cv=Xpv6OUF9 c=1 sm=1 tr=0 ts=6895baf9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=tkZEzfabOtbtaFzRxSIA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508080066

From: Jorge Ramirez-Ortiz <jorge@foundries.io>

Correctly sort the array of venus_dt_match entries.

Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
---
 drivers/media/platform/qcom/venus/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index adc38fbc9d79..9604a7eed49d 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1074,11 +1074,11 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
+	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
-	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
-	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
 	{ }
 };
-- 
2.34.1


