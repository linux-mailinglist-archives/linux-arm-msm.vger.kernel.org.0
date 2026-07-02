Return-Path: <linux-arm-msm+bounces-115857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0NiELdgVRmpMJgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:40:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0076F4480
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:40:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RYhtZ+xJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QmA7VV3P;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115857-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115857-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B98C301587D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 07:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F463A3826;
	Thu,  2 Jul 2026 07:36:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF963A4539
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 07:36:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977788; cv=none; b=MYeq+pGYPea1qBos85VAkJ/i05vjFTWOLhy0r8f2cDrqkrkl/sscI6EPSFi68QlyFE5SzAiB90tYflArTgtR6WqvZnz1I5XVpbWN/jeS7V9kNBSXF64QcP30KXykneVVD/FkgtEwu/6vF4nz6gQgr4KFXs0jE1/DJM4axCx9YWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977788; c=relaxed/simple;
	bh=omG0nxJB+cR1OXkteOYajtvR4fNE8kStbx0zl5btk40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ze1qfX883Wfbtl+pITSt3AqJEtt4vBwwC0tcnjRsa07osdew4ovSxTs99626LAZKtnzH1bpSyjjS7fam1ZeZzD0rWhlHawADGMOj2UZjlkB3VsdmY2wVJ7mn8DtcYQ56omO6DTcaBAtaLDw5jUvZCg513abBNoFTtjjAGNKRkII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYhtZ+xJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmA7VV3P; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621LBC82920557
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 07:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmsJYIBGEJqXut+hGeT5xfQUlalTAABspgm81N9sf3c=; b=RYhtZ+xJRazGJtRW
	Cgs7nQ8DM6deCNH3MzCoOcX5e6JSPC4vw8jdSmGDjNCUryqY/gdGH9BcA5kBIZZ2
	ydfUPD0O6jETJn1NgD4KJe1Z0r02BQ3GyPvRdGSR96lMAZBJdo0z3RMVq3IxFPsi
	PXt3ghSJbF1L4MX2+0ClJHYGHlV1CAACk40w+5YRsvPS8YY9vujmoYMuepjo7IRo
	uHfFrxbM3V5OwB40CLLWe0h+XokpOnmvF/vFfjzjPEt/RmTlenApYHEBIJHf2mt7
	oATDH68SOLsdsWQgy2SWJmBVh6RtREH4X3u8l+4CX/9gyxTYDOQfTScQy7nMuDUF
	VbsK2g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q0bpea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 07:36:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca2396713bso13592935ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 00:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977785; x=1783582585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmsJYIBGEJqXut+hGeT5xfQUlalTAABspgm81N9sf3c=;
        b=QmA7VV3PePcxzZ0v0zLY9dJsa6CMuWq06tYRtcreSbjK/CJjbQqKm9wBywTJpA4siO
         AaHX0NslY2fqJBGrA1uiWtjEwV8Z+fiAL7+vNAP/v+P1np6hG/jgsIfpA5nLkQmfLUZn
         FCueKC3QTcrARDw4gsOXLoTBq3G+nsceBeiIsp865bxAiSbVyaxw0eiCtye1qSE8fq2h
         FT/M+vlDM5A/uVD3a8zmy6fq49wE4pcTteZU+m0LerHDvpjKNZEq9FVBgEt0h9ruXNbK
         u+8HTxrvUqrjKJWx0pAfKoLe27uO7jndLOgsAY1cn/nv5A37bZVYghiyCFaBO7UGpc+F
         SQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977785; x=1783582585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmsJYIBGEJqXut+hGeT5xfQUlalTAABspgm81N9sf3c=;
        b=Y6z0XBnU6FnvrfbHZ8m4iBVAmsjyv5F5n7gyc0DLqFx5r1WFEif+a6smoTvFHnlkX5
         eFS9LHCIYQesM7tNGIobqBzWk7hBuTE1bmFvmL7LirkfPNobtwPG54JCP7w0slNr0UfI
         SMEVBAPeZfBbSaxypx1G0eXN68saBNwwxVe7zTjUr6q2gF6gphBNaE93tpK/d2Mic1yC
         v6jFKAK3xLR9fq7S+1tSQ2pFRvpI6Wh8x8YF+aaCiVxyvx5GaoEtUzQeLWTTE8XrZEtd
         WZSvNt2HfUN4TnVN4ML2aR/4dSAvZIPoIUz6uzTCBm4J02BQWd1AMncK1RaJ6usDWswm
         LiLQ==
X-Gm-Message-State: AOJu0YyQCBOx1YPoPDNN7/32yhg6ZenTBc96sjf7YEdzWb2hUJqD/j1N
	pubd247hQ1BS1veUd+irDMvV7VXs/Cj4dwMjJ3I/p1ZoX+0D7QKIXOemOh90HeZ7S4tqdvM4osP
	/MHjmp7ZGrcoTQ73oRhU4C9gArdNjTvNn0fzO94jv2hiKAWRGLSeZLmNtzKvaEN/pj4AN
X-Gm-Gg: AfdE7cnXNrDP0qZlLgvQnoinaacQNQj5kF3kLDOg7Rd+886ZvTxxF8z5CxGf3Wui4zB
	TdVZwT/RBUAYhSRsvri7M9Ed1bM8NYtlg04foGhah5IAmyYjt9/3+XXG0Nh8Z4u4bRBq/0XBg3m
	u4L7FsXr6xSsoQk39B5vTmbHK/48HXio9k8U77+3l33UIh0IkypM2aYu1ClmhXslnuXqBqf8mGs
	LHeuE/BtXi/02n2A1cJFt+UzfFkCcNaHfjXTv3sInVUeRPLrKO4l7kJrGlRHdCdCTa4c9710+c6
	NcEIVOvabHLmFWqIFQuT3iVMhR75OdkxryT1gs6zEFb/sY2ykJT+T4Ew6+wvCkE4MDTUhxCjLq6
	Uqcug+ztbAyiGRVfROZdMMNkJhLK4J9vQT/z18utEqvPz8cUZbVVHricCBw==
X-Received: by 2002:a17:903:26cd:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2ca9114d983mr40218125ad.12.1782977784518;
        Thu, 02 Jul 2026 00:36:24 -0700 (PDT)
X-Received: by 2002:a17:903:26cd:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2ca9114d983mr40217615ad.12.1782977783835;
        Thu, 02 Jul 2026 00:36:23 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:23 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:17 -0700
Subject: [PATCH v7 7/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-7-776f2811b7af@oss.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977773; l=2459;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=omG0nxJB+cR1OXkteOYajtvR4fNE8kStbx0zl5btk40=;
 b=4ELL36ZYt6RoKO2c99VYKYAJdiGDhRbzoBaWLwQ4xByk8SbAMn7YUDQsucIuc0kmLupoMXXip
 oRawXaSF09+DExc3lZH+PleihU41KroUgHngwkqEVVnySOIt6jVnT/a
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a4614f9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HJ1A0pFH0qRQ8DuBKaYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Z_UBzbuM1nOngnx0s25sxxar2YhPY0nr
X-Proofpoint-GUID: Z_UBzbuM1nOngnx0s25sxxar2YhPY0nr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfXychpVh9MZfEi
 Y4P9GuWPUf3dDriWdhqgKGORk5BpIDoUsz0eDtJdqW4+c//LgFtmmEyzypbagp8MzIpHFOGbK0A
 +e+stZwJRvmGQHgM4fVSVZ65OMrcAnBMoj/OUbSWeaDGKeB9fgeblBy+XFq09MDexW3UTTFSWnt
 KeA8Jwa1LO2xSEyuDoWOMcwxjf/aHtvMJsDt6HNjnYuCukpUy6oFCjzS2zLs4ZTmf7X0Wuz0dmO
 gU+EBQTefZx/YYJjaJpRs0XB/DRY5zu4s7Lk93yGUYjBcSEKqMOw639gesDZL33/sqr25qnuA1z
 7I+jcCiT7RJQv5cnE7KqWtX5Fa7h5+80xJy8KbkHQMAme1ml9wXYxNDkezsKVlxVLjcgmy0jU3c
 7+M1v1vm5p0Q1sOdEQm/oamd45IhUKlYm0DxxRA6jIGHiSQkPiMrCB2JOElu8FqbZVZMTE7I01s
 fdk8YCTLfo+9arDPAOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfXz2B7zPE17tte
 lRl/wbufhnYHclm8rw27Mg+P0jS72pxjQcM4zAobjwGkQa3ioSbE1ynlIsCeP271Q/7JN401cB7
 jGwZ0dUTah+rO2eMugwe8XlMVtxxTj0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115857-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C0076F4480

Mahua has a different QREF topology from Glymur. Override the TCSR
compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
LDO supplies on the CRD board.

Unlike the other PCIe controllers, PCIe5 PHY on Mahua gets its refclk
from the CXO0 pad directly and requires no QREF clkref_en voting. Hence,
point its ref clock at RPMH_CXO_CLK.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi    | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 9c8244e892dd..fa5229064b10 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -19,3 +19,19 @@ / {
 	model = "Qualcomm Technologies, Inc. Mahua CRD";
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 22822b6b2e8b..e6c059708912 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -115,6 +115,15 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie5_phy {
+	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };
@@ -286,6 +295,10 @@ gpuss-4-critical {
 	};
 };
 
+&tcsr {
+	compatible = "qcom,mahua-tcsr", "syscon";
+};
+
 &tlmm {
 	compatible = "qcom,mahua-tlmm";
 };

-- 
2.34.1


