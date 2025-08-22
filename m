Return-Path: <linux-arm-msm+bounces-70264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F3FB3106F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B61F5E45C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 07:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B162E88AC;
	Fri, 22 Aug 2025 07:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NRf2XMc+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60572EB876
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847655; cv=none; b=LOLXfWdUgJHh8VCKzTJwqw78wZ8tuhtUVYVzNwlA+97ESRYdjUYd1PrET25RvJ1uWdA41T6MQon650d2LE9aDAup0UG7Pte4Mo/bs5h02ks5jBwgqEPfn2UPJyf2UGp8GgPiaWVmh5Rn8ZMQc+IqwzVpf+jaVCJhFR/1cGhJDoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847655; c=relaxed/simple;
	bh=rppZiCFITLnyPFOZCvIesTPpVBituuK5qjfPs6kC+0w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qp8dtTURbnIwsMe4bhfpnvqF7NDVAvfNShoreYw98+DuRP5DIDS9Yc3Tpte0d3Q3SbDtsdV5nCe2I97arZckCdqZ0vaiLmosik7Mgwv8B2IOk39xKQhefjBUfpJ9HyiKyALVt718gdYmRGLUpgwhbR6QohSX+DnAWCdSVFqz/Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NRf2XMc+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6uW7d006033
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 07:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ysz/+Ec5M6J
	isJJhkm9lFFhDe9td6GUmPzcFlWR6xK8=; b=NRf2XMc+zx56s+AnjPt0XY6F37G
	Vjf/7DPFSiDx+BrD0KvcSph4UzlAgAK1FGWVOhx7mhTESVIUNPyHqpy/YiGlH3g1
	byRTCOWlOPxKGTCpCU666d2S97nY912g0jdqtd/tb9rc047271jdoXd+FQQMj18R
	CGOjVhzJyl4F4U1rxRUoz0kKXzl8+jTrwUB9MUvwrPrdjgYmOUPQiREB2Ai0I75s
	qSwaFi4UXgqVBvOpbRu0g0IHcLhVIpxRIpl09o4RISyPwSiuR9bpj9U56BXHXvhS
	RPOUQb7R+2+Ji7Y1FUQPqXCSCwxX2NhP+dNG0FtVjUVrdJ7bvypZyJU6J5Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dr4ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 07:27:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2eac3650so4754686b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 00:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847650; x=1756452450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysz/+Ec5M6JisJJhkm9lFFhDe9td6GUmPzcFlWR6xK8=;
        b=IDy95/T9vZ9RgaS9/yRjX8/PWHEmM5TwKy+zOOSeIcOdUwSzOEwoI1e+8UYR+HHe9o
         0whTs3zH++MBWyCdPYZhya3PghGxYvbcUPvZtdu+YyIxeXgWrdCJGGSJvTGYexi8tILA
         O21RFwFurkrn0PiI4E82RDVxcriCoqhxAqHBCA8H4zwo2Farb1KpE8aONPGntAVvPPET
         cPRrcRxAgjk7dkgTEFTNAW+WagEGlT9wfddmjMQ+l2wgkuTOxkD6k30swDM3a5+eDAJT
         9pUPZWqrNJ4IjNtKBTLDIFL0rnuat+ItY1+XLlXLNv2cZkxZWDKgWXmP2Dsa5YTD+1e6
         5ZRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ0ddsmAMJAg7v3Q0KCJqXcL817VaPBuCjC/a4DUnZUe8NL8wJL3fmHGzuVUHw2xINQWNAKeIAteyuLqaA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+jFHuWRo/RHqHRgWziNyIfx0FnFEmM1dpZNP5eBlPOev9OVTg
	4Ekd+bE2oHZTVJTA0YqnG5kqYJkwK71HuygT4RuR7IV4z3cITGsb2SGuzpF0CuVK+pIQg5TXIhR
	7B0a61vF0goubDrrJrosE6tgeSpUwAoGDobOenHlcqrRC8fmI8ggRUMYPItsxsz/kaG/+
X-Gm-Gg: ASbGnctYov4aLYSSf6zszBnFvDfhKw7IhLg1k8nnXyUGQpxU9jXBoRyNxGwp+QyROUp
	2OS6HVfQr8fl7onTahKgvVq+Ym9nQWRTQnOVdMPTLfIInhpDf8XpbEvBDp8VJH8N47rPeYb6NNn
	P/oy/P55xxchFTqYvTXDmpJMyEhixbBT1IsOc4txnlHjDX+LTht0nordhonfxmIEw2xq5URdeGJ
	Ja/vgDJWPpHdGG3Ndky/jhyiklLsLRwoXUcjao3AWXsnRb61d9hmzvEXSYMTDD+F2aJEbqS4CF5
	MHHTlWAQvxMPbAxyEAEpdhdTjwIp35wRLxTBYp0m2xa9LEmoKDBx/s8z9zpcATcQQBPSYfRM5z4
	T
X-Received: by 2002:a05:6a20:244e:b0:233:f0c6:a8a4 with SMTP id adf61e73a8af0-24340cd2b35mr2920546637.31.1755847650486;
        Fri, 22 Aug 2025 00:27:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvoBlvqz1y5FRUG9Fc+luKJehc/ngc3SL+gHN/WY9zmSPlzuzof+f2xGAbzxY9Fav9WvGPcQ==
X-Received: by 2002:a05:6a20:244e:b0:233:f0c6:a8a4 with SMTP id adf61e73a8af0-24340cd2b35mr2920494637.31.1755847650029;
        Fri, 22 Aug 2025 00:27:30 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fe3047sm6416367a12.17.2025.08.22.00.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:27:29 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, broonie@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v6 5/6] spi: geni-qcom: Load spi qup Firmware from linux side
Date: Fri, 22 Aug 2025 12:56:50 +0530
Message-Id: <20250822072651.510027-6-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822072651.510027-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250822072651.510027-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX73xstX1CoUfH
 mTvmOuPpbaBZz6G+zqv3HJIPJiasYUBT+oeqBRhcI3YkCSLc+TD61Xtew3OGriTYQ4RPDDSfN7G
 gapLF7HtnZfTb/bKcEs/0fP2QtjwRZJ6IagTvvYJFU041t9IlaMAADbljgN6LF3Qv9bVPcr4eut
 2uFsCW1Lm+ZXSDYwTmjDc6ifK0uBnnWzW1f1RgXYYGwLFqRm8z4dvoXgFBscFypj0TlE7hWK98G
 ccyERCtu8wlNEtt8lGPENENsJ8GKewz7+XnRRJO19N8GEv4Z4yQ+qwkDcLqL64C478ZR500h4xC
 k90rhlVjG+ZNbhXv/tQfH40K+aKFacVUL53TiYkGmQ/N/pPjj04Gaa81pRQE4Hl1t+rJjfBOwuS
 owBzERRAs5gJ/t8bIyAoFLVzpm5UGw==
X-Proofpoint-ORIG-GUID: k1Glw6zSCXSiv65LO9gRJ4AOQ9TpFjiZ
X-Proofpoint-GUID: k1Glw6zSCXSiv65LO9gRJ4AOQ9TpFjiZ
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a81be3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=zIdmu9zckVospZd7ahEA:9 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add provision to load firmware of Serial engine for SPI protocol from
Linux Execution Environment on running on APPS processor.

Co-developed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Dependencies:

This patch depends on patch 3 of this series.

v5 -> v6:

- No change.

v5 Link: https://lore.kernel.org/linux-i2c/20250624095102.1587580-5-viken.dadhaniya@oss.qualcomm.com/

v4 -> v5:

- Updated the email domain from 'quic' to 'oss'.

v4 Link: https://lore.kernel.org/all/20250503111029.3583807-5-quic_vdadhani@quicinc.com/

v3 -> v4:

- Add a patch dependency note.

v3 Link: https://lore.kernel.org/linux-arm-msm/20250303124349.3474185-9-quic_vdadhani@quicinc.com/

v2 -> v3:

- Load firmware only if the protocol is invalid.

v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-8-quic_vdadhani@quicinc.com/

v1 -> v2:

- No change.

v1 Link: https://lore.kernel.org/linux-arm-msm/20241204150326.1470749-7-quic_vdadhani@quicinc.com/
---
---
 drivers/spi/spi-geni-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 768d7482102a..a0d8d3425c6c 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -671,6 +671,12 @@ static int spi_geni_init(struct spi_geni_master *mas)
 			goto out_pm;
 		}
 		spi_slv_setup(mas);
+	} else if (proto == GENI_SE_INVALID_PROTO) {
+		ret = geni_load_se_firmware(se, GENI_SE_SPI);
+		if (ret) {
+			dev_err(mas->dev, "spi master firmware load failed ret: %d\n", ret);
+			goto out_pm;
+		}
 	} else if (proto != GENI_SE_SPI) {
 		dev_err(mas->dev, "Invalid proto %d\n", proto);
 		goto out_pm;
-- 
2.34.1


