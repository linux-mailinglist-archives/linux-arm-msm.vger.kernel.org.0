Return-Path: <linux-arm-msm+bounces-93671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBe3EhlDnGk7CgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:07:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7893175E2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1A1C310B91E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA36365A03;
	Mon, 23 Feb 2026 12:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AyW97KeE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqbWzypR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B805A366803
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771848123; cv=none; b=sZ1DEJHQjz++3R3rpLcxOa0N+yG2N9HbWW+81+rYS6kq8waIgriy0MxUPNRwDZhsz6ceppnw0iFIpXb7tzGhkIscWzeTEyjDOCHep3yvCKfWYlG5uZV0IdYmm0Baw3CWCFwTJuLkerLRzNxJLGEOVla5JbEcQboBR2XWPl+ctCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771848123; c=relaxed/simple;
	bh=j5Ix9t2krSPr+pvE6bRRwSqx5ClVg6lCGBuwRlKrK0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1Vmbl/G3ypXHdi4d4lBsNAeBrZObML1ZD0BKoZ2mJheNf2RbCLyt1MdGtWj7mrGkOPiCHwSmPE3JJ3IX2z8vyB6IM1jh9othFmSN0cVXJuUitJBQw7b6hLJzuFtNbhmYWhX8XJ0rJF8w53fxM52rDZ+Q2+AW89OGdoRFPvvU9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AyW97KeE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqbWzypR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYMp5561728
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wDRzvs4lKe6lzoVo9obMRd5reHDn3pymfPmnNclniRY=; b=AyW97KeEouSqfWey
	uV7xLXcu82e05UoWtwd64eSwdGkXaNJcidGFbR9l1bWqrlsgPc3uzdHQd1984hry
	dliwBxQNJHVupCAFkBHbddsCyaEXvKaxpsqCk7PiKzvpPmo19gqkZZ5nAZPRYNku
	7lBnaAYOS2UEZKogXoUxxf7eCk8fJKPaLaACGaeweutBdsh5KWjVONimdv5j1Go8
	BMiKIEy4NQVr33oH4wdaboXKy8LiRnj0udTiZsQSOtcfh0kNvN/rl2mKG2DXEWiI
	kAiPo877w5sSdR61vhK2ciGMEtwR2Z9hKT8jCRCRx9qQEriNSjAQ0KVHbpsAxYCG
	sBkaIA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8r87c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:02:01 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45f16aa81a8so89915372b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 04:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771848120; x=1772452920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDRzvs4lKe6lzoVo9obMRd5reHDn3pymfPmnNclniRY=;
        b=aqbWzypR9TaMXqaj2X0IvKImN3UhvRse5Xi3yrgY4zEpXGcuH6f8hMc1cn0ISIQUJi
         gQphReW6XbpZ7mha+XNiCZGLpc/LgDGaTnGofhXn54KWzB2yEyUQXcV72aW5uC2n8AQI
         26Y7O/F8ps2Y1nQ0qxKmPqu3cRDG8a0c3z6vad+6y/mIO0ThA8XGWbQ5KNvMAcEZyxFk
         X0jRvUEf5kOr31z7llthJGa7L3tchKsNPZDX6g4AoJfJ8MxXbakOsfUNCUXmE66UPtd5
         /5PDXl/ybnWsevOdYtct8OJwM6cw4xKvNQKchYxjNFKxxTrjqMCzLT9w3OnJZOmfzdra
         Avdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771848120; x=1772452920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wDRzvs4lKe6lzoVo9obMRd5reHDn3pymfPmnNclniRY=;
        b=bl1E6/f64Oe/RPxKVUtURyCa5ScF2F6Xl+yIhOg3U1e+Rscme0QTF3C0Kn4wag5z7E
         q8whupc02xfHuMnmVRWX92snQXeJTJNcUiBe+Gopa2pzf+IKyI4+/WlvbzZsJlCv5T4W
         otDuntrqif7F0utjzX7XmWJ0YQoNfmt2+DHUyJNjFYX6+fn8vc/WMvxFgXj2yjnR8Gm6
         g5aBjlrIKa8vU7c0QAATq3idz80VyNQ6NgmlopJ9khDQqyHftko3xpMShcUfEdu7YfMp
         GlF4UIIXe0B8y603KPCv474VLPawT/Fh3OBef8Y8m6+I3HphDtIZU7pFeuAOgQPcFzNn
         JxSQ==
X-Gm-Message-State: AOJu0YxXmsTZzeYeop6J3kwqfMz7qgLQUJPj2fXezCw+lwvrjbk+FS/5
	ltGEEVf5zo3pXdbovgan00lW26UZDJXkktYf3a7rFzi5uzM/qmtln9KZkOd2tugcZ6kUQlWJ1/i
	5z6j+B2cPJjLMpkdV2gQSgPl6x9cvvkh6wDOffVow5uawrQgGbAQ7JTN89D9qDStVsfvL
X-Gm-Gg: AZuq6aJcf88TC/eqOiW38Trcz0/fdoV+X390/y5C5eWAknX8bL2rJSAl9oc/MnXaizh
	tZpvxPBDsqYS61pnlnbU4FtC46TtDs36LXoAIf9piuyE7znQsvmN0wlbhPWNTdf0hZzNqVbN8h0
	/1WqjL1QiHk8l91NI3Gw7isTzUKJYx1kIMxepf8QYL2M6iPu5nprRD7kaQ7QXOkNDPOZIdjlH3c
	7+EPYo1VjqiH25JLvQ4nZ+LhrktveVnxflZhGIOO4wIjDWv+vHtunqhnFfjXjr4psYU1uVACA1d
	JG8MXb5XgzY8LZNPgON8AVTnoTLD20W6uI8cr3mrYwrGkYT5zE50fzaF5bSYH5wi2aD1ei03n95
	iJwqz4nBIY2oZ7ArAcyPxuOOP4sUBfw==
X-Received: by 2002:a05:6808:144a:b0:450:1eae:96e9 with SMTP id 5614622812f47-46427477bc9mr6932396b6e.7.1771848120119;
        Mon, 23 Feb 2026 04:02:00 -0800 (PST)
X-Received: by 2002:a05:6808:144a:b0:450:1eae:96e9 with SMTP id 5614622812f47-46427477bc9mr6932366b6e.7.1771848119588;
        Mon, 23 Feb 2026 04:01:59 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d95sm18487881f8f.13.2026.02.23.04.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:01:58 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:01:23 +0200
Subject: [PATCH v5 6/6] clk: qcom: Add TCSR clock driver for Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-eliza-clocks-v5-6-dcc66df713c3@oss.qualcomm.com>
References: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
In-Reply-To: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=6765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=j5Ix9t2krSPr+pvE6bRRwSqx5ClVg6lCGBuwRlKrK0E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnEGpjH4spL++QeZNSPUIfSYWJqJPBQ3koO0AE
 TI1GdG2HSOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZxBqQAKCRAbX0TJAJUV
 VnD+D/9N5Sh1WiJWw4+sbnc+Pj2u2+L6b2VorEwF2QiZhlK3h1GwKHByvJk+DgXL/l1yMIPSm/K
 Sz4NAnLGEBy1he//yvG3vx7mBge+xLz1mSoagpiUp8iGxzjbiFNUKVh9CdYczwrTEv1AVWgokRL
 AXiofmCqfbRdhm6DTl4/2Km7VO5QDjHJYVklOq9bXY19AL+VzRvxCQckW85W5wjSno6q1Z30GyD
 OxWnFZRbszzG7zxuaVdCWbLSMwCCFcwjhS8leP/bl0Dlrb95RSxnPmPc9PQvI/pfi/wZzJg629n
 H5QOo+P3s8oJAh9DZovvIO0947qLudj+/IhwQw7qhMhwSynPLYmlMV6TnRGxnZO75y88mN4Lbh7
 tzeYXk06sCCgwoIIu2kreaFMYl5apqo3y0zajBqwWDPInYjxOh8+lcMP1eGyK28zbkFuBhDeCL8
 Mysx/CBp6zLYptYB/JJ8tCZ/n24oOEN+IDlnO8XP/IwmefgM8eNLQeg92ubXQ87RNeZxr+dSJyb
 R86Gej2cIYWJCQNmj8q9AuczcbTKQa/rCagcPi9Uo0PRFx8gxjy6EUKZLox80ZvheBe2x8/WAa/
 d1j2yu7g3A6bR6JngCynmea50LCBXnAa4FR/bRUx3W2yisb5EznT/EmKvtqsMDYFx4VdLFrYcPi
 VRXdLXiIrQkR29g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Sy1jL2r6LRgM_jwfllWQ0lmshf4O1eAI
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699c41b9 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xMpycIIAKlYumkEOWPcA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwMyBTYWx0ZWRfX4vRQhW7f+fLZ
 K0yv1/s3swMLfLTshd5tI+2BYOnmeGfOGQQYYlkS590WRDeqb1nDwCr36PnpHESDZXEddAJ/uV2
 dLjvKij/5cjmD3POQCMu3EP+Wmp2oyX3YqmbqK3rfXjXbY7UCXcXEAK4RTz9qIkG+hoVGkEZDKq
 NjuNKOaNSvAAgmqyfL8ds2SySsahhlCEVA8/XC7MyvgU3aSXuRQa/sqnl1HxpXr71L3wAAPQMsH
 JChno3T7ypegylFuBWHSA2tmLPWkWjHSy4lAjPRGzUHSHc8r6PHpK30861y8AnP02xFW2wPI8g2
 23KilcxCFj0VihDwIrJf2eeVVPTZXCFlDh64eny6VnEVObBqcvUluZOXD1X4UdWuHdKeYFVTp5P
 SKPHbSuCaoS/vMYQ3QGCPh0Jr3cABJF3acG2sefigze46xmOKj4PQqK03fQTH2GiNlmktL2a+qV
 K8X6XP8Xqy0KMF4G/hQ==
X-Proofpoint-GUID: Sy1jL2r6LRgM_jwfllWQ0lmshf4O1eAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230103
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93671-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7893175E2C
X-Rspamd-Action: no action

Add the TCSR clock controller that provides the refclks on Eliza
platform for PCIe, USB and UFS subsystems.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |   8 ++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/tcsrcc-eliza.c | 180 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index edac919d3aa2..dce21e33e366 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -28,6 +28,14 @@ config CLK_ELIZA_GCC
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.
 
+config CLK_ELIZA_TCSRCC
+	tristate "Eliza TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the TCSR clock controller on Eliza devices.
+	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
+
 config CLK_GLYMUR_DISPCC
 	tristate "GLYMUR Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 98891d19b3ac..2ac9eb14e1ab 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -21,6 +21,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
+obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
diff --git a/drivers/clk/qcom/tcsrcc-eliza.c b/drivers/clk/qcom/tcsrcc-eliza.c
new file mode 100644
index 000000000000..ef9b6393f57e
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-eliza.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,eliza-tcsr.h>
+
+#include "clk-branch.h"
+#include "clk-regmap.h"
+#include "common.h"
+
+enum {
+	DT_BI_TCXO_PAD,
+};
+
+static struct clk_branch tcsr_hdmi_clkref_en = {
+	.halt_reg = 0x14,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x14,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_hdmi_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_0_clkref_en = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_1_clkref_en = {
+	.halt_reg = 0x1c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ufs_clkref_en = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_ufs_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_clkref_en = {
+	.halt_reg = 0x4,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_clkref_en = {
+	.halt_reg = 0x10,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_eliza_clocks[] = {
+	[TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
+	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_eliza_desc = {
+	.config = &tcsr_cc_eliza_regmap_config,
+	.clks = tcsr_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
+};
+
+static const struct of_device_id tcsr_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-tcsr" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_eliza_match_table);
+
+static int tcsr_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_eliza_desc);
+}
+
+static struct platform_driver tcsr_cc_eliza_driver = {
+	.probe = tcsr_cc_eliza_probe,
+	.driver = {
+		.name = "tcsr_cc-eliza",
+		.of_match_table = tcsr_cc_eliza_match_table,
+	},
+};
+
+static int __init tcsr_cc_eliza_init(void)
+{
+	return platform_driver_register(&tcsr_cc_eliza_driver);
+}
+subsys_initcall(tcsr_cc_eliza_init);
+
+static void __exit tcsr_cc_eliza_exit(void)
+{
+	platform_driver_unregister(&tcsr_cc_eliza_driver);
+}
+module_exit(tcsr_cc_eliza_exit);
+
+MODULE_DESCRIPTION("QTI TCSR_CC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.48.1


