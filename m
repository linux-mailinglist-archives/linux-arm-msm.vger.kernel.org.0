Return-Path: <linux-arm-msm+bounces-54279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27833A89016
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 01:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F573189B6BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 23:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C4F205AA3;
	Mon, 14 Apr 2025 23:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BV5OHA+N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F94B1FC7F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672941; cv=none; b=rwnqTwgZo2dvYfCRN+z0oZH61ajw15f+VSOzLxpoZ/vU0Z0cUBJtnh83KW7MLFrkvlg6jHrF/5A7I1NYBr/SWp77Itk70HoJyeLxgeaTUIv/k3uNKWo3Gy9gB35fPVPIIghgnoeA9A9HRPZx9BWVyD06hjF7IlMP5cIcae7OYis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672941; c=relaxed/simple;
	bh=2/EMhU+NqxnUmU9I5ZqfEP5bIJvKe/ALVnWTmcXBqHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rn4D/7kHXu9fy9fCimPQMF0bp8evK42DEjmQJLbbLv4ZmBu62YD0Vd1VaY6+SspTB+dUKI/Hoqf61IApBxtxLalM6LPFrfC2khwcEJTGLE9Y3TQfA4thN5NOq+06gdcgj1AxPSLb18RB/Ke7sIe9Po378xh4ujWi89nYJyZ6pMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BV5OHA+N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKdkDK025829
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3r+u6vzzB030wMaT0KPS+9594z+nQC40xkulQ9mf3qw=; b=BV5OHA+NgkT5xwQC
	N2kTxzsY5pH8y0HDNhM2+snvUXwJX0cLmEbScteuci+k6683Bw3+Er33rj95vv8h
	F/CEmT9AI1GW7hkGxXKDdYUtaYcZ2aXlgKDC8VE07cctPx4p7lhGYLJbRcsZPUUP
	v/B5SDFrjKOhLt+noLFFgQ62bFimhSqlhIxRhN1T5G8hgDc3yoCRuC9m/C803n2G
	WHdIgHH5rvHXJxgvrQBDG1nB5m3bX9omvxxqbn7N5nWQYYGtbfGXtbUPVH8tMmoy
	s5T8S46C5WAPgw1YQCEoTYK+5INUDO8UhTZPOVZWgGgfCJ8U8dLvhYVKH8Is/u5e
	2sP77Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj67d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:22:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736c7d0d35aso6089775b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 16:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672939; x=1745277739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3r+u6vzzB030wMaT0KPS+9594z+nQC40xkulQ9mf3qw=;
        b=HyT6ePM7yRSuNQmX8AhjLatnsmHbsxAlcLmVo8XtzCHEfD3IFJiScNw2QJpM0vsqrs
         WCaT1Ynkb9krlue4lzzxrcZlli3li8TWmO6gNCP3fWYUJxs9J8kvD7DXuivAvZ2wdCxX
         PLmQPPEgUSLzZr3H7/HFEQidTo3NMgmeZYVeTqXNYW6LUEQ2CharjFTqX+DaImqScET/
         MkzgjF2BzG0TG6p2W51xl5t07e0iyl9irQWjLgSfGhs3MwEgV5+dSrVdvZrjBwHP4bZn
         505YJve5o4mij8+8rwTthT9KJX+gH1/4+/QHCuUAitAUw6IX+2YAnaEHkp5K31v7P7f1
         a+VQ==
X-Gm-Message-State: AOJu0YwMcYjlxs453f0A8ALc/tGTqweqFA2DhiV+OUp93TWZJ4xC+lX6
	iodpb7he8GPfGEbjgz+b0AUOECAe2cQad1VkK/ouIC6OUxZA9hZLrRgF15QEkudSv/9Kzc5aEys
	9AUfmOTHroCB8aNg6K2dTzt+z9WvAr6qd/2hrehuclhHLLtjSxiBDDpPbr5u7w48/
X-Gm-Gg: ASbGnctTqKQGnSonh9vc3zKx0FE6Q2+yVULQSyx0b6O99U0H9ARGvTnOx34tGKE/9x0
	WlS2s8gR4mHyhLbGnkc4bL8TGbSf/YZbR/blI1OGJYlNGr4577bEvtehEASqlMsb4VgzHWIH9Hb
	x4SYawazgpzy7bTNho1gq+1bxtRDkUHfuR+SIjBW5FHl7X2Av2aJDUzedodD3IDbagjwSnauvQV
	5gxlYZj+gt1d4AQxK4Qz9eJ/Lb1ltYqXEERgbDGMDrc6JB/jYRLTge1GA6dxO+x7719SsZfGDKe
	OQ+jq0oCqQaDdo+j079wT7AGSEW/tWUpiM80Qe9ZjJG38abZe2JGahWD7aEW+rPNOP4=
X-Received: by 2002:a05:6a20:7f8e:b0:1f5:8748:76b0 with SMTP id adf61e73a8af0-20179946424mr19756587637.29.1744672938858;
        Mon, 14 Apr 2025 16:22:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaqJlewWArOqT1w34ez2AJMypmsAuhKGyK4qZqwA+wiE6R4JLg0tM0YTnPyLM8MZygxa813Q==
X-Received: by 2002:a05:6a20:7f8e:b0:1f5:8748:76b0 with SMTP id adf61e73a8af0-20179946424mr19756555637.29.1744672938534;
        Mon, 14 Apr 2025 16:22:18 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221c7bsm9746298a12.71.2025.04.14.16.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 16:22:18 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 16:21:53 -0700
Subject: [PATCH v4 4/4] arm64: dts: qcom: sm8750: Add LLCC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-sm8750_llcc_master-v4-4-e007f035380c@oss.qualcomm.com>
References: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
In-Reply-To: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744672932; l=1338;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=2/EMhU+NqxnUmU9I5ZqfEP5bIJvKe/ALVnWTmcXBqHI=;
 b=WrCHrXytUYfg6wuQFRnksvJi9qMbAAOpEezYN6gaBkFoGLhRN0EyuB5g80zakzMaeXqtBBVPp
 hXGPY6YArK+Cv9kIH8hSzZ6mqu5f+LIfVvsmb7pv19L1PFywwezQMpZ
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fd98ab cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Gx2GX35Bv4c8b2S2wRcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: ghpYbrt6qlnnLU8n7mKu3K9zst3cYZrL
X-Proofpoint-ORIG-GUID: ghpYbrt6qlnnLU8n7mKu3K9zst3cYZrL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=691
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140168

Add LLCC node for SM8750 SoC.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 612b99dc3c55495d06b3577531ec6996554bbbb6..5d3a96c6412095fd89ab1fd9a586fe9ad4dd7ee9 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3310,6 +3310,24 @@ gem_noc: interconnect@24100000 {
 			#interconnect-cells = <2>;
 		};
 
+		system-cache-controller@24800000 {
+			compatible = "qcom,sm8750-llcc";
+			reg = <0x0 0x24800000 0x0 0x200000>,
+			      <0x0 0x25800000 0x0 0x200000>,
+			      <0x0 0x24c00000 0x0 0x200000>,
+			      <0x0 0x25c00000 0x0 0x200000>,
+			      <0x0 0x26800000 0x0 0x200000>,
+			      <0x0 0x26c00000 0x0 0x200000>;
+			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc2_base",
+				    "llcc3_base",
+				    "llcc_broadcast_base",
+				    "llcc_broadcast_and_base";
+
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		nsp_noc: interconnect@320c0000 {
 			compatible = "qcom,sm8750-nsp-noc";
 			reg = <0x0 0x320c0000 0x0 0x13080>;

-- 
2.48.1


