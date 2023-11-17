Return-Path: <linux-arm-msm+bounces-862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7D87EEE1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 443E91F22A7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 09:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECE8D296;
	Fri, 17 Nov 2023 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="puCuLAK5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7826192
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 01:06:36 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5a84204e7aeso19801327b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 01:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700211995; x=1700816795; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7M4IZAQ9+XnnOMIQTa5CdmsUeDB/YjFOMkhJk8m36U8=;
        b=puCuLAK50vv6TomWvohI6jd6pNVl/IJilCOgRPAaTfWut6WhfilDeCknRCnjqaMvfB
         GUgnNetzoTXR31sd8ZfaVqAICicPsc7M9CavGggXJ5iz2nQHeZX4pyVC2rDJcMQM7OAl
         bVQ1ga5oLmVXG9JvSKBY4Ce706JFuOWaqcJztBuww8mooRqsxvNz8meWrcaeW4aZlR6M
         HR/vGRkuH7wUVAAvsRRGfSWE6Crelr23Pt67+DmvUnLTS4hI9rLfTPJNOygA05dIqLxv
         L8BduMTCFPTe3cUhy9+Vxg0mcZaSGyfk7UJnCPPrZ9nbw5ZuLx/p6jSoMCBUIrKwmt/p
         ZH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700211995; x=1700816795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7M4IZAQ9+XnnOMIQTa5CdmsUeDB/YjFOMkhJk8m36U8=;
        b=r7X9zULWoLlGPyqLd0J0rKOcyJZhYCJ5FNnfwYWUnOaI+uOmrKD/CRadOEXogwlwvR
         LBh66DvzLuw70KExT/Q48MCWmL8xXXGjNTOhV5thFLU1Zr/SeTNB9qItCfOtmG1iag1m
         BQGE6XcCjS9JHKvYy3WOaI/evKsNdJc+DeK8JHjGC5hyovrMG5WHO0njHw/VPmh9kpTp
         Vi4U+QyAYQjvl4s+KZsqOXBgzoe8yzi3iZs1tiIfJASJ7FYx1cCg2chyZ2o7UBgHJBwU
         0mFzElN4lhm8mal3JHZPq2vWCQfp+J3qNeozlEMj34xmA15oyvQ0vzl2ZCexOA234K/2
         HWzA==
X-Gm-Message-State: AOJu0YxUPEaXXCsFqsUaVW424ODWAe4KHig+z/4410CaAKi689iNOiET
	GCd+WAC0M6TNciO8yMia8F+sDFmjD48uzjlbsMTaIA==
X-Google-Smtp-Source: AGHT+IHvocYihGXhsoXfu9oZPl3MGyCmjSepLGXk4+LJxU49mkOxTdvhOtaUaUzIwDCfjQrpBN+oiNjND7EMB8oHRdk=
X-Received: by 2002:a81:8357:0:b0:5ad:cd52:d6f0 with SMTP id
 t84-20020a818357000000b005adcd52d6f0mr21344300ywf.45.1700211995690; Fri, 17
 Nov 2023 01:06:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117055849.534671-1-quic_rohiagar@quicinc.com>
In-Reply-To: <20231117055849.534671-1-quic_rohiagar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Nov 2023 11:06:24 +0200
Message-ID: <CAA8EJpq0M3ykX0DsdHoMnqs8EAfU98w2Ky350Sgi9_AWpTHB1w@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: defconfig: Enable GCC, pinctrl and interconnect
 for SDX75
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
	geert+renesas@glider.be, konrad.dybcio@linaro.org, arnd@arndb.de, 
	krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org, 
	nfraprado@collabora.com, m.szyprowski@samsung.com, u-kumar1@ti.com, 
	peng.fan@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Nov 2023 at 07:59, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
>
> Enable Global Clock controller, pinctrl and interconnect framework
> support for Qualcomm's SDX75 SoC which is required to boot to
> console on sdx75-idp platform.
>
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

