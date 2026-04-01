Return-Path: <linux-arm-msm+bounces-101237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCcDDy+9zGliWQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:37:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FED3754AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B010306BD07
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 06:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A965F33C18B;
	Wed,  1 Apr 2026 06:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anrDKIsM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/5uemv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFC5330B2E
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 06:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025341; cv=none; b=PaMb3Ufp0eL5B8ZsvijW4Egct9C/BtPN3NArlwypK4eAjPte4IMk99F5qToYTylV8V4rrfcz4kguETWRsyR9NblBVaylX3ICNabq9nu/46av20dmlx89P9LYldNMuqU0loESffrQjWZqL4unrA2JtfGnZDkU+VtcVZ83BUk1DDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025341; c=relaxed/simple;
	bh=O/xzz3OyQHlZaY8PTjkJNEJgipL9OgU4S64AIcv/hgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tLwC9CQzAXOtMeN9L5LiEMARXCaqTpeOlfSY8dL9JyxamUas2kOP4NqoiWOkk4jV5h5gPA5396f53OeQHNI2fwQECJHu2sVK43p0SPWxqttWvCPJMsy+u+hT5Z9rdJhP+mmLPkS6JaRNiTuU9sq0yOn17RFn7q1XU0oK8GQjJ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anrDKIsM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/5uemv+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6315qm4W1831813
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 06:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3OkA6pQW3yk0X7dRpa6C7L1ZcGiFUnl8OuBCkto5yVU=; b=anrDKIsMUn3lc8gT
	hbkls5enrHxqpXutqJ9ShGi5CTl7UGm9/1nodg6PabVSfZAbr/tJyvS2iX0pCJvH
	T/0VK71u2jvvqrOqT1EQfmZsrSd0yal0Yw1V1a4ais3yCJ4Ali9SGYSEn0LFcCwS
	cNlxrTYOMcYmO6RV2HhXnF5qBAffpuLq6+GObHFEHEVysTdoMoMMwbBko69T84r8
	b2w+GpA8h6QsJ5G/JeWBaUPYfITpOve61t61sz0HsAJYdbHxpwIOkl+ZBI8hVzcV
	nOlI9fiIOEvDbg48PGTJOCdkFGG8pinjYnOJ0nsNFvnEJNiR79KF2qSDUsasbx7W
	aa0TeQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equcacg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:35:38 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-128d59030d0so26317672c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775025337; x=1775630137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OkA6pQW3yk0X7dRpa6C7L1ZcGiFUnl8OuBCkto5yVU=;
        b=V/5uemv+yHsl9pmyvPmhW3MER95W6oxEEMcFvaFhocHXuYrfWSwgCGnjRkqkM8Se3W
         GoGrUnEpX+aCei3xdaxv8F+AayQ5JY3u/L8n7QJtubzEkcnpGLZJMT7cQpzk0I480tzh
         Besy8Weh0NDW2Z8vkoZMe60voS0LPJFIR072ydwR9BGRaus3h8+Zve9Fi7470XxMgKcq
         zuhRckfITvogN38hYgaGmYn+nd9MwqtcYZci+IgxvSzEeBWKAyUfQSC81tcTzyfjUTv1
         sawhuxAegStKlH3Z0QvRYyA7OQFjDNyBVqBwYeftgdSyUEW7QfrbgX5FjTcJP7W2TuWV
         riCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025337; x=1775630137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3OkA6pQW3yk0X7dRpa6C7L1ZcGiFUnl8OuBCkto5yVU=;
        b=UkNA2Z1pr4X/WnW1Zy4jpfQfGy1GM2ReUhe+wFm7v1t2HCaR1SIICQJMx1W72CaAIr
         k0OlivcphQzgSwZOpQaULRTUMFghVLhYwc3hg/ntlK+TYg3cvP0C3Iqb1kZ3wBt+Ju06
         jx6gMlpQWBTK/opMSqoyKIai+OA0mUQobKB9X9+Mov2VewLFg35JlWecU/u8uQ2THM/e
         95NdJBfkQhuitUFKOMbW4eFmMIZoVZhnZO4gN+beHlGzdhDrHiJwkLZtahh/n7YnkCNu
         wNI/r3A3PXamF5vX8NyCwRqgI60Z6yWSG4DabuR6+k5eHk9H60FtRSRG4/3CK09jPST6
         8SKw==
X-Gm-Message-State: AOJu0YyE1WzaewHUUIQDGdDM1Zjmg13RAKnSsFQYb2C2MfIdI9xdyCBu
	PK/z3wHH2kOvHndqtcLOyzOWMU89sZyxicLPVT7NRck6xzp/bBfHLGu8m4/wwN7GhiuY0L7xS98
	4L0NKN6LZ+Hq5U5wLJk5t26L7VfB0HErH3xTEmsrDdVu5z5yymI8RAqCfjT1r/ljWf8T+
X-Gm-Gg: ATEYQzxuCFc7UL262aJxhwNAGx1+t3AoPypkNA41GCdPYQj8eHYyGkbwKP2honi3b/J
	09OvWI5Au5rSX6WKLIcmCMXRpkwoiyN6mnruShfbZZREPK9OzIX2EH2xN9MJyb3XUxUvIOeOtoR
	X0VHXbFXO4/zvQfnmljeHQshzdyaCLJ/BX/rDh0/u8oAmhQI+Z02bqpY0tPbRwbIHJyWp8gzCZW
	A6AUJxiJbb6lnXvvQTZyUHYxPq+qZ6dlccahwLo0SMDIkv85v+r8RrPl6ou19cpwfoZXk1cY+B7
	Qlxj9T4Ig2v9UYxYiVf8vEb44Z5wgoS6irlbGQP0UdfnPuzrVNiDeJ5hRtYB4HsPxovgHb+IgT6
	HQtclDFr517BhoIrY/4BnvBz9JbdEKRjRd+yqmmkmS5nDr8nAUDn1EDz7dqJfdSyZah85
X-Received: by 2002:a05:7022:322:b0:11b:ec5f:1c37 with SMTP id a92af1059eb24-12be64db00dmr1457449c88.18.1775025337293;
        Tue, 31 Mar 2026 23:35:37 -0700 (PDT)
X-Received: by 2002:a05:7022:322:b0:11b:ec5f:1c37 with SMTP id a92af1059eb24-12be64db00dmr1457416c88.18.1775025336690;
        Tue, 31 Mar 2026 23:35:36 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97f6994sm12027550c88.8.2026.03.31.23.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:35:36 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:35:28 -0700
Subject: [PATCH RFC 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
In-Reply-To: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775025332; l=11277;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=O/xzz3OyQHlZaY8PTjkJNEJgipL9OgU4S64AIcv/hgs=;
 b=qKO8FGxIRHZ/FW3wLzJyCUevJz5XtDyvZRBba7eoPWacGyFUxVLZQZfDvGf3+KRRT9ccY3OKS
 6g4Vw2jjMDGAhHXEwGlzRW58FLQA8dgH5OE8GBJ8iNWdDvxNALN9d7R
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1NiBTYWx0ZWRfXwZufaNpheCYp
 1vQOvqtbg3tPbXQAk024eIfoZp9O5MaJ2ZGGSDfsyyCTj6w/QOJPPhZ31N9Axkqz72t8csEwugj
 kt3HtYB/CSSmXAq6B9r/dJvKY7LgR5hbe7RdA/gpiHxhGDoWR2AJICanSjiLNAIG2UknAMxVOVY
 DsyybauhC/dDBPB2PG2mf0GZYvZuKSyG5+cFzMsn58r3fo0oRgKdm2lmwGo2qEosoD4BPyRscth
 vAu5hMIoJG1e0gCh4DXbngGOZDCaCQC49JpcdSoIhuFymJ4oK/D3uY2KLG4sTZwH1XSJBH3yXSh
 md8BWfAmXYfVFGBjpdMaZ0JUk97MFMDkp12FFZvBt2jie3f/8EUqBAeToZhxQ0mdmaFZume5t4p
 JvsrymaS6eK5AP2x/zQ+RP0k+v2bJidDVRGH7NqBNdkCXiZ5h3YawV4tB7KBxzTx5z70hqrEBtu
 IvyGqxuAk0nolrXvFIg==
X-Proofpoint-GUID: HqbFTCEqA0reRgtNsXe-sY-wQYX-rsVL
X-Proofpoint-ORIG-GUID: HqbFTCEqA0reRgtNsXe-sY-wQYX-rsVL
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69ccbcba cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=t2MV0Cpg_TU8-8Jkrg8A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010056
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-101237-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C8FED3754AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace local clk_branch-based clkref definitions with descriptor-based
registration via qcom_clk_ref_probe().

This keeps the glymur driver focused on clock metadata and reuses common
runtime logic for regulator handling, enable/disable sequencing, and OF
provider wiring.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 340 +++++++++++----------------------------
 1 file changed, 93 insertions(+), 247 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 9c0edebcdbb12816d1be5249e4f04bcaf02048aa..585f87b23af2d92daef1787b2f38911681c0d8ee 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -4,265 +4,115 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/qcom.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
 
-#include "clk-alpha-pll.h"
-#include "clk-branch.h"
-#include "clk-pll.h"
-#include "clk-rcg.h"
-#include "clk-regmap.h"
-#include "clk-regmap-divider.h"
-#include "clk-regmap-mux.h"
-#include "common.h"
-#include "gdsc.h"
-#include "reset.h"
-
-enum {
-	DT_BI_TCXO_PAD,
-};
-
-static struct clk_branch tcsr_edp_clkref_en = {
-	.halt_reg = 0x60,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x60,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_edp_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+static const char * const tcsr_pcie_1_regulators[] = {
+	"vdda-refgen-0p9",
+	"vdda-refgen-1p2",
+	"vdda-qrefrx5-0p9",
+	"vdda-qreftx0-0p9",
+	"vdda-qreftx0-1p2",
+};
+
+static const char * const tcsr_pcie_2_regulators[] = {
+	"vdda-refgen-0p9",
+	"vdda-refgen-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
+};
+
+static const char * const tcsr_pcie_3_regulators[] = {
+	"vdda-refgen-0p9",
+	"vdda-refgen-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrx1-0p9",
+};
+
+static const char * const tcsr_pcie_4_regulators[] = {
+	"vdda-refgen-0p9",
+	"vdda-refgen-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
+};
+
+static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x60,
 	},
-};
-
-static struct clk_branch tcsr_pcie_1_clkref_en = {
-	.halt_reg = 0x48,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x48,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_pcie_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_1_CLKREF_EN] = {
+		.name = "tcsr_pcie_1_clkref_en",
+		.offset = 0x48,
+		.regulator_names = tcsr_pcie_1_regulators,
+		.num_regulators = ARRAY_SIZE(tcsr_pcie_1_regulators),
 	},
-};
-
-static struct clk_branch tcsr_pcie_2_clkref_en = {
-	.halt_reg = 0x4c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x4c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_pcie_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_2_CLKREF_EN] = {
+		.name = "tcsr_pcie_2_clkref_en",
+		.offset = 0x4c,
+		.regulator_names = tcsr_pcie_2_regulators,
+		.num_regulators = ARRAY_SIZE(tcsr_pcie_2_regulators),
 	},
-};
-
-static struct clk_branch tcsr_pcie_3_clkref_en = {
-	.halt_reg = 0x54,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x54,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_pcie_3_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_3_CLKREF_EN] = {
+		.name = "tcsr_pcie_3_clkref_en",
+		.offset = 0x54,
+		.regulator_names = tcsr_pcie_3_regulators,
+		.num_regulators = ARRAY_SIZE(tcsr_pcie_3_regulators),
 	},
-};
-
-static struct clk_branch tcsr_pcie_4_clkref_en = {
-	.halt_reg = 0x58,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x58,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_pcie_4_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_4_CLKREF_EN] = {
+		.name = "tcsr_pcie_4_clkref_en",
+		.offset = 0x58,
+		.regulator_names = tcsr_pcie_4_regulators,
+		.num_regulators = ARRAY_SIZE(tcsr_pcie_4_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb2_1_clkref_en = {
-	.halt_reg = 0x6c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x6c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb2_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB2_1_CLKREF_EN] = {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x6c,
 	},
-};
-
-static struct clk_branch tcsr_usb2_2_clkref_en = {
-	.halt_reg = 0x70,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x70,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb2_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB2_2_CLKREF_EN] = {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x70,
 	},
-};
-
-static struct clk_branch tcsr_usb2_3_clkref_en = {
-	.halt_reg = 0x74,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x74,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb2_3_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB2_3_CLKREF_EN] = {
+		.name = "tcsr_usb2_3_clkref_en",
+		.offset = 0x74,
 	},
-};
-
-static struct clk_branch tcsr_usb2_4_clkref_en = {
-	.halt_reg = 0x88,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x88,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb2_4_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB2_4_CLKREF_EN] = {
+		.name = "tcsr_usb2_4_clkref_en",
+		.offset = 0x88,
 	},
-};
-
-static struct clk_branch tcsr_usb3_0_clkref_en = {
-	.halt_reg = 0x64,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x64,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb3_0_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB3_0_CLKREF_EN] = {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x64,
 	},
-};
-
-static struct clk_branch tcsr_usb3_1_clkref_en = {
-	.halt_reg = 0x68,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x68,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb3_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB3_1_CLKREF_EN] = {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0x68,
 	},
-};
-
-static struct clk_branch tcsr_usb4_1_clkref_en = {
-	.halt_reg = 0x44,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x44,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb4_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB4_1_CLKREF_EN] = {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x44,
 	},
-};
-
-static struct clk_branch tcsr_usb4_2_clkref_en = {
-	.halt_reg = 0x5c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x5c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb4_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB4_2_CLKREF_EN] = {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x5c,
 	},
 };
 
-static struct clk_regmap *tcsr_cc_glymur_clocks[] = {
-	[TCSR_EDP_CLKREF_EN] = &tcsr_edp_clkref_en.clkr,
-	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
-	[TCSR_PCIE_2_CLKREF_EN] = &tcsr_pcie_2_clkref_en.clkr,
-	[TCSR_PCIE_3_CLKREF_EN] = &tcsr_pcie_3_clkref_en.clkr,
-	[TCSR_PCIE_4_CLKREF_EN] = &tcsr_pcie_4_clkref_en.clkr,
-	[TCSR_USB2_1_CLKREF_EN] = &tcsr_usb2_1_clkref_en.clkr,
-	[TCSR_USB2_2_CLKREF_EN] = &tcsr_usb2_2_clkref_en.clkr,
-	[TCSR_USB2_3_CLKREF_EN] = &tcsr_usb2_3_clkref_en.clkr,
-	[TCSR_USB2_4_CLKREF_EN] = &tcsr_usb2_4_clkref_en.clkr,
-	[TCSR_USB3_0_CLKREF_EN] = &tcsr_usb3_0_clkref_en.clkr,
-	[TCSR_USB3_1_CLKREF_EN] = &tcsr_usb3_1_clkref_en.clkr,
-	[TCSR_USB4_1_CLKREF_EN] = &tcsr_usb4_1_clkref_en.clkr,
-	[TCSR_USB4_2_CLKREF_EN] = &tcsr_usb4_2_clkref_en.clkr,
-};
-
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -271,11 +121,12 @@ static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.fast_io = true,
 };
 
-static const struct qcom_cc_desc tcsr_cc_glymur_desc = {
-	.config = &tcsr_cc_glymur_regmap_config,
-	.clks = tcsr_cc_glymur_clocks,
-	.num_clks = ARRAY_SIZE(tcsr_cc_glymur_clocks),
-};
+static int tcsr_cc_glymur_probe(struct platform_device *pdev)
+{
+	return qcom_clk_ref_probe(pdev, &tcsr_cc_glymur_regmap_config,
+				  tcsr_cc_glymur_clk_descs,
+				  ARRAY_SIZE(tcsr_cc_glymur_clk_descs));
+}
 
 static const struct of_device_id tcsr_cc_glymur_match_table[] = {
 	{ .compatible = "qcom,glymur-tcsr" },
@@ -283,11 +134,6 @@ static const struct of_device_id tcsr_cc_glymur_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, tcsr_cc_glymur_match_table);
 
-static int tcsr_cc_glymur_probe(struct platform_device *pdev)
-{
-	return qcom_cc_probe(pdev, &tcsr_cc_glymur_desc);
-}
-
 static struct platform_driver tcsr_cc_glymur_driver = {
 	.probe = tcsr_cc_glymur_probe,
 	.driver = {

-- 
2.34.1


