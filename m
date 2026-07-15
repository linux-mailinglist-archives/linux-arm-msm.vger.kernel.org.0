Return-Path: <linux-arm-msm+bounces-119277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OuxQNwmPV2rjWwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:45:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B370675EDAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:45:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RhGtwxgK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cFmVx+0y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119277-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119277-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F191303F4D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5577132143D;
	Wed, 15 Jul 2026 13:44:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A43F318EFF
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:44:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123081; cv=none; b=a5Iovl2DCwTpIDBNr4gch7IrZn1IuYOtQfUSnW86lXsX/IFodxax42xKgJ3biO6kb+/6/a4m16QSYMzN9uU1fkIrJpg0bE+sC4Fq5AJAFCvrGBRl54TC1OEs4UXGEOo0F1c47vi7TOOjHZF3zYq2volO7JB/fVcTJdsNxihSUmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123081; c=relaxed/simple;
	bh=0Rq8D/NoyC39EmLSzNVbHI8oYiwR5Wkjwf+f9tdSuzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4HiTEnOv2wxjtz2x2PLgtCh6ixGkozx+WKc7dM/xa7HiDJPC7qOTFs3kxqEgR8kakbTB92i6obBjyKSnp9yK27pxCpfAmspRhu0/b2vl0zGztcErPbrPsIIMYDu8qXr2mjT59vGSOBuHTR9DhbFFuPnYqsWZYz0tvg0AD/0/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RhGtwxgK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFmVx+0y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBd02D3579164
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=; b=RhGtwxgKt6MHOu/5
	R9FHBAr0CD0adw43yh37Q/Fj2Tby6L7uKWob21vjo5r3LCqse4jAJfWz5q/o4xdE
	H6tXjj9itjuu3l/5OqKtChciciMfetQ+hLAWv6lh2GRo1eqkPJ6PVMdxUHti4Eyh
	YxG+s6+NgCx/N04nrxr+Q15nB09OONmFoxUN5ezBpVC748FLPfqZYYpcshby/9Qt
	NHbOYVh/AUnhB2AwYzFlaKikyn+EzCWvObW3kIH0qpyOgT408F3SYFZma9MjV2mg
	H96qBgje55XWHHTzIxlH/cfEcHEBOemA2wQiOZL8nM1KJzC/jI7VH2mSrM3gAOhj
	arxWAw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk332wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:44:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so27070441cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123077; x=1784727877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=cFmVx+0ysPl5TOYsAsz6+95hB2DDDUP4gzlW/sUH3K3WJwWtoSUG4ioLik9xPe/EOz
         FYe6hQh4GvriPhqHF7FERB21q8bPU+UqlWkpdeD1F7tvWg2UtApWFlrscT2ofSCG2paz
         vCPICl4bAZa8ZohA1AlZqefd4LImdRuxLNZIyKFgntVw/pPoKsF7NG0z9NtbvVSa62do
         3GZGeecNyVGf5zR3lnaMA0rd3I9/j1cVp/OKumYWpgrw5/fi6YLmxPimNQSHVlnYJ1Rw
         Kqg67XM3A3kSOFgWrBmEN0He/AXcUMoSHA1IQzdi1AV6jsDZdKCNGDAE3jITLsVrc8Y8
         IgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123077; x=1784727877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=NLwMrxVtqMqKQ8R6QhAOb1FjjTh7uV5zUPNGDTdxk1cnZEFm+Ch5KMluNmy0eSTvjX
         dfahZOQCE7H9I6f0tNq1YaPl1n0nQo6hBXq+nBa4rhMmBG2bEF0TVXoaAk8P5ARfVwb5
         sj4yDzmXytHHTP9Dj+qSv//IJWsBrxlPxtiDkJNGBL7Ptys5waeAGec1mIo5T9Zl9DRs
         nTL6WS0RY8ZYeFkTLnGp95xCAHjiDIJxUlqGJHJX04b/+sphWAMV7vxZBGus2ETp24u7
         tCfpXq5/tbGMldsrwDT5i/hm82rHNYAYIcXJHUFuM+FQQiA16iNWaEiHvGqGUCMOXN7P
         RiWA==
X-Forwarded-Encrypted: i=1; AHgh+RqPASoGpFp6bjbmqlicSqFLVNgByPRxWmU+wdqrOkM6T4YNOVs+ZoWQCs9sT0CsS3d2qwL9Khs9Pn+ncu5z@vger.kernel.org
X-Gm-Message-State: AOJu0YwombXw5av9r20pRovKy3yUprO7TIoCZZSgKU+f9P7x9NF93u6p
	ERsNTO9CQF/xbjLdbnOOJsmR6a6P5dBtlblKHZZSvdVWIWFMxJofGeNJm72GRqQjS28D61WI7xE
	RWvOHYW+t1k722F0uVjAfCH0ZgABtu/M+TeE95fJEO4IrjuoLNdKgrwuJukCjv3BV4XXe
X-Gm-Gg: AfdE7cnE/XrDT2cr8LdlqAsHOaFKDGJ69I42Xz/2MUNQf19LXCBUkCmHQH7cpGig41P
	tBZzWaiwPLaWRhUpYNYSjuNYMFN6jkW/JBc7NoCtkc3XR8SBgYZF2TtUROmV/UN2KujMfJAdn4W
	ZvhwEgVsy+zIZoSqIFdc78ZJx7hfHSiH0+RTtEM0asS7zfKymfnIMD9Kl07nAyvNtyldvEcKAZ8
	YHT/1dSVg2+ezgMHg69MrcLw29Uduf6RMUmc738oWWtZEOMKPu9Z30F6N+DEsD/GKdq/KcarbaC
	MJm7SeAcmnpkxQEnv8eIt4S9uvfwotXbJ2qcJm27jhoD+shxJJkV1dqTKMMROkV7Ss+zqQf4bya
	FhVcxJR9hpq/LJF2LqOjhwJ4l4Ap9siCXWf4yRXUKyAkG+3PVQIdf3UoGTV195ux3L8cDVHVsTq
	garmP5NkmElQX0sWCcSidz88lqaN1ooJHYpizHl4Jbj8w/wYYA2YS6hmSz30Sctg==
X-Received: by 2002:ac8:5710:0:b0:51c:15c5:2bf7 with SMTP id d75a77b69052e-51cbf05b838mr164820441cf.12.1784123077367;
        Wed, 15 Jul 2026 06:44:37 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:51c:15c5:2bf7 with SMTP id d75a77b69052e-51cbf05b838mr164820171cf.12.1784123076851;
        Wed, 15 Jul 2026 06:44:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd28a17d3sm3041215a12.12.2026.07.15.06.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:44:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:44:30 +0200
Subject: [PATCH v6 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-monza-leds-v6-4-d1724bb7fe3d@oss.qualcomm.com>
References: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
In-Reply-To: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a578ec6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: teaW9obs3_AItAVDNS__782fQ9rKl0vc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX+TLdkk8vyC33
 triF1UiiVx+idgPFfcpx0bMdzOJXOg4QjvcvIwCOAHkv75kyDgZThkCqUs1uoNMhW4mxyrUpQ4J
 uhvtzkociprsD8lHEkccrR78BWvhfE85GX+xThUolOTSBWr/Gx+A/tXNQr4UcsrxgD/TRLZrxnh
 QC6mVSJjBKpeoECmm3KzoCZof7R2OLakO6G8LJ+lOj/XMe0lEO/0OY1+P6O3nldXQvJOQcHb0mb
 NrzctwqZ8enA9POO6618op1stwAHDnvvTWugd9pbCLxFAOFD/CCXRROvdRvvAWBUNHhaFP85AtT
 IEzKlwok3xeZgimVtnA6OPtD2GM2TPRZ9P+OJ6rkYuIjsZo5rwYDA0msU+SkflQa4GCc9vuuz5X
 BDOwkWiQq+0eNIoNS6ejmGUl7qxY0rKb7suxrrkKzHeB/nwhgbemj+RshcU7tW0FLKEYBvGWT+V
 iImr08nqXCk4cjmXvLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX9LqTU6lfzD3r
 pGtaq71fh2deg0Iq2BFlrckvrLw7pig44tXCurAPdntlKIFWUG6L5DG4S4yTr4i2iKNdjThozWY
 jqhwVerIiXkaXeGnGTSfdPd+G8kY3c0=
X-Proofpoint-GUID: teaW9obs3_AItAVDNS__782fQ9rKl0vc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150136
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119277-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B370675EDAC
X-Rspamd-Action: no action

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..21e32df66667eab2f882731f6ef09b7b6e29e61b 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "monaco.dtsi"
@@ -156,6 +157,115 @@ vreg_nvme: regulator-3p3-m2 {
 	};
 };
 
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	led-controller@22 {
+		compatible = "nxp,pca9635";
+		reg = <0x22>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@3 {
+				reg = <3>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@4 {
+				reg = <4>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@5 {
+				reg = <5>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@6 {
+				reg = <6>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@7 {
+				reg = <7>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@8 {
+				reg = <8>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@9 {
+				reg = <9>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@a {
+				reg = <10>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@b {
+				reg = <11>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+	};
+};
+
 &ethernet0 {
 	phy-mode = "2500base-x";
 	phy-handle = <&hsgmii_phy0>;

-- 
2.34.1


