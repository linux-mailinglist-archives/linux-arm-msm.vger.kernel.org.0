Return-Path: <linux-arm-msm+bounces-88519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBCAD12077
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA63A314F111
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A888C33AD95;
	Mon, 12 Jan 2026 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLdWcpJ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVrVZLUT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF12F33B962
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214871; cv=none; b=MmYuT/Fcih/NV53ONY6u6IOt7i+8ee0u98eJooNqSReTnFPkxZ/3B4Z7NYRaFJ3hFoTjzVGJHkIvfRI3WvbEDjkDjz/lJnQwja1z7Yw571pGJbwa6Y77du6IoDan0vXtUOJo1cs2avUIqsZ0G46HFZ7LDlZWYLVkakPbNq9uLbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214871; c=relaxed/simple;
	bh=85mnIBih5TefJNp/bHk7qTk7tspz31Q1DwJ4d0ufNMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HFnebWuiCuR9D0hAr8Bl/FzvzBWvzSLH/6Ud8x945Mb8NOUhzHrSku0Vcs/7xCN9kVad2w4qsZujFJSdI374AP9S7so+ewo3eUoufeciJVj//WMdGkczHiF/GNH62x+S6uSigUCQ0BUYRqmq+T+karzN/elXFMxTAGODFzQqH5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLdWcpJ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DVrVZLUT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C9F2sZ1092197
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GkgK+E57psN
	HC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=; b=RLdWcpJ3iCEeozKiYqjx5kWHwQc
	xflUyZEnJpit9nTD7hpjkditFQepucjuV5k9YC6HfXV/4YEWIr7JqFCUfiUME/KW
	SgsYjHFfGy4Ila8B55EwBphdBRspZDck0q/Uyt/jRhcZgzNl1O4TgoyFb3x8Xaaj
	zE0VNu91cDo0TXyvQLLdh750yweXTB6SJ0JJuTPCqRZi+GGOTpbntYmVjyxOZysX
	XrU0sGn+346uDWoLljj/rg239uAZRFAIshF2Z8w1/rIL1CcI4p1rtC36Zy78HIzu
	t5Oh/YikwriduRXrWSHPKLGGxV6l57iOBUbMEvtu+7kLsq54EldjkE/cinA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmx5mg93w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:47:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f2481ab87so1449575b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214867; x=1768819667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkgK+E57psNHC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=;
        b=DVrVZLUTszVNrxdk1L2n8eijpMSAs4C9eLUEu4xI2jRPp7tQqlCSC8CdFXp+0pniD1
         kaYOsoaRRdmiaA585n1I+oeH7ls85oYBkKykAOBCE9XQL92fgi6mmedtDwqUNrnzMit0
         er5ykOONZ7I+ozQBTLMhORbhLnWFaEwRDb4a1/0Ixcad3Kj24jgWTmvW+jaPZTHVeC36
         rgY7DD6RrVasnKztFuO3D6ZhkO7low24RxktAZIYcFIyZl7NA2DV02p6y7SybmXKhd/M
         x1dT2k0CUvoNMu28AP89MtM/CO+19aG6vYdfVsTgJHTvEp8IH8wJcVhPT6ana/kpWKhJ
         44/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214867; x=1768819667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GkgK+E57psNHC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=;
        b=GpgKObKPBUPkAtvzLRW6OsnjBv/mpu02YBxToO02TmEt7yvjUCIMeebJz3IrujTTaV
         /t6RUk4fKVhM7/wVsdjDX0YHazd+RYQ7HzDR1vyBZtZRYb91KzHxjg5/0ukb/PRFbiiU
         0ONJNBkIZY4xuvd819tmRC2GtMoz+82jLbtOUWA1NRTX8D/ix2ZoRm07Lp6U258NObUu
         Rd2KiuARqcV60H0gZFrrSuQEZcMEQ70NE5XmHGoQpr+tjl0YnyppPYCAehKOhWPHrvRZ
         WEDx38wHQ4cpXEkyL24ogyMYk9gzTTVJGUxCzCyUNYs8tontbm6M295JtF3jbUR68Sws
         NLTQ==
X-Forwarded-Encrypted: i=1; AJvYcCURgsIyTq2v+i5W8DzjLa6ZWIKzNPkHTX0rWknxLhVhcneJAtmbuamF88KFdNbWjfaNiHhdqjoO9860cFQc@vger.kernel.org
X-Gm-Message-State: AOJu0YyG5eZxv3bleR0TagoRcRlA8+q1272JEzJxISjO2ARBksAuLMPn
	L10zTYZBRQVZXPPA3jzuUFvXHMfRHeZQ7Jv04GS3DdsbjydI+EZjW+m0iPup8dupZc0/p7gDn8z
	H85SHx/jg1Myz9NdUkQXiTU8aALsj+0WC3OVDG7O50qdq9V5MIBz3xl0unshp7lh3BxE/
X-Gm-Gg: AY/fxX6eTuJYBMkUmUjnHA9aIv1MHY3n8DUophq0MfRN1eEVrQA/dq8bGal7kUwdnvp
	ovB+0qHA5J6/B/kcchmEnxZUFVVEWYq458CDzE/V3epROFmLTIDWpVv/vP2WyCLe8eP39G3BgH1
	VYGuiSFnheJTkkYQ0hISgu5SL4ww6bBDXmb+HvypFffymgYn78D1PYrvRlOsqfZPbTT+HY6jpxw
	KHbMTjqzB3QGZqutWKqkkTyUaXftv38FTm89pOP7FgawoYeoyt3d9l2F0Lh+Ai0UtRbzkVnuVaN
	k6i0IwHO31rymHnlqFkh3favizweGK2hMjOY0luHnCiRcJWnCzEXeHJ+0Pk3OWIcjbWnVuipCps
	qcg14s+5+NGGjmDRDQBzF2vYuPcp7SNLOeG/NDcrUH7Y=
X-Received: by 2002:a05:6a00:2a0e:b0:817:9a85:54af with SMTP id d2e1a72fcca58-81b806ce675mr13419685b3a.43.1768214866500;
        Mon, 12 Jan 2026 02:47:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUJz1BsN0xziqcwniKloQe5XJwgl782sIHwC6QTj0wp087TMrKSssCFQTMOkzmjqOon3msZw==
X-Received: by 2002:a05:6a00:2a0e:b0:817:9a85:54af with SMTP id d2e1a72fcca58-81b806ce675mr13419653b3a.43.1768214865866;
        Mon, 12 Jan 2026 02:47:45 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:47:45 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 02/12] soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
Date: Mon, 12 Jan 2026 16:17:12 +0530
Message-Id: <20260112104722.591521-3-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfX++2L8ZTFDbJQ
 oUQrYTqBxVvSzIUAOvXnqZxGfc//KgboB/QbaFh9hLriEX05yGfLT14ATl0Oa53zbbec7S/SD+q
 Tz24kvS1eZJm7WW6fVGdEjbNToduM+c59oiM+sfA7YNbULvyX0fcFAEOUaQf7qfgHwDFpylFdMi
 0TFT1TLuz6byYzj+v9zRafrku0B796E5cOs2dLcjZGZKgt22gKUB/3fxNlh+pE97YB9QCLKLeek
 46M8/1T5YRtlPyN2hKyLAtcQb4fXSs5FcJ0Ct9q7UoDpmRTuCWTeuBkl92OVWSLigp+R53djlBA
 9TVAMpyaVmqblVw9GgOjUvinwOCFoKfvQfj5UxqG+kDYEdnktEsfu7tSd0/eqzkUVYmuoUeyIww
 tCpP27n2vWdP3p0ZFWCRSVNnUcbMe7N0GGH09P8w9+a/htf3jb6Jriz4V9W892v3ZtPpkaPiJTh
 qKvpF+DcnNklqL9NDmg==
X-Proofpoint-ORIG-GUID: u57HmX9YOTSKO9g-Q5rJsjG1mW_ny1AC
X-Proofpoint-GUID: u57HmX9YOTSKO9g-Q5rJsjG1mW_ny1AC
X-Authority-Analysis: v=2.4 cv=Q8zfIo2a c=1 sm=1 tr=0 ts=6964d153 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BVB3BO4C9w_THQaB-9MA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120085

Add a new function geni_icc_set_bw_ab() that allows callers to set
average bandwidth values for all ICC (Interconnect) paths in a single
call. This function takes separate parameters for core, config, and DDR
average bandwidth values and applies them to the respective ICC paths.

This provides a more convenient API for drivers that need to configure
specific average bandwidth values.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 22 ++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index b6167b968ef6..b0542f836453 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -946,6 +946,28 @@ int geni_icc_set_bw(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_set_bw);
 
+/**
+ * geni_icc_set_bw_ab() - Set average bandwidth for all ICC paths and apply
+ * @se:		Pointer to the concerned serial engine.
+ * @core_ab:	Average bandwidth in kBps for GENI_TO_CORE path.
+ * @cfg_ab:	Average bandwidth in kBps for CPU_TO_GENI path.
+ * @ddr_ab:	Average bandwidth in kBps for GENI_TO_DDR path.
+ *
+ * Sets bandwidth values for all ICC paths and applies them. DDR path is
+ * optional and only set if it exists.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int geni_icc_set_bw_ab(struct geni_se *se, u32 core_ab, u32 cfg_ab, u32 ddr_ab)
+{
+	se->icc_paths[GENI_TO_CORE].avg_bw = core_ab;
+	se->icc_paths[CPU_TO_GENI].avg_bw = cfg_ab;
+	se->icc_paths[GENI_TO_DDR].avg_bw = ddr_ab;
+
+	return geni_icc_set_bw(se);
+}
+EXPORT_SYMBOL_GPL(geni_icc_set_bw_ab);
+
 void geni_icc_set_tag(struct geni_se *se, u32 tag)
 {
 	int i;
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 0a984e2579fe..980aabea2157 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -528,6 +528,7 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len);
 int geni_icc_get(struct geni_se *se, const char *icc_ddr);
 
 int geni_icc_set_bw(struct geni_se *se);
+int geni_icc_set_bw_ab(struct geni_se *se, u32 core_ab, u32 cfg_ab, u32 ddr_ab);
 void geni_icc_set_tag(struct geni_se *se, u32 tag);
 
 int geni_icc_enable(struct geni_se *se);
-- 
2.34.1


