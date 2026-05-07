Return-Path: <linux-arm-msm+bounces-106275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLhVCgs2/Gl2MwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:49:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F90B4E3B38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A77E303132B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9980370D54;
	Thu,  7 May 2026 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3evxDYd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1Yy4m8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E162346AED
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136165; cv=none; b=SI/JqiAnfPMrRi/uV96piQBuysFQ4o9B6aCxaXPCHHic6bH/+OsN5+xCSpMHLqsso+hvcFrAs1BF2bcnpHFyfc08ezoQm5Vk7N/g95wetbpWXp8n0KaCtOv53JZ+Yfke6H3KMPpCO1Tq0Py9iCrPvy5TYVfF1MmxMWd/AEseYV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136165; c=relaxed/simple;
	bh=7mrNTGNij/w8YmbLMmlhfVsKgE6akwwy6krrm30/cgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eeKHFVz6/T/9g/QkuG0TzbPWZ0NwDL7N1G71BTH6KlZ0Ck13X+cOheYxvSqQm1zQPj2NPgloFZjXR4l6YF6ewsZ9ZlUKlA2V1U1bDcvOKx/fay/03gUW6fTcV24m2EQdrf5BHnghYV8FhmKBv5AJP6LfYMhoMhWsuBwiY1q2qSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3evxDYd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1Yy4m8T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64742r3c3036600
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZRJ/JIYWoECFHr41NRyA/8b0IVqNJMdaNWLv7doTIA=; b=A3evxDYdy8+kDptb
	0UGC4OLpMKQA2H9Uq7Mi0vbVyCUHdHCLdBOS1j57itIN9DaLYXWcpRveI8IlWwMo
	qhXMj/1Bs51xT8fK6UDulgOeQGFd4ghhdzqS91WiptW1DPlo9uqYD1CInit8G+hy
	WCG1jwV5P+YyZ2/NVuT2DdvZyOkIAFPTDfcHdeZ/6UVXqfXzxmbEwwelXGJqMtSq
	zN0zqJMXVLa4eB165s2p97RGDmDOUqnSTfHRAEU4S+NFH+guptEvGFrXn+5o/zdm
	mbva6WuTkLu+ldvtvxSRUMo9nZi+5YLLsdhpyXtMCYnXF4gYdDVC8eG4DsBa/4MT
	SeoUqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf3jt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:42:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51009190feeso10524731cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136161; x=1778740961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZRJ/JIYWoECFHr41NRyA/8b0IVqNJMdaNWLv7doTIA=;
        b=b1Yy4m8T0CR82CzimcddyercIjc8vONNopKGGxvIfJo5I/KAFmrrUJ7e7tVKtp8J1K
         yaSIRmqIfJe5OYcI4ErNhb6P2Gqc1BXk/rADpU8ldl3Ptk6RBPgKhpw+snij9fsqlTv/
         yfQvI0Q466WrKcF9tQamUgLnQRL0zMUVllGZpSJwBP0lfXx9IhDwEBXti3DOQs6wddEv
         nn2FxGkyOMjohzQTLGb7UDwJCFOiSGRjL0IckynJN6Y7FSsOMcHu6Qz6X8d5KBjoD8QG
         mDcWUUCNCUp3yToyjGCAaY0jH95i/TgrvPjVRmMH2skzM8mTUHXdGYGXHiDVjVHPuNMm
         aZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136161; x=1778740961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rZRJ/JIYWoECFHr41NRyA/8b0IVqNJMdaNWLv7doTIA=;
        b=OvPtnYs9Tv25ifu5hZJahnDAVbdq9hR74iFCutcFY4CL+4VY4EMHNaIKlwr2A7LN5f
         ELI7fx5Ga7e+bfwPCvh9yRpsecQylYVRLigRmt900+vHRg6Us4HYWR+9uxml5yFKbYsJ
         uZZQO3cqHJDpdUIFX54PnSFJ2seJeDIsMllaAdIPe6U1N66i6//b/K5WRvOdia1Bd/NJ
         0V49ZTkotyJmI0FGHzLpotm+mNpkZzZAJR9nMj+7kktNdvhqigs0mvufw7hznzhbFq2R
         zi/wXgricm4K8FcqcgpoQLZrcJd1q8rTFH31sAJ0jkGyQk4Njql3H3bAq/Q3CqUBy1Ue
         PoYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Pb4Bp/9YJLP5ypuyJ0Nm73SmBRcna7lBhOI6TC0GEen5L/v+ySYdPd6/314uVw2VpaLNLozf2M23Y+Gaq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+0/FGr/ElZELoNBF6MA1ZypM+z1WCr2hHv8MxmxfZDENi+Z1U
	ZahnBDk//s7CbD2iawh2nbMG2n+6jEFjCXkSK+VZ+a4g46cf3XQ+1P4Rw5cwteiUMiiR2Mv14RI
	MxPiGQpfR2xQGWkR2M4+jXUOAORjkF3c3/7c4CmAurgIxqS5D9Yy0rNwG38oVsSZ4rW/aLel0i8
	dW
X-Gm-Gg: AeBDies/p/Oe8txCHoi8NS/J/p821Jgg88FbQ8RYt7jYXt3ed7u+2Hob5FO9HndmXV/
	ORcauZyYkriILp/BAbsCxRNpi61WjHUAzpsFwBsuZe/l98fLr+ImNagFpntQKEtgo20m6qJLg4H
	h3ZnEYM7KUsmgMYLnEQRgKANeXNpvKS3bM7S6dQqXN2+bT6z6zYH+W7ADV6lzv/ntaa3ETQGD+t
	laWzmcBcH85FNTFl/CXx5bjsmoCHZmNJYDFg0O4/2Ik7CLs9FwIFCbOKO2Tys5o7CH6dZMz/ZVI
	cA0gk5oVH4HcesQ9emS1Ke/drMn1ieh5xyjWpZBUTTy45fZfZPFPDn34JC9GWjNvYTIxguaLl+1
	dlQnfwR7FKXzjclxLWyEsigroBFpedZ+QdDaZyNr2sAzviDQ/+uJ+3WYIWwYHnKy4lY3oSlpEyL
	4laXJGdr7HSD5MeWJM3L5rjFYdyfeHNJ8GFSIqNmMW+UsV9inhwSzMWN2F
X-Received: by 2002:a05:622a:1145:b0:50f:bdeb:1e47 with SMTP id d75a77b69052e-51461fcec8cmr89440471cf.44.1778136161177;
        Wed, 06 May 2026 23:42:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1145:b0:50f:bdeb:1e47 with SMTP id d75a77b69052e-51461fcec8cmr89440151cf.44.1778136160682;
        Wed, 06 May 2026 23:42:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:15 +0300
Subject: [PATCH 15/16] media: venus: skip QCM2290 if Iris driver is enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-15-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7mrNTGNij/w8YmbLMmlhfVsKgE6akwwy6krrm30/cgQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ/U3gUnLVTXkqjSQKHBGEc8j6q7pFDgsHkN
 sNxehDcuZKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PwAKCRCLPIo+Aiko
 1Wh/B/9FEO/WyAAd+IMryE+i6kwlTRV3hcSbSnW4dadkEowqVHaIIc08JxcIvr7R2ZSed9zBOqd
 2BUX+/f1G/JrmBAZxIK4M3Yg7erurIPCHW0ET6OwjwwOvoaLlH5rhW6N/Kg1I/bH1aAsYA7RTsk
 ZUhjWbwCFvuZPc/EMrsZPIhfkbFYmewwyvIubzP3ftQEEWRoMQfFomdoE4R2oCsP9ol6tJGNvZT
 MzHV5CuklqRZd3uibCip+jbQPMREdd73rFlQoKFM1CHWSC1H6Ej4SgctFh+q64ZWga4OTrnRFDq
 9E6uBnhr3htHnK3/CGl+mc683J4Lpjp36Dvv1lYTjNbny+Sa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX4pWSLnNG2zI8
 cHTLJWwwbZ+jHg54Eb+aOGjYV06Lyn49GybsEPYK7M2fYlK6m0za9bksNj0trkq0iGcUxsZi6K0
 En2ZkwvIwmftNSIxhSroSfqfNUaYsJC/e/Wzh4RCDJrAjZaPdf/3JZgFvN+P12L5ou5FSKz8w1f
 DpPvXlpRHnkIHl9f6nmIt74gfF+kBRIwo6GkzCM297NQe5BrnwhuyLmDnFQUWhIvvqAXi/7mTnj
 ludDLxTOCWcITegBEi4t8p9vkJBJe3Uv4xEwVSVZpN0soY9yIBSM/w7Bpew27FDgE03yqk8fL2G
 lNvSMQVWLvCF8xKfaOuy+AhR1nbN93T664t5t6WueK9OQ//xxaUplmtA4HMcC9FhdZ+9f73LN8U
 5Xv0oFuZCFB4TaAS3CbTu93T/Vtkzl0mEzF7hTiWGYSG1aBif2d9bNFiu6P0lBCVdlnyCG6VTYg
 EXtFoO6I5F9jUlTKyCA==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fc3462 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=TAcc6fXARiqENDJ69lsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: rpiIJpdcHJNheYW_DYGTz3Gd-Pk0V2CG
X-Proofpoint-ORIG-GUID: rpiIJpdcHJNheYW_DYGTz3Gd-Pk0V2CG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070063
X-Rspamd-Queue-Id: 7F90B4E3B38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106275-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.30:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 247fb54bc00e..ea67e713a810 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1074,7 +1074,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1125,12 +1124,15 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 #if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },

-- 
2.47.3


