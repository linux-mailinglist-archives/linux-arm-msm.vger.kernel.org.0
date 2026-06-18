Return-Path: <linux-arm-msm+bounces-113796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i6oQEWUpNGo1QQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 19:22:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B06036A1E7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 19:22:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lYLmyV97;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TFt09soz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113796-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113796-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F215630A6E9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 17:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC254D8CE;
	Thu, 18 Jun 2026 17:21:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2073C280A56
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803305; cv=none; b=Lr/Rtmwa/bKG7BAyvR1q7FR61TYP4hkqQkn1lI9S/n/cL2079WkhtyYTfN5POuJ0OZkMBBOFlAwFYX3y/tCZLUIiTBd5GWyWSDx4MkVf6P0HCmseSOtNqSjrzmQM0gfAvkH64f5qsOsocW0HryZAd2GrMSnT5x5ZD4VdB+saSd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803305; c=relaxed/simple;
	bh=dZMAQrXzPQSfxEgazyze2GaK4BtrNYhFJgHy7c6c8jA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uXIccdPC6mivfmOvEtU7jzO1QlWdAtGeQ9H2K/1EKtO35Q01hpbQEJ/V8zfjFD1q7+PfrTTozyFjjBBl6gdbKLq2HmfaTRn7srJAni3B3GHHH6Um+WDz2nrUem9wGCg6siwrYLPR79cuwVclGQmNbPexE49L+0Ish0OsduXtBIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYLmyV97; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TFt09soz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IHG9c22456378
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OnvnFc1miELZIOUjX2NhtVfiu0Or/TYF78u2hldVC5Q=; b=lYLmyV97ak/liF21
	1wrFaa3soXtgCMIS1eeVxnKC8f5G6guApWyvrqsi+GmbPBOz6J5tnVCOqg3xId3g
	1rw0/5S0Zw7kCQN6v5fGxc6wVV/Q4jG3ydzUQZTEGovRwQq8AN/MESOkFi8BKUz8
	69x0h0byutAtVcWeomN0YEV2e6LxeCH3j2URwgyJLb7bIQg+9a+CgIBaG4XWSy2R
	n3Lg6ySfntqgriDw7Mll5g3zXHwzmT8Zg/K9LbtbNC6OJop8HWelSmu0IiMmXro5
	36jgKqObbYBBvxqfzrXE7kpZ2Oe8qGPXMXMIlyWIlOr8sJqeKwwbwkjOxYQ8FhAZ
	CV5PUQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm228atv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b6f019so1347982a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781803302; x=1782408102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnvnFc1miELZIOUjX2NhtVfiu0Or/TYF78u2hldVC5Q=;
        b=TFt09sozsNJkpqCWwUlSFxPzcFunU8N1SEu78JwDDOdjJaQgIcjh3s2bVGTtIZCWX5
         3W6hiKAx5rTLPKV1/GtRt0pW+HykBHhwEAi3I718P5HntoGQPtkY0pwfWYwK2cGB4+yb
         D1s/PZ53W9ZwG8LyAYIZm1ogG3px2xpwPC8hW45B7CLW7Yqks3vs5+gduxRmHo7cLTm6
         NQjdQZoFx2D8W+UP1E3Wlde5ovk4c0Fvj3MoRuNBjqOdgi0mVHnIEFE9DQSCGQbsMQOp
         OAj+iXGglRZ2qOtYPcYVk28UOWIHD87/VFotNencO+D+O1Qr7lXEy/U11bB25jHrxtJ6
         /02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803302; x=1782408102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OnvnFc1miELZIOUjX2NhtVfiu0Or/TYF78u2hldVC5Q=;
        b=Hve4a6u2HouUDImJUDTgsL64dyYgQ9lDJG67Nhf6RcUhsubUFXjwggw6gtCuHnpi79
         /88aGKpwAkpQqUkGoh4JlwimIWin/bmOZTNEcgLqU2Qpcw0lbI1WdbbMRiGRu2m9BlTv
         iWncPX1XnBdtX9Fa0JPAGwDoFLEBHJXNfG+hq5ht9eArI6/BbeNaCo3zeb2NsbDeWWlt
         CprBgOxXanMZvx4Csjoq5tW+QMfg1aOiGe8xaJ3Zo7LiotXkoH2nmcNzmV4M1Rchraun
         LfzsEwUAYJdcmb2UfYjGMGYZAJRqHhPb64UgSRx0MkAEBPEU3hYDe3Bf+Sfr+g52pAdc
         TE2g==
X-Forwarded-Encrypted: i=1; AFNElJ8HKbxLNpc4HmTdY/thiiO4JVHNq7ub6CZLT+l7XvQ4GUZgIH1akqNjhRFBXQbAMoEGkgI3Q1FumMmGgiyV@vger.kernel.org
X-Gm-Message-State: AOJu0YwSLa+9GGGlpZSaMVZw75TUMc28pM8goIDAYzcTM7VjhTyyHy+S
	srVNF4mira/ROtfgD2K50qZbnEM6zaueDw0i8h51XbPik0vtcviVF7CJgSwswktU27rEbrQ8WCU
	zLHhjdemB37ngVLbuyE/aBAokyuCuSGNdRGn2yMi1B+zvybxM3reH2NEtpdWgtSAjVX42
X-Gm-Gg: AfdE7cnWPoOU38+SxO3VOlYMcacCY0fubPHsY0fzceDWmmUw6kzk7dMbGJvqNiw61A8
	IwTTl+BN7jckduDwIN2qtI5ETYK6dbeX3xGB31CwY94nuaSpxka6dsjhhVnJ46Re9W4CV13lIwp
	6zL1HOaUUPLqemFVZydab9XBeQQhlZ1RbKOrujYeGIDW1vX6TkayTyKpYRLrwrmIkO1OrnGjS//
	wKZYqkcA86HHng7yl5RRAYNXdZlHKG9Rg7I1rkpVrTlO5QEQ/6X/+XGbEk688LgwIxZkfsyT6J9
	I90uQcuGMpdrxULRk29XA0IELOUtP+llEKVoVG42FZpXK5BowvSQs6KFUHfRz+Jutp0e8rKRG+9
	TuIzxq/eRZ6udWXuJi5mAmeuXW7fNtcLpcvw=
X-Received: by 2002:a17:90b:4c44:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-37d15dd7f2emr450641a91.7.1781803302250;
        Thu, 18 Jun 2026 10:21:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4c44:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-37d15dd7f2emr450593a91.7.1781803301823;
        Thu, 18 Jun 2026 10:21:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm187129a91.16.2026.06.18.10.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:21:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:51:18 +0530
Subject: [PATCH 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-maili_initial_clock-v1-3-d6ede0352113@oss.qualcomm.com>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
In-Reply-To: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a342927 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=L9CrEEophHSVp_de_hsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: xbxq8BXtwL0mZwOUiII6EWb9pRlXlhtE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX6S4NVjcZuJCE
 R2Ehs/q9pZaV19HcDQqY1UEAU7ItWk2SP0cKYfwRZ6SIC7Cyxl7xmmAp7t4p/jwMsMs0zDhkifC
 6QmgiJPiWe2s6egRaEd3W2EgeihBJRo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX0tS+Epa4DFz1
 wNwURnzKTbp4n3y7wS1PxvXys6Bcm03GDQ3T+Of8aNDGII2aFge1dIlZKpmXli4gi8NLniPND7r
 e4tJI2Na5HW+ys9qSeWehnDzaMVujSJhOtg4D/zWCft2VaLODBkcBrkb4LjhRARsheapjokgWit
 VZPJzbb9rddD65qb7QEBWEKAXDHKS3oW1N7PDofWBGHoUFnm2J+epsXuCbbZqT09fLrrO8sEgLA
 /0XSNJSMsSCo3ryOQQY/j3DvAVD/lu4vHfMNP8gsL9JN5KGpjUJuKncaFrfXBtkalRT4eDWf5gi
 wYIzPth5wV90ZUeT1A/8JxFm0bipFXoz2I+gTzozfSX/BSGEqZfeoELBevK+H9IVRmgoKfmzgo5
 xR+Pe18zrui9PJ6XN+ugu+Et7qkoczGdtnDu/gpnEuxVpC0AsuvcjbSnQ1pxM0hd/SkQmhXw6Er
 tCgIAKixYQC/n+z09ww==
X-Proofpoint-ORIG-GUID: xbxq8BXtwL0mZwOUiII6EWb9pRlXlhtE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113796-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B06036A1E7F

Add device tree bindings for the global clock controller on the
Qualcomm Maili SoC by extending the Qualcomm Hawi GCC bindings
since Maili is identical to Hawi and has few additional clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml |  4 +++-
 include/dt-bindings/clock/qcom,hawi-gcc.h                  | 10 ++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
index 4f428c0f7286e83683a65cbe60b2cfeff67f5b8b..f0e8c6144697100588d68bc7c4f1d9822dba4cc2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
@@ -17,7 +17,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,hawi-gcc
+    enum:
+      - qcom,hawi-gcc
+      - qcom,maili-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,hawi-gcc.h b/include/dt-bindings/clock/qcom,hawi-gcc.h
index 6cd7fa0884f535efce90b60997662ca90cfb9b7e..9e0e382af3112b980997f0c7e223720517f12b02 100644
--- a/include/dt-bindings/clock/qcom,hawi-gcc.h
+++ b/include/dt-bindings/clock/qcom,hawi-gcc.h
@@ -196,6 +196,16 @@
 #define GCC_VIDEO_AXI0C_CLK					186
 #define GCC_VIDEO_XO_CLK					187
 
+/* Maili has below additional clocks on top of Hawi */
+#define GCC_QUPV3_WRAP5_CORE_2X_CLK				188
+#define GCC_QUPV3_WRAP5_CORE_CLK				189
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK				190
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK_SRC			191
+#define GCC_QUPV3_WRAP5_S0_CLK					192
+#define GCC_QUPV3_WRAP5_S0_CLK_SRC				193
+#define GCC_QUPV3_WRAP_5_M_AHB_CLK				194
+#define GCC_QUPV3_WRAP_5_S_AHB_CLK				195
+
 /* GCC power domains */
 #define GCC_PCIE_0_GDSC						0
 #define GCC_PCIE_0_PHY_GDSC					1

-- 
2.34.1


