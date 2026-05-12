Return-Path: <linux-arm-msm+bounces-107070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC9IIs/vAmrAywEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:15:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7A151D73E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D639F303594C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 09:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3F93B19BB;
	Tue, 12 May 2026 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2j/mbSr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHphshXc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410CC3AE6F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577272; cv=none; b=ks1Jk3HIsWf8vvnShrKmR/YxHU5OuNkCx9vtmX/vlTjwVGMonkUiX93Q25/SlIN6OYLQh+7WzrBXytUIJP4mvLMau65wanWjef66w+kkBRBqG8zTElRcUinC3QHTZY4go7N7P6Akv7JfzS+ncVun5MN0xIZxu5RfNGGnO5KPEII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577272; c=relaxed/simple;
	bh=zQaJ2vZQJfhFmn1P3N7/PKoFtdj7eBQEBHycwhVnXgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L0C8OP6miYKuRUg34fws3YSbe7jt6c/3eEoVTBRPFE597WxctS9Ixnm1CugnulOtY5zsY5yngQRLBef9Lip9F3CCdwepm+8pkhebWSSgZUSSfeUO4rKENAywc98LjPfwQ3OTZrlbCWKVWKNeF9CmOA6IeER0eeUFv0LlkDGgJUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2j/mbSr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHphshXc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4uchm2202322
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kAPd5R9203QWO/NECWHM00
	iyZ/Jttw1ctyc4mfSvQQ0=; b=i2j/mbSrI0EogCYTysGfHADumIXjf8yiNtuzTR
	mSMjQR6iyhG2UIoRoscgsYrpJfGcNVmzZTlL0dGV7eq8lfp+7tzAM2hLPXb0ZvTn
	Z4gTZlZIsmwvZoLMn6vjW1NR8Qhf3Vi9Nflp/BnvBudpOGv7UTA98YpJ+dU24yzI
	3d9NbSnW/fVwm28M8OsNxA5ydvGu63iVosWp7QC+zgL30ilKLj6DcmfN9YvBmm7C
	nGsN4L6/C6jzoPos3LKb8qoXVvMLpNsqiooJovrGu97zuFFnepTs5HqlWWzn0Knr
	w/E9P5Nqh2mC7yyikrlXIlV6gLlDhbiQ7TaFyx3P3tRTSU4Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuyjcue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:14:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7378ad0so39250385ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 02:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778577270; x=1779182070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kAPd5R9203QWO/NECWHM00iyZ/Jttw1ctyc4mfSvQQ0=;
        b=HHphshXcPqAyD9v8os9/XODIJP+3BySG0a56Rd6vcODQ7OKY3BRcFDdkdGgutXu2F3
         /IveYd87nLlqcICDrK73c9Qbitix7cEKOVtRmAN4QI6Fe87iYKfO8PJUlDE4r4NO53qF
         exjeqOg13bPU0ygIf25UzMlod0jKGfJioqbhvnpGPOgDAMLGBMtuZSVBGK+tR/Sj5Jge
         Z6Jx3uGZFm8t3lKu/P6hV37r22O5KZkz6ZEShTPEhmIXZXcX5Rg1Z3nZUYAW9Vd82D5l
         pNIRvNcGcj8v5sVu+viCXBCa8l8+VChikUS26hksSBv/0l/splYpkcI0oAZR5+56PAK0
         8ejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577270; x=1779182070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAPd5R9203QWO/NECWHM00iyZ/Jttw1ctyc4mfSvQQ0=;
        b=eM+ops5EmL8WFEyG9vgouvg7h7PqMv8bJBLsdpEpVDxf0pV4C79E83BeTeSU7dio0z
         949GIXLNETa5rAoZJ1vSHN/EokHjtr2SYOqfdMRHFcP1F2Uyp904bIWdQBBFbnCRwuB2
         +knu4iqTg0bdGEprtcV1Ue9elDPIFldS1yaLDl0DEN7IgKY8HMSVEgoliavN2B9mPp+J
         kexE8iHf9EJoFg/ima8Fhp0DaI/+nxD0pPXG2PJoYRp+kW5Z1iqe2YjYl2SLS3JH7bcF
         //BqnBbRN/eLMLBx7mGbJuepfIvNuNwpjtulvTxQciQZYCLMOMtvtZiaCAl/LMXG1j/b
         Rm4A==
X-Forwarded-Encrypted: i=1; AFNElJ/2dWhCGGSt4vgYEGFxFnyGX2jVdQp8psHkiMwrSvumDi58kfqPXVc/ByuVdnRMORmx4yBY1oUP4J1PuVny@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxq9sMuaOAFwgwE4bzmMcX6zTvasq5UrH/oyXJsxnpcTxEHrXw
	Y6mDyYueHWrN8kWBP77vDPNsn45Tzrx7+Lhwwtwco3zZRJHBpyVG8/QIQjRRcbh11OVqJj7Vn8h
	WYtgJRufz0Pl0Z21VubHpL5chCB2Pg1rBnwfXuJonfJC1km1VW4vzIbrJXbTnf4CjdAAH
X-Gm-Gg: Acq92OFtx8JS+KnXUTsVfyQ+ikps1k4XjsKx6S9MF2AsITgN4I9IS9t1mS2Jk0LGPZR
	EpNaGiBrK9fQyK18j/f4kRcuhN45U7/WTaTzvT8tYonm72fuWWE8BXL688zL2JCd8GFjYY3YdNb
	UOZYVaf6mwGjvKNgcPGtp3ICSK9oJTZd9jB/HugYpTC4zjrIKf/BSvr4fomFZNBN+9Fv4RhnhDE
	cKMfjzX09sVcVVYKy6Gx7oUGpTEDCKEhdfPSPZt7pcaJGxpeoS+ubXyBO1GhDiSW2rDJV4MrJkA
	sP9UO8SPlFE+0StNQMUDlKVKF6Le3+ROkHl7P68DLY5zmqC7CF41P6ml30/TzRVtCcGrIoAPmFO
	63k2qXS32hvvzVSeWrKS+3Ct+lMZ4GxCkDqcL0q1Om3ZqXeMejw==
X-Received: by 2002:a17:902:cf4c:b0:2b7:88d8:efde with SMTP id d9443c01a7336-2ba78f4e986mr271892395ad.7.1778577269547;
        Tue, 12 May 2026 02:14:29 -0700 (PDT)
X-Received: by 2002:a17:902:cf4c:b0:2b7:88d8:efde with SMTP id d9443c01a7336-2ba78f4e986mr271892025ad.7.1778577269020;
        Tue, 12 May 2026 02:14:29 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e359b0sm120292735ad.51.2026.05.12.02.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 02:14:28 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: lemans: Enable eud support
Date: Tue, 12 May 2026 14:39:26 +0530
Message-ID: <20260512091422.1395490-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA5MyBTYWx0ZWRfX0QSRllOPKSTI
 QdCKafy65KFKV1iTLUf73o9IOKfveJxTXb6kLTyofVAk5HVQP3LzIi4meNd2kyt+codR3C8+epS
 Iyc623qQCwF+Dg69tezarEdRvtd83NFXZX9NNzb5Cy5+5MRmdkhXzVa2r1vPfeDPbhiy+aJUl77
 VXpftyZ8sXz7RrNZLzLe92JNsPe8dgy7ia/Ide+svpgTuSOunz6voOC95MMIFxHHvxbPTWsWXbc
 CDeeCyk0L/4G5XyvJrZii8vVlGgHTWW//kNq4Xs3jUtY5k52O5jFBgOMNmcYNa1yW0TCQln579E
 kIbsSDbq2wNmZBwjeqZm3ORvKypfQv44jOIZWt4EjBpqJm/G3s0Ox7sQHCSJiI+QSCr0iXIZwlO
 vYCSWAq7DzJG/nfDGao8RVuJEzejj+wL6Lutuq4t4Yyue9nVde+w1ZyRIoopCkXGBM7yZ8heyUc
 xLvzZonceTjncWrKLGA==
X-Proofpoint-GUID: njaCfDtvQfczciRYwtn45Yp6-2D1s3uf
X-Proofpoint-ORIG-GUID: njaCfDtvQfczciRYwtn45Yp6-2D1s3uf
X-Authority-Analysis: v=2.4 cv=Y5XIdBeN c=1 sm=1 tr=0 ts=6a02ef76 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=6_3KF195wieaAvOcr7YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120093
X-Rspamd-Queue-Id: 1F7A151D73E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107070-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,88e1000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the EUD controller node in lemans.dtsi and update the USB HS
endpoint routing on lemans-evk to pass through EUD instead of linking
the connector directly to usb_0_dwc3_hs.

Wire the OF graph endpoints between the connector, EUD and DWC3 HS
controller to enable the EUD path on lemans EVK.

This change is part of series "Improve Qualcomm EUD driver and
platform support" and has been validated on the Qualcomm Dragonwing platform
(RB8 board), confirming successful OpenOCD connectivity to the EUD
interface. For detailed usage instructions, refer to Qualcomm’s Linux
kernel debugging guide:
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 12 ++++++++++--
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 26 +++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595..96d316867c0e 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -55,7 +55,7 @@ port@0 {
 				reg = <0>;
 
 				usb0_con_hs_ep: endpoint {
-					remote-endpoint = <&usb_0_dwc3_hs>;
+					remote-endpoint = <&eud_con>;
 				};
 			};
 
@@ -510,6 +510,14 @@ queue3 {
 	};
 };
 
+&eud_ep {
+	remote-endpoint = <&usb_0_dwc3_hs>;
+};
+
+&eud_con {
+	remote-endpoint = <&usb0_con_hs_ep>;
+};
+
 &gpi_dma0 {
 	status = "okay";
 };
@@ -985,7 +993,7 @@ &usb_0 {
 };
 
 &usb_0_dwc3_hs {
-	remote-endpoint = <&usb0_con_hs_ep>;
+	remote-endpoint = <&eud_ep>;
 };
 
 &usb_0_dwc3_ss {
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..a8ab11681476 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4003,6 +4003,32 @@ opp-384000000 {
 			};
 		};
 
+		eud: eud@88e1000 {
+			compatible = "qcom,sc7280-eud", "qcom,eud";
+			reg = <0 0x88e1000 0 0x2000>,
+				<0 0x88e3000 0 0x1000>;
+			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+			port@0 {
+					reg = <0>;
+
+					eud_ep: endpoint {
+					};
+			};
+
+				port@1 {
+					reg = <1>;
+
+					eud_con: endpoint {
+					};
+				};
+			};
+		};
+
 		usb_0_hsphy: phy@88e4000 {
 			compatible = "qcom,sa8775p-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";
-- 
2.43.0

base-commit: https://lore.kernel.org/all/20260501170635.2641748-1-elson.serrao@oss.qualcomm.com/
change-id: Improve Qualcomm EUD driver and platform support

