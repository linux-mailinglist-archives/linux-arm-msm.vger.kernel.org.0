Return-Path: <linux-arm-msm+bounces-113154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZPDUAcvUL2q6HgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:32:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 947066855D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:32:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CAoRfxNv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LdkGKtBY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113154-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113154-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1421630089B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2700926ED3D;
	Mon, 15 Jun 2026 10:32:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA4F19A2A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:32:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781519559; cv=none; b=EBRriRGtluV4+B/Lyuin6v7wyK9WP3WMfMPaHVho3+5YxEcA9nV3mWW+SYyQeNgVY/AxJFWUBiF84VKz6hX7z0XlIpausc8vndPigpJypMX6lC+PhyZQ6b4bQV5JnXiCynReiE+I/KN92MNfIlluMqLF5EJaWo6TVrhWinZFGps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781519559; c=relaxed/simple;
	bh=5CS48o3NUE/p9tkz1ZXoPwHkU23aA9WjgEWkXpewHrU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E2T/Lg2e3IdKirrLAiN5orL4iSkURPfNekRmK1vEVYM8tS1bf6cfrivW3BPJ2+F/E3qh0qD+6Pd3nTNzhGo+no4qWpafoMgQFf/+9pFcd/0oNcnm1/1acreY9GV+GlpVgZLnrBCWK+43HhRtQhe+olsmiItHgpbR6KOgIoHM/sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAoRfxNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdkGKtBY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAMCa2071305
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3VLtpRKJqYk
	es1Jb1zMn3Spr8QKzWjGNJukQtiigmVM=; b=CAoRfxNv+UkYGIlbCbZzzknqAcA
	MNH6riD3rGagg7aqRK3LgdVcG8xcUqSRzWQyxeMy1e7sXLpc8qBwZ+WYrSytfyce
	e/7JESW6Uwy4zzYVoqbMjK82mKLPDvChGc4aFb0XsL2Q73KXf99G/POgrTCfVub1
	DMlFEykYuMBVnDr9XYiKhbsCIrAtHw95YUb+VJvoLq0cgiGNW/g5L7h5H6DhC4iV
	c4DY4ICuGy6vhWCh1rwu/tpaZktjfs3yKBIe24fai0iHfuPgm0BZIr6Uoamy4yBZ
	zh56D0lS5z+wgPXmRIOZtL88JDkA7o4BJKN6jPxBsv0mdzkb3n/GFf35EDQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx07mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:32:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-305eb106829so176859eec.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781519556; x=1782124356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VLtpRKJqYkes1Jb1zMn3Spr8QKzWjGNJukQtiigmVM=;
        b=LdkGKtBYS2nxWj+fHvoMSJlhk61IMa2Y5QCHLouQHgp24pOBJvdZ/SnxT2FpkooJsE
         bw3wSP95G2TiE4sulHpYs9/itZp/P4Mp+36PJFuPJr48ZW09gBcqc+awU5lYuCQe8Yu7
         3Jw1Nm24x8+gtKfmQIrJaSE1j/ttLltw0LYxe8k2VI+uEgWmff7UizQvS4n2Gszw/WHd
         paJ3lyk7H9lWFkAyslnDz5QV5Tp5+KibWY1AjdZjOg+YYGzcaaYp9VOe6Mg51ZvbGQNf
         g8HAYbFF+GwwqwrGHC2fqki1PLcya80v7aPTvrM4D6AVemTMRZ4d9PX/eGCVawY+4xqp
         4n6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781519556; x=1782124356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3VLtpRKJqYkes1Jb1zMn3Spr8QKzWjGNJukQtiigmVM=;
        b=jtwJbWBH3j8c8C+dArMfDNQdWzDcFifBqafD6IMZEXelKsreyts6Uz0/qrnI7aS+nX
         pE2L7EiXpvA7k/H9bq9ngIZT9pe1P9NyLRZbk7YyTJQJlpJsMiqZGq4lA/jsztK17V94
         O/SBQLqhoI2T4+8XoVakY77nUMRIJw9flYLhkAkoqdoyu/yst/02oLgVT9ajGo7NnYGv
         8DEdWJb1vhewBdBD8c5+O3qOPdfIXMmIWYzvc+6LvQ/Q3Q19ZCYqXLNwwrkCdE2TvmbO
         A8LVHt2nO6HnA4AuJVIfKQIIX9+WdlvRYITX2BnX00upGHU8evp9ylBVUmCQyv4+rrL3
         Xktw==
X-Gm-Message-State: AOJu0YzIYNJLDvgjQY4x8e5P9wkvwA/W1wNzHPgBs9qOLBrHEk1bFA/M
	DdzI+LVVtDt/OBYZ2MUFUNMm1/popuc5CO5hLDkR0dAwkKbEd0ji3ClJqrqAo04RSm94n+ZDJa5
	Pt0nN8K/ZoF5Sad9hrnmp+KJU0WR/QN8hEsZ3u2Tv67Q27e3seg6ecGfR+DUjUHIhNWny
X-Gm-Gg: Acq92OHofGWGRkNiDAOj+XXpbO359vpiErOVLRNLKpWO6FdfNjVgDA59aGmkmDcnsgy
	wLuE72MvWvBED88vUSNxcTysvkDpIzxBNOgzy37gPcCizYeyvhfxkSKNX0exxV45Skw2Y0sBE8R
	LvBufJ2qDnVHI5Bqk1ScGgDHpPJmdD+Es/1OOykQamD9n0jX+ktihP+psscAtAcDOsUcEiQWhfn
	sc4ZgfksjUPImfOT8Y8+00fi2wQlu93Cm0x0ZatZ0lhM36HuZ2QsESHYL4OmcqKtnBh+CPsO1fN
	w2VsvKFiRaiuOFKEGRbzygYIn3kiXe/0MolqJcEUDtg9RiPBI44D9McrxuwhLFfZTuf6mCkCwVY
	T2cQhVCl4tidP0t70jpHOrl2F+Y0TS3QzuWJGl2mwwqlfAZRemB68K2WW9P03fK6MpZz7LbA3
X-Received: by 2002:a05:7300:7495:b0:2d1:9b35:4f03 with SMTP id 5a478bee46e88-308200bcee7mr3676890eec.5.1781519555519;
        Mon, 15 Jun 2026 03:32:35 -0700 (PDT)
X-Received: by 2002:a05:7300:7495:b0:2d1:9b35:4f03 with SMTP id 5a478bee46e88-308200bcee7mr3676861eec.5.1781519554947;
        Mon, 15 Jun 2026 03:32:34 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea43b80sm13594502eec.21.2026.06.15.03.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:32:34 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@oss.qualcomm.com,
        bartosz.golaszewski@linaro.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Subject: [PATCH v2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector
Date: Mon, 15 Jun 2026 16:02:28 +0530
Message-Id: <20260615103228.3104083-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608091702.3797437-2-wei.deng@oss.qualcomm.com>
References: <20260608091702.3797437-2-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nNkW03M2QwUqNCyXPwZHW79gO8zFbxjm
X-Proofpoint-GUID: nNkW03M2QwUqNCyXPwZHW79gO8zFbxjm
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a2fd4c4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=dne0pE14ni_oFMc-94oA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDExMCBTYWx0ZWRfX+kjwJd/WrA+w
 LQmk6oMwgKNvw2sfXZK9yAuKjljsW9XVWVSWzTwNZAjgH8B0/LagfkHkDqB489jZ68pzcA40DHQ
 9VrsxCgDM6uo0dAbNAbbAfIsM9cuur4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDExMCBTYWx0ZWRfXzIvP6UNvCNHU
 3IL1Hf5eP+GZQrYbLDNhkT1iF/IwxhS37ORqFykGdbVimVBKGZ0B5ERfsGPNmphyzOzkzDwVevZ
 5x87XtudLMn4tqWURt7BIQn0eArGTQgbYTfTnV+Zie+tzZOG4ZpBN5QkVLnn6gdfCL8OV+Q1Ee7
 G987yBFlN1bdU3GGhb9ecnTWC/MqK+gzLMPsVoJ7lQ3Bs7oH4WPsKH3+hkA8X3iFSWVFXGvxtpm
 e9xHmNIZUFXR/lvYLcBdUGFSVZKSHKfk+36CvBrtZ88E9ozQ5kOWPsP1UUSRckKwsafDl5WeJSw
 7CYqsQ0tvnPYh9vS8wv53DdkRIGnTijaXkR4H0tUg9fGNI+uhBUwZfmQsz7BjrL3TwctDQSZkmw
 noeQqN8jaWanFd/mBycvU/aRvraoWkS81pgCm7Rto8DyNz1ez+zfFONv9rN3x2pxj1hH/0RZLjO
 OrL6UQGdeQxXrOad4Pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113154-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:bartosz.golaszewski@linaro.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 947066855D9

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
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Collected Reviewed-by tag and reorganized the patch

Link: https://lore.kernel.org/linux-arm-msm/20260608091702.3797437-2-wei.deng@oss.qualcomm.com/ [v1]

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


