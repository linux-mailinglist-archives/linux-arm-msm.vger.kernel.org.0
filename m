Return-Path: <linux-arm-msm+bounces-106585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPMuIeWO/WnWfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 09:21:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B34F2ED3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 09:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0581302C5DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 07:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1EB37CD3A;
	Fri,  8 May 2026 07:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxB9+MJl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YOasgvkg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76DC3783A8
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224835; cv=none; b=QDxwkAC756BofxlUNH7sO8MODigSU8xYi5+t4YyxMS2aMT0VrCT47DgNFL6GhFmdqUyNJuAywGxmJapZG0CkEksfDRbhOR9379WlJkRhqQFVv5LjALeLQFJqC4GaN3n9PJyosXKdlGaw4+uUhGTeOrlfBd93Br9nqHi4rQQ5UPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224835; c=relaxed/simple;
	bh=vcmzycQO+v5rtn0fILDKSKDqMmq9F3JiK93nKYTWSPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5YXboZ/AZyjiMnWhtYB2p87x+/CJy/x/1t/ubAFm11B9wrFKmqs5rFUAXc1f5X5Uoa8hkDKBqDKqDgS2RDWYj+fPKpHTo91uzRVIc4U4ilbjvTkmGZVNnTBbLVlT0aegg6GOwI/Ps8e9T841FSaFuKIoCK8t2Kpkhn1ERHGeco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxB9+MJl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YOasgvkg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64861QRJ4069603
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 07:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=; b=QxB9+MJljPVnawdG
	M/+h4hAmLTG4cOd9pwv4H+jiRNAQsDgZpMctJ/KAp3wcFmpPZp6QZTCfWBP3KM1C
	2E6Fkz6Uiyc+lVz7veLs9lYp/kDnC6XEIBvK55eCulVfSGG5oY+aEgTVsqyhBv7e
	Gx7spt8ehYmWnP/rpRiJSLP3nstDTCn2wqGYyvCBN+9eO7uCbdFG8xO4OEstb60X
	54QV2d7ThLR3tv9S335XoTYcyqLgmtp91C3yo15CyZ7ykpRejbQf2sAdvSxdA0aa
	yd9CQcYlCH9Q5Lnil95GmQ5oL4caF1MrF5u/fAaeW1sErwWUqLfSfKyH7n0X100b
	hgCL0g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp1ryq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 07:20:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-835417ba8c8so969298b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 00:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224830; x=1778829630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=;
        b=YOasgvkg16y2VI0K9uZW7EAtZIgL3r7S68xHP2QPLMLVBCIk6fuoymSgChXc3q4VZB
         N+k4jYGVFPgjOk2h7ABSseB1jZsc3QzN8fK8sLEc+VS/gJuFaK1iixdzYSvjP/tgHXYt
         HKt/aTHo51pGdJ7T/yXjGmt8ukm3QQcRuIDlM4FjeQSHb65uXJBZfPVlaXC09jCF1Hcg
         c1tsLQ+Uu2bMFkaavZDXZIWd5x2n9yCzO4zo2Ryam6U52Zs/AKdahzX55lziyVgSd/12
         YWXU/YzO/jDl22N0jxpHyJpG2fW+9am/DDxvrd69VLRfluiyCdiwLRn4CSoTUv4FSMIQ
         xdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224831; x=1778829631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=;
        b=LqPObQnVC+ZYgyCT1K4cmueePp6JhYxkqJqn+F9DKt8CglF80Dg/Rx2uxuaPVRjQQS
         joKNmt40+aXS/+AdZVyMiDat/QeGTpXooMX0YkKx4GeG5bl3Z6NnvI7PjPc0lLkcOcnF
         dQS36c14LpuVpgparQ84lAsn05TU8WKrNZxUTOESOUwyh9vTZMYYyUgwrMsnFWJbVyA9
         vnehesxa/aWSIggrUx1Dah34oEqGx/1TAqwYlEed13l2mmYQQf/yN2cG5Jlxq6CNseNx
         9R7H7vPEt3PfjnaSfwhVkOdU+Fi8e7laySOJxYqgk+clrD5njjd4teJQ1zaVjYQFwPJO
         D+sg==
X-Gm-Message-State: AOJu0YyopP+RGMpYNHuDR1UTp5HQPFVwaIXUV+GkQlPv6ju0KzPFSXtj
	3ijj6IcJX1AD1vtSyP8HMD1ok1hhrOGiDL9PVEEoNJCsa8BabfdOMDPU6dwzoHyyRWWEzOl1qg/
	8hOE/kVXel2OWK59cFLvtRXLi2p0EFTIHCxNBhzuIGbSRE0cCRATd7RQZ/uGxlUQTXXrb
X-Gm-Gg: AeBDievHkV5cptpXJgFmlxJfNupAnSc11C2j038BjspLQMpFhvPbmedTtUQa4tUI6GZ
	lXjV0spZRk37qYH9xviW6OLnTngZ2NuhUhJiS1nTsvXaRA/ZS5U3aGyawBf1v1sYufcgqqx16MI
	PISeof5YYjbxcHO1g3UvjMyCN9m8X/FCy4erwPvzGlzMXoMJDZwBLScOJJhpCVRSUqCvVN0/FDh
	THAupLl0EPt0yAqBM3qD6gFPoiBSW9AJffbh9FJDi1iLD6Hp8P2QJ3x8rgIwa9X8/b2Iajt0kW2
	bvJeZUjWvOSuWoNxWm0tbUF/xtls05gLFqi6We+KKHctMXEBOPCHm5E4hkdYcxj5crtRnpzMrIq
	7KF8K3lwh4+sa2UFu1QvWhAiZ/LM1QmvLgmeC0aB160AV1CiQ5FQ=
X-Received: by 2002:aa7:88d6:0:b0:835:3f51:730e with SMTP id d2e1a72fcca58-83a5b8d9aa3mr10154901b3a.13.1778224830507;
        Fri, 08 May 2026 00:20:30 -0700 (PDT)
X-Received: by 2002:aa7:88d6:0:b0:835:3f51:730e with SMTP id d2e1a72fcca58-83a5b8d9aa3mr10154858b3a.13.1778224830011;
        Fri, 08 May 2026 00:20:30 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm14566685b3a.17.2026.05.08.00.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:20:29 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 12:49:48 +0530
Subject: [PATCH v2 2/4] dt-bindings: remoteproc: Add Shikra RPM processor
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v2-2-ab76fd9e71de@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778224815; l=962;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=8hvVNB5nM53jnXbcU14D0R9X7GK1i2upQQ1liBM2/Vw=;
 b=SY7al+FzmbPqgtxIw2UZvFg+y6TYh8haznJV5nPQYrC/lu9u+AiqG1GcsIUfdIc344Ccg/C6Z
 pk0q7bV+pkACvQuykoOcx0Oc7FOR7nb3du/r/S0/p20QmB/EPOVCefb
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MiBTYWx0ZWRfX3e8l+5ZOXruF
 87DyRJA7QaGi+9WeDyHlxJNLf15LrTeN4ExAf4DA+QMYykLKVV5HiYOawuQhgTpOdTSm4ylsm2C
 BgLosq684UsGSQ3G/OJ9cBmjL3JpD0NQnJ9ENqgdl3mtRfQwMbjpinAFsX8aawZEW7yToPLOKDg
 Ght4UaTgq97qwbQ5JmgoAQsGkGvupjrMdC5JFVnL9uJ6Jwylh3NDE1ljBk6FTfud09l9tUldDTu
 M2ckyzqm88MChKV7ZT7Igr5MYWlgpYqNyeq8otYZqaAI2KtHJ4t+OAr/qfVD2kn5TyKJI/GMimM
 ABD1sOP6obK5x7dSX2AVkct4v87nzssA5FF80sQwAAqZvrVq4mb8etsTS8jVhRGYjSMyg3Xeh6g
 Vsls+22rWLRcdHlyM1SJlSS8YcbVm3V2E4A2rccKi0otqkAcZcjAwt6ftwiFPbXNanl5AHszzWK
 24L0Zchx5b8wYkv7z6w==
X-Proofpoint-ORIG-GUID: cy7Ic7xw9e2-IVQcDQCuy2kOGLPrH3IA
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fd8ebf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zr5sphF6OBxrw6KR-80A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: cy7Ic7xw9e2-IVQcDQCuy2kOGLPrH3IA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080072
X-Rspamd-Queue-Id: B74B34F2ED3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106585-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra RPM processor.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
index 540bdfca53d97d9c18fefeb50fa68fe704b2008c..823304afaa98f8acd67667c6aa3e36ed743ef554 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
@@ -87,6 +87,7 @@ properties:
           - qcom,qcm2290-rpm-proc
           - qcom,qcs404-rpm-proc
           - qcom,sdm660-rpm-proc
+          - qcom,shikra-rpm-proc
           - qcom,sm6115-rpm-proc
           - qcom,sm6125-rpm-proc
           - qcom,sm6375-rpm-proc

-- 
2.34.1


