Return-Path: <linux-arm-msm+bounces-107719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMhZM/y7BmpAnQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 08:23:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CC434549F39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 08:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B1913014DBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 06:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DC135CBC3;
	Fri, 15 May 2026 06:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bm/+huig";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LAKsNJZ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BCF3783DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 06:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778826222; cv=none; b=RyI+y35lENelAA2m+7VpTME+cR5Sz6+ImiVFjNdzFUadLSSUxDRsNuTuQDf3v6c24FeBm8k+p1yesIgsmdTBzPw/cZCo3VsAVAblDsrfHxn9DqzvXTARSHYjD+QS8kaLcFLgdSXyY7W1BsFHVMVhEXtQtidB4SqDj+KsCSdkx2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778826222; c=relaxed/simple;
	bh=fF50PbMAR7BH/sgMSNtBTQE1n5ShaDM/5WLGANk+6jY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DIiXPyPdJcqTjXXwUwl8cwlq/pfDUS6uR0P8RYsbVp2ryHdnF9ekr0LUWMAmMS66spxz2LbgiLf5bk6DHNkLkibFciW/0A9i5DDgnpbJx/LMidg/g4NPDo/1LGREXHN0eHlk0fGeQS0I9YUCuR/YiV9GAHJFs6KGO1Aq+/zpDwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bm/+huig; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LAKsNJZ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5USUd3198357
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 06:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lJqLL1IP9ziWaZjFZONg+8
	KPhw9McKxMX6fFKP1MWbQ=; b=bm/+huigDidGrXwDsectCtFv1bi3pkhx0kQmeB
	xhvXEdsW3wdvELId4FvssmEfwuGxjXoADjFWf6BMDgrnij0tgVnp+1aVwRt06dFo
	ORLRyYEnWw+KsJ5fValk/maHlQSP4ddLRwQtt5VMBLiokk6gzQ8SFgldGK3NvF9H
	SNnOZTvWpw8I0fFZr6FiVFYpyfI1m8+JSzf4Gj/sTQwEoz97tICju9qQqNGol2rm
	VHzi8s/vMfjdMwNKHf9arbD59aqJ5tdyFkb2SgKCx2eL+piqAifXzyFxoylmp54I
	imCNF7FhDYM9BPmCQddCX1Btn9FBCDBw6d6s59vc4o6/z9XQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1q9vaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 06:23:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so8096496a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 23:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778826216; x=1779431016; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJqLL1IP9ziWaZjFZONg+8KPhw9McKxMX6fFKP1MWbQ=;
        b=LAKsNJZ4g2hzdlm+htjKfmJMhD2xh3U53psSdM14fzTDJEzlhPicahwahKUJm2LRMz
         9NOJ1JhqmfI9rgV44d8VObw9GqY7nVe1iiUNU4rfpsYaAr+oAUnvBCcwb29/VpDPNSxO
         dgeljLwV2RhkofCWDjKJyDxbIjJqqCbNLWTdqvbIZjTCw+i8q48e/wYjZneL+NU0Uk85
         YfOKI3MZ2BRLVedVKvP3JfADhQmpuWRcrNRt7lge84OiNvbHjBta7EIcRHFVKgwu9xyF
         3Q1HSoWJtk1kALFZWOCySdGxe/O1f+cmg4GMIYaqJubyvyGzAGKxudOXab28dETexcnE
         8G6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778826216; x=1779431016;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJqLL1IP9ziWaZjFZONg+8KPhw9McKxMX6fFKP1MWbQ=;
        b=O/7FmZmqQRxl3886B9Nv+5FMQy/DY/nQ1dUGl8pHvwQc5qZHgbMcIBtlTMQomPSW5Y
         z//wCl6q1kh2vzeNGhb19xQG4Vv0QyVb81j1ckfvQ9m2qz+KlmcBbQEJ1+qkMSbgRZFB
         6kVSkA6aBIW/lm2XMmcohPUQ/aitllKbL2ohxAqlBQMNlWKpWtSQ21v+cDlCgIQYpCfx
         lZf/u/P3/vRDe/mhtj1PXJE2TlC8c1Poef420jdvZofI7sgnlLS74gYB2CB0V5b7f1Sg
         44JsaGBjCzvm7GV45GU8gMpB38e1hxiC7DSAN4TZgMUUnJQT6BFp50L1K3L6Q+nCM92Y
         ZDBA==
X-Gm-Message-State: AOJu0YwUC6ExUkut2OeOL/xBT9q5pYVRnoAn0nJVPrH6rv7b1OD4J3ek
	R26LRS59dAt0d839nWaWuZgxiK1FkHsM39hhTXXGkrScCyNqSRXXQ4J+ZxTP+t1VXiSm8NdQa1Q
	Wl3eXjUwzVaQsLGpGuolzSzI68PUk/DU+rUHpjQBDx4kB78qg+7Ng4l7icyRMBj4U+TKD
X-Gm-Gg: Acq92OEQ2SW9JphwUQUOGzve5N3eU1I0BPrWQBxaLg+uypMJaB5nG4io3Rdf/XXGuzH
	jUsJ7yIMUGbNal7+SBdqs8qj6NY/gnXUK6Np7K3erqJcUchnyOrtC6+MAu0S5kHb2AiBhJK+0B/
	sRypSXeE2ZYA+mYUEF47dUW/YJF776KYfNWnCam92M2oE4n0tgKwMEpYLvYffihtaqgqcZLpB2t
	zI3aMPlXFWnfvxdG9Ngd2/ea0o1y12nXyNvrLJBtq47NTMaWUyhr8zpP7X8bVzz5/hPINXXERmw
	SGHZSuUjLYmrCWR3ygMvBp/XW4aCzjgcKjaWVFuGWlKZSXfCUvd0OjX6BtauMhLudNoztOvMvr1
	lSa+oqfbYv7egBIGRerH8ZWUfRCFJr/dsrFabFhGYP+f/duqwplSDxgABBg==
X-Received: by 2002:a05:6a20:7294:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3b22ecf97ccmr2874924637.24.1778826216070;
        Thu, 14 May 2026 23:23:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:7294:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3b22ecf97ccmr2874885637.24.1778826215575;
        Thu, 14 May 2026 23:23:35 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4205178a12.21.2026.05.14.23.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 23:23:35 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:53:23 +0530
Subject: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: add MCP2518FD CAN on
 spi18
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-hamoa-spi-can-devicetree-v2-1-d0e922608065@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANu7BmoC/42NQQ6CMBBFr0K6dggtIODKexgW4zBKjVDsANEQ7
 m7BC7j5yUv++39Rwt6yqFO0KM+zFev6AOYQKWqxvzPYJrAyiTkmuU6hxc4hyGCBsIcmKMSjZ4a
 MqKia0lQpGhX0wfPNvvfpS/1jma4PpnHb2xqtldH5z/496633x82sQUOeZ3gsNKZFWZ2dSPya8
 Emu6+IQql7X9QuGsiCv2QAAAA==
X-Change-ID: 20260513-hamoa-spi-can-devicetree-4cc79d8293a2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778826211; l=1804;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=fF50PbMAR7BH/sgMSNtBTQE1n5ShaDM/5WLGANk+6jY=;
 b=ORqoqZYefhQabTy9z8+Pu1RoT4EKjz32RuQcGQEtQIzGnThIvObd2KjSQdHqc8XkOGJp3NXf1
 UMNGyFtyQq4D86BkRoXw5aOBX7al+8r976LDKgacqQMggKXVfNdwL3W
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: Qg7_LctX0hYXqOQEiri4DN4FHs0s_NaB
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06bbe9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=A_lPNeO1_qHQTXRdlPgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA2MSBTYWx0ZWRfX3IuTOGqnt0Ep
 mu0OQjCnMFapx9qWhrIBfQXO4wlP2jWqgWzayaQTC6lHM5eelNnBc6h3iSHtLzVrIqIHzDtCcZE
 l8OLlivh+AKEB7y5upuJGKQrPl8TN8khVOhQVSSlQiP5H2l1ou/7Q5SRH7NqwvgNpdlmgZcKr/R
 j/xm+KbjGLo2GyfVLp9jc4AlwfDJVar2ifl4gqNdnTYLI8D521y1GRlJFuaaj04jqxBoE2S37M9
 /htMBRTksa6uKmpCEjYuUBcFewGb17b4ZPrmmENZwNkjsBHqUEOZ849oy4b2BvhEjnJidD5qcW8
 0d5BQHiOfIyJMKCkR5PPoAn5wqVr3GPhUjmYo1XW0btjIwSwwFMgesyiTbJmgUQSlE0XYySj0Uf
 nFvvREhsCAv4zDXe8EwDZ5120epVeDJF+QvV+j3bd4V7q58TAIs1CA0ROKoPhbFoSo4rXHKVh74
 ad4Y50Hq6OUl+JR2/Pg==
X-Proofpoint-ORIG-GUID: Qg7_LctX0hYXqOQEiri4DN4FHs0s_NaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150061
X-Rspamd-Queue-Id: CC434549F39
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,msgid.link:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107719-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable the Microchip MCP2518FD CAN-FD controller on hamoa. The controller
is connected via SPI18 and uses a 40 MHz oscillator.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Rename the fixed-clock node from can-clk to clock-40000000 to follow the
  standard fixed-clock naming convention (clock-<frequency-in-Hz>).
- Link to v1: https://patch.msgid.link/20260513-hamoa-spi-can-devicetree-v1-1-554a671a3789@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..c7ba4b353ddd 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -29,6 +29,14 @@ backlight: backlight {
 		pinctrl-names = "default";
 	};
 
+	clocks {
+		mcp2518fd_osc: clock-40000000 {
+			compatible = "fixed-clock";
+			clock-frequency = <40000000>;
+			#clock-cells = <0>;
+		};
+	};
+
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
@@ -1227,6 +1235,19 @@ tpm@0 {
 	};
 };
 
+&spi18 {
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		interrupts-extended = <&tlmm 68 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mcp2518fd_osc>;
+		spi-max-frequency = <14000000>;
+		microchip,xstbyen;
+	};
+};
+
 &swr0 {
 	status = "okay";
 

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-hamoa-spi-can-devicetree-4cc79d8293a2

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


