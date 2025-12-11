Return-Path: <linux-arm-msm+bounces-84997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C044ACB50E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FB603020C6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 08:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A1F2165EA;
	Thu, 11 Dec 2025 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ha2NaYCb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQfGFlI6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A612D837E
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440480; cv=none; b=A+yyi212+CXM2nloEgOWFRMPZam8lm5Mv5tFXSv84Ws6mD9Mm8LXkYAG2hoCQMBxG/Iy9UvxKT/L0kpRCM/U3dvOmEmwGz255Jadcm6+y66lMuFQxZjokKyNh/JltOAEiMTXlCMTgnc+ptzDNyjYoGrKoDwbGy/+dyYMkJlITz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440480; c=relaxed/simple;
	bh=YwRYwlT/5tfVm4v4+QRSkVb8bWyUn40Z8NTxXHlxQqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqidf7flB2eE5nWoK8YQ326cC5mY3XNGjyAbzDB7TZGvjR43/tUxce5tBPhb2eXzZaF8flMFgTix8UH5S49lJsS+iI9ABKlj0s5ID3hxUnVAVy79gg+x6/2xY2qLSmpiBu9Ymj9WsOYHp+H5tqaBAFZuv/+6HpWWPSbfTuBy01E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ha2NaYCb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQfGFlI6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALT2Fn3564403
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rVdEM4N9xR3Hr3V6+sHkWVsTPd5reFJrxYZtqqalbos=; b=Ha2NaYCbL2/nS4Ux
	+G/j5mRPqFeVVK76nzztteRTh5yUkWJaZIBS3axSoFF7Po1KdVxGOgYbvLR7jUCl
	KxLkDJBAqiuAQH4Zq6OVhIIAGCBy7jCROHnU0tdyC4YWRGTmX8bgn4oFtpREWsoF
	iMpmQVC9goywilc+KYpgX7909nsQgjvDeMn8VJXVMfneXW8bv+vpD+BLyCcYck8G
	G+qKujQkfDrRBfowbSHnLjjtxIkvHBodEoMMjGJV1evCGQBJYlBA3D13zAjw3LMZ
	A0Yrd1jvFY8yMEHn8Vfk6yetjFrZjU+WrA2AsYLNivTPWG4yf/ftbYv04bZ0jZgw
	s5kSeg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygtfhgrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:07:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7f21951c317so668869b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 00:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440477; x=1766045277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVdEM4N9xR3Hr3V6+sHkWVsTPd5reFJrxYZtqqalbos=;
        b=YQfGFlI6KV642TFKe497kSFQMegoC003WMZyTmJjQQrOjThbnnAY9dggawYjKrx9Au
         EjK/7DarZeT1G4/vVNWe6YfTNQ8/qeMmHF//oPuJVVBe3wCD40WFaMLsBrFSVThZSX9S
         +lysh6803qhWduVwLGompjiEQC8stjRzYktpQT6neczOU5v6Oamnd3VAr8IGbAi+hXld
         zX1A0hcE3gn8yq8OlzRqCOVQQ6Qo4JlpimmOQ+S3OPQFVf9wKEMlNGVM8X7+7/kq565H
         WPRfRvUx31QvVqwuBjNsKyr6Bmj4wsSyR2CLC2BN73I++s7zhP5amlZy8Q2vXi4OQIW2
         pTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440477; x=1766045277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rVdEM4N9xR3Hr3V6+sHkWVsTPd5reFJrxYZtqqalbos=;
        b=Mwewq1KyzWZDpx48+qaRsmhBhpUYJ7P+Y4Rul9bJmElaVZS1tpcv+b2qOfyQdSdk16
         nVx1ElzepPcTemsgGGk/jgwc89hp5cinELrz4rfI41k8fXDL7yRteTgOO/h9TUsovLvh
         nvdPgzuSY6dbGm1mJHcxATKYTxEdG/JeSjSKxxuifDP1HB7ICRMcX4aBkBkEdACm2z7Z
         +t6tmA7UnfXBlY7m0WmSNQtpIQe9kP326yu3PSZI4/e6DBd7+SwvHajqT0pP6g7h4PRF
         Gd2V+YXzahikfAs3dmHuh+lqWf8Weuir1TW2CigC/hlLudtbypkx+U52CQka6TOGALM3
         d+cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUigm4JfGgmRSPXZlL1aPCTqtLWYQMQxq3xemKBHvOiRz3JC8lfAH8AhpRRSF//bf1gDtkYYJuFmByABy1h@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg2ZGC6DNOOGqH1ZH7In6AuQOebBBolOC+583fepHMrZwBgvj7
	redgVLgUEI6OU9e9oeO5KNcJddc8/MQkAi1p4UkZTiCCUB4PpICmU0biq098l4GfVvZf8YwQ/Ct
	hBeDceJRUQKsY9A/7GJS55iL8dHmnwMFu49JHyP/mx2BjSPfAdX6q92UkP7cyNr2T1GIo
X-Gm-Gg: AY/fxX6lXKASDuyeM2R+hZtlsK9VkUjcjTYmXPhusd3rqRkcDuGkx+KUMSufjntMG2e
	YqgKIywrGaZinFW5Zux44CgFPpYuuS2o0+OOij3tYSv60K6Hj/8N99v9sVMpAhGoOe5+UYfu93F
	26Q8XmBIALsgQieRyxKKjo/TnAFxKsWyo2R/eFXQqbwctl5CGJEhpZUZV9aAfQdXYnyIz2989j/
	8eC3l74A6qpQjZ1mb21yI5gkPoUUoldsy0i2j3MXOewfRRcDM6YFUWccfc2Fyc93BGlLgMEG3HN
	5kd/tMKl2OhpDlER6oTX0QDIvQ5+vwC6PAJgWHmkwYkOhKfjKgavc8shaiIOnZKrWBl1XRctG2f
	z7R/tPyoGeYQ7AE37ameKw38Qm6KWXO6LBA==
X-Received: by 2002:a05:6a00:198c:b0:7ab:88:e397 with SMTP id d2e1a72fcca58-7f22d20a2a1mr5351881b3a.24.1765440476751;
        Thu, 11 Dec 2025 00:07:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYJ+9iyQn9SlqYsFPXt6cpvvx5kDRMcqf2QjkFSt1T5jR+a+kHMx0928Hl2duDOfH9ol1+dA==
X-Received: by 2002:a05:6a00:198c:b0:7ab:88:e397 with SMTP id d2e1a72fcca58-7f22d20a2a1mr5351855b3a.24.1765440476279;
        Thu, 11 Dec 2025 00:07:56 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:07:55 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:36 +0530
Subject: [PATCH 04/11] Revert "bus: mhi: host: Remove mhi_poll() API"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-4-d2895c4ec73a@oss.qualcomm.com>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Authority-Analysis: v=2.4 cv=At7jHe9P c=1 sm=1 tr=0 ts=693a7bdd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oQAhVp1KcIWGeVV0ezEA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: qDpgCgO6V8WHx9EUHBPHWgIjVLFg7ew6
X-Proofpoint-GUID: qDpgCgO6V8WHx9EUHBPHWgIjVLFg7ew6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfXxmtjOg6shPuX
 xfMwf4WpOs56Dii1HfxtBNUKGZTC2NZ/SM3+XFubd3NkK0kqKNw1cYaH/cek7Hj7ARum0nMGrMC
 EzW3Jm5WBiGdF1h3k+MBSFwqlsacGY7G3UAzMrcaMNIwf7aHZ1I/NQ9IuT6Y/FwZ+PI3b3PlTmp
 42otF0zFAURMQn8fSrN/e5dijAiTQjijynfEyptgL34SmeXBejD5PogRwrfmB/f3PQUvI18iPap
 wMK25vK3H1nQ1B8+M++fXEy88FD2bFCUziU8UINpRV0aZWcV7LbdYKuUO4twPnXI43W1dmoY66w
 yPLCq0D6dxP5+lXjMOhZWbVrECwNdM3yU3zJvqQRUDU2UQKID27yyEFC+hCMIlrmWgn3EVRZ9Z8
 itBhu+tL3NmbkNiZMtA6ZX9cAhP5gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Revert commit 5da094ac80cd ("bus: mhi: host: Remove mhi_poll() API")

Add mhi_poll() API. New hardware channel clients use mhi_poll() to manage
their own completion events instead of relying on the MHI core driver for
notifications.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 7beb848ca5c1..5d50f6ebf6f9 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1858,3 +1858,18 @@ int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mhi_get_channel_doorbell_offset);
+
+int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_chan *mhi_chan = mhi_dev->dl_chan;
+	struct mhi_event *mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
+	int ret;
+
+	spin_lock_bh(&mhi_event->lock);
+	ret = mhi_event->process_event(mhi_cntrl, mhi_event, budget);
+	spin_unlock_bh(&mhi_event->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_poll);

-- 
2.34.1


