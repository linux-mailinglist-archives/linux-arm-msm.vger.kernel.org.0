Return-Path: <linux-arm-msm+bounces-114781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F+PvH4YzQWovmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 16:45:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C77FD6D4288
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 16:45:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SpfhDQwx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="NIn7/jpS";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114781-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114781-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DFD43066251
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480AB3AFD14;
	Sun, 28 Jun 2026 14:39:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E024A3AFAEB
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 14:39:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657560; cv=none; b=ljigCiLcSNMZ90WzfX3WOlNYi6Kbc7FfmTTwnNVd+shfSu75rdWPH1ioda1Rfl19aLDDw0GMFpYtVHuf468pBtxxqgapi8xuHYvoxbpYIir0/jlJM6RtdFhoNv62pUcccHoSJR72AINb86VqM3fWAvduFpVN3lmYzZKkB53YT7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657560; c=relaxed/simple;
	bh=/v+PDglwAWogEv7/BGamWY/QIHQ7rIYNCl7qxiSG32Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUhLuGGDOTFNWvAs8q0EHGrn0BVZ9c1zrnl+LdHCm9gzn6HEE2+cUGg7IJC+aNg3FM6U4arjXQBF5i7UOGLpMu/Xygylx6M7h1OMt++tQ4aEWCsq2HcliqXzgXAcLKzoaN1T1xapjP9bQCQ+F97KDrYbQ1dHznuG7nG40B067b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpfhDQwx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIn7/jpS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SESiZV024187
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 14:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLIO6kTkqkHe3ZnPDJEPPRXfk2XJq416JBKIIcB/SGI=; b=SpfhDQwxQ+BChiiL
	Nr5hB8DSzigw8z32Qeu4zFrGSXDbZRvo/rOsw6RA4i57IfEJIoIF+dd1kmv6gPfG
	KRkqRUV0+Cqd6XXwxDW1Zyl67f5m/8IQuYATdIggYwtiDVWYebESdeTyKQWX7tjA
	7+CMVhc/OmSzpTbQ2NretOX3o6LAlzGxvBNiysp5w7yz2kMtOlPb/WsNdBtFoPTX
	Hy8JgtsK1cMdjQwt0sovBFlFWUAh2IVAO3i5vCMRBFDtpFzcWOl3h/ipWaOa0IWG
	otIc2Bx2gAK0/ZFxApayQOVzJAdKZ3CzY+cQnZwYECnSH+WHEy3aVR27w7uFmiJq
	Bwgakw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279ck06s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 14:39:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0a27ad86so5231046eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782657557; x=1783262357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLIO6kTkqkHe3ZnPDJEPPRXfk2XJq416JBKIIcB/SGI=;
        b=NIn7/jpSlZvhX6+EKTbbkj5fGQKpiXTYi8Lyyls8eP6iJk+wFfhV67vMPC1Dh9koSA
         dNRKN2Ulph6s3FHMbhsL4giRzDX7cG/3UpnarzvR3CLSegiOMm8VLrrPV4goWAv8IW46
         6CSD2aU7eReXJuMZ6vmUNGm8cKQn3+49VDif3B57CPQMab9DCd7412LX+bYONxvWoTI8
         GN9T61QHdvohuHLYrdFmNFRmcJpNbP8REcwqB+bQCoNN9U6LUXI3iN1uk6JnCp+7HKcH
         m219oQH8L7S6p/7WbcmxsuCAt4kAfS0p7GxIrb5WtnAIIeHah0BnMM/hEg0GHsSmOWtd
         J2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782657557; x=1783262357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mLIO6kTkqkHe3ZnPDJEPPRXfk2XJq416JBKIIcB/SGI=;
        b=sgwgDyzxPPHWUF9OHkRxFYeiXhAoJWPe6snWjZkKHRqjDGkUzt/dGkzYXTMRHnXZkG
         oh1HqTwLC+yuFY+iT3NdWIye1HevhrBMZe26GOkEOHXQGsNbsoH4vIS4cXDc4MU0lD77
         ZuGCspCRKNG85ezk1shzqalmEna2qEIxLCf4tz+h9M88Sz9uwwLsJKLtQeGYDpGquL8m
         dnqfHzOyELa4faCtgGffEYbDU112zJizMPZ23/yssPihyyrbuH9n0JQppeaa+KIAcHn9
         gcS3DoriZ2HjZpCjy58rGgmh0jVoblorHGuCFNkw9NPXk+jB5hmRfyJjQGB577YLM8Et
         jS6g==
X-Gm-Message-State: AOJu0YzKRm2n+RX1TnYoEXu4G9WIDzdf6z8IxnQwUrXl3WxDz/bOEhKF
	rV4MTOIL1l4q+crJrdnC9aOr1XdoORmp/lzGmQN3913/G2khjVnPD23oHXpNDaHC4GveMJDSbTM
	GrWFmGw6Q6eWYfEMuNR81kIz11tJA43/IEEMjKxawelnM0eeMBBmfOw47epHLpn9NmHl6
X-Gm-Gg: AfdE7cnGhO3tHdK9l7QXtBJxcr1vyIVrte6Fjvkf+MWhCu+/pa/7yU1FhlWFxfQmEqh
	2kMBEEJcR0dCbNI1pHpqB4lAJ9BxjfSdYQURHdvgfrymzcHCJ4Q26fLx89wmB9KHPVO0JvzuwTr
	Vf+d7K5+ro1rrQRd8Gk53uX3WJzQxKxrSL0uvPfYse7SyQTo8jUpel6BPqGnUUNZYiBos6ZW9/q
	KjFqrT8qXaK7zkKMq0SJHEeVcV7SQ50y4YZ+fhd5uJ8DhZRFMg/3p50e4daaoG/EwBkgo5oam8I
	908PnNzXOyjt2wM5zv8K1kGWiOHQQGXvjFD4DAhsOfUzt2+Qsj7vBgDscy9QOGN18nl8h5MerIo
	3NRTATdzyCYc4mlK165B9oNAMaU9grRQgAg1xX4akd4vqnMU=
X-Received: by 2002:a05:7300:80cf:b0:30c:52c5:6e3f with SMTP id 5a478bee46e88-30c84fa60aemr14135203eec.18.1782657557400;
        Sun, 28 Jun 2026 07:39:17 -0700 (PDT)
X-Received: by 2002:a05:7300:80cf:b0:30c:52c5:6e3f with SMTP id 5a478bee46e88-30c84fa60aemr14135188eec.18.1782657556897;
        Sun, 28 Jun 2026 07:39:16 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm39300591eec.4.2026.06.28.07.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 07:39:16 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 20:09:04 +0530
Subject: [PATCH v1 1/3] dt-bindings: i2c: Add Qualcomm I2C slave controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-i2c-qcom-slave-v1-1-8b0a5c01f9f6@oss.qualcomm.com>
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
In-Reply-To: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782657549; l=3692;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=/v+PDglwAWogEv7/BGamWY/QIHQ7rIYNCl7qxiSG32Y=;
 b=0KdbLPFWs/JtY5tAzNsjCui5D/PmhNBdM5/j+HzgDIk0kMvFSA/dLiTPxpW6/Xv95G3aCIVsj
 ECBUTIGv7v6C/MVw5EkzPxXlDEsInMibiYRksXLKqCSCWBGDkaoW7jh
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a413216 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=3KSaKwb-5OmLBe0Aoe8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDEzMCBTYWx0ZWRfX7fwvrO6AptZr
 x1KuN66fCiz9BO/Dl4IpXlGpXH+bEdMgQCCtal4I3tTCzK9bfwRM+LEwcicT83sYKz+V5EL2fEg
 EI5xRlx9CfTpIeIcpGekmlrRmshElwY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDEzMCBTYWx0ZWRfX4sT3jwDqMDL6
 bHATMq8H2G7UdSBPZ6Tulmc0Zwq6eIi/3TPBNXheC8O0cNOm1Zufz5+4l+5UUN3Dwfv7T4ryR9p
 +LfTM36AhvpmxVC4cY/71kjm0jqOrXZa4wFNtAbRavTdMDw4HfLP6ylFpKnYqgROyjIdVaNJgay
 /m/SOSIM81mFKri8XKsYV8689BH1fZ88/7hVT3jmWbpZrzJ6L46YuWvY7kYLdYV2u6oLLQhj0sY
 rJ63AZZOdjSA6AWTaBzV/iISp91N3JoyZv7/4HioUfUHFUY5COAZ8WRjaqzBHBzwWyUq8yeLDn2
 /mYDHuFLcdIoIdKsQEqJtuc1L/3X67PlteGAV7foM+WOgNPASWsDpPL7T820Ud84mrNJLXaO8aB
 vHWdbA6TW9buk9StIElmAGgOOtvLZ4vR4Yqlw0NNeoD7nGLx/bArSFSzd6s5sx+ogzFUKeROFtA
 Bsm0aqVFFmOkKDWb94Q==
X-Proofpoint-GUID: -GrJJp7l6PA2QbTPZ9xp4Z9Bg-hQL_ES
X-Proofpoint-ORIG-GUID: -GrJJp7l6PA2QbTPZ9xp4Z9Bg-hQL_ES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114781-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:viken.dadhaniya@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C77FD6D4288

Add a binding for the Qualcomm I2C slave controller found on QDU1000. The
block operates only as an I2C slave and supports FIFO/PIO transfers, so it
needs a binding separate from Qualcomm I2C master controllers.

Document the MMIO region, interrupt, XO and AHB clocks, interconnect path,
and the 7-bit slave address needed to describe the controller in device
tree.

Use the 'qcom,slave-addr' property for the slave address because 'reg'
describes the controller MMIO range, and this slave-only controller has no
child node where an I2C address can be encoded.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-slave.yaml    | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-slave.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-slave.yaml
new file mode 100644
index 000000000000..3096ff2e62d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-slave.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,i2c-slave.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm I2C Slave Controller
+
+maintainers:
+  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+  - Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
+
+description:
+  The Qualcomm I2C slave controller is a dedicated hardware IP found on
+  Qualcomm SoCs that operates exclusively as an I2C slave device on the bus.
+  It supports FIFO (PIO) mode for data transfer and does not function as an
+  I2C master.
+
+properties:
+  compatible:
+    const: qcom,i2c-slave
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO clock for I2C slave
+      - description: AHB clock for I2C slave
+
+  clock-names:
+    items:
+      - const: sm_bus_xo_clk
+      - const: sm_bus_ahb_clk
+
+  qcom,slave-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The 7-bit I2C slave address programmed into the controller's device
+      address register. This controller operates exclusively as an I2C slave
+      and has no child nodes, so the standard 'reg' property cannot be used
+      to convey the I2C address (it is already used for the MMIO register
+      range). The address is configurable at runtime via a hardware register.
+    minimum: 0x08
+    maximum: 0x77
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    const: i2c-slave-config
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - qcom,slave-addr
+  - interconnects
+  - interconnect-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
+    #include <dt-bindings/interconnect/qcom,qdu1000-rpmh.h>
+
+    i2c-slave@88ca000 {
+        compatible = "qcom,i2c-slave";
+        reg = <0x88ca000 0x64>;
+        clocks = <&gcc GCC_SM_BUS_XO_CLK>, <&gcc GCC_SM_BUS_AHB_CLK>;
+        clock-names = "sm_bus_xo_clk", "sm_bus_ahb_clk";
+        interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+        qcom,slave-addr = <0x30>;
+
+        interconnect-names = "i2c-slave-config";
+        interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SMBUS_CFG 0>;
+    };
+...

-- 
2.34.1


