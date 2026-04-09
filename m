Return-Path: <linux-arm-msm+bounces-102465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCQQKrZv12lzOAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:21:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8443C865D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A759B30074B8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4815F3B38B8;
	Thu,  9 Apr 2026 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4fHSuAO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AwCDvB51"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553043B0AFC
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726508; cv=none; b=hpdd401E0W5+NGw2KnN14c5shhGc976EseMFMflvB36SN5xhxkuQQ4dbTpxS8c/7cmoPhdAtQnaUt0cV9SvanN6kzr5pub2HXICGh5clh/rZZK4aeAsbETWH5REVQpFex4E1c57y13fEfgKe8mx06tNZUlFjwxjAvuWiLJ2KFrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726508; c=relaxed/simple;
	bh=lyO+hk8kt2i0G/vKlS7Khc05+qw6hrcZ6upbhob8yAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WCTeAnZQ0wD5/LT2L5fYCfAR/4NWB8pN+Orit5FRtedniiCnlCtUA/XpSrj0b1rzFtrpTyVGILCCB9uhnu7M6quon7VWI+AqI/NfnZLpYjVAy8uFlwoEqc9uLWofctLb07Mw+kzh4NGz1yrqCj+u08kgV+oC82HhVZxDJv9Rn7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4fHSuAO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AwCDvB51; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397ULXs2845979
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=; b=Q4fHSuAOQkbgn8vD
	NmMWvK5Ip7enQi2hLm+i5QclQFGKyKJ0Pg6PN8KI8l6f0mtO+iqdQDqsE9AICSz9
	+ubjfqDxXN+l6HSHdb+66yOkf4Yp6B0HYPgbWS04rpRdtUljjrwFXrZbBJXniGMc
	coEpmLEPMAQrkIyUpd1ADGEMsYzWHV3y3XdN/GLpW00YkGwkqx56RuPltkexpNoD
	bK2B+l5/hRqAPk4bx2FEpsf7/AsYsZuEa1I00nkhz1yY+BIngzf82MSwIIXFamlM
	eDXvS6n5Xzud2nD5RTu/o5tYYkYxQG8i4jpt+RMLCphNNfsXXpHFYza6kI8oZlH1
	E1xFbQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt7hkct9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:21:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24308165dso15978845ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726500; x=1776331300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=AwCDvB51sR/AnFv7hAoV1djRreqSG+vwHL5trd0GYn7Kk81lYThHsrwPTait8/h8q7
         dUcISAV0xMc3y7WzJqbFCRAOjv2lkyQLhG+H4mTC2PW4OUYjuJg1V5n7QJx+BTmCpiU4
         6ima5wrvXVDWXWuyjOJTohisXw43bkMRq6oVLk3ERsYrAMFCjA5nUn1WNUv+8/doELEQ
         0NRcfzP2L/B0LCRhu2v2Owam3iKO3afw3qlO7HgYdhz6WsUS+kMhxLvDmO6l40fWQPGA
         pI2Jl6msusWxnnKVIo6ao6AIuMwBv4vn9x1gaISCuER5a6aWjY53C/i1TkwtHYlL/qwP
         fe2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726500; x=1776331300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=KLq7itwRr/xOTqBKYDQrHByUknsgYHOoBh9oqTdZhbpWzGBXyzfC7fQu7QGZDJGSri
         qKtq7jfZmL0EvS70Np/m4w/Re8OZzXLv9/4MZ8qR7/L+5ivrMtm6P+/6GKpFr0kMOPxq
         Vai+1rw5vozYt8XDLBViDG4T92SgVPMNBWD2dL0EO6h80JC4x7rB2EX3pazqrWHOQGsL
         0ihTKRizDGAMX8LJhOBMgHo3oqWF63J8/kgtaP9/IqAV85K/fdTlivQ3ogm7FUaw1o48
         rYBzH+UD9el5dYstGPICDECSqzyG3FBbgpeQp3dtQRD5JAL0BF+Vutbr7zpT6Dr+jCkz
         +5RQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4TTgIHLEKLOGFKA8drlV0og6S9ElVcItD17OEIocN1wljLqrbDX9wGJf9t0YjXmeNcvM1tfEvCB+AVPX0@vger.kernel.org
X-Gm-Message-State: AOJu0YyJVPGYRUB8c5dvMbPYwlXVxVMPlDFTfRVThCrpOefEwfTJxn+a
	EgaPU/wEcVAacJ/mM53Gmo9BYoMBPafnDuNCbU82m4yDAzJ1LrtKeJtuVBaEpcMrsWg6sBxjj3Z
	4GYH7LFAT+yePVCsOi5Zn6pwQAU/SgdJ1IpalIQM0yMOaqiJIodgtYXxsc043gdwlQg0N
X-Gm-Gg: AeBDiesS/573ca+nUtGuoPa/GL1zAS8hehSFSX5dCn84lj3TcW+R5pHAAwhAyAVTLkg
	2xRML3140Lk6fZXENEA9TLevuSvZdqXeAXkWcMleTk+hGKnDH9cqQax/b1M2/uIsd3yO2FzOmyV
	/KFqHku2uYJcNMYvzTmtjJx9AxcdZ5JAThQBq3vJen7ki5P8G1xCuoUtjfyhaC/bSRU9rzf6uEJ
	bgIV8z3VVK1px6LNhnyCqsNCxaNWi9wWNkkCN8DO785r8/G3IOCFnANW/1gye1QynLhwyxpi6n5
	hjtEcJlHz99MNC8bofuaERdZUDL5xEFmcXk5w2937z0MNY8ok/i/sINYgLIMf24C2PFlqHJWQFG
	BVs0j5qechkrRIqq+wUaC4EjDFJPFPq+QaxRJ/LylVeon6MNMMGwF
X-Received: by 2002:a17:902:f9d0:b0:2b2:53f5:4627 with SMTP id d9443c01a7336-2b2c723f6b6mr20624965ad.4.1775726500405;
        Thu, 09 Apr 2026 02:21:40 -0700 (PDT)
X-Received: by 2002:a17:902:f9d0:b0:2b2:53f5:4627 with SMTP id d9443c01a7336-2b2c723f6b6mr20624665ad.4.1775726499939;
        Thu, 09 Apr 2026 02:21:39 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm311766815ad.39.2026.04.09.02.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:21:39 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:51:04 +0530
Subject: [PATCH v4 2/7] dt-bindings: clock: qcom: Add X1P42100 camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-purwa-videocc-camcc-v4-2-5a8e5f2dd4b2@oss.qualcomm.com>
References: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
In-Reply-To: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=O5IJeh9W c=1 sm=1 tr=0 ts=69d76fa5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-2Qx4yxcNGLJKJli3vsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: OCUavRipSBbg_DuV0NxCll5TRi46D52_
X-Proofpoint-GUID: OCUavRipSBbg_DuV0NxCll5TRi46D52_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MyBTYWx0ZWRfX8NxfWdpydLci
 gwcmIgrOoZGGoU8nIHPKNK08iRatjkUZp9bDxFLPITR5YNf4vyPBvegse2O+UfYzl8Tc8lYGRBY
 ASTSaW/c5X4pg3KBgDWCyA1SjKi1wYo0Ruy7d31i7vE4vpqqi2e68OFfarRjo3B5qy6//6pU82p
 kcrhB0kYlT5O3+xFM7NG12OBsRCZFC8B5pxjzVYu+1ebjboAQFrdTdBJwzMpXwzz0oNACwJbkIS
 3m2x9HY4++bXU3TvtBrIAH9krIMOLGVh5mUajSlja78YAmT5dEmHchpVUTgubiwJshs+g4ugVPi
 z3ShYOU4XpX07tqluu1PUHwA4nDhnIZpyXqLW2EjQWInDEI2qeEhlmOScCLag/fIEAQJOLN1DSe
 42ISvn/I5a9PKfjZoAauwynFlWNU+lLLaG7tQXeD+9NLyRCUBeGmiJDbWHr3WzF40IAS81DbpqS
 CHSZggd23r6/4e5Vk1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102465-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B8443C865D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add X1P42100 camera clock controller support and clock bindings
for camera QDSS debug clocks which are applicable for both X1E80100
and X1P42100 platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 1 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h                  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 938a2f1ff3fca899b5708101df7f8aa07e943336..b28614186cc098268ab0d8c32b21d9dd9508c9f9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - qcom,x1e80100-camcc
+      - qcom,x1p42100-camcc
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/clock/qcom,x1e80100-camcc.h b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
index d72fdfb06a7c716ed2ec376e061e4f0ca35f42c5..06c316022fb0d26ec6243b28477564d97f228c8e 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-camcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
@@ -115,6 +115,9 @@
 #define CAM_CC_SLEEP_CLK_SRC					105
 #define CAM_CC_SLOW_AHB_CLK_SRC					106
 #define CAM_CC_XO_CLK_SRC					107
+#define CAM_CC_QDSS_DEBUG_CLK					108
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				109
+#define CAM_CC_QDSS_DEBUG_XO_CLK				110
 
 /* CAM_CC power domains */
 #define CAM_CC_BPS_GDSC						0

-- 
2.34.1


