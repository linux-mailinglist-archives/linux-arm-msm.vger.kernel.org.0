Return-Path: <linux-arm-msm+bounces-104586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PfTNZW77mkaxQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:27:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E560346BEAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BC433001A70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2DF258EF9;
	Mon, 27 Apr 2026 01:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQqL/5PT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ck4Psd3T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECBD257825
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777253264; cv=none; b=RZ5kEOUlM5k91eXZpP0BDtIeG1oLkPPLGJ8eFQxuWThy3OY0K8OXHt208W8gYfHd+BDMhRiuI98oUDrfeX/TXhD1Ch/grbWVNwMncjR6EvOCfpckmZhZdBLJBZxIbGLo4Tg21H6JsIfwWwgDZ/BumHfibuawjEMmuBEuf1G3ve4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777253264; c=relaxed/simple;
	bh=u1m+eBlOjBKApUV557TZ7F+w5Y0+w0HLy7J7OuOZqxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YdneanzBKNgYFFYrccTd9vTnvh6mKWk9FQEG1tqbXkpeCME+oZgc/nf/RVt89JVZ811hjcBodORiqecMIFQm5OGAe3oLrB9uQcMMwBdYZ1fHUlQIFIPoI7e77EPJ60q5XR2HSechHyPpxeERRFuiK94Mx+1C8mEbPFFhK1BBLrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQqL/5PT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ck4Psd3T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QM4oiZ3850320
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nq0TDOcXpxhAAnClfplnWd2fgSnOAj++nN4
	/kbBkMow=; b=SQqL/5PTl9U8rSW1p8bVYmNTLOJqRbtoFYhcY4Ps7LeSd8Ve+vx
	+UthAf4XQXccmXSoQMO6uGu3JpSaUHDFfWBhSfwT0XR3fJqwrN0cHobD9YNx4dRv
	kMfbpjEhAMmD1XLAYWPYS2zqkCN3qEDdHvZ/yjo7CKlefjAYqCgBFVa3P2qf/cgF
	CNitUuYjphKWD1G+l4itiLXCxpluOpsuYkIz0QvhXwa7m/rxp0s/qZXhW/5wl/1W
	7QmoyP8fyy47OvjWDCdwPHR6rtqul3REnq6XxEftXJcIBpx2602b+O7PrziUhROD
	cYto91+mqfotNZuWBu6hoF3UnypwMxyYz6g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxbxet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:27:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2d9da2559aeso27183784eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777253261; x=1777858061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nq0TDOcXpxhAAnClfplnWd2fgSnOAj++nN4/kbBkMow=;
        b=ck4Psd3T/0ClbMF6DBRvc5cZUNQfBhRtdL72T4d6w6G7VlhoVExV+aF5lwsV3+23Vd
         GhanXzMD6Lw96D44jvG+wWBJmpCGdtk7aTroGcNVCvZQEHy+SMjK7BeEoV0O6uzlnUtE
         BzmCuDZZT5IzL0r6iYRqmEAdXT2qpTLF9MpH/DrSVvYNF5FfuGlLbfWxShdQFPD7Ld6+
         2EyvItkTQKGmjba0Mg+1f7VI41mQHXI8UsZMvagsmKdGeJBTiVH89lkhnNivSyuzGRpU
         IqUVFGJXw0F5PutcUNG3sbAxgSuQDdwuaVVixj8T9C2Dncw6Xf5BC2P0j5dmp1ZlQ4C+
         +J1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777253261; x=1777858061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nq0TDOcXpxhAAnClfplnWd2fgSnOAj++nN4/kbBkMow=;
        b=P0sXKwuUKynNTGw+vcS7Yna9hKFGfyU/sY3ZgvG/RnMH/96qCvk/J3v5xTIKM8LAJl
         lEYvNOaDX6N11t8Wx0dgU1hV81UMqDDQo8eKxKaMUmxdLgw5xxRzVyhpVPxHdqkxc31u
         joQi5F1Vbt/GJvoUu9n83zUSCVsjDbpqE2gi9i5dRhexx1ZLe4uZs2PUbgub6qvguazb
         9pYtTK2+Hl4RqAi9G1Y9//vGzcFn9z6LNjph8tK7q0y0Q8MkQrTYNxOvXzFe+jRGhulD
         4/yvbCaQoWHLMc8cI8+4pZSaFvoCg0AtR5/3B9CGfItY+bZeW2D5VykcfbUl32S3NPxr
         m4yA==
X-Forwarded-Encrypted: i=1; AFNElJ9w1IGMSg2lZiHwAIbsS7h0p+yfWHgsWh5mfKLKR09VDNCvH3ZKYnOMdtN9iZ7b5Apdg1ZbMFLBxkntFJWT@vger.kernel.org
X-Gm-Message-State: AOJu0YyxwB4xpt534XHpDUDNS4vS0kognpvNKJJPYZNFCicN8Kswwija
	whyviCHL/mxxNjfl30JmbJEKHZAUiSb4LyW5JJcBWjA+m6i0Ujhefqz2StUnc14r/KPYtTZaoWF
	S5uMeuTtizokW1l28qv+wbEW2kI876Rqm50gI0vxBhS5ZM1GEDunV2KcXGZHvL6T/RY61
X-Gm-Gg: AeBDiessfycCv14qbf5Kukq9yCIbq5uJltdEF20k0LLxwVy1Y08YF7ov+PNktlZzd/J
	Vpb4C9TjBfB1XBlYHaxgrT3Tg2PsX0Ny88Zo8GAOgflGXrgAiDjzIZIZ5vn6FIIJObeZIjt567h
	e7FGupLmqVLAyl4CfcJtd0gfcjHOflCxHXCIMRtPTTSijFu5ISLNoS3eK71gQBbVFimqjgxvbJp
	rm7w+Mq/788bOYAO1wd1yIDhzb+JPRDM//oaRhriARtlDpiLA3S+t117IxrzT5NqriY2Z0LcT/c
	2H8dzuglBIm/qhbf6uRevMI0MhFu7+DCd2F9QQsStXGaAI7tHlmP3EScU50O8SCnUkJPymDvTVc
	TE6yzDqnlCmdWTD/3X2uk2v793IMRVqy637hwgPwKLd6DjAmZJFySHdKq/2GreawSXFTsXzgLQY
	07duqzbxeVEwjwJRyb
X-Received: by 2002:a05:7300:748a:b0:2c4:ec89:bd3 with SMTP id 5a478bee46e88-2e479419855mr24934173eec.24.1777253261461;
        Sun, 26 Apr 2026 18:27:41 -0700 (PDT)
X-Received: by 2002:a05:7300:748a:b0:2c4:ec89:bd3 with SMTP id 5a478bee46e88-2e479419855mr24934154eec.24.1777253260949;
        Sun, 26 Apr 2026 18:27:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm41105411eec.2.2026.04.26.18.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:27:40 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document Nord QMP UFS PHY
Date: Mon, 27 Apr 2026 09:27:32 +0800
Message-ID: <20260427012732.231611-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _yLqiXmk6x2NfFpeG4fbKqblVSzYRmMC
X-Proofpoint-ORIG-GUID: _yLqiXmk6x2NfFpeG4fbKqblVSzYRmMC
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69eebb8e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-P_PvXqPkIm6cR4a8nYA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMyBTYWx0ZWRfXy7543ZKFF2Yo
 b8mSNuHFksCVtXyKI8ZUCsaDQYVbM4BVR5Fwuy1S1RBHFgYhAlzVLS/2DjFyInOvF5BV/jQaFFh
 9Jre11uk1dXRL31v3MMjyZ9NMB/OoMvhMXEi7CgjhNGr+s9wsCjZVQKSSSVC4DePCXL2BYWAGVq
 Zr4AhDyx2SkYzuXuZbclsMjm4ktl29v4CWRlKCnCWrK2Po5mPYSF3jgNZ/Kk+7JLt2Nifbst15l
 pzHUwDahHmXKQNRgotyHDivk2ECZ+f+Q3KF8QZKRLduQBoBQ0+iiLquGCVBT/Yj+k8LjVzksCZ5
 uL7xTPzBC9fjK61qopoNXDslBNWU0kPyhtZePS8KEpYnpXXzjJX2uc5jQx32g/XRqcVYqwR5ajv
 2nG1oyN+VHtRwU6rFuXIk/8ZEQFZYfp7PPQ/qIumMX4StOp8i/bW0kdYofBqt9/ziY/5bUr7D4L
 ewFTeGCsVNkHW2zuqpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270013
X-Rspamd-Queue-Id: E560346BEAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104586-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document QMP UFS PHY on Qualcomm Nord SoC which is compatible with
'qcom,sm8650-qmp-ufs-phy'.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Add Nord compatible to existing qcom,sm8650-qmp-ufs-phy item instead
   of duplicating (Thanks Krzysztof!)
 - Link to v1: https://lore.kernel.org/all/20260420074942.1250414-1-shengchao.guo@oss.qualcomm.com/

 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 9616c736b6d4..b2c5c9a375a3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-qmp-ufs-phy
+              - qcom,nord-qmp-ufs-phy
           - const: qcom,sm8650-qmp-ufs-phy
       - items:
           - enum:
-- 
2.43.0


