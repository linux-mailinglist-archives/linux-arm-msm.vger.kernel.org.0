Return-Path: <linux-arm-msm+bounces-93582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD2BChf4m2mp+QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:47:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E1A172568
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40F673050407
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C06334A3C4;
	Mon, 23 Feb 2026 06:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ix8DF9Lm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1Jd+C/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F075C34A3BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829129; cv=none; b=cWiELu096OgJfiukIWsWB0To0aiik+mxedYz960MbVJ5H8GkuCMugz8ZO177rKrxllG55U8C+fvRdbKy7PZP/gQstuN1Z5tyJ4RlQKQrIH7XW6A3hoWcsKjsVe68imGlbnLgeCqlTF/EQWPiZDRNsGEKyCX553TwOLLSkHzZe7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829129; c=relaxed/simple;
	bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O5Kj8tLXLG9Z1iQJAJ2aqThbzT3XRILhr4HM/s7QDh4NYHEuZDvRYGAiDhmbGWZzNQJrrEKN6wE2k0/rI+sLY0QjGxcD7+fwffiAP1j22xvVNVSiq4JVwh0HhWLnzI4ixgk4mLvqSMnz8V208w38qiXdo6+LluezO6bPBx1qMgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ix8DF9Lm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1Jd+C/r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMt6dJ2001244
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=ix8DF9LmUni4de00
	khCA1SoUKSQzji7xApq2vVKqZnzWhrhtMazw81w9FkUu0cWCoNvAwDL6f0XJ1TIg
	nlt9VBJ5ttdURFiZREuaK6PrQNBDMpo19k/lDPAZnzZ+pMTPUDC+yoig/ARe+/ea
	2q/pDn/C9J8iZPQLC5y7jyBEMTYJi9kHRoMb7ro6P9NHrHmT53m6NlfqB4NxI9Pm
	0/qVjWyIhrPHXC2p75hPxkEOGT5tVSxLrycYuCXTQ7RBtjH+qBYIuaem4wLknEir
	l+5KK345ulUFbZD+40LH9y0qC8q/ZmMOdHHhKDYiMXjeIdHzLbrhTPTFMb2B9PXb
	e+X6FQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5waup8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b62da7602a0so2683566a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 22:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829127; x=1772433927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=P1Jd+C/rDCqOzWoYidZllU2/p98XtWT1rWzMGkH8ifMgHzWh0s1AyxIAdQ4lZs1g4e
         7Zil+9RWCEi/G+DoKutH2AGp2MW0/O82g5l++QEu4IJclsBuTbh8WHCJM2LRGfS9RFqO
         Tkmp/+931DyaEIrfpd4lyQnSeXceU7E8OVOIa3wrIg2yYfqVZi0J3UvEjDlXUNPyuWNW
         Qp+dsD2LwhdJl+H3cYKn3HBi8TTRVf2hEQ2CEhAWiCr0LOff+CJwCMr01Vu1/EyTKi5d
         DzJKGDTqqhej+oPA9AW4B8vZ1Idhvp5XlgJ4H1rV7jtEeVlCNG44zRuYkZnT4+J5quL0
         bTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829127; x=1772433927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=oWAF8JrCguAGfpddeOqMNorWq9XkvGRbjqnzukwyh8RijHxWbamRCHxkUDWeMtEiB8
         QHiUNWIS9gRqKem/HaMN5p48pvQun/HRtR85lE0R03eH7GO7znUgkxhdcIPV6GZzwZv6
         FZR1XnhO5YGLC4GAT8L9lBLM7RAe6zSXde94G4yJyS2dUcAfI/Z70Ruwsq0eolHD+PRs
         QDAySTn/JGiGVPPYmn8DJXIXD0WVQWtzrdbPCRRzQntVFDSbRDmdmObUYMfQaZlkiJgU
         iQtLWIU1JuO35v/lAqGSFDWEM0hsv9EakUMr9ir3KbJkjf1AMZZQNwfrz05ZGV609o5m
         dqGA==
X-Forwarded-Encrypted: i=1; AJvYcCWWljYrhyShXrdEDYVUAxPwdFCXBKlXcV1RTsW1ZWcYUWbcH84zGQCDttINvVC9++fSEb9RYdg/YXs4eCrb@vger.kernel.org
X-Gm-Message-State: AOJu0YzTWCz6b74lGCShUzf3YRHFbliWGxO0QdLEdbGVbfPaH2O7RMrM
	xhCLie1iEecXszbBsGBe1mtQ177rS5nHhRrE+zeqjPG5PcBQ34Pg7zAbXhOz0JFttqBQYgN4zt7
	HoqmGc0qO4Q86A3rSzAY0O4D5kb2NK05oKABKB4cU5vNDOuizepCOedpFCDxqphMk3lDs
X-Gm-Gg: AZuq6aLs8b+A0ygoFPXEXNGBP8v5qhTok1ZIBiSAWqiw4eXS235OxtedLTMMNaH47q8
	uw6DXhsgOvin/z6BXN+Re5ifWa+C0q+Qsx8Lsgxf/NTVzLOViwlgpynZpBQcEdYgC+BOqHMKE42
	9nPqkIH4vLI9LSVuVbm9lGJJvD0LJYruDRIFBUmpak/z23yBQh2hE833YlTmRLKIQwwUHHltsSp
	sPl80+qQxBlORTPLhq/35eBTJtzuts2f7j9o1ATVnpyWqVy68brF3FM6/C9Z+lhiQzyDlJdORU6
	+O54vM+np6f8h8EzOtXRleBEaQkK/NwPB7qQT8YC9gXN5efIZx+6iVOfSAirI+M/OFTftUJ4ONw
	3QEQmzPr8N7l/DXOETltzCcRS2x+J4HD4jy9NrzBIvPkdhBWDIua1UVcRs7bUUqgfPqoovCS+0W
	5ExfLwlbqBP136
X-Received: by 2002:a05:6a20:258d:b0:38b:ea89:700a with SMTP id adf61e73a8af0-39545f55426mr6544377637.34.1771829126540;
        Sun, 22 Feb 2026 22:45:26 -0800 (PST)
X-Received: by 2002:a05:6a20:258d:b0:38b:ea89:700a with SMTP id adf61e73a8af0-39545f55426mr6544342637.34.1771829125924;
        Sun, 22 Feb 2026 22:45:25 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71839d6sm6483993a12.6.2026.02.22.22.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:45:25 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:44:41 +0800
Subject: [PATCH 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v1-5-042fb35bd37e@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829096; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=dKirz3jBPCDSlBfWyW2kjkYiVvnjbcuEABUq5s5D1lABgfXVMfeJ6WvofATkXja4IF8NUrRI8
 mJYR53CJLf/AIv70geMxfmLFBU3Su1cx91BAhNV81HGkH4DOotQqnOF
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699bf787 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfXylZVVod+uqT0
 R25G5IxM+I44DS7PIVqi9bGUwQrJkeUXK3I3wfZIxmszuhImjEfRe9VFfGKPVKsG9jFsCApRfOR
 SuCCPeuBUdapQWdWNWiG4g/HikvE4JTbQPVXEMEzB5qcMvAaEERqJQxJcxeip6spAeiScafo9Nb
 slHY7KXLI3Kz8qphjDl7ToVBcVYFHBXkepohTLOCMbpsXy61X19bYvSl9uwIrdnEyF6JmSoREMe
 IKkjxCoTAoHS2ST8MpuL/yYLQKMjq5hUDD5EaVc/Kh2IbqxCQw7u+2aMKk8KXYxMD7ZxZNSCrvE
 QXLGj0P08mamiOi2y5qsQX+WfKn9NNJnmQpZNsPKigE6KpMwtAAd2KHb+pr/OMe3aSkwukhEJz7
 wc1/rdd/CuubEiOGhV72l90mnySxNdERPvCMo3zQXFuhCSY7NG4DxwKj1S/EjhouaMfvgCcONq6
 6A1iLkM1o5GfGiFm59A==
X-Proofpoint-ORIG-GUID: I2nSCDeAb2xPJqbSmuF8C475bdChPSAp
X-Proofpoint-GUID: I2nSCDeAb2xPJqbSmuF8C475bdChPSAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93582-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.15.70.40:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95E1A172568
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


