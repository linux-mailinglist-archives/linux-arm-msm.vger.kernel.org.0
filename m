Return-Path: <linux-arm-msm+bounces-68851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65325B23D1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 02:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADD59189FE6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 00:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DE014EC62;
	Wed, 13 Aug 2025 00:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5JbHF57"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6676B27472
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755045425; cv=none; b=bY9V8SwfXOk0pYEVIWoLUqq/OC0AR6SRgdJqEGoN+6rdP3ynMCubYnaSa6ug6lGwei024oiYeB0/k8alpiJZu+ytjpFFgBjFxF/eocj97oSwDg9a2zQ+vuzIHV5uMuppJHnZWCfAY/6zenLorQpU/GpQZnaSoRjjE4aGQiYsOBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755045425; c=relaxed/simple;
	bh=oYBmYKyNuJgx7AjR/DtMe3YDtEmf5yTSQmNY45/h+Mk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YdUxsnTx7WLtSvt7OPA1DfB38K/XYES+7ZprLG+hS+Vv1c3vMBAdC8hsfj21qtpNvelS5e+R++e59XhQjepBvKuhDUbc6AADdJRiKUqioDnmxmRGD+mLBPr3XmxohSUz0dlLQeZPMSIIz27Bcb09lmC6ZG9uUP97+zDcZ3oWF3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a5JbHF57; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CK2I6e005918
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOcaZQdsCvBu0o12Lc511EeGDT2I7mkwnOLM4V2+Xso=; b=a5JbHF57vjtIG3Y+
	W9ifcik6dLYxdmud4XMvyhpXMtAJgEnVfwGGmbO0UtupfpoDEts8WtUNyKtyMU7M
	1xnLjB5lAP5sdW2bPRkFPZiEyZtjmPSfggk6B1Lv5bZIoBcgodGg19V8hsJgN3am
	0y4pxUNbeJJZDZS4DIWqA4D0MV2OCrxOX355vPVIHcyMB1dKNpiPt7xfNLBZpe0t
	40yumk4FYi8PvHDmEgDJ8khzdpJmnOVVU+OKEQb4VH8bWIPp4XpobsMotIl8tMEh
	4BKi6qJfQATmehkWHM16/CEY/kxVwkXsS7Zoqv+2idXUi6VkptW8BluOXGMqaDyt
	7qTQzA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjnqb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so12674067a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 17:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755045421; x=1755650221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOcaZQdsCvBu0o12Lc511EeGDT2I7mkwnOLM4V2+Xso=;
        b=mTLEtkXUhd8RfV/QKUnafWA7Xdb+fLIByawDG2JFlt2q4+cQDh9/SI6hx2zAwrq/J9
         wvyj/48dFtvAqIeSh/gfub1fhpuo3/FWwoerQL4iYANm12Z8RFRJKlypFGshKNvaATA7
         DivCJDt45kR2aY3wKFKYSxihE+9KDtpr9Pi7wzUHYb0OJLsOulpmaZPbN5ezEwtKmkmS
         ZzI5Tc3FFQXaOcBdBWgz6JRvFjC/DowT/33VZ1oInh6DWS94epNiAYUAsiuZ7wI6ALXD
         G5DmBEgzAv34OlatHbFdVzN0qCWgvK1tfQcLrTzpeMUkCddmx2F7xTVTVseJf7/rgUG8
         lT2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVowTea6C1n7zULTj/eVn+MiOvCNk2eLbMfKbqNNnzKG0GhmF9H/YJntRimsG5It3rNM1dHcsooCLP9KDVB@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3A7IUrh+OHCBapYjpOcsf3zSBiM2JKehBmksidNOFnL5pfex
	A3ZRhUhaOiWMlfmOkTwzfx2IWcEbIc/xSK0+Ihci6QyiND6WKKMApradi9x1fK4tgy4OKdT98p9
	ibdw3mU1JiTur4Yhs73qtJgXzNrob81J5lqI2rxTJeJpF4bv8P8FYo/wbZ3JvQUJYQDs=
X-Gm-Gg: ASbGncsltY7MbtBWugMD4sUBHe2gfvEl4eTfwI2TKk5YzK6j9NJGbpr8r3FyheRq7EB
	upyeKj3sq/UOI2Ia04ynROwrkp39OCKOk2S1LBn1ei3MIj7YOuTTe+WW3QNyvOc8Qa6WHoPhMBS
	kPTX6V04lIipybQPbgFFO2YQtrsypzGsiBbmAYStwRGQcGSmKg0eGdSO8GPTDGzUqVvyVACuyKd
	P83tYDdzlOYxXZ3EQYM6mKrq0YwiPvSWuCEzOJ9A/hZ/wPxZwHLybTvs5cRuAQClhroVrOAyq3M
	/rzsVWVS5tm0qNZJX7h8Bhd6BxDjUXDVkHj5fXVXc410W0Qp8ttq0XbRC7x95i02La0T4cYZUYM
	lI7bQTFUqAgxMn0cFh7kQRDo=
X-Received: by 2002:a17:903:2290:b0:243:3c4:ccaa with SMTP id d9443c01a7336-2430d0d4d45mr18426315ad.19.1755045420802;
        Tue, 12 Aug 2025 17:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF98zX42RSwWdppbMzosqG0TdHr9UoXTpkldnh54KBhgrVV7+MPU1d8WuN43VIfE3fGM3u3QA==
X-Received: by 2002:a17:903:2290:b0:243:3c4:ccaa with SMTP id d9443c01a7336-2430d0d4d45mr18426035ad.19.1755045420387;
        Tue, 12 Aug 2025 17:37:00 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 17:36:59 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:30 -0700
Subject: [PATCH v7 01/11] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-1-ce7a1a774803@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX9I6hLFzzJGO/
 UGvMwoSmj6Gv7KtR0lXlSwUDz64a0TpHf3TM0ka0sRE98o/iYHcoKP17lc+Kl2WzfcNC9Im79Zg
 H9zyp9kO5yNsLuXPqHNc/mqylam1dRP7hC0TOHUGlouiVY6d23dXKiiACKQnOHKTG+IG1CdRotO
 cHH7cT2eD1+2O9r3kQ8IitEM1bFmZley/NQrWpVaTMlwxm9tdthCJMe1vjTEBvGO95tTWThwK9N
 tiUbbErdqecaOQhU3lLuGJzS7leNvP2Tuy7mB4rwvNHa0CK1Y2VD3hKnyCkkCQ37Uhsms6WXLpl
 0PCmX1Z+xQOakZWG/oPBFavqwT50c+UCkQWj0+E3h1vwpM9eQlM3B9fBF/HnIQ316X0E+jaEjiI
 NJ7qJeuN
X-Proofpoint-GUID: 1wRyGxV_Q3OG-UWVgHlir48u0P7NIvRt
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689bde2e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 1wRyGxV_Q3OG-UWVgHlir48u0P7NIvRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 944f913f8592..e47a68d337b4 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -889,7 +889,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1


