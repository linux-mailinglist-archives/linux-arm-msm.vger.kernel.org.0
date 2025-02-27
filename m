Return-Path: <linux-arm-msm+bounces-49629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 279D7A474CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 206393A2A34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA142343AB;
	Thu, 27 Feb 2025 04:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ti+F44t0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391A7233D65
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631090; cv=none; b=iLMVXDoLQTU6dxd6MvUQfcTo3CDqXhN5Tjp0h5X+51IeScwEiqZE5VbaxL+tbhO3VzonO5SyRxYsl8XDL4bb7yP/PRUrLPtnm0lR33F+Sqe2zc0VPhYcrwemN4XnR7vFr8B12vn1bUUpfKmkHeLa1QZwgTdmgMT+42WzQi3UYi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631090; c=relaxed/simple;
	bh=c2QD9K5Zy9Do8z3+8XGb/TPkiis4aha7f1t+39wV7M8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JUungwODyj63N9JL6iPztYP3+e9j29QdAduNulllwwSGxD8qawtLplYOiN6SpJwV4/eFAamgIwc8Bs0L4+GmBe/PxKXK3d5Bqb2xwqd+TpuqK0wXF1Io0Fj/bJWNnT73y6xZj3AM2TAV0EaWf8lUdmjNZQUARpTTRtr9ep7hNeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ti+F44t0; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54843052bcdso419436e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740631087; x=1741235887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NuhwZJbo550PrQsjB4y/he3bzDbUt6ahCDwi8PkPv8=;
        b=Ti+F44t0pCHPI/c/NbbnH9mV/ZEbuS9NHl5DkZcjtb9K6OXX5WoM3yfATALPxIoGXu
         79YR/gv1EVX9XXuQePUXqN12duv6e0oln+rfoqsBU371ZUzxIQ04YAenLb4MqONq+/zB
         y9cTCMnn1g8iIGLLIUBkkejPC0gQf2lBH+3UDE9KhJ5jpGsvLOAVUlxxy+MogbP9O1rf
         vNMtXFWxCqrPtlAVB+weE/QEiheAdYt/m1Fu0s7o1xYtfUXnNuVZ4lTQNpe9AA1s4KrU
         EVvR9PZq98tYnQ6oSsj2vRwxRdcwlfGw+sEY45Ij2yeCPsUadwt8uG2DDRJBtqCn6EAd
         9egA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740631087; x=1741235887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NuhwZJbo550PrQsjB4y/he3bzDbUt6ahCDwi8PkPv8=;
        b=qyJ2UThoQtZXKXaTfomslg6baNci1FuMqwxyyH8nihqwOG+fmCoAe03aXBVncMbI4A
         s2iYrfoE0B81jN+0Y/P+RPi+ZkBDHgKyTvRO9uOoO7xR7uNHcsm76pxJ7/om24ISW4w6
         nGOtgEBE/d1QvTm5FpNEb69MHu2vkNmPmKkKmTFvWYKs2SxpTTIS0Od9xu3l18hmZFVN
         K3L5t8TLik/rMwk0h/r58nfAh2LQ2ZBAvC9zyVMfc7EpsNRizmVh5Zx0VH/8SuiCxosL
         WTSyxTWH787eGmY/CFEFMQc0jtLhRBs5wjgNGjoIVWcXQUgunTcPzsWnFF4osZVx7qQI
         kGmg==
X-Gm-Message-State: AOJu0Yw4ba9QxMhc8TFoLhSCtVFQjR33vNehXv+Rk6NiGuaTcViae4gk
	jsmhc+hoBb0qDBuJo0l9K2hLh817wv4uj5UzXnBB7CICnq35I0C1jOF0sFSHeVthkgkOtMr48Zk
	tUiWiqQ==
X-Gm-Gg: ASbGnctJSjfP9HyfgD8APJsyksh8VqgcEQd8LOJF0ABL79gr4+4qGsxBWlVQhfLre5g
	cgtkdooWkDK59ZzAVzIzxRPpso7ku8+h5nB84+ANUglXAOLby6aTxOxLawiP1jbIJxPA2g0GbXM
	rPW9C33Vb/h8aivDQMjovudGeNtyH210lMa+ZpgMg+pRM1NxWLzj9isw9g9TXe/5mIBvmf5yaXF
	4RcvRZEiFWLMCbjG65pEFEDfouWuKS3jl+YgBTwbzbNCRKLabqHAQH3iXUnlUO/VQ5hgxknVJAT
	CfEER4teKr+45T0yZe+abZCUa6BM0fb6V+wtI2ziYQ==
X-Google-Smtp-Source: AGHT+IGRIdnpgZp6aVSnIAMxXRNTRhCc98UJKotB+jjdDT229PrZTyGg2gjdq/20fQUotbRi1XPCKQ==
X-Received: by 2002:a05:6512:3f19:b0:545:81b:1510 with SMTP id 2adb3069b0e04-548510ce665mr5171090e87.2.1740631087427;
        Wed, 26 Feb 2025 20:38:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:38:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Fange Zhang <quic_fangez@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Li Liu <quic_lliu6@quicinc.com>,
	Xiangxu Yin <quic_xiangxuy@quicinc.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Add writeback support for SM6150
Date: Thu, 27 Feb 2025 06:37:34 +0200
Message-Id: <174063096236.3733075.3181882897632312941.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114-add-writeback-support-for-sm6150-v2-1-d707b31aad5c@quicinc.com>
References: <20250114-add-writeback-support-for-sm6150-v2-1-d707b31aad5c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Jan 2025 16:55:24 +0800, Fange Zhang wrote:
> On the SM6150 platform there is WB_2 block. Add it to the SM6150 catalog.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Add writeback support for SM6150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/23c0a9d36f78

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

