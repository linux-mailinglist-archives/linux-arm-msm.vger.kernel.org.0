Return-Path: <linux-arm-msm+bounces-87174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CCACEE151
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 10:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 444D63009405
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 09:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F16B2D7D42;
	Fri,  2 Jan 2026 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nMcERtV4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T2lEXZBV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF3D2D7813
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 09:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767347010; cv=none; b=RJaxUOk/PQ9bwOWcMGeDt+ZCt1TJIge/W6J/k5SNR9pKm58D+JjCm6mK+csJ2nER67sh1SaY9CAvCxjcb9Fwwds4YI1TpE8o0ifAW1veZ1ysKsHdlcVpTQXBFpJkrQ9hHBeRyyv+DCC0FfixdRi7/D/YL0nUmxFfgNOJgeO+JYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767347010; c=relaxed/simple;
	bh=H/C36gL+Yrb+Bh92JefNcIpyT4nYFYN7IMeGQbA2MK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+Ofwqq2Y8RONkxp1G1PxirTJT/JWGa90GfiNAq5z11h1weG9Onh8jMWfjAQr6DM9CNP1sCeLV/I5Effm3RJ5SsAn/MJWw+w7QmMT0/UD1e05Mly3l2lrF2WCTBBtYf7SzOGin8pcmCWwMbBEwhTDLxpJRn7xmXaEzGOg+vpxf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nMcERtV4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T2lEXZBV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WXMc207686
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 09:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UAdgTr82fRaDbVD9ciZd2KlmhDIkhQ8w583Xbnh/HTU=; b=nMcERtV4DouDwmJk
	IqRlGcCq/xoKfBQ++D1cVgLU00Afc1jRdJ9q0NfhwBpbzv0FZZ1RAjGkUM8B23rg
	/5GZ22+9jPTuWCcK6Wr4sL6mc9OiGzjZP4adwtRXttKeEIIjdqQQk0qKHKSVfwqJ
	uTu78s3M8mD96ijGcufYfbx/cKupoPo2KKQtb888ZA5NlAX86x83XOtMpagNsZho
	wHJCidzwyJMleKbMZbTTUQxMk/b3d6ZujdhtkhdouKE13Un1eM6BrQcfbKVuiaS4
	uO6gNvNFABn/csF5Yw9MQfax0jACiitw0ZIpQEtzOchoPyeLVjY5ggaNeDAxlJsf
	0TShlg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx74c58j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 09:43:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0f0c7a06eso243431925ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 01:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767347006; x=1767951806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UAdgTr82fRaDbVD9ciZd2KlmhDIkhQ8w583Xbnh/HTU=;
        b=T2lEXZBVnUnR0iqt1b9vCQwZiSrWqBsZpgBb+n//WZLTHtRjJnVtK4eUZb1ItYEWUn
         CC7b2z7srOJlwzw26A0bI2UaKXLC1CsFOw/CyvgRyZ4OWdw44Pc1m3/gq4EfCHhFuONT
         c6aoY70ydsQ4sd+vCWQvDxr9WIJ54T9H6kntMSO8DPDJPX5hQioNJtaL5HaB3z8ybLcY
         uMWXv6VYWvmSWWuYJazi2vXTNYX++vo/F5anC1EovDaKd/22y3c1gYTO30d3ewEfIhuk
         IqAJKfW53fozuQn8rBWXbdRCYqoT8K96jOT2tn+ntBo2lSHHcbxE8MyBWXgqOAGWzF/4
         5DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767347006; x=1767951806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UAdgTr82fRaDbVD9ciZd2KlmhDIkhQ8w583Xbnh/HTU=;
        b=O2Js74dZghIO2uYfnaWobjkXrMHgwx01ZPPjfdnK1QMoTlJK1M4i/rnMKnBdxI1MbT
         HqLKdlcbGkO1rwbV+tWbP//ZVOb4n+dp4TeiGB8lZqgTDX9n6DiqUf0/wHeF3pzOesgp
         e9nMjSGt+3PQ3pniNHOuvbBTi9ZGf6zqXYJJSruyg2/ZIjGFSRVTGE6k3LeM1HHtG+Uf
         c9Je34G1oE7nSSaXY4/5oooHPF7n82GEZzp5AdVoWs4UABsXek4RG+fC8Hsk0DNmOQDI
         jZFMlg1aqjpgVtfFS284+39iluhSGlc77HMRBgAwRyTp4FQYcrS6/4Qpii6EFEsgv/P3
         kBSg==
X-Gm-Message-State: AOJu0YzaUQpshyD/IaHIv0w/xRYa6iDXspghyVBSHkwenOK25zIbLqG8
	M5u2/BFNukpyIpuZ05OZ6KZ+WrtQ4GVxerv6oIsSYkU4X0Xlk3TMpTCqZaNzHO2X3Ya+X3CpAMT
	jX0nGVWomdjAR5ULhHOxzMOmOrEhSxJZDC9iW3aoHXDfRxNnT8uWXAE2IN42GxklpGs7M
X-Gm-Gg: AY/fxX6vvn48mHpi3UI5OHS16aD4q5wc4IOjX4zPw2thlKGRqPjrMDduP7I/DVfABVL
	HEF/OCCxaGcdvTISLjXPyb0U/+n69jsZKYMaajlmmaT4NFmQ95+51DiPMQ5B9karDR+EfexWnJp
	n0UOm2JDMgmeXJeVsNYFsovDbnQZBCr1Fo2BD0Bsmx83ZcUOg081eux1lC+JFIyaYFQEPbFu38W
	KTcXg4BJsILsZmK+kD2C9beLANzE9A3qo29f2sfpoWyfppLazsfXN+koIdMS8F8CvxkRtUNFQJA
	funqTh4POR4/VSsomcGwnweqgx5xjN7VCFMbWUBwNtLaCK7mUJNou4s1ajWMvWGNvGq6APbl+vL
	j23z7Ph7iPqj+hPoi89hXNFXcnheG/Y6YcXKL2yzPjuR3
X-Received: by 2002:a17:903:3d0d:b0:295:28a4:f0be with SMTP id d9443c01a7336-2a2f2212882mr382555975ad.10.1767347006420;
        Fri, 02 Jan 2026 01:43:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEA8g1A/hUJ7nczdE+jHrP3es6vTCouix1JiJva41okHtH++OT1LmvUGLP4pOQ2g/oVbraOfw==
X-Received: by 2002:a17:903:3d0d:b0:295:28a4:f0be with SMTP id d9443c01a7336-2a2f2212882mr382555855ad.10.1767347005933;
        Fri, 02 Jan 2026 01:43:25 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66829sm376154255ad.10.2026.01.02.01.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:43:25 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 02 Jan 2026 15:13:01 +0530
Subject: [PATCH 1/7] clk: qcom: gcc-sc7280: Do not turn off PCIe GDSCs
 during gdsc_disable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-pci_gdsc_fix-v1-1-b17ed3d175bc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767346994; l=1162;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=H/C36gL+Yrb+Bh92JefNcIpyT4nYFYN7IMeGQbA2MK4=;
 b=wGfik/XmZpvIMsYR5Pp/+STb8LGwBKYKFcGx0r0ttt3h5PYoqbNueWqTJk/vUDR6sDISr5Fe0
 tNnLQbrEKe5D3kCL9PoR3F8XFWujkBj8iRKnyKAFHK+KWGg97+BmBq7
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: R2zaCLdqcsCKB1PJvfpd78pmeYL2tlsL
X-Proofpoint-GUID: R2zaCLdqcsCKB1PJvfpd78pmeYL2tlsL
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6957933f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ByFm4HHrRE6C6VNyrcUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NiBTYWx0ZWRfXz1WWMlB4GYNK
 JiqMVWyWqoPhWH3NzYTAxJ+M65BteyQQxoDvx1LrINF7j59bmirx0Y+7EJX2DrQB6gIukgW4V2f
 mefCfmugQuMbYlYxmW4jlmSveerQaP+zXD2x3J5Aisjrxdlg+tO27uLT9VFMYI48N99Pt2RM98J
 NPiCmhJqKjbif/NGmiuCWr7jD0tKwuMG1idQQqUPcmjvUWDm6w1w6YSKHBIWZvSKydBUlo/t6cU
 nEH+xZtfWjrnulcqyurKEL/bhk6oh0qXPgxymdxJ7XzYH96wiBxbOECM4e4S7RqQp/RMpAkgziX
 Jd9WYdOBIvqIXYfG8iBn29eR8b2prAEVgg4d5aN+LN21b74T8GzdJ9t/A6D1OdiPd+i+7SinSkZ
 ZPVP5Zvh3fWV/rZbmRza8Il+NsWene3g+u258qresZHiyCmusYFC9/yUjtLzXxJckx9GCgq5gpf
 L2TtRuHHQkrO66SL76Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020086

With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
can happen during scenarios such as system suspend and breaks the resume
of PCIe controllers from suspend.

So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
during gdsc_disable() and allow the hardware to transition the GDSCs to
retention when the parent domain enters low power state during system
suspend.

Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
Cc: stable@vger.kernel.org
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc7280.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 4502926a2691a773003631f822c121a043607a64..2432abcf487b9c813326adac24277054cc59cfa5 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3101,7 +3101,7 @@ static struct gdsc gcc_pcie_0_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE,
 };
 

-- 
2.34.1


