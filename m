Return-Path: <linux-arm-msm+bounces-106895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Jh/Mju3AWr2igEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:02:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F03E50C6D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 184FD3031035
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024883BED69;
	Mon, 11 May 2026 10:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRLkYrx6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V9ZwAQyH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C633BA235
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497009; cv=none; b=UojpHi7u7swBhxcszDu6pDhudwDHW8/SnW7QDwG6LDbtGtG2ka1UzxSoHNPIVtGypmv7OXxCfm8/x4kXb5OyotPzeHFz8/+U1JbcKuTWCGIvDhsx1zRO9ga7zItumqua8itmFIbWz4/kDo0qgGkk+H90rtSZLUzQFB4S40xZ2kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497009; c=relaxed/simple;
	bh=bs9a3oMWNVMsY4l8QZBxV0zCUtpnwr+E4kDuvt6qGpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aDC9jPt0oKUMrkUUeGmbGLHVbiRLD6EMRVgrwFiOkGL8G8dsZczM1S6HO5fVJj0lOn3Q53Tu3s57FBC8K8eXgvUAQHwfa8MaxqyI0/GQIOyisNi5wjIQVWHizh341UY4I4jL9DGTrC3djPAZteGzhH+txMHS/5IZGt1uHhofWBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRLkYrx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V9ZwAQyH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7A4k31258476
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ubGMY3u9o/fCPPhuGtZ6/X
	tvtPsFVFXgNP2iwLl1pO0=; b=IRLkYrx6Xn1QG6NN4dX24aLkJTjpQGnwDofhHK
	ZUUFuLDG4X8Y+IU+noZP1qrISLT8iBDdV6mL4I3Kxu34G8ttO7hIP3muIJ21yBKv
	zhEF6LOMyWrOKrT0CB5wE18g9wa1chXFmbBXkQyWQ9WhHGWln/WBiTXLr7gP6ptI
	yVarTkM9voNQls/AbWUlrGrm5QvXAhIHxqndmEmoM7U6KvCcg1ht+pRdJi+EuG5G
	Cyt2y9XwF+P8MX/RoBZ6Y4joVw6wmslfdjqHW9plb9m7TjnZubO4vTS52U6GTutp
	iaXH/ZL6Tr7UrLqb65xKRuyt/q/ic33biqYjMwroq3nKuzUA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag20tdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:56:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c797d8c9c2dso5049148a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497007; x=1779101807; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ubGMY3u9o/fCPPhuGtZ6/XtvtPsFVFXgNP2iwLl1pO0=;
        b=V9ZwAQyH0D2Cdum2naU6O9hPTovxajp/bqDwHk8XMCVcSY8rP3AvECAdU7OvATcCks
         o4GD2HLGFStSDtrfvhF1DkpkW1DBoBYbp07i3zpC4W/I/hO/w8ZYyQ3qQ1Yr5/4hY1bm
         E596PMdpGRlFPub3XR4JUMHPw70seo2xb+RPH8PF3b4zTn55CZUyTHN49UQP1a3lk2s4
         dUr0sy+NtwoRx0BM1xFW6zuJLO0AzzUQzjwZZham38dlS8y07jTNTRf19147H89duIuL
         MHimzOgoooJd//qLgX7xdSRzgwiRHCqfq2tw/85R+p05ycQBweaowo+gytMHdFdw0EwK
         teNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497007; x=1779101807;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubGMY3u9o/fCPPhuGtZ6/XtvtPsFVFXgNP2iwLl1pO0=;
        b=NxBDAUmATF96qZpt395zItwmTzf4jlVbquoejaMy/TVhWtiT9bft/hDvPXL2M1V9Aq
         QB01/HdkK9S4FqRRe2FOWrH7xQvzFaNHqMeliSacexLZ3N6+B1th6vSODayiIKVXAlYb
         vZlJVFn030sDFCSuVXC9VohxecIkamOjeEmc50Y0Ceg/A5dpSTX6hWkFymnV56IHCCYu
         QplqLwLAvpLxqzAO0ZyWOVQprY7gEAydJIhWGdwGhA9PLXk1t1raTHx0GeIikJ8tRQo+
         BofuThntEWIjsCX0A0duyBMiS1ogSZuxteBnc0QnHwP/HpNk+zvECsYNwRkIWoI3TbLe
         Cd/w==
X-Gm-Message-State: AOJu0YySlxYY99J5aFPWSMRc0/rFIH7mYMFX+rihKXmEyhHfdU5vjFXb
	spUEN7F6ERNpoTVumTT6cMwJl4XCaiJHG6CehK3DqXCyWJTGwyQka5T1W8z5BYYTsB4qK9n8d6N
	1iLMtQPV2Edoy7eWiC8bb/nuNRMJwbFMNcDLBUMfxQ/AfW9Ac4sEzpmqQAvDiia9x8VPuszGs4D
	yP
X-Gm-Gg: Acq92OEJ0qx0n7nvW4r5ZuOF80oMVrWt08N6+3eqq/Ex7vaijeaDaICA9/GuHPZtO9x
	fRoTaCjYC8JZVt99LkR8URM/4ZbDwOPQcNrZNUBuVd+dVIAi6CgPvx3i5BmgHo+vvPymHdwWgfi
	sQQVCpMz0p70taW1CvMk32vUJXBk7i9fK8Er1zed+wH/tAFs3wurpwHxspbMDWP4XEssc3u5W+N
	guZ6nipH+zQWVTGvnR+2VfFUFL+UcoW+DVH0T+ExWBrZV1TvnDIYpvBL97LL6qE3JfRUgtq0VLr
	19LNcjEazQxUzDGB6lR0FYzd7zH51DNrbdKZb3hPw979x4IV8GSJtgaReVQcRntr0tyjS3sfewM
	G95F3ws2VaUf9m+XMZgHLnnodly/k9Ij8NSE/iQ+BnDT0YxfvYjxEAgdyYKt/qfwnqUfX8eulHe
	CsR1cSjePq9Rub23hZMVXP+BYfDpycSjL2GEr3o1MBiHlgo9XgGq7+ss/B
X-Received: by 2002:a05:6a00:a02:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-83a5d873210mr23535755b3a.32.1778497006674;
        Mon, 11 May 2026 03:56:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:a02:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-83a5d873210mr23535731b3a.32.1778497006247;
        Mon, 11 May 2026 03:56:46 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcfc0sm24254762b3a.42.2026.05.11.03.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:56:45 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:26:41 +0530
Subject: [PATCH] arm64: dts: qcom: ipq5210: add watchdog node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq5210_wdt-v1-1-870c4b7f77b6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOi1AWoC/22NywrCMBBFf6VkbWAmNWnTX5EieUx0BGvb1AeI/
 25rBTcuD9x7zlNkGpmyaIqnGOnGmS/dDLgpRDi67kCS48xCgTKgESX3g1YI+3ucpNHbLblgoSY
 Q86MfKfHjY9u1K+erP1GYFsV3MdJwnTPTOvtVmuJfY++5i9wdpE1VFa22TtW+ueEi8y6TDJfzm
 aemIFtHhQEr8IAxUiqNSaBK71NIxpeowSZXl6J9vd5hJ7oB9gAAAA==
X-Change-ID: 20260511-ipq5210_wdt-6544eac908e0
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497002; l=1155;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=bs9a3oMWNVMsY4l8QZBxV0zCUtpnwr+E4kDuvt6qGpY=;
 b=GX0fh/PNuar/dnrekuBocQttmzSvjdEQun2nsrnst42FbKU0PqiDdkygbch8Y28P+vDT/zLGN
 1DrE3w8fdMoDKFZvORrxqKNyNdHpOsmR28dWziVJWaJfEasgF+q8lkh
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: IPpDdU5QLnpcaSyITKzLv4sA3qGV1CaU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMSBTYWx0ZWRfX2GjnGWT2v4rk
 0i987Uu8q+L5xcSgiOqNzn3kZbQxlmyRNlpl41KZvMo1juIV3AbE7WmGnqeRTd3zyStNpYbi2ZC
 Nq1m2SwFcvmtOBQQCbkw5QfZ6rgDcUPli3dqCGxlh7XmeGIoGaLX8BV1yo6IisxuEELO/s+mvJV
 2qJaqW34U2Iua2M35gAUcBsjP90xwU5dll+9l4+qE8SsaLYmrVIEyfT8H+llOHpgE11i64aoSWh
 NXwVQ9US3LqcfUp1zA4WyHu70cOTWmZ3kDe+denclDsxh9yq1WHiNcvgPv+ZdXZnl0jzG587h6N
 hH0GyXCDsB/px9tADj5theymseesOTJUBD/ZoS0phpajmhtCa/gos4QqIMiopshNOhwj/nReXIq
 u0w18jqd6Xl8dKwcQPOZrqw91jWkDEkg0BGCPmIa2+udIdiMf31rk42EpCqRKYsWefde2v4aOBb
 mHjrBLwV0ZmPT2nKTPw==
X-Proofpoint-GUID: IPpDdU5QLnpcaSyITKzLv4sA3qGV1CaU
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01b5ef cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rKBl3BpjdAMFLJizQwQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110121
X-Rspamd-Queue-Id: 1F03E50C6D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.7.208:email,b120000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106895-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the watchdog device node for IPQ5210 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 3761eb03ab24..2cdc10529c48 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -236,6 +236,13 @@ v2m2: v2m@2000 {
 			};
 		};
 
+		watchdog@b017000 {
+			compatible = "qcom,apss-wdt-ipq5210", "qcom,kpss-wdt";
+			reg = <0x0 0x0b017000 0x0 0x1000>;
+			interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&sleep_clk>;
+		};
+
 		timer@b120000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x0b120000 0x0 0x1000>;

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq5210_wdt-6544eac908e0
prerequisite-change-id: 20260511-ipq5210_wdt_binding-9f77d959a28b:v1
prerequisite-patch-id: bc56c2cdb782ff7ff58f9f4ab886ad5d8ef146ac

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


