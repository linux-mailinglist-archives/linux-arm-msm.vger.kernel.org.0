Return-Path: <linux-arm-msm+bounces-106674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED1gIDHN/Wk9jQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:46:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F974F5EF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B499030BA58C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929463DA5DC;
	Fri,  8 May 2026 11:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfXUIhTl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hx3n0CRZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B29388E46
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240516; cv=none; b=Zxv3i9XlFAz3QWaQTp63Nk4L83CqCE2XCW50dUevxzO3P1yXDbvCPnCYxN6hzE18OmUGMlOeV4WXEZZ06rHZLerjtWixYEeXgxW7BomC3Q+R8V2gZAGME54Si4Z7wjTkNasfV9kIIpW/cU5gjteXA/H/JHQpUdJKHn3+PpUSUUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240516; c=relaxed/simple;
	bh=C+fdaZxLrumZmrqKOPIPxKcscjjl4PkjK9Fk9tnFUzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVme4r0MmvrJiHbEzzmWJhS/f7+Jy7u6uH7HiL07ftUqJDFCTqn5x17SuttQ499T6PvtIWHTqo5Xqe5Mg5dKsTsZsLmQe/rmghdUGvWIRbmnss3YaxbpI9NU3K8DBZ16ZT513tGDHnZiJoJ4ryVeU0y3az3g9JdxuaXpEPhmgQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfXUIhTl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx3n0CRZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64863cH91173965
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tX6JkDWmit7Ac/IJ9FKAS/zdI+alWCBDeK1QiGdkxGY=; b=DfXUIhTlvOjxe8Y+
	5kJ8S1H4F38EI19gMMZTsfOEYWOHxuMGyzCK4u7S4lVytDG4K7UFzjs2sToNZTAH
	4tzc9XCP7g3uv19LpgL8NH7CYihGJaWeeALzVHkTZbR2f25wGnCW38PLgKX5Hh6o
	tDhkqZjEjZOjqR9gmBcmfI53WSf4WdquyJreFxk+KfILQZJIyztluPkuWcZQ1Qin
	v1hbnTAT/nZIBD4Zzkjf6ol/9ObMxRJ+uwTu7dIq5HB2XBw7zDtPneeNIOeHiUF2
	So8T/hnfKBLrztGdl7jI/lWiGyhAjhgYMgt8AOE3vqdDvNIM0FluhinPPdzFK+gn
	p46ZkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132haq20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:41:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8dd61e9d1faso135594785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240510; x=1778845310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tX6JkDWmit7Ac/IJ9FKAS/zdI+alWCBDeK1QiGdkxGY=;
        b=hx3n0CRZ8M8GhUVZKfZ/vS0g4/LhtGNi/oSfBvHbpHiXRW3MF9vbD1CSoBWgSwNym8
         XkuW1S+9V7DHm0tDIMq2n1RHP+9VBpJY+9HgZVy3qM3FuakoSN3P7vmQgyLJDaZhSjPJ
         ymGxzPpy0SYzQKmAdEZlxYE1uJPD0XKACEj8Urc89tkRF9BqJE8ChpaKtbsul5U47PPF
         KmkgLz7607O+cFn/Hp80pIqa5xkKenEBiTDYkpIq40xn5tEgeMZ0cgXhmiNd/PwDITV6
         Wjvos7jOHpooBkB8aXJ0/NO8yci7BICXP3ggKyPdkxx+J/d/ivxZEXwDqFxFuKwVgYyY
         1IvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240510; x=1778845310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tX6JkDWmit7Ac/IJ9FKAS/zdI+alWCBDeK1QiGdkxGY=;
        b=XKyJcYb7pSP7ZJJMzDOxrkgNXkVCldt4+hP9KYPgg2fWlDQ60IVVjyzduQUk0mFP4B
         /zpnxXturyEpebp7t7WMxpOT4Fz5ex1qKRGlWzfHdns4MfRt2J7sF1zlLpS9AcZPVVoe
         XaIXU0Obwt54SroUS7Fju21PBBguGp8UfjKNxIAUoHmsf87CVV+PEfXs8R7tJjb8oqxk
         URqAQg+yXgHAvZhuq4KUxWcjc+G4QHfCOIlzlHha67bgzegHo/+0+IJuEyY/zVtY71X6
         GfO2vzwGwMENg+nRnL5ASQS09IdPfD/FeF7ps/2A6p7lRVyqji1qN8CQID92fAvFiEz7
         p8Mw==
X-Gm-Message-State: AOJu0Ywo0pdTpjYsnkYNeLhy8Ir/6CNK3MV2DwTyfqXLQH68bk/BQPrN
	uSOvFPwkFXI3PXz33hvUgC9sLA+TtgnGhkkkgT2nAo41RpOGxw4lTwvuYyhqRd5hkvYnlc3X4s4
	iv3uxrLe/XHoumqH0zUPx84Szrb71nBLlszh7pcylcJPpe/IiRy4INu+zXGsmY71dtdgf
X-Gm-Gg: AeBDietv/euZ1Gc1aOPuHh0B+gXx3mnyxb5MnD7Yw2hzAsFEFdZyUUP8PbBTA7rfC+T
	tKipOSxPgxKFFAzbWBe9CIudTzalwbpGHzZjrbukB8NqdnZFPJxM83Vbx0kFK3CYc6gJvxtPduh
	Xm3xmalz07KNIrSTZHhjHgZJtAax4MSghTre4MEbQ8Dm1A+7ulhGr/oxxs+PY6H8d/GyYgNNQhp
	8BZNrQEX9KxCQPQAbjApAMTwTPfq0hwOFO/D7PswBu7XPeCl6ded62Accx35RvubKZOFdjCSJWQ
	dfo/2Q5cML5GnocUA1E+6lJpYW99hssNudEr673Bk3LHYNZg4eT+NLg4seJp2J2EXzy/vy6AFrB
	7eYwGyec1HrUB0ytCuuzoPNwAjO7P0k7oOXIeXNO8VRQ3UAStsmhXBQTnn5QyYtgGowK62DpJKB
	QpITvCZr4CNXEc
X-Received: by 2002:a05:620a:1a0f:b0:8ee:e011:a77a with SMTP id af79cd13be357-904d43924eemr1787930185a.13.1778240510204;
        Fri, 08 May 2026 04:41:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0f:b0:8ee:e011:a77a with SMTP id af79cd13be357-904d43924eemr1787923085a.13.1778240509717;
        Fri, 08 May 2026 04:41:49 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:49 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:03 +0800
Subject: [PATCH v2 7/7] arm64: dts: qcom: hamoa-iot-evk-camera-imx577: Add
 DT overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-7-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=3823;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=C+fdaZxLrumZmrqKOPIPxKcscjjl4PkjK9Fk9tnFUzI=;
 b=9XYbJL6WMlwsC7APPQEr/KM3rpDbA1ZBSBoisHSl12i+aDVSSutd/eLI4oZcb23vOxSu2GI5R
 nQvVmkw1noWAs+1OJ3bfyT6apViMjUM9kvQLXtDao8r4x6pUxoqAUuP
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX6ksq3NTDYZCA
 I7hzYLZ9uMPfYnaT6ABzI2OEt5btkfybUBNLESFolSHXkzocJI8TeQJAS2mP8SeRkbbzUN3vci+
 83+4BXV7abpVroNBvaZm+YYT8w/vO0S1qflupmhZrQhVY0BVO16fZ+T+9zSQlgb5aDVdk0N3GPY
 jxJHMHCtltoXihvhGT9s1B52Ff5UZUZ1XrzPl7jul2QUPtcqgzmIdq6xDtQLapzYvh40C6mMuKJ
 yHYEz0AxwutofT+nSFP8brfIzqi6jywmaiWJ1fsqxlZAIhCyomxz8FmUianh9sUKJlkSSg3010J
 x6xifLz9vHjR9XMJ3Ec8dDaYjkmlEbE4QV3sUBfmGIZjInPZGRpG/sHijnnIPTvl+bIKSkMde0W
 CVOZHj0uKCfGyrq37r+pp+fxoVxLL77I/VNqqr18T/3hDMlD9yQdAo+WnsHHGvU5lVeNwYDYLR/
 LyB7D5/fkDqIZEJulPQ==
X-Proofpoint-ORIG-GUID: BEEMz4bVDeYdICJJKVjAKTTQzA6rrHX2
X-Proofpoint-GUID: BEEMz4bVDeYdICJJKVjAKTTQzA6rrHX2
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fdcc01 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=uiy82_YRydbR65prXQIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080121
X-Rspamd-Queue-Id: D9F974F5EF8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,1a:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106674-lists,linux-arm-msm=lfdr.de];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[22];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.178];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable IMX577 via CCI on Hamoa EVK Core Kit.

The Hamoa EVK board does not include a camera sensor
by default, this DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso | 74 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  7 ++
 3 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e73064194926096b98b9556a3207e8f24d72..48536765058a4244a2b895bccc21567d186605bd 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -22,6 +22,11 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-camera-imx577.dtbo
+
+hamoa-iot-evk-camera-imx577-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-camera-imx577.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..4a20656f16799d7a9c8fd4ad63ac0989cdc37de4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	vreg_cam1_1p8: regulator-cam1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1";
+		startup-delay-us = <1000>;
+		enable-active-high;
+		gpio = <&tlmm 19 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&camss {
+	vdd-csiphy-0p8-supply = <&vreg_l2c_0p8>;
+	vdd-csiphy-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep>;
+			};
+		};
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 110 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dvdd-supply = <&vreg_cam1_1p8>;
+		dovdd-supply = <&vreg_l4m_1p8>;
+
+		port {
+			imx577_ep: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f694c22ab2670d26753ee096ab3682..8cfcf48ee0099d4b505acc3e5662553e77704d5c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1320,6 +1320,13 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	cam1_reset_default: cam1-reset-defult-state {
+		pins = "gpio110";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1


