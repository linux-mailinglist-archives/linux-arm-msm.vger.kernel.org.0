Return-Path: <linux-arm-msm+bounces-107840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE3wDBQCB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:23:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE29854E520
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32EEB3014FC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835E643CED9;
	Fri, 15 May 2026 11:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXevwvcU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QKry+WqF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC9147B425
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844127; cv=none; b=Jb2YZMEmYRgLvy9N07PSHdxsrtMOSEb9Z2B8IXOTYzRF8mqFIOfE+AQOZxFBRjnPevaTMtFfTRg+zf+CTfjDr7mHnP/en+hWisO4swheJGsSw/2GxjD56/oSv40oMcr8uCSos1HbmQanjDiNEcy613CSsXlHLYrUsXhHMI4vmbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844127; c=relaxed/simple;
	bh=xCnf/imRGH4q1obkO1MlH19qzgxVocXERPbyCFIU7YU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OATkbK3zz14fJWdjwtxoq5RLjbBTnWJ6pDOnLT3dZxoSyUp/Tm+0z91LTzhP/CUm8+KxYpG9+XB9SJkXlWuS9c+MmSFmnQ/pG6pgNcmATcAtxR0z3xIWnobj/eVolwyGK2zQkZpTNCUmIdxAVvLT6BKiZsW0a5dTuoWyuSqQ940=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXevwvcU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QKry+WqF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAVEcb4020834
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zyoxgNBhioj341juMXOOUmnwbSXVmNDzn9vYvf/i6bg=; b=JXevwvcU/a/uiVmc
	DVZ8xYhbcNXnI00mRDW84wF1yM9SjrPg2Tzp/pA0JhKPm7+U7FVraZ2B9RENBKuR
	aZWCsikYwJbe5EJDV+/b3k4A3VXB3kD2NXJ99bEZHYGcqBQpiFLag9Nu2Fw9DF7w
	N5O9uJo7y2Af0ZSPM/wqp+vhyDqF7Yl+WKEkn2bSlRPiWiw+vNGxA7xzwrpJNtfl
	bgTtkIqdEU4cTLm5TqYXm8L27n39z/KwIUyyMHduuMlENY5f0PuKVtxbomW0QQ35
	AQn+PT84qa592BDm96Wz7YwCxxxJnqvdUXfx8k2/ArSo5OQjIsoqpIk2lEFQP2S8
	uPxBiA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru193-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:22:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514551d5f2aso249578321cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844124; x=1779448924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyoxgNBhioj341juMXOOUmnwbSXVmNDzn9vYvf/i6bg=;
        b=QKry+WqF+AKscedlO8tQ46CiHrvrkeg0WXM4yjsjcyclJ7TI2OgWhvT427f3jtV2+p
         IIlZVkkHKg3G0Mu04co5UsF2PR8uCSbNt0zyOQsversJe9ogkMbe1RnQ6P5pHytdn/L4
         D7viPIcQ/pHTCzyQDiOS0Hkh758MKH9bNzV5LPr/LgPPZszYtYWFoFiw0VoAX9Yllwcc
         V8h1EkClzfbauBX6U4xPRshu+h22gipbF71sla8OD9qwLQa2rVLr4g4jWFaNiERLalJx
         7BRZsgAqAzyrrhIvpubUmx82mDDmKaDLKjRx++mEdkXTQFdpETFm1cwNFX3yr5OMZJMZ
         1dIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844124; x=1779448924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zyoxgNBhioj341juMXOOUmnwbSXVmNDzn9vYvf/i6bg=;
        b=ZYOu6TjUyKliHIG0tml1SIgOgTpxEZCrhaDo5WPHWvv5yRf2KEsVAwWusPov9izstk
         H2eMwWW2xRlcVe8wdDG4HMhqCs3faR3PBOf7D96qVUrfdNm1b5TsYGshfes/AjqTyom8
         GWN4EpGiK0ub7GKT+9p9xqcxFKcoLP6va3t2InKhtHRJu6UO7uLnSoWVmJwgfdm3YvCF
         k7TCoGN4JY6JAQRMNZQtf+vYm8UwVgDU442C9PxBh1A0Ujm5NZyxOQ0Lqw1RU3iZ8Z8X
         pOOHL6ClgG6pSdZD86/Gq+3K6bJ1HD9BfwAPBHAX8CP/ztpHipKc4vnXFlLZc4vSfsgf
         5b5Q==
X-Forwarded-Encrypted: i=1; AFNElJ856WfyOvQ8zob3lswCjducW9H9ZW5D7HMnUjmTI7xbLpsZt1a43vOXgIWZAZPxGtDCXRZxtY3/LTVDq3iK@vger.kernel.org
X-Gm-Message-State: AOJu0YwP4LF/au++OF0b0p7SlTJ9uKTEeAwrp3gPMTlVBnq66425wlfx
	DWh2EIsv37ecO3B3XZ2se5RSicXazwXjIDh3X6OoYQXiE5pmTztNAM/E35LUCOFtkJ8k099X7Js
	NePKbguyKwR8IMH22wFlBT9eESiPo4C1vx4qvz/PKaJWzpoDPQD1B/M4GMQt1O1yjlKY8NZN/uV
	a+
X-Gm-Gg: Acq92OFU3vafMjx7S0kI7yo0lBaq+zsBvM+2skxhEL7+fYpGaGUYVV660Fb368vKhPi
	M4rGhS9tZkcq/NEzUFBbFuePppAhMT0R27VbrJnnZ16v3F8ZMy7MFtrB8PDU7SjT+3S+IR1SFFg
	Esl80vcTICKv+W2aV8HaThJaEuZyMVQwW8FCFt/ehj7lYxUr2luh4fLnjNPr9UsQ5k+ZEXhBwK0
	UGTDpZJXZSPjyzcfh/4Mtxv4QVYul6PGvGOeEhjnZBmaBIRk0hhnKWWuqROL6RNwtXBESMoa4s1
	K8ShJnwi7D50Y2WS5Hfu08I2D635R+tVYffXC/lxXVZoOOhGhavaCqT6pyYe0zJ0lpH0Z4X1JiU
	NoMZvsvcArsA/hBE/5q3GdP2V7XKsUuyViF23SXw=
X-Received: by 2002:a05:622a:1917:b0:50f:c1d4:d9e1 with SMTP id d75a77b69052e-5165a0bfc91mr47473171cf.38.1778844123320;
        Fri, 15 May 2026 04:22:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1917:b0:50f:c1d4:d9e1 with SMTP id d75a77b69052e-5165a0bfc91mr47471491cf.38.1778844122125;
        Fri, 15 May 2026 04:22:02 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm14059726f8f.20.2026.05.15.04.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:22:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:21:52 +0300
Subject: [PATCH v2 2/2] pinctrl: qcom: eliza: Merge QUP1_SE4 lanes in
 groups
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-2-ebb630de0dcf@oss.qualcomm.com>
References: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-0-ebb630de0dcf@oss.qualcomm.com>
In-Reply-To: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-0-ebb630de0dcf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3320;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=xCnf/imRGH4q1obkO1MlH19qzgxVocXERPbyCFIU7YU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBwHTQTG92SMvtQi5D2AyNXmCilm82J9XnKKaj
 wwcG01ghCmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagcB0wAKCRAbX0TJAJUV
 Vh7KD/4u47D1Lu7IT9pIAhxVQKibloVMJoQ0OQFBIH3lmYXuMglx2r/r+yKNPakQQzXvXJ+jfuU
 Cxgrszvy8ld6dBgOfTjntuxznEmJ+RSCdxkX2yndqYIclToptq7BnEZvpc0Occp8mCM62jQ/0yo
 4bXsYr/Rxb65HKkdLNR5fni6OvxF5gjbjSvksx1NyTeRMgEajBODLX9sZWetqj1G1GCC2L5UmAG
 gqdhqf2yK4Mq7JLPlpGyswHQrc4wDvjIPWrTQ95bXg+qtj60XLsp/PeHVIsrKrGwcdlE/Gj+7Lq
 0j8qUTDpuzy8psBF8kVTVMgG9y1xZGolKsP+HkJTmVTkmpVO0sJKnkjiJqIUdAMc6vwf55tB/iZ
 JzpMr8nZC79OMcnVfjYtGqacP+ScHmcJlRovFwu2L5twhMrqUDZskHyfoRBzM352SA5Su//ClHW
 eMtn7aCRC2voHGv22tlAWWuzA2rm05F4xdFQKYMB/ADOaxLAiGv86854uhsx+Mlcg3Zoh4MMcXd
 wF3TXGsCurwnNGCeLc3kNIXD4OOpt/urm/gzFfRtZ1YJk4vRJmMhQARqQ2iIUE4D0EDnO1n8EFS
 KB1Jqz95fcpfBcYiVmPi0FCsUVPGP8AzSrKSNCtHjzEK2SJsu8iPNxTA4W2xde4J7TeZk24XmMF
 GFkzhIvhsfkjhFg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: m8xz1GmcnrN8m0mNUpl3eDxCCPgprQrm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX5SW//kIw5mAI
 XUXBob5LXWrTQoZES0/rik3TWokc1ZO5bEvM2hAlmnbaYbc1Qxq2l5A/NUF7qKcV3AzKrfSEo7z
 DC/u3p7vwR8co+M9Ak7FAwd3TNYeorU5xLSY5xjXhSrtrIKblNNRrY1crI8l1I4xlesiz1pNDzc
 HTSx62nLA3dYGxPuF0tMglGdDmB17cQ9vY3UaRl5IR8k4E2bVpVFPFt1heow4pwjd/to0naIfd+
 DfwBW2WHfUyqyFLuUueCneezFh+IrIs5LWbK9lZJwudYEwupbMY2fdj8oZiuLcaFX6gqaq+03iH
 Wgf/NuBQxl31JbuqOmqNkcrYnJyQNmtD7K8s24ETRg37WAZeYUtLZZT6B2EVbNIuktxHzvroahX
 r5Z40GVUAcWt9gq2Y8Hlq0nPjJdw2sVNt7u/BzwfjwvufQ2tEh0sO/xMdumdMf+FXL8sAEfju9P
 htBDRyLsRy/oUVRKZjw==
X-Proofpoint-ORIG-GUID: m8xz1GmcnrN8m0mNUpl3eDxCCPgprQrm
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a0701dc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OwIBgurHg3-afsiYUj8A:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: DE29854E520
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107840-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

QUP1_SE4 uses GPIO36 and GPIO37 for two selectable lane pairs. The
current driver exposes lanes 0, 1, 2 and 3 as independent functions.
However, since these are usually configured in pairs in devicetree,
it makes more sense to merge them into groups.

So merge the per-lane functions into qup1_se4_01 and qup1_se4_23, and list
both GPIO36 and GPIO37 in each function group.

Fixes: 4f5b1f4e770b ("pinctrl: qcom: eliza: Split QUP1_SE4 lanes")
Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pinctrl-eliza.c
index 636442d0afed..da2fead23aa1 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -544,10 +544,8 @@ enum eliza_functions {
 	msm_mux_qup1_se2_l3_mira,
 	msm_mux_qup1_se2_l3_mirb,
 	msm_mux_qup1_se3,
-	msm_mux_qup1_se4_l0,
-	msm_mux_qup1_se4_l1,
-	msm_mux_qup1_se4_l2,
-	msm_mux_qup1_se4_l3,
+	msm_mux_qup1_se4_01,
+	msm_mux_qup1_se4_23,
 	msm_mux_qup1_se5,
 	msm_mux_qup1_se6,
 	msm_mux_qup1_se6_l1_mira,
@@ -996,20 +994,12 @@ static const char *const qup1_se3_groups[] = {
 	"gpio44", "gpio45", "gpio46", "gpio47",
 };
 
-static const char *const qup1_se4_l0_groups[] = {
-	"gpio36",
+static const char *const qup1_se4_01_groups[] = {
+	"gpio36", "gpio37",
 };
 
-static const char *const qup1_se4_l1_groups[] = {
-	"gpio37",
-};
-
-static const char *const qup1_se4_l2_groups[] = {
-	"gpio37",
-};
-
-static const char *const qup1_se4_l3_groups[] = {
-	"gpio36",
+static const char *const qup1_se4_23_groups[] = {
+	"gpio36", "gpio37",
 };
 
 static const char *const qup1_se5_groups[] = {
@@ -1312,10 +1302,8 @@ static const struct pinfunction eliza_functions[] = {
 	MSM_PIN_FUNCTION(qup1_se2_l3_mira),
 	MSM_PIN_FUNCTION(qup1_se2_l3_mirb),
 	MSM_PIN_FUNCTION(qup1_se3),
-	MSM_PIN_FUNCTION(qup1_se4_l0),
-	MSM_PIN_FUNCTION(qup1_se4_l1),
-	MSM_PIN_FUNCTION(qup1_se4_l2),
-	MSM_PIN_FUNCTION(qup1_se4_l3),
+	MSM_PIN_FUNCTION(qup1_se4_01),
+	MSM_PIN_FUNCTION(qup1_se4_23),
 	MSM_PIN_FUNCTION(qup1_se5),
 	MSM_PIN_FUNCTION(qup1_se6),
 	MSM_PIN_FUNCTION(qup1_se6_l1_mira),
@@ -1412,8 +1400,8 @@ static const struct msm_pingroup eliza_groups[] = {
 	[33] = PINGROUP(33, qup1_se1, ibi_i3c, host2wlan_sol, gcc_gp3, _, _, _, _, _, _, _),
 	[34] = PINGROUP(34, qup1_se1, qup1_se5, tb_trig_sdc1, ddr_bist_start, qdss_gpio_tracedata, _, _, _, _, _, _),
 	[35] = PINGROUP(35, qup1_se1, qup1_se5, tb_trig_sdc2, gcc_gp2, qdss_gpio_tracedata, _, _, _, _, _, _),
-	[36] = PINGROUP(36, qup1_se4_l0, qup1_se4_l3, ibi_i3c, _, _, _, _, _, _, _, _),
-	[37] = PINGROUP(37, qup1_se4_l1, qup1_se4_l2, ibi_i3c, _, _, _, _, _, _, _, _),
+	[36] = PINGROUP(36, qup1_se4_01, qup1_se4_23, ibi_i3c, _, _, _, _, _, _, _, _),
+	[37] = PINGROUP(37, qup1_se4_01, qup1_se4_23, ibi_i3c, _, _, _, _, _, _, _, _),
 	[38] = PINGROUP(38, _, _, _, _, _, _, _, _, _, _, _),
 	[39] = PINGROUP(39, _, _, _, _, _, _, _, _, _, _, _),
 	[40] = PINGROUP(40, qup1_se6, qup1_se2, qup1_se6_l3_mira, _, qdss_gpio_tracedata, gnss_adc1, ddr_pxi1, _, _, _, _),

-- 
2.54.0


