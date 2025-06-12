Return-Path: <linux-arm-msm+bounces-61086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C373AAD6ACA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 10:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 603553AE94A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 08:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8979D223DD7;
	Thu, 12 Jun 2025 08:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjobSVab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6C2222560
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716993; cv=none; b=H6iFQhR064khHP4BF+gFWtDFTZzjfI+5I+v+enEpbJgOcvabqAqqkX5mfmRwlt5teGmn5iO+LCx1TmSS7gtSMS7nPgHLZNQ2JI2nyhl3XGzUP/EV+DB2GnzYx3gNKyfbnWgpV0wO6YnvVsQBd7L5BT+QKLX79RYP2kNYjsU0Kic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716993; c=relaxed/simple;
	bh=O7x0B7PsXPJevh+BL6rfGJApjiXJdDSLqfDhsZCX96o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DUSkneZkc8LlB0kiSgqWM1avzfNSgCjlwRIMct6oTjdPHEpR7k/EiBh+FtOHO25LFHpYO0v6sCDcuf0Rk0q7rJAoiXIXV1DPaWWPpKgp3CMilrsEScOolMTv2j4XGYfqij6i5+0LjTxhb9ag2+DLafpFX7JoQfoqgHxrM0xIAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjobSVab; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C885fM026007
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 08:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4/kKfIR6xBOxkE9lm0H0LtbeIPTX/AL/TrO
	0VUBg0Bk=; b=JjobSVabtX4EGJwcKNn5miyV2FrBDJ1rgXzHxzM1yAVc85MHn1I
	hN+FXVNJ52Hvw8sKt8kfWR7fauElBp9gKez7pAlikmc4S3vbxbv/E315hC6qg8Sj
	2dJlJqVcWecWkSYyS/O5tNyUp9jznL47S3cg3VAep7rpGlN2+SN8aTc9CflxVxcN
	YasbW7pl7S0VWAjhwviAa9TTn8J05SdmklMA4eZB+gI4UfKlHJ4lZDkFO07v92Ck
	v03/mKXgjAVFLhJxFfiHLvXZEVZanfJI0JV2ZaoRsZxsT3ipU/NNpnkxq+U4lGY+
	/ODvR/72wyI4xdfs9P5kNJR1AaWRysyKm4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2yam77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 08:29:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d2107d6b30so105364085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 01:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749716989; x=1750321789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/kKfIR6xBOxkE9lm0H0LtbeIPTX/AL/TrO0VUBg0Bk=;
        b=qoyFsaScP4lnvzmOQeQRLq1AUHDDIqNEnCxBVd3U+QLv7GyQd5gKpi2r1dqFuwfQjl
         ZQEkULfhWQEL5OeSMfZ0T8f5sYxhZZG+0AdsjSc5fgbsgGwnmCCsIAJy1u06uYpVjLy7
         vhyQZ10JQy10Z3kl6V49kDqzTqYLQa2ObABMSL/+ajfEJvktMoyGCzDqC4dTYOPxwqLS
         e5yl+UeUjd/KNfDfZ1BSIpNYi2BENjd9gd55g3KbsK5SbHNkk4g0/3RoG6sl9l8AjRLp
         G1Ga6HXVq+zjYpK5V9ABdRjdHRsm4Jp4QJuTGLWvCL2stHQzrAjIzs9avdiiCDKST65Z
         kpuw==
X-Forwarded-Encrypted: i=1; AJvYcCXv0R8E34I+DC+qPuTxehabAqv0Iw6VH4zV7a4k8yy8AXQ6Nev3mIrYcQ0MbZsICRB7Ew5HbWq7mIFaM+hM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6MAheBPix7YbMBReKMQ4ZWaTNIJYmZFCqjQT+wyYZEns/VHaK
	NrXeBtkwY+IeFCfqTjaXpdQWoAZwBdCyRV3nWR+UE2wVZdFKwNNDJNinDonMfyF1h9QP0F7JceQ
	GBbtcvCm8xv6+PKF/Y54BY0yDKR8qVpfhtfu1CY5Ya7881fE3q8FMEVYbRVWGehre4CsI
X-Gm-Gg: ASbGncu8f6XJmfO44WH1WPHvNe9Iece0f7cwVC8gz1/vFrhRgwy4fLlfnPqkcVfJEjy
	JraufxHN6v1UYIxC1wskg1VU4BSvPsIToWqsn9mS1kzxCmGOQ+IooYN6zmhnusa7mbsBnM480xY
	1iC/1iKjA9npZSg6i7+Hms1h/czXrKnNRZAIADvqcrvnAzUORMoJCZ1kvjXHpRWGMdYsk/3zTwm
	qHs0x+NSJbAl5a5BNjmVNJIaYT2yb46jIb/WeZlijEesruHV5sJs6yo9ZAQFBUO/UaoyP11AnUF
	kjIXIqYpPZNCL+kYtIzwTzATZcQOat0upf4FDubzBuh21cvAjjTWrDuDAnS3pXh7HBpza99WUAO
	9
X-Received: by 2002:a05:620a:254f:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7d3a8833b2fmr961434685a.21.1749716989510;
        Thu, 12 Jun 2025 01:29:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0YIQPL7yWdIZPDe+4/PhpHgaQ3NUQnaAcVDSL7xrmvOjCe78h8IeCoSoHcBLcGRhjCtwMgg==
X-Received: by 2002:a05:620a:254f:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7d3a8833b2fmr961431785a.21.1749716989132;
        Thu, 12 Jun 2025 01:29:49 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b4b5afsm1263883f8f.75.2025.06.12.01.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:29:48 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
Date: Thu, 12 Jun 2025 10:29:43 +0200
Message-Id: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA2NSBTYWx0ZWRfXwC+XzKIX9F/+
 bS3JVN2iDVtq8d0yCXM1EBJyYFFGIJyVZi0f6uKCAMGwhYJOV+vX0MDazESeDAayUz2H8WnWSQL
 Bw1KUaHLiKiqU9NZcOgm/0bOomFHnBxWKroIuVppteIe9Sahsqw/DsF3Jyc9ff0btExdEP33883
 XPMt04sm5dEc+gxD7+T5h2XXs03qh4Ckx5SPMsgI5yAKUOWZuK7As2X/MmIbt1dKcYH9SSY49Ha
 E4wUSttcLFJEjyW5E0o4v1gn71spwvj4792o12BJYNBNVjuIlCOvi9Uak/RpOAB/NsY2soaAYNM
 wSwOfEsvIPYMJ+ey0Z94NTSNn3140jeQNQf2hbXLCxKCx6k4ebmAlfDlVDJHxI9hALCncgQFaDR
 T/GHVEvx/pUcEAUuV9bUpryClFyV9fprYY7xnMBsMb0t6YZoHe1qMfCIHxuVSsyhn5lszp6P
X-Proofpoint-GUID: qivGEB08SFHxZ89wiwSElgKWBM7gjD8h
X-Proofpoint-ORIG-GUID: qivGEB08SFHxZ89wiwSElgKWBM7gjD8h
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=684a8ffe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=dqxo6Gcs7TcCqA_HyOEA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_06,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=714 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120065

Ensure the IRQ is released before dismantling the ISR handler and
clearing related pointers.

This prevents any possibility of the interrupt triggering after the
handler context has been invalidated.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index b5f2ea879950..d9d62d965bcf 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
+	devm_free_irq(core->dev, core->irq, core);
 	core->ops = NULL;
 }
 
-- 
2.34.1


