Return-Path: <linux-arm-msm+bounces-109410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIFmJgi1EGoUcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:56:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E59A5B9C0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89DBF304B900
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4985738332F;
	Fri, 22 May 2026 19:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqpD/lEQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPlFWwJ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EDD37CD27
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479686; cv=none; b=Vhv28wDLRTw67E3ig0xRmh6vCIV5RvBLXd5q6Um6fy2VKXSW6tLzueVTi43o/Ja4HVlrqPfZFcfWbnlaZMcwVun1DpzID2eD8c3mAXhf3NyRevH8K0XusSr24yrq0lTRAjfL/M03LQKmduTX0fm6aqMerQACF9e/Eiil2HH2nfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479686; c=relaxed/simple;
	bh=/xLph1CXP5xs0PW/hYyRqUhWSHPrZw5QMZAzBYEKBHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sb+WqXZeRPgS7syO6rI5qbs4cXC4smyZOjss1HjCqig2KLt10FFMwXQBZuJ0QZH5IuZOaoqQQO45WLWOMVIc1gMpcw9nTW/+oJXuNBQN3IkzatgouIlBKlIZlrNr/sRcyoGuAr4PMEkBujPB/I2Pwt4F+GyEY5mR/ecOZE0+Ilc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqpD/lEQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPlFWwJ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MIOlfZ4007647
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VgYYdEDfmXm
	lKmeQWTeO6mNissKEz7AQbEDA1qLtlKk=; b=VqpD/lEQPvFlMAIWKS/kABcoTPs
	KcM50F9lZZmx7AfLIS7IYS1IemLstb+eZdP2qStl6x2wZnjt93W6i9mvQYkqx+l3
	HhWj5yeD36ENdRLzi3a26GGS+dbma+hbUL5XxK3NdSQTKNkKDOP/2z8NRP3pTckU
	Sb1KCFoIT8+vMPEAQxam/GGDLWWLrxZNBcYlWmu4fecZkat+TDkiXxn2IO1Opib2
	ojqMxvx9FLF8btFb2ZOHek6Lzx1xAxbcVRXqNM6q8wABIiJv4Bkr8aLsN81dVAnj
	gtawVc9xOw7OZnlc/w5D9jTTH20yXRNYjZ/U+/d42QYsXo0LHmDVdOXfxdg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eavd988wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7378ad0so80278425ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479683; x=1780084483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgYYdEDfmXmlKmeQWTeO6mNissKEz7AQbEDA1qLtlKk=;
        b=SPlFWwJ4PygT72gB1o4juT2/rYMtA5IdHk93BpVkEqVEyuwK+vQyT292S2B9WsYdT9
         Y5UdKDFgVJse3dmJ8lYz0ciJW0EEZyq+3G+rZD98NeKQ8WMfK/slwzZZk4rkAY6PTv9N
         N4JZUKOigHJ1idw6Gx+utybfcMx3j08xo/AGxQZXNtRm7mXkNrvotzLnpACGpc0oVBMk
         K5qhs71Uy673YOkBKOBpYeqj19XDWh79W1RLxMF15eeki/nH0FqOJqogUjDeUrbf+uBX
         eFWW1YAH2Zd+SlJaw4Hd2LrvaIPOYLkSh/BxiR4KCvW0J8QitMZFR4XW7IEFdgCjmHKJ
         pafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479683; x=1780084483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VgYYdEDfmXmlKmeQWTeO6mNissKEz7AQbEDA1qLtlKk=;
        b=YSTxsw4Y+hKBm/mRvHvaq57BpIzSHVmPvxLphD6M1jhtnylcqmifMYiFHmaxPgzXL6
         zGHiN/Bq0qcT2M+FyqWYAa7nNAPtM4PTP0yPWh102o2cjacXk41z7WMtSgP42YM/zwIa
         cnQTqV3SFTUFiVmD/+lj6aGs+QS0kvKlS/tEhk9V5E07Glh+xCscZ4WtVMVwiCcbtjA1
         QGO6dYN6C/GqHsEAGNbtmkfmCZMZ2JXCre3GlYRSR7Fnd3rjBx8+jp4eIobARDv1pC9u
         f/GDnSnwk12vV3AgOdElDrkDqDAtdPpK/MdsLe4Y2AMTVrVRSiXgdD2eXIrIjO5p9DX5
         tFyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jMUtyqLjP0mOyNtmNd5unIaj15SAZu+Q+VNciXiGoSRveduNozI6YjwGiRl6w0QXQatzskzWlRfTsB3xU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7mFs7IbOlxiuTxkfdi2kwDt/87GgRXfC/24/tBV2hAvqgrXpz
	kaHLptvLVd7B0sEO2bAraUgq53Pj/uC0PYYj0vbXgUcnD6cqFSoht1tLlTYOSO7KS5FDtWqHrX1
	cykA0VfNydeahNEML4hBNJ3eQroTJKTK6t51QT/7xDWGbOjES8opjvs9PpGZGRmjUYYOZ
X-Gm-Gg: Acq92OFg6v/SvKRZ4K2A6zNeTJSfHBzlXjgc/kHQ2lHpKF9gjkdaJ0QFpe199pRCXyJ
	+zhk7tt+mvf+zS6WSbBgTy5xJn/qc79t7/b/WkzU6VpENV0A8H2YP/B4RZMF9hQs4bLyZ6I09Vz
	WU6etor09z4ps4Shk9ABw3biKtHYFNfPFR0XSouYCftLKLMZcIzM7NAY40vb2L1df29WOR1xRqC
	czuP5XeKTrgpJmmK9QL3v/ajPpgZCeKZaKi2sHcRuRX+ED+/e2iMVMpYAHqnE8mBx2dFa94lhi/
	hU5mSX620kwRacAYr+1ROdLYw3dVsOxQHP5IqfxQUgCcSljc0GnMSkbrSn34Pbwg0aW7BFGkpt8
	YC/xkTjSl7WaYsrG//CpO8TAIC0npAJ9/lKCpLw35odoqeqtM
X-Received: by 2002:a17:902:f705:b0:2be:3dbc:eee5 with SMTP id d9443c01a7336-2beb0365bbcmr56286845ad.2.1779479682507;
        Fri, 22 May 2026 12:54:42 -0700 (PDT)
X-Received: by 2002:a17:902:f705:b0:2be:3dbc:eee5 with SMTP id d9443c01a7336-2beb0365bbcmr56286595ad.2.1779479682054;
        Fri, 22 May 2026 12:54:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 10/18] arm64: dts: qcom: sm8550: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:01 +0530
Message-ID: <20260522195009.2961022-11-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX3XHQBZD1rcSG
 GhZ1hio/Q7qXpdhdIGv4MI1Yp4NYw8mVD5eTUEdkDKpIsVSb2HNDPnXLEstENu7fs/UPC0b+FfK
 NUoJUEYpGYHIhUFy9t2AcVoEGsj+XH7WhH2saa2sQoOdDIQXdNcya/EQLBvcfCR+Nnz2tSYAZ0V
 ES0kAInGyBkrKDHGMC+uXoKPK7odcDbsezfx0JL+AX/mzEbvcLsgB9ngavnO55erkfFuanKDPiv
 DFaRinfhF8WOjQq4I6wjLgUMwHo9qgRkU8cX7qKtb5N7WxplkjiAa+Aev5a1mzb8QnAGLtfzh+O
 uYhN3tERuqZkzGtwcx+zmPKSKHuYDk0p/74B9Wut/zn8Z3qLPdxWiVlhjo9drZeFoyXfLQK983D
 3QGRAErmNiqXzAv1u3Ad27T1AqRTiDF2bZmsqvQX/hCnwq8Nez7ogeksnopJ1pDVRwXw5q7mNUi
 uxSEqmmCJzvLHKH8u+A==
X-Proofpoint-GUID: hov7ZFWdcrjmsVXYdM6233zCrY851IEb
X-Proofpoint-ORIG-GUID: hov7ZFWdcrjmsVXYdM6233zCrY851IEb
X-Authority-Analysis: v=2.4 cv=F+dnsKhN c=1 sm=1 tr=0 ts=6a10b483 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ZJQsJAtiAu0WCEyc7p8A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109410-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,1c:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.31.64:email];
	NEURAL_HAM(-0.00)[-0.986];
	DBL_PROHIBIT(0.00)[0.223.255.192:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E59A5B9C0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index b7a7c49db077..27ef1de3edc6 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -391,6 +391,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -5533,6 +5534,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2c000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@8000 {
 				reg = <0x8000 0x2000>;
 			};
-- 
2.53.0


