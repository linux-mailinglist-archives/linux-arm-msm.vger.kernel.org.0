Return-Path: <linux-arm-msm+bounces-117938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id deppGHlvT2qhggIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:52:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BEA72F271
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:52:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="nmHH/CzE";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=au4H9m6V;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117938-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117938-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3FCB30637C4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 09:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BE13F23C4;
	Thu,  9 Jul 2026 09:44:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8903F411F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 09:44:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590286; cv=none; b=FfV0ATkl9At5FBOcVc3EB5bi5FaH6BczWwDLTFom3Ug6K7fIAF3LDCeaG7pSunajbV67i1YvkAbw65pnb7vdXkzdMlqv1dijegtPYbJ5oc1GrZk1Wrgw7KjIjQiUvtIaNXaFt80wE65JM6Jr0pyj6kIpveRfFRzVkISE+7mOr0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590286; c=relaxed/simple;
	bh=eLa2M4dXFNn91pqh1C/4MnN+ZhGgRVYlWmVQL64SPJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=REN8g4Kr/c+sXZiyO3uN1xXOsMYGROynOk8RiEAfpMD6mmolK0bEsBJCD9XzA7HZfiwsH13s4vF+YnaraYIzipF7lLI0MFt0F08IVX/zmqUwko6w9cQv+PrMga9P8OqjTEM/FWoiyiFY7xReJcvQLy/EgH9RYWXWvIbtMjn50I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmHH/CzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=au4H9m6V; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669618ub933300
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 09:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0wDUNQH/Nwm0gjeLnYOQPxbyep4gYuxyhSoBpU+SGMw=; b=nmHH/CzEBVjT7Y91
	k6WvZ8k7Ns4PwUxnUnOhRF9s4UzP+vDymX/K5wfc+IKTguReiJAu+grrteHeJgjP
	2+Y2lkMPoq5EZpfACDKQXtFeNpeilf9TjzbFZ2qcY63f75PIbMUpJVGFrVMly9+f
	M7L4iGqwspUGSB6oT23mTBcpVmQB+U2NDv4bCOjmRpCareyYYvJQjaCFApRR+EGE
	+m/OtFhsrsvkpRaGucMkBrTz8XlLE47GtfyxoOhGGz7M+hdnFPvz+UQPg7avtdjY
	noB8bv2AXeI0cSdX77TZeyFkBUAMDmaSWZqq4YXJeJ65Ml8gDTxt89MXiLs1NQKy
	XGtxug==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6k1bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 09:44:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso2705801a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783590281; x=1784195081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0wDUNQH/Nwm0gjeLnYOQPxbyep4gYuxyhSoBpU+SGMw=;
        b=au4H9m6VDfncCC1B+jorW6hoJm8/dnuEjCCeSNBU0ko2Ult/eSvVgxq9iOrzM3VG6K
         HZqRgXBB3bVSgd6kaOWaQZUOlRC3El1sSNPgmLOzqKjM7W9/bxeX2629StnH+PXmXiCF
         yPwX310unh/mXYCMrmKKM2E8HQtiZnJaUUR821wD/NmcWS5y7Q1l4D1cgDqiynyXeYpf
         m+zT8qJ3ziAhwQdBWEr8yBUp2Zany+W5Ao/EC5g5K9zRwI2O2xV1S0YJTuAENeOtJCSi
         zXg5k35fN61LbYasQq74Msl/a1AJUmNsRGCmzodIbFlHx0LCGjnw1R6syVSJ0J/xRV9T
         uF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590281; x=1784195081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wDUNQH/Nwm0gjeLnYOQPxbyep4gYuxyhSoBpU+SGMw=;
        b=H3un9Ks7b45zkd9/H49ybDD+Anf6/ebyyYjB3Benk5looQ0xO4uzu8x1R6B/v2Qc/9
         QwV42/ogNfu5/pHLRWbRtuwqiiEwh6fb1bljNCl9UMYYPUCUDQrr79/H2CQaySlXRrUh
         6IuB9yrAIdG+hBcEY6Yh3S7oTX0JXCrzEB3DMwI67kcpyaK0Dk3H2OG377X3GQ8n3yEM
         woZe5ZySYg7BA3MOhJqg8zSr0SSs80PWtVd4vnnnFN/nMzZ1k/uneEFT7lyd0FvCetnG
         74ufzJ00HONgQwAgX+68PWH1ZNvhzgSIGxlOOHpEH6eajJm1YcByRlN9QLoLiiirVb84
         dxMg==
X-Gm-Message-State: AOJu0YzM90WVawj0me0b9v5HTZ1NF27KGUwUDY/xKJ3mcRCMasrj71WW
	7EiiEW/Q9kullwopUKSzPsi0BXmVOHPmh9nU1lpaMkKgpRCHCYCCEUvqCtts0uDGv3xRCzQTJz1
	DkzCKeBIbA0LJf88ikG80xq82gfxzw/vcqGWrisEOzOmipZErcVCqoIJ08twRyT/J9gub
X-Gm-Gg: AfdE7cme9VHX7eO8J24dl3Gs0X0leE4Jpdp16pmltyYjepvuIHcFFwXubjNsg2pSKO9
	gplXH+3teZFuHA8emaYPaN1IA78wcyzb6+hMXwfX61EkCX2HLEKOFtTDu4YUx5TkKkV+t5V7p+7
	SmdC/JRmjhzwTVA4uQtXSJGDggyQFO+162WpMtScUNntwNKAmll1vbf12DYVmm9VCc/j93FIb1O
	NrVmTdbUDD3iOG0Ubt9CkINIPOicHlgyozi1LkYjpniweuegPreJy50spCO2vs7QL5DTXREk+gV
	oj9RbrzRtI+EnrAnlSmMyHV74pwq+DAap8wLcQoyCOqbXIXGAjXdSC+ct35tEX0mhAqN+nmp8MB
	xmv5/dOK2ZXaY1ppvSh23LOg1teDFDw==
X-Received: by 2002:a05:6300:141:b0:3bf:a38b:e8ca with SMTP id adf61e73a8af0-3c0bd3118e9mr7684155637.59.1783590280612;
        Thu, 09 Jul 2026 02:44:40 -0700 (PDT)
X-Received: by 2002:a05:6300:141:b0:3bf:a38b:e8ca with SMTP id adf61e73a8af0-3c0bd3118e9mr7684113637.59.1783590280075;
        Thu, 09 Jul 2026 02:44:40 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm3493075a12.14.2026.07.09.02.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:44:39 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 15:14:04 +0530
Subject: [PATCH v2 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-shikra_adc_support-v2-3-8dda38f7bf3d@oss.qualcomm.com>
References: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
In-Reply-To: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783590264; l=3864;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=eLa2M4dXFNn91pqh1C/4MnN+ZhGgRVYlWmVQL64SPJs=;
 b=BLippZErsVx//nsDs8cVfjs6HxaZw+WN9uTzEf/Oe1bMKxLcz50RG614/DV4Duq5mOu55x38J
 QaEcKrJOmflDCpnKbtyb9L1e0NLjr1tccz6+6Q/seLUR5xyZmRTy4+G
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA5MyBTYWx0ZWRfXwC4wb2tyyS4Y
 OEw3v3yZKm38RdY+hxPUBhsSwTHZe/QYRn4wxXWiH9Jyrps3TszamCNdz6Kf4Gz2OejL1MEs+61
 bSgThdsANhcVTCU//ldNshSpAZld3wY=
X-Proofpoint-GUID: Zq4bhQ3hZu33oGPxdvr41uGtcasyYNde
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f6d89 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XPlkfCdyFubSKYJrR1oA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Zq4bhQ3hZu33oGPxdvr41uGtcasyYNde
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA5MyBTYWx0ZWRfXzIXByfIiQ13q
 mb/4UTDEJ3JCFpznopRkVL42d5Ft4h5WMyKQH/ehhZtHiuPg2jJ41H6K1pofrZkhIi8V7w6fK5A
 8lmqoBLEBfjLI5auHYzJG102JiBQqi21K+P4iuuUCylfgTR2gpqVnFtWxpXSq6DWJLtvLFmtuBS
 tqx+0kXMES1tVHrK2D4XLnB2XpPbrXG+HkCwxQE1OhGqf04E85/Q9D0F91cLZ77Cq6mvdWszPcw
 /jmzUbz5FnE/nI/E/xmLUsl52q4J1O9pE2N09VNVloFBJ14StsnZHfCrkxifcZeIfy6fzFDYHUw
 2R9kFzcvuY1Oan8oVlA94tKW+lGhdbLCsb1taBbuJI1Li4Ta9u3zvc+Cc6wq0+3L6ZhSIsWDbTz
 hFLcsQe5hWbsT1Lo1RoluEgP4isvAcNCZvaVH/HiHzMoXidfewTQRCq/5CafwHaXrLKOVp8PRCI
 +1pOMxyj9cA5vBnykHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117938-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88BEA72F271

Add ADC channels for pa, quiet and msm thermistors along with
their ADC thermal bridge nodes and thermal zones for PMIC
thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 123 +++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index dc3861489f64..7ebb206697ec 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -27,9 +28,131 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	msm_therm_bridge: msm-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	pa_therm_bridge: pa-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM1_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	quiet_therm_bridge: quiet-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	thermal-zones {
+		sys-1-thermal {
+			polling-delay-passive = <2000>;
+			polling-delay = <0>;
+			thermal-sensors = <&pa_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sys-2-thermal {
+			polling-delay-passive = <2000>;
+			polling-delay = <0>;
+			thermal-sensors = <&quiet_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sys-3-thermal {
+			polling-delay-passive = <2000>;
+			polling-delay = <0>;
+			thermal-sensors = <&msm_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
+};
+
+&pm4125_adc {
+	pinctrl-0 = <&pm4125_adc_gpio5_default>, <&pm4125_adc_gpio6_default>;
+	pinctrl-names = "default";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "pa_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "quiet_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@54 {
+		reg = <ADC5_GPIO3_100K_PU>;
+		label = "chgr_skin";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "gnss_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
 };
 
 &pm4125_gpios {
+	pm4125_adc_gpio5_default: pm4125-adc-gpio5-state {
+		pins = "gpio5";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
+	pm4125_adc_gpio6_default: pm4125-adc-gpio6-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
 	vol_up_n: vol-up-n-state {
 		pins = "gpio9";
 		function = PMIC_GPIO_FUNC_NORMAL;

-- 
2.43.0


