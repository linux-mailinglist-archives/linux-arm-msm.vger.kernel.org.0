Return-Path: <linux-arm-msm+bounces-69841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C148FB2CFF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 01:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6C25B4E2256
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 23:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF0A271450;
	Tue, 19 Aug 2025 23:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jirj354E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50847264F85
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755646156; cv=none; b=A8rVM8AR2Pl3Ebrkb3RMX1qxlbug3Wm0pcgdGiQOpwCbpbDSqKGzOggYv/UTdeBAR+OmRan7SP1lSPqX3GJuEGVatpx3eMEg0HhMdcTLTY43wxsX9HJAeVk3KIL0KftAd69rwdKOup5gqklv/fyxnbhULceiWPPmeYM0ZbZ/A78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755646156; c=relaxed/simple;
	bh=LjENvcqs3jA0omFU5up+rd8ZRQO9PVI4Y2VMj5m+6FI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+5+nAu49MczlkmmoeH/6NU17lVoiBFH6En5MKVX/tdQQRW/m86FDvoptf/qfOpvOkA4gEDQb/pjcRL3XExicvKNwSqOj5zdQIa73hKE8tfXKkwPz5Yrb0YfPXYt0G/4hGI7j5opiuYVSegN/dcmYP75mwYjDO6edZGtvz7f/Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jirj354E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL1Sif021009
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a+ZaKXx/xL/
	u7Q7T4LDwvQWGaQFWySGiqB6JfEfEJwE=; b=Jirj354E7t9/WYXwpWkvWD4WCn5
	dpa/J7/+4TNVg8H2Lm/r0XJ393CQ8TPYNODaVYKMUxDVyAZjq5CGqRiYjtxBpQnd
	McbHaNFmVX3RVySxqIuihWfl94LBgw41JLqxpGan/r72dTZ4DsB65XSkROp/sEoP
	EKZATlStJRu+O5zmofpSgNBUmmeqVmOXLGkNTy92dtPcIgtay5EuV/FX04GQUZ69
	VdTlijBW+IbtWggczmzhhHJ0d6++C7FsjG6jJDfJXN8I7S4uuDS2qUbN+xowy/gJ
	4ttwVJohJRbttq6r6NTSILxPFJJdON+3uAHauTBZb5R8a0RHZQfDqcAnnzw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tfg8wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:29:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2eb9bb19so10194786b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 16:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755646153; x=1756250953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+ZaKXx/xL/u7Q7T4LDwvQWGaQFWySGiqB6JfEfEJwE=;
        b=I2m7HUSZYyl/K6j0i8gCRXAtzbejSiG5yekCkuvzyVGbrOHYbmkR0D1qOUcahFdC4A
         jMhrpHIFbOerk6I04mByuvM38dQr3bsI0AznLxGnx4EOEoJj5wsv7Xm1hgyDekh0pCl0
         8yiYmhO6QwALDBRAKIzR4nbBjM0Rb2XmcdmlGGsWs5OaOQQfEevejdzDOPbMgViqUA5q
         yCpL0UtKCRzV6zFYJUvK6epHZg8kkPPpqGBGs47A8+MGhAXchOSMJ/IJ91xeZmSjhbCX
         JSyxJOp4cai4RuGChSL5zpddqX7yTsTTclAxlOJ3tTrkm+7FtrSeWwAYrC0/gvM7wM/v
         MLpw==
X-Gm-Message-State: AOJu0YxR4zp0mChStB2PjcbFr80mHS06fCoOrrP01yVT/kgu5xyzvkro
	flFqxWaRsvtRCImlG2Vcne5LDSHifNCTGRZuxwKvAXajMRbOi23wrpXVEgydVk6PZmn+3unwhDy
	iLD7Q7MIDzjsQJLq0/hL91i9mtoNe5sSNuwnjZFfuIHd9LX1I6rSp7Jg2cas72yLmLFjG
X-Gm-Gg: ASbGncsCJ14O3sx7ZDMdJFYQtgxAB1e6chW7I4QxM3GW7HUUCkp17+CCzYwo21Jycsf
	H8ZTU8m6TcuDDzy8kFptVnz+XHUNptGz++YpJ/7JM+DDaR8Eh1d/jphb1Pw0cDgsYWDkODq0wfV
	sOZ3yCEZRMTx7//2DZrMUsas/6fn7NRVEECTQV7Fhy8gyRGb3ZmXeJIX30CatWn3mfeL7sB9jMJ
	qzAomWMcA+LIi1vt/62zXTtPQaq1J0KoGoUwu9ZbetNP9R8uc6etSCJDqQg4c5Q6nWKSe8dhD7G
	Ro9Hf23DaOFwVz3yFZSUtqWTDjxXG8qNqqDsHlbcCQJ8swlrz7w=
X-Received: by 2002:a05:6a00:2e92:b0:76b:f0ac:e7b2 with SMTP id d2e1a72fcca58-76e8dbac1a1mr1258740b3a.13.1755646152736;
        Tue, 19 Aug 2025 16:29:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXuuxWQ9CNWJW9SCXTPxi43/HrmCwC3mMsHGIjwm8ubVSa4o5saby5u8uLerY0CGPltJ3xIw==
X-Received: by 2002:a05:6a00:2e92:b0:76b:f0ac:e7b2 with SMTP id d2e1a72fcca58-76e8dbac1a1mr1258702b3a.13.1755646152306;
        Tue, 19 Aug 2025 16:29:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7f0b4f60sm3423813b3a.86.2025.08.19.16.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 16:29:11 -0700 (PDT)
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
Subject: [PATCH 2/3] drm/msm: Fix missing VM_BIND offset/range validation
Date: Tue, 19 Aug 2025 16:29:02 -0700
Message-ID: <20250819232905.207547-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
References: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EuuLbScA c=1 sm=1 tr=0 ts=68a508ca cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xd9qGtD1qYZMgD9OdIwA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 4vN8lUsTBmJgbHy-fh5t00J2OH9-VnP_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX0Hs/ac6kmwZp
 xnGdYiEy3Ndzv6ztiZRc031bNFQVzM6nvO+2Ozrbzbt5/ZX9HOzQXWGHQKHGMZZKZUzKPaUq4fG
 RGDqjXRZO7LbyXGXLeM+iesbsEUnmICvzEfJm4rmMIOnQPnriqAZOpehkkxK7SxsWNprIbU30yi
 h7ZlXZ9NrS63KKOhIGKFv6KtHxNb7FxZAMp0Sj/sjjgKTzFtTYZ4SlYhzgp6dOk3MPo+0OktD+S
 ZtMM2vUYGG1F59yAvYqDQO8wtbYretMcSqJSP3CHjupWwRjHOu9NVb3izYZL0lvHqw5yoOIPKao
 WP0gDCXJiQesOJM5UT6Y88KCvp3ir3DImuExaAX+NdU/bDVfF9PTelxWE00CIbc9f5KQbnAZaI4
 HkSbqvba+qYoerKTf/MKUlXMoNyH0A==
X-Proofpoint-ORIG-GUID: 4vN8lUsTBmJgbHy-fh5t00J2OH9-VnP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190196

We need to reject the MAP op if offset+range is larger than the BO size.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
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


