Return-Path: <linux-arm-msm+bounces-108375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKUWJLoODGoZVQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:18:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA64578D71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6F793023333
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5993CDBC3;
	Tue, 19 May 2026 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpkUwNwy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dz8aA9wb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524563CEBA9
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175083; cv=none; b=lhojFpxV3aZ6FWcsNqugpZCwOo8pDEXsWQqMnaocbR2i4gC6thUkBq2tuoMyC9aP+R/MgmnAHJxc9YZ3AVqcv+xcY+VLaREZwlaNrIKUmoW+ad2Mm3gVNIKgL69M5KWPy38Tra6tqMKj/7YIXiQKmQpZ2fkhhpcKcSaqUwzvKbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175083; c=relaxed/simple;
	bh=dOXiXkSm8I1IqmT9OjwuiZVQx6fWN+M+gCcskenvYsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GAymK3JNi/t7mCPHbIUzn502ATPCFXHwHJNULno4Fd0OkOVqqKFyte4nvsYclm12t2AvF1WaMG2Mk0A2b30LEv/eCGGuCS5B2AjGdolWXK5LTVNo/h5epcs3yHxoRRnthwyI5ZRksE928r2RPgV3q9JePRpXNNJO2N7q2GWB0d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpkUwNwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dz8aA9wb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5WGf44130974
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsxkBLLfqZetiG4fi0SQZLa3uVnCY/nG58OferiyW9M=; b=FpkUwNwy7a8bgdHW
	SuOlWB8DYURbkeps3NXvUDbVidMZPdhwjmEl/4cZPS5IPC+JpvDOVddQSZuUGtcW
	0ADiTd/noCulD1tYoyCJgvyUwzhGXsZEbzsVwYwtwNR76LR/4JV75l3Vj8n/UxBh
	Uv4C9bS/0ZBQLo9uRmOUQWFWlFSYXBiKPfBPak/h8NIzI26oiYBqKX3PJ3bADkKG
	mlzFQU6KQ7IMiR/F2x1zKkiNB4CP7CttHzw0H9t2M+8cmj4YwclzxYrqO0/4TFYR
	zohMsZ7tYr0/yEr2R4nMBftf5TcO0VeQREWK6jJ4Gzg/a8coizMcG6Ox2zKSbx9Y
	dxHjgA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1gdsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:18:01 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1306c2f7037so2684684c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 00:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175081; x=1779779881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsxkBLLfqZetiG4fi0SQZLa3uVnCY/nG58OferiyW9M=;
        b=dz8aA9wbM/0atWxYeY6fCmtEX5SVf0wn+KTa97IPe+DVEiy0xmtCZQsttBfnpwGVuI
         s0dbOBtPZB4ZZMyKr3SQe6/7pxkpvGJYFLNxhCg6YXjG0o68GmAgBzDHk/jdG7jZBFbO
         2l7PkFt0qVEsihELgv8L5YsbuBS+YLm9SU1ilHDBtRp9HGsn/0guw4EBY6/5brDQBvME
         E09iGQG0bECY9gYaDxeyIPZX8TIY99aALy2b8b2/GNqzqSqpZjGav6KrPc8/ioAHLA1q
         b9hyX9slozkAQVV0EN5E15U3y99RIdQeRrPJ99IDeI/p3jYLqdJJaRogZyjLGYJcJiVm
         vwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175081; x=1779779881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BsxkBLLfqZetiG4fi0SQZLa3uVnCY/nG58OferiyW9M=;
        b=SwrVcJvWPprnqmu1U5zaxR18et6/sndaYeGS3jTVP6sXy+k/AFMl1YPXdQcdHNjSsx
         fJNvo6dEvUGklHTL5TuzTALH1ocqO6lwHNc8wT7h0oUoPTyCdlTm7HKzw39WWyPY3pkE
         lVzbQGvcQhron6WsNXyesek+gW05w21LRdwkoQnNm6XLN7aLPr07hHtcys9u4DjNnJf1
         XE1ahGk478Gj7FpeT2stpP51sgu0d6vg8ZSW0f5uOpB7ax7RsmFI54TzSt00mOWCyv7P
         jVTL/XoXbeOsAiqnVMdkPlB/Az6XI7XO2OQvnPLTNBbYst5oxprpWEQoklzGVnV/Onbi
         U4gA==
X-Gm-Message-State: AOJu0YzThoYgo3OFbWzWr7Pjx9babDe0JP1iTTev0fV5GIDWoBBypJEc
	wseUKCU0RZAtdHMwAmH2IgcnDwB5CN1GWRJAmBY1WjVMH7IpPhpIYoH+ghWRLuIeB9pnlGQoxOR
	jv7XbsEJ6/iRbTKcIJCYzwvPI/nHwqmjTfq4PmpUY8VPmQkPVPpoaCkg//M0nXPZs/Dcj
X-Gm-Gg: Acq92OGcH2dd7caWv5UkPauMvfxkKy6FuLMBFUjqUfglAEft9C48PpQJYlKbME1/xng
	U2ZXqQJIe34LWgP2ECF/9VtnEK0nWzzv3XWOIGTi/lbALRhROHchhhURzChwDGLrs3oRXjN1bh+
	woma489EfjfyHkdi/l+yAZriGycGJ2t2wu5y6b3h/ykzhzIhYLx5vc3zi7zAWdyHQ0BPWBLckpO
	JE3RAhD+IehtmMTfp+++bUtOSuhxzGRNDuPPj+ZRWZITwiBYIr2ODPSW/JC4ZmK/NTcRu71XZ7K
	QD9IppvrwI7UgY1oBT+TTluo81LMM6P8zVGrXthLxwGF7yvSD27ZYzcAksGrs84UiGjZy6u1u1M
	X16sO1pz8t3VvdtWaJ7Ghz/OlqYPyhrDMjw2vF+j4MALuCEJbuD61uz6Hy2gexKKxxbjP3bBcj7
	gZ
X-Received: by 2002:a05:7022:6181:b0:127:366f:8bb7 with SMTP id a92af1059eb24-1350483cd93mr8518242c88.25.1779175080964;
        Tue, 19 May 2026 00:18:00 -0700 (PDT)
X-Received: by 2002:a05:7022:6181:b0:127:366f:8bb7 with SMTP id a92af1059eb24-1350483cd93mr8518217c88.25.1779175080350;
        Tue, 19 May 2026 00:18:00 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23323747c88.7.2026.05.19.00.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:17:59 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:17:57 -0700
Subject: [PATCH 2/3] arm64: dts: qcom: sm8750: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-pakala-camera-v1-2-b6d897864916@oss.qualcomm.com>
References: <20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com>
In-Reply-To: <20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c0ea9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=--cV21oE9J2x1QxDxCAA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: WZW8KNsH_NygLwXyGW4yxhRmvSGSuAjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MCBTYWx0ZWRfX1AMOuQbyhy7p
 24NSKaHehpoRlzT6JJ3BgHBMWdQqp+cu7PQ0hS33pY47xm6qNBpxcdB04RghkDshSkL1gfJgbyn
 zOncttpG0vcHb0vEfia+2Hwc6dlM6Erw8Og+4R5BfgnsR0hLq9Tycy0aOgLqppkNUnRhg9H7LnV
 GXF1+bIjA9vH6eS31aeghb6vcYBQrtpnnPGt2NZiaIjnvAN6hsGXxJvNge9ucn3KVg+sENzJZ3Y
 9FN1OYrqKnFYwMdGslKd7h8Xasxj477gxpUsN5uVbl1+lpDKfT0pFaSsF3IBgWFVEaKJtXxiWb6
 oFkmeBioPGSxhqpKYX4K7K2Uc2pvN5c8nPb5Go0SRDDytIQncP7l23J9f6dNUufPUsf9ghsOhB3
 tpVFdd19ctX2IgPMIL8+/VFESvXWzX9UAhJu+b/WfYUHRx8FUELMjOt9H/1BZ/9gqe1JZ6FcRwe
 2r3Ro67hZjceEXErQyA==
X-Proofpoint-ORIG-GUID: WZW8KNsH_NygLwXyGW4yxhRmvSGSuAjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108375-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DCA64578D71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm SM8750 SoC has three Camera Control Interface (CCI). Each
controller contains two I2C hosts.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 282 +++++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 8ed3d8c791e3..7570189fdb5d 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3032,6 +3032,96 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac7b000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac7c000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7c000 0x0 0x1000>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@ac7d000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7d000 0x0 0x1000>;
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
+			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@ad27000 {
 			compatible = "qcom,sm8750-camss";
 
@@ -3804,6 +3894,198 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio117";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio118";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio117";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio118";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio164";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio164";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_0_default: cci2-0-default-state {
+				sda-pins {
+					pins = "gpio112";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio153";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_0_sleep: cci2-0-sleep-state {
+				sda-pins {
+					pins = "gpio112";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio153";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_1_default: cci2-1-default-state {
+				sda-pins {
+					pins = "gpio119";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio120";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_1_sleep: cci2-1-sleep-state {
+				sda-pins {
+					pins = "gpio119";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio120";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio64", "gpio65";

-- 
2.34.1


