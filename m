Return-Path: <linux-arm-msm+bounces-90649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEbZKCFaeGkupgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:24:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA25905E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 833923008C02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 06:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBB532937A;
	Tue, 27 Jan 2026 06:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBIAEP79";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BiHwTv+f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C892D7817
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769495071; cv=none; b=qgSCelgX/gAW8TJbKV4/cj6qv4ahhzr8KP1QqsECTTKuG0XLiJHqur9+BIZVrgsFr4WIClNVH1COj6UK5T5SwSx5GNUfcZWOQln7h2mWvgxhowAvaKHsEwEb0aAtHH2eMqa5mi3PhDUcVqsfFM+gQzB77fpNzm0nnZcJmr/Fr18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769495071; c=relaxed/simple;
	bh=JF2OvpavDLL5c4z+vlJNpDrjk+fqH7N7RwGl0YMGMPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YtKxM2rujbeMpmt2pRuq5k43V1HViACCYIiraP2C+gEJ6bq0wc1MO8jZdTpeMXDFbwxntolCYDaRryjNiX9HgO8Ov6WHS066UkIWhgbO7fX1k5P6SRbYn0GScImMxbe067fsXd3/1NRcbWF8OoCrD6d+SVQ8yX1daIl9iX1SOFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBIAEP79; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BiHwTv+f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4U9TT184765
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5Kr9bKMakxYGlSFgTESIhkA8M3V+wrEATSg
	fs8YYTZQ=; b=lBIAEP79Vk8ZYMnAvPv2B0FywJFgaaedf01b6FPu0gbTQ0fJadJ
	i7SAHg+ncA0qnmAhQLczSjVFfvTG/mpdCUaHMphH0UGia6Gk4s8nkINS5VVPG6lI
	UVowNhdsJAe4qG4GlOjGE54WaO2VhhMd8hYJjqnFAu7v00v3T6jhwa3+FrgpuPVN
	3d9CDwb7VItarI9FxzpXgTj6yrLKCwk7vPbuqCqCCvEYt+zq/qO173mIsIuTIw9h
	C+FX/wKU4qGsfXSYQBp/Jbc5mvVv2tlxZS6NEP2qU/hVIHLGJB0xQZYogMgoLlFy
	mWdsq5cJQqQZKl3DI66grPfs/1sSQf1D0dg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9hsjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:24:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b72b6fc371so1816583eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 22:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769495068; x=1770099868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Kr9bKMakxYGlSFgTESIhkA8M3V+wrEATSgfs8YYTZQ=;
        b=BiHwTv+flMzVdGm9GgO9Alv+vJf2DwEcJA2yN0pXRe0krtE63kHSAw7UPxwpt4M78m
         iAO1DoTBUPFaLgMjRAdHZ40hu5LmXyRuXFCiujAGeM0ssaW+D+EHz9M5jjXNM94YyjRK
         ZB+pQ6AK7CY0Z5pMP0chzlmJpV+IdWati08q7bsff+f9ytlefEQ9vFQHt243uOPgLoAe
         xv/cGutKn9uqBIZI+H4tHPePNnX2wlQGCb169EX61E6tITPgqvvg8GlIFGM7XrQNSPHf
         dRQJKH9dsVrYUO0o+B3WBwWYyxJ+ebJdG7gtiXT63h4LcERcXP3jAHn0y9wk7hu1cEpT
         RaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769495068; x=1770099868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Kr9bKMakxYGlSFgTESIhkA8M3V+wrEATSgfs8YYTZQ=;
        b=WunrT1UnYeqoscOMsoVkU4s96DbfxniTkfLcFtmjEBnzNJUfK/KJVC6aVmfcxyXeTC
         QswCk2L2J4jHBLf3O2w5pgnzDvdF+UjrhzdREUgU4KzlwlNbvNGKG+aF+oyeSY3m5bR8
         DKmlwFpKz0uzlM6P3jEjMnBjEXNyfAayWg6twJYOYqgYscL7GWDoqwh5Zrvr7C1zL8pB
         h43X+t/B2O/yRCygXluJDaBY/3wlc8oIqaz6R82XBIzNuqSQdXk/RleRXKlCgxA536Pb
         a8BNUt4QXrkXCuwJq14eQkp3G7AhkqriaZbDnAcP4NCqi/vxTc4cmh7qiyZeCYItlwVw
         Z+OQ==
X-Gm-Message-State: AOJu0YzeKFtaSr/2Yq/i/Xa2hz1EOMJ7nKHWASdhYj5FCE6B4+/TkNBX
	g4iwjYdHZDYc5w2fIZCwsp8kf/aeu/hYtWOtlnLu5u6X4aHqCqDQVbG3saAqULjn8MmBxSgjuLz
	8yXXD/2sIxzx3V8HCpC2AtcWacThrl6ZV791lhV2tXVGMqcAvihzpn2CuiKqhX0Y5VAhoNZfa/X
	7z
X-Gm-Gg: AZuq6aILmNB0gGxp4S9yLnEigvB8Bbh9yXq1GGCfVYQ9gcZo/H+zb2hoHCCnC3XT/9p
	rLD5puAYk3dm8F7KjhB+tEwNnyDEFBQjF0FSFmWJcA5iEtjF37B0ccpxjAiuZLqerqDXehK/78n
	9knnjkv+Fg5jeimimyvKSV7YCA8y+/fWw8bQJNdU5a/Hn+zs6hy2YTTu7rL6Si5TtjiSKHH7qsO
	YoNqdTIg/M0pFT5ftPy3L63TEv8Z6oKoFcdM5b2wnpNu8gT9eX5G0mhBGvv36uAeRO465rkrVVu
	yI/VfbZVbkT7Bv6FXhjnulitPulscdPYdZG8ZKstDwvHk+RTnMKlZdD3/woiFEVoGEMuX1H2fnB
	eMB8yDi7jB6SqHWZRjByg3bO6/kl1uCLtsUpbonjigkpUh5BhdDATB1c=
X-Received: by 2002:a05:7300:7307:b0:2b1:7910:b102 with SMTP id 5a478bee46e88-2b78da133fbmr527378eec.37.1769495067822;
        Mon, 26 Jan 2026 22:24:27 -0800 (PST)
X-Received: by 2002:a05:7300:7307:b0:2b1:7910:b102 with SMTP id 5a478bee46e88-2b78da133fbmr527372eec.37.1769495067340;
        Mon, 26 Jan 2026 22:24:27 -0800 (PST)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a9e1bc8sm15799468eec.22.2026.01.26.22.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 22:24:26 -0800 (PST)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v2] arm64: dts: qcom: hamoa: Add EL2 overlay for hamoa-evk
Date: Mon, 26 Jan 2026 22:24:25 -0800
Message-ID: <20260127062425.1084673-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=69785a1c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T-lse5AFNF5OJCeDb7sA:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: QU13OjB1rwfHGivN61PcQZu035hc77Oq
X-Proofpoint-ORIG-GUID: QU13OjB1rwfHGivN61PcQZu035hc77Oq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA1MSBTYWx0ZWRfX2vdTFiIGnHxB
 TrFNqsmT1G4H8Ozq+2YKGs/JAmRCO8sEYcwkLXF/TWHTr0Pwao+E5NE4o5iKbcjqEjRDIm9JmzM
 q8h3QSuUUmh2TX0mm5AXJNA6R3RghCj5IePigvTXla5WKYDS4cxvZrtLwzLrLfzk8cLTMSFmj4J
 rPXhIdlise9o6qVQWNkpql9GeIp47eixUebNc/v1MijPqprBWGx+vdpa6/Fh6vSAfFolPYKIVgH
 UJMgLXFi5R+sbsO8cjUoRFmBfRHLMiX6SSimYtfFdcW+v8BvpkkrsLWQgWWuVZWH85KamMMsqwb
 UvxOerrzBdVPVh7gfp063i8Gf5sem7yH7PdxLbnlIaMifvrYqGgSjtDf+G7TWBwZS5D98TfmTLr
 NOWgFCkXM2bc65Yee53kG7EZ+TwdaFZYBDIg8w8rUavw/M9v0gLJJlyBdC51CQUVjGlkHOvXLvK
 3rnjVTWtiARy6pFRKXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270051
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[xin.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-90649-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 4BA25905E4
X-Rspamd-Action: no action

Add support for building an EL2 combined DTB for the hamoa-evk
in the Qualcomm DTS Makefile.

The new hamoa-iot-evk-el2.dtb is generated by combining the base
hamoa-iot-evk.dtb with the x1-el2.dtbo overlay, enabling EL2-specific
configurations required by the platform.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
Changes in v2:
- Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
  Fix the indentation
- Link to v1: https://lore.kernel.org/lkml/20260125023521.3862114-1-xin.liu@oss.qualcomm.com

 arch/arm64/boot/dts/qcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e8..b10360fc72e6 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,6 +14,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
+
+hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
-- 
2.43.0


