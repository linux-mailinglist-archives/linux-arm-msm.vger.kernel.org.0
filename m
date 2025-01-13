Return-Path: <linux-arm-msm+bounces-44869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3895A0B377
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 10:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34A013A8A8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 09:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3EA1FDA63;
	Mon, 13 Jan 2025 09:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LrCHGPcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8B721ADBB
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736760989; cv=none; b=Gxiz6LjQJ0D3ErtpJihXxjziDTiiuZg7yOO0A0H1W5x4HP0yVEndq2JIh5Pl0J3blgDaQI/xMJij5KbzyNBxYqocUt9liU3HfkPmau8LsDO8kKezmz/0ak4wAWKdXEHymJLrBZKP0xAXysVDhs7tjxXloMVgQxomWVlgzJy7P6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736760989; c=relaxed/simple;
	bh=f6Fi9jIf7oDTuhJCo7ZuYkX89fOMUuxiSHQX0kBcNuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTKbw2WFSnzG2PVSqN4wZvtY+d0zyUpmifY9JBKkrqwLdnAvaQ9s2z+54C5LlxmlTI7TuBbm+Cj3dAmU3AapSA654gh24qQdVGju4lqC+JxtdxwpcwHbDlkHtrCXGksXMwDz0gr5uIb/NcruJwFST6nzWjAkeKLi3tlBKZ7nQy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LrCHGPcC; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-303548a9361so29371311fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 01:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736760985; x=1737365785; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DmCzDFErLnBOfEME/9QnQ60BqhOwOM+03PSKJOPU4Wk=;
        b=LrCHGPcC0vWoMW43lrMxcsNtVCBP+bWV10xW7peu5IPgZatRlHqtO2uTJbEe1ui7Gy
         lWFwZqDCSYKmPvm8+q8WUiGaplpZ62TqmUvvCwDLeC0VGH+Ejxw/2Qo7NpHuUdAOoPXn
         I7ghwf/cSbCYkhroqqtR+FhE+QYwpexLnhqxujqksKFdQ1BrcgeyRYqp1S70D287pYnt
         NQ8BH1+XGJ/4m6rVqtuFVP3LzhWlxURrQTElmAiLli0/cBlbU6OlW8DSenANIXCIUGRy
         Gd5DAffpmfrUNAQv0xS+7lkcSnSgygojPtSSEDYN3ypMYHo0GRHknAqZmV2DfyJSHnY0
         kqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736760985; x=1737365785;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DmCzDFErLnBOfEME/9QnQ60BqhOwOM+03PSKJOPU4Wk=;
        b=gS7HyCvSvGaLKr0CdcPxDfffUuyFTMlmo403+G7hnnAnchM8loShC1Ycd1pYwFGH/E
         jDQbuzGKKFoDulJo76IZZZRp+OblOWhWStS51OlM11jzJhSR/FDWCLrmYlkJO6O4Jg4n
         c1xHaPUnXqMrQhOsWrvQ56sFRBiXWhZu+0S08r7TQzCwwI3zWoz82/CQ0zd7YyPTdAUv
         pVagOT31moeWD81yJ+qAvM2QBWICHcmrz9j5VkQajy0vGrizgwLZmGzSuFshSjecpQBa
         qyZP/oG3SeszqjHeCs4TJPCTvH0BLSyU8YNQa+X2zR6CQ00kEX/f0KcAntQ89/Yx2Hbr
         azPA==
X-Forwarded-Encrypted: i=1; AJvYcCU5hL9eJT6V9djZXFjgUjzeeQc7lqPQSgNuuLlKthcnsMX7QCPD0iuFVXaX/DTlPynllatNv5ljCN/J24oo@vger.kernel.org
X-Gm-Message-State: AOJu0YyfrAD83gXZiU+a2UDqm9wOiYcOO5E5kbtWbu0v7FHFMj3O75aZ
	cIQPY1aBEmaQlvHf2lSRhoaUSB0YvVEwopxxGayeGwg3UCrxBuuMcFOghc4rodg=
X-Gm-Gg: ASbGncv6MAA6AO7pfa66nDQIpgEbdl0w20gjZAUj5+Y39B901nGdIu/xQhKiwCDKOxU
	6FqQcIzgcB77CI4CI31giUTD9BpTA5YgEWzuJkUSnx0hPtQ76dqic5DRKv85Ml69+GRti3Z0xKr
	RjXynJ71BPBCXhHfsRktsHezpW3betIi8L0vattgKXVWbhAL0+l2yD+iMmNvEJTLdEVGHJ93ul5
	Staq9Yld2sd5lDLwltj4M7UszGAkqOONSwN38zEWM7NwCW0DSmLozsoM1i24JvlSdPMcFQNnN41
	rO4ZTqMAzKVsamqRxTdsPTyrn0z/AHRulquK
X-Google-Smtp-Source: AGHT+IFbM2UcO1EMYcGq6BZ2DVYviG/knD27dv0NN39pkseZUIPzaniaUfN4FBwQvW32Hm9VBxgPAA==
X-Received: by 2002:a05:6512:220b:b0:53e:389d:8ce6 with SMTP id 2adb3069b0e04-542845d1dbamr6309742e87.28.1736760985355;
        Mon, 13 Jan 2025 01:36:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428becd501sm1272396e87.246.2025.01.13.01.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:36:24 -0800 (PST)
Date: Mon, 13 Jan 2025 11:36:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/4] Display enablement changes for Qualcomm QCS8300
 platform
Message-ID: <5exaup4mceoq3a3wk44csybigcg3yc2drvv7nwdndbig7edzya@5d543uzrnoxx>
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
 <qsq5so5i7fy3r7xcjtcr7aq2vtbywh57j3b3e7ddbsmmeu5qwy@pgcntgxknuul>
 <9a87724c-1906-4a9b-bf01-e603b310e47a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a87724c-1906-4a9b-bf01-e603b310e47a@quicinc.com>

On Mon, Jan 13, 2025 at 05:26:56PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/1/13 17:02, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 04:03:07PM +0800, Yongxing Mou wrote:
> > > This series introduces support to enable the Mobile Display Subsystem (MDSS)
> > > , Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
> > > QCS8300 target. It includes the addition of the hardware catalog, compatible
> > > string, and their YAML bindings.
> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > > Changes in v3:Fixed review comments from Krzysztof, Dmitry.
> > > - Fix the missing space issue in commit message.[Krzysztof]
> > > - Separate the patch for the phy from this series.[Dmitry]
> > > - Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
> > > - Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com
> > > 
> > > Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
> > > - Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
> > > - Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
> > > - Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
> > > - Correct formatting errors and remove unnecessary status in MDSS
> > >    bindings.[Krzysztof]
> > > - Add the the necessary information in MDSS changes commit msg.[Dmitry]
> > > - Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
> > >    20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
> > > - Package the DisplayPort controller and eDP PHY bindings document to
> > >    this patch series.
> > > - Collecting MDSS changes reviewd-by Dmitry.
> > > - Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
> > > - Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
> > > - Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
> > > ~
> > > 
> > > ---
> > > Yongxing Mou (4):
> > >        dt-bindings: display/msm: Document the DPU for QCS8300
> > >        dt-bindings: display: msm: dp-controller: document QCS8300 compatible
> > >        dt-bindings: display/msm: Document MDSS on QCS8300
> > 
> > Is there any reason for not using a common style for these three
> > commits?
> > 
> Hi，actually, for the dp-controller.yamel file, I just noticed that the
> previous platforms added the dt-binding files using this format. So, I
> followed their format to write the commit message. Such as dt-bindings for
> sm8650/sm8150/sm8250...

I don't care about either of the formats, but please be self-consistent.
If one patch out of three has a different subject prefix, that looks
strange.

> > >        drm/msm: mdss: Add QCS8300 support
> > > 
> > >   .../bindings/display/msm/dp-controller.yaml        |   4 +
> > >   .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
> > >   .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  13 +-
> > >   drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
> > >   4 files changed, 268 insertions(+), 4 deletions(-)
> > > ---
> > > base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
> > > change-id: 20241224-mdssdt_qcs8300-11b7883dc60b
> > > 
> > > Best regards,
> > > -- 
> > > Yongxing Mou <quic_yongmou@quicinc.com>
> > > 
> > 
> 

-- 
With best wishes
Dmitry

