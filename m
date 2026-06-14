Return-Path: <linux-arm-msm+bounces-113032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pnnmDuRgLmrMugQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:05:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C8D680996
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:05:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XrNnb0zC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KeZoF8XA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113032-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113032-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 524E83026F02
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 08:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4C9311C15;
	Sun, 14 Jun 2026 08:05:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C6A2F7F17
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781424335; cv=none; b=u2HpajZPU0L48YjieQJ4KjAdiGyYgxJ0qpjrb+uP84ww40hzmfm5hqhfmcTwJzBE492G4H+8M9jPMPupZXzAlVrOYBdoV7utmCxHhsQqPOzkqpD5E9z3Etcox4SKhk1vPTRgj3dpLmFBDrr5SuKxgaUJZ5L8GMMMY//uyve/ewE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781424335; c=relaxed/simple;
	bh=WIsZ63sCQ64dVMlhv7s4p6idYOqkQ1ABcVo8fUUo5wU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V5eGFgCKxPonI4oEM/uUANy5tJkENkCUPTZMy5Oq3OqAAYhcKKKOWJcofx55S9wNXG7kaNUO5CNyCKLE7yksTKP4uzWrQEInVaLbtUcOe4/gO+SoXf/iHIjICD2NTIiFPhCYtwi1FszBQJ5fY7lk8Ygtt4y7bkAYxOh2XXLnTkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrNnb0zC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeZoF8XA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E5TndD2961694
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9Rksv4cSEYx49OcGoEBr2k/skvGa3ntd8d7f4HoDII=; b=XrNnb0zCHed7tqcX
	CQtZFlCgML1e2xclsB4E0y4Bs0Z9DYY6KTRymIXkAYY0nbQMNodPQMjM7k8qbHhT
	l3A9k/Qf5BIT7FupHx1P+TzMTapUlUFPFCMpf9j7cchR4TY4I5kSAB9DoqSiVSVn
	7ibkGF5SAzVJi4Q8VQMrD069Epr7LIv+IDBck2ZCtGdaxoc1N/O/cNu0/eubZ9Rg
	cbFS+4WrDAbdkSkfYYmvC8RhZ0q0eQuderZ36+aPOvRwKAZTaeSxIIIlMFt1F/dL
	tp2JEgwh1axxPWkH0Swpw3P/pbnT4ar0zoAHz0bSPS+7B0N2Lr37FzR0lKHixZ2p
	UgQrrg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffk0p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf30576aa3so16245895ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 01:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781424332; x=1782029132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9Rksv4cSEYx49OcGoEBr2k/skvGa3ntd8d7f4HoDII=;
        b=KeZoF8XA/IL1pd1mrxXeM9Gwj2liCf1ZVZjBkY9jHn2QUeFFsZNc24XlXWgc4Woh1y
         Y27Y5nykP0xE7UQguD154SLt9daqtsR28Mfei+oUYnaUetHB0D+1Lfhlz3U2Bfwgxa2O
         mLTbrqxYV2pMle8WxxBzCOTFce1t4gdEAZLSA8xyQ2MDldq/mCF+tsXt3jKwfev/+btQ
         +ysVUd40weiiFTopc1/02/KVwy4OFlwdxHuTsVBtIyGNfv5fZuuHNQRRV8HKDx1pLmFy
         VgzG1O3VdryE5w6ZTNzObHSm4e1YLyz4Tx5PGWnHOlTmeK5DeW+dkY7i+eYD+dtA2+2T
         iW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424332; x=1782029132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R9Rksv4cSEYx49OcGoEBr2k/skvGa3ntd8d7f4HoDII=;
        b=VCuL3Y5clvInwSwuNK1g5qtYm6RPUYJn2U8P+sLKgnDyU12GK9LAu8lV9mDJVx1fuM
         0+/VA19FIjK8X+/tj+pRZE+5Zl2I3CCHKRpmKZ/PClwnnpxvRdnKJDhlSRqcusFtY8JJ
         JPXUG5s78dkPIaJZ9r/utqsEHA0WYuutp1EY1756naifesrO4r/V4qeClYb7iRJhTDeP
         ijJhPhBIhV6bb/ywr5alYh7Yran02wjs+z3IidH9iAH6zWXN2N7gxEAEwz/8LVzVYpUU
         i8tmGcHhxM4Avv3p/XsRQ/BRJHVsBsbAHVUfnU+HfRP3X7xrn64VX2lYqXkYhw9r1fgz
         6vcA==
X-Gm-Message-State: AOJu0YyAE9U+98zzw5RMfDSW1XHIJjOczPcmX1AOI9fe72KmbxpTqIK4
	rG1+qqVE1R6gremglH9/nh47U4Mahw3yC8Rk7b5Tn6YTSYnP2kRmFm+Jp0H49zHDPSdlw8R5b4s
	um2d3tB5oYub8+rP//CCAbpIEavbQem5BWP/FtP068e4PMmEVjJ+xxxgPofKHGjo+VN+z
X-Gm-Gg: Acq92OGel7UKXxLRUfb6BPrLrTQREX+F4F32tbEdGdeAzTYwvxRsdmzFl1gcbD9gKo0
	grOzEQJsI5cLy9Bz+ducOPZZ8mySiNYekAJcvXoDDvdyp7Ou3lkGtg6N8xb63G6QQ/mRyLyOV6u
	w0ZU4GkG0IUPuc+fW22WkkmYvQPW9wrwA5VkdBD5XBx2fZWlTcAXnAoJYMtCp2zYOzNZ7RHapYc
	n/KKOpbOZNqaPZwQzEUVECFXHGIKYVBfj02y3b9mJr7s20tsBxkD8iimcbC/slvyJ05Ro0TVu13
	BrF/C/u5FCXKAM6DsisMGjM82SbAw4/+smIsScSWQVlTQQMaNJDeOOOPbZf9vtQZK1x1vt0t+lk
	/8SJEB2Dtzv/xlN2mZtYFvBOGeFT2YRemM/K/KQYx
X-Received: by 2002:a17:902:f64e:b0:2bf:2015:5b94 with SMTP id d9443c01a7336-2c4104118damr107951285ad.3.1781424332446;
        Sun, 14 Jun 2026 01:05:32 -0700 (PDT)
X-Received: by 2002:a17:902:f64e:b0:2bf:2015:5b94 with SMTP id d9443c01a7336-2c4104118damr107950975ad.3.1781424331938;
        Sun, 14 Jun 2026 01:05:31 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ca31sm67309225ad.55.2026.06.14.01.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:05:31 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 14 Jun 2026 13:35:08 +0530
Subject: [PATCH v2 1/4] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260614-adc5_gen3_dt-v2-1-32ec576c5865@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
In-Reply-To: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781424323; l=4937;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=WIsZ63sCQ64dVMlhv7s4p6idYOqkQ1ABcVo8fUUo5wU=;
 b=5dM7ykcV5A26umbHWnnWpcS+4jfgcX3c+LrbICItVRiSnkUbe2Gx7d30xdTrWZTSAtX5ZS3LH
 IR68NFj2ySADrrPuQBRrMlNnk/YNEqwLjWxhk00O7BMGojRLYcnGoZu
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2e60cd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uKufQnq3ocnfyFJwv7kA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Z3koX-XWdIA57awjuQ5u_1haF5BYmXTG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfXxFC0bnOmrGkB
 DXLzPE9kobsLSNj8LI4OznBTL2P1arRGPuDwSEcZOb4I0VVHup1ZPyIt9J/3DCqVRZqdqMNxQDn
 ZUW93r2jVnHUeJtNLwoB+pECutpSwCY=
X-Proofpoint-GUID: Z3koX-XWdIA57awjuQ5u_1haF5BYmXTG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfX4CziBtKk/kuV
 8hAkOqgXAzRlbD9g7IKYkTBUz9xLWjVglml5GVDGvk2GgFxlfR3PCpRdAPv8CqbV+D1pVMtV/K9
 6/V61AUbsaRNJa+18/HfVAoChVIqZNwNEvBaLcbe6TOlNZ/XmWZPdYLXHLj1mipIqedo1ZA3a2B
 9hRh2mY3aIXnIgyRBu5litu8hm+6qG6kd5liYXkktjLo51Hv2yAl+g5OaCt3bKXIlZeOBcxgCb5
 IkIbb0X7zyZR1iuLU0JmarbyZpgaIdP5YxDkQ3RHUD/zaPA30wImwalmEeCDvLVCUz0NQ33qsaU
 +rSkSqcGbdsm1gyAahLwy0DwpXkeMql39mR34Rhp1NCX+Aejt/Oo1q7AzN6hRUJfek5QVm6/d4z
 hnJqWdAJ7Vr5no3vIOxIKZuFaHyD5QmU3cAyPxjpMBPq/vE8pFmMZ4I1dolwQoN6vfsXQLlaCah
 7B5AIQRWhHT+B7lwT4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606140079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113032-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3C8D680996

Add macro definitions for virtual channels (combination of ADC channel
number and PMIC SID number), to be used in devicetree by clients of ADC5
GEN3 device and in the "reg" property of ADC channels.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h | 88 +++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
new file mode 100644
index 000000000000..aa8e54d7e786
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_ARM64_QCOM_ADC5_GEN3_H__
+#define __DTS_ARM64_QCOM_ADC5_GEN3_H__
+
+/* ADC channels for PMIC5 Gen3 */
+
+#define VIRT_CHAN(sid, chan)			((sid) << 8 | (chan))
+
+#define ADC5_GEN3_REF_GND(sid)			VIRT_CHAN(sid, 0x00)
+#define ADC5_GEN3_1P25VREF(sid)			VIRT_CHAN(sid, 0x01)
+#define ADC5_GEN3_VREF_VADC(sid)		VIRT_CHAN(sid, 0x02)
+#define ADC5_GEN3_DIE_TEMP(sid)			VIRT_CHAN(sid, 0x03)
+
+#define ADC5_GEN3_AMUX1_THM(sid)		VIRT_CHAN(sid, 0x04)
+#define ADC5_GEN3_AMUX2_THM(sid)		VIRT_CHAN(sid, 0x05)
+#define ADC5_GEN3_AMUX3_THM(sid)		VIRT_CHAN(sid, 0x06)
+#define ADC5_GEN3_AMUX4_THM(sid)		VIRT_CHAN(sid, 0x07)
+#define ADC5_GEN3_AMUX5_THM(sid)		VIRT_CHAN(sid, 0x08)
+#define ADC5_GEN3_AMUX6_THM(sid)		VIRT_CHAN(sid, 0x09)
+#define ADC5_GEN3_AMUX1_GPIO(sid)		VIRT_CHAN(sid, 0x0a)
+#define ADC5_GEN3_AMUX2_GPIO(sid)		VIRT_CHAN(sid, 0x0b)
+#define ADC5_GEN3_AMUX3_GPIO(sid)		VIRT_CHAN(sid, 0x0c)
+#define ADC5_GEN3_AMUX4_GPIO(sid)		VIRT_CHAN(sid, 0x0d)
+
+#define ADC5_GEN3_CHG_TEMP(sid)			VIRT_CHAN(sid, 0x10)
+#define ADC5_GEN3_USB_SNS_V_16(sid)		VIRT_CHAN(sid, 0x11)
+#define ADC5_GEN3_VIN_DIV16_MUX(sid)		VIRT_CHAN(sid, 0x12)
+#define ADC5_GEN3_VREF_BAT_THERM(sid)		VIRT_CHAN(sid, 0x15)
+#define ADC5_GEN3_IIN_FB(sid)			VIRT_CHAN(sid, 0x17)
+#define ADC5_GEN3_TEMP_ALARM_LITE(sid)		VIRT_CHAN(sid, 0x18)
+#define ADC5_GEN3_IIN_SMB(sid)			VIRT_CHAN(sid, 0x19)
+#define ADC5_GEN3_ICHG_SMB(sid)			VIRT_CHAN(sid, 0x1b)
+#define ADC5_GEN3_ICHG_FB(sid)			VIRT_CHAN(sid, 0xa1)
+
+/* 30k pull-up */
+#define ADC5_GEN3_AMUX1_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x24)
+#define ADC5_GEN3_AMUX2_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x25)
+#define ADC5_GEN3_AMUX3_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x26)
+#define ADC5_GEN3_AMUX4_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x27)
+#define ADC5_GEN3_AMUX5_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x28)
+#define ADC5_GEN3_AMUX6_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x29)
+#define ADC5_GEN3_AMUX1_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2a)
+#define ADC5_GEN3_AMUX2_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2b)
+#define ADC5_GEN3_AMUX3_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2c)
+#define ADC5_GEN3_AMUX4_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2d)
+
+/* 100k pull-up */
+#define ADC5_GEN3_AMUX1_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x44)
+#define ADC5_GEN3_AMUX2_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x45)
+#define ADC5_GEN3_AMUX3_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x46)
+#define ADC5_GEN3_AMUX4_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x47)
+#define ADC5_GEN3_AMUX5_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x48)
+#define ADC5_GEN3_AMUX6_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x49)
+#define ADC5_GEN3_AMUX1_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4a)
+#define ADC5_GEN3_AMUX2_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4b)
+#define ADC5_GEN3_AMUX3_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4c)
+#define ADC5_GEN3_AMUX4_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4d)
+
+/* 400k pull-up */
+#define ADC5_GEN3_AMUX1_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x64)
+#define ADC5_GEN3_AMUX2_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x65)
+#define ADC5_GEN3_AMUX3_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x66)
+#define ADC5_GEN3_AMUX4_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x67)
+#define ADC5_GEN3_AMUX5_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x68)
+#define ADC5_GEN3_AMUX6_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x69)
+#define ADC5_GEN3_AMUX1_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6a)
+#define ADC5_GEN3_AMUX2_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6b)
+#define ADC5_GEN3_AMUX3_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6c)
+#define ADC5_GEN3_AMUX4_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6d)
+
+/* 1/3 Divider */
+#define ADC5_GEN3_AMUX1_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8a)
+#define ADC5_GEN3_AMUX2_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8b)
+#define ADC5_GEN3_AMUX3_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8c)
+#define ADC5_GEN3_AMUX4_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8d)
+
+#define ADC5_GEN3_VPH_PWR(sid)			VIRT_CHAN(sid, 0x8e)
+#define ADC5_GEN3_VBAT_SNS_QBG(sid)		VIRT_CHAN(sid, 0x8f)
+
+#define ADC5_GEN3_VBAT_SNS_CHGR(sid)		VIRT_CHAN(sid, 0x94)
+#define ADC5_GEN3_VBAT_2S_MID_QBG(sid)		VIRT_CHAN(sid, 0x96)
+#define ADC5_GEN3_VBAT_2S_MID_CHGR(sid)		VIRT_CHAN(sid, 0x9d)
+
+#endif /* __DTS_ARM64_QCOM_ADC5_GEN3_H__ */

-- 
2.43.0


