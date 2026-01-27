Return-Path: <linux-arm-msm+bounces-90672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPLgG8N4eGmdqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:35:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D98DD911ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1C54304EA70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B814C2D0C63;
	Tue, 27 Jan 2026 08:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3Gc44rv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8eTHert"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49A52C15BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769502863; cv=none; b=CFB5Ci6tRblXXluqVv2tbyM+/VfSldDjtcXpSxroDhzqahzuvqz5kgZS6GhejFskZaOHna7KGN5t++F2JJwUuQOXxvKfyj4bBRq+erGZNGOv9faGdN2Mwxaxhx9EcvZcWbEGfreH5BKpRor8Q7bbk39YGFO1uBqHCH4lp45y5l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769502863; c=relaxed/simple;
	bh=KgiYdQUqBakVJIDsBDjsOZR0inR5/J6rWADeDsWJ9x0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RnM743oqmRJA0WUQpsvafVe69Al7rxyDa4A/xYi8Dv5TWK7kLNmX+t/TcbrhKXuTUFGIo5ZWUCjnxEy4y+0oq4xq2pTIvF3iGG9/E5ZVVHUZiKfApB3jQT3I+lqzk2ijXcNuvRz+7kp6vUtXphaKM+UMyPYfBuFdq/zXPkrWBOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3Gc44rv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8eTHert; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UDH83714705
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8/flXcGJ6PdTOR/uXnaHxrWjBMccWTnyDBQYBWiZNiY=; b=l3Gc44rv7o3vzE5R
	ZGziYlXyJ5NBtTLj5HvgWESkOqa99lO3NFeEYk/8JgCmQmEzGTfdaV2Hk/r1Vl+w
	Acyg0o6ot5W1lkE7eOiQmmiZEQtABjEqfX9fnXypO/bqS32dhr53dWbvfK1dpyBz
	SACly4vSbcTgVG08y/lU72JQWal/tkmQRQgGqup/JVuXf6gG0mN5vO4qbqfH75QV
	lqY2LgirPpb8FyzktU9BvzsRR4NgpH8hO5b8NC4LSRl99OCdj2eVSpnZHml5tAR8
	dRcwAL8NwfYEDlvORKzufgSAWjOAAnVbrKiEinAJBouzHtQbN2tf1Egz1/QOpaXu
	FbMs8g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0a7r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:20 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124627fc58dso9662310c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 00:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769502859; x=1770107659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/flXcGJ6PdTOR/uXnaHxrWjBMccWTnyDBQYBWiZNiY=;
        b=K8eTHertwv6DFEZt4TNexqYcgfrSBwXFmt5njlTEh+neBuOU8PPPAWRZxPIdlYLY0x
         kEXb7EFnKYNOudWIakN88isg57d7m3wLh7kMne2xOzj7TyvhRlZ7Kr/aAYnNaPgDnHrD
         zmmoN3qQRaIGtYAqT08nJhV5HuHyv0tQEx1894xibFIYGOLJM7ttHPyIs6mi78wKG75d
         8XltQJwRWAH5LY69HiAeFRD7nUAjMgVnyjmqiDXz8jWQ8iTnCqemPKL9rWQwVC5Qo1j7
         fVUwbvSpqPmFLI+tKVwtKw0MvHsVPrxdcUPVT43sSG1ocfOiX3EV/H+9e8WQ/tTVUhvI
         wnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769502859; x=1770107659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8/flXcGJ6PdTOR/uXnaHxrWjBMccWTnyDBQYBWiZNiY=;
        b=UtuOGFU2ntvusH/7l8+lwY08a+rXwti7P1CDbuaR4VVly0d4LvkVWHwTzG4cRUGw7B
         dMDi2pCYHsSkDRZQn9JxJ4fVedqDxpsA3vVVDJd7i52YN9e22KsybHEj37ukrFw+xcHD
         RJ+cRI3bkvKBqMd+UVqSvSSG1P1ZBFtsKcVfP9gD8hGpfouwtLcYJ8xdEyjwrHq7MnZU
         z6tWuGSqW/2L84916QpbU5WrbL8HQDK5dPbcjUfs6BHjjgRd3gd88d/8vVIYuQuAJLQZ
         8vHOGwX3PJf/wuLW8UJLidIzYt9fok42F0MUTIUfaUG2ePqImnrUrZe8iZ/HCYiNIWAj
         XZMg==
X-Forwarded-Encrypted: i=1; AJvYcCW3uMicAgL/dKgVWgtHflkryZxWF8RWW4i83IuLCFHayYU4Frtm6S8TqCXzJY/zxBlk+oKW/00h6Ji7UD9T@vger.kernel.org
X-Gm-Message-State: AOJu0YwUPqRrBO1CMElcdur4PMjE04IW2RcYoGraPU8kZv0WKK3jZFRq
	diArq6NSDes0YfiDDj/Ncb7M+mAyX7RJlWuNNb6byi/AGPHd/KTw0/1htOOjCA3aBUJHmjchp1w
	nmiHlPK7q80R6kOYtz3mn7i2BsJo2fjIvAgSakcYoqiQ0VKd3GtWI2WWYXgfmMO8CyLK0
X-Gm-Gg: AZuq6aJy7lTDQI4I3qIZVtyr1kpF9RZAN2GR0PppMs1feDetmb09cQRTecB6DJrH/ya
	REVYposX0qrxwx7gPqTTMXahn8X/I1y3gCn6/9kgJVXgQcechLvS3qDdiWzOLhzY2fqtOpekwQA
	/56rs3235JO++vaJF+9g7ns7ufpAFwFHzHkGuXBpAF7MpVwdKX/b1lkYjoo/L+3dGj4be36B+h9
	/KfERzblBgBaDPmU1JZUIr/rfhRF6HDCpeep6r0zqawbhXDrLjWiOCcyJsYU0XT95bqMk4j3n7O
	0bwYm5tqyXAbryDNOlqMx3uAWwfubUmj0rVg+ZDjFWoCLGZ1nqSfYuNNYgkXAJ5xhc41dz9RMhS
	fknZZTVueD4ltMrRaSAMKTavRN8r4Uq7plCFrsX8ReE7kAS5S+JHtpEMwEaCZ
X-Received: by 2002:a05:7022:321:b0:119:e56b:98ba with SMTP id a92af1059eb24-124a00c5160mr591595c88.33.1769502859378;
        Tue, 27 Jan 2026 00:34:19 -0800 (PST)
X-Received: by 2002:a05:7022:321:b0:119:e56b:98ba with SMTP id a92af1059eb24-124a00c5160mr591569c88.33.1769502858809;
        Tue, 27 Jan 2026 00:34:18 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90cda6sm21064235c88.1.2026.01.27.00.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 00:34:18 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 00:34:06 -0800
Subject: [PATCH v4 09/10] arm64: dts: qcom: kaanapali: Add support for MM
 clock controllers for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-knp-dts-misc-v4-9-02723207a450@oss.qualcomm.com>
References: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
In-Reply-To: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769502846; l=4445;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=VPUBF2+O+sFRwBRhwUAJei7nq5athZS34ZhMbl4Ri/o=;
 b=tb0w3C0Ah6IyZDUNAus8OoFxoU2IngMKGRS7mqMm7JndTF/FQJHWfTwVLVbbxriye/WpLacWK
 0KYFcJbr1RCDpigsO0z4H17a9I3RcxCByntIBh/89XNwkHWc01yo3tv
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: f-jePYSoWi3jGf8RdvXhRjIVouSWXPz2
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=6978788c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Y3HLYP14RHR0fgYgac8A:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: f-jePYSoWi3jGf8RdvXhRjIVouSWXPz2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA2OSBTYWx0ZWRfX76jk8gS0hZcq
 w/urEZpXzNaeLGqEfPU/0NQS7Bd0owIkPO3E5MV8fhWwBXqTN2RBCTUH86rODbQ4EOhsE4dXndz
 JiUxdGV85OPfBTqyoA7FRb5fHl6BF8/zYIsrt+/gE7+Ibh9H/oo1z5cYb/kVAeND6i8J0HwMkD9
 FcLnfQdxCVK5ujvOd7ne3V7h1LZZdZjrIBZas6pSA3C7MCX/qI81YnZIvyCDQxd1pblvtZBuwtP
 dDs2eBTbl7M52wB1EWfsbmuDkAmOQ/dfwJEFxWiHlROmmjJtISt9LXdEnqYs5Zf+NL3eCm+reok
 COwQOO5X65THJ50AJPl9QhSWPrflfSSkcIbYCDyXu81ibaSYQFQfHeY/YxJRpq1h4Lgvil2RZHt
 0vAvlanZSd2VbH2pnsbGrEKw+ZfKks/GBBhSbUxWb3SKSvTzgPag983wf3fvmHkDfD3U8C5bW8U
 ziDFPbokWmPOhhIdxVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90672-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.103.194.128:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,1fc0000:email,b220000:email,3d90000:email,3d64000:email,20f0000:email,0.27.41.32:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.26.219.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D98DD911ED
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, dispcc, videocc, gpucc and gxclkctl).

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 111 ++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 050d47691f5c..53e159a58768 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3,7 +3,13 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
 #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-gpucc.h>
+#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
+#include <dt-bindings/clock/qcom,kaanapali-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -1557,6 +1563,24 @@ aggre_noc: interconnect@16e0000 {
 				 <&rpmhcc RPMH_IPA_CLK>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,kaanapali-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,kaanapali-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x5b800>;
@@ -2532,6 +2556,46 @@ tcsr: clock-controller@1fc0000 {
 			#reset-cells = <1>;
 		};
 
+		videocc: clock-controller@20f0000 {
+			compatible = "qcom,kaanapali-videocc";
+			reg = <0x0 0x020f0000 0x0 0x10000>;
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,kaanapali-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&rpmhpd RPMHPD_GMXC>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,kaanapali-gpucc";
+			reg = <0x0 0x03d90000 0x0 0x9800>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		remoteproc_adsp: remoteproc@6800000 {
 			compatible = "qcom,kaanapali-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x06800000 0x0 0x10000>;
@@ -3073,6 +3137,53 @@ opp-202000000 {
 			};
 		};
 
+		camcc: clock-controller@956d000 {
+			compatible = "qcom,kaanapali-camcc";
+			reg = <0x0 0x0956d000 0x0 0x80000>;
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@9ba2000 {
+			compatible = "qcom,kaanapali-dispcc";
+			reg = <0x0 0x09ba2000 0x0 0x20000>;
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&gcc GCC_DISP_AHB_CLK>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,kaanapali-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>,

-- 
2.25.1


