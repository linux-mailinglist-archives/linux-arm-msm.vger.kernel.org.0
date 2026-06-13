Return-Path: <linux-arm-msm+bounces-112988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rr/kK2IQLWq6aQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 10:10:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0EA67E138
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 10:10:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MT+xyZl9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jc8JriO9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112988-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112988-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEF87302BFE9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 08:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FB63976BB;
	Sat, 13 Jun 2026 08:10:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185B236F916
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:10:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338202; cv=none; b=BHj3gC50KO7Eh5gYJ1u1pjUM3PNd5Gl+l04jIVtBok7YfM0LkMbzn5Lpe7+AkN0NpXTsITif5BjjEdcgQz28B4yhzsJ/8frNBlDu9g7V1U9d7hM7y6PyZMmTKJbO3L/SP3W6jjxOYFrL1azFncYom54PKtB1+TjJvPLrRTUy7xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338202; c=relaxed/simple;
	bh=tQPHD9UJKS4V71UqeFoVB3YIRyBT8mZHaek/CsebTt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPtlY++JXPDAHKAb77ITLntZO8JuZbZl4EnxElG/X8Fwmi97mDKRK1hOOaDSOOM0QyUc5+U2GuErVnHV2o5f7k/0Q3Fa9li2auhc2Qb0Hs/N01yYafn69nHIf6Y+S1S2dXKz33CNOz3H/skLpiBL90CxJqhD9b+Wcmai2HMYmRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MT+xyZl9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jc8JriO9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D6ef6K1726780
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tro/SuIT+usV65tjAioArgwoi8LfhCNRSF7TsCmTtVk=; b=MT+xyZl9wbMWYTH4
	w3z0Xg8sypH+dGeNZWJKT+Hw8Rgr4vfy5Ip/con0dxzOTrJH/sAYVy25uaDsGPnu
	xD/YyMwqqxsFVWOir97bJY1UBKeDhOMQiEWfnmEs5jNnm09X+g5dvPWksMnQmZa9
	8cR6AiKT8pksH8ndjvYxmdAH3GQhAiJTEf8/TIyyYACygGsNF1BCA4nGPG5Ew+VM
	kNI/x7pIm2KGq/9ZmVmbCmjImVcLMET2+al+SxVuoGsfMVpi8mnA6945pEPeuyL0
	k6yurgbe8IG7MJQ4iexOVFcQJInUBABBt9mBRXhDBDBHq32hvlJIu6LM4PdIku0Z
	4WXljA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9f8hf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:10:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8421f5d76aaso1220987b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 01:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781338199; x=1781942999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tro/SuIT+usV65tjAioArgwoi8LfhCNRSF7TsCmTtVk=;
        b=jc8JriO9Pnj8J7CcTNVw2vaNZ7Qv6Ku+bk1kc/0o/5zDZYqB5qEttxC8otXe0QwE6N
         jB6FJ3HExo9TVeQ/vpuMs72cDIyT1m02Hb1Yzt+yPjCCqubFFn2L5O3hh/VAXlFWy4Uw
         gtNye5RSx/6VE0FlBkq2m1yFx6ICDQO4J3BBzHE6TPbxIKHR1Tg23aRWkJsyL5vr6swm
         k8Tsk3yU5g1RjbKZfj54O9hpvSDWPufurD6KX9MoNjjo9PZ2BxoZR5rMglcQ1f6dPHgX
         FtFgDco1lQhDmH86KVCfIIZELSfVKH/8QohsgB/HAS1CEFJGdnMKky/34y+czSK0hOyi
         OtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338199; x=1781942999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tro/SuIT+usV65tjAioArgwoi8LfhCNRSF7TsCmTtVk=;
        b=Umr2risX91YdtKvzXL6lkGP0NxzGR47aDeTxXWCGXZbLQi1MUXEu1kHUupXfUc52Uh
         SkISDSmlUQjKZjHvYtfs0493yakLarLfmKLunWtjAvjdcaCT0Y4wfx4p/oq0AuAsvb0i
         sV8azQ1R8F56Zt63n6yWRccWZH0CBmgJYdm0Gan4Sn/dGsyRL6dQ0Ymw+5izHHliwaPz
         knftYp1lzCJlc6DhL5Vwzga3bU6Ih2n+1Oz72nROzSMdA7w/h8XAa/vcoZKvXuFe8d9+
         vjC9rLizJqNtW5OtcDiefsIpyPlmEyb4ML8VDBj7XCEL/WJmfGLJulIcGuwTr6AhcF8k
         KNqA==
X-Gm-Message-State: AOJu0YxfgIuv+9WnfpLWbO3BaD/H2tntow8hiCkbqPMsT8M0JpVYYc7H
	nZZkkPbZ6Y1DQSpa3jWiYDjcapY+WgZmkI2CPFnpNXCmJtvU4AmgWR0RsAZww8rebax7CHAdysl
	/DZ10UsWbmwQVIRB4Czmc3Lvr5N4+cdyGJpQh3WK9jFTt5xgK9r4qRAZEn2iOLlxq9hU1
X-Gm-Gg: Acq92OFikRmJcUF5BeVA20DBVxrlj5eSnPgb8n06KRq/CFheONRobTa3/f/1Lp5EdqC
	gAOOGleFgZPfLk1fHVUyK2Xx1b8I2y+TzXrMCQ0qe/FUZXmJ1vzs2/xYrDFRilMQx4K5za2o9Lc
	fRorxVWv0WVqFyDuZ+ty7qAoW6PXgUh1GVDIuz3s5C0QyLhPaajEwPhiGrvlAm8+ES9Pble2lpD
	rAJTzwX1tMsUX85qd5bjmJZ34gN1Nky+CNIfcnz739e3ZpRzFSTyFFDdNU/QPlGXgfyOcWBWuau
	Bi2QtoBAN/r5CSG4s97zAh8r0p4rKT+69u/Q/0QQ6zopXVZaGzhLnZ05X5XGxsbAKkYoiSX8nHg
	lB//EKbyOCSQf46wCh+0nl4XCApAF0P6Rk6xeaMsv
X-Received: by 2002:a05:6a00:9285:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-844e19879d5mr3257914b3a.17.1781338199496;
        Sat, 13 Jun 2026 01:09:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:9285:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-844e19879d5mr3257885b3a.17.1781338199079;
        Sat, 13 Jun 2026 01:09:59 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9dc5esm3926647b3a.10.2026.06.13.01.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:09:57 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 13:39:21 +0530
Subject: [PATCH 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-shikra_adc_support-v1-1-57d5e6c7f47d@oss.qualcomm.com>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
In-Reply-To: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781338189; l=2551;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=tQPHD9UJKS4V71UqeFoVB3YIRyBT8mZHaek/CsebTt8=;
 b=kQdl3OJpRzKqDBNd00jFpWkYOIOqPqdSiIdAgGQkiYzoOxxF8eqG4damGmghyNcuJwPrp/dcG
 OqMoVC28LjEC75yXPkviOQEyD7+4Laqe45bM7iQvWdFhHgINVfZplq1
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX1Un9gyaWyPzk
 STaFRjSrBrFHnw7u+ps6Zq3PTTrumt41LkyzVqp3XFioOlzN/Ys49yuqsjjWePz/jJKKqq+YEuf
 NtjWsRRslmQDDTstcp87iY49jBKhrT53O/LihFRxssBaIxk0jvpyWDKlwRY8l4HvAhewZNVDF5Y
 UzwjciGmalcPcm1GmEnyn6ya7gzJrDzZyyHyoLxhqu2mA05xr2W4sWl/HVXmIYRkxR7+hplrrAt
 lPCUZprc6O4THUIlX5swo3n2Y1e30+oSl2oZLyEreAQD7+t9D6tS7FLXwhPihN4XhOoH8XjOBv1
 Dme66VFsGkYbuxesPOnky2un98lQSrtYMM0bumKuqDYV/RtnFxM7MYVdpJ/rWsJzL1t9NGv6D6e
 nxDKVD7RXg4z/MRYH7JxQ3xgHBH6KjtaghrHJJi5CWwmgkWg5uS7nNkHv22tYCxPJlIye916c31
 sFZgGFgMUxPDDwhRd8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX7WNLjlFfe7Q5
 FHEI5NqV25MimXIUDgS/7Uz0sQ42ntFCVKY2522HNn1gVyra82OQqnk8mFPrRU/x6mt9wy6GiSz
 o/GYqi/e1fage7xA02LdxGPxVXxBBBk=
X-Proofpoint-GUID: YEa6lRoTfmbTMBYTCqu0_mBSg0lNy_Rs
X-Proofpoint-ORIG-GUID: YEa6lRoTfmbTMBYTCqu0_mBSg0lNy_Rs
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2d1058 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pVylo6aZF31Nrf24llsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112988-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B0EA67E138

Add VADC node with some channels under it, for voltage and
temperature readings. Add temperature alarm node, used for
PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 542e8fe030da..7113504d5941 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -65,6 +65,83 @@ pm4125_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		pm4125_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pm4125_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+			status = "disabled";
+		};
+
+		pm4125_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+
+			/* Channel nodes */
+			channel@0 {
+				reg = <ADC5_REF_GND>;
+				label = "ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@1 {
+				reg = <ADC5_1P25VREF>;
+				label = "vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@6 {
+				reg = <ADC5_DIE_TEMP>;
+				label = "die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@7 {
+				reg = <ADC5_USB_IN_I>;
+				label = "usb_in_i_uv";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8 {
+				reg = <ADC5_USB_IN_V_16>;
+				label = "usb_in_v_div_16";
+				qcom,pre-scaling = <1 16>;
+			};
+
+			channel@9 {
+				reg = <ADC5_CHG_TEMP>;
+				label = "chg_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@4b {
+				reg = <ADC5_BAT_ID_100K_PU>;
+				label = "bat_id";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@83 {
+				reg = <ADC5_VPH_PWR>;
+				label = "vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+
+			channel@84 {
+				reg = <ADC5_VBAT_SNS>;
+				label = "vbat_sns";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;

-- 
2.43.0


