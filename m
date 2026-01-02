Return-Path: <linux-arm-msm+bounces-87175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A301DCEE13F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 10:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A3B13001BC5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 09:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66412D1913;
	Fri,  2 Jan 2026 09:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRUSGiR+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STEK9dbk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BC82D8376
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767347015; cv=none; b=uh39b03Z+9K/0LsBf4F5RLeavCE+aafGaDsFYDPBBmnpZv2vETcF4rB7v8wNXwGJ39/tNl2qc68gMRoOBCH0liqLVRYgT7rNuz3jPFk0xbeM4Rp9zTjOG0HLthPy26XXUAl+E9M6Gd5ypPH4xCZoBpjHXcH1YhPNosUUmJlk84g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767347015; c=relaxed/simple;
	bh=XWV/wiMti0j+LrV/v/Z4jEKFQZ3FlNsqfF/Lgy82Fcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gl0dUPNhzz4YRc23dS47kKiftJYddUukm6CBB6yXL743Djr1B7A8tiK1Zinjfa+axIDism/4omoQiibpEtTUkEzfOYhfUeeY2uDivodLkFJVbHGUaf/SxJdwVaUUcdHgk0ittrmb3goHNMeqEFJdMFCyYvcSF6IinkfSSeSL9+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRUSGiR+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STEK9dbk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Wj7T428111
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 09:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JB7hwuiRZo4xET1vDRIYfFg56T6wWX3e2ytUVrjm1QE=; b=gRUSGiR+yflpye64
	q2KRm2VriGAIlxLq1ffiinjm3E9SiwhoHA4/ABk38GUh9Au4ooNRA/ynIN4LkpcH
	Dh7IF6gwldgVjkMBaRNOAYD5PLCAtMx34oq7rv6TYRMSp4etOjMh3mK3duRycvCY
	8eXjjm12LEDS8icAAKP4jhSWhx3sK6tGc06SBrueoqtzw6gEJ6U+UOFn1Lhba728
	5wTy5f2ELp9eyHtHKKtZKb80JM3rTkzrgFWtomCbnrOzpq+Sff5wgy22WCUz8WqB
	UPBmRHnmM3+52r9CTnH7j3DWV0WlypCc21YjvURN98xjQqQVJ2gXEXsRdVY+91au
	brjlFA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjrkr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 09:43:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1f79d6afso168629445ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 01:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767347012; x=1767951812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JB7hwuiRZo4xET1vDRIYfFg56T6wWX3e2ytUVrjm1QE=;
        b=STEK9dbkQXtOKQ/ldKRlHo91w+sX8HiX3PT3hArT0RLYNXPzupAbUY+pqTCwMJzYhM
         in0Jk/8AAfmdC27V7CI9adTyGch2eg6tuwMvoYMfuSDzQEfrjn/KQVH+aS7h5Abmq3eh
         xu1mq6sDF/OAFxKnCjMHNibJW4+d8WDLq9mWgsPh0Ybij7TUVU/Nj2nKixGIv0Ew/xir
         YD+/ozXjkblGnwJGFfeTTP/tcYXw8Xzp163VZsNag/deH71QK7oaY8lHPhoOqn+AIXj9
         qPkCTB8Jgxq3e3JsMPGcYxzBkor0EPTY7lCNMG4AzJie6676qpn03J2CXBssYrDpznSA
         T3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767347012; x=1767951812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JB7hwuiRZo4xET1vDRIYfFg56T6wWX3e2ytUVrjm1QE=;
        b=ggaUYX71QkcSYzV2tQWduwoDDXMEGI50Fdnz0AOpBIh/ri3ohYlN2N9N8zXV3jYHTR
         JHlnaHyGGqhD5xRSXFo1cN9CiwgBfkyelp/0Eg0RqY+oOWOxPz0CFGbY9M7J+h832mmO
         UvGYehyBw6ZMqUO0nJn2/O42dcmq0kvK5t/uylFt6WpSuBNGqHrqOgXlXvSDOzkwrTcK
         Iijc64yaibfzPrH/2vn3kgJJs48S0NhOaNT/EUnZjcCe4ag/3OR3Ickv6CmNSXNTZ8Ht
         DrwT0l7Nh6icpLuEM4Le5oBIGs1/Y/eGReqyh24Ak56+OIjPFGLLU06Hygj+tFjhU5tx
         +GAA==
X-Gm-Message-State: AOJu0YwpRT2H7LLdyFbmRiWlobP0oNh5L5ka2B8yTIdZ0AtqBwhiyOfw
	BGxrLtJex6TYyRTcscpJVtxwMy2tfzoO+zN7ZYe+Uxpp0oTGT6AlK0QuV4SoscjXa4V5cfgOU6+
	0S0L0ZziIzrd1ONMUvE76hKE8IDg10XSkq3ryQ6adB2pzIjYv4xYJa7ED79e8bcaK7Gcn
X-Gm-Gg: AY/fxX7PoCjdRnuCVy9yhT+AUSXTEu31wke8VJo4W6VPRkzjIwRBmeH4EoHJSYmRUNO
	/KgLTu7FMIN5yUm5oqO/7bTko45xFKOKhFAvsgHIa2Cedpmc3g5I9JWVcu+e5G7LLbBJjZ7JuRD
	aNQU5pLQj0tXt4KUWg0/ucKmP7f3efsviTWmZRj6Iv0W13+2XCeuJ6CFNGASg4LoBDRvWk8gtEP
	YakqT33QSUr506+mPyDDJJEa71PbN3d16oNZraSNM6d5M6q6SMetTeLWHUs4aw8gbkxDcBu9oyA
	nB4JAL/2qfGyC213jx7NdDi9na4XQJA2tf4cJqVwUHYcwzDs6fCwyWmKB6hLrshBj1DaTEMA3UT
	VEc96Op7GWCS6AYMLyfmSc7/Mn+c62oWVqFKcgq/vDk7u
X-Received: by 2002:a17:902:f68f:b0:29f:1fad:8e56 with SMTP id d9443c01a7336-2a2f22049acmr450584205ad.6.1767347012260;
        Fri, 02 Jan 2026 01:43:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhlhtaXG5OsG1h0mp8RwKg+DT8zDGhYOuhsQqle7zgqDlMdejCBeYAk6HCuBnd1vNMjgoFSw==
X-Received: by 2002:a17:902:f68f:b0:29f:1fad:8e56 with SMTP id d9443c01a7336-2a2f22049acmr450583995ad.6.1767347011783;
        Fri, 02 Jan 2026 01:43:31 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66829sm376154255ad.10.2026.01.02.01.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:43:31 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 02 Jan 2026 15:13:02 +0530
Subject: [PATCH 2/7] clk: qcom: gcc-sa8775p: Do not turn off PCIe GDSCs
 during gdsc_disable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-pci_gdsc_fix-v1-2-b17ed3d175bc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767346994; l=1401;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XWV/wiMti0j+LrV/v/Z4jEKFQZ3FlNsqfF/Lgy82Fcg=;
 b=ZiOafuSgqrNoKWzDz10Fp18Cn71VALIMfXhyts5U4XInt2ii753CsccSOLhmicHetirjzDRWj
 Xho+N0leocCD+zTjaoK6QQ+GsIOpkeDq4s4NMJCwfR2mkWIr9an42ZL
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=69579344 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ByFm4HHrRE6C6VNyrcUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: fuPsGixuChMRpHEY1B532d-zLygPujR9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NiBTYWx0ZWRfXx9i/S8Yh/0mF
 t1+l5GsV2MdMdyQQQQ676ig3XwkVpIRYHO30n6TAaIi6U6PcdExbALeTZQtTn897WappO+ckhM/
 TBtcXFoRbSC6eAXbLwbvj5gX81o2+QdomNva03PiwS5tkCcWyyG5nnBgJLj1ctMJZiraCaqiCj3
 yN4Ju3LDxCBiyx8eHwDyOuYcZ1S20dctW80CbavB4cra4zfrnhXKfaX6PVECtmbh0icM2gcTAhV
 XreAduZqdP+2fUu6hMdRsuq5DQHAaTFrbS/9Z3X0oTwnXfL45k6jTGpOXwVo3cP8tmxR76rR3XW
 mUigsIffCS28te5TBpFTCbnoDrpZ73LA2ry2KGcMrsh8RrMNW33ehJQv0yko5BHhwNkx5jbi+cv
 2BFhnFqQO03eMiBrmRCy9Ly1hoMkSN/RXJBZzNILrUhoY911Pi8kIWLru65p+LYmF6BBjCpS3DK
 dWRK1PwSAxAHvdINf4g==
X-Proofpoint-GUID: fuPsGixuChMRpHEY1B532d-zLygPujR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020086

With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
can happen during scenarios such as system suspend and breaks the resume
of PCIe controllers from suspend.

So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
during gdsc_disable() and allow the hardware to transition the GDSCs to
retention when the parent domain enters low power state during system
suspend.

Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
Cc: stable@vger.kernel.org
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index e7425e82c54f2355015b58f5a25f11d2fb5020e6..b2e8639e9f09194fccde927466dab0f179e08e01 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4211,7 +4211,7 @@ static struct gdsc pcie_0_gdsc = {
 	.pd = {
 		.name = "pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE | RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
@@ -4225,7 +4225,7 @@ static struct gdsc pcie_1_gdsc = {
 	.pd = {
 		.name = "pcie_1_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE | RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 

-- 
2.34.1


