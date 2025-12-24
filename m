Return-Path: <linux-arm-msm+bounces-86484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3588DCDB7BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6534F300B8CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1B230FC03;
	Wed, 24 Dec 2025 06:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dEUfFOoB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7rQD75u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07432329379
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557674; cv=none; b=c/J/WyA3bffq4m3bD32z4OipMbqCAb0pV4SB6hCiunBaewqGREVLm1m1oFz7OzzTqCEtWr9Sn7AphtVcmXmOg+SRavhs6XrmX6nghnx1hN6Y3p66ZveiEYbrNkXBMTGOZ7G3/TDuWDHvL3k7p1xxyzSEESW1NR9MMGQZwX4NZ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557674; c=relaxed/simple;
	bh=qA+l1roSDvF8QnwYQFNCqTpQl+PJ4sUmEwy75Q26KmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t6ylJlxx0Zdq0igS6Bg/7BP3U58WjxbdSkc2QmWMaQG3EylX+lMTWuA7gFzAQ0zGz5rz+kGQNQS5vYkvBQRXuGv75QP97x+cM2zzqPevDIuWP8RHV2W7EXX7di1bMeI2gBiEtX1O+RFi8NzbFB/IRcGgQvdcTnE1AmzqRXTNtpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEUfFOoB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7rQD75u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3wKjb3796599
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ypIgmCzf00K7UtNXJUrQyHTLyHr8uHJIyxEN5WEnw/M=; b=dEUfFOoB+KcJZjoM
	44hcEEsxXnTxJvHXQC6QH4qLVdy2vQysk9p5askBekr0CfM9AlM26SPgvgG9frgt
	O3SN+FdDjRnpJOkGi4kTDTwViiKWEsH0Gq1exnW3uNZ7Vnj3e/Pn2K38PcIQ9JXk
	rcLvmunar534h6blRUpmR3iVdt5At4AGdqUwB3oQtIKdKP+KRMV9S3zFY3bhcTDD
	m2p5gafy4RpABDFSUhb5ZNYXU9kDd6hNcIcHrOYJWbNMyPXvqjfx5zIHQyZl0kg1
	vlpobqczLvuxD5oAAbDZ3Ge8IVfqAvZxWHDIbpHqWGIotuyfchVtKtkZPQOIbzf3
	VYzpyA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r68aan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:27:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso10667321b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557671; x=1767162471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypIgmCzf00K7UtNXJUrQyHTLyHr8uHJIyxEN5WEnw/M=;
        b=U7rQD75uWBDUmg0jLxFqYnheT3pWyfQ7FjmfjKOCD8s/3xc9CPXMVTLWDw7BDXFHiv
         nUyCqF5avBgwRn9Pb2jI4Vq88R2dBKJ7h5fYaQMW/FKQSRAAVUkeMpN79HxH4iUY433Y
         eLhlc1ea2wUohGadMvjNHQxaICUyZIlGNYW6Tn+hoSo8F7HxXPhmpB0uMyiDAfymAtdr
         LGmFwlpG6vxZSbINNAc8KlINiL233UW4FfyMZwrppXKoJr0ktgTS2ElMG9562k33ztR9
         IgeojyWMhw19J8Jy496B8gfXaB3y7TLXk4/AQh5tqgwkl4+VXeISAjDUCm26PFI4bhCk
         XNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557671; x=1767162471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ypIgmCzf00K7UtNXJUrQyHTLyHr8uHJIyxEN5WEnw/M=;
        b=S7gRyfjTBxToy7Sb0A7HyLL6yL9KGN8CfgqXGMDv7VPz53cCHYWoiNLP5aNnG8qSty
         PSYuo0HVVNrurksE/6ZWfCykyPU0JCJ5IDlyfDWynt56A6fhOmM/QldrmVj9k4jd6RLh
         IEfQUsPmkNKl3zzvOH8EjST/n/iivXk9X66AeHFwMuvnjTcK0LHti+BoT96UGRIo/AHg
         HZM9yRGLKoYMoDLluLC6Gns7It3Czqlt7dnI3jtg91rm/khvpvcUCA5imD/Aosyrceo+
         YyKVrGJ9uC8MZGXL0mza5PFoMHjGVF00FyRxsAn8k3PEwXIDREUGEgJ0xGBfezPpsx79
         BHOw==
X-Forwarded-Encrypted: i=1; AJvYcCWg1/mWiEJGvR+IKErZ5M/DxeCnt5/vz3CJqwbynCbRtQmYkmH0/t0PSM5WEC0Sit1xRDUwPjcQR3ToRSKg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3C5GhZLfCP9Omsg1olEzsecXH7J0YjOScxfSvffw1wxx9Tvww
	31gH0UHRZgc6BGTLgROFDKkkMG5hvGistBa2z1GyhWWze4/g1dU4KfVwJNHqf9UVp2CGBdt8EbT
	/BnQTgDcgVeEQbmp3I9r5Q3514jTQdNATqg0oPPg5uPmsJXE0z1YY4d+VY1GgV7aFPQHG
X-Gm-Gg: AY/fxX6qGYiFd9aHo/aYFP9QwshNpfwsLuHsY2MFRooN33Pv8piTJj+9M+BaKNZB2TF
	6e0pEAA1HXVFzO9/5h+n+NHwjw3pTorgd7/KgoRW+RXisDomoGcFR3qRRUBOIoMrnixQ3lld+9y
	N3mkc/a2l1/QCQ3fWljk9/x7+edMovESJ/WG8l+qOekZZl856wUYzZwAr0iINJ/lS5OCVsv8N49
	LoVtjU/owK3rrcLaTKXv863AZx0YZQ0IZKfZeMB6Eo3D1BgU+Z0ji6vdLFdLfrhmnCAAVUaVYOT
	TQ5VO9pWvYONpu4iSt0PsgMh9gNv2qoSnAji0esS5KF+stN2S9uyzw75pwus4c2lVLypQXRB1lG
	XJrL5vYSTiaUDqYlDhKwB8e3OkWNhRhVwiQYIG2dVhsyzwUI=
X-Received: by 2002:a05:6a00:35c9:b0:7f1:7b2a:ab5b with SMTP id d2e1a72fcca58-7ff648eba2emr15297568b3a.27.1766557671003;
        Tue, 23 Dec 2025 22:27:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERd9gZJsgRboJknguvEDyJwJ92XfoPc1+sklI7e3Z/QkLW8qtfQi/FUXm40kxWvF7338gOOg==
X-Received: by 2002:a05:6a00:35c9:b0:7f1:7b2a:ab5b with SMTP id d2e1a72fcca58-7ff648eba2emr15297548b3a.27.1766557670454;
        Tue, 23 Dec 2025 22:27:50 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7eb85f15sm15618908b3a.68.2025.12.23.22.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:27:50 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:57:10 +0530
Subject: [PATCH 1/6] media: iris: Add buffer to list only after successful
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-iris-fixes-v1-1-5f79861700ec@oss.qualcomm.com>
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
In-Reply-To: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766557663; l=1596;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=qA+l1roSDvF8QnwYQFNCqTpQl+PJ4sUmEwy75Q26KmQ=;
 b=uq8U5GZqyt0tNm83lHFOvYWN3rYnmiCpbhUrkEKgEagj6qkunVPKRbZtcObT8uFQRcVVDDdSg
 U70XKdUvrm2DQaDUjGFR+asUaXlMMO4/2WFj8sx8PQNSIRWCgtdiQez
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: fU1S-fiRHtCcc0q_r6fskSK1AKdxuHCT
X-Proofpoint-ORIG-GUID: fU1S-fiRHtCcc0q_r6fskSK1AKdxuHCT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX0+eA+TvOvOFH
 5Sqer4MGJQSHp/QrhSIL5T0TpI6afLcsc1gEGvQ5yZf1G+C/n1kUbU27TLV6r8aLQ3HFK5ndvTp
 w1hU+5uW2usRwRRNbxi2crmseLsuusTllIuIKq68AaOj0pWpGbyO52dWh4abiN40MWgHMOgBjz3
 SgxBS5pBgzFOcoqT/GPuXHVAfnTgR0bxct05oiQCzdfu+bhAWnQQMn/t2XvSRMrda81VaTLn1ba
 tc0ggM+TMZVvxeDTTmbhWSwbG5+RY3C0WTy9ZyFSwFnhMuAYlRruzfS2ZIu4+kF371BMJ/KrsbA
 EgXR/sCvWEyP/0CQDz2JjWzc1mUOQoEb66d2NFsAwsyPVzGiMEcI654pH3Ygcwt5N0SlIXhQqZ7
 xMhanusnY5rLOIYxiK+pULF7MSOCBDdPuE8+Q+TIVtBGj3VJRZUR8Lo2TQC8mUMXvaPKMo4aPyh
 gdGL+jgReWCkaUwO3Uw==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694b87e7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=H7qzw8hXFCepVgrFcaUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240053

Move `list_add_tail()` to after `dma_alloc_attrs()` succeeds when creating
internal buffers. Previously, the buffer was enqueued in `buffers->list`
before the DMA allocation. If the allocation failed, the function returned
`-ENOMEM` while leaving a partially initialized buffer in the list, which
could lead to inconsistent state and potential leaks.

By adding the buffer to the list only after `dma_alloc_attrs()` succeeds,
we ensure the list contains only valid, fully initialized buffers.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index b89b1ee06cce151e7c04a80956380d154643c116..f1f003a787bf22db6f048c9e682ba8ed2f39bc21 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -351,12 +351,15 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 	buffer->index = index;
 	buffer->buffer_size = buffers->size;
 	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
-	list_add_tail(&buffer->list, &buffers->list);
 
 	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
 					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
-	if (!buffer->kvaddr)
+	if (!buffer->kvaddr) {
+		kfree(buffer);
 		return -ENOMEM;
+	}
+
+	list_add_tail(&buffer->list, &buffers->list);
 
 	return 0;
 }

-- 
2.34.1


