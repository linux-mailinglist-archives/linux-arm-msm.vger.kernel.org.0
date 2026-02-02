Return-Path: <linux-arm-msm+bounces-91532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP7hCyfJgGl3AgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:56:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1BFCE7EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 11A66300EDD4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 15:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935BE261393;
	Mon,  2 Feb 2026 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llmtW8VC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SgKtJoGO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B4725C818
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 15:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047778; cv=none; b=cGS+ftYbGHM0EysITUai5nVsfiJlfdVIwuOn02zOjK01ENJvhE3XOqUOf9ZL9ytCB4NgO/9GD5DFUXR3By5BiFrFtYWUah313NIOa1zpd2o8bufOL6neeBvIT4k+e+ak23xOQXBtCT/ljuLxSUcACZgco/e59B5wzY1Rgsa06+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047778; c=relaxed/simple;
	bh=vuV/PYOxRqDK1yj2KqhBcROSaIuQDTaOAweQPJaWS2A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MONiT/XuThsWShnTr8ZnhPfm0RdwENlhJXHRODxK+LWuA9BksKw/BHFTQKkQ+GEsNUv3KBSH6GvYJ5BSLMsfKuV4pxDFHUNWfb2S60HjcH/V0IUTIw07CCsaiWfj+noPgGWJYWzs3LyDL6igFq2Libe0sxMyOZ7WrLsD6WINUR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llmtW8VC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SgKtJoGO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CJb5O2884474
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 15:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=C7ZGTfPcszDOojkgkxZk10WNWNudcuqiTYp
	0jeL5NIY=; b=llmtW8VCYvvPIcp5nHOAc8ikWYy2A9Tkm6NURYxv2hDBNdqN/jh
	jcbZZiDG2QEFDkJWTyAfhetSqDGnpCimeRlLlmjpW6eOXr36ZarpMeqQVvfLBwt+
	jqtETe01Q1dJPMZrR1wkx1eoaAbcZHuImOirzlGVQc+A0lXbb9mTNOS8UBAYRBO+
	xUtEMIyhVuq0LLCO1f7tpYsMUeRw5HFA3UhXk9YFASKo82W3qK3x7+Ad/ItrE12w
	j1/JBDDUfeGtwL2D4KNFYQ8UVpEmu5UU1g7SkskNxJ1Zh/K0oCGpl0Z1RRjWg1mD
	rkuIJM/T9RG3s64ZQsjX34DZyoB+YRH/Nzg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3gmpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 15:56:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f07fbd0so2043764385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770047776; x=1770652576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C7ZGTfPcszDOojkgkxZk10WNWNudcuqiTYp0jeL5NIY=;
        b=SgKtJoGOxIzCZVKIpatlOhLSmyNOsiBn02rJGJw52dnvB6cNa7Ywj5UkZYdLWahZ/n
         mGG1G8sAxlwhRxby2szZ/P9cpb/Gg2Bwv2IiOcTq7pTQtJ5uRYn+kQ5tKPIXwB9gUBcZ
         z/5WxGHf464T+hXN3/HfEQj917lhXeMuQnxYSn+f/yaa+WCMQvafWxZiNAIdy512N1uy
         QfWVMP5K+R+hpmQp1nOdZyoN+AFRtjFSytot5xvI0m1l6mK1fVQJSm+0nMvopD5kx78g
         v61M8b9ve23vjWWQfmF9E3ILlPagwI4/ptIuIS2z0Pldr8yfWFfIwdUHNvJM8Z/QLTyD
         /p/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770047776; x=1770652576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7ZGTfPcszDOojkgkxZk10WNWNudcuqiTYp0jeL5NIY=;
        b=AdzL0jxj3XX8RrzR0REXxSiOQj1Bd+6GHN5ZOhGe2o9Kgtd8msHmgBAAps03OvTTVl
         nR4TPNjquBIkDSneOgdbBfUAg8yenDC5+5Vpdoy0TnCJEA6y2YSpyJdtBwk3BTxUElBg
         VS48I1GjRZ8CFaAjvrW+ONqTq7V1WET16Ay8Ws7Od5HhqZ7wW9oWrXd2eFGjVIxGbr/p
         4laLL88NAzWGTOi1/w2xXEmX9serE1aAWTbM0z1fTrXK2kOweSlb7ZIxHlgo7KmgnxYV
         z0kGKLnRcESd8coTvFwXHIZsIpeDaxYZJDIJHWnw5KF38dsPAS+3rZZuydTt612Le3EB
         bCkA==
X-Gm-Message-State: AOJu0Yw3F+4psFDhkmShXQlj0i9wqFOImGeYSTOjFJFv+eVeHjtvf+Or
	KlOEblW1HEZWSJI2P9KHxpptBQvQ5EdAfC+mYk7VGKpWItVc0we3iG+j4YDmvqLIdGLfFSQcCK2
	TxEcEqn6OsEpi9AWYCPc8U1FENeUP44gq1Z5+uRLlPNPhBt3Ku7oHWZP3xjxmOInx0U50
X-Gm-Gg: AZuq6aI3NwEWf3Ro/Zhh0Ui+FEL0uEmARGFDJqbzc2UGtiOIzlqb1wTOtKsNN5uqseu
	AbwSzZiVByMhDMkV9WkCCR+Nupgr3JNxgEKEaWDy6CJ7r5R3Ic+jfr5cY7zrYLpJi9PNLEizQOV
	kBH3GSkXYT8/MZXH5aPSROI7FamKLNlmNB/0i2lsfPDIpXafJix9TFO/Zvp43/bGj8e+ceM2AD2
	8wicb3WHS0PrFyUJ3pIs+H9xWcOok4icfKj8jqyMxKIdkzO+TPeS8Yt2tSN211N3j9yRA0cL/EO
	tkJFPll2qMkWoyPn7iFtRDZLS5j4pkbDooTWuk8HlRnHCCBLbVEAUQLGFGBk0kvGhz5JfUuqnDO
	CBbpYyQYlWolDORIe3Z/4zxPqtLb13LSWCFII49Kp+21q5BU3B65mwEKG8dJ2NNfYsWroad63Sc
	2X
X-Received: by 2002:a05:620a:294f:b0:8c8:807d:21af with SMTP id af79cd13be357-8c9eb302372mr1632462385a.73.1770047775743;
        Mon, 02 Feb 2026 07:56:15 -0800 (PST)
X-Received: by 2002:a05:620a:294f:b0:8c8:807d:21af with SMTP id af79cd13be357-8c9eb302372mr1632459585a.73.1770047775325;
        Mon, 02 Feb 2026 07:56:15 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:103a:9c65:ad2d:82fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm49308956f8f.13.2026.02.02.07.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:56:14 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_vdadhani@quicinc.com, quic_msavaliy@quicinc.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco: Fix UART10 pinconf
Date: Mon,  2 Feb 2026 16:56:11 +0100
Message-Id: <20260202155611.1568-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KnRZDA4xgo-RPHY_gvESMKwX0Ysz3qKx
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=6980c920 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=w5cLSrw8bnM9wMX07V0A:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: KnRZDA4xgo-RPHY_gvESMKwX0Ysz3qKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyNiBTYWx0ZWRfX4F/6AKyYEcx1
 Pdp9udtGWTEkQANhiTAjxjhPUOV8c1vbOo1AYVknUZlOxslPPAGb7I9Q4BmdU3oTw7u4quY+vFt
 IL4jP8qfh7J8DdrgdGVd7Xd+S6l0Jne1s7VJEJrPeDuKBo97tfMjYprWPAGhSPshRY7vgmGRThV
 X2aS1jD1pLojLYru8Cx5W6bomEOtwTEfvFJlwlGyfAEfwSa9WXfjbe3OKn7gWNUmkeMsebivQ+b
 04ecYsZegPzz0iTg92MxSvbV7lfFBcYBsz+Ae9nnIjqBRTubaFx86aVTOEFfFXG4PM2hS0c7jFy
 7lIwY68I3JdW+eQeWmMJx91pI1UGGMwhHNGy7VoSsIsLkc0GxK6yh71XirZXVxN+ym+8PrOdjHs
 RQq9BLcH2RUvGB+eJYWjzywvB/WiAg/9BG6TGf3RAhxB8FPUZRa5h7QYGYf1au+08dtAOeQ2oD8
 d7mFcGBsBl51FIYN0jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91532-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: BF1BFCE7EF
X-Rspamd-Action: no action

UART10 RTS and TX pins were incorrectly mapped to gpio84 and gpio85.
Correct them to gpio85 (RTS) and gpio86 (TX) to match the hardware
I/O mapping.

Fixes: 467284a3097f ("arm64: dts: qcom: qcs8300: Add QUPv3 configuration")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 5d2df4305d1c..dbb2273b0ee8 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -6414,12 +6414,12 @@ qup_uart10_cts: qup-uart10-cts-state {
 			};
 
 			qup_uart10_rts: qup-uart10-rts-state {
-				pins = "gpio84";
+				pins = "gpio85";
 				function = "qup1_se2";
 			};
 
 			qup_uart10_tx: qup-uart10-tx-state {
-				pins = "gpio85";
+				pins = "gpio86";
 				function = "qup1_se2";
 			};
 
-- 
2.34.1


