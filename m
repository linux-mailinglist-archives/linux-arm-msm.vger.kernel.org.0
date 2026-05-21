Return-Path: <linux-arm-msm+bounces-109089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIQ9IjgKD2oHEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:35:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8AA5A5FF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B421E318AA0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5253E3DD850;
	Thu, 21 May 2026 13:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kxen0M0J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrnDjHll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048013D34A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369160; cv=none; b=aDvORMsiruO77h0MVyFNxknlaU9rEgr7UWZOms2Cr+TIp0hyZ3KR+KqwltNWLkpsAuXfyyCBUg4peIKfDu+8wQXTUosTaWY0l0pSXmUXstFCjd0tZNuyoSLEdD2Sb1R9jGNh8UR2e6JKk53872Npvh93spob44+RvhhcpMtdEnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369160; c=relaxed/simple;
	bh=6HC9yr+ABCVixcvAqJ58y86a+1sgu5TAEmvLtox3Uls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mceckajHT9fokuV2qtk6fvcR3Vb06XReHnSDyW79/SxPMUWEOZvRmH8A/RUNOk3nl4TCvjikm09FcniKMR6fGjj2NB2uWqMLCNvrSIodbkhxjBLWsaOAPYYZrd5pNw7UgLMcPquyH218gGcPpWe+TxfKhUcmwiBwmLGSSKjYhG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kxen0M0J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrnDjHll; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMWl1731228
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jLpF+kGYVdegPIuXled8l5QZ/xmawl4nmkq
	Acow3Tig=; b=Kxen0M0J5wYewDPo5mKkGtxcrp4tzjwYIfnrf5I6f9LqhYZe9kk
	xKS2+WfCnmlrFxoP0gaJUzP4hBdH+TG6YZLL6L+YYNvou/A3aBlENl0wXejxTw4/
	uSJwXuoEQ6Z1Ezhvkv9kCTIeu/yrGjVgiyiOuAqotp1hDeVFmGnthnzimMoGKk0l
	M6GgZLSEDAHhsv3tXVUpHvuMdFCDqOScblGv2kmwzpjHXRKubB1GYK6Xg1GSNwFa
	DnFB7y8VhZRr1uZ/aCyFWkF3Ef1w3Vl7GlStIyTTiQg4KMSDDu8DWSppjcD8fbNL
	1NMXenMj0N7KrhJo3WgUWrE3xxQm9ZFk4OA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f5ghu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:12:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f9429f49cso9179207b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369157; x=1779973957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jLpF+kGYVdegPIuXled8l5QZ/xmawl4nmkqAcow3Tig=;
        b=SrnDjHllINqoQX/BBnmuZpWb1NNKDXIoVvKxZF5cOGbcHvmf2gG6/Hes6t03ZBJBfa
         vScamlei7+8OZYgPKlufeXp1m0KiITi05cCnP4jse3gsfY/3u36k7PM3zmk7OJFEujsi
         SEtU9KWUPd9SE9eUBezeX+m78NRwykD05PuFSDLPVTQ8D7WEkp/Mtc0mqVzhb1kbc9J9
         g+1b9QGKtKPQvXn/rDArAeA8N2FyUPJb4ohxBAyZue1jOMoNu6vlGYuERYxqG+rpWr9p
         YnbkIvSsUDh4pqutUNmgnkgp92Oc34K1PFvm5RiJy8ynfu4FeJhh5hJ4NF4ieEIJ6/GP
         TVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369157; x=1779973957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLpF+kGYVdegPIuXled8l5QZ/xmawl4nmkqAcow3Tig=;
        b=pE4UgKoKZkuVoKyfUcNBfx7lsajPAwgGuxftlCDXtXEv48jt2g6cabwzAESh0f3KQE
         2xYG6goAthv70ya8n9jQB5yswi16C+s9wGzg7EqADQKfMAfP2Yr0tJTF+pBvaCGE9xto
         tOb/fsKC5F35oUeuCuGQLLETraHixBqYLSN36Ae3vfyyEO2PELtdb0AwWYoIAZwHndLb
         iMrhv67YKhRH2QbxDLyuPzWTTV6yOrBFC4KteiSxbil5EaYHdapwCCQvWZxkqckYqcyT
         HZoP9xqnWCIq7SvDq9a0riorq5HmeEMqqliU6RK7mgze0a4XbSOHiR5YuOnDTnbdtsvG
         vTHw==
X-Gm-Message-State: AOJu0YxPEH2LDe3X3DcV8yR9c7Fb8/0YRcKpmkTTXr/dvP3GTVtXvjqN
	DYTvbNckdE5Q4ftmddEQzqVmPsRC9fLPeR2MAijmruZgqC8jCM1FGU9m9NXncQtvzdzqVVgj4jd
	7nEhEpScSNULGAmG1Q1kskrcsdyAZLPoiMpvGyfYVRp1WQQAsxq6SIfhWkFgOIqpIu7Vom+g+2a
	MQ
X-Gm-Gg: Acq92OEePCI5YHYlWlHpLJ5FWfDBOLeIkldSiTQAMK0+9oRa1SkCyEvZgc0VBZcMfRh
	MMJm00eNv7FuvbG/pqoGob4W3DdHTtmsoPjIRmSnvUrBfLxPQZdfpJdcKFFcZF9v0rLIAGnnbXC
	AQeAS25TBKND4Kr4vbk72zBzYl3cIUT+60yo9+p55kj36yUB6EZ+QWCmQFllHFpJTR00rrl7lRB
	lv/53a6aBadEeEwz2h9JRaqxf5MW4/HJi1SlLJR5Kj4P0Z4hBtywEVfXd9jybD4ldFpTBvuj6on
	abY04zzS+XlAmv+1HZXTs2WaWBEhCADeJgajfA+/2kROY2kqarXawlZTdysdNkp+vaIkd9A2iBg
	HOGnwFzHPgIJUOD819wvaJZ9asT+dIdDnXbHc
X-Received: by 2002:a05:6a00:1da2:b0:827:447f:7dbd with SMTP id d2e1a72fcca58-8414aea989dmr3422968b3a.46.1779369156468;
        Thu, 21 May 2026 06:12:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:1da2:b0:827:447f:7dbd with SMTP id d2e1a72fcca58-8414aea989dmr3422910b3a.46.1779369155897;
        Thu, 21 May 2026 06:12:35 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.qualcomm.com ([120.56.197.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e040dbsm2306501b3a.34.2026.05.21.06.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:12:35 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH] soc: qcom: ice: Support IP version beyond v3
Date: Thu, 21 May 2026 13:12:29 +0000
Message-ID: <20260521131229.11199-1-mani@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0f04c5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=1vd9TceJNcp3YSkgDipBYQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=AEKRrpajgL9bFyZb22UA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: yESA62iz08H1y5sssQ_WU_XDuH1ZAVf_
X-Proofpoint-ORIG-GUID: yESA62iz08H1y5sssQ_WU_XDuH1ZAVf_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMiBTYWx0ZWRfX+b7u43IGCPkm
 hS6ePT4MtiJ8TnVTLIClhy4II3NwqSeZTttVqS0Xx23aZnIDruCyBpMJBxwPF9fQsQg/PnFOxeL
 9odmjuKAGDegc+9kLuS8hsM5kt1czKG8jNMRJAn8PQwxmFrv4NJNQXCYjXNVxi65Tux/cY0yZwA
 ANb9Q5H4ff0NLywZTqS1BbWp31eemSROxp1iub3Ys1VhEq5LXIN5sq+SbgnrvMjjlIEn5ia1JCG
 WDs3/DuuN3LGXbMO2EVjmmJ3IJZpR4BgdZgEUYACP8IhHMntbeGCk7Q1C9l/wmdvUIDKFjq/0fh
 YX9PXIm3zEBspkDeq0IxKlMweBSB9Lh8Z9iwUZMhLIqD8O6pxtZFFHjMrT8uEtBtJRBBj3RHyx6
 HU03Uq/rayU2iq8uwih6nZxBni3orJ+vmJMRWh9rnDWTdpK/xWiRn9wTyz8YViM/fhzIt3lm8+0
 kil+sYNmk9hN7FZNkeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210132
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109089-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA8AA5A5FF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

This driver currently supports Inline Crypto Engine (ICE) IP version 3 and
4. But this driver fully supports v5 and should support upcoming versions
as well. So extend the version check to support versions 3 and beyond.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index b203bc685cad..d3348b1fe85f 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -121,8 +121,8 @@ static bool qcom_ice_check_supported(struct qcom_ice *ice)
 	int minor = FIELD_GET(GENMASK(23, 16), regval);
 	int step = FIELD_GET(GENMASK(15, 0), regval);
 
-	/* For now this driver only supports ICE version 3 and 4. */
-	if (major != 3 && major != 4) {
+	/* Support ICE version 3 and above. */
+	if (major < 3) {
 		dev_warn(dev, "Unsupported ICE version: v%d.%d.%d\n",
 			 major, minor, step);
 		return false;
-- 
2.43.0


