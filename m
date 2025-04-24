Return-Path: <linux-arm-msm+bounces-55307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 207C3A9A80F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9906F3B8DDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9B22222AD;
	Thu, 24 Apr 2025 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MH9YFkf2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F8F221F28
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487046; cv=none; b=LxNqcWnghdsV1lhjjC7XPYFmDIrTkCmwwW2QTOxzvAtXCSwrw616+OpwAjPkLAn3Sz+L7CLTGICJiW0rAjNIy8sOwwkPY4wf0o783YFb7JAR7T/JsUpx+oRaqES02NhgEt4RsxVV+6DRdYni41T4oAY3fWWMdhQAFmjgXsJmA/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487046; c=relaxed/simple;
	bh=JiostKcDkuFpLVkmdxK7KpMiLzBVDWiqnJ02K1ix9Zw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XdG/RTURK7YpbMtcPXwso+wntg0qD6VlpwPN/KM40UkhF3qMrrUDtTUEg6ynIaxBx4DjHjp7ZssU/gIGrv/r22/3uUxA6qh9t+b+r0IEplURwoAR5cMZtPIAQPYqB2QGXnhzAn1/+NxvJ+K8IpqBvtusBJBJj8mAZtJWzTexqkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MH9YFkf2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FPPK029147
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mdFKARTvqJRU85VFGASTX/
	BrjRGA7KGz7eyZkROJh74=; b=MH9YFkf2PNBe1nCT64lYHUMC94AgftSO+8aaz5
	ysRVGD9YRrBvM89V/7o5eiGq0CWxJmwQARgAgdMO9Gx/slZUP3iiEQAvSQ00bCZk
	gJXOSoh5h2qvRA5trcj8OQT/jM151RQB3u+9plb6S+06J30Zez5ilSrPT8xn/NEG
	REsKn+by/DDB4TC1/HiWnID+XChlxKXwy9RN8iQ2Tz1LO8Xxf2c3JSuZa1Jb3dkr
	0gLLCwhEUV3b1AajpyrrQ7nD6/tQRmrg3LA+VpWekKkpC/SX26RujJPbX/DJZIeV
	yobjD6GSLKltH5CZtuPM9rOv2UgCKZxrWPLkNaKEb34hSdwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy4ywk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54e9f6e00so296144385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487027; x=1746091827;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdFKARTvqJRU85VFGASTX/BrjRGA7KGz7eyZkROJh74=;
        b=layvlnpSVhu+JqGHT9es6mkLgJOFuD3uXLd2U/sX5XEbUEtHk0Ix7aMnpGeJYNp3c1
         YrrwGtAI19hKiBeatHrtM2BOlfeqducRS8qiA8BWzUhJOrsBz8h6XaHlWuVvspe7LBdC
         5K/rjDe99OwLiS2EjnPcnXnKcRPFOoU253JFzCTGfiX/JXj5A2bg/yTjU2YOwgft5kTc
         r/M2CRbnIaAW4d88eNSOoY/blZi84QnC1OmhJVNJAFkcYSmWm++EexYXEgj8D4K/mMe3
         FHSbxxOdBt1m8Vnb4OPkDNvzWwmK1+VnWnRcoPTNoTICFUAoHb64bMFfQHpGkqxr3h4s
         WI2Q==
X-Gm-Message-State: AOJu0YzQynBLkrHCcI6LiiZq6Lh+7o5KEuozgScOMfZ6EhjA/JdQnH6x
	9an5dQ2i2XkKucklY7vueB7oYHU+Ur23S802drTUzN22dXZgiXeNeoRFIj7L4HX7Mzs/9JW+Oul
	u0gp4IdjI5rqAh13nap3u7BTfaDb5heE9nQb8FpAHr63YmiKx82ra8dCSIHbe9yHU
X-Gm-Gg: ASbGncve+KPPSqq5rxl84EV/8PWTFTH6regQMBzYd8yDZHtC5FaVjDk5g9czr0+yONp
	mBLWKr7J9vJomAW4mupi/mcCvCYVem9q6jmoo1SNn1K5uiq+WGItRAZK+tqjMzKl0w9Ek1cYa4O
	Kxwxos3Xz5vj7vHq7raX4qTyflLGFuSNJJuZHbPPhrnWi2MO6GiOMWLUeeTqfHvaPQbSqcsDwWN
	xeGtYC2Kg87BXUMma45bJwaC0V63bX0cKzs3cvMfTZyrEONmc+veJ6cyKChWJN9cbSuHZWT/9VB
	UF9bbEeK9L/F1YcSNfe9kHzsjphnIu/2/5TMF0f8I/7kD5d1IPRc826lNWr540wysluIPMCbPmH
	yK2G1/S4aWVFcaiYxfvBXrIvp
X-Received: by 2002:a05:620a:d8d:b0:7c2:3f1f:1a15 with SMTP id af79cd13be357-7c9585c3627mr231812385a.8.1745487026885;
        Thu, 24 Apr 2025 02:30:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi+hIk13tP7X3JFysQYRZL9wzlB0PYuK3MY4tcZkB00aOZ+nhueoTS5+WGo2UG0/XyfGtNZw==
X-Received: by 2002:a05:620a:d8d:b0:7c2:3f1f:1a15 with SMTP id af79cd13be357-7c9585c3627mr231808085a.8.1745487026402;
        Thu, 24 Apr 2025 02:30:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/33] drm/msm/dpu: rework HW block feature handling
Date: Thu, 24 Apr 2025 12:30:04 +0300
Message-Id: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJwECmgC/23NSwqDMBCA4atI1o3kYaN25T2Ki5iMGlBjEw0t4
 t0bBXduBv6B+WZDHpwBj17JhhwE442dYvBHglQvpw6w0bERIyyjjHKs5xVrZ2fcglxWBx7ngnC
 tOAAtShTvZget+Z7mu47dG79Y9ztfBHpsLy270QLFBJdF0RIhmGpyqAYzSWdT6zp0cIFdxJNk7
 JZgkSCylELIvOGSVdb79LPKQdlxTONA9b7vf9f6s/v8AAAA
X-Change-ID: 20241213-dpu-drop-features-7603dc3ee189
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6188;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JiostKcDkuFpLVkmdxK7KpMiLzBVDWiqnJ02K1ix9Zw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSpodNnZJlAQgkh/BQjO+u7z3laPoN93JfS0
 8WDe4JNGh2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqQAKCRCLPIo+Aiko
 1dJEB/9AAt/j8uVEKrAglDLjeuHt49Lp/OZwd2I6iRCvII6no5twwQZPXOt8iV3UBbG0EX56+Xw
 tZliLyVS5xQUh81mBdVopL8VpjrWQ/LUI1e+61qm6iHwUh5n1PAVhK89djM1UkMpOjQi0jljdDm
 MgTViTwylecK7eXZtEAdlv2nWhcQ4uucgofk7hnjTybB1Xl0HExsBoUDG729fLTqz1wTfUd23ZS
 5QGcPWfQqbMbmQXr+osTEIbETws7m94p79F84sLLFx2zUaaO49kJhKBNQAfdZzg+an3mZxbzQXC
 fS9Grki2yAjYHHzs2ahEksXgzr6Jv+NV8FeEU+C8P07iFz2z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXw7uoHjMsSYm+ ys3ANZIeX63Wt5eKhGtSFrqXQR4Qw+I0WWDZVTeUTi84kpgXzE+lwUcUurbwLHvy2bKoeFK7mb1 yIE6MLGD3U0h5ky4VsgE1sk4uuocdvujI52wF0m4kwBBXgNlcLYMhitmFhvCPxUajMpRiN6Cxve
 g/1YPFZ0Pe1tsTK9MwvBjhcnIrP/zrEHhJLWoia5rRwG5r39JWxnS8y4+DRkL57LZQI9iqchwaE Pg2VObwUz432J6PSwzLDqUAdcYNPkJ4EVsh0GGIlPZ7ImZWfj7hGhdSgziF5Q65IB1kUjkJQKjf QjPxAUSCSQvIkIfic8YuNnX4XDW9t0oOSiChiARRekHnBA1PoyJNyZOzGZKmiJChLgSZ7s8hktp
 CHfpv/seLG7jfwZ8CyI1K8hIrRwTiVb/B1QSPAId5xKK9Ed0sEVZjY60YpAKzXhBQZMScqRx
X-Proofpoint-GUID: Dh5cfhosg1NaE7MWZss0UC8YMEJbV6j3
X-Proofpoint-ORIG-GUID: Dh5cfhosg1NaE7MWZss0UC8YMEJbV6j3
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a04c3 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=t8tNeZB39Io7CcBQPAcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

Some time ago we started the process of converting HW blocks to use
revision-based checks instead of having feature bits (which are easy to
miss or to set incorrectly). Then the process of such a conversion was
postponed. (Mostly) finish the conversion. The only blocks which still
have feature bits are SSPP, WB and VBIF. In the rare cases where
behaviour actually differs from platform to platform (or from block to
block) use unsigned long bitfields, they have simpler syntax to be
checked and don't involve test_bit() invocation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Repost, fixing email/author issues caused by b4 / mailmap interaction
- Link to v2: https://lore.kernel.org/r/20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com

Changes in v2:
- Rebased on top of the current msm-next
- Link to v1: https://lore.kernel.org/r/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org

---
Dmitry Baryshkov (33):
      drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
      drm/msm/dpu: drop INTF_SC7280_MASK
      drm/msm/dpu: inline _setup_ctl_ops()
      drm/msm/dpu: inline _setup_dsc_ops()
      drm/msm/dpu: inline _setup_dspp_ops()
      drm/msm/dpu: inline _setup_mixer_ops()
      drm/msm/dpu: remove DSPP_SC7180_MASK
      drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
      drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
      drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
      drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
      drm/msm/dpu: get rid of DPU_CTL_VM_CFG
      drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
      drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
      drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_PINGPONG_DSC
      drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
      drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
      drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
      drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
      drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
      drm/msm/dpu: get rid of DPU_DIM_LAYER
      drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
      drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
      drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
      drm/msm/dpu: drop unused MDP TOP features
      drm/msm/dpu: drop ununused PINGPONG features
      drm/msm/dpu: drop ununused MIXER features
      drm/msm/dpu: get rid of DPU_MIXER_SOURCESPLIT
      drm/msm/dpu: get rid of DPU_DSC_NATIVE_42x_EN
      drm/msm/dpu: get rid of DPU_CTL_SPLIT_DISPLAY
      drm/msm/dpu: move features out of the DPU_HW_BLK_INFO

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  53 +++-----
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   4 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   3 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   4 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  15 +--
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  19 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  19 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  12 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  21 +---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |  11 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  43 ++-----
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  45 ++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  31 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  19 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  16 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  42 ++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  14 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  16 +--
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   6 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  44 ++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  22 +---
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  50 ++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  47 ++------
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  53 ++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  47 ++------
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  52 ++------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  51 +-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 134 ++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 108 ++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  21 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  14 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  28 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  17 ++-
 51 files changed, 304 insertions(+), 864 deletions(-)
---
base-commit: a4efc119e8149503e5fe9e9f7828b79af2fe77c6
change-id: 20241213-dpu-drop-features-7603dc3ee189

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


