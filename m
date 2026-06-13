Return-Path: <linux-arm-msm+bounces-112991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tczTH8MQLWoJagQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 10:11:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F22D267E16B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 10:11:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KnQKzg5P;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ggbZZNGt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112991-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112991-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FC893167A3A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 08:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35C53976BB;
	Sat, 13 Jun 2026 08:10:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CCB3C3430
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:10:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338215; cv=none; b=hNSZqa9D546Gf6BKY3RgVOCjJBO1xW9m6qls294UcCmhezBrDF63UC+jWLNoNBJRJzoRGwPFI4/M6kyASpsdS/61bQnPxVMPIEgSQieqvIInfAf3f8L+B2+8fKXG6XGzYHiFK+akQrbgnZeYx+KvBC29wdlqsnnoku/5H7cVSfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338215; c=relaxed/simple;
	bh=bp5L5N4e5uX9KDVnsGLbH09fAwvEF/nOE8lPJ6RWh2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t4PjGY865TPC7rh4Q6Cr5wk1/AoW9YPfNEpw+eQ3kf6f1dMQce+91w23idwyEFxzmyyjfFT0QUrOcREwZzs5YZuRiw/z9Ev1FrFovNqfmdEyqQIiuOcwLEnpy8ppLyrI1Ry5FMKhxrPBWCFNXW9xFcs8cy4yOvt80dvEUAwEMUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnQKzg5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggbZZNGt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D6ebmK1760083
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=; b=KnQKzg5PO/AE1V4+
	QF6+b1QaW7bta0qOMMFLorKldndyOANFfUlvhuG74+ReHIHWXOE2INSUpeGSllJ8
	/9cGD5V06bWm/BqkNfmsbJiyvcbOB8iWnl0EfDZiX55fMoNu26intlMIdadK0ham
	9SdO05E4yPv9LkEgCzfPXo0O/Qtdu/11Zx4zo34vDUCf/1YK1NsteFijOJ4+CP2T
	vkcjaYOM/9162o07GQUX4xGO47JxnLsovBJtSn9bZ/4hpo0X4AlOXeVElQrN5K6T
	gpFyPgXK2vs8SLgd/2KerRmrgzb3AkyAtMlYkw2MzGSwPNUlGtygKxM5X0djsgDs
	y9ffqA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g80cjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:10:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84245e2bb00so1653031b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 01:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781338213; x=1781943013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=;
        b=ggbZZNGt9ORmpDkW3lbY2Q0kVbmR/h93+Iy+ay2vKH/u1vikiZ8EwAMYMyDhGuCfQB
         bRolEUsQZOF3KQe9NmoP3KyYacAlRiM2gsYnbVYKbpFu3D3zKeZNYjOcTmbbchEeBGS5
         togMsNSDbnQhwSb/Lnid1z2MpES/lK2czm4nFvKOdFmViriFuwPwoUWrtUz0ZAJ2tZWy
         IVAp6kPVTYSAxj41b6br1zt/fgr4NXP5Hlx4xMmd0rL9wrLzcIkwKeii54ImZfzm9+wg
         WKcAyOdJpoVNmPt69LJ5Gpts0/DgOu9Ji9pMPeb6LHoCQsQbnxE9py1qp0ymj4V4bAog
         jCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338213; x=1781943013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=;
        b=B3ep77f6NDiEhZFb3rl99C8JXU5DOE5w5AnP23AcPW5wlYC2B565cNtoSJhPgttw47
         DKR29C2OZr16qLzFSrJBEmmn8KhBWFJlPKaBdMHPgSR9Cr3QpwER3+sYZR7K/nuwSb9c
         TqvwWLtgODPnsyPA77I14RooMSVgfTNGjDpVeh26Eaee/9jpAzhae4XatzKJJiAK4HGn
         srFeNXNaJeEU++2uVKj0QSZyDZ9Pc5o3yfnxFf0Ljq3ffXh8j2xvngzn2qtm63Qw/L2/
         oIiYxuIEUYGiTIPztQGBcvv9vuUFLsllSGntitraS6DlQwIRTNFHXESFauOiabPTqcIw
         O3/A==
X-Gm-Message-State: AOJu0Yzat4fmVOihRL4Yje6A2U33JYjYXkjAxCJUOxLdp+c+ZGTXWYtO
	DwKlePRxt1atIVmXFl0zzbH/Oy53WZclgQaVrMVBnCXqePn2G+uBGflQqWfmkLdXHKSpl+cnKkD
	NsiHCPa31qqLHgv3HZMTuP2bHGvwqzB3YZs3nfb5EGKBP5n/0yLKAx0nZG9gVKzEQowcI
X-Gm-Gg: Acq92OGe+mkgjcQPbTmb/BPA1v3USy4uHvhIkQy5hxqpZPC8zl8k7n3oq7KBur7oPTD
	oBnxSp/2l6H1tLmpf81hHLCfKu3iHVBlKjMA3KtWnX8mvCCy1mRQ/gR5jLEjL9C+Rd4blfTYU//
	64cUM5fUIO+WdY9pds8eH+wLdWWZYn6B1Mbtu37VH/xaRMKdvywulDpon8vzQvxTelnRPCRaL9p
	nWXPJlJg2jK/fF+ZFnyR0Y5gkmKavfGln0YeQFExJaob+/HMM/+VddNJjYOh8SVNhm4ZcQ+oQtA
	v9e/2JT3cS01bjZ29I3MU/mOpjMx3WKBFo9Q8EkbuUlzisFj+XccrC3/lw0uVysiV1hUCxlX0M9
	nHTPkfjFByS4E0Bp6K+m0hKlpcGUaBbD4FZ3m63tF
X-Received: by 2002:a05:6a00:a214:b0:841:edb9:4ea2 with SMTP id d2e1a72fcca58-8434cf40b22mr6772619b3a.32.1781338212779;
        Sat, 13 Jun 2026 01:10:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:a214:b0:841:edb9:4ea2 with SMTP id d2e1a72fcca58-8434cf40b22mr6772597b3a.32.1781338212352;
        Sat, 13 Jun 2026 01:10:12 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9dc5esm3926647b3a.10.2026.06.13.01.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:10:11 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 13:39:24 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: Add PMIC thermal support for Shikra
 IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-shikra_adc_support-v1-4-57d5e6c7f47d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781338189; l=3374;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=bp5L5N4e5uX9KDVnsGLbH09fAwvEF/nOE8lPJ6RWh2Q=;
 b=nWtpNRJC/b9ocMTxw7wsE9LPeekBLfiAxalwfFC9YehFAM4cC+XUlyIGaMzgNBaPkOKYvk8nI
 SQaPYuHDcWDCkfF+mNixcGq5zUi62OX+6sti0h7WaStlEPTI0aIkhE5
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2d1065 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eSwfGQiZR0SxMorl76cA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: fTcjL-35fCnP541LYlGSd5fuhEJmNnD9
X-Proofpoint-ORIG-GUID: fTcjL-35fCnP541LYlGSd5fuhEJmNnD9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX5i0dmC/WNL02
 S0CApP7VxvEM9hALMgpDy7/3dOeVGbYIfN1nd8nF6Mq6qaflVsTkjqQYGyMeTooz0rjxZz5bjtQ
 6iVrINqOS3KEPceJBrl0Jdl5pIImwXM6bwVegwNQxHOoPV66bRjQCs01Gor6uIvSA0lbPRhxaPX
 yJb5aprjmW9dTUaRjcaZrZEmTkhfCYdnkk6HHmNd92O2NMGdIXotxQdhqz38QKpx2I97gNWFhLb
 C21iH58jeo1S88OrgExjOtWBtKRYuHQReU/S3xx8BKEUEgbNdCsy+DMr1HR7sBlqkQu0tLZ0Alm
 Bh4a1sEMc29PZQhsiG9zHPEayKLp5qoOBEnxLNQQARGZnzkHsV4tPpVj9Gu6o2DhihztVqfvPz1
 /8bzJVpjkJKLsVvfCdswZnv6DduvxkkQQRFMHyt011lh3h7YwZQNUH9ry81Tje14pIalGK7aoOO
 pHL3iA8hDLPER/Phc3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX4+qmLcQ8dS14
 xCUHJRYv0hYq5ykHkRh0kRaT477HDCzyDY/i+XqCKa52rKHVPPM9zUipperkFhM1RfXe1tPiAFL
 Eymngei1dglBAZlKErOzgkYaV5olUyw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112991-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: F22D267E16B

Add ADC channels for system thermistors, used for thermal mitigation.
Add ADC_TM nodes for pa/quiet/msm thermistors and also thermal zones
for them.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 +++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 73945bf42112..9ab0b44b00be 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -26,9 +27,121 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	thermal-zones {
+		sys-1-thermal {
+			thermal-sensors = <&pm8150_adc_tm 0>;
+
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
+			thermal-sensors = <&pm8150_adc_tm 1>;
+
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
+			thermal-sensors = <&pm8150_adc_tm 2>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+};
+
+&pm8150_adc {
+	pinctrl-0 = <&pm8150_adc_gpio2_default>, <&pm8150_adc_gpio3_default>;
+	pinctrl-names = "default";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "msm_therm";
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
+	channel@52 {
+		reg = <ADC5_GPIO1_100K_PU>;
+		label = "gnss_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "pa_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+};
+
+&pm8150_adc_tm {
+	status = "okay";
+
+	pa-therm@0 {
+		reg = <0>;
+		io-channels = <&pm8150_adc ADC5_GPIO4_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	quiet-therm@1 {
+		reg = <1>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	msm-therm@2 {
+		reg = <2>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
 };
 
 &pm8150_gpios {
+	pm8150_adc_gpio2_default: pm8150-adc-gpio2-state {
+		pins = "gpio2";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
+	pm8150_adc_gpio3_default: pm8150-adc-gpio3-state {
+		pins = "gpio3";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
 	vol_up_n: vol-up-n-state {
 		pins = "gpio6";
 		function = PMIC_GPIO_FUNC_NORMAL;

-- 
2.43.0


