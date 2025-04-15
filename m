Return-Path: <linux-arm-msm+bounces-54376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 526B6A89A1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 052E41895C6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5872951AF;
	Tue, 15 Apr 2025 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9KBEuI1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FBC2951A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712822; cv=none; b=m29louK/FHRFmjg3fVYzoBQFO8iJVhiHbqzct1V3Wkx0925Q5g0J+CA3quF1ARsA1c7bhWtiDfZPl+qyCTZwBjMOWMtiBTy7MKEJkicPd3dfaSKzHAz431kgf2TkTJEb9yala/6OtERrMFAtGgLkcYeFZuL7W6QlGD8u8Jg9dMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712822; c=relaxed/simple;
	bh=kJuGUg3ZyNO++wMmcX4HNtv6Xp3wiNa+6sAh31q09OE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c0Nekhr4q1FunRNY627AoTfVlFjqGdBL+0Xy81OzF4fqjpQfchMh+duSW3iQ2ADw0iUGICHdN9BUw0p6DrZ7+Kgu67H3PURfd6F84/04xlLtO7Yuf8+S6R92FBv6t2XX7zwr2SkJkYj6zCrDNn1WoXIHe9ZI5vxY81o7lCe91wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9KBEuI1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGl5005850
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Os76GeIDwgJjj/dbZ15N3Whjx0kvCEjhFjoKQ9VPHMI=; b=E9KBEuI1oJLAw/OP
	07TxiCC9n7f+8lw58YKg34rt7DrpSHaiqXvEnhSTmpum31mnBDQNsCyjOALyNz0T
	p/N902TocWUhaOzYUt9zhw7OuDGNCmInFXK5wT0cdBDxK4NmjpPoJT+nuGv9fDGl
	SCDVG2dYjVEqNYu5unc0THllgq6PrrOSrmUMX5sJ5Rl7ZWKix4nrJMlgJLUTK7Nn
	VSvtXopHVgXfWkUdwv5cMMCHP5sO/wFyecXFHDPX0pbBkAmnyqn0xNLEPFZRjh64
	VvLUnZuTKt1gq1GxozjLnnsx5F1Gy/FGZqyzeMMn+OWt2n9h3WFKo6oJFSFfmTV1
	8i912A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj7v2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54e7922a1so1090716585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712819; x=1745317619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Os76GeIDwgJjj/dbZ15N3Whjx0kvCEjhFjoKQ9VPHMI=;
        b=w/Vr6USYQ3RgGCCSxcjFisJzjiKpbStKIwppTvrwqcQZOp4Tu7U6iuPzYvjHt+NBVP
         GbETMqW3+fZJzVriNU8ylT7/7Y7Idu+EoLOShitH7SeW9nmdDbGvb5Q0cJbz++rLrxHw
         sn5ky8c3jl03t3bnMwUvgVmf8tq0C1xlfJjfrOs6+easFztSerAOViCtDhku0zmYwfnl
         PxGLo7gkHzziiau1dmoYgsoHzSZZn6Cl/aGAdzXJI05EnjDF0muEoiGcjsTsWUzt78b+
         fwhk9jILp/wxD3c3huzTT8PGb2ZCgMC1+3q+TfxmVeOnVPWGf8ZITTgRPpl4kNUVXyPW
         VIog==
X-Gm-Message-State: AOJu0YxK6dYF7XhrBs+5r4Ih+GXbSwDx/K3QvCaUmQhkBvav0E2HXu0s
	r5uSdTm0KQpWOlgmwQlQwqYf57ZVegAe/yUOC7yxUynJRKvJQIuAXEKt/zF/M3r4U8J5LDzScYi
	EjFppiIjf2y4rtrD/BSXEhNCk/R1TwyziP6Fcl7dj+iqdw8LXIbhhmbgxYIMsSfUtTA7Id8bm2B
	SaqQ==
X-Gm-Gg: ASbGncuWr+WsQzxGKI7wA8r54PB7b+D9UBjyanyFyMKj12Pxay7x5DFd7Me9Uq+ieDx
	YxkxXzoGG8cEdIVohvilmn5GFz706jlf7s6b/V8cemHtLUfel72k+I+bK1sFLfXuwIqrKuCvdO0
	xYkR0f+pC2BqbbZv1rJ6odWCITrjZ3oxzoxqpJtqvr6YWJS0GyoXps0lMYn5FQ/yQmePF3irW0Z
	5lFiXMl/dQXwS/rnw9+mtSgd+c4yr7o1kfiXkic/lSkCNIKB16X4jsm3gdAhF24lyG+GviPm9Fj
	f1yQNkyYIQffUq0jOeaReY0avmpd7WLCjRbJ+FF3xgcfI/PaVKsRMn88sEG94sRssrkrBb0eROm
	3dymshv8L3rb89x0E0bSknfeF
X-Received: by 2002:a05:620a:430e:b0:7c5:4738:8a1b with SMTP id af79cd13be357-7c7af12a2a8mr2118129085a.28.1744712818708;
        Tue, 15 Apr 2025 03:26:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIPb4GOLcnDGmN8JaCU8oPa1DseIl0iZVF6/yi5mSfJvEAUzF1EtiNgCFABv10BseEaRsV8A==
X-Received: by 2002:a05:620a:430e:b0:7c5:4738:8a1b with SMTP id af79cd13be357-7c7af12a2a8mr2118127085a.28.1744712818405;
        Tue, 15 Apr 2025 03:26:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:08 +0300
Subject: [PATCH 10/20] arm64: dts: qcom: sdm670: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-10-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kJuGUg3ZyNO++wMmcX4HNtv6Xp3wiNa+6sAh31q09OE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRdD0gKuve2PjezYPrc+PE/F1x+/bSWy8w3h
 T8UB9mnGjyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40XQAKCRCLPIo+Aiko
 1fBKCACmwtM4UPS7fAXMQvAM4zxaqDa9w8Br7H+Hqqz4x+pvqHSd0v9HhCfECrm2HMh8J2VTytV
 HKj6NxDFYz7OVmHCbYhRBN2Y+jFBC3Ee/8Cn+apHd6z0/BC+vD1TGkL4sX/P1sOsJpvdfIWKj8i
 R6PINLEyz8paad/OFbJldlqJdzzlAxHU7lvplyHUXWP4GXObteIoZzYgnEZq92xyGl/XoTlnzp/
 AS+/lmL/fUVvTaZoWEWxneL58RO6tj+S2ESM57tG+1gBINCJ8Cv5/24UvczcBC84iiT9cZ9Nl99
 t2BnlCx5s2OAxLMB4D5Q/jaz2AXsLey9nB5nIYZKzbYNbCEJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fe3474 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=IF1fwQZW4UY1vmd2trkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: EUp1vSs9pkHtkjYvD7Nuq_UmUAuvQ-ld
X-Proofpoint-ORIG-GUID: EUp1vSs9pkHtkjYvD7Nuq_UmUAuvQ-ld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=812
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index a68ef6741f8d4f875a8897493c9f903e8ed3734e..3ecf41cf2b879b875ddc868cda891ea318a96cc3 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1636,7 +1636,7 @@ mdss: display-subsystem@ae00000 {
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sdm670-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
-				      <0 0x0aeb0000 0 0x2008>;
+				      <0 0x0aeb0000 0 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				clocks = <&gcc GCC_DISP_AXI_CLK>,

-- 
2.39.5


