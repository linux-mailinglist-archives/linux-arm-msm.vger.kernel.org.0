Return-Path: <linux-arm-msm+bounces-86590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBADCDCBF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 16:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB3963002D70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 15:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F2330CDA0;
	Wed, 24 Dec 2025 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqUyzvCO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnN4qlzJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBF630C62F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766590964; cv=none; b=phfe1ZD9aVIse93m8+KRO02FlO9IPmsvsVxEZTpsXclKKYOWfqUZK7jIKGo8CFsWiT0PfhZJR8y+JXhxQcnklY4fwRVbqa33/iNEe8X6tqxTOzGuRncq1X7Yn4RC7GC8ipEpBp+CL/iZFOtUbdUIkVI0vQE78JIxRj75N4d6luU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766590964; c=relaxed/simple;
	bh=/MJ75vhsI5cjj4o92iPu5gq8x/vgx9is2mnNAWB6edk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQmYvYt7jYROqfDLB88pfMCwKmwyDZMbRMy37dtXENVphgmd2DW6HwVrHMT4UJWdqxLMXvuVBuy+p26LzCd9jN7nL0drS+OLiBJecOmDOdebCV0RjokaYxDK+X53UVCl2WH4wcvYtMIkQoV275K9Z+GtFCGGexmSChOZc4JQ94A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqUyzvCO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnN4qlzJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOEbbM54134145
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFK9tlrLTrmmRkGyHiwM9PyuZyr2PqwfUf6G0d53PDI=; b=WqUyzvCOmyOTyVbS
	z3mMnMNLOuDYRfMYZ7nZ9pdFd4a1vjL2LD7723h0zci3LkOtyMgV9IB7F9vUTb3G
	akXo+scN5oW1WcXZ0vh5KucNQ349zI1FZdjmL3TkOIET9RNvDAPM3hUgomv7XXTl
	NGtLkq72v0AtvOm7I/vq812JYsEOfldGVHL8u2HhTaxwkPro4mk2lv2gCzqpvEz7
	lF93TPoIlfM1zl8CQbmiuLXtGvjJmmY/n0+TukzWrXPgAtVNhgheeEBm0dHP9reH
	QHQfMg/r3lv+kkFuwm1awKeitM+HrjheN3ivJ7ibB3ZXu9xlZB5YNIK9Kng425tN
	7ZglRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46uen6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:42:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edad69b4e8so127002811cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 07:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766590956; x=1767195756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFK9tlrLTrmmRkGyHiwM9PyuZyr2PqwfUf6G0d53PDI=;
        b=AnN4qlzJ7YMFhvk8sGrul64SJGdnQGH5FjDVjKY6u45PWiDeq0lLGLX5KKmvt/Q9i+
         9UKkrRQBArPOpA3JZOXiu66+TZ7SMN1mOErYz7bkRqS0o7zS8AxaSxZNFsfkruUPGnCV
         GKmugBf+Wjzr3k+L4eb3mMG2iMs2LoPSyHAkkzYB2urKn4iJbYprfzl9P52kre6qsC3n
         8roBNh/ucW/6nt/Pjk7GdoFxJOeDu7eXl+MqD2Q5kgL/Vitn9OuAtcllN4yQ2cRTZjRp
         Wh7hw2S2BjGwsSk6cz8kqDWyhMq8jIVFs/CaSvruVrAle1/Ww5BwqabvCzOr0aB4KQBP
         7K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766590956; x=1767195756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WFK9tlrLTrmmRkGyHiwM9PyuZyr2PqwfUf6G0d53PDI=;
        b=Adn+4LBmCfzlywBWzT22d/ioLj+XirHfcSHBKxOj9ja3kHX29jhTLCKdNAVawTWwin
         6blqIHSXdxS5j9l43HUTefF+J5zECGjtRJwm+5HwR+k4quZNJrrNwz4aWmrPvPBNfPiw
         XKgu7mqBNf7fQHDyt2v9cDPkYlZfTdHyt2IuonJ60iT/fV0oj3pEhEp+GXFhAsIIQacJ
         O8TdQ0j4BemNGRnktuRJm/EVEfPxWMg8LUqYZ9lkY69ukZS4qCFtU2ahbMyUjmCvGj0t
         1D8ke0P0KBezfwDbmnfPevZYCDrmKN/EL1zrGfsiHv/EMHtPycnRJUhHgcpsfKyyb600
         YwwQ==
X-Gm-Message-State: AOJu0Yzx6uSoj87z2Kir4lUYm6Zw/Aq8hrMOSZsM5tejysR/+WLGIwCP
	pFd9RzrUtj5ebgLiiTzwvdkz/sskLv3DEfxQNjvK9RZs8JD8FFJfxJ5GgHGDGF87NQnVHrAt0uz
	4Q0qXWG8OATYkz2u7TdqxYAE3DKJzbqn1qNKZjghrzW8oWIFINt6lzCYk63lLEABZ77UE
X-Gm-Gg: AY/fxX5bTEs23yw0G+lmBqE0qnkVx7Vfi3sQ4O+Og4EYBonV6CLk3FFZlK9L6G/USKK
	GuRtJUEhaKE+YGBNEf0Dmo/OSyKSgeKsI2MzTyG7uHSrcvXUAOt+vicSESfiUSfTAxkAbt58Y/s
	kMBSny9brr8OYd8r67Zar4Ly3qpwaceR78PQ+Nzurd73vdVEEXlZ16PDKEqZQCCNYoITG4KexdP
	RFSdCcZLCx/56IaczyfTbPOR6FWp6oczW3L2iGd0XsHDKpTfkO4iwApn3fynlHk+EeUfY2vmDBK
	6UZurz4aFY9Avkbicc2VAYqrp5CgxhHvLa29+A1ImtbducWie+x50vIc5g62kqg+JMKQ3H8Vymu
	xCq4BFcM4Vs9zqUltYppIhYuHIDH8TbFCIxmt7kyt2nJD4hueDrnFfghOyw28QWjWXlz7TM+tnv
	JCOafCCIKzMKVK5fefoCKtEUg=
X-Received: by 2002:a05:622a:30d:b0:4eb:a2ec:6e3e with SMTP id d75a77b69052e-4f35f455b63mr296327771cf.28.1766590955516;
        Wed, 24 Dec 2025 07:42:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmmwuYonY8fQpi68f95jCRpUXmpjaX2sHqB/7H6bAV9sQQd21Yjoeg4KD5j0vLzPzYWCgzUg==
X-Received: by 2002:a05:622a:30d:b0:4eb:a2ec:6e3e with SMTP id d75a77b69052e-4f35f455b63mr296327421cf.28.1766590955097;
        Wed, 24 Dec 2025 07:42:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f2e6sm5071562e87.69.2025.12.24.07.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:42:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:42:31 +0200
Subject: [PATCH v3 2/3] drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mdp5-drop-dpu3-v3-2-fd7bb8546c30@oss.qualcomm.com>
References: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
In-Reply-To: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/MJ75vhsI5cjj4o92iPu5gq8x/vgx9is2mnNAWB6edk=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGlMCeehXSUbi4oIEysRtaTYV82kp6fPSKz0qxAudd3ZbyiHs
 IkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpTAnnAAoJEIs8ij4CKSjVpYUIAINc
 jhZ0GS07jX+JaZ6RIjwLf4EnHghhkF8Ljv25l2LrEhuGSLdFXOZJA5AizKoC6B5zSZITozzTGXF
 swym0Mwgf9NJGZn1cQniwIIocKxjfa4fwdPa4I3+1Si3afkSX20b/C8BSSOGXYVIM0tLGPJpJjg
 UIUVBnHgvOZpWYzJn84o6pmBJEh2TI4jui7i4GnyUAQadF6NPOZazfaPcw01PK9VmHofFFI1KQF
 6ROzVGBiz88+cQSZgRHZZfCJYyxpSyBz07i7pnziU6lMZoI6AttT6Ah1MyyHyaZEPbocKIHJTy8
 XsDFIEKuZSeqqeT06SrV+7vlyj493Xf+KrLRxFg=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: KIV296FLQbn0jArntdh903c-JDszv6Yg
X-Proofpoint-GUID: KIV296FLQbn0jArntdh903c-JDszv6Yg
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694c09ec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=3DtPeeBlMjcqd2FmxTYA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzOCBTYWx0ZWRfX4k1+LPNAHThk
 GKkvq2v7rzn2Ss8yUrlhSc0Sib7Xn01JQxx7XJk0WUvu6Zs1Ixl1zZ5MTX5ulqvWkryaHzg5N5a
 c//N3M6qeyPkZRszj3NNkdsAp5H2/Kmd4A6rYgNNY9IwXZiDKdVeP01inMqXCORegcMxtLEE7U4
 iE0ph7QTCuUAHhJ21worc7jTttPOmOdKF83flUX89AbY+lsJ63iTqjy/oqelIq1Q/xx2W5BaXyc
 8OmF49ysJmm6poeybGV6k+REOBaRkAwHB56AYb9rqQDeNd1cSpT4ibvlM8Zh5FjTGekubVmELKO
 TuSq+7Os2nElFvFY14xJbvEYoG3LPXYQtl80vFN1lmihIGAKEooyOeWktGE8pLHQiYNv/01FZ3V
 IkJXgM33SAItc5slKLf5i2Tsaa+923eYiO6HW3XMZ3TygaKhgCi1TxnA9ZHTgcWChODX1iC6/iN
 dVzXwqCK8K1kU3ZQSZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240138

DPU units before 4.x don't have a separate CTL_START IRQ to mark the
begin of the data transfer. In such a case, wait for the frame transfer
to complete rather than trying to wait for the CTL_START interrupt (and
obviously hitting the timeout).

Fixes: 050770cbbd26 ("drm/msm/dpu: Fix timeout issues on command mode panels")
Reported-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Closes: https://lore.kernel.org/r/8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 0ec6d67c7c70..4faed35f146b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -681,7 +681,8 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
 
-	if (phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
+	if (!phys_enc->irq[INTR_IDX_CTL_START] ||
+	    phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
 		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
 
 	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);

-- 
2.47.3


