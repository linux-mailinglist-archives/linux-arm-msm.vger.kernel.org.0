Return-Path: <linux-arm-msm+bounces-71363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E7DB3DB1F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 567B2189BEA2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 07:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F1526FDAC;
	Mon,  1 Sep 2025 07:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zyj2FdeD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BB726F297
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756712022; cv=none; b=dQdtMZNO3QmuAzntPFJPJMtAJIjktPzqwo41s0BiW1LMBGmVFeTC/t3qefCvbeqCXP3sHauiLcO09q3LF80ePZuJWJHXk+rhmY4DkUzQ3aPmyQPI0wgGcsqxmzUhMou3U6BAQpZpRk7VGKoHGAP5pOLNisFN1e3OCjoiOowwZhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756712022; c=relaxed/simple;
	bh=1z5soL92eC8zffCxJhz/a6/ADgzwmSCCyVSbMCgjXJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BUx54dsh33q6sCllk2tM8fNupi3Ap2sQaATCpXYTgz9BH+wY/QTknhA4JOEE+T1nQl8ExvIycagO0+AUdv8qv3DVVpEfhqLUO0HmtR6GpsU2tr/CaNe+8LIWBeqhLfwOU03viqcP0b0giihhy/G+AjrM5TVBfYRcr4ScCrzgU0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zyj2FdeD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VMLPHs021204
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 07:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iS447CDueJx81gqdmdCm+59nRouqmaLm51fnjKALN1A=; b=Zyj2FdeDQgi1v6z4
	SBOe7gdx/e+TqAhleGjzdl52R5aDVd7g/13WzLJQRtwT6XmRCf/iBnRsj5+sTjQA
	ESZ8str51+3IAUd+5ZdwqR/DEr8lUUjd7j5fSCdrWBl6L9S+BYJlRB83EYtXc6pG
	0e54ywcARry6UgLghPyPwIx69fmegokGNkgRUNUqw3YVOgfNPciKXOLE9cmBSBVL
	iYRkt03wCOr3pUgQC8lq5CGOf9XYgf26ZvP/ATTbT/sJttIwrRwxl6p8LOTooaE2
	23sUteVMC3oEVJxXfVgy4yggCXAHrfKwiYn2Ds6FfNGu6/X5XReUddWKa3XCjen7
	4+MwDg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjbrj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 07:33:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3278bb34a68so3829838a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 00:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756712018; x=1757316818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iS447CDueJx81gqdmdCm+59nRouqmaLm51fnjKALN1A=;
        b=pDdj29/xXSsLg+HUWmY6crancUfBqGUkc0b+P4doQkH+sihvtBM+6fWWH3nr9f5lUr
         oPP0rX5tcqZqR1TiKTZ9GMmerZmLNuDuhg/f45yqRfA5bPJvYVZMXGOLfG+UKqiWGll1
         81f1qr66stLlg2Txrq1inbFEG5iyOHKfqBdwQTUeMTnHFZWEEQZ1th0U564UGUF1ndoa
         tiTinqIEtuNjFqrUkHaB0KFIcCy5GAO8yWFPeEKbhoyJasFl8O6Mxm1tMiiyAgJ+esBZ
         41emDhKIHWSmHuW3l5HNZLq8G7kDhpI+D2/tMNz+Nz5bXkWAloxJuNpLqlEqXM9Pdbz5
         CDLw==
X-Forwarded-Encrypted: i=1; AJvYcCWzwMheviMWcPRxulVvmpKkVxNwzp9ao249nrv6HntOBeiUeQuRebfHDbXrlH/VQWvZH+o6km/tsoeUwzBa@vger.kernel.org
X-Gm-Message-State: AOJu0YzcbdPGwykzvk4hUyGj99wArqIJPeB6z74Pv4/NsqbHELzbFexp
	wcx3cPL750N8C4bTb4Fm7ICZMJO7sVdqLwqaUDZdIxnUGYbNaHaKHWpUsktHcBTuEEWtCow9xPS
	NFDRv7tK+eUNu6/4WXXgiMh0quZdcmmTkCe31ObajbMUiwGBG2zbV2/COvi0B+lGaAvt7
X-Gm-Gg: ASbGnct62n0o6lbia9e0AC3m2bF5RY8EMZPAG+46DxI1ETAv5bKBq086EzmlTmHMKdr
	tHH4PNJSyfo02sBblp9wFCihYbApyzGWWJvqn2VWiOXCO+BDCiDl7ssuGYfBGEqnoeAT+AluqoJ
	G9DrLzMEFQCMuvBT5tCeYPRccwaCJPeJ/FFPoOCTLqFdn1LeCD1asAXX0A/+giH7QUeDHVgVn8Z
	ewhlpVLsC/QChcoSaQrqs/FxaJ9VCB6PsQ7scMLWQOZjXclQDb6B1+bUa4uZPDModxWdUFl98Sd
	ta+Pvh4kcsYKGTGE1we1vDIFv1Tn89LgNlxIZX7d4qOA7oTPAoLabhoGEq+yFGQkFWBV8BvmcRe
	UVQ==
X-Received: by 2002:a17:90b:2cc6:b0:328:fc8:2781 with SMTP id 98e67ed59e1d1-32815436289mr10246023a91.12.1756712018316;
        Mon, 01 Sep 2025 00:33:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEME11N5ENX7J5PMxn2/lOmJlxyjF3CMW/f8cATDCTefSoh8Jh05BTtdhlj/iDZcxU83BxCWA==
X-Received: by 2002:a17:90b:2cc6:b0:328:fc8:2781 with SMTP id 98e67ed59e1d1-32815436289mr10245993a91.12.1756712017773;
        Mon, 01 Sep 2025 00:33:37 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f5a0bf9sm16095554a91.13.2025.09.01.00.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 00:33:37 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 13:03:28 +0530
Subject: [PATCH 1/2] MAINTAINERS: update Dikshita Agarwal's email addresses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-update-email-v1-1-8fd49d58c0e5@oss.qualcomm.com>
References: <20250901-update-email-v1-0-8fd49d58c0e5@oss.qualcomm.com>
In-Reply-To: <20250901-update-email-v1-0-8fd49d58c0e5@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756712010; l=1251;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=1z5soL92eC8zffCxJhz/a6/ADgzwmSCCyVSbMCgjXJ4=;
 b=t2euVTCAGsiPp8Ksjv50+dqDikmrXohkuIevIYyUd9j7Uji1mSU97B2KyfTxRNlgGDeCD2Jcv
 6Pvdi9K6R6pBT9e7FWI4hUTAXKlJ3w6RK4R7JRaTnhUbCfyq2Tnb2Uz
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b54c53 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=69LWc1rl86c1DZQ69rIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bhbWoTEGZxtdudA8HbdrYBmQ81CL_HWC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX6rMSehNRd6ND
 PhoMfvZFWvlVfl5Ztxz+ocT9sn/yZqdjADdegI96/03gLm4WZ1qAuY3O5pgKYXpnEJ9G7gzUVIk
 T6rIYUMNVUDIavDdSEGS/+Rn+BaiXoXW/GoVT6l3rrhqrD8Hszb8S8Bw2a24tiscOkm1pE2IAZC
 mjTtIpsXR5jQ5+gS5FwBI04wRhvk5mwP0n9pkQUEv2fR/y6slYTq5zIMOAwsDbu6SuG3hfnQQnz
 RUom58Ld/r00wOA2w+/Wpgc1VCIaehOaj4bSQCzshpIhCF8xLLK2IVV6A7k6Hb8Wxk6H/vgWpFl
 VBo5HMHdP91Pb5VduzeAN3Zt2jxPqZpeTeKcx5Wynqk8vaxbjhWK1/juUV1Rk94E6GRkQek23Vg
 hQyt1JRG
X-Proofpoint-ORIG-GUID: bhbWoTEGZxtdudA8HbdrYBmQ81CL_HWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Use dikshita.agarwal@oss.qualcomm.com as the main address for kernel
work as quic_dikshita@quicinc.com will go away in some time.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 64ecfa45540c3e10cdef4fc10fc10e854b396c99..fe9253d6fe49c33828a79ddcf59d024495661774 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20818,7 +20818,7 @@ F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 
 QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
-M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
+M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
 R:	Abhinav Kumar <abhinav.kumar@linux.dev>
 R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
@@ -20890,7 +20890,7 @@ F:	drivers/usb/typec/tcpm/qcom/
 
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
-M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
+M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
 R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org

-- 
2.34.1


