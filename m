Return-Path: <linux-arm-msm+bounces-104007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPyEKCgt6GmYGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 04:06:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A31A441405
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 04:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40E313034546
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0628430B508;
	Wed, 22 Apr 2026 02:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKnsvfRp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fs8HCIXD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C042918DB2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776823535; cv=none; b=Zj1LkIujKk5nMjhKrGbyE1ZOW0bV3F0hQo8+bFwtwO/FdDhIUskIXxmSbbBQWi8wMOJ/o4RW+W5MAc45zKDyvlNrzJaDH5Vk9NV0Q/IMHsQbUtcRNS4kVinE36GggARn2lEny0rRi/RuZ/LB9XyUpXiJa1oGU34Ctz+M7R46JTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776823535; c=relaxed/simple;
	bh=5C2q6Rggmfd/2JJwxgiGLwYgn7VmHYAaeGxytzjHEh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKh2vCjDXvVFFwmt7VvwKAqcUCT3ouHsU9Gm0OUAeUbvAsF7MMbv6sL/vSMcP4/BugNjuKMgL6JE1+YjWNUonxhkIxFgACJc4F9jQ2To4BAt9gAibrTuinxl+naePSgF/ckTYuQU+Ez5wC3YfW2xz1G3z0DiY/RkJyAkhVxRnhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKnsvfRp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fs8HCIXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZiD92965802
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	52+RqOz3orbefw3WyU1JbiSn5ln5+pi1k5H5bpefB5I=; b=UKnsvfRptJ0wRsXA
	9GT8UwFhMeZnQDyY84eEVMbM5x/a9QOqG2Ie0nq+bPjXadFokDsQ3LvbYSI1rSmq
	pp1ZyQAclm4jhD6nvzOdwcBH4uHvra+5py2dC5ikldPcU3/YDxLG0hfe9Rvm1bDp
	tQF8Um+tuxWIzrLMBnxaBIosZwT+G3iNLESWyP7qxmsaDNSsuCfwLj1AVm+iReVV
	d9kYA0AJSbMT1s+3mkd7XEnXBpIZYUrh+ercp0bLB6Dktrvi424vdzxs7ogDspM9
	lThCLzsRi6FwPcr8IK+bhT2QoZSkmcvaQNIrTn/XfG/KxJhrqiQAA5tZLWeCMv5x
	8ONLoQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfh68c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:05:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso686078b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 19:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776823533; x=1777428333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52+RqOz3orbefw3WyU1JbiSn5ln5+pi1k5H5bpefB5I=;
        b=Fs8HCIXDJj/PHlGDKr4LUUKZp45DGalfKH5ZpXj4h8nthmykAcroBKbhLJXARedIAS
         BlxV3lmAqSGn1043EcC6fdgw9MA9+8gx9WFEZTXadDF/qpmibYPu193CRI19ZeLzsidR
         31AW85GiAVby0ZW2qGYOLFedxxL/KsYDNwwrP03+DIgvcUHyN9yn0kFh61AwVT09aMMi
         6f0ukFJCHIf5V3pOaE8ZluF0ENJ1Yl0UgbbI9xPo4BymyM5NRm7HYbAyh6YIpklolu72
         zf/SiinOlAyKqh+Bs0jy2l88eoNOQsWVdlQwXtOFtMURm45vFi+oAxzriCZ8HgQN8EMe
         iinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776823533; x=1777428333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=52+RqOz3orbefw3WyU1JbiSn5ln5+pi1k5H5bpefB5I=;
        b=ER99JFXZJkdEiYuxmFO1GREl8Q6BMnnLpb7rWxxWPLfyEXGPq23I70U/Z8la+b1hdn
         06SfJ8ELviO8XS0zTu7+PMPGAcUs4DJ/vx7MhPQvioMC6RGs4utWBIkxtuLdnMLN8lE4
         b2YJCq2lDVhBlHU4FYEhrYl+YqQowNGD3I4rlyznnm9Pru91ALhW6gj3x9uAj2ALNwu4
         QAelixhzn/tQRn3IJxjRVor3ZTsJJhzyQxf+yHsSIgIjrj/IiquRpQ1ySamdNL1zBhQ5
         yPE14iGcqI1uNNXqj6Bx973ZrM4u78d0u0VJE4VBz2ECg21Q7F6Th1in4WlNdfFxOqP2
         i2MQ==
X-Gm-Message-State: AOJu0YwRBiFGTzGdODBpknKxdnZv85WnLIzvXjv4vJyJ3RHQV85IPtTz
	DP2bcGGdkwUpfLN+gdlc2XmPWIh9klWnqP/NaZz6nXkGfD6C8R2ipli8Wl/uz4dIMZrg/gZfA/e
	xlYgBu+8MY4oUXxyJsJlEpG+JqaaKCMnRSksebx+Dkvb8NIj1Pl/f+5Gu1pC7KM/hUfJCyQrku/
	cZ
X-Gm-Gg: AeBDietkgnD9QG8LOAEkAfvmxVMW7Kwksv6r3vD1Cv4Ye4klHLct2XAWWrqQs2qFZbI
	FcloWXv43O1MUCV2LUKUka7vSeh5y/RbDLk/hQu53n5vbZbt9fDr/r2bYVzm5rCi8unkzeXRLf9
	IoPpr/eu41cVdofFIvlgJtrgz31jRiJwH0+I2LqdqOo/WE399u88TEU/atGi1T5uvspp3QpyTxX
	5Rj0T9wOWFUjKz2vuciQqP21HxP94iexCWO8jV/guvEtfFc8JHHE+GA7PhF2/xpASKYRjQdsY1w
	M0BdfT/Y2QNm9kXtJqj57b3VwGGVpQehD1vjnVlVAdzF7voitEDbxlZU93Vyygq+3RvWp5NfJco
	JZbJL636j3vlWO+H1Nh0k9Ncpqors6uibDBCZvqIhP1FZ6cIjbBqQWes=
X-Received: by 2002:a05:6a00:b60c:b0:82a:5d55:5807 with SMTP id d2e1a72fcca58-82f8c7cf160mr21181623b3a.6.1776823532721;
        Tue, 21 Apr 2026 19:05:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:b60c:b0:82a:5d55:5807 with SMTP id d2e1a72fcca58-82f8c7cf160mr21181578b3a.6.1776823532207;
        Tue, 21 Apr 2026 19:05:32 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981be6sm18040368b3a.9.2026.04.21.19.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 19:05:31 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 02:05:11 +0000
Subject: [PATCH 1/3] dt-bindings: interconnect: qcom,x1e80100-rpmh: add
 clocks property to enable QoS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-x1e80100_qos-v1-1-bcc2afe4cc78@oss.qualcomm.com>
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
In-Reply-To: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=Y6rIdBeN c=1 sm=1 tr=0 ts=69e82ced cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OrdcpLHLpR68xOABugYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxOSBTYWx0ZWRfX1NZx5iIXwNtT
 PGt3efeompHZzJrOXQgEqjKZaKnVqmNg7cfjjz1Bja/zjBXUJhhsWa0y4EzNz5b3Qpeep3I0elx
 9AHd1Ed8Rwa3rYENQ4PAT6Q9DF7WyrKMnPMlO76MdmP9UaKH14KFwo40B/dw8N3DCGvrByjTJZl
 0b9Hmx2sy+1znuuZL3KC4WxvhSzWK2YTPyvTGRnRGpRhf3vlv1en/dic5Oo+Xyb11JmH6OCE7pM
 EgDplqor1Qq5qBN/F+DsKBFVi8tLjpmAPrirT6U/mS5Rsz03JcbHPAfZfoN20PGiLWuVaWCj76N
 fO7Md2yZJqjpOxGrcQZbpbFepzrrnJQfj//pEQkIRycrgeGxAjPZ33JBAXhcIkjObkFa6ZKjVI5
 uS9OEknEYZBx2SGP+VUmXa4/OBnj33y41POVDAuDvSRqWkjM/P6J+JY8SptJhV1pjqWwnWn5535
 L4dq8ExPMJTcB+5XaWQ==
X-Proofpoint-GUID: 7NJA1NCFf5BGrbLHqusavRx0AV22zCj1
X-Proofpoint-ORIG-GUID: 7NJA1NCFf5BGrbLHqusavRx0AV22zCj1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220019
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104007-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A31A441405
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some interconnect nodes on X1E80100 have QoS registers located inside
a block whose interface is clock-gated. For those nodes, driver
must enable the corresponding clock(s) before accessing the
registers. Add the 'clocks' property so the driver can obtain
and enable the required clock(s).

Only interconnects that have clock-gated QoS register interface
use this property; it is not applicable to all interconnect nodes.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,x1e80100-rpmh.yaml  | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
index 0840b0ec6e27..27d9234bc762 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
@@ -46,6 +46,10 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    minItems: 1
+    maxItems: 6
+
 required:
   - compatible
 
@@ -65,6 +69,63 @@ allOf:
       required:
         - reg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-aggre1-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-usb-north-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre USB2 PRIM AXI clock
+            - description: aggre USB3 MP AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-usb-south-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre USB3 PRIM AXI clock
+            - description: aggre USB3 SEC AXI clock
+            - description: aggre USB3 TERT AXI clock
+            - description: aggre USB4_0 AXI clock
+            - description: aggre USB4_1 AXI clock
+            - description: aggre USB4_2 AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-aggre1-noc
+              - qcom,x1e80100-usb-north-anoc
+              - qcom,x1e80100-usb-south-anoc
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
 unevaluatedProperties: false
 
 examples:
@@ -80,4 +141,5 @@ examples:
       reg = <0x016e0000 0x14400>;
       #interconnect-cells = <2>;
       qcom,bcm-voters = <&apps_bcm_voter>;
+      clocks = <&gcc_aggre_ufs_phy_axi_clk>;
     };

-- 
2.43.0


