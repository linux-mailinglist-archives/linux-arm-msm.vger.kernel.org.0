Return-Path: <linux-arm-msm+bounces-106896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OkTLl22AWr2igEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:58:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C34AF50C603
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E69593004606
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17E91E492D;
	Mon, 11 May 2026 10:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXui7dDD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLQ2mFPA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F453CFF6A
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497111; cv=none; b=tsDcSyj8Udc/tiCARQ2ehE+U5Q1Hd38KV22SOLR5g+0Ld8Bvo+aTZt2/OQGNtSB8G6lPRaOJ4DAlYhDMtzMyJsl37X5STMMMLlHqollFzQKIWWFXqkX73ovyvliqFBbezpMfWvpm9Aw0rtBwqsFfg7PSCAx8G4zL7WJyWebvpFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497111; c=relaxed/simple;
	bh=JN6/ExK2Rg0UofXLGcXSts/oWytXzJDW+aaPu6IaotE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=udagRqu+5NDzoUZa5wGlloCXS9IIljZUYPX5xpaOLRbx1pmP34vmo1pc1jD4mpUbuYhoyx5TjxlDXEUP68bRvTHubkHqCQpHNHSZY5ifliLGqaJ1f85yO2VOxH2ff7sMR+1nU/PViChGZ7V33Br2aTKtlutpd2FG0i7Qm8fVl5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXui7dDD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLQ2mFPA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7A4AK1258491
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vXUszgUsTn3BGokN887JAQ
	GEwf4F2sSdahekz0rkWmY=; b=LXui7dDD7UjmVxYVtnKT7ddgc7/E/mTzGKSk0T
	+lMDC9RvJqSqH0zdsHKpSqGKqmxUlmiaiK2p3EOak3XWPAubXmUMd+eFb3WXfhjy
	Pg0mee8xlH4q/SgFG9f5/ESbE0AoUv3D1MEg3ZGT1XO7/Wb30YxMi9PC15lK6LRM
	ENzL3rl8ddmMwaCRNKIy1v4byWJ/VrQ+Eio8dzE3WihEBOEKKg1n6qEvl+DB7wmM
	xCPjlZiVJSf5DfYxfWsUw+d/mPiN0YiKCbWkrMMud5sBdDHvxd/5H2x3ro9ThEb2
	qG3pjC9VWfEzKKmaoS/xwKeKgcZ9UoCaGTbao/utS9+fdF7w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag20tkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:58:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c44bf176so5100867a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 03:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497108; x=1779101908; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vXUszgUsTn3BGokN887JAQGEwf4F2sSdahekz0rkWmY=;
        b=KLQ2mFPA/OiqAy7c1K7LK8zNuwf4FxN3g8gvEITvjakPLNpNboslZ6MKHUpoaO0YX2
         cf3EwGYWWIwAHPeHf+nPyP8mrFacG+gDQtOc6vldvrtgXHhfcFlcMRDd/d54K84aIshC
         VnYTcce2JQ1JMeLs2bv5fsYfjR43B+LFhyZjO7wosbN1FCbuSPLW+Uf9383kxbinnKkg
         luc3B9wAyFHoJooWglV31uhbx7vxwvyN1wIQ+UcqPcVF0GwWqZY6JkJdVPSZWmf23/9o
         8oxeUe6/fCIEAlqOFNfVpqUitH2QzwDyW6lANT4lAi4lepsEJUokL5gETg21R37+Z1KH
         UYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497108; x=1779101908;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXUszgUsTn3BGokN887JAQGEwf4F2sSdahekz0rkWmY=;
        b=MssdKDJea/+BWzQ6WrPv1Xv8nAzcoxYtSMlzsn4odZm8+TP6qhVcmLoR8ZgHe6kr3v
         xzQNz+8URjSogydpq43X75jhUCH2p5jlGCpNEA1tUKxWoW4Vwt4Yb4Vvoejqt+x2lPsD
         q8uhbqYYdO3/3FoOsAuseNOtEPLvEkRA7vS2aSkwvlR/SIlGJRE9UMDQavatJjYEqWMe
         OrHn9X5FGAsGk/Y3Xm/PPB7FoZq9hRBycpZ1eJl1CVSoxJK5YpyzStN2yTGPvlHAdxjr
         O/KmuaOsp9OhmThfaycIhK4Kd76KTzfEU8Dc759jfHx4IstcOK2N6ghdvf+UAYfQ1Q92
         Ne3Q==
X-Gm-Message-State: AOJu0YxlF7JtmKJ15cya7ZCPdlitKXwcLom8Sfv+LahwzotHCMaTa8vj
	3DgZsUvNSMN07AsGbgOZXTyBmazIUuYqrosDsx39yInQINp41E/IbZTsK8ktJhOnG0h7B4Vc7Yp
	qiAk6soAl9zrdyeuCdht9epEzgdgcalmlGKsgbgVtZ3S2sZZ1pAjSB1UBdiajO968MCaD
X-Gm-Gg: Acq92OHZ8dJRMKKP8Y/BOkdBQKtCeSOkCH3AY3iGnK2tSX5pAzvoiCmLbAlv8R1Fw7C
	cSd7t9Js5aRMhgltYX9xSDpY13jEHaRVAjNTgsvNYKTCtR/TFsN6BZViM7Cv0caP6r4m9QX2X2h
	/MgQbmfCVmLSX/LyP06bD8yxDSmPMbD7B1zlV17Ko8ptqeGRFg9SIdS3kcBDu744TeYoj2UJFq+
	7OHn++KzuUANFnJzrYfKe4/7cHABKz3NnkMDSR0/vprhZtaIAxD7Hx/4YV5JTx6GQZhKVSC+mqj
	xy/Y8hFfti9JcTRLBHLiueRaz4W35K4yBM2aCnj6Ih5XIwPSX+fCvuuIjwatz8tmgEGdxUVwfY1
	G6E4kwtnWnPlMcFXuYaSxKMJZY9RSOWJ3MSb8jSWKWS55w6fvp1D8egTtfxKEVqP/TLm4ISfcSD
	a0L6EuScUxvSgrdOg5ZAD3i0DPRKeP72AnmDz4E8EyKyNszRj/itOU8b5kQS5VGBN4KCc=
X-Received: by 2002:a17:90b:270c:b0:35e:5723:85e3 with SMTP id 98e67ed59e1d1-365abce2dd2mr26055489a91.9.1778497108537;
        Mon, 11 May 2026 03:58:28 -0700 (PDT)
X-Received: by 2002:a17:90b:270c:b0:35e:5723:85e3 with SMTP id 98e67ed59e1d1-365abce2dd2mr26055461a91.9.1778497108075;
        Mon, 11 May 2026 03:58:28 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d625f126sm8256025a91.3.2026.05.11.03.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:58:27 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:28:21 +0530
Subject: [PATCH] dt-bindings: mfd: qcom,tcsr: Document the IPQ5210 TCSR
 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq5210_tcsr_binding-v1-1-c8d20fed014f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEy2AWoC/yXMQQqDMBBG4avIrBtIAnHhVaRITH51XESbsaUg3
 t2oy2/x3k6CzBBqqp0yfiy8pALzqihMPo1QHIvJaltrZ4zi9eOs0d0WJHc9p8hpVM5j0NHCI3g
 q6Zox8P/etu/H8u1nhO160XGcaaZwO3gAAAA=
X-Change-ID: 20260511-ipq5210_tcsr_binding-5aef0d2eaeca
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497103; l=994;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=JN6/ExK2Rg0UofXLGcXSts/oWytXzJDW+aaPu6IaotE=;
 b=cryJjrmFzhER3d17VRz4wXuMyLqEh7y5B+jD3YZawBKr5NeD+OiAeWnkASQ2K5/b+phrB8Frp
 dHfwUBRvWrwDcFBMg3kVcBd9dgLeqCjehwWYt3GQG9Ce2QKWtenIEbH
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: WizShNnLSRtrBaLq2ULHjoPNkzDhPn4c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMSBTYWx0ZWRfXyfZ0COnld4U1
 q09y/WHEkpbtmmxKc2L38Rq4/SUBeHo6crSXSUJjdzpFmI7pY5wkOXkoXWVwS94wzQUnYInZa09
 QGx6I8guUeVcvRhgnixEecv03ZQzLMY/1+eLivn0fJTtp//MDQxOTefLNKRqedCUIoSg5ZymI7s
 IxQpOF4Wc2+DXbi4EFCPlrEGmRmfN2p2RFwfOBOZFT97wsYdf1J+6LQD2I+pTM+Bch45V57dbkj
 FknTp0HZc6CleeMEa//qTxrz47oWl8JWW4kxih4x+OzyfgfAg1eZ8Z/I1IfM7osCjQx4bhNK13O
 bfgdqvf1FAmQXDQO4xhmxvibykdnjkPbv2am4UpXhqA3bDHNp1CChgMJitq1UTwvyuTDflF4YOR
 81n+feYKUPwHD3L0N1Op0Yjay2rEKMDLooG1QR9/sF6S41LOxODXWY6SPC6f8yKxWrCj6u4Qacn
 dHbvjKjaiLOOlSgbn9A==
X-Proofpoint-GUID: WizShNnLSRtrBaLq2ULHjoPNkzDhPn4c
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01b655 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UC7JEpr1MBeH69GyZZwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110121
X-Rspamd-Queue-Id: C34AF50C603
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106896-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the TCSR block found on the Qualcomm's IPQ5210 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..c63e677bd913 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -42,6 +42,7 @@ properties:
           - qcom,tcsr-apq8064
           - qcom,tcsr-apq8084
           - qcom,tcsr-ipq5018
+          - qcom,tcsr-ipq5210
           - qcom,tcsr-ipq5332
           - qcom,tcsr-ipq5424
           - qcom,tcsr-ipq6018

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq5210_tcsr_binding-5aef0d2eaeca

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


