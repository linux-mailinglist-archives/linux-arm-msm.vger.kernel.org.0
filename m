Return-Path: <linux-arm-msm+bounces-78757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA02C076AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 18:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6BC604EF45D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 16:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC8A33A03C;
	Fri, 24 Oct 2025 16:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8ONhWE1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB73F33B94B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 16:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761325074; cv=none; b=ALc8776GTXZiSoXoZomKgKG+9hucbbqjn6SqY5uDJCQsGxMBaffGitRG1kreapZK/iVpNDAPibKFq+KsB7vfulimUkM0ZBYpqE9xEUfm2DEuiPJ9ACsvQkuIdouN5DjdUCZ0lKJWJGhD8f5v0UcmJQ/Wm7X8yoEZw+XMxSiMcOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761325074; c=relaxed/simple;
	bh=vXuWKWARJ+oeXeVd5BMdX6Qqs7o76W/v4evbueciz0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o5xGsls9sgf5Ue6thNMRT1QagJM8DIoiUNjj/HpyuQBddP6F7N6P4SgCfXEbns/xqwEZV0SCh/BnrLZwVWz/biu2vkkQw0waNZhQY+ZQMwQU2aSkkH0UT6ZRZt9kvf7O31b+H94HvOxJpZ5/9FcKTJ0h/H7ANMvnGWECxTLDV9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8ONhWE1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OCBs2a022206
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 16:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y+9oqAefh+KN7qSLrQunsPCZJMm1uw9AiBh
	Vh9CSxHw=; b=A8ONhWE1adNTxzpHfBNanYtX2wBvQCRLUsmYTbHicFSfrQRTQjP
	jueSiIPF9r4Q7UADn5UWnxQgkaF1B5gZYPBF0HpFQO/OeDX1t/k0nxln5cPykRya
	SswpmSvoYtqeSZgjSZdUvChjW5KQ+2ZP5XkPmY2GVhCV3ZWgNBz5nCwpeUPmU38Z
	2DJ3KPCNDx9QV/KQyI5rJTGAAq9Xe1IU4A6xi6PjWNnp7Vj5xws6ENFptdi0fSYM
	Kz47AqxP6uVztN8+gomPw9v4mOA8qeCMyGdZ+lVKO5czMLc32TMz/3jv5NQfZImb
	S13WfduQVzhgCVybzeL54OGesV7gKyrKjQA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0tnm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 16:57:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8a80aec4dso59819631cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761325071; x=1761929871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+9oqAefh+KN7qSLrQunsPCZJMm1uw9AiBhVh9CSxHw=;
        b=dT5sisXiaDSziZdAi0Akl0v5ymgAlGZfwDxkCdqnmk9PP5qrkYgzhjA4RpPD/AwanD
         rFnecwn4X6PfaPQhfJITRmzCs+R5OQiS9VXiwLNWnLanhLGdFN0YUlKmQuP6CGgqx3C2
         X5/fT19bt14lArw8Dn+SIBOMdIqFyVE3FhE/XX7UcqEe22qhWCCsPVnV3GhNcvau9IFG
         3nzQ5f1FrHlD/mWyxcPRTXuOS8TCSqrrjm/UTT99vFwUmMQkMWmh4qECUdtqmuH0QrL4
         50St+hv94NC+uqTpKJFU1rXlQJwiQ52nZDc2mpmPzyVbIYcSkSFB/muK/BT1XptdOo0O
         RUNg==
X-Forwarded-Encrypted: i=1; AJvYcCU5rtygdhuexIbKnfCkYpWPw08/FeDnpknNBieUJyFx81qAp+SRWoOLveQrKpg/kFDWJWYakfiIDRccqGZ/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuv7Yucoy+Orzs0WB/ETCO4sk4eWyD+jf4SjQtqfyWpmaRNJ+V
	0mQ6VURvd5mXvCmgcT348VPU2j264bUj8gGv6dhI9gGhZBjtRY2oRE1qfdjfcMIqDD38TPboJMc
	97FlzQUSSMaTBxAGgmSJADEHzfZyhhBkMnaO7iSWe5AaY3V58rqPxBcTlHRD37IBpy/65
X-Gm-Gg: ASbGncsdaHz9fhoMuuxxbo7yNZEZVVmaetQssZUB/XpFkOGLVJtex7eS4Mo5Q2/lc4h
	Xg4tvvfNUL6bQK1k9FGNuf3grSaji864HNZzbxLqVCboz7dad22eX5/Ge0XyoI1HzFA1boG7KWj
	d49Vcsz68dTrKa9XzvQOtMtLTWEb7Sn3+NtBG1hWMQtF1fhKCskCljrNyaG3XD8kOsT3LYVOg0V
	puJy5Op4/JDkZ+iLH4Zf1M0wWdlOBfRVJ7oZ9h2/TlwBtu+OBpIbeY6Dfv9x+7qupQR0hVlckdU
	TL1v8+kMVUd7G0O5Z0Pywe1RHHkv+WcaEY1gxEd5GU/Ro9B35GUUg5hxmDOjLyIKwN1Ay2QYLUI
	psJjJhwzZLudQ/StqE4D/SKvXriZMt4lk7gzMs9s=
X-Received: by 2002:ac8:590e:0:b0:4e8:a495:4752 with SMTP id d75a77b69052e-4e8a4954c39mr316455341cf.83.1761325070811;
        Fri, 24 Oct 2025 09:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWfbWv9PlnchhJbCtZPrM04Bijjfjg28YOTLUgss64Wd9zIGhqWzXaKaJCXv5iWusGQphbSQ==
X-Received: by 2002:ac8:590e:0:b0:4e8:a495:4752 with SMTP id d75a77b69052e-4e8a4954c39mr316455081cf.83.1761325070386;
        Fri, 24 Oct 2025 09:57:50 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3ebcbcaasm4786602a12.10.2025.10.24.09.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 09:57:50 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Fix typos in the documentation for qaic
Date: Fri, 24 Oct 2025 18:57:49 +0200
Message-ID: <20251024165749.821414-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfXw/5qM+TpR1vi
 lN1Ogsik3IZZlRLY4M19k9XeXXEmri1YoLyexKczLZWhIhQ4UIxRbXG9Z/U1khg2OU2rHZq3zfc
 MiYC1V4qbtG1bTRK4zWpb9/iWrZL0LcCrKrj7x40+o1gG2eCSzpnFS9SRQChtUWh8OeddOLZvKv
 xmld18TqOn0ZZ/NQd3HncsKfXeP0qCbwWskLOyhPHW4QsyBMCsqbekOkWp94KNlDvjHu2UB2LmM
 nT2Li1N3GT5UBU/bXu4isWtt5E5hwJmc0U56DaoOCloHwdCWq2vLJ0fqs5LnFMQpXPyQ3cwPBTT
 wlMPN8IZua3058SDwAsnoGUISQeHQjaYwJKv9lCJAg5fhJf1JwxMzXFIuhW3B7+CLs1DmudWQmY
 3fRKGGPXLxk1Unlc3Gk8mV3ShoezCg==
X-Proofpoint-ORIG-GUID: -LVrDZTOeUi49KmJiKlCzJZx19C3fEMA
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fbb00f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=pRYst-cxp-SWPdbSSdgA:9 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -LVrDZTOeUi49KmJiKlCzJZx19C3fEMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

From: Sourab Bera <quic_sourbera@quicinc.com>

Fix typos in qaic.rst file.

Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 Documentation/accel/qaic/qaic.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
index 018d6cc173d7..ef27e262cb91 100644
--- a/Documentation/accel/qaic/qaic.rst
+++ b/Documentation/accel/qaic/qaic.rst
@@ -36,7 +36,7 @@ polling mode and reenables the IRQ line.
 This mitigation in QAIC is very effective. The same lprnet usecase that
 generates 100k IRQs per second (per /proc/interrupts) is reduced to roughly 64
 IRQs over 5 minutes while keeping the host system stable, and having the same
-workload throughput performance (within run to run noise variation).
+workload throughput performance (within run-to-run noise variation).
 
 Single MSI Mode
 ---------------
@@ -49,7 +49,7 @@ useful to be able to fall back to a single MSI when needed.
 To support this fallback, we allow the case where only one MSI is able to be
 allocated, and share that one MSI between MHI and the DBCs. The device detects
 when only one MSI has been configured and directs the interrupts for the DBCs
-to the interrupt normally used for MHI. Unfortunately this means that the
+to the interrupt normally used for MHI. Unfortunately, this means that the
 interrupt handlers for every DBC and MHI wake up for every interrupt that
 arrives; however, the DBC threaded irq handlers only are started when work to be
 done is detected (MHI will always start its threaded handler).
@@ -62,9 +62,9 @@ never disabled, allowing each new entry to the FIFO to trigger a new interrupt.
 Neural Network Control (NNC) Protocol
 =====================================
 
-The implementation of NNC is split between the KMD (QAIC) and UMD. In general
+The implementation of NNC is split between the KMD (QAIC) and UMD. In general,
 QAIC understands how to encode/decode NNC wire protocol, and elements of the
-protocol which require kernel space knowledge to process (for example, mapping
+protocol which requires kernel space knowledge to process (for example, mapping
 host memory to device IOVAs). QAIC understands the structure of a message, and
 all of the transactions. QAIC does not understand commands (the payload of a
 passthrough transaction).
-- 
2.43.0


