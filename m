Return-Path: <linux-arm-msm+bounces-92214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HxOAfCPiWlz+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 08:42:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 733DD10C8EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 08:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FD5D3043BD1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 07:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D3E331206;
	Mon,  9 Feb 2026 07:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGjYhjvy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAWSP+M5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94D4331233
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 07:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770622769; cv=none; b=OiddarHvmciCaWXPsqIe/FD4/WlGqyD5J5r7R7c6QKM0Ak6VplmNe3xZn89O8viDhAO9FF24PlchLSorKO/vEtIM7sCE3w4WVw0DK5mWQlKsT9Dg7bJhIka2r58p1o1/xpRwRikoT6C1AKtK/oF3OINAQw/O9mY75AcFhWKYxCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770622769; c=relaxed/simple;
	bh=nUQfk2vRK7RmNvOhgADlDLNsxL1iz/YqC47c8KHIDeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxZMIhpK3mZjHATOXvj4c25sLqshXLMs9vAPgZqle1vkjuzGbxyacBTKIt3L0haQKpZJU6l5FTeaHYDA/l01yLknFKm1Isi7LVYo0as3s2gm5VZldV2X3AD4sUAGm7uS8q/Z2zmNqkxMV1z3c+d92NsRtmyomxfleE8XV4dMNPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGjYhjvy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAWSP+M5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195UmxP1633532
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 07:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eh7F7F/k1IN41RZ17DaqepO9cVyv4x8tO4uosyrhDb0=; b=AGjYhjvygqGHAoNV
	GDBDsSgeRNL4MQROHJKDqsi9ydTu6fvg4E7AAuIK7d9CfHtQEA/bYoDN3fdsNv6K
	x9oTpiQ8xuwF+XNv1pyafcbD9xWES+wS4LRAEY7/p7z++LOZuLuKKOCA4O00hzNS
	IRwXRQ9YlZ496ZAP7PwCucpKA28n2bHOZkLLthSXNnKtTuJDcDbkgfxQ6D9/SfGN
	D5/yRzM8vgtlmRARl1YG0coVh5Wm7OeX5RwocjQZ4z33i4Wg/WYOpPpOenJl7NmL
	uwLQ0/doevrLK6UaE/YJlVtAh7RsE1AyqxYL6FN0/GTC6YyXVWmMeOFv/TFadLdb
	3pE6eg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c6g65ahgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 07:39:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aae3810558so12736895ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 23:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770622768; x=1771227568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eh7F7F/k1IN41RZ17DaqepO9cVyv4x8tO4uosyrhDb0=;
        b=TAWSP+M5zG0B6Bk5zCfTbxHjxltOnT0CIHUK22kOc8QNXPDmk3n94VwNVKWhyUQKvF
         11skQn0UcJ5GIPbzCAalRlUMY+eIsNUpUufsGZNqoqyyFHnmxBRXKIBKEpLO9IKJcwIq
         +OFkiFG5pGvSp4NDxG3Mf13Ywmj8yOl65cWJT1v/obpQ0mXmMF5N3SKuKAFBUIKYgZve
         JAvDHHdBUlDsE+S1JFlNRj/EDf0lZ9m7DL0MP14HrHI4yCoD1BoWy0wKCCUYTMFQAW0O
         yprUh5f53REgNV8++PdQp7hBb0Fsj6N70YL+kPYeG9RkY12dT1aY3urGloTk5o0BBT/x
         2blQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770622768; x=1771227568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Eh7F7F/k1IN41RZ17DaqepO9cVyv4x8tO4uosyrhDb0=;
        b=HCunIrlKFjz7r8w0I8IoEKgO6Qh5UR7HBd9qdVzflLZc330/D0JJ5u7m6HITDaeLMU
         vkMd9Ja7vdAdb7SB2jR39XmsYGGWnkzBmXCMgvbYDQwNUr9/p5yFuAyBr5Dqh/25likd
         R1J34mOpjg+E8SOj+B5ldEWTgl7bCHRpvhKAibpINqlNxy0hTD59x8Tx0F1AWWwUWERd
         L2uVCzJpyOyfJIpvzEC2gZW5kqv1E9w6a8AQBiSgdzvJEN1y8pW8Gc1abf8KBmiVIEPK
         WHtyV9AUTXNiKsVzPGjFqsKcCLBoic8tRnpktIrxcv8hZ3wDzEIYlZhEh63zATikzhQQ
         hw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7LgQMayOkZKb6JjYy+O8FZ6yZ0rXVlLO5OYzYTtXrH8x1cSsABuj9Iw3kjWlMll/ebJi+WvQiOxctXM9P@vger.kernel.org
X-Gm-Message-State: AOJu0Yymnbx2tfir8ewT0aZgViUT5DMyrC4m6+ACWGz3d4LK/nAiuvIt
	kj5Cjjueboroi/Mtuznhhz6Gc+yGvFGgTBP39s1UP9OejYj2vM+NIoY0KJ2l+qDy9X406owA9+G
	FC1avZWqr5HekEtLNYRzN69DgB0M/+YlZOjBZVN8jZ++B3t0IvPd790epkhemyz8GMFND
X-Gm-Gg: AZuq6aJrbbSkwdmbRlz9QwBpygZbinZn9U4+xXSjxdWLGljJe1UjX3+V0PwX0wCuJYz
	SiAL+hzjGt7iToJWCp6VxuYn0FoigvqyS2gCCkI8AYZwF6bDOZLCqxHjjN6jp/igl74oLN2iuVQ
	G2joWcWq7IroCarhaKY0fmjlyQ0O8GXPThbH7SlP3+Gi8TI1uuAh3+2ucAlK2AcBsp1IAkzPF3Y
	4FG0VarY5fIWiNOxWQ0OisYeXH3xPVEWHL3Y9b3OoOHVbEKGQpnlNTC7nrF/9VaGsYthfoalNoS
	eodspbOzpJt4UmnAEyhLFnmh6YUKSiIxqFNopjc1qa1srdC066WTrV1DhKZ7tBLh3Du7PMXKESA
	oJ4Hajh76FyECbZTFJhE63U4H+aNJocnDg1ZeiEJ3/zFPAk5G3A5LYIxHt8xcWQP1+uJ9OOqeAf
	/P5+IMLPnL
X-Received: by 2002:a17:902:cf10:b0:2a7:87c0:2357 with SMTP id d9443c01a7336-2a95204fabamr89363155ad.20.1770622767470;
        Sun, 08 Feb 2026 23:39:27 -0800 (PST)
X-Received: by 2002:a17:902:cf10:b0:2a7:87c0:2357 with SMTP id d9443c01a7336-2a95204fabamr89362815ad.20.1770622766901;
        Sun, 08 Feb 2026 23:39:26 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c9746esm99023545ad.39.2026.02.08.23.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 23:39:26 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 15:39:06 +0800
Subject: [PATCH 4/5] media: iris: Add platform data for X1P42100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-enable_iris_on_purwa-v1-4-537c410f604f@oss.qualcomm.com>
References: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
In-Reply-To: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770622746; l=7218;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=nUQfk2vRK7RmNvOhgADlDLNsxL1iz/YqC47c8KHIDeE=;
 b=Wn8IBt7xwK8VrlwxISLotzv6lC2w74CyoyjwrTMpMUGiAWVmb+pvPhh77jNTsDWtYq9JhroFJ
 ffw/MjbtZ9vCtwDu569mKc+lNaBKc8FRTTvVjR1vh7CKR2OiEpXtAM1
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=GqNPO01C c=1 sm=1 tr=0 ts=69898f30 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=jfxm0zpEqxNMAX7I8EwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: hVZJqbXdubk25pS7gNLuvX6ArjzpO3pP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2MiBTYWx0ZWRfXwkkm4tDWVhn1
 BN0tmwmasyPFCyRLvds/G0D8A98TUBH3mSYQ6R6IMraY9hV22Fj7nYEyLBYTRgR8Nyp3BbtsaNs
 16Ij/BkVIMu5t+M0W4zzhGuJVbiAxERcH1k5JS2n1ee1ZXDEZxY46YRXOFwhP8kcQItv1riB26Q
 mznVcMMftAj/e2w8TWYIm2cfBEHHSIdcFo6qpFYE/VyVd814RuHgn4LJLugIsz8AmD++mFv8r+t
 jjB3TQCjjq2vEnCSiZ9G3Rfb6flSYktLUFtcWKz647uK/4LLVVJvBQRQn8aGDG4fDZpyWuyFJBd
 3O840H63N+FKZDyuWhk86V/szATmlLeET6312pR1brtuOQl7bbqsFrE3lEyZd6rEzlFL3Vd86ac
 iRar6XCcaO6fDg8MGB/JXghJq9FMVXYYwFZQCrQ5Lc59NXhiTRntYhpAsb+Jc1A9v5TTh0dpEOD
 piJNr5R6SWfyajo4CTQ==
X-Proofpoint-GUID: hVZJqbXdubk25pS7gNLuvX6ArjzpO3pP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-92214-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 733DD10C8EB
X-Rspamd-Action: no action

Introduce platform data for X1P42100, derived from SM8550 but using a
different clock configuration and a dedicated OPP setup.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 86 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 ++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 4 files changed, 113 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580eb10022fdcb52f7321a915e8b239d..2e97360ddcd56a4b61fb296782b0c914b6154784 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -47,6 +47,7 @@ extern const struct iris_platform_data sm8250_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
 extern const struct iris_platform_data sm8750_data;
+extern const struct iris_platform_data x1p42100_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..a9389f1b3ac5862f7bd4f4cb165648b5c6feb459 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -15,6 +15,7 @@
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
+#include "iris_platform_x1p42100.h"
 
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
@@ -1317,3 +1318,88 @@ const struct iris_platform_data qcs8300_data = {
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
+
+const struct iris_platform_data x1p42100_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu3_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = x1p42100_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(x1p42100_clk_table),
+	.opp_clk_tbl = x1p42100_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu30_p4.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+	.dec_input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.dec_input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.dec_input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.dec_input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.dec_input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_output_config_params =
+		sm8550_vdec_output_config_params,
+	.dec_output_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_params),
+
+	.enc_input_config_params =
+		sm8550_venc_input_config_params,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8550_venc_input_config_params),
+	.enc_output_config_params =
+		sm8550_venc_output_config_params,
+	.enc_output_config_params_size =
+		ARRAY_SIZE(sm8550_venc_output_config_params),
+
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
new file mode 100644
index 0000000000000000000000000000000000000000..d89acfbc1233dad0692f6c13c3fc22b10e5bdd80
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __IRIS_PLATFORM_X1P42100_H__
+#define __IRIS_PLATFORM_X1P42100_H__
+
+static const struct platform_clk_data x1p42100_clk_table[] = {
+	{IRIS_AXI_CLK,		"iface"			},
+	{IRIS_CTRL_CLK,		"core"			},
+	{IRIS_HW_CLK,		"vcodec0_core"		},
+	{IRIS_BSE_HW_CLK,	"vcodec0_bse"		},
+};
+
+static const char *const x1p42100_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec0_bse",
+	NULL,
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ecb9990af0dd0640196223fbcc2cab..287f615dfa6479964ed68649f2829b5bbeed6cd6 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -374,6 +374,10 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8750-iris",
 		.data = &sm8750_data,
 	},
+	{
+		.compatible = "qcom,x1p42100-iris",
+		.data = &x1p42100_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, iris_dt_match);

-- 
2.43.0


