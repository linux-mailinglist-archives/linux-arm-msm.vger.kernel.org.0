Return-Path: <linux-arm-msm+bounces-104600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RsW1KF/n7mkY0AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:34:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE43846D045
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58F6630056D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 04:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7F41D5ADE;
	Mon, 27 Apr 2026 04:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzCnZ3RF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4Pk57Vh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992971A724C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 04:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777264476; cv=none; b=u411pWb3XLHyzJqlU3yN14rzkLbvkE0jQHnVLoZiwbfM8ps9pf8MSByirtR3wAM/stPjlfu2/96o+rMGXtypDH9JxO0rx1WHE582+xpPdFobOBRLpNlIzvu98ywn8i19gc6WVd5PMW9Rl1milpg6w+Hc714KFNsdMBoG6qqRgZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777264476; c=relaxed/simple;
	bh=zcTQzmuJlYdHw5hMfp2prGplNw/pvEvdI2E4sxKO34M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CFfveQEA608QnTKdS2xzHf8/zjeIdv9/IjTn7512F5ffQgidA1Aiab1qGIoYIl/TmiazwH9GzY2FF2Dr5EwZxGDDMNVvkVp4cEi2yoQ09xtimCn6mvIUS/lV+Qky55NEBFhFN5cZPYlbDGW2w9LXPOLoFYfpI1kmckAawTmyrho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzCnZ3RF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4Pk57Vh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QNEpes1589169
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 04:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jLD8q0LRIBYBbZE3QmPEzx
	vL9a3d0LQZo1rCSFwbico=; b=CzCnZ3RFGBXA3QRqlgD2mTPWStTWAcNjf0oTX9
	Iqs+01hsbtVQJtgQfUelN4QcA1tg/PSL5TDwHcWbyl/owIvXJjOvBdBnFHOPNL6p
	WaHrXe5LRZKq1YDkr6u8utSCLTO1xfjLLu0HSZ+2yrVxOp9tk1n0x6xgqnMTJ23g
	kkx0dZuSD30vOmSdmo/+BZ2TG1N16MSqdfZAWo8qt3u9RIwThTcOe490eXZ3iP18
	ENsDPvpFw3wulVTrouu/PpwJruj7GhjDxyKa2UXPJOLdMpbDdPEQBhPOyGDIDLE5
	+h/BGHniGalY6/R1KIAm8P1Ll1DReabCk5SlkU0M31rfm4mQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4utamw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 04:34:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-362eb03240bso2662349a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 21:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777264474; x=1777869274; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jLD8q0LRIBYBbZE3QmPEzxvL9a3d0LQZo1rCSFwbico=;
        b=h4Pk57VhRqEvazhlAe2IWPm6eVa3KZmP4MGDEQkMiOaA8nAO0fKFCHW264Wjyn6VVk
         lqWkdtPuSTdjdVHwjNDPjuIzAf06bsp+QO5FthNmrSyjKW4yFqL0S6jka4aJsnaQvrYi
         CLwtXXvUrnKjQ6zWv4DbnBOcuUZ26zNor7VoKzoHGmmFtE8du2tYvrwAf2Nz/Reo8vTw
         hO9NdJjAyec59SJWNTjv9ZjV2zCw2xS3DegbVRku+Fo5NpLSNZXvqzvHxlQBYc6dHCEJ
         3SYJhUcNVHVqBNrk3vwLK92kYB/EoMMsW6VoOrr+9w3Mflk+YmIjK4my5svSJMC6J6DC
         xLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777264474; x=1777869274;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLD8q0LRIBYBbZE3QmPEzxvL9a3d0LQZo1rCSFwbico=;
        b=gEf5PpaDxUrBObXfEz/4g9ikZKeEy7Qso8Hmo7zb5EF0V21RVkndNoh6I5ubYJayvx
         DxfkZdtI18iJ9omfW+JMVWNom9PLE0+FLJq0UHMnWsjXAyCXr0ynqkO/CNN+ZGQjpHJV
         gKg30vZBuWYxXNLdLzevb6/qW8QjNt/jHXgBNmuYq0IEZGGHw0/ydr422D0Qbxu6VkyG
         DtStQHSe6WFVXAkF8+DQNJb73aNRSxRVwtjBll/KWjRpupP2M3/ZlJNjcsA48P9h5UfV
         5flgHJST49xc3JOzVpo4G0kGq/pqiXnWl7Dso46XXGRIMM/bYX+gUc7fnA+tmpMXBJe3
         vCJg==
X-Forwarded-Encrypted: i=1; AFNElJ+0zh7dyMr8YPc9nnOnFooA0ZTTzdZmhyEAkGbIzwLim/6kIqhVEqm0o3lgCyOnPF/uoFhvurtgbR29F0FR@vger.kernel.org
X-Gm-Message-State: AOJu0YxPWaq4Lb2Q9AqoyhRNwPT3RPU9LrZvq55EyUhW5ZxpK/VQPFCj
	iDh9JWAZuA8KgKQZI+LLkzCaUJa3EJl4YHMmp703pQHkNXDkAczDaaZskBYk7KT/pikkHZQrC8U
	vTUD2ErwRpxGv2rPhX4QemGWYyqk9SBr12C4HPh/zB4pRP/D0N/8F5ttosESp7FD/1vaj
X-Gm-Gg: AeBDieus9SMaSdeAleugvYL9cfRXS0zi+rF9V4X7dK3VVWGtGYE/kNNgPQtUBOtuN+u
	Q1uIRtWZVReZV9vTs1ov/uWZnEdcfZN93l/A1jNrEqjG1zwWTY9tmpVbmZbsJDox3ZGxmfHko6a
	BuZpoos2P38jXeuY2nnlbCRXS1tYg0/fAXrmjpmdShBZLQ9UxRf8uzXHR/JzkJG5TRnXqpFddZf
	abHU46wrp9lGccKdVgfEnjxdQsOFXUU6FmN0jRucFGUrNFn3d3XdqTjCQwYXHD8v3B/g79rNDJk
	WjIMUL0ymwItslG/XPth3QeeK/9ScsLFEyPkk2vHOBPo2mErfyNk9zIYOJHDRD/zJc4Q2/JdNhg
	j6syWY0hLfSoP2ug6QnKeQiDlbPJw9kAJrt4erudwleC7lnV+T5fTag90BlTRnzo/B1FOGprODz
	zvdHzd47EAFlEYoU2XIus=
X-Received: by 2002:a17:90b:3d01:b0:35a:cf:64a6 with SMTP id 98e67ed59e1d1-361404af0a4mr44267561a91.23.1777264474161;
        Sun, 26 Apr 2026 21:34:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3d01:b0:35a:cf:64a6 with SMTP id 98e67ed59e1d1-361404af0a4mr44267527a91.23.1777264473657;
        Sun, 26 Apr 2026 21:34:33 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fba1bc9sm11218560a91.10.2026.04.26.21.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 21:34:33 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:33:45 +0800
Subject: [PATCH] arm64: dts: qcom: monaco: fix wrong connection for the
 replicator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-fix-monaco-coresight-dt-v1-1-1707017f20c5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACnn7mkC/x2MSQqAMAwAvyI5G6jBDb8iHmoaNQdbaUUE8e8Wj
 wMz80CSqJJgKB6IcmnS4DNUZQG8Wb8KqssMZKg1NXW46I178JYDcoiSdN1OdCeScb0jbuamY8j
 1ESWr/3mc3vcDujfbFGkAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777264470; l=1219;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=zcTQzmuJlYdHw5hMfp2prGplNw/pvEvdI2E4sxKO34M=;
 b=ZrRfWo4oqOirHhMKnLrhRWA+MfOQJFwrLoJMwOLvU2clM10BTWaCDFpPh6BLyIuRnZKYAulKv
 WL515l5vK3vCq9pvXEkqaVNjlTtv4leT1HsmdBX2o98YI2rzeu9fRAr
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 0yo0cE0VF-rJcBQHNZ0erSvWmX50N1ul
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA0NSBTYWx0ZWRfXxlUx+OxiAUDs
 Ynn+S+e6der949BbuGrsGXnCQpsta/FlefbOdlYpt7R5Cp9eiTPT+UkoqmT7oFi/V6XM4Tjtin4
 xnPa5/bpt4mekkKOX4cT1sXn/ToCkSM1PjvtiakPksREsekU4CHZ6W/nKqWYNF0e0FONYW+ErWw
 mdtnkfw+SY7QSTr5d05cT35ShrIrbyHkwB3Ovwjd/j0+fp9OopAjUZ4KYU5q/NOSwW4zYagL7t4
 EVBZirtMr0Ft7B7q4hqgL89FUEfdi30URsum5cfIKfvRsuF8umRLM9vJkNXx3hax9VLC28UboNW
 6+GAdZhpZGAqcjEoWR9OopzMku7N7L6oBkpJmCD4gRQ6gOz/T/7mCV0/rxtpUvA+SNeuQlN+OPg
 PI+Ibf1odMTreoFP5bKd+e4FNLJla6+9a91JKB2hkJWMHTzoe7ExjiTQb8ynCvlELMRtiAgvL9F
 Oa9cm3zWjch1o7Wj6zQ==
X-Proofpoint-ORIG-GUID: 0yo0cE0VF-rJcBQHNZ0erSvWmX50N1ul
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69eee75a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1etcwcUoXHP-D-r6DHIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270045
X-Rspamd-Queue-Id: EE43846D045
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104600-lists,linux-arm-msm=lfdr.de];
	NEURAL_SPAM(0.00)[0.134];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64];
	RCVD_COUNT_SEVEN(0.00)[7]

Fix the wrong connection for the qdss replicator device.

Fixes: 0f43254763b3 ("arm64: dts: qcom: qcs8300: Add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..50fd8cea88b9 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -3013,14 +3013,6 @@ in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
-					reg = <0>;
-
-					swao_rep_out0: endpoint {
-						remote-endpoint = <&qdss_rep_in>;
-					};
-				};
-
 				port@1 {
 					reg = <1>;
 
@@ -3730,6 +3722,14 @@ out-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
 				port@1 {
 					reg = <1>;
 

---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260427-fix-monaco-coresight-dt-20d8d2c5b57c

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


