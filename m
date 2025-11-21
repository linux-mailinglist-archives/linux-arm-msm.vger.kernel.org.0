Return-Path: <linux-arm-msm+bounces-82886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C47D5C7ACA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 17:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EEEA3A151F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 16:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6E734E779;
	Fri, 21 Nov 2025 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXXDDJ3k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVkqr1bj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC0034DCF5
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741644; cv=none; b=oLKbJd9qaKNFlBnaIPlYvBSg2MqdbrKyGUICwMcSl8D5QORcwLnyAXVL8O5cNih+2qLfcpxMcW91giNERyxn69FMV6oIza3YIbp355HxZX3tkEGTnAVr+Mm5oWzOUs7VTxNSK0NZBupevRgisuwMYuudrWwrOPpUwLiPsPMIgHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741644; c=relaxed/simple;
	bh=Wor0QQBjW7uFHNAj5exz5jDPpLBCWgszpFcIUarhCGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1qYGLqspQWF2wivuMNK686SrnKaUaX65tmGNlAIOFV36nceTsMFdSsiiwISt3x2/GI/+vlpnixiRwpIc2iodtOrAUATS0uQha6IIM5QNsNbcKcNPGtUYQIBu4cmV6efh+eJyJ27ysMt5wHrdFoXHYSbBkKj9wyi2vhFrXXzZcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXXDDJ3k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVkqr1bj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALEcdv21390820
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oUlgg1pPCRCWpWfC+0yvxR/SY3w+1Dc63OiZieGMkKI=; b=UXXDDJ3ko3ob0puT
	+Jil2HT6VickYGkFpBQ3gs9MGhKNU6vDQIg+5koKpnP19JyjLY9uzULkSsYyR9zx
	czLajeBswWBTc60MvibKWzcl5vr7s+fPome07Iq9a/kGwTehA71+8g1wQsX8eBYo
	1Wq0EXqW/lgX+09QOyC1N27Xrriwo05SWIwCZxLp9qnTZLTPG7jAzbegLHHbXumX
	eCknGuMvdrh+UKjiQA0ZA4MYDRauXZxlC8uWG/TZoNiBBvX4xyCZ+NP4YRn/LgbC
	iG0WExA4tRXCIuQp3Hkk3b5G8495zv/CBCjeWj6AbvNZl2skHa5IXmGgWAhGs3Iv
	lAHb3g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajb53363u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:14:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-882485f2984so49990346d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763741641; x=1764346441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUlgg1pPCRCWpWfC+0yvxR/SY3w+1Dc63OiZieGMkKI=;
        b=NVkqr1bjBheI0iHzxJK/K80qRMxjry6tJRopPW+jOtfWq3MjfkgSh9RM1MhnfG7EO1
         LaTDnLP5TlIG3yYM2vDWZZBDCQOcBEG8n/mt+EoSgezpq+DbcXh13uZp/70X92RnT4N4
         KoZAgEH7b7/BtD/s4vuiYEiqHSbHDnEzn8lZtqzBVtJeEGqz4HzxtbZeM5JhfRi9yGlS
         sOr9lkQ4lSkWtTl4Qvcb7xpw45bSLVqfEy4ogy91gJJ/ifBHjI/phcQCyU3u23sCwQvL
         9AAD6u5t/coqRkBOOgFJeAvya9UwGVjNjGyv8Id3r5FsOUbM7tzP9lwY8LIlqM2aWK18
         6VzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741641; x=1764346441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oUlgg1pPCRCWpWfC+0yvxR/SY3w+1Dc63OiZieGMkKI=;
        b=Nbzlom+09g80iVv/94V0WFWuEm3hGn5WhbrbuZrhKrLZoP1YWUxYBWdkkKojYn6qX5
         l0z1EmJMGNCkVVyJmyhSPvIRSDDaGzgzE24hJM5J1Nhhi/evBx0Y3goqD2OuiaWnqrm5
         CRWQDFWwXJbqA//uQ+A6MpuJKTQBmXF0nX9PQ4qzxx98qCOTJvHGtLKjueBk5Hfdzmqy
         ub5hS+8Lj3XSb6tCn+A6TNWBgDubnLYGlfE6dI2VD5bB+SgH0W5ue5+yRa5i16nq8O47
         x/ZKFxSbsT8Megsk3KiiHpu4tyB/tQsqdC6sk4z4TOt9o1QOdfNrKyfF9ckgHR+KGZdr
         DDwA==
X-Gm-Message-State: AOJu0Yxu0I1vVHAkl3RAZEmETxGQcipXUOIWnTlloBlY00KeJ9cFbxJp
	1itwEKkrOjKPKiJ4ggLd8Ju6oDu2Cvbf7mK4gzRuf7fUUHzLZr83l/q9jDlOuTbQ3jce/BBN/pn
	zQ8MDX7vBlQaMTJQhieHAcLss0E4CsCCGB+oQ2owm6WDah40cVpeKWLLdJebnd+usAJP8+RAmVq
	hV
X-Gm-Gg: ASbGncvSx7iUGqcvw3NXPGDbB+5/PUIUbrtADTwCW04Tl2g587lDkIRV40rHn7KE7uP
	fhfFEy6Ro+chxdfKDfDhdhU/xdUQRQcpKQHUhpFX+gJbnkdx/5MyZ53fR00X5gC+cZ39n2tEz3N
	zIjC/1qRay6hxi1lCzy1J80vVcf3uIwd49Dz02HwGJHkOCbQ9UWe6pQd9chcwX1V0fK3FLrW30O
	WK5yqBePyrVVPq8360YOxPp4hi7wkaNrHSD2hM4GefjYUQWN53D31ckWceWtmJOb/pbHryPohUl
	mBok05jNgIdzqmb6jgObpBFpK8R4/fiIPbLvett+qFJ/clNQ6h4VqTzG8DVFyHK1UJfK95SS9hd
	rY2muM47bmNK6Pkkhyh0OYbpRee7CiUnnqOoGBC2Qi9vpfpQD0BXY4OG++xHtmIz2ourqcyNKN2
	IrSiyAN9QOXH0mI0jawzpgcco=
X-Received: by 2002:a05:622a:1b88:b0:4eb:a24d:8c17 with SMTP id d75a77b69052e-4ee58857093mr42765641cf.31.1763741640726;
        Fri, 21 Nov 2025 08:14:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAIs2qyphslDLXjyugoIM1u3+WnSU6pjdnjBnlzJcuugOQIwBcaGVpTnyDZE8HITlUANo9ZQ==
X-Received: by 2002:a05:622a:1b88:b0:4eb:a24d:8c17 with SMTP id d75a77b69052e-4ee58857093mr42764931cf.31.1763741640196;
        Fri, 21 Nov 2025 08:14:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db756d3sm1752185e87.14.2025.11.21.08.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:13:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 18:13:03 +0200
Subject: [PATCH 1/2] drm/msm/a2xx: fix pixel shader start on A225
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-a225-v1-1-a1bab651d186@oss.qualcomm.com>
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wor0QQBjW7uFHNAj5exz5jDPpLBCWgszpFcIUarhCGI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpII/DDhToi3FIm5e9ggO1WO2Eeev6bAFVK9fD/
 vvDzsbiVhCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaSCPwwAKCRCLPIo+Aiko
 1fIyB/46mSe2/PTw12rhQ0CKyh7vD1D2EZAJbZBsQry1nQPNa7OaMm+VuzTZZaweeq1mSbyoVES
 F0B1HjpLvOOLhyh6HrhyVVQVburZFkT4TkoDstG7xydvnW+AjuUu6VAanFzxfaQLR1If/BmEGvk
 MH9Ea/9ZCbgdYupVpbu1QRMQfQNDLCm/Gt7oWe1LnmgV0YFgC13w8M38x3VmR2vpvtyaIhfdoB0
 r/4rr/tSepRlBFIvz50zGGVyjKA7qMMtrY7epkmaXCu6SnW1r0RA+lJrxdndEcxUmCP6kViAYyz
 sx/IDKC5n1BNPCFNeDJCdGKZH3XpsY0N97sFhU+9Q6dSZLrC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: H59WA_E_nBwALX2-XyHSq193EVp3pBKC
X-Proofpoint-ORIG-GUID: H59WA_E_nBwALX2-XyHSq193EVp3pBKC
X-Authority-Analysis: v=2.4 cv=Wugm8Nfv c=1 sm=1 tr=0 ts=69208fca cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QU57kMg87Go_-yqhfaEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExOSBTYWx0ZWRfX1HRiWgQNcZZh
 Oagjd2Qbf/Jt/BTRHQOrJo862WruezMN5Zgg/VNcJJDN7nVbmsJCfRrjYp2zvq7giwcZZ4dlEti
 SbiKNqv7BkHmBkVFhlBJWGhNR6eP8NsdV26cAMN4YXtx0niUDPwRSh8nsVISC0YDvflqNCQ7u6r
 hgqvVQJD5WdLKW8rBfBJWHBedvdwKWZMYFLQSQJD7V8M+GyAEE5LBXIW1aIW7ZaIOIYqHdJa/Vd
 hrZpy3GljGj7V5WfGqSEu9Kxog3P9x7NZk0ILG1F32jSC6b+j99wrXk2OUqIjmpzbtiveK7yc+k
 JRDc1aojKpHpDN2qc62NC9wwp5pygi5Q1FCLzxSy1AQ1rENFhHQqwCceAGTIZ2OkUWaCf3oEqIx
 66UZIOV3HD5yp6hx4WtlnqfGi0QNag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210119

A225 has a different PixelShader start address, write correct address
while initializing GPU.

Fixes: 21af872cd8c6 ("drm/msm/adreno: add a2xx")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index ec38db45d8a366e75acddbacd4810d7b7a80926f..cdc24b3b7b81cce6b01aa14a74bd8e512cd8be90 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -77,7 +77,10 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
 
 	/* Vertex and Pixel Shader Start Addresses in instructions
 	 * (3 DWORDS per instruction) */
-	OUT_RING(ring, 0x80000180);
+	if (adreno_is_a225(adreno_gpu))
+		OUT_RING(ring, 0x80000300);
+	else
+		OUT_RING(ring, 0x80000180);
 	/* Maximum Contexts */
 	OUT_RING(ring, 0x00000001);
 	/* Write Confirm Interval and The CP will wait the

-- 
2.47.3


