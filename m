Return-Path: <linux-arm-msm+bounces-111771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IhlNLqGKJmq9YQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:25:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9CE654949
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:25:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WYzn5vz9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=caWLEW9S;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111771-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111771-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53648304BE66
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485C33B5826;
	Mon,  8 Jun 2026 09:17:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C901B3B6347
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:17:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910242; cv=none; b=CjVjRpvRtuh8W7OCcDJ0dztydwz0+uRDvvSfsCyqbRYxyeLtM27HwydzdHofFGjln3OgogCz0jyf+nEE8hzlrRJXJS4NyoeIPwWbcJCPDMruzLKM9ekhrCXo5tgyawu0sMg92eeXG2bAI4RuDACs2YpFuyTGo9a1v+WTupa13K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910242; c=relaxed/simple;
	bh=16BwiGEPkH7/ysMphuATLsStlnhNmZN3HHL+C4F1suI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z2fKzBJe/m8ySwa4ga7kdYsDfpLjIP42Gu5Kx3NIxRECMLHyV1iTqfvOZOKSiq/WI5t1lwSLGfLxAfYXcCsiBdrucnN2kuByjdJ9uGMNfbLEec3Uf1qi3joqC+c0kAxEtZiNowMwqTKuIAWZtEHaq+bX54hsWOYds1dtsg7rqf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYzn5vz9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caWLEW9S; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Olpn2801706
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uVhpj0+3qsx
	pWXXMLqCXAXZjOaczXJToUdmPlt0GToY=; b=WYzn5vz9NrNOXSU/wnwqrfCokqn
	knQnWkbaAonetqy+597gTMonwfFoGBh+N/SskssGZMSyemCeHTto9s+BTSqPsX6Z
	ltHIILFFuANXWOgTneC2BWyxpC4WZ6+uRHzDrDOFGIO91y3Zsh85NZTFZNlQvtZi
	KVesC09TeDWu8sMg625Yv1tKf9c7VMI2XLoca1LCdLo/CkcDciNCaz2Zkku4KuiS
	hGo8ybv+qoK0PCoYIDavIqcl5o8/9H9Zg4M+OtlESVHcd2bu+GIpbnS7IaOJDGIT
	a1h/AWNxyglmoszYAuND7YVyDzKwAtfzC7yMm41J2mM6rVZdqt5tcfhM9JA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3qegv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:17:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-13825f68028so51678c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910239; x=1781515039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVhpj0+3qsxpWXXMLqCXAXZjOaczXJToUdmPlt0GToY=;
        b=caWLEW9SxuCHxUTR4SgDNNo7xK2GF2P0GFRv9cPlgI6Ruodb80doMjpTrI8YUdMTu3
         TO6RoVkP7SYZusJ57BRblzDy73F5BuQmEtfnGs/LSIGh8VIsFe4JV8sDufcjhZ00Nmah
         a/T8GnHXLhi07WahpLJI3kL34Rr3DEVlfTk5qoKYsDwmcMbn8XgWZ0hn7ZMu59rJ+iLG
         3uBqvWTffOTcj0R4PDrSLDy2pngsWgwpcNkW8aA90lsBh57PUfIQJvUtMwJGbjJaP6Ku
         vSe/bDD8nh08b1DoG8J8Kf2+TDcKWgIRIRlTMY/GHpA5Fjc7eXxtLo8PyZr1PvM5uXMU
         6qFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910239; x=1781515039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uVhpj0+3qsxpWXXMLqCXAXZjOaczXJToUdmPlt0GToY=;
        b=C+AI55il6g1TSoTEhkLYGTS8deHJoxa0NJt5PTOH1jnCs/Z5dHi9nN7eSqLBW6jouc
         8NBjVkXbWGDWdLiQ/8gE4Lzg0rY6cxmnEe89aCIC2muJ/78KEfp9OPxpz2NwsaPUU5n0
         tuxc1IkoKRR0+JJMxjyv76PmZAdeqrY6dw4+M2Q86g4uuCqM6qv/mr2U7nLnTcHZTN9i
         9S4R+N4tDc7F/cmpiudy2wSnThODMi+EZByr1d/saPbASmr7FJuwYZFSVVogiYBVgTIA
         Dj3zKVPSrWlWYwlP/QE+KHaOERabCKwGsWSPqTvEmn3M8w1VFAWvqsu4vLHoxgUGUxeG
         HD+g==
X-Gm-Message-State: AOJu0YwKQQAMMvSZUOzYlO7P6pLxPcSj1gfrxTYpUYwoaccj3ooFy8qt
	HsuMptBE6gfEhqJKO81xjnDyquqAJpIjE0+wlfx+7so1hY1KuUuQUtN82C0ebmi+owI/00WvD3m
	os9v9DAskZjC377IWs/MGvJhD65S4NaMWjr6P7Y5TDZL8mqLEIwLNs2iX2T7JQhKYbwJa
X-Gm-Gg: Acq92OF1RP2VXJJlnwpwF4TzJl4mdxrSr7X4AF2j43nlYPCMGT2c0ZVfOVAypiFJ04G
	mu8F/NePk5Hj+aQDhKZevO46TFQ51LOthrhyYknoGZpj7EDJUCglwpLdM9LwUPJsiXsCx5XVxZZ
	R9Sqa/O0j9mAnXxT9cTMPTEs/zDi0AtZg1XLv54EHsWyYsV9ic3nVc70FhD90x2Kq369AjrT6gA
	z9hJsRvIwBh9Q0HY4Cs8WMkXeGkZVMrDoweRrQrAEf8gj3kLMgz7ftkYvJ5MwV1rxEpXykwaDS1
	lUGyFmtE9UvQD5tW9GwF0xFR/jyvs47OXQPK4tGRNEFXvtV+RS4ZA9YhdZ3hCtoZULadosq6I75
	oFTPouVGdG8nlhDikbGvQMmOczBOFdo4D9KH++vdSrh/C83Ezl9VCs5ODCSWb5IQDahfjHB6aRt
	tgeraRJYQ=
X-Received: by 2002:a05:7022:407:b0:134:d037:aca3 with SMTP id a92af1059eb24-1380676bfb6mr2783434c88.3.1780910238665;
        Mon, 08 Jun 2026 02:17:18 -0700 (PDT)
X-Received: by 2002:a05:7022:407:b0:134:d037:aca3 with SMTP id a92af1059eb24-1380676bfb6mr2783425c88.3.1780910238094;
        Mon, 08 Jun 2026 02:17:18 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5550bcdsm12178656c88.14.2026.06.08.02.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:17:17 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Subject: [PATCH 2/2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector
Date: Mon,  8 Jun 2026 14:47:02 +0530
Message-Id: <20260608091702.3797437-3-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
References: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NSBTYWx0ZWRfX6GBgY9pNS6Yd
 m/MZLJn/U18hB5wdCv7hNFrtI+XTSjPqYsxL1xNI7HtEZktYGMX99hs/jePcYuyVohN7CaBOJML
 5AscKwOxDWp7wuQK4q8YPxBOIdUF17jAheh4rDwXl/t/kbyX4OPZSwyJGCK4zTL28lVxt+CAlQZ
 HJrZko/ZP0grD9vHzME2eITuOjtPlT3sXc6y76fqnMlLk9QXTyf/rSdwmPDh9dyX0/2wRr8IZLw
 Nkqn+SA/3c3JsnHbtlGNmuh9WT/BdTxpEW+aWh1CZlp66xBEYlGXlwD4yA/HJMoRj62SM1xR8tq
 rOxkVkeHe3W3oiBdxKeQ/Zt7rJyKSWvcInAkMlbkeRh584YArPlFoJXQdgg6czlKp+kOYwB75ty
 D4blAqo6Gr06CZKoUZyBPMWUEWnPBeUbVFiBd+pNipjfE3nY8ozUMKLP+6x/WGf+EnRad28ed6+
 6uJD0ddd+xA5HaPe/eg==
X-Proofpoint-ORIG-GUID: nSENK25PDnQFMzkKk_6TYE41JQx8qI3-
X-Proofpoint-GUID: nSENK25PDnQFMzkKk_6TYE41JQx8qI3-
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a26889f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Z7u2DObkEaOzrTdwhUcA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111771-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C9CE654949

The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
UART17 nodes through graph port/endpoint.

Also add 'compatible = "pciclass,0604"' to the pcieport0 node in
lemans.dtsi to allow the PCI subsystem to associate the DT node with
the PCI-to-PCI bridge device.

The M.2 Key E connector is powered by a 3.3V fixed regulator
(vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
(vreg_dcin_12v). Both regulators are always-on and are required by the
pcie-m2-e-connector binding.

Also add the serial1 = &uart17 alias, which is required for the
Bluetooth serdev device to be enumerated on the UART17 interface.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 75 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  1 +
 2 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 34dfc8d22b6a..b2967cb53760 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		mmc1 = &sdhc;
 		serial0 = &uart10;
+		serial1 = &uart17;
 		serial2 = &uart0;
 	};
 
@@ -88,6 +89,38 @@ usb2_con_hs_ep: endpoint {
 		};
 	};
 
+	connector-3 {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcieport0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart17_ep>;
+				};
+			};
+		};
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -178,6 +211,17 @@ vmmc_sdc: regulator-vmmc-sdc {
 		regulator-max-microvolt = <2950000>;
 	};
 
+	vreg_dcin_12v: regulator-dcin-12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_DCIN_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_sdc: regulator-vreg-sdc {
 		compatible = "regulator-gpio";
 
@@ -191,6 +235,19 @@ vreg_sdc: regulator-vreg-sdc {
 
 		startup-delay-us = <100>;
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		vin-supply = <&vreg_dcin_12v>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &apps_rsc {
@@ -742,6 +799,14 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	port {
+		pcieport0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
+};
+
 &pmm8654au_0_pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";
@@ -970,6 +1035,16 @@ &uart10 {
 	status = "okay";
 };
 
+&uart17 {
+	status = "okay";
+
+	port {
+		uart17_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l8a>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..9afd6e8ebcdb 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2779,6 +2779,7 @@ pcie0: pcie@1c00000 {
 			status = "disabled";
 
 			pcieport0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
-- 
2.34.1


