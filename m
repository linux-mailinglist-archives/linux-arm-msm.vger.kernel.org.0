Return-Path: <linux-arm-msm+bounces-91547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNyWNBHpgGleCAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:12:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AA7CFF96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49B2A302AD95
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 18:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91FA38E124;
	Mon,  2 Feb 2026 18:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ca28SlEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asvA2l41"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFA438BF99
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770055860; cv=none; b=T8tmtMWxJffRF2QHpDxY1K88ZXlddbikVJ8mhaG+vlXxt5Fvl1IX+Jbyvxfzr8q+7p5EhTf4QC/FgTpWurmHIh909vBK1ON35vHEseaSrAvMrluSUH820u/4FO6TeFY/ccOy7fFiqu9arEaaC7YmKeioyjIRUs8ua83ZQCMmgr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770055860; c=relaxed/simple;
	bh=zqKO3UGvbDMJ+JT+t551VX1HZg/Yo97PDn3IZ5tzYGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W4az2RrUvLZ/umOgqhohSbqNGjac5izbVLM6Zbtvu7hlvqcXvOvbfkEKREU+BoRRQxUiz2dSTq/ktLUe8RyQ+Y/Vwg7xz5aKIQVBKXSXkl2sly2z/OXAIoaGwJQJa7t/GX5PgdSuRuRWiW7AwUbSfgZAHDU5h5iK3f7wX2ozEDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ca28SlEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asvA2l41; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CVGjB255369
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 18:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R+ngY54m3iC
	HtNRCdl+T64Wh2WWMDO3stultYRdrKfU=; b=Ca28SlEWBX3L+O/vmn+ZD0CPHmE
	WX8YwUV8J/1W5SHndye/wftlhDMue2A2a6G/qVWdkl16wkLB+qgX2mng6WBLmyVR
	tC/dYWQAMbLsi+xlEGamVZJ/+vbfdZhjqVGVCUV7AbOzi7xxeGqJz8CW7V5jPb1W
	JFVuKtFlPTFj41zPg9E52DJtHUyD+yEfab+UCSfkPZhtGU0V+Uuz6TIiLRGNVWgt
	urmRuyO6VNR9mCN57GzucqiGvAL/VP4tMqXae5mVjnKBVMitGxzedWl8Nm4Y8bBK
	FwYEMVPSAmZLfUci5a5rQwcPiykQQm4En92Z6MJBhblvi4CHJbyde/SbhsA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0kh36r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 18:10:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6187bdadcdso2651791a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770055858; x=1770660658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ngY54m3iCHtNRCdl+T64Wh2WWMDO3stultYRdrKfU=;
        b=asvA2l41LOawFHmCz/JZ7qxtpghLGVs6g9VwHDY2R4WcYwucw16FetXSCCHgBf7IYM
         Ln/ek0Xs2qCfjgRFQiBpvjj+NQWBIZIFYaojK41yRU0j8qLLPSMEFnusMOG+dqCOWK1q
         bONLV025qPmfyXwfGssKPptuWp+qTQU1MZkjIhDOkJT8a6kPrLMURo3vIJgUCMFPEkIK
         livChx8Zo4RF5U6cfaqJDtHtl4CFdOpq7vozRs4JtKaBNKeRbd8doPt+ayQpWk2bmgNw
         /OlC0cUS0n4XRK6rU80v66f1bvbacubHqQBnwwzG9+QJGy6+6t/Vnjc3ACbDBVHXQvQi
         YLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770055858; x=1770660658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R+ngY54m3iCHtNRCdl+T64Wh2WWMDO3stultYRdrKfU=;
        b=g/EZPuAjbIRU3V9Dy0jdBmmunimt7PgvYgakcG6xNd/kp/DmnAiKutU0qQhFXxk3Dl
         PDK0/ZueDCijwveXApbWhmgjNgE4R1L5z8IhhGjSGobqdIIKc9FSP3FFwcTycQpXmcut
         hOmNDxe1vGtkzoYeaTzaPJeOWPWLr+ron959lEeYLs0/dSP01Rp8k3/Uz48pojRjy31P
         xASeVfQgHEVNtxvJXxY4AKN8N9xHxSU6ef9fDMu5LI2eAaJNSVuuQaxYuKiqh0ODF3IO
         ajrNxfZdftMWxdDqpn1fqn3PtV9hXUsCmZ/L/wcMo0yGYKg3pY8J0pvIibmK/qTqJzLe
         x6YA==
X-Forwarded-Encrypted: i=1; AJvYcCUYoR4HFxwI5ZM4fEa7ajgHZhmyM5S6D1qn1SRutt/A+VaC9oZU0eY2G4w8U/U+H/U5wCpp2NlA14RnvsHS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy7+iiPgNFU/Zq9HeZ29gstaJgtNt/H8o2ZprC/0DNQd5cf871
	FXduTWDuBeXD4Z7/9mdBpc9a8R/GWCIFJqNW4YhT+PJburjYgXBzRiRoWcfNqjaQ4aUhYw0jPPd
	llVqX0IxEmMBEqKlNU4ipZpsvep4tzLOCMmPUh7vkfBRXKs1z3XfkV7TZRzvG8pZj5kwf
X-Gm-Gg: AZuq6aKc8wxsASILE30NDUpqKFSvax0tDadja4sQNh5OT4eZw/bfzGmVIbnuA4uk4lr
	DojoCWiG1F3j4hAnob2dDGSVzaZtEAV4OB5xnn4L5Rp4/qFSHMKw0wU8Gyp6E8x0w5UngqW3O8M
	2CB9SjcGwkOTwwMX5fvrrIduKf2nRBxG9Spjv4VCLZ+NIH8F8Rti4XGx6So+rNEKmk9AEzwteyG
	OYO3EdIJEQmkYi0DEDPvle/1V65B0swgBT3o582Ahprn3cCvq24U32MB4vl3Uy2EnYjTRpszKNZ
	c9GQ0tJHgfa/53N36K+Cp+8s+oniIR9UqHrBbAWayaougO1mbQdAIycvy3jp2ZRRnAiEhUIy3hY
	jp8L6hO61KVrDRxZyVb8v0i7KDAv9ChLuVKtC58sMPZQ=
X-Received: by 2002:a05:6a00:8d87:b0:81f:4346:6870 with SMTP id d2e1a72fcca58-823ab695dd1mr12685386b3a.28.1770055858043;
        Mon, 02 Feb 2026 10:10:58 -0800 (PST)
X-Received: by 2002:a05:6a00:8d87:b0:81f:4346:6870 with SMTP id d2e1a72fcca58-823ab695dd1mr12685340b3a.28.1770055857462;
        Mon, 02 Feb 2026 10:10:57 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm17476780b3a.40.2026.02.02.10.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:10:57 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
Subject: [PATCH v4 11/13] i2c: qcom-geni: Use resources helper APIs in runtime PM functions
Date: Mon,  2 Feb 2026 23:39:20 +0530
Message-Id: <20260202180922.1692428-12-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=6980e8b2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3PeDo36KSfG0vlEF63sA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0MiBTYWx0ZWRfXzT8lm/1bbLPI
 sbWiSI4HHOuMDbG7kSNp6DUUFF6y7rvn7Fhv4MNW6Z6lVCTpcx1nFx5q+jItuEdYoL215jO7wsx
 gIy5CLFJPFfCFKddrx+LfL3hOhTBHyPxDmUWStEgQqb9oKHQowrnta9RxOCUtoBYr3X3fc3TPoH
 yhZmk+W/Cmiqp53vOK7tCEqDloQWXjabYTOJE1HiJVXgTIfqwIY5c4UNkm9eHLKRrmon6JcLHPz
 aPG4TbIrxOVXtzuCLIPjna5w361CpQ8Dz7JAGLDOddTsGqNoJsEUSpG3JPWF0F5Qf2I8LOsfMII
 RBjMX3m3ZDEMFu/OtflqqgCAtLXC8UzqPOS0fNvwtJctAqMMc0CH89WvDQ5bHbMxqbFxlTDJbh5
 lBQDO3UQG7HML3hzNZwkyhQOLd63SKa/2IHWyHVpuIYMgJSv4opuEvHBY1jvd8uKIZ36ncHP170
 3u+Vj9LuoZhwER5gVZA==
X-Proofpoint-GUID: x_5rWuMjCLEi_e2FPdbhD3JCv0es9b_S
X-Proofpoint-ORIG-GUID: x_5rWuMjCLEi_e2FPdbhD3JCv0es9b_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91547-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78AA7CFF96
X-Rspamd-Action: no action

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

The new geni_se_resources_activate() and geni_se_resources_deactivate()
helper APIs addresses this issue by providing a streamlined method to
enable or disable all resources based, thereby eliminating redundancy
across drivers.

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v3->v4:
- Added Acked-by tag.

v1->v2:
Bjorn:
- Remove geni_se_resources_state() API.
- Used geni_se_resources_activate() and geni_se_resources_deactivate()
  to enable/disable resources.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 56eebefda75f..4ff84bb0fff5 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1163,18 +1163,15 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
-	ret = geni_se_resources_off(&gi2c->se);
+
+	ret = geni_se_resources_deactivate(&gi2c->se);
 	if (ret) {
 		enable_irq(gi2c->irq);
 		return ret;
-
-	} else {
-		gi2c->suspended = 1;
 	}
 
-	clk_disable_unprepare(gi2c->core_clk);
-
-	return geni_icc_disable(&gi2c->se);
+	gi2c->suspended = 1;
+	return ret;
 }
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
@@ -1182,28 +1179,13 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	int ret;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_icc_enable(&gi2c->se);
+	ret = geni_se_resources_activate(&gi2c->se);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->core_clk);
-	if (ret)
-		goto out_icc_disable;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret)
-		goto out_clk_disable;
-
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
 
-	return 0;
-
-out_clk_disable:
-	clk_disable_unprepare(gi2c->core_clk);
-out_icc_disable:
-	geni_icc_disable(&gi2c->se);
-
 	return ret;
 }
 
-- 
2.34.1


