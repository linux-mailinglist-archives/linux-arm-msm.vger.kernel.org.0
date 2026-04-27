Return-Path: <linux-arm-msm+bounces-104735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNT7IYlg72mHAwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:11:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 065FC473320
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2257430053CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A763C063E;
	Mon, 27 Apr 2026 13:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jvHzDYIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IyXveINj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137A33AA504
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295321; cv=none; b=beJJ4mMj89lL3P7Hr5QNZXgAm50KuFBmrSybHGIiKVWl92lL180fEAMU4NM8AQy7qdql/ar9+jXqm1ZbvUmuGrOuWa+7iURGiV8Yrhs63t4TfS3/dewB36nLGiQW40ctkUWZeWaPmmwqN3wCkMW/EF2c3xPH/VgLpxAvYjlIo0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295321; c=relaxed/simple;
	bh=bYEDqLi6qPW0dgbf/Y1FdsU8MdRIBIf36XdPshrzaJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iUWWD6RMHRMwnmto1zRHsUqjZCXW1lJSuFVQR851x/3k6YYUBrmN1amaanOOmXl0s17NxICV16VizHQ4cwdzDJtF0IamOsxTfAWdT9pi7SCnEYRORxOZ72aVzD7goYmzzkyBOh4flG0OTbVWdOzAHTQp98ZrDeHDRg+WRNYz0YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jvHzDYIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyXveINj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3vLe3123830
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H+Y5uAXV+tqyuH7W5XQAkDrFusw1OZRnWhK
	VyC8rdg4=; b=jvHzDYILERWjaQYbQJBs9K+DrPZIIKCT4KJjcZ0Zqy8h31AlvTm
	+BC62eAjwjY58qS0HCUAiHZFxWMWEAWnmA1IRExYvfXXvLVR+Hg9+xavNgxPqgqb
	oye5+kTbLm5P//CVBu/Rre2l8dbx6IzYfpvMv5CInURbyzL7UTq2v7DhMfSsxvVU
	0CNIckCullBflV8ngIhGZa9LubXBi9ieH1jY7/lg0bYSGI7sSNgXNPxpaR6rhA4X
	hHaTxtoA5NQj+5xfb8f+jhTFXb4hnJOkw4zh+5dyEZNdCKguw+6tWcDfdLIHsw4y
	bwzPlIHxpJyK11YjBpwDAh7fvFjGfNiNPqg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qggn28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:08:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c8de02a4dso20681492c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777295319; x=1777900119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H+Y5uAXV+tqyuH7W5XQAkDrFusw1OZRnWhKVyC8rdg4=;
        b=IyXveINjigLZlgFOMSu/tkWRT7nuD5khNlpDujbn7ithJfZU3KfvXQCJ9fmszbPTB7
         a7j35wKg56OMyYHbhVJYAs61t73eG6kvbQn0/9EIbaXrQsgX2zieWyM7kgAyqqOp9RhC
         EPcadfOcYYyiQIZgqvjMztMPiuGchWUMl8vvuTtJSBFIWg1HeXu4Fwe5zLx1HL8sdFsz
         8Kyi/DFVD3Xz5Lb2ZMXHkkJFcoaoVjiYFTkWfmXd8UYx8tZ0IJWFLGpwiwIaxX3ocPFu
         RDYjxR+zrXcxA2MHIbC2ztvmhWNKTpIeBahdppZzl5ofqH3s/wE+MmpsWQILpgccALp5
         TUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295319; x=1777900119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+Y5uAXV+tqyuH7W5XQAkDrFusw1OZRnWhKVyC8rdg4=;
        b=TsErLkHqU7kLRT/VwaGxuZz7rFXI78K96QRVl57crGC+X88r+BVrdtQtkoieSsRsNj
         IK4mxtbC3OZuVep23nXFC+KK/AQ34QMJ+Uo4FoDXyYb93O/9IpODMRX1Sn0BngofVda5
         CKKBq/+D0I/dk9cNB2N7UvMr6du8vz8JucdCzcSgzoNxIsTZtYckIV0b8mLYjm6MFJ8v
         Jv6bcAQtEQiZL/YgIhwLBzvbOW1BfzwefNDAQq6CqJPj2G2fiwIUKudLDXLeAardqpwG
         DREfmX3XmOKKjNZh3AJrVyCzLYryNuw6vERuyMrYYWsbMfH/CwnJKHM53BEaWRGFm+w/
         4LrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PEYS+0OnZsnc01kCtlQS2K11A1QIoDjipPa0wET8GOdgsQGLSRws4JTZMdXrkgJPtk2yo2M4SCvu7ecmL@vger.kernel.org
X-Gm-Message-State: AOJu0YwBYKG9Pc10VjEq5IntK9vI7SbcZI93UbQEhhcGwlKR/NVsxtN6
	DsELmkqlAcTp75zeYdhVyNPnv6DUnYjQkxbFH+imugYiUbu699NHc6JhDYS/LPLkZmGnjzRIikJ
	AQ29DHBm+DR+2VWwAvG405giFpKMw7ogNaQSFIebcicXHuw25yB3MGccmD8QAyEoqKPad
X-Gm-Gg: AeBDievb7E4pzg4NxJOFuKbsttO/13sKH8ImkZkAqosq0J7IcNjMFXuTRjhw1xjfA7f
	stMJhaIi+Qwph2crkRoKKWMZz6pOKmmnGlBLO2bHoCkzDOoqkGY8nXhlCuevlJ+YqIfSINf9GKJ
	Jl4R3gjVlIoZdmIL44u5zk/et4cRDmrPPArq8oBwmQ4aeanPFBxFwQwFnUsLXKVnL0iccLLHkCQ
	fqaEkeTdb66yGCUcwssVD0GTnGwVr7Oor3+IZGGvR3TwVvVLUwDe2ct/uCnyqh05jKLVTiG/TRv
	qG8bb6U3EOYg5Qk6KTSlDO/7asEXoUdDvijngYEigDLkzND5C+2D8hi3mVNjjpnoo2Z+2BgTDeT
	hSQB+LXp4OQXzCIDFFKQG6hLlVH8HK4/72FgpT0QmbMpmv7iLKx5BZULxeGdlokYNLXrv00VBVg
	DFEShuHJixndpZzBXn
X-Received: by 2002:a05:693c:2c10:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2e479418ac1mr24440314eec.29.1777295318480;
        Mon, 27 Apr 2026 06:08:38 -0700 (PDT)
X-Received: by 2002:a05:693c:2c10:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2e479418ac1mr24440283eec.29.1777295317797;
        Mon, 27 Apr 2026 06:08:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e79c2954f6sm49584851eec.30.2026.04.27.06.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 06:08:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 RESEND] dt-bindings: firmware: qcom,scm: Document SCM for Nord SoC
Date: Mon, 27 Apr 2026 21:08:00 +0800
Message-ID: <20260427130800.271146-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzOSBTYWx0ZWRfXz0HWmw7yHMPK
 moW8Grg7qgOEDnq3BOP2vFmVmV62vaoY851SuPYLPpF1G6jcSw9ly3DTao7gl5wH0WkYSX/ViQx
 rSpi0376JAD0WjzKZDJa5YPupV3i0OEqo0YEitTsRJKX0COrcFZAcqLGXIeTthfkgOab9ghRFz5
 6vyaD32mn++HodzIK/e2zr78pHxa4BvBhkXeIFfp7fPh+OZzGnk21JGAsIstRAWMgvE3N5LxMuK
 45+yOcmEiHDFed/YYgh6+FVNlArvqvD2Ym1/aPoKQadXMzWwkZGqCub0ml3FHUnr3m0nO47Qjdv
 Xooh3fXIDASfI+0iV0Q7MJ+XPD7ZfHTIGYr1Nw5EaFPBefR2d2//chOH2E8EIPtBiVCJvltChbo
 MCufbPR3e40MDMLjS2c1q142YqlBJLKXrKNx1dFFnpgbn3bNQv4xHLlYHxhFciyTrcxokol5+TJ
 l0zTrC9TocOkvkH3tmg==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef5fd7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FSRre-L6ib6GMKEivIYA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: wUkFLT3BykJO6HdKX9HlAyV1tNTb82UO
X-Proofpoint-ORIG-GUID: wUkFLT3BykJO6HdKX9HlAyV1tNTb82UO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270139
X-Rspamd-Queue-Id: 065FC473320
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-104735-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document SCM on Qualcomm Nord SoC which is compatible with 'qcom,scm'.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Resend to add missing lists (Thanks Rob!)

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420023243.1239927-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 7918d31f58b4..c9590ecbcd2d 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -49,6 +49,7 @@ properties:
           - qcom,scm-msm8994
           - qcom,scm-msm8996
           - qcom,scm-msm8998
+          - qcom,scm-nord
           - qcom,scm-qcm2290
           - qcom,scm-qcs615
           - qcom,scm-qcs8300
-- 
2.43.0


