Return-Path: <linux-arm-msm+bounces-90623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGULBTX7d2nlmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 00:39:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C00748E3FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 00:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA569300F12D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 23:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0CA314D0C;
	Mon, 26 Jan 2026 23:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NymbFCmg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJW9rksQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF923148AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769470723; cv=none; b=OjxQvk3muml5xftR2mAmHF9SE15ghBPViIVqPgps1EPGYss0BCD2ojiOHIKzUOtcS/s3+zWwmGhadrZbLtt/VG7X4wb+PIjw4dvfdWryzT2bLbd3AZLYArW8A/8RaD2Yc0xkz3Q69WT4I1S5G7K3Xj13jMrCpoWR7duPY8AMJv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769470723; c=relaxed/simple;
	bh=v0VM1AbyGegd/JoyrZJcZY3z0tITTBhEtE8yYszRho0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F4wLLLSey5qAYtFdyJ6uJU8RFFeFbDl5lPcdCmmPdHM9K7EUKevp/c8IZU1hv7AqFSgYUklSZ1B60H0xgRApq3v3srpnzxkCI7d2bVtVvQlGiuoX961quHfA/H/HoeD55IxaEyvNoK0jdaedk988m0OSZ4I5yVrdW9/rbSvA2uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NymbFCmg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJW9rksQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgIZ22733187
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LXiIQXFkT2b
	H+u++kC00u044e73Da6D4+783FXlcB7Q=; b=NymbFCmgvNkhZ2EoeEzvpwBW01l
	304XUNFrggGPI9tlhFt74mKAYe/G5qYGiMdEWJOKyYz2cNHH0mPpAdDyXWBLPtWf
	t3Ki2SYpOU5FKlYTpbAkkPpfp9TOrbJLQqihJ/rzGG7LjvPsoJt/r8yptmCTD+3d
	OZDBnXWV3LkJf/tkG/xhWM0+arB8vk9gVbFvQqkSIHl8lNY21NvJpdcaP7nRL0dt
	0NueVwpI5E+kvVw8Va6sT/nnztsv4r9DYpV8LDRExERfuqyzB53HNuHcgDHvrHr5
	4rMjddspkpxLqKFcNaxqJSMD2Hqx5lhMUZ15vm/yEgXUsI9iZ0AxflRRgkA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv08qpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:38:40 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12339e20b66so6505671c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 15:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769470719; x=1770075519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXiIQXFkT2bH+u++kC00u044e73Da6D4+783FXlcB7Q=;
        b=bJW9rksQcclC3qhqJlxMNcFxzGJ25sJQ7ZOV0GCBRwWsmFUp4aYfN0NbrZikAVlaU/
         n9i9XmzIlJ8tVzjPMPPrRQf78gU24JIQ92KEOxNOkC/gIoOMAK6t3vhiBtRdV4UhZdAc
         8u+/t3SULMkITuUPMicPcoPNPqn0nyvCRDK1mSgENqfQkVU1X7vp1cJG2Ag1lkRJBFVv
         DV5bnUIZm4bWn+WvjAxgjdCqp7Q42zlztt3hnQ/ZOiJRvCxfbbj5LH54jU5g5ApPV+LW
         dtdGPf9pQp/IuNyxwXzn6xqDb+uczKbkYpCcvsG1e/YJwwba+tMJtI7DXIbSVRl6OMIf
         uDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769470719; x=1770075519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LXiIQXFkT2bH+u++kC00u044e73Da6D4+783FXlcB7Q=;
        b=H/J78ID1P87kH3OMebbRQTLz3NG+t4TAWr1ce+Ihy4ysiZLRFlZL7hhyqPo2n30sCQ
         K6vvwjcFHYG3XwUwLWNmn8eZCZfEAvfVLIlMYwyyslTrabVEQjaMNUpjIX7CB2yZwkHR
         yoeoSGOKq2t/iF4Z5D1pb/mJtnleCDbBCcZFWcgHlMT3PbkfC77+BwnyZ4/efQ4EU9Jt
         aMTtVz8OFy7fTGDBIaWZyPmFOGbSY73ojICXQZNOcwfI3HzDpsOAk+V5aww7h0YcOKpe
         9i0pfoY4OUOcc1iu+PjGA6v+bPf4gjxTPpACkCq3Ec4twQPz/BevzCQGaatvL9IePrz2
         qurQ==
X-Gm-Message-State: AOJu0YxgNYpXGSIWGJJsS0scHwtjrP87Zs/dPZAqjVBo7GpNNxBnKxFJ
	0v1OWRqHAbR6iw6tf9F69QwGjgkJF7qH5ESWCDk4FSZ/jz6DMXcfGJys3we9k940JAjREb3Ktf8
	Ai8KhPaMJC6PzTgAAngCi3XQIFS9ddrUMW93Af/JPtxojvzkpLp8k0Z8+GMoaZmu+7DGE
X-Gm-Gg: AZuq6aJR3+oYBbyHbNHY1yDWER5siQeAl81NNfto0NNX2bk1Mw9gUWIFp3QiZXEZuHQ
	Qp21EZR2+zQSOwv9bhPSUJdvdQm+AUD3xfOt5gg7zzZPgCl953GT7InlHK1I/3YqEwzBBZtL/7v
	R1kY74reWq8xVbF5/kvbP9+O+AF14lUqrOGpKEuemf/eWcM1B045xiVxfwJd+V2Op9RkGvdD7KU
	spqWoWy/E2yzqDjrRsNu1N25+T+Yl/WfQbbvzvnyPtupk/+2mMXJ23fKiiNDzCkpgjG5ZXXgj7D
	kSZWEkva7oNAZaj6VMmlfJ2hRlAD+kDoKy5CJN+NpLOher0c1MLw87UtLrkSc7MTDUUvkAchqh3
	oz7cp9J/wMI+yWg36LjAOQLo7SpAVD+osigPzs7GALbuGUerDsE1JdV9gtS8OgqE=
X-Received: by 2002:a05:7022:7a6:b0:119:e569:f622 with SMTP id a92af1059eb24-1248ec5ae46mr2662068c88.27.1769470719134;
        Mon, 26 Jan 2026 15:38:39 -0800 (PST)
X-Received: by 2002:a05:7022:7a6:b0:119:e569:f622 with SMTP id a92af1059eb24-1248ec5ae46mr2662048c88.27.1769470718625;
        Mon, 26 Jan 2026 15:38:38 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90ce0dsm19948967c88.4.2026.01.26.15.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 15:38:38 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] arm64: dts: qcom: kodiak: Align EUD node with binding
Date: Mon, 26 Jan 2026 15:38:29 -0800
Message-Id: <20260126233830.2193816-9-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dnBclKxjrBty6T3LLP2JK6fopz3l8ZLf
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=6977fb00 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OcAoOLw2Dr_w_q-oR68A:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: dnBclKxjrBty6T3LLP2JK6fopz3l8ZLf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDIwMiBTYWx0ZWRfX/ibt6K2ALQ1+
 JFw/rhCTbomZjXLscTnPrxrOvbnQP9bS6NhZc8rt8lLcfRUcR80XxLlCXAucpKbryWSptrn8gyA
 dmPHc6Y8scZ+EvJLOUh4M4hm+4WZUPvW9jd2Wdsnh+7i70g4A9B5JVPLFl6uTdQLmF0Mjn2vnWN
 rbtmlPbhOP+4TtlhzXQXuv9S/DMA4rEW8CJ/aR0jMZeUIr5xN2+D6MRZvGvgvRND8UdAyw3Dy3m
 /UdGmT0XVNEwBsWm+SDUk+WlIcqnniHy22rcZjffmsGmWB+MHrZM4A0QZoUNEcgWz7h8jYd/iAG
 jHowVlfiV7iCQDGFAncvRqjxRybmUOP+oSKUL5nTfvRA8f8+bnODR3ZqUoFHC2Px+4iGCo4n7C5
 hmJB0qOYVTYCLCEIGgI5pFTID2qcznit8LmBOKRMV1Gwp8aC4bOQhS/LQkpJLYmaXVBTCzBTwg6
 l8EwSaX/ibCOQmL82kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260202
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90623-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,88e0000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C00748E3FD
X-Rspamd-Action: no action

The EUD node does not match the current binding and maps USB endpoints
to the secondary controller. This SoC supports EUD only on the primary
High-Speed USB path. The binding also requires a per-path PHY reference.

Model the primary UTMI path as a child node with the required PHY and an
empty ports graph. Leave endpoint mapping to board DTS files, and remove
the secondary mapping and associated ports so the description conforms
to the binding.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 33 +++++++++++++++++-----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c2ccbb67f800..35c47a6b03f7 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4284,12 +4284,6 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
-
-			port {
-				usb2_role_switch: endpoint {
-					remote-endpoint = <&eud_ep>;
-				};
-			};
 		};
 
 		qspi: spi@88dc000 {
@@ -4610,16 +4604,29 @@ eud: eud@88e0000 {
 			      <0 0x88e2000 0 0x1000>;
 			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
+			eud0: eud-path@0 {
+				reg = <0>;
+				phys = <&usb_1_hsphy>;
 
-				port@0 {
-					reg = <0>;
-					eud_ep: endpoint {
-						remote-endpoint = <&usb2_role_switch>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						eud_usb0: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						eud_con0: endpoint {
+						};
 					};
 				};
 			};
-- 
2.34.1


