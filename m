Return-Path: <linux-arm-msm+bounces-58017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 093E6AB7A42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 02:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D74414C453C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 00:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5074022B8AA;
	Wed, 14 May 2025 23:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPZ7BrCu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8321E229B17
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266770; cv=none; b=IWFqKR6X/MxUlb6VXJJrlG5OI8AtWGVzChJHqNdj9S30wuKPpNAPrIPwGfpYgZGzKsBpCfkmFmpaoQKlOW7N89zbVs6d5MRcDWY7ve2CFp+2l0wkv6VeDLXeA5dviuSdR3fr11VLjMIJn/+M9Si8SJx+z95iNCmlEMGzxU+5wTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266770; c=relaxed/simple;
	bh=OIPNFYLkdGomhmus1/0s4dYazfcOvIpfe1g5WVjseBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LB0coDlwEnjSyrjkOuKq0uriMFIzLT++1xSC0+5MR+Y0vZU525as6UnMR98hIhLOEJ7OlNl6jeSz1BCE0M3N4C9TIfkyvZ06remJvqXhbWoXRXh3ru3oOZa9Tm2VRC1+WYs300O8bVmwswdWoioViEMt9Ct9qqBjgvfEdUOyvLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YPZ7BrCu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKWJim012652
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJghl17vB9yjaHgteK11rQgf489v27pk8MSeO1QlklM=; b=YPZ7BrCujttzWefS
	7k52LLoHd8QJTzwQO/vxTEVo9omV/tg5k8Dew05cPjOh3isk1cwYDX34iIzw1g4j
	igq5KYXFwoEyKyvi0bNt9MULlip6eOdwpfYrybNgmvysUcI6oJH0VFcU5zM8HrQQ
	Irzoqvvf/eY79bf2nqrGaeVMPviY4WXHShYDDWAp7QtrrkXnUPiywGhfIvViZ5Vu
	nzZSkv6EfS6+wFybzFLdurzPV7/1Xrb5inNYNri5rz8JjZRXky6MX+ypwcFJEKKY
	CKFGl/L/LXe10A0wuItAt71F8Fq2KVVZBzeZUjw7qP6EL2hV8QO61ld3Xj9H38Rg
	oUlBpg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcymeq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22e40e747a3so2926435ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 16:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266766; x=1747871566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJghl17vB9yjaHgteK11rQgf489v27pk8MSeO1QlklM=;
        b=a1As3gSIJhApI8kU9ZV01q+23edpQivhnTiGcYhE/0c4OFTKHEKc1+bj+cel7NxHYG
         lZGxv5gc6l3FA3uTS28rxVidzmeoS0T4iiBXsn46I/uYJPj44E4NwJ3MDGm0cKh7hfYB
         bF0p/h3cOiejEDA4/z5LZ6QwIBxZnp++ejxkMG8indwhhROlmv2Mg+3GxKvUYoozmWFO
         3ylElyRd/YuxAEtp5LYBbPX/PyeoghZqI16tz3shyDlEZcN51HjP+41p7CuaR+Zl1EKd
         7J8+q17LOBggBFP8V95pyo9khYrUGPeEK7U0BL/ujOoITCkcG0g2J1mqoXS/kHh732+W
         psJw==
X-Forwarded-Encrypted: i=1; AJvYcCWXFT2N36cR2RsRUQp3Ha6AGUjkeMZ13SCDCJi2W1r5anTVER9at+rUPY+Q5mL/mtCyJRGLb4ad54dD8yWZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzapNl4Ii/ZGP3VS7tg1FWweqpW/MtBbTfIQEccJ+XLXJv6iNkn
	K01WlnWk4rj2jdJwxf079+6pP3OQdwzefnlv3MBnE+2+qNce00LULCV+txVtu5UKANSCiQ/P6ve
	RCOPzipAyQ4IHlg7W1KuO/2VNgD3z3AwT0FWdajYl2cs83+uu2BwIuJqPtuoHRAxs
X-Gm-Gg: ASbGnctgebmNevF058u/Mu8ch04e17rgs6sWysFfHXOj3n0SbOBWFLaf0PfcZ8XP3ah
	kfIFQkNv9aObNB1r/paRy5OEPeLi6+WQDyn5uIC3cONWXzN1xIwsAEp8H06Gp6LwqRUNDgR/V0F
	blC2waDW3CW6NAHQqye76hhmW15rhsmk9+fM6zhJ8/D0JCTQw4ExJJTgnspM8pfv+hkpwFSU1/h
	C/TJvilkcqDy0AvV6JQcx1TGRJgH5fcPuBO9e0JP+pyblKPHivd/VxPcZHJBmCNlJN2U79MkbDx
	gbkLoTmUnDSN81CGvSzJhlK2/198VfS6BC3cFZVduvF8dO8SPLObvVWOeRGbdnMGeyRmSMWL
X-Received: by 2002:a17:902:d58e:b0:22e:364b:4f3e with SMTP id d9443c01a7336-231983c8d26mr78384325ad.49.1747266766596;
        Wed, 14 May 2025 16:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElBMMtlFs73GOE/CSJfWpv6kvzPVBPciQe95hl+3ogbQol8ic5ww8zShcsAEXLyX/lBBTLOA==
X-Received: by 2002:a17:902:d58e:b0:22e:364b:4f3e with SMTP id d9443c01a7336-231983c8d26mr78383945ad.49.1747266766200;
        Wed, 14 May 2025 16:52:46 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 16:52:45 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Wed, 14 May 2025 16:52:32 -0700
Subject: [PATCH 4/5] drm/msm/dpu: Filter writeback modes using writeback
 maxlinewidth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
In-Reply-To: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=1350;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=OIPNFYLkdGomhmus1/0s4dYazfcOvIpfe1g5WVjseBQ=;
 b=0lV/29bwfrvOOIXt1cQk9FuWEEWPvaC+02GdLvIzrV3TQ9b+8xL/6i24PUe+kv775VH6GIiyB
 PYZR7MOt/YnBvHbmvbU+ftLOqf6bUJy37F5YtG9ufV0E3xKiNFyxO3V
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: oOTCRDybtrflGf0jpdFmApo5CD9zr7Ju
X-Proofpoint-ORIG-GUID: oOTCRDybtrflGf0jpdFmApo5CD9zr7Ju
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68252ccf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IdaEjn1bWG-LatOizd0A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfXxsE0aMLtqMV7
 cmAI+N4fUiU/hq9VIhjfZUgM8BMTKGWF1/fWgVoJkKx6a5C/ba5w5URW3dJ/p6Zf1zj/xxDZEVW
 slihTkEuNyHpEFobE3EEyxTya+oOtcl7BjzAFZP3+ZHdKZVJoTweh7tnHyo89cptMiHEN267h41
 Ev8RTZkZ3/JxWJxsD2769kBcTVmSqLSegvwmxXRubv+6sX7aRqXZ8OM9Qx7lMdw/bodleE7K9M+
 6Vd8kIp2lhCjj9lpVc9IXsSrKCo4OtFV05n1mAViOf+izrzWVx3pQs8ZL856D/fwCQ1uLoCVNOf
 RMlep89M08hhPomiGrIIHhdb4BLgjG7oh5tiEK1x3boUomiptusBjofMQWyo3JykV/8rtye5uZ/
 tae8rv5Ef/86eMiL2EtJFGmKaNdAu22vLsDpcin6QkEI2QuYvXa6JlX+pg72bMH7wfR/ITFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140222

Since the max mixer width is not a strict hardware limit, use the actual
hardware limit (the writeback maxlinewidth) to filter modes.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 8ff496082902..0a198896f656 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	/*
-	 * We should ideally be limiting the modes only to the maxlinewidth but
-	 * on some chipsets this will allow even 4k modes to be added which will
-	 * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
-	 * and source split support added lets limit the modes based on max_mixer_width
-	 * as 4K modes can then be supported.
-	 */
-	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
+	return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
 			dev->mode_config.max_height);
 }
 

-- 
2.49.0


