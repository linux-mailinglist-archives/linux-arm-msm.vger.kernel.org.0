Return-Path: <linux-arm-msm+bounces-70020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70233B2E8C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 01:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01D6A1C88351
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 23:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9952E22A8;
	Wed, 20 Aug 2025 23:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+aSTJlp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9032E1744
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755733148; cv=none; b=l8fJzVwFzrZvRPLTT6wTVheU3x5G1gOfTMefojOKhh6lY2t/XjiE9gs1wODZfTM6FcwWSB0UTCxr595By00DwuH6T3vRBIYk/kzw02ko1TwCyzXG2DXQCLOO1b/SQkGnFnZ/aMXjrbyhVrdChGoPdAMETaljCWkTdxUCfA8Kq94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755733148; c=relaxed/simple;
	bh=Yh85rlS4nql62j6YKEnNgls3TAgynSOKcaoqO7FHo1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KEj5CGvZyXHoCVUl4FO96Q3xwyU2qD1SF6XN7CPfRX/IMs9t7wUws0aAg2MwWfigt8TvOteVOhGFSqVx3XnxhaPYRHLiKE5Di0bECZv63/hhREjpUPPIkXNkUJPviqHuOi4LGXEqjFjgnCLy63J2rXgg5GxKerPvfDjADYEwUx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+aSTJlp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KGjgp5032544
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2mg5AWjqaghC/mvjk6kLruWQ/snXAYnJwKVQhGg0+qs=; b=l+aSTJlpcqgFB47O
	XttTZfcw5KAmMiF4b6ifSUAAqIkzDy8gWM+qyIseFIQJsuRHF3Wp+hMQig1S/1V6
	tAjEOYDFxWdMbCD6fhpE6N/02Litm6JmFE5Tg4DOHz59S5216XsvTNcmCgrUQiOD
	qulZlIwmt7shhq7fD9btxdjYnsxEwk67PwI03fWFLWSYf8e9AFCHXj/6SHxyjvyi
	JsWVHGUIz1IfVHzbj49X15EQFPPyou+F5TGsiR1TH3jtMJXtP1tGhhAwH9CbMtBE
	aBJOFdc0kw+6kgQ0zqq1qZNnmrHkHDIkTFdMgPBu9pyuMt3qzxRJJQu6Zegw1JDP
	UawdiQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt89683-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32326de9344so815106a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 16:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755733145; x=1756337945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mg5AWjqaghC/mvjk6kLruWQ/snXAYnJwKVQhGg0+qs=;
        b=m7kWYUv++S0NSvIo0FoNm0W1tYtB9flTtU4Z+HP8CnIpPjTg7Cdgfs59K4Om51iOen
         RcPLeZ35Xr72UdySv5rz1q+3myO9bZE4UO8ygMcF2mecrYfd+r4w/R7XScY8kmuZAszz
         mkKNdf61WQGFkzuMmczBw3PiyFXJuMThfm3LDmN5KEbG2BbJpuDUDwYZV+MckMo5qE38
         Y5hgIDGOZKi32WOJC/+OIyTv3QR4fAMfliu3rAiuimAbkeOJRnm0s3MQCG5TWyx3kGZL
         PRXHZ7fQlTbpHkRdYr1J7Ao5HI/6gvI3OGjCi4vZd2XPo5wqMwqffpIiWvXlVuNsn8AX
         4DAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd8vlrPit/1Ii2yJH81ux0aLdWUttQtJ7BaYcejYyKfxv6xnVW5/TDQlexE0PFdzLGCnrU3yP3/6xF8uod@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4SL8JcRUnqphbWIo+bS4wlQCxD8kLs5Q6yutk9GtJv9EBmPtQ
	HGpFikp0mCVIVZ4aXQJrRJKNWNii4z4dsTAqPYuqu9xb/W/OEUY04LTTQlleayLMEUfD4za2mjF
	sTC4vP4kZL4nZ99mSfbgTxsiiqzfybGoCEXD6fRVxkYNy1MSIIII7s/quNBZ+7rxnCoo=
X-Gm-Gg: ASbGncsfftmWIdzVMOLymlorDOhAXXOl9sUwo/so+ynWc7IsU1hC1nJzw0q6WDYUEFr
	oLJJYAi2/EfkqeCDc6vvd4dwzmSo44p5QMUogh1aZBHvmiGGDM679UqQ7W1eJcbirWlNHNomQgo
	IjKkXwUfqcXSPVfPejYqhMSdrGmt1AVQyOnACGIptdH8V4B8SMGR3HXex78DtxJyL9wc2yZ4tgH
	tud5pYoAAaKHznFWRlE4bE6QaubnaidXdco7NeI1zrOPBmIF1W2BdkLDMaYzU0Qcf4Y8JC0o9Xm
	4IR7kaWHzfJr2m8Zm7LgI3S2zR34q4GtilVchXS19npY7sl8WcH5mfeHsYuePCYh6UwSrWt0SlV
	PY/QIhuYOmpskkRCMvRyNlAs=
X-Received: by 2002:a17:90b:33c5:b0:31e:7410:a4d7 with SMTP id 98e67ed59e1d1-324ed17a46amr814655a91.33.1755733144715;
        Wed, 20 Aug 2025 16:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXK18UdIY44KcNM7aaFlARIr1CMW3Y1H8zVdLrdvIntoDG55CLQtOdtAX1cQDdnrcWsR0qBw==
X-Received: by 2002:a17:90b:33c5:b0:31e:7410:a4d7 with SMTP id 98e67ed59e1d1-324ed17a46amr814631a91.33.1755733144241;
        Wed, 20 Aug 2025 16:39:04 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fbc711sm3233028a12.2.2025.08.20.16.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 16:39:03 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:38:48 -0700
Subject: [PATCH v8 01/11] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-1-7066680f138a@oss.qualcomm.com>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfXxKFiMFSthxdl
 aTxIWUy81NumMfiL/ZyNZUQ3NB5WZDIKB4SzSOyCrue1M6usfiMUZRgnqH37MTJ6ZqDUcvRWFnF
 6Rx6ywfibJYu/VEty0JCxkA4IfTTU18EFx6jqbsOFu9neOyfoLTHDx701TOqwnnXbLvI1b6D6NA
 ic74AOq8KYndQkihZLMzHir9Grd+VHZBktmjiMjSXYfnULafbTpNtv//YOk+HfBwQNy4wnbUupY
 tQkx9CIC+ay566B+h9Z00XZWRtAWgKl3le9E9Iysy6a96+z4a6txPFnSzREoYPP+grHgrz1cr4J
 s5U1zikiNzCSLjDLhO5JbUNLxN+3Uc3swYKpF0IhI9feEvD9LjcLXsHmS9B09OAPUShnFhWGQ1z
 TeTecS88WzlC6xUSYU2NNSyWR0UIPA==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a65c9a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: yyrOzfS2z9oNqRpCCTwAcZ4jal8QXQos
X-Proofpoint-ORIG-GUID: yyrOzfS2z9oNqRpCCTwAcZ4jal8QXQos
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

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


