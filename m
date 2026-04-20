Return-Path: <linux-arm-msm+bounces-103647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGUTN7iR5WlNlgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:38:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A27E4265A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71501300B77B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 02:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75009378D8B;
	Mon, 20 Apr 2026 02:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnZOAr51";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMtgAdWu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94797378825
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776652678; cv=none; b=uD9Igri3l8HeNFsNUlpVmGTiXlUyoFhQikR7lTQDH16j6UMDRKbln9mHgZYzxNULrmQChaoxUsXAR0EeHEqfZ0mYysdGtgp2rNUDetecCXaEf/brwFqeb9bHG0KcpCQDZOGe5NuMld5r7o5LEp1L3Zf3nj3wyrJlgd704dRh2qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776652678; c=relaxed/simple;
	bh=edi7ASQs4faQY0RBHHFXV7sYsMZdNk9LRoZpbng+BQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JResT9lHv+sg9E+Tr1HJA4EXXwCJqpDo/48KA3vn880rUU6l1vlMjxXsLDoGR25cHp5yl0GvRbVRMYn2RaqAMqxA0Pbsy7jqQT/idTexjzcZdvZ9ag6veUurevNIKW2nx9qg5LAu3a4Haph6NZ4GyQhvdDklmRFw809GxuMqipI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnZOAr51; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMtgAdWu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J4fvng2147151
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sk4Dj5hdlb9kf/ULIiGgAP
	bRPnBpzNiWF4D+Yyr9emw=; b=lnZOAr51yUm1cQjT4WYDc2WKYzIacZ7KN8O4DE
	/xgo5MqznKz8+LMyIJhhLOkJTuUbvl1nMdGnsBiE1vp5y6YDA/aJuC9mWahGFUlA
	/DyuhTMQLUH5s2ZV8pTJ1XAf0oI660U+I4SI/fFFOQF2snmI2+OILg14BDwFkDAQ
	A/dFPf+QEDPeZTBy9E2+aq81CtFDLSITmIUPuJanH5oSPuxVDoXK9SyFQn4IsLs5
	da7ii88X02gs67Kz4A2R+S86FNmNuCA92x1tz7wWpIs63MliXk+t/es2Zx2ZH/SM
	7xebzM0OW5n1hpi98aCYApW5bOoFhx5nJjQbqJouzgrkY8Yw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkynec0an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:37:55 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c20d5d7f4so3931343c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 19:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776652675; x=1777257475; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk4Dj5hdlb9kf/ULIiGgAPbRPnBpzNiWF4D+Yyr9emw=;
        b=fMtgAdWunbS+AW83PxX5LhLCtHy6VqneUdkOa0GpSqlwPVGE+Wz2XQ0Ms89KiG1jZI
         xkgSY7gnwKb+gZMhGAYEW3xKCVzBlsQ6A/65ljtAivCC0sWevvYE0kysG1BeTepgxAW+
         4UgqBJRg9bdRWKEOyGa4JiAOG4U8OCEbQtG/RAWcItNwe7m4OtLe6s1lH0uV3audEG5+
         ra97y73QmldPart6tGRTu/K71ZexjjcCT3N+imYByXfklEDP/PuzPs180AwB2sE9CESy
         WLOxOISGmFslD4MzQyP0LQTPQHGWg6wkWJkc24/WSB9l3GqQyVZiCxCivj+xfiVINICc
         Ogag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776652675; x=1777257475;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sk4Dj5hdlb9kf/ULIiGgAPbRPnBpzNiWF4D+Yyr9emw=;
        b=riag8AQ44NGluJHz9MQ7Mor3oW5O0kPrlHaSxxEGUNk0dKoQc5TiGVQBwWoTkcVQlV
         qCHOjOsIhUwsbe+hAov+lNPZuTS5iOttwE6ylpgTI1lwMFBxG8dWgUgeiaGng/MsA90C
         TkmcRtSTlvGMnl731BMt8nUOrd+MiNVq6zljkBL95RdHFV4jgXYpAPxhoHl3gmL4bsuc
         oUMcdZ0hE+g5pWcMkBapMUis1lbu2bjg6uKuWiZ/GgJKPj5OXqEPzOWJJWLJUE2KZDUN
         UrecoLEs9qh6V9S2/qoJAiuim5ULvj5w3PQetTrp4gxq/98T0pIZeFx2vDBNUG1Ce8u7
         DWAQ==
X-Gm-Message-State: AOJu0YyK/zv0LfNb+aQz30MEv/72jzNNp09gtYRBIuRewfU4qsLHEylW
	cYQT077+clT15pDrvFBHo+hvdFI3Rdmv/5jdEt5nTGNSmVl9ObwETsL7D1jWBmJnLSUKvVeT1CO
	JyhL38MyXr/6Q+viqahMfGYOfCGPu6TWbpwipo+l3B4DOCHSPVfXT81RQAPfAhtlJw8LH
X-Gm-Gg: AeBDievT4NtDArXrNYu+w8ABQ2MwVkN2rSGC2aCjtkcAxZpT+/PR3kMnfQahFCwj21y
	yyyzXSMa+VoW6dvhCt9+Sh0nnhMxn3GoIEB7gELHEPCKi8QvcvWkAyRUTr5DW8kPwDvPZpTRQUv
	Nof38htFx3grvvXLsJjy/BIZI+8+MXYgulA6by1H3UsGt3fT/0ZZmVZL7LzCFRa2dnoOSvIZ6RZ
	bWkLod6+sKLblOMBC2o4kaw/EzQJZds+cx4EdYfJ6SpCfmu6pn6HOYXoIbhP4B50goFLfU3vgDP
	bkZmsoJH0ITwT6hLECRe5BEsLqBEQeL7jBWg00fkuucwx80ACDfSfsabdMeUlCSq1MNscYK2lMA
	WePjWQZl+HS3gn2Nm7R5Wf/GxLEkiihCMmcWzz0b8hAadfV7ei4iKMBU3rboHuHP6ERkq/v8ciX
	LmDuaLBbE4
X-Received: by 2002:a05:7301:9f12:b0:2e1:e3e6:2910 with SMTP id 5a478bee46e88-2e46577039dmr6929830eec.9.1776652674859;
        Sun, 19 Apr 2026 19:37:54 -0700 (PDT)
X-Received: by 2002:a05:7301:9f12:b0:2e1:e3e6:2910 with SMTP id 5a478bee46e88-2e46577039dmr6929814eec.9.1776652674251;
        Sun, 19 Apr 2026 19:37:54 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d4bdaf7sm12000421eec.25.2026.04.19.19.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:37:53 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 19 Apr 2026 19:37:37 -0700
Subject: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Add Hawi
 compatible string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-hawi-pmic-glink-v1-1-a26908c468fc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHCR5WkC/yXMTQqDMBBA4avIrDsQB6naq0gXMRl1tI2S+FMQ7
 26qy2/x3g6BvXCAV7KD51WCjC4ifSRgOu1aRrHRQIqeKlMFdnoTnL5isP2IG5BKWxOVOrW5gVh
 Nnhv5XcfqfTssdc9m/m/gOE5hZeyYcwAAAA==
X-Change-ID: 20260408-hawi-pmic-glink-29db229a1d7c
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776652673; l=1238;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=edi7ASQs4faQY0RBHHFXV7sYsMZdNk9LRoZpbng+BQA=;
 b=aye1Sft7hdu1VtYWT1egNkDDC7uQBo9LBEun9XqzAG2KVi605Zt2ehbdhius39pvsxRmVq5sj
 qISz3AwXjqdDZq4Nq4qcRLQUkLwRxUxFPo4KwUxht7F8M+AGs7BuX0F
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=HbokiCE8 c=1 sm=1 tr=0 ts=69e59183 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vdZi5cMLbBxFiwGQSQwA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: jDEAcyv6iD3U5ycP-rhojyxPxswazAP1
X-Proofpoint-ORIG-GUID: jDEAcyv6iD3U5ycP-rhojyxPxswazAP1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyMyBTYWx0ZWRfX9DwZnf6vJIvp
 OmcuPrbhNF1E5PdcgW92oHyLaLFMIkTIm1Vu61yfgceCwAALl16QjrlL7/jf3mSAj6dh6yxCa+L
 c9iWL8FWQaouu/DMFZg1+cMzpImsQwNJyEQImcQdvr0e1MWj1ll1NXZ4ZeS0EUZ0CZNcp+MCGJd
 36P+YcfAPqqXBTVXCyYjpNXR/mzTT+yCgAEqO3IGC6fmaHdaExHOK7GbPiCFhfPOF17PRLC0bXs
 kM/rbc3ul4+9ZmQt/5f5UI90sWk25nKu6X6OCyGlzGfx+xLJgSPkFxBWG02S56uOK20vhBHtouP
 XAkzYTCGsnB4DHKnCs+yEDJJHICxOxYnvSJGVSOzwGk3QD5JuTnhkVHmbh3vv+sqRhWU7LENH3l
 0k5LUFcqDRMF2HuXoQGWleFyQEin/XoGqqBC95C8kppLsXYXMd5VpG+nkz4d2gRClXNuz0GcHtE
 kTDsjMiPG1wEtENt8cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200023
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103647-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A27E4265A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hawi is a mobile platform that is compatible with Kaanapali platform
with respect to pmic-glink support. Add the Hawi compatible string
with Kaanapali as a fallback.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index ff01d2f3ee5b..2ba96d26126b 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -32,6 +32,11 @@ properties:
               - qcom,sm8450-pmic-glink
               - qcom,sm8550-pmic-glink
           - const: qcom,pmic-glink
+      - items:
+          - enum:
+              - qcom,hawi-pmic-glink
+          - const: qcom,kaanapali-pmic-glink
+          - const: qcom,pmic-glink
       - items:
           - enum:
               - qcom,sm7325-pmic-glink

---
base-commit: 33b04b06d215c7381f76b70aff351f649ccce202
change-id: 20260408-hawi-pmic-glink-29db229a1d7c

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


