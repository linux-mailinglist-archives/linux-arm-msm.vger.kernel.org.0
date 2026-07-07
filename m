Return-Path: <linux-arm-msm+bounces-117118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tZnYApiJTGrGlwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:07:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B627175A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:07:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pC9P9L8w;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jWHKUGKh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117118-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117118-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA7FF301AC24
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FA9378818;
	Tue,  7 Jul 2026 05:07:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B6737F75A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:07:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400851; cv=none; b=MS4A41efqFnQqNFSj2SCTHctFW/EcaJ3td6HNm/5auKp6kyGen/FHb+ZBh3pg75LDxqzxvf+h9V9iybBa0kRI6K8YGLtuzr0PHb3ZveXA8CVebeMxBHgATwWy+vnwOuPJolgUJ/Yld84/GH/lsn+Z1uL09Tt9vLH9E0+XJFfxng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400851; c=relaxed/simple;
	bh=k+RJzLghA5+Fmbp7u31dj0yVP4xPFFLe4fqiKeQqDF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r/1oLiwUUESTygbq+oPNBGoWwaW0ruLf1YoK+oyWAiNfPUGEeEXgYFKtv/TqFWx7eJGDrGm5CvI4j+GBdPkTJm0taTuZ8YwJzevJUeLKfi6VUdtaVu94esj5ELG/9Ehjf/Tm+y51bEk7h8PVIjgfE83IRkbik/dnuNYum3nfDLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pC9P9L8w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWHKUGKh; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748s5x2629803
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JnRh4Ub2vuIaZx4wegh2UPHNrEES4UIAhed7f+E4Tw0=; b=pC9P9L8wdDpWU//g
	+S9hwBsXjjNqefJMbfnZ1iEFVoWaSmT9dS4V9BkfcDdboLEPwVcC0C9yRGkTivVd
	qZDO7X4XALvYL+qlPP9AfXVOZOnCJ7vXiRoycZcgZK0VVjEWQ55zpaILXVA/SKEg
	LuqreKvk76GtSAk63NQx5AH0fr03UW+8nB+efatlrMGNxT/RzjSsUWJANXfWXYuX
	0cbPpnPQAHARDnbNgr/0KleUeRgWM8EsgXAkixnLgV3Z2EXQMZmAwsvRGxbCRx7k
	Kh39oR0T6mccG0Z+ME7MqOMQVw1cU5y1CxjutAmuCewYGuuciy98sK3p2ZuzrVCc
	TleuhA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h54k1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:07:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8895156101so5923660a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400848; x=1784005648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnRh4Ub2vuIaZx4wegh2UPHNrEES4UIAhed7f+E4Tw0=;
        b=jWHKUGKhP9acDn4XxTh269E6Og2hRlStPzLewqfFf4MgmXan7gefcc5jnHBk8OABNz
         vxdFADDdLxuj81P0VOYJDgyLzNWGYZIHeYuHEtNXF+jclNmN/rYacHvo99z7Yx9impBJ
         Ac/3Goi8lokb5fsMKGZcF5eCC07Fq6sl+VUqzbkil0/bvm/irFwjU1Zq5EJavqOqMUfd
         BiLFKjFJoEge73i7ZdjtWmSj+n7ueyS2DJ7GbErRHHQYEiSHhrxLS3uzsPhj1Gn4L/Gz
         eKamqrnZESa7VQoHFwbDq8LURGlsNeiIQ+2sdo0E5lzGoFDOGGP8+x/Ccc+zE+Ny2qkH
         gfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400848; x=1784005648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JnRh4Ub2vuIaZx4wegh2UPHNrEES4UIAhed7f+E4Tw0=;
        b=GkP7HYYBTNAQXmvlNYUITeKf4HxsMLlz4HPzKfwviL/KpW64SwcExDO4+zXEqeH/GC
         001xchJsiJpCw7VCb+U0ES8fYb5wSyyuZuXvGHpexcIaHL2ETyJDko5vS7FoVfaXDhVH
         EryVuLQcWtMibnBwjcbdMldJhWwtLjyRJu3+nNV2Wvhy1jO3ESXlJl1tbCTjwnqPEqEq
         avHrN9KJpKjvi90toXeDlGSfm0RmcGObxdAt2g7Ht2ikMdLq5xlP3WZHH321uOr+KXlV
         wndqAm7TD+zQk+b+5+PWcyMevclOldyNJVWxcaYKDtbFhNBcBDihswFRsAqxxCoUSnG7
         iOTQ==
X-Gm-Message-State: AOJu0Yw+uCInBp74XhvDdAhScplTfCJwBjVMSexpdQcRs9NNXnqEDd6v
	rImE+tjVIHcuVSD35sJXnQyRZZZqaCPieB8j/t75/QQSlbqR4rR9pLc6rCfI/1GoEik+OMdA2ge
	ehQjxHaUCNqB+HOjkJ2DYz4Uz/RxFafP5qWtPgaCaVufzjSIhtX/LbUafmIz41nU7Da0E
X-Gm-Gg: AfdE7cl/tETz78v4UXk+vMdRJrovtXxjKapzOcl7HSe5jzyrpT3QUIGsIYh4ARL/nyZ
	9fFGWjeRHrwuZne/4xa2lcSy3MPEzvxKku7eOPOUsIX7441ByldTTf2tDw8wLGwvQtmGb+gAy1c
	ZOlZhWyCFpHvslA98IkU5hWT3ytp+SbDYmaBAH8obHKWcKBJ+MfYkyGuq0NORt0slQTVGAq5gdz
	Yhd7Bz89/bW5JpIkjOcSK9t05ibDVIlAsJP5pJafzcB+RLemx9g2YMibPUyvSg7p3iexVUafUkx
	4gmXVO/1lU3RNdgw1WCuNctasPPuuDZlTT/6aSgGSgruXSGdso+UF958FFJAxNYqsdwmkzJJJ+H
	eAsmXCey9jiCVO1+GUaEX78QY1A/BuUyHjUK/25oYUVZ/NPsuVKF0SfZLL05zEv6V2z8WJx/VgV
	EMHjqc
X-Received: by 2002:a05:6a20:3948:b0:3b3:cea:874d with SMTP id adf61e73a8af0-3c08ed81a5emr4534455637.18.1783400848259;
        Mon, 06 Jul 2026 22:07:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:3948:b0:3b3:cea:874d with SMTP id adf61e73a8af0-3c08ed81a5emr4534428637.18.1783400847816;
        Mon, 06 Jul 2026 22:07:27 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162b59sm352300a12.16.2026.07.06.22.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:07:26 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 10:37:17 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: kaanapali-mtp: Add PMIC Glink node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaanapali-pmic-glink-v1-1-3f7d476672d9@oss.qualcomm.com>
References: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
In-Reply-To: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783400840; l=1786;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=k+RJzLghA5+Fmbp7u31dj0yVP4xPFFLe4fqiKeQqDF4=;
 b=FYfmNZ1TG1FQ5byuCsB0uJR/DccEWdf6tGHN078G21IEMsywlNRR2Fvfqj6vtMuCh0GGn/wAo
 qWc7T0ZD0s9D5E4cthcY7Yzk1FQwj+ZvOi62XcWCSeXKnDwASNY9i6F
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: QqbnJFyRrRVd2-UNJc28JKQPC_WKT05Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0NSBTYWx0ZWRfX7GdzR3N2/arT
 e3Eo/eJD89JlPrQDbNIWWrntQZ4z8qRd9Uuumuie8wpdpeSpO6uIgKcRmwuXvRfFh8EZW5i+7/y
 O6ZiXG1LPzoufQHDXca2vE+faND9OCs=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4c8991 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7aILTqA_qkZ4MrPzyYUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0NSBTYWx0ZWRfX7p0oWjULNn/b
 USC4TM+3UuL44eXhYX64VKpfOjhUWX8lXNoIEuk/jkMX6KUQnET9u7DNbmCIe0/1oi8GxtH5BVe
 eoxl0Ktez7ggydStAI2eDUp4IVSE9IWFU+eAytl3Fgn7FmlwlELEmzX9iQ5Z4kb2omUKAmHO4Y1
 fZ0L4doOZ5hDZGdMXJA1qp2vDkUtC0u2XS0W6hBh6FJmv3TKPsTJ43FW0molteqo4COYGqNPNPy
 80wgq7TDpQ/RnXIa+jf7lenLWhDeCvLWfJnOIeRLCV/XIp4z5h5DMV+0S06gAqmVBFxal4YxkEJ
 33yEwsDsuOBmb4l75klCWSN/YthapucXOp5mm58rg0tUFw819Rr21mQ/p4U+Ju4+899fLVGw2bK
 GklWxKOT+hitGzJBHS4xMR0d6ZtLYhkqLOz7BKsjRHtsYQP96I06qr1MLIDzCTlzNfsR4nS71dU
 EaH1RX2jUj0bjiOKZMg==
X-Proofpoint-ORIG-GUID: QqbnJFyRrRVd2-UNJc28JKQPC_WKT05Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117118-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65B627175A1

Add PMIC Glink node on Kaanapali MTP Platform and add remote-endpoint
linkages to DWC3 controller and QMP phy respectively.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 53 ++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index f9b5b5718b90..3e9d9fb008eb 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -163,6 +163,49 @@ platform {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,kaanapali-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+					};
+				};
+			};
+		};
+	};
+
 	wcd939x: audio-codec {
 		compatible = "qcom,wcd9395-codec", "qcom,wcd9390-codec";
 
@@ -1328,8 +1371,6 @@ &ufs_mem_phy {
 };
 
 &usb {
-	dr_mode = "peripheral";
-
 	status = "okay";
 };
 
@@ -1348,3 +1389,11 @@ &usb_dp_qmpphy {
 
 	status = "okay";
 };
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};

-- 
2.34.1


