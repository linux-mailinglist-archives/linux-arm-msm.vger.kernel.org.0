Return-Path: <linux-arm-msm+bounces-52457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 374A0A6FFA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 14:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 896097A1A28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 13:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15840267F46;
	Tue, 25 Mar 2025 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5w7HHvw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D57267F44
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742905852; cv=none; b=aWbGkAm9G08BFcbXz5XH+P7GPCoDScNMiJRYVVNFLUv8Ps9ZEbDpRnuxXqNlTJsCugv/kMGS6j5lbdd0etrA6CHxBx2+yFiYbhZnfrZSU4yhyegEMjYf151qLSyrzm2KwKGG6aZj1R5e6d3balKyhDV/4OhLpEFpW4HrgnrfHig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742905852; c=relaxed/simple;
	bh=qilpJ4cjtgqnPO881wZb0am06aM3yLc86r4tD6NpndY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qsNBq+fP2KKNQJtpwLLKZaJR9s2ame56IXNZMzCyMH4+faNvnB+s1bWuxElqW/UQJqJblaDe3LRZDCdY8oFUbuPVxy13yseWavg5gl55jLrg8TdeeHQLzsLjX/8AUOfIIAWbaoeq9tws2QpPAia/ap7g6O7I3gykF/B2I1KyJmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5w7HHvw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PA6YGU006327
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kPZJqI1uck7
	luBRZQDPnKRItuLHLZb+DfwEFnWKYwSI=; b=F5w7HHvwDkZ3EyRhcsddClWWlmL
	De0g3Jcbk4D4bVmXNhtsmorgoOqS6m9lVda2Je1j83GIh7fHQ1jn0DXMeaVrg3J5
	GN9j2GX7oFp4n9gZ/6JmvG380HDgEeN3xBkwFP04iMlm5L96mperhwyBook28AhN
	ioSV92aMVC7ly/oVzEk/NJh8xajXKEIRlgAhDOORBgDFCEE8LNotrBaG5R7OaKBa
	dVW7g/IhoRkJdCRMj4adIcBk5eLLwRpSB/7/7dJ5fmkXp7hbw3iSjalRWMkF1y3f
	85oROW7yZJqge/mnpf6M70z05UxJb9xefOf4HFMZqHS0iph0KJczU6KhjYA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kten8ckw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-227ea16b03dso5992575ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 05:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742905836; x=1743510636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPZJqI1uck7luBRZQDPnKRItuLHLZb+DfwEFnWKYwSI=;
        b=AirwdCChh5GgKZwMeU6FktVR3qnh/IGOE/lxSwj49hOPJHhWJ6kpJuQ639/FXxTWFw
         a0LDXHVEAYesH+5q3uf3iWZ6Ac+sIlNX8pxSwgXhwoj88uznXMxMsxDOVpWrF56M1oFH
         4lebJDlm2+eFdcC5Ntsq4dNly2WrHu1IXILqi3Gi1pBnGSdOs1JTggT+uP0Bb2kC8FGK
         2KNDRC0DSWXb7cLEa8LEwkRiG+4V/eS448kftfFVmqDSjvFXXQK1h6K+9IJs2TNbkLlh
         p6HsL6ZuJ1O9nrFGmGZ0KijBqaN9E6PvqBvEodZe1efqWROhJyqHshWlHXjLaqqqRqoS
         vOAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWUXt/pyYBTP0SiHWYnoPdjSFRcw2DKYee1bcirKZRgMGMS672fF8NQy3TYFmYBnSm1C1fhByhP/A73V0J@vger.kernel.org
X-Gm-Message-State: AOJu0YzaQIAoVnBZAru2tMnmeEZTEQOoV/zIP+Ec+Au/Nxv0kc/Oley8
	poyRMpM7hbxs47lzoAM7lquasZeUOhO1vwxy9RXKKkPQZRl6XDmOwCAfK+OAXu7k59yjxN/jjAd
	0mKVziwkhsdPkjxdicIJrovVA8Le3/JDEOYnjl2IppCCpDoE3DRGeTl9X8nRdIaRc
X-Gm-Gg: ASbGncsmWUm71LyHsu6AtZZzVUk2hj1YIfTRxMebYCLCKsgy7KCSTyN7HlL//qn3YfK
	3x8Kq4ty3BcQW4RPXiK3gPHlV0sU2Qzxobc9DEWNmHOv65iDNbYWG7U4meMJCEvobXsOKBDZhCt
	h4jVYSqCvPOV0ncBMuZMwC3Tj8I2EtAzqauB3HWW+pUk5bQt/ZiQYk+aEmvOVFifcbgWlLuAgxw
	CPBP6S1mbteYxFIZetZyUG4xNn4MwxL1i5L2CSlQf+sUby6WE/yCGUkQsMfMVLe2XDKlCzS6LYr
	A0ZN8E7OlgbUIhLtLBEIVYqPgGDEfwZePOWi6CGqNgHi
X-Received: by 2002:a05:6a00:8017:b0:736:4536:26cc with SMTP id d2e1a72fcca58-73905a2786bmr29132417b3a.23.1742905836256;
        Tue, 25 Mar 2025 05:30:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcDgZuM5dlRYn7F5OTGm0QqT+WC/cQOltrUZIrZSAh8E4Gc4dpW0xBXL4OpnIbD0hldQ5kFw==
X-Received: by 2002:a05:6a00:8017:b0:736:4536:26cc with SMTP id d2e1a72fcca58-73905a2786bmr29132315b3a.23.1742905835547;
        Tue, 25 Mar 2025 05:30:35 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618e4b6sm9987391b3a.180.2025.03.25.05.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 05:30:35 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v1 3/5] arm64: dts: qcom: sm8450: Add snps,dis_u3_susphy_quirk
Date: Tue, 25 Mar 2025 18:00:17 +0530
Message-Id: <20250325123019.597976-4-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250325123019.597976-1-prashanth.k@oss.qualcomm.com>
References: <20250325123019.597976-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e2a1f9 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=1HEuz3GWIXJSLhVaKDMA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: VATWwUNFk3dee77Fxp2IT7goLWCl9205
X-Proofpoint-ORIG-GUID: VATWwUNFk3dee77Fxp2IT7goLWCl9205
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_05,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=880
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250088

During device mode initialization on certain QC targets, before the
runstop bit is set, sometimes it's observed that the GEVNTADR{LO/HI}
register write fails. As a result, GEVTADDR registers are still 0x0.
Upon setting runstop bit, DWC3 controller attempts to write the new
events to address 0x0, causing an SMMU fault and system crash.

This was initially observed on SM8450 and later reported on few
other targets as well. As suggested by Qualcomm HW team, clearing
the GUSB3PIPECTL.SUSPHY bit resolves the issue by preventing register
write failures. Address this by setting the snps,dis_u3_susphy_quirk
to keep the GUSB3PIPECTL.SUSPHY bit cleared. This change was tested
on multiple targets (SM8350, SM8450 QCS615 etc.) for over an year
and hasn't exhibited any side effects.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 0b36f4cd4497..58c98bffee17 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5461,6 +5461,7 @@ usb_1_dwc3: usb@a600000 {
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
 				iommus = <&apps_smmu 0x0 0x0>;
 				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
-- 
2.25.1


