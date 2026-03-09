Return-Path: <linux-arm-msm+bounces-96181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CErJOZiXrmnRGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:49:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4982367F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34EAD3018693
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DBB36A01D;
	Mon,  9 Mar 2026 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUNbB+gA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cuq1faEf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEEC3806CE
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049718; cv=none; b=NCeq4/hrR5WjiV5PdyTFUfgbKVh5idivg4f9e/ihbpWKd1/gSt1JRtzEnoas4XPO0xoAkJ4tevwgvD/WT/bZNpxVogRUXyfzuvLrQ9tZopz9kiDfqULfYKKq1yiTnGdDcmFPym67krwfhaveq075KecS2sCnKuy4bWFo5J/ZBmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049718; c=relaxed/simple;
	bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lujtnxdHRql4Hzh2eHHrs0tIlSEj2K2fvVdo/IcszzKekxRVJoEhNqbMEIS4ydBw2Kw+//FJ/Ros4TzpbBu6kLnMAo2rMOnj5GGDAvO5yctlbP444q2q7+EPJ/WSF1Q/yCKduI/SMpfpym6xjCm3tkR2d1gBMxeUZKaf8FZCMMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUNbB+gA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cuq1faEf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297Ul7A4030815
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 09:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=bUNbB+gApcvvdBY5
	b8XQnyMYEXkMJsk2FqKHhXCE1/gBey0epeYpuCZRq8jHXOBBanMWKzgWP7VaqLWp
	80Y1bg/KOybcJ1tasooPS6Ce4qOfpP+L83NJAc8czrx8pQLEmgz1DGgnhRuCeFlG
	Tv6vWaoOaE0iLBg9PiPdYb7tAgSF/lw/koXjJLMYAUa89xaAYueiUfGZrjBBSMVz
	7VTouxuojTkz6pOUo0gzA7+8WEOa1kWP2j35379HFhkAVD3DDIr5Px0Kz6boBsx3
	DetbvhxftJC/FXeY5dY6vOWzdIZ+yxbN615IqQQxeoFR4dQzbhETn71IY3AiZDBV
	QQfoDw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vcu1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 09:48:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35980a994d6so44963899a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049715; x=1773654515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=Cuq1faEf3mkWLzLGgbUsPk7YEL0r6ULGmK9A54k1o9CQnOo1KUdqpgXf4JWcfU1TLW
         zwdbmFF6DUipuEJxRHaPiKlR3VmlgGpkalfUv3bHWcEdlIt5STn0Lkvnvd/GwTZluC73
         aQSGwlaWmWiUcHOPKdK2AdA0BB1ttmf/Y/PZkzdMwFXoUDWGKMOPib+UDMkBj7xjt1vL
         tk1qMLbeZXJtqJJyW6hjKp5pUhnjHauMlR2bNGN5cC6/yVJBBTd0j6yz6hezD+R0FVJc
         wXE8Hl3Kk6cPRgtfz9KgaUOpGLJRIUjRlFzrotZKY4AIuJLQEoKBy3aA/aWNthX3S6+m
         fVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049715; x=1773654515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=fr0L6XIv1FFymRei8+cwidVHRqdpn8LyAutkJSzLMl1KFTDT+6jtEOKH7kU1R2dYr+
         Je4a3nNwN71Q355AwfXSbBLHa18ZNTt+py1jqknOlS/v1vbKyIiA/GxcQgmmXQBvuE9I
         OBtjB0uO+8XcOO43ZYaKs+wsM5tw38bQQ4OQYBPhqsk/fnENCbpo9yBM9msLiYh2083i
         DywV/LTvjxGuFUtxbvKb0j8oCBsBXOCqrWy05WMfDvihj6k2LixiIrom/xLOkLdzpQgh
         GCUtmOES7oaxxLvDqO+jY7cZghrABNyiTYl+n8Krw2IVGewMBt615VOhu9Vr1ADr4Lgf
         N7pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhug7t1NGE6asLEe/aJWJMplAuY5zXj5rZ5jkTACZWmzWfhHK9vhQb8mOlwyijUeg7O24+4uR8Ryqz3FdJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwySWn81bsEwI0W6NSB15zpYTmOzGfoLTAyridiOVkXJKZDktO4
	H/IFQaRseEo301YffePzx1UWYxR/erZzrrtwAYSB3H/veyuM0/Usut7+JlkbuxWMgwogScbhdMT
	GPCFh80LPEG+7vKFibSdGyoRRTdgXVs4lGZeQifOZI8pvdMKrwytaPP5+G7AEWTwW2kNK
X-Gm-Gg: ATEYQzwSPGLSn6wtEVk2nfb1ahPJsxyznowWcNfBhjigwakGct9D08Q5ZCM3NW0cIpN
	8od4LsI0em+aw+qVkBDjHp2d4/4F38tUC7gsrSmuBk8WWe5IfnoCMH2amNo8yrfps5KaIS9xZSX
	40KdxXtFWv3DuOXNMQtXyRPrg9YY0CauIP9WHWHOnU5sPyD4vVP1jOnN7JVdAETCJQBYQOywCUp
	ihAeEqtnjEy2NqEeXm5zvYInR95JNg2Rdv8K/aoPZmumGpGT/E9JnrpRobvR8bPTIw5hGJ51uHM
	l/M2nImpb8IVJtcCuaDW728Z4duXozob4rTouTiBST1zIstHQ4zejQAzPxbU9CCq3EpAO1rmag9
	dr7az14D2v/vAl4iH2IruIr5Q4Ra4Yes5FoOdBPN1tjwkR6FlZ+FUb/3sQnOzJZ7XZdMQVSZ/oj
	FGpcuMhD60
X-Received: by 2002:a17:903:1af0:b0:2aa:daf9:6980 with SMTP id d9443c01a7336-2ae8242d919mr118233175ad.27.1773049714816;
        Mon, 09 Mar 2026 02:48:34 -0700 (PDT)
X-Received: by 2002:a17:903:1af0:b0:2aa:daf9:6980 with SMTP id d9443c01a7336-2ae8242d919mr118232925ad.27.1773049714233;
        Mon, 09 Mar 2026 02:48:34 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm104948435ad.5.2026.03.09.02.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:48:33 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 17:47:44 +0800
Subject: [PATCH v14 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-enable-byte-cntr-for-ctcu-v14-5-c08823e5a8e6@oss.qualcomm.com>
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
In-Reply-To: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049687; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=VVEH4Y2bVVMa+sGcTQvGmFBKcR9SwZ1HAcL2UCbh4RwkexIhcoJw8V8NmeZDhnuDq9LuoBMXe
 tKGwtRztBngAwhUxuHA7JlFlvLhoivX6tXijBQz8/UA5NnCSU3B+cvD
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: Uv27hH1RR1uEpBpgqvp2YkBqH338QGw3
X-Proofpoint-GUID: Uv27hH1RR1uEpBpgqvp2YkBqH338QGw3
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ae9773 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfX34cB/UhcA0OB
 SgLVJNWptR8+Q6b62l/kGzs1zu4ydjYsZmbMyTTfsbe+I2GGHLPKvcv4opmTImScoVQl8sYXY6t
 RCpf5m+gSzUbb+B5ypBk/0X8omHoZ52OIutMQ6ww/ohvhCU/8TCOsv3dAfJdQZUd7Tn8u173Ide
 szQlhsOpYknOy7f5wYGWNz409U7wip9nUIS51bpo9+XJdUZOUHbqKXdpH8lm0spvNooc9snPSax
 frIdBYKaX2PPgMP/Yh0pJdwRpJ1fkm74QSX2DBadwPdXZQg+DFzdW7gDv6Lkxc/hx7hvZaiXwPq
 twV7dn9Pjp2WVpZ9IIvr7T3BcCTHH/60F0GK41K/3KvUi/q9y/jaTozMXi3GrYVErAedCyYtrV1
 auBGWqvN+t/dGCmMnJ6Y90fAc7xaJIznIFNRZzXzn0X89RUYGmg7jzMPepDmERKiKB6tUsth2zp
 +rBcJU4oV8rZHvX3nfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090090
X-Rspamd-Queue-Id: 8A4982367F4
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96181-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,0.15.70.40:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..2981001a7d7f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -44,6 +44,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -65,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -72,6 +79,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


