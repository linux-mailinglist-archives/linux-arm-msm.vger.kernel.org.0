Return-Path: <linux-arm-msm+bounces-98865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGsMOJ6pvGmk1wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:57:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4645E2D4EAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F4B931B7AEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 01:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B3B337BAB;
	Fri, 20 Mar 2026 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myWXW5of";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BbOj/VeT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1F231F9B2
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971723; cv=none; b=fAEuMwtnVpgo5JiWkhzzSthVD6HtLQwOhBeJJnafhl63aS1KMjKmqqbW44gB5sXZnq/4hk1uQsB7w06Z70tR0eygpdBnmYoUVgYLcvrxwJw/vBs+Px4VITpiWnRDOerjYv7hW8G6SIZbx1kLmqxO61Nj2yn2rbwNb2S0L5JLLNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971723; c=relaxed/simple;
	bh=DLPuVfir9AR4DkrGGeJ6rU44rq8n0HDVReP2foklRpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OvvFjwLZhaLM5MInWgqG8sW2/tPe30P8A70Y1GF1rPaJWdufHkgkvsFVAyihYOU2sycwvonGxG+X0CgeZxp9aHrX6FfFNGjxs0w81y3DlrtL2Zb8szZ0pFrgUYyHEzHj5DrPFAjDarGqK9Q23nEEatYCJpJ7/nCBEkgKP5qPkJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myWXW5of; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BbOj/VeT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JIvm2b235692
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGrM0qdQy98OdoWRO2UICz6FzA8bjdWx+bdXo3Th8qM=; b=myWXW5ofCxv6SKOw
	ZWU0hvrjT7vgypm9fatDlvF8LnMacMdvENvbUr0zTHbhb7Wo2Q7MfflR5CrqP/Pn
	d552Z4nJ9fgn1HRBpF7VR6IXfLm7RHG/ErIcb9U52dVPEO93d/cxPL6bZlw43hve
	r0syO+R2ER/yJ6115QPD1nYdGfOzzr3m7ElhSPEk94W6QqicR6ERW3KteMm2/aDO
	BG0LERtZwwGlMvBQQX7fBTBq7D83mQIMCVEtaCWOKedk2XnWlA4CsnlFvCjSZPmD
	L0ShrUaFxg6qP/5i5XWrQqpPMgmS2S59LZD5gkDTGrUxOsClPeE/FkhxxbWfoNBR
	SNcRXg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0pvhrxs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:55:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509219f94b0so102621831cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773971716; x=1774576516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGrM0qdQy98OdoWRO2UICz6FzA8bjdWx+bdXo3Th8qM=;
        b=BbOj/VeTLmRnsnkgzU4cv4BTrqWaEzG2gDEVRvsmZkKBhtHvXCLpo6Sd4EKf1Vqbh2
         stiOhfhLLhYNRXiuCtf8ieuIzUhJIVOV6DJkMV8YsysootvXYg3sQtNCOsU8nt0j1TSi
         tufG9v2CnFhjcrpfdelWtU+SXF8i8qZsOUwzb0OuBBs2Mlk9JkTGN8W9kunsD7yziyFx
         YQRkiJiI3OMTYfma7mOBZFX0EsgetBi0sN76yWDLw0gxFAZlO3oy/zGWqQZ1KOVGDFZt
         p9qJN/Vi7rdg5gWz29ctAIKnIKbVAy0q2WEdJQbTpliU1CEPAnTrkQTDRZwv3utCnl2B
         Xt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971716; x=1774576516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hGrM0qdQy98OdoWRO2UICz6FzA8bjdWx+bdXo3Th8qM=;
        b=PyOJvY+0Hl7PNqkX0O1EM8a+oMvGhHxkW3DqK9KO81CjvEme3uMl3s32jnPYPw+4ck
         omYnNsfgadHaf20URvrLvq/2HDAskUgbMKaSD6HIFjaU1JpuPSJ3e7z2JhbwFnd0Ih3y
         FTouifgJNBaen9lehX+drrswf3HQpAAJUNWy0bw+ym9s6NYMw77eCNK6NFhNoFk2po3l
         eFpL3d64kMVwmZKylN469ESC+npKeYDZ3ZVCR95aJ4NhBug9DSw8YapUy7w3eGjCGC11
         P4l9whaDBYAjAv52m15vyUD/q0DQnyQ8vBEO9l+0/jm/NMkXYuxoJ/qofhHUhey6lVeB
         /CHg==
X-Forwarded-Encrypted: i=1; AJvYcCV8MidpQRJrVJi6+1wLM3AMF41cYmmxmO2jRUQTuCnd/O3mUj2ckPcOZZXYwZalK5yV1S1eE/TJyA0wGwwO@vger.kernel.org
X-Gm-Message-State: AOJu0YxnlUdhXb4tynPhCxL9vOUWRxOytCPfRnLyYlPrfx2rb0ToUZlV
	VjBUAEgn6l3F7p/5Y3FE5hcY9lvmRWiOSww6m5BSgsy+5OJpyIawBDFCdPdPKgFQy24Jv+EKA9r
	UK0IFKMZK3ESTiuDXQjpDvpLUTeTczwErTLUFqgySvRQp27Ym19+uNi3fRqDvhGCL50Va
X-Gm-Gg: ATEYQzz86n9haCfQxgoJdnHZxjZ+p4eJ8Zz7+WddI5kVwwQ9GF/CxFELsinioCoUmMW
	A2BUppKKXeM0oa4PNhQoZXJ25yrkYlwHYsqbRG0RFzdbk7hfXaHFQdizu/SBV29fYpaj2e/Zhx5
	RSdMAGiZDbraqG/Fi6m7ESe+bMY3+TX77oFmwT4ZmWAFl1IWD5rKdgWxzMr1Ot4036qc2JcId4U
	Y1/8SuBA9WFAgjFqU+elehlbXGGAl+epe4ISAAX+7dq4CY6Q/20S1lIwMwakli11UVPoYQM4hDR
	qZDsa6RxNaOX//rQ4CMcO6CFflwzVgQlvIb7RJJcCkgOXeq4ZyZxSgsgv5LbSmlefwdYrp/IESr
	2ZUR0j/iJDZbqbdnugbE/kdeG0kRDNUuwU8gTanstTSZ7KbzoY9BgKKWNI/VeBCQAfDPxdL72/g
	SUga0RZQQrbKz+oaydASb3jOtjVHXLJH5Fk7s=
X-Received: by 2002:a05:622a:154:b0:509:59c:578e with SMTP id d75a77b69052e-50b373d34a5mr23525831cf.16.1773971715674;
        Thu, 19 Mar 2026 18:55:15 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:509:59c:578e with SMTP id d75a77b69052e-50b373d34a5mr23525661cf.16.1773971715264;
        Thu, 19 Mar 2026 18:55:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305eefsm232344e87.70.2026.03.19.18.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:55:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 03:54:47 +0200
Subject: [PATCH v9 07/11] media: qcom: iris: drop hw_response_timeout_val
 from platform data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-iris-platform-data-v9-7-3939967f4752@oss.qualcomm.com>
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
In-Reply-To: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5752;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DLPuVfir9AR4DkrGGeJ6rU44rq8n0HDVReP2foklRpA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpvKjlD4Z/i5GEUnbPWpaTQrCRMTPfyqNAl150U
 9k23v3XBaWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabyo5QAKCRCLPIo+Aiko
 1V4DB/96QTWpnDcU/lQjj8l0QrJNXYv7ByPxZyp33g9KAef1kD1etIDp+psktmLaN6Y1o3PoSwm
 MWxbFa0DxCA3QM4EuAIXgORqje+7pKfRL8Cz13lE0T7HcfSx3ow1R06mWCk3iHj2NsaXx4A4eYM
 KbLn3qA/tyuN2jLMEr0s9f8o9michR6J8cAnajDVLODiylcyKxFGJt2PfXtmBuzn+uJb1MU7fhW
 N4mXIhqezGoZLZkkwq2hFhfXuuSJpjyH/+HyZKptUDoK4qD/ErlTKs0TagwToAPBvQ6wTyGIfm/
 RlJsG8pVdHb4Q9YC88wvEU299oxaQsmLb9iSLQ212X9b7C3b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=F95at6hN c=1 sm=1 tr=0 ts=69bca905 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qqQcAvOoDgVuqrtd-OoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: BmG7tY7XPaekimEst-H796v4Erj6xLSO
X-Proofpoint-ORIG-GUID: BmG7tY7XPaekimEst-H796v4Erj6xLSO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxMyBTYWx0ZWRfXwJMXY6i49D86
 hpQ+ygdNfXMYAJ37Vc0Ryeimc4UQZMSGBWUwRDP534MnJ/OySsdfWcVyl9tELpLkUeBDIW9+aBJ
 8Oe1cT6ZtNN7EVcHtJT4WP8gFq/xeD4BBf1IYxOzJZtos2ZOOwl3r3bSTz134SFx71uwtpeIjlw
 MPaJdepGAxWg3SFSqfr4BaWgXzAlULFHCNe1Stq0UDxYv4+/IdPqYCodRtl7cXYdggGVaKW1xnk
 sZpL/vTYj9cC/JV3Qvm8tMp6QjXQUu4yyOtEtU+rRsmC4f7ZdBA0fIrTbZCFN2otv2RBZIuNBX+
 QWzfWtXBwRjckO6PSHXMdkVRt8Bx1sX0jtVYdnOmdes2KOg6nUADQgJkHuBYTpLz6wSsYrER4Rg
 yP/FTaexbo1B9nd7Ex0XttSyDPPA26NhiD8V+OfaBmXcWMCTf/V8xYKOCE5lFd2cSaRyKXpjATy
 hjIKPvG/TmgHDRDFuVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200013
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98865-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4645E2D4EAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The HW response time is a constant between platforms. Remove it from the
iris_platform_data structure and use it directly.

Suggested-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c            | 3 +--
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 2 --
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 4 ----
 drivers/media/platform/qcom/iris/iris_utils.c           | 5 +----
 5 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 8406c48d635b..e6141012cd3d 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -28,14 +28,13 @@ void iris_core_deinit(struct iris_core *core)
 
 static int iris_wait_for_system_response(struct iris_core *core)
 {
-	u32 hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
 	int ret;
 
 	if (core->state == IRIS_CORE_ERROR)
 		return -EIO;
 
 	ret = wait_for_completion_timeout(&core->core_init_done,
-					  msecs_to_jiffies(hw_response_timeout_val));
+					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
 	if (!ret) {
 		core->state = IRIS_CORE_ERROR;
 		return -ETIMEDOUT;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index d1daef2d874b..e8a219023aaa 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -232,7 +232,6 @@ struct iris_platform_data {
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
 	u32 core_arch;
-	u32 hw_response_timeout;
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 9925a893b404..6ed4c4ae4056 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -361,7 +361,6 @@ const struct iris_platform_data sm8250_data = {
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
@@ -410,7 +409,6 @@ const struct iris_platform_data sc7280_data = {
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.max_session_count = 16,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 10a972f96cbe..abe523db45c2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -936,7 +936,6 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1036,7 +1035,6 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1127,7 +1125,6 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1222,7 +1219,6 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index cfc5b576ec56..29b07d88507e 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -55,16 +55,13 @@ void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 
 int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
 {
-	struct iris_core *core = inst->core;
-	u32 hw_response_timeout_val;
 	struct completion *done;
 	int ret;
 
-	hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
 	done = is_flush ? &inst->flush_completion : &inst->completion;
 
 	mutex_unlock(&inst->lock);
-	ret = wait_for_completion_timeout(done, msecs_to_jiffies(hw_response_timeout_val));
+	ret = wait_for_completion_timeout(done, msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
 	mutex_lock(&inst->lock);
 	if (!ret) {
 		iris_inst_change_state(inst, IRIS_INST_ERROR);

-- 
2.47.3


