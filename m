Return-Path: <linux-arm-msm+bounces-89281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2821ED28A26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 22:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A62D430C4528
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A08732ABC7;
	Thu, 15 Jan 2026 21:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLCuYDU1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qa9k9p03"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BE932861E
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511163; cv=none; b=rSC4l83Rdbi6OLhf7AL36HzpVnJbZCvIGu2WSaacRrTWPBX5AaoBSn22dEB6cbEqIXZxbMqTLH+2g/Q3mVhDzondKJaVqYSdLfFbNCbAFiqq/DhbJ9LW9M3m19NJhbsMDVEcoUfeLESlhui/FWQOHAsqCI4iOd5u7iySzVeZq/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511163; c=relaxed/simple;
	bh=DDq7HawjMOfLu7QIwOQU7zLBWI+Bavjt/wzWAyx35+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nNzE6S6an/H3VUbKfdParZd4OjjHnh2mxThN3kVd2yRQSlEkD9eBO4sfQ9aZXDwn7e8ywXtLcDXUQHKff6yb7SL3MSt4Km6fqwi0ToI50UUqLSBa6ETjjPVC1poYIUw1qY12GkijpvfZMF4g0aEFdsqUVFvmCX0yirLzoSV/XAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLCuYDU1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qa9k9p03; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFY7Ig2673294
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GtQFSRK5qZ7fvnUBt5V9UTPtwSbbuIbLM60jFf/YhBw=; b=BLCuYDU1bCPJ8K1B
	SMjj3Q8YzHy2n4T46aLyeOFZfG0o8L9ZNWFcn+33LWmxfhFL+OhjP8Y8ZKVoVf0R
	RnLczsGC6QfOqIKrTFrAyt+qOss+7Z8W8efYArf8YnrZWFmFkTjdmEsCsEqRPaq+
	bmtyiVfGbX/1pBR6TGa+dpbMwqdqTIt+3MhGJYcctMvNMnSQ4P9ksIOGn6g/wT0A
	y/NB+ezVOAF6qZQ6rxZuDZi7apd9xUNYD87iYkBocGY0C0SqLOxmKt1YnqPax0Yt
	oUVIieiZGH4ycxnEc6uU7Dzo9FDbqiTvalWY8zytE4cjlDphn/JkkpAuDgzo2Mby
	2ELtEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpyduhm1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5297cfe68so276223785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 13:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511158; x=1769115958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtQFSRK5qZ7fvnUBt5V9UTPtwSbbuIbLM60jFf/YhBw=;
        b=Qa9k9p03lP2AjvV4qdG0obfYScmfahoNs9aNP8i7LKlrUcqNInnDIAKXSV11yohC46
         HGQNo251I1wzLs+k5uTsVQTKTTKwtRkbpPgqJQhV+mUYXGh1LZhaxnG5eeTGfhmU2CMR
         AuXrUrJHcK31UZ18WCjN1YB9BB/mEBRt0cfIvmqGpbjek/2itylco//cO/3q8+wtYWjD
         51pNOCUkODeustRA+/zAbRf2nRJxeRuSSu9lqdIVLnnTU+C3qH+eBVl7BX8s0qdr4rua
         sqIEse+qmhw5y4qcD9/kTSd34D66VQSrk5c7an1TTtYJaZDNK0dzKLstiC5GP+iiF3oR
         4fnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511158; x=1769115958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtQFSRK5qZ7fvnUBt5V9UTPtwSbbuIbLM60jFf/YhBw=;
        b=YBZMrLHiAuk9Z9QqvhPC3e/nMTHA0mg+IAJfPS32Jq5lpitW+7x5oxuQP72fFvfshy
         987BZoCKAwp6fq9lJ1bAVFO5M9rGF3z1M7PxKVA7L2K9GBIlhNJswVp8b/2i3iW1IIVZ
         LseecMzqMehRL7VhG7/+cD+SKMZkCq9haAgfCSu4RI4hWUh0lQza14uOFotDk4H6U842
         i9Kdon26a7/nypw+v1im3WqPSg3S0+YjMW9oY0K6IxEYIWFBSYGDxo8dSmPcCVe7oVZN
         ZlFbCFuDBZzVvmFhomYwKH0Suf7LrYSR29L6U6gwIvNdaCiQEXWrqM+kLzISrlEFoGMO
         fBdQ==
X-Gm-Message-State: AOJu0YxuKV5vxLD2xvSltXZhnGnqy4vzEUufvixdy1Yc9e4h7Hqtj+Bw
	+LBYRKC1qlGpBYnaifAJnidgzJkoN273L68VcA1ErGq/f3b4tBFCFRDDAQRLwGQWXGre1DQdr6b
	GpGEVrFiqcTCMCsE8BhinabATVwEw+V2ArFeEZA7xTtPV8kM+VO13gZDV3SCTr4Nm+Z67
X-Gm-Gg: AY/fxX6XLpQAYpW8dZNUexyderg8iRorQQmQf3uqI4R7/mF51WLN7KA/6mwJX7qBo/s
	iZx/OUGSRV/+kl3dAYo2oE37ideu9qiKqlgcV1kMRUn4wo+7wNcT2aqMMglM5lRJQOZ5jIHjX4I
	U86b7oNReoLJMlqw9qh8o5xjGIXwa1mPWQru/5YNDKZj94Iu8r3wZ3FuQFLgDhHbkmdkwAv+ayA
	hHQMe2JKYcIdrU77lCFEJ2Wsa6T5tc6L4gUIP0uH+JbWqAsOckxQYtQ2Kq/nHUcYyjf7d53eTCJ
	rj/xAtYimuDcU7JMUSky+hkbHEa0Bx3S0P5AiLTB8xJB3ZMNEcrMDYPWG5hRz7GajrdqCqZeNft
	R7O/RJxVgzMcsDVdI+Bz60BuwomIIQHeLtMzRYKrqyuWd5hi0zogYSDx72825rGJlt3NUc1rhY8
	UiEAfG5hm7QYVjHXxRL479uyw=
X-Received: by 2002:a05:620a:25cf:b0:8b2:defb:73b3 with SMTP id af79cd13be357-8c6a66d6b9bmr126200385a.11.1768511158437;
        Thu, 15 Jan 2026 13:05:58 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:8b2:defb:73b3 with SMTP id af79cd13be357-8c6a66d6b9bmr126194285a.11.1768511157859;
        Thu, 15 Jan 2026 13:05:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
Date: Thu, 15 Jan 2026 23:05:54 +0200
Message-ID: <176851111170.3933955.16914793365873145717.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX9P+ffPgfMxIM
 b0ET476BUHb5mtdg0sIVRkG3Ri7fY+4Zxip0LdSuGVdII1atftQ3gfU6I6BJb4+QIkYilXDutFF
 ilEaKNOtioCAXCKP2QrnRchsOqurWfNDxxxDOc56Svk362LO0hMB7szkUZMe/coFxdtw1yqP2dU
 FAjFLf9g3wv9Gws5lo1gc12CaeotqPJAWTYVriS3+H+zJqfPngYx36/IYcWBraALpaG1ipRCMDe
 muBlbTP1F3QbsAkQiqfawBWvqaEL0/QONsc3rDB1KzJT7Y/0NLxqtGQPbeo2+rca3VRTxpT8IfW
 SN49jEt7KlwIQiN+WxnTpwEAvdKkZ5u8eQYaCuI/G+aJ5OLts2r025ps1Vv2JFa3SEEND2oPuF/
 1BaflKbe0YqIIbbY7BTXdXBhUyIsX6Fv7cj3IuBGaD+xN1TqxtTnTrfpgvky2zjSLtRUJ0l91RG
 Jtf4NmdduRQsR7ckUOA==
X-Proofpoint-ORIG-GUID: aCMccc5UHCYUMWzQgb4Hj6MfnXH0kS2b
X-Authority-Analysis: v=2.4 cv=NafrFmD4 c=1 sm=1 tr=0 ts=696956b7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=KjdWIj8vZOb5hH74MMoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: aCMccc5UHCYUMWzQgb4Hj6MfnXH0kS2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165

On Thu, 01 Jan 2026 10:34:38 +0530, Mahadevan P wrote:
> On SC7280 targets, display modes with a width greater than the
> max_mixer_width (2400) are rejected during mode validation when
> merge3d is disabled. This limitation exists because, without a
> 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> preventing large layers from being split across mixers. As a result,
> higher resolution modes cannot be supported.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/disp/dpu: add merge3d support for sc7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2892de3f4f98

Best regards,
-- 
With best wishes
Dmitry



