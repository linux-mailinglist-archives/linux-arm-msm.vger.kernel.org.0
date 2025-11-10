Return-Path: <linux-arm-msm+bounces-80916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DCCC451A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 07:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 844FD4E73FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 06:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06873226D17;
	Mon, 10 Nov 2025 06:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7eRzVtp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hOjeE5dF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE732E6CA4
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 06:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762756695; cv=none; b=la7VD3tmNDUgCngetq/LAwenkTzDZvJWlMifdwuhu2c0NT8C4K2fckWa7nnG8UXH/anzLcHajvQutwJzgUGd+FaXBfnf7nHLcoyF5gOpXlZR95I7lzeyF4/YCFwJrOHJwcH3nc4zCqswot9qR7hU3T8GbUh8KDH50LE1YPoMvRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762756695; c=relaxed/simple;
	bh=q3JNVrxXbb+AXhPvJ9Bpegf2+j2OtGhx+/LfN31RE2k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s+VMb1swxkpwRvxSnp1PySb0bzjpmutwl2TvAw/6/NQitVu5YEZuCO9UQi7zhq7WqzKcyNuP+0+zh7XIshp+2mM5gjFEpAy7lT9UOdHmDHF51Xyy8T4hBXs1L9WxvRUFBuJOAI3wsFzx+MFqoNledAOaKrC05LM0LHKr2dgn/rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7eRzVtp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hOjeE5dF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9MlWh71791763
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 06:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AH4fOfUq2O4PEbyuB9Tb1ekT9XBUf1NjKPE
	/rCkAa+g=; b=l7eRzVtpMJ1IcwyHnm1Ofstsa1RumQPAU7z3DEGFEESuys+oT+J
	fEBJN/2gpik0ffoih0m1UXL54ssIrVh8N9U/L1WbnaQ1JwLwt4a0tfufBcJ6FdrB
	eVT8vwRJGfWMzRVxduWI0LW+xAzLzOQnQ4bKp8V5OxvS1x7tkL89QuanohUsyiEi
	RvSGxuu5m54Ijxw5i/sMFs7RvIOKWCxwovDyI4/Tj1Mna3dFjd+03eB9s3UUukAW
	WIrgp1AcZ6TTtF97mvHNMBJpz4241Cadbz3wkPT2yJoN0MAxVVOMgvWc1hwI72t/
	QgJPlI7wq3ui+cp4taUN7ti2MBiL/TRaZVg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aaue0hfpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 06:38:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a26a08b97eso325330b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 22:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762756690; x=1763361490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AH4fOfUq2O4PEbyuB9Tb1ekT9XBUf1NjKPE/rCkAa+g=;
        b=hOjeE5dFLJNhiyWEIGR3tE6NMvXSCrQ86YTprOwKdj9cGa9ac2DWckM0gHGjOBPzQ8
         BZQpO4QWppfsxd27AuEfaoQmvWXv9NxZZ0F9xaW4W7V2hxhkuAwovTH6BjsxUPo2Z8qa
         T85AoDaOe1PT0fuZyaDrkmZDTQfSW5QBhOKLQL3nAltK9gC+3/xg7jSyIrf1e1jRjBJf
         S705BcHb8Abd871OdS18B7h13s8fIXJBLntCUZAeVeVSP27jGYfRdjBP4y9OP6xfpaqs
         OB+dYupIIWoI0Dc4/XeMarhTRyQBXwH8bIREmn6br2HszZ/7ExHWrgoUEzFa4K/G5NpJ
         gC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762756690; x=1763361490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AH4fOfUq2O4PEbyuB9Tb1ekT9XBUf1NjKPE/rCkAa+g=;
        b=B8lgaU/OpmSPrC6M+711/ZmD77JOoUyxzBet67l28Zut1a4H5YPS7qqRt0b3VgRNop
         Uor1XU6xoF/wers9/yekdlusg68KevLAURAeNpQiVerqPVafAwD3OZD/jrxkQWPHtLkH
         OB8VJ3jM/zBghRGceCEk7E/UhjgGLcMBqAB/qJLkTSiTw1V+e/7s0CZzjK8IQqagMo0V
         zW+BEY8SDgawaTfaF9klbOOruzXYplIMNqjIrqzCVi52Ln8MrJFc74NTWyDb9+mS3CJn
         z8k2yRSw4Wqc6ZE9prGc/o8fnVHUN5OMp2B1PKIaDfJOrP1VZAUJgrs8GNUBMI6Ca9ll
         MQDg==
X-Forwarded-Encrypted: i=1; AJvYcCUEMj8YbktZAgIk9CZlLLq7PMn69CgrM52Q6O8SH4mIkP0ULN+6qwIv3ikPvEGSu62so8c5G4kjKE6I8D54@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0BN4pOy2+pUW00hy4XUiMdw9A9FaCWY9q6QUoaG3Hfw7uIrm2
	fHuXhCYPBQ052I2t10Mmcuw0/j3/mV7JqcqM0n3wS20ZBPJwDv7ZGJnMdsgzEIE/t6hXLzHTvaZ
	FNQEDFvaVwopqcK3c+JJfnkrkHHlLs6viWo5FOMQ2caOBKJT45OX0g7QC2kYfaMHQx5g=
X-Gm-Gg: ASbGncszEOzUPBsWFNIN5cwRhzZTPIE3wE31sRozItl7emf3Gxv2mDqVcSAaOO0OXNV
	AMDBVu538OVWnLUb+pw1bNUawh8Y4SNkePQ6ELFiGuCSIUk1a2HEjeTw0jR2S5kurkdUd3zV/ED
	hqv6H0hBFK5fccvlp0Rzr/VYtmAKHTjSwrrDKrxPd0/U79MGDNPGaNoVa7KA1Tfi0HdyKHVgKSx
	sr7bTuNNxV5qDvvN35+XX1UV1aXV+ThpVdaumA+NFqqgZ7loNcHlBXVzE7Hh7ebBj7pr5yE+5yD
	as/7W0vrC/CmY0ri/WEDYeoU1OHvwGHWDOgeodLm+PIezpdXHgTefnoFk/KT4Gx4xK+J550n0FH
	xqgaT0Rq4NDapDzwf3KjHZG6OA8hKtA==
X-Received: by 2002:a05:6a20:729d:b0:353:946f:fd62 with SMTP id adf61e73a8af0-353a2f44127mr4884758637.3.1762756690155;
        Sun, 09 Nov 2025 22:38:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFC/4Nsj2pQuLupI3eM2rkx7A3zoslP1yulMykcuUQ5KUIQsaeg/izh0mL76mVc/tBPGwubaw==
X-Received: by 2002:a05:6a20:729d:b0:353:946f:fd62 with SMTP id adf61e73a8af0-353a2f44127mr4884734637.3.1762756689720;
        Sun, 09 Nov 2025 22:38:09 -0800 (PST)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-baa3c2d92a9sm10729797a12.20.2025.11.09.22.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 22:38:09 -0800 (PST)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V1] mmc: sdhci-msm: Avoid early clock doubling during HS400 transition
Date: Mon, 10 Nov 2025 12:08:01 +0530
Message-Id: <20251110063801.641866-1-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5lA9KRlI1OVC8UZPyc7iYRkqoUmB5Td9
X-Authority-Analysis: v=2.4 cv=BfDVE7t2 c=1 sm=1 tr=0 ts=69118853 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hZQ1MXfSydDMrBGxCwYA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 5lA9KRlI1OVC8UZPyc7iYRkqoUmB5Td9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA1NiBTYWx0ZWRfX8Jjwvrdq0bGt
 57U8P67kRaC6RB6G6dIanZO5AhYwZEft/LNFy9ZiqDSUxc9gnGelItETI0BsbfY3vjGILEtukoK
 RYGdtp59nCMe5g7cWqTOaMEyccD3VSNAJoWHBsPmEz6Cpwu59TW6K2GLGC+xd7pZVCFj/1pOR7d
 QEzxHTQxJ2MyI63aKKmOo1A2aIynCowD2x3UIOcXwBuxi0Fs+ZxJtUrVV2h9ZYzjnTlu7i2XEG/
 J5ipXqVyr+5YG7GEmcyTHXRFdI6ERt6rbWs8RctrWyUOBKOS9yK0QbEDdapsY7nPmsDoWTLMDWh
 0YdjajiFhv9PO9Ks7KlAYw53XjhrvvyDt+z54oYh+yIOwzE7FYQD8rQGa87uVzB7fxmC76YjcCa
 qMbRoo5y6VnDeHxIjpqqlyMYxSDybw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100056

According to the hardware programming guide, the clock frequency must
remain below 52MHz during the transition to HS400 mode.

However,in the current implementation, the timing is set to HS400 (a
DDR mode) before adjusting the clock. This causes the clock to double
prematurely to 104MHz during the transition phase, violating the
specification and potentially resulting in CRC errors or CMD timeouts.

This change ensures that clock doubling is avoided during intermediate
transitions and is applied only when the card requires a 200MHz clock
for HS400 operation.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4e5edbf2fc9b..eca6a09a4547 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -355,7 +355,8 @@ static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host)
 	 */
 	if (ios.timing == MMC_TIMING_UHS_DDR50 ||
 	    ios.timing == MMC_TIMING_MMC_DDR52 ||
-	    ios.timing == MMC_TIMING_MMC_HS400 ||
+	    (ios.timing == MMC_TIMING_MMC_HS400 &&
+	    ios.clock == MMC_HS200_MAX_DTR) ||
 	    host->flags & SDHCI_HS400_TUNING)
 		return 2;
 	return 1;
-- 
2.34.1


