Return-Path: <linux-arm-msm+bounces-56707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 859EBAA87C7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 18:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 816B13B8DBB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7496C1E1DEC;
	Sun,  4 May 2025 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0bQyENw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E5F1DFE20
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 16:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375221; cv=none; b=H8goxEw0waO7GCDwGuNMsHE7wNIgIRITVOUYNOmCNObnWeO3wcHGxpaWnBK40Dp5gQqTqN/dfhH2DaE/dXE509A70l/2mf+5sZfZRX6GPD2XZhpDmjldOEV21Kqb8LJCwFUmYAwqFevVTx2uwPZ1/NzOlCm9sIgWXgeYoFeJFXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375221; c=relaxed/simple;
	bh=zTK6qAcKQZuF4cfB2PwxVStTZEH+TOc7QDpxhzQeph8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tgm6rCoouGGomd6wAJsRVcfLAfMVTA5fFWK/9mVzpK65MsmDgnVx+yO0uadOfc7EzMDWkl0fSNzEljJT39ZxHBMMmxzvIP/htCdnS7C2K1Fe28xJ1c+B0jkReA5s2cfXFlZ1jUjUO8ChEHVwqJ6Tc0t7en0XL/4+q3T14YMEZS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0bQyENw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544CQlMt011830
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 16:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=; b=G0bQyENwGIhr0PVK
	ug3iJeV0Ooe8RkgrDJY8XiTfO+EmvDmYKm/xaClavI87LG9by3tiU7sE5gBwL4bQ
	u2YAfNjznGHiXMfTre2Onw3P/J2YHg2uL2TvS75dKYAiFms4lVZKorf6NixiUqLY
	4D3Amd7+FV7adT58Rb5w0J86GN8RJgg/FP6/1f3j38Q6C/aqZQeXT5wQpN0ufY9b
	hjUJpxzgzVwRSegiBytj72kJ+87BKLaqZ6RxNuT9s/YdVhd8GLeh5Vvi+oM45HEM
	c0R7IzAQ6sbEUgjBzfupiXKa89b0U1hDRuWJZtEoMe/FZxQLQSOqmn0Y9NmX79B6
	/v/imQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nkt9a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 16:13:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c7c30d8986so411520385a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 09:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375217; x=1746980017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=;
        b=teBzHd2bwjVO1I6sm1zPaUZ97PfrJLbtRhiwCC5VXYPfiSAZB2dryvcAX3OTnyWiVg
         HND29kWKhTldchR9C42iAHn30z6TW3qYXIjo/zuRJL0d7Zo2GC0n8l7xYFi5hdb/Wjen
         rj2SXAM4DLMe7cyBLRvieP9vHZhmRxSPRYTEv3mTNmEay8s8JJnGpBCqKN0M5GWaCos+
         BR4cxn5FCN1hvqofV+nbD9Lrop7E7WIo9Mz261GJC+CwvppgQiXL2Z9pobNTcZHeRNzL
         CA7mwg+3rpMBOm/mFkJivTtL7sPdqxHB45Y+ueYsi3qW0raEnbUYoOsYkgvgEZaq+crz
         V1QA==
X-Forwarded-Encrypted: i=1; AJvYcCW05MtKlIYPqDqATJHSbG/4/lY4VKGxq8MlGLjBKTsGu9qbviaYHTkoh9/a1C0Wb3RwmLvHYlGJWbkAh2na@vger.kernel.org
X-Gm-Message-State: AOJu0YyJQHkJd9+TLKgeCIevw4k1RR3cOjyXnWqXyf1X7NH9k10yct1e
	M1u0P85mziAmmYC6R2Y9fjh+T86qvMzEF12jCBCHSHEvs3tWvxJXh09mjALYWDCzQ4Wr1KTH4ZM
	OEwIHj9OAKEAecHtalXjUTBqh9re585SV6D+H/9CJDDGIqfxUJ0HjQLnUiOpissKX
X-Gm-Gg: ASbGnctpVLg2aysw2pW9MKfHO5uAU19Xk5+tQTFyUEDiXf43aU2Ie+5kkGRC//mb1m1
	KtEIMMviAgT3RQmK8gRxsPSWpG2zB+1J0wKmcTqGo5gPuQmexI1C25gAppGajrMW85OL8nQ9RMz
	6snUxI2slJapcebfnA1UbI0jGg72TNWvxyDRnh/D67WwtQiW0hOM2A2PbbyiNeFQHuqzxAnsZyE
	TnM+t6XLBdCXJ0ngXSVNRzEmZdrxDdNVXKc9V7u0CPKQ49KmFQn8e6SbvYMfZpFnImcWMYks0ux
	IrTN2zB8AVr6JTC7o4pRkh9QwnQ+X2mimq4ikP1+hgMQMbTf7vHkWJhqPiu+fXnion+oiWCQ9SP
	wVt9YLRui/jkStTglcAEQFcJI
X-Received: by 2002:a05:620a:414e:b0:7c7:a524:9fe9 with SMTP id af79cd13be357-7cae3aa3a7cmr721243285a.27.1746375217709;
        Sun, 04 May 2025 09:13:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeiOTVT2ymuT82iRFejLq29xysyG8uAckrB2qV1iZnT3Z31gVfU5M2H+L7Io6knC2h1rUhaA==
X-Received: by 2002:a05:620a:414e:b0:7c7:a524:9fe9 with SMTP id af79cd13be357-7cae3aa3a7cmr721238785a.27.1746375217366;
        Sun, 04 May 2025 09:13:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] drm/display: hdmi: provide common code to get Audio Clock Recovery params
Date: Sun,  4 May 2025 19:13:21 +0300
Message-Id: <174637445761.1385605.12669862804792916978.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX+Any7fjtZ5nS
 tZ4c6BYbTBtmnYc+xn/a6iUZbNr4NK2xUPv2EcKJkf/OIFF8QBSaO6ZRGfeRV4mtF2uh5jI1DEs
 1aeZYjwpYdAyA30FjjI8Dz9WrTdFY7YHDMeoLtrtIBU6BsijNq9V5MmsGKzQ/d4kNnH+0QpLPXh
 UZJT0+R2m2dGjQLigyJ9SAXdyNV4woGQHDZQxtI5nqcVavFDByMcsGabf8IEmIhDLGSpQq90MJR
 Iyg9TccgbDbRevj2/B1fQBjUcgqBJaWfv9WOKRmZDcaaI0ZfHuFSh1r/fU3u6HmiJXgqVLNQna2
 SLuzUGyou0Zp1tWF+ieww1teIm3Fani2ewGsXcDlakS42QEd6XEhM9RujYm9WAmLLzQKEBzK+MD
 pZi9qkuZFY0kGkAhLplTqOR0BruCJbzNj53nKOwqjTEIrO36OOrSPGMFAckDPkKBeTHjQVG0
X-Proofpoint-GUID: gXvAQx-tx8UgQvwRA9QrYd9M-5UAKtVe
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=68179233 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=OVqkDxUf0f5yx8408MQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: gXvAQx-tx8UgQvwRA9QrYd9M-5UAKtVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=877 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


On Tue, 08 Apr 2025 16:54:24 +0300, Dmitry Baryshkov wrote:
> HDMI standards define a recommended set of values to be used for Audio
> Clock Regeneration. Nevertheless, each HDMI driver dealing with audio
> implements its own way to determine those values. Implement a common
> helper and use it for MSM HDMI (tested), VC4 and DW-HDMI (compile-tested
> only) drivers.
> 
> Note, this helper simply implements the database for these values (HDMI
> Section 7.2). The question of selecting supported formats and rates
> should be handled by sound/soc/codecs/hdmi-codec.c (pretty much like it
> is handled by sound/pci/hda/patch_hdmi.c).
> 
> [...]

Applied, thanks!

[2/3] drm/msm/hdmi: move msm_hdmi_audio_update() out of msm_hdmi_set_timings()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1735917ac44a
[3/3] drm/msm/hdmi: use new helper for ACR tables
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88321e3529f1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

