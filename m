Return-Path: <linux-arm-msm+bounces-103933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULApEllY52kE7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:58:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4B3439D74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 209FC301AA89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F82D3BE153;
	Tue, 21 Apr 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2Vicl+P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2XaGInN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E05C3BD64D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776769013; cv=none; b=i4WmjyyfKfrd2k0kNzMhZpXIyu8jktmDMbKsoJxBbpLLhJaJDbrqB1xS25J+zWCTopwRezYHYLcIdGcF0/Siln4+bXBgLf8bXD0cjb1R36iE9DrtLz5j6iRSXomqZAVUg4bbsj+2QmnadxPwxzCZgSu123uDxBJl6HHctHmGPYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776769013; c=relaxed/simple;
	bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mdGnkVkFlH518+l2Y5V54CuywsNr+QAPAkkjwX369YtQPgkbBzmS+IhPF6W4uICPw6ykRUdvt3Ukvvtn7iXsz2dYgINGPbJ0DE51LZQdZ+3iS0p27H5yqMD8fg4AcdfTlkEp3f/KQB2kHLcZ9/JLWryAJ4QEb63v35wiqb0x0N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2Vicl+P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2XaGInN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L74Ggl1538502
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=T2Vicl+PjCLK69W5
	feWHLqGAh88oSlaRwtcu129JfQ34X1Uus7xOIsAgZ3rBUQWQXU77/Etiun81dP5b
	uR1plywNmeoACsmJV+16Zx31Lmj35IoWLRXNeyg/wBXp11kyIhrS9YoMDq1JLLuv
	5i1E7NQjJi9TrrLRbIPRbWYqU+t3CzjGZG3LYS2onqw88HrsahflCt1yw1G9LiC1
	gS2eMHfOVLWuFFyKkGjKzVbqba14Wr68dC60GE6uc0j+Y0Fk2d0Qml5ExyN9bT6Y
	L9kF7AnGXOmhOCg8Imp+uugIMDYXoH3xTZy+pwOJdkgXsSm/2YxsK0fJG0BcySQ/
	QGM5VA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp4haguvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f70ae35c0so2031748b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776769009; x=1777373809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=X2XaGInNpJpK5R8qFMKe4UET08poabkMDOwGDn5KOcjEXy/uDyUZ76BF+J6fUTa8xt
         rqZfiZRkCbIGWXB1CsJZqYrIzZ1LF0k9oyS4l9UZqdXJcBV659xOogC5nTHXkXLXxVA6
         I25aACwGqGXq4h7kjD+heHiTbgAEvFyCW1UYuWPGz0oDj7p0jA4vN80ycZBZoXYCOkTF
         2AOSVans5W6mKssEZs4PJ0tcIUnIi9qkgtDIuMuMhh3fNvSTqURQPyc/KMNVp/07h8ty
         KfLqnJJ3OdYQTcEm4AyjI28KXC8q2MGR7S6oHpHVQ63Kmf7UPINSbZpWATbjs1b/dYOn
         7Atg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776769009; x=1777373809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=Xzy9F0b1n7kxn5FCuzT0GP6ScvVKE0mfq8dYOa1VXJwjVgdORkxaiteb1cs6XRfvjq
         Y49tA1o9rPQz0zMQ9BQFkfgSbPQ3LG6lgvIumh4RCIW/VQKYOcJTO5elfszxxYElhL9z
         5q/7zSha9CdGgmcW3sbmPm2pJmyWD+7amdDNJw9PbVK5UgRXJfzEFfCN30eeKNqMSAnm
         93MtyWj1lcUOnqnTItkl+lC6Tc0Eqrm4JnM5jI8GNyGTcNxLGPu5YjcFyJLTShE9CRPM
         lird9//18mpzSR0VXAhNvHnZM7mzJ1BQ7CbksFJmduHTFpymW4x0O/k39jqEYOfzllKm
         dUsg==
X-Forwarded-Encrypted: i=1; AFNElJ8mDHr970eKY2NsvqFdbnvXAA64KQu6jWP0IIr0KTGsPpmGoH7M1I18GiDwq2p7ULJAAOQRGzN5ejA2Ag6V@vger.kernel.org
X-Gm-Message-State: AOJu0YwVDNBKMQ86lmmbUgAbnjymEVtsj9gI8/yecdxvjzbCoB5fEHAm
	hrn7z+cOf6wAs6OuY1dQVP/4budjFCiMSnq7JGISwBL093lO1IRj9WCYsa5Uqs3CHltG18paqKg
	J9YHCqop3E4FpV3cHudeSsyb4wk6UO6dbfTcJ0CXHaHJpLDeuEXjii3k72s/hRUQRkxa/bWkOB4
	rz
X-Gm-Gg: AeBDievA7uvcSg3in6WDP/zl7pQN/Vb5aRfvJjqzyEL5ayLsMCdiOy22G5BlpZOQ2Fi
	Mg6zlUoaarJThC8bKPGGSVXwwbSV2aVzF4J+LvBXeV5/McVgfVhA/WaZ9a3pMmH74J4MAbJ+7fz
	OoSHY4P80tp5hxYrXaV8AKKA+Or7WsUgV0MjswSJIX9ITEYK8GO+3I37zPpQSAv+aws5UYkhgyc
	3UVoCCVqvcuB0H0cSxKN0oX3kcG8yNdOltrC/OPwwMpmN4U5E/gOjVHUfRXJAo4TWrqGNQ+offy
	kv/k4dPypv132ZfSwOXU3P7np354vF4Sf8w5ilhgYsu42RfYa2wjD1A2Rpgy2Jhmn2R7btbRZUL
	fRmatLoQDf/C+5Ci50O3HuJD7oB5ddKLn6+lgLbIypIUIXn94vmtgDwTo1z1bMmArbr2/XzOK68
	qE+c25PBTNbWl7Y4FZIIE=
X-Received: by 2002:aa7:914b:0:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f8c8c39c3mr17372787b3a.26.1776769008685;
        Tue, 21 Apr 2026 03:56:48 -0700 (PDT)
X-Received: by 2002:aa7:914b:0:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f8c8c39c3mr17372763b3a.26.1776769008211;
        Tue, 21 Apr 2026 03:56:48 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:47 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:54 +0800
Subject: [PATCH v17 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-5-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768976; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=dCtlo03cBs3X5l1VhW746PQdMKk5Nr7hUDLc99rGvodxoulubJqgxT9IZaYBrHvYb0ocFDLYx
 jtbUug2pvSqBPRpenK555AWYnohpryTyhmMRtz/Ln1hrMNdRzzJgraE
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=bOQm5v+Z c=1 sm=1 tr=0 ts=69e757f2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kNgSqXZdxwd22Eh_e_RFDz9Gkg_NtxLX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfXwWeLBQ5wwGsR
 CvO0KyqNj00X66GqF+8Z3ediVudYnSe+vNIwtp6DaVmgUYoQmJTr+A2nx5ADoWENgsHSUTrqCXT
 2oVUa2QsGozK2aDwwbwsH/dwDmZeNQ7GrYUoBPR4d8T3cE6Gba4sKu3PFuWdXTsRdDSWQ7xdoWe
 bo2UYCeEJQuYG+keOtNnxzOqPacTOQgmlX1YRbBnGNcJaimhUk3Wt0AHmBOAzt6VLegMAsz27MK
 SvYhr81DB+YS1ZTLIykAWh9rs3zAafjEO4VloYICO5l3kq5uVLr25asHxwGhOiPeaFAfZsR/nA2
 +Itkw7F+3ZWI7NUd/q/2+q4X9/YARVgRDQzppUjR/Uc1f9IaTngGBC+VsJLUqit4MZJ1tK+0Mql
 m4SDzmHs+ZKSB2GmVAap/dmziV4wopCU56uQt1x7u8q5yqqMC4Kds0spsLSCsvtfWAFzMbGTHIe
 MmQA17RZ3AA74AotcGw==
X-Proofpoint-ORIG-GUID: kNgSqXZdxwd22Eh_e_RFDz9Gkg_NtxLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103933-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.15.70.40:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D4B3439D74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


