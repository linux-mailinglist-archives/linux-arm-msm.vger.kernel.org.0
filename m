Return-Path: <linux-arm-msm+bounces-97379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIuTDPTSs2l5bQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:03:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A20FA280286
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EB063072476
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42244387567;
	Fri, 13 Mar 2026 09:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0vDKuNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gq4C+D9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D9A34DCD2
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392586; cv=none; b=BnjxoP3RLdNw4ePtcX3Yltse9qpHgHxubObcgkRNQBXH/TtfTBqDmwqZTPJ2nt7j+cQo6HHQZlZ2Vynp8nALmmXHnCPiGHhjf3AHSDEW2uvL+tpZS7kfIB9kKSYgwMwvuT6pCT/Y0ZMnB5GcK5sdOBldB9yUiweIEvFKl4iUmsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392586; c=relaxed/simple;
	bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ei1fdiUHYRWuEvO+Ee7H/INohRYQtVVetJKXYpq3P4V5ViF74213ANogT4XVGVS/6nqJzEaw8r4WWaWF5/4WunFzU6Y3h2h5hnues2Awx5BMmbywFOzjFHOBOO3w9XDbk8vTgAozMo/cG9N54yQIdlWoxsbz2L/Ud6RgXD/Qot8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0vDKuNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gq4C+D9H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tfQ31574644
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=n0vDKuNl+IOtEaYG
	EBGvgVYeVY71ct51G5mLn78Prteo/suCcPjzVYKx03+q4NSOrrBIyED0zu99gus0
	ZTHa3sfEBzncUNa+1OLXPimH25lc90B/6q2b1lpgCWQfYKPqJpJge2qija8b/6BW
	D05+t5mneaf5wspe1IFVO5w5ybgQBfYu9e1zeVyqBG7ECFbULmPnSYjZqOqk8kix
	XiiHGc09Fqfh5RKtzDYWVGujENJSd0vBoLnEaCL7RfU3zMzV3Csd5kN9X0kUuQiV
	Vxy16Sn4YwbdstfKkU6PFepucR4+yQ7D03I/FX5mssSbIwtZaDD8t0tFhyrPrlBR
	Q3cUpg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53nbmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:03:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e425c261so2191961a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392583; x=1773997383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=Gq4C+D9HUkzc1C5vnW2pX47bSUhBg3wos7buLEs0WkPZqe1KpbrwEp43ntR574sXPc
         h7BCqwwwSjlMT115qaIYchZW9OX38ZTSM+Ra3glitZpYo/D9+jKHH5WLBYdmT6RANrmm
         yVOtLlUIwyPuWhbPDaEKSqyZqRuMDugXBOuQVmOuqclR+R3qlU1FFBPSNUIFCDcMtKNY
         xKv8QzpZq/EOLoTUYfLNlSyCasdwNOe4QGHGfmiErS1WcDxtUJ3NFZYgpxDsYsQAfQ/g
         vJ6ifmTHjCV7sySwKXSaMJD5ZIcKw1sYXwYa5uLKxFE6DBC0VQyPT7zHdXVvlsqtVmg5
         mcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392583; x=1773997383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=LguaZZ/pnpUU6eH2p55JQW7mMkL3F6X7D17JzabtBZfEGW2IW4pkL3JOC82iw0wTlg
         KwlIunjm5ZgxH1igzOrTnWo5bbZMN0BUAUX309oYqNqlwSPU3xOvr+ACeZNQHhzIwcaG
         jY9v6Ekb7WP3kdhP014Dtco3El+vfkUe4HfaQ7rAuDjOrEHiLMwdpM4/W4GkYTrv0kmj
         vyHgte26O7uimeYN5I7voJGdm+xnbAfnnrjy3L5flBMxERyHOrfVeldXJhDaTSLoon45
         TDEiGAccMUQcbELaa6JDGpqGb89LyH1yq/PqOkLtp9P2TAmXbVDlMgyEfjjo+1FbIKfn
         zPOw==
X-Forwarded-Encrypted: i=1; AJvYcCV8An/k9A/L3hhSWZWfptBJgn4guWUehuC9l9jqh84tn7Wlzf34yQWlW49t3rjQtaCvBmeRBde62szEfRag@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4dqgYT57pvbV5VeX4P0Ge20jiWhPIWgQBACg5TmtYK1WWa4jI
	2wPyJF5XTLIHHeeBe61iyu5HVX4df0Erutp2xeDtl2jb4a+R/a5w9qVleXgDohULyBZ0dZA5yhJ
	7HVXpbkTboD3/Xs7hFztEyaDrrwdnH40EpH/3oc1pQ4CHuNsD3l91tQCgr6vFO0+xmQsAr29vy3
	Lwa5Y=
X-Gm-Gg: ATEYQzy8LBnhHKEzEYEt1dRxL2iJ3tDZ/2lv5djcJGYdj8dCviPwIjzMo3u494SS3c3
	x/HMnLQAUQlLFvV95sXBEuGMOZYETPKMGHwgDHgWMndun8R7PpTgFAPhiKCd4FrN9lDyRhfIhHF
	BXAL76GcbuWZ76oTBAvgVAtRk0YOBgMBx5Tr9t5fAdWh9AsT+G1zClIEQdhAhHVp78PLk0gIRbY
	4n0uCb8YbrgFsf/ZG9NXNSjEGbWOwMswzzQFirrnlyWRNaf77kE8wpQEBHZvbHvVL2a77zFNIEt
	shrAZcxGCqtpHydJetq5uLWOo1+z6dPSKAKMCs/rzN2sfMv14HZQoPphKN2ytPqZq/ejPQS2bpl
	JMkWEX6bxGTTouxUu0OAPxaruqZrMbWJreOLf1BIxyXFH+FAlW1jZK5Dpu+7Vx3oM1wGC08s2/s
	GulbAaAmyf
X-Received: by 2002:a05:6a21:748e:b0:398:b72a:94c1 with SMTP id adf61e73a8af0-398ecb44697mr2160744637.30.1773392582573;
        Fri, 13 Mar 2026 02:03:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:748e:b0:398:b72a:94c1 with SMTP id adf61e73a8af0-398ecb44697mr2160701637.30.1773392582022;
        Fri, 13 Mar 2026 02:03:02 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb9ed44sm1269275a12.34.2026.03.13.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:03:01 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:02:08 +0800
Subject: [PATCH v15 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-enable-byte-cntr-for-ctcu-v15-5-1777f14ed319@oss.qualcomm.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773392552; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=wxo93JaqfmmRQZHWnlaOdqCh8k2BX70514xVcuOFt1uLiFwTUsN5vwD98y42Myh1S5EFfwppp
 kx24azgXIP4C71B5gX+knl1PmnT3R7S6lISm0O61Xnmgmsl0qvnG4BB
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b3d2c8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OSBTYWx0ZWRfXx/kNWEgRM//g
 iPFKrEOeRu8VoshsHIiqKWwRAJVjtDA+YkJ+PqiiVV2WoulQN2d2fgo/usR+N9xJcLu6thOkh5U
 Uv8P682tGy4Pr9/DRsNhJ2OWo62Y0ANdCTZ70l2nD4Bb+UQ5Eu/0yC4+9HpvcquN48aLgHHBxXW
 5mZgc2vAcH0pU/sjeAWtLtEsM5vtncZh6f4/ZdRNdECwqQWX2D44Nws5aa2X6MKDIs5etrmDNzD
 XDbvIQswa75bExsTnxqX/Zn8o75eNqob00rEZ7x9+5HGTM9Fkm+VZIvcOicGLR05tL9Ef/wgV7H
 gtiNtMif3GNEP1x1nE5RkBIvvQ4aRhb4JyelbyLDENuHX4D3cKJo5ib42rNDl3C6WLQDGCh45ae
 PsIsgO3y5IGuF0c4DoZoOKjnlfO8LGdrNFhjXxCzbnGQCTitrPHj64Iy87M8wjHC0dNSJMWolPP
 rJFKCCcTvvGMaV3tUXA==
X-Proofpoint-GUID: PWOY_HnEpUAIdYVbL131E2R0xVZcqa9w
X-Proofpoint-ORIG-GUID: PWOY_HnEpUAIdYVbL131E2R0xVZcqa9w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130069
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
	TAGGED_FROM(0.00)[bounces-97379-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.15.70.40:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A20FA280286
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..2981001a7d7f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -44,6 +44,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -65,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -72,6 +79,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


