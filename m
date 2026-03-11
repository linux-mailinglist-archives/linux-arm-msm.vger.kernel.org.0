Return-Path: <linux-arm-msm+bounces-96830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GInfC5HgsGmgoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:25:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C3925B878
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96CF630F3A10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066685733E;
	Wed, 11 Mar 2026 03:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKwFH+vl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dw/4qwXD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E543363095
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199412; cv=none; b=q0wp8QujjbfNadltlvgBkQUfk966STiviAscMHJuYp4Px8LSeXHHr9sCX0zE+FFsfDlVzxrgREZcink2n8IgPvstlPTy66R/xweZe7A/0hJKKoMAVqwt7kpsmq0SSzxRRkBjWcI62pac27Ci0UZ7uZI5X1R+QKwI8ZfMks/eN2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199412; c=relaxed/simple;
	bh=gndBRl4Z4xRh4kFQivFGZ2SUW+Ocdg1Tl9bo+8948vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SoVPnx+Bygxw8pFrgH/pqOzSFWAY1yd2j8ttK1wlmbse26YsI9LX+IjmUZ1Bt52536xk59cWdmNaa2jRpqUExJbJ+kWLJVCPXoRXB62xABk+d8p3Seqg2DZuxZiUOJDTOD1orNP2naGz6EMp6ytowrjWhyzg27RlewUhuueMMgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKwFH+vl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dw/4qwXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B34Kcp304472
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdo2GXNLuey4il0IRDIYFRsck7+hcgeJ1IZK0URwteg=; b=nKwFH+vllbfYavnT
	vcue7iBJ+ks+th6OZ8//bcv7nEaByTegBanKq+6o4KthEDP2ufz/wfl0d3fWo6ja
	PvLM0v2eSYy2FDbnmxgDQ6gLd2fPh5uG+Wmu09CCYbs1R8WDF6W+g8v4WTQPPHur
	ba1HNjVtl9xIvTUGMmAjPIla+O+BL2UPkoxoitXDosCeHXbeASvQQ4J/P77EeDbn
	ECl2izlZQGcgG4UWmWmVN2DV01yIrJk94eQ9KF4sCiPpAidFnANjoK2T5Rb7uNsX
	CPYPPApY93WVQ6eHBymo91/Akbzkdex60xGbxGLJOTxXxxliFd8xQLeheyyzlM8e
	po2bYg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf3em6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:30 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94e4b6c8cd5so12494946241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199410; x=1773804210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdo2GXNLuey4il0IRDIYFRsck7+hcgeJ1IZK0URwteg=;
        b=dw/4qwXDLwJdh6xU1rlY6fI2IPCfmeiMRv4gSKU4tbGt26ZiiwiyDnJDwG84wkgTat
         HEfkIbUwsoUDrZOqlAabAHu76xWN4JEwTHVh7WStu3EY6s+DtBW7HW4cBi2X8vC0fmU7
         Tkbb//zt5548+CHylgjfq0GPW6dzeQi/zgGx/NAL6hgjPcvd/FR+7cH4+LYv+ScZudC7
         LecSCyu3ggqD9sUAKoiJ7DUF2Y4BTVERFVCjPTrP84vrdQzukyiTSm+0gk3E8ceEHo/+
         1pQxT8I9nrnKA/fg0VO1qtCsng4CTQx8DkeHlsMuO+cNDzCLRHlgyHl07NRuFPte8VhH
         O+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199410; x=1773804210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wdo2GXNLuey4il0IRDIYFRsck7+hcgeJ1IZK0URwteg=;
        b=sqPvGbWjLYc6bT3AkDyewVpUhR6eZMagm2s9QL3ecD7q+87N7IZOqfLvDZGyzk94Rj
         M+guyivf7Q5USPaiygteSZFMiX0mZtGMjScMdeg9THLqjqZRXNSLX6pISRCRpyJJxXWy
         +gdqbJDlwVXRxqUKrErBFe2msp8unhtvqLf3blCAimXIipbg+ZNpInIy+YYM7/Vpl4pB
         zzARqJ+I2RXU/v319KlmA7eyLhxVzK4WIaoEBNy9/LvzMtOerH2B73U7L+W0FfqZFSp3
         +0u5pGAZcsVZYRTyjlk45AI0TJw39GrRLM/Fr+PmnEWpQ/qQyqxFZfG5m843jGYZiXqG
         n2eQ==
X-Gm-Message-State: AOJu0YyylHbHBh+h9cv2eWd/XHrz9Wob/6aDuT6C2LgDZMzK6Hoq6UPD
	HPPtWlHjq/XelMwrs9RR8flpIc9pgRwsoLWMqlu27iHrUVoCy1ZMMMBguzamWlYAnVq91SUOLvr
	lNuX719CsrNvNJpPKhpq0JBEhV+PF/QlOoStsDx2ErD6LtkkXqCasTsaLZg6Imbk3D45E
X-Gm-Gg: ATEYQzzXwbrw7dE6Zuwt+LOaj976rMyZJsbzJUeH7VsX72rD8Mic/V0R9CuOUIxviz2
	W5v2jPxxOLiWQuedaQvIuwlk2tW7Jn3r2h1wa7oHluDqI/jfQ/xuX9LwY92YYMQtukBwJC+1VVh
	N2yo/sZ5Hg+bccdrtyalJYC8CgTZDPE6hYUkrIsj7tKxSqvueOoBNxOAVMAoEd/8Hym/KvUutzJ
	+3/9YelYGIck22XdCTQcOKuwpD2C1tY0RO/0lOILj1jXruVHPE1iWzxPlvFPA42OpWLL+Km794r
	qsEJfA5ERdbc0kZF+k05DE/jph9PI5q/Re7samGeXGGFuJFIJjHTPY8zb3QL2WdNmSiy2SUyGPi
	WVgWOJIXk9l0yBX43cAkEA00nJa3PU/sEk2+esdl1ELb28TmFk6n8YN9jhicO3U6r+yunM1avQN
	tWe0VlA0Sr84XF2i6fNjVcuFFD75nDYgBIkzU=
X-Received: by 2002:a05:6102:941:b0:5ff:ee74:dcf6 with SMTP id ada2fe7eead31-601debdc56amr339084137.14.1773199409644;
        Tue, 10 Mar 2026 20:23:29 -0700 (PDT)
X-Received: by 2002:a05:6102:941:b0:5ff:ee74:dcf6 with SMTP id ada2fe7eead31-601debdc56amr339070137.14.1773199409153;
        Tue, 10 Mar 2026 20:23:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:22:58 +0200
Subject: [PATCH v2 04/25] drm/msm/adreno: Trust the SSoT UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-4-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5880;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E5AQkqpaNuM1RXBAxJ/mn1wbVur7sOZpcfQb1l6t7DE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAdXKkVPqXh0asXWed6TxjLwe0UMyOEzG3WS
 tjzAlBapAOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHQAKCRCLPIo+Aiko
 1aTQCACBA1Khj3FuTQpAU/VWw5s+/1+5MMZddlmvBhBZ+HyJndSk3pADF6lxEGIRaN0B3MMbDZw
 lSalZ6dO0i8XXoHusvvtk8iELlHC+3vHIL73juAUF1AZfN5iFR6KYKhoxr0oBB789IH45iqJuL/
 3KNTjz2YhVMAZs/97pFlKYsvo06LT79+gT9lBv0jVxdqQupMRZvGlC90ZCONcoLDUr4JccE3zpf
 I2RmgghVer1OQjm+wwQvQp4epUqYOZ62rCXILYLfmthFzAlxHMoeBWxL+mM3dnOFmyZ3q4xCgow
 3qFzNf5Xclq7vKhMT0ATxU1im6nIe2WoTCPO3BFvyGPYqVba
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: B5xu-KLqxHx__QmnR3HJorbMQR6xKfCU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX2hffeeQtGQVt
 n5O76bzaO83EpG0nhvJFL/y9B+fXypXAErvcmwPwGJ/Nx/FGpOMl6pttDwtBvFod0sYsWvnR/oQ
 AQdnmj+BRn3TV9Wturb3/jO3PtzxWIqMpEOZ8ZmWmjRs4QSawHudYjg0x1vk6Xyh1x3hd4teQ16
 jjbL/2kLrbycECcLdQexyl/3/rPydKCMOJ0gkgYpCwqyqz+fZUthwYY1KdJ0/N8nL6csyhJrMuj
 fPSUCX28M2n9OaHnTIab1sGkVLIkind1718ph3/0L4d0WpljZyMELQunCtCJYn1XQ8yWJZ67X73
 FgbN4s2sOM+d5N+0OtzkqpZfZWpSPkjuRzQ5j2+pl5rO9RdtCCoDXPyzzKvldWww0vQMePLPcTc
 Mr7x3inblfvQm2PKVcbU7KmlJThJCGScIPpv3BEnoyVjsfgXu2JPAsJwoHlgbZvJ+9g2QA49q+4
 ujSSI4BFkF4ryyl99lA==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b0e032 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=IhcC-CrlSmvFA89tYH4A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: B5xu-KLqxHx__QmnR3HJorbMQR6xKfCU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: 89C3925B878
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96830-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Now that the highest_bank_bit value is retrieved from the running
system and the global config has been part of the tree for a couple
of releases, there is no reason to keep any hardcoded values inside
the GPU driver.

Get rid of them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 11 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 ++-------------------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 --
 3 files changed, 6 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index ef9fd6171af7..513557741677 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1727,7 +1727,6 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
-	const struct qcom_ubwc_cfg_data *common_cfg;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1765,13 +1764,9 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	a5xx_preempt_init(gpu);
 
 	/* Inherit the common config and make some necessary fixups */
-	common_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(common_cfg))
-		return ERR_CAST(common_cfg);
-
-	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
-	adreno_gpu->_ubwc_config = *common_cfg;
-	adreno_gpu->ubwc_config = &adreno_gpu->_ubwc_config;
+	adreno_gpu->ubwc_config = qcom_ubwc_config_get_data();
+	if (IS_ERR(adreno_gpu->ubwc_config))
+		return ERR_CAST(adreno_gpu->ubwc_config);
 
 	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d6dfe6337bc3..6eca7888013b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -729,82 +729,6 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
 }
 
-static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
-{
-	const struct qcom_ubwc_cfg_data *common_cfg;
-	struct qcom_ubwc_cfg_data *cfg = &gpu->_ubwc_config;
-
-	/* Inherit the common config and make some necessary fixups */
-	common_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(common_cfg))
-		return PTR_ERR(common_cfg);
-
-	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
-	*cfg = *common_cfg;
-
-	/* Use common config as is for A8x */
-	if (!adreno_is_a8xx(gpu)) {
-		cfg->ubwc_swizzle = 0x6;
-		cfg->highest_bank_bit = 15;
-	}
-
-	if (adreno_is_a610(gpu)) {
-		cfg->highest_bank_bit = 13;
-		cfg->ubwc_swizzle = 0x7;
-	}
-
-	if (adreno_is_a612(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a618(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a619(gpu))
-		/* TODO: Should be 14 but causes corruption at e.g. 1920x1200 on DP */
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a619_holi(gpu))
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a621(gpu))
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a623(gpu))
-		cfg->highest_bank_bit = 16;
-
-	if (adreno_is_a650(gpu) ||
-	    adreno_is_a660(gpu) ||
-	    adreno_is_a690(gpu) ||
-	    adreno_is_a730(gpu) ||
-	    adreno_is_a740_family(gpu)) {
-		/* TODO: get ddr type from bootloader and use 15 for LPDDR4 */
-		cfg->highest_bank_bit = 16;
-	}
-
-	if (adreno_is_a663(gpu)) {
-		cfg->highest_bank_bit = 13;
-		cfg->ubwc_swizzle = 0x4;
-	}
-
-	if (adreno_is_7c3(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a702(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (cfg->highest_bank_bit != common_cfg->highest_bank_bit)
-		DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (GPU) vs %u (UBWC_CFG)\n",
-			      cfg->highest_bank_bit, common_cfg->highest_bank_bit);
-
-	if (cfg->ubwc_swizzle != common_cfg->ubwc_swizzle)
-		DRM_WARN_ONCE("Inconclusive ubwc_swizzle value: %u (GPU) vs %u (UBWC_CFG)\n",
-			      cfg->ubwc_swizzle, common_cfg->ubwc_swizzle);
-
-	gpu->ubwc_config = &gpu->_ubwc_config;
-
-	return 0;
-}
-
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -2721,10 +2645,10 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
 				  adreno_gpu->funcs->mmu_fault_handler);
 
-	ret = a6xx_calc_ubwc_config(adreno_gpu);
-	if (ret) {
+	adreno_gpu->ubwc_config = qcom_ubwc_config_get_data();
+	if (IS_ERR(adreno_gpu->ubwc_config)) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
-		return ERR_PTR(ret);
+		return ERR_CAST(adreno_gpu->ubwc_config);
 	}
 
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1d0145f8b3ec..da9a6da7c108 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -237,12 +237,7 @@ struct adreno_gpu {
 	/* firmware: */
 	const struct firmware *fw[ADRENO_FW_MAX];
 
-	/*
-	 * The migration to the central UBWC config db is still in flight - keep
-	 * a copy containing some local fixups until that's done.
-	 */
 	const struct qcom_ubwc_cfg_data *ubwc_config;
-	struct qcom_ubwc_cfg_data _ubwc_config;
 
 	/*
 	 * Register offsets are different between some GPUs.

-- 
2.47.3


