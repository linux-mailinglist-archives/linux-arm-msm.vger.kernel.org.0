Return-Path: <linux-arm-msm+bounces-70265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87147B31075
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41AE33ACBEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 07:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8857D2EB876;
	Fri, 22 Aug 2025 07:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaAkutKP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7012EBB9A
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 07:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847661; cv=none; b=ez+NXWLnF44jZoSc88AI+dQjHaCErG8WGdBwhz2SPmHVAJ2xmHU6IdR2UN2ypWENUeeSLpA1zcme3zGc/SeYw36lt/WhKlUNuUekzVXknh/UV9LDG5buAAdrke1iFZ8zUle5/SYrHT6gIYBSpA/Moj61BwdGBxlU7E7CYABaw5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847661; c=relaxed/simple;
	bh=QyI6bFDxZoyMF95D5V/6e1rqQcfodiAaR9+oVqkuc44=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D2P3JQ04LUlL0hJYxt4W2vQYo/LLWJxm9Z/O6I328+1aG6ow4uqBiGMGHyD24PEJ1UuB/fqcAfWTz7gXjdHow6i9MuqmyJIUWyP6+TPIhGinx+lZQlQF6N8hdT5D9kD6/Le2ZM4Me+rovightKNCXxRqgI6YC9kWS6HQavA/DpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaAkutKP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6uSPg018789
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 07:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V+9lRsyxK8p
	0Zh05DSjub85tnlLxGuoGq/Hwap1kFCE=; b=CaAkutKPf6Wk+Q7o8qAzO8DtHeO
	k0hawMlREkOlPJFLZAbPStRHCfL6la0a1CY1grUMuwosXXR6IKXgxS/Q7YRPgcX8
	igPw3+8xd8S3gy101oBGsSVl0PcPKtkrfOqxvhUtcYqzfz5n0Q7A5nvstS1k9bKO
	vOODo/eGcRggnyNa/nkC6pSb7L69PU7OeC7Mj55Si76H8vDMfUr1BS9XgoWhF8Cc
	lkfe2yw0svGInYzqhuojwfNyqJHSIi1/bX41n4HZXm61qp5lg9IaQqbqr2WlgdZ1
	UO9hPWMP3OeNjWvXRR0wIXuN4/UDDxWj120eTaGbRF6UtP98uKHLA6+ADlA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52b03r1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 07:27:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77031d4636aso518464b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 00:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847656; x=1756452456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+9lRsyxK8p0Zh05DSjub85tnlLxGuoGq/Hwap1kFCE=;
        b=iag10ygEERMFYS8NESGua++MYxL+ojrZTS1yr1BB9j+cHaJNPjzvuK9MJFIWkvXkiO
         hfPP3r8V+VC2hJKa2klPAHUqD+R6UfgD0RqxP3FChkVS63U1YwEuEWk6vbaqKHBGc6yZ
         uW/5Y7R6l4flg9SsMIWU9vjN/IOPwWKjM2rDFqW71xFm/hECKBNPLNVwpORT2vKd60aj
         cMJ5n0tTdF8Z0JDRFLm+mCs41M03T0oNNWl6Ai9YfPvb6d706ovgJARW+u7A5ybcAxP3
         XTlydKZTMCgJLtwZDZjrF01YflQN7XQGtwofKvPJm3Ed7+qBQOWa1HMgWAQjk3+raamd
         KLIA==
X-Forwarded-Encrypted: i=1; AJvYcCWVf4ef8hokDNEUQneoQf/YZ2J4D6I4pNwfqleBJgBcN8cM6ivo5mT2/8eTYX6SAddvjfrkb0ec0BH0I89I@vger.kernel.org
X-Gm-Message-State: AOJu0YzW1Bluu6SwKeaEepBjpvPDhDxzec76mP5LsZawkdrtPohVcSyg
	nqRWf4G2tKoQqlcDsH6RfCijJXPVGbXSYdD2IQYmpCTnualOWQ3A13SFxKMTm9VHod6ctTECrz7
	K6F2C7ZAhdZFZ3DKWHWqOR5vRMOxfeGYhnikkTc9qSPPqCs3mYf/WkSjeQBH+zeo2OBWq
X-Gm-Gg: ASbGncuTYQI0ZopuOxhdsrkXqa77+dOe9GkeelfBdTJjco+mA/v2i1WZEzZEXbmgZVL
	egPYYEv3qvH2MZNfCkGXiGcyyrwEyc+1hP/SDtc0pXz1aug6m9yTy7lUYGkPdc6DzZrCnAEKU6J
	dJQHRPAVwMrj6Dj+PnIxYDEVfI3p7Qqqrymcsxbt4+PfaURub2GXdwqJPwvQO73j5DBQmeDJa2Y
	WnjvbZThK1kar5XCVwP4LcQiXfYp5IZt/zlVQpkGSpFOfzFDNiht2UE0wXRNQT3IfFJ3uaUfjYv
	2h1bJDoXZNZ1xYo++XNru2dFbvgTx6/xiAZ1YkQgd3JTI/+rikyiY0LU9GUD0Qk9y3Wdr+SAoAt
	S
X-Received: by 2002:a05:6a20:7343:b0:235:2395:9b79 with SMTP id adf61e73a8af0-243302c9601mr6496556637.20.1755847656286;
        Fri, 22 Aug 2025 00:27:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTehOos9qkAI5xl9S59zDtQOUhKhsUAUuyv1YxEMjXQtaSCQOWWRMW2hZ4CBYNuyVGH4npwA==
X-Received: by 2002:a05:6a20:7343:b0:235:2395:9b79 with SMTP id adf61e73a8af0-243302c9601mr6496529637.20.1755847655785;
        Fri, 22 Aug 2025 00:27:35 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fe3047sm6416367a12.17.2025.08.22.00.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:27:35 -0700 (PDT)
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
Subject: [PATCH v6 6/6] serial: qcom-geni: Load UART qup Firmware from linux side
Date: Fri, 22 Aug 2025 12:56:51 +0530
Message-Id: <20250822072651.510027-7-viken.dadhaniya@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0JeFiip+o0LP
 MV0HPPzNMxNh4eN5DlmLwY1Iw2lSncdZEp4TjQVbHdEdM39NPdQr1xdni90R/zhWHe+G69kfWF8
 /98wnVKGlqiNT5Z57g9+1+7uvaQIkhhDIt7HoobrK5UyhBo9jSqxRnR1h+4+/e/ZgWDCkLgIa13
 DxWoemqUpHuwjJEM9MIOcgl8Sqw1fcoZT9+grQwMMh+UNby42fgmp216XkE262uexXw8Iw/xiuE
 j3xRKkKsK6S2NR5LfIIXl9buQ8vbfnkHJ5wU2wvHXWKDtmZkHZ4CmTiPZYDfIZRknolFyClesoS
 vIcjDobzTv1/eIr9Ntw46Jictz8pk0h4YSwEHXxsUj/m50JFIE8Upi68y0SSUsVQP+PO7283BC+
 yB8NYd6yWe4c/azIFWO7W7o0pIOBgQ==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a81be9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=zIdmu9zckVospZd7ahEA:9 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7kcPlF3E8U_fbjrYKfMF9OcdJ71Zf934
X-Proofpoint-GUID: 7kcPlF3E8U_fbjrYKfMF9OcdJ71Zf934
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add provision to load firmware of Serial engine for UART protocol from
Linux Execution Environment on running on APPS processor.

Co-developed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Dependencies:

This patch depends on patch 3 of this series.

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
index 9c7b1cea7cfe..eba225be9b38 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1179,7 +1179,13 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
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


