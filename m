Return-Path: <linux-arm-msm+bounces-61685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BE3ADE489
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 09:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18FBC3B1CB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 07:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC94627F728;
	Wed, 18 Jun 2025 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ptXNlTM4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8F227F165;
	Wed, 18 Jun 2025 07:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231718; cv=none; b=QJNBsykZzU4xgYdETpNwxk81WGefoi+Ua2zL2jUan667bhPvS6HTL6XE1NoFD5066s+ZOcrjX8p3lm+AbpkgYjW2UZ/CR/yCn7ODeGp0zz3+k3He4vEtBxgiKmpbpZLLoqB4FdUBJQ+bF6BPdAA2gxz6h75njb/HEBVR9PMOW/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231718; c=relaxed/simple;
	bh=EMbTRAeKS3Tbg/t5tCn0kKirAc/lZNOK8skqsXef62Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MTyKIa+lpMFW4zi5d22BTaiDK9C2PghSK1iQkVQLF1dR3Fj+mVVQIBvtiGEYTDYdJ/2MBqV84oPfbpx6lwZoEPFHm4+zeESztJPgPFUfo1ZmncBv4Vr83wgQHi1mZcMUkiBJd0JF8Ar1V9NlR3vG2ljvoOydU/+FiX8XjCxiSq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ptXNlTM4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I33Afe018217;
	Wed, 18 Jun 2025 07:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wpXlsp3rY0L
	AY15mVfxjKwF65SX9rKY0EbZxVFNK0ec=; b=ptXNlTM4p9jEUmlgnhGU0RFjn+i
	g4j0gRgvX5cGEJvSiAP1gSS/xPb4VSVsbAgMg5PdRIpeBDt7E5/0LdIkYnGN6ntG
	ESc0t3z/gJ+XUpfCbnHz/x9K3426H8hRy5wRgJuzy/q4Nx6X27vc6nA1+kpjUAHj
	qe4tSA4uOe3Qxt3oQoFiA3915a30JLJDiuNsTrPeYe8dRp0aiSeswsNsNXY0OiME
	b7ZlNiUxG36q2bwc75rSuMjwr+pMN0EDo0GuF+caSsVm+7+OmfIwDzEXkAGP1/w5
	iaxqQezUgO6myVR+lXYakAOHwAKO411sxIKe2+gn0N7z8IIczMGrKjK2rAA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mk47t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55I7STrl024858;
	Wed, 18 Jun 2025 07:28:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 479k1gnd75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:29 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55I7STGT024809;
	Wed, 18 Jun 2025 07:28:29 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55I7SSbu024796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:29 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id 149D75C1; Wed, 18 Jun 2025 12:58:28 +0530 (+0530)
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
Subject: [PATCH V3 3/4] mmc: core: Introduce a new flag max-sd-hs-frequency
Date: Wed, 18 Jun 2025 12:58:17 +0530
Message-Id: <20250618072818.1667097-4-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2MyBTYWx0ZWRfXwQCVqbGm71Nf
 SOJqE1z3DvHiLzJ8EqK5W+CGAyKeqHr741s63F984TMyWozC46ylT1RuNM3QH52Nix14b9TeUUd
 /hzJZRJOwotVjG7CSXrwl6xS5+HM8FTlIHLxPJJe3Kbb0C5VMkL0ycgj8DeIXFBcCzAxKpgspd9
 Fjqj9pbKK2WWkSUup0JlZMHcjPs/KqpTarWhVhsWZJKy4hncdPeomV31wuuqGPkuw4G6WEce+v1
 AmuFYYTJulQSvVemG130ItVm40j0Wmwud8tA9Xd0Qc31X44s7E7noQqYgMScl7SVHzyIU4TeyIy
 IRh5LUNQLKo0N37ysVfzquj24swbxjZqMdGG3OvxeSGc6rYBPMn4Q83XbvIPrme5Yd1nRZyt8p/
 Y4emG6tHHiVzo52WEK5J0AnNQtzvFm8HxTojk3rfentuKQ/7jQxvhS8+lmiEaHEmVCzAiKQw
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68526aa1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=Takt5cPIvt0sc2LuolQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Q1tb6ADylO1Ad-aY38OYgs5tKyjfliLj
X-Proofpoint-ORIG-GUID: Q1tb6ADylO1Ad-aY38OYgs5tKyjfliLj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180063

Introduce a new device tree flag to cap the maximum High-Speed (HS)
mode frequency for SD cards, accommodating vendor-specific
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


