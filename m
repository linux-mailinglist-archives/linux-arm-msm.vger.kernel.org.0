Return-Path: <linux-arm-msm+bounces-106148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELpUIpVy+2lgbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:55:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 104C84DE6C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B99C30A66AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 16:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A00496903;
	Wed,  6 May 2026 16:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ES7Schf5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7+SJ/Sm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F0D4968F4
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 16:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086299; cv=none; b=euoEdvc/JOYSKQhEMG7f2CjqrXcX6+9peCdIiCVlRN9z7Jq9wHXVxfXc/ZUZhdluVpS7vwa9iUPAtPXaHA7w5c5c4tv9+xRW0hTNMSwlqkxL3WZpmJBLwqOFZFIoBBDxd9Kj47qMAZifdYjLD4B+5cgqKQ8oi4JOSi1RwsPL+KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086299; c=relaxed/simple;
	bh=Rc3wR1W/Ih5kAVC28sMokOrsrDcS78MI6o7/S/3cgks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfeidfxSHCNRI2pZV6z06phgM9Qi7DCYEGeBI04g/krHNHvPwjrOg00DT6SIK+h7yQgZu6X+KQkZOl8m3xbNh06VEJ7f4cVE8SPAeen03KkR2qKAtpEj7/Lzwo08qezXgCynEliKb+UWyG3zCQnvRVRohn5EuFRR8tdcmleLx/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ES7Schf5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7+SJ/Sm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646EB3Sk1436257
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 16:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	auMvDAA4EUUiV2LAoqwSKoZ+PHY3ZmUuTegy7+23Vsg=; b=ES7Schf5x33FgGYs
	ABkZIZRMtyaA+UrZEF8eJJKTFigwQaJQWU8hNz4Xi0GjTjtZcnr6mYLLwFLbAEdx
	Us3V+nxAJbYR8g7Jvyid8pKoDo2avG8S/Da8Y6z2GRiVt8UMQD5zMnQc5KGWy94n
	d/J7ikRjEHHQpsUbf2OWGNL+2Dkfw6A6scGH5jm/YtmJpqSDA20uEmQHkz2D6f1q
	0iWV2dJ54AH6oX86ygP7QiRfK3ODUY17nT7lFA93y8pnMxd4/30KPC82BhpTPKtf
	2JgEkX8fMtSu6hLGFbqNjkEDIxuG7IxhMsh4EROYf13ArQLM0TfPMOVkVGX7zNx/
	CT6ZSg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyuqduc6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 16:51:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12dba1e866dso939947c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086292; x=1778691092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auMvDAA4EUUiV2LAoqwSKoZ+PHY3ZmUuTegy7+23Vsg=;
        b=j7+SJ/SmaCNaOYtO/o/CiJ5cFOK5nKdbTSANopgANT5XZqm57Kqtfq6e90JIq/Pr6n
         POoye8+Lh3E6ZQMvaTVw0QTj1YtyOvS+qtczjYJ56kcW9h2ooX2JODpHMvfuXGvTbOt1
         8S4t7LE1xROoxMiZ+Xl4ZkcgQClgXHVKcgxpWcg1jIF7aF+N6cY0eacGJ2HZCXDhBd/7
         Vtz/KZ+VCXFFTVHE2dips/QWzJ7pw1EtX8zaDwDfDoWlegipZQufbAWYzycnIYFx1SAC
         YcLpsiDsjl0mYRFAh2N6z8dRHI40iltWfYpdNHKgLnaANCk66g8jhgblnoBvUwQxyw/W
         qd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086292; x=1778691092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=auMvDAA4EUUiV2LAoqwSKoZ+PHY3ZmUuTegy7+23Vsg=;
        b=XBX8EdhiespscLGkk3V37ZsI0JwCPNXQPEiYGdICpJFi75nCTn//GtzRr2cHFVCovM
         1uDGR46u5WXC8UxVrFe+DoOvHbSAkoBFJEMqEu9c5kWk/hAU1khOsFl/rjQL2SZHjuHU
         EFO4PpdJDm2BmaSifK+L783RWdvcGEfEj+ASwAuY/4uMhnQYbqxJtI09b6eVsNNWL1Z6
         RR72WP0mDLgxm1oon2ktIgiZ8MBNY7KQOCtKXR/iBRDIu4P96QXoGbxRraoPcVg47VGt
         7PVMqs8LnuobJiCt4JwRb1woHEdZEqfCDn+/ZIAVB7l8kZ7x2wAJMJYqf7N4lmwAbF4E
         qX2Q==
X-Gm-Message-State: AOJu0Yz3UHMBTAiNmJWoMzUesNa3VaLC1BnfjONuv51pwYWXVDb432iV
	HguuEBAQWgQt1Ue2OpmdKcQ9fvAo4haY3mexE0j6qslcgzt0Q0kDk0ii1UgISh2Di4Md0Ul0hKP
	XKbFtz8zOBL4vNBCVa3tfacGr+PzMwSMhanYtqiSkdqLILDVSoqh+Nb1lVaLVfGT1C4Gp
X-Gm-Gg: AeBDiesKrelOEX6eYK7NP0f3rd1kfv67YggBUxXxuI7VwVtH5zL8wd1miqOL4KfhELU
	BgOsHdX4l21QBjPsVv0DwMuiiL2rBXBIUi2/XC/0A9GK7gIsT9dBMYdoyjyLHRWSs4kuuv/Pi0o
	0Z+78RcGtvJ9v/vAI++Kjup/m2TOD7JM0+Ks1lXbbmE1+OPAxhQkwzv5xwuqLoR+TetUKkg+hOK
	YRTCHjUK3cDhziONTtd/d8PBMgbGlU1S9TlZft0pdpJzmyuJtORp4vU1rqUvUrvNz22IYhg3pla
	8JwxIaaZxtLzVMtbL+MP5HfYvFQrgRexdoxmCj0sEDkJseObDwfkh3k8nD7tT8Z8VDZSpx9s3Bc
	clUIuvFMSKWDtG1mJkIKJqxhbBj7LDavmuxWWn6CI3kGpHxLAvs14a4xypbdA90SSPhkCEhzjYi
	jP6qTYj2rOcd0=
X-Received: by 2002:a05:7022:402:b0:128:d5bd:3557 with SMTP id a92af1059eb24-131a771cbb6mr1923317c88.4.1778086292168;
        Wed, 06 May 2026 09:51:32 -0700 (PDT)
X-Received: by 2002:a05:7022:402:b0:128:d5bd:3557 with SMTP id a92af1059eb24-131a771cbb6mr1923287c88.4.1778086291405;
        Wed, 06 May 2026 09:51:31 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:31 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 09:50:41 -0700
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom: Add Hawi TCSR clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-clk-hawi-v3-2-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=2076;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=Rc3wR1W/Ih5kAVC28sMokOrsrDcS78MI6o7/S/3cgks=;
 b=iOLr6NoF49SnI5ljBUWuP2OuF/tC/zaRawHEDrvrQlooGQgCiw9DmfI655ex73Px9oiTvcEbp
 pZ7MGAgRmAGAG8fao+x39DKcEESOCVNcJwYqu6JQ5qfhH2DP9LyqFKy
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=W4sIkxWk c=1 sm=1 tr=0 ts=69fb7195 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N79QfILmdNi3kVuE8ocA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfX4GYDEa2TgG+Q
 NheN+hBjnDvV/wJIA+v5Jcdh8D8tCx9lzCIVcgRhhMhcgGjUCfvouT1hQiLNb9r13Sm6oITcBFa
 o7dlb4W9Esf53nm/5bYEAfuxYlvbKQtPeRKpKiQIhnU3tQbfVEMGAYeSkwP7X8szrTTFKyqXgOQ
 fT+LFUF1SCE5GXgGAn7U+LaIZdpi+oSCbXwXZKhDVc7LNP3lAal/VhOrAyNpbCISO6ZyWehQdox
 B6fUj9s7NeobCXSkiosHmjbPzC2PgBfCYGxLnip/B/B051GhphE08LB8aQwhs0J55lMYLt4uINO
 TNQr8haIGZH0u9/67wXEYkuiZr4U8Lz+3JOMO7hzHRBX/N53Px+Z87grsrsIhPmvbPxRu8ODcLw
 S4nU4ZRo3Zmv3TLO9lL2X6e8QcuziGm5u1mg6+75ywvco6tEYtNpOF/2w9QCl3oUQJ4254YWfbS
 y9Dh+Z5fXpR57L2Hsuw==
X-Proofpoint-ORIG-GUID: PHw_ylE_1Mi7rO3MiIWl5bFwBC4dJm1P
X-Proofpoint-GUID: PHw_ylE_1Mi7rO3MiIWl5bFwBC4dJm1P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060164
X-Rspamd-Queue-Id: 104C84DE6C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106148-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add bindings documentation for TCSR clock controller on the
Qualcomm Hawi SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml      |  2 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h             | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 1ccdf4b0f5dd..08824f848973 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -17,6 +17,7 @@ description: |
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
   - include/dt-bindings/clock/qcom,glymur-tcsr.h
+  - include/dt-bindings/clock/qcom,hawi-tcsrcc.h
   - include/dt-bindings/clock/qcom,nord-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
@@ -28,6 +29,7 @@ properties:
       - enum:
           - qcom,eliza-tcsr
           - qcom,glymur-tcsr
+          - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
           - qcom,nord-tcsrcc
diff --git a/include/dt-bindings/clock/qcom,hawi-tcsrcc.h b/include/dt-bindings/clock/qcom,hawi-tcsrcc.h
new file mode 100644
index 000000000000..957bc5f75bb7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-tcsrcc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_HAWI_H
+
+/* TCSR_CC clocks */
+#define TCSR_PCIE_0_CLKREF_EN					0
+#define TCSR_PCIE_1_CLKREF_EN					1
+#define TCSR_UFS_CLKREF_EN					2
+#define TCSR_USB2_CLKREF_EN					3
+#define TCSR_USB3_CLKREF_EN					4
+
+#endif

-- 
2.34.1


