Return-Path: <linux-arm-msm+bounces-78274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8404DBFA562
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFB773A9394
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5162F49FD;
	Wed, 22 Oct 2025 06:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+QzKRGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFD72F39BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115840; cv=none; b=XwHqi5Hfb1XveoOYwd+itiMQ4nLbsgIpFjyiXsTQArskPPspsPLXWfpUmuFouyuEf5HZc+6mCBebEQn/2NrfZI5KHCvuPwYDEAZO2NnPwtURBWCZ+omVIo+C99Skk0GDxD3XrYQ7ry8+NDon0IEpBkECpRWgiDqffrS0dXoSxFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115840; c=relaxed/simple;
	bh=gHF+4pA6FtZnBUqOQl0MtcfoeZVl4BA/oIYisaYmmWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfN/9/928xRuqWwrKGbGbjsAfnwHSaCsOTm7g40evK9XQD92irSJ6Vd6VmG3elWd/169YidTFLfpMT6TfTY/kGmKwz/bAp67GICd4CNA/lvhJKDQIoeC9qBbMl9PeIThYbTcJ8OGd+/3ZHwtgQG9jFBlOV2WkrXmy5zCNnjHjVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+QzKRGR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M24wpq024550
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZEDudDcCpTGZPPYZsISbbU3+prU+iJo6gJxhAsFFbA=; b=R+QzKRGR1NgelHIg
	OeYeqbbcd4hjwxWGhLyUMDHKfzdYksC6GvigQGUVH9RVPVGKhH5iPbpl35pXxWn8
	i+dTKgNzu7aEek3VvYOm1paZpey4yFiQINnNF9VsRPxCb4FvPjBn1el2nzQvetYS
	NpqTPfCnXjGU2grMwsWo2kYghVhPH4ZwEFav+fxBh68vRLBVK0lbg5UVC3b+rOyC
	Le8n5MBU1pm9qyKQRAJ7q9o0z1A2Gz58eNVbX8Pc4jFiPnSGJ5Gwde0u32TNkbW4
	p+tE6NzOq8/muskCumGJG2YUV5BOP5p7ZEGaL82Ud94behDDmBQbkMu4MoWRxxqX
	yLxvqQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws5xym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:50:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26e4fcc744dso42579275ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761115836; x=1761720636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZEDudDcCpTGZPPYZsISbbU3+prU+iJo6gJxhAsFFbA=;
        b=lnLOfvri7gtd3yzFaA+GAeik3eISCkW0V7JahHn3rhV+Ynqa9l7LRPOH3yw2NR2YNJ
         CuUZamdl4jrxOADZaziYa+XF94+W96+0giR3Jbrm227fn+G+nbvuPntsVt5CSlkx5iOk
         rqn3/Da+5f+bMliyXlHwZngmWHUB3QcfYIWmyv11eNDKfHDOzyMMCCcGMjqfI7StEJFl
         /ygyGZJMd6vtFTc2JYZ0qwsGJaguWGNxSilSimG4n58ydtKlnQf1mweuVqmbeEqOUfTP
         JoIIW6/3rf49uEs9RfwRpU4E7nQyhaN3OX1DPQmiV1eXQ4822MQTQZ+wu1nfB4LEQxV0
         rIMA==
X-Forwarded-Encrypted: i=1; AJvYcCWf4XfJh830W3AlqidJCSV2asWyA6+volkjEBRDBznGYrFkcx4IhoQiKWEqo3Jk1ENP+5E9LDJYa0akAN5k@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt8X7M9JY9SoPyABMlCypAFjaTC8nCwy3oYopUEID78q15A8Ua
	TddO4FuZHbfMS1RJ8zYUQpoBV3P3Br6FZTLdkfFCgqy4zb/6V7XbBI7RZKw91KMUxdUH78+tiAa
	dEYqSiCgC+hcKKqyWg8fJQypQNiQMZhb47cgBagrazPWP0FCLbpFALhijAucxDcWyB4dd
X-Gm-Gg: ASbGncv9VTQw+cpPUU8Koxz/0/ycbOnAiEKLTcaT7uogrccl6PmsWmDnKbtgvITTL1B
	MitjnTXV08+iZCVTNXvNgAPTehpUdnGycXpE1q2d3Y5vyy+q4ElJk5wLrPS4mKrKrj0lIHO1hGr
	28LLGEgT/pw/s+fqDRZ5IrTo+sOsrxqeABkq0jOctRch5aTy4cxkEH1/wm2QM09Shr43DxJaf+2
	7Yj7mQvqvkbPfVIWgrypkk4KinwUZf6vPIEHiJHfDOz4+QgY8nkNu6WX9nSZ+HIEb2qB8BV8NAi
	ry68X6v7mzLa3AWX88UWQBGcft3cwockJnB9p95VrP3TSjeAp/1ldWXrFGjEcS3Wb2uNEGw/JD/
	Jo8uQPR3B3a0W1BZWFMFcdAJ3GXPVR7L55ZIXOBalscGdpIY/8w==
X-Received: by 2002:a17:903:298b:b0:282:ee0e:5991 with SMTP id d9443c01a7336-290caf831f8mr255694535ad.30.1761115836288;
        Tue, 21 Oct 2025 23:50:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCpodpjCxx4fmCbEkBSzBkPT2S5EgIPUUrmaWcMLrK/fxVAvVzC8itWrjTf66DpjqIW4r/8w==
X-Received: by 2002:a17:903:298b:b0:282:ee0e:5991 with SMTP id d9443c01a7336-290caf831f8mr255694115ad.30.1761115835763;
        Tue, 21 Oct 2025 23:50:35 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223e334fsm1560285a91.8.2025.10.21.23.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:50:35 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 23:50:30 -0700
Subject: [PATCH v2 4/4] arm64: defconfig: Add M31 eUSB2 PHY config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-knp-usb-v2-4-a2809fffcfab@oss.qualcomm.com>
References: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
In-Reply-To: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761115829; l=989;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=N04B8FuADvzjDPvyuTKyodc40jM2jOda/r7xCjpf/i4=;
 b=lyc1bzXd8D3qrqhkPjdIO4ToLd856fsMOQjTqs+gbO9UGKnkm09XbzvKE5ab1HNflxNdwWWYS
 aCllmsoNgwDCGZ+KAUg1vYrJBono8GVFYpjDq1xuqz8mek8HQWTqdZw
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX4vs0bte8of6L
 Ox69RNKRaM2Pf8E9KgN6ibEzQPclWYilhXCpMaNSZ8V2k4DDO73aO5S7JwJIERlGy3YmFsc2Fsd
 4c9QwEJwoJTaup3gpBH2773ytJyvwVwNuICl+SUSQZTnOlJl5HAuqcd6wBjlmq7ks/PDm1HjukZ
 XNqRyI0MKbuHzczFWDw6cIr0kZZCwrokGOFvvFH6kTTujeKjX3MUjYvTsKfTfdwLoYxJoekupAH
 fLwkStIVqzEPVJy7zQfF40TlruvDmUXh0w0zsVJjabLiNotvqqwPDC3pKm2cDLxyO2ALaj5MZjt
 zXilNASTmmR3soMSFaA2Bq0FFVK0zLeW3A6GjaYD+7/S1c9fAkp/BvVBRR0Gw4EuMNJelG0kzma
 98psrBDZxUM38VlLE+ct7sOv3jx/GA==
X-Proofpoint-GUID: 8vU8Un8T6qiwwgwUcjBAO-HSrGC_DEtI
X-Proofpoint-ORIG-GUID: 8vU8Un8T6qiwwgwUcjBAO-HSrGC_DEtI
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f87ebd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4ROhr7NTa0bsJorruOEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148

From: Melody Olvera <melody.olvera@oss.qualcomm.com>

The Qualcomm SM8750 SoCs use an eUSB2 PHY driver different from the
already existing M31 USB driver because it requires a connection
to an eUSB2 repeater. Thus, for USB to probe and work properly on
the Qualcomm SM8750 SoCs, enable the additional driver.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 630fc798570f..a600d9b86a7b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1680,6 +1680,7 @@ CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
+CONFIG_PHY_QCOM_M31_EUSB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m

-- 
2.25.1


