Return-Path: <linux-arm-msm+bounces-103809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id c3FMHdVc5ml6vQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:05:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F15D430841
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E1FB30B03E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2047434DB54;
	Mon, 20 Apr 2026 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCTvEwE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJD9ZGqp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147BA34DB52
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702600; cv=none; b=ruhMuAy33HvunVjcJzFXHPvgwffZGJ91yPLF+9vKU57Dnaybmy7aarcxQUOW0LHO5kDALFshOS9+S+QzT3jZ6df/IbtuNMV36ZV/hDhgAaFDGhu9tiq77t4/TIlo4oPDLQ1I2ohnknD668lZi+5UxPzKjISIeSuxrTavIzHsCm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702600; c=relaxed/simple;
	bh=gTZNOtKDnKUOv6o5sjbDTRiBE2xXCavZB3UDmODGIEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZbq1qh0hxhn4sImnCzejBm6wwQ0hHnpXCYCfMo0YdLK8rYDpX5JzjydOYCqPXAiWkHGeJ/nMm9SsaJlUZDmYTKp6Pp+KYRjmd1k0ZiV2r2DeiU1OnJy2Q6ongbQ4mnXwxHvPHNU4MZMOMLk37YqCQkRbFPKmq4VI6wtyyvIdyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCTvEwE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJD9ZGqp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFJnNG084433
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gw2GewNU2bxw0H7FSqVM34ZT9I8vF0lXH6p6A3gDyM8=; b=oCTvEwE05VtiJeqU
	WxWAVO+lOsDgBLF8vpJGAXPZe837qP+tlNlBKiQMoGqgecYi9FjCdZ+UnhqV6o/d
	vFdEsV1QUqt/N4cG1gJZDJb2PWFQPC2aZxSo3O8ZtSnfgj9HyuxhSsTFgWRN7n97
	TSWfjAJgYFz7WCYR2JQWuOLD55e/cevoMlNvjBxCAdyX+ZRWtS1diDYm3PndZos7
	JBHfAzD27/oSpUg0CcxsJgL4mbHkr9Yschubxf8+934RlKoRvafISpocifRTw2o1
	x5l5S/v/2dfZo3jizVK7Yu6Wrs47DPRl6ttbLcekuzuhVLLnv1WNPQUrzkr4aWzr
	lzReNA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81hmtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:29:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f74f0e3c6so2176107b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702595; x=1777307395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gw2GewNU2bxw0H7FSqVM34ZT9I8vF0lXH6p6A3gDyM8=;
        b=fJD9ZGqp2fVlrjStFAx1ehLo8ElvJa3GR2NhiIsdId9kdd+EvqafUCMD741vjfhTE+
         6NGiVDMKc6up6RM+YEaLFxNit8yiOk2YezLaPtvHYWCTRMD3obDat4jXZly4s3yyiUpr
         54hewLNrZW3MG752Dj6vXAE/UQ9IWdbw0YNq6ekJL7omvzIw3U5K0t0OGS8KG0x/BiHB
         m4jBLouNO6qC8ZObdmOHuYxCQqwVw65UJBb9hWzAlRJqY8MAvK78vD87Pvp/4x0wkhQN
         ez08crd6ALlpBAOc08dJLUA9bcMAANf/jZgJtSd0vfbyeOnAbsdana0uXRkqPprPVMQF
         hXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702595; x=1777307395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gw2GewNU2bxw0H7FSqVM34ZT9I8vF0lXH6p6A3gDyM8=;
        b=Z7ikZ6vz4NBfWsJpM41jstJaQL9mAYE9tLLsxdZ1iah3VdTSOP6ws0oRZVAepThvD6
         OE7nli0tfBF/M2+ELPy8dFCXLhHesmPreo81Y/28DUMXdc2jQSs8SghSEAtKQTUP50pt
         qg8XnKI68hlcCR0SMzuK9PXieqknc+go9HuuRROTXzalm6pqigp51qww6WA2vOG3GpVb
         jSIJzR0kLLH/yrQpMGRj6oYDIByyyyMzqVc1rL/k9CbFT7sP5r8/+2mvcESJ0yr+GGov
         8kNc443XOMN2xhglDM4tTb44GissduMUqH3kT9x9y73dkffzr10LZH7MbL0G8CrL7p2f
         ZIKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UU7pEVjBoB8ppJmSSRiW9YNNsr/d60aJ0DljgfWxtC6DD5TX5NmnTPTJWvBz8OWrJ0O63ZVg3zOKrNRfa@vger.kernel.org
X-Gm-Message-State: AOJu0YwSutKWeif9yyMmOlsG/jhO8rTJ4a3dK9fc3PLZLQpaM73ipECO
	wlQGY0hs15my1TgkF6fX2hEB/EPi03I1yr6TQUlO+8D3JkVAKKpnoU4fM6Xj44u1b0mnIVXHPeF
	8wy8DnhDa5wnK1+r+UopivQTe9XBXqsAvguoPyAYlwgdXQPAGirfYSuRVkNbF91/80DfT
X-Gm-Gg: AeBDietKgXU3gjF3OWVQI9U7PpUEtKdUfIJUKVxzSki0BBA0rTAFKpQQ9XLhwMpeN44
	i04qJ/MPId5UnPTCVOPZjA35Azna5kz866HwLYmoZgLOk3HXXXOBDdR8U4lYNHfVeojy7pyBed9
	zhgxBSNUedk5YKXTTYDDBbAT6PnOXecLeUHQoK4qHpnhsI1CVzj3+LehCv/zPGYOPA3qQhL5MNg
	R7IDlVi7P4RNQqrM08DJSVV/6eywcAnM884i4vkZhZaxQrYJPprndbCed3flzUWd2BQ/IJfmAZa
	7Wq2FKhtFjx6kzYKeUbUlprPz/1NJf+1cqxmzGicrMkM7Fjikbsoy7klprtMXoKx+I4eqUkUVC8
	YnAgXO2FSCSrl3O1GEEk5dWXjKR2VvEbXeaQPA4/WAbv4mu7SFdB4sc+HPbjstbg=
X-Received: by 2002:a05:6a00:368c:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-82f8c7ef3ebmr13956893b3a.9.1776702594249;
        Mon, 20 Apr 2026 09:29:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:368c:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-82f8c7ef3ebmr13956859b3a.9.1776702593711;
        Mon, 20 Apr 2026 09:29:53 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:29:53 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:55 +0530
Subject: [PATCH 02/13] dt-bindings: clock: qcom,sm8550-dispcc: Add display
 CESTA support on SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfXzDcvLEuLTzAy
 zlBQfBF6RYhMNvhsdcxxY21577qDCrLOi8zsPhvRcehg5FApkYbCVfuw9oqVbx/9ZbGUj6nCD1u
 ddRUzC4EV6jK8hAuoDueuNQ24mbKJwuirgnQc1zvqqyfB7d2SjD2wFzFkR6ELhW6+yq2ew1kNCW
 tdFVcJj5lK48Z8D2bS1hYMqap8eRcVmJPKX5sGhYF6aFtENzy3IYJZWLBAQ/M3JZjLB5wPvLRu0
 DbeuQQwV1ja/s68xgQ7NTYGJljq35vkDz1NfYc2earcEsEJbqizpOPlTpl7OuZW3OjgpWT29OtN
 8SF4P2ij8QwUPSVyjANZKhIbxxfGuEBZAz8gqdvirLv73AwNPD2eRdIMHhJOilHBhrhY2N/6k5e
 rPM6l3+nqUYj6dlHQJ8NtOw6KMHdmCstXeF7YjTn5uvEDeUz0EYSMCQw5DHuI2ce991m4sGr67B
 NwhG0kiDX2Att4u4aHQ==
X-Proofpoint-GUID: v8ckpJUAAvd53G7BtZgRW5PlqPxyOu3B
X-Proofpoint-ORIG-GUID: v8ckpJUAAvd53G7BtZgRW5PlqPxyOu3B
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e65483 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NZKN-6T51pjnxkzzoysA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103809-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,af00000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F15D430841
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On SM8750, a subset of DISPCC clocks is controlled by the display CESTA
(Client State Aggregator) hardware. These clocks can be scaled to the
desired frequency by sending votes to the display CRM(CESTA Resource
manager) instead of programming DISPCC registers directly.

Add bindings to allow the DISPCC node to reference the display CRM node
for sending votes to CESTA hardware and the CRMC syscon regmap node
which is used to read the frequency look up tables provided by CRM and
populate this data in RCG's frequency tables for CESTA controlled clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-dispcc.yaml         | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index 591ce91b8d54dd6f78a66d029882bcd94b53beda..3e049b2160a1781c866bb30b29f0da5c9e156b61 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -60,6 +60,18 @@ properties:
       A phandle to an OPP node describing required MMCX performance point.
     maxItems: 1
 
+  qcom,crm:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the display CRM (CESTA Resource Manager) node, used to communicate
+      with the display CESTA (Client State Aggregator) hardware.
+
+  qcom,crmc-regmap:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon providing the CRMC (CRM clock) regmap used
+      to read frequency LUTs (lookup tables) populated by the CRM.
+
 required:
   - compatible
   - clocks
@@ -100,4 +112,40 @@ examples:
       power-domains = <&rpmhpd RPMHPD_MMCX>;
       required-opps = <&rpmhpd_opp_low_svs>;
     };
+
+  - |
+    // Display clock controller node that controls some clocks
+    // using display CESTA(Client state Aggregator) hardware
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    clock-controller@af00000 {
+      compatible = "qcom,sm8750-dispcc";
+      reg = <0x0af00000 0x20000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&gcc GCC_DISP_AHB_CLK>,
+               <&sleep_clk>,
+               <&dsi0_phy 0>,
+               <&dsi0_phy 1>,
+               <&dsi1_phy 0>,
+               <&dsi1_phy 1>,
+               <&dp0_phy 0>,
+               <&dp0_phy 1>,
+               <&dp1_phy 0>,
+               <&dp1_phy 1>,
+               <&dp2_phy 0>,
+               <&dp2_phy 1>,
+               <&dp3_phy 0>,
+               <&dp3_phy 1>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
+
+      qcom,crm = <&disp_crm>;
+      qcom,crmc-regmap = <&disp_crmc>;
+
+      #clock-cells = <1>;
+      #power-domain-cells = <1>;
+      #reset-cells = <1>;
+    };
 ...

-- 
2.34.1


