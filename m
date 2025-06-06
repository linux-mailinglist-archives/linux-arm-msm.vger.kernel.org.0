Return-Path: <linux-arm-msm+bounces-60477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A15AAD0242
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 14:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFCC01674CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 12:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DE72874FD;
	Fri,  6 Jun 2025 12:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQPPGsWv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588B7287513
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 12:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749213234; cv=none; b=NDNTF/dJq7LNpN94T7P8AkDh42jv0PYpUaXoGuqfTi5EmTNSnfJNyO9sd5D+TvvfyWb33h6V+rl1fXaDo7fzH2H8oTkLyh+9Bpb4JxDm+DU/4qnuJD5WvVLPWWjfGEhCxFVDBTBSbeKaPElUr40Dsix3kjCg6EGYL0bnGUj0ZvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749213234; c=relaxed/simple;
	bh=ivddDW5T1J4JyvrdspbZFEYi06jSdvMZOcvhE69syLI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k2UPkkgl8s7iY/b/O9GoFJ3hYOqQSO4cI2Z8rxpEz2MpwYVAmRrGteH8OPIcWJ9UYwGLgJE5oyEc/tRG2siFVjssfPBsj7gQjrbnbCEyX0m3r8NW+Cht+u2g829wP3+m+TiwTXxKA2CBUNAMczR6nVHF8rwLhWSP/BhEenQfFIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQPPGsWv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5569aeCb031915
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Jun 2025 12:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s8QIRnPERxawgaDmjJObpuottssSVfUeoUh
	Fx/MyZdI=; b=QQPPGsWvIG7XglAeGf4kRQpZ3C9kG3w7hKeUxNtRzAdHxvtyFJ8
	bVnyUyRSiAFiubPR9a3meNVq6VlGBiV40s3Cj6rVDYptXpPo7biWdmb8v+laOu8D
	h0x+ZOpF9rV2HB7dBeQWC6Q9kuTyt3jF9x7H9FloZKuPb87Z50yn3CHXoKd305O+
	zcUNRvcfqMMLY/3aHp6yt0/2+jPXLet1hjZ0+ZpUd3nYbJAKxFbbxP7Of/0/ywnI
	jb/cR38OQWp4LA++0oVQm5k0M3m+0RtnBhOw28EDOftODzLxKsCD16M0zQkGHRpd
	oJgEbq5hN3LtJTypac+szaggIZZQjye41Ug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be88a59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 12:33:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fad5f1e70fso36524226d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 05:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749213218; x=1749818018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8QIRnPERxawgaDmjJObpuottssSVfUeoUhFx/MyZdI=;
        b=eH/h1K/7vsZ/vpGg0fCjvckDVFCVS4FTNYK+DqrA2t+p6sVsQCuAxfX4MTlzKUhuQw
         8bTnqrLXHEQXNG+nAAugtecXTcS3aWuGJAWIo279hUTFPmUjcti4Snpt7d0Ev8/Jmm6a
         p4Hk9PYJAC8dq9771rm7bie3CN2ANA28ymPn8ckVX+QQJASZNPTReslGTi9SpIlmfME6
         hZZaBBpwTNgfZZZ7IdP/hLXcswBtrnMrCAOftGs7FuRH5Mw5L0Ql5HOrNhS/yRHI3tYl
         59rviP28rn3IMbR1kXWv3YLG8muhPGWBiro9+2uCrk+XmyHKSLdaLTGmuNEp8s712E0f
         syYg==
X-Forwarded-Encrypted: i=1; AJvYcCVzrzbuCbBktZeCo8hd6ZFCo4upqcwXa0QLwvYzZoNiAin7uSGo9TR/K42Zm29abxi+Vhvjv2eM/A7JI/TE@vger.kernel.org
X-Gm-Message-State: AOJu0YxjfFjaCnD4zjw2kG61kZ/YvrvB/oxLfIgKiAymBENRxqCC8Mwz
	D0NKaFMlRhQ7hXjeUgO5PtpDaP46KDQVvLsoGuSC9XF3DyrPAv56AqSbDU+G9y6Ajs4L4jI+HQ4
	isr6L3ROj8B4chUaUXAdRLt/vecYBCIovy683z9ha/9gdofFP7OxmpoiYwwoSPt69BnRE
X-Gm-Gg: ASbGncu5aIWNsdvwj46Dwv06BZqeMQnlG9VqbkpzwvBEZiCkNbdGukvgeitYdaUEgTW
	/Zea52DP7x16YSZ0CrcQZvdgEBvRSlDZKjbLPVy5NBjU15v9SKV8f//+lHl0NItr0CNXVa3JsCB
	UbuPMU/9sAx6JIXWV3aZ8A0YlCyWDeys10URhaDhAd/PN6mg3pMIFegD5XfX8dUD5yoes4+Om8d
	pM/dAWZ375TiQUMj4z31siTadCCiHk2VyZMaJvxUK1oPmCZ1/9IeYOCjRbhRUkVvdUtuo9Fu4ZG
	PCPiK318DztXtbRSELxIWjtaAYV3HL9d5tX0paMVhRef0iNZn6lLpZF3fTB5/ZBR2w==
X-Received: by 2002:ad4:5ced:0:b0:6eb:28e4:8519 with SMTP id 6a1803df08f44-6fb08f86d87mr50834786d6.21.1749213218277;
        Fri, 06 Jun 2025 05:33:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq0LfKT7V7Hdr9+7FwMCh7gMOKBUV5KaU9c5KLNxPHvFir0fRLD3304/1mkrTlVrjWvgwZcg==
X-Received: by 2002:ad4:5ced:0:b0:6eb:28e4:8519 with SMTP id 6a1803df08f44-6fb08f86d87mr50834576d6.21.1749213217966;
        Fri, 06 Jun 2025 05:33:37 -0700 (PDT)
Received: from trex.. (142.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8f12e16sm33777225e9.1.2025.06.06.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 05:33:37 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCHv2] media: venus: protect against spurious interrupts during probe
Date: Fri,  6 Jun 2025 14:33:34 +0200
Message-Id: <20250606123334.4114123-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6842e030 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=jucdD076RO8dzeEYkB3eYw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VOU_bqPf6nVU0ntsUH0A:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: hHtWnK6xveLWg4cRksr5V6mpKu2vHgJq
X-Proofpoint-ORIG-GUID: hHtWnK6xveLWg4cRksr5V6mpKu2vHgJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDExNCBTYWx0ZWRfXx+88Kth3gHX5
 3DJTPJu5/JZ54TKhSc5TST/zfW0bMuLAawiYy1O+bzlTJNp6Raw3QyN/NtHzNnvzzd9xXo5V+E0
 /RnSnOB2J0C17cyDOJloRAAGY+0IZF+NZutgrIwFWgQRqImoh/6dNNN7mdLLQzQR1xGM0/RDO9w
 uVVnmGl+duRPTgpdl8WDIiooJS0WNjn7coUq7YEKfYTBw1wOBDIbqJXxxxVPagh/HomH8V1Xr13
 6op1008+6bf2nRwsTWnKni8qul/MbRQcQWN7QTkPzmMEEn5SRFvhOFhKYjLKfbE7FFt4XjMczcb
 xcAe5FSlG6ep2+pQ2wOoZtqN8Bu73hGia26ayH0EeJgnLSpHHj304zOHwrA2e2cfVw8lDPgk7Zh
 x63cFt7FXkmo9EePZOBmX9Cf/ZRc0B4WgGshEnZkzIfuvv7f/E7HwhySh5XQBxdUmCeRXn9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060114

Make sure the interrupt handler is initialized before the interrupt is
registered.

If the IRQ is registered before hfi_create(), it's possible that an
interrupt fires before the handler setup is complete, leading to a NULL
dereference.

This error condition has been observed during system boot on Rb3Gen2.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 v2: fix authorship
     fix spelling mistake
    
 drivers/media/platform/qcom/venus/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index d305d74bb152..5bd99d0aafe4 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -424,13 +424,13 @@ static int venus_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
 	init_waitqueue_head(&core->sys_err_done);
 
-	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
-					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-					"venus", core);
+	ret = hfi_create(core, &venus_core_ops);
 	if (ret)
 		goto err_core_put;
 
-	ret = hfi_create(core, &venus_core_ops);
+	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					"venus", core);
 	if (ret)
 		goto err_core_put;
 
-- 
2.34.1


