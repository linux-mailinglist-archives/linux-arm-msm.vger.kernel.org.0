Return-Path: <linux-arm-msm+bounces-70035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F83B2E931
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 02:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 083C95611A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 00:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFC0155A30;
	Thu, 21 Aug 2025 00:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oGm/QCW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBBC4964E
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755734681; cv=none; b=OZxnt02im8YbMSAUd8mdgp3ewr+Ayj2sw0eNCSvHqLWkryC236C/PFFtLhgPORO2Dlw/LkjOKnEghHGNI/S4LOnSYIkdR7MKsG89YoWbnGLpShQyMmRZOCH53BhrQVQOfOa1r0viJFxlFNbwQ2Lv2Mg+SV+T2gDPTWOjhRJhaRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755734681; c=relaxed/simple;
	bh=FTfonb6H2UF2nVmZnazTx3PEb2S6ZWHLTuGTK0lDTo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VL0ZzSqEQGzqyL6Yj09Naqy29+BbokyxqtufVNI2MNx5nCO0Uw5eRlXQHmy5ynYm/VWvTB2s078kloFbFKdDaPN9bRrgPBsVFPSQ4nwUKF8XF+WKkus3peBt8X/rUUTz7lJHJMyH4C7eoVPeRnzqDDDA/MNnKry8mL9UvVn1sDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oGm/QCW+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KGmOrJ025745
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7GonE0I4O86
	IMbS9YwA1nRfKE7NxszsWoTIBBuaYOXQ=; b=oGm/QCW+yDsDLwFUlm0BTzAsCYm
	Q3CdZT4IjuaTN2G6iLwc6GW7VGglHZmkUZukV92bpXX4V5kbGIC76Cu9ZyHPWlmH
	DuGjCb+i//M4OxZdUvRD1pL5ypAUeD8M5AjOxq99w7eCKNNsIOsiEVghoMtWOkRO
	UsWIDXmuauwZPcQlh/xrHB6izFBDSdwBu+lAk/C9SkLgvc9/WtnBb7VDLGHORcjI
	XEHLWzbMzTZKuh6Fd8kuddbByOwqHQJVpnobWTOqftGoy1X1qwk9FfbwSZKoinQ4
	O6rEKr672qi1+tVLsEDEZ3NCRbVZMiSvz3A307bdxB0VdjWoB36PWgWuBxQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52auae8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:04:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-323267bcee2so443235a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 17:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755734676; x=1756339476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GonE0I4O86IMbS9YwA1nRfKE7NxszsWoTIBBuaYOXQ=;
        b=e5d7D0fc07SgyweFtffI4kkBJuSzI0dpJZMiK5q8uO1cZG0MUatyDXRM1lhWzLuyeB
         rJbTiX6OOkp84jhQAU/dQhFL3Q6/9tEOFHBDayvriXKPaONJVKykIK1sNsZeig6j+TQc
         niagbuUJlJUqKGl7wJBe3uEE45Diy9RvpHvkLYrL0go85kjvbTjIb5Np8zNR/UwK956G
         eRZfzCVuKm3O1MhQ05dOjizUcvbZyXhdD06Q669Sa4P1OheFQu652SFvzKpEurpCcpKN
         e0HmNYWHIUsFfgUQf6P1OB2xpBNFbRh6RJuEntDZOweK3AQmJs6+9HbKVu7KXlgeI1aw
         +kmQ==
X-Gm-Message-State: AOJu0Yy1aM7JZysQyopgTthM9JZvyqWDcyDCdLYts0iq/7DUJzULqryc
	zKJfNMGQTRgPeHfoJarKmX5DT1OwMiAhR/3HwQESsXQSy0cM2xaCK/yvKEXdAbJdDYGeImySU8A
	J8tk8AU8+iYj4Q+ATpITwc2On+sWGDffX1JDr9yyWm16rf8yy8rxK9VZ62aYyGPX99FnQ
X-Gm-Gg: ASbGncsgibmYpujRWEhvKe1H5CYZ1ZOJEPyj6erK7bXkaZpNTIUZ0+X2r7lIhHIpwbX
	Mz/D4VdYUBgEno6/IFgzDegUvQVxDG9/9y3Yw6e/U4AMyXiqtXwTO0t9Nm3MDYWIm5uJiMHET8Q
	obHe3eKS7OZKktKvCF+vTKoHMevqDiulsJxB8GVZAJXjyIXqLKRgNc0ITDmHgRzj3VDZu0Bf/e5
	5FxY7daR2bB0g+moOmE8nZaw2olYOKUNuyDScRZH9yfjR4j220ys9TRevBSzP77JAkImwHm4NX5
	VNCifgPnqgYjzAHqBNAJQnAvbsT346YQRFfL03gvCgwhEqvIuP4=
X-Received: by 2002:a17:90a:c890:b0:321:c8e1:82e with SMTP id 98e67ed59e1d1-324ed1bfb25mr758862a91.26.1755734676237;
        Wed, 20 Aug 2025 17:04:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENGaAHhgimor5pJiOH4MjaweNyjNHnC1m6WbGg+qru+W8Qt7ZVMax/uq24M3YIwwpqMOR0CQ==
X-Received: by 2002:a17:90a:c890:b0:321:c8e1:82e with SMTP id 98e67ed59e1d1-324ed1bfb25mr758824a91.26.1755734675703;
        Wed, 20 Aug 2025 17:04:35 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640d3e3fsm3201333a12.56.2025.08.20.17.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 17:04:35 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm: Fix missing VM_BIND offset/range validation
Date: Wed, 20 Aug 2025 17:04:26 -0700
Message-ID: <20250821000429.303628-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
References: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+pcIpiADOLLR
 qzbUY6aIbiJQnU2wEPTDYCp5vP1mF2OX0972zSKuMnDtvGddCrt6vRjN+73S8oYkFr4FvQGA8Dl
 YgAXCAjo2zR1nLJDW1yU82XpfzhEuhc50nZujRTBkmL67zrmBvvgJM6OsVZijl1YnzQVkxg16Rn
 IHge0dbzxbq5HxpWdX/67T4EOInxhd7zybEJtDzyPnu4PHgFcKsVz0tyIRerihTZmwVYSYI9LrM
 /OmWvH7ynE5fMEEcy0aJqXZhMMjLHUbaDahYzZvjwkXEZzIdT8GJoKHDfUU3oyPDgdX0GNEIyee
 cyEgs1zXWeh866c0YCpOm6KFl/G5pZvT9i6qS30vL2OkXXR1F3HMIyPjqsyAWMs7Qf7jj66xSPJ
 CbjiW6+D3GgKuwcMLGjhscWaSxqtlA==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a66295 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xd9qGtD1qYZMgD9OdIwA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 4PsZPvDGTiFvkOJFnCMMgQCb-oeLyBNr
X-Proofpoint-GUID: 4PsZPvDGTiFvkOJFnCMMgQCb-oeLyBNr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

We need to reject the MAP op if offset+range is larger than the BO size.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 209154be5efc..381a0853c05b 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1080,6 +1080,12 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 
 		op->obj = obj;
 		cnt++;
+
+		if ((op->range + op->obj_offset) > obj->size) {
+			ret = UERR(EINVAL, dev, "invalid range: %016llx + %016llx > %016zx\n",
+				   op->range, op->obj_offset, obj->size);
+			goto out_unlock;
+		}
 	}
 
 	*nr_bos = cnt;
-- 
2.50.1


