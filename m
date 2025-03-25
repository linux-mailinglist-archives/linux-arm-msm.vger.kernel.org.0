Return-Path: <linux-arm-msm+bounces-52453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B7CA6FF8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 14:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C53EB7A66FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 13:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88615267AFA;
	Tue, 25 Mar 2025 12:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvU8TgVN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D4A267AE1
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742905838; cv=none; b=iqIOf4ihVpHkGlddUO6YnIh5rEgbNL0lKVeP0cwtMtRdVlPWSmPeEHlHDIV6LqXWITrOYGkniQle6/66FB6DCrImGQqon8FOZFKw+lvJgVdBu7Y2Tlb2ER/gabEUfVrqb6/xXl2KMdV0K0XoBhNNcjv2e2ENkeood1QljE4Oio0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742905838; c=relaxed/simple;
	bh=C6NTSl0+Rao98kSjPlvJlJr9IoIUUdvL89mpuJUpsPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I7ia3/7GbgwoOKbKPuaAr1crHGJQGsAcVuJELJGRcPd66c/dbZqQJSgnDti0Qap8LcncE6VHQYrjSfpblZIaWw8SAXujaRbNhkuWudWqtR/KdIP6ojxdq+SR1RkoqO7duXYz9JRIPhWm5bAm/dOi8dmHPWffxJ6qnDVUqKYoVC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvU8TgVN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P5vQnD008060
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Djrd/4JquWX
	DbU+icEttWqizSKPX1yxwU0bvPWCgU/w=; b=LvU8TgVNJsQgO4qNIXXeQyYTk0o
	g41uEQteuyHtcgDITr2HwMbcs4g7kouzJPWmO+2pI6/sZySrhtUkv94xrAfi9SD0
	1iAjuAZXSSfrFE1m6BA7aQV6K+evsHUcaYQcBKCtTYwQPqDUyqSSHy3K1qFOR3wE
	ZFac0vkKUioFTWz8jvrnLtyqCTi6z/D6ltBvLlyyW+mKEAGrNyp36VyavVllM5D0
	ReE1j7LpUmSPAG4CVSkb2Vj7PR6q8YCP/rBnv3WKJQRHOeAi7RlbPKFmUwtcEslm
	PISAvteaO0j4CzzrF4QZc5h7F7TIffW4OH+453Zyu0AX3NsovLtRHyJy3uw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kjjf1qe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-227ea16b03dso5990665ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 05:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742905830; x=1743510630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Djrd/4JquWXDbU+icEttWqizSKPX1yxwU0bvPWCgU/w=;
        b=nk1MBapWBmVfYdUs1mdM+wsPAtcSpU3IT9QcP0DHN1Pf5agKa+y5E1kZISSXGPEppT
         /tjW9z1vDugpIUZGd+xWmU3mwea/XTseCKMsaKAqiND4d9+lU9UcIxHAeS7XQaqjo5/j
         L1twF9RGfe7mXFSNXZLkqFb+neMXVGDTQkZkv3XxK3+DTbtIU5rdMaELwD1Gpz18o5Gr
         okvF26fREgRzpTJfQqmjAADbBw2O6AANx0CFVTVOCC4nrbz/x+aQYR4T7WY6KZvs7Y94
         MFsd63DTCI0RR3L1h5VLbhnEOphGft3H9J5Q0G/qSJu+5jKM1UIgJY2mtN5kXUTCRN79
         2esg==
X-Forwarded-Encrypted: i=1; AJvYcCWEFl59L+kRTCfSuZervPd/b9j2PwT6AxAVQbHM/k9pReopbaaQDOhVAVt8xGLIiOkBbv5EfMZyr0v/p1vz@vger.kernel.org
X-Gm-Message-State: AOJu0YxcGxM2E74WO0Verm46+yfaFrflJ4bw6nsNLh7liz5boUr1x7TR
	dbEckpsRr7hRU/OCVOqd5kzaDQkJb0Od/1yqv4Vn0W5EQ4lRb2Wv7pALzJ4tIHKFyc46pDHV1rx
	aDMlns8ux2YdHcUD69jd3jd8kKxvTdc/Ac0mJiRlMr8dAQofpB7/DuXOISHwLZ6Ey
X-Gm-Gg: ASbGncvxU8mwuy6nQGXs2fkRin2vi4GJoUC7H9hquLAiQ+AsRLM3bPHUqqlhoQMl/Sb
	tBCEmpO7me7kM2T39kMPw3KRJWP4lKZSeqp+thNkjeFyWu5hSIdV0IQCkGdRivr9FM3SpFSeLvK
	+tHW+cphtZ+0VHCcBcRbCw6qUg7lEz3ULztSPXFZBqrVHubk/GXHaOlduUMJm1zACIZ5Rj5OmVz
	leqKafGQWD9eMHihUSKWysKQ3qUyPxLBTbQx+ujkdtrhYRbvUawgyCtN3zSXJrV+UDUGvCpwx/A
	cfyXn3RaefWWmtuKyj3HZDCIn6FlxSjE8bU9bTfMx6ms
X-Received: by 2002:a05:6a00:a90:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-739059ffb6bmr24495766b3a.15.1742905829536;
        Tue, 25 Mar 2025 05:30:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1+SzHyug7TlpcnU1WYoJKsScRaV4mu1kQkM4jvBkv9SbhqL2kTaoaLZnX/fcxB9EwTIMLnA==
X-Received: by 2002:a05:6a00:a90:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-739059ffb6bmr24495709b3a.15.1742905828883;
        Tue, 25 Mar 2025 05:30:28 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618e4b6sm9987391b3a.180.2025.03.25.05.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 05:30:28 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v1 1/5] arm64: dts: qcom: sm8150: Add snps,dis_u3_susphy_quirk
Date: Tue, 25 Mar 2025 18:00:15 +0530
Message-Id: <20250325123019.597976-2-prashanth.k@oss.qualcomm.com>
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
X-Proofpoint-GUID: J_bNRRITx_OVzWyZkkrA0WM8_pgWaBcy
X-Authority-Analysis: v=2.4 cv=Hol2G1TS c=1 sm=1 tr=0 ts=67e2a1ec cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=2mEde68aHbpXMYUSS8oA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: J_bNRRITx_OVzWyZkkrA0WM8_pgWaBcy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_05,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=819
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
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
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 4dbda54b47a5..4477ec14ab1d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3657,6 +3657,7 @@ usb_1_dwc3: usb@a600000 {
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
 				iommus = <&apps_smmu 0x140 0>;
 				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
@@ -3736,6 +3737,7 @@ usb_2_dwc3: usb@a800000 {
 				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 				iommus = <&apps_smmu 0x160 0>;
 				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
-- 
2.25.1


