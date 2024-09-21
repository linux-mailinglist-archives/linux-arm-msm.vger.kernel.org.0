Return-Path: <linux-arm-msm+bounces-32147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C42197DE66
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 20:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A70971F21AD1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 18:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382F17DA81;
	Sat, 21 Sep 2024 18:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yeoYbb2S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FC37DA79
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 18:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726944756; cv=none; b=fa9OSc4jmxW5Ye9HGYcDpBtLd/qQxB5ygxik39lRuxKa9ldFQRFVGOMpORwwuvDYf4NkXYXAUzEF5M6P+0T+be5JvfjyfpMd8zey3GFMPUXCvOS/XsNuv6Nc9eEqzvP6UCRqFbfEgHcLt6z78PLIuMT/LVSzJrarq1IMWJkL7CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726944756; c=relaxed/simple;
	bh=bS8qi5sb9l6qZWoXE7ybyqltpxGbc0CNIgBhoQKKvII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cApKf9ZDRJouYT5BuyGVk2duneRE8ML2KBjConnWCQfVwOovOEuNm66MVI01MJx2U9u1qYiTJMI6MnchoM7XrBshcCM2fkvqaIMPR4nRdJF2OP4TfDRXRrJD5XCo5jUSrW6T2jEDQXnRwnC+BjGQm3AWTQqsI4B3J5qSXut7dds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yeoYbb2S; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-68518bc1407so28466377b3.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 11:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726944753; x=1727549553; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9YOWHzzVwKmpVXuH6tT4H74KWT1SKFzuJzeXObWQIF0=;
        b=yeoYbb2SxEMIkQaVolqPtiElSAVP/KEuGK9DusQtHrhMF41IK1mOa/JEj+lCZN4fxI
         6ThKBtLeT/Ur+NLXvsoIVH/Jh45qTGy27bXJxJt2Z3dEm8phUz474LQOGqpYG+/Q2Vn2
         Pb/edwpa/PxHiJm7y+haitROLsXYR8gWHt0DxURI6v7CfMKfOH9/89I7XZoZq+4WBKr3
         iHW0OY/yw9qrJXqAbz/k94k7utkGhq40YPuLa/W/orenjVAf1LvRhQy7/z7i//eiq2Vq
         m8vG3wkTedShrcyt0msHBe/gGZXsT1zM+jrDPfBjtdgMjLkOsSfhu5cHUmjohA7OOg7F
         HGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726944753; x=1727549553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YOWHzzVwKmpVXuH6tT4H74KWT1SKFzuJzeXObWQIF0=;
        b=At5tGgPojyRk5JY1pWenXi15sih4PfbZPVn+Bmf2K0afkR1Y3FbnAYTkc0OohSM9K5
         w8oBOLCIsxuNCC1icZ7FNXXZ0RU5l7POiZSs5+WNAKjqjbAJeyqPVMo1AekZqtnEWo60
         kOt/jOBHc4vHW5Gv/rNQmN1TqGewJ166ZZHoujpTsMYJ7zZdE6LUO6A7L+hH1OHttGkg
         ECDBCWjMkDdcjpv1QhZmGPnIBSqH/WTvOFgXV4t1YdoSwT6shrDNpDnFudPjMpmuOFL5
         WPAYdI2+JaUvvV/vcrtIY9av+u8XRH9yzZ/9GS7/r2HYRQxS6PeMsLkH0D841Ue86HpN
         So+A==
X-Forwarded-Encrypted: i=1; AJvYcCXcWBmNl8BovLRjjkXDkA8gHy8aJDu1dAouRYOovKW0lBnj9239FdHxYMt4QvOQW3XuSHSdxfgAkjD3pBBg@vger.kernel.org
X-Gm-Message-State: AOJu0YxNhfBCgQnrKVPeiqzyKdxsVV8dFnrZomLLyqPGvSHIwmFEpMYV
	xQocYkPTEUd/JX1EKuLBAirPO9BrxOdYRVXmzaITx8PUvlzMz4rtMd8r/mUSpAzisiJaYJGDon3
	vcHXC98P1ANo/Fth/13Ri14rygmvEcnQ7QaIKTw==
X-Google-Smtp-Source: AGHT+IG5tWL7XQk5lTl4IxHn8rt6ybrJDIlTwRt+uw8pRlg2OHh+fLMthOUKic2sFVqZrPqkaKCtAgCb23pQ48rnvJM=
X-Received: by 2002:a05:690c:48c4:b0:6db:a7d3:6410 with SMTP id
 00721157ae682-6dfeefe5f02mr62623227b3.44.1726944753473; Sat, 21 Sep 2024
 11:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-2-quic_mahap@quicinc.com> <78d9c6f9-5667-4ecf-92c9-73e9e4b9b424@kernel.org>
In-Reply-To: <78d9c6f9-5667-4ecf-92c9-73e9e4b9b424@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 21 Sep 2024 20:52:22 +0200
Message-ID: <CAA8EJppc7jUfVx7Fw=tBjWGdp7ULb2pbK9x-re+1bNq2kxMR4A@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mahadevan <quic_mahap@quicinc.com>, robdclark@gmail.com, quic_abhinavk@quicinc.com, 
	sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com, 
	daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	swboyd@chromium.org, konrad.dybcio@linaro.org, danila@jiaxyga.com, 
	bigfoot@classfun.cn, neil.armstrong@linaro.org, mailingradian@gmail.com, 
	quic_jesszhan@quicinc.com, andersson@kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_kalyant@quicinc.com, 
	quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Sept 2024 at 20:23, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/09/2024 09:14, Mahadevan wrote:
> >
> > +        clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> > +                 <&gcc GCC_DISP_HF_AXI_CLK>,
> > +                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
> > +
> > +        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <1>;
> > +
> > +        iommus = <&apps_smmu 0x1000 0x402>;
> > +
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +        ranges;
> > +
> > +        status = "disabled";
>
> Uh no, it cannot be disabled. What would be the point of it? Please
> reach to your colleagues for some internal review before posting (see
> also go/upstream in internal systems).

Rob, can we make it part of dt-validate maybe? Error out if schema
_examples_ have disabled nodes.

-- 
With best wishes
Dmitry

