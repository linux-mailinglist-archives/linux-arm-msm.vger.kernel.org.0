Return-Path: <linux-arm-msm+bounces-108564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Oa4KwmODGpCjAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:21:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2933758230C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB3BD312D637
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CEB403EB0;
	Tue, 19 May 2026 16:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWhbOqPE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNWVOZ6T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661962EA172
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207014; cv=none; b=NT40GsMzxXTC2JtRYKFl1p0zU5lbjyPSA6Sj+vISdbxmsV0zRYzJZktkZhP7r2KLsm+p52R0cjSj8cRd4yy0/dFvTbmQUhtvLRpEZxR8nVo6ALcPkan3x0DhWn/iE8XRGMceRZlh13Qq08555//7auBbZMgc6/lyWR5NqTS7AT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207014; c=relaxed/simple;
	bh=mo50hh8ekk/GA1+rTnq+jDE0KQ5C7S41KkzmaSVIl7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ffV4WqfG1Tvb2rE/JWdSzLZQEjFUUqugd/RUh2/rtGx9hVYxH+n8Q6Ghpe77K/EqicmsnXxNR0o9jWLb/YSfJrv2vMaVg0rTVx7cS3+w7uDQYTKpU0pVm9jpmywtXrOEH+EAJTKjocdkLtNhN/DdBlGohQb9reGKU8JqU59iRa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWhbOqPE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNWVOZ6T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwaDR629692
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 16:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDM3DdEGG7gNhxF/+RbK4P3w53TaO9p1EEjbgSdQ/m8=; b=aWhbOqPE8biRiRNR
	I+j2+cc1/i6/z1tFQX0Uj4wRfHvjEu2Ir+F3Xz6erl8YEzXhcPh58qHVlh7VHsqI
	Fr/A1KPjQ3k+wEDBe0tr7jEY0dynjvKAwUc5YCrGqiWqMb9dSs/1y9K0nGp3wd1J
	XlQbpqp4EE3f3Yz7kIV9ETWzHj3oC1nXb4cgYxXhU8L93JI8HcZaQ/+LgzX82oJM
	cgYSkJ7Q7e1mGg2Cb6ADeWTmMdsW5c7QGIoCG6vgj50CSsBUMTozj6xZlqMSsdr6
	qgxrJBTFMzgPUbKhzR1MliV0OMVV5vT9YDQjeIex8VDI9IzwU8BsYw0+5kLdivga
	tCYM6g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nrauy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 16:10:11 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95fe0348b34so1321430241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 09:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779207010; x=1779811810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDM3DdEGG7gNhxF/+RbK4P3w53TaO9p1EEjbgSdQ/m8=;
        b=kNWVOZ6TRrLU5CyuWPuJH428sOenXYfcDAJqmp+IURsIURdjea6lzd213Dv5346E5o
         uhUPjbXSLT4YAzXMzLkHy4Y9HFIJnZ4x62S3Gc/cflcdTQPrnREX4e5CsMTAmh6/im1q
         oMRCmIZF4DYO0v0keDli2KghwpWuo2c0VcvV+p6WoliVUx9DQCp2xmOxU92YtTa9UWF6
         BkzrCsYCDiB+U7yOa4EmBfLWwnznuZtBj6LYQW6wfJPaNBK9KeqM70al0KpTUKASN6/H
         TPlyeBCaWNHtZkbDghMb9g5zg2V/NYY9eyO7qKeQJbcx6vMIBY92jp4nrUjgp8gWLZjb
         cZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779207010; x=1779811810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XDM3DdEGG7gNhxF/+RbK4P3w53TaO9p1EEjbgSdQ/m8=;
        b=LfOl2oO/FxnVh09mohlchbB8jqzgaLmQyp3LUnZApThX/uh964CLrEVXgedLw2Ff12
         q0wYue8wRq2+fid7jwmPmRO4ks5jDbBz0hO9mTDqNmdM+PBb/BfuKrZRBBcIGG7h/DaO
         EYlgC4c8trxJGqVVr2rA23XsVwqucJ58BMZGoGCmQjdFv3MAHb1+fg8au/Lnk7F8Q7Ud
         C+D35WuGA8skTgOdo+OC1/NyTgSzqcw8DDiXfR8oHvRcjkdhg++zwXhii5Hz5HRf7CLT
         3YDMGaMb98gnFXbrFg1E+ysnUriFwMNCJp9hfiEcXYLpU+jxdJMo86SNg+zyj4+1wzP8
         S5qA==
X-Gm-Message-State: AOJu0Ywc1ThYrbPivfPLAfFa+n6x2W7X3y5/vJ7QUW1s5/r5vrdejdzl
	5Nezwmndx3YlaIWhUf+3aR8A62FvrYkK8RKe5f95aHaM3IS5QhMiB21xSrIPidY0RrdUxebGmW5
	CdInlY8lSAA1fF7/PAF0+XkXLq/b27OdniLPA2ExaNB84g1BzHJ4pXzPF7lQI0W1TBrvV
X-Gm-Gg: Acq92OHt4VO9mmvHh3Akb/szzAV6zO97XoXlEx1LN6BT5MVdhFKBTURhl+0Z2A4PAbQ
	SeTfDn4HXAQ6WUrKaXobtBp3kVF01XF7+iMQcuJZ3+Yc4WpURkqA+NkNZsC8eaFqE9GAZRiSSnD
	f41bq08aKge8E17JjlR1v3ifXNvd3olkXePrhMqpc+zuCtdYKvCPBzwOTpbgdXwfuB8gK+EmXSB
	7om7FxqgR3mlbuIJlVLL4YE48KyEao8YfFVG+1267e9q72LwYHuR9yiCo1uFO/krgzge5vMshlr
	3hD6Pc2aw0js36cqD+u/PfWV9xBFGDHa0/dVN6B0Tr6qOjp5a4ucO53cnNtRdYYxuR8yIPY3fxq
	yqvrT7W6Ei9K30gby2pCfBTJ3qVqs
X-Received: by 2002:a05:6122:3a0a:b0:56d:3b69:87d2 with SMTP id 71dfb90a1353d-5760c044d95mr11527541e0c.11.1779207009804;
        Tue, 19 May 2026 09:10:09 -0700 (PDT)
X-Received: by 2002:a05:6122:3a0a:b0:56d:3b69:87d2 with SMTP id 71dfb90a1353d-5760c044d95mr11527468e0c.11.1779207009098;
        Tue, 19 May 2026 09:10:09 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab7c5sm357874915e9.12.2026.05.19.09.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:10:08 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 19 May 2026 19:09:53 +0300
Subject: [PATCH v2 2/3] arm64: dts: qcom: Add Eliza CQS SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-eliza-dts-qcs-evk-v2-2-ad7303659d24@oss.qualcomm.com>
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=11344;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mo50hh8ekk/GA1+rTnq+jDE0KQ5C7S41KkzmaSVIl7Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqDItZJxdM5WE6tbCsiYLDLgfDSDkbuBFmnhnpT
 GTiW29uVSGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagyLWQAKCRAbX0TJAJUV
 VrziD/0W2lT4NGpdwroDUu5gvJ1NU9+V5tVRO0U6kuILim+maMCvFmg+XrbvyfoLVI3T3D5dYX5
 7ZigKck80Zf3TjnivwYUJTfH/XjTjjyp1XGpUGoL6AYMJH96S8MMk9TfIuHbh1eCHb3w6sQ2Ot0
 KAuglhKR4rZZgrrcXwfulPxU4so9q268EJbic8J3wdbKB+Wzl++0SMh9sBCxrlyWxmL7hH8VOfI
 qxo68zzcsIrXt2sTjz8y3FB/3AxIo9ikeB+nPVENGpwQVB0UDIgIJSZoUYsxR9cgH5871bzXMPe
 k15/o8DFGauAEli4cxL3sCe3dJRzsA/Y/U5X+01pY7BZTrh71kVjYbIzaiEPrfdU+pnjFQ7pNXS
 MEmdonD15dLVFc+YNgsv3QUJlX9PcBokLrAXlaRO6kkJU+rEigMY6vJCHK/7KkHjOUhUr8CFQZB
 rwr7/dwbGjz2MFRmIhwKPm1phAxryuZOSYKozbr2ki/ho/f/hz1AQcoD7TUV5Zk2OOCaCEDrltq
 pnomNsw0FF7zCGkBrrHn4G/xWAhX99KBucNfjT9MwROz3h1dIK7IGEpUJnB5YykfU2s814oy5xM
 uJNfQq+DmRrI3NBuYmfhAlqfVnd3TsuD7kB0TtgunVWX350hi2qndCkoAbBUIW+JDPeIhf+StDA
 GDPREfM5YAuf/XA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE2MCBTYWx0ZWRfX6wBqknA+9cYi
 lzNpF6qwfoJazBXMdgObqkvVlL1EvQOBkfsF1M12zWRlDnVj/CLAuPdIB6NsfKHNDiaX7B3C/ov
 M/zzwYNbFPkmjmy35D8OeIPLWNEc1r4ajpWMU+UBdRmWY8g5AZeehVijmxmxvnCM4dD8+Eb5ZTa
 FEabuUVIuNAXVNeGEmxGZ0RImEjWQk1iZZVDdYyAVu+H7m3tEyx9LIeAzXGUMBknd8hT4fmWhIz
 Fg2lyGbnKGxQshRUswxyCdvQ9RXVzftnSp42+UQnffStufHSga2ZDDZcYL5hpmNqzbbFpWas60B
 PPvK/6pgTu12hiPNkzAm8Bkv84UaVH7jZvrWLWPvT1aRB1bafbbrtM7r/1Ssk/mu2cyLqm0fTtm
 /7kuFcPMRORFsH8uRsQCxcLUw2RYo9plAdDplfwhPs2+hXmWm+eBbwN7I9GOAuDMqw/QTXw8ewF
 vizZGHOy+I9QDb9xg/A==
X-Proofpoint-GUID: DTj6shuSioTxSPW1aJcjXC9PQvLFap7E
X-Proofpoint-ORIG-GUID: DTj6shuSioTxSPW1aJcjXC9PQvLFap7E
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0c8b63 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zEVepFEk_aNjd-2SQIwA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190160
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108564-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2933758230C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Eliza CQS (CQ7790S) System-on-Module is designed to be connected to
an Eliza EVK base board. The SoM provides the SoC, PMICs, LPDDR and eMMC,
while the EVK base board provides connectors for a multitude of
peripherals.

Add the Eliza CQS SoM DTSI so it can be included by the EVK board DTS.
Describe the regulators and board clocks, enable eMMC support through
SDHC1, specify the ADSP firmware and enable the ADSP remoteproc.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 388 ++++++++++++++++++++++++++++
 1 file changed, 388 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
new file mode 100644
index 000000000000..5e0f9c1698f8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "eliza.dtsi"
+#include "pm7550ba-eliza.dtsi"
+
+/ {
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7550-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3b>;
+		vdd-l2-l3-supply = <&vreg_s3b>;
+		vdd-l4-l5-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s2b>;
+		vdd-l7-supply = <&vreg_s1b>;
+		vdd-l8-supply = <&vreg_s1b>;
+		vdd-l9-l10-supply = <&vreg_s1b>;
+		vdd-l11-supply = <&vreg_s1b>;
+		vdd-l12-l14-supply = <&vreg_bob>;
+		vdd-l13-l16-supply = <&vreg_bob>;
+		vdd-l15-l17-l18-l19-l20-l21-l22-l23-supply = <&vreg_bob>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "b";
+
+		vreg_s1b: smps1 {
+			regulator-name = "vreg_s1b";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2b: smps2 {
+			regulator-name = "vreg_s2b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3b: smps3 {
+			regulator-name = "vreg_s3b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4b: smps4 {
+			regulator-name = "vreg_s4b";
+			regulator-min-microvolt = <2156000>;
+			regulator-max-microvolt = <2400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b: ldo2 {
+			regulator-name = "vreg_l2b";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b: ldo3 {
+			regulator-name = "vreg_l3b";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b: ldo4 {
+			regulator-name = "vreg_l4b";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b: ldo6 {
+			regulator-name = "vreg_l6b";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b: ldo7 {
+			regulator-name = "vreg_l7b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b: ldo8 {
+			regulator-name = "vreg_l8b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b: ldo9 {
+			regulator-name = "vreg_l9b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b: ldo10 {
+			regulator-name = "vreg_l10b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b: ldo11 {
+			regulator-name = "vreg_l11b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b: ldo12 {
+			regulator-name = "vreg_l12b";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b: ldo13 {
+			regulator-name = "vreg_l13b";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b: ldo14 {
+			regulator-name = "vreg_l14b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b: ldo15 {
+			regulator-name = "vreg_l15b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b: ldo16 {
+			regulator-name = "vreg_l16b";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b: ldo17 {
+			regulator-name = "vreg_l17b";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b: ldo18 {
+			regulator-name = "vreg_l18b";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19b: ldo19 {
+			regulator-name = "vreg_l19b";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20b: ldo20 {
+			regulator-name = "vreg_l20b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21b: ldo21 {
+			regulator-name = "vreg_l21b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l22b: ldo22 {
+			regulator-name = "vreg_l22b";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l23b: ldo23 {
+			regulator-name = "vreg_l23b";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s1b>;
+
+		qcom,pmic-id = "d";
+
+		vreg_l1d: ldo1 {
+			regulator-name = "vreg_l1d";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s2b>;
+		vdd-l3-supply = <&vreg_s2b>;
+
+		qcom,pmic-id = "g";
+
+		vreg_l1g: ldo1 {
+			regulator-name = "vreg_l1g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g: ldo3 {
+			regulator-name = "vreg_l3g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmr735d-rpmh-regulators";
+
+		vdd-l1-l2-l5-supply = <&vreg_s3b>;
+		vdd-l3-l4-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s1b>;
+		vdd-l7-supply = <&vreg_s3b>;
+
+		qcom,pmic-id = "k";
+
+		vreg_l1k: ldo1 {
+			regulator-name = "vreg_l1k";
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k: ldo2 {
+			regulator-name = "vreg_l2k";
+			regulator-min-microvolt = <920000>;
+			regulator-max-microvolt = <969000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k: ldo3 {
+			regulator-name = "vreg_l3k";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4k: ldo4 {
+			regulator-name = "vreg_l4k";
+			regulator-min-microvolt = <960000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5k: ldo5 {
+			regulator-name = "vreg_l5k";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <931000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6k: ldo6 {
+			regulator-name = "vreg_l6k";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7k: ldo7 {
+			regulator-name = "vreg_l7k";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/eliza/adsp.mbn",
+			"qcom/eliza/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l12b>;
+	vqmmc-supply = <&vreg_l1d>;
+	pinctrl-0 = <&sdc1_default>;
+	pinctrl-1 = <&sdc1_sleep>;
+	pinctrl-names = "default", "sleep";
+	mmc-hs400-1_8v;
+	mmc-hs200-1_8v;
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};

-- 
2.54.0


