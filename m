Return-Path: <linux-arm-msm+bounces-113414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q/ujEwJKMWqHgAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:05:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B3468FB9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:05:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DoEvUMU6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GFIwSSR0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113414-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113414-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0B8930C8F90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B27636493F;
	Tue, 16 Jun 2026 13:04:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58175374186
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:04:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615049; cv=none; b=abX1EIRXVaKOYqs6mjJ3wewGqJx3N6q574i7jvs1WRCCmOAfeGNAvZ2W0kUMxgUtf8TNMyQsPB9waKgUjSCnaiUCmAersynTAE/9d6h+XB9VfMQinNHnD6s4lIOtV7y60+RRy79Uik1Azj3+8nxTTR6bhYQ0V6AZtqjA2a79T08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615049; c=relaxed/simple;
	bh=6bETg1n/CHOqDA+GsbItGUhyIvRxlEz5uw7b9XLF0qg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dAzY2EMpF6yiuT9hefGL1tXU4rU5VvFCrJW5vQRTtGHTwapieHuisiVlss5klLU7c6sno9rPRzUBngHecmFXH1hP8jn/u07eKWpzmGwtRdG/O22tJyko9fv1OkVn7lhqeSXNBmuTuTMfB608KtVmVbP3Y8XVs91+9ILl7S+08uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoEvUMU6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFIwSSR0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAC1Hb3256277
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zKrjD/owqDp
	zfTWdDkF6e9BSnZ83rQzQLPmJFbWfLCg=; b=DoEvUMU6S1W9QCS5DMKhRDtyzev
	8MaBG99EQ0HsIcAR54F2jcCpLeBr7gT2JNZmez5iCfjo5qwXGTjRib4Nxo36HQx7
	Qh0m8BAq05NXeBOjROhWsKKuttQ82Dasog53krBdJ50CcQqz0IxX/sx6oVt+3bAj
	Y7N9hRza6X/X2co2axiDaMoDIPx6fTP/BpLKzkPM37oABmFqXR3+npiy5Xg8YnxZ
	myXtt/lVFykHCn6jbom5TTJEwMNwj5hDmY/cV9jExQAcs8PIFzEhNM+A+/E2VLKx
	KhLT1tuDG4oHf0y9BYWXPjbUgThHfY+CjflI82e3SZAgW1Bxv/eNhOYR9JA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9umt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:04:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf1845bddfso47186255ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781615045; x=1782219845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKrjD/owqDpzfTWdDkF6e9BSnZ83rQzQLPmJFbWfLCg=;
        b=GFIwSSR0H4eYxXEpqYiszjwAVjhRIx6ixjBQm+AP4OaGL8UIvhOKMNynEGN3OcC4/T
         tzQCJRTstiAOBYbhfdMv23eoVhW38Dsm7BUc0Eenr943M9JlZTwXGe/gYCZAkC3yGGc2
         oXtT27THQkxI+L2BLeftZ6MTmRm+hVEBo7VzKXjb0VxvrPCqLcG9MmMp4UBrnNVnIbXn
         pf2kdRg9AoMiwO2ZOCnj+Xirljl0g3xileESy9Q0W8MpcmuA/RGOin+mMA499lzaX26j
         Xgm2lHP13Nas56laCw0kmAEdw+7i8vXK954c+iFd0r0huFxqsfsZ67TOUWMARsPPP0H2
         r4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615045; x=1782219845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zKrjD/owqDpzfTWdDkF6e9BSnZ83rQzQLPmJFbWfLCg=;
        b=awcIKSFZ/92JKPBvDfowC/iy98GXsGgbHwIIxuBAF2GXBuVXQjQC+diZi/u+yqqpAS
         SmFrWNzsyrOiZcCyAv1HL9p+0qr4FzGYpqcC6JJkJPB1x4q9hz7TjlrSBaCulHEqM84k
         hqugEK85ELoHQMLZ4ly8TiEuRqi6DqmkxHSwCmDNOfTpWB239lLoh3+Id/V7obBiHsm0
         xn80BRhbnOfy1JiJT9dLKHt8THmhnmTnXUyBrBiiXRO8qYM7eqIZXj57ZyJzbWycj268
         sxTMiVYQjTUQJh9Vt8L29xlAU+kCYomV7TBfV6mvWWz4xI+twyXPXhrzOOWYcVGcZeYK
         uvkA==
X-Gm-Message-State: AOJu0YyDwyAWumYCXRtJ18fhylDaroxMwaqXsTlONp0Rr/IA4W2wekSc
	VMvJBrQ4KVL01ZbHL06CzJwZRisJ7P2XQErh5jxZdZzDLjzsclPbfOnwYt8X4CKn4kJMXm1bPtU
	e/vk6nkdYHI+n+cvZaPWc9hfMDCRE4xm20UsWkU2jgNxOr2l7YJFeLU33/wet5punem0mULs6Cd
	Qc
X-Gm-Gg: Acq92OHS8Uq8ZwszOpMD9foWF2zb2eSiqbN5RI3RsbdGZV51UZhtHnrZIVC96kU7+aE
	Vaq3KN0Aw1UlIu4tqQthIM5Oag2XMIS8IrcCqF8NUoXJiEb6Z5VwNHiy2aJDIonQ0eGT0Tz5AMs
	nVMvqAhfgc0rElM9hsX8eIk0cUtWUgW3lWavx2rPlZfwD7LqfwQfpi8jR2OAbz/suiTf/k1IQDm
	Lmn0IqdOQfGvwrLN7qOWO53/Y4uf6vdCgs50JpDo/NWmi6XWKbBYfmHphKvwGDJShP10PbfP195
	UsXtrb/0aIoCd39uBEAB3ufWihnwWqXmbaL8y7cRNBgLJp4ijwFERPKdTDpqdj9u4TB1vUIj93D
	P6+aAOVqyNTiGlEHns8MzlkSdur9+62farsvJZgrw91FxppMTLFm/vWMP
X-Received: by 2002:a17:902:c941:b0:2c0:cf44:3b3b with SMTP id d9443c01a7336-2c411d7b1abmr212185095ad.24.1781615044877;
        Tue, 16 Jun 2026 06:04:04 -0700 (PDT)
X-Received: by 2002:a17:902:c941:b0:2c0:cf44:3b3b with SMTP id d9443c01a7336-2c411d7b1abmr212184495ad.24.1781615044431;
        Tue, 16 Jun 2026 06:04:04 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c58c3sm134867235ad.23.2026.06.16.06.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:04:03 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V2 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
Date: Tue, 16 Jun 2026 18:33:45 +0530
Message-Id: <20260616130347.3096034-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
References: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfX94So+GNSzTi2
 ndhcZrsExDGKmvwlAlbVRT3tV5f3ygACYxVe8Z5JLigOg7z52mSHuS7TMsRe10qj+0WeGdmQnqx
 CC/tXWeeu4rEXIDPZY9SALYEOOXyy9A=
X-Proofpoint-GUID: mAQsPtq5ZyYRndGL16wZS1ei0L4hcuOl
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a3149c5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=c4nFiuB5qTS8t_IgZ2oA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: mAQsPtq5ZyYRndGL16wZS1ei0L4hcuOl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfX8eEDeWkUGbD6
 Nyw5bXLBE2B+sBg8Ljg2NsSEGeP2zT5dxDfKrMiqcHe6sFVBPCpInrPhS2aURTnQAc6Q/nj3ZFY
 k4skE0/UIQ0xZ2yCnk9rJHK57y+OJsqN6+OFYEu+HIen2C+jSNAHUKUdLnVSm2YxejyKFYD9RgH
 8RWGNeDPNEnJ/UE1VcMWpBC/NhbHw8gJck/02mIlB/AFlIIGv0t2nOWMM9G+1cGXqLqrLUehunt
 qARQ2Vzt38VaWppTtnwjFY8HxgxkXqMSc1euEG94mP6Ot0IckY18pUsRBPiv7mxHH0eFkZtWn1n
 rjVztAENvikUDSNflv0zsfyFW9uk/h3jM8dzBnorSFPgyDGV6owYvuvA9wP4pvxgRKe5W2CSUIF
 blQA/onFw1UnF03b5jnPIDFt2thQtLhMmC8Adxo4i1/g3DMJYG5AVaA2/9O2zXF6bbaVNFmb3V/
 NcSK7M7Sv+me/K3qeeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113414-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[oss.qualcomm.com:server fail,qualcomm.com:server fail,sea.lore.kernel.org:server fail,vger.kernel.org:server fail];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:shiraz.hashim@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73B3468FB9A

The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
and conflicts with SD card operation.

Remove 'supports-cqe' from the SoC device tree to ensure compatibility
with SD cards. Simultaneously, add the property explicitly to the
qcs8300-ride board device tree, as this board uses the controller in
eMMC mode.

This ensures the SoC definition remains generic while enabling features
correctly at the board level.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..e82cba350842 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4832,7 +4832,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,dll-config = <0x000f64ee>;
 			qcom,ddr-config = <0x80040868>;
 			bus-width = <8>;
-			supports-cqe;
 			dma-coherent;
 
 			mmc-ddr-1_8v;
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..3090eba0317a 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -719,6 +719,7 @@ &sdhc_1 {
 	vmmc-supply = <&vreg_l8a>;
 	vqmmc-supply = <&vreg_s4a>;
 
+	supports-cqe;
 	non-removable;
 	no-sd;
 	no-sdio;
-- 
2.34.1


