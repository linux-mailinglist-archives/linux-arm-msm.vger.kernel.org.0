Return-Path: <linux-arm-msm+bounces-67312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C5EB17E7F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 10:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A03A362545C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 08:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AD2223DE1;
	Fri,  1 Aug 2025 08:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JYQ0VQOU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAD5221729;
	Fri,  1 Aug 2025 08:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037942; cv=none; b=aCJH1irbAAMG/pRPSFqXtIE9iV32HaRAxlLX8w2howvoHr09Thwk6XC1zomSBfmfhd/xXyKzJPG2kSZplvRvLqLyXHxHFh7I6Ta43HJBRxOGGoDGJYVI9a+2MRTwJHQbUZmBiGYThnIqZ9yxrzEt7jVYqqgTNhqhPVz8m8Amlro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037942; c=relaxed/simple;
	bh=SNZ+qIvv0q5SHHZtUwb4oVWG8RJIcoxaE3RiolvOf24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SL33qUVK/ZlAkUj2IEHkRbonRCKYKrm6C4ewkxc233njrViSl/6lvUHDsN66k3U6j1Yi42WZwfc+70Ng8C8RUFGUPVwJ7CoK184r1k12CJpuFKuBhltovvBTvDuqmSqHLy4tyCb5yp5e5pxiZQjk54Kh1pQrb2vefsakMms5NCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JYQ0VQOU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5710VDvl002397;
	Fri, 1 Aug 2025 08:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ps5li9xNF2T
	ln5pXSWEOhhBfekIshTXK+V8ZedlahHk=; b=JYQ0VQOUMABU8PgNGV4qpRlRea1
	fViU87Q6csNX87KyOGzkKMDuDhn1o+ruVTRwT0q1DAAj7GAJwppdlHjqoMh2Bsus
	e12TkYUFu2FTrsTzgnrbYSJoTDHhoylTOfznRtGSW5GwY9JZf+WrAJ6OoPBnk5nH
	KyPY+lqIBlKnvVwnmDluRJnl7ByZSIp/PkW36Tljntp9Si/LNvsa5Fnp2pK7Q/WL
	orysRW8kzpcalbq8Bs0c1kp5Z6Jx7XtG/e+59fe1n7E+CsmJwb7gvY7ycLKYcrP2
	1HjofDIKDCUpWXMr4htWfqCXFr00rivCbaN9AUI6C2nClHcepCTQvIQiy5w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbmawmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 08:45:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5718jWfw016931;
	Fri, 1 Aug 2025 08:45:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4859bemgsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 08:45:32 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5718jWbA016926;
	Fri, 1 Aug 2025 08:45:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5718jWPR016925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 08:45:32 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id 02BFF5C4; Fri,  1 Aug 2025 14:15:31 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V4 3/4] mmc: core: Introduce a new flag max-sd-hs-frequency
Date: Fri,  1 Aug 2025 14:15:17 +0530
Message-Id: <20250801084518.2259767-4-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
References: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688c7eb0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Takt5cPIvt0sc2LuolQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA2MiBTYWx0ZWRfX4v0hXMglmSmq
 LldPIeMXu/EfUuML58mtczzT4YyWL2eUbPMxgvriyeHw9Y5WX8fXRSnlSokC9f3aCizVcqKEkEG
 PLSEsYqY6PduiWxDa4xD1kkqQTJGD4RXHETzrxVJHOt3rcjyqj9w55ebLrfot3XYyNgYaC+Yr3p
 1XtAMt42+gbCiWhRag+JkDBDbuhd8kvzzEjUB3SZB6HuaWz70kcbFZhXTxeAXTPVIUWa3+xFcGK
 W+zdbgSsfKdHSxqzCkI+msPWHUls8GYBe61iVVc9T0tj2mQEHMAOGRvPld7zHMHauLWiXLAs4UQ
 Y9oWWxSLnlsO3S9jJnfVGt3tSBr0gx6WMzaseYymsloLd4DZrSkoVwiu5VuwZ5iBAmfAluFXUvL
 3rmTZ1x4vBSCyozwdor89YXmrg+rfwZLC+Z5luiZi+Nx0bbS7gLJDjVbBZqArMU8rcSt7POa
X-Proofpoint-ORIG-GUID: 9n3P6r_ArYWINUnxw8SATEjcDQ1R0I9N
X-Proofpoint-GUID: 9n3P6r_ArYWINUnxw8SATEjcDQ1R0I9N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_02,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010062

Introduce a new device tree flag to cap the maximum High-Speed (HS)
mode frequency for SD cards, accommodating board-specific
constraints such as the inclusion of a level shifter which cannot
support the default 50Mhz HS frequency and others.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 drivers/mmc/core/host.c  | 2 ++
 drivers/mmc/core/sd.c    | 2 +-
 include/linux/mmc/host.h | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index dacb5bd9bb71..7892e80bc073 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -302,6 +302,8 @@ int mmc_of_parse(struct mmc_host *host)
 	/* f_max is obtained from the optional "max-frequency" property */
 	device_property_read_u32(dev, "max-frequency", &host->f_max);
 
+	device_property_read_u32(dev, "max-sd-hs-frequency", &host->max_sd_hs_freq);
+
 	/*
 	 * Configure CD and WP pins. They are both by default active low to
 	 * match the SDHCI spec. If GPIOs are provided for CD and / or WP, the
diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
index ec02067f03c5..d2f1766bddb4 100644
--- a/drivers/mmc/core/sd.c
+++ b/drivers/mmc/core/sd.c
@@ -359,7 +359,7 @@ static int mmc_read_switch(struct mmc_card *card)
 	}
 
 	if (status[13] & SD_MODE_HIGH_SPEED)
-		card->sw_caps.hs_max_dtr = HIGH_SPEED_MAX_DTR;
+		card->sw_caps.hs_max_dtr = card->host->max_sd_hs_freq ?: HIGH_SPEED_MAX_DTR;
 
 	if (card->scr.sda_spec3) {
 		card->sw_caps.sd3_bus_mode = status[13];
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 68f09a955a90..552e8a22c0a2 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -565,6 +565,7 @@ struct mmc_host {
 	int			hsq_depth;
 
 	u32			err_stats[MMC_ERR_MAX];
+	unsigned int		max_sd_hs_freq;
 	unsigned long		private[] ____cacheline_aligned;
 };
 
-- 
2.34.1


