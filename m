Return-Path: <linux-arm-msm+bounces-113035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o7nyODdhLmoWuwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:07:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8F86809B8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:07:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FyRbH+aX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dzjQK+kt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113035-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113035-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACDD23037168
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 08:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896AF175A9A;
	Sun, 14 Jun 2026 08:05:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F5E2F7F17
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781424347; cv=none; b=NZcmob41hAtG1e9LAWJF6RU1W0GqSTFYK8+CqBW4u6aXE4thzHGEUPGXACkw5j1TqXK6Pj4o+JCvDCXJSv2p/BDnePxKMKT1K9Mwzl+IMDVB/CLc5ms/JzpJZFyzQDqFx5OcjxcT0ev9U9QiH0RXRbY0aZGvGX28BUkXz7vFDhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781424347; c=relaxed/simple;
	bh=5BYm3y6m4USF4Pb7mcNn2U9eJ4f6+cVQmd9I5zMj1kA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmAVCUCSYJmTo/fH/jzVvNqffznPocQ8mB+B4q9ZDk5XAhHJ8IZ8+YHJmpPDj7t1zut9EDrg7U8gV1y80zXiMbvZ+QfXXBXYDcad1+FXGAxucSr5y+tcvyc1uxtHORrSYiXE8KeYCvXNeey1s7SQhvyiKhwMDTijGRhwIbMQOds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FyRbH+aX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzjQK+kt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E5YGWx298179
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+uKJsbgWZFTB8SDypIdJZhB6Q+/orfms/lo6g22tKU=; b=FyRbH+aXgK9rF1JS
	R3BMR3ll55NKwyGPHsRVaqz1xTdHXynWhVABXBIlP14pys7UJN7MNX8D8Xe7bwgj
	6+Nb9NyQcC4rarkKaOVm3UM77U4Wtmp41tN1I5NAZOScvTAhRguXvQdf8bsjuNc+
	zfoMiYOn4abnY1ZDLvAWm1eDvPGHMufc9KBtGKJsQXQtDieWr51dFvApunpq23pr
	2PP878tofTk/obpc8151i1GKZqWfbXvs+Icoes9SmJJqTNybqjkBQiEo5iFyZccD
	1qjxSfLIOnpZJ9SGo+scv2gyLTWyNnoEorihJfRV8a8uEgVL+OJIDFgmf2L05LyW
	sju3IA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye131qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so40395845ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 01:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781424345; x=1782029145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+uKJsbgWZFTB8SDypIdJZhB6Q+/orfms/lo6g22tKU=;
        b=dzjQK+ktY3YVe+9Kjm6A0jLQUTz6U3LS29a5PELGlbz4l8+QgwD3qOkJB0l3YeM9Nn
         SKt1vNRvvGnlCu474Q8rOBRneykPeLQyAcpBM5d3xOXqFL9ngKdkH+I3aNdktK1Qy0S8
         wP6cCMHA+Z+Q8Sf42Wim0o+K9P/0+exoAcsF5sWNz++X+VJg/nUOfXlhq3gQZjRu+OOb
         kb984zOffH4w584sqB9ZJ6I1zqGJQXJikSfJBHnDqnvTKzz6u9sCjDAalt/Edwx2b03w
         kWOa2gw1IC5YeqpC35MUQrwJY5e+lthhMp7T1sLFmfueW84yDeakqCANpAHGuhvwY2Ee
         cvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424345; x=1782029145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x+uKJsbgWZFTB8SDypIdJZhB6Q+/orfms/lo6g22tKU=;
        b=E93NIZo6KO5UTC7jKY93hz0wv9A0bccobyWQuzf7z4R4S+XT+T1P+9mGDRKZUYeK/6
         nlqXSP7QggGQ60ZNJBEkbieZdEwxwdwy57lcNKuPW9tZU4IlqZO2pheJyKYmmd8lOUA8
         zgCLpAmjkq4Z1nlwXzfyIwd2adw1J6PfQfvWYr+8Y+nvqkGFaMGkhXhcxXhAUyk083Zs
         a6kGfALSK3X43zOP5p1umybuX6G8+gXh7jA4g33vkYgY4ILUsekaiwtlJhPZ6lryG+BE
         nyUZqS/KON5fwI5AQjuL0iLhYfSNDp820NvIcItxXSqT+ZoJJ+hdaeN7pGTVfZZzB/Mq
         1K5A==
X-Gm-Message-State: AOJu0YwIAzbOe/P/xTFTqF/5hjNnJzRD3o7THcb4jxCb272zNWFsHax8
	+1u3fjSNVf1w8sijcjUD/aV3mXFWbHSK8rwiuFMKRgAGzTczzzx2vIxjC2ALlIjSB6NcA8bMUv0
	n+fpAtXvRfiK0vt0vqc4x+UUW+UiRDgOqzRC7BWuvplKtztoQagkBJHL5Gghq4SMOMENU
X-Gm-Gg: Acq92OGhH/d+bWIzOJEMPU8lqJzO0rZDMv83XRAFus+2SVDWQI0Z/ccqXHgpSy6iBDi
	vSOvkX4qSl9ayNSzauzB3yoTAvBtEiEsGJRoEpFkHBia4xMeUwgMRiwuN0Jv81fYbBYV0B+rrwU
	eYZ//kBhoLu7Y7hXel/Pg4u6aOdxP7GBHbYxAiHkuhcyzPEAnSiiKJEMahfkk1llnjAwdyaeoiv
	Hb80amc8x9yiYiVpvadH6m6KKgFh/P5Tyz2cusET65P+J4MorKiZPhpH0prhz42T0r7UFaJt6pz
	iZPj4X88dGOIE0hwgEWVhtZA5LzTx8P2MXnMfgJP288fPjJnyp8/MvyAkMn01i398p1JEUIGJMc
	8nwlauLi+OzNvcu+o7Sy88H1Vc66xABgYgBV4pOKx
X-Received: by 2002:a17:902:cf4b:b0:2c0:c262:b91f with SMTP id d9443c01a7336-2c4109ed6cemr110343975ad.8.1781424344477;
        Sun, 14 Jun 2026 01:05:44 -0700 (PDT)
X-Received: by 2002:a17:902:cf4b:b0:2c0:c262:b91f with SMTP id d9443c01a7336-2c4109ed6cemr110343775ad.8.1781424344060;
        Sun, 14 Jun 2026 01:05:44 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ca31sm67309225ad.55.2026.06.14.01.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:05:43 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 14 Jun 2026 13:35:11 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
In-Reply-To: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781424323; l=9555;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=Os4byVg9k/u5AL4IttQusDpFVsFGFMPWWLUebVsWPsQ=;
 b=C7xhWEHm69os9GD0vuyJJ3jL5VKuHJpbgCYO9Qt39t2m/tN4zc8ildkI42DGIcK81YPzgG3Ra
 /H1sQN8QOgIDZGVd27A3SkE7vWuMYEPA7VYnfgVf/Mr0OfRpElNnRPN
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: GBJOucbVmWD7kCJf23eBIim6OdgZBqtG
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2e60d9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=izxvgA0RxB-DvlahdVkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfX++lkayR6cJvS
 esVl9sWXUSS70J8FXcnZQAz+IyvmwL7uHg7iqW+H4DjjCgRHakajiF25LRQD51ILgONW8Syriow
 KC+bZ9Tdvz1thj0U+aXNywgiqofT/uA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfX6Z102AkFvxqy
 EuedK50z13Jk9epxYkCuGpJSvRBbR5Jcn7wlqYAMMUgjiokLSpO2EOsO+xqXOEZ4o8MUhAlgujn
 Lj3o/eljJPM+/W6lKHAEvjGo13xBR6XNroNDZvqP0bpauWVDCAFMMTtwnwdcZd18ziMP3rX6bhP
 +xSAmQkxfhTCt7S8ZlOJzffC3H5oNuiE6yLUq9pMLS3DPuibnOL4+JptPe7XduS3zXGU5mcTtyh
 HuNzOdO+z2UbVuA4Q1KeZokrW4Kg67deF1VaMKDCO2Qnqnxq6c3qm48iMDw9D5UPj1U+4nuBr49
 rL1d3vSQgtVkaQzbij4eaOFUbxYzuBsoRhv8mWnNPpjaPrlfy5YCnZntJSsJC/8yZtfZ1dGW2h7
 dufLLyNsnnO5oc5pnnMd4kZuII7BBF2k/d81kglRvOYnwoL+hSuBrY7ONIMwVP/DWGEmvMd6BTT
 Gc0OdtH1jzI/cMQuuyA==
X-Proofpoint-ORIG-GUID: GBJOucbVmWD7kCJf23eBIim6OdgZBqtG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113035-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E8F86809B8

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC node and define channels for:
- Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
- PM8550: Die temperature, VPH power, and system thermistors.

Define thermal zones 'sys-0-thermal' through 'sys-6-thermal' which
correspond to the off-PMIC system thermistors connected via
PM8550 AMUX/GPIO lines.

Also,add io-channels and io-channel-names properties to the
temp_alarm nodes so that they can get temperature reading
from the ADC die_temp channels.

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 250 ++++++++++++++++++++++++++++++
 1 file changed, 250 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 6a31a0adf8be..2e746ede850f 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -6,7 +6,9 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 / {
 	thermal-zones {
@@ -189,6 +191,90 @@ trip1 {
 				};
 			};
 		};
+
+		sys-0-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-1-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-2-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-3-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-4-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-5-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-6-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
 	};
 };
 
@@ -277,6 +363,142 @@ pmk8550_pwm: pwm {
 
 			status = "disabled";
 		};
+
+		pmk8550_vadc: adc@9000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x9000>, <0x9100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <1>;
+			#io-channel-cells = <1>;
+			pinctrl-0 = <&sys_therm_0_gpio3>, <&sys_therm_1_gpio4>;
+			pinctrl-names = "default";
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmk8550_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@103 {
+				reg = <ADC5_GEN3_DIE_TEMP(1)>;
+				label = "pm8550_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@18e {
+				reg = <ADC5_GEN3_VPH_PWR(1)>;
+				label = "pm8550_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+
+			channel@14a {
+				reg = <ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+				label = "pm8550_gpio_01";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,adc-tm;
+			};
+
+			channel@14b {
+				reg = <ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+				label = "pm8550_gpio_02";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,adc-tm;
+			};
+
+			channel@144 {
+				reg = <ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+				label = "pm8550_therm_2";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,adc-tm;
+			};
+
+			channel@145 {
+				reg = <ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+				label = "pm8550_therm_3";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,adc-tm;
+			};
+
+			channel@146 {
+				reg = <ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+				label = "pm8550_therm_4";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,adc-tm;
+			};
+
+			channel@147 {
+				reg = <ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+				label = "pm8550_therm_5";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,adc-tm;
+			};
+
+			channel@148 {
+				reg = <ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+				label = "pm8550_therm_6";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,adc-tm;
+			};
+
+			channel@203 {
+				reg = <ADC5_GEN3_DIE_TEMP(2)>;
+				label = "pm8550ve_2_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@303 {
+				reg = <ADC5_GEN3_DIE_TEMP(3)>;
+				label = "pmc8380_3_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@403 {
+				reg = <ADC5_GEN3_DIE_TEMP(4)>;
+				label = "pmc8380_4_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@503 {
+				reg = <ADC5_GEN3_DIE_TEMP(5)>;
+				label = "pmc8380_5_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@603 {
+				reg = <ADC5_GEN3_DIE_TEMP(6)>;
+				label = "pmc8380_6_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@803 {
+				reg = <ADC5_GEN3_DIE_TEMP(8)>;
+				label = "pm8550ve_8_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@903 {
+				reg = <ADC5_GEN3_DIE_TEMP(9)>;
+				label = "pm8550ve_9_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
 	};
 
 	/* PMC8380C */
@@ -291,6 +513,8 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(1)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550_gpios: gpio@8800 {
@@ -301,6 +525,18 @@ pm8550_gpios: gpio@8800 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+
+			sys_therm_0_gpio3: sys-therm_0-gpio3-state {
+				pins = "gpio3";
+				function = PMIC_GPIO_FUNC_NORMAL;
+				bias-high-impedance;
+			};
+
+			sys_therm_1_gpio4: sys-therm-1-gpio4-state {
+				pins = "gpio4";
+				function = PMIC_GPIO_FUNC_NORMAL;
+				bias-high-impedance;
+			};
 		};
 
 		pm8550_flash: led-controller@ee00 {
@@ -329,6 +565,8 @@ pm8550ve_2_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(2)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550ve_2_gpios: gpio@8800 {
@@ -354,6 +592,8 @@ pmc8380_3_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(3)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_3_gpios: gpio@8800 {
@@ -378,6 +618,8 @@ pmc8380_4_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(4)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_4_gpios: gpio@8800 {
@@ -402,6 +644,8 @@ pmc8380_5_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x5 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(5)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_5_gpios: gpio@8800 {
@@ -426,6 +670,8 @@ pmc8380_6_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(6)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_6_gpios: gpio@8800 {
@@ -451,6 +697,8 @@ pm8550ve_8_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x8 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(8)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550ve_8_gpios: gpio@8800 {
@@ -476,6 +724,8 @@ pm8550ve_9_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x9 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(9)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550ve_9_gpios: gpio@8800 {

-- 
2.43.0


