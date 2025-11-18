Return-Path: <linux-arm-msm+bounces-82205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D9BC684B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 865A32A2BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FC5208AD;
	Tue, 18 Nov 2025 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGCKO1TT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpAsNxHa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8553930BF60
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455896; cv=none; b=NL+DiQLSzhWFzNQ2a8k607Dd9tIDg6fyeYbTY8p6ZxP5nFwnWFuPTLuSaTR7fEyouCwB9w9PWxHqhZt//rM7eggjyZu7AFZ9sZwuwBQ9Mj34An7dnhq6MJZJFP3t9rsXaMGiA/6eDzrQ1CQ30B7AdzRgUMX3xUWEIJBxh0WcSpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455896; c=relaxed/simple;
	bh=U6hCxZZPt/0oNlBV0Loqbw+1ONR49vXzGV9kkJKQhe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/VDgihpUEdAHE18L+Pk+IgeUaZXGC4ix51Zd3ryRRhJ3O8tzeSOtLbr45i2qsVi/ayFwksXJlKSLGHKTLiVD39r7o1PLBeZc62vpZ3b7I8GDmGuqdX5QaD9/DYviNzJCkhpYLADuTDg+2dNXNx32PkFgVsVeNZxQoe8OLPA6qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGCKO1TT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpAsNxHa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6SxXi386625
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8PgB48It9l4+bkgeIQSRAK2mU0wwCQ3DP0FmhMvQ2U=; b=BGCKO1TTAyU069p/
	i4rb15w2jCE/nVofuquIXNRUsAqggCHFPmaCEjpn6NtGJYbXj4aJf7ezqTXvf0H0
	2aYhQ13cJNQxscyaDZn+zuEuAGFxzVKJi8LoWki9L2Ex1Xr9gQPTrCYDcyUS5Vvo
	UfIzKwpQMphc/UrF7lKMV2kwV+qvZS5c91nU3tDte9O73C3LPKyd1nO8Nf2bL3F4
	CqBYJgzeHVjdhFR2sUfwZXRrRhB5szA/oYEjgcbBst4y0crwdxl1OkKynAXXmqvf
	7Gp81+i7JsItbb2Mp8ryR2T/j8UnFWnI1dG/HZ7GakP6HxYbjF1+sWtJcvEANy58
	rJefgQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8hswv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:51:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297fbfb4e53so94965355ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 00:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455893; x=1764060693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8PgB48It9l4+bkgeIQSRAK2mU0wwCQ3DP0FmhMvQ2U=;
        b=jpAsNxHaAG3NLo6y0mz8byPqjJaD49zU4jLD8thFg4nFcDfqpljyC17WnOxA0uv+FH
         nPVQz8tWb16e+CLE26lGl+X8pgTFE7g+GvJE2/5odIA21job0AO0DgAdX3s4kwWrzPlq
         GkxpIYbFMlnuRy9lHfFiV5dZW7cnxlq4to0/4R9FaEDjTgOUjB0ibbcvPeaezqvVk+Lf
         dZBVRwWMyO2ZNepsAlWnsjukcBCSO24z1FLl5pf2zZFpad9vDe7HcB+9J/DtJD7R4OO3
         ZgJSJq8khUImu2vi6tlGMn8nI1yoGlsbNp06/9PTOTqdOaSFXJFTDfB+YxTi41xZBf/y
         Of0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455893; x=1764060693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n8PgB48It9l4+bkgeIQSRAK2mU0wwCQ3DP0FmhMvQ2U=;
        b=LJyx/KrSAnEgZ9Xx1xIQnjpKIPbuMW3gZ6WssG4CH434X8C7OszTvPgaSUaYetFOYD
         uovtzYOIS873u29mDjew4anARGKiqZwwhObaMDpPthjjKzBqQMR4RF1oDokNNsoelH/P
         L2IaOLEKTMhAnlUpQG+6Xicj3+sVU5xez7bINM9lzJDRhvYNwCBdD8yJW+NTGKWVxV0i
         Cp8Zv/kkgUR1Xq154z5E4Btl0txqTqeIODfCusZzsdFKJsgwSshtbp0D3PS9O9dviExk
         bIIGF4NKyHU9v3nDpOH0rrff7KqlEjlN9VzarOqp6r2PJO2QWWNH553NNRrX3WBrthxb
         30Ag==
X-Gm-Message-State: AOJu0YzH3TvkBFkjjOFqu7+p+6FcqfWTGPPz4wFVFQwtQOlSDma7OOQJ
	6/IV9jdshs6zMmZBGp1XvsyGCJVKikLtsbOc+9fzpJHhFoVeXS9QlbGmc8DeNUeYSrhpcdvsb9r
	pYXxd46a1WskOPORsmeUUWwilbZn/Qe6CvAux2eoqiAwA8YxxsU3yAzSurSlU8PgK5Yx3
X-Gm-Gg: ASbGncuPg5sPqIQU3ljKfndBuajZQ1QtA5qQWmhEox7hgtuDwYCrNgRTnhyPkYsSesU
	zCM+EUMaeOCBrpg/O98I+5lrzXoGx/B/B4SmTGEgN1AF0/cuphZIcOu140DLdYPwk6pRk1hG+EK
	/TasqdlWMPnA5w5EBgw34cSaoHxWU6Gnn/eOFleAkWdMaGMRGAMkwf5U9VnRGLy7QmXP2t3qinr
	KU1vbrmsakTP/jx4VzOtYYfMEsaG2VI4hE+/2NKouFDK2C1UxPbsucSOrdogPQe+dId3Ao3kqnu
	l1+UkHLA4+QSxpN0AlUBRqXzIT/3955gZIKm0KHbu46e/GsUFO5/noXRKDo9RX792h5ovIDzxqD
	3on3GDG94mZdzId9DBgmikCc=
X-Received: by 2002:a17:902:ec84:b0:295:269d:87cf with SMTP id d9443c01a7336-2986a6b56a9mr192322385ad.5.1763455892991;
        Tue, 18 Nov 2025 00:51:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/1w2jno1zLyed+Q2GzLtuvbQPSdeph5rJVVJKuzROZehmddk/3K1qPE4B4EcyW57S867iOQ==
X-Received: by 2002:a17:902:ec84:b0:295:269d:87cf with SMTP id d9443c01a7336-2986a6b56a9mr192322055ad.5.1763455892479;
        Tue, 18 Nov 2025 00:51:32 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:51:32 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:29 +0530
Subject: [PATCH v4 02/22] drm/msm/a6xx: Flush LRZ cache before PT switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-2-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1701;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=U6hCxZZPt/0oNlBV0Loqbw+1ONR49vXzGV9kkJKQhe0=;
 b=C/pQ042VX0YsNIUePu8RhYDT4KrYwopA1aJuj7t79NKSGb6UQ5wtIm4sVjq3irgGDqFwMiXFh
 6bDOXlnFvndDYd0I6mseZ7fkw9MQk6CD38MF/bxLZlvdHiqWoo3qp2V
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: v74sc59Lhal3moqfX6YVk4QB7-Mxjd6X
X-Proofpoint-ORIG-GUID: v74sc59Lhal3moqfX6YVk4QB7-Mxjd6X
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c3395 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bBR9okFf-Jgdumx6fEkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfXxZQiyC4CxB3B
 vg0G239ledqOvptWqd0ZObL6m6I6pmeGszUWMSqEaN5XOAwBxQjQ9HieYPvE+qv9QheGIMXm7x7
 c1DycoUgfH1q0qc+2THqFOgKItT1GYKReDxtN0wB8qhI0VE5/nXweC3s6EyzUwtc+0ErUoo9Z2h
 YdHvACYDuHS3rwH3tEp43JlGuD4bHuLZBpn761fI4XdCK+HgyN3H+EHW8PaySoDLbOwxC6w6uJ0
 n3KL1wKsGrhNo2TlHRoUQfXAuBXMMnuDVCnd62RUWXeUnREnboqIYFxhgB6ED75JWhNlT4RsWMF
 2L6O2ge3F9L0KTJmS1EMHqJ1EDu/fw9zWegFW3cH1feFeZHUVdSlfHbGL9aAEQk8+yakzB7Ykqs
 E/nNKmSICb3JUlrXNklrW80X0BAguQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069

As per the recommendation, A7x and newer GPUs should flush the LRZ cache
before switching the pagetable. Update a6xx_set_pagetable() to do this.
While we are at it, sync both BV and BR before issuing  a
CP_RESET_CONTEXT_STATE command, to match the downstream sequence.

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 779c1da7c46d..e6393ef0fd78 100644
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


