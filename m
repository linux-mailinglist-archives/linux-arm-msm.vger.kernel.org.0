Return-Path: <linux-arm-msm+bounces-86787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3061ECE6058
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 608D8300F630
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0DD2D23BC;
	Mon, 29 Dec 2025 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mvz4dUr4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTnEUKRX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04082C3277
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989906; cv=none; b=awJHb43sR0xmcr3ha7rzQJGXCc+6VRa/wtNqVUn1yfT6F8wD1JWvGTKkMMtId8ZVSbnDpkJZ10ZXxDB6bEvNESPF8ewD7fmc8jwqDoOWMc+aqm5rrfyi2Tq6RhKy9oHbOMXJETRX2O/k7PaQncRqde8X7eWHsuh/LVuS5YAISyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989906; c=relaxed/simple;
	bh=NIZo+UdWxMsX7ox29/TZ4OoER1qNAvVTp1tlRL72/j0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uY/0CXvbZkFBRNf5CcRI5ah9wURaHwftBFvAEioDWeesMe3Gtvmnbj0RVjfIFKXM13z+f66nbV/ydKkkqmUlu8VaPHlMPPl0GhmORKUguHc+QsCSpLOAlLwJglJKoLLsc1Xtzr/SxKVRZ2sWfRxL3C4yYluCiEwfnUb5aCWAYVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mvz4dUr4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTnEUKRX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMGWHc3642171
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puyFVl7m3pv6DrUbueGqXDplOqSDhPlOzaE+s3URf88=; b=Mvz4dUr4HANaRmme
	WNVif7l0G2q0e4imL/tBSqN7XYcj27MdROpftwfCLJLhyW8sQCB/i3r/MKLNDw3F
	hBPj9e9dyyoiGH0aRdvGaywFI0jr5AgKYa8VEv9zL4usyKVi7z+F/Vuu3fcTcrSu
	ZFoKXY/1BZ6PoPo9A2VLjuHJW3VxaR0MQzCrLu8lSqLXYvoSsPoWIH/HV7UvYWIE
	zqzCatHD9VMAMEaVuX43ETcmnZJdHP9b+MQCwlLGOZQl1V5y3VgU2hPl9T2n5T6d
	9x+o4GLjbLX8AhSXp39JjoBXvau8YfIn3/xJBQyd8BG4XAZ1frqmBQybDsQMmstD
	oTmdaA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg3k89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7c1df71b076so17399581b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 22:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766989902; x=1767594702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puyFVl7m3pv6DrUbueGqXDplOqSDhPlOzaE+s3URf88=;
        b=jTnEUKRXa28A98xnoStzOkt2QX8T0X46jAN9zSTk/BRVVlJoFEiUqWwYBjbN7rzRei
         Q6ByY+xVRhn/svg6zvncaGSNek5QxC28Ps6YUsAH2WXND3zVXECVZA63PmOjsQ8odlU5
         P5KA0C8FZ4li2t5ceSqBWG0CKpQnlTBpHVNum//S8Ydav+vju/hUlmKG7IBvHtXVIRfD
         Ot1I8FJCD0cl2z4WnKwxeSLNOnlL8iXBQY9M51YRswGO2hUjWkYsN+/awNitzoRHJ+hU
         8ewMTcIubK6w3lB+dCuEJJLF7xJtNa8hocKc7C0xUeviy3lF5YmwQkfMHxJJVxSgsaav
         4nGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989902; x=1767594702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=puyFVl7m3pv6DrUbueGqXDplOqSDhPlOzaE+s3URf88=;
        b=xF8KkKxkyrw/QJcfJcFjujRdZIhmkVPrysCSmBio8iImbzztFaAzcnVcEF1GjCxrDf
         gqDGH+IZk3x8+02IZhUmxdRIHNU4EmtJJKlhDIQcrd3sU+pQ8nOYuVeLOBzsmrI01dYr
         2qMEDtvxNoagos12eVFqxesHpS5RhFa/pRFNEku9IUrqB2Dw4qrURFlQkkeofIween/P
         PVYS20W658W57DKl/Jg5BEuJ3T6ttioKcTj4J2NK7iJKuGrEPTc/+5FrBcRDoU7fJ1TN
         RAc83k4OVe6/dUXIWEvtMqnqBzjrT5znAT+B0MMlxKU7ahruJvvcdAQ9fr561uprmEbT
         KsqA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ85RGb0DSJVQMIv+YEecVrwYmyKRfGwnvtfhv54Exnf6fgiw5yqbuA1YnyMIu6nsLeypSIWJvrnWZ9IuO@vger.kernel.org
X-Gm-Message-State: AOJu0YywGlB1gspelkWV/kdathkJWGFq+vGM/7KBNP8s3DrcFCmQD2SR
	86uMROo1TtlvevbZmbpueoA31bfJlObGJSv8fn5XfmLAB7rmAFT4F2LT9pAxmBNFOOb2lYmi1DJ
	QwXNiGfZBboPtSpLQcltCioixNhIuUwmYLjX8cOxMHLFlSjEH/jRZzi083x2SW1mZRuZC
X-Gm-Gg: AY/fxX61XJUCdMe3XIyF1pCLxU1HP5I3MXM5y1Kkl82+5enRqakOvGMKcXM+y1drBfv
	3dAYktCguwXno6Ko3wi5h1V3hVhVI3vhveY9CrIrLsCQfiN4FOVv9BrVqT1tZHbadD9QlglKPSx
	qKktGjvilAlPdibRDFko65s4fIhMjaD7s408Lcz63TGZIhbjcy1U0PXcJuFJrTwxBS3aZA8M56p
	s+JYWK7KJ5eRKaFKPRvgYDeU451B/G6InXlvUeV5eB+xcR+icz4x9+1wzJs2Zlraz6tmu9f7lpl
	Q+ox5iDOeLNdI2KvMnBWnUBaNfY34JAggx9Z+qOYcZdPRIXPiJjiaCrqs2Wz+a+5kz4oYT9jETd
	OL65OzPjNsmv8dUmCRDOiQyTzGUNl564XTo9QHcCVI5dFAOg=
X-Received: by 2002:a05:6a00:4008:b0:7fd:ec0b:d862 with SMTP id d2e1a72fcca58-7ff66d60f18mr25851925b3a.70.1766989902226;
        Sun, 28 Dec 2025 22:31:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGZQ5cnkKUjD4tXmSK82kKPrjN6ad2VkmLap8XjncOPShkeGs1Z6h1MdvlxjE1Eoa8er9/xA==
X-Received: by 2002:a05:6a00:4008:b0:7fd:ec0b:d862 with SMTP id d2e1a72fcca58-7ff66d60f18mr25851911b3a.70.1766989901806;
        Sun, 28 Dec 2025 22:31:41 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm28308962b3a.59.2025.12.28.22.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:31:41 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:01:20 +0530
Subject: [PATCH v2 1/6] media: iris: Add buffer to list only after
 successful allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-iris-fixes-v2-1-6dce2063d782@oss.qualcomm.com>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766989894; l=1730;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=NIZo+UdWxMsX7ox29/TZ4OoER1qNAvVTp1tlRL72/j0=;
 b=DKk77KO9RQxdDUQpyxO1gZXFQ77O+KuvCAr8O6tGIiLwVqSriRxZbLQUB8s/+IJx3dh4kwZUC
 vDKPAF4JSywDDaufUWSNEPyIrFNLfai9CtnzZ+TPjVjvVEvDNhkcCxg
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: FIcKnPvxf6xHq15hM0PT0z_bMA6i_s_B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NyBTYWx0ZWRfX6OzO+lk3Ygrz
 R/qmU5Md/hZzGfWfMEFqkG1BPaKP+cwLA2QZEesE0L2xiPVaNdbHnp8QSvepXXjjxRMD4CjQ30i
 phyST680p1dfh8RaJ35nrqV6IYV4M5r2mz2TP1JDVH7mqPipIdgAyXU0pJVnGp643oTx1C2hmBm
 Gyx6tseFh/HT60ciLnKmWjWrZedYYekd5OnV3Lspj6AeCpWut7YOp4ZM9hnPL1OI2a3L6crg45w
 24hmg1fEFrtYM64A8trOC33qCRBqdnWiMtJhg/Kf9I1UJVdfYFzk5OcuPFDJo1dS+ZYSTTN633u
 378JgQ90M1f7dSN4kwv11zbaq2AO8KGx4JgnZYC51Y4YJ6gLHTHh4+tfezf5F+2S38n3INdShY9
 ZEZG3OXpaUczK1VGEmkexemFRBcFcApBKAhAeFnom+W1OpBtIRRujtGxiDjNboSX1H3L14dotcl
 EW5NgFb8vuRKyWDaDVA==
X-Proofpoint-ORIG-GUID: FIcKnPvxf6xHq15hM0PT0z_bMA6i_s_B
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=6952204f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=H7qzw8hXFCepVgrFcaUA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290057

Move `list_add_tail()` to after `dma_alloc_attrs()` succeeds when creating
internal buffers. Previously, the buffer was enqueued in `buffers->list`
before the DMA allocation. If the allocation failed, the function returned
`-ENOMEM` while leaving a partially initialized buffer in the list, which
could lead to inconsistent state and potential leaks.

By adding the buffer to the list only after `dma_alloc_attrs()` succeeds,
we ensure the list contains only valid, fully initialized buffers.

Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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


