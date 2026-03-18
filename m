Return-Path: <linux-arm-msm+bounces-98458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Do8FqWdumngZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:42:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0592BBAC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBE5E3027362
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDFE1A9F91;
	Wed, 18 Mar 2026 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6Bv47XU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+lVgcvE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9125A3D6CB9
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837682; cv=none; b=EDmIUhdfpupzX+qgUGCbfPUYv7zaXOcuuMFk4QhhM94zV/PEwXR4omVxy2CU/COzQuq8f+v3qk1j/haNrBzA9kviGodCYR/TthB5ENNjKBZYGiixdb0+m911N2mVtb9iB7qgs5oOMheuzxYWqcxRXj5N0InQnpEVEtJrNNwPXm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837682; c=relaxed/simple;
	bh=gq3GRU07OiVzXRDbORYmB59Wo9kFN+asNf2aad6hpvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ai4qnkZ+1dtMr30hRhhwElc0JdaPpyXmKy7/e8k0r0gjMA8BjzwUelLw8N0oEIp0KuXSyASTn7cs8TWCC64SZzWLjzgPSKvY8F686fbBKrLJBTYykCWCe066L5FNdq2Asxh16q7E1WQo9XbWWA/eaaXKP+Ywa27NKYt0eTtGy/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6Bv47XU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+lVgcvE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IBBACu320117
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zs504dbaWka
	zNB1r3EYrSBuZly5N8YBYHRPiLtoDqzQ=; b=k6Bv47XUdfYTySDrLRFpXqKc2HI
	P9kg7f5/RYqpJjx3Z8659MuNVQcXDJOy1Xl2B6q1R/2v1SIiRSIWtyPfJNl7Xhy/
	HqCfSeAxiaJavV5nc10b8vTj6ItadipEIdj9sCAojAvDO8DrMkF+YTXSOrdl7qX5
	k4Iw3vBCkaAbRO17XZrIB5DaInoCMiIvvZbN5wNWK1Dwyk9/KwAqaRbi+rXnV97/
	8UbwyrmkkQY8o7dMFeZDxzLCbo55CjwLqZ8XC5afMsMEh+aYCY6SpTx/aac+vP8H
	cQetHtZPpO0WhU9dFrbyTnbJZZYC/6ivq+apmZpKfC8hfZlGw0HOk5pAA5Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyr91p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:41:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0c85c38acso1708809eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 05:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773837679; x=1774442479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zs504dbaWkazNB1r3EYrSBuZly5N8YBYHRPiLtoDqzQ=;
        b=b+lVgcvEtWX+8Afo+rs4+QU1NxCyIWGx3x1VoEZPx5xUdffzGXALPVfopBE8+q5u65
         REFXpu0wEGD4ZXr8RHdWNhyI1RdWQPYvOCaB+t5GYmwJFBISoI+zevnqxa62zbT/HOOd
         g1Sjq9vcFdYOXs8pF6E4KGh0euGqwBl+kxWmHv6zg5N+hAQoz+kA7VQ7KGDzoSkjZgvK
         +CDHKxYAH9rfCyVyfAUFKOHHyNSui7npRYyYE0VNHjWhhB0kWePu6rmou8FV6m5TjKqn
         CtYiD/bmD6eb8FB9YF6RfkyGLuKw+AOOeEvCxECDMNFUjOIaeBofyLjnT9Asjx3K9lsp
         A0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773837679; x=1774442479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zs504dbaWkazNB1r3EYrSBuZly5N8YBYHRPiLtoDqzQ=;
        b=QFKYepbvHDVfjnBPyVMwYk/h3KLnR8FGdeubSq58MQWS4Vg62bSDvEweY3gzBQfI1z
         JPXLOEA+NLwHbGHbWnwof8SRunZ7Z5G+rtWW1zKJANYpAmbfT07mplXxpiifL7Ut9r+F
         6W5WGtetJpQnPQ+IjR6q7Xwq/wInKhApi0fSc9DTFfIRDHt28YB3Ivg05fLXzLWpR/a+
         9Aeh4+D4T3mIryACcPUNP2gZAezJbuHs2HHyyDifNJUtR+M9vkpVYnL6R1knUaKXKzpi
         ZzleaYkAKPoMHf305tkAvfyQA3vEqZJ1qfLRfqXOFWqW+ePIAUMLVO9nO7DoxvVrspJR
         XjmA==
X-Gm-Message-State: AOJu0YypX1UQfnL4VAf0CRMJMuPoHvQLBSvZgzMPsLW7ArgfH8XauLi6
	WMJvTfuoA0uBro5jg1znseINVq41mYkCh6cSjM5j8u6IaDqFe4JLi2jzxk2JuH3EwP3Uht5iQC1
	lsDSYJfgw6m9va74rJ1ltZkTEDFqrmWnfdDjCAW0UKiA/y8RX2RO/oCTR10Vg4Gz3Qh1Y
X-Gm-Gg: ATEYQzw7iM+1rWwmKpI+DI8AxRSHan8Lv+7zWyXcMYw0kVgl2k9wzyxk92+ORvQQTCH
	UB/RPJii2WsADGgKDu6SUGgbrIBmimEFYF6JOHIbOG6Si/8K3Hr4Jsu6g5g3MIDTkbA22RIWzdH
	eEKnvKWQc41e4ocv151f5ilHbxF7TYHrW1d7gl+KUvePkSV57ikP/O29azbSh8LLxJuVDAImRUI
	oRQ9tGqfdZ9aHziPU9Slpeg985ZeOEP1+1Tq9xVKzvsrMxs+cOBaTfiGC1moPBYvwObeb52m2IW
	KaR40655ctxfhPMFMOnwGBZkm0s/X9oE8Kiu4ywNO2BuVkD7/mQQ47cUVMIHCL7WXTOovpdMm3w
	bWqMQ/+QGx1K9xMC3u8LS37IpV9IRwmTPr9g8LqarZ1LpvkP3C+75zjssn2ZfkOJUTq3lCWzU6F
	F4ZV/n5ZDJeQ==
X-Received: by 2002:a05:7300:caa:b0:2be:290c:8ad5 with SMTP id 5a478bee46e88-2c0e51bea18mr1454675eec.23.1773837678678;
        Wed, 18 Mar 2026 05:41:18 -0700 (PDT)
X-Received: by 2002:a05:7300:caa:b0:2be:290c:8ad5 with SMTP id 5a478bee46e88-2c0e51bea18mr1454653eec.23.1773837677900;
        Wed, 18 Mar 2026 05:41:17 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e53b5fa1sm4454521eec.10.2026.03.18.05.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:41:17 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        pankaj.patil@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com,
        qiang.yu@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: Commonize Glymur CRD DTSI
Date: Wed, 18 Mar 2026 05:40:59 -0700
Message-Id: <20260318124100.212992-3-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318124100.212992-1-gopikrishna.garmidi@oss.qualcomm.com>
References: <20260318124100.212992-1-gopikrishna.garmidi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9edlHHgtxy9y4imnjy4M1T83nxxhPbqy
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69ba9d6f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Lx9aQ9xY3w96JebXmp4A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEwOCBTYWx0ZWRfX8np3MT3DDVL3
 ZSXqI1VojxAQFA/rfolnO522rFU9RtvGu/hOW3TLs44yrYXgemXGfja2OslOqx6ZLhI8xaflSGX
 KM6yyMr3/5rVk2RlXCFvsfiBU5Mabuv/iamEdshKxlQObs/LLjb267LtQ8fK+mEQnRJ73o7hiDj
 IipnVIpphM4bAhRrO2gn+USZ/zyMbt9CEKHTke0siHQ52txND8uZ8aerMHSG4UkMxBfdmvMzUdg
 qXS3xw8/ikzQ97QUTbCf16muPsHuuwY66RwM+4M6e+v/zVoIEzInu/PB5DCQCTgDdLcCKZheOG7
 HX7TPvlqJuPqrgxpGqs3G+jNgrOCUGU6yMpJpPK3xDwvh6vPQULt+Ruo/bjmfgNCVzkT3tye37N
 plcptgQS21mlAX8H62VmLd9XW7/FSvBpmjKHCI1ZYY81VG/fsWwtoddsbXN3Bx7cNhbO6QjZ5Mn
 J9SGHxyQMake1r+xghA==
X-Proofpoint-ORIG-GUID: 9edlHHgtxy9y4imnjy4M1T83nxxhPbqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180108
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98458-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC0592BBAC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commonize the existing Glymur CRD DTSI to allow reuse with Mahua CRDs.

Leave the PCIe3b nodes disabled by default, since the UEFI has the instance
disabled to avoid boot delays due to link failures.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts       | 586 +-----------------
 .../qcom/{glymur-crd.dts => glymur-crd.dtsi}  |   7 -
 2 files changed, 1 insertion(+), 592 deletions(-)
 copy arch/arm64/boot/dts/qcom/{glymur-crd.dts => glymur-crd.dtsi} (99%)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 877945319012..0efd9e27c82f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -6,593 +6,9 @@
 /dts-v1/;
 
 #include "glymur.dtsi"
-#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
-#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
-#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
-#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
-#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
-#include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
+#include "glymur-crd.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Glymur CRD";
 	compatible = "qcom,glymur-crd", "qcom,glymur";
-
-	aliases {
-		serial0 = &uart21;
-		serial1 = &uart14;
-		i2c0 = &i2c0;
-		i2c1 = &i2c4;
-		i2c2 = &i2c5;
-		spi0 = &spi18;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	clocks {
-		xo_board: xo-board {
-			compatible = "fixed-clock";
-			clock-frequency = <38400000>;
-			#clock-cells = <0>;
-		};
-
-		sleep_clk: sleep-clk {
-			compatible = "fixed-clock";
-			clock-frequency = <32000>;
-			#clock-cells = <0>;
-		};
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		pinctrl-0 = <&key_vol_up_default>;
-		pinctrl-names = "default";
-
-		key-volume-up {
-			label = "Volume Up";
-			linux,code = <KEY_VOLUMEUP>;
-			gpios = <&pmh0101_gpios 6 GPIO_ACTIVE_LOW>;
-			debounce-interval = <15>;
-			linux,can-disable;
-			wakeup-source;
-		};
-	};
-
-	vreg_nvme: regulator-nvme {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_NVME_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&nvme_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_nvmesec: regulator-nvmesec {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_NVME_SEC_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&pmh0110_f_e1_gpios 14 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&nvme_sec_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_wlan: regulator-wlan {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WLAN_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&wlan_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_wwan: regulator-wwan {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WWAN_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 246 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&wwan_reg_en>;
-		pinctrl-names = "default";
-	};
-};
-
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pmh0101-rpmh-regulators";
-		qcom,pmic-id = "B_E0";
-
-		vreg_bob1_e0: bob1 {
-			regulator-name = "vreg_bob1_e0";
-			regulator-min-microvolt = <2200000>;
-			regulator-max-microvolt = <4224000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
-		};
-
-		vreg_bob2_e0: bob2 {
-			regulator-name = "vreg_bob2_e0";
-			regulator-min-microvolt = <2540000>;
-			regulator-max-microvolt = <3600000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
-		};
-
-		vreg_l1b_e0_1p8: ldo1 {
-			regulator-name = "vreg_l1b_e0_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2b_e0_2p9: ldo2 {
-			regulator-name = "vreg_l2b_e0_2p9";
-			regulator-min-microvolt = <2904000>;
-			regulator-max-microvolt = <2904000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7b_e0_2p79: ldo7 {
-			regulator-name = "vreg_l7b_e0_2p79";
-			regulator-min-microvolt = <2790000>;
-			regulator-max-microvolt = <2792000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8b_e0_1p50: ldo8 {
-			regulator-name = "vreg_l8b_e0_1p50";
-			regulator-min-microvolt = <1504000>;
-			regulator-max-microvolt = <1504000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9b_e0_2p7: ldo9 {
-			regulator-name = "vreg_l9b_e0_2p7";
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <2704000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l10b_e0_1p8: ldo10 {
-			regulator-name = "vreg_l10b_e0_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l11b_e0_1p2: ldo11 {
-			regulator-name = "vreg_l11b_e0_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l12b_e0_1p14: ldo12 {
-			regulator-name = "vreg_l12b_e0_1p14";
-			regulator-min-microvolt = <1144000>;
-			regulator-max-microvolt = <1144000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l15b_e0_1p8: ldo15 {
-			regulator-name = "vreg_l15b_e0_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l17b_e0_2p4: ldo17 {
-			regulator-name = "vreg_l17b_e0_2p4";
-			regulator-min-microvolt = <2400000>;
-			regulator-max-microvolt = <2700000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l18b_e0_1p2: ldo18 {
-			regulator-name = "vreg_l18b_e0_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-1 {
-		compatible = "qcom,pmcx0102-rpmh-regulators";
-		qcom,pmic-id = "C_E1";
-
-		vreg_l1c_e1_0p82: ldo1 {
-			regulator-name = "vreg_l1c_e1_0p82";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c_e1_1p14: ldo2 {
-			regulator-name = "vreg_l2c_e1_1p14";
-			regulator-min-microvolt = <1144000>;
-			regulator-max-microvolt = <1144000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3c_e1_0p89: ldo3 {
-			regulator-name = "vreg_l3c_e1_0p89";
-			regulator-min-microvolt = <890000>;
-			regulator-max-microvolt = <980000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4c_e1_0p72: ldo4 {
-			regulator-name = "vreg_l4c_e1_0p72";
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <720000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-2 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E0";
-
-		vreg_s7f_e0_1p32: smps7 {
-			regulator-name = "vreg_s7f_e0_1p32";
-			regulator-min-microvolt = <1320000>;
-			regulator-max-microvolt = <1352000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s8f_e0_0p95: smps8 {
-			regulator-name = "vreg_s8f_e0_0p95";
-			regulator-min-microvolt = <952000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s9f_e0_1p9: smps9 {
-			regulator-name = "vreg_s9f_e0_1p9";
-			regulator-min-microvolt = <1900000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f_e0_0p82: ldo2 {
-			regulator-name = "vreg_l2f_e0_0p82";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3f_e0_0p72: ldo3 {
-			regulator-name = "vreg_l3f_e0_0p72";
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <720000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f_e0_0p3: ldo4 {
-			regulator-name = "vreg_l4f_e0_0p3";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-3 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E1";
-
-		vreg_s7f_e1_0p3: smps7 {
-			regulator-name = "vreg_s7f_e1_0p3";
-			regulator-min-microvolt = <300000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1f_e1_0p82: ldo1 {
-			regulator-name = "vreg_l1f_e1_0p82";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f_e1_0p83: ldo2 {
-			regulator-name = "vreg_l2f_e1_0p83";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f_e1_1p08: ldo4 {
-			regulator-name = "vreg_l4f_e1_1p08";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1320000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-4 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "H_E0";
-
-		vreg_l1h_e0_0p89: ldo1 {
-			regulator-name = "vreg_l1h_e0_0p89";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2h_e0_0p72: ldo2 {
-			regulator-name = "vreg_l2h_e0_0p72";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3h_e0_0p32: ldo3 {
-			regulator-name = "vreg_l3h_e0_0p32";
-			regulator-min-microvolt = <320000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4h_e0_1p2: ldo4 {
-			regulator-name = "vreg_l4h_e0_1p2";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1320000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-};
-
-&pcie3b {
-	vddpe-3v3-supply = <&vreg_nvmesec>;
-
-	pinctrl-0 = <&pcie3b_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie3b_phy {
-	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
-	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
-
-	status = "okay";
-};
-
-&pcie3b_port0 {
-	reset-gpios = <&tlmm 155 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 157 GPIO_ACTIVE_LOW>;
-};
-
-&pcie4 {
-	vddpe-3v3-supply = <&vreg_wlan>;
-
-	pinctrl-0 = <&pcie4_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
-};
-
-&pcie4_port0 {
-	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-};
-
-&pcie5 {
-	vddpe-3v3-supply = <&vreg_nvme>;
-
-	pinctrl-0 = <&pcie5_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-
-	status = "okay";
-};
-
-&pcie5_port0 {
-	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
-};
-
-&pcie6 {
-	vddpe-3v3-supply = <&vreg_wwan>;
-
-	pinctrl-0 = <&pcie6_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
-};
-
-&pcie6_port0 {
-	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-};
-
-&pmh0101_gpios {
-	nvme_reg_en: nvme-reg-en-state {
-		pins = "gpio14";
-		function = "normal";
-		bias-disable;
-	};
-};
-
-&pmh0110_f_e1_gpios {
-	nvme_sec_reg_en: nvme-reg-en-state {
-		pins = "gpio14";
-		function = "normal";
-		bias-disable;
-	};
-};
-
-&pmh0101_gpios {
-	key_vol_up_default: key-vol-up-default-state {
-		pins = "gpio6";
-		function = "normal";
-		output-disable;
-		bias-pull-up;
-	};
-};
-
-&pmk8850_rtc {
-	qcom,no-alarm;
-};
-
-&pon_resin {
-	linux,code = <KEY_VOLUMEDOWN>;
-	status = "okay";
-};
-
-&tlmm {
-	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
-			       <10 2>, /* OOB UART */
-			       <44 4>; /* Security SPI (TPM) */
-
-	pcie4_default: pcie4-default-state {
-		clkreq-n-pins {
-			pins = "gpio147";
-			function = "pcie4_clk_req_n";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio146";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio148";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie5_default: pcie5-default-state {
-		clkreq-n-pins {
-			pins = "gpio153";
-			function = "pcie5_clk_req_n";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio152";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio154";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie6_default: pcie6-default-state {
-		clkreq-n-pins {
-			pins = "gpio150";
-			function = "pcie6_clk_req_n";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio149";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio151";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie3b_default: pcie3b-default-state {
-		clkreq-n-pins {
-			pins = "gpio156";
-			function = "pcie3b_clk";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio155";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio157";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	wlan_reg_en: wlan-reg-en-state {
-		pins = "gpio94";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	wwan_reg_en: wwan-reg-en-state {
-		pins = "gpio246";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
similarity index 99%
copy from arch/arm64/boot/dts/qcom/glymur-crd.dts
copy to arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 877945319012..abc6cc8bb0a8 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -3,9 +3,6 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-/dts-v1/;
-
-#include "glymur.dtsi"
 #include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
 #include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
 #include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
@@ -372,15 +369,11 @@ &pcie3b {
 
 	pinctrl-0 = <&pcie3b_default>;
 	pinctrl-names = "default";
-
-	status = "okay";
 };
 
 &pcie3b_phy {
 	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
 	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
-
-	status = "okay";
 };
 
 &pcie3b_port0 {
-- 
2.34.1


