Return-Path: <linux-arm-msm+bounces-106890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GRMEGCsAWoMhwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:16:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0EB50BBAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE997300F5C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE2D3CD8BB;
	Mon, 11 May 2026 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJeqE3k9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIJJtBR5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AB23CD8B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494555; cv=none; b=YWp0fssNfJCaV/hkC43IqmHD6UQgsVq0NeTAEU0/g9o6wgbjKD3V5le+yiJJGOC+XUe8ksbi18PCvJDjaJDEqQ07wBrsEB2KRwUQEH14/hWIcDB9bgpchfl7bixHEPQUHTXIIFkUXAUxXxsI3rk50/xCq+w1ueZCNpacGMvPD4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494555; c=relaxed/simple;
	bh=PQwfiPUZpH29nO1KNCnWHCoAUl6aQUPSe8oyx1INYlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AhEipysFkxnuljVUetHfwiZCdZIoM9cZMwhRfbwWAe6b9o2cMX0RIyXCNXRgQFXLFE4GddGf9sBcuQ6XDdk2YXL3uhBiDR92GU2zqz53nbVKzw2sfe9MSsM2zA3QJIL7K7zGbEO/zGE0RD5r7Q+R3f1B8npIbZWKcXjqiLpUpJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJeqE3k9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIJJtBR5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9INmv652808
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TOMMPQ5PSuTCwEfAhyKBQC
	Phv5nv3zvD7POq7uMHRU4=; b=PJeqE3k92KJOqu+CFR9iAQKKF+ItEoX4NVy+rp
	ABBrh+7lyKXkyhknuRUIIi69l+dt1OFVGRXM6UvQE1OcBehfeJxzXriiAFCSLbIZ
	3KckFF4q3q3lsyW6sUPQFC+fOFvN41r0XiiBqj7LwrmSW0evl3I/PZYlEWk+Rv1M
	+a2S3/Vf7fqVUzvuA3JDjvEq3LmS+V40G9ZxIqoM1Ndfsj8YWPi0/WmU/XlLzCRL
	+EsIjPVFgn0fjtZUCEdlhPKWNkNVf2hhmopNN7RKVe90UCnkC69daNa8QR85MwbR
	oZzRkJSPUykmPPURLoEN1F0Y5cZ0aJDfYfiDY1G/Ctp1vwLQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xu98bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:15:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36521936155so4325515a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 03:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778494550; x=1779099350; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TOMMPQ5PSuTCwEfAhyKBQCPhv5nv3zvD7POq7uMHRU4=;
        b=EIJJtBR5Mu5SR9h4yl8LjOHkjaagpyRgJgpTnvqwEop//4Xur7IOHAmK84ufddUoL/
         kNTIAKi9Wro82xSEGXUwSJeBkt9OoOiy/DLoJGGcZVZSB1CHtuHPQz+eK3XCg/zM/EJo
         1u960N+Sm4+m57mBAHcazyk1zaDvBMFjx1cHo1T2kYUJ0h5w6VTq+OsbEmcf7mEbAZT3
         0IADZdko2Xqk91OCeuoZ5f9UJsqsuWWuOmsB/uQCwuK2ytyunxvTFnGNfWeP6/cXZWEv
         ckVG1BctM/jnS7HkqRHQFnk3PQa1iGiLJ/zjvRt9dq95BGoUQ73VPibrOevae8orsBUm
         yWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494550; x=1779099350;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOMMPQ5PSuTCwEfAhyKBQCPhv5nv3zvD7POq7uMHRU4=;
        b=gO5cUT27Wg/SBEajevFsyZOfST8CcOoThOW2ntE+eLHUpF7apvRk9G7zSgbruKL1Hq
         pxoVbIuGtVaLbBcpp6b0hE7BkCnbfkMzR04HkGu4+zRtZOdWy5M0dljM8NeH3p6j5QTY
         sC4rP4o0KMScRq5c+6bM0GUpKVsaPAiarJ5/gP8Vwsyxs5wCqpXIwam8fiyGGfdpkmzE
         4FbxFRDEcxXcGv1Pq7enHfITNZLiuDUHkN9E2wcGSugoWcDgVn2CRM0WCJ/XAGdyKI5e
         U2v8bCQ4io1RSvUMlPFX0jQRWmtLTQsf03tHBNpnJv20QT3waR4MY3lkXXDpnGYrc5dK
         paTw==
X-Forwarded-Encrypted: i=1; AFNElJ8K4RMFJIVhkXNsLHTwaIzC4cmDDov7LPsUKBvVEhnAW+x9ULJOKmrsMX2WCW1XNFUajFJr4xf39r0RBPxc@vger.kernel.org
X-Gm-Message-State: AOJu0YwsvaH5pZbJ2rNjhF0IOWBr41LMCYAjmSSRZnuQW4qPq22RSxR1
	y8FW8c3hJNlyqpdHrZEqCBrTGw2xGPo05ef+USLOlrC2xdwvwNDhD+AoW1Ke1fwLb9tmzmN90Et
	YvK6ExP1mrlCqrPF8UZlujvH932sninsmhfR+asCy4uYhf7Q3zCzCRAzHxmsuP8vpqTOc
X-Gm-Gg: Acq92OHUnHw0NVz0OJs7Mxs8QBzk18H6Cb6YoDNejDsIKhfYk6TqhNKmevsnhZokr72
	+3ziH9MuRvo8LQV+hYDy9Cw2tZRYWNyfDOeOI/IbdSSBa0Aokr0/z3erAYjoA2MuuiQcWhdyoXa
	b9OrgUngr39p3hHtse3Kmdo8tzD5SJMKMNq1H8I3/W4x9V3WRn2b8nNpDlCE4ORbZDsYHagr9Dr
	pOe8nsJzCvHRy0sOVyN8iqncbaLCox1m3Hd8uqCb4RxwJ6E7t4wvEVqdMXZE1GXvmv9SCI6owPW
	uqD1HBwpaqFF90FseIQ8+7+hqiGtnjvMldwTlI7QXDZHD3KjVKT9T3hCF8pGXBQanDuUiE8JIdY
	xDvyrAXsHV5RK4y1uZsknb4xclqOAwPuau4zZF5XnuQU7/A==
X-Received: by 2002:a17:90b:4a4e:b0:366:4782:139a with SMTP id 98e67ed59e1d1-36647821b1bmr15134115a91.17.1778494550084;
        Mon, 11 May 2026 03:15:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4e:b0:366:4782:139a with SMTP id 98e67ed59e1d1-36647821b1bmr15134079a91.17.1778494549547;
        Mon, 11 May 2026 03:15:49 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d628474dsm7257148a91.8.2026.05.11.03.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:15:49 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 11 May 2026 15:45:43 +0530
Subject: [PATCH v4] arm64: dts: qcom: sm8750: Add camera clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-sm8750_camcc_dt-v4-1-eab4b6c3eaea@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE6sAWoC/3XP3wqCMBQG8FeRXTfZf1dXvUeErO2Yg3TlTArx3
 ZtCEJg3B74D3+9wRhSh8xDRIRtRB4OPPrQpiF2GbG3aK2DvUkaMMEkZ4Tg2upCktKaxtnQ95pI
 Y7RgteKFQat07qPxrEU/nlGsf+9C9lwMDnbfb1kAxxYJqUBIICNDHEGP+eJqbDU2Tp4FmcmBfR
 hHGyJphiQFxKSpTcaml2GD4LyPXDE+MoXvH03OGKvKHmabpA55GJvxDAQAA
X-Change-ID: 20251203-sm8750_camcc_dt-350a8d217376
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a01ac57 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YRkI6OSQ6ZkYtCvnlTgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExMyBTYWx0ZWRfX+ahQ2CBPVKZm
 4zr1mMkT97M0JOIXRQ0AifXT4YOJy9DA2lqjTnE92c7DRLeZwJG2hQvXN2vyPcEWC8+RjP5qeaG
 HYt36aYlCuM2MB/SI1Hbh4f8OkDCJYG8gHW9gLpOTWXjQUdQYo9TDg0J/nL+GAy2K7FK93v94V5
 MSa2vosstpE1bPOZWafSvcC0TCyyyJHXKVs7agZlmH6mDERtO92WUX+zDXQFuHmveojyAF+ixwD
 wrujLlJRWHdZbBqNf+MwyyAxN+jI1wySqG6aItp75/GcCdRGx+S8ctYoNF8DRO1diKNJQ0FqFGl
 sSIvNGXZ6NbimXYmmt82qYB+sLUDgWH46pM0b2EcsgAKaucrMjMOUP1UHCKy//naVQ6yMoXKjsU
 h4XEwufoAY1FvaGWnAifsw42IRwsDaXMJu8k7zsAjI+YU25Gi/exXa8vXYzvuS7jqb/1aSDGkgC
 v10E5F4YkPQYoY6WIFA==
X-Proofpoint-ORIG-GUID: cXci6dckcO8mFh1-Urh2OFeEEWUeisI8
X-Proofpoint-GUID: cXci6dckcO8mFh1-Urh2OFeEEWUeisI8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110113
X-Rspamd-Queue-Id: CE0EB50BBAC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-106890-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ade0000:email,0.27.41.32:email,0.25.240.160:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.26.219.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The camera clock controller is split into cambistmclk and camcc. The
cambist clock controller handles the mclks and the rest of the clocks of
camera are part of the camcc clock controller.
Add the camcc clock controller device node for SM8750 SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Changes in v4:
- Fix Stray space before the ',' in cambistcc node [Konrad]
- Link to v3: https://lore.kernel.org/r/20260225-sm8750_camcc_dt-v3-1-a19d3173a160@oss.qualcomm.com

Changes in v3:
- Update the Mx phandle to use MXC for camcc node as it is a always ON
  rail and can sustain this usecase.
- Link to v2: https://lore.kernel.org/r/20260220-sm8750_camcc_dt-v2-1-e4b7faf35854@oss.qualcomm.com

Changes in v2:
- Update the MxC phandle to use MX for camcc node.
- Add RB tag [Abel Vesa] and update the commit message.
- Link to v1: https://lore.kernel.org/r/20251203-sm8750_camcc_dt-v1-1-418e65e0e4e8@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 37 +++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3f0b57f428bbb388521c27d9ae96bbef3d62b2e2..dabff4518867df88d8e4cdc233ef6325635b7ae9 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2,7 +2,8 @@
 /*
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
-
+#include <dt-bindings/clock/qcom,sm8750-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,sm8750-camcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
@@ -2046,6 +2047,23 @@ aggre2_noc: interconnect@1700000 {
 			clocks = <&rpmhcc RPMH_IPA_CLK>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+		       compatible = "qcom,sm8750-cambistmclkcc";
+		       reg = <0x0 0x1760000 0x0 0x6000>;
+		       clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				<&bi_tcxo_div2>,
+				<&bi_tcxo_ao_div2>,
+				<&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,sm8750-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x5b800>;
@@ -2740,6 +2758,23 @@ usb_dwc3_ss: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,sm8750-camcc";
+			reg = <0x0 0xade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
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
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;

---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251203-sm8750_camcc_dt-350a8d217376

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


