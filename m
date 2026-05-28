Return-Path: <linux-arm-msm+bounces-110040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBCtE6KoF2qhMQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 04:29:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E37E85EBCAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 04:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0CA7230234FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 02:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12B130BB8D;
	Thu, 28 May 2026 02:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBncLDQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZiBy+VYs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4DA30568E
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935374; cv=none; b=EOx2tPhJ/1Nn/z1HY4gJI5U1Jl8mspkcvoWSlzqVb6t1XAXHJzhq+82eHBYBadHf1RwZQVtNJkTRttXTOgnUzvX/ZjvMZPHer73Fs57AQHAMCepDuS+uT4L/aSLLOLw/Ahd39fcy6kJRtHcpbbxR0Wx/opHHDk1xhR0fVYhVJ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935374; c=relaxed/simple;
	bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PuLCsh3DPUd1YLFC5mKQzEdNvQBrQ35IVJRad940isVrpa5QOgCwpO7oANp/pIBkdQR2Qxa9W7cR5ep2FLU+wXAbnCf74wJqd+sp6VKzRczzK63ivpxTQgunrek+NHQv0ZHwzA5Yt1eo0Z3wpmwT8D4q3fZRjjWGKM51w9MMHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBncLDQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZiBy+VYs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKnJxE3010118
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=; b=BBncLDQJBdMMGNdg
	ksMTizsD2A657dRshFN3Mxc8LKJJdDdaWO+nj/FIUoW/EnIUxT/CmpyXK0b8pNj2
	ChQj2LykFj/kF1CM+TeGdJ8aX8YqxX27FZyQECPf5zvYfGfTbdJG7TkQGlCm/CUj
	upFKzCe8gRtP2elGqeognByB2AAQHzknag2nitLbNahHWJ3Iy+wikXxu8beM7fFf
	8DswIjiYDcbBhKiSsT60rVrHPLoiFOLES0I5hQUGMgTws5fYzGRodPOgeI7ET7/G
	or9aPAEELDVjHckmaKiyRSmsPXCO4UgUeNYSzLnZv0U7hTasIJEORDZ/OA75Mjei
	HkipPg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yrgyqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:32 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-135fe34cb98so12601730c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 19:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935372; x=1780540172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=ZiBy+VYs2pIb0OnQaxiSljYsdyOp63UA7pDMQ4m5+IeayHUr6JptI9/EF5CIyOGcIX
         0ub0+Ua9M4PCpQcMm1fUAVaVNomEDlQsetWemlnxE5IHiPWvsKv/5Otc/Z3Lha72e3AP
         e++siFwPn8Ek0/afzwIyKkUKXnjFghg+Ry1YCB0HQ1iPyBPju0sOufVNiTT1Ko9nwnHj
         JmZpjDkb92c5gD7hCgShy9hLeAwJ16yZhjM0Fljd7JAGo8v024xvwmNpd4EDookdGzmQ
         Gh7PqOQQJPRBfV4oyqySa6i8xwCodFOa0lP6rnLvpfZHaWuY5+5Ib7cWqhJgIC/uzy8Y
         Im+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935372; x=1780540172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=N/5W0iVCgNUhtgXaHSrN5qxX+MqxRjD17erqWecxVZUsBL0MSC1dPOOXSayAgwyO7u
         IXUZTxgvCC4bOLwmqFA0ODuSPyGKir718rfbNIwJyPwRBKRHIaT4CdsOLZ/kEnSFT75S
         XYROqLeHryC0bfduDYdULVGfv3y1Syakzwvzxz0hU4hbxxmf1Qu3/GPwHjHsPAD9aGaS
         13NM9QBlKh/1yiFm8qumKE29UOzSfrqP00Os1UrsqhKsxt1nf67mFC2Yz40FF9xzsuBu
         rrA+jaAAkgLbCBQYZuxZqSl69CTggN67PBLFTtHpc3AytwZEQQlSJ/k4S2nnjCAZIjqo
         McfA==
X-Gm-Message-State: AOJu0Yy1xmhm7B17md6RR3//+zmiq757imnoBfNtg18kc3z82zcLsguG
	VLV2b1Z+h+vP8Ty+KnQVQvVMaGyoJSi4mvoTOy6Fa40o/cXtJf+s6qacEIH/5nHED+RdmMjsz9+
	hrRGoop9w7DuYjM+dd3LEuDMkKko0GaeIoUdONE2kNUSDPYfgF3yIBkqRrgIp1stXWtHaHFVjRh
	LPcO0=
X-Gm-Gg: Acq92OF69itIVu6rpVCKO360rOXZftwI8Lb/c9z9nSSA2YNZfcRCFK85pjJrzGtoj8g
	pUxqx4i7sYYn32nRhrBo3C5Y055cIOAvs0v+fCZlXzAFPR08kHI+rlyHJSYZMLy1Nmns552GueT
	HC9tYj1soLmiL743Cc1zj4BjmyMKAn9NNroEIz4Xueuzfrw7OXkqWndL79slrcOOAADsuSDNd7U
	yiCWhMrJpH5RuUOgVV2n0ZkYC3vjX/Mf0fr1EXJgV1vXV8HeKPEpDcSJCaj4tbuHS3MJ9nc3MWW
	TSoSQsIOw3vIMaM8loscrdRUSPuo8ocCaZml8uLmt9Xz8mTaJH0XLlWPc7ji2oGpmxNxPt0fqCr
	GZE5DpoQurpVTexXEcP71qJO2yOY22Re/PqEFerz2NSluYeWEyu1IPV7WeEgRIwpdhCRbjm30jS
	n6bGQ=
X-Received: by 2002:a05:693c:69d3:b0:304:5b65:5971 with SMTP id 5a478bee46e88-3045b65727fmr6618457eec.20.1779935371828;
        Wed, 27 May 2026 19:29:31 -0700 (PDT)
X-Received: by 2002:a05:693c:69d3:b0:304:5b65:5971 with SMTP id 5a478bee46e88-3045b65727fmr6618454eec.20.1779935371287;
        Wed, 27 May 2026 19:29:31 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:30 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:18 -0700
Subject: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref clock
 to RPMH_CXO_CLK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=993;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
 b=COh3DLSrUdls4S9gugZcPaAmxGOWG2zHoFNWQeMaQwF0siTs3LgLdHwH7udGTkA7m5AZol4NA
 NGkgV3i0rAvATSrWtmxtT3wBl0lboI0maZuI9rRecrfHpqUXoUSqsZk
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfX/TjhlCtNt0mQ
 IXmKklzrdKFhkC44E5nHr1b1/5PkPkQazh3IPQ2e5WPHeynxdKTEb+y7+PRpzHmwQG/PQ6/Jz4+
 DTdRwerIkkdvwE8Sr8KGjGtMWurCa3FAek43SambAZg5Rxo7xVQYzwM7tJTRjctAEbX3fTLulJN
 UyPGIjZOcVWmXZry7P/fR0ylXktCOVZ74WqShEy5R3QvRj+4XrFSPfQ9HPIeZU+REQUHrbueWs7
 oFffE4LKLkdpmqVLEDoae7lZ07+M3bY4KtPMioIK84tFDpJhNp+3XTqph+bSo+7QGckQBMc2BjP
 KqXUTbjsIkdexkyeQ554jS8sWdp6MIaX96tV1sz5WIGiBnyZL+0FsoZZ80qLcbYb2v3jSgiflQk
 zlRjkdRsdjNNRuaBhHLvR/PFb1q3GYtcavr048cdkouBMHn8ASTUjm79YYHP5M/D3xFgPtHy9QQ
 stTW0J4XQyy6itqBQRA==
X-Authority-Analysis: v=2.4 cv=PLo/P/qC c=1 sm=1 tr=0 ts=6a17a88c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CR5IuhOMo0Dix3IxAI8A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: AqpW68W_pwGkW7IcHAvDw0R8GNOQ_5fD
X-Proofpoint-ORIG-GUID: AqpW68W_pwGkW7IcHAvDw0R8GNOQ_5fD
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110040-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E37E85EBCAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
directly instead.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index eb45adc8a0a2..e6c059708912 100644
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

-- 
2.34.1


