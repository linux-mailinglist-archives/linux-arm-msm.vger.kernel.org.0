Return-Path: <linux-arm-msm+bounces-109267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAjhLxU6EGqeVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:12:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 847E25B2C92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D590F302514D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB63F3D5679;
	Fri, 22 May 2026 11:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ln/qk1c9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iajS3kx7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DB43D47CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448235; cv=none; b=W7m6DGxoMMRAaLcBv058qi3uTQP++XvSJT8dQW5fAlY/bFKI4mzBvX/D69XuvIWern5ruxpz3d1U2VzYe92p8TxZlvcBx29QkHlx2h1Ui0mkyLrnBKoTgF6peel3/mEk3l4bTCFAiIbDvOG+988pUGrQU3wqjudXYkz0KyXPZqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448235; c=relaxed/simple;
	bh=iUfGQ0fJez/3uptpGDzAVGoYlqLssM5v26RATncmoEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uf6rv6dJWbqkqlvciM/Qbhf8hKvFkwnonMP/fRPMC+M2w9xjfVJJ1BLMupLObmeQUwzCkyzXBwSX3IYLd/CoDGa16wcsWET4YunBwOgaHSCbO8GNoI5UpK7A+77a5vMS7Igp342S6yA2js0AKAeX9VqlzYTqdBp8LCU7fG5gHSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ln/qk1c9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iajS3kx7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6UPbk1959859
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jh/v4/2c8PuVjYnckNwLweAG3dohd35ToKTYOVMXeEI=; b=Ln/qk1c908H3JKTF
	mBU0fssYgFzAiwnkP/F2WH0e5/FEv1hFxkwettd9sTVIhct3jIIdGozLB21smPpA
	zuFIwUR805Xbu0bjZGxYij2ZV3/EfZj3VtWcRTAOZgBAH7dfHtsrgPp1a52Am+kZ
	0Et4nAnXbkOtq+5zqD2SOhIvt63DNQsfT2Ut8CCmxcq2GNp/x4Oxr32zw2FttHQY
	UKc7KdFcO7geaDfIF+BEi7/dUwltZFMGlM+xovxWbUW2nfWMotAX1kWdmT7P6dII
	N62rT9G8D1Ubn7DBrBe024VUI2C38N2CdHxbmbl9prr/tCvAPrlp/S66BO4gLm6Z
	CbRc/w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxes818-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:10:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so11071548b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779448232; x=1780053032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jh/v4/2c8PuVjYnckNwLweAG3dohd35ToKTYOVMXeEI=;
        b=iajS3kx77w3S0y1NwL7UrD0jwTgrigiH+9CZOs7p4coyfMVZgudQOU9Hy/Cgve6k5r
         mCFTkFhLAh9wU26RQzzb4Pwp4EVLlWIQJ3975kUCURNFB9FIX0Zb8qkUlOA72dwUIJcz
         FvR2lSQ7GF/bUDbNHrJ1KAej93v0Ypl8GgslTRydDmcm/BXPibrqTKzAY0zKwafodTWC
         wESZe+1h/nUxAYGNGRuQrj+SMjrmKhi61qy/UvyBoPPNzWCufjzh9dtmqtWW93pjSgGZ
         VbL/Oa4/rTzroW9W/SvkcoHAARRmqaRfB5SCStj5bZXMXGNaaCCQM35PZ1ICEHIq0JCG
         uPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448232; x=1780053032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jh/v4/2c8PuVjYnckNwLweAG3dohd35ToKTYOVMXeEI=;
        b=DVMGpBfPI9Qp5/sRsamoaBHQCqgkZ+8Wblq3at7Zn7fxTdA9spJBq1XJ3uiDFFqIlR
         dd6FdbAjkE6k4NeWpszNulM7KSgaAaBzeandO7dXnEThVFzwdA8QR6oiXNXgW+vIcD5I
         9mUeneUaP6c/EfSvcjPRZd3xcCJmcHylRWWo5oYmSStxX3h+rqHMFvtadaGnFIK/ZJ+x
         O/N+tq7R5946r90DIjAMKiLpvgfFjW2WjptWsqeTbPFhewZv2URrIzc1kEggLwQLFlZi
         tetXCthKDxiRttN/5d2HjJ9bnXGUigg/VzcLDOPa1Gty2WCFq8cD1HhLyexxGQ8mPHaZ
         N5tQ==
X-Gm-Message-State: AOJu0YxNsgMFr6AeffdY6pz2vNK+xXzraVBx5sMaYEki/caUB5lK1ytn
	P2r/ixaf/w3TWUskiVqzq5mgRzZ7eP7BOvskACQLEiRlXLcpWmR3xhwBMlc5QYpWT4GOq3vGi3C
	obh13VOiuYFOrQ+WSdsw3M4Yr7OLaZ27/+Ijz7CQo0q3lcS/p6VKTXNK9y5CMNLJRixYdikmHEP
	a7
X-Gm-Gg: Acq92OH98NwIAps7YbTWVTJHdVcM7Gv89TeDMVUvpyHtw9HVNN/lOdCmgYjnOXuXnfA
	jAq7E5fuyZt8wfB7giYcUgaT5uy+0EBS5WR4PGaKpFWKXURJx6nzIjb83HgvzNH5Ulovb+odR1v
	YrdutaARkE58ji6Lm5YklNwkReskkOVTJ2aE8oEAeUdRUBaetSK0ceVBladw/PJjWtnP8Q7HUCX
	Khupb5CWI4EdD0+L1wpq7LYF+K0RR0xnGMgVMRNJnsBrbM6gb/l8UpAhP/GT6C9Ylk5EIpoGyXp
	fd77MCP/oTw5+e20yoZgwH21oPgHcDGidVfY8q8HrlKdiaR9mTz7Yih/dzGeKs1V342+hQhcnQA
	Yz85whu3o46XDbr4cNEzxitYkR2eWcYYHfHLNA6w8AGzzfH0Ik87ybhLqbLkuM4pZsWKq
X-Received: by 2002:a05:6a00:39a8:b0:838:1636:e2d3 with SMTP id d2e1a72fcca58-8415f618045mr3411117b3a.35.1779448231976;
        Fri, 22 May 2026 04:10:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:39a8:b0:838:1636:e2d3 with SMTP id d2e1a72fcca58-8415f618045mr3411082b3a.35.1779448231436;
        Fri, 22 May 2026 04:10:31 -0700 (PDT)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841648a2bf2sm1578962b3a.0.2026.05.22.04.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:10:31 -0700 (PDT)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Fri, 22 May 2026 16:40:13 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: monaco: Remove the
 little/big_cpu_sleep_0 idle states
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-ml_cpuidle-v1-1-fd311cf33fb4@oss.qualcomm.com>
References: <20260522-ml_cpuidle-v1-0-fd311cf33fb4@oss.qualcomm.com>
In-Reply-To: <20260522-ml_cpuidle-v1-0-fd311cf33fb4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779448225; l=3829;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=iUfGQ0fJez/3uptpGDzAVGoYlqLssM5v26RATncmoEI=;
 b=KxJbGF+OoyTgt+U4d6EepILUPyNS+Q5UsuAW0lVHben1H3jOkDcHhbKxK1Vn/sC1iXeFVLsVl
 v0MT4kNeazoBT+Fas2+9lTFKsRwSjx2Bwe64YRf32PXpi7jHDYmdQ5L
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExMSBTYWx0ZWRfX5L9uAhzfU1D3
 GyYzGu6WRVZhYQfRaWXnmZH0VxTZaxyvGTqjG+ZwrixLS96sksuPJcSb3X2s31gQtrODQFz5Ue8
 IMKDgJR45kZYv+7dbAC1FIF0zHI99LLVK+Y1+1WC6rkf3XrB2iT/2oxoxstV092E72xWjH3pMu9
 SCcMtbE8/cCwMrmzN01cyMmGUjsRZXE9rITEzIV5pBV4DCazE6oaAJbqXX29dn8RHHS2Vcin4x1
 JOk+QNSLHjZ0wtDJgNhItYvQlUaza31Tv0lmvU+j3kfnLwQl0pPCXfog5ZSeWeDgXD5rbK+UBPC
 6no89tunGaCfrOBmyYtOTHcYldMu7C8E31doZbvvSqvPKShFWa+n7LH2YyTv/cgQh5ZdxbzVLoY
 tgnPcTNq42sATG+I9cLd+JAW1iAXo2YMlJyx+vllPsuW+XlA9SauJotIT9MMvDK/JCFXbwvj6q+
 Q1glENf5j/tZG1QAO8w==
X-Proofpoint-GUID: akXZLDg39Bo1IjDlzKBFLJIX6pNhPg8A
X-Proofpoint-ORIG-GUID: akXZLDg39Bo1IjDlzKBFLJIX6pNhPg8A
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a1039a9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NYXHHODC6xWyQ7jjk-YA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220111
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109267-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[navya.malempati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 847E25B2C92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Firmware supports both CPU power collapse (little/big_cpu_sleep_0) and
CPU PLL/rail power collapse (little/big_cpu_sleep_1) idle states.
However, CPU power collapse modes are often not utilized in favor of
performance, so remove the CPU power collapse modes for monaco,
aligning with SM8350/SM8450/SM8550/SM8650.

Rename little/big_cpu_sleep_1 as little/big_cpu_sleep_0 since it is now
the only CPU idle state in use.

Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 36 ++++++++----------------------------
 1 file changed, 8 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index ce6ff259cb4a..fed94cdbe41d 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -309,16 +309,6 @@ idle-states {
 			entry-method = "psci";
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
-				compatible = "arm,idle-state";
-				idle-state-name = "silver-power-collapse";
-				arm,psci-suspend-param = <0x40000003>;
-				entry-latency-us = <449>;
-				exit-latency-us = <801>;
-				min-residency-us = <1574>;
-				local-timer-stop;
-			};
-
-			little_cpu_sleep_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "silver-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -329,16 +319,6 @@ little_cpu_sleep_1: cpu-sleep-0-1 {
 			};
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
-				compatible = "arm,idle-state";
-				idle-state-name = "gold-power-collapse";
-				arm,psci-suspend-param = <0x40000003>;
-				entry-latency-us = <549>;
-				exit-latency-us = <901>;
-				min-residency-us = <1774>;
-				local-timer-stop;
-			};
-
-			big_cpu_sleep_1: cpu-sleep-1-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -681,49 +661,49 @@ psci {
 		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd0>;
-			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd0>;
-			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd0>;
-			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd0>;
-			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd1>;
-			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
 		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd1>;
-			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
 		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd1>;
-			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
 		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd1>;
-			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
 		cluster_pd0: power-domain-cluster0 {

-- 
2.34.1


