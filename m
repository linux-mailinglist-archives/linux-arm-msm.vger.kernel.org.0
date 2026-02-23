Return-Path: <linux-arm-msm+bounces-93592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJWiKZX6m2l5+gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:58:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E024172765
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EFAC30488BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2FC34B43F;
	Mon, 23 Feb 2026 06:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NKTrUkhx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ac38aeMm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E28334AB1E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829803; cv=none; b=lNFzIgMtcM4DVQpS6bZSHLqPIoGsLMS3NU0EvTyGQdNHlZVr2OBaTdBoJHX/B5cyEdSZariARBhNYhyw6lOQyyUIpQhHYuqIISwVHQp7MybyswR76olorHgpCVQVUR9wvGHVmgLbpqjNUtqsbfL9+Q+hZFeSETLz3jGtSrC4tkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829803; c=relaxed/simple;
	bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WBg9zcS6IO0uvYXteRy2//sGhPg/YzEjDEPzlaHAxgU5OdIDqBq5/HkCpphpJRAu0oqbqcaQIpXwNN9cRyjUVizagg3vOXka4o+BU9kbmS7bTS4LsiaYczWC9UXGlO050x4BRF81dDC0L34jhUdKjERvJnaF+4cUNgwitbgY/EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NKTrUkhx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ac38aeMm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLFAGo2080266
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=NKTrUkhxiWsvCWcm
	vcmRCE710MOBG1EFZ+jKlUiDMtVSYH2jHR5XFnMR6WXVr8EcrxTci/Kn7bYRORIa
	fEKMCteJYt8DajCcQ3jzWEHNgWBH9x+WBQYEmEne2152ptQyq9O1tGgVr5gpdxlf
	dFQRIjv9xhWC4Wu50v9X5tmTvSYKyvDOGBgNlFB4MQvk3k7lUgkaD+D5ovtTiIPZ
	gA1eOg7xku3rFNHr6hIOS/tU1ZeYU+Jj9vRhUxCkXk9tUEhT1cAzS57CrMo2UnrY
	AMIYjtpbrG2RZdsjt5p3RBX8bz+Fziy2tUd9kF7mVoNMcqMmfiMBhMa93RWpBEb2
	sfNqKw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3up4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ad147cdf07so43480095ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 22:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829800; x=1772434600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=Ac38aeMm+JFqKhbWS0anf/8OQ3zi2w+vHXOaHeIpcGHHMz24JP8f6iWTpXXSoEL5c4
         4eZstb4rDT2ZLID2D5TZ2U/5yiEW9Wso3COlA7rb8cDHOB+A+A3YzPjvz/KIsQembS02
         ZUlVpPqxT+/N1r2ligcpVx2mXnQfy2QBzwpycpSxJfg4jOrEKZA/1JBod9Vhrovv0FNf
         7fN08f38RRvOvRlETGjOM3qZs2VkGRybMfkFIuFIwl8gRr8qubwWe8BaCF2GQ6GV975p
         Slx62uf0CScli98+H5DaBtw/HGuqrOGgiuqiJbNd+V5D0vSjzzSiRpyJay/FDVoodAu1
         Gihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829800; x=1772434600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=FSozQoKQFvnK34dbvFMf1ihpOgiQEN+tgF/YC0Jstr4bhH1tsopQGSBEVwc5O4nmUe
         o0GYCluabhv8OB4Zu9cXhQFrh6nPkYnPf/O1Qe4WbUZH7r8GF0vVaRyaoj58jQ3zz2ci
         Epys2DpmV+bVDP22AylT1DgKvK/92kf8Nrzu6lu2xZHDF3wte0A4lXnLYtzsc/e+gL7J
         3iGNOzLOs1jmeNGdgKHeTanEgFWXBAm+mKXGGdIeUvShh+ElybtzmNXDPYxsuJ8KWnrF
         Fc+ut95OKVtJTCG5cbLNbB8dtrrm6xq0YmH0vmi0p/I0MqrySIoxuxAMxdtRD8nLd1sK
         +Y3g==
X-Forwarded-Encrypted: i=1; AJvYcCW7mOR0SugRPBGF9rXde3kFe/J8MSdhexRP5ZS558oFJWNE2a2ApU0UumMgx6YV3amP40ZYewxTLnr+aU4a@vger.kernel.org
X-Gm-Message-State: AOJu0YycxiOSk4D74vcQWJU8r3Et0tyzoI9xBKCRgM1+gthVtdnkZsx5
	VDgYHr2/leNCWPCGOrEkIXvvCIYPx4xirPn1tjWxWuj+VQ1NtpfVlKalo0zqGvbjLVzt1vkAHiT
	knFg94jlRO4DoaDWgzs6MIF5efTymd10wVnWdR22aP7BBGY+ULQYrp3EY1YsQVm/zFZHo
X-Gm-Gg: ATEYQzxQlQT75wWztfKritM8v+Q8I4P5FRYTgfevcRbm0HGrE3GCvy7rFF0doZSAyb8
	Vu5gLLeb0o3DRt6No56W+KGW1ruufB2Zi5UXTvJIROxqOK5o+a/fmjdQtc462wMyGmfovxqrrp0
	Kg/bGsRyct8wsj1eiJpLMAyipo/gAB0U0oFusnieS9EqbnBZbCr2oypWCAp8a0ntAX/GdMlpdcH
	PlAVU7ykZ6dRfpo+qMHsfAmpUv5QfSZLvt2sDeezioCqSsZC26p5c0CTmqYeNam9c7CYoLKZyg1
	Huxl7fQzKxs1o3LAujBsmHp0jG3ykj9mzTZZN+HSrEIC0oInDd1A1nyXHRjFn+hAjcYZwxp8KYi
	QO/cxebpC49oNHidZMtmTSC3J/lWGEtdSKG5dz+JCNQsNh3sFdQjn135XIWOwOSGmGHa/A8t2ba
	GiTb2KIoyVYhuI
X-Received: by 2002:a17:902:d2cb:b0:2aa:e568:164a with SMTP id d9443c01a7336-2ad7453de73mr74728025ad.31.1771829800065;
        Sun, 22 Feb 2026 22:56:40 -0800 (PST)
X-Received: by 2002:a17:902:d2cb:b0:2aa:e568:164a with SMTP id d9443c01a7336-2ad7453de73mr74727705ad.31.1771829799594;
        Sun, 22 Feb 2026 22:56:39 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f619f8sm62249225ad.36.2026.02.22.22.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:56:39 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:55:45 +0800
Subject: [PATCH v13 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v13-5-9cb44178b250@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829766; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=QWedPA9AaKhex4ym4w+qoBHDsF0wrFknKypOlMeyS2Ij/VssAG7VHPQyN3j/KA5tLTxJRu3rk
 HHhK07Q3bjiBmdNBDhbjpw68FVZc/JPqnB8UxTmJgc5AcQHlArgI49R
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699bfa29 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xMsqNjixUs2x9uLbw3tgvql66zdA0MHT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OSBTYWx0ZWRfX70g1KtERX7rR
 gH08Xvq5WXtXTy091e8CJ9ICwIjxIFDUsBNK8ZHK8Ts5WD/m7JTQX3eQW2cA1wUxPktYrjXili4
 4LlMm4Ml/F+le0m/NZBlMFSxxOfsPrprYYxjlx4eoc9/dGwbloFtgd5UgQhTDe1L0b4oqH1Zz81
 x074WbQoMqQ56MxGwwAzzgLFY+vFTCzDSyMw9YVZcDL7zIu1CmwSZVGYgWp8ccpzfk21lL0Yl58
 w6OtBfz7un+6lRnm61iEMr90fX61YM2xlryd5Aje4Ni658Nm7HoAKFYJh0t1AjMX5whxDyZGJTO
 zIULHXQAq7OfHFcwjvzg5xJP0bN7jaqOeKUbCDY5HpRVe5e1zgITkBXQxv/5YwV60pMQjQJAQ16
 ZQpjmUXvmtAF5MCazuT67CUqWniaGtP7Yn204uJwYw2hE5bg8iZQwmLzSTCoyZHZ1KeHWt0FYWc
 hjIgoaKWA1X+7mLhxKQ==
X-Proofpoint-GUID: xMsqNjixUs2x9uLbw3tgvql66zdA0MHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230059
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93592-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.15.70.40:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E024172765
X-Rspamd-Action: no action

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


