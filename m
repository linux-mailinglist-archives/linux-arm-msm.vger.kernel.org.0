Return-Path: <linux-arm-msm+bounces-112604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1XGEMotDKmqklQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:11:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E6A66E6C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:11:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KYq8bO8H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GB6tcldl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112604-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112604-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0371B3043581
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6082A357CE0;
	Thu, 11 Jun 2026 05:00:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C06C348860
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154058; cv=none; b=t8dt4HeH/izPGd6N7sxZvZaxjwsz1x6hh3I+QQYucopOQxu08vqYUsAd3j01cjDDegnk/g1IeGyCfcurXpnJCslAcEgxO6OcsNyJJC/INPQ9keQkF45T2bcbtCyzoBlG5gcGLckdsA/cbiPsAwXbdWmAZliEGE6djxdaYmloHFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154058; c=relaxed/simple;
	bh=mUskJ8SNq079LmNHg6tuDsqQTYd8lGSyihEzvrPy8dY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D3kzvxHcxl1K0xHl5pIdAJbxZ5TP9RSDu4e6XtIlbggomptg5TncJjg6Q1OSWFl2xdp5HaC6PulJM67WGU6EtdMk8TtPZvym60LFO4HroutUm+FBwLRnuxAKVTmedrKAAN2QuTP78cfm3kZnhAKd4sICeAo26gbpI94lokzHuZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYq8bO8H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GB6tcldl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NcJ33082810
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQmMmpwIPQvIOq+S8oQSzNrPYjyqFaWUA0KmsRaonZM=; b=KYq8bO8HOSCsqDj/
	KO3KSDmlBODzOyWest/xhIPQbD33qxs9E7BPTrFJDtHbdXljJJNk4J2UeGRViv7U
	Hygq5NP7Qgz/iSGNFPQ7NcRjRXmdOyVVeidfJFUa1vxTe9PrqlFzWbtySX8v/z36
	92FoDt7aSJ+TfHKFWv6agZTcE5MSDmAfmNmzGJJtVJuurnp2BPf4UgwtkFqZXeiH
	ILi0aqPsrqSYklCDPJ4M+/1jSsknCG17sq2hOJYbUamwXe2V5P79PM6zDVCkLdun
	y104Lp2yzEbmO0VVG8tVJxJKDhsL08qeoDvEmuevYyUxeAuk6hRWL/6rhZh1PxJ7
	lsf7Gw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u9nrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0b35fa876so90706095ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154043; x=1781758843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQmMmpwIPQvIOq+S8oQSzNrPYjyqFaWUA0KmsRaonZM=;
        b=GB6tcldlvgNA3VZuFiu1mFSpvHe6eU3BEKQwITD+/ci6KB5auRWBFIYMSeP46zgFAK
         1VG59SDVo8h7af7w/1sW/3dQGFVk5f0L+T9v/A05eMrD6iZOEPvBYri2iVWtZ0Jf63XS
         Lo1QQgrFnNhLjCp9lhtTegiBkXPxAbyAJiqzUlqJGKV/+qVp+TIbhkw7EtOqWghSh0na
         ld3saF3yPLnBYVPYaxpeOjd+iC9PuwJE1ysQ46XLL4VoikiStwvyKso1g1DsyI0z0FP3
         4hldZmZQotdoYG2Wa6BMkSm94PYlHvh86RY79HY6eUucueQTt+PPzXNVC7G7km0jPjeA
         mlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154043; x=1781758843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xQmMmpwIPQvIOq+S8oQSzNrPYjyqFaWUA0KmsRaonZM=;
        b=gKhu8VY4z+VuiZp8URbY3zD/We6zs2RR7QCRfP/H3edIeUBZznuOTuQk9sBkblX2hK
         wyJzQXmYwkvQWwNr55LU34h/4SbzFGKvJwbXR5MUJ5+2bmQKbuBhzB9r3H8HqYGRrOUv
         SzzMD/KmjiUnX8Esi7p/CWeV6Yrgz6ICuG2fHEf83OKrvJfkxmNowk92vKxd/BGy4UIH
         MNf2LvP9sTaNbjiblZVnlMt2KNUn97Km2SCUgxaNdPqW/eIA5Qq4PZvx15yWwx2QkiH1
         eyeI58wFoWjvQDcq2FMhyX2u4ISus/Gf4limZhbaIbTXaCC/FfSXDi2dMIQ4xJZd5ppa
         zaUg==
X-Gm-Message-State: AOJu0YyKt6F8zaA7I0m7htoI3Xu0wCQe/QnVmfXD1PlQFWgCIjGcOJyD
	3xyA8IK9kdbh368GM8kn+P+5vj05UmAQbCyMmQpIW64lrNJ7B15S5YYdenYtpNus3ypiVsQ9i8C
	bz0SeHVCK12l9o7OvrbC4C91t3GYukgXfrdelXbuTaYN9F5G1I5X9YxSUrRgL3NdhIuj040P0zr
	E1
X-Gm-Gg: Acq92OE671tZnjeTMxQ8FOfaKUq5v3rIW4KnWQ24ig19RAlsz2898Dbb8UsomaYplU4
	X6eiSAeT6Lo/wexpoqSwd+q8JkvQzkXFgDU1YeEREeQ6PMjc4EdJigFZo41SIQ6QVfVX8eytBo9
	7CMOhNYKesgnniLLPFHDK39hEmbQ5WHt5KMI6GQp85xhxtqEy0+/AlCiGF4G/0sibyQaL1bNGXv
	ShreXtnJs73oIuA8xe+AS0S6hmwDq6VoTDV1lB00iD5jwgNt9lrNnW/qWlrhE2rUI6mk8JYJXLi
	TwVKPJiqsS6GXBDSoha58rSNXqvB5WbOMsKV8xLV46i2uYpS3/quYlfjM3XNnruKusaBbn6TIi9
	70CCXp03bx3VO/zE6HfZG4rgB6NyM9h1xhY0gIBLK9mGmdqpPrW40J6Ei8K1C4TTivkc=
X-Received: by 2002:a17:902:d4c7:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2c2f24a1843mr11523905ad.25.1781154042241;
        Wed, 10 Jun 2026 22:00:42 -0700 (PDT)
X-Received: by 2002:a17:902:d4c7:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2c2f24a1843mr11523415ad.25.1781154041664;
        Wed, 10 Jun 2026 22:00:41 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:41 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:03 +0530
Subject: [PATCH v2 27/37] arm64: dts: qcom: sc8280xp: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-27-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=11032;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mUskJ8SNq079LmNHg6tuDsqQTYd8lGSyihEzvrPy8dY=;
 b=fFDsuKVpLhciftRUNpJi7oTKzck93kHrkr0eGmuL6mVrCRPymMbG4OJ9xmSkxYHpj3OAp1HK5
 0/F4Y1Vwoj0DM5ySm7zQSifRr2oTk7gWDFDCke+BY7NQbFvIPx8P4+m
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXzdGghTDjmF4C
 M9cujoHB1he0Z6bBGe1nKNu+ZtStmpWgYBcRNSqswvdZvwEd6YyBC6x8JM2caGIOIBOToZF22lZ
 +g1DKLDj6ubne5Ro9gAVfvmpOGL5Pgs=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a40fc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xdgaKNo_m9sR3IVs-GIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX99yZtpT+Lvo+
 vJ6TF85cgY2w/zDfMKXodAVp/cYuBgTDeLHOV/rc+KN3ylUy+eUkB/6/3cwfcv0gWAYMfyahLT3
 pHITizpkMsPoWeQWJgiTzgqjYivX1RKjqlBbjrQ+oKvGNLtB/NmVM/vy/ihtMYduWpmJS5D9GL3
 0cFXfE4fpXf/zmEyS76uw2YDh2P7fSYsRDf6kNMurn1pXbChoOqiYZvpZdTV4XgaGlUOVzUxzTl
 S6tcZMFTnCE2SSG6cs+meq5K3MgyFMaCvjZ+J5TBOUu5fZuQwq7qavASzIJzrC2nFffRv0Mb253
 l1WzK4kTLVum6zEOIWq4F7zUbRD/JdnmZRdZrd8l9Xvp137yV79J7REnGk1eL0ljoN9rbktS/z/
 bhUkOWuzcFsNnMhdw2/+/Odw4sKin/rF5F3qOBe0W/CWpX6RdFitf5E/sdfReYeYS6ZPGwcbEeH
 JmD0qM/T+nBTXpyzDXg==
X-Proofpoint-GUID: adPUS64euaOypbUTUVUDz-RBGTeaofXr
X-Proofpoint-ORIG-GUID: adPUS64euaOypbUTUVUDz-RBGTeaofXr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112604-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78E6A66E6C3

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcie2a_port0, pcie2b_port0, pcie3a_port0, pcie3b_port0,
and pcie4_port0 nodes. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board files,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          | 24 +++++++++++++--------
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      | 14 ++++++------
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 22 +++++++++++--------
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 22 +++++++++++--------
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 14 ++++++------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 25 +++++++++-------------
 6 files changed, 67 insertions(+), 54 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index c53e00cae465..4c2700e9b00d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -628,9 +628,6 @@ keyboard@68 {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-names = "default";
@@ -639,6 +636,11 @@ &pcie2a {
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2a_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
@@ -647,9 +649,6 @@ &pcie2a_phy {
 };
 
 &pcie3a {
-	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wwan>;
 
 	pinctrl-names = "default";
@@ -658,6 +657,11 @@ &pcie3a {
 	status = "okay";
 };
 
+&pcie3a_port0 {
+	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3a_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
@@ -668,9 +672,6 @@ &pcie3a_phy {
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-names = "default";
@@ -679,6 +680,11 @@ &pcie4 {
 	status = "okay";
 };
 
+&pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+};
+
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 9819454abe13..1aba18ae301d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -739,9 +739,6 @@ &mdss0_dp1_out {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie2a_default>;
@@ -750,6 +747,11 @@ &pcie2a {
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2a_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
@@ -760,9 +762,6 @@ &pcie2a_phy {
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-0 = <&pcie4_default>;
@@ -772,6 +771,9 @@ &pcie4 {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..603184a7c06c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -933,9 +933,6 @@ keyboard@68 {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-names = "default";
@@ -944,6 +941,11 @@ &pcie2a {
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2a_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
@@ -952,9 +954,6 @@ &pcie2a_phy {
 };
 
 &pcie3a {
-	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wwan>;
 
 	pinctrl-names = "default";
@@ -963,6 +962,11 @@ &pcie3a {
 	status = "okay";
 };
 
+&pcie3a_port0 {
+	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3a_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
@@ -973,9 +977,6 @@ &pcie3a_phy {
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-names = "default";
@@ -985,6 +986,9 @@ &pcie4 {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index f2b4470d4407..4dd287e6fb95 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -486,9 +486,6 @@ &mdss0_dp1_out {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie2a_default>;
@@ -497,6 +494,11 @@ &pcie2a {
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2a_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
@@ -505,9 +507,6 @@ &pcie2a_phy {
 };
 
 &pcie3a {
-	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wwan>;
 
 	pinctrl-0 = <&pcie3a_default>;
@@ -516,6 +515,11 @@ &pcie3a {
 	status = "okay";
 };
 
+&pcie3a_port0 {
+	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3a_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
@@ -526,9 +530,6 @@ &pcie3a_phy {
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-0 = <&pcie4_default>;
@@ -538,6 +539,9 @@ &pcie4 {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index 00bbeeef6f14..21438e638da6 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -624,9 +624,6 @@ &mdss0_dp2_phy {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie2a_default>;
@@ -635,6 +632,11 @@ &pcie2a {
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2a_phy {
 	vdda-phy-supply = <&vreg_l4d>;
 	vdda-pll-supply = <&vreg_l6d>;
@@ -645,9 +647,6 @@ &pcie2a_phy {
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-0 = <&pcie4_default>;
@@ -657,6 +656,9 @@ &pcie4 {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..c59d7b499008 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2220,9 +2220,6 @@ pcie4: pcie@1c00000 {
 			power-domains = <&gcc PCIE_4_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie4_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie4_port0: pcie@0 {
@@ -2233,6 +2230,8 @@ pcie4_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie4_phy>;
 			};
 		};
 
@@ -2331,9 +2330,6 @@ pcie3b: pcie@1c08000 {
 			power-domains = <&gcc PCIE_3B_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie3b_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie3b_port0: pcie@0 {
@@ -2344,6 +2340,8 @@ pcie3b_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie3b_phy>;
 			};
 		};
 
@@ -2442,9 +2440,6 @@ pcie3a: pcie@1c10000 {
 			power-domains = <&gcc PCIE_3A_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie3a_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie3a_port0: pcie@0 {
@@ -2455,6 +2450,8 @@ pcie3a_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie3a_phy>;
 			};
 		};
 
@@ -2556,9 +2553,6 @@ pcie2b: pcie@1c18000 {
 			power-domains = <&gcc PCIE_2B_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie2b_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie2b_port0: pcie@0 {
@@ -2569,6 +2563,8 @@ pcie2b_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie2b_phy>;
 			};
 		};
 
@@ -2667,9 +2663,6 @@ pcie2a: pcie@1c20000 {
 			power-domains = <&gcc PCIE_2A_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie2a_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie2a_port0: pcie@0 {
@@ -2680,6 +2673,8 @@ pcie2a_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie2a_phy>;
 			};
 		};
 

-- 
2.34.1


