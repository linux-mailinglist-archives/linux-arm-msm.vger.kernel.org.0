Return-Path: <linux-arm-msm+bounces-59471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 993DDAC48C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 08:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47176164D08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 06:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C591FF5EC;
	Tue, 27 May 2025 06:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XffPuxZX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777551FE44B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329046; cv=none; b=AY2gDpWqTA0+ict7Y8N87Rm5vZ79WeUH0wdYo50uLwNYvK7V4M5oRtnr5mlcXd+bMhVv8W/BBQ7ndSV7/gj93z52rOQpKQH4hFvKS17Xu3kGq0oiMNWwwBOeP+PnWdkWrwo9l+siWl0ZOjD89QuVqGSe00RKXUnihRy549j2nc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329046; c=relaxed/simple;
	bh=6ti6WK3uD8rSgx1+MJL0OTBiXFAh+a7/YuzQpoRdCak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QvVo0nwbW5+IsvXZOvujdWk+Dxu+7Q8xdblvkzNPNLFfZAX9ksWz9u5DzABnlj/sPyQBKl/rd625ALJ+tnJOJoCbxN/baR/jc7OlNIgc4DZDjirwHdt1dy1i/3kIuwY0i+V700NZobcheh/deos9ME87q2aCIBtNmd51BVcFerw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XffPuxZX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QMNRU2002689
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRajMmtFgaOC/UV0OjMPo2r2V0kfVealm1KPcyRc9Q0=; b=XffPuxZXV5ikZ74Y
	FE0lmCxHjo5s/ON9M906LHyjYA91qSos6chagS5LD9bgRB62zl3yWYtEcImewnz/
	S4wlFc/vLAnvfOVapph/himlXO/RPYFV4xg00rsR8xX9nFAK0yA6u6jCNKdwkYbX
	Yhp7AR3r/ijo4s7UNRRWSiCTi92E1iNwcAVtTgC9k6o4fseGGBVXhggt43xCn2or
	xrg2hSAQBwBmWXkJ4SwxkLqUF51hEJ4m9k7nQ4EnhpP9vQrrKYJGaGmCASfVmume
	QaHERKsVyXxFNQVJW49QLABQFu4wlSb2Z2w4MjHj4SyBZO5RV2JVtudl5MY1K5Le
	UqcMog==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u7dc60x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7394772635dso2079672b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 23:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329037; x=1748933837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRajMmtFgaOC/UV0OjMPo2r2V0kfVealm1KPcyRc9Q0=;
        b=L8dVOlQHjyJAhaHo7xNQd+5R8WJDC/E8L23rKEUKXgzdLRkmHePndXgxR8l0zwnddH
         rnerhi4FEQGDL4EDyFu0qbNkP1feziA2bd0LtK+LoJrsqnE/ccRU/7J6FvGWyEQw261U
         0cblyT4UDDb0PPMpb+HnyRNhxsdQRWXXdXM3Gpa5BBhP0+LZTuVmGsPV6sigbXqW+SUq
         A6nSDKtNuflSkKzeQ2WlL1jMKyPECdhqppG9Go7fa/VpCnCV/8xb6Gptt15nRhF/YvdE
         JSBimPNC9qgNR2Zn2xmzGLFRi9YTmq0zCIIZT2oOagi4b/r1UKXwzogDWGmiw8amb7za
         gUIA==
X-Forwarded-Encrypted: i=1; AJvYcCUXeHn27TpqLmIQosFhnLmjazE8n+aQ14UMmf1fi3uvebqbatdjEclXgkYqGVEvaKccKzdpTuIqbV43AoM6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8zZP0ZohJqeB9JAdo0LSGmPzj+uMdm0EdF0hChAo05mScUOAg
	l+vlnrK+YJtehqw9B+Nbe9RVWwCKIAdeWUmf0zrSSI63tpeqCmpQggol1giLiqBs0J7xMZ6blhM
	hV3tqwislwOIhmhJ+fLW9yd8Aed1hsGNH0Cc5PQXwMuuPNxNfpCnUpiJokupMJkBsAcA=
X-Gm-Gg: ASbGncsHFb+WFjEjxAEy6/my6xekMApO2+53y0w4n9oda+JtTJroEXq0hmOA/BQYkbk
	n8L3JOrt9lApyrLl5TZGqQ24q3ISjHVQn9A88NRnQCbaAZWAA83ru2XnwoQisw8ytmH21gzVrg5
	DXuHY315UUx+L6lUo3tcU1KTFK7UDb+tRnA+PJ/JzZPPHsZb+37DpfRMIuk3UlPo2c4uNjp11jz
	xytnMtBY0L1KBx3zzxYEZrL8erqKju68xS2OAk/6URumorj4ywUTVPsxPld4++hHvRgoBHF3Wv7
	ySDW05cgAS4ndIB+Q1iEM4kkavHlPV9cyzpQlk57VjmDl0QSPrBlpFCJsirYLiJiPCbY7I4=
X-Received: by 2002:a05:6a00:a94:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-745fe0589e6mr14944426b3a.22.1748329036983;
        Mon, 26 May 2025 23:57:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuN5nvo50ha0rqfJNyLS1nF/5MRTlYqa+OqS281BYZkxySrFxKujXSx05vTLcA79D9Jnj30g==
X-Received: by 2002:a05:6a00:a94:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-745fe0589e6mr14944391b3a.22.1748329036568;
        Mon, 26 May 2025 23:57:16 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:57:15 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:46 -0700
Subject: [PATCH v5 01/12] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-1-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
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
X-Proofpoint-GUID: BRVltJQO_dShH0RytjhLwLur1dx7-iBN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfXxTYFmgTbniSp
 2yt3xKlww6IdmiA7kK61aaoG8hK3UCQkT/4SrwGuZ6NkZPNBV9vJHjJlCBI3PGGsfBki697bVEg
 whSfTuuaYa3GpDjMBn7+9hKf1ivj9SOgxkQ+R8q+MVnNFA50pFsqiPp7Gx5nr5wh8Lcc5mfcm6K
 s5UKuyniYIfVr/GBGKUMIzK+Kx3gNvstV+oebGmLv1+oxcQyOmbkhlB4UvMYhxP6tPDIwikqTdj
 SyXiYJlZWR1xme0QM7du+7YY57Ohwbr8CYroGSKuK3q+ST/tuk8I8lW+NxlopjyaTmvVYNqtp8A
 ZRzM3JyE09tMtOY3as/PeMedqmRmCGXeNZrQqRCDicfR/IsKLjgeCLqM3LrN+L4KCUvikJOCidI
 t/S99oJg+Q6m5pGHgBkOcAH0Xb0xH1T0XvUmOolcb7Qe6a17zYmRAQIPcTfpmv/hRfjpIDfA
X-Proofpoint-ORIG-GUID: BRVltJQO_dShH0RytjhLwLur1dx7-iBN
X-Authority-Analysis: v=2.4 cv=Mq5S63ae c=1 sm=1 tr=0 ts=6835624d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270054

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
index acc7998758ad..133447f25065 100644
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


