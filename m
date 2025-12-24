Return-Path: <linux-arm-msm+bounces-86600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6871CDD1F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 23:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EF4C3029D12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 22:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90FD2C11DB;
	Wed, 24 Dec 2025 22:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHdIk1d9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDMizrtu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB7B2D6E78
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 22:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766615555; cv=none; b=cDoe0u1ONgEb/Fsi5a0xa8O8TMundQKVaqQrcAHEcH8Rb4vMg6gTsgRtqfPXoU0KyEbIKtdVzCtQPb6SWeg9h7gMiILPRXhKafNhJIpAZa6oWeMDRvPzJT4WmJXpnZXa5MjHjvGCedrl3093RMfoHWrq35r7g+2nD3BNZV9SqxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766615555; c=relaxed/simple;
	bh=/UtojRl5f+vpTC2mDwkacSOwSbg3o2mXBOFEhIQbWPw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=scYheDmNSsY2tMhpNDKr3uD/0VCPHZZ1TVjIBmECHpd+mdYy1i0igIyY6EbtYPEFS5mbsvf/VIQdvDTMECGPL3/fAQY93PJRbAFHiy3/Q9aK5/NC52Osz09Ab2UDM4NGGn893n9LJ0NqeJ06u9b13jnSeEv5tS7GwHnTlr47QxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHdIk1d9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDMizrtu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BODOvMU4133945
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 22:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UraNFuYrxpgysjCGoBJLWahHGNJ2HdExFYPsS3LkjKw=; b=nHdIk1d96Qc6MtkX
	xuvXp/Zbi6UWSasbYHp5vrUsvuW6ONDvVuD4YhdeIkQeli60rQRn0B+IapRcPmtu
	bA+yn/4P/jRcga0RPZqlbubnY8u/SYKA1rb2tct2YleWM5jAJRdXuzAB7u6oVzRp
	6fJdt2KfdwCxQUxSo5ejZac6gkbEFft1VO9cZ1e1MGc3bcOFCpMIPKql526f9NJF
	W783TpjL3LzjyO7lAv9BZgdd3yxY5rn6MTLB+gquC+uOG+7Eh6UbYs0Mbq56WXQ0
	zfnqQ0TBm06NuVdpu76zM8JgzZR2g59EDvRf7T72H1Aq7cnS5vRh+mVe4rv+fYOV
	6+PoGA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46v2qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 22:32:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee3dfe072dso162857891cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 14:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766615552; x=1767220352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UraNFuYrxpgysjCGoBJLWahHGNJ2HdExFYPsS3LkjKw=;
        b=dDMizrtuDI84jvAwsG8A5JQ4ZQWlPqjGv8FIzWgOmK3artLWZ/DfSn443lmMgstt1e
         YGnXkCnoJga+8Kugsh1IqUAhSqinxVQS3gGbayPSH/s5olVlRax6zv2hHIMj/NLJObiT
         B/bh1WQywCZ4Q7NM5DFoHcTB8N2XJrYe97DR5rq2slUzbhfBHdDRMBxfOJIGkGRKpU3s
         2CXsQ+P8LrL6nP+5cRQQGVpQvN3Ein1sXZwWi6438HNAF53FRgOvRub8dibBpgVFk6Tg
         i0jHURphdRyrrdrSiLvivLktQORZmJtavlj3T9EoblXuVX5JneD4Q8jubhuQihhriVf4
         ZFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766615552; x=1767220352;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UraNFuYrxpgysjCGoBJLWahHGNJ2HdExFYPsS3LkjKw=;
        b=GuLmi6xODfxUY1Ry2bPGlIUyxIvdekeo3qopZh6oTqEGrRz2iqbDn4obkrHdC6mM2Q
         eqROah4N0TSGT17GfB4lyPrE6M+QUOn54iZg4pKdZ7iL/gA7ZtU5p8CGeCRUmm7xZjc2
         4+KlB5YYZ+gP1TMYjTTnEq3QokOdd6KMcTvx7ZBdcYSTL9zzwwmpeGUMqBJqKmQ0Rhwq
         eS53TeUF4jdV69w9OzKe41LjTcWeRIWJ0eO6yIkrSxTwyl2Tx2GUY1OIRIfalXdCWEay
         chEQGH8c7fny1knQF6rn6310rVvtVO6PzAKv19FEvByEWKnmzIenB+p1nILuVnoi83H4
         RKUw==
X-Forwarded-Encrypted: i=1; AJvYcCUAv+dl2Yi41BMLE79+5EcmVMURK35NEVCx6CqhU19OvriubT4piMLpGu8BAGi0XHIazc4irruKMMgxZ47y@vger.kernel.org
X-Gm-Message-State: AOJu0YzrriZ0qiNjhp7vX6p8O5vMwjcSRkNGzBeO1MGLGlAB1KxO3cJ9
	bemTkCtdyzs+V+UmJkZBkYW0elkOlhQkQgnMGY75qVaFJeDVWb2vu7+EUa7LnKPEOfyhej+kAJB
	x69rKGcoYJAfOTqaQfqd8hRRBuUpfaJL5bzUeBOK8VUo5N5rD5fTw35jhrVrSQ2zJlQYt
X-Gm-Gg: AY/fxX5c4qMQQwW1rRxUrgCGFZt6rywrA4/TcfzpJuNLJ8yHRTYSsFpCaifZEzQi/TI
	IlbhM8em0AQqISEcKYMqagWCqQybzPaW0Zkl5NMM+VdKlanlj4vtklfQDyF0c7zN/xFEMqQMxZc
	lUeFNRf1CaCEAJ1R22to5p8B6xmxe9XhEGXXm3yuL6uDHHON02pYw/z4s05oZfuaKKOAJq/qxmV
	tDKDgWFSGqSWtq8ARYnSPrzZtvaq5U35cyjifygeQUvX+cAlwdoTbbBpplfKmXDLbafQfPBHbzp
	+Y/JEjlOcQWhaCR6dbMTo/9c34Fv0v7wqeNN5vOrWY9TiBZc6kIXY1SVhvh2HbEP6qylPjVL/Nq
	pTJJV40WBIfXnBKltNGugHJZOcTPu8nJARtra5A1+wi2vJ9XL73y0/JvxlsbSeItZQVnVAk5L4G
	KQYvqm3IK5kxQymh1AZeQ9FiI=
X-Received: by 2002:a05:622a:4ccc:b0:4e2:e58a:57e1 with SMTP id d75a77b69052e-4f4abd1fd20mr319277491cf.37.1766615552557;
        Wed, 24 Dec 2025 14:32:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGn3E7ooVJGy2fcsFLgGKtHFkRwVCp/umZC4k5RBMwllPtRmK2vC1IGq6txC+42jL9b+1gxOg==
X-Received: by 2002:a05:622a:4ccc:b0:4e2:e58a:57e1 with SMTP id d75a77b69052e-4f4abd1fd20mr319277151cf.37.1766615552154;
        Wed, 24 Dec 2025 14:32:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122693ad3sm42746951fa.49.2025.12.24.14.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 14:32:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
In-Reply-To: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
References: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
Subject: Re: [PATCH RESEND 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Message-Id: <176661554772.2411515.14289224108428205133.b4-ty@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 00:32:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: P6Xy-s14IXjyzlmpIOHQvfpRxSWD1VmL
X-Proofpoint-GUID: P6Xy-s14IXjyzlmpIOHQvfpRxSWD1VmL
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694c6a01 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jdnYiPbrDYKY_qMFIeYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDIwMyBTYWx0ZWRfX8uGLV38WGWiV
 Trz8Z5PgZWQFMRWaayWGfK2CdbHqGMFHQEqonc30DEXjS76rfEcX1n569EniSTMdCDhlRtowgU4
 o7JkqUR32Pm0ARceXK5DeLSJ1JOgUF6TRJvuNKOfK0d8vVaQvGoOK4dIEizr5PmOk3KL1aZDZbR
 +55bvftFvENkx8Lh5aLTHioW/c6f+xcfIq8mGAcPn+//K8I2TYKjpWqDrjJli8j4iuoc9E7+GHT
 ttzwqEwD/D3XbSsBbV6Dso2ZJtRJZogBcX1FbtKs9wt/iIumWG5aAk4BZkv0V5gAVCk6iVPrXM0
 mzZSZGooeJ0gn9JMPpsajvHrD7oFcUzlcn8k0cTQoLc9Th1eQ53aiiWEoD3aCdAL7N9M9ktKSZu
 o5rE9TNkaNk7uV0rqPCLrdI0ayXyjvRv7i3sDcEcCrpIrM2KplVws2ryO2PXdXuODMkxJSkmcMo
 9d1Ww7TEHr/cxxpH0ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240203

On Sun, 03 Aug 2025 14:53:50 +0300, Dmitry Baryshkov wrote:
> Use DRM HDMI audio helpers in order to implement HDMI audio support for
> Lontium LT9611UXC bridge.
> 
> 

Applied to drm-misc-next, thanks!

[1/2] drm/bridge: add connector argument to .hpd_notify callback
      commit: 8a717c16ddf261118e9128d7f146d68a2567f087
[2/2] drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
      commit: c08c123d4cd6ec3ee482d607e29388d0db2d3f1d

Best regards,
-- 
With best wishes
Dmitry



