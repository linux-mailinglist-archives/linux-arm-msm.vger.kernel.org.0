Return-Path: <linux-arm-msm+bounces-111118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YFl6B6gMIWqV+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:27:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5243463CF54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:27:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bRmE5MB4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YxqKUiMk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111118-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111118-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 533823025ADD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C340C3BFE40;
	Thu,  4 Jun 2026 05:26:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E503BFE33
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:26:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550800; cv=none; b=BGc2wnQhZPjDrE5kzV8FGfM8xXLyHYm87zJQ/zTX9zCdCmxhoMgWl3EXHK9+vnthgLoVbdh2OB1dtT+VZ0SD6NUv6oPz5kLq0E5/VzvEa9xr82T4b7lYh4Jc+lCbuC+46T4dZxzZMovWJsAr6eHa3SJnyHL55ra1FFCE1AE/k0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550800; c=relaxed/simple;
	bh=B5z29ywrBKYbX7HkV5T+1ROTV9fAvOR3TfGmv4njIVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lWciqyr4rRcmvnWfAqlfe7b7AiHk06qGg4u7UUJbqPmalHEMT/JZRsTVpzhLeTH8auvuc/oi5Qg+7+QPOsx2n8uWHZ/mlOUxDeoMyD+w1lvOxn2enq2O8MA4qOT+jRrQP9tjY6pebJs/lIcJuE/71rEftqKf/p5xTeceTdZrbfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRmE5MB4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxqKUiMk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65452SZd1039343
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 05:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=; b=bRmE5MB4NDUX3mYC
	eddDc3+alG+LNsu50nSnawTmxqiT9Kw5IlvjUhhxY3sCgiErhkaJ8/UP8ZPHqtbi
	+wpjGriTF+PDLYOMgsIu1cIggPK0XC2r2Vmh/+DGYACwTWFX5NcOr9oP/KH7Sto4
	5VguRwM28dXHMJSByPz76EijkwrVvicVVE/7G2fW6HOqVzxeLAROPctZSEo1YyWr
	ife7tD1TnLHHT0XO2d6HWu1pN2q7Rgf0WUjDn32b+j/OoTUu8pgk9n4WPUD/TawM
	AdhtXoUv/IsHWs7c1bMXX+QD28NvsWRqk5bvwOEU8VL1ZOAAp379xsWva/fxzaLx
	znVEFg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8hs6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:26:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f24dcedso439408b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550798; x=1781155598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=;
        b=YxqKUiMkX1f2Rw3TT+qGXgclgo9Omk2EH72plE8t/bZnig+0v8RcqCQvZjpFxuf3B4
         Ljsp62ptXGwusdSsq95U1Tu4jo08OWul6wPY+r7Ls6WEkpCsQp5QvdZcFl4tOJmNyBJx
         CdvjnWmau/pKqQp4vnf1V763iIj5R0vSU5uQazVkOjJUaABWSg1GzvF8gZlL7LFcH1E0
         RakHVz6v/hr9kDw2oYkLO3rK90IzZmrn2nmnSw4GsEkXkgJuvsAP3UwYLrYF4wUUdiqr
         Jb8HjVvJ0NwRI93+f6dnAmZ8WpXghY2VbTM7XdG3AjRKD3dugw8Dx1mU98c/6C1lkkQG
         W6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550798; x=1781155598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=;
        b=N7d9H6kcOe83bCY1xO4TLDkXiJ8xdJYoFxHacCqbQzckxcgRRTDE3mGv3+OHNKe3EI
         RSQwJkrEEvQ1foFzwPmPMIrHFscsEZmpg1zjr47s/sKRdEq+iUU666WnFWVJHmwQmi/C
         gZQhNIpQYog+C4syYEj5KoPw+5/s/rfzS4m1ThAvuQkBcyymyby8tBIw1E4eFO8gcG4L
         OqSnpdhxMtn80V7gUkc6gwNHc3/IVlEba2Gg00Fzw7TdKKNVdQxiOw3UgEb9tV1lnVT2
         PP2a7zuexTctB+2BkSbeGNuTpT0OzuD/ZSJBrFcx9PRtLfTnS/h22PE2cS1L8f4BM2X6
         AfhA==
X-Forwarded-Encrypted: i=1; AFNElJ8J4m8yOzJT/O/0V178lkD6x8BFyqYOvFVgtwaxER7SE+J08oGjsCtqhY2lqX6wbG/1vbdRwcz17vmFFtPG@vger.kernel.org
X-Gm-Message-State: AOJu0YwwQjBPPTMd6VpwRtx+WG3ki8nA7nlmI31V1mkInRNT5YcfecHl
	lMZO5tRPvucP2P7506x+EnGoijdn/AjwscMzwAMGmmuLTBLfAp6oWAN14b3IBEoFv7ScxZFj7GB
	gP1buOeem0eClJ9oPCrbnAvoMgqn6WdYPCd5f5GT8GxQZjiGSehbdR1AWKtEkSb9owpoo
X-Gm-Gg: Acq92OHJMI3mQzrunYjvRPPBo0OcoUvHgreSbSgV9N0Foz1wsif9VlcKJfDA0iI2qei
	zI0z/4FXvlwBjESc7lzuxKEZaOiN2HPruXVk389rNH+SwS1028suV+z8bpZCPKhuBz89htkZGs1
	tD4EwUuu3RpUmrXkug1rVI0C34ESl3sW9vnPzyrpT20ELg1N+eS+FnqJwVBKWgBzGzUsNuEoKY4
	S+BZ32Q/OyPrX2rG3PidPk7JwezQDejJkqAEAl2dwk9tzq1cTb2KFaUWtBfhlrK+P0auomhCAkh
	0EmTs2hgYRJrJWUDSrX84gY0eBYsFFy8n8d3Y7U+QZ3qfhuegdj5cKs26KOkZ49MvYQhY6hU0EX
	DU1WfkqQ06F14zCf6Tx2Ip5NIsUPUjNUIp/CPPctcogirDbPrOFZIV5nOpRqdpp0=
X-Received: by 2002:a05:6a00:f0f:b0:842:670d:f6dc with SMTP id d2e1a72fcca58-84284e8e3damr6205875b3a.27.1780550798192;
        Wed, 03 Jun 2026 22:26:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:f0f:b0:842:670d:f6dc with SMTP id d2e1a72fcca58-84284e8e3damr6205862b3a.27.1780550797778;
        Wed, 03 Jun 2026 22:26:37 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:37 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:08 +0530
Subject: [PATCH v4 02/13] dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1
 PHY and sleep clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-2-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: z-wnkAF2SRGUS5k3NYFlF_UKD-luKhR3
X-Proofpoint-GUID: z-wnkAF2SRGUS5k3NYFlF_UKD-luKhR3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfXyekakiMfcUq/
 oRuJpMw3GgiTtu3uMiDE18PjjDQ6EDb/a0H54rOZ2+8Db1nxiBQAKBNY8SvB7/OmknBGzA+bZil
 qHc3dIj1QtlKl4Sr49WVq29xb+sXgjv8g0O1dK2UmhCJknOH74VGl4dZ/4f9wW2qjkeshQp+kOA
 UvmRM6qE3MfYaPu9Y1fSalXvMatu/p7Xd4w+tXDPHCPQFl123v2iDCpNdiUgI8JVd0L6zL6Az3n
 AhKVVBtKffLEqYW2kNg/nbnZCCDWVUt1rdFsdOj0H9vRAWaYqqq5cfe+Ybq/wj4trb6foaXKaGU
 fd+q0r+SHDeALa0IZUL2KrEjspaekZFlDt8YUV857qdDe/9Vl0/8BnwZOx6V39B/ob9zRg0E8Cv
 H7iMlXkmJg1N6VfJBBXqeQl5YI0Vs0oH0Cnpn+5hPPmg8n49tbO0446RlYKHmWKF6pEXyCixinN
 0+cW6DnaFDTXssr01Gw==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a210c8e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=z-ZRDpFp9XMTG1_t9IYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111118-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5243463CF54

Update the QCM2290 DISPCC binding to document additional clock inputs
supported by the hardware, including DSI1 PHY byte/pixel clocks and
the sleep clock, alongside the existing clock list. This is an ABI
extension, and existing clock inputs ordering is unchanged.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,qcm2290-dispcc.yaml          | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 4a533b45eec2d8e7b866c3436bfe6f80fcd714fb..24f2cce033f6e109b65a79553fba5295eb9adf3a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -25,8 +25,11 @@ properties:
       - description: Board active-only XO source
       - description: GPLL0 source from GCC
       - description: GPLL0 div source from GCC
-      - description: Byte clock from DSI PHY
-      - description: Pixel clock from DSI PHY
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
+      - description: Board sleep clock
 
   clock-names:
     items:
@@ -36,6 +39,9 @@ properties:
       - const: gcc_disp_gpll0_div_clk_src
       - const: dsi0_phy_pll_out_byteclk
       - const: dsi0_phy_pll_out_dsiclk
+      - const: dsi1_phy_pll_out_byteclk
+      - const: dsi1_phy_pll_out_dsiclk
+      - const: sleep_clk
 
 required:
   - compatible
@@ -61,13 +67,19 @@ examples:
                      <&gcc GCC_DISP_GPLL0_CLK_SRC>,
                      <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
                      <&dsi0_phy 0>,
-                     <&dsi0_phy 1>;
+                     <&dsi0_phy 1>,
+                     <&dsi1_phy 0>,
+                     <&dsi1_phy 1>,
+                     <&sleep_clk>;
             clock-names = "bi_tcxo",
                           "bi_tcxo_ao",
                           "gcc_disp_gpll0_clk_src",
                           "gcc_disp_gpll0_div_clk_src",
                           "dsi0_phy_pll_out_byteclk",
-                          "dsi0_phy_pll_out_dsiclk";
+                          "dsi0_phy_pll_out_dsiclk",
+                          "dsi1_phy_pll_out_byteclk",
+                          "dsi1_phy_pll_out_dsiclk",
+                          "sleep_clk";
             #clock-cells = <1>;
             #reset-cells = <1>;
             #power-domain-cells = <1>;

-- 
2.34.1


