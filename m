Return-Path: <linux-arm-msm+bounces-87005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6ABCEA55A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 18:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 335A0301F5CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 17:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D931C32B989;
	Tue, 30 Dec 2025 17:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="esguBiK/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAMyJGdd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489D632693F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 17:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116330; cv=none; b=h/LWa73YcD+LspTUK+8a55GgADrburkmvvHZyJENg0rjEU4yeITqHh5jpTE5bAtLbb5AjTqNYTvGFC3vDYSH9KZ2B/TDUnAYgX+EmiUx0WrZ6oGtippiWoJ29HQs13+LeSQe06DKYFDE6Bym1r2v2jbzIDeTqHsEMckLuB5DqM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116330; c=relaxed/simple;
	bh=jVSraBDA4jMkL4g3TO+xdE2H0nIGj+TwQt94Ayr2Z1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pW+/I2DckrKfoqfYhlVsbIBSserPIOVydr4+ViA80KJDQpj9K/1SqhfPBnWhXTrWInzSX1vO+RTbZPyAIn4KlxRuJSkNwFJgQ07P84emv0WkYqBcs3dQMdSt+upsE55ZLk5TA9glxshI5V9U2qyK7QqaQIbKYyt0ckIgz0KTmFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esguBiK/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAMyJGdd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDI4Wh2547838
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 17:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+zwSlpyRPuZwgBkCnYNj6F2CCLSs0ja/2sdy8YUqks=; b=esguBiK/Uz0wdw3y
	xjOQD+l7idccObUy1x9MVgiQAHbfLDcOd5UIDoAQipoe3rKBmsY2jzd5pZsKA5rG
	jrXPryjz66LqsuHgzO+sBysdlnv/3uqW3o7h4S/8BS9moPk/fi80NqowQg2sMoTF
	aYv3o9P2LlwvE9JW4bog1x/LzneBTguk2gQeiHZMUxMXtfrV39Jys+EPlxhrqGJO
	LKvPcd2ueftVimfya4SdeMNSLvZro1XUF/fcd1Vnz5PLWvcBopR+ljzkzcxt0iug
	4HVGLsHAfXMA7O+joL8VW+lDyUAhDonk98Dkucg7swYuZBkR5+vYkyFElWO3AsTp
	fIn7AA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7399uyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 17:38:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ed2so10622544a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767116328; x=1767721128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+zwSlpyRPuZwgBkCnYNj6F2CCLSs0ja/2sdy8YUqks=;
        b=aAMyJGddP8qPowVuoVTBv3KvJwZO39RUbhssGejsvGLEjLUCbRK44JczTsnVG5Tjft
         6T2CY8bTt3Hj9D7AxbX633TR0CG4sN8TP/LyK0hNZHXPdhk1erZPT38g9hSiQM7ZU5Uw
         scnS1jfa9B/EXHKjT5crfTJT9ThjHqdHR4cWL4ru83xNijoI5gw4U91DjEG7FOVGI7Sb
         WLYTNf5bNGVdu+JwT4rTHTTwBVqDtJFwJmZ2UYS0oYUBhNcKB414Lcly5L9LJ344Mtpo
         /4709URUzI3nA2g6Fih19ZSJIf4YIeieizayCsgUGW3ImnXBlg7HdeKB63YLMdGX0ppO
         RNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767116328; x=1767721128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+zwSlpyRPuZwgBkCnYNj6F2CCLSs0ja/2sdy8YUqks=;
        b=POOeZjH2h5GAyfYkoXtjkuldGA9S1gCJ2HHyvX8b9woDZzVFKTXEgzxl3HpJ9RoNnc
         yf8r0Arg3OZm3Z0UZB8gXsI8TsMCfJ7UxyYG7jgLLzNm6rvoUxuW7MkvUNzzKwt2+UFj
         37GDQsTMfrhuOAAyYRYraA0+jmOTGT0pAoJe1Tkq1D/2ApDVO8wgzHNn+T4gjosYb8HN
         mPxrS3vLFh/TWJnqH2H9sc6ahYMhIuHWXC2rcI2z8fIflVfS3eFDl2HCz1qhgLi6NOwq
         PVSuAFi5NQzXi5evi7HRvJOjyGGKCoW3ssP8MhPu27Md1u26xiHL0DSr+duYI+rSmbUf
         l4GA==
X-Forwarded-Encrypted: i=1; AJvYcCWn+W6jFlZXmdhbxKJ37vYUwnI6QTNGtHnQ2N2tft6YxZlO9Ka5TDbB9ZtRlYwOe1GyV/gl5W9PL6fcY/bK@vger.kernel.org
X-Gm-Message-State: AOJu0YzE40dX9oTgd8awe8sdrxOt4SYblZN6/1zySYjsvokyzb9lX5y1
	B72/2pIuJLJKxRjzMFglSiGZDuTAsEqLbja0LPYevUcIq0KhjSylKGDwvESEN+2DzUVGh5iBEuo
	O9CJgKa5woDzK67Kv2M843zVmQV7yVCHh7fLz0qIOKWfZpq3cP2cbqr19+X4yApvI/Wjo
X-Gm-Gg: AY/fxX5mZV711lMdythQYYXE7CK5RjuHEOLlbnz2rxeRwjI9pUpu/bksdadduvmLY+/
	6z1arakZGdug0P/xoQnZOYSicIfWFQDRpFrMM4gB1gXFCsaoZS+lhXCNFxvSXBs+aHY46eTxMHw
	bAtIwJ5JQBM4fYfnNz02tXxO+jCcaUwqpSUJCo+gQIig5Z3i9Rsxy8Ic+sRS5jD9vdpzo/b2FM7
	ZZW3sKj5IjsGu6I/nJOdmXD5CDJLYVtV50EDPV58fZ98Hd7wxc/hJzelFaOtedG1N/Q00j0WPul
	TjSqFHR4r+Jls0tgEKdcsQBZTmoQ5iqoT3FHMdfu8PN+0eywaDH6IwGw+CZcmYpVySr3GOlKpRL
	+2rtUnD+lOgEowT/Y4L2pQb0uUAf8HyL2Rw==
X-Received: by 2002:a17:90b:5150:b0:340:a5b2:c305 with SMTP id 98e67ed59e1d1-34e9211c3e6mr22916478a91.2.1767116327901;
        Tue, 30 Dec 2025 09:38:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjcIppQOp/lYW/6BjVtI4iBdg5KRUFk2bS5pyGjzca45pQfd8vpN3EsNQ0/dwVVWuPEzNpug==
X-Received: by 2002:a17:90b:5150:b0:340:a5b2:c305 with SMTP id 98e67ed59e1d1-34e9211c3e6mr22916468a91.2.1767116327454;
        Tue, 30 Dec 2025 09:38:47 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7af35f37sm32865208b3a.18.2025.12.30.09.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:38:47 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 23:08:34 +0530
Subject: [PATCH 1/3] dt-bindings: clock: qcom,x1e80100-gcc: Add missing UFS
 mux clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-ufs_symbol_clk-v1-1-47d46b24c087@oss.qualcomm.com>
References: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
In-Reply-To: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 4gOHtjqA9MGeMw1YpWwNHUB98XdBeVsW
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=69540e28 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=05vd4pdRr5DbID_KwmEA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1OCBTYWx0ZWRfX1M5cN+98NQ91
 aFkpuf0jrsRWJqYpDYujnL9mCTA3DOCJ8ycNDZ+Z2KT1ek+xkZ90/ptjB/S2QrwY2yci1ZNG/oV
 UI4GyWJjp6f9cNG+7k7Nx25tGGNmGIfspzSc3hGsImuX8Xht6ibBKSUHkkzaeFJTLDlPvyM4pBF
 jROWhISd3a9rw/0/3brC0hB1ieHdtV0/Ifd+awOz8Ht3/1fIPWkAT+eBTC0Y866g4za7RQ3A8Bh
 yPxa4zuzOfTEiagjF9RcXP+kSR9+wYTanIbZ/ExBU72i2s576JY1vxzAGiG0lEY7YGATtOOJNDZ
 lD6AiLPLj3uBotcc+EAsNpPSWMtbG5Xtqxgc+CrLzMdPsnf9l4JRlftOUh7w6Uyc8I4FJGjzq9z
 9g4axMk+CQcMaedDvvQWlz//mkMJdGF4bQShhw1RPzuOJ4lfbmeTDLtGgjTkR3Nx5GTEZSG6jfM
 7Hqweyu7B6CjUOUAHjA==
X-Proofpoint-ORIG-GUID: 4gOHtjqA9MGeMw1YpWwNHUB98XdBeVsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300158

Some of the UFS symbol rx/tx muxes were not initially described.

Add indices for them to allow extending the driver.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml | 8 +++++++-
 include/dt-bindings/clock/qcom,x1e80100-gcc.h                  | 3 +++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
index 1b15b507095455c93b1ba39404cafbb6f96be5a9..881a5dd8d06f924a4627db5f8d17ad147a1011dd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
@@ -62,6 +62,9 @@ properties:
       - description: USB4_1 PHY max PIPE clock source
       - description: USB4_2 PHY PCIE PIPE clock source
       - description: USB4_2 PHY max PIPE clock source
+      - description: UFS PHY RX Symbol 0 clock source
+      - description: UFS PHY RX Symbol 1 clock source
+      - description: UFS PHY TX Symbol 0 clock source
 
   power-domains:
     description:
@@ -121,7 +124,10 @@ examples:
                <&usb4_1_phy_pcie_pipe_clk>,
                <&usb4_1_phy_max_pipe_clk>,
                <&usb4_2_phy_pcie_pipe_clk>,
-               <&usb4_2_phy_max_pipe_clk>;
+               <&usb4_2_phy_max_pipe_clk>,
+               <&ufs_phy_rx_symbol_0>,
+               <&ufs_phy_rx_symbol_1>,
+               <&ufs_phy_tx_symbol_0>;
       power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
diff --git a/include/dt-bindings/clock/qcom,x1e80100-gcc.h b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
index 62aa1242559270dd3bd31cd10322ee265468b8e4..d905804e64654dc8d01ab20eb1106cebf6e54b0e 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-gcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
@@ -387,6 +387,9 @@
 #define GCC_USB4_2_PHY_RX0_CLK_SRC				377
 #define GCC_USB4_2_PHY_RX1_CLK_SRC				378
 #define GCC_USB4_2_PHY_SYS_CLK_SRC				379
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				380
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				381
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				382
 
 /* GCC power domains */
 #define GCC_PCIE_0_TUNNEL_GDSC					0

-- 
2.34.1


