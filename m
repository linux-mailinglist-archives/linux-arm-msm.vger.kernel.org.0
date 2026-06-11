Return-Path: <linux-arm-msm+bounces-112700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YLIGC3CKKmoysAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:14:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 813D8670C22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:14:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="EoOO/R5R";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kf87Ohn+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112700-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112700-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC590339B460
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE343CAA57;
	Thu, 11 Jun 2026 10:10:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61F53CAE8F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172649; cv=none; b=MhsB9AkXH1b0oDAveQOe6jgCZJ25tF6Sk5GGSIbsBtnXNQcB01VaEUHICLVwhIJfTblZYeMWCbRhZSlGGIlR+fXeBDhjfGmUXm67pQXCgTp/JtLyKrBBITPoxTlsM+K5HOt28y/gq36X31h7BJBJcgL3tO6hlHXnU4cvy0oneoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172649; c=relaxed/simple;
	bh=ODfMe8YwpE9zm6WOKy1yvRuBsZs9KnzIUkMMO4tFT3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YD+6t4lOhJZ3BPtgzqKGdeNWXPGfqOxTZmq6bCG9o50O5zeGXaUfkcDL6EdHNusXBdzz7fjaD73PneOh/PUDxmi91fnqdMujyDUZdVoI7ENFD12u/kdQQVTFW4RSMu8FsYOBXzmtX3tDcbZ5E/DOL/LlHwWkVETrq+8jpfwE+io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EoOO/R5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kf87Ohn+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA1Rnw168086
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IlhEybdLwbReB9UAd0lx67zdA/XyQhjGmwbRzt5Ttzg=; b=EoOO/R5RnvBtfg1n
	QXzYmMvB027F4rAa5DkSbBDUMbliK3XkfpH/do0Ke112SQyqpw9dBj88gDpGT9RH
	W4PfDb8/Lopd3C+cRyx6ypfNkfknhyVPIoysu1kOtNJyd3YeSP0GnrHSgweH+VW6
	ZgnfyQ0uXTl1B/xiC5iopePT4kjcWVEIPoZa6wR0dB1Ye+ydb1lO6/rN/xTkEEL5
	Z07XbTkoEDGFddR0fDqCBrM6szDbq38WngiljN/LgGbVuzBX83bcbprDXry/eh+e
	ygo8XRmDoHPofMGhuNlG1AFhmunoCXOmt2FwH/YYBb7CnTIQpAJlTkjy6gNRfgJm
	2G4ehw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uav79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:10:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85d9f0ace9so7482585a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781172645; x=1781777445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlhEybdLwbReB9UAd0lx67zdA/XyQhjGmwbRzt5Ttzg=;
        b=kf87Ohn+aBD/RLlj/WD0Your/Hfd7uUrRwH4+qmNy/3rYYFVKtkQXlU1EINHP1pHp4
         h45kDHz/Hx1wjRTRz4kwWbvXzAMJsLuUx7Ikkf6pkVkaiew9Smij1DqP2OibTs8dabwz
         v21CPyBaUPD41Vi8bIe3Kbj/0o7Rrwb4h3GiZHETkqBaMMfyGdryXJlgG5+JEX8IeQtW
         hwLQxO+Rp2LzLaVGH9IEJAq2snud6foRYCRWRAtAYPe4BcsOVoA1JkFZu4/dOAbnb2e1
         swBez4mWt1cfoE+oS8lKOHSrrIcANMBtVXX3sgRoOU9P58rHkZq9YyY88K6wOaT8WfBk
         LTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172645; x=1781777445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IlhEybdLwbReB9UAd0lx67zdA/XyQhjGmwbRzt5Ttzg=;
        b=W/REKRNWpiUR6JBlpahxaCyf3iyrwlpXdF25F/dKigYGJDXCmoaSW29PKoDSQImVMC
         BoBzC5GwuNGi7rAW3IsSU1H99DpG8fab0ZQO+5mcPThYyA2B5zz3zywVimWouAde01Zc
         5ToM0Kkwe4SkLa23FAmDXJFdbkvaN8jCiyuO4lkMp8xcnGAkG4xq8A1Di0t5ltP2ALRY
         UBYvEilhABodeyTncqAen19Lt64UomGyMcLbFhUE3zFJbWijbsep478DyvCpKJ+BFriM
         ULJ9zGR5ZODc4pZsI0Gj1RWVVub1sdGJRjCJ/+UButiv1ofnkMReUvzuajzCBRjmVUEX
         IPTA==
X-Gm-Message-State: AOJu0YwLFi0TDL4rMx8JXPj3wFJhQoO7N+VhUCbA9WTBNO9D/a9ZzMT0
	b80oG29Da6tiiisg/PlHfV+lQ2CoVHOVBexfoGTCgw47cThzZ0+HOmdxYOyrobyRH6w/mOhsgrN
	+4cyq3nSLn/DFQ3t2waA1m3DxstI74JlLkzbm0Nq+6K1I4wgPi1bk8S3yU1k7qCgXT4CD
X-Gm-Gg: Acq92OFmp7XGdRqgLD2MttpUfYOAAYk1LpCL0VH33yQfEmHCpPtikwXsdnbEP6G70QV
	Ff8CrtlYaDIMaWyJ2ZrAQHmQ+5p3ExROMAwDr9V+VbBRbW/5fQtN7IZlbcqZFgTXv7Zq+CSGRss
	RSZcPOclfm0J6AAGW9IAku/JR+mxvJe3w6OpJkny4ONhfmOjTBOoSakCBibIQLQ06FEsPIBCTiL
	13RHsNErrTLFnj/4CQ/Lq54fiHqbcfnc4JRRXGzZuZqYfs7tJHcLE8m8mgprhnTyOTGwyBwoFnW
	oW9MzVKSqPk91By4q8rPZZJdTkMo2u6Ips8EcZQBRhzXGAy/m1eNj5XAi0OjxM/C8zUPb/BbfK+
	wemzM6xxlzAb78P5fmhPZ1u7kJHHwpkH9UIy1GRtH8tjShBc=
X-Received: by 2002:a05:6a20:9f46:b0:398:89b6:1b41 with SMTP id adf61e73a8af0-3b5e33a3a05mr2479881637.32.1781172645535;
        Thu, 11 Jun 2026 03:10:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f46:b0:398:89b6:1b41 with SMTP id adf61e73a8af0-3b5e33a3a05mr2479842637.32.1781172645121;
        Thu, 11 Jun 2026 03:10:45 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c865860f3d4sm1279646a12.19.2026.06.11.03.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:10:44 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 15:40:11 +0530
Subject: [PATCH v5 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-shikra-dt-v5-4-103ed26a8529@oss.qualcomm.com>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
In-Reply-To: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781172612; l=4539;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ODfMe8YwpE9zm6WOKy1yvRuBsZs9KnzIUkMMO4tFT3E=;
 b=H7Hx3kKkmjdEfTng4u6WtvNRij8kmTccmMfcIe9Mwde5R36N4hRU22QeBBeGc05uBLniO8l3D
 h0jkcbjNRvFCYME/XH8xkIvBxqrSVfBSJzzRrwVcKafu00YSsnL/F/m
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwMSBTYWx0ZWRfX+2UnkKjxDrY+
 JvE5LnmgKR11yu1eeGPlxQ7jo6eVcLTwqIeZwj3VD5XnaAPTA0Lg9e+fjXRpk6MgRcmpWVPkrR4
 v3wojbtcXx+rjgzph7ClEahXvQlvI3g=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a89a6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IZjsGcCFCfEoDLf82CEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwMSBTYWx0ZWRfXx3mVfHciAi7X
 ttP4dGOQmGLhYhJ8ZRdzymIjvcOaUzV+voWNXyLh8t1HN0FkOHJ2/BoOyXsP9Q5XgeItPCGl+cS
 5Xa794ThfpQlRO6e1fGNsZYgNpMmv9pJC4H4lfY7cwHbFNX3Mt7PLqdQj25L+PmFFgZjrMqWrC2
 UtvOAAPRvwLb1MbKa7K8pDCN0mdctNowY51Dh2VqMOmpDgS5v8FSeuJdJf/Rxjc8Ve9sRVyAoNh
 /hiTS9SMaQGCG/sUIAPGk0YLqV8fV6/G/JGN5btxyqqCd70k/4tDi7sRfsZf/PVJXMDVysBpXud
 IhxqYaDjYda3d6Nn8AmozM9R5gboX17u6H8j0HND0B9qWRdqqI1bGxpZ8dPKqG8ShkLmGRTtt3P
 Eawdj+4EatdIPX1h4HxmHuuZ14LAVq/SxuTgrTBec1SBo6uXKebvQfnlVBPT4qULwmY1LoB+j+t
 m+Z6NoY6+eRzKtymSSw==
X-Proofpoint-GUID: Q0zta2eu0F4wvUfRoPnHZgzosyLnBm-j
X-Proofpoint-ORIG-GUID: Q0zta2eu0F4wvUfRoPnHZgzosyLnBm-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112700-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 813D8670C22

Add device tree include for the IQ2390S variant of the Shikra
System-on-Module, an industrial compute module integrating the Shikra
SoC and PMIC for industrial IoT applications, designed to mount on
carrier boards.

  - shikra-iqs-som.dtsi: Industrial SoM without modem (PM8150 PMIC)

The DTSI includes the common shikra.dtsi and adds PM8150 PMIC regulator
definitions specific to this variant.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 170 +++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
new file mode 100644
index 000000000000..73945bf42112
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "shikra.dtsi"
+#include "pm8150.dtsi"
+
+/ {
+	gpio-key {
+		compatible = "gpio-keys";
+		label = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_up_n>;
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
+};
+
+&pm8150_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8150-regulators";
+
+		pm8150_s4: s4 {
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		pm8150_s5: s5 {
+			regulator-min-microvolt = <1574000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		pm8150_s6: s6 {
+			regulator-min-microvolt = <382000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		pm8150_s7: s7 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8150_s8: s8 {
+			regulator-min-microvolt = <570000>;
+			regulator-max-microvolt = <650000>;
+		};
+
+		pm8150_l1: l1 {
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l2: l2 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8150_l3: l3 {
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l4: l4 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <975000>;
+		};
+
+		pm8150_l5: l5 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm8150_l6: l6 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8150_l7: l7 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		pm8150_l8: l8 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l9: l9 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8150_l10: l10 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l11: l11 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l12: l12 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <1950000>;
+		};
+
+		pm8150_l13: l13 {
+			regulator-min-microvolt = <2921000>;
+			regulator-max-microvolt = <3230000>;
+		};
+
+		pm8150_l14: l14 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1910000>;
+		};
+
+		pm8150_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+		};
+
+		pm8150_l16: l16 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l17: l17 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l18: l18 {
+			regulator-min-microvolt = <400000>;
+			regulator-max-microvolt = <728000>;
+		};
+	};
+};

-- 
2.34.1


