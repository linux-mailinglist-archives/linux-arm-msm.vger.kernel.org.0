Return-Path: <linux-arm-msm+bounces-71480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 384FDB3F3E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E12F4163D0F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 04:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20A32E06EA;
	Tue,  2 Sep 2025 04:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QqOKYmKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0232DF12F
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 04:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756788976; cv=none; b=NxySDxJnkBGKIwsJPUAnioNtyQBGQ/y6Rk70+xIITvILYm9PnRm59x7bZQFZJMpFfDvjymLy14KfAfYFWJ9xaxwhlJjgsn0Q8WP7DGp9pohxWwM5i44fzOGlqj4Lbf/Rx4k5jym9wNcEk/u1IV0Ej0H6xjiHw6gL0a3J46r6lbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756788976; c=relaxed/simple;
	bh=Yh85rlS4nql62j6YKEnNgls3TAgynSOKcaoqO7FHo1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dq17VKDzXOk53jsfmpxerLp7LTKKLkCJVfRz4MUUYFMaJ+KFk/ZYC7qFdSoC/WSmLZv2uMphojIXQDqXsyKNLYuhWrhGcemVSGVjdAUGzym8czb6SZQA0iWlyr5+LpyIxNKN5MWspkkwbl6FZt6TWGPNSpodKTL6pkiRqVbT+wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QqOKYmKe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S3pC030065
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 04:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2mg5AWjqaghC/mvjk6kLruWQ/snXAYnJwKVQhGg0+qs=; b=QqOKYmKe0XQ+cJer
	S7yxq/GR/a8nz2SpXqpPS7AHVNwRYITkRQoGmkfvB/adUqPOkFq+yQCKXN/giXly
	8ExalnQXrlVApG7T/ZJ+3YQl9jeCmpe0EEx4pUZkjk9uAIexpTBlq2IW05Ld27GU
	7GEHAfKwBSnzfaOd0hofr9x7tam5xHVceVvAaEBO/aDzXc/QxR7qkLjQkYCrv1cu
	wd6xto8mmM1dLy9UV9y+ZNpS7meuP5zX2gKpulzdYyXWAsz4UQLPl+f+bFRIiJtF
	QnVcOIAXlZwX5QpuYE+a04Od7X/cexzX/sN94rYVgs+HNDv4IB7+bauLgSw1OnIv
	+Htl1Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy2b7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:56:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24a8dcb3bddso28234485ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 21:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756788973; x=1757393773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mg5AWjqaghC/mvjk6kLruWQ/snXAYnJwKVQhGg0+qs=;
        b=mcvBKRrm1CvACIPQ2dMU6GUCLzDyUefQpj3HnPlg1m+t/DT63ctzzXlHw52SLQ9i2G
         8jAExj90E7xJpUzF/kjMGn1DkMD0/52RY3NJq2jWcxhf/4DBBzjflFKgd27p3tUvcAIf
         hdgkayXVgfnyR2uCuAey3jpQquBqOfj65c1Z2/hx2KgY+G8wVzoN4ftvc7t9ALIO0VGm
         OBR+axOEEZ9QsoJwzgxqGpvPosSuuOTf2uqhHOwqj8nbFegO3PnA8qlGD75HoykFUZ3L
         dTh6iwTHDDlz7UV8RTVA33MPtql6vsqmKo/939vUBrWlHHfP+5ukTGlud59C7YR4qLtK
         c3kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi6igc8lxFJ0BpRBLmLd8le94z868id2BqoQMA8/VKbjqAMf3ZROZSHjULLr8hAZZDLSE+bxxZtaWE9wYK@vger.kernel.org
X-Gm-Message-State: AOJu0YzIiUdIELYR2qmPL9+YaZDO0XLvga32E4N6G5/pOwFx8wp21TjN
	LegtuOTz6BpKFCJM2VyPgw6NRc35UkEc5V3guHGA72/LR7Bm0d71apCRrZ/xiookjprD2nJPHe9
	xn07lZqdvy7hqrdcrYOVVrGUs6RcLLK3jC99q9n3z2vwY8ncd10zONcd4BW4ZjSpECp0=
X-Gm-Gg: ASbGncsFW/3xUxdUdU8OcgL8vsDPAycX2BvSEezk4TQJHqFyNWHb3VTzl8YwNE37US2
	vL/jUoa53vj4TI5P87PyaBc/dTDg22MuYjmJnir8agkT8e1EdyCi0EpiOWgnXih/Dwuye/sS0c0
	IEuamUjfT4eTkcOfX5s9x1NGjKI1a+tcZyy0wux2piKI4aIxftJhM5ORz2mRUkTK9aZGPpnLyMW
	WELHxIpPxYZoK+HKv+TFgFHnTIWGSwj3FMuQuda/clZPoqXHL0KgqORAqviPn1AgI90ykd4uBFq
	iGiDA3qNK9yKwMBm3+V/Gd3sMKlcRrUw3NOpKX9kzdfBR5A4CMVcUpmU3pbefarYuerpsO2xCQ8
	ZXZLZ+9+QBq8rJq9d4jfOWeM=
X-Received: by 2002:a17:903:384b:b0:245:f7f3:6760 with SMTP id d9443c01a7336-24944b20cbdmr121474725ad.55.1756788972835;
        Mon, 01 Sep 2025 21:56:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvJn27s/WB6VKXSdt4GGDpr0OsZic3u0pMEKyv76QDPWFnyOWUl96Fri/gUJz77+TBs2FX6w==
X-Received: by 2002:a17:903:384b:b0:245:f7f3:6760 with SMTP id d9443c01a7336-24944b20cbdmr121474415ad.55.1756788972346;
        Mon, 01 Sep 2025 21:56:12 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1f30a63asm1795345ad.66.2025.09.01.21.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:56:11 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 21:55:48 -0700
Subject: [PATCH v9 01/11] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-1-a2af23f132d5@oss.qualcomm.com>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
In-Reply-To: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b678ee cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ls3mvn3LxhJUZjTsQFa0lGCzUEk507cN
X-Proofpoint-ORIG-GUID: ls3mvn3LxhJUZjTsQFa0lGCzUEk507cN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX+xpoTCEp8YYY
 CqqQUmL0hBrQRQvTUjdFS4Ajp5mKSGG7xCv/mWFlf9e+ep1yz9UpQjBewmcIjy4mdS/x15eQddE
 n+2y7IBQw+MG9JmbCLVHcgdAhkkS0tTOO8v4dB4wv0Wd59Q4O1DU/wGnO/In/HTuQKrZCbnX+8H
 pESiZa5Hy2cwnqm4Tf09p3DEttvYVp3YYsbSxTfksf2l1sWyDZA2CPU04AWxRGPuEFs1jCLU6cx
 93ZeuCfqtp/qOQqxCcZ3/rZrogcppAM0gnjgzBBAm6cShf3m+b0wPjmCfEhTpNsaGpSGiVz1k15
 85uBhfMtqxQtWMUx2dVKx+oWONfJCAxsIewecmff0Mrj02BkIo8TOdN7svgtEiqZbxA1SJV90G7
 tvFegqvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

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
index dcd40c26a538..33091aa21be0 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -852,7 +852,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1


