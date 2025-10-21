Return-Path: <linux-arm-msm+bounces-78216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A60BF8E6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 23:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6673E3B0404
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 21:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381A428726D;
	Tue, 21 Oct 2025 21:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrxcpZug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67047286417
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 21:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761080948; cv=none; b=qQGkb+r9U5nL6kAu7iF0VKA5H6F+iYX73xjFoc4WdNv7OZJpj8SgHTlIsND+C7n+p8YbV/n/vKv4wGF853s3dc68UxWqw4bWWGzcBxtiClrF+LQn0ogcL8zZmpRu9PGbopSxZkDVf6eTDMaI8EOVSr3e4ldzekPjgeNZH7TPlPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761080948; c=relaxed/simple;
	bh=C+tkM31LHQwx5rXjve3N0QzxSt8/3cY/SYv5ANIxZgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MYp/cfqB2o4A9QZ4oZl+cgW4WJ6yD5zxvsq6oeJ9P84gItsSN6qZsW568+VIO2GCYnD/4N1vHryHlaaEx39SrFxIUiC/aDNcwgBX86ExsmTlXKib+bWlL6W3YCnrML/amjQ2Fn1z8fV75Us5xOsMHjQUb5jG67sqGmhh2pAdG1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrxcpZug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LFMHsC025166
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 21:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zuiw9MxlaUMJ5WPI1xlT09kBhpRPx+9WZaClKq2hKfk=; b=KrxcpZugMDpMegok
	4Iwsqxufok5+UZXmDUfu9tjJoaxPqRsB30DWVDygw2nQ1wCuva3j32h4MIZzRA1o
	MFGAVXpTtIBFMAPzW1DS4kRv/1DUwuWMdZY1Rqos87s91QMDwZq58nTh1pf7LMEA
	5Krt9S/ev6ATgBbXz1luBS5zPW05dmcLON531OivWiJD2RXEOHUhac4GdI9ZqVhY
	4UDUYLW+/j0r+s/8Ut876cWa/eeZlTKKOwdmtZblY9VoEMBjD4SExNZJqDSHQ1/9
	6n6DkcbIgCh89XRQI7Ui+48iVZE0ObPIkdros13V2YhmBXXkPd0bjsqd5i9TbJVx
	7hEMFg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w829kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 21:09:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33bcb779733so5256071a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 14:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761080944; x=1761685744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zuiw9MxlaUMJ5WPI1xlT09kBhpRPx+9WZaClKq2hKfk=;
        b=plHTOBa1Al0ANYh7h0TGwCBHYC+yM2qPrLtrQTQlDiCU1a5eSjeu0jXgQCOnFqs++p
         kja2c6bkXyP4i1xayNl2ewm2Q1OBzhobqbhcDnLGtmjHDfNJJ6DqSzXiwDwpFmjejr7F
         QKLub2H/FTJxbQQzy/PYFb+yyYcHBHsIZ5RKd4l++VKG3VRQ7YQOs0X7dWMHTsu47ayr
         mwne85TIUpzMUiw0c73lAKx2fxb3dbh1tpkkdJf/MMPsbTAJhTxohgqW1H/WCj1IlKNC
         /Bm3c11QA2Njs59wFK3QnAj2HpppIGVQs1TPFWJMlLV1hWHMQ/jR1vh3iff2f8kXaHZV
         Gctg==
X-Gm-Message-State: AOJu0YwmcfCcCgOIXm1Q2OfMhI45oA6M8V452WBAukrHd+h6coFqvv8j
	R//ft8B8E2a8vvuKsI5+ehI84GKKaZ1v6MjuQUcFdfEspr2ZWy6W+NedDlTQMxzZXS73sexTj2S
	U5jXEWYyNS6oL2UsmHpkVYhej4tR3tF8r4aWGagAkUZch2G7Zg/LrPp1Mm+Ja5tltoDCk
X-Gm-Gg: ASbGncsIG1K0F5qd9/3uW8DP2u1bNo7gi1blJqSuI3IzzXDstcPz7CU48vGikN5lSLB
	TpdZ/0nXiBmoNugB3l9VCFiOB1wmKM2WeEinvC9ZoTc2DCXoPHpSgo6VoSVH6qKLGyOfe0AgZmc
	0hDuUQmkbXoiiT6ARkIIkIsEbe+dZvxRdbXnxEiIs0q1SCk+Oyx+lN4lZN1xRyeb7agQtGj56Bt
	r71SzFLJInThbt+qgf1uU/7u50kj77OkIze8dJZ2ssKC4cDy4LineCij3JXVDmLq77LncQHKSNZ
	A7ecetbFOTnH5yq0XPWT3jf2V/Wc5usl4Hgnj6Y0bH6lICAOcTVhVKRN00UaIR/bxQ0ZP9keHUG
	glesjNKzPVADga/mkwXDEKfRvchtX/sls4+LzA8r7mN9LivcL5FW7Kx32S4Qa
X-Received: by 2002:a17:90b:2b86:b0:33b:a0c7:9ea9 with SMTP id 98e67ed59e1d1-33bcf85aabemr20406686a91.3.1761080943620;
        Tue, 21 Oct 2025 14:09:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfu+Esq266nfpDemo/Hu7oDDiP+Bc4u7LvOrdIaLaWlmGz5cns41MqdH0lKo4PH/hKAHJgDw==
X-Received: by 2002:a17:90b:2b86:b0:33b:a0c7:9ea9 with SMTP id 98e67ed59e1d1-33bcf85aabemr20406665a91.3.1761080943132;
        Tue, 21 Oct 2025 14:09:03 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223c813fsm489833a91.4.2025.10.21.14.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 14:09:02 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 02:38:53 +0530
Subject: [PATCH v2 1/4] regulator: rpmh-regulator: Fix PMIC5 BOB bypass
 mode handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-add-rpmh-read-support-v2-1-5c7a8e4df601@oss.qualcomm.com>
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
In-Reply-To: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761080935; l=2890;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=C+tkM31LHQwx5rXjve3N0QzxSt8/3cY/SYv5ANIxZgY=;
 b=mGIOOy398WUZlhh3Y3+Rd3MKy5gP2BRCgnMs54Xx2ZX/rRoVp1BZz8zw7wcE0P5lGyRQ1GXDb
 WsNPd3Ms12vBXK+EfqcKJCeK0Qgooi6kZ1qo6I0twUejbom4oRCZ9r+
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfXxu0pV8MGH2Bq
 Dm+CXtK83vviNG0xx4LXC2qSsUd4TAxr/TlahR3Exjtbk76KDn7lAq6HhpfV42tQu4H+FelD6CV
 GF83lMFDzF80X+ESL1DE9/K3gJdQNwrLCkBMT1WYw6fTGm/IOnRB158ShyyoU6lU6jclPSj/GVf
 ebcMm7a+M9FKJkiMpDv9BJsBw3AVQB+hm6xBScG0fFka5VVwgBQY7ncavCNRZxQK291cdKs7/QE
 5vFX5WIQkDae0YB9V6mbDhkPHaeoZ42sOb68tDSJ4JWvqU1a1wtYe3mv2A9kUdDPeb9iJ2dJzTM
 gGHYD2VNJeokN1lRvwnuDxduOx7ikVAgkLsbLadSNAEMCCa4LupaBWi2RFlwOPh742pGABEvHsh
 C7nAWpL0LztSZxdPznXKZ3rfn37hhg==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f7f671 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=l6s6GTuuRFQeQcd2MEMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: DXUVTQUKGSp4eCllX-9DU1TSGyFfFiXp
X-Proofpoint-ORIG-GUID: DXUVTQUKGSp4eCllX-9DU1TSGyFfFiXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

Currently, when `rpmh_regulator_set_mode_bypass()` helper function
is called to set bypass mode, it sends PMIC4's BOB bypass mode
value for even if its a PMIC5 BOB.

To fix this, introduce new hw_data parameters:
 - `bypass_supported` to check if bypass is supported.
 - `pmic_bypass_mode` to store bypass mode value.

Use these 2 parameters to send correct PMIC bypass mode that
corresponds to PMIC4/5 BOB regulators from the helper function.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 0a561f1d94523bf479f48e8c2062f79cf64f5b5f..947fb5241233c92eaeda974b1b64d227d5946a59 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -111,6 +111,9 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
  * @hpm_min_load_uA:		Minimum load current in microamps that requires
  *				high power mode (HPM) operation.  This is used
  *				for LDO hardware type regulators only.
+ * @pmic_bypass_mode:		The PMIC bypass mode value. This is only
+ *				used if bypass_supported == true.
+ * @bypass_supported:		Indicates if bypass mode is supported
  * @pmic_mode_map:		Array indexed by regulator framework mode
  *				containing PMIC hardware modes.  Must be large
  *				enough to index all framework modes supported
@@ -125,6 +128,8 @@ struct rpmh_vreg_hw_data {
 	int					n_linear_ranges;
 	int					n_voltages;
 	int					hpm_min_load_uA;
+	int					pmic_bypass_mode;
+	bool					bypass_supported;
 	const int				*pmic_mode_map;
 	unsigned int			      (*of_map_mode)(unsigned int mode);
 };
@@ -310,10 +315,13 @@ static int rpmh_regulator_vrm_set_mode_bypass(struct rpmh_vreg *vreg,
 	if (pmic_mode < 0)
 		return pmic_mode;
 
-	if (bypassed)
-		cmd.data = PMIC4_BOB_MODE_PASS;
-	else
+	if (bypassed) {
+		if(!vreg->hw_data->bypass_supported)
+			return -EINVAL;
+		cmd.data = vreg->hw_data->pmic_bypass_mode;
+	} else {
 		cmd.data = pmic_mode;
+	}
 
 	return rpmh_regulator_send_request(vreg, &cmd, true);
 }
@@ -767,6 +775,8 @@ static const struct rpmh_vreg_hw_data pmic4_bob = {
 	},
 	.n_linear_ranges = 1,
 	.n_voltages = 84,
+	.bypass_supported = true,
+	.pmic_bypass_mode = PMIC4_BOB_MODE_PASS,
 	.pmic_mode_map = pmic_mode_map_pmic4_bob,
 	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
 };
@@ -975,6 +985,8 @@ static const struct rpmh_vreg_hw_data pmic5_bob = {
 	},
 	.n_linear_ranges = 1,
 	.n_voltages = 32,
+	.bypass_supported = true,
+	.pmic_bypass_mode = PMIC5_BOB_MODE_PASS,
 	.pmic_mode_map = pmic_mode_map_pmic5_bob,
 	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
 };

-- 
2.25.1


