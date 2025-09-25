Return-Path: <linux-arm-msm+bounces-74966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32249B9DB2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83E203B94AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4F62FA0FE;
	Thu, 25 Sep 2025 06:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0yzl+HM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D182F9D9B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782057; cv=none; b=BSIscLDWVHQud5yg53wm8fj6lvOXWgOwZK8I3ybXmFWx86LOJ1UZX+AhWSZZwkaOkXI2beufQae4sf4bJGyR7tGk+Fvwh0lKoF+JP8ZIYagzO06jYVk/hgXcCMP4XXVons0dAwwMd8v/hENbm/ppnRx2eJvjCo18h7tnE5Pqtds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782057; c=relaxed/simple;
	bh=E3B3ByaBtuMatGnp2Pcxduj29OzySduOTeUAJyaDEsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jNpTQ1WLTUXZ8yiWACkOoqtttXkix+qD24vfz3FXZsIuJJQmmehlwIv8S9596crj0GsDFnBXtjPOcWeSNZqmEsw/6SUPUn/szPtEuPyR4mDjH+FErwp0lx9uMjJ08oJryi+uX3Nny7MZWXlU6qbixndD8nIqCqydKf6K0lS/7jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0yzl+HM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4a9PB026667
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GcCj/e9tgK8s4kiIpVDjeJ1bIplDWEorF8EPo+A1CcA=; b=L0yzl+HMC5givkPa
	/QcVoLS57VY32cGX91AKDGfP6VG+vN1he5Q+tvXOjMpRGyF5J0ELf8En6QKylDgy
	Lz0IpocL5qPvg5DbdCTRSXKL7aLW8DIMrosSySSTjR+LVFDWoYS2eIpqt2cbrHl5
	zfHwzPmop3YKlx9qcZzN8oqXhk4Me4lJ3o7+bTDndbmWsSf3ViQx3g8OelmLxDII
	IcZ343Cu52WLYUniprLkYLyAbBijgZsTnTERImdrQSviBKlvZqegOECmEGE1zUbh
	qnpm2rvT8jb7Yt7Z8WMRsB094pM4lDInKURtUW2dDZVX0zns5sOibrKdPsZkWp1c
	XzvX5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup08we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2681642efd9so5076115ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782054; x=1759386854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcCj/e9tgK8s4kiIpVDjeJ1bIplDWEorF8EPo+A1CcA=;
        b=eLkoqMT1Yes7jyopO9LSfQkKcybLOlGLi7oQcQ4ux+/T+TB9Ts/8GpDtjCPjZlEXIg
         w/sgYmF3ZFmS3YDfxsAkYQmia0OjnPoYOSFk4MX55hHYQ2AKyg78pNhjCZSuL0Pb3GyP
         Nh2+UgL1eZS8IM9HVv+ou+o+qVQI5mFeT+aMpBPahAL+Cpqx2Ao2cByptNVltvcrKGJq
         7t/MAtaDhHBokYQ7tTM5n3/GPbE3xFutyyUdNHJzmo6GEWmwOFo2SOP7Hz2tIJ9wYW51
         2ir8jgp6w52Vg1OPiqovGv35nOgptt3SmXgHYf1nqNloIw3qYQR5B66EuznxAa8Tteuh
         pQXw==
X-Gm-Message-State: AOJu0YxIO7uS7aqeFaHf0SxxHpluPJYqewV6fEMYvygmQ7Vgti0khgYh
	b6G5IKdL2ufzTh7wJmcYKnxE7ztei4KYGGzK9T+65FL1mRpKcvXnIrmIFuz7UsncUczIT51Ar+8
	6O2DQsVce4miNlwRLxxgWvh+ApOOAWRicD4lcaVg7HUE4QQOrfln5OMdV9dZlF9EGdWwQ
X-Gm-Gg: ASbGncsG14gF8RXWX4RYtnvIPWRB+n+NOu63nGOMQ1yWLGkTBXkJctVdUfGlHXTiE36
	Urccf5mPCfgSZeRoEikC8pQwWyo0Sws+THIyYNhZJ/Ttlk2U9YQj5UMUC3i3duWCv4dEbClxAMj
	2ZdqvpXjQR6Ix4sagvC8novLdpVjuhwNqFYL5Z6FP7m71Ik1BIVLy//VdCirIT3yjy2060IR57F
	g6XWfwpnUQWirtUf56LKB7Y1ahRzi0Z/uafKfYRyBZH6mG1EdSR6PrNN19aiPW3D8Y4ksfg0SJ+
	zfoqIIVrK3sW+qdXIrEZ01D2+cio/gfTfNLKmlhKxgXfDeCX91YPp7hzZEl+mbi0GHyd4DJ9Gxj
	TQd2COmABNsUp+DT8xhoe73iNzD0reyRqC3nB8GNfufnwD9+fqgqylGs7LmyI
X-Received: by 2002:a17:902:c94f:b0:24c:7b94:2f87 with SMTP id d9443c01a7336-27ed49d0885mr26649295ad.14.1758782054500;
        Wed, 24 Sep 2025 23:34:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUFPSqP6cvwwCq5peM3jwv6x/ZxYdMlwDMExGKphwKYahwrK3QF28j9pS1kOEgdaF4UmDIyQ==
X-Received: by 2002:a17:902:c94f:b0:24c:7b94:2f87 with SMTP id d9443c01a7336-27ed49d0885mr26648955ad.14.1758782054066;
        Wed, 24 Sep 2025 23:34:14 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:34:13 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:25 +0530
Subject: [PATCH 17/24] arm64: dts: qcom: glymur-crd: Avoid RTC probe
 failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-17-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d4e267 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zkxicyaTBexjGtpFqaYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfXxikhErhYOTVL
 xFg1InjBHxG5GfetQVHJ8oE1WcAE/uxqNNevEyandHNHHIVDx0R9odlEbEdsgqmtfG5UJ0UKYKr
 z2iVz337zOJq8gKMB32tZHeu/v89C3nHvP6CecbdT9oNlvQ6OhK7O8YwKgrwBZNMMmvU6otlXcg
 EsUIjSEIPtsom1bgAf+hHuuZhtkhKDfjRs9TY4kMZ00Gc8IGELey/j1nOL0bVfMQfAAz86eY3hG
 Vmwo8INMKl8UAZ0WufzJkRxPpq4+glaIopaaprXLq2gktv66FfT/S34LN4C20ZLelTERcjqg8Ph
 f0AE5W/JqWFDIIl4fRSnPJlEIfOtyJ5qGyO1Qlz2sipjfx2Vr5Heqqf5VQCxq5pUah1LrpCEKd3
 a5pIOHJn
X-Proofpoint-GUID: lfKptnd8vNILvfme_m98fWimkIKQV1RJ
X-Proofpoint-ORIG-GUID: lfKptnd8vNILvfme_m98fWimkIKQV1RJ
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


