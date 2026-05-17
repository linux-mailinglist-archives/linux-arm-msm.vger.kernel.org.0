Return-Path: <linux-arm-msm+bounces-108057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGNqG9D8CWpPvwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:37:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0D4562A3E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D061C3044819
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3093C942B;
	Sun, 17 May 2026 17:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyBPWDjA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpO7d84U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13BB3BB661
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039228; cv=none; b=cW3CDehpJprXpDqmjH8sscY/pj2k6etzRfZK+zSHBJxtR/i990JXmSKETm60haJKr4C4tNiQFcTXuZyS8BdqVLI/0/safzz/2pfYjC+tj9ey12CjJRljlNa0H7DUnWwXrSNAZq7zuspSu0s7PAj9cyTzdEwuaTZOQdt7RWqt71M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039228; c=relaxed/simple;
	bh=tJN3jwnDUiaVHC4/cDv+QG2aCiK9PqDg1hQYkAmyq2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxKoE+awjp38RvCODVEKk4hvXkQgM+nhDwBd0z51FECOIDJ3nBgX83ikQnkTugE3iEqXoFWbwNEE+1KpZfII5h9+ddfmFiyUhwYILiuqrx9XWOKuaUmUx2YbydtX8MMTWOEk1e+ljyO95VFU3xmz2pSStFNkhgpLU8CSS0A9RnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyBPWDjA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpO7d84U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HBuUm83779377
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jaHcN2Ua5y54bvsc7r6mYnRrx1xn06nYXzRuIAUB6U=; b=QyBPWDjAglnO2ePX
	/8qJotpBXdNG2miWoFRUHoUYYxmOcbo3pp/ndbBkGiSu9JkH07gAkW7PQg618omb
	Xkg5qZE43HQM98e1/QaZ/bZOy62Q16kEYC6L4zk+tqFiOk2n3NX1b5w8AhrZ6Z4H
	vESf0Z3R+WF5y05/Ap7SJ8uOEdObdKzfCjD1dcNebdjTbhkdMxq6SXNnbTvpoquG
	5vBeV4aB0+1flinWVgaXLdW0zADwz9iB1XkvS89j+oVOU3kXfHgS2dYq1+mF1Qw4
	Sov/EFQiq6BmnrNewjMlXjzoriczilbzvC7Qsqz9Z2FpGilWhjoOY/qRADoGRhmr
	GzzILQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qb9pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:33:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so2365327b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779039224; x=1779644024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jaHcN2Ua5y54bvsc7r6mYnRrx1xn06nYXzRuIAUB6U=;
        b=RpO7d84UKTG6WRBjj1iQuNdDceWZzNDmxU0TYO4ouKY2FnzemgqsB71rWO0GKToUDT
         kFr4vSLmThEE99upfjjwbXfOeeBbJZfyaXJFcVcVLe9106iy6Dwwbf4qMwwFvZDSyCmq
         2pKU74HyiTE1qNBPLiBxvXCURr2FQR0BvK4yb10Mf8CRzPK1+cck9cvGw/GmDn2P+9iW
         fk1lG4yGc3aRbUCn7ClEIkrSHit8tRu4SRvyDxgilPV/yljKWisjxgBDJGNEf3mWeOqB
         CYsGpiyoMWrYjsj+HK1CLGpDkiCgk/4tzoS/pqE5vrPlBDOqz+vnTEVdz5Ka0dXqWD0T
         Jm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779039224; x=1779644024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1jaHcN2Ua5y54bvsc7r6mYnRrx1xn06nYXzRuIAUB6U=;
        b=OkqEXvjI1PvfRRuCuwJVY9f/SsjsHujOFFNEvVC8y+McpTt8dY/p7yrYgzkVt2cdGA
         HoD2JKyP6BWf3OQglIJ9LLiUf1ubcQOTnQmkMIFR8sq7Hjke/WAAG/EbJ7sF00Pprzl7
         5F2YyBdRQIyB7aj71JQ8UZ3X4D4X8H5LC7xgUPfqdkv8Gil/L//DzwcqpUf0Z/rzK5t/
         oJF2lgNDh7O6FJjxA+/1MmS87oqz+9wC9Ujab32qpcjVG6N0v8BBvPQpF84lxsrY14Mt
         zrJ+2sSjodIc7iUyrUyckndTMWlqz/SdcAB88HLU6gerWBc1Qkt7/4XHaXMwACTi439X
         9dfA==
X-Gm-Message-State: AOJu0YzjAG8zOnRxqzBlTshO1ceKYI+nI4dcMEmSABMDR++RjNTRwhTl
	p0od8bcuq8rzVQVOOrtncIkIQtybjtYuGKBzNCwi7rmOWVU39FSzs0bmzaFhrVRaBOLv17FQCbc
	JeSMeam3g/r/phcVHRsl8Z5q0p1ySUHe1nIOue1K3WB3wHgiEwKerq7gBrrna0VkEqo5o
X-Gm-Gg: Acq92OEkENTWcNQNJzFn2YoIfrWgL57kXs4fYXP4tpbstDPaxTpp96JWCpJag5YaXf7
	sRiNugxsx77j7LzP2/DcFOaaMZz2+5FnQoUzdukfBIJWoh6F4CtNAB0m/H1b2/U4kAm5RfXXMjM
	W/uL8wGzqoVz25MDbkp8j5fWvhXdNIsK2BJbXtaWheXk+pyfcMIsDA6RA38zo7T7ueRpuhJr4+9
	ETR0TpzbealsorOwlqAqCMsrxpgKaktOfTXr3XtHX5ZWt84GTXG6jxjybf3OWvsDTpuS8XZ6H4C
	uYl0d2MUmiNuOuZChvNRFuDC2xGcSBZNIaeFNykqjUnRrflywXVjQz3mbzc62EGE6PXTJosu1Zu
	HE4bkPodH32HuxXKwLUZNdTUBnTIxhLykZkEqU7cNyqQRhDzxDiNZ
X-Received: by 2002:a05:6a00:3028:b0:82f:2aaa:c14c with SMTP id d2e1a72fcca58-83f18e770a7mr13311227b3a.16.1779039223554;
        Sun, 17 May 2026 10:33:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:82f:2aaa:c14c with SMTP id d2e1a72fcca58-83f18e770a7mr13311216b3a.16.1779039223108;
        Sun, 17 May 2026 10:33:43 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778c87sm11331567b3a.19.2026.05.17.10.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:33:42 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sun, 17 May 2026 23:03:09 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: glymur: Add camera clock
 controller support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-glymur_camcc-v4-3-9d00acffdbf7@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
In-Reply-To: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Dfcav9UTJXCt3wb3-512FBHacSaFcNtC
X-Proofpoint-GUID: Dfcav9UTJXCt3wb3-512FBHacSaFcNtC
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a09fbf8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3iLwGWznUEgL9WBE7MAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4OSBTYWx0ZWRfXxQ9Xt06WEUXc
 uX5s/OWgzF49b2NKznIMUJCjRTA7aykCJeSU2leLgoeND27184bscuk/amz1+8hYOVJIkDodjKb
 bZNG80Ph3Zkhk94eR5mLFgI+UlPfjv7nODYogLBWob9psejTbNjkgZMv4n0Lu8o4lR+rqSDhHfV
 8jITjRgwDxUNxICZg0RWuafplOqSv8qbfWDneeDr37gtvjPxHlz0F/gMxvmps5cuU5jiuYHjQgs
 6QI0b8uwHltfVVNvqr8gMG2Pxo0cHlakpiby0ikK4f0EdjcI/9inpME0mOfgStGdr7DXG4nWJsz
 PEZ4nHHlIIs+WqW8FZ0jkZ6DrFkDqkm9Ivt6mKqyl/jLv2SXgLNbmj2icxf9xBCIHJg3Fqr5xPQ
 wyp72NrGQ5Y3yCWAYAJS6BWmX7Muj5pzMfw+JEuAMLd1N2Bh0sXlgiT6vV1T5tlAiSacPoz/x6g
 ORS5p8mT9df17fYCTYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170189
X-Rspamd-Queue-Id: EC0D4562A3E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108057-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ae00000:email,ade0000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,a400000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for camera clock controller for camera clients to
be able to request for camera clocks on Glymur SoC's.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 0c5cb8532b202c29ea5fca6e65e714ef5b09555e..6f9bdeb6f3acab21a4fc13608116b591c80d240c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,glymur-camcc.h>
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
@@ -4163,6 +4164,22 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,glymur-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,glymur-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1


