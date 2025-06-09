Return-Path: <linux-arm-msm+bounces-60675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3316AD2589
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A3FD3A8BA8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 18:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CD621D3E2;
	Mon,  9 Jun 2025 18:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7hFueSs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D1D21B9CF
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 18:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749493488; cv=none; b=Ma4aG4ZeDnJMCQbvHP+0HXb2JQTve/fbbi+3IrwWIK0PUZg24gsVC4Zl6v/iv/n3Mo6+3kRqoTIOOaqzwscKJY2Lf6rZiG1wQjVt09LBSXmQ7LmTJx/3yC1H76VXKR87Gg7VG6ymdoZOjdjYgn/3LjmqkGMvQv8hYeudUgTqVU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749493488; c=relaxed/simple;
	bh=hqqVwI2DtCjfh9orO/cac6PjLKpP78bMvl+SrAmC4zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwAduFeXTsPDdxBM/DnUR/k/31OFI2QI3dNvQebjfvK+rOL3t9b/upH6R3VtHxNKKXDEOnOPQIQXCtnJYbeB0p3zbWqLLC8g2iW8cLGXyKWtL0WE/ldmjkyCMsyBRbfCl/ormlXBhXc6GJWfF+IV1XM3bObxxx4r6KpkZV5kCV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7hFueSs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599UUn8032491
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 18:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F2gwz9xWCvt
	M03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=; b=i7hFueSs0hspbXU3m8LSLRGfgQ0
	oCWVIaU/SC8Q6wuVbDWHMy0gWZRDhhhCCen+GqFlbdNB1mM3sJQfi32BAxXb1Rp3
	5VIEtZaZeAharmseIr4Ofyb35rbK5JOjBZ0pI83Cqmsa1MtB16pftHmfbKhTYIgU
	A2mZh7YGzblRncTclgfEJik6uRxl3DVxLWB0a8IysK5uQbBuLikw6YyltzvJkb5S
	Lj83IgWXqoaxCIWhut8wmtvwNIb123aQm08VvrgDgYTquXGUvSvxlDSceY5LIPXz
	vJZE7JhMCgNYwaSaMMritFN/m0ypOiGA8x64mME0N6jVKdBjOCo9djK7OiQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475g75u5wp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 18:24:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748475d2a79so1317628b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 11:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749493484; x=1750098284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2gwz9xWCvtM03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=;
        b=ZN0C2vzQbAzGtdCMyRxU82l+PkKvZzDYabVWL+6gkme3Gw8uJqDDsgCXK9nwUoY51m
         pehEXjtwaqPAMhT9es6mcehB2/oludY2Giaw1axTqpjLe9CDfDm+wZI8Y97/JrlaZwY0
         1e0gFU6N0lrGBOEzMouIRU3LaPnSHLwt9BIDoWNgwGBRaEQlZDPB6W0wXCdHnHVsZx7E
         /zj5BmSAQHZxC9vl9985BvBr4dSZp4MCHtAUo9jUIS+mjfxzsdS4xZ0Q7tcwVemx5722
         s/zu2gkri9vIP2x/vLccTX/834saUyyJiKVMP7s3UguMARsMII9VWLkU7w38toah/lby
         O0ug==
X-Gm-Message-State: AOJu0YzdqyLgWErusyx7nunRZI/zFZM8MkF5GBlbZbOuyiqv8vPpcqRn
	h0AwzpYmBXoOcj4v4WpjYnoDBWipQoaxHU79CAWpaWVCzHW0QbaXgkBIoBHQzosfz05OMwG90hJ
	40O+rc7Kk3tFowuHe/oZeeC/V66gzR5UYzLMs917VUsGj+LGln3/IdFMrhBkqGwNcuiD/
X-Gm-Gg: ASbGncuOKjsQtP3uXWCxUez772WfD0uyyGmQjFH/WeZSi2+inGIX7BDaj7EmhLdjsby
	jkenUHUugVheRUVZafZjcrpG5MXzVwEDUh8Ai0FKGxPYlwt+cPbxms5SVrt1m7wbt0e5XE0kebK
	9IFhPqkkEqj0mNttBEiQtIWcJlZU6PO52UVv6/WaWXhvhm0oBuUvB4rWOHm6SZMijC8D7coKBxd
	Zits+YYx4BQbsglRi4RUmW6/QdrT/4dHmm14JQge+8GHQkEb0U+e7SO6cnFR4Y9Nsu4dbd2t0cG
	499AWJwsI/z6Y/n6rUZGGhUdspHY7ivC
X-Received: by 2002:a05:6a00:993:b0:746:2ae9:fc3d with SMTP id d2e1a72fcca58-74827f330a7mr17505745b3a.23.1749493484090;
        Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE4XO4k7jfNXjeUp4cke4cx2uvEFDbj4Fl9AWPgXX5AvA95l91RUCPxIh1kKECvcbV1YQhTQ==
X-Received: by 2002:a05:6a00:993:b0:746:2ae9:fc3d with SMTP id d2e1a72fcca58-74827f330a7mr17505710b3a.23.1749493483727;
        Mon, 09 Jun 2025 11:24:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7a216sm5945104b3a.40.2025.06.09.11.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:24:43 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] drm/msm: Rename add_components_mdp()
Date: Mon,  9 Jun 2025 11:24:35 -0700
Message-ID: <20250609182439.28432-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8Oplxfw2bugJ444D5zN3XKGSrO2GDV4d
X-Proofpoint-ORIG-GUID: 8Oplxfw2bugJ444D5zN3XKGSrO2GDV4d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0MCBTYWx0ZWRfX0WlAjDf4Ffjd
 0nZ6/dWWA2YIA9iu5Yf8uObBa/yQuSGcj4Y7WMIS5G+R+szWD9j2ZF4lt5KbtdLWkWwchUz5V8T
 DLiYzfCvN8cw/W3C7crPCoyOxq5t9r4Pa2yMkMuo+FaJ5i1b3IRGDhJKgCA3tq5S1doVu91twWW
 nmQZTqlwrR5jxrKD1oTZE5DK6hmURiafy+RjYvOzXsf15S1z2wRcqRZWSJpSma8jfEHHxDBEB9L
 /Koyo28SiuU3JJLP9zwmkSLHuh+kPeR8KofjcPqVc0jvkcHCvJbbNPZyOfH1u/yzUdJsWeESXNe
 fc+8GnOBJemRX77waCK9xMqU0H5BcF97zhOAGFR+4GwDUGvaAB8aLncUaiKpBijvSMMxp1yRAR7
 ug2ucJVJnA8N68TenDZFjjzB6ZpAAUygsknuIdVIH/3Dfe94aRnQmUVqDOy42OKDmajhoHpk
X-Authority-Analysis: v=2.4 cv=TeqWtQQh c=1 sm=1 tr=0 ts=684726ed cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=vt6ngUXDG6_mDpkR7fcA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090140

To better match add_gpu_components().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 710046906229..87ee9839ca4a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -852,7 +852,7 @@ static const struct drm_driver msm_driver = {
  * is no external component that we need to add since LVDS is within MDP4
  * itself.
  */
-static int add_components_mdp(struct device *master_dev,
+static int add_mdp_components(struct device *master_dev,
 			      struct component_match **matchptr)
 {
 	struct device_node *np = master_dev->of_node;
@@ -997,7 +997,7 @@ int msm_drv_probe(struct device *master_dev,
 
 	/* Add mdp components if we have KMS. */
 	if (kms_init) {
-		ret = add_components_mdp(master_dev, &match);
+		ret = add_mdp_components(master_dev, &match);
 		if (ret)
 			return ret;
 	}
-- 
2.49.0


