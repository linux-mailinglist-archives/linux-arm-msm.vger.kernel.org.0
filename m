Return-Path: <linux-arm-msm+bounces-68700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EEEB221A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B46E502360
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 08:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4F12EA467;
	Tue, 12 Aug 2025 08:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hq2rRye0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10FC2EA15D
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987912; cv=none; b=HeqdBunsOFIljuNhkuTYug3PlAPigT0N6DKoulIcPNLdNN11OnCsVabnZcd+oCqJUljALPjINItjn7vPxhBCyARnKoIAqZZyHWh4UU1k/xalHd1iHAxwnAo1RtVB1A1EDdXORWGb3QxA0U16xB1yvP+L+meaUHWFgNd1yutS9RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987912; c=relaxed/simple;
	bh=QuD88quV2+ZZSG71H8tKu1kO0ROT5crAafRmiD8dmdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FcpkxtK8qSreueRa8tsOs9myMS88Sci9B4PzurTyFZnZ7h97vj3oDDk9JlFygfi25ox+pEs3TAuElBfGNu29abx9EEmdp5/KbL/SVbfiDYJuLgNQUL90QNVWUGsKWS1j+WGfAKqRUrlPjwUlYUpEEmhdBkoGfH6YGT6yPWyFb3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hq2rRye0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5Kp51022174
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWmqQzdMPq
	FddVCcAzQVRWG47+T57+MG8ITHFHowHo=; b=hq2rRye0T9cHP5DKcQeKgSDynMa
	EIhBIA1peD1eXbwpJmswOQ/xwm6Zh/jBe9zEO6wsitSXbDaLF2ZPj6YAaV6XHiuB
	7BNumW7iEfGa9OecXDNm4hYJ9wJ62wzMuAr39Wzejii/DWm3XH1Y3FJGhaldTHJY
	QYKX4bMIJKmCSQVpwljOb9O4XamLVrunA+Po5xxKayWqvVKpC07iVF8Um6uBjhpw
	UkBkFhfak2DSsIzwQf2i4okw/zJ32SASrOuJpnR8UEyFYYT6KiSXGA8PNr8hZCb4
	pxSZ3yieZMhJr3cKjZa1/q1YNFn2llKsq5n05vE9VbKD8OcT41tqTl1xdJQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vjaa7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:38:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23fed1492f6so77067405ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 01:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987909; x=1755592709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKWmqQzdMPqFddVCcAzQVRWG47+T57+MG8ITHFHowHo=;
        b=mdBStOlMJnQkLutR5BJo+xfTGgyEfrkHQ0Z3Z7ilogwunjtC+ZwqY2ix9ubmM6ZcwF
         2Do89663kw6yAQnWivompnwRKhIHM1SGXfQvsZQ3Z4pQiKYueEbSVxjGInC8mRcBfsLq
         CsvW26Rh4e28eL/EbxmrBC8hJ9a0AA1k5VC8JcJ/Sg/ghMZcUNh+rDnhwC8p6FG1bgua
         6cHt0/6x+Gu2AsjQ3M9puo86g//a7vpvD1xKO5XhQGg+9QfR7FdSYbo+ts0rw5S6LImh
         b1C8UXwwHGAO9UVtYu6gE4wvKe7ilcsNyL0rPPInIAgQqFWdLK+yhbyiEA87wd0+oKmj
         8neg==
X-Forwarded-Encrypted: i=1; AJvYcCU+E2hXGW1oNl9Ro+h7vc3mXbPe7Om+h826yULCUU9ZDBkdTGwn92rStq48MuV89q/mIxeNOxC96R+o6qsU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxez3wbmLB7nrK6k8oZbN/ZyriB3DpEflKTPlx2eXP5YpabgUqK
	XQA3offyWHbtnos2gYGkRvgCQv+77wBSVbNd13lXsg+NTUpoO3fPGwR8pv9c8Uebelh6zTc8ZYk
	hjSpKfpKcO78XO3Z+7W1fjiYBEIsrygOCkjVPBUK12JvF+Pm/X5R+V6/buRKB9l2tkCSG
X-Gm-Gg: ASbGncs2p69//qfyq9lykU2uH53oqCVDKkjMibr26qsa+bVlzFckYw0rBsL2A1mxzXM
	T/FjtMewKZoDHiMD3opUU19wsVoMksU/CWCytxrODytQuh/h8GLP5WXIQ5HJ8o49h8F4fRxViZr
	0k83/2x77ujrkw1bN2aW3RXrScsI+Nq0Q1P3SfeRFz61c/MJnZfMMCURc8oOB2D5MxG4al2CaYr
	4Yxy9OlMju4tr1nNYbxEETHd5+TzUjkIXL9QJvvc1KWl+KEaN0djzSX4miNL3MMiucje+lyuzVZ
	HT+cqQ0hgECstW0VpobISnpPpa6PLEyW39Sm7oXRnGp81nQl0e/AI6/yVnNBkr9rGAVyWNSj1eM
	YV/20LzQtfe4Zm+WwWtM=
X-Received: by 2002:a17:902:ccc2:b0:240:99d8:84 with SMTP id d9443c01a7336-242fc38ac30mr39407835ad.52.1754987908697;
        Tue, 12 Aug 2025 01:38:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoUSP4uUhj7WlazCHA59ecFxrurDGloo1nWYrazR2qhQPlOy/gay3zElJWlYEMBfhndfzVmg==
X-Received: by 2002:a17:902:ccc2:b0:240:99d8:84 with SMTP id d9443c01a7336-242fc38ac30mr39407435ad.52.1754987908254;
        Tue, 12 Aug 2025 01:38:28 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm1915345ad.175.2025.08.12.01.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:38:27 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 9/9] arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
Date: Tue, 12 Aug 2025 16:37:31 +0800
Message-Id: <20250812083731.549-10-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
References: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX7RIkl3BBP92d
 SyhcQ+0xRd+XfHY7kAIblv0naHx59kpWhpUuA43H+uioAn82HTV0pkXMVGs+L87FX0Js4I2L7YJ
 s5C9fOhTWb+xNO/ElOnybsBtbv90Cada8mEq1QrxEQSa+PyH6KtWmiHLJ+8mm00R3yCK0lKWEnn
 AUp+PtuDimnamQ41cTzjyT9E+ekIwL2LIObj+WsEmy9bioFr1eT4AwZeyF7kjukJSD2+6MSH0YI
 2Cviq4TnV2AlbY2oYdxjpb+BJqLhVdDAF5otkrpwwvIJo9XkB1d9u5qGx9ewpjkMp8KDCHhcr8v
 yCr6QwOthmZu9EHsqbLz2NORkVKGyAMQbnuj2wbi/XDJsG66qrxkrdVRSMYKEM+okmlZv3tqKHT
 wNd9MRlE
X-Proofpoint-GUID: EJhAwEMg6w6HbzoJxuwCo8TKrC819iph
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689afd85 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: EJhAwEMg6w6HbzoJxuwCo8TKrC819iph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9997a29901f5..4e6684a6d38e 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2762,6 +2762,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etr0",
+					  "etr1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.34.1


