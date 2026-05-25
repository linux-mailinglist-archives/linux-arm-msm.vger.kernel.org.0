Return-Path: <linux-arm-msm+bounces-109565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO5/CRPuE2qHHgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:37:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11C5C68E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 639B63001CC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 06:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE143A7848;
	Mon, 25 May 2026 06:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGczDeV1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IaTXbkc2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA7C39A806
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779691014; cv=none; b=CHwcMeQuOym3Hc+z1ICSep5s7CkzcbcXF1+DvQEai+658e8SasPYfoWrDn3Xp/xlkJ1ll67vNzSCDWn9NecFeN+0k7WZxpEeQLecN+UnKps8QdNydZqV4MiYI+/7giFYYAeEFYTLd2LyaXitmMB+Yv1wOMIKspwnJmYWZ6nnE4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779691014; c=relaxed/simple;
	bh=DVo2xi7RyBHNKdZAZ8GSGGWIbM7R2VtURBEfwF6e5DE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mDy7qEImqzSnOB+w2YmG2hoXTwom0rMTnax4BBcuT5Vc9OIiqx7vO+tKmgrFa5xwuXs5Q6ZPrAouOnDqJxecAPIaRrPnjA0J6B36RHZWH+esFbdcZ0PjkowovaVE3wUZi9bczY+ekBRWD7NfrMay4Y4s9xhus5hZ9k+V4Jl5xfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGczDeV1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IaTXbkc2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6Wf3L119484
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NOkeK1lAOdXCk7zOceGzmI
	a2wijOY9THVdbXy2AekNo=; b=mGczDeV15w8SQuG4qOOrciZtGIfJM1SUUI9CYn
	10Y+B8IDUPq8MhUyU+WAETrNSGIF77CY+waXxubH4vMvS/0yu0oUYEb96vbG51pg
	RUparnSoSlch9OaQafb22n6JPWfPqims8SiqeW8yaFwM/9wByXd33vZ7o8ZR93y8
	VGk9Aw53lfUjfL3ZOk280CvzQuJh9CsI78PcwCG4QjY0MbWUz8WlhE4yisnYaIWD
	T5Yns3sMXiIRiOCpeLpO/QWfnwElqJ8PVRJjgMNo75rRnRVTwaeJAjDmc1XN+Sgr
	D/jjmm81UIJRAaFOHPz04Ptg6qm6uurB8TRu+8aCamyks5Hw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3daph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:36:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so840094eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 23:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779691012; x=1780295812; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NOkeK1lAOdXCk7zOceGzmIa2wijOY9THVdbXy2AekNo=;
        b=IaTXbkc25AEF2uPh2d6OID9ENv0Um5jRVd+iKBdl4eJmfeQLWmzUlSUoMEWmwAfm8n
         JGgKftPxi0eyw5HK72eHEVgfjJn/wcsTLJrjLalgAYYscM8lFQdjXtozdQkWRfErB04E
         7fZxkgJnJ3qiz/036shvoziOTKeO13LQj9o0uUl7MgXFyXNGE7hH0ufzpxHC1ysC+UTM
         RWEawmZ0jNdzrrO3DNdCSAfhXLMoEPqyf+b1U3T+uC6EcvijcpSxfNaGBagf3AC4BLMH
         /f6PuWK7swVaikMDm0Xpo//GUr0rrWK0uXz78AI65L7bi6Ps7dBqiG1FgEHxdTSx0diK
         V4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779691012; x=1780295812;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOkeK1lAOdXCk7zOceGzmIa2wijOY9THVdbXy2AekNo=;
        b=N4xT3ZJ2SDhjol+D9dKxnLsHruVp76dtb69lHnN305VLUNVqQikKeM5uUSXY1hpcWK
         JNLzo74oQLWCxf8tYAi4ba4PjrNmMJmnnNqK1oAUJ5hq2+C+7o43fT7RHDM4BDGWd6s5
         to8fDmka3XE97giVdrUL1xY6CVk1vKd02j1tenog+mem+h+eL1aERA8h5eyxnjZqaWr5
         Y8ikOMDyjermQSYCJELUsWyDn0xz7f2v/e4d0t1KiT74iD7pObARl3sczPk7P+bTPV9Q
         EzN0R5l7k6dQaPWn/atgh11cwp/inZrJeYZfEuAjcxS7UG5EYul+yzRduaJl1VAsLX2m
         0b/w==
X-Forwarded-Encrypted: i=1; AFNElJ8mIQag/Ar1HFSalGx3baHmgCpWhdB3UgkhQDrtzheEpM8jIXf4gHbmoHb1Jf9VkOOSkguBjdlYCDWPIgI+@vger.kernel.org
X-Gm-Message-State: AOJu0Yybur3suPVZbUubTTcxo9ZJ2FbgIZnisEmDpOpfoX20ydtU+pfm
	N7325DrbHJMoMqK3F/1vWiCds2ZHfIqj/QTxwdaug8Uauggk6hR5uVGI8NdcSbzneMIrNwPyAkK
	+G1aVq25eTex6PM6fvML6zcjgX/X35K6HqGSeYb5PJfrF/5+VL0ALMYr0n9DamHKgfnZL
X-Gm-Gg: Acq92OE+Ozw4k8O9Ak4moxS52QaGfpNKeRo6gdys2Tr9gCuj5+3AVoVf1bU16EnEToR
	B901LTQ0Ibqk5RCkUOu2N2l8x0Fri7a3KIBHYkmElRFd4YTrSnHl6g79vUfnbsLXwDIqqtpfHJg
	Fy5cRiBfFUddzSQQ9INDcz2KOTAHplfIkqenS5EcDaoAHKJZrzffPlJHERywYE/jo/6q731PsVN
	jWiUGkvl6mdkAuU2lfxY5COgMCnGXvWawXMTooqmdz9MdL4+Xv0+vnNMUla/QhzXgnTuoH5mQws
	Yr3WgWbxMHo8huEioI/e4D+QKowFXIyQK3mFbjTdmeSfKSSw0MGPoRXvMpanGmA+RPjFzKLZA9m
	LHzphDMORqlLrRYjbRot8cZaC9rdANT+gs3cO8bwssxKPkKhGjlNe31XBBHgzwphvfwYFCyDD
X-Received: by 2002:a05:7300:4305:b0:2ef:1d11:18ae with SMTP id 5a478bee46e88-3044912c25amr6303195eec.28.1779691011577;
        Sun, 24 May 2026 23:36:51 -0700 (PDT)
X-Received: by 2002:a05:7300:4305:b0:2ef:1d11:18ae with SMTP id 5a478bee46e88-3044912c25amr6303171eec.28.1779691011032;
        Sun, 24 May 2026 23:36:51 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452255234sm8860713eec.20.2026.05.24.23.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:36:50 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 24 May 2026 23:36:41 -0700
Subject: [PATCH] dt-bindings: watchdog: Document Qualcomm Maili watchdog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-maili-watchdog-v1-1-f7efef781701@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPjtE2oC/x3MTQqDQAxA4atI1g048RevUrqIY3QC7SgzUgvi3
 Zt2+S3eOyFLUskwFCckeWvWNRrcrQAfOC6COpmBSmrLhmp8sT4VD959mNYFua9c3fZMc+fAoi3
 JrJ//8P4wj5wFx8TRh9/GFgTX9QU5CgDjdwAAAA==
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779691010; l=1021;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=DVo2xi7RyBHNKdZAZ8GSGGWIbM7R2VtURBEfwF6e5DE=;
 b=AOMlDdCYWLzUVN8VflDsm6CdAGPoXN7FFOxupsnJCEmrJXYSd5um+XYQ6lH1WSLBTPsnyhdBZ
 YYd58qUdCplAtIHIhN24PztfmaNcD13CRcuByqx1fAtCd8zU5XurIQq
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: _Lwg7o6-MjFVyLD54HSQlA6VV9Wclodc
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a13ee04 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GWLaZa68QPV-koml5E0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2NCBTYWx0ZWRfXznca/b4jcI/d
 cFAX2zmjd5kqTLJvp37LAcni5zlXphq8U6tgO/mdzNmlrX+elgLE6Nj1ekCRB//foIjXWtMJhQj
 0gUzQWKt5mjXkD3QVPlcBoxtrdnqIaHOEvJr0DElBopY2ynPXMU5GDfyG8MGtmqTbHzXFDtkEUh
 DssC/piaDrG4W3zOpukbAj3zPhNKjTOf55DEHpB7d0/P3AJsymGCgr2dTHr/4VPB36mVlAEkG+3
 BnzXFcgJDJZQ4lNZDay+UxRyuwTUKEcEkLth02UTp7K5K2BQw7ly1fl4gMGI70pZ8nkYOgfLWuz
 YKL4vbs0fPUr4shZIoescLex7AeFZ25vOVB9f9vfRHC3EyWLQUm1S55pZHKSfVWDm+GanflMwq8
 9FADRsz0eBWJUBFGBATImd7tZKuWzl5kbd6zQJdAMBNoNMMDSfbKF8NwQkcakQOnp/e8PuEDK8w
 q7VQh0/ge5LahdmUo5Q==
X-Proofpoint-GUID: _Lwg7o6-MjFVyLD54HSQlA6VV9Wclodc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109565-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A11C5C68E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add devicetree binding for watchdog present on Qualcomm Maili SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index d647bf5f19a4..074b98802adf 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,apss-wdt-ipq9574
               - qcom,apss-wdt-ipq9650
               - qcom,apss-wdt-kaanapali
+              - qcom,apss-wdt-maili
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974
               - qcom,apss-wdt-msm8994

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260524-maili-watchdog-a831468a2f71

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


