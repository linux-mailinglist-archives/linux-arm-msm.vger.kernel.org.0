Return-Path: <linux-arm-msm+bounces-74941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFCCB9DA05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62A9F1BC3564
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E642EF67F;
	Thu, 25 Sep 2025 06:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSVoe5gl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F6C2ED843
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781794; cv=none; b=SKFQm5EjkcB6rfGwSzohGyfCTJj6h0niDam+YMDOxWZu4Pn1v1jUfX5qwItPpty6jg3VMf0TF+nvpQexSCSCBqJRlc6m1Ho4cQqOlCEloV6t5TOXA8GIIHV6nPm0f1iywYH0P71FOt51p5gYuoVAlfu8g2fngQbOMucgluwFFaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781794; c=relaxed/simple;
	bh=E3B3ByaBtuMatGnp2Pcxduj29OzySduOTeUAJyaDEsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HV+oSe11LJAbD7Lvg+crDEuvgfsALMjMLECeTIr99koXdHoRn1wgcx68PGru3mu1ke8n5rhcz7IT/c3lOAELF4woworkBydO4NWGYdbKVHtF06XmMv2bpaVnnvU3grRPSd0BcBrrpcP97/hI2K61vdxvI96kq9XXJ6A0AXpQghc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSVoe5gl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4auB4028515
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GcCj/e9tgK8s4kiIpVDjeJ1bIplDWEorF8EPo+A1CcA=; b=TSVoe5glvmG9l6JY
	q7VDU3ShWssUSf7/bQUyB4c6WIh5NbOI7gkUT14Wr2QoZiTBcwSlvPTkAZGZuUbU
	jRsZnl9asiLyazehOmNiZqBadgpOa/GT0DddQbOeHkf99HQYPi/ZBJ0xoERJXJOz
	OLKe8QOmLktMQzWeSfoccL0rLIsS/Q0yEVZaD/6DL+9V0oa/Zf/7sraf6FTgsFcc
	JVVjM1CLB5fjIK9tkkzFY7Vb1eZyx4OuIeITTBaLSnBu+nZifbeupq0/kB5cPlL9
	EMaUaBWruq05lWP0juBJlHQXMx5AVU5IGEV5UOXwlASBbFIR6klTV4IJZhKv+WJG
	HxWpPw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup08c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-78038ed99d9so988821b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781791; x=1759386591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcCj/e9tgK8s4kiIpVDjeJ1bIplDWEorF8EPo+A1CcA=;
        b=htmJYPbxl5DxidvkUoTTl96cwsbykzonkwd/ZvtltuIVJqYjGVGlSvfjsKZJwmN7lz
         uQwHwLvQZHr/+p+yW1VgkGgFPog+tfaHr/Riwk39OPJcG5lkEXSORFjnr1Q0NJcAoUwb
         4bfgPXFu4S1b7HLaBHi077Y7vKGbEDvF4R/RSWCkGj1RMlnV0ZEUEfYguSv+dxCkbJyl
         lociTTL9Ahj6leb/TVryFbf6FGdQgvqKhWQvfSVfB5dG+9ORvOw4XgPOPMGCRi/PKqCO
         PADuJZlHdLBGdjgaWPoPpLJY15CXQo2pnmC43bKa3TpyALUZ8Q31XF4cnexU3AKjUmGC
         0UBg==
X-Gm-Message-State: AOJu0YwqrUjBAAYFbBLhE8+G04MeOg2GPUXn/xqkuk3fGppMFCEBBHJH
	9wu0nGpE0icSKV7OxaczJUaa7oRDQnKLnbZJIX2XlqcjGyNgq4rkDrs9C5PbSI5byPIp9kZipvv
	+Wim8TI2gD1c0EEjfpADuvP2KLdQzshAMfSLdfpzUNS1B7BUCG60GowflFfnxZ//UiB6W89uhl9
	Rj
X-Gm-Gg: ASbGncttP+SQiX/b9zN1UbwP33RtmRv9dkPFP1O7oIBUSOvbylR/0KEYUgQDYfoVYxz
	maqNG396zw2mzCwdzZZt1zWMweQa5h1n4G06xtnMDKwQ8j6IwHiimXV6JwwH+s4JgSrDaG9oIKD
	ZkI30OtX3jGCRxoJ+2xS3UgE+6oxnM90xPWcSjMQern4JlLFjnPa2X8r1tdB+a83P7wcuemMMmQ
	aHjoGJuauiDAJ088lsOADFkP1RISOXggfgLh7hYcg7D2ZD9Kum+YopDtRGbe5pPFHVtJ9ZdjlEy
	StZIAgu5cGZwvoTc2Z1BVmYdZqTD71F/n57ydHMd6pndWDZdOMAV/QjyIuhTRS4SluSf9+3mRLk
	papKUDDfTwmxHBhrYGtTYH+Yq4Hcr7TXn9CM7DaNEo5kGgF4co7xA0r5zotZ0
X-Received: by 2002:aa7:8896:0:b0:77e:ec80:b3e0 with SMTP id d2e1a72fcca58-780fced5bfbmr2922075b3a.25.1758781791354;
        Wed, 24 Sep 2025 23:29:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8zvFmAMXrlLG0zIap/cG5mPBtSwZ0z6zFscRnmqOoRmAMSRaV6FOZu/Gm2TRFZJOs+sct+g==
X-Received: by 2002:aa7:8896:0:b0:77e:ec80:b3e0 with SMTP id d2e1a72fcca58-780fced5bfbmr2922037b3a.25.1758781790956;
        Wed, 24 Sep 2025 23:29:50 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:50 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:23 +0530
Subject: [PATCH v2 17/24] arm64: dts: qcom: glymur-crd: Avoid RTC probe
 failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-17-8e1533a58d2d@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d4e160 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zkxicyaTBexjGtpFqaYA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfX53PI1Vsu9Yp6
 +xtEnyEdF2cy2bdrQKSJspat7fDS/ZdH8pKbgDf9ADEGzt9by20u/yMTiaP8SrNuTvkPms7FmSu
 /FMHP8Aizth3n7QajrRgchSMVvRgZG5gkPnV9AhI+0xlAkGfezEELOxc41YmEViL3xioeCmTyIx
 q5kHf+nyetc039cZp06xIYOG75NMYOIx/4Zvix01hLpLdmxAs6EpwjgsvvKtaARdnAxyPAT4ZKn
 fgawHnxl2HTDkEuiuRJ0ivt/oSqFGaIpCZBO98I358nsn7mpzJ1h1+UzBPbuNeJlGalM3dkc/5N
 rsl0xPav43zNnEbyaO5RVc1WEdKxw/c6gh/fOqB1EPDF8auGn0bA68xLZzDnkQUIF3xzej9zfZa
 Q7jSrfqX
X-Proofpoint-GUID: xummPaN53bgoVPSyn7lvIT6Dwwh2vw_m
X-Proofpoint-ORIG-GUID: xummPaN53bgoVPSyn7lvIT6Dwwh2vw_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

On Glymur boards, the RTC alarm interrupts are routed to SOCCP
subsystems and are not available to APPS. This can cause the
RTC probe failure as the RTC IRQ registration will fail in
probe.

Fix this issue by adding `no-alarm` property in the RTC DT
node. This will skip the RTC alarm irq registration and
the RTC probe will return success.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index d6003ae515e37049fdf17d6b604b974dc8e9fbbc..b04c0ed28468620673237fffb4013adacc7ef7ba 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -429,3 +429,7 @@ vreg_l4h_e0_1p2: ldo4 {
 		};
 	};
 };
+
+&pmk8850_rtc {
+	no-alarm;
+};

-- 
2.34.1


