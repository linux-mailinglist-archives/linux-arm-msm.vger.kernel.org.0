Return-Path: <linux-arm-msm+bounces-76916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C194ABD12F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 04:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE2B11897145
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268132F4A19;
	Mon, 13 Oct 2025 02:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIxBD0TX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B01E2F3627
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321357; cv=none; b=MzF9YHqej7xdBheLQhA2tB+nOYqPL1blozIqbhhVW5jywMA8ytvZPUH+wkGw2DW0fReWFwYTq6i5cEbeujS3uBRpjmWgXTy/HvNEEou8tm/cnSIvF7jNV+ag6pWQI14ru6A+KxIQKAfhZeDBZxZFfhFAjFvt67+QlkWyW0/xNU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321357; c=relaxed/simple;
	bh=zrW7WGVaRAE/uWWvySX5l8CAFEikLlMEg6cnOQdS+i8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wxm3W9skEBdszpvCi6v61ClpJM1KDPwgDbuAysSfV6mtKXgslOsDZg+oA79Fu1q75LNUKMEBPA4wxL0EIXTyY7xx1TCEOpCdGnmP3hVgz2WLK2xntQu1YUrWfqJO8ZKHbktdT/gjFWZ0TY1DE13maZ4M1KU4sU5NFJaHzk7mhgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIxBD0TX; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-639e34ffa69so5725393a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 19:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760321353; x=1760926153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7LwVVt+oIonXpTgbR8cBIFBDId8LwLF2NsksQagWtM=;
        b=RIxBD0TX/Pruwu+fBlzzRmIpx+T+OZMQOQ62COc9Xk3qvPmfQQ0s+gcYmOSoasbNtM
         c+I4CPSDvLvLnRyshKijky/JKW+QEbUzspMuou8oO2SSVsw7MjmW+iMsYUXV3nKkZPJJ
         TSXdRCSUb9sdzvgkQiciRfIx6lZ3/RCK+RxOhZkR7lsYgh3lVJBWEeKKddFlLaTXRVgi
         voRPQfJ2lfaYcs+1tMQ48EPiEAuRj2LQ63/N8UY4jJUI+rnvy9Fc/9RvgWlnDTp45DKL
         AJxYpOx2mhVPkm+yupR5fgIhCqBbU1GnzrdcIdZH7Whb2uCq2F1x60O8jx9An7fvezTE
         bj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321353; x=1760926153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7LwVVt+oIonXpTgbR8cBIFBDId8LwLF2NsksQagWtM=;
        b=eQtZyDl+7kLf9hmLuIfZ0slfyUYM1aJUeSibQfLvUGGtHL+PolRpVDeeB1QUmZ3fHC
         Dsm6vhoB4SEXBqfe54O8sbMt7bVNs9tHjjwE9QlWHabiUvQhVCUPI9gijYhmlMpF+J3O
         YQAPa75Ys03eKXsqK/id1ZhXROk9U1+B1RITBSsvoNXmdlhsyERyNkP9WsDnnCd1Meq7
         vwfnlRCtiLjYaTZEo75lAy0tzhHld1lyqVf+2Fi5qiBYoSdfxkIg7tdKqaWwWiEpt7ZQ
         iNewZ+ODFZa7oAMLG7lX7Yehy4XYbykWS2uD+jl7nXDssrv1ke5hmRekvbIRxGbATo+x
         3cig==
X-Forwarded-Encrypted: i=1; AJvYcCU3NbNimR8LjX/KsHZgz24JmIqU+HjRtNj2+AwigDdop20MsNFTmlDWWu2fWx/nFHW9+rrhcws7P21my+ff@vger.kernel.org
X-Gm-Message-State: AOJu0YzkzgYg3Wkz2puAcF8TthQIW7amvvSfh6SfWBA1IL6izW6ahAi5
	tT8MyhjyKKRk/LbrLEh+9pWESzaW7O/XF585+yxSfVCKFldUbwR+j8fQvIGqSWxyvweYj4u4M5m
	8bzfwviqZw+rnoEOUxfkdldMnPaFLhV8=
X-Gm-Gg: ASbGncsMfOx4J74EMoW6BgftAO1ApaIWAuT6KpPJabRxITONASqUM+X9H5S31unfYVN
	MJMS1tpITaZc6PM7VVlNkot97uX7USJ7UIdmDdHIK19re5iXUNF9XbKGQKya6uFnI5r6K4+EEZy
	3ehYvjbCNi9VTbBmNdxwqFYNQZSSoJ54PhXlxC077RD/0A2d295Fp6z38z+Lsb+JIunt4mwK7JK
	VmcG6LPqj73H9iYnnt27/hYf9BLH1jR8OL1
X-Google-Smtp-Source: AGHT+IHVNbPGb048RDwqDj3lyAGwhgF/NMREQX2ImeZH2JgNCDST+u6RIr04BMZZplROx4+MGMoD+CNhHbPvpufAoho=
X-Received: by 2002:a05:6402:144c:b0:639:ffb5:3606 with SMTP id
 4fb4d7f45d1cf-639ffb539d3mr11793727a12.33.1760321352764; Sun, 12 Oct 2025
 19:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com> <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
In-Reply-To: <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
From: =?UTF-8?B?5pu55L+K5p2w?= <caojunjie650@gmail.com>
Date: Mon, 13 Oct 2025 10:09:00 +0800
X-Gm-Features: AS18NWC3lE60pFWwk3f8ArZQPSoc7l5pOk_MADcRyruwf3oXoyqNAhiZmduKRSQ
Message-ID: <CAK6c68jzWLYgrFXRUsYkvSWE9CRSGVmeyOp7cNhixhyBZBC=1Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Antonino Maniscalco <antomani103@gmail.com>, 
	Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>, Jun Nie <jun.nie@linaro.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
10=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:04=E5=86=99=E9=81=93=EF=BC=9A
>On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
>> From: Jun Nie <jun.nie@linaro.org>
>>
>> Some panels support multiple slice to be sent in a single DSC packet. An=
d
>> this feature is a must for specific panels, such as JDI LPM026M648C. Add=
 a
>> dsc_slice_per_pkt member into struct mipi_dsi_device and support the
>> feature in msm mdss driver.
>>
>> Co-developed-by: Jonathan Marek <jonathan@marek.ca>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>>  include/drm/drm_mipi_dsi.h         |  2 ++
>>  2 files changed, 12 insertions(+), 15 deletions(-)
>
>Please extract the generic part, so that it can be merged through a
>generic tree.
>

Sorry, I don't get it.  The generic part, generic tree? Do you mean
the drm tree? `slice_per_pkt >=3D 2` is seen on the panels of these
tablets that are equipped with qcom chips. I don't know if these
panels are used on other platforms, and if it is necessary to do it
in drm.

>--
>With best wishes
>Dmitry

Regards,
Junjie

