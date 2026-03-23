Return-Path: <linux-arm-msm+bounces-99082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBX/FomVwGmxIwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:21:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C58E72EB706
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D738304C942
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 01:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E0F225397;
	Mon, 23 Mar 2026 01:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbYVYGPx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ch8ZXMg7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EEC1FBEA8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228679; cv=none; b=sjnI2bE8p4+JdQj2b7ej9zT1JPyvICGQHshG41LuKJ5PD8FBl82pFtHsUUI0SneOy+aIt9S7WnQoyIB+ek8ZCTMjfmXYjvooA8Pc54kkGNBpRSxoOxzF66xs1aavJTwZhdTHWMQUpRWLboJsKj4f74Pfx1DtPpeONe//rU8hdUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228679; c=relaxed/simple;
	bh=xlgANSYz1nVuAn+eEd8ORnd+MmVt2YDubhoEruEPI8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Et6BJC6O040E22Bu0Amze/CdL8y6MC6dmwIylpCGJV8Xo5rXaBnDbnmk2UDXqbANo3qGiYFmx8WmOM8zdFMjS+BVT6RzUbVfG4pFPjpSXk69uD/X0IlYBNOEXQm3RmhwkXIdGaGqS52DxY8VW+hoBmcGX+UsFV1Bf520BKT2f+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbYVYGPx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ch8ZXMg7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MKqElM4129218
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G9LTxh8oFF0MTnQoxhWBFdZ1ygvExjdzayTcMvG/8ts=; b=FbYVYGPxUpc+l0EO
	Qtjw6wr/sUjP7j0qnKKoFQkjb6PwaApYNDyen284U2cmQP0uRPa+JUAJf4qszN47
	yedAegX5VqqAG13ovsMzmF/7AjKGEd8xgBXr8kSSucbwggqLh5Mncwc8HxX9Cm3v
	OHsH6m+yKcv2MAAhhd4sFJpMvxddcIvf+BY4lcnlJIVMQbaMCZ6RxisrIV4UfXdp
	X9y/Y+Zjv5WDllOG/xZH1dFCyaOcob+tcxRq2CSTJsJUjJLpVp1lSr3u35eNfDiX
	dvxl/UL+jjQZgVzbZxZwH/WxyAG522woz5jjNsqYzcvpxS60nB7QoQVDqaph3JGg
	d2o2+Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1gpk3epg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091782ab06so36073211cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228673; x=1774833473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9LTxh8oFF0MTnQoxhWBFdZ1ygvExjdzayTcMvG/8ts=;
        b=ch8ZXMg7ZmsY3RhkgDcGWQ1R6fMbYQWdoUwa3KcCgfGWc/nuWgMNf44IZk+OwO9DXH
         EAS1tTRaBbU0rfQ4DfJaj+rtcLWNVtAzdBWFSf5ffuQ6OJXcqYc6qR1yzcNzXeqJJ0CA
         X78B8ZUfWXUKG7+FRNVZjk6i48kFDpfdbX/m6/DxsQw8XSHpfUjEY7d9mA2jvPJ/DCyJ
         +nKbDLKDXPQygRJdPzwHEjmvpAym2E07zXDlnRCPZgsYhdFsOHji5zwtq9AC4OV656S0
         bx3gMIpSeOBxJILwWLw2FhzhV8neoOy0jR7mIrfKKf6xYPzsSoYO4aluDpujAvnBUrsb
         Kd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228673; x=1774833473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G9LTxh8oFF0MTnQoxhWBFdZ1ygvExjdzayTcMvG/8ts=;
        b=KIHS2GVdu1gytJiTyv4S1piwunJ1sDsifxKmxo2IGXnAjmM+PqD8x7ybFiKErF70rU
         SWETIcxbP2U/FkA0uXfeFvgrc/0pfaK6iw20MXmweAp8sOpuooBYtcMzblDgOMPKxsOQ
         qfLfrlklfQmRTLEdTDOILc+BsmQ059ECjw3H9+J7OowDrv3xUlyEBYkrlRWj8AIFcPAD
         Y8uQYJ+I1NCB75JF4XHgjvQOx/DRyrVB2f4Uc1OXI9JpSfjdJj/RC7MZ7xD46annjeMd
         YgBvub9IixWZoC4bhEg5wIrShcNxKdEVO+OEsue4rG3DeVLglVMgZU9k8czzigsWBLyj
         pFeQ==
X-Gm-Message-State: AOJu0YyIUxP38QVgaaHzPMMc+li4IbIr1NRUGS7swnRNIlfwNNfA3byN
	DYqLuKM7MdCLannXsK6SDFx2J5cYmeQ6bgIfoyT5gmY36XZ5nsRN/EtCgJE8TbpJSwL78DJNqVB
	4qt2zhQYpJRURdhvRDunBIyBZeCmPc1/6+3795ZiI5NKsR2lpQAZEe8uTSSx4YqX1GvgN
X-Gm-Gg: ATEYQzwHEzykINmupYSgEC39SU8yLPKbiqsjIrVm8aWQ94+tHZRRvSq8z0BTLjnWplv
	a3PXsl7KL6bLF6kXm7z5lJHZbSfB0jmkpE2WoQjDOFIBhNVceXHxAI9njk1sWnegp8STS0P/aPH
	U8JcZpHD4NNs9SA0WtB5tQAk/21pMfIhrfSDVFLBGtS6b6f96bGr+PC+rPGSr+mMtza5W8eZxgn
	2ha5M98ARGKHMh/OkXRJ0csF297FsZbZ4kDHQGzsgpCLfwJCG3b/rQChiyzLt6qIY9IQvdzOCB+
	lBf3+18YTSpKjfvgPN5x29Y+HTqCH5mrCKQBGfh1MwIw/FaU7ABLcIrVTh1QeHjVSJk4pp9GHTu
	Ydeol7wzUUCIGfY1D9I2FPOrWiqHCrRVBPHWmLOt0amkcUk/KFB2Z9USUuG74WHyU2URgABp/bY
	ABlOdTACPQJuGUn4jMGkMj3/rAWJvtAf3dbYo=
X-Received: by 2002:a05:622a:8c4:b0:509:2527:d789 with SMTP id d75a77b69052e-50b373bdd66mr181422251cf.6.1774228673123;
        Sun, 22 Mar 2026 18:17:53 -0700 (PDT)
X-Received: by 2002:a05:622a:8c4:b0:509:2527:d789 with SMTP id d75a77b69052e-50b373bdd66mr181421841cf.6.1774228672517;
        Sun, 22 Mar 2026 18:17:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853050e7sm2216150e87.61.2026.03.22.18.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:17:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 03:17:24 +0200
Subject: [PATCH 8/9] interconnect: qcom: msm8974: expand DEFINE_QNODE
 macros
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-msm8974-icc-v1-8-7892b8d5f2ea@oss.qualcomm.com>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=39567;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xlgANSYz1nVuAn+eEd8ORnd+MmVt2YDubhoEruEPI8k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwJSfmpZhiiic1ahhJPUH6MjVOvgCX8qqMprOK
 LfKm7fiGn2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacCUnwAKCRCLPIo+Aiko
 1Qj3B/9Cg/TDyLrWwF27sRNrwFllBexpv014AQKruFBM3+5sGSo/tc1aSh9wo/c4J/Hbwqyfpj/
 De4tEuxCpjK+hGQcfNIB2MTxnN/06ly5HxquOFUHGZ9qe6ZSexfOzRwKUi+/bZsSXpPvuc3IH0C
 AjBtOo+8FF+jCWVX20nzR6u0JkfsY0Vf/JkQDNwrMLrfc1utVyXldK7xSpuaocrW6LNCh9YBULM
 z75sLbtUyjrXiOs00mTha6XL1OtmOM/xtiM9asZAOTk+st+xvGsiN5rkr+pZ10GZ0K4epQBkPPt
 mchBBb8r493aTmOxwBhQXJRDcQlXrTPtgqLDExU8XmmKchKp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 097bDOzu_xpT1HeXYfpAjuPeNKgF3l3a
X-Proofpoint-GUID: 097bDOzu_xpT1HeXYfpAjuPeNKgF3l3a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfX/i2FknTxmkpS
 eNQpb2K96Cl2SdKd/72OhbZ3exX/jJbLoq/5JV8INxho8u6QRP3olyzpIfWmdUDkb8I+BMVekT9
 r6qGso2kQ5Wii1uSuEzP/pP8G9ox9UMZZ7wO+gR6h+ezL4mIvEDfmA4vIi0F/LEkDsvhg4WdHPD
 d/4JG07mkrNSPf7hktI7dzEWwMvLp/W8fVXmWxzUOF+6p9Ott64nogBODKekkX03O5MW+Zfd9Wp
 Cz/eg8VLJQ2DSOAOb9PmQ/1NGuasI4zTChtxJFG0jIOMI7NSfrqHQHzC6f3dZ3zZnU0G8/QtC7l
 fi+8Mw5MXLs/NAA7MUnUTgRk6sVHfvxjw5zFATSd6l2tywh+5LRHhy0S4AOUAjC3p0Mlxkzb8Ih
 bxemmOJH5emgFlZjkTxRKO9Jq+N2dhTTeX7m6if/pUFRbMxIW8Iv+X7mASc2jKPLjuEee5HpA1r
 d47+9pESYeD08jDOSeg==
X-Authority-Analysis: v=2.4 cv=QKhlhwLL c=1 sm=1 tr=0 ts=69c094c2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=gU3Gd9FrbIblE3rB6ncA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230008
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99082-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C58E72EB706
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The rest of Qualcomm Interconnect drivers have stopped using
DEFINE_QNODE long ago for the sake of readability. Stop using it inside
the msm8974 interconnect driver too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/msm8974.c | 1335 +++++++++++++++++++++++++++++++----
 1 file changed, 1191 insertions(+), 144 deletions(-)

diff --git a/drivers/interconnect/qcom/msm8974.c b/drivers/interconnect/qcom/msm8974.c
index 144f225ec885..c020c61126ca 100644
--- a/drivers/interconnect/qcom/msm8974.c
+++ b/drivers/interconnect/qcom/msm8974.c
@@ -181,28 +181,75 @@ static int msm8974_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
 	return 0;
 };
 
-#define DEFINE_QNODE(_name, _id, _buswidth, _mas_rpm_id, _slv_rpm_id,	\
-		     ...)						\
-		static const u16 _name ## _links[] = {			\
-			__VA_ARGS__					\
-		};							\
-		static struct qcom_icc_node _name = {			\
-		.name = #_name,						\
-		.id = _id,						\
-		.buswidth = _buswidth,					\
-		.mas_rpm_id = _mas_rpm_id,				\
-		.slv_rpm_id = _slv_rpm_id,				\
-		.num_links = ARRAY_SIZE(_name ## _links),		\
-		.links = _name ## _links,				\
-	}
-
-DEFINE_QNODE(mas_ampss_m0, MSM8974_BIMC_MAS_AMPSS_M0, 8, 0, -1);
-DEFINE_QNODE(mas_ampss_m1, MSM8974_BIMC_MAS_AMPSS_M1, 8, 0, -1);
-DEFINE_QNODE(mas_mss_proc, MSM8974_BIMC_MAS_MSS_PROC, 8, 1, -1);
-DEFINE_QNODE(bimc_to_mnoc, MSM8974_BIMC_TO_MNOC, 8, 2, -1, MSM8974_BIMC_SLV_EBI_CH0);
-DEFINE_QNODE(bimc_to_snoc, MSM8974_BIMC_TO_SNOC, 8, 3, 2, MSM8974_SNOC_TO_BIMC, MSM8974_BIMC_SLV_EBI_CH0, MSM8974_BIMC_MAS_AMPSS_M0);
-DEFINE_QNODE(slv_ebi_ch0, MSM8974_BIMC_SLV_EBI_CH0, 8, -1, 0);
-DEFINE_QNODE(slv_ampss_l2, MSM8974_BIMC_SLV_AMPSS_L2, 8, -1, 1);
+static struct qcom_icc_node mas_ampss_m0 = {
+	.name = "mas_ampss_m0",
+	.id = MSM8974_BIMC_MAS_AMPSS_M0,
+	.buswidth = 8,
+	.mas_rpm_id = 0,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_ampss_m1 = {
+	.name = "mas_ampss_m1",
+	.id = MSM8974_BIMC_MAS_AMPSS_M1,
+	.buswidth = 8,
+	.mas_rpm_id = 0,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_mss_proc = {
+	.name = "mas_mss_proc",
+	.id = MSM8974_BIMC_MAS_MSS_PROC,
+	.buswidth = 8,
+	.mas_rpm_id = 1,
+	.slv_rpm_id = -1,
+};
+
+static const u16 bimc_to_mnoc_links[] = {
+	MSM8974_BIMC_SLV_EBI_CH0
+};
+
+static struct qcom_icc_node bimc_to_mnoc = {
+	.name = "bimc_to_mnoc",
+	.id = MSM8974_BIMC_TO_MNOC,
+	.buswidth = 8,
+	.mas_rpm_id = 2,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(bimc_to_mnoc_links),
+	.links = bimc_to_mnoc_links,
+};
+
+static const u16 bimc_to_snoc_links[] = {
+	MSM8974_SNOC_TO_BIMC,
+	MSM8974_BIMC_SLV_EBI_CH0,
+	MSM8974_BIMC_MAS_AMPSS_M0
+};
+
+static struct qcom_icc_node bimc_to_snoc = {
+	.name = "bimc_to_snoc",
+	.id = MSM8974_BIMC_TO_SNOC,
+	.buswidth = 8,
+	.mas_rpm_id = 3,
+	.slv_rpm_id = 2,
+	.num_links = ARRAY_SIZE(bimc_to_snoc_links),
+	.links = bimc_to_snoc_links,
+};
+
+static struct qcom_icc_node slv_ebi_ch0 = {
+	.name = "slv_ebi_ch0",
+	.id = MSM8974_BIMC_SLV_EBI_CH0,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 0,
+};
+
+static struct qcom_icc_node slv_ampss_l2 = {
+	.name = "slv_ampss_l2",
+	.id = MSM8974_BIMC_SLV_AMPSS_L2,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 1,
+};
 
 static struct qcom_icc_node * const msm8974_bimc_nodes[] = {
 	[BIMC_MAS_AMPSS_M0] = &mas_ampss_m0,
@@ -222,43 +269,301 @@ static const struct qcom_icc_desc msm8974_bimc = {
 	.ignore_enxio = true,
 };
 
-DEFINE_QNODE(mas_rpm_inst, MSM8974_CNOC_MAS_RPM_INST, 8, 45, -1);
-DEFINE_QNODE(mas_rpm_data, MSM8974_CNOC_MAS_RPM_DATA, 8, 46, -1);
-DEFINE_QNODE(mas_rpm_sys, MSM8974_CNOC_MAS_RPM_SYS, 8, 47, -1);
-DEFINE_QNODE(mas_dehr, MSM8974_CNOC_MAS_DEHR, 8, 48, -1);
-DEFINE_QNODE(mas_qdss_dap, MSM8974_CNOC_MAS_QDSS_DAP, 8, 49, -1);
-DEFINE_QNODE(mas_spdm, MSM8974_CNOC_MAS_SPDM, 8, 50, -1);
-DEFINE_QNODE(mas_tic, MSM8974_CNOC_MAS_TIC, 8, 51, -1);
-DEFINE_QNODE(slv_clk_ctl, MSM8974_CNOC_SLV_CLK_CTL, 8, -1, 47);
-DEFINE_QNODE(slv_cnoc_mss, MSM8974_CNOC_SLV_CNOC_MSS, 8, -1, 48);
-DEFINE_QNODE(slv_security, MSM8974_CNOC_SLV_SECURITY, 8, -1, 49);
-DEFINE_QNODE(slv_tcsr, MSM8974_CNOC_SLV_TCSR, 8, -1, 50);
-DEFINE_QNODE(slv_tlmm, MSM8974_CNOC_SLV_TLMM, 8, -1, 51);
-DEFINE_QNODE(slv_crypto_0_cfg, MSM8974_CNOC_SLV_CRYPTO_0_CFG, 8, -1, 52);
-DEFINE_QNODE(slv_crypto_1_cfg, MSM8974_CNOC_SLV_CRYPTO_1_CFG, 8, -1, 53);
-DEFINE_QNODE(slv_imem_cfg, MSM8974_CNOC_SLV_IMEM_CFG, 8, -1, 54);
-DEFINE_QNODE(slv_message_ram, MSM8974_CNOC_SLV_MESSAGE_RAM, 8, -1, 55);
-DEFINE_QNODE(slv_bimc_cfg, MSM8974_CNOC_SLV_BIMC_CFG, 8, -1, 56);
-DEFINE_QNODE(slv_boot_rom, MSM8974_CNOC_SLV_BOOT_ROM, 8, -1, 57);
-DEFINE_QNODE(slv_pmic_arb, MSM8974_CNOC_SLV_PMIC_ARB, 8, -1, 59);
-DEFINE_QNODE(slv_spdm_wrapper, MSM8974_CNOC_SLV_SPDM_WRAPPER, 8, -1, 60);
-DEFINE_QNODE(slv_dehr_cfg, MSM8974_CNOC_SLV_DEHR_CFG, 8, -1, 61);
-DEFINE_QNODE(slv_mpm, MSM8974_CNOC_SLV_MPM, 8, -1, 62);
-DEFINE_QNODE(slv_qdss_cfg, MSM8974_CNOC_SLV_QDSS_CFG, 8, -1, 63);
-DEFINE_QNODE(slv_rbcpr_cfg, MSM8974_CNOC_SLV_RBCPR_CFG, 8, -1, 64);
-DEFINE_QNODE(slv_rbcpr_qdss_apu_cfg, MSM8974_CNOC_SLV_RBCPR_QDSS_APU_CFG, 8, -1, 65);
-DEFINE_QNODE(cnoc_to_snoc, MSM8974_CNOC_TO_SNOC, 8, 52, 75);
-DEFINE_QNODE(slv_cnoc_onoc_cfg, MSM8974_CNOC_SLV_CNOC_ONOC_CFG, 8, -1, 68);
-DEFINE_QNODE(slv_cnoc_mnoc_mmss_cfg, MSM8974_CNOC_SLV_CNOC_MNOC_MMSS_CFG, 8, -1, 58);
-DEFINE_QNODE(slv_cnoc_mnoc_cfg, MSM8974_CNOC_SLV_CNOC_MNOC_CFG, 8, -1, 66);
-DEFINE_QNODE(slv_pnoc_cfg, MSM8974_CNOC_SLV_PNOC_CFG, 8, -1, 69);
-DEFINE_QNODE(slv_snoc_mpu_cfg, MSM8974_CNOC_SLV_SNOC_MPU_CFG, 8, -1, 67);
-DEFINE_QNODE(slv_snoc_cfg, MSM8974_CNOC_SLV_SNOC_CFG, 8, -1, 70);
-DEFINE_QNODE(slv_ebi1_dll_cfg, MSM8974_CNOC_SLV_EBI1_DLL_CFG, 8, -1, 71);
-DEFINE_QNODE(slv_phy_apu_cfg, MSM8974_CNOC_SLV_PHY_APU_CFG, 8, -1, 72);
-DEFINE_QNODE(slv_ebi1_phy_cfg, MSM8974_CNOC_SLV_EBI1_PHY_CFG, 8, -1, 73);
-DEFINE_QNODE(slv_rpm, MSM8974_CNOC_SLV_RPM, 8, -1, 74);
-DEFINE_QNODE(slv_service_cnoc, MSM8974_CNOC_SLV_SERVICE_CNOC, 8, -1, 76);
+static struct qcom_icc_node mas_rpm_inst = {
+	.name = "mas_rpm_inst",
+	.id = MSM8974_CNOC_MAS_RPM_INST,
+	.buswidth = 8,
+	.mas_rpm_id = 45,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_rpm_data = {
+	.name = "mas_rpm_data",
+	.id = MSM8974_CNOC_MAS_RPM_DATA,
+	.buswidth = 8,
+	.mas_rpm_id = 46,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_rpm_sys = {
+	.name = "mas_rpm_sys",
+	.id = MSM8974_CNOC_MAS_RPM_SYS,
+	.buswidth = 8,
+	.mas_rpm_id = 47,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_dehr = {
+	.name = "mas_dehr",
+	.id = MSM8974_CNOC_MAS_DEHR,
+	.buswidth = 8,
+	.mas_rpm_id = 48,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_qdss_dap = {
+	.name = "mas_qdss_dap",
+	.id = MSM8974_CNOC_MAS_QDSS_DAP,
+	.buswidth = 8,
+	.mas_rpm_id = 49,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_spdm = {
+	.name = "mas_spdm",
+	.id = MSM8974_CNOC_MAS_SPDM,
+	.buswidth = 8,
+	.mas_rpm_id = 50,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_tic = {
+	.name = "mas_tic",
+	.id = MSM8974_CNOC_MAS_TIC,
+	.buswidth = 8,
+	.mas_rpm_id = 51,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node slv_clk_ctl = {
+	.name = "slv_clk_ctl",
+	.id = MSM8974_CNOC_SLV_CLK_CTL,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 47,
+};
+
+static struct qcom_icc_node slv_cnoc_mss = {
+	.name = "slv_cnoc_mss",
+	.id = MSM8974_CNOC_SLV_CNOC_MSS,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 48,
+};
+
+static struct qcom_icc_node slv_security = {
+	.name = "slv_security",
+	.id = MSM8974_CNOC_SLV_SECURITY,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 49,
+};
+
+static struct qcom_icc_node slv_tcsr = {
+	.name = "slv_tcsr",
+	.id = MSM8974_CNOC_SLV_TCSR,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 50,
+};
+
+static struct qcom_icc_node slv_tlmm = {
+	.name = "slv_tlmm",
+	.id = MSM8974_CNOC_SLV_TLMM,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 51,
+};
+
+static struct qcom_icc_node slv_crypto_0_cfg = {
+	.name = "slv_crypto_0_cfg",
+	.id = MSM8974_CNOC_SLV_CRYPTO_0_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 52,
+};
+
+static struct qcom_icc_node slv_crypto_1_cfg = {
+	.name = "slv_crypto_1_cfg",
+	.id = MSM8974_CNOC_SLV_CRYPTO_1_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 53,
+};
+
+static struct qcom_icc_node slv_imem_cfg = {
+	.name = "slv_imem_cfg",
+	.id = MSM8974_CNOC_SLV_IMEM_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 54,
+};
+
+static struct qcom_icc_node slv_message_ram = {
+	.name = "slv_message_ram",
+	.id = MSM8974_CNOC_SLV_MESSAGE_RAM,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 55,
+};
+
+static struct qcom_icc_node slv_bimc_cfg = {
+	.name = "slv_bimc_cfg",
+	.id = MSM8974_CNOC_SLV_BIMC_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 56,
+};
+
+static struct qcom_icc_node slv_boot_rom = {
+	.name = "slv_boot_rom",
+	.id = MSM8974_CNOC_SLV_BOOT_ROM,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 57,
+};
+
+static struct qcom_icc_node slv_pmic_arb = {
+	.name = "slv_pmic_arb",
+	.id = MSM8974_CNOC_SLV_PMIC_ARB,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 59,
+};
+
+static struct qcom_icc_node slv_spdm_wrapper = {
+	.name = "slv_spdm_wrapper",
+	.id = MSM8974_CNOC_SLV_SPDM_WRAPPER,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 60,
+};
+
+static struct qcom_icc_node slv_dehr_cfg = {
+	.name = "slv_dehr_cfg",
+	.id = MSM8974_CNOC_SLV_DEHR_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 61,
+};
+
+static struct qcom_icc_node slv_mpm = {
+	.name = "slv_mpm",
+	.id = MSM8974_CNOC_SLV_MPM,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 62,
+};
+
+static struct qcom_icc_node slv_qdss_cfg = {
+	.name = "slv_qdss_cfg",
+	.id = MSM8974_CNOC_SLV_QDSS_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 63,
+};
+
+static struct qcom_icc_node slv_rbcpr_cfg = {
+	.name = "slv_rbcpr_cfg",
+	.id = MSM8974_CNOC_SLV_RBCPR_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 64,
+};
+
+static struct qcom_icc_node slv_rbcpr_qdss_apu_cfg = {
+	.name = "slv_rbcpr_qdss_apu_cfg",
+	.id = MSM8974_CNOC_SLV_RBCPR_QDSS_APU_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 65,
+};
+
+static struct qcom_icc_node cnoc_to_snoc = {
+	.name = "cnoc_to_snoc",
+	.id = MSM8974_CNOC_TO_SNOC,
+	.buswidth = 8,
+	.mas_rpm_id = 52,
+	.slv_rpm_id = 75,
+};
+
+static struct qcom_icc_node slv_cnoc_onoc_cfg = {
+	.name = "slv_cnoc_onoc_cfg",
+	.id = MSM8974_CNOC_SLV_CNOC_ONOC_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 68,
+};
+
+static struct qcom_icc_node slv_cnoc_mnoc_mmss_cfg = {
+	.name = "slv_cnoc_mnoc_mmss_cfg",
+	.id = MSM8974_CNOC_SLV_CNOC_MNOC_MMSS_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 58,
+};
+
+static struct qcom_icc_node slv_cnoc_mnoc_cfg = {
+	.name = "slv_cnoc_mnoc_cfg",
+	.id = MSM8974_CNOC_SLV_CNOC_MNOC_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 66,
+};
+
+static struct qcom_icc_node slv_pnoc_cfg = {
+	.name = "slv_pnoc_cfg",
+	.id = MSM8974_CNOC_SLV_PNOC_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 69,
+};
+
+static struct qcom_icc_node slv_snoc_mpu_cfg = {
+	.name = "slv_snoc_mpu_cfg",
+	.id = MSM8974_CNOC_SLV_SNOC_MPU_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 67,
+};
+
+static struct qcom_icc_node slv_snoc_cfg = {
+	.name = "slv_snoc_cfg",
+	.id = MSM8974_CNOC_SLV_SNOC_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 70,
+};
+
+static struct qcom_icc_node slv_ebi1_dll_cfg = {
+	.name = "slv_ebi1_dll_cfg",
+	.id = MSM8974_CNOC_SLV_EBI1_DLL_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 71,
+};
+
+static struct qcom_icc_node slv_phy_apu_cfg = {
+	.name = "slv_phy_apu_cfg",
+	.id = MSM8974_CNOC_SLV_PHY_APU_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 72,
+};
+
+static struct qcom_icc_node slv_ebi1_phy_cfg = {
+	.name = "slv_ebi1_phy_cfg",
+	.id = MSM8974_CNOC_SLV_EBI1_PHY_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 73,
+};
+
+static struct qcom_icc_node slv_rpm = {
+	.name = "slv_rpm",
+	.id = MSM8974_CNOC_SLV_RPM,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 74,
+};
+
+static struct qcom_icc_node slv_service_cnoc = {
+	.name = "slv_service_cnoc",
+	.id = MSM8974_CNOC_SLV_SERVICE_CNOC,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 76,
+};
 
 static struct qcom_icc_node * const msm8974_cnoc_nodes[] = {
 	[CNOC_MAS_RPM_INST] = &mas_rpm_inst,
@@ -308,28 +613,211 @@ static const struct qcom_icc_desc msm8974_cnoc = {
 	.ignore_enxio = true,
 };
 
-DEFINE_QNODE(mas_graphics_3d, MSM8974_MNOC_MAS_GRAPHICS_3D, 16, 6, -1, MSM8974_MNOC_TO_BIMC);
-DEFINE_QNODE(mas_jpeg, MSM8974_MNOC_MAS_JPEG, 16, 7, -1, MSM8974_MNOC_TO_BIMC);
-DEFINE_QNODE(mas_mdp_port0, MSM8974_MNOC_MAS_MDP_PORT0, 16, 8, -1, MSM8974_MNOC_TO_BIMC);
-DEFINE_QNODE(mas_video_p0, MSM8974_MNOC_MAS_VIDEO_P0, 16, 9, -1);
-DEFINE_QNODE(mas_video_p1, MSM8974_MNOC_MAS_VIDEO_P1, 16, 10, -1);
-DEFINE_QNODE(mas_vfe, MSM8974_MNOC_MAS_VFE, 16, 11, -1, MSM8974_MNOC_TO_BIMC);
-DEFINE_QNODE(mnoc_to_cnoc, MSM8974_MNOC_TO_CNOC, 16, 4, -1);
-DEFINE_QNODE(mnoc_to_bimc, MSM8974_MNOC_TO_BIMC, 16, -1, 16, MSM8974_BIMC_TO_MNOC);
-DEFINE_QNODE(slv_camera_cfg, MSM8974_MNOC_SLV_CAMERA_CFG, 16, -1, 3);
-DEFINE_QNODE(slv_display_cfg, MSM8974_MNOC_SLV_DISPLAY_CFG, 16, -1, 4);
-DEFINE_QNODE(slv_ocmem_cfg, MSM8974_MNOC_SLV_OCMEM_CFG, 16, -1, 5);
-DEFINE_QNODE(slv_cpr_cfg, MSM8974_MNOC_SLV_CPR_CFG, 16, -1, 6);
-DEFINE_QNODE(slv_cpr_xpu_cfg, MSM8974_MNOC_SLV_CPR_XPU_CFG, 16, -1, 7);
-DEFINE_QNODE(slv_misc_cfg, MSM8974_MNOC_SLV_MISC_CFG, 16, -1, 8);
-DEFINE_QNODE(slv_misc_xpu_cfg, MSM8974_MNOC_SLV_MISC_XPU_CFG, 16, -1, 9);
-DEFINE_QNODE(slv_venus_cfg, MSM8974_MNOC_SLV_VENUS_CFG, 16, -1, 10);
-DEFINE_QNODE(slv_graphics_3d_cfg, MSM8974_MNOC_SLV_GRAPHICS_3D_CFG, 16, -1, 11);
-DEFINE_QNODE(slv_mmss_clk_cfg, MSM8974_MNOC_SLV_MMSS_CLK_CFG, 16, -1, 12);
-DEFINE_QNODE(slv_mmss_clk_xpu_cfg, MSM8974_MNOC_SLV_MMSS_CLK_XPU_CFG, 16, -1, 13);
-DEFINE_QNODE(slv_mnoc_mpu_cfg, MSM8974_MNOC_SLV_MNOC_MPU_CFG, 16, -1, 14);
-DEFINE_QNODE(slv_onoc_mpu_cfg, MSM8974_MNOC_SLV_ONOC_MPU_CFG, 16, -1, 15);
-DEFINE_QNODE(slv_service_mnoc, MSM8974_MNOC_SLV_SERVICE_MNOC, 16, -1, 17);
+static const u16 mas_graphics_3d_links[] = {
+	MSM8974_MNOC_TO_BIMC
+};
+
+static struct qcom_icc_node mas_graphics_3d = {
+	.name = "mas_graphics_3d",
+	.id = MSM8974_MNOC_MAS_GRAPHICS_3D,
+	.buswidth = 16,
+	.mas_rpm_id = 6,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_graphics_3d_links),
+	.links = mas_graphics_3d_links,
+};
+
+static const u16 mas_jpeg_links[] = {
+	MSM8974_MNOC_TO_BIMC
+};
+
+static struct qcom_icc_node mas_jpeg = {
+	.name = "mas_jpeg",
+	.id = MSM8974_MNOC_MAS_JPEG,
+	.buswidth = 16,
+	.mas_rpm_id = 7,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_jpeg_links),
+	.links = mas_jpeg_links,
+};
+
+static const u16 mas_mdp_port0_links[] = {
+	MSM8974_MNOC_TO_BIMC
+};
+
+static struct qcom_icc_node mas_mdp_port0 = {
+	.name = "mas_mdp_port0",
+	.id = MSM8974_MNOC_MAS_MDP_PORT0,
+	.buswidth = 16,
+	.mas_rpm_id = 8,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_mdp_port0_links),
+	.links = mas_mdp_port0_links,
+};
+
+static struct qcom_icc_node mas_video_p0 = {
+	.name = "mas_video_p0",
+	.id = MSM8974_MNOC_MAS_VIDEO_P0,
+	.buswidth = 16,
+	.mas_rpm_id = 9,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_video_p1 = {
+	.name = "mas_video_p1",
+	.id = MSM8974_MNOC_MAS_VIDEO_P1,
+	.buswidth = 16,
+	.mas_rpm_id = 10,
+	.slv_rpm_id = -1,
+};
+
+static const u16 mas_vfe_links[] = {
+	MSM8974_MNOC_TO_BIMC
+};
+
+static struct qcom_icc_node mas_vfe = {
+	.name = "mas_vfe",
+	.id = MSM8974_MNOC_MAS_VFE,
+	.buswidth = 16,
+	.mas_rpm_id = 11,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_vfe_links),
+	.links = mas_vfe_links,
+};
+
+static struct qcom_icc_node mnoc_to_cnoc = {
+	.name = "mnoc_to_cnoc",
+	.id = MSM8974_MNOC_TO_CNOC,
+	.buswidth = 16,
+	.mas_rpm_id = 4,
+	.slv_rpm_id = -1,
+};
+
+static const u16 mnoc_to_bimc_links[] = {
+	MSM8974_BIMC_TO_MNOC
+};
+
+static struct qcom_icc_node mnoc_to_bimc = {
+	.name = "mnoc_to_bimc",
+	.id = MSM8974_MNOC_TO_BIMC,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 16,
+	.num_links = ARRAY_SIZE(mnoc_to_bimc_links),
+	.links = mnoc_to_bimc_links,
+};
+
+static struct qcom_icc_node slv_camera_cfg = {
+	.name = "slv_camera_cfg",
+	.id = MSM8974_MNOC_SLV_CAMERA_CFG,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 3,
+};
+
+static struct qcom_icc_node slv_display_cfg = {
+	.name = "slv_display_cfg",
+	.id = MSM8974_MNOC_SLV_DISPLAY_CFG,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 4,
+};
+
+static struct qcom_icc_node slv_ocmem_cfg = {
+	.name = "slv_ocmem_cfg",
+	.id = MSM8974_MNOC_SLV_OCMEM_CFG,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 5,
+};
+
+static struct qcom_icc_node slv_cpr_cfg = {
+	.name = "slv_cpr_cfg",
+	.id = MSM8974_MNOC_SLV_CPR_CFG,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 6,
+};
+
+static struct qcom_icc_node slv_cpr_xpu_cfg = {
+	.name = "slv_cpr_xpu_cfg",
+	.id = MSM8974_MNOC_SLV_CPR_XPU_CFG,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 7,
+};
+
+static struct qcom_icc_node slv_misc_cfg = {
+	.name = "slv_misc_cfg",
+	.id = MSM8974_MNOC_SLV_MISC_CFG,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 8,
+};
+
+static struct qcom_icc_node slv_misc_xpu_cfg = {
+	.name = "slv_misc_xpu_cfg",
+	.id = MSM8974_MNOC_SLV_MISC_XPU_CFG,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 9,
+};
+
+static struct qcom_icc_node slv_venus_cfg = {
+	.name = "slv_venus_cfg",
+	.id = MSM8974_MNOC_SLV_VENUS_CFG,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 10,
+};
+
+static struct qcom_icc_node slv_graphics_3d_cfg = {
+	.name = "slv_graphics_3d_cfg",
+	.id = MSM8974_MNOC_SLV_GRAPHICS_3D_CFG,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 11,
+};
+
+static struct qcom_icc_node slv_mmss_clk_cfg = {
+	.name = "slv_mmss_clk_cfg",
+	.id = MSM8974_MNOC_SLV_MMSS_CLK_CFG,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 12,
+};
+
+static struct qcom_icc_node slv_mmss_clk_xpu_cfg = {
+	.name = "slv_mmss_clk_xpu_cfg",
+	.id = MSM8974_MNOC_SLV_MMSS_CLK_XPU_CFG,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 13,
+};
+
+static struct qcom_icc_node slv_mnoc_mpu_cfg = {
+	.name = "slv_mnoc_mpu_cfg",
+	.id = MSM8974_MNOC_SLV_MNOC_MPU_CFG,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 14,
+};
+
+static struct qcom_icc_node slv_onoc_mpu_cfg = {
+	.name = "slv_onoc_mpu_cfg",
+	.id = MSM8974_MNOC_SLV_ONOC_MPU_CFG,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 15,
+};
+
+static struct qcom_icc_node slv_service_mnoc = {
+	.name = "slv_service_mnoc",
+	.id = MSM8974_MNOC_SLV_SERVICE_MNOC,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 17,
+};
 
 static struct qcom_icc_node * const msm8974_mnoc_nodes[] = {
 	[MNOC_MAS_GRAPHICS_3D] = &mas_graphics_3d,
@@ -363,20 +851,121 @@ static const struct qcom_icc_desc msm8974_mnoc = {
 	.ignore_enxio = true,
 };
 
-DEFINE_QNODE(ocmem_noc_to_ocmem_vnoc, MSM8974_OCMEM_NOC_TO_OCMEM_VNOC, 16, 54, 78, MSM8974_OCMEM_SLV_OCMEM);
-DEFINE_QNODE(mas_jpeg_ocmem, MSM8974_OCMEM_MAS_JPEG_OCMEM, 16, 13, -1);
-DEFINE_QNODE(mas_mdp_ocmem, MSM8974_OCMEM_MAS_MDP_OCMEM, 16, 14, -1);
-DEFINE_QNODE(mas_video_p0_ocmem, MSM8974_OCMEM_MAS_VIDEO_P0_OCMEM, 16, 15, -1);
-DEFINE_QNODE(mas_video_p1_ocmem, MSM8974_OCMEM_MAS_VIDEO_P1_OCMEM, 16, 16, -1);
-DEFINE_QNODE(mas_vfe_ocmem, MSM8974_OCMEM_MAS_VFE_OCMEM, 16, 17, -1);
-DEFINE_QNODE(mas_cnoc_onoc_cfg, MSM8974_OCMEM_MAS_CNOC_ONOC_CFG, 16, 12, -1);
-DEFINE_QNODE(slv_service_onoc, MSM8974_OCMEM_SLV_SERVICE_ONOC, 16, -1, 19);
-DEFINE_QNODE(slv_ocmem, MSM8974_OCMEM_SLV_OCMEM, 16, -1, 18);
+static const u16 ocmem_noc_to_ocmem_vnoc_links[] = {
+	MSM8974_OCMEM_SLV_OCMEM
+};
+
+static struct qcom_icc_node ocmem_noc_to_ocmem_vnoc = {
+	.name = "ocmem_noc_to_ocmem_vnoc",
+	.id = MSM8974_OCMEM_NOC_TO_OCMEM_VNOC,
+	.buswidth = 16,
+	.mas_rpm_id = 54,
+	.slv_rpm_id = 78,
+	.num_links = ARRAY_SIZE(ocmem_noc_to_ocmem_vnoc_links),
+	.links = ocmem_noc_to_ocmem_vnoc_links,
+};
+
+static struct qcom_icc_node mas_jpeg_ocmem = {
+	.name = "mas_jpeg_ocmem",
+	.id = MSM8974_OCMEM_MAS_JPEG_OCMEM,
+	.buswidth = 16,
+	.mas_rpm_id = 13,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_mdp_ocmem = {
+	.name = "mas_mdp_ocmem",
+	.id = MSM8974_OCMEM_MAS_MDP_OCMEM,
+	.buswidth = 16,
+	.mas_rpm_id = 14,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_video_p0_ocmem = {
+	.name = "mas_video_p0_ocmem",
+	.id = MSM8974_OCMEM_MAS_VIDEO_P0_OCMEM,
+	.buswidth = 16,
+	.mas_rpm_id = 15,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_video_p1_ocmem = {
+	.name = "mas_video_p1_ocmem",
+	.id = MSM8974_OCMEM_MAS_VIDEO_P1_OCMEM,
+	.buswidth = 16,
+	.mas_rpm_id = 16,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_vfe_ocmem = {
+	.name = "mas_vfe_ocmem",
+	.id = MSM8974_OCMEM_MAS_VFE_OCMEM,
+	.buswidth = 16,
+	.mas_rpm_id = 17,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_cnoc_onoc_cfg = {
+	.name = "mas_cnoc_onoc_cfg",
+	.id = MSM8974_OCMEM_MAS_CNOC_ONOC_CFG,
+	.buswidth = 16,
+	.mas_rpm_id = 12,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node slv_service_onoc = {
+	.name = "slv_service_onoc",
+	.id = MSM8974_OCMEM_SLV_SERVICE_ONOC,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 19,
+};
+
+static struct qcom_icc_node slv_ocmem = {
+	.name = "slv_ocmem",
+	.id = MSM8974_OCMEM_SLV_OCMEM,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 18,
+};
 
 /* Virtual NoC is needed for connection to OCMEM */
-DEFINE_QNODE(ocmem_vnoc_to_onoc, MSM8974_OCMEM_VNOC_TO_OCMEM_NOC, 16, 56, 79, MSM8974_OCMEM_NOC_TO_OCMEM_VNOC);
-DEFINE_QNODE(ocmem_vnoc_to_snoc, MSM8974_OCMEM_VNOC_TO_SNOC, 8, 57, 80);
-DEFINE_QNODE(mas_v_ocmem_gfx3d, MSM8974_OCMEM_VNOC_MAS_GFX3D, 8, 55, -1, MSM8974_OCMEM_VNOC_TO_OCMEM_NOC);
+static const u16 ocmem_vnoc_to_onoc_links[] = {
+	MSM8974_OCMEM_NOC_TO_OCMEM_VNOC
+};
+
+static struct qcom_icc_node ocmem_vnoc_to_onoc = {
+	.name = "ocmem_vnoc_to_onoc",
+	.id = MSM8974_OCMEM_VNOC_TO_OCMEM_NOC,
+	.buswidth = 16,
+	.mas_rpm_id = 56,
+	.slv_rpm_id = 79,
+	.num_links = ARRAY_SIZE(ocmem_vnoc_to_onoc_links),
+	.links = ocmem_vnoc_to_onoc_links,
+};
+
+static struct qcom_icc_node ocmem_vnoc_to_snoc = {
+	.name = "ocmem_vnoc_to_snoc",
+	.id = MSM8974_OCMEM_VNOC_TO_SNOC,
+	.buswidth = 8,
+	.mas_rpm_id = 57,
+	.slv_rpm_id = 80,
+};
+
+static const u16 mas_v_ocmem_gfx3d_links[] = {
+	MSM8974_OCMEM_VNOC_TO_OCMEM_NOC
+};
+
+static struct qcom_icc_node mas_v_ocmem_gfx3d = {
+	.name = "mas_v_ocmem_gfx3d",
+	.id = MSM8974_OCMEM_VNOC_MAS_GFX3D,
+	.buswidth = 8,
+	.mas_rpm_id = 55,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_v_ocmem_gfx3d_links),
+	.links = mas_v_ocmem_gfx3d_links,
+};
+
 
 static struct qcom_icc_node * const msm8974_onoc_nodes[] = {
 	[OCMEM_NOC_TO_OCMEM_VNOC] = &ocmem_noc_to_ocmem_vnoc,
@@ -401,33 +990,288 @@ static const struct qcom_icc_desc msm8974_onoc = {
 	.ignore_enxio = true,
 };
 
-DEFINE_QNODE(mas_pnoc_cfg, MSM8974_PNOC_MAS_PNOC_CFG, 8, 43, -1);
-DEFINE_QNODE(mas_sdcc_1, MSM8974_PNOC_MAS_SDCC_1, 8, 33, -1, MSM8974_PNOC_TO_SNOC);
-DEFINE_QNODE(mas_sdcc_3, MSM8974_PNOC_MAS_SDCC_3, 8, 34, -1, MSM8974_PNOC_TO_SNOC);
-DEFINE_QNODE(mas_sdcc_4, MSM8974_PNOC_MAS_SDCC_4, 8, 36, -1, MSM8974_PNOC_TO_SNOC);
-DEFINE_QNODE(mas_sdcc_2, MSM8974_PNOC_MAS_SDCC_2, 8, 35, -1, MSM8974_PNOC_TO_SNOC);
-DEFINE_QNODE(mas_tsif, MSM8974_PNOC_MAS_TSIF, 8, 37, -1, MSM8974_PNOC_TO_SNOC);
-DEFINE_QNODE(mas_bam_dma, MSM8974_PNOC_MAS_BAM_DMA, 8, 38, -1);
-DEFINE_QNODE(mas_blsp_2, MSM8974_PNOC_MAS_BLSP_2, 8, 39, -1, MSM8974_PNOC_TO_SNOC);
-DEFINE_QNODE(mas_usb_hsic, MSM8974_PNOC_MAS_USB_HSIC, 8, 40, -1, MSM8974_PNOC_TO_SNOC);
-DEFINE_QNODE(mas_blsp_1, MSM8974_PNOC_MAS_BLSP_1, 8, 41, -1, MSM8974_PNOC_TO_SNOC);
-DEFINE_QNODE(mas_usb_hs, MSM8974_PNOC_MAS_USB_HS, 8, 42, -1, MSM8974_PNOC_TO_SNOC);
-DEFINE_QNODE(pnoc_to_snoc, MSM8974_PNOC_TO_SNOC, 8, 44, 45, MSM8974_SNOC_TO_PNOC, MSM8974_PNOC_SLV_PRNG);
-DEFINE_QNODE(slv_sdcc_1, MSM8974_PNOC_SLV_SDCC_1, 8, -1, 31);
-DEFINE_QNODE(slv_sdcc_3, MSM8974_PNOC_SLV_SDCC_3, 8, -1, 32);
-DEFINE_QNODE(slv_sdcc_2, MSM8974_PNOC_SLV_SDCC_2, 8, -1, 33);
-DEFINE_QNODE(slv_sdcc_4, MSM8974_PNOC_SLV_SDCC_4, 8, -1, 34);
-DEFINE_QNODE(slv_tsif, MSM8974_PNOC_SLV_TSIF, 8, -1, 35);
-DEFINE_QNODE(slv_bam_dma, MSM8974_PNOC_SLV_BAM_DMA, 8, -1, 36);
-DEFINE_QNODE(slv_blsp_2, MSM8974_PNOC_SLV_BLSP_2, 8, -1, 37);
-DEFINE_QNODE(slv_usb_hsic, MSM8974_PNOC_SLV_USB_HSIC, 8, -1, 38);
-DEFINE_QNODE(slv_blsp_1, MSM8974_PNOC_SLV_BLSP_1, 8, -1, 39);
-DEFINE_QNODE(slv_usb_hs, MSM8974_PNOC_SLV_USB_HS, 8, -1, 40);
-DEFINE_QNODE(slv_pdm, MSM8974_PNOC_SLV_PDM, 8, -1, 41);
-DEFINE_QNODE(slv_periph_apu_cfg, MSM8974_PNOC_SLV_PERIPH_APU_CFG, 8, -1, 42);
-DEFINE_QNODE(slv_pnoc_mpu_cfg, MSM8974_PNOC_SLV_PNOC_MPU_CFG, 8, -1, 43);
-DEFINE_QNODE(slv_prng, MSM8974_PNOC_SLV_PRNG, 8, -1, 44, MSM8974_PNOC_TO_SNOC);
-DEFINE_QNODE(slv_service_pnoc, MSM8974_PNOC_SLV_SERVICE_PNOC, 8, -1, 46);
+static struct qcom_icc_node mas_pnoc_cfg = {
+	.name = "mas_pnoc_cfg",
+	.id = MSM8974_PNOC_MAS_PNOC_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = 43,
+	.slv_rpm_id = -1,
+};
+
+static const u16 mas_sdcc_1_links[] = {
+	MSM8974_PNOC_TO_SNOC
+};
+
+static struct qcom_icc_node mas_sdcc_1 = {
+	.name = "mas_sdcc_1",
+	.id = MSM8974_PNOC_MAS_SDCC_1,
+	.buswidth = 8,
+	.mas_rpm_id = 33,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_sdcc_1_links),
+	.links = mas_sdcc_1_links,
+};
+
+static const u16 mas_sdcc_3_links[] = {
+	MSM8974_PNOC_TO_SNOC
+};
+
+static struct qcom_icc_node mas_sdcc_3 = {
+	.name = "mas_sdcc_3",
+	.id = MSM8974_PNOC_MAS_SDCC_3,
+	.buswidth = 8,
+	.mas_rpm_id = 34,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_sdcc_3_links),
+	.links = mas_sdcc_3_links,
+};
+
+static const u16 mas_sdcc_4_links[] = {
+	MSM8974_PNOC_TO_SNOC
+};
+
+static struct qcom_icc_node mas_sdcc_4 = {
+	.name = "mas_sdcc_4",
+	.id = MSM8974_PNOC_MAS_SDCC_4,
+	.buswidth = 8,
+	.mas_rpm_id = 36,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_sdcc_4_links),
+	.links = mas_sdcc_4_links,
+};
+
+static const u16 mas_sdcc_2_links[] = {
+	MSM8974_PNOC_TO_SNOC
+};
+
+static struct qcom_icc_node mas_sdcc_2 = {
+	.name = "mas_sdcc_2",
+	.id = MSM8974_PNOC_MAS_SDCC_2,
+	.buswidth = 8,
+	.mas_rpm_id = 35,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_sdcc_2_links),
+	.links = mas_sdcc_2_links,
+};
+
+static const u16 mas_tsif_links[] = {
+	MSM8974_PNOC_TO_SNOC
+};
+
+static struct qcom_icc_node mas_tsif = {
+	.name = "mas_tsif",
+	.id = MSM8974_PNOC_MAS_TSIF,
+	.buswidth = 8,
+	.mas_rpm_id = 37,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_tsif_links),
+	.links = mas_tsif_links,
+};
+
+static struct qcom_icc_node mas_bam_dma = {
+	.name = "mas_bam_dma",
+	.id = MSM8974_PNOC_MAS_BAM_DMA,
+	.buswidth = 8,
+	.mas_rpm_id = 38,
+	.slv_rpm_id = -1,
+};
+
+static const u16 mas_blsp_2_links[] = {
+	MSM8974_PNOC_TO_SNOC
+};
+
+static struct qcom_icc_node mas_blsp_2 = {
+	.name = "mas_blsp_2",
+	.id = MSM8974_PNOC_MAS_BLSP_2,
+	.buswidth = 8,
+	.mas_rpm_id = 39,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_blsp_2_links),
+	.links = mas_blsp_2_links,
+};
+
+static const u16 mas_usb_hsic_links[] = {
+	MSM8974_PNOC_TO_SNOC
+};
+
+static struct qcom_icc_node mas_usb_hsic = {
+	.name = "mas_usb_hsic",
+	.id = MSM8974_PNOC_MAS_USB_HSIC,
+	.buswidth = 8,
+	.mas_rpm_id = 40,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_usb_hsic_links),
+	.links = mas_usb_hsic_links,
+};
+
+static const u16 mas_blsp_1_links[] = {
+	MSM8974_PNOC_TO_SNOC
+};
+
+static struct qcom_icc_node mas_blsp_1 = {
+	.name = "mas_blsp_1",
+	.id = MSM8974_PNOC_MAS_BLSP_1,
+	.buswidth = 8,
+	.mas_rpm_id = 41,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_blsp_1_links),
+	.links = mas_blsp_1_links,
+};
+
+static const u16 mas_usb_hs_links[] = {
+	MSM8974_PNOC_TO_SNOC
+};
+
+static struct qcom_icc_node mas_usb_hs = {
+	.name = "mas_usb_hs",
+	.id = MSM8974_PNOC_MAS_USB_HS,
+	.buswidth = 8,
+	.mas_rpm_id = 42,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_usb_hs_links),
+	.links = mas_usb_hs_links,
+};
+
+static const u16 pnoc_to_snoc_links[] = {
+	MSM8974_SNOC_TO_PNOC,
+	MSM8974_PNOC_SLV_PRNG
+};
+
+static struct qcom_icc_node pnoc_to_snoc = {
+	.name = "pnoc_to_snoc",
+	.id = MSM8974_PNOC_TO_SNOC,
+	.buswidth = 8,
+	.mas_rpm_id = 44,
+	.slv_rpm_id = 45,
+	.num_links = ARRAY_SIZE(pnoc_to_snoc_links),
+	.links = pnoc_to_snoc_links,
+};
+
+static struct qcom_icc_node slv_sdcc_1 = {
+	.name = "slv_sdcc_1",
+	.id = MSM8974_PNOC_SLV_SDCC_1,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 31,
+};
+
+static struct qcom_icc_node slv_sdcc_3 = {
+	.name = "slv_sdcc_3",
+	.id = MSM8974_PNOC_SLV_SDCC_3,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 32,
+};
+
+static struct qcom_icc_node slv_sdcc_2 = {
+	.name = "slv_sdcc_2",
+	.id = MSM8974_PNOC_SLV_SDCC_2,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 33,
+};
+
+static struct qcom_icc_node slv_sdcc_4 = {
+	.name = "slv_sdcc_4",
+	.id = MSM8974_PNOC_SLV_SDCC_4,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 34,
+};
+
+static struct qcom_icc_node slv_tsif = {
+	.name = "slv_tsif",
+	.id = MSM8974_PNOC_SLV_TSIF,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 35,
+};
+
+static struct qcom_icc_node slv_bam_dma = {
+	.name = "slv_bam_dma",
+	.id = MSM8974_PNOC_SLV_BAM_DMA,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 36,
+};
+
+static struct qcom_icc_node slv_blsp_2 = {
+	.name = "slv_blsp_2",
+	.id = MSM8974_PNOC_SLV_BLSP_2,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 37,
+};
+
+static struct qcom_icc_node slv_usb_hsic = {
+	.name = "slv_usb_hsic",
+	.id = MSM8974_PNOC_SLV_USB_HSIC,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 38,
+};
+
+static struct qcom_icc_node slv_blsp_1 = {
+	.name = "slv_blsp_1",
+	.id = MSM8974_PNOC_SLV_BLSP_1,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 39,
+};
+
+static struct qcom_icc_node slv_usb_hs = {
+	.name = "slv_usb_hs",
+	.id = MSM8974_PNOC_SLV_USB_HS,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 40,
+};
+
+static struct qcom_icc_node slv_pdm = {
+	.name = "slv_pdm",
+	.id = MSM8974_PNOC_SLV_PDM,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 41,
+};
+
+static struct qcom_icc_node slv_periph_apu_cfg = {
+	.name = "slv_periph_apu_cfg",
+	.id = MSM8974_PNOC_SLV_PERIPH_APU_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 42,
+};
+
+static struct qcom_icc_node slv_pnoc_mpu_cfg = {
+	.name = "slv_pnoc_mpu_cfg",
+	.id = MSM8974_PNOC_SLV_PNOC_MPU_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 43,
+};
+
+static const u16 slv_prng_links[] = {
+	MSM8974_PNOC_TO_SNOC
+};
+
+static struct qcom_icc_node slv_prng = {
+	.name = "slv_prng",
+	.id = MSM8974_PNOC_SLV_PRNG,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 44,
+	.num_links = ARRAY_SIZE(slv_prng_links),
+	.links = slv_prng_links,
+};
+
+static struct qcom_icc_node slv_service_pnoc = {
+	.name = "slv_service_pnoc",
+	.id = MSM8974_PNOC_SLV_SERVICE_PNOC,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 46,
+};
 
 static struct qcom_icc_node * const msm8974_pnoc_nodes[] = {
 	[PNOC_MAS_PNOC_CFG] = &mas_pnoc_cfg,
@@ -468,30 +1312,233 @@ static const struct qcom_icc_desc msm8974_pnoc = {
 	.ignore_enxio = true,
 };
 
-DEFINE_QNODE(mas_lpass_ahb, MSM8974_SNOC_MAS_LPASS_AHB, 8, 18, -1);
-DEFINE_QNODE(mas_qdss_bam, MSM8974_SNOC_MAS_QDSS_BAM, 8, 19, -1);
-DEFINE_QNODE(mas_snoc_cfg, MSM8974_SNOC_MAS_SNOC_CFG, 8, 20, -1);
-DEFINE_QNODE(snoc_to_bimc, MSM8974_SNOC_TO_BIMC, 8, 21, 24, MSM8974_BIMC_TO_SNOC);
-DEFINE_QNODE(snoc_to_cnoc, MSM8974_SNOC_TO_CNOC, 8, 22, 25);
-DEFINE_QNODE(snoc_to_pnoc, MSM8974_SNOC_TO_PNOC, 8, 29, 28, MSM8974_PNOC_TO_SNOC);
-DEFINE_QNODE(snoc_to_ocmem_vnoc, MSM8974_SNOC_TO_OCMEM_VNOC, 8, 53, 77, MSM8974_OCMEM_VNOC_TO_OCMEM_NOC);
-DEFINE_QNODE(mas_crypto_core0, MSM8974_SNOC_MAS_CRYPTO_CORE0, 8, 23, -1, MSM8974_SNOC_TO_BIMC);
-DEFINE_QNODE(mas_crypto_core1, MSM8974_SNOC_MAS_CRYPTO_CORE1, 8, 24, -1);
-DEFINE_QNODE(mas_lpass_proc, MSM8974_SNOC_MAS_LPASS_PROC, 8, 25, -1, MSM8974_SNOC_TO_OCMEM_VNOC);
-DEFINE_QNODE(mas_mss, MSM8974_SNOC_MAS_MSS, 8, 26, -1);
-DEFINE_QNODE(mas_mss_nav, MSM8974_SNOC_MAS_MSS_NAV, 8, 27, -1);
-DEFINE_QNODE(mas_ocmem_dma, MSM8974_SNOC_MAS_OCMEM_DMA, 8, 28, -1);
-DEFINE_QNODE(mas_wcss, MSM8974_SNOC_MAS_WCSS, 8, 30, -1);
-DEFINE_QNODE(mas_qdss_etr, MSM8974_SNOC_MAS_QDSS_ETR, 8, 31, -1);
-DEFINE_QNODE(mas_usb3, MSM8974_SNOC_MAS_USB3, 8, 32, -1, MSM8974_SNOC_TO_BIMC);
-DEFINE_QNODE(slv_ampss, MSM8974_SNOC_SLV_AMPSS, 8, -1, 20);
-DEFINE_QNODE(slv_lpass, MSM8974_SNOC_SLV_LPASS, 8, -1, 21);
-DEFINE_QNODE(slv_usb3, MSM8974_SNOC_SLV_USB3, 8, -1, 22);
-DEFINE_QNODE(slv_wcss, MSM8974_SNOC_SLV_WCSS, 8, -1, 23);
-DEFINE_QNODE(slv_ocimem, MSM8974_SNOC_SLV_OCIMEM, 8, -1, 26);
-DEFINE_QNODE(slv_snoc_ocmem, MSM8974_SNOC_SLV_SNOC_OCMEM, 8, -1, 27);
-DEFINE_QNODE(slv_service_snoc, MSM8974_SNOC_SLV_SERVICE_SNOC, 8, -1, 29);
-DEFINE_QNODE(slv_qdss_stm, MSM8974_SNOC_SLV_QDSS_STM, 8, -1, 30);
+static struct qcom_icc_node mas_lpass_ahb = {
+	.name = "mas_lpass_ahb",
+	.id = MSM8974_SNOC_MAS_LPASS_AHB,
+	.buswidth = 8,
+	.mas_rpm_id = 18,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_qdss_bam = {
+	.name = "mas_qdss_bam",
+	.id = MSM8974_SNOC_MAS_QDSS_BAM,
+	.buswidth = 8,
+	.mas_rpm_id = 19,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_snoc_cfg = {
+	.name = "mas_snoc_cfg",
+	.id = MSM8974_SNOC_MAS_SNOC_CFG,
+	.buswidth = 8,
+	.mas_rpm_id = 20,
+	.slv_rpm_id = -1,
+};
+
+static const u16 snoc_to_bimc_links[] = {
+	MSM8974_BIMC_TO_SNOC
+};
+
+static struct qcom_icc_node snoc_to_bimc = {
+	.name = "snoc_to_bimc",
+	.id = MSM8974_SNOC_TO_BIMC,
+	.buswidth = 8,
+	.mas_rpm_id = 21,
+	.slv_rpm_id = 24,
+	.num_links = ARRAY_SIZE(snoc_to_bimc_links),
+	.links = snoc_to_bimc_links,
+};
+
+static struct qcom_icc_node snoc_to_cnoc = {
+	.name = "snoc_to_cnoc",
+	.id = MSM8974_SNOC_TO_CNOC,
+	.buswidth = 8,
+	.mas_rpm_id = 22,
+	.slv_rpm_id = 25,
+};
+
+static const u16 snoc_to_pnoc_links[] = {
+	MSM8974_PNOC_TO_SNOC
+};
+
+static struct qcom_icc_node snoc_to_pnoc = {
+	.name = "snoc_to_pnoc",
+	.id = MSM8974_SNOC_TO_PNOC,
+	.buswidth = 8,
+	.mas_rpm_id = 29,
+	.slv_rpm_id = 28,
+	.num_links = ARRAY_SIZE(snoc_to_pnoc_links),
+	.links = snoc_to_pnoc_links,
+};
+
+static const u16 snoc_to_ocmem_vnoc_links[] = {
+	MSM8974_OCMEM_VNOC_TO_OCMEM_NOC
+};
+
+static struct qcom_icc_node snoc_to_ocmem_vnoc = {
+	.name = "snoc_to_ocmem_vnoc",
+	.id = MSM8974_SNOC_TO_OCMEM_VNOC,
+	.buswidth = 8,
+	.mas_rpm_id = 53,
+	.slv_rpm_id = 77,
+	.num_links = ARRAY_SIZE(snoc_to_ocmem_vnoc_links),
+	.links = snoc_to_ocmem_vnoc_links,
+};
+
+static const u16 mas_crypto_core0_links[] = {
+	MSM8974_SNOC_TO_BIMC
+};
+
+static struct qcom_icc_node mas_crypto_core0 = {
+	.name = "mas_crypto_core0",
+	.id = MSM8974_SNOC_MAS_CRYPTO_CORE0,
+	.buswidth = 8,
+	.mas_rpm_id = 23,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_crypto_core0_links),
+	.links = mas_crypto_core0_links,
+};
+
+static struct qcom_icc_node mas_crypto_core1 = {
+	.name = "mas_crypto_core1",
+	.id = MSM8974_SNOC_MAS_CRYPTO_CORE1,
+	.buswidth = 8,
+	.mas_rpm_id = 24,
+	.slv_rpm_id = -1,
+};
+
+static const u16 mas_lpass_proc_links[] = {
+	MSM8974_SNOC_TO_OCMEM_VNOC
+};
+
+static struct qcom_icc_node mas_lpass_proc = {
+	.name = "mas_lpass_proc",
+	.id = MSM8974_SNOC_MAS_LPASS_PROC,
+	.buswidth = 8,
+	.mas_rpm_id = 25,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_lpass_proc_links),
+	.links = mas_lpass_proc_links,
+};
+
+static struct qcom_icc_node mas_mss = {
+	.name = "mas_mss",
+	.id = MSM8974_SNOC_MAS_MSS,
+	.buswidth = 8,
+	.mas_rpm_id = 26,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_mss_nav = {
+	.name = "mas_mss_nav",
+	.id = MSM8974_SNOC_MAS_MSS_NAV,
+	.buswidth = 8,
+	.mas_rpm_id = 27,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_ocmem_dma = {
+	.name = "mas_ocmem_dma",
+	.id = MSM8974_SNOC_MAS_OCMEM_DMA,
+	.buswidth = 8,
+	.mas_rpm_id = 28,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_wcss = {
+	.name = "mas_wcss",
+	.id = MSM8974_SNOC_MAS_WCSS,
+	.buswidth = 8,
+	.mas_rpm_id = 30,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node mas_qdss_etr = {
+	.name = "mas_qdss_etr",
+	.id = MSM8974_SNOC_MAS_QDSS_ETR,
+	.buswidth = 8,
+	.mas_rpm_id = 31,
+	.slv_rpm_id = -1,
+};
+
+static const u16 mas_usb3_links[] = {
+	MSM8974_SNOC_TO_BIMC
+};
+
+static struct qcom_icc_node mas_usb3 = {
+	.name = "mas_usb3",
+	.id = MSM8974_SNOC_MAS_USB3,
+	.buswidth = 8,
+	.mas_rpm_id = 32,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mas_usb3_links),
+	.links = mas_usb3_links,
+};
+
+static struct qcom_icc_node slv_ampss = {
+	.name = "slv_ampss",
+	.id = MSM8974_SNOC_SLV_AMPSS,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 20,
+};
+
+static struct qcom_icc_node slv_lpass = {
+	.name = "slv_lpass",
+	.id = MSM8974_SNOC_SLV_LPASS,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 21,
+};
+
+static struct qcom_icc_node slv_usb3 = {
+	.name = "slv_usb3",
+	.id = MSM8974_SNOC_SLV_USB3,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 22,
+};
+
+static struct qcom_icc_node slv_wcss = {
+	.name = "slv_wcss",
+	.id = MSM8974_SNOC_SLV_WCSS,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 23,
+};
+
+static struct qcom_icc_node slv_ocimem = {
+	.name = "slv_ocimem",
+	.id = MSM8974_SNOC_SLV_OCIMEM,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 26,
+};
+
+static struct qcom_icc_node slv_snoc_ocmem = {
+	.name = "slv_snoc_ocmem",
+	.id = MSM8974_SNOC_SLV_SNOC_OCMEM,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 27,
+};
+
+static struct qcom_icc_node slv_service_snoc = {
+	.name = "slv_service_snoc",
+	.id = MSM8974_SNOC_SLV_SERVICE_SNOC,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 29,
+};
+
+static struct qcom_icc_node slv_qdss_stm = {
+	.name = "slv_qdss_stm",
+	.id = MSM8974_SNOC_SLV_QDSS_STM,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 30,
+};
 
 static struct qcom_icc_node * const msm8974_snoc_nodes[] = {
 	[SNOC_MAS_LPASS_AHB] = &mas_lpass_ahb,

-- 
2.47.3


