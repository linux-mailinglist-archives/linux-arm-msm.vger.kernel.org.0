Return-Path: <linux-arm-msm+bounces-103680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJhyG0fZ5WlvogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:44:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BF9427DC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 649593044085
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 07:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99213859D9;
	Mon, 20 Apr 2026 07:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Psx91NOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KuviuyRf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A49B382F31
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670978; cv=none; b=s+6hcIMs3bjVMWmEQjBYDF/UhbCSsJKRS1ii6jtHouaz+ZJOwRviBG23ZVvIpMk34VlTph6OAn1hSnmXBlw7EXKdQFNIlkDZlw04sdvcoPi8wDLV+sBeTREXiTeS6Va+ARE9xPM4856xv2YdBozlhutERy3FuIG+mZgGmOz962g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670978; c=relaxed/simple;
	bh=Q1YVADOEM/H8yPrWBx2029EnPk6N4Dn4QdnUNTrIaLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfp9kmFM2HZvK++NiVLtpOxP8uoWvlrX2/53pK2OWxc8L3KLqvgFUqnzASFTgGFuQZH4u4audnFYacj+inAPLb1EmhTfzEpvbClhlZWbIbfI4z5wsVysaH997psY8fvalSstSgVCcaseFLYV/0wKmab4+TronyBbAN8x+9T29n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Psx91NOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KuviuyRf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K6qpai1180583
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fT/5fdSdZCDjQY3XGwGGBbsSTLW6mbYW5o6yxztcETQ=; b=Psx91NOD8vtG9rLK
	HMh93K2AdYpHIeWzSBAEE0C1EoeLpl9ZSdLRvDrE0WNTdmwHdl98xAinS1fVD3YS
	0JwjeK9G8RLTVKUQbs+csVjhluwAHagRV7vGk3L6m9MRICMjheYYbQJoGklAFafb
	zhApjtsQRhA8EomU4iosTF7sbSEgBCR19Sn4l4hPRUgar1ti2uuE2aEI308elXgd
	5MpgtF1wZonOLL68EfrxRJKNRjSZpWDTq9qKpa53YOLVB+TEFx1O0WOfw+BC8P6H
	RUN4dVpQ+eCGux0CGX2ipUkLY6rx6INj7Ixi+Ubw/jKk+/ukMHGhOn+fV4wmrZnF
	t1BQnQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr4x3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:42:56 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-127876be621so2475302c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670976; x=1777275776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fT/5fdSdZCDjQY3XGwGGBbsSTLW6mbYW5o6yxztcETQ=;
        b=KuviuyRfMhsQQfDhKG7ni7PF7Wsiu+TVCb76j8GC8S0+9wI6bDJ/fB48UQomD9H773
         y8bb3NhQAfTo0cmp0BT98W0mh0hYXSxyuWYNKbnDKhT/xRpTh2UA4FkCfiB56WTaJ21T
         e6Nhgk3v2ELm6KD/OQz4zL+QTL+ZAFGtT0WEwN2JK57wDU2JKvR0Ys1xzr55iEdfgXe0
         2pqE1a6zEmf2xRa4q5Xf5ncvYKL2f+zMA3DpbiQJy4lrrUXZeUhNmWidNPYvkugezruB
         b9hOkEJtmjQdiFf5Fw3uxnse3pM8A/sRFL9Eq3GfXbiFNVCBuMOzxTuy1ra4uo2ObDrL
         E4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670976; x=1777275776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fT/5fdSdZCDjQY3XGwGGBbsSTLW6mbYW5o6yxztcETQ=;
        b=Zk1q+aRNnnezofUK0u3VADdwO5b4Nw4Vs0GusCzgTRwnChUIM29YX2s7mzbYZlVwNf
         CzMj7RHHbBMpg9MJtfjQUjhq2SyzLfXjqZ2Fgj39ZOdCZ2bKEfUnZdqcsGV2AxEmICm6
         /y7DEg2eVJGUaVSGI3iyGOlywo1rznHiTCdOfoF9m39GZXnwhdYZBNTgVOySF1onHkRD
         K++DClz6Uz9NUKubD3H1fds4SIy9QYurcAGs9aAsHpXZKRoOCNOpzoNtSyCQb+/mLc8T
         SeZqWgpTofgIY7UPFE3rSbo9ZOi4EWIUwwwfrAGKJ/VNHmwF7qHM75ZzZJqXj50r/rD/
         IwoQ==
X-Gm-Message-State: AOJu0Yx2zOj/U4hno7C9c9B2xvLuZWNUCisK7mn95UMTL0yVojHtY///
	snQOGV1aDZ3RZ2MyGadcYFO21UPXY+rlKxrOyIZp8rxSWxNy1I1tV+k4+vKpejw3OmE/tLF4Ksd
	L6FfYWh+xIc32fx3kE7rkEqvnxqeqjf74OuDlacnEvr94eq49FnFfNAwV3kyae4uRxeQK
X-Gm-Gg: AeBDieukbers0fx7BXeTMIReXzc2l/u/0Qg8jjh8P/uEfAY8FdkuSIBMJdUwFwUn5WB
	rYY01VrUdS9GTpiaFv7e308YCSPJPOvtXfZdBXbI2Y6oq7S/48dqUJ6QpOZrx27MrCzhSEUYbAK
	LlPpxN7rwbbatjshisV9vDoBaj4Sllea0GEMkz9I6487/ENXCcCAaUNDqoKU10HzqSOii2t5Ozy
	otdsR+TZVzqyeYb5Sakww1FTLYHH9lO5OWfdX0XVi0qvjwWVyH++ArYWutY27GpRPLoG+mWpzpf
	0ownAnibbml3jsIVTJqAKwgGJ6MDHjgtDsei4f/JpV9z8U98OrUCNU5k9pHM0Fe2ustasJ4y4LG
	MTXtHPM6NvjZ/60g1tFg/6HOmDy2iJWWjvTJD2vPc551RQxfL+XAN/W3ooe2NCF069l9v9ashuC
	KQejc=
X-Received: by 2002:a05:7022:fa2:b0:12c:11d4:61dd with SMTP id a92af1059eb24-12c73b39a41mr5122726c88.18.1776670975883;
        Mon, 20 Apr 2026 00:42:55 -0700 (PDT)
X-Received: by 2002:a05:7022:fa2:b0:12c:11d4:61dd with SMTP id a92af1059eb24-12c73b39a41mr5122703c88.18.1776670975346;
        Mon, 20 Apr 2026 00:42:55 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm19866217c88.10.2026.04.20.00.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:42:55 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 00:42:52 -0700
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com>
References: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
In-Reply-To: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776670973; l=2215;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Q1YVADOEM/H8yPrWBx2029EnPk6N4Dn4QdnUNTrIaLA=;
 b=2Ppw1ayWt6U+LCwDrGerHPiMKcUEYxUpE0Rh04Xf6IFO1CImct7kjsoQXcSH0nLaMpj9UmHiy
 ZUZX5kbMIKzBdfN+QvTLMUFlTACjPIg7+/NkUVnk10rk4lkyd7qILsx
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MyBTYWx0ZWRfX5JWjG+33RJ6g
 Qi9pTm+jfI6ZQHtsJfSdxEPcpRWqrOEBTLDrn38nnld7Z7sNZcmXlUalFqTgdyMXghZ7O/f31t1
 aBJmnFhCXXjIlsX4O+JETSMhS/UE8DLNE0CHfA2zHAVrkv/OH2vOEOnNV715P+XVSIAlSFOz27u
 Shl6oCtORis91q+peRRyFWGdT6Srm2AdoEhol1kyn/fEgDavvUNCC1RIzu44b+lKoapdWi+3GNl
 b0B+SrECh7y9eI7y7ruG3miNEKK3TGIQzA8Q2pwAiBYJVnazttAhYALHcfye48wdWw3Z5CS4z6E
 mL+QqBqNtNRc3eRseLW0Btua+DkVgDjVyrEknZctfeY00HkGLWaPssZCukJf2141wKCIRfVF1jQ
 LIo8/+ggAJrKOEuT0vjLMLQ64OfmRjv0JJx9c3XgVDrL6dTSdi1fcML7uqgEXxJg00zuiXukCqi
 /EX/xO9dUrTCcBfIEhA==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e5d900 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2TsNLSZGWbgVkw9tuboA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: -2EwGl5wWTd018Xl_z-jJ1hy4d0UuO4l
X-Proofpoint-GUID: -2EwGl5wWTd018Xl_z-jJ1hy4d0UuO4l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-103680-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4BF9427DC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
required by clkref clocks.

The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
QREF TX/RPT/RX components, while SoC-specific topology and instance count
differ. Document them here for qcom,glymur-tcsr.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 1ccdf4b0f5dd..0cf612e6d7ee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -51,6 +51,46 @@ properties:
   '#reset-cells':
     const: 1
 
+  vdda-refgen-0p9-supply: true
+  vdda-refgen-1p2-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    else:
+      properties:
+        vdda-refgen-0p9-supply: false
+        vdda-refgen-1p2-supply: false
+        vdda-qrefrx0-0p9-supply: false
+        vdda-qrefrx1-0p9-supply: false
+        vdda-qrefrx2-0p9-supply: false
+        vdda-qrefrx4-0p9-supply: false
+        vdda-qrefrx5-0p9-supply: false
+        vdda-qreftx0-0p9-supply: false
+        vdda-qreftx0-1p2-supply: false
+        vdda-qreftx1-0p9-supply: false
+        vdda-qrefrpt0-0p9-supply: false
+        vdda-qrefrpt1-0p9-supply: false
+        vdda-qrefrpt2-0p9-supply: false
+        vdda-qrefrpt3-0p9-supply: false
+        vdda-qrefrpt4-0p9-supply: false
+
 required:
   - compatible
   - clocks

-- 
2.34.1


