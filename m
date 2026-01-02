Return-Path: <linux-arm-msm+bounces-87176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5314BCEE142
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 10:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFD2230019E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 09:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0614E2D8391;
	Fri,  2 Jan 2026 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Glm26REU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXPjEdA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561B52D73A2
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767347021; cv=none; b=KvEqGwvPeb/xkxoXtQZ1b4eeOwXFQQnSC1sVxZh1U3Ingec2bxCdnRuh0bnQFrzBFYnrYAosr10UihE2AzNjcZL0bUbBmtE0PNOTiJc2YHgi3QBHgcJMRQ5JiVSMxRTuqXDeh2jqs7VtqtekVVjQoohf/SjcsKdqJuLPZZ6+75M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767347021; c=relaxed/simple;
	bh=NSkQnKJcfadz3AF6tccNlZKti0/dp5ZM6ojEWXzzpxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dgkJXkeXzbmYdCRfeg5ntE1Q97j23e9DmdostEk3jALuHuzQ97pIGZetcnAfW1BSl5JAT3KokdpUd4lN81QkNRGbti6YQDIrd4Bm2vypIOD615Rv/Y/zegnYDLzHfO3uNmgfOm7yKWCUIOl/1VModxF5mb7WwQ7vpIP7ucXvEoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Glm26REU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXPjEdA1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W0Vl637589
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 09:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a6B0Mr1Iv6eduvsLfOaq+Q/gOOfWzJbBtPGlP1TnbnQ=; b=Glm26REUyfy9oAF+
	o6hgIAVw3mnpInprMfXYqpaU4AQJ4+e9jizt2N6QVAZ7sSdcCu7JpRZlyPP4E6Xd
	/+ik4CuLKddfAx5CPRszlPwLw79lo6t9744SB+4oR+PDNKzSFoR0YX4KkdtoYI9j
	qZ5gTkcCWB6JIR+hogFdWboLUFQSJNjFv7gZu6KQCdEVtAu01Q/S50n3aQ8JPnMN
	b+kVqeWO7Q8JBr9yWHosTUDsJvVAsyRv7KTT3mLUISGm/Hw6FpHgJbE9+NrHGD6f
	EfrNZHNI3BaapJvEcoiK9ugDdsVZFEg7LHd/qC2FrJghN34JssMUcb6y081gLQdo
	Xu9uLw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd3v8uftv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 09:43:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso398604875ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 01:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767347018; x=1767951818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6B0Mr1Iv6eduvsLfOaq+Q/gOOfWzJbBtPGlP1TnbnQ=;
        b=LXPjEdA1ZCxtICmBBUBjXQgeo255LD9If4c5mokQ2/BMnFsdHDhyw7wwpPt/e/dxLp
         OujmWMOTVZH3WtokBRe7+I3k9n5xImWxNdAsRGFAAPYcZHcYHr5qmuKQLJgGFmWe9Nss
         ROhw/AbtResIpM6TCO4sbbl4RCBj6Dlx6dCIbO/cToyPZ3K5mApa0XC+A2roc8cxxWmy
         haSNm6OYlqSk1KMWxk6x9i7BNIkSK72HAm3Eww/ef+AEn3MHytwImatH09MIK7fiZuNU
         2+bFUii/9Q1wMK+2LSibxan3C3cJc1lDSc45cFYEcuSCvefdxoxcbQelx97/5ciCZW6V
         jNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767347018; x=1767951818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a6B0Mr1Iv6eduvsLfOaq+Q/gOOfWzJbBtPGlP1TnbnQ=;
        b=f95tO8T7CcAvTef2BNpJVMoM7mLboN0LNE3fWVJ7I+lGUcsszaZ6RhH7jrTTg2LlV7
         pTzLTpqa/EzC53iftAkQpj0yvLQo3leoD5mPQPmluiKddaA6lLws+Sjr/e071axB9BQv
         MIdGqotLoffyYTZMX1pmMf/dKF6XdLbTvIDzCqF3X3xXaX6qJEj7h8gK9DwwgcEiBVOh
         95/KvkbhB3lP59Elkw01NVh2I7hVXEhUjd/W7A/jQOzK5uyxvm4HHhuCk01JL1A3agHW
         Vj8B+ls7YP+fUSkokKORgyvXbb192mPjQbYzKuP5yIGyi0oBRktz03HYduNQ6SBjW9I1
         Pg3A==
X-Gm-Message-State: AOJu0YwWJagOn+u8Ph2eVLoWaIX7BFsvoxB9B9/BNlv63wsTGMWLyhx8
	RaIvJXGJZPA6BjPjk+U4g4GCr1Seg6qcmwwg1BBz0R54IUo3cFXszVp1SJX6O2JGaFiihL3KjJD
	qa/HKCQcIE5CC/BPO+le3SHC5PLPx6urHT0y9juXHz2Kxsrj4QIApacYDYsB50vXioOra
X-Gm-Gg: AY/fxX7Od+PbSPwKLcZbZJI+NvGpdnPKpulEXdKFBMkn7RGVdwhU5xzlS7i4QpQHRci
	l1IDxabzvlTePzeKDECvaXtyWSTn4Dfro2owSva2UjQl5TeRuLcYkvi3Xk1plY2bPDKa2rNCFLq
	cjvRLWb0iYHFz7AylAHLRkIlZw68yzRFJaTMmZm/bwrmxHdQ4h3Yb584mk/Exv/O6lqeXgw35L7
	QkyUA04XiLUcjQ5yf6moqlHOk7j0G9S2MKVmpjEhq0ALJ0l7wku64OgCWNpr2wQ7MsWkoiz2LDW
	QFkOzZbVZWfBW6XqLbPyMlTlhjrcf5ZME9teki4EkD3T+UFLc9zzAYXGB7Pe56WY+gTqxm+il8i
	jDy24+m4zYvNy3cW2Qy0LQGe62NOzFGgVN5zAGAa27MHO
X-Received: by 2002:a17:903:19e6:b0:295:96bc:8699 with SMTP id d9443c01a7336-2a2f222bc5fmr447731085ad.20.1767347018122;
        Fri, 02 Jan 2026 01:43:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/KTc9e40CfrkuA0sDQKGRGgRN1IJNNLflSBZ50gGpN7B4a7iFbpOPyYm5WRjRBzLPJY6AxA==
X-Received: by 2002:a17:903:19e6:b0:295:96bc:8699 with SMTP id d9443c01a7336-2a2f222bc5fmr447730795ad.20.1767347017661;
        Fri, 02 Jan 2026 01:43:37 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66829sm376154255ad.10.2026.01.02.01.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:43:37 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 02 Jan 2026 15:13:03 +0530
Subject: [PATCH 3/7] clk: qcom: gcc-sm8750: Do not turn off PCIe GDSCs
 during gdsc_disable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-pci_gdsc_fix-v1-3-b17ed3d175bc@oss.qualcomm.com>
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
In-Reply-To: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767346994; l=1176;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=NSkQnKJcfadz3AF6tccNlZKti0/dp5ZM6ojEWXzzpxc=;
 b=HV/XpdIiv2DoZjDrSjFt71b7G5uTUfB364AH7QNl/EwI6irz9v+3eSIUJ/GdoIf2tUL9wW87W
 eb6fTQEhKjzCWQEr7eLXKsSRlfzsBsDHsrva7NmKOu3s4CIDnHAdsTm
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NiBTYWx0ZWRfX+qb97XnLCduf
 uW8JV2ve9fPv3BghQ4mB66x2TO3wBbW3IzMrd3ERTWj1mNlEX1vytZ8Am/eSGLGuew7aI1xDkFY
 82LRcDFg1icUON+JZqPFrZgwRwY8NVaU/fENE52b3d4g+2p40W/USbHKD2Q0jG1pSK+2EVV7vxK
 d6GuG80SdgV3ToWNXJxF5KYjD1adic/ZKgI1Q14lEPP2K6B+FGvUauWHPzW5A0cV3cMhGJhRk0G
 maSF/8I83mX0egwCuNeXANQwOLgMIDiVzOq56cIGIeo3VV9sb5elhiuPsGy/DjR7RnACG2QxeQl
 ml0VmDtO0Zy4COo70b/bCZCVaqVvSelYGUPNr64Xo95Qt2J8tU2qZyDcqz9ZVeiLWfVntR4c28q
 Zh2kTjKkTUMMEWNbgOCTfy+gZHmxZsXO1C3p70ud2qLzd/rCz/G4gIXIOzT+NlaJX82THIfYq3w
 2C5yOb5ieqpbBLL4NLA==
X-Authority-Analysis: v=2.4 cv=JdOxbEKV c=1 sm=1 tr=0 ts=6957934b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ByFm4HHrRE6C6VNyrcUA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: yWq3e7-4a9oIkPXkNPdA0I2DJgWmIt9O
X-Proofpoint-ORIG-GUID: yWq3e7-4a9oIkPXkNPdA0I2DJgWmIt9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020086

With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
can happen during scenarios such as system suspend and breaks the resume
of PCIe controllers from suspend.

So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
during gdsc_disable() and allow the hardware to transition the GDSCs to
retention when the parent domain enters low power state during system
suspend.

Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
Cc: stable@vger.kernel.org
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index db81569dd4b17de1c70ab5058d4ea186e08ce09e..ef072e6e4d9aeac5bf24116407ec75aad290a571 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -2891,7 +2891,7 @@ static struct gdsc gcc_pcie_0_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 

-- 
2.34.1


