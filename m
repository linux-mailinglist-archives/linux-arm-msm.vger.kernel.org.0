Return-Path: <linux-arm-msm+bounces-107223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFm4Hp8GBGoHCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:05:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C4A52D703
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8ED1E30B7349
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 05:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DD523A984;
	Wed, 13 May 2026 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Urh/rZ9v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnVvxsqK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA2B3655F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778648617; cv=none; b=ScI0uhtPAEvfySzc13vrLi7BaIT63RBQYhHB/0M2qiXuRtlMa43o0bYTYpiksgshLQyOWb6Rb+s5vWYUvJLTY7iXYlpbMd7jOVsxv7Vg3M+/AkwqczN597pN7qRU+qS/hgI5JP8r7Aqpwqr8l7yFSeCLah0wKsnckn1WfcdBJ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778648617; c=relaxed/simple;
	bh=F+4zeyZQRUh8+1D4DZTjH//5aeCfZaop6NwbAXHXMls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WjoTM6aOk+VRQxZ/POMF/T2rcfoyOD28p/Dw8ET4NJ2QtDrIy8hGpgPgO1WeBjq1l81IVa6vVJ+huBE7iLbdVjQtA1NFLn1ibOgCd9ByL/rwARWTQtItFNNq1Jm+DBfRclxf903k8L8cphxBcO514kDy4hvm2PEM5rbUTd/Mu4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Urh/rZ9v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnVvxsqK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p8NW2712308
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	912d/SKIOjFeJPU/yJE/6/YSu7q6BfQZzsgrT9goArQ=; b=Urh/rZ9v0TubZEQh
	nKi1t3/mlna+KQdShqQqtB/f3fSB0kNxJJ5G31iqAaSqirPbiQOefQca1oqOIq5E
	EMVpOg1U0NAwrfZ6f4LANDSJKr7V0CLhy3A4DCNzv5OskWdY/afJbie4cMJEkLTx
	C5y3Ec/bl6gf69XH6U95f1u0AWR5oX9/hS3VNsNbdqJ4ui3ds1oXe2nCVCoZEmXm
	V6YI5BpJrlsskRy8jfDXFayef8yVD3cspqaJR008eiNikNvQRZiyKOFe8AlKI+sT
	XJZ/fr57KMmXxv9Jc1cPibNZU6+JunTzPSEJQMKfG0A/OvHabFwtqaGLRoY50ter
	F37S5g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444su8r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:03:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c828acf7c1dso4197117a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 22:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778648615; x=1779253415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=912d/SKIOjFeJPU/yJE/6/YSu7q6BfQZzsgrT9goArQ=;
        b=hnVvxsqKKbNUZ4Ja4YECREZkcduZPjP8FXC/dJLdU3XwWnxOumGPMhpZCBGXvGuAhF
         PSjjGBKoCeRhZENdcq+b8pv9aQTeSvxR60eab/VqjzMHa6RUe+tKpX+dBeFm2XqdrgTP
         fgd2g9EjlYSmYCwM1W8jf/38d/s/XmBF/6bHcsVx4jMabMf9iQshi0IaBsTam99xQ5kw
         NzfxSdf17lWxnBa6Fl2ZCeErV3enoEWeVlAUsUd5AW8ktMxCIl7++nK28GolhjowCwDw
         6/tCLfKs+6yTL6eWH5DFm3yOXjp748dlLvIHTG+S8rrapOb2jTmq5LRZdrRZl6wt5tis
         jUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648615; x=1779253415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=912d/SKIOjFeJPU/yJE/6/YSu7q6BfQZzsgrT9goArQ=;
        b=GezU/+/xwb6uD4I6+ayeeGSIl4uxTmNmiRLWd30qS+rQ8tLDW6gpefq04A11uNqaEu
         noF1cIQXGxN2Zq1P/8JGexuvTzUX1M4/y4ixoR/T6NkDU6Tu8jtuw6D3WoSg9EId9tTU
         s9zArNNwe7WRr9zXgEQFaE9KdK+D/+alsI9x/Mkz7o61uex0GolUSR57lXaxpbIXp4G4
         gk/E3fK050Zdu2HIch37iGQZBq8zTs+B9pcdGPrw3ff5YhtIBtXM7UL6yvSYRUfzoUjf
         fw3Zy8uYlR+BBKxPjbwgWPYta9DyN/b9LfsZ36C7l5Fj4sHe0PeXJXplkB6D+dCBFOyn
         IXkQ==
X-Gm-Message-State: AOJu0YymeZGEnFtQWYQz0BOU6ppghjJk/yjYR0/f90J4uwu6naO8fJfs
	sv7LmuluAFFn1q1QUtxs5Zi7rGr7hjUJQyeoCFL1Z3dy7H0VPP2WSkHrguEfhzgWa3IcYw8eCVm
	Dx+sgLQYHTQTRCbPZRXEPhXiu4Dpp4CpqPTDARaYxL7j9bbvl1oX3Vf/3FDfdkiNzsV0w
X-Gm-Gg: Acq92OGr4aCdLHgNapYekFI3y7sDl8Q5eouPaWCV9IPJ/c8hCOcTnT93W8DvuFMN3dX
	0ySbkUhe96LLFQIu9xevdnBqTxc/b/wWYC98idHJviXj9a1ea6deXgrqFKxxrZOxU7Mo6UrRwqt
	tcsojLyc1PsbS8r9Q7oDyOKP5R0A8aVi1DGfXB+7VPu7uMZ1vhDGiat4qqWNykeAW7mFWSuwQ/7
	oaQ46rrdKbBU4B7oEgAyn2z8gFSRX5mIa3vuOdj7Z/g0BGNkIJorLqBAZGbAKJZv9oB+isXzcvT
	QBaV72P0+38WfkmGEFtql7pdYE6NxXChyjyaOqiXnIOV7lF/DATCPI5d6C7qCCwx4qlO3GG67wV
	Z7h2lRpsh4nPt2Uqa+VOc+IS0EBZ+cmnqzcSBqb/0JlDyRSRQR4MQXZ+ASkTLjF3uFNXt87Rvn5
	EvOMr7lft7UNK91Nriz5mW1WICsgC3Tz6XtJGABGFCGI5L8T4rlCAWDPm4
X-Received: by 2002:a05:6a20:a10a:b0:3a2:d838:bfcb with SMTP id adf61e73a8af0-3af83288838mr1728855637.40.1778648614735;
        Tue, 12 May 2026 22:03:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10a:b0:3a2:d838:bfcb with SMTP id adf61e73a8af0-3af83288838mr1728823637.40.1778648614274;
        Tue, 12 May 2026 22:03:34 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945c1bsm26328020b3a.15.2026.05.12.22.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:03:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:30:32 +0530
Subject: [PATCH v10 3/3] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wdt_reset_reason-v10-3-cebda08ab1ef@oss.qualcomm.com>
References: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
In-Reply-To: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778648598; l=1239;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=F+4zeyZQRUh8+1D4DZTjH//5aeCfZaop6NwbAXHXMls=;
 b=8qHnZGc7qKMdN6/XYfo0HLKki1/GMR9Vvr3KsZIDn59c8DlLYbU0MrGVq0PRZ3SxCCwvcoNxJ
 jgUCHqa52M2AP0DeFhqTTwaVTPDurL3fT6fkpNqMYpcl+bf++qGXbT3
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: hRxO_zYZArvwhGlzpDXDhxIQcIZN3VFq
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a040627 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: hRxO_zYZArvwhGlzpDXDhxIQcIZN3VFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA0OCBTYWx0ZWRfX2lFjRlEf8fQV
 SIWVEjFaG4LI2RuHJYdEfAkgTSS8B14zhy0MJFBeNIhXnNhh5m+HkyHTTWdfBNxlXaJX+IE3VWK
 5ZLnw4sWyyXNss8ZoXuQWxZx9G0XPre3eEEGcUdmzljaGQV/i5mGarMVW7XD6uGsnnkHAKgMsPO
 MM6Sc9A4INms8s2Jqxjv1VYMPzOafvLrNhJ6zpiDsM2ymdoGrxB/2GZjLrOrZpKLMT9FjxyC3ws
 NeiCqYoVpO+BJ1Tz3yhycw3+S3bu+uebZytABsTIJEylLpqvtpMrku/RRQXuHNROiCsovITnX5D
 OiBFpZqpEsGLnfQ/1BipxVUev1QZ/mu6SiQoUxs++zdCE8KmLlAKfS382Jyscn65N3nEGTODIt2
 R6V5f2WVux4s5lMMJUE+iJr78Ff87JuuV5MaiJewb0u8q0JV5YNrNrj0cckhwMLKP5G66z/kadz
 ZwNoy5IVtkwGtNRF5/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130048
X-Rspamd-Queue-Id: D0C4A52D703
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107223-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[f410000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,8af8800:email,7b0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.1.21.88:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.131.57.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 9b8410e32629..33ff00990513 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -624,6 +624,7 @@ watchdog@f410000 {
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
+			sram = <&restart_reason>;
 		};
 
 		qusb_phy_1: phy@71000 {
@@ -739,6 +740,10 @@ sram@8600000 {
 
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7b0 {
+				reg = <0x7b0 0x4>;
+			};
 		};
 
 		usb3: usb3@8af8800 {

-- 
2.34.1


