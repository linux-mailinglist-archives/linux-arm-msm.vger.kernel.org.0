Return-Path: <linux-arm-msm+bounces-73206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2F9B54175
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 06:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D76A567293
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 04:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F012750F2;
	Fri, 12 Sep 2025 04:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TqMrXJvD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4FD26B769
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757650075; cv=none; b=k05eULE3yGo1aYsXZK4jLon0L4xnyx+rB+Xc4ROmqhqAbXu72TJir2IIgCcr95i5LNenQgJON0ojwGV7KeACQbpzPp+0T949xi+me+V+Uz5J50rKsW9daKh34XxMoA3PqdWcZhB5AnXZt9dqEb3Bh3D38+6ohhxAdQeqT21bewI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757650075; c=relaxed/simple;
	bh=PlNtUBn1m92e6j1roGLFXzYvk2/0ghYLEgBgH8NcnDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXFXCRFze7jZeSRwF5fnrAyct3XuIIjVwqXdwp9X6qYQwN1ib7yB56/v/Sgnb0Xa6TJmIObDRnDzPCK2461POd9xni35/qEOvuHaT5CIQmPMXEVos5kSVdP0VSlgZWIsC7+qgI3lrK4PArGiTem2fEKcaDB4K+b4kukWJS6Hq0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TqMrXJvD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BJ8J1t009306
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cy7zuNmWldsjxlDI+hNSLQe922ofh0kNWkW6uU0Hx8=; b=TqMrXJvDnndTHE8V
	cdwpRbB7NMB0Uza1PdVqtA1sHoldiQ07zAcyYHo3s7661dkj8pj1MPfX+eDE79oj
	tsvYh/G0xeJJnhUxmHuCLO4hzWvP8BgITilhMfSL5Q/23TfwqWXKjZngNcSnYsCH
	azw2ZMTjSeDkWvbef0COzDWFwVFYpBTPumj5KpxRetgAGkBGsu+Fsgh1pNp6BwLZ
	yo8jLYDSOMR5VSMPnQnKDWhhd64PgQIdlduHN6P1KyBgdR9jv7XBH012MgKg/X+w
	90f6jtIBkn+JwuF/KEs8/JbZ/NefXQvm1XNbs2I4wCPYfM6akRUAZW1TRIZJ4zZw
	szBOpA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapte2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458274406so26324955ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 21:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757650071; x=1758254871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cy7zuNmWldsjxlDI+hNSLQe922ofh0kNWkW6uU0Hx8=;
        b=dBZigrHX/HediiONGoMqn0rxutUaLjHUCwK+npjR6hR2Kb/RNCJ8fSxN8irT7t5P9/
         3D8da7h8Z84n7uiMbHdhNWIbAJAlJRBp/GVv5mZ/yLCjnXHdX0EtDnfNcW1g2+Qik7p/
         nTWypWOfMsF8NgQ0Y7yliWB+zi3Xhx1/VoLIBe7siHBTFsvENXUXJcUR43AtzKmlUaml
         gV9pSLISKWYfKxh1zppbha3XjDe8S0U5u5cgIn4gOCOtL1q3VCOba0SSGYAEbgpNqi6w
         j7mmgta7PVN60F5aTvA3SvtnjwDQ1wlRHaIZM5v+J+b+vf8NLlzyb3SXJMn/JH0aglQn
         mn0w==
X-Forwarded-Encrypted: i=1; AJvYcCXg2TsoetJTkRAnV7mSbw7XpXiiQR33UIGAlASRf4gUYEGVfnpvRtsBe6gA1/a6q7IibO7LywAub5kNCfeE@vger.kernel.org
X-Gm-Message-State: AOJu0YzqkMwzosRauXHe5j4XvgJlu970dgH1tkcMG0IyHMJWOKwLlUjh
	Hy9CM+WeW+MssrZR0vuKF6vBAGl9DwDTZM+0PSiAFK1TT3WfYo9n4jmSVyDdbOjbRJvm6OTDvZ5
	31sb2cVe9xs5nY/SEdhTOBAss+5Uf8IGirrSUvmkrcqJ8XExrY0rb9qEU5psvmsAlosQ=
X-Gm-Gg: ASbGncu+HAFG3eVZgEZV17j0MXynvqkHq3303Yec6rVR94FryMA8fYM8XuWCNiARMpT
	DRwRfj/IADuk/SIINzVSVAI5s88GSPXqvp8qX1YD4Jy1/kE29EDuLjWRrS6G9x2fIgxA5df3WKX
	osWpVfWrK8q/dDis4sNwno3HYzWn9y52J0DwnHvDNic2SDcHVfOx/HVjRpxlTNuY6i3SneNPlWQ
	l5eBE+5HSnQRAfuZnf+C/YW4Aqmm3tH6bNyiYsEMlqf+fMUH8g+NkuVRqNf+VxqNPPB1+pQiMUG
	z1uZLEzMhLb2TynuYhj82OUuvN/wRPDNZGjS3RE3fgAFZEhITMmUQ4ux+ehnEznNGdrp60riEtt
	CDicpvgyYmxsz6aKCB2k/6eM=
X-Received: by 2002:a17:903:2ecf:b0:24f:5447:2197 with SMTP id d9443c01a7336-25d2587d2c9mr17317595ad.14.1757650071301;
        Thu, 11 Sep 2025 21:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoqJc1O/uAlEAxgaKcABrHUnAHQ+NKSR7AY913bzR8AUunHyu+K06+VfdNdepa7qcmVz579A==
X-Received: by 2002:a17:903:2ecf:b0:24f:5447:2197 with SMTP id d9443c01a7336-25d2587d2c9mr17317345ad.14.1757650070858;
        Thu, 11 Sep 2025 21:07:50 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ad5e168fsm690960a12.13.2025.09.11.21.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 21:07:50 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 21:07:42 -0700
Subject: [PATCH v12 03/11] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-3-17f07a942b8d@oss.qualcomm.com>
References: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
In-Reply-To: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c39c98 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: fkPEIJk0ZuwI-gurNJhhQ63R92hYSc8O
X-Proofpoint-ORIG-GUID: fkPEIJk0ZuwI-gurNJhhQ63R92hYSc8O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX/XS7WGWBxrZk
 nhVHYwhp00w7VvxlrdWjwcQPoVEMVaS3TstETRVyrGskHNfRLJuu3hm7h53zl64ImLJ/3nGVVFR
 p+gN4j3QRsedbWgYtA4Sw1/AhGJUDz5exhLd6ryUGb/iNkVoup1jAG+B8itfWOrMcvkmnzRNh8T
 VXiXpY03ZMgbUG5tdZiyhIcgtBtjC06xRQujGwL3jfDvDVWQf/Z3GHmsqTX6MhMqdSpUyHgf1T+
 KAh4ejtDyXpRXmgcZMo0eOMT+hkkbTETuXUSg0yiIvn8oa5ateJlcBzsCanTNothTLZTglw43Ju
 vTE3vM+eEMuFjFRmX1hTm9lHKlbO2ZPusE8oW0y/DwX5F9CB/y4TBDd/2ThyIgKAKAk98sGoqeA
 cMo9zD9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 807317d7b3c5..9fa042d80622 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -926,7 +926,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1


