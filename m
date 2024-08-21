Return-Path: <linux-arm-msm+bounces-29175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BB4959407
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 07:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 270E61F22048
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 05:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6173C166F02;
	Wed, 21 Aug 2024 05:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvrSyu/S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA071165F03
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2024 05:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724218001; cv=none; b=H0ANGICeteg9Mznx6ykBPLBGE2PRQXmSvKaivGcv9f4s5LFcfQ9oc4lrm723moxqxw74+T2igkW00RDcy3eO0Bb1kr8dUyUmRc85OPio5PjiKLOdUGfWeNWhwJLMEK59B/8ZKrhJ35hnj8iqCHZ6N56B75TJLxps2jk09BMBo7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724218001; c=relaxed/simple;
	bh=zxHSx8Qkmwfv1qbxR2XM+iv/f7HieylHJdMXty5tQ7E=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=RVe2S5fBRWziI5aliG8puTtEa7hG30QvERMD79RHqYl72/edh+7PWYiL0yBmniIODnqZm1BzWn8RvTUIX9qh+ThPyhStoUoFbfNRhzkqszPwDddGOaI+T3qbJZMKRhnlthlsALoM4Ebn5I2dHA6Oa/FLudrBXLnrMpGn1HGdw6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvrSyu/S; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-201cd78c6a3so48269315ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 22:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724217999; x=1724822799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gr01ud/MlbqAFDWoZnwqdTmOp2X/OTSf0xujXNR87Ok=;
        b=gvrSyu/SygebgvIiJf7MDxVgp8SDk6mrnQRRDag7lHck8+BoLQAr3b4EDDnSL7pPmF
         kudkTouynIXkjnA61QRpFdJxOB40mLyUa4r+m+YBO4+1buIEJ82zaxrzEUn9vRvjMOQ2
         dduMn+4WtUOIXn9PqUZ6HQ+0Obx/+UAucM+jghWZdbI7FwmAKCsdbI61ISnVSEcUOHq4
         aOBInb7kL88931BZB+1U2Wn4a7xNJI29BYuby4TWj5tciBfzvtSUImYSohHOrsngVces
         aGykCKDj68vmuSQP3nDfv/T7UNNqbYPykthd8N65SZjPyOt9RGRYfkKuAElctKKcNit3
         dysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724217999; x=1724822799;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gr01ud/MlbqAFDWoZnwqdTmOp2X/OTSf0xujXNR87Ok=;
        b=qakqi1wp5AvQRinuEOiRYZZJOPT4JqX9S3L2nQV2bMQ1hv0WN1r2DqJbiDzDHXfRn8
         4Mcr7f5f8F2DuUsVXGAUEii+jer0D6RNpJ8LEh2mFZHJGv1MwNDnPb0rTOWQPvcLm/03
         /5Pt14/97EVOQptLpnd5oYVQDcPT5aoRU5/s3DeIQ0lfbFrnyhkioNCJo9gY6QxxokrZ
         kNPqa5SYNynTHc4aZeHe8LYBqcZ0Q1OeJhS+bktfVCrUBVtYE6vucXv3F8KLnSz1p4Gm
         TwbEbYtU6n/drPonlHAwoyQoK06iT6llj/efsozGq1Cf8yYtatOk4jYWmSbq403tvQVX
         N4wQ==
X-Gm-Message-State: AOJu0YwDhcmurGVEHuVQHBlaTsF9e6iTZ8SkXgnM3Wmwy2FcLFGjltaO
	M3D6lJqrXrvfmplE2b1wtE5QU3Zqv/kMoo/HRvA6We2t9SCUNVZGGW9N4kqi/FcDwRFxmkj87Y3
	4IDdhhg==
X-Google-Smtp-Source: AGHT+IHFHkaUJiJ+vmnBvrmHCqFtfETI8Z7H2ktJsyLBwQ0HAS3lLQrgzteOvJx5srYip5yeV7tHfQ==
X-Received: by 2002:a17:902:d4cc:b0:202:52c:8027 with SMTP id d9443c01a7336-2036808f52emr11256945ad.47.1724217998795;
        Tue, 20 Aug 2024 22:26:38 -0700 (PDT)
Received: from [127.0.0.1] ([49.230.194.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2025ab75623sm25070665ad.30.2024.08.20.22.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 22:26:38 -0700 (PDT)
Date: Wed, 21 Aug 2024 12:26:33 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Chris Lew <quic_clew@quicinc.com>
CC: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Fix singleton refcount
User-Agent: K-9 Mail for Android
In-Reply-To: <20240820-pd-mapper-refcount-fix-v1-1-03ea65c0309b@quicinc.com>
References: <20240820-pd-mapper-refcount-fix-v1-1-03ea65c0309b@quicinc.com>
Message-ID: <80424800-2E75-4240-9B87-FD48CC4515B0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 21, 2024 5:59:34 AM GMT+07:00, Bjorn Andersson <quic_bjorande@qui=
cinc=2Ecom> wrote:
>The Qualcomm pd-mapper is a refcounted singleton, but the refcount is
>never incremented, which means the as soon as any remoteproc instance
>stops the count will hit 0=2E
>
>At this point the pd-mapper QMI service is stopped, leaving firmware
>without access to the PD information=2E Stopping any other remoteproc
>instances will result in a use-after-free, which best case manifest
>itself as a refcount underflow:
>
>  refcount_t: underflow; use-after-free=2E
>  WARNING: CPU: 1 PID: 354 at lib/refcount=2Ec:87 refcount_dec_and_mutex_=
lock+0xc4/0x148
>  =2E=2E=2E
>  Call trace:
>   refcount_dec_and_mutex_lock+0xc4/0x148
>   qcom_pdm_remove+0x40/0x118 [qcom_pd_mapper]
>   =2E=2E=2E
>
>Fix this by incrementing the refcount, so that the pd-mapper is only
>torn down when the last remoteproc stops, as intended=2E
>
>Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
>Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc=2Ecom>
>---
> drivers/soc/qcom/qcom_pd_mapper=2Ec | 2 ++
> 1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>




--=20
With best wishes
Dmitry

