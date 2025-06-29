Return-Path: <linux-arm-msm+bounces-62997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5F0AED0B2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07C753AD9A8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94A8242D8A;
	Sun, 29 Jun 2025 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEOaRKgE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15C923D281
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228182; cv=none; b=qauHuG/6H5ilkFqVkCcPVWXOxBeBQ4SgjjRvc2jcpKEADrYVG2cAmUTAI9TMaeOhF2vB2ASaju8Z/AIOH6bUfGiKAklVQaQLlmzh2+dsudOHmdv9BLL2D31eWMzzklyr0XVxqYA+dGexbNNCBfy4+83I3II7cRe01lAk36YH5uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228182; c=relaxed/simple;
	bh=iDEV2orWmuIXKriA3mh+ffbHZMX8dfi8nDJuhBaCic0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EnGBfUWoekRT2FBGh6JGxrnjOqWVzNM2E4+GcFdf5EJ4C+pm2GW5ndcFl7BB0I3KKZ7HcgrOOqOZOjz2BuoC8oayZpt2Xe6zUt5bt0Hkz56f4orTT6KX3HQlFp7GDM41SLEI3JmX7HclPpcmqGkmgxSvxH19gX56JqJqzY9FRo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEOaRKgE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFhbup013218
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/ZGyoxYE2vw
	gSzvJVWN2YN0dI0s8P9cmHBqgH65Sao8=; b=TEOaRKgEKXZl8BVMyYJNO1xYFMo
	x3PKu+eoiNJTKuj0pA+s4MaHzMIk5igdemEau9XbwnkAKzRAY2xHkG40yVqWlF83
	vsrUs+g3OZA+88YnFkjTBHPRoaJDjTyPt9+iDSElpv+ILQuXUiiXkFQ8ZfSArb2X
	0G2zalrrEmr90ylqCWkJRI5jgIbX0cc1jt0QKjnm4g8YmVFKXOUjhfJxPRIQldPj
	ik65WTUeUr83UGaH9+ne8r5f67RbII0uIpmYnQeojcEY6wT76EIBXCONgdawH5tP
	yjsx/2m+JrdVRo0aSDFTReI7fI/3sCDxfrjEmmuWzUWiyL5xgR/C0OzMz8w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2uxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311a6b43ed7so988149a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228178; x=1751832978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZGyoxYE2vwgSzvJVWN2YN0dI0s8P9cmHBqgH65Sao8=;
        b=NRjnQuQ3psKHrafK3t+BhELoBMYKnIzr5+m/uZY+KFVLhns4NWlEMd90fRAp00skei
         AGoth7W/a+B72eea3QTUllflc/Hl/592p4NWRB/Z8i0wipEQdXITO+bVbnJEryMWTHIE
         FLtqZnDGtY7GY4uE5gb2EEpNiAu8XTQLf0KD5mLJWv+c42g+MTQ9DlEhrUnWrTOFcC+H
         UrRdZ8jC9CbYjQ1Q7pxBxiv6H8qOxNnr56TuKnroDhcgc5TYiVZHY+bMWkBj7CbApY4i
         e3slxUEjv4eez2/TqYWM1Va5GR9nKptHt+2me1X5FKkA4diJ9+QDTqWKXSKGsx0X5YTv
         B2vg==
X-Gm-Message-State: AOJu0YxLGLY1Hp9+dWyN0fNat9Q9CM9qCRq3HJLWy4oIf8kG7SrVw3vb
	222kbzDW25B7wnwEd7IH+o8yqyX4e1QNSmXCiP/BHkS2FIT+IPE40LMhlALU0g5QFOxydZMIpnV
	gZ94RDRFLYlcIfqyq9nd6zMulZbSa/+rHdZL+kpqlNiFWIp8eq7yc8FIUx2XWwgfavYPM
X-Gm-Gg: ASbGnctspfA/qS1tAl/+PWZ1zcV9OeCceflWZa3gmxYoGPaTG2Lz9qFjvj6GmPz343R
	WL9DBMsrkzgvMcAe2mukUwN7uvvJM3L170IkCjaTWU+9id1fO+i2lLZAm+KycWjqeJIvjzsybrD
	pk/XWD9oE05zQQEETJCvoPjMYORPBSwpOe+YovX55vFix0u8icCX2OgDkAZkF+HHB/x8PyrtHNX
	Auz5ZsYBMfMFaq7UYqbfNa2bbEQ9fhDyzTgmQcJfOwWMVJcp8+kR1Z3qG4CdBqjUzDZl+3SaXDI
	qNBO3ZuGvXWGlcBXrcdtscNKLg00WZh8mQ==
X-Received: by 2002:a17:90b:4c89:b0:312:29e:9ec9 with SMTP id 98e67ed59e1d1-318c92ee68dmr17157230a91.24.1751228178454;
        Sun, 29 Jun 2025 13:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcqaNgJEnMkUx7hpJGEVz350AjhfdZASStdapMozh2ARhQFgf1aXDQ0y4avr5wbj9GJufNNg==
X-Received: by 2002:a17:90b:4c89:b0:312:29e:9ec9 with SMTP id 98e67ed59e1d1-318c92ee68dmr17157206a91.24.1751228178042;
        Sun, 29 Jun 2025 13:16:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54414acsm12293812a91.47.2025.06.29.13.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 10/42] drm/msm: Don't close VMAs on purge
Date: Sun, 29 Jun 2025 13:12:53 -0700
Message-ID: <20250629201530.25775-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CmAbFt5CfeU76v1UKTWS5n8Xmrk3NHg0
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=68619f13 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=nDn0RKeFDUDCjqZoaxcA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: CmAbFt5CfeU76v1UKTWS5n8Xmrk3NHg0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXxITPbEjFElxW
 6JkWF3pZa8HWYeHVqX/5AAuW3jE8cu3kEXJnOKpeZoBsOw/KAPw6JlD/oAp1chXGLP83bH+jB+d
 33dEz+us250kGXftJgcs6hKpNV3d+K2L1kX0f+NCP4xvCpuKPD7Z8RuH/xvp8wClxAJT2AE3/xt
 INLN1AGubUL+uNMmhF0/qYJbiwxsH3TQMiCA0pnfgNJmiKbTQykjtIcrijTlH8vxNquqEY/ODQ8
 jtxYZqesDLKJEa3nLgM25AVQVIX/OS2BlGeQ4nUU+JkdZK9/aOR4eeuc3F8rKQ+lW+yJk18GGMC
 yaaSjfTWVChRLeJVHzvujwZviga+GFgwirbEwP8M/V+QUMq8SBEPlsFTiR3f/mfe5wk0w2irzfk
 Y4s6W1FrmWKHsxFYQ4lfSx0STsovYMK2ST74cPnQnfK4y+Lw/MUEAzzv0QZWK9FROb9E+nkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

Previously we'd also tear down the VMA, making the address space
available again.  But with drm_gpuvm conversion, this would require
holding the locks of all VMs the GEM object is mapped in.  Which is
problematic for the shrinker.

Instead just let the VMA hang around until the GEM object is freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 7b0430628834..a20ae783f244 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -755,7 +755,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.50.0


