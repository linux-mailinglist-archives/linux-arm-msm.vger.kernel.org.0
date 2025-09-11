Return-Path: <linux-arm-msm+bounces-73058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D877DB527B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 06:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92E454853C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 04:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267DC258CE7;
	Thu, 11 Sep 2025 04:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oa0oKpGn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6A724337B
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757565225; cv=none; b=KrClxJ38nedFpTwN2U0wVER+fo/4QluPXjGvaFShebyhuN5rsp5fG19xC03D8DYw7dhIZfyKEHGgf+dRBISx5BURlgfZTjo40NwFIOStcYC/JtNFy1jU57/dQMDCmfL4toZzmy59ojzK/XyTqiQM6VSQDYhJittVWMap/PUocS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757565225; c=relaxed/simple;
	bh=xnmykQAcvyckgw0YxmPQiHFgobP+L6bZcjG7nwsTZ4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q674VOWFf+Xvrt2ll2yRdfRZvDr6/vO4ut4EZRMSGsCgQ5mRGWzyZUu7ktXc1cS3u+wro0lhCiPBEOIbgvvW6uz4zni1iOEZzxRWorYfBRIoODHq8PLr25fC/xenq+ZdLkG6M0qGxOfM2sgnu3QKNhFczz/CY06CV95D3mVqYts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oa0oKpGn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IcMd000422
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TMAgZU7buYT
	Kdw/GCsn25V+u3dQ6le/rA4xiN+RqdIk=; b=oa0oKpGnm9vX89tSlkKdzpEXM3E
	hyjU98B2SSu85jS+T0SgRLqZEeDm9X3iq0eI4N56fTtOq3fAY063usGWXh42njtZ
	fq8OSbj0E51bM+dFq1mhB3ILDIieDjJLYR+m2RjqEnJ3MEInBn0r7AbN6AXtwlIg
	MEyKCx8AgPfuvbGmSapbAtG+HNt1RtjsZpLB7tfPROGvER/EwnGrERiXYM1yB+UK
	JM3vD+iZQaKqa2rjMgraI4YyPuPmQS0k2dP9QIEAG0PYLW6hsCADk38/shHkjOj4
	l5zYZDZGhsluxXdDTgs3LNGM0nXMzgtFN75cnFoLE/6Hhz+jNf2uwyjVEUQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493cpb1sbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:33:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24457ef983fso5728085ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 21:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757565221; x=1758170021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMAgZU7buYTKdw/GCsn25V+u3dQ6le/rA4xiN+RqdIk=;
        b=v14wxXZuCi5u07Hd9aPjkJMsB0Xyh31dDs8o2oLXIigMHgDipRVNE+XgVVr6XjjZ14
         NLleFhETqSeflCKBMJbR2ffIzgo5+3frggjZ0Ruhfvr3cFF+DC/wpaGkLYLsxHLtZ+ti
         lIFEwxNuazzy+rswnbJPopb4A/Xv8FiLrVrh8Jf3YK1ywkiXAi+PNjABJix8kLhcbAZG
         mJrfQejc39L9wiNpUuV/o/3x9YcgrH7JsLJhwq7pvtYdwocKK3j+5WGDafUV+kERakAK
         F93c1ZF7AvXlp2SgH6PvSx5qdQw4G2FpjYVKPuLPCPr7yK2d0ngRwCejvpyd2OSkryBl
         +dYg==
X-Forwarded-Encrypted: i=1; AJvYcCUKfCZkqth/z52MDGlKmreGvRSPt68yRUbDD5tf+KdSWO66v6HYq0Dbzde4mg98yY+SzdAQNcy6YXe393id@vger.kernel.org
X-Gm-Message-State: AOJu0YyQd8f4tgsXL0mjISzQ0Ui2mxUx3hrUkG4VjwQ94A+V47VJpzJV
	gvhzIPDGbCwn1aeBF+Bz6S5pfl7DTDHmUjkTx22aW5nZDBB+QORLS24lHv/JEtniH0WUb1MGS6s
	NzUTXUwE4pblzV0e0zX/8KrBx5XkdTahH9DPc/iV/z0rFX8KW4l5KQevF1+cGqnBYuWjt
X-Gm-Gg: ASbGnctAZzdKhC22DuRxtRoZY6i6i4ZLE1stjB6qssXnid7cEONUiULs9jLC51K6nY6
	YwjWJXBDexO4Io6EWpWwm4VxcGCH8Mo+n1erxfr6VAova+3amZLuw9w49pccjzKf4R7Cwqw4q4b
	MfvLMMzDHDmtPZc0dQX5vj2Y709x2PyN4pBX2GG9yRMy+W0De1j8ROLUvAF2i2965szTNW6Hb5q
	KJUQdTgfIAfW7prk3YI4XpA+z/bDaYxWtiBtOdXtgK1t3uGCkfAM7apFHUwQX7/gjEvCI2v2txg
	ZjW1rsCrOWTJpRzS6JIvMPLyboognezwWh8tW88YuNK37mPhKws38z/G6SFCx3lnSxjkBvyOHHf
	l
X-Received: by 2002:a17:902:e843:b0:24c:7f2f:d9e6 with SMTP id d9443c01a7336-2516d81a032mr222003855ad.10.1757565220544;
        Wed, 10 Sep 2025 21:33:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELSjPwhaKp6l0XXdzH3iIcNWUNMNNrVth7UkdZKu33009b6miMEtFPBuSlwEwOyhB4Px9PPA==
X-Received: by 2002:a17:902:e843:b0:24c:7f2f:d9e6 with SMTP id d9443c01a7336-2516d81a032mr222003575ad.10.1757565220099;
        Wed, 10 Sep 2025 21:33:40 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84a46csm4323975ad.91.2025.09.10.21.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 21:33:39 -0700 (PDT)
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
Subject: [PATCH v7 5/6] spi: geni-qcom: Load spi qup Firmware from linux side
Date: Thu, 11 Sep 2025 10:02:55 +0530
Message-Id: <20250911043256.3523057-6-viken.dadhaniya@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE1MCBTYWx0ZWRfX4MnAtXF+Ug3q
 ZMk5NI7rSAZGgD0r1RG3Y5emH88lK+GfgysqPdnQSmOWMR5qcvaAzXnz80IMOPjy/6UQDc1WY9j
 iH5WNNGXvNsQ9VpTGHRi2vQYcy46/5gQOw7S6vhsc7oU3iuenM2Wm6RnzArXPp5qLhUZ5jFI4ze
 KkiuY62/BPnfNmRGgyi4dyG4hgoy0dU9oqHjjXSF+m/zdKA1ArJ+2VOLlrCmUNHMVmAGpWxmc4s
 hEkuwkhVO4ieJj/bNlx4yQvmk4Pbg4kcTIsRAiXLATOQ/ruWOw2hfDl6mlEwTTEY+SkgOD6widL
 DrsQeyGQ+fXWxyVCNVLpDjP7IGmbELY2OPAE+ITPA1KhqYgEUV0T7UvQOzGNEzb+y1pDzFng+M4
 ViFcPDfa
X-Proofpoint-ORIG-GUID: PAiWiNR3fkJ3QZ1m5gJcMpiKPzYpodka
X-Proofpoint-GUID: PAiWiNR3fkJ3QZ1m5gJcMpiKPzYpodka
X-Authority-Analysis: v=2.4 cv=P4k6hjAu c=1 sm=1 tr=0 ts=68c25126 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=zIdmu9zckVospZd7ahEA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100150

Add provision to load firmware of Serial engine for SPI protocol from
Linux Execution Environment on running on APPS processor.

Co-developed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Dependencies:

This patch depends on patch 3 of this series.

v6 -> v7:

- No change.

v6 Link: https://lore.kernel.org/all/20250822072651.510027-6-viken.dadhaniya@oss.qualcomm.com/

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


