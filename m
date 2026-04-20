Return-Path: <linux-arm-msm+bounces-103642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJ9VNkWP5WlNlgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:28:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CF4426446
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 336E7304047E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 02:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32063093C1;
	Mon, 20 Apr 2026 02:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFxKoKhB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BweEBhbZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E8A316189
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776651909; cv=none; b=WcTvZhdrlvLigcDCPYjKJYBGcAmmtKdIFdBBurTY17ULdWQ3xdQR2oOPA9/wvfUoEdouV5kMAsl6JmvLyOo+g53wo+uIDLHplwPa8cAAAf5BIhcRtGTVJ/uROTwuCVQklL3sPRzG1x+FFzb6y3JkC0GuaoDFfy63w3whzxajALM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776651909; c=relaxed/simple;
	bh=gjdrsWZchMvVDRdOArHg+2j1W7me7uY5LfhLda/2y8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YOwBk9ipLtl+gaw0rGx05GBbMGCemSBGQ4txD5+YW86NLfX4bqNXRDv6cTGczkxhCu+0FYW9LJuaYA9Wjdkldr6JVzoOqFZzGhNQYFkTFYiVosVk8enkcj9xwM9k7ykRoK4ysvrpfqMqxoLyS+Oas6/2bqswn9nEbYVgCh5Vc5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFxKoKhB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BweEBhbZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JNkkgU2270146
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Pk9I2oqoNuOYaz6Q3ecto857QAUheGCoqJl
	UFcsvksw=; b=VFxKoKhB+bJltLipwO1q743jAwB9WAurlXDNYBBYKCtsQbNGot+
	RDlPAtecUgUdqL+1zc0cqOb+wzooAJ0KGdMEzLf3qRFdbr9xvIhcSFxZ2qIZYVMt
	frAaIibleI3HePvQCCbujz/Bmxc5ZGm99Wyes9wNccZ/RvnpWmvzUit89FuWIh/G
	f7wNXlaN4sYHIXjtiipQqaUq/iX54ScBSiD3CJQkR9wCwNb/gYS81Fz4r8JxZ8M/
	uEAW3PSsBeVbwnzGLmBEAD4xMepZ/wLjn6XVqFb6oHTZ7we2nPd4CWOT2oVrnTH3
	8qRARWwhBpmMiiQ670AlzhhOEtbmpkahEUQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm19fuqr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:25:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so2644777eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 19:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776651907; x=1777256707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pk9I2oqoNuOYaz6Q3ecto857QAUheGCoqJlUFcsvksw=;
        b=BweEBhbZJ5ioW6ZiRoky90MKXtZ87bEnQyg8ilN09LxuHgQMUiK3TFi4n1xK7eVsCo
         qLxAAvmrFEJ1z5kHcLKrFRmXuNp4XdK67yXd3oR5XCjtfvCjMSqzjjordTTiWClk6r2d
         waNx8t+eQNUUWFPSV4qhGA/SK9sF9YgvSPU0cUGYpZgr/GI7C7iYBHL7ZOy7MuFgX9FM
         hrBMLlmCzp/82ZkEmIF34ms419mpG1BH8y3n70ilGDiK09mJpZ3XVuLYEzheKVFDz59/
         0i9nrlzLzAqpJ9n2WdtAd6tuweOT/aOZsTp5nqDylxxLWm3iF4AXgBtoZoPm80wZD6vE
         /l3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776651907; x=1777256707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pk9I2oqoNuOYaz6Q3ecto857QAUheGCoqJlUFcsvksw=;
        b=M4HHD+HBq88QvmYPYgDs8jp48iZTGQd46QiLY5ZY3TQNg6fN0sViczIXK1Z9dPpSwW
         43pxKQt1wvk/7CglOnb6pkW6DIyaD93q7AGxZob5PS2d0wglr4drfDeWMTOWLitkowXX
         Tv4PCF1GnIDVw65SO6BTHODrS8L9/iDhtD0E4gUZqDOXKUhYfP/iHR0b5hs01ExBvnnC
         Kh4NgZZ3vhwFoeQ4d/6sD2+u7262rye0OP2wZ/nBRwH6WDKFCwCftB+RRpgBVmp3NTN0
         4iKUJjvvWnL4+UB/SWWkyYnBcJ7z3jpGbqOGFS3042cJCXZgp+OuZLRBsYPObI32U1AG
         fGbA==
X-Forwarded-Encrypted: i=1; AFNElJ8QA0jUEAMLZQTC3/jT50fivX7zpDr75mPjvYM5LeVyPayGqxmh/4pRMgSOAsH18slGIiMePPz4JADBTxAS@vger.kernel.org
X-Gm-Message-State: AOJu0YzzjVPEa7DM+1fM3p2PTeabFcWgYtS9PSbetHFZ2HU5hzsKZvUo
	5nHXSeVmEad4UpHl+SWiXCsCrQqZfhspMmP+vTJlS3rqBahylJ1YQ7b3wPVuhgpZEyW72gH4kzA
	Aeb4w5b8gzMjh3Q3YEKTsSGWPUv4LzEsp80C3oyox10WPuLnZ7JOI3dCyULrhRknvURrR
X-Gm-Gg: AeBDiesMQGafpxSlEBia4aM7L193E1AC6kw6QeCLtkDu6FJW/JYy3JjrjXkEwkLRUek
	vqir+StCwXcKVm/T0A7P0AmRaANb2VmDum8QsLBM9xuNN0sCfPU3gXUuEWKGZ1AS91zODRe3Cwo
	Gvp4qpVqKc2ke00PYb9bYkGVnIYCROiX7uYinn4pMZdPGUDA85c6ifQCsMeU5KmJSzzu86fT6qB
	ia9ogPRZQWm2TGGcXDRt8iOAhAqYWk8mFWeOwc4ggywlNWjB9YpNk35eRT6Y2ul84gkyi1/+8ic
	QjDrMDa5SbLwP11vohsFFWES3tslmp9vN2fUym05rKM+hyfTjoiuH8bczrj9tqLZY8cRLYVr2JW
	mAkmCC+lUf+CIz6QmEIq8dIVkGzQTK8CsTZzcnlO7cf4uXsbSIpCu6BCz+Qb4EDBd7n7mjbTHmq
	qGilA5P8PCw31Op6FZ
X-Received: by 2002:a05:7300:6c28:b0:2da:9a3c:8062 with SMTP id 5a478bee46e88-2e479c042cbmr6708439eec.17.1776651906268;
        Sun, 19 Apr 2026 19:25:06 -0700 (PDT)
X-Received: by 2002:a05:7300:6c28:b0:2da:9a3c:8062 with SMTP id 5a478bee46e88-2e479c042cbmr6708424eec.17.1776651905709;
        Sun, 19 Apr 2026 19:25:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cff04sm11850392eec.23.2026.04.19.19.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:25:05 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm-smmu: Add compatible for Qualcomm Nord SoC
Date: Mon, 20 Apr 2026 10:24:52 +0800
Message-ID: <20260420022452.1239665-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyMSBTYWx0ZWRfX3ABZ+N20TcO2
 BdRQ4ZYWZV/McK/9DeWTI9QMjtEMZ0JFFf64w0yu8qrUExeF6LhMrXfQXA5ca0P2InkjBhiKDI3
 H29EYs3CDOXhp06bya5B7IHcvy84Bls08yG0bxVv6xY5aML4gY6pNiYVtFkYvR62hHJxaPplA/j
 RJSm6nj6M09JWoM4dXhLMaH1FhiBLCMr7r662D3yee5fI9Ami9k8PtJTkYsTiyDNAlpbbJYQiwO
 wlOvHZxDNm6uqrvCSrNN96x7760GyJy7H2joIF9RGiX3rWkpQTy3eQhzYHmUlSodBLiLXsDtzM+
 ixJU4sbXkQb8FM3lk7ohgo+kV2QP/UwqfzWHPoZ3OItYPAWQBAJkTmHiZtdlnicdtbC0/BU6o4F
 OKw/fXwI18S1Y3aKqAiE0PDlw+u6WgOwJfiZc4uI2tsk/mvZ6lVvHNUo36KaqWJyZqqH64O2led
 /y4JoNaGDCQ1yXt2TLw==
X-Proofpoint-ORIG-GUID: RTy-sEehgiAx0KWelvnM_vn6IZaAti7I
X-Proofpoint-GUID: RTy-sEehgiAx0KWelvnM_vn6IZaAti7I
X-Authority-Analysis: v=2.4 cv=FMorAeos c=1 sm=1 tr=0 ts=69e58e83 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=z_hECjq365cVgtSHfckA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200021
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103642-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46CF4426446
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document compatible for Qualcomm Nord SoC APPS SMMU, which has
a fallback on existing compatibles.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..bf29e453058f 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,glymur-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
-- 
2.43.0


