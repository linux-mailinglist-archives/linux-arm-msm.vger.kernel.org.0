Return-Path: <linux-arm-msm+bounces-118639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gGz8G72GVGqomwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:33:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B7E747892
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:33:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jR5UZPQT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EMlhBFmg;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118639-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118639-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B75753009CCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DC33655E9;
	Mon, 13 Jul 2026 06:33:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C0F367B96
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:33:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924402; cv=none; b=tKuexpxgua7NuRhQitoDkQZAswRjJmZj8OAU4KHjINOgxd9ARapGTxwRHaTrxMYA/dI8utNRTwKPO8FRZvVimn1hqcaeKeMAfX9a/cODnVTIJFWYJeRAgTLxXy+vj/XVqb66A+kein1YEDZ7ebaidmX6ZReJjNQfYwkED6YNK9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924402; c=relaxed/simple;
	bh=brxIpqPCyyj1oaN+qhNvUDOdACfPrZSmd2/JBPBe7vo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zetib+kMz+25TUIouGlvrtZ3XGxPPdIAk+QwLL/By1AqATFvSu2YjMHkxccI4OSP8UfsjNwPpvHzHkClcCi44s8+nOKKYVp9hrkpVkujEZWXoGN63b+x9X4tyVYYs8IGLPRN6I4kPlHB3b19+Z0c9iuyfM6VQfQw5xOM42c8qhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jR5UZPQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMlhBFmg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Od4l605280
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0U+O3fwdDfUgf/oZd5O3M9qxqUrf8zH1/Xr/udfAXo=; b=jR5UZPQT+yIjdhNQ
	ncFjAMAU4Ka0GYcfL3zQ0Bh0yVOPIYOFu7/JVpwXOhVpXBLrzgrgcwG8iQuhlh7a
	v929PiGtR+RRxHR4ANAM6Y88dbYFi1kuqgoMrMhidJIBlfrJUVhnv75iwUltnExm
	ofSHGrEUY//RIpfzmThXYiIjoK0eqM4E59/aEuw5ViPMJ5F7UK2WlGDZLM5L6n/l
	XYjHoEnu4TleJ2Ga/B/nSnHjhCnSNYDJpxsqp7/PkXxjbaHzdBmp6dHdWvWSeb8q
	ti3D8hTXJCLF9fFRRLAh3xsydNIa5ZxCc3Nrz22YXpsNyQiTNQdRMIycwgTpAZKx
	xoPbJw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeehmr6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:33:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso2290157a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924394; x=1784529194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0U+O3fwdDfUgf/oZd5O3M9qxqUrf8zH1/Xr/udfAXo=;
        b=EMlhBFmgdLW7MaXyMlb+2ZsZHGrkOuRYB5zUuM5VDgZpy4bpFTI6DqxhEWj3Ok00Gg
         nI2A6wIkV1T4xqT4xHwEEaYrD7k87cvMG78WIPCnoa2Mg3+oE4gUKy/fQ2tfoP+P5Utk
         csWBIEpmtFfVzhT7FvyOv6NcD004NxC2cnnt6b2vET1KUkjas5Deg7hfS/3GuJdDIpMU
         qKbDfuyrevGhshpw/3AxckNgVGRKJ51liJbkvDDXIizsaVznkjTF0mXA1NjkfFV6aVKy
         uThN9B6Ln8dwhVZeAP4zlfULWDloNtmeNqXLwsIJ5kKRO0WU+Ydt9YL6kpPeox5hWlCw
         oMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924394; x=1784529194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0U+O3fwdDfUgf/oZd5O3M9qxqUrf8zH1/Xr/udfAXo=;
        b=g8tdV0OgSxLv3p9ScDWNTFw30v/ifd5d2UM3RR4sdEApg+RkrdLlgNnXV3+sp1ZJ50
         7GT4iSwrcaN4lrZ2eQBEDEpEZ25MnaETOd22F6TVr8gLCdPmjJ7eEleCCfhUJufZBuOy
         yrG4r/oO7Jz9knSX4xHcjwDZ5djuAt7q/Bh2/0C/eZPlNGXpoYk2b6+V6xn1FPiT1W1j
         tmM+RoQQxKGG8xpA7KZY3Mvk2/fwGbAxnDzYp2ikLr2O+1j7yZz1MZCv9/JmlU77Pbgp
         2sGG/9r+SQkUQ3LRhXQeV+9OO8diyvhPO/uJfr0vPdb9XHaloB7A5C1qO/0FXykj3gVB
         tJzw==
X-Gm-Message-State: AOJu0YzxnJYoMQhE3GagV3mESHyxmSVfAp/RpECm1kWJy/mesobEKeAt
	85U9eNywI3sKLFEyMYKwF6S40vnh7s+iqVGZgDc1scN1lhiO5O/52qH2N36lmpLTiXyHprYF//o
	pCpzbhwOVfbTocstEk9XEqJgzhohfEz0TsV3oz65au4/HHv63HHETvEnWq9/r/r6Owkim
X-Gm-Gg: AfdE7cldXOQUvJakduoMwpwJNDLsmw2LLKNGJD4MndD8w2nkdTtdDe7+qxtRlz4303C
	AbJpvx1xTJT9LjNRTCoFpR7yKm4QYTVdV2faYvXgOmLxkcwM+wkv7V1yl3UDmh1hyVgf3noCA46
	b2HBqVTYEjClIixfTN+Xddvg19bfKdttL9qZVGJiQdev8oJ+jNOkBsanZO6BmGIAwk/cfRtseen
	dwNyeGTLmOcB/it5L2Z8hPzSDXmHAu5vqS6dwUYbCPY5UoJg8BMG/VcdJSg5h4sU7TTaKLclB/c
	HPeG2Bstj+CF6cim5c0uLM5esmX1jdTapOVXUdDbuKbZD/LHuxvbCoWEA22hDpNkbMnGwt/yTmc
	bGV4QA/+ZNGL2RUK8VFZNZ/W3CjarIPVmb3tPS1IRSanh5qN8bPIHRBNMKV1Lme/ZkloWycvb84
	ivk5mO0WAO1gViQ5ep8R5hIRgADX2+JWKxC//0X6Y+
X-Received: by 2002:a05:6a20:12d0:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c110acc806mr8297032637.32.1783924394441;
        Sun, 12 Jul 2026 23:33:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d0:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c110acc806mr8296997637.32.1783924393861;
        Sun, 12 Jul 2026 23:33:13 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm25435361c88.6.2026.07.12.23.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:33:13 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:02:22 +0530
Subject: [PATCH v13 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rproc-v13-6-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
In-Reply-To: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX/ewzMNguYktX
 L6pkZemkLlv0uNiSAsmZzdr2jbfKlzVfb+2q/cuYOvn6F5c9/xgfERIuAapx6RkyA9q6MlfHXli
 +Z+LEiQQ6kehDF2heCHAHpOiGiVHb24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX3CZuKZhwsDEX
 U+Ajn+30IknRUM4gsQ2mTWyTwo6s7V6sEl2OTzczgnmt/lYRpnS1UqKVWaryic7HKq+4LPpwN5M
 nzcqFelLwBSBC57uGR7TYlynoi/+fRGufFmyMfiUxNkbx7vqZNroMpDasDV1mSoqw0uqJlchUPq
 HujtlGTeAaeAAwoCpRMHt1mDOdtNgyCbDOmAvAf2QMgfh65Tke0qxPTtHoaI337gk9Kr0bYccF6
 MsthQ9b1dB6T1pwecSfQfMVNMmtZ63jHw4Zbsw3/L9Oy6gtXUaB91rwIGbjT66n65+KbUoht0Yf
 DBdTPtkBfd9DhU1XTfyUekCy0yvGgKAkjBjgteI4IT15Tsk5fZgeDK69DONp1JTA+EOjVZRb5vg
 Fq2DPGdeqookSLvYKB2y83UKsd+Jea6Tx/Zz343J42SBl9/ouRVHX6Xt/IAw1NH8O+QWEqT3tp6
 ZV+T9uPfz0VRENCSTtA==
X-Proofpoint-GUID: znNCYZ4FdICa94Yd4HlaJvZ1vSCCKQv4
X-Proofpoint-ORIG-GUID: znNCYZ4FdICa94Yd4HlaJvZ1vSCCKQv4
X-Authority-Analysis: v=2.4 cv=aPvAb79m c=1 sm=1 tr=0 ts=6a5486ae cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=VFxxlfVBB3dI8x85gZMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-118639-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:manikanta.mylavarapu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:gokul.sriram.p@oss.qualcomm.com,m:george.moussalem@outlook.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,outlook.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4B7E747892

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 60 ++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 451c2076f6a7..fd9fd801eb98 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -3,7 +3,7 @@
  * IPQ9574 SoC device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -222,6 +222,35 @@ smem@4aa00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		q6_region: wcss@4ab00000 {
+			reg = <0x0 0x4ab00000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -924,6 +953,35 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq9574-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@10000000 {
 			compatible = "qcom,pcie-ipq9574";
 			reg = <0x10000000 0xf1d>,

-- 
2.34.1


