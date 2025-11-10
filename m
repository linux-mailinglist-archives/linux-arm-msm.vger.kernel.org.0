Return-Path: <linux-arm-msm+bounces-81068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E7114C48187
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C8E0E4F3109
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2CB3254AE;
	Mon, 10 Nov 2025 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FylzTH7q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ge298gm8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CB73254AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792700; cv=none; b=DR0zi0z0OPMT4YX9bGZB7sZXQMZIV1HVLpLQ0DKvVzprxliTio7hHMeatpRXBoMtPrl/2JPBVGfF5P3OZg3OC5OOZX4+Rq3twboDSeeSfCgZKQBtBkF723hwZhbbL9s7JdM8kLasV7g2GmgUZS6Fq43jbmslCb4kh0qHgdZcYkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792700; c=relaxed/simple;
	bh=0RH5+HB1DhuPB+qO4uxLrDpF6juU+e+LzCOFWLT2Qxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YgeVkFGGTCoFDRDiwePBpA0JDhNXijcpMDKqGoiZIkPql37RaHiPbPur2dkwXhhPwZILNinD+zpAt06hDMmUgFywnzu1rqT0ejLOewN/BC+DxebpFx5bR+P/b8VDUhJci4KIkjJv7KK//Ype0+JCIxjVdTqIy/kGYEqiiBwdl4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FylzTH7q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ge298gm8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAFQ6xm4071443
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mcdYC2GUWX3Yt8G/A+qwsr5JfoxF8rsQMfbirKGchD8=; b=FylzTH7qXckURdUD
	OLX83HGhHgJ+Q9hrI7XQQPI62RDSKKMBhh0bziVThWbjjxWf5o05jdu1XEuAvH8e
	y2wjqPz9YWG1klmm6PcsEK+dGJf1TE1OFvEQ5q6vtg4vTtft9dNnvAYFpwAGqYtI
	5cMkGqXJG1ErKfP5JM7siZHbbmnWs/YWf5DSJ0zsNpgkSHyyNeWJZlJCu9fSBCTi
	h22vLn4WnQF6xiaI8+hwlP4O/MMi5QIvHss41z8H5CVHvL/9YdB88qbjl7VH5R9z
	+pplPbbGPpUqPwS7snab8AalsHi+UjuVhJcr9kzTwD78uwY5lHZ24hYcBCC7LlYH
	BaYOPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjpgr8u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:38:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3437b43eec4so3281657a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792696; x=1763397496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcdYC2GUWX3Yt8G/A+qwsr5JfoxF8rsQMfbirKGchD8=;
        b=Ge298gm8sI4NciAAM4EErctBtZdTgTwCOuQw+F3S09EY+lUgpU8HQn/ijZ91kJAfTf
         5Y1zCpFvMAS3pofT+fCP+Yjx8GTpvwir7TWDIWwiaTKPtwIQvnCCDRqAHXyI5IvVg/Bv
         iJgQcJx+QujBm44R4qynU6pus3sm9veb5BvfoJ425ryhg8JaR67rmFnpdtutUGpsNPgw
         Ahr6kJXBAsr1yzkrlgdm3iLg3BEVjSQJXBV1TvfYGfm6rGJbD9MyaEfsxbBJN82W8aLo
         MwplPuReiQsQcvYLb/3gAEmhWAYHPNAVDo+TNVMyRuIaU61mTk+UH3NUyjSmhvMs0iZp
         qfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792696; x=1763397496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mcdYC2GUWX3Yt8G/A+qwsr5JfoxF8rsQMfbirKGchD8=;
        b=kztDM35iExlm3xSfsVszS+BHsUndGNyzTo2rNstUXjPpKBhPfXbX525rIfQYIS2UV8
         JOgRT/pbG4I2+NxPRMiwx9bdVcZAm5A+0SfpZ92QoTNxcZNiT99anJrlQSHIM+By2H2i
         qgFGI/SjQbpJamHQFAZICgn/qdm20NCHA/+dzI47Sn1L/+afhQqRlsCnT9ZRxElVtwo9
         0Oj2fvaQxgFgr+G5mLVyxGhdHkH/9UZ9/WRbm+AfXcmNgyGyjBaQGTG1DLwphz1Cew6q
         haMRWLR8Jve+P6RnLsbnj8mke2WLWUi9cjpMAZFVa/BUXjFddub02RAxm/t9YXqBlmwC
         lo3A==
X-Gm-Message-State: AOJu0Yz0vnc/lc2WnFjU+NuL6mZIoRCBljk7GgUjxXk9/1vHBigQKUre
	dMdRylg9LZpFoniholvMheXCCiRff8FZKLr6je0Yqg4+fr2OOwpZu6XuR508eA+ovkyl46NJtq+
	H2al77vGPdwoTvlvjw+F/iy/kLNDSjTHoV/lxI9yqRrib2j3BH6ZJK5jTdUjm3kfcTa4N
X-Gm-Gg: ASbGncvH96kSvmrF7wWsWMkQjvx9s39x0jepg6V0RlduAv3msdMPhGNGETt7raRppIf
	2ROA04BMXkN/XINCfRqf7ndlqfhidajcv1dSel/t5H/sQslmPX+ALz7stuxHAvCbXZuRA9irotz
	P3Ri4HIm+/lr7nIhy9htpXYwSdOsmkGA+0TRu4JAEljKq07tW03Ub3Qe7gwdZZZ5WQwjogoAl49
	QyiHSjwpvmi2SaIKfD4eXy6EuultbpkyMyLipFX4o8bhnwmrWLkXxaV1JqtOCm0aKWK41nT7Hba
	62K5ea6iZcGfxPb3bz/l1G7Ng8DSlZrs82M+cGuTW2f7jJ0NYnw6Q5Zn03/acMX6GfAETqKiOUx
	q/UHUaxK6njDLE0lElB778rg=
X-Received: by 2002:a17:90b:3d8d:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-3436cba90e9mr15119946a91.12.1762792696048;
        Mon, 10 Nov 2025 08:38:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpeeLzlAYES/pvtPhYhWt6lEiwIUScD1B6YRIb/1r23lLyKUJQumTRvtgD/qeTqkbN1zcfMw==
X-Received: by 2002:a17:90b:3d8d:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-3436cba90e9mr15119892a91.12.1762792695560;
        Mon, 10 Nov 2025 08:38:15 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:15 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:07 +0530
Subject: [PATCH v2 01/21] drm/msm/a6xx: Flush LRZ cache before PT switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-1-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=1640;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=0RH5+HB1DhuPB+qO4uxLrDpF6juU+e+LzCOFWLT2Qxo=;
 b=QKpYscsE7JUidxLJTjdztF9wYuuFQ9/van/0jE0PIt/jNOJ6D3vBNzOOdZyJ/eo0wJsHZeZJC
 YOytieMGrHrAXCLYQcFt1IEg81WjWnyBwdBPtLgVa7LKRAYQ44FDAn7
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX4NzUTevmFtRi
 5nVU38nT9M8xbWYgUACpymaizN7thPtQW8/g30uDFV90WZiLvle3jsnf2pZJiGM9R42X0/TBHDU
 VXWW6cn8pQhzOafBMGn13tuQ0yJ1ue50tiiFqqb/u0DKJL9/EIZcGsHOdpLoV1gPVzVBJBUBaJQ
 VqX/wXfE2z9k/rrx8GpraHlsevOfSz1+ahSRKPMaaV4FvOvU63a5KNGHDI8fndKs//FlB191FpW
 OYTCP+W2YEFrjTV8h8InU29Z4Ba63zog4xI/RP4XnOpbYT8YE0pV0B0JeUlttrpoEST8k1EJ1x4
 BostvhdTZ852pxxrXwIgWVQdP7zrQRAU934of6igiwFFDxI348dro2TUqdu566KMzOa5Ia0gj/T
 p7JoR7upeeiGFJz9z2BPFI4hpcKViw==
X-Authority-Analysis: v=2.4 cv=br5BxUai c=1 sm=1 tr=0 ts=691214f9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bBR9okFf-Jgdumx6fEkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: IZsZr_9cPAxLlgi5eQ6Aa85Qh3mDwe-y
X-Proofpoint-ORIG-GUID: IZsZr_9cPAxLlgi5eQ6Aa85Qh3mDwe-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140

As per the recommendation, A7x and newer GPUs should flush the LRZ cache
before switching the pagetable. Update a6xx_set_pagetable() to do this.
While we are at it, sync both BV and BR before issuing  a
CP_RESET_CONTEXT_STATE command, to match the downstream sequence.

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b8f8ae940b55..6f7ed07670b1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -224,7 +224,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		OUT_RING(ring, submit->seqno - 1);
 
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BOTH);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
 
 		/* Reset state used to synchronize BR and BV */
 		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
@@ -235,7 +235,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
 
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BR);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
+
+		OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+		OUT_RING(ring, LRZ_FLUSH);
+
+		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
 	}
 
 	if (!sysprof) {

-- 
2.51.0


