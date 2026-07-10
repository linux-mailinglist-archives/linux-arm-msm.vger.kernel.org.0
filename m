Return-Path: <linux-arm-msm+bounces-118172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pl/bGQSXUGpr2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:53:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C8737D69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:53:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iloufvRH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i8E5qqJ5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118172-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118172-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73A353038773
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B9C3B0ACB;
	Fri, 10 Jul 2026 06:52:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988D13B2FF7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666352; cv=none; b=f2QAYKchE9BH+HqKeGulkzvrC+J1o3Nj9cyEYlOz5gtcOSuFaQJVpNYIW/H/77jQbZ9+2OxQbCDllLn3JaW9y9/AT/w8pA1Np+YOHzRTtjWkp0D58WlwCQ5NvIMxZgEacvzc+2/dYSv/OnPwlzXq8SXvq3GhOmuy+gDGKc6fPrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666352; c=relaxed/simple;
	bh=rGmKVs+f6Ak40d8/LU3jSeNzVvUOvDcjX+0asZlXbdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpqhXXAxf/bcmZeqo9G5u3m1tnadEre9oBE4jvDMEsa4tcg7b/jF44eXubeQ/8FCDULusaX4V+dweTR46r4LYUG0SugmUgoI40Qc+29owATh24cfkd5R1tyH86Mjteww4SfGjApWYBrHajybPyGIDIflXt21bxg3HbYcI6wGxaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iloufvRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8E5qqJ5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3n1Jf3661656
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N0NHTrqbfmobxLAcWBY7tmTjS7WED63v8/j5Zk6ECYI=; b=iloufvRHOBo+72h0
	K0jDrD+xLFvRS6kSkEeLq/HSwF7ZjZRrTm3KwIEDPTCUAyGb/oi65h7V4jz1Ee1/
	U0p3BRLytpK8L8BoLcT9kgP4yO8Rky98HmdcINUodkvHRVac4IRt2wVIt2TIsWgw
	+6PmDSW6OxuN1TrfmFaWSn20GCsxX0QVl+4hqJgvIopFW2KN3CHKRDwD+wFGtFjY
	O5J3MtTRD7Hx1wJX1tG0r0oriRF0yRHAZ7q2nAjiOP7rcLuExsGygLw8CH/OT49P
	0yHSYJfFsldGu5QxU8QwOKJPK/7TcG6izWRacKk41HcgMCnKTiQxtowLY7Vx+H8N
	xlmblQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24u0tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so952504a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 23:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783666348; x=1784271148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0NHTrqbfmobxLAcWBY7tmTjS7WED63v8/j5Zk6ECYI=;
        b=i8E5qqJ5noiAFe1sZ6+fAyaDvgM/Q/J7uuFB6EVRZhcUP18Ya/wTr/kOKy5s4zq/nX
         n3LyQxdAFrNUhzgX9MUV+A6iJGOIyhn70jVTYh7d7cuU/QiyrjSiPvSCZLIsPoIEoeyZ
         J0UitClLej1OTDMKg8FUtZJbDCoiU9hN9PrXf5LQwPMKHm6DyPj9xaln8k/ackgKR1We
         TF7ixPwRgL3/oxUbs6CxBs0JZnQZZsCMUoilfSEAfefD98I937xRP/hv+Grfc0U+mLXf
         gQgV+WMjex2smHNU3o/lJm3DS4UBIK/6QC884vxFiIYRjvOO3+xMwLK9G1qCMa1ucIDh
         2qAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666348; x=1784271148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0NHTrqbfmobxLAcWBY7tmTjS7WED63v8/j5Zk6ECYI=;
        b=QpYIkgYKZIGncJ1NdfvUi6FOEj0Qk1vLfOMkoFpY0TZajhUXj1BFtQdFxrE5m+4odc
         AtIMzzkxJW9BAOT+fNB2nwUH1Ju3N7nF8FlzLs66ylU3hfGJsxMmbl44vJpGDsHE0Nwf
         Q3spqRHSMBxdOJEPhR4G8zFFLkNNimupYMaLcGH2TiQ2N2z6+A2LfItqk5NU7z/Gp2FU
         UNxeSA2/pOl7GPBRnrxe4UsHjILzBJ9brPlT/F/fTaF5y32KhdOZTt9oVk+PfUKVX+lJ
         xgsAqwJgDyZtw5RimWoOq8rXUFchvEfdCkrJHUooW7DbFpkQkj/XHm3FFcKrOBN3JV3Q
         4sjg==
X-Gm-Message-State: AOJu0Yz03hhJr0q9OotPrktWF4NDsuJOg2rUnT0hRxrmpFFwnlG9r0BO
	oacyqWlxGofwE2Lx4E9+L5vAtNYqCtSjdTy/QXfdnXxhPeV7bO3K4wTAIOnpyLAnEhafZlPye+O
	r0T+ep73fRjIqrN+8oyx0/fZcErb5QF66rBb8UO9KZcC4o3B99EhwVAlFxw7ZulmvHago
X-Gm-Gg: AfdE7cmr2Yui+0n8wTMaQk6OtD0HmOrNhLjUHXWAHgcC9QxEP8SDnEWnHaRJ7JRGQIn
	h+Y6HfamZOVxQk31cj/tNwcWWbRLIfsxDHk7/Cwf6VlKxggGQUueOX/DhcPxFJiLCIXCQyrdppo
	8oYXdKLl/faql4ez4zx30uYajPfvw/RRnEkCSWjvjUpzoXfgTmG0XEtafo01dBHj64dsISiS0wc
	CJB2ah00VGKfQDjPz6FF8VoLqa7znajQj02FdNlpHPO4Rs2LVk8n2deGmYS0Ic6TJIdBfGXCdyp
	1gAQiqiZqD7/rlcNBcyIwznT+iCbcO8CI6E7WxpmtBNRryNRbaqJkQe70eGzcsbbWfyDBBgSl/x
	Za1N7DLsK2ejfjEvxzvnCCCaYK0w3BA==
X-Received: by 2002:a05:6a20:9389:b0:3bf:a698:ce4c with SMTP id adf61e73a8af0-3c0bd19f143mr13812490637.58.1783666348409;
        Thu, 09 Jul 2026 23:52:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:9389:b0:3bf:a698:ce4c with SMTP id adf61e73a8af0-3c0bd19f143mr13812458637.58.1783666347841;
        Thu, 09 Jul 2026 23:52:27 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm31618301eec.21.2026.07.09.23.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:52:27 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:22:08 +0530
Subject: [PATCH v3 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra_adc_support-v3-1-ddc840fca0a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783666340; l=3207;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=rGmKVs+f6Ak40d8/LU3jSeNzVvUOvDcjX+0asZlXbdo=;
 b=CMu57w5ZkP+ngxVlwuoh7OS6YDAP1Fb9Sw9FD6+DT8P05iXIMP5tHt73gEt4b4+g6OdbVDDmD
 GPeF39Y7dFxAuyI99ySyAh3YZb1/962587fZpJBj/qU7lHVM3SQIpeu
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: tjSDuu7R76sLnL-xepMuCIsOvCVjqOJB
X-Proofpoint-ORIG-GUID: tjSDuu7R76sLnL-xepMuCIsOvCVjqOJB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfXxZpdqhYKzqXI
 f5gMFRzEYDqTE+UwU3HMhxMKgj1E3ppT1HEgm5DBKKwzkL7ox0Icfkt1Cf7tgI00nuxEWGEBFjU
 PStzJK9O9R+kaFgcXk2tkbNh+m7vRic=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a5096ad cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=32WKvE36LqkSdRhMvAkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfX1X5QH/8ez5eT
 qtLVoXr+HaHgDLFEb+hmsL0cOiF4tQyznbs8AaftMBz6Bu5cr0QmDZmxFVmk/eS16xu+UsNDL6a
 iWuWn9XjMpKYKqjzcgmdLW/LlE0zVlzB6ToJHdZu/pX29rZVg3Mf6NRi8mDBY6nRjTbxNGCYuuW
 dw3DnmlyVP4KYPDtW68HebaqXz7DTeTK1w5aAFslj2o0mT0uy1xYzb3O1h612TAlbjwfnRApv4I
 Dy5kBQQmfbAUpg5hEHq79wtKsX/d/V1r9cD70TJ4O62NCrmvReQEjRUkIgvB/6gBtz9PwDOC3X4
 KOcFrQIusHoty9ezMh0ZDRA8OMoLLQ/SeqRrXPopXU6qfeEck9w1JZ9VwVT9jQP/kItrnNbSYNA
 fc9duCrDzGtf0WSuHEs38U6X2D69JMnsFc9YTNVDevBbzlFmmv31O45G4ESg9GJtqCE87Jq0bGd
 XfwcKLI2orZ9z+3Y9Zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100063
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
	TAGGED_FROM(0.00)[bounces-118172-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE7C8737D69

Add VADC node with some channels under it, for voltage and
temperature readings. Add temperature alarm node, used for
PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi | 104 +++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 542e8fe030da..8148d2752846 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -8,6 +8,35 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm4125-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pm4125_tz>;
+
+			trips {
+				pm4125_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm4125_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pm4125_trip2: trip2 {
+					temperature = <155000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmic@0 {
 		compatible = "qcom,pm2250", "qcom,spmi-pmic";
@@ -65,6 +94,81 @@ pm4125_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		pm4125_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pm4125_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm4125_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
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


