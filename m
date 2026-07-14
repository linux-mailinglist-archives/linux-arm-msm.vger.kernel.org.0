Return-Path: <linux-arm-msm+bounces-118918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HCkkMo2+VWpZsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:43:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E3D750EDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:43:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="dp/WE06i";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iYoCYY8m;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118918-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118918-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2091930ED6D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9632475D0;
	Tue, 14 Jul 2026 04:41:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A310728469A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004114; cv=none; b=GIe/NZu0cV1nHStI5/toVwofuLyogQ2FijHoEwFyruZXSXxXDna2mhinukNVO1EvV9Opl600ayOFDIVq9Xv5lDN+7Bjo/Finbqao1J/0EyXiEyltI9TfVXUPtSKxK2OqtLYbcY6cJNSlpa4AWXsc0mS7wRpHINpz90z6M9X+lcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004114; c=relaxed/simple;
	bh=yjJfnVfAPyZJQYHDnz6+/OXUy7I1iXUekOwvY2stxZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D3o4H0xrouonjNXmDR8glM7dHBF9qdbFkQJC4lcpy53vmgz0oWQFOmvB2wL+BTmnXhKqk7K+/BhJ0gPMotCya5+CTFk2dCeS2TOawZ1zY0avnZf9pLPks4M+Dpby1pOsB5/OONdrTP253edg2RlXdIi5+//05PCW/TyOrhZzP4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dp/WE06i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYoCYY8m; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E383oE3556563
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIYWnll1RgHSAbQKf8Xt0wniO/vmhny7JLi0bmR/U7w=; b=dp/WE06iNySG79IC
	dLWTI+qa69TR+oBKWRenTLBo7dO56kenXWTSsK8/lr/k77N9dAP0t1gLv+WtWb6l
	7IDd6QKcFdZ2ffMyPzR+qPujXtqySjon/JHJbGCxy5EPOiAWG+x/hKTWTWSTFHV+
	GfVRhjve/ixBTrhuZe7yOjy2RLevBAlufQ3/AuO3ezgUf/rkR1RJ3O+/b7etMLjU
	ajrLFeUzZTmqus2/AVBeStILjFlMmMPZhUhqC6krhmLiwsFvXSO2gr8Tf2ot2qaJ
	mhUx7vnnlDtZJzcvf2Mt/D69iZ8jBlVQNCgNDtOJO8CCbEr+Kz+cWznsuxlJ33Kn
	rnyT+A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44csye9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8894570b58so484090a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784004112; x=1784608912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QIYWnll1RgHSAbQKf8Xt0wniO/vmhny7JLi0bmR/U7w=;
        b=iYoCYY8mFjUvt1eqv52tMdmsCMY9mRG0i/k1BUYr44orxsWHxUee7iYjKxoQve+rTG
         0l+vO8H4+DuH+s6gUZFo6nzR+m6cYkvmESe6GwttO1AcQ+xd74bd8miIVKokOIc+UTwb
         7cqZO6Si/K7yyG71su37yNOwbK4MzBjmW0+4wVOH13CgOnQ1erFOQH09AjbqFKhQbv15
         L9YX/TnLRsHOgRAtl1FEd/7idH0rAaKnBcqiXyQCbAmnedWFbNg9nPfLwtChIBvAYRM+
         YONvnVLOT7GgGrLAP5OceFMk2YDubjA+F+CjtBn+xrZP6N9xKXhdthXAiViwuGOzOwQl
         3gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784004112; x=1784608912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIYWnll1RgHSAbQKf8Xt0wniO/vmhny7JLi0bmR/U7w=;
        b=dVXOJn8i90/n2+2WE9RZZUbH/rq7h344P+0VbwjqmGxMfWlC5kq7BGLD3kUp43zkRg
         lH+8KIiVEVi1EpAL/7bKu5fMgiaNJ/vfk5VncilapJbokjQJuKxsrPl4VFbqnB9zPrF5
         Y8kKtJp564nXrtyV0dfbLedACYcEJmDciNxGsP5Dg42iN5loEznEIxqNUK9kabLSLs0l
         YuDraScRW/Ts/CPt81ZuXlwZNLTffpn7G1y1n6qAmgbj4Qr9Sp9KGV3DFKqQZFA0mmI3
         nJW/qpuSs3RQyk5t8JloN/hEFck0URhBj43Wz6dPFbfyIXeluQXD913UvIWPEAmHfIIU
         0AJw==
X-Gm-Message-State: AOJu0YxmfylQXNmzN1eAH4Xg0fj7pEtvoy/6y9NF4AeohSfMg/J+ox/Q
	8rRTn8cDM1O8/YM03sIvcbZGnDRcd1FHe+EJy8y+ejY+cg8x51d+Y8ANU6LAZjR7VQ9/QIKI6HO
	oCagRAvdylk0sG6j5ejSOQ1Qwt8FoRSWjx6iz9fvmJvANrtT3pjbbYwe7dEHd4Uh1xR/9
X-Gm-Gg: AfdE7cmNeT7xE17uSWT370gAuPEyPjflW1qGo7t3h8cGKikLWv0XQCuQysxve9mXqBK
	SMH1/Eq86LPFtuHZacli5hD02Wn/A5o4tARPVW67mzu0WlJbIthcp33h1kiDWG86IEo3Nhs0Usw
	6yuNcJOZs4fXQT2Q/WNW8YSofgtDUOmyRsi0BvZpRcAzTZVaspQ2tnMThElCcHJ9B6qj3e6sLUo
	7Ryvyfbeoj6g6SZJDXjUjat6DRblPi75amq9zjaQza0/eSFQYyYYO18YsBAolHJoVfUCA3AFULA
	y4B5iif25HDCXuY118HprhRAeDEPpMaYRDMavLcchm89BkclPG8s4qf2eWVhG5DgM+dW72lyKVB
	b35jM8nbigLFlmV6O/lN+aNo/rvfKgToFgdc9PMXxuZmHQfPAMTEIZBVYNuNSPwmZWin3HbZw5o
	PcPB1xL7b0UYFsAm5D3qPxZEtloKnStX1il3vy7Z4nKvAk7w==
X-Received: by 2002:a05:6a20:a109:b0:3bf:7189:2d1f with SMTP id adf61e73a8af0-3c110a07537mr11924951637.31.1784004112260;
        Mon, 13 Jul 2026 21:41:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:a109:b0:3bf:7189:2d1f with SMTP id adf61e73a8af0-3c110a07537mr11924926637.31.1784004111830;
        Mon, 13 Jul 2026 21:41:51 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm68624567c88.13.2026.07.13.21.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:41:51 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:11:24 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: ipq9574: enable the PCIe support on
 RDP454
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260714-pcie_move_to_new_binding-v1-5-6bb25887a0dc@oss.qualcomm.com>
References: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
In-Reply-To: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 5nNil2eUVTc9x6nJYL3CQMOXoY_vFUdH
X-Proofpoint-ORIG-GUID: 5nNil2eUVTc9x6nJYL3CQMOXoY_vFUdH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX6M3QsKFsUhzm
 tt6sAPv9kUjh3Mm9AsxGPSHM5C9d1ZYA/xhp3ey0VjJSxIOQWu9j9EKcrE8bMuVRYNxIZO+g305
 qmTrToTph0xvQ+yB+IKwWXZAiNedxyI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX96zqxIr6IY0S
 EbcgwxgaNylPZzb12Vcjxf4pO5z6hPNGBbnFa+X0WHm4HHE7/OH81eiA5mIJR6V9GAERiI1a09d
 jtFg3RtVZ/TezTtEGC2ueMu4ZfBLFXTpxpw33g0h5gX3FX2kwIEGyTmZ/WRbzmnGXrkmKoCnSpf
 AX8HC/1fNm5QQ/DhdrwuoINVVaKiGsXeViZW6QluDn6LpVEe7VoKAQX7wIwaG/boSoO/E5pxWrc
 xUaGMw34ttyKmEtDJ8fcOLIaxk6r3cyjmgvKYMGf/Wk1QaVhGAAXb40qWZP+1wQ6rTh91gQl19h
 jZsDaewVNiaMyVvcbHkYkfbjxjey1YX2l47L8FvIr+3+tl9+MhsLaJZ2cDiDmHuOP/Q6GigoP2N
 ll56sSlAisfwBJYwkVww88Lv7EdKAKb7/z2SzRNrOyUQwgHHII4uEr7DxK9UpBoq76AxwD8e6Hb
 JG8u8zpJgN/GWu0Tn6g==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55be10 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gruHRBXcteZQTzQfZrMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118918-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43E3D750EDA

Enable the PCIe0 (x1) and PCIe2 (x2) instances to connect QCN92xx Wi‑Fi
cards.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts | 80 +++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts
index f2334b9e0ed4..146422aede7d 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts
@@ -18,3 +18,83 @@ / {
 &qpic_nand {
 	status = "okay";
 };
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	pinctrl-0 = <&pcie2_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie2_phy {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
+};
+
+&tlmm {
+	pcie0_default: pcie0-default-state {
+		clkreq-n-pins {
+			pins = "gpio22";
+			function = "pcie0_clk";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio23";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		wake-n-pins {
+			pins = "gpio24";
+			function = "pcie0_wake";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
+	pcie2_default: pcie2-default-state {
+		clkreq-n-pins {
+			pins = "gpio28";
+			function = "pcie2_clk";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio29";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio30";
+			function = "pcie2_wake";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+};

-- 
2.34.1


