Return-Path: <linux-arm-msm+bounces-73059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B478CB527BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 06:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 704334867B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 04:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6031CAA92;
	Thu, 11 Sep 2025 04:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/H6jqJN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8A22472BC
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757565231; cv=none; b=r6M6BAT6PYfqOtr3etCCr56Kkj89oXUxikfF1Rseas/Mo6oByimbInTbvnjgqvFhU+Acr5cgn3d0qf4t5suYqlUkGmI/K8qn9nr9wk8+keSykrJHMARYrjs1zuwQxjd4+NULF+gsbM4gZIB31TYP6SqU+liIK7xocc0LDTgJ664=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757565231; c=relaxed/simple;
	bh=mx4d1AM06bO2S1IONf8a/pO/zrCQyz3bPkPpHgejOOg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jgjTq5dmHLOUsfdjt4cRxD0elSkEu0zefqamnprDTc4TqevXT/1dfidFsOaSWBbnsPDi20ZoOx3JRppiZzKuwcx1VyviUOaI2klx8e+xe/xwpxOP0sWxWTtO3LjF1LdxGxDboO9PPUz2Pi4NLr5RbyF4QMsgQ4neyFldOcPThRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/H6jqJN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2J01X005772
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kcphrBZS8ap
	5SJ3Zmdf0DUuuF1sTIEHZQlGDR6UGNHQ=; b=U/H6jqJNTXVfBG/btaflFrby2c5
	7fuRKskqtI9rpIgBmNvsFCtvNfPhQ5mKFn0ba4eTLfDFaRuyh6Ao4AlNw5AZdP0E
	k3J1uF7NNnGizXcDrZ7q8c8t5j/7C2ySA54Ro6r2jnXz9JYMjFQrS6ORPmJC+w+U
	f8lK1Uzy0atFuwJ3TnptBSy1bgk8EvFkJeW3tN0oKxxR0Wm+0hOfz2oFpymQCU1p
	9rFjxieKXS44b5rmOjzYAgP2GbPpq2+gQV8hLzV2VxaQvIayZfVbnwvBiCLoCsUv
	Obz3BPq13zNqwh2GtYiuG6WlsyNc/RhmhMx08UXKcWiYBp+2ax0KjfUoQ5w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2a9uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:33:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471737e673so543634a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 21:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757565227; x=1758170027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcphrBZS8ap5SJ3Zmdf0DUuuF1sTIEHZQlGDR6UGNHQ=;
        b=jRWTXVeFCcApkrcfferpBlMSsgouwjdU5UIYs/vi16iIDcpjziL+uwfUS1Ps2DxOtx
         sglpXhiDf6EUl/T8wUrWemDoVNDgrFclxhxX5qwaba0K+23EpKSlnHkbOttDruIa8l/Z
         tkSMQc8z+m36ceBHoOryWcPnBj8PgJXe9sv+3rHNkyXupTP0ioUeC4PNCkkZxj5ZNesh
         67fevA2BRCL7ywUIMjYWem7I8lNXzkLsG7TKumlqKqrL2jiAbYvr/KXdgJVkrVyEiyiE
         1lqHj640LEBoRCkQ4XORCwHBz74jBbcZ8qjHiGPvYsMC/bXccIRUJ49KK9EuQSPbE8v7
         e/8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeCNEX7+HRWM1IMjVfU+jFBJBtBPobl0bc7s4OZc6JsHlJCMtHDidnTYeCorxeK8/XH9A3ZbrTVg9KNIVK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxcs7CRSXJIqoq8Ojp5Cg5rxPBrUAywTIKBTiqcwWZmS2Dtbrq
	aoSr0DYsPa/E7E1U01NegoO2DcFPzz3GwHtF23cm9drGA9uiUWqsAY130eD8xxBZkVcwGbpKy3O
	kfNVKHeDZsmsJzNvHNR8sQCZAxTpfzBsuQL+/WhAmPKYD9c/in4WuAVbKtpiziey+2jcz
X-Gm-Gg: ASbGncsEE2VJKuTA7gmbLzcNBAfKtEAxr2hQVwOVLv3jzTMGhw99lVAy92G467izTRq
	oc/Jsl8vL3qUptwsLRM0XHNvK05jinu6Zsd6Re8sGkzy+gfBe2vdgRBCEVLfyAv4U6zk8Hsejeu
	fAqCcnOPG+dXahauDDxeF9/OvseFK1LnQTo7ZcCHqvalYJzFCsLzLXcbEoOUO2U4DhOmGYQzbu/
	cqMlgk+DJ2+t2fq/fPnSPEfuJ4YMVYH9gJRW+jEAf9UgKaa5Iwp60JVc6j25Gd6YB/ZNTiR5wTK
	pjnlRly2Qi0nZnvtBUKzS8BX4ff3Q0DR34bs+HDoO9lEvFYjhlKuUcyB/n0XC9/JBG/gt/vNSRc
	Q
X-Received: by 2002:a17:902:db0d:b0:25c:2ed4:fd7f with SMTP id d9443c01a7336-25c2ed50044mr8373225ad.42.1757565227066;
        Wed, 10 Sep 2025 21:33:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJSDLFBIfEII/dWtZuLvluQE5OM8yus/jL1cVR398t46tsI0mtRTv1Sd8hk0JJ82ColwGboA==
X-Received: by 2002:a17:902:db0d:b0:25c:2ed4:fd7f with SMTP id d9443c01a7336-25c2ed50044mr8372875ad.42.1757565226545;
        Wed, 10 Sep 2025 21:33:46 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84a46csm4323975ad.91.2025.09.10.21.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 21:33:46 -0700 (PDT)
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
Subject: [PATCH v7 6/6] serial: qcom-geni: Load UART qup Firmware from linux side
Date: Thu, 11 Sep 2025 10:02:56 +0530
Message-Id: <20250911043256.3523057-7-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c2512c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=9JGZuxy38fRfBSF6gCkA:9 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pTatXA_2yEEOVYj-XH0ELYhNQY31hPeT
X-Proofpoint-GUID: pTatXA_2yEEOVYj-XH0ELYhNQY31hPeT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfXxqCc4PVr3E/X
 aFvyts9PuSzsSfWfqnUwG7dAvHf6tr/IjWTVgp5mZGrHC8gyRwtSig6/iZisjVI0jepstBJOUd1
 ajOZ++LZpIjmgsDWVsxbFUL64XHRq+LfOV8vXlHP/61zaZ8cMwuV7hhMqjYB46PwjLJkg4/fV1r
 2LE7/LRC5LBhAcbZO643/PWeT9JMGd4c5nJNxuxu1SMqi8NkuMhG7hV5pmaIsOynF2sCE3P5oh/
 AOB6S6fWhKGXnM8sofcj2oWAmX/B3YomHKTZX5cIPovRFBT2aHxRWzNWo9o3qU40dOr+jWrlL3O
 eRYNbf1DxInJF23sBePSwhh7pct8y6Gkx+kyu3D1lITDpxPU38Q0fl8B/9skxhC/J4LS0KNLT+g
 BVdEqCgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

Add provision to load firmware of Serial engine for UART protocol from
Linux Execution Environment on running on APPS processor.

Co-developed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Dependencies:

This patch depends on patch 3 of this series.

v6 -> v7:

- No change.

v6 Link: https://lore.kernel.org/all/20250822072651.510027-7-viken.dadhaniya@oss.qualcomm.com/

v5 -> v6:

- No change.

v5 Link: https://lore.kernel.org/linux-i2c/20250624095102.1587580-6-viken.dadhaniya@oss.qualcomm.com/

v4 -> v5:

- Updated the email domain from 'quic' to 'oss'.

v4 Link: https://lore.kernel.org/all/20250503111029.3583807-6-quic_vdadhani@quicinc.com/

v3 -> v4:

- Add a patch dependency note.

v3 Link: https://lore.kernel.org/linux-arm-msm/20250303124349.3474185-10-quic_vdadhani@quicinc.com/

v2 -> v3:

- Load firmware only if the protocol is invalid.

v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-9-quic_vdadhani@quicinc.com/

v1 -> v2:

- No change.

v1 Link: https://lore.kernel.org/linux-arm-msm/20241204150326.1470749-8-quic_vdadhani@quicinc.com/
---
---
 drivers/tty/serial/qcom_geni_serial.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 0fdda3a1e70b..ce5cb97d60a7 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1184,7 +1184,13 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 	int ret;
 
 	proto = geni_se_read_proto(&port->se);
-	if (proto != GENI_SE_UART) {
+	if (proto == GENI_SE_INVALID_PROTO) {
+		ret = geni_load_se_firmware(&port->se, GENI_SE_UART);
+		if (ret) {
+			dev_err(uport->dev, "UART firmware load failed ret: %d\n", ret);
+			return ret;
+		}
+	} else if (proto != GENI_SE_UART) {
 		dev_err(uport->dev, "Invalid FW loaded, proto: %d\n", proto);
 		return -ENXIO;
 	}
-- 
2.34.1


