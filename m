Return-Path: <linux-arm-msm+bounces-70372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00840B315CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B6283A2DD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0AFB2F618F;
	Fri, 22 Aug 2025 10:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGBb3j3L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCE52F6182
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859781; cv=none; b=aEOxX5MSOc1OP1MJyOYx6eATd+wcx4vX6UDQmMkbq34O15O8S6Y7WcTqA3q8dS2HIfy1u/RwdFjrf7Kopp9cbubuFHkEt9OInO2diKOZ6SVPVaYJ95wmhb4CMH19U8MVwowK8lOQV9gw3XgjXIrsDFIT24LFkcFje+umnUTLYJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859781; c=relaxed/simple;
	bh=ZKAlgxst8/m0craC1V7C11GB9Q3nugJsZw+QLPl6edw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qCMEWoB/5u5dW4TGj9v3TCG2zLVvE6Agj4KQ3j6T9Nj8/t/E3VpumzEt20kZ9VBHdJeQiHoWchZO31Ga5yWcGih7ZE0zCMdgHVW8g8z3Z4j0yj6f6DZQVpWwFKun4CtxFLBNZyCtIjbsku80MFd1v5fM9hp5iKp5CTbXabvmxnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGBb3j3L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8ULFP021784
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ITmsHBmmXeJ
	H+4FSSoYGod19htesPhZ3ltd5XDG2GGo=; b=pGBb3j3LEe8rzER7Oik/zqH0Tyf
	jPeT1pQ8yT5msGcifOR2Csn8zL0noadBg5zvJ2F5LfdCv/OZkEAwmR7mLZmhji8t
	j9iMdBPR6GNlRlkyIl5iL2AVOnT9BR0LJaDFzhs0SpMzl/v/jjS3/tisWOs2YwQG
	mdY/TQTJIml41iaymUHIyF3eH/Sfsr8XewrggE0M6jZZquNlI5RiZ3h2FscrgnAe
	2Ow69qOiGHRK0/gqda5OrxsRPRybcpLo/ZfQvW7dwGWniDWeMOL+8ZML1uLWkBVy
	HfNSyvNfC+Ji723BGvCsc7cDLsew944Hj96nch15uHCfhKD7tMTt3l4UrvA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a8yjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d9a65c239so11231786d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859778; x=1756464578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITmsHBmmXeJH+4FSSoYGod19htesPhZ3ltd5XDG2GGo=;
        b=IBun1Cp2M9id21wW1z+LxIlb44TqFwzN2hQzxRfz/FFFR6CpvLnCGYJF6V7Gjzplbt
         3ab0nn7YGmBFiwzX+T5QwvO9ceHQC9FWJ6Lif/AE6u3lLg3r5PuXTEf6f6/IRcYaCCY4
         mir6NiX4Wfi/ilk++TLT68Z1EVA0W8XI5NJ3/8HQxdxdCYYKI3GbcUyh1S3idxxAU81+
         tB/PuSFXls6U7VBwckUWz7V4+PasoXKf411PG+D5r4jND7glgAnsEe6v4YaCttWms58I
         FTo302kfPGqYh2qLu8ZVO2byGyDkcyn12Ie6eDF0YhAkp/FXHrGIVaawppfcbA397Onz
         bwgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8z8IgGoyPAdlPKAmiE3LZ3E6DRDTnK2RJSPmZ6olZKgGvrGCw+cKMKj7qb3fITrWtmYay/n5WPUxP30h+@vger.kernel.org
X-Gm-Message-State: AOJu0YxnNOVHCXnXiOFafRCf+su9hQpcZokaPVDDEA38XPH3fmZxtDlN
	ig8MBv4vmVd3F70VxCYV4qAE22CMn8E0+wAgzuXxpPc3fK9bEB96TpmHnQfxCB1A4IlNtFDrA5f
	+Qj1czkn0IkNQOgNYXLr5MEuae9YOH5JwiqMqdrDWYrpwzX523640+l/8ci7wCIA+cour
X-Gm-Gg: ASbGncuphPcIAM1ks78cIvXngbYubQrlGbpEwaZgf1fwVawPqvav2G00XZ5da3TgD7N
	t9LOcdfJrRisZc3P3hWsNeV/nQNGv23pS6lOJ93E7R0ih1FH4+SLsOb0k58Al7AeoSRYBd1HJEw
	PBBMqvH7+md3F/0kbX0q07OI5uMDloJ8SB0xsYQnM3sGlY/Cz2CyXlwqmWsoC0i6rshqo8U3r5q
	hVa78PVG1vxGCwWG2gjxL3p6Bn5oBtrcSk6qVnAncas0JvsZpvlh23JFyuIKYi5fPCrd6tET5Ze
	PGAcZL9X3GeTW4/Q3McaYJtmATZQ/q+V7u6oO1fgSoqcaDem9XSwJg==
X-Received: by 2002:a05:6214:4505:b0:70d:9951:32f with SMTP id 6a1803df08f44-70d9951052cmr21887316d6.17.1755859778156;
        Fri, 22 Aug 2025 03:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFriKc6/N6ckQKdexpGrJyZySwTpjJo/jdMFtdFzr5N1m+sNgwNkRxbxRR0ZytSIN41749mWA==
X-Received: by 2002:a05:6214:4505:b0:70d:9951:32f with SMTP id 6a1803df08f44-70d9951052cmr21887016d6.17.1755859777555;
        Fri, 22 Aug 2025 03:49:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e4249bsm31367155e9.25.2025.08.22.03.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:49:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 7/8] ASoC: codecs: wcd938x: get regmap directly
Date: Fri, 22 Aug 2025 11:49:26 +0100
Message-ID: <20250822104927.2621866-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a84b43 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=AeW90Tct3s7Q8B8mPpwA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 1vXeQkpMbKsgL2wnMga0jtedzkFiB4L-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxKInzls3s41H
 Nzg7yVIcf8llaQ/QrUK5HDk0/mBMOf6uPbgGOmx2dW49y9mKbXoQJUsTB5ieh4J+KpgzKhXJb4I
 EQxRCcVqdS4lOkGfNp+J6B32mIUaJ7Y0fA5PfKqnTVJ3Np80iK6GPFMb0+BtfzB5gL2KOUemA2k
 8kOu5FG6vXyDzvJggdpwN+BNEc6CVqe4u7AOaul7nbGpPupR+/7ltQW1MonBox1X/PJjXtB8bPu
 xF5+Zf1DmZSQDMsWSx08vt2YYIPKGM3HYbzoVFPOKbRrRsCezvr9b/XryaxEpAUuIxiBybWPFyG
 f2PDTKpEh0HZ2zgiqaS6WaIzhVJyozjRjc2mBX2nAHpqTYBJTnkUJtKawq9eEWLbyzaOoueVGUf
 pOIJKasbMgtPF9b/yKiNcpHlvQx9HQ==
X-Proofpoint-GUID: 1vXeQkpMbKsgL2wnMga0jtedzkFiB4L-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Remove usage of dev_get_regmap, as this its more efficient to directly
reference the pointer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd938x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 678e4052a255..70302de904dd 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3388,7 +3388,7 @@ static int wcd938x_bind(struct device *dev)
 		goto err_remove_tx_link;
 	}
 
-	wcd938x->regmap = dev_get_regmap(&wcd938x->tx_sdw_dev->dev, NULL);
+	wcd938x->regmap = wcd938x->sdw_priv[AIF1_CAP]->regmap;
 	if (!wcd938x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
 		ret = -EINVAL;
-- 
2.50.0


