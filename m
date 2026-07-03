Return-Path: <linux-arm-msm+bounces-116236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dNolFot3R2rGYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:49:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC985700445
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:49:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hzhpj5at;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EmrhnSVq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116236-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116236-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 966B831190DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C373403EB;
	Fri,  3 Jul 2026 08:34:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADE3348C6A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:34:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067689; cv=none; b=DCpTpClRWC2VYCqrj/ABy5jyMFOzVSUvkjCELxU/Cue9upNYg1fc7e3BaHHTPYburCZdGz8f5kEJgWUL49O+6ngTesZzCztBvrNexnBzliXslOKQv7BjFQhsnjEZRjt4c3ExW638eLzI9pjFP/jfuMjKoHZtJnKXsl+moZc2y4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067689; c=relaxed/simple;
	bh=YKvSYXOcZAFf/SUwWLWa5gao8l3OIUQCsF3ji+Ar2g4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nWwUcdg/TcJo1ffGOU/WvfN9mJ3zU+a50QwMexxWTwnsN/L+RnqERfOMNsRYjNEajfWq2b7GGWWGLmqHya5URvif3b5D+vDKbog6GofUg0bx0gSDh1TaDs8lNxsL5md41RVYKxym1OxofWVvjGHZ18ATGgSWUGdF10URoD76GTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzhpj5at; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmrhnSVq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IqvT3195670
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 08:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CWwE5upxYuo
	5RiLtxxc8EPnMf9u/aWNu8vxZbG+Te5o=; b=hzhpj5atW/gu+h0CJDL91Zc7gOQ
	JrmQ+atbmHhH1pqCo8mMyiFKcl4fOP1vjVJd/uWC3IoOIbqIY8QyPlfr62pkq+f9
	Z4E5uTq/FesjOb009+c+84/SEtiOB34oKMjvpT1UYrrWEyIr5n0/LbYl3iVee00K
	cw9PPBKWz9AWJDKp98Bszt+rFLMX43+2Pwm7RB1dRQEIff+tWA6UQduBw3QZkrqJ
	0iub4P1pDKLOeCAt6WWQ5e1+oyBvw9i9gCyYaoVtJl8bFohSKUXp7v57WUFc1khq
	BdnxjJNPV0O3h3L4vCmlGIwP05jfNsfLQzs/FFPQ7JIVYY2u1kDXRaWW6Ww==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyr933-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:34:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38101e6fc6cso691252a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783067686; x=1783672486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWwE5upxYuo5RiLtxxc8EPnMf9u/aWNu8vxZbG+Te5o=;
        b=EmrhnSVqVMYUIADfEL7o2NZUlXvnR2+Hg2Q562hpJ1JooaWwD5LENPsfYSQ/LaxmpY
         ZzzNnfiE/xmRjyTRuEXlsy7xd9ScFfHxIib5ioFBt3qAiTSouVD/VvlWlxtUk1Hg2v2R
         6Uvs7sOx6Mr/AT3cCvQS42BiVZaZKr0MdKE4WYTK/LrhhRJrUDDNtiTrU3Vcvkct8sgt
         iuK97LzgXs118MOgeL4HmmJ3qsQ8uBc4Y8S0+ZoPxnr1hlGRbmiuv/dX+2V7E/FlUPe6
         u9OpWCl77YaaPn/6xK/zA6SPKU2H/uKx5lX4h5k9qT2cCLHFy14Xkc9/KJWVeZHkMelR
         NjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067686; x=1783672486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWwE5upxYuo5RiLtxxc8EPnMf9u/aWNu8vxZbG+Te5o=;
        b=gpbipG1PJI5D+pmd93184ngONN6l+KwqiydPmdovdxIpDjmkTIuNqPluw4fS4OfRww
         23gN5kwzOnjdEJzykHiaZfJpWDeayJj7m9y533NDzWAOffzuHHJICksRyMTTEBtmpOYk
         EGW6bvv06dZb4/AOhy7EVvjSQnbGNBTt3nkFEAJ75IBkwZ8SLRtUc/pgQ1ON7tpy7k/d
         +dUj7gYclFnR3x1bThXnkxFyNNZPYZ1MnbJvXo1AlqfHomXDe0DRHuTGGaazAPHdukDd
         HbLWp2lnwVFOFPqnSnWQ/rfRJ4fSenvsPN/V2gbav4Rc5ol4IVlZJlTs2FG7fgBvg+p4
         xHKw==
X-Gm-Message-State: AOJu0YwtGozRIS8j7UdmDc1cLJHg06mZlGDAGPIvseK17TggE284g4mv
	sU0gSk/dcBej10GcY4eBHvaB39dS/ZpgCDhCQEtPZpG760Wnsue6pz0r3kWxfsg1JjimzFQQJze
	NRjkQMsrI8FC+1Q0Ieo4iG4nZss2MsWYVrGnWd6E4jN8M1Kq025KAnY28Jmv+tPOIJah5
X-Gm-Gg: AfdE7cn+nWctwLnyHPjyY1hcWCnFmmMof/H0+mqLklIL4+KxT0kiNIukUBFs8kXF+nQ
	gENwKbkpVyY+U6jUtGQNp0vKgFmjpl+iwHxh3csudSee5qjC6+I21GB4PSbT67oF+TxTKSAAyma
	JBAym5KcPL1nBzW9PCfjSqJD3wiYrqjVJiyJakbDEW37uRwNpKHJlNj4CuaEbzRZrV8fLpv9why
	GPxZP4KgCHn21PdjbrX65spbNEtyYKEVVjpsxe1ECWyoynLtDb4K4j/nRJVHhvKaXsiqxCfylr+
	vMSNeezUm8SuD0XBtYCOlKbMdD0nnB05bjHxwnSIo46l5ID0PxFKx5sqJH1cwpktwinGpXlc56v
	Ob7Tzz3E6LpVmUZHVCza3cm3nu4PCiTFIEhkzgs2m
X-Received: by 2002:a17:90b:3f8c:b0:381:854:dba4 with SMTP id 98e67ed59e1d1-3810854e536mr4144030a91.20.1783067686330;
        Fri, 03 Jul 2026 01:34:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8c:b0:381:854:dba4 with SMTP id 98e67ed59e1d1-3810854e536mr4143991a91.20.1783067685819;
        Fri, 03 Jul 2026 01:34:45 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm18797839eec.2.2026.07.03.01.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:34:45 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 1/2] arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
Date: Fri,  3 Jul 2026 14:04:20 +0530
Message-Id: <20260703083421.2736184-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfXwPBgpM8GaWmQ
 di2fOOQclx3kDAUeRNWliQ5CmfqrnszQo1oa9O0994bPM+kt5/6iLJbHOVX6KWBEaB1dNDl8FfN
 DrQTzJ9YnFPUvLTbfIIS9PjjsEgl9cEvjJ+nYqOxC40jSZxvLql5fIhB0m6HcKs4axSZmS/gI91
 uaXuV3vX7wFhT1Qnfk8F9+aS+jAQAyt01OzCHUwtslJNY6drBUcT4pQeXghcH/hJtMufopfTP3C
 baYB/7qllV1tsuV6i2aZALksn71hARNlorKEwqFFDhcOaQYFOLMSpogvGM/yXy67iekFstmSiOg
 enHoW+dcwxh5XscOmvN+Z5k3GZqIP8zQ4KxBMn54tNdmKPw3LvI+zP9u8RYi9jw9oGsgA8EzEJ+
 m1GpLwDGfWMjiLmwPbCFrrNPbYw7f1VfpF2mIzyzW1+xc1obBlBH9lxyQDacNfyfpiMn6Hh+et/
 wrICOacEYFnydn1VqRQ==
X-Proofpoint-GUID: vhimigdmln7UzqYCX5HiMy2ILhTcCLY9
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a477427 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=hg4zlKkQFggHIW0abPEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: vhimigdmln7UzqYCX5HiMy2ILhTcCLY9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX8/gL2fp3/M4B
 wQslCfM2MqCexaV/+AGgUCoGju0ztBkbmB6vZ9z86HxjPQ87ljdS2+FCltIvXwPZozjs/LzNKeJ
 u6rcFCqTOnSK0srtfuRtzXhWTUIPKTo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116236-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC985700445

Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
defined inside the LPASS LPI pin controller node. The hardware is similar
to the SM8750 platform.

The WSA macro, VA macro and SoundWire controller are kept disabled so
board DTS files can selectively enable and configure them.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 193 ++++++++++++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 8dbfd0504598..142f43a1e6a3 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2072,6 +2073,198 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		lpass_wsamacro: codec@6b00000 {
+			compatible = "qcom,eliza-lpass-wsa-macro",
+				     "qcom,sm8550-lpass-wsa-macro";
+			reg = <0x0 0x06b00000 0x0 0x1000>;
+
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr0: soundwire@6b10000 {
+			compatible = "qcom,soundwire-v2.1.0",
+				     "qcom,soundwire-v2.0.0";
+			reg = <0x0 0x06b10000 0x0 0x10000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&lpass_wsamacro>;
+			clock-names = "iface";
+
+			label = "WSA";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <9>;
+
+			qcom,ports-sinterval =
+				/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f
+					   0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
+			qcom,ports-offset1 =
+				/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15
+					  0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
+			qcom,ports-offset2 =
+				/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f
+					  0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-hstop =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-word-length =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0x08 0x0f 0x0f 0x00 0xff 0xff 0x18>;
+			qcom,ports-block-pack-mode =
+				/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01
+					  0x00 0x01 0x01 0x01 0x01 0x00 0x00>;
+			qcom,ports-block-group-count =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		lpass_vamacro: codec@7660000 {
+			compatible = "qcom,eliza-lpass-va-macro",
+				     "qcom,sm8550-lpass-va-macro";
+			reg = <0x0 0x07660000 0x0 0x2000>;
+
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		lpass_tlmm: pinctrl@7760000 {
+			compatible = "qcom,eliza-lpass-lpi-pinctrl";
+			reg = <0x0 0x07760000 0x0 0x20000>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio7";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio8";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio9";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic45_default: dmic45-default-state {
+				clk-pins {
+					pins = "gpio12";
+					function = "dmic3_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio13";
+					function = "dmic3_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic67_default: dmic67-default-state {
+				clk-pins {
+					pins = "gpio21";
+					function = "dmic4_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio22";
+					function = "dmic4_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			wsa_swr_active: wsa-swr-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "wsa_swr_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio11";
+					function = "wsa_swr_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+		};
+
 		sdhc_2: mmc@8804000 {
 			compatible = "qcom,eliza-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0 0x08804000 0x0 0x1000>;
-- 
2.34.1


