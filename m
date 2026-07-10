Return-Path: <linux-arm-msm+bounces-118175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6LItMl+XUGqB2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:55:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8372D737DAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:55:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b4dMKNUA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qg0cgSbO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118175-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118175-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9F6A301B4F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B893B5835;
	Fri, 10 Jul 2026 06:52:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F173B42CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666361; cv=none; b=KBHVa8wouBoQvZ83VIED4DpdXGsd0PU/17vPLeKDsvI3ooRD6kT/pf8Jw8mgaczlKOEoiM+ihtKR8E8FmFpWLlebuOAWm3BQ9Evbb4pD03fIF/W7h/h6sOT1Nt+gR0cQK6LMzghIXdUDJ2uonFnpqF+w6fuOebn2ukN0JaDDcns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666361; c=relaxed/simple;
	bh=VtTxYlg7UUob0/+xAGieea5L5Ps7Z1cL3R/jdrfEhSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CAFNHYBTUaa07IA57K1svLS67rUHywKUZZ8iZiwXWxia9XZav03H+U8R8+gSo4vnNoQABzY2FSP8C9IhSCfE8O0vaDQMGGZmtO0/es8EgoIQ3tZgrETm3XGzV1vqMJ9qnIKrchPQGz8gPUUWyHM56l3al/4trusM6ggYpDCc3x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4dMKNUA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qg0cgSbO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3n37B3802161
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3f8LexQAPvyvxbG49wDpRkqIfFfQa3wNEO2hsPP13k=; b=b4dMKNUAAT1mrM97
	HerkiedbhGtMCwG5ilQHMODJuAzTw6UwKnDvzux6enOPqHChDAp2nXJL8lNph8hp
	87nadAM2wkN+aQhUpuwKaQqyNEqAYddBnid2KKEiMg4yV5rhFqnPmC976Cc3NEqr
	5gErO6nGLBLSzRl4++bNOMOCGYAYoaBKZmMaizojooZvOzH9/xpv5mIg2yrTHcNr
	Es83p9MGB2yUxbIOOw3dfvMInPYoKvbyqQErbe1e1lju0K2Xxe4cqIkRck4FMMV8
	6XrY/9A6qPWE+Ut9KB7MgLQ2zb/73dpgSqDaTo0dKF8okrwwhIpQoOGO6wc8+Stg
	16THnA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpkruu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so1126679a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 23:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783666356; x=1784271156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3f8LexQAPvyvxbG49wDpRkqIfFfQa3wNEO2hsPP13k=;
        b=Qg0cgSbOAuBRooGtASHUl03iMXv8o8D3hymeboTBWXkoEZeD+GHE2HjE5pw3AibWlF
         kLESzpR4Y0FvIQxWv5K5j7hdqDL1KL/dMAqQzyUYgHKjhD1IUlUXe/Obtmb8Ol+v0WqI
         dH0xyJZyAM9YdUKfWCu0sNRIEzJ6efzAyiVUVmZtdEou3PPA2gszxrxh52o1K5HCTETU
         qlTaPgDpy9/YjbYVtuRNDuhzZTnrNigEJzepzURzKpvf5aMLSj6refRmqu98cgGOn7eP
         DFJZQl1jIrOvKqDnpP1D71er1e4fbsAkcKT6UYNbqj7Bep7bOqgkhqcqNtt6fhJVlwSl
         qApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666356; x=1784271156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3f8LexQAPvyvxbG49wDpRkqIfFfQa3wNEO2hsPP13k=;
        b=hbMu2eJPcBGgf6b+4Du2vAMPXQeQwTFteMRtJfzp6dV9vAGS3GcVMt9kIEomDadMS3
         FT6W3qk/obYvh00cH9orQUyd/FqTUmyg60FKQDDzgiPTMnTu/rV67z6o/+nVwfXEt4kk
         iv1DULUOeSaEMFQ+XIS/kuO7Vs9acUw6qmTNP8LVMH2Eo5nHBC8bJBfj5LMxIxtXt4ul
         4xDl19Z+BjpeaZX/7Pa/g24o6lhIBPxyFvy+yN4w/3wFu/dcqFp26CF+W+BKK4NnFFEm
         WgWV8P95PkcLskOcoA+fRBkNlEiEm0Q+QJuexmBQwCRqUIazbbdnk8lQh+3627Kdb9/H
         Tmlw==
X-Gm-Message-State: AOJu0YzCq640/NSNFTtJapnKJa2b5mYgaem0UFFgU3ADjJJu1eeDbvpI
	LiFF1h8lM228rmbABTAjO8IaGMKQhvhtJ6kSPx5dGjZjQEbOExo54tYwCWuNSYdSQllnvSkNFnG
	WvkgK9ipibrJ6oFTAdeMQeTjj6uMd7MM3169XFmi1LGVUtvAAnQEl0BEfAVBt2tgXAySG
X-Gm-Gg: AfdE7cmSJVkAMo5EMX727wE0fd0u5gPLigW+fMxCwUI7jFIAtWlLbthQe9grWN5sLIF
	8r8qTf1umbq0lhBXZkNKb6Rtw5jOZdN6bW2Z4IEDcPTgMGrkYzbR+WPXiKKgifKHtnFOaxh/7Sd
	yHVLQJhl2zhZXssyDS/8BN/qYAe/BYLvVfI5TGiZzx3SIrhO6KVdvNnwB9K0dbOzmnNZV0oMMe7
	yKtKEEz4sGMBclDmwVZrUzTRiIWXud/Je67KWoSGK2oY6I7sBBmpEA52+6lozR5JEFVgAGzGcw/
	w8qnwDuN++w/qMjmue3Vnv/fVsEtmcWOGLbjeN/WDt/Z+NWNzNlM+JBKZhd5aTSUneTVrg9najP
	TCdIYJOMvwHxxOuvzsvruzW2a+tmkqw==
X-Received: by 2002:a17:90b:57c3:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-389415eeb1amr10233901a91.14.1783666356200;
        Thu, 09 Jul 2026 23:52:36 -0700 (PDT)
X-Received: by 2002:a17:90b:57c3:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-389415eeb1amr10233867a91.14.1783666355719;
        Thu, 09 Jul 2026 23:52:35 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm31618301eec.21.2026.07.09.23.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:52:35 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:22:10 +0530
Subject: [PATCH v3 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra_adc_support-v3-3-ddc840fca0a0@oss.qualcomm.com>
References: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783666340; l=3786;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=VtTxYlg7UUob0/+xAGieea5L5Ps7Z1cL3R/jdrfEhSY=;
 b=7GAaRujqDPNgG7lIgfFtCCfDYIma8CzByEw6FeFGv8jqXRhKXapP99SH9nARhXuMdQY8TkEdY
 XnvWmw3mXZVARiafCheFl0HNF2A/2vquWahXj+Ly9AxeDhBgNtEWJb6
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfX+PGRG1YkVqmM
 z1oUupJbIVz9XhC4bw3oq101DvznETH2vEeXilcNgTgBbloYbhJU3aBOv2LxYmqzTDaC51kj+N/
 1JjqASt09qlFvjEkoJT+f+MukNzjjCqWFZCm0YdLEJ6ARjNRTiJ1v36PYL7tLBX05yziMk/zzVh
 63ImLb+pBFxthH33JDi6AVxLPCuXfXjqzPFksXzNZdcYq/ZW2pOtFvkQ0wS1suNKfow1vhR1HzO
 xwLDyeIaAIb54z1c56S02Cyxzt42bMg3SwZ3osIg6d1LzadaHkil/JqBWimgMlGAfyxixpFuufM
 jfdQtUdj41P92or5ytc+WcTSyUgf3AKL74Kbwudiqs4b3hem9o7HOBF7odu+5jbRSswwYaB1PaY
 xr8s/h12CjSvfoPZULvOWdsI36st9gLwIVweBl9tmdiqIAw4t6rmGnIQFaKZD0x3KeMyRBpF9v/
 MR5Dt5FGexDeL4zBGjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfX5FKuEz0k93pg
 /c2nKIoe1zmrGWdr3nMKdcMZcfu+3BZ+b2Hcks+0TrPu2ZG+94cMTzs+FuET5IQjzVmI573vMbL
 ZCVFvNeJUSH6/OYc94J9NoM2Z+EeWjE=
X-Proofpoint-GUID: ucdrZUcWEPD2UvDm6X3uDZ4RsvpcVrws
X-Proofpoint-ORIG-GUID: ucdrZUcWEPD2UvDm6X3uDZ4RsvpcVrws
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a5096b5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XPlkfCdyFubSKYJrR1oA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118175-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8372D737DAA

Add ADC channels for pa, quiet and msm thermistors along with
their ADC thermal bridge nodes and thermal zones for PMIC
thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 120 +++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index dc3861489f64..139d0ad0b1ab 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -27,9 +28,128 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	msm_therm_bridge: msm-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	pa_therm_bridge: pa-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM1_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	quiet_therm_bridge: quiet-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	thermal-zones {
+		sys-1-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&pa_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sys-2-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&quiet_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sys-3-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&msm_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
+};
+
+&pm4125_adc {
+	pinctrl-0 = <&pm4125_adc_gpio5_default>, <&pm4125_adc_gpio6_default>;
+	pinctrl-names = "default";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "pa_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "quiet_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@54 {
+		reg = <ADC5_GPIO3_100K_PU>;
+		label = "chgr_skin";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "gnss_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
 };
 
 &pm4125_gpios {
+	pm4125_adc_gpio5_default: pm4125-adc-gpio5-state {
+		pins = "gpio5";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
+	pm4125_adc_gpio6_default: pm4125-adc-gpio6-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
 	vol_up_n: vol-up-n-state {
 		pins = "gpio9";
 		function = PMIC_GPIO_FUNC_NORMAL;

-- 
2.43.0


