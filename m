Return-Path: <linux-arm-msm+bounces-94598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIB4O8roomlG8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:08:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FD81C31F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F2F3302B183
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C038E43E4AC;
	Sat, 28 Feb 2026 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgsI8cnD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ViiaeHgP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9377343E4AB
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772284103; cv=none; b=tkI7d42G9B23I0+WtqnQAgriJCMiQix7ykTX3jPs1SRTxbIQ3BQhmtjugTUo9tPXh3tMIJgci7KHx2+hadSB7A8W7kgyxm4Loch+r4Bwzr6iHGTfNepGhDG5C6aI+qzUsY3xN/41TuY7ZqyQbBwOX/ZohbZbD8jzrQYpuSOedWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772284103; c=relaxed/simple;
	bh=vWk8EE0CgMkZpYhxzYKRo2wadVosBsQ675/AQnbrT7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+TfVNAnu2I47dN4zYc4AgB4fCjfJ2HV03xJWFD0e0/9/7gz5oijkaUOt3goHFor+Goyo7wwSS/k9O6d6imbZrxy+A+sK2ncn8NgqKx2tuapdcwBz5T/bBukpN1WSSzHI7jvAoTyD5Zj7gQ67SmgFYFLO4+lM0MxyHcgk5aJxC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgsI8cnD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ViiaeHgP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S90BMl2683913
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hLvzVJ46a4+7e7RSTfQ8fmEYz7sY1ZV+usD7sQf0qpc=; b=WgsI8cnDRTOTof2K
	OMPXxEw22iUCgkV6iFMh74O3x42Lx/CDp4yd+wCOWCVxZuZpKUjPNycNSAZhfmHD
	bEevF0gd7NA1NhAwQxll4H7SHkiQisLURYnmkdT+URTNB8xHul7Zb0uDaSKQzKvS
	H58901dY3QeuA0ulsQbMGOfeRzBK3Os4Rx+xcU2RSg67fw3t05O1OkNUaHN5HFRU
	WmW43iwujd4jrY0L1mCFdVRGSstOf5j+Evg75Rqq8DIJ/3wEyf/WWHcCXcaqMWEt
	WYuijt0UF8UiZm9kyR0nd7Ar/eRP2KXLfatDEu8GtO89iEsRXqQZ478rsvh/T5iv
	7D/r4A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd0y4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:08:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ab4de9580dso181275245ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 05:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772284101; x=1772888901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLvzVJ46a4+7e7RSTfQ8fmEYz7sY1ZV+usD7sQf0qpc=;
        b=ViiaeHgPYnTrc2pH8oyYr6+1cKZa9fjYrh5wgfwXdxjCudMab6fGrKs2X3TvZdMjOL
         V84tO1jGXKbwl3hMTp6p/BGSvt0W4UjfRaZA2vyqZ+Wo1NBWtuT2qqT5yz1qN5CyBqn7
         POeBb3mifK3tXLxj1xabcm/xvPV5td/D70NM2gv2GFsTidGf8aMcq3WPDjJAKTxZ2aay
         WDJO3Xb7QNcjokquwdir00MspZnU5pG3MCNKvVqWVMrfTC/SpgxaL1hx5P9fX5T7VtH3
         myq8uhs6Upot47wzz4WVh4nG2aSNYoXiL0DXU6pydAIVry4VHTa9Hw/ny7pUhiUT+x4/
         tL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772284101; x=1772888901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hLvzVJ46a4+7e7RSTfQ8fmEYz7sY1ZV+usD7sQf0qpc=;
        b=rWNjFrAd44G8ygTYTut39GdpUWPk2BAlWMiX4qWkAHIK7jkzDcMEtMA8p7z5oh+YCD
         JThJTAbZ4sJBYWIMc/zEizjGu39bGdYKTAHPaRVD1KwLlfCCsZgUhGpz9Jly4GONBf2o
         K2V4jC/cdV+hjFMQqKS9cTW/xZnta0WZ3QEmkuHew7keEILlLju0sPuGa7lXS8TNqqDs
         PPYkemMojNABpli61bWI/0dWqwQ6ffIONwnVgBiozY6+xgVChuqVKV1PkEnpuM9wX4hI
         6ith13CMyPYJdFgr1TiJynPQpDiz2ioS1pO4LLzqBdcad7f4lOpzdw5V2PVgMUXn4o9U
         F6gA==
X-Forwarded-Encrypted: i=1; AJvYcCVHEctq3x7CP4tTCAmC5e8tazCEEQfju55NulmY2BXJpScD+Vwam5hsJwEFZ0e+Sv4PPTvBqP0OFOGf9xAm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/JdIIziDl+tk4DQqTV4sXJMs1rqlo7yGgJHfr/Ay3YWz2MQeJ
	FKLhScDdP41KgKtUrfUph/zWtxaIkMTlLkJf++2qZOyvjMCS6lX/ZFCqr3/Zydm5E2Ej5O0KHJQ
	M4doArZnVqNBSFh9YlIrsJ9ATiDX92f8rGBsjT27bliY+wMMYRaLmp1H9+BUcJi+xVm40
X-Gm-Gg: ATEYQzwZK/+WHnYxI6QqhYlMC8rZG26K27r9dnBM/ie7Z9Nl8qfzdU5noZ03+l9Fg5w
	4DfGSn6U9/I7b2RXlkn7wmNkjyRJY0lP1zbw0PYp+i6hjA5+gjZhqm5eGuydWxDjLEz32nb5uSI
	kO7mXtdVRW7saR/XqyyL65ceTm54PV7pb8kVrKnUHqCMm58stAFEOgiN8M+1tjZZMbXp8nXwTkr
	fukvgY1GnpHro34hD4RkzViRagksy4FKWZ9W3ZDL/dFLmGpfIyHvzIlQ26g1N5js1uLw0zt0R35
	ITa3qas2gFWbD7onFOzJXQ3UElvsTA0otA6uWvcKvXLnN2MfcJuD//uol3ri6irtnTsf3TKsxRU
	hs9LQgXz+b+nD6capDFg+CzkcyDhvvIAw/WpW5Ta+tgf16JktMIrf1KTLjezIMaHryznqL3N+fb
	tTjqz0JzcappR3cwb28E/+Ym04xv/LHbGO04KM4aLMS6sRmop+9O+RlkI8
X-Received: by 2002:a17:902:d4cb:b0:2a0:d629:9035 with SMTP id d9443c01a7336-2ae2e3cca53mr78424195ad.3.1772284101188;
        Sat, 28 Feb 2026 05:08:21 -0800 (PST)
X-Received: by 2002:a17:902:d4cb:b0:2a0:d629:9035 with SMTP id d9443c01a7336-2ae2e3cca53mr78423915ad.3.1772284100722;
        Sat, 28 Feb 2026 05:08:20 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f996sm83947035ad.50.2026.02.28.05.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 05:08:20 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 18:38:03 +0530
Subject: [PATCH v3 4/6] arm64: dts: qcom: ipq5018: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-imem-v3-4-20fbcc1a9404@oss.qualcomm.com>
References: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
In-Reply-To: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772284083; l=1186;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=vWk8EE0CgMkZpYhxzYKRo2wadVosBsQ675/AQnbrT7w=;
 b=FSycVpICloTXfawHdGB5GOka3wxP+i4+aeuQNs54Q7yWOPaG1YUxirMyzUc6q59fua4TgqrLw
 q0Rf/e6ysJhCWfBQiHW19xJaUNwh8gU/Kg64s1NFdTquWt/LExxkoPb
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEyMSBTYWx0ZWRfX3BeNa+b7TPDn
 DONV2C2dftR+IbFcrA3iJfOt9BoTBcyg3+J/qOcrACihj/8BzjpawSlHJC7Z94t3+F257oa2vFC
 /5DiJFhrKsP1or47hes2Ezf75a3oekINj/DlYu2UC76X4q209N5KJrud1rHYUMx6agNUMBRi0OR
 b3EcHd0fWXVKP4uM9ojSci0s3/cYVu3rEnBypzbRNauaLgbqYDJnKtu/abneLsxnPEZbp0QJFhS
 SggVZnxniwuUE9L/wl0L0JpxqaP2Dit3cmJs3z3xUB/bL0UG9agykEresgQnFKh0Vfheb66QKL1
 3igBv3byQA/Z/oANGpl/NU+ldk5G4O0Y0Bk3+tQYKv08OHTsWQQobwT1j3hz+e+hje1CmiExzRc
 gZTKFmtZ+XMryUcyAL1KMxI0kOY5vdUOHomljsiLu4I3sSU/IKxBCpYkWWtbi4BbQemV5X59oOA
 N/e6prWw5mqmyTSB7cA==
X-Proofpoint-ORIG-GUID: pqd4EwKMTUOjDmbb-J6fj06wblBizM3x
X-Proofpoint-GUID: pqd4EwKMTUOjDmbb-J6fj06wblBizM3x
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a2e8c5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=g_gtcTFTaut2jdyMrvoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94598-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,8af8800:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.131.57.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1FD81C31F5
X-Rspamd-Action: no action

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 80KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 6f8004a22a1ffdb6da0be410b772be5fe0473eef..591adae3918322f97a5dcd8b191be1b50344e3d1 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -567,6 +567,17 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5018-imem", "mmio-sram";
+			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5018-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1


