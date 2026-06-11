Return-Path: <linux-arm-msm+bounces-112602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZDauCFtGKmo9lgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:23:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4AE66E842
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:23:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SZEcpuad;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MsDbWNo6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112602-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112602-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6830732AB7EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56ED036728F;
	Thu, 11 Jun 2026 05:00:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432A638C423
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154051; cv=none; b=SUAPi6tmlSJ4fRowI3QWNUtfCs4Y+iZgEGWm2RMfx5hU1/zpkW96zka+dFIu8n8klb85xLXsZ2YDQPsEureenHCLMYns8DYj5fvc/SjbX01Q2u/HCrPVG7C3VrZjwnsKRivmR8dD0UUcVWLNCIY1f2flbymy8LAXZb0yZketlJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154051; c=relaxed/simple;
	bh=qyiSXr9m3e+ricjWc4HaLqw5V+1A1GHs9xGgqQrmD3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgMiv6wtqrfSqRZtR9/RWnjAqOFt6sBzb7E3Y1u77k0DaY+bzFoKXodBxX//6qqyPQZp33n6lohlEzZTzKNcAUxQiwzaOVw49fgu7mcq6KZu+CK/iuM/Dp+UR0Dei0DAzd4dV596w45M9+9XtlQbeDZlPUhx32QIXekP3zazyN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZEcpuad; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MsDbWNo6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NT863159483
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WK2uACQoFktTjYhZJ1pH9Ou6MkkiqsQrpjUWQVaNGMc=; b=SZEcpuadVFgTrMLq
	QP5THvhBSqz0+G3c2e0wBp4ZZfRXHbPmD74Yyys18JPIM+DxUaYaeH4n00k4vEfA
	fDYuNPPOKrydEb5lnMsVWAYxfyRgpULu7exJ5c4hRg73xplESVqfPE6fW0R7bPnu
	WFdXoX3Bg7v2poPP5SrHNXa47Wlrr0UfYvDKHCUKyG6Xrz1+Nt6AcMj9kWHUZuXf
	QEXyPAUPfLYi77cY5+0tOwogjxFYFHHXLgpKupPqkZ/QbyUan+vxUYYZ+ZVKQq64
	L/Sr2N+q8pvtg5FU6EfCvwNVtPyAwlnhE4oDSqCxx1aemuJXzBe8kjCsz5B/Kw6o
	q4L23w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701p8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0d0516ad7so75702235ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154039; x=1781758839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WK2uACQoFktTjYhZJ1pH9Ou6MkkiqsQrpjUWQVaNGMc=;
        b=MsDbWNo6VbMR+Ra7MkW1XUumBcMZujTm9dD7V2+SmbFDcmitFBsJH0YWMvl33o6U+r
         cSbubP4OPvDDV1AS1IGGmyrpVyPYWUauQK+dsBSFpkgGghSxRcyPYNvA/4gB2LJJeRRz
         5bR1Eog1VHkGwDclmpvKoNfcU/zzlyEAb5sR2mi3du7M4g9gT8Tzpk1eUUsN+pvzNtaH
         3s476qdQYNEgiXPc+g8P/Ye2xmyyjPgphwq/a0ZvYZ1MPQfTqi9PEHObNY19HR9m44GR
         OhYnOWJt2QQcPCVqqLLj0tKdLoAqvN3DY/E+Jn7X6eyOxrt+uKEzwgnijOhtSFI0Jhht
         Lecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154039; x=1781758839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WK2uACQoFktTjYhZJ1pH9Ou6MkkiqsQrpjUWQVaNGMc=;
        b=flZSYUzCgAE1Norko+wLSf4eoCSTPt8fHWz0X6w1Ks1z1IuMqTOdC5GEEGPjypHqA3
         TBvwbDI/G90OFev/wt+fntGjN6ANJ8iLyiP4ESoyOKgv52y4+bllHZe2WuFOpGb0qBDU
         b+OKa+B2oxmcu4wisQexLJM5m5twW9jR17tv7hi3T4+5taBNng0RMPiTrm++u3MGcRwK
         1m2GuXrNx0qvdPfJbD80Fgt95e71P+ZPAFx775kDDhf6qWZzXZK3gvvInVWL8n6CVWwn
         eL00Y40NywjU1dQ2js8FIMlYnL1PflxTRDcZ9dT3a/KrBoDNPHyTshafZpzM9kqg5f7x
         ssOA==
X-Gm-Message-State: AOJu0Yz7Bu/Ok+EIi46IONQd8wGsM5giIEg29wWCgYGBoRf4j3k+kTjE
	pwAqiyANCZkGQea2y29mUP6rcXxS32RyUN4MVkRev9YErz+Z3ZoErjxGH2BUZmi4fXTSr/UDeP3
	Q3rkU/kFoHsFzXO23J+q90WcnzWPLzUOLpjKu0N4OvGMBvtGJTBoCBU0nQbVtFhB4BQzjfeo18O
	qt
X-Gm-Gg: Acq92OEtZeBZKnme7dFiVUuzYt03mlvL6UbsIvub8EcHPFaBg46xEkNsi1Ip3WzLoN5
	5nwpoGHM5/Uh5vSonaFQ5SF7vbMKDjMpVDjAiRnBjsN3tnswP078vjuHoNiqKcFxkFd10QtAGdY
	g6jSFIwwc3nUVdvpuWmCVsWYkMQyC0X/MuMKbXKLDj1K3tzNJeBg9GlU9Gi0zgiz9BxSxoY2dA4
	B8fYgTuJzqiQheoWdVEOxs2kCcaPOBqLywdQzpHIur88pJU3WVgIi5hQLlZtBzz4oExmg53tJ/s
	Na2jsDi3pTBB/csAki5b5QY2Ir8B85fMrrZpEIN6I3B4qTN2hQF38qSD9ctCje4AqHe4r5wgPPo
	Vo4zS9r7MTDDPnMBxUchm/i/d+cOcZW9P2958UP7KCkX5sV71WOKEpgr75L0zKoaFDJo=
X-Received: by 2002:a17:903:2408:b0:2ba:7881:948d with SMTP id d9443c01a7336-2c2f18e2accmr13881615ad.1.1781154038346;
        Wed, 10 Jun 2026 22:00:38 -0700 (PDT)
X-Received: by 2002:a17:903:2408:b0:2ba:7881:948d with SMTP id d9443c01a7336-2c2f18e2accmr13880945ad.1.1781154037786;
        Wed, 10 Jun 2026 22:00:37 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:37 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:02 +0530
Subject: [PATCH v2 26/37] arm64: dts: qcom: sc8180x: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-26-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=4757;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qyiSXr9m3e+ricjWc4HaLqw5V+1A1GHs9xGgqQrmD3o=;
 b=6gvATxmPbnsFsLmbQBWRpgGVdMC9KOD0DdSY7CyPD52csRzz1Oe7UZrhfbajXfg7wmSBy6UXP
 Y/jYgUsyUJjCqlxoL5tUsTMgJAqedXNY7uIu8z9GXx9x0eP0noo/bGi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXxiUzAKI+aYbu
 C3+Nw3J/OIVIsy2aXjt2kDYYbVLwlQREh4ONOfnbdjRnY4L52qh455o1hICTDcpa+ApgQP/mpyd
 8MKTB0FXiE1msuepq0V1aNEOXDFFReyWK+6wS0ICTQ9YvZ0FXROOgkQRt/Edr1baW+/3kL29nEs
 ZCv3Hc74LgLo9DhVD6Q6JfYcj45Lxf+Tq5ilEDF9rb7qjWimxQ4Lwogowasn5Lpjfayh7Gqx6GC
 hgtxZOkW5aRnpJgLBFNYRtigQoHDqanqoqKTfl4o/o0tS1oIrx8LLi+2Tw9k3C5JDcaWdSC9SLf
 mQhj5GBrl/MYcKfOfnFhla2jACSqhAy1VEsJ5bQ5TFtpzFohcx7J/sRHbPkMYha+oOh/18FpAkl
 6j7cmE3L1gojP8nFUERDb8DNv7wdvRvzxqzXvdUWCePmyV2fh6kzsShPyYvMk9H9tsQyLhVJJF7
 p47cTd61TV+vCxUfTgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX3ZyxriTwHYON
 bpz5/ZLAc+PMWCv7zbJdvzfkwYXC4mSOnji2hfnhGKXE4fQs4BMIe6likMq8ED0WRp3x0RRN7we
 ZNmY51xhv2DDH/5JIhVVEANNnuavuaQ=
X-Proofpoint-GUID: xMWPT9LfJF9FGTlq1pujzWrx6ZoD5-ca
X-Proofpoint-ORIG-GUID: xMWPT9LfJF9FGTlq1pujzWrx6ZoD5-ca
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a40f7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Pn-WcxdREE-ERze4qssA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
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
	TAGGED_FROM(0.00)[bounces-112602-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D4AE66E842

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding
labels to these nodes to allow board-level overrides. Move
perst-gpios/wake-gpios from the controller overrides to the
respective port nodes in the board files, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  7 +++++--
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  7 +++++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 24 +++++++++++-----------
 3 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 44bf3db01d3a..c2d9dcf8ed64 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -457,14 +457,17 @@ &mdss_edp_out {
 };
 
 &pcie3 {
-	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie3_port0 {
+	reset-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3_phy {
 	vdda-phy-supply = <&vreg_l5e_0p88>;
 	vdda-pll-supply = <&vreg_l3c_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index a4644ecca536..1b50baf0271b 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -558,14 +558,17 @@ &mdss_edp_out {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l5e_0p88>;
 	vdda-pll-supply = <&vreg_l3c_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index f45deb188c6c..b6966ec7790f 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1779,13 +1779,11 @@ pcie0: pcie@1c00000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1793,6 +1791,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -1898,13 +1898,11 @@ pcie3: pcie@1c08000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_3 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie3_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie3_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1912,6 +1910,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie3_phy>;
 			};
 		};
 
@@ -2018,13 +2018,11 @@ pcie1: pcie@1c10000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_1 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2032,6 +2030,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
 			};
 		};
 
@@ -2138,13 +2138,11 @@ pcie2: pcie@1c18000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_2 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie2_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2152,6 +2150,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie2_phy>;
 			};
 		};
 

-- 
2.34.1


