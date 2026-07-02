Return-Path: <linux-arm-msm+bounces-116096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0sPLG++uRmodbgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:33:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A786FC143
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:33:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MZviUj41;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B1KdItvn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116096-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116096-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9C70302CAA5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD1936897E;
	Thu,  2 Jul 2026 18:33:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DA233E355
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:33:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017187; cv=none; b=mR2NKTTdd0aOrAUaMMdga47qrhQdd2wvh+VvFwUPnSvGW1c+CZgDgRaojjqEHb0Hwim816fM0IFcm2V49kKmWQlRS2CiEVvOA548PMB6FGI5koEKeJTcYBsnDAQVnI+wpZ6zPhK8VlOvO5Wk83URSlRqkSMXJqYrmN4eThwitAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017187; c=relaxed/simple;
	bh=u296xN7DnqwT/c4wVF8FKXi5grt0EmOqRHqz4oSbztY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1dg7aH89LnjHWm4PkFBXjpRMuFgU/Wq8VZ66CXbW74CPLKz2ZIM8NSD7j5Lt2EYJHRatf4PjljhJXXW8SuKna95JyKOXPxRJqR/atf6ZxQ7d2rmG6Pc1DW/P4yS0H6y2UFSWLRaL1FCTABI4D2dnr/iep2CWSvrwf51D8FrcRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZviUj41; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1KdItvn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3TLj623099
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jj/d7NmRhn9U9+C0ZpDDeUtot908Z2SfLT/1dmj7J9w=; b=MZviUj410zj21sz2
	gWIpWJMtwWXYZaQkKutplRjDbYxAlcrwmpt5dGC6JHqhKbqdnDCNrSB+g2NNenGA
	baq97TARiAWDelmey2JVopOiw6wSMegQbzaosvvmNTHLbpCOqqEMPXNiCMGTg+lm
	8mlMUHqOlplGHQwWEcCeC3xMFTydZ2eAMolC2vt3xawPwRwITZDndA3tVQXcy4YQ
	saGarw6+lFRRFiBJR4F7x65ooVjaD2bEdKS4QWaSVULO4XgMK7MMlOr7J2E0DTkG
	89juzJd9bMf/TJot3xgGt7UMon7iN8uO4bAIFkQrn+44JBsguGAz4bLxXpbw6TSJ
	P/Tm9g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2519je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:33:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8478a1ec69fso2964661b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017184; x=1783621984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jj/d7NmRhn9U9+C0ZpDDeUtot908Z2SfLT/1dmj7J9w=;
        b=B1KdItvnfmaoMXp0kz+K/4+qdvx8ZruSZi9myGpefDvNIwco4RdNqlDsxhgEAwHa2M
         OcIWPlgOzeEJNx+7FOwsfegj0bV9IKJA9LAHOaR9Uk29dRCS/WdzPq8tn4uaaVn6NFky
         /KTJ7TINIl66L9x0wGwpgZr8Jf4/nR6ETgc0HExvACR2v/1RhK8qn2Cw352STaJFJlbE
         mQCA2JUjxJ3zzuhBJBMt+K7sp/vKnS94tz7OE/zZxO9pwF+dvWNVXMJrZ7YozjJX1PDk
         nLWWl3EOUihKDGHyYfGk61SSY8DZQJ5JPw22NlwZ+L81QaD4S17aCwVSifShvwwvytm/
         gL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017184; x=1783621984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jj/d7NmRhn9U9+C0ZpDDeUtot908Z2SfLT/1dmj7J9w=;
        b=Q1QG/snKkCBoPNGqqSSG+IAu+c+9U2ade3KoQMiJBkrWtYNjIlQIThzLmRjO6p4DL4
         +h4xPB3jqvyLaF94EWPfHmfr8bRdosSpxJ29neGp37xo00Men8mOPbdu2PHKsO6KU2QX
         55rync6SRDBz0TF7/6V55wjVIYxYA7M+iGdroTrTBITGlx9es0rshd5RLWEGYwLAvXQP
         gs6T+3xOGI5HgVu8XlgWTOk8giNy8FGBAnSvH5cFRB+bCmZTYOMy8zFQcEQdiVbpexZQ
         r08ql8HW97dozx4z4c6VFEGvmZQIMG0OIPKuFdJsas+qFYFqdX3X4Sb5gIwLFamf6AWu
         /GIA==
X-Forwarded-Encrypted: i=1; AFNElJ+IFqxhrIZHnRkKAibET2F2fa4T8yocZabz1Ds+jNLE7JbJUFnpXNHATr4oWvF3PIl801NoQAegN+l540r8@vger.kernel.org
X-Gm-Message-State: AOJu0YysCL89NRKm9YP6NV0Pvt7fGXr9aLyvT6fa5cz2HwkU10LDGtNb
	RXpqqBai2odCdDqSBf5eGUySWmIu6CY5q1TZJzXVJbw2QOh4+ugk++UYHqTi2QymRlDsuyDM6vK
	ByZVAf+Gqhzhs73e+vdAIpl9MiK57pRP1atX7jhG3Kj1XCPWTdEYkOVJi7mT3XvL/TRVD
X-Gm-Gg: AfdE7cnuHj6AsG337CHEeRcEYVPWSCWRBKv9r2a2HBQNClWUjvY1Dk6K2ZuXTPevsRS
	+nJxRZa3LJJtSG8coAJX7wqfB+DPxTlXx2Zz+nZJuimFd3EyIolLg7HZ2jpwh/+6z1VHt4HE6BD
	ibTyLr+Pwck77mo1cyMz4/mcBBIN0henjsNaEZehjyhyPWCrFuPZSuj96XYtSbGQuqC0VETbBEQ
	WV3XmAV+m/GIzDbvD1Nrmw+zL5CxKmHdgM/2hK5j6IwcXlN/0v435ISp3u0gacR9+12za6mVR0T
	irtiFGVgXQ0YNdmiPVfIY66i1+ym+4DJRBW7bN6bMlqEWPZty8X4jxkUAiqgyLbS27bC7PV96Wu
	6wtdO/IGdcK7EO9H6SQUTCyw8eBTYUuEkgi+O3056tQ==
X-Received: by 2002:a05:6a20:918e:b0:3bf:b6e3:fbe1 with SMTP id adf61e73a8af0-3bfed6117f0mr8444065637.55.1783017183987;
        Thu, 02 Jul 2026 11:33:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:918e:b0:3bf:b6e3:fbe1 with SMTP id adf61e73a8af0-3bfed6117f0mr8444019637.55.1783017183523;
        Thu, 02 Jul 2026 11:33:03 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:03 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:24 +0530
Subject: [PATCH v5 02/19] dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1
 PHY and sleep clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-2-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a46aee1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=z-ZRDpFp9XMTG1_t9IYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 6XMUpzZNbD6KM9nZFn28w_j91LVyHboN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX3nlhKLmq4x/h
 3qRwDsIZzJPYz1az1G9mNG/tyqP14QIBWUdFuVe7Ar3UMoIHHwcyQHj9d9/i5EL+8ncSsLTp/6R
 7aRv03lyWz6i4lkw7znSJYPrOHsBH7lLwkMkcqvc6/S9kHg/XCqSEOOM+FYdksF52C0jqWw6soa
 atJg5MrPSeKynlQDhGzuw6O+WhPtSCTpuInOJE+3ruDQNllEDjnmNHCw9dugPm1pVNh/24T9v1v
 fJU3KBswAqKb7bJgr33v8tIyGsh+bv8ZspW54yezk5h4ZobptCtvT3YoF4ryaLRh3fkRMYstaKT
 x/B9QpHhsnyqTgRFQmmap9Kw19jmajmCKlTV9K9GHoMora2F91sw/Ffcd3pndyOQUyomP139zrd
 sgtWU0jsYctxHOxLx2DUNIR/8VPjI1y2tzFvBGdkuOMf2e5TNKE8DaermVgN9fSSZsg2DzbtnP5
 j3ed6zOZvC0GJMbw+Ow==
X-Proofpoint-GUID: 6XMUpzZNbD6KM9nZFn28w_j91LVyHboN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXwVdWZj0qPQNM
 MegVBs8OPcaIJP1hSEQeytBdLrnPAU3fBdFh+xBmnlrnT2SEhK6g1LS4PItDSe+XW4JTbs0mOFF
 /VpUVjsLVGkf0zVu58tsNL5RTJLfKq4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116096-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 04A786FC143

Update the QCM2290 DISPCC binding to document additional clock inputs
supported by the hardware, including DSI1 PHY byte/pixel clocks and the
sleep clock, alongside the existing clock list. These external clock inputs
were missing, so update the binding to correctly represent the hardware.
This change breaks the ABI, although the existing clock inputs ordering is
unchanged.

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


