Return-Path: <linux-arm-msm+bounces-52456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CEFA6FFE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 14:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE01F167CDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 13:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A835B29AB07;
	Tue, 25 Mar 2025 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmbIRFMd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1937F267B88
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742905847; cv=none; b=sju2w1biFI7UraYzpC+hpPqLvpdLhly6n0hV4/4EXQo7OpRUv0Y161T8qHGP+jlRfTGqLK64z+MufJTOy2YRxqrdVxXtEKqXYgycmJFCw1QByXwr7RsPUHcNFDbk1KD5vWY4k1BbMH59lLDMAXK0goCjY4/fHQiJgk5AXKn7ez4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742905847; c=relaxed/simple;
	bh=OPB2Ai+uZO0JN8fesuuuEH/Ql4KaJvx16g8TbS7kDy4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KBt6XRu9P0BE+OL80cxqBkVuCRTPcrm62+vzvyWD4dGPnXIoMHUp49QIW4UeVSzIj0NJB7mt8KlFCPVrtoZzeQGPTlkkC0kz/oOLdKWi/zzHebI4YhAGYuOgy+uGwPs4TyQZGRmYfSiRdzPyIlum+9qD8U2J5TBBC82Iv2S2zaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmbIRFMd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P5vrFn002747
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cV8GYTdiXT0
	TDERwijtWAGMsmtXi/MaMGlqd90S9WIg=; b=mmbIRFMdx00S3E2liQsOzGgqEvK
	P02eDegng3MohXPNrX+G8pFatT25bPvV4fZHo7HnAcrWNQD4oYG+GZXR8ZPSR2Iq
	HvVRP3U8jC3to5/PnTQZ18Pl2NPUNI29qTLvB9rKOkEofGX/TyT/3WJIqZom9JqQ
	Cqls5Q7ivmwc9mHoC8e3F6U7cJzGv6P4t4kHryfdHRrZH9ads+aENE6cjVrFbp0E
	JOMlZSW5PtuNZC83vWHkXgwzKS6+KIJvz1OESstOfZPx5SeOUFiyshOWP330uX7I
	zRjgoVyjL+CsvPuUREou/jx82Vx8jOsIeo23EuBwtV0HyTDtyeB258C3DWA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9wfs8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2240a960f9cso91437055ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 05:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742905843; x=1743510643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cV8GYTdiXT0TDERwijtWAGMsmtXi/MaMGlqd90S9WIg=;
        b=vbydodlOryjFVI+huxyiukAGqCCPSNZjg/isE+dJ+qXoitPwgZpvi2hCd4ldL807MG
         yZIv6ILjaMGfDAiNX+uvxFF1cqZojL4Vt5IIQswEQhJBOPT7OuLY3ifzCbpkH/MiKiJS
         ef19JcwXf/3OhyUniXVAdUeuknBTnaBRcUITjkFfIgrCgYHs0tSJuKHBLx8Z2cGYQHEQ
         6gBYqzsAHUnyHiezyubfwHBE/gWapjBUxrCuYwo9BLUv1H+3OwE6PfdkfnAuhCKGo+CE
         CHeglzj+jelr6Y7NqUUm60DMfk57jSOHGHLGYWalvjjrtGyzydx/Z2supeuLaamzaI7j
         Ay+A==
X-Forwarded-Encrypted: i=1; AJvYcCWvL3PuVXXWKPMGx5scos4JQSdb65TqIiqe9bFvYPpbAdqj/0KUo6LFbCw6Fdnj5LBqLSEEouSmqlPKhgC/@vger.kernel.org
X-Gm-Message-State: AOJu0YwyA4ZuMXQ26Psve+fapR5bSe6PJZ35LKXiegRU+P04jDp5LNjp
	j/wTCznKYQUD896fDRQmi1ZLBBzLvx+lWY6kOC6ZZRY4CarJuHXhsTFwrC0XIvFjMnic+aM32xB
	I/GgKlyRI7PUm6fYeB9izf4BKNpyqP10nAdAH/iCbtlfDs4cHPMPQ7gZoMaOZFwdL
X-Gm-Gg: ASbGncvcgNv8q10FO2aDGX/kwI/4Sn4QlTt7KAdizE79rRviyyfeW4FzG9RcMWJxxN0
	boH+754lSlFudql2PZ436QHgp7MQWSY+7RpQ99oYHBluXOcn+Scp2EA2zjpgMALNu978TMF+EHb
	nSCqEkalaJg7YCKxfFOSOE1zUf3C+NBHcx9XR5DktKfxSJKr3IjJvb74V+mUX3J80DzD94pA3Ok
	6ffv+BXk12c8o8er/E+O3f2Jcwu4pnTJkBq/3ZO6JDP0oWmyYPq22NKB7/qtA6Jb9hFXFZnv/fb
	XqMAv/MibyK8dSX/0zg+DCLOh1/VOvERNndUMrVRbZCz
X-Received: by 2002:a05:6a00:c92:b0:736:3c77:31fd with SMTP id d2e1a72fcca58-73905a364b0mr22153572b3a.23.1742905843277;
        Tue, 25 Mar 2025 05:30:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjMUj1TLOsrYDkG5M5EtFQfcFnxQW3340OpNyCVSxp8cds6pRnYowPm6jrN3KQxqvr/9ZaFg==
X-Received: by 2002:a05:6a00:c92:b0:736:3c77:31fd with SMTP id d2e1a72fcca58-73905a364b0mr22153500b3a.23.1742905842630;
        Tue, 25 Mar 2025 05:30:42 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618e4b6sm9987391b3a.180.2025.03.25.05.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 05:30:42 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v1 5/5] arm64: dts: qcom: qdu1000: Add snps,dis_u3_susphy_quirk
Date: Tue, 25 Mar 2025 18:00:19 +0530
Message-Id: <20250325123019.597976-6-prashanth.k@oss.qualcomm.com>
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
X-Proofpoint-GUID: xWHwCcauh4FovA_QETDtsk0Ppl87DFtx
X-Proofpoint-ORIG-GUID: xWHwCcauh4FovA_QETDtsk0Ppl87DFtx
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67e2a1f4 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1HEuz3GWIXJSLhVaKDMA:9 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_05,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=893
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250088

From: Pratham Pratap <quic_ppratap@quicinc.com>

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

Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index f973aa8f7477..b3c673e24726 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1022,6 +1022,7 @@ usb_1_dwc3: usb@a600000 {
 
 				iommus = <&apps_smmu 0xc0 0x0>;
 				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
-- 
2.25.1


