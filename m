Return-Path: <linux-arm-msm+bounces-102454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFDNI3xu12k5OAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:16:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E59533C856A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FC7030382B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818DF35AC16;
	Thu,  9 Apr 2026 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSyd7HCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCUZXdjS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2C537BE9F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725906; cv=none; b=n/QaAdGwPA7cP60z9j60+EBrXI3+rhzLbm8y2gsAv7paOf17PFVii9vnZhrEnL5KbWu2BERYoHRG6SrH1B886b6+Up/R0wSlQ14Wtm7HELSCcpn2EqJPiZOAfYr8Ync0gZCD3dO95+lBJBZ/+xnZLFGMqTU3RIX4Jht/1kfgFyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725906; c=relaxed/simple;
	bh=DLFYA+6g/cS/X1268aP8WUi6d/wqyTo58OOdjlvzFZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D3Ioo7lEXwILMU/AzgjHnpp2fWFLeZoAbjqR8ZsqoUYnguKXpCXbheZENiKEzkUm2tg7Z4UMngigOTGR2R4xrj0PLrUH5Y4ZbzdI33embfKCn8nE8FC5KESfjxzu3mw9QohDCYbRvnZY802+ak5BmlfnaPgOUHdSaWkdPiWM9qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSyd7HCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCUZXdjS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6392ux6p2247256
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nIo7ubBe+RemoWbZ+szPcmHIVb6Tl1/ClKl
	0leoe8Fc=; b=TSyd7HCMAC7OW12iTKGkv5bklxPdwBC2i5N3Ye65kiz7BClH6Q9
	mC5yCg78TtqvbJKBM7UrMuOqS9rVHWQqtN1wUy2zHMR2qix31gQsz26s3vT8gMPQ
	quX/KcgDw4sSgOkFhJpBFEmoGgZXoW45JbsK+ayDsfY1wnC9RhOtg4KEMQPKEtLJ
	m7hM5kyy3Q7XeMWO6tFnFO5ywZGUQ9vsk5/6s9HlRBGDdk2JMFUTh9DDv7bBRt3t
	y4G31y8dV2BupFWeKlCXmGiVf4hLns/OaareM4+Qgo4pCHIb2tmonXr6xtb3bETh
	nQ6C2XOhhZTRC4PKWIakkK8P8fk1KSG0WqQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de3s6s7t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:11:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d3a617ad90so1841592eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775725904; x=1776330704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nIo7ubBe+RemoWbZ+szPcmHIVb6Tl1/ClKl0leoe8Fc=;
        b=RCUZXdjSFWTIE6UvQ+ZMcz7tXQXR6lXQAp8+CXsiqxN5+FNKe6x9YzteuzG59RgAUs
         GwuAK5NU5rt2qtJ8pfsNHPDZpXCgNH03fVeIRMWe/2rpbdJarTW7Q7akyBNLx/Wyj3LQ
         wysFa45lL0RjyFyVx9Gy/lV5ipgIdHibf3Diov4VSlTOaXWY6WVmHDaf5ubuZea0NZvt
         0a8dYiySSZHjV1frX9TMRqllofCErRw1C4YoxObjtlEXUMH+tsDuKJ2KJ1FvGAi1g/pS
         LuTqa9T8h8/IxwdVBwfj6m2HEVGGpb6THSZuDgaOrIm7HEk+M66RbN4jV2e0mHj0agW+
         41Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725904; x=1776330704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIo7ubBe+RemoWbZ+szPcmHIVb6Tl1/ClKl0leoe8Fc=;
        b=kV7pifDaGcAluVZmafMLK3LFy5oGKVH4S+69dZd46CF9yeIfVUISU+tHodpX6Ns0BJ
         eRXsXwPvRZGCgmVAjVDu3hjvgOTby3aqoOSZNbgktS5OuSX5nnZurAZyhAZIqb6/iK/F
         iY1kz4ILBvsn/VN6X8XqLbMxDpFALtYPP7/vCSNkPatNFjOvBsNyNb1BXXBhLE3Yy8pU
         GYErz1OwgnSpUooUAFhGgQyG5JxpAawo3QIy0ow/Pv3391/Zvgo15VTWbBbvdn+6Y0vP
         optkVht31N7GZAFvFZgrbf0OtrmC+Kti5HjF5p/1BieV3mtVU5W6n8Y7jpBNHc2bU0W2
         ufmw==
X-Forwarded-Encrypted: i=1; AJvYcCVnIRLJVFJqegYgadlBGBDVHhHO0aVlhCLyMil1nW8wfJA8kc8mIb8kQ4O1vXMLzpDyVwRNsxiZuECBnSsa@vger.kernel.org
X-Gm-Message-State: AOJu0YzKFMg6e7e7HD9nLw7nDEbrIrpZ/WAZh62nnaxrswxWBhOl1/q+
	M3eN7dvuNi7A0GQYUi4RFyByLhGZ54bkhYk8xgpzshODN/n/DkPP/9pyF5GksW1M3KuXjNMvgyl
	RybpKM/vE1hNxEvMEnunnYL3mWZWp7kz4DwOcNrc1RU8u3KuiSMsstdujIObJKGaC0stdjUyqka
	he
X-Gm-Gg: AeBDies0Qp+pSQBXpKbPQUzIZtDE0csr/X0AYknoRu38g5N4Pjoe/tBbVaZ51v1KSmD
	mseSKV+AJ6bLf8KsYDROMkvEsQrAh0RSCv7ZsUP1HkeYgcO8I1GSFgBWtDBYQ896JQlg6FnG0Tn
	2J7yI5+aTntUUghXNdQBUdfftRGnBNMlhxloqfXlBJlN2M5Fe3GUiFpQeAp4CxEBJTDtgMs7R3j
	dnbRji/XkXMQbC21O//LljFBZPHjtdNvvkH6lBni0K7kZRqgVWqu6J7m6NAVC+aD1K+4i8ty49p
	zyhuH19A5ubwmG2VDcotfh1ksLnBru3oV04pkwxuZXpDstKn8zKc9gLwrCm8C9aLoJVehXVgZQ/
	kELD9u+Or3zbRCp9CRCtbVsMHrUJ4hhQ+4Xb1PfUXRs8w9UMpkeSMege7CFBjaILuhLeDgvRpj8
	H6s7HCAg==
X-Received: by 2002:a05:7300:2153:b0:2c7:287:6740 with SMTP id 5a478bee46e88-2cbfc45b1cemr13334071eec.28.1775725903707;
        Thu, 09 Apr 2026 02:11:43 -0700 (PDT)
X-Received: by 2002:a05:7300:2153:b0:2c7:287:6740 with SMTP id 5a478bee46e88-2cbfc45b1cemr13334043eec.28.1775725903143;
        Thu, 09 Apr 2026 02:11:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:11:42 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/8] arm64: dts: qcom: Introduce SA8255P as Lemans family SoC
Date: Thu,  9 Apr 2026 17:10:52 +0800
Message-ID: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Co8Nw752-eLrpxgXBy7jlq5ZEwHATjsj
X-Proofpoint-GUID: Co8Nw752-eLrpxgXBy7jlq5ZEwHATjsj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MSBTYWx0ZWRfX4Q6elbJoctN2
 faDCqUL3jl0/SGfWh34cqeQbB1xvaXeG0DnfAiEuCeBDxv7nmZXXTggG6Ge2qUqYbZ4aB7XxCPb
 2NBCiQNHNPR02Rw6TaTFAaiV8kDWka1G1+co9+NiQZiuF6HXZXOZAacUcSbvaRojbHQPT7/pg9H
 0BaxFz8NUM38CnUvbYRUOZJ/fu1sMuxtssXPqT6KQhhp8CMN5TFR0aVrOFeS216cTYP0nNnqhic
 IOGulYoDmlnnhbNJbfuccma29+EWtTqB9obBEr1vVdeqnuqrWRMX3HRQmwD+4E0O7wy2TvAcNVU
 TlMRwxj8xwjAlMy5L7YJVX3D9G1CcYooRayj1GYwr9LsqD5ZQc/JiskvODo/CQqLvR5kqNpCJUG
 FUKV4mOEA5L5OpI+DLqWZi8wREKtE+12iaShTEBBwabPxwkpvJ6TbiIsXbXtVHQglVeadrykt8+
 aQMsVQCoiBjjFCgZSPg==
X-Authority-Analysis: v=2.4 cv=TZemcxQh c=1 sm=1 tr=0 ts=69d76d50 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_elaSrogNjTq6yN4jxYA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090081
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102454-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E59533C856A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While the patchset [1] supports SA8255P as a standalone SoC, this series
offers an alternative by introducing SA8255P as a Lemans family SoC.

Lemans family includes IOT SoCs IQ-9 and AUTO SoCs SA8775P, SA8255P.
Among them, IQ-9 and SA8775P have platform resources clocks, regulators,
interconnects etc, managed in HLOS, while SA8255P has them configured in
firmware via SCMI.  All Lemans family SoCs actually share the same
hardware configurations like memory maps, interrupts, DMAs, etc.

This patchset moves those platform resources out of lemans.dtsi and get
them accommodated in lemans-iq9.dtsi, so that lemans.dtsi can cover
SA8255P as well, like lemans-sa8255p.dtsi includes lemans.dtsi and
overrides/adds properties as needed.

[1] https://lore.kernel.org/all/20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com/

Nikunj Kela (2):
  dt-bindings: arm: qcom: add SA8255p Ride board
  arm64: dts: qcom: sa8255p: Enable sa8255p-ride board support

Shawn Guo (6):
  arm64: dts: qcom: lemans: Move PCIe devices into soc node
  arm64: dts: qcom: Rename lemans-auto.dtsi to lemans-sa8775p.dtsi
  arm64: dts: qcom: Introduce lemans-iq9.dtsi as a placeholder
  arm64: dts: qcom: lemans: Move pinctrl states into lemans-iq9.dtsi
  arm64: dts: qcom: lemans: Move platform resources into lemans-iq9.dtsi
  arm64: dts: qcom: lemans: Introduce SA8255P SoC support

 .../devicetree/bindings/arm/qcom.yaml         |    5 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts       |    2 +-
 arch/arm64/boot/dts/qcom/lemans-iq9.dtsi      | 3711 +++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-sa8255p.dtsi  | 3027 ++++++++++++
 .../{lemans-auto.dtsi => lemans-sa8775p.dtsi} |    2 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 4041 ++---------------
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  |    2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     |    2 +-
 arch/arm64/boot/dts/qcom/sa8255p-ride.dts     |  222 +
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts  |    2 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     |    2 +-
 12 files changed, 7288 insertions(+), 3731 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-iq9.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-sa8255p.dtsi
 rename arch/arm64/boot/dts/qcom/{lemans-auto.dtsi => lemans-sa8775p.dtsi} (98%)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-ride.dts

-- 
2.43.0


