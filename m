Return-Path: <linux-arm-msm+bounces-102242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB06MI181Wlv6wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 23:52:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB1F3B5229
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 23:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC70C300B9EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 21:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C2237E2FF;
	Tue,  7 Apr 2026 21:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TK6TrHtp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2btZC9V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DF537C936
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 21:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775598729; cv=none; b=ecNu1u9uceVwXLfW/ncOhWLde50DJom602Rq5PSEaZ/e0WVHzDhF+m5G8Sh1dIZKNpsqy59LtLGTZs7JhxLp9cqVPSy2UmI0SrXe2T/+aj21KjJnFl2XoHZpVv4tWb5+gWFbK7CevhRlayJSdpdVmNKDGn0JAx3PLnsxnBjyeVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775598729; c=relaxed/simple;
	bh=6rzWCEmgxgBb6ytYesWxnNywYb01hhCB7YS08dhMyK4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CWxW7Kc5p9crOi+dCS6yGjpKSQGBf5caUKhPpR7hz3dSxgv2h9evSBthcJScg/5McRHpCNVxq0YSDp4xP2Gk55tMs50WFDVqI/n2pJbOOzsi0c4Lo8Jx7ZL/XM9UPW4N4W2PGQPemvxdztza8rC1b37tLLbRtbxaG6CaY+aLU6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TK6TrHtp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2btZC9V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637KQ8j23816989
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 21:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NuyzkqXwLkh5vwGcgTPUqo
	a/D0g1fiPd2TiXEBRp1Dg=; b=TK6TrHtpPV1Lefo3h5zsxzcHzc4Fg8YEi2UjpB
	X0MNHmyR3rqOAMnIySYmA/Me0p8jFC1JffkMyzMSr8NDvbAWqic112JfrvrhAu8Q
	3PSNDDdcKaVvgrmn7b6gkft/INEXsAW5VDJ4GYWzHY9e0qn8kZgjs0/+xtsaXU3i
	KvDBJttIWLymJX5qEIM/KxJ/kaDV7ddMQbsBYpaIDSzNmYT5xFv7CuR0rOWmCE/5
	TfSuDU7NoJz6sZsYZ0g6jFIwZQWasVC3WqpK0njz9WW5Tq2F3NTy9vH86kcZrec0
	VIiK0ERJHPsGJ3c/HyqKIQJqzRuvJCvwAQK1OM/02roDfWdw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4vr4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 21:52:07 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c20a91932so2278910c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 14:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775598726; x=1776203526; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NuyzkqXwLkh5vwGcgTPUqoa/D0g1fiPd2TiXEBRp1Dg=;
        b=U2btZC9VDRZQofYN8V3VQlebuqwXojgJq7FKu9sBtY5V+TEqRmCy6fkTF6u4yBCbyC
         iH0yKrDxIq3O56N9a79FI3gJvDhAbTm4mgTv3KkHCFPXLM4zCB8ffbyJiDc9ImrlwJyR
         j00N8DM8M3lWZWI8SorW2mLyDoeNe20ss+7uuyK9OIvCa/GfbrhaxxgqqjLU+0oagUkj
         J5d6T08QQBQLXP/MnCMCNDhabJ7WX5+URZ44aFClh62pWkWoMoUUBHwpmrSCly6Gz+jv
         mE8IHsCRbrJpTV6kbY6gPPbCUITsTspefSmqB0hpxjBJR7hmHGKx7XFI5Mq/oorjzYUm
         F3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775598726; x=1776203526;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuyzkqXwLkh5vwGcgTPUqoa/D0g1fiPd2TiXEBRp1Dg=;
        b=Yb3zJuqVUOJzaXY2vAoqZUcymIFpqrmWkJX1W1xJ//pJ0B0663XC/ZLpgp0qqKluko
         YIjPi/IsL7aO5A1vGc/3syrTpFRVoIsSoYjzcaNOU7zXGbElnoQ5rGxLzIBaQN29e5Xi
         Z+BGwtOXq2KUmSoEZtaKf9hqQ0JUhPWpJS0DArrYZpK3kWDSIohipeREfrq9UI5o/lpv
         taeNgcIoZF2CHU3C8eZfS9yEBj6vzhlqS06a7rrgUE1DJtJoBZQxob8xaigH8T1oHPZP
         myZD2ylG/z0NKgLY4EYOwgGZoYn4yB797XF74Wz8zTFmBwBKdeKySTicc8J7u6p8RSV9
         33lQ==
X-Gm-Message-State: AOJu0YxjtZImJwMMrunvLLXvhjVcqyKXPiwIab1ZmeBOh47yBvJWWwt3
	EBGTF+/KBaYBmI3xgFgxUY9qSP9+f6uA5LjOnAXnFJkpAADgeGxLRauLFqh7hxHPsDK6p0PN3rZ
	01S5s/WDY/yCTqYrF0wvS5J7QXhS/GxgbuT+855FmUz4rzZIwrrWvMXAu5+bcp6mlnFig+zWc+V
	w=
X-Gm-Gg: AeBDieskbfHFVyYWTisTBYCemCARUJySHqMo9tDFuHvt91FMaaz3u765BYRmCCVXvKf
	2ilCb7SDAO7oBx/eD1XgNqWhj2UhVdyDsViGWSzUIHPqjYPPQ3WcnO/b2gYIYyk/DSFHbRQE0MG
	/AuJfyWv23ABYJafbTkoB9w77OFsJlvz5Sv/2JMxk/EepeBOaYkIWSSMdovMVbVX1g5PqOI3/MM
	DeSclM2Gv6Z0FNvQV2LOOgP0wA4nJcydZC2Pr7u31pSihmq3OI+5bYwVjW2cM8l6QBMS8LaMRxE
	QK9ZFqo9jS/x4g8wRNf86rAJXDHtVWnfbEpGoIstnBt8iiFzPT6cUp4YPdXy8dAefXnKn2OpTu9
	o/T3/8nVdVJ6+udj9SDtafmsGbubWpHg6Hf8DBw9HtEzTo13bj0MC+MNUceMfGlUcq1a12M9mgw
	==
X-Received: by 2002:a05:7022:41a3:b0:12b:f881:d8fb with SMTP id a92af1059eb24-12bfb6ec86fmr10337010c88.3.1775598725654;
        Tue, 07 Apr 2026 14:52:05 -0700 (PDT)
X-Received: by 2002:a05:7022:41a3:b0:12b:f881:d8fb with SMTP id a92af1059eb24-12bfb6ec86fmr10336988c88.3.1775598724969;
        Tue, 07 Apr 2026 14:52:04 -0700 (PDT)
Received: from hu-fruiz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bfea5f860sm16224123c88.2.2026.04.07.14.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 14:52:03 -0700 (PDT)
From: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Retrieve System Cache Table (SCT) descriptors from
 a shared memory region.
Date: Tue, 07 Apr 2026 14:51:46 -0700
Message-Id: <20260407-external_llcc_changes2set-v2-0-b5017ce2020b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJ81WkC/42NTQqDMBCFryKzbiQJRmtXvUcRCXGsgWjaTBos4
 t2b2gt08+B7vJ8NCINFgkuxQcBkyfolgzwVYCa93JHZITNILmteccFwjRgW7XrnjOl/GZKEkSl
 EIc7aNEJJyP1HwNGux/atyzxZij68j6skvu4/q0kwztqmrhQO2I61vnqi8vnSzvh5LrNAt+/7B
 8soN4bJAAAA
X-Change-ID: 20260401-external_llcc_changes2set-5ee118ac7152
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775598722; l=1681;
 i=francisco.ruiz@oss.qualcomm.com; s=20260305; h=from:subject:message-id;
 bh=6rzWCEmgxgBb6ytYesWxnNywYb01hhCB7YS08dhMyK4=;
 b=aMCDYIFSc9K5lsVhQv2AbWh0+aaaXGCRFymzhF6bo31xGJmz/rrRbYRHoKJrF9fK3e+M+UENE
 yWht/4Wy5SeCaSFHjHHPJzdJ4XVgaAIIYYeDX7Y5J8eeGVhOUAeyjrs
X-Developer-Key: i=francisco.ruiz@oss.qualcomm.com; a=ed25519;
 pk=Gcv2CX7iHozjnQ4oK+9fINmBiQTmVC4SpaZzoM63CHE=
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d57c87 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7fDgnTYA3Q_ah9AnCHUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: JNxnyYaNQXKO2WSQW9PFr11dFZdRrM2u
X-Proofpoint-ORIG-GUID: JNxnyYaNQXKO2WSQW9PFr11dFZdRrM2u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDIwMCBTYWx0ZWRfXzzlNTjQ85kES
 qZhtolEAITn+Q9XJShUsI6BuarnMDmhnvc17pky9k/myJUyxKQlkciL5KKTUhBwhNd8QDilYBAQ
 r7jviR04btmjDcBpD5OyLNOYv1p1aJqEXlRPXSMXFE/7zYcHFcaf5DeUqzaJmfAAxbREVQux5tg
 Gh0aY5XtSqHPRbtYslQ8TTZf2S9hRPVDyC8fw2bJ+/BdNcDiFgjFoWzZMUWpcES3bPGdjGKjuVN
 Od+CWafeg5rEiFvzgwwkHM00zLbYtSgHxQIDL8OX9OS4JNHcUDAs4dI4XmuK5+cI0GrpTk3rGRl
 kSeYgCw6qIM5n9iCygl2aLziSE/pEvx1jFskANvTUzt17H355Jt4JI7al9WuGcY7tkv2+627IFy
 lzfH/4Bi31i5sYDRc1eBTVKtOuQjt/1wNHhQGKCtrwchXHqaRjpOfK2aupPTeLH1AL0nAHGlQZ0
 XO96sMXWjwbEzabitJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070200
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102242-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francisco.ruiz@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CCB1F3B5229
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On newer Qualcomm platforms, SCT initialization and programming are
handled entirely by firmware outside of Linux. The kernel is expected
to consume the pre-initialized descriptor data rather than configure
the SCT itself. The LLCC driver therefore only needs to locate and
parse the descriptor table provided by firmware.

This change implements support for this mechanism in the llcc-qcom
driver, enabling SCT consumption on platforms that expose SCT
programming through firmware. The existing behavior for SoCs where
the kernel programs SCT directly remains unchanged.

Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
---
Changes in v2:
- dt-bindings: cache: qcom,llcc: Drop "and future SoCs" from commit message subject (Krzysztof Kozlowski)
- dt-bindings: cache: qcom,llcc: Revert binding description (Krzysztof Kozlowski)

- Link to v1: https://lore.kernel.org/r/20260401-external_llcc_changes2set-v1-0-97645ede9f6a@oss.qualcomm.com

---
Francisco Munoz Ruiz (3):
      dt-bindings: cache: qcom,llcc: Document Hawi SoC
      soc: qcom: llcc-qcom: get SCT descriptors from fw-populated memory
      soc: qcom: llcc-qcom: Capitalize LLCC/EDAC in comments and diagnostics

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  19 ++
 drivers/soc/qcom/llcc-qcom.c                       | 301 +++++++++++++++++----
 include/linux/soc/qcom/llcc-qcom.h                 |  44 +--
 3 files changed, 293 insertions(+), 71 deletions(-)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260401-external_llcc_changes2set-5ee118ac7152

Best regards,
-- 
Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>


