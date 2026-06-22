Return-Path: <linux-arm-msm+bounces-113939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jvBGFFjZOGobjAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:42:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C4D6ACFBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:42:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HYN52TAh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IIWDbjcL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113939-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113939-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8F91300846F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 06:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457AA35E94E;
	Mon, 22 Jun 2026 06:42:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C944235E93B
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:42:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110534; cv=none; b=X97b8pXvYhOD3kv0Yu6BiaQIDfl/Bwn7EF0OrBSXwZSYJELaF4BEEqOer6GQpLsAoX2Vidj6d/ZCPRdiZDuYW6fWNvU6FAH59x/tP8+rypOTFMTYVxrslyVRROIObKp9vsQVGIcKJUSFW+mj7htycrhluQQNBL/xrvEWYkv85Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110534; c=relaxed/simple;
	bh=0YnuF83wi/j6SmKNLxkI7YGwSEn7DzPTu9JcNVgnp3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aymS39kdyUjmp+9QYQ8mznjL3R6pA4Xmmq9xJEJxp7r4DM4a8bv3gFJ3xA8eaYmo+jADbtTMJJPU7zC80YOClPNwVJFuHrFKCSmXFkSlnljsiDFFjnILMsof1bWIuIoxvEZJN6o4/T95gY5Fcw0LkD3glDFi0fLAjAeqNJM1Xuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYN52TAh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIWDbjcL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BmwB172579
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6Fd7Z6Y4TUSXZgLWfVg/Ri6zfmoh4NBR71NZ6AF9Wg=; b=HYN52TAhOqv4fUTn
	uEqo58lE9vptAfULG2gXJWLmDPsnC6dhB4Yf3Wh9r/GnlahaCEAnFwUpJjF/0wXh
	4t6nKLVa46olZgId/ZYZCYP6VSOA8fyEnCbiv2rZKilSwvdaFJrFF7Yz3WCCpWdX
	aGUway0BhLHGgpG9d8lx8Bgu0aM0/K3uq80IhtbT/dchyIXvtzwehUUbuoeXNQdJ
	r6YBy3+H/UlZtQz2XfHyW1QLY0+6DyvfLUAhq7B29XDNQhBKoPMRMHqTJWqW2gvD
	tS4CrWstERr2SoY2GsWVcF0akeWA166WZVhHl1q6eHflg2sLLY8qJ+zkinoeHpqQ
	KCsPtQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewjexw639-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:42:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bd87994e8so379261eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 23:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782110531; x=1782715331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6Fd7Z6Y4TUSXZgLWfVg/Ri6zfmoh4NBR71NZ6AF9Wg=;
        b=IIWDbjcLwDWDmbrhsTa/9augX7ZZW+cPHoTNs22TWSN6sqyI1ACJv8+L1uaTwf4h5C
         HCYtL4ffxmCl6owN5+a5YKQ2dm673zslKiIdcBuOiXBY50HumYTvbADNk6B3MG/FKWUB
         Qmg6RL7Nex/8au48R52P+vNVGDId4MbLBK06PP6idbxmRIJhmwZ/TJ9V4CF1eT+L1NSJ
         ctetNwCcifBzsHnRkpf8kS2nOnWDdl/7EDPKqG1F4pLCwrGhYt5zGAO40LITDA5xhf77
         D3S6bgcrO49x9g0RFeZKyyDtQwqnHLyFNrS//3PUzaAYY+Vq4yK4+htQfcY9Ft6EV+YY
         hTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110531; x=1782715331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P6Fd7Z6Y4TUSXZgLWfVg/Ri6zfmoh4NBR71NZ6AF9Wg=;
        b=stFsaxDBT45x0AmT5HcpCYBJ5MTQiLcDs4EAPdqa3RrQYYEd9J6OuvSGddCecZW1y5
         u7Pznp2sw09MHNaH+4IR4SXE3dGVG/KNsg8tTNKQVZA6WxjHtcOTeo3HDu3YxePQ7u40
         n03vu7SwcDmBs00R5RJnXhLgT9clfh0AbmQ3AgIkbjxCRhGlyMpGZ22U+bh+RzOx5Fqr
         6BkdiniY2PHX9SFwOymYmNV4/76Bi4iBUK0e4Z9FjD9Pn9SMLWqLgkWh280Zi2P0k0uI
         fCeG0LIhpnE9iqzSYmqQHrVsr6/aIAX0LyoL8GSchvj0yOWu0BpT2INHQTReblJAN9Sb
         e6bQ==
X-Gm-Message-State: AOJu0Yza+bbuj4S8M7LMHY2qWBAttkh+wnz1KE1bMG50SndB1C+XHYnS
	kCqbHeWd6h03eoGlnK/f+rRPi3EEEUzynQ/8QWBQWpTuoIaM8p4D+1VNXkDxq49xY+eprhuZzpw
	rt3SlVuCO8zBg8e6yAQkeE5IkP8wNZRTM1uRYsMebZ5OqWjpJSJT6v+b408YLRX82VXlb
X-Gm-Gg: AfdE7cnY9ziXxUWVq60EDxCjipY0xYJiKbuh9u3a+nGwkpc5KsK8gtCm7570ow8uCfD
	ReO7Xc4gYsGNMcssve/EQ9NhwjCGbYYQ+SduwxKsIMdObIqD1Rrk1kF6Gkc3DfUuxHexiPgxs5Y
	b4ug5NOecyXkpC+P9KIaifxPAIe/kWzjKQxB9/DJrvI9GxvTacxgikwaaABRv86zWZtdwsOARbH
	77aJpMihOF0WhGq/8DsFY+f/1P/kei0NATjD7/MntjrKz+RNUNDQ9Xct9c3eiD3XKYMjHxwgIUk
	CE1CJ5K/TqMW5VuJVM1okoCGhe6FQbxpLf0k9cyalWnCXO+dhsVmXq6fTuuT/VFI9UjgzmUXd4D
	RYuNrGN4y43nrzvi84zgX4Ty6A6kTJ+2mhk+NChKSx7rRPJ+EgdHZi+adD+ewWw==
X-Received: by 2002:a05:693c:25c8:b0:30c:496e:982e with SMTP id 5a478bee46e88-30c496ea017mr372549eec.6.1782110530452;
        Sun, 21 Jun 2026 23:42:10 -0700 (PDT)
X-Received: by 2002:a05:693c:25c8:b0:30c:496e:982e with SMTP id 5a478bee46e88-30c496ea017mr372531eec.6.1782110529889;
        Sun, 21 Jun 2026 23:42:09 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be95ebfsm9357803eec.31.2026.06.21.23.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:42:09 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 12:11:57 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2
 Key E connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-v3-lemans-split-v3-2-d26bb22594e3@oss.qualcomm.com>
References: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
In-Reply-To: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA2MyBTYWx0ZWRfXxnhwB6BlcLKP
 TPmw7JJi6wkSdciuPieVe2OXhj8QDRLxUYRN9fMYMwyLZRN9MTNJQ8UAo/LC6ytrn5wGDlbQkiN
 m9JGty7pb/xjjTWplfvVDHKXSC8fqa+WfdDLfn4XftjQPK+ESAzKp0sNl/8liSDfiU6PpBvAC5Y
 ujuB8utOYo99MHIpB86rYi9jTwnWxwhHQ78mnRr2r1m8/LYNMf4bYJc6z1A3bu+nU+ORhJmOo9x
 YDN4F3MKOUeRkjy785DxIYxY/7g6kbHrxE+YyjtTI/lao9+0BHBEcS/WZVXfYJL3w4ZHoj/Vbg1
 xfJ2JTekwKo/xlFbaZqGPUsYTijgZDkrCtgGnf9iUYRCJskaZw5R0qztjVyXThr4QWcOgDhuPJ8
 rz6QOYvKb1o+F50Rt6l/IlpRduazA9jmuFZF5VpEZ/TnLFitLp8iaJCFIC9MZ+ZYlcmA/v8XQc2
 bBT0+9HA8l6UWbGoM7Q==
X-Proofpoint-ORIG-GUID: mY9-TBoRrYs1-sUEq4nHEK4I16e5hYcT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA2MyBTYWx0ZWRfX1aH6r2Ht1Hw3
 Qlt9JIwB/4o+Um6zapsn5FfQomfRosH/BgxBtvxP9F4bPpeeHK/YTVXNSdgWxHqMsdhX9Ata4bj
 KdaxS80kG/MD2Po8yXMKZg81esUtNrs=
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a38d943 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=H_VFOEHctDopGwz7gSgA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mY9-TBoRrYs1-sUEq4nHEK4I16e5hYcT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113939-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:wei.deng@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65C4D6ACFBB

The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
UART17 nodes through graph port/endpoint.

The M.2 Key E connector is powered by a 3.3V fixed regulator
(vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
(vreg_dcin_12v). Both regulators are always-on and are required by the
pcie-m2-e-connector binding.

Also add the serial1 = &uart17 alias, which is required for the
Bluetooth serdev device to be enumerated on the UART17 interface.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 75 +++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

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

-- 
2.34.1


