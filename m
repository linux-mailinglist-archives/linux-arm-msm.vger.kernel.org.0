Return-Path: <linux-arm-msm+bounces-110034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PaTJY2pF2qhMQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 04:33:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 013B45EBD3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 04:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6479D30E8D18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 02:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EC52F549F;
	Thu, 28 May 2026 02:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VpCnfp8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EF2wZsOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6312E11B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935368; cv=none; b=jGZRTZHSYG851aUD346X+rLbKgIhVp3nKAVQMcIvhKQwEnsjK3K1TLcE40NS8Sriib600C2MVUmyIcyd7+WcxJgAmwf8Yswt/lCwwUojh6NITh3QiARW6ob6hj5FnCXnBzrt1RdFEWzVzFQHa+PPFT7fAldp0dA21hZS5ogFGx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935368; c=relaxed/simple;
	bh=WtpPDP907J8Nn9pP4O+K4wkFHYLpz21QFKFWYhc+jsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JQaBJQLLC/BlcdokIXVRMwrF/OYWlEtlSjPOp4l2u7np9KBACiEQ0jYAWGuWUz5h/ZSOqKrgYcSxXHGdVubz94L11fUld071KuyQLdBsFljy9v/IJBkg1XniHP1vj/ZpchMFzHijAJdSfZKIs/uJoDj66Hc2c2B2mHXZlUpXxXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VpCnfp8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EF2wZsOd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKnJnC3010123
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25tyBNUWP5adeDVJ09nDG6dQP6rYSjQItwo7tLsffeQ=; b=VpCnfp8YvbFXBLZ8
	HYpnbnbECWdBq/UJpGo9O1rtWN7Bh0Ur52sSG7TNu9be0cNO4reGIDsXG2abNWIc
	uhikadoBpQhIMlU9traZ9yN1VfGRnI35Hcje2UsAA105P23tVnbDmh8981vwY7uM
	1vKnuDP75QBO1O9tKCEIOR6O0yBLtIVVdlvJk77dVIxeWnE70yBfOSDMLeT0k9lD
	QC//zR3vn/x2FVB+0Dxccyf22rkdegWZ5QIZWpFqtSSbQDzxg7ZD9yN2SIBRGmSM
	Y0ImpiZa0tA6BXSvjGsbCDPsIQ7KqrqT4gSzq/k6AInrr1Uqq06HlkfiFeqXmsr6
	42if6w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yrgypu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304d8613efbso127648eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 19:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935365; x=1780540165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25tyBNUWP5adeDVJ09nDG6dQP6rYSjQItwo7tLsffeQ=;
        b=EF2wZsOdg/fNMHSaAwbqePS+sLDNEgj5kzgSZ/rtIKXaF0co3QpjkAzZdyVTNA7qKb
         oqzvYfrWlF/J6xuNE0C68AOKTO2zIeXvNxfKa6l4Useb87IjxKhHUfm7vv2fowP9wmq6
         OhY0To2pE0zZ/m5rZvNZzDzlLBopd+hPHkQW7VR8c3gBTjejm8Pjen1bVpRQW2x13SdC
         upXQ9bNgqCXQXQ4e2as3QUy9xRcfbQb8dqGoCHUkUK+KJO9h5KD8fvLiomtw/f7ka5E2
         0aAptVSvpJI+jE1gxaFaSMG0P/Z3Fwk5t041N6uj1cbFGb10P3fYxg6wAR5+iyluUdLF
         IWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935365; x=1780540165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=25tyBNUWP5adeDVJ09nDG6dQP6rYSjQItwo7tLsffeQ=;
        b=c2I1RniNcANXTnhEC5Gjb+2xxS9a3DP71Rf3RHq05DUlT5Fkpbafz4GXyI4xj46KkM
         lToLKZK9HO1zNdjLYo47WxLn2DI2YL0gN7/vCEdpdrVBaoxMBcS9I/ZZuvlz2st4qhQz
         /5sAJWixzcwW45RvRuORkV/Xgxek/2pF2NQxucqn3MfFJuy0+swaEOEglnVm5C+3c0/J
         iE4kJmUzNviSX+KZwv96hVQM/Awt7bO8QUdrO4s06uT/bTBnMkRNQQ1mthMX6JleUKOW
         MxDKp+3mQeqAF8tW3CEnMV/BmmCWeIRp6e/MA0poh+KwIKDYbNvpYM32oyeukpPBgzdO
         k8sQ==
X-Gm-Message-State: AOJu0YyY5GUEFRhmvJi+bq9pzpREllCimij5FF+jFv2n2kxZB2xH35tE
	1s1PKj4huFgHxyLifhSNsFFRtCfAm9PX3/TMENnkZGB+hYLPMH0Y8iMHySG9q82+kaxx2/vIoBl
	Vn1dQnJNDtn6fGHS4uAKWTnnkUPMj4Zh0sr02QhgM2pH7JhHQLu6zk1cc0nmLTb7KG825
X-Gm-Gg: Acq92OE0AANZbmfY3N3Gdd2PR1eS2Bb1Dg3U/G6sA9tYTiiblIfCPAxDh+NddbBlQOM
	w9Ufu4UihQnTpj1CEyEthWZOpb9rGl7BbrKKljXelFqYso+HApTaGoLwKwMUm3W76nlER9hQQOd
	cDsHOJV52T4uwWhS5WvEJiAj0F81k269Nrgk+TlFedB6FA5E1BlZD/r0hgtmvV2kxBrJ3pjKAh5
	r49cPTJRBcKTvqtdAQVWFUDg4s0pCdyFlVqP20jZVBIDjhbzExAEVlMZ4cRDMQRpMdoj9GcAOyA
	O0hFB484/RShgkQhn/L6r0wnLqyJXJpJBied8xF8i2hCQB7tI1w2zxlF8fQFnzwwAkfAT3TzbL9
	yCzCOY3ztyDFjU1n0oEFWvOVO4brG8jMeLfzq7ulEo1I1ne997XKm9ZS/BXHgLG+ZUAPM+nOYra
	aYrjQ=
X-Received: by 2002:a05:7300:f191:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-30449094103mr11127823eec.25.1779935365069;
        Wed, 27 May 2026 19:29:25 -0700 (PDT)
X-Received: by 2002:a05:7300:f191:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-30449094103mr11127800eec.25.1779935364502;
        Wed, 27 May 2026 19:29:24 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:23 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:12 -0700
Subject: [PATCH v4 1/7] dt-bindings: clock: qcom,sm8550-tcsr: Add
 QREF/REFGEN supply properties for glymur and mahua
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-1-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=3605;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=WtpPDP907J8Nn9pP4O+K4wkFHYLpz21QFKFWYhc+jsc=;
 b=XhrGeWmgpKIsHUWiq4AppbACbHOcVj6K6rxQn7Yws8I79Z7jXYASbFMT0wJ1M8kTF4QI1BKnH
 g1s1Jktz06JAfPT5/MThSpK7nKf5WI4cypHghocHKhSyDi+jvhLq4/w
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfX6alTVhB/48cr
 0blHsFxq08zk3lK19CDkp7H2Bb4WuxdhBXwKAuZLmff6uzVW6KiAzBWbv9m2eN56GW508URCB9+
 ofjwkB+gzibctoiFWLKeLQzoPOnQbYC4FvdFtsMUvlQ3zUTAlkAqW9gw+3WlM0CZUOY9s+AzNnx
 4uLyADWz9EOsJ380KUyN4BJ3EvtxRDuLrjY5dPJPVP9dQ6mYnaEcesXseNWKfJSeifp3Rz6x8T+
 GYy69WGmNnlP/0/3tj3aALjdJc1QY44Tsa5rtpmHCebwkhvxrTJfWRvDAVYC/NrvfbRQ0Z9xihT
 srIufrmjPQoox+JABqVVbjZeknw9ZhN6/eqmqCk2ZKvz7LM0bzoTbp2FcXe2A495VAGpZ1l9YRL
 TuiXk2lGZV/IWg7lh8z6nevH2bMQFp/u6FNAADjvVuE0nXAdJ/vkM0K7JNOIw9Vg/KZR0E5rgdP
 UI9vi4KrfjvYn4g0VNA==
X-Authority-Analysis: v=2.4 cv=PLo/P/qC c=1 sm=1 tr=0 ts=6a17a885 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ED1JfwARjmvM9eENDMIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: fuw7n5CyRvY6tXaZU7wzMY6hbS0GJaeH
X-Proofpoint-ORIG-GUID: fuw7n5CyRvY6tXaZU7wzMY6hbS0GJaeH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280021
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
	TAGGED_FROM(0.00)[bounces-110034-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 013B45EBD3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The QREF block supplies reference clocks to PCIe PHYs and requires
dedicated LDO supplies to operate. The digital control interface for
QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
QREF has no dedicated DT node of its own, these supply properties are
placed in the TCSR node which acts as the control interface for QREF.

Document the supply properties for qcom,glymur-tcsr and qcom,mahua-tcsr.
Both SoCs share the same QREF TX/RPT/RX component naming, but differ in
topology:

Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
has a single QREF block fed by REFGEN3 only.

Mark the relevant supplies as required per compatible using allOf/if/then
conditionals.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 08824f848973..fd3736ad8c8f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,glymur-tcsr
           - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
+          - qcom,mahua-tcsr
           - qcom,milos-tcsr
           - qcom,nord-tcsrcc
           - qcom,sar2130p-tcsr
@@ -53,6 +54,71 @@ properties:
   '#reset-cells':
     const: 1
 
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrpt5-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-refgen3-0p9-supply: true
+  vdda-refgen3-1p2-supply: true
+  vdda-refgen4-0p9-supply: true
+  vdda-refgen4-1p2-supply: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrx0-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx4-0p9-supply
+        - vdda-qrefrx5-0p9-supply
+        - vdda-qreftx0-0p9-supply
+        - vdda-qreftx0-1p2-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+        - vdda-refgen4-0p9-supply
+        - vdda-refgen4-1p2-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mahua-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrpt5-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx3-0p9-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+
 required:
   - compatible
   - clocks

-- 
2.34.1


