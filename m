Return-Path: <linux-arm-msm+bounces-94389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPI8Hys3oWkbrQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:18:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE551B31FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C0E0312496C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0976E334C35;
	Fri, 27 Feb 2026 06:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HONesOLC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CuU+1nhg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC66F332607
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772172970; cv=none; b=tpnjHru2vRTiOmQTjWVHTA7fe6P2ecHCvqeFN59zUOkLRwEjkkvdKaRrjxnO4wz7COiyQ/kT+fQIFS+4HGKsnSftKkGCOzcyn7y78cvmsVkneJj3r7xrBAocPkFbqokjp2oJJbjjnfWji0pkRveHsU211ucad2G/kj+6iT+fE6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772172970; c=relaxed/simple;
	bh=85mnIBih5TefJNp/bHk7qTk7tspz31Q1DwJ4d0ufNMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oh48hmb9c47f7NnNrrRyu8gWWWCG2uagJXNaXhBgngjg4w+IG6KxlOIMifn/kO4gq1xz8iv27DA5i6hTw4BdpmGUe5DoUU0i/Q72ucXxcrioLE5c+gUKU2nXwMVe6qzsBRYpjJDCyKUAOam66dimTrpkBYmbi5cJ68hnteZMdbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HONesOLC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CuU+1nhg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2JxYJ1873164
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GkgK+E57psN
	HC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=; b=HONesOLCedQ9+wzv5b5Wfspo7aM
	BcjMYWNsF3vn3zLNFLA9uYem4eCRV1g5hVk23tdqbt2PYs5VtXDC2zfiFjRWVs2V
	bwpRWsDo5ltkKIvK8jARoHcv0d0lk0WReUQrVCyaWxHKdO2NRMYLtrUSZy6XGzRM
	a+ZBEUiBi6FAMeslkusa4WI2EG7yokhSjWMTyuiFCdQ2BPdOEh/KtV06ccNYwdV3
	rbqZoa7dI/CVvFuHSUubOsxIxsaltlVjWhL3pZJWVgX993FNuCB/QXE/S/LRxkTG
	jekYiluG8w/GtsaBSrsMtlHVQGItC5p6n77AFLjQcUDXkBYpeAW1JUEFdjQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuytstm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad3f8367bso18393745ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 22:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772172968; x=1772777768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkgK+E57psNHC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=;
        b=CuU+1nhgFrYmMr1LPszIVutrm6uKYNk4joN0/D/cKwwdpZLedqNaZr2+YczB4FWsU4
         FrAagrYLVF/0dCqYpXsPo4hjaUsN6JJ7BCtekFXTTOHof5JTBYJR1z24SGMIxHMQWhMt
         yT2oPN998RBQOatehfowacmHS1zb5FpFlNdM+Wmr0LBZOgiu09b1npq31FjP4R3ulNCR
         SqMDs1dnk49B+GpY8Ewc67C/e3yNNkDV7VZxiTFIdUijJ2I+gkyB45f3Bbnq727fO1uk
         ZbAr5iTmOosqd19qollMSiCKtGPyqrXp01Io1f+jwogMfGwRZLWYB0bW0npfVQg+8Mqd
         TrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772172968; x=1772777768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GkgK+E57psNHC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=;
        b=K8GUT2/DI1jB0c2q+SKARt5O4H1VuePIg/RhHgZ+6ZQ2ZUxQy49GwmZlXZ9jdazEcG
         BZAq+Wzc253WBo6vPTZl49I8d2E97Rxb0XNQmc7G8hohpj40HDxHcggrRKtDQqFJ2638
         ymMWjuusYEe9ffdjJ1ZWjnvN6lujnQcOh5MO11dvDKEvVvHA1lcVeFoePnuhQYl+H6LE
         zappSsAJ9/SNqR6OMnJ3PPE0hibSDeoh0Nd3gAufdZboUeQtXueML0k9BPwJP/TX4/aD
         Dj3fG4jht1PlUNZCv2bQmkPx50am+kDoWLrx63ZAs8se0AAiENQWvuVlKrmEzVEmdRxO
         GHvA==
X-Forwarded-Encrypted: i=1; AJvYcCUV/AWQDuNMSm8iIds/JD7Vnb3axKARCSPHvFQD9ESnPt8nVmQe2v4aBj453w2mwtsMIG+ziCRJI5awJUUC@vger.kernel.org
X-Gm-Message-State: AOJu0YwUeVte6b/WmxI5TpEP6P8vCxYUR1xgwZqOkY1a6xyvnNCrDEJS
	l2zAuq7Z4zntGFJReuO14JH3LgvA/buwst4svGBs3HUu0uinMjWqcrL7IGjzh9XvjdNEmFG/HEu
	xmKwGVJagVLYQe1jiaOG0S0xoJEFtM/iDNfmLhIvWFKayYf+hBwM1XuZf3x0Yp/cvMDs1
X-Gm-Gg: ATEYQzx9I93lmGfBGeFnE0h183CZZks0NoEG7zvbRlmGoeB5XOpbUUKXBHYbOK0PhH5
	GqWZYP1smUdtbEy+vl+QO+Nzykjoo90vrwCOEancwVBKc0tD8Vj7oBfzqeCrsOkYsAwvsoL6N0d
	IbeEnHyEchgyf1Q60pKSOmvWyWlknZ5iybXnNLr0fK/DYOcneU9ST2UNEkXCq2Vh8MQUEek6AVM
	zrTvt4pcr6zYJyr6bmaS86tHEGfrMxgb/VpHSf0TwxzGDPmc9BVdELkJBT9zc4XAyXePU5GPh96
	Kn85OOxBJsdhpqKSU7mZMuHCEfU6+7ysPIdbkUZa5U/PvVNLMaT6LBiCvMLCRLf8feSHd2mN/Wp
	uxkab4Ks68I06FD5FCECI8ZJg0/4fPBqBi0jAhodHKMOh8dWvkPXkp5s=
X-Received: by 2002:a17:903:11d2:b0:2a0:a0cc:9994 with SMTP id d9443c01a7336-2ae2e4d6114mr18570285ad.47.1772172967674;
        Thu, 26 Feb 2026 22:16:07 -0800 (PST)
X-Received: by 2002:a17:903:11d2:b0:2a0:a0cc:9994 with SMTP id d9443c01a7336-2ae2e4d6114mr18570085ad.47.1772172967100;
        Thu, 26 Feb 2026 22:16:07 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a043dsm64813025ad.54.2026.02.26.22.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:16:06 -0800 (PST)
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
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
Subject: [PATCH v6 02/13] soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
Date: Fri, 27 Feb 2026 11:45:33 +0530
Message-Id: <20260227061544.1785978-3-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bJIb4f+Z c=1 sm=1 tr=0 ts=69a136a8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=BVB3BO4C9w_THQaB-9MA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: N233gZy5Kie35pRBHfKQmf61j23wkr-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1MCBTYWx0ZWRfXzMjtVUyZth+Y
 cJofBQagMoKfcYOmkvhYik63sc3AIzkt0w3zXj4sz3VDSGK1Dux3UVBvvM5ArcOIHVdK5p1+Hk6
 iOiFfO8E786SDy0Q5eZD+9SgyXcf50LmWfd5vn5xUMyXDBtAPSus+aLvijFKi6LIwTTK/Z1TbDm
 1R5bcpS9R+Rt5OJuNY13d1e+CpUOnQgu9OXGqaQDf2N11XKgpr/hHvN5PKS33OdZOxiSfS1YHZI
 H28cWzXwxPtRRxh88lgpI+zPsqC0yKo2yMj8yPpCmVFoKx7ukGF7DcDxEWRID/IWM3mJfmOi5a4
 qgz3DDfYUtl+xAuDClHvl1eos3tbXtgJpTYClRu6qgEZ3TM5lX71+xafpIhMT0lbFRcjmeK7dX1
 ER6aHzR6R3USre7d5labrQzNdXRKaAs8azaUiXXtlWcrbBCb8QDZABI1Qt3Bg9qtn3DYMDfWCsv
 T9ZmzkTlzrjcR6XOzzA==
X-Proofpoint-GUID: N233gZy5Kie35pRBHfKQmf61j23wkr-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94389-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBE551B31FD
X-Rspamd-Action: no action

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


