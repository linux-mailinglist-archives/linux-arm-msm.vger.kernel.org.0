Return-Path: <linux-arm-msm+bounces-105549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIKbFdns9GkaFwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 20:11:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E47544AEBE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 20:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 433CB3004914
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 18:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED773FE64C;
	Fri,  1 May 2026 18:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXK5T2y1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTKPuzVL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54083D34AB
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777659094; cv=none; b=HBRCRFt5/E9FWH5V6DlCdX9d47mMXWmJmwRyeUfCL+w18i0vfI+J+shZ4uv9G5YxD0UnUFkNv0UEJlPGIZu9bwBfXZ9pdOkAmoNIggEMYE1VVGPoY/byDPet/hf/MKNwQfw41nPahBib+jpiwB5rFI9A0AfolujhFTjanUMfPsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777659094; c=relaxed/simple;
	bh=o5HwJQ+v+rkM1SV24Mfx3kK/RwDPwTE0Z6SE2STHhWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=frfSrOwoWAF5/A+bBISbon75ZUgKOl/0xSIdzYMdlpUu6z2phDZQ3yAz8nffOuxQ4p+ZvNwp0XOWsHDD4eEeX+2Gw8Hf8t45rhul/y8xcwKHWP7fvJcxMN6KBRmk7ZZujNXkdbfKf3tYT+tHWNgJmaNmfwxQ+V6Tz6gSS4Ns9n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXK5T2y1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTKPuzVL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLQOU1345317
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 18:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h3O18HsDM0HeDtBSVlIrq9
	w2rDZKIMC53Nv7pta0xBA=; b=pXK5T2y1phDOH2JNjRzCsgGcwOvk0DMfKMk897
	2/hC16G1pfI14gnlgwG1g6iif0unqTVCpHgqlNAznNshafdH25BfcpN+CMlPlk9K
	pPrJfwAZAbmTr4yTVBkUFW4HMj7AVh3rUngpPvGtUm7B348zxByIMPAoemoGxiwf
	jETngaEoQ0I/Ht0Udn5Tyu/1uCdcVuZUnyAEELnJOWCPSsw+CDtqBObDbt9QIijO
	k5BwHRSU9BXJp/aQWLsXkK+t/M3m19Euw4y7Gj17ViVRhuHKTmrFPsAZIi7+I1s0
	apTwgI/+Ik1PTaIxdmUodsUBoSaLd04mptrvyVKqKSONWHyA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvwd5rux4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 18:11:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fbceb0181so1620773b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777659084; x=1778263884; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h3O18HsDM0HeDtBSVlIrq9w2rDZKIMC53Nv7pta0xBA=;
        b=ZTKPuzVLJf13wkBP7VBBD+UQS1R0w14c4jUEiSazBNlDEaoiS1U76HtsZHTxEfOrtv
         czB4Sq9bhLxBfQDIUT3QIkm21ltg6St10QIrQ0tgyKwjxtNGu2QRrLx6nxrYv4uP7tes
         L7xPzm0yu4LtRdlTYglIDDU8qMSnFK3cqOGzW+woKc3MgBSNBRWXnJ2yplTkmtyzT/g2
         kPboX/3uzqEcOm+HCfYfs9Ffpm8XzW9NZRnNGDBEPZbRfa5SQk8pNeAQN5YaE8bY+mgF
         vU/PBDvuD750tusgBP+os9Bf4mZeliaGiO71FysfL7Fw4OSsZVpkJm+6tvJh0PEl4cUv
         RZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777659084; x=1778263884;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3O18HsDM0HeDtBSVlIrq9w2rDZKIMC53Nv7pta0xBA=;
        b=R9Vgj2dZXn72NUXAYL31wa7Kq4KptUW22Vwum3YXmebuGiRVC1Q4yoUinot173bpxo
         aB0pnNzoMskAGD6/GnBcSxDC3NTv2eZyp4AySSSqTJYZjXgNuCv6OHimi9tUpkgF6UCy
         Bs6y0x92QfnZkqoW8l2/s9xpdvpUFOHim+TO3BLcvuozc4jJfY9XZIPrnqEBmkS0qZJ1
         xARk8Ae/olig8ykx80CaGCtwGHzsujX76+sKjMBInpvzIgd1EdMVzlH9P//cyIBXdrEs
         67YaxO+e1abthJXF5WR95xbzIbNLi7kL20+PfP0r+zrWxWVBQNi1h1efFdt1nAYKnG2l
         MWuA==
X-Gm-Message-State: AOJu0Yx9Py08T5bqRN0xVeSbe7TNn4d8CvYJf4E79txk6aTmeNvXUoun
	u7MXhscqSAJpxf66Grp3SVtjXA3hwZJDSWjhOMp5OmoAtT/v8tc4GsT/XDu8sUe0Gi91W90wqlU
	tcwnjennaJGVpyil6Mwtsj2qXTE7UhvEuxzhpCMtTxRshoCH8ewGOERTr86bqB9Ws2uNl
X-Gm-Gg: AeBDies+BBaLiEipxCdNf+RZ2k1DQtmiDAaoBlkwFsYfN5zUYZduoavegU+GDZkcIzk
	wcmpOzHgjxROE7we7Bp7YPlgu5ud25Sf28UMAZDZQNZW0MVs2GvRfgs6IP01tn/wmwNkx1DNKdQ
	4rCMSsxOKiJrkijmenEBabKa/Kme4QKDFwIVulGbxM2cxSx/ZcsDyOj2BMQwSfL+zHVb4lIzDV5
	YTEy25iylPwVH7T6a9b4qQ4v52ccGXF3MSXhaoRWO6vLz/9XxZ5VwSznQdZfwYoI44KgTaHe/Qq
	i7yNGXX8m8yJ/V46BpEdc17r0kVFY4o8RwEqd/vk3yvQ11lAKGxtokt8ie9BX2DgX1y29Tv739j
	wEaB9x2VSYRLC5YDuoq4YECpEvvidkvXj8mPkkdplbsVrIOA=
X-Received: by 2002:a05:6a00:4f82:b0:82f:6b3a:8281 with SMTP id d2e1a72fcca58-8352d16ab0bmr265210b3a.7.1777659084392;
        Fri, 01 May 2026 11:11:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f82:b0:82f:6b3a:8281 with SMTP id d2e1a72fcca58-8352d16ab0bmr265189b3a.7.1777659083877;
        Fri, 01 May 2026 11:11:23 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351589a910sm3170709b3a.18.2026.05.01.11.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:11:23 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 01 May 2026 23:40:59 +0530
Subject: [PATCH] dt-bindings: nvmem: qfprom: Add Shikra compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-shikra-qfprom-binding-v1-1-17e63148c2c8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALLs9GkC/x3MQQqAIBBA0avErBtQKaGuEi2sxhwirREiiO6et
 HyL/x/IJEwZ+uoBoYszp1ig6wrm4OJKyEsxGGWsapXGHHgTh6c/JO04cVw4rjgba7zTnW2Ug9I
 eQp7v/zuM7/sB0+yMaGcAAAA=
X-Change-ID: 20260501-shikra-qfprom-binding-c262fa19640a
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777659080; l=974;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=o5HwJQ+v+rkM1SV24Mfx3kK/RwDPwTE0Z6SE2STHhWo=;
 b=XjjmZ8cI8ZCJfSQjxwRpCfoGoqgcfSlp/h5Wltgiejui9pkgCgBUUTQafIbjss0JXG92KE6j6
 8x2KSsoXi+1C8sI3yABuRfRLDkyilVFcro/Oi7li91MaK820LvZoGBC
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE3OSBTYWx0ZWRfX07fCcT4SnkhT
 nsBAbv9kmUGKcGitQvMUzUYPNSXFmNHBzt8ZHt8SmPHEx23+weFLPatOkCNHM66PUAvz+viQazg
 BN5Oa/2XbZ+Lx7tEfYjEwsxqTz2XrENyy8BNsrRdU4nS7/KpnzKaWfnmI9vpVzK2Y9oPxefj8wK
 bCr4wJDMc0qHTAhaRSwu6lXAOht9oFsDM/IquZ7nyAyG8cAiIB8u2iMsLS2NSNsSetNQgMO6Juw
 NAp0gY8QdHiVXFJa6qe+MZMyUEpbUq8eDnbW4mIUgHOscLEa6jWoGVm8Dq/7uBEqBYALr6PlJMD
 IAMNO4eVrjw9J6TpyMJfUXOX9xEXlPzPSbLrmQP1YrjVNeicfyvzJiZXV+QFhuvjfYp2zeXxrYq
 DCrNCNn1MAmOxZOrdkt4i8TsbXIvJoeP/q1lnqba8XZhGBvC6+LaCiH23yHZ/ZgzSjj6dg3azgx
 WQCX1Pu6gEdMwMnTC1w==
X-Authority-Analysis: v=2.4 cv=OdWoyBTY c=1 sm=1 tr=0 ts=69f4eccd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YaEUw0lDPXG6J-eZ-HYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: m30tGRQsF_6M6bd9hBT5ErHOa2apHNX9
X-Proofpoint-GUID: m30tGRQsF_6M6bd9hBT5ErHOa2apHNX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010179
X-Rspamd-Queue-Id: E47544AEBE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105549-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]

Document compatible string for the QFPROM on Shikra platform.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2ab047f2bb69..52b86133ee00 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -48,6 +48,7 @@ properties:
           - qcom,sdm630-qfprom
           - qcom,sdm670-qfprom
           - qcom,sdm845-qfprom
+          - qcom,shikra-qfprom
           - qcom,sm6115-qfprom
           - qcom,sm6350-qfprom
           - qcom,sm6375-qfprom

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260501-shikra-qfprom-binding-c262fa19640a

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


