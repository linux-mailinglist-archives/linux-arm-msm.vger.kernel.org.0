Return-Path: <linux-arm-msm+bounces-111313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T3pwNBtkImpAWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 07:52:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 610EF6454D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 07:52:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CjPODipC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="F4e/dk72";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111313-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111313-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2094303526F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 05:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB06C3FE35D;
	Fri,  5 Jun 2026 05:45:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54F63B5835
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 05:45:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780638353; cv=none; b=ReO80DZ2S704Cgk6esgpCvInCjqerc/Vt5ObizHv/b60OVe7s+jBHe8Gg1dD40efcqPE6/NeReJS02KK154OTU15/M+OmqI4vEySXjmT7JWI4HO5GWUdqExIcUu81s1MRoM0aAea/xnUYhHlexF8cFyjqgxCofBvE4H89qJtzHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780638353; c=relaxed/simple;
	bh=BB+2jPfBx1KDkhydI/MKpjYWWTkT2tUBU1PE2LP8JSk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KCBeQy03jlLNd49/qrp1sFpf7nE/cvPj5JYSGEUzsJDcNbRKsUCeYPcd7QC6N3MTVPRZUs4nYMFZ5aQAHBUYyauY+Y8kyMVzK7hdznYrhW7VAi0Oaos7/4ZEpokyKXhwepQt5IwoTF+Snx1lnhYTlDubm0vhseUROXu0qkZXZxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjPODipC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4e/dk72; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65525f4W821063
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 05:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qkIDce6Btxrn/DSs3XT6dg
	RPzxX4+nB324jhTyEDu84=; b=CjPODipCGeTdju868n5xfMlJ0ueLra0kIKVvTJ
	hc8xU/zrAN8J7eSnhyx3/M+qlM61EEpA513C7Rc2ZQZf7W/L5FVS60WDozhVuf26
	+7x5ITtC19k2yhMghOooUhLk+bZAX/sbPc9ycWnq9mguhUTFYwSoQSJml7Q5wEKT
	g/e3xPkndaxMOpVKDi3fDobulMa3tyGC7ch7sptH4/foRXQG8MPPPRvc0FL1HndV
	77mlvxRoE4ZHXzK0hNBFZlghX3H0FSC6dtcMYyBlhslst6YdW5ci4s1knddV67zO
	j61pOpUSElqfumTvXQMnkqsFPv8Rh6xLqq7y6iXakWS8j0+Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekncbgnjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 05:45:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304ea1eea05so1959306eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 22:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780638350; x=1781243150; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qkIDce6Btxrn/DSs3XT6dgRPzxX4+nB324jhTyEDu84=;
        b=F4e/dk721KfcfQvcFvkhOmcjwGBoaNfq3BoeASYnGrTZD2OuC0GD8fd3lunDvMUngN
         e9/8tQHLy1rj/FY3baayw5Q4K3atSwfZHAlngpkIWXXgG83j/GNpE8npXZgYL8HW6d7L
         HGBNd37eagMZUDzn1SowwB81m/ZRWMZ1H+dcFY6yCCsYmHYHFpwzHbk5z5h8hx1LjCSB
         dK0NKwg0TG2c1xnlqJQVsj87ibjBm7K1ALAT5kUp3x3+lLWw9bGuhTJot5N+RFvNgxg4
         aIdqF2tVYJsF3QLPfGlVFW1KAUHavvkZZdg+GV8WQEKdPtpbs0OO0fYNl3ONvozIhYEB
         T64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780638350; x=1781243150;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkIDce6Btxrn/DSs3XT6dgRPzxX4+nB324jhTyEDu84=;
        b=GVb/79mlUU7ClHbufUtug9dEcq7e6cfkY7hkDFYzq8Q0Ufsr9St17rlyOaPBpeqzqx
         9UPVqg23QzOecsBWhUaufb9lfpMd570Hpxgdx1aLAWOqFEbIrF066nz8TeFO9/OKIBYS
         UPL/DSgXG8Q1B6S66ogS9eZWW6OCUuSirAc8nlwp20n48urIQuNHMd1mYAzArGWVYN1D
         wwEYXByCjrM7EFSz9++rReFOwguNnGp9hukAMfdWTs8rInE8qG/rwBhxY+EbA371797r
         hrUXHL/4dVMZ8D5pi3xoSrsWJULiIJPORzvKZPlXf1MOpVy1bgV5+aQsmwBFSdDqlwcH
         s8PQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oSFCjB5Oy9EK/qX09ZQ3w0xn6m7XlpVnRq1Arh8dfRDLiPs+ZMlAnmqF8ylIwoyFxVTs56j6Fpucl5d0B@vger.kernel.org
X-Gm-Message-State: AOJu0YwNDO+5k04U1LKmbgU7R5v+A7b1DZDJP/VMhMctOkA3fbF4uF75
	Bu/Up/gSXC13XzEhefefbi9z3VMAQ8Jzc+Sq9SLJY2mBu7EYElwa1qgH+dMi0GkmGDfdkwIMVw4
	rRvlUGponBX/FQTGKGd+VRE22r9fus4dKmw6ht3xwOLvEsMz5/bSKJDH5FR+l6/2hK+isXFigdh
	e+JZ8EWQ==
X-Gm-Gg: Acq92OGDB/GImYoC1MDaZuOQkGXfVVDcKnXCsZQU7LClfbU3vxmtADj0zDpKmUHjr3v
	1QKIE9cLiX8vcBseiqVZ4VxiecOqbL4ekpmvKwhI+XQbUrvABz9vTrbBZBhG9NaFUCUzNZr45oc
	SCU5Q8erOfP/hMncyUvDsQIZGrPg85WZ930A3TLqmzg0uTJYovmmisb8ieHkfCwQlXqQ16A62Hr
	QV+nmKTecjPPX5OClq0GSzoz6QAD7jwHDkPvSk4U/czVbwJ9Fnu8wOIkKD/Ef/UJpCU+vfHNqp+
	XoohAUGKCI7gQ/kEi2hBb+C09ArZXq74VdM8fQ8xxTKB9FtEodEF2CoboJMKP6y4PU4D3aeFWlq
	+HF3AF0I/mHqJeneJwerCs/bjDhqjP4rJUSJE7uJOuzjc6Er+5ebXpZsEgfgRtBAlnEER/3TjqM
	APjfzppww=
X-Received: by 2002:a05:7301:5f09:b0:304:819f:502b with SMTP id 5a478bee46e88-3077af4c61dmr972541eec.9.1780638350398;
        Thu, 04 Jun 2026 22:45:50 -0700 (PDT)
X-Received: by 2002:a05:7301:5f09:b0:304:819f:502b with SMTP id 5a478bee46e88-3077af4c61dmr972525eec.9.1780638349990;
        Thu, 04 Jun 2026 22:45:49 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm9480955eec.5.2026.06.04.22.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 22:45:49 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/3] dt-bindings: soc: qcom: Add Maili soc related
 bindings
Date: Thu, 04 Jun 2026 22:45:43 -0700
Message-Id: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIdiImoC/22NywqDMBBFf0Wy7oimNsWu+h/FRR4THdCkzbTSI
 v57o92WgYEL956zCMZEyOJSLCLhTEwx5CAPhbCDDj0CuZyFrKSqVNXApGkk4GjBUHAUelAKmzN
 K1yjTiry7J/T03pm3LmejGcEkHeywkTJFbrWB+BnTZzfP9Vb+SU7yn2SuoQLvfJvP10Yer5G5f
 Lz0aOM0lfmJbl3XL2RnPDvQAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780638348; l=1061;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=BB+2jPfBx1KDkhydI/MKpjYWWTkT2tUBU1PE2LP8JSk=;
 b=P5rKU3i53Mz4ke1QbICqzbrkvre6Pv6gGIRMwVdWekZ/+QKPiMUkkcDnizKBpYuBW52gXjqK4
 mzYRaAmKteZBhUvmHj6/YhHFt2o96EjyVEiNlGjTQsJ+smMPHRZtluK
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=OauoyBTY c=1 sm=1 tr=0 ts=6a22628f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g5Uc4DKV6OW3X7lTdicA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA1MiBTYWx0ZWRfX65XOD2CV2CYs
 LkQyMTJd+lVtKnv8au9nJi6e/Qndwh991A2Nh1CnbFwTt6PQqU3LMidBMp13r2jZJ/Nu5B8p22O
 kwHJIWDIczzVfogJyXGYAq2ng3O2QO0Li1qQl4JTTQw8Cq9umzpfrmMNq5q12caQXQzurovdsTf
 ED7K0Dr5ADddtW/Bu5oeLG71uqxZshLZTDlvp8KKkvWYf+viC3jJ/50lY5c2e3hR2z37MUZhH1T
 j2jz5lvyw6MmLMIwRwDj5evK71vf74NqGTRMlq7hVDvr2rt6xDsDXOgeKq81GIK1FW2fQQdlYYP
 JU1Y0/FiCrDUz5/GVGPW9Aar/M1M1w/dH5PBwU120yHqNLqVA0KLaY4jvDmtUo5OmlC0lr808mI
 ik0lpsPwTAB+P6DyBRf05BLJOFNiicsIoDUbnWq12lo9ramFG9ycbK2XQ9WyNGuBMFULqm9NzJk
 tUSsscAkVfs2VY7/Oew==
X-Proofpoint-GUID: RjkV-uEg087sQdEHKB3J0dUKbtm45bnC
X-Proofpoint-ORIG-GUID: RjkV-uEg087sQdEHKB3J0dUKbtm45bnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111313-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:chunkai.deng@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 610EF6454D7

Add soc related bindings for Qualcomm Maili Platform including aoss_qmp,
imem and SCM. Maili is the new mobile SoC, and its DTS will be upstreamed
later.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- Add missing SOB
- cover letter update
- Link to v1: https://lore.kernel.org/r/20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com

---
Chunkai Deng (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the Maili AOSS side channel

Jingyi Wang (2):
      dt-bindings: firmware: qcom,scm: Document SCM on Maili SOC
      dt-bindings: sram: Document qcom,maili-imem compatible

 Documentation/devicetree/bindings/firmware/qcom,scm.yaml      | 2 ++
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 Documentation/devicetree/bindings/sram/sram.yaml              | 1 +
 3 files changed, 4 insertions(+)
---
base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
change-id: 20260604-maili-soc-binding-66e47e2d46b9

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


