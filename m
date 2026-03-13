Return-Path: <linux-arm-msm+bounces-97413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIYRHnbos2nZcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:35:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3F6281866
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21F013259205
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AAD2BEFF5;
	Fri, 13 Mar 2026 10:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CHpHrgA1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OM/po9C3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63627375AB9
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397906; cv=none; b=r7X59iEWR6hvuTrpZRwuTeAdCrZtxf4fEHixudvt3cZkpXuUsncaJwDBc4OthD/XDzhLTbo3ws7P8m6JqUDQcHn5oIZm2z8s/HshHWBGAyhh/ov5N05dDMvCxhlRtWuC2OOP14DGJSEwzeU7gjrbaW2/8F/yCNOzpWLyK0DCakw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397906; c=relaxed/simple;
	bh=5dCXMiUZfqQ6rMqsbJSOTrVATkIK9LwVrLKScX+8+eQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUPDLmmgSqVUDsoCtw26VEgJ+GDiXozqElC8nOlvHlGORJAvZwUc4lsS+bN2up/bOWpeilQ0LIbvWqrihfTJM29zA7KYhsqNNAaeEtRbs56vJyb0uSSZLXOIEEKUk7i16HJCh1hne8kVvGG2SclTaGmPGK0m07PCzy5SViH7Ukk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CHpHrgA1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OM/po9C3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5te1W3844018
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xNiuNzq3gQ6K+5dGMyhYy3eFSXt2D3xTYj0YGjuQSBc=; b=CHpHrgA1IpYEqg7J
	BGTYXvTw4k8L4CKO7ExJ+nEmQYNyphuzjihtJeF0I8p4ZFaIL3FG/W3wQRyHIU7/
	ZO8Y2BxILURNFZiWNfrH/Aifsq8qppPXjhuT/QJL0JCX31eKI4/JLG+a/XK642j8
	cR/uh3wCgEb/ocJdK5PMKK7cwGFY4OOfNczgjXBmQx7Ya8myhjpf0aJxSIL04mj+
	oM6b5oXxrfyWj9mYMHUBGuc0ZO555AS5gSQMaOG1KLuDZiNHABaImcll3l9pKC1K
	H4RHl5g0EortaHVrvA88fJWvmijLClar8Av2BnFCl39J7foseOefcvDMQVQWwD+w
	WwnJ7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54wm66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a203038c8so1077012a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397901; x=1774002701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNiuNzq3gQ6K+5dGMyhYy3eFSXt2D3xTYj0YGjuQSBc=;
        b=OM/po9C37cX5QMa8E3Kvjz0TXuTM8tUmWgClrv07W+SaSBmFliab1Thtj4N9X99B4l
         Fk85IaLacQRnxldwxhvBo7ap1mnnHYQLU6FRDuxyu+AanqCO50QQ/7FAIM3p1oNXPjyK
         PWN/6q14Tdl+FVyyl2LiLDYv6pHg1oTmrmNZpbmrc/4Y9SkSQ9NRFDtghTJ+LMic9hwb
         P5koJ8vauRIoYw3WjoNBFpsm1ZDhKbZysqHwPRSyTmwQPraE4t2gTg98fCa0dS1ZE8z2
         RvXLkYj0UM9UBnf2ZvHUjtbyvUvPbNXfFZ63zYxja2qLhAGVpmBp8dwtCOK3wESiDtTD
         D3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397901; x=1774002701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xNiuNzq3gQ6K+5dGMyhYy3eFSXt2D3xTYj0YGjuQSBc=;
        b=IfSb1jyLLEGvpdwokX+3BUfigFjZieVWz7LvYEdsxi1meX0v5HBNlYuYoOFs6mutZr
         D6TOX2gYhsxQbwp0Jnaru2d7R8Yu9jzuGOofVbJFe0armgBx5J5ZJndaAeTrY4owHgHH
         GWSZK7JMZAELpk6nbYmsL6YJfP8Nd33dmrSQLGT88TQK+zz6TREPeqtBcVNvdRbRlkxa
         Nb1IeqQp7Lj17vgy7HYGe7PSDHYKlKMINUGBzBz0NpoPTYl+m9M6FSjaufNthScBXP/C
         kuEzwGovJ6TVeIo633kFxVTWSPMB7+YUOOBnXIsez2keVVXFOIGdaqweaH8AkLO5T8k6
         Ud/Q==
X-Gm-Message-State: AOJu0YzrHBoIpgTnaT62fz3FUG6XVcQ3cgW+7lDn51mz7KQ2gYYfpJmJ
	01bAWYFcrc0M0WuAGFDRY2z5acZXPM6J9+vdCL2YdRhkCh6dmZzDD+w9yvP6vJvhMogq1OClJmT
	UuFHbGNkdo4drfgU/TLaLCm6c3/hw3EujB+7SwIBPcGJiG8dD0H7aEDfSDhbLhYP9EQD3
X-Gm-Gg: ATEYQzy9oeA7CnOY93gwFQF5efiejgqWW1zLJ8FRGeZuWyiDCT9Eo93OEeLQlKHTdtI
	ir8ukmhQmOCgD4cwI9CqWB5kGkpIxr2jXfLmakLuOXr+zkRUP+Wu41zRV0CmSSHn985wAXMPr7i
	vrDwb0124E29qoMLbWUx//zCVjIT0OwD+4oc+E3dzGr07eC4C6KSjLRtZmh5mip+Y2g6EendAaB
	ZdJLH7ns9HHlnnU84k+H/iATNSLmxL1ATGaifSnJzjsm488YJdgwMMhCimHK5JnKEB5Tb1NM+te
	sySVL/dSMPhD5HYuweZa0+wc+J/WUArrEz4kEudqcnFCi2f3A4MZYGLOKHpnKzIK54hMMTjO4u5
	Z3XaleIxhPT2KF4BGTxkIBZQNmdXAehOoQBeQzd3l6pBJZS9hI1R7umwCAxpTT3Ft92+KpTSewS
	wIvjvQT1RSIsf2kCMEpVBtQf4TfNrT/TDD9g==
X-Received: by 2002:a17:90b:4d10:b0:34e:630c:616c with SMTP id 98e67ed59e1d1-35a220a9470mr2456735a91.31.1773397900596;
        Fri, 13 Mar 2026 03:31:40 -0700 (PDT)
X-Received: by 2002:a17:90b:4d10:b0:34e:630c:616c with SMTP id 98e67ed59e1d1-35a220a9470mr2456698a91.31.1773397899947;
        Fri, 13 Mar 2026 03:31:39 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fc9454sm8604577a91.12.2026.03.13.03.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:31:39 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:59:52 +0530
Subject: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773397885; l=17300;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=scJhwrq7di930clN/Dsk45GTJKU1yF0+/pmxGqzskOg=;
 b=bsrK8yx3M9Lhbji0fhihmQpsw3qsY6LpsdMFE/4WzC44k3MUDn4tdWf42M+ftNiRxYMRr4xgL
 zYYsH4stvySBuZxjJgNaTVO9bAFZt8mcrJ/FinBxY6PDXAM5XbGnAkQ
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: n7pXBwEa5wcD1pZyiDaUcf_eGkXrX6F2
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b3e78d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=E2FcRaxJAAAA:8
 a=689zGLOwWasileE73dUA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=Yev8HTsh1NrKSfoOyGCL:22
X-Proofpoint-ORIG-GUID: n7pXBwEa5wcD1pZyiDaUcf_eGkXrX6F2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfX0ZihGLGKLXM+
 TTuvY4/WUO660yaXMeLWKVryMMhxXwpfuPmhI8Y59UN/3BwhP2MFMBbwaBkbwXpn/wemsSNWH2m
 pvvDj9T9PENSUUnabEcjizUDeNCnNJc5WLpoFfp47/Zmf506tEOp5UubXsgznK22uuLEXxqcmFp
 KbBYY+EmXKk76bymB3pkt9N3Jz55LgORV88GJsTAji3QE8MLA3aibOsqcyglY+VI52QDgWwXdHP
 83EbFN5BSKQuv+MGiQyQwmIEJnqrw1HiG8LUXL99hbgWK3fjQqh0joQq/cAYW2rsaTej5hQpoAC
 aL6Vo7V2nHtIjGsPqAAyBJ5Nrd+NjTHNvjK5+5ZnWiwcvq5cqGrMOvSGPpl8JPkixY7C5TaEpZ3
 w7DMLmhIOlmF8bRjo1TVrl50q4uxxPS5h1VKqlKt4US5mMSAhtjzp/dZTHYJdyGt0fHfreyr4Xv
 btXjZKfqyGxpWaDJGsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-97413-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC3F6281866
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
reference boards. It handles fan control, temperature sensors, access
to EC state changes and supports reporting suspend entry/exit to the
EC.

Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 MAINTAINERS                            |   8 +
 drivers/platform/arm64/Kconfig         |  12 +
 drivers/platform/arm64/Makefile        |   1 +
 drivers/platform/arm64/qcom-hamoa-ec.c | 468 +++++++++++++++++++++++++++++++++
 4 files changed, 489 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2882a67bdf6d..9657c384be44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21932,6 +21932,14 @@ S:	Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/wcn36xx
 F:	drivers/net/wireless/ath/wcn36xx/
 
+QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
+M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
+F:	drivers/platform/arm64/qcom-hamoa-ec.c
+
 QUANTENNA QTNFMAC WIRELESS DRIVER
 M:	Igor Mitsyanko <imitsyanko@quantenna.com>
 R:	Sergey Matyukevich <geomatsi@gmail.com>
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 10f905d7d6bf..025cdf091f9e 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -90,4 +90,16 @@ config EC_LENOVO_THINKPAD_T14S
 
 	  Say M or Y here to include this support.
 
+config EC_QCOM_HAMOA
+	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on I2C
+	help
+	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
+	  Snapdragon-based Hamoa/Glymur reference devices. The driver handles fan
+	  control, temperature sensors, access to EC state changes and supports
+	  reporting suspend entry/exit to the EC.
+
+	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
+
 endif # ARM64_PLATFORM_DEVICES
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
index 60c131cff6a1..7681be4a46e9 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
 obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
 obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
 obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
+obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
new file mode 100644
index 000000000000..452775e765e8
--- /dev/null
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -0,0 +1,468 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
+ * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/thermal.h>
+
+#define EC_SCI_EVT_READ_CMD	0x05
+#define EC_FW_VERSION_CMD	0x0e
+#define EC_MODERN_STANDBY_CMD	0x23
+#define EC_FAN_DBG_CONTROL_CMD	0x30
+#define EC_SCI_EVT_CONTROL_CMD	0x35
+#define EC_THERMAL_CAP_CMD	0x42
+
+#define EC_FW_VERSION_RESP_LEN	4
+#define EC_THERMAL_CAP_RESP_LEN	3
+#define EC_FAN_DEBUG_CMD_LEN	6
+#define EC_FAN_SPEED_DATA_SIZE	4
+
+#define EC_MODERN_STANDBY_ENTER	0x01
+#define EC_MODERN_STANDBY_EXIT	0x00
+
+#define EC_FAN_DEBUG_MODE_OFF   0
+#define EC_FAN_DEBUG_MODE_ON    BIT(0)
+#define EC_FAN_ON               BIT(1)
+#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
+#define EC_MAX_FAN_CNT		2
+#define EC_FAN_NAME_SIZE	20
+#define EC_FAN_MAX_PWM		255
+
+enum qcom_ec_sci_events {
+	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
+	EC_FAN2_STATUS_CHANGE_EVT,
+	EC_FAN1_SPEED_CHANGE_EVT,
+	EC_FAN2_SPEED_CHANGE_EVT,
+	EC_NEW_LUT_SET_EVT,
+	EC_FAN_PROFILE_SWITCH_EVT,
+	EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
+	EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
+	EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
+	/* Reserved: 0x39 - 0x3c/0x3f */
+	EC_RECOVERED_FROM_RESET_EVT = 0x3d,
+};
+
+struct qcom_ec_version {
+	u8 main_version;
+	u8 sub_version;
+	u8 test_version;
+};
+
+struct qcom_ec_thermal_cap {
+#define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
+#define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
+#define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
+	u8 fan_cnt;
+	u8 fan_type;
+	u8 thermistor_mask;
+};
+
+struct qcom_ec_cooling_dev {
+	struct thermal_cooling_device *cdev;
+	struct device *parent_dev;
+	u8 fan_id;
+	u8 state;
+};
+
+struct qcom_ec {
+	struct qcom_ec_cooling_dev *ec_cdev;
+	struct qcom_ec_thermal_cap thermal_cap;
+	struct qcom_ec_version version;
+	struct i2c_client *client;
+};
+
+static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
+{
+	int ret;
+
+	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
+
+	if (ret < 0)
+		return ret;
+	else if (ret == 0 || ret == 0xff)
+		return -EOPNOTSUPP;
+
+	if (resp[0] >= resp_len)
+		return -EINVAL;
+
+	return 0;
+}
+
+/*
+ * EC Device Firmware Version:
+ *
+ * Read Response:
+ * ----------------------------------------------------------------------
+ * | Offset	| Name		| Description				|
+ * ----------------------------------------------------------------------
+ * | 0x00	| Byte count	| Number of bytes in response		|
+ * |		|		| (exluding byte count)			|
+ * ----------------------------------------------------------------------
+ * | 0x01	| Test-version	| Test-version of EC firmware		|
+ * ----------------------------------------------------------------------
+ * | 0x02	| Sub-version	| Sub-version of EC firmware		|
+ * ----------------------------------------------------------------------
+ * | 0x03	| Main-version	| Main-version of EC firmware		|
+ * ----------------------------------------------------------------------
+ *
+ */
+static int qcom_ec_read_fw_version(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	struct qcom_ec_version *version = &ec->version;
+	u8 resp[EC_FW_VERSION_RESP_LEN];
+	int ret;
+
+	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
+	if (ret < 0)
+		return ret;
+
+	version->main_version = resp[3];
+	version->sub_version = resp[2];
+	version->test_version = resp[1];
+
+	dev_dbg(dev, "EC Version %d.%d.%d\n",
+		version->main_version, version->sub_version, version->test_version);
+
+	return 0;
+}
+
+/*
+ * EC Device Thermal Capabilities:
+ *
+ * Read Response:
+ * ------------------------------------------------------------------------------
+ * | Offset		| Name		| Description				|
+ * ------------------------------------------------------------------------------
+ * | 0x00		| Byte count	| Number of bytes in response		|
+ * |			|		| (exluding byte count)			|
+ * ------------------------------------------------------------------------------
+ * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
+ * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
+ * |			|		| Bit 5-6: Reserved			|
+ * |			|		| Bit 7: Data Valid/Invalid		|
+ * |			|		|	 (Valid - 1, Invalid - 0)	|
+ * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
+ * |			|		|	    (0 present, 1 absent)	|
+ * ------------------------------------------------------------------------------
+ *
+ */
+static int qcom_ec_thermal_capabilities(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	struct qcom_ec_thermal_cap *cap = &ec->thermal_cap;
+	u8 resp[EC_THERMAL_CAP_RESP_LEN];
+	int ret;
+
+	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
+	if (ret < 0)
+		return ret;
+
+	cap->fan_cnt = min(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
+	cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
+	cap->thermistor_mask = EC_THERMAL_THERMISTOR_MASK(resp[2]);
+
+	dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %d\n",
+		cap->fan_cnt, cap->fan_type, cap->thermistor_mask);
+
+	return 0;
+}
+
+static irqreturn_t qcom_ec_irq(int irq, void *data)
+{
+	struct qcom_ec *ec = data;
+	struct device *dev = &ec->client->dev;
+	int val;
+
+	val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
+	if (val < 0) {
+		dev_err(dev, "Failed to read EC SCI Event: %d\n", val);
+		return IRQ_HANDLED;
+	}
+
+	switch (val) {
+	case EC_FAN1_STATUS_CHANGE_EVT:
+		dev_dbg(dev, "Fan1 status changed\n");
+		break;
+	case EC_FAN2_STATUS_CHANGE_EVT:
+		dev_dbg(dev, "Fan2 status changed\n");
+		break;
+	case EC_FAN1_SPEED_CHANGE_EVT:
+		dev_dbg(dev, "Fan1 speed crossed low/high trip point\n");
+		break;
+	case EC_FAN2_SPEED_CHANGE_EVT:
+		dev_dbg(dev, "Fan2 speed crossed low/high trip point\n");
+		break;
+	case EC_NEW_LUT_SET_EVT:
+		dev_dbg(dev, "New LUT set\n");
+		break;
+	case EC_FAN_PROFILE_SWITCH_EVT:
+		dev_dbg(dev, "FAN Profile switched\n");
+		break;
+	case EC_THERMISTOR_1_THRESHOLD_CROSS_EVT:
+		dev_dbg(dev, "Thermistor 1 threshold crossed\n");
+		break;
+	case EC_THERMISTOR_2_THRESHOLD_CROSS_EVT:
+		dev_dbg(dev, "Thermistor 2 threshold crossed\n");
+		break;
+	case EC_THERMISTOR_3_THRESHOLD_CROSS_EVT:
+		dev_dbg(dev, "Thermistor 3 threshold crossed\n");
+		break;
+	case EC_RECOVERED_FROM_RESET_EVT:
+		dev_dbg(dev, "EC recovered from reset\n");
+		break;
+	default:
+		dev_dbg(dev, "Unknown EC event: %d\n", val);
+		break;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	u8 control = enable ? 1 : 0;
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, control);
+
+	return ret;
+}
+
+static int qcom_ec_fan_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	*state = EC_FAN_MAX_PWM;
+
+	return 0;
+}
+
+static int qcom_ec_fan_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
+
+	*state = ec_cdev->state;
+
+	return 0;
+}
+
+/*
+ * Fan Debug control command:
+ *
+ * Command Payload:
+ * --------------------------------------------------------------------------------------
+ * | Offset		| Name		| Description					|
+ * --------------------------------------------------------------------------------------
+ * | 0x00		| Command	| Fan control command				|
+ * --------------------------------------------------------------------------------------
+ * | 0x01		| Fan ID	| 0x1 : Fan 1					|
+ * |			|		| 0x2 : Fan 2					|
+ * --------------------------------------------------------------------------------------
+ * | 0x02		| Byte count = 4| Size of data to set fan speed			|
+ * --------------------------------------------------------------------------------------
+ * | 0x03		| Mode		| Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )	|
+ * |			|		| Bit 1: Fan On/Off (0 - Off, 1 - ON)		|
+ * |			|		| Bit 2: Debug Type (0 - RPM, 1 - PWM)		|
+ * --------------------------------------------------------------------------------------
+ * | 0x04 (LSB)	| Speed in RPM	| RPM value, if mode selected is RPM		|
+ * | 0x05		|		|						|
+ * --------------------------------------------------------------------------------------
+ * | 0x06		| Speed in PWM	| PWM value, if mode selected is PWM (0 - 255)	|
+ * ______________________________________________________________________________________
+ *
+ */
+static int qcom_ec_fan_debug_mode_off(struct qcom_ec_cooling_dev *ec_cdev)
+{
+	struct device *dev = ec_cdev->parent_dev;
+	struct i2c_client *client = to_i2c_client(dev);
+	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
+			  EC_FAN_DEBUG_MODE_OFF, 0, 0, 0 };
+	int ret;
+
+	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
+					     sizeof(request), request);
+	if (ret)
+		dev_err(dev, "Failed to turn off fan%d debug mode: %d\n",
+			ec_cdev->fan_id, ret);
+
+	return ret;
+}
+
+static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
+{
+	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
+	struct device *dev = ec_cdev->parent_dev;
+	struct i2c_client *client = to_i2c_client(dev);
+
+	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
+			  EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
+			  0, 0, state };
+	int ret;
+
+	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
+					     sizeof(request), request);
+	if (ret) {
+		dev_err(dev, "Failed to set fan pwm: %d\n", ret);
+		return ret;
+	}
+
+	ec_cdev->state = state;
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
+	.get_max_state = qcom_ec_fan_get_max_state,
+	.get_cur_state = qcom_ec_fan_get_cur_state,
+	.set_cur_state = qcom_ec_fan_set_cur_state,
+};
+
+static int qcom_ec_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD, EC_MODERN_STANDBY_ENTER);
+
+	return ret;
+}
+
+static int qcom_ec_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD, EC_MODERN_STANDBY_EXIT);
+
+	return ret;
+}
+
+static int qcom_ec_probe(struct i2c_client *client)
+{
+	struct qcom_ec_cooling_dev *cdev;
+	struct device *dev = &client->dev;
+	struct qcom_ec *ec;
+	int ret, i;
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	ec->client = client;
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
+					IRQF_ONESHOT, "qcom_ec", ec);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get irq\n");
+
+	i2c_set_clientdata(client, ec);
+
+	ret = qcom_ec_read_fw_version(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read ec firmware version\n");
+
+	ret = qcom_ec_thermal_capabilities(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
+
+	ret = qcom_ec_sci_evt_control(dev, true);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
+
+	ec->ec_cdev = devm_kcalloc(dev, ec->thermal_cap.fan_cnt, sizeof(*ec->ec_cdev), GFP_KERNEL);
+	if (!ec->ec_cdev)
+		return -ENOMEM;
+
+	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
+		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
+		char name[EC_FAN_NAME_SIZE];
+
+		snprintf(name, EC_FAN_NAME_SIZE, "qcom_ec_fan_%d", i);
+		ec_cdev->fan_id = i + 1;
+		ec_cdev->parent_dev = dev;
+
+		ec_cdev->cdev = thermal_cooling_device_register(name, ec_cdev,
+								&qcom_ec_thermal_ops);
+		if (IS_ERR(ec_cdev->cdev)) {
+			dev_err_probe(dev, PTR_ERR(cdev),
+				      "Thermal cooling device registration failed\n");
+			ret = -EINVAL;
+			goto unroll_cooling_dev;
+		}
+	}
+
+	return 0;
+
+unroll_cooling_dev:
+	for (i--; i >= 0; i--) {
+		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
+
+		if (ec_cdev->cdev) {
+			thermal_cooling_device_unregister(ec_cdev->cdev);
+			ec_cdev->cdev = NULL;
+		}
+	}
+
+	return ret;
+}
+
+static void qcom_ec_remove(struct i2c_client *client)
+{
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	struct device *dev = &client->dev;
+	int ret;
+
+	ret = qcom_ec_sci_evt_control(dev, false);
+	if (ret < 0)
+		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
+
+	for (int i = 0; i < ec->thermal_cap.fan_cnt; i++) {
+		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
+
+		qcom_ec_fan_debug_mode_off(ec_cdev);
+
+		if (ec_cdev->cdev) {
+			thermal_cooling_device_unregister(ec_cdev->cdev);
+			ec_cdev->cdev = NULL;
+		}
+	}
+}
+
+static const struct of_device_id qcom_ec_of_match[] = {
+	{ .compatible = "qcom,hamoa-crd-ec" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_ec_of_match);
+
+static const struct i2c_device_id qcom_ec_i2c_id_table[] = {
+	{ "qcom-hamoa-ec", },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(qcom_ec_pm_ops,
+		qcom_ec_suspend,
+		qcom_ec_resume);
+
+static struct i2c_driver qcom_ec_i2c_driver = {
+	.driver = {
+		.name = "qcom-hamoa-ec",
+		.of_match_table = qcom_ec_of_match,
+		.pm = &qcom_ec_pm_ops
+	},
+	.probe = qcom_ec_probe,
+	.remove = qcom_ec_remove,
+	.id_table = qcom_ec_i2c_id_table,
+};
+module_i2c_driver(qcom_ec_i2c_driver);
+
+MODULE_DESCRIPTION("QCOM Hamoa Embedded Controller");
+MODULE_LICENSE("GPL");

-- 
2.34.1


