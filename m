Return-Path: <linux-arm-msm+bounces-44859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFE3A0B120
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 09:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBEE518819CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 08:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5DA233158;
	Mon, 13 Jan 2025 08:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i41oIbcY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4907C233157
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 08:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757002; cv=none; b=OOFkLpwxXyZYQdQkGfwNNcb9Uf3vE0og8gkzm2VYAzuOnlOn4uPQULa+bFzMMKhudJP17sreZ5NMeESyUTPhiTpcWF+AYrGFCxKr9fDsgXOlm1w2Kh6wKqJDNIC6cm8v561LysgXhPyIME+4o3Gp1uZbd54o9HTU7rSLS+5+jZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757002; c=relaxed/simple;
	bh=sf6dD5Jhczzuy/5Ap2KhKugjig5e4+SbB93j6g2Fhw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bfy7+zMKs4OiUfgMghXuri/rDQImgAvRRnRhXd3YpOChWfhJePp25wAD1rMZfFtyVkeyJNWvvkvkt14iyo5YKZ7bf+NNfX51OLwPrzgc1vLzsAcy/s1yHIJBeHfzu05VajwVfON0rB9+vupBUoh9OtRVbIffSuPstyZpcwBYuhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i41oIbcY; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-304d757a9c1so36746351fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 00:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736756998; x=1737361798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wpNfgPmZHWvswUwSBHQaLXxsDd/iOPSUp9zWO21bZZk=;
        b=i41oIbcYyTZIg+bXgNvVGoYxu12HOMcNmAFsdAdS5VNxkipxJNJBJT9kBKh092OKfJ
         XnLgfqM03s2Wo/SaIrgF/j58i/NLXkbAxZAt+L4yH2czFYiN5TVSTvxXLBXjbIbhIfxx
         +M5xuXacW3AGA+DKJg0RI5ovIQj+xZXGABLEbbxKTjKknzdegkLFZfLZ5OIO6hWlC5RO
         bNEkOfYXyFvuyfrPJOFGQ+NXeBlGU9f7Be+d+z7mNq9gXA/2IRyz8ZYOxFYTdwxkod+f
         LdK5qY3J8//DaDcKIzXaIzUzAvav21OVTY9JH9JYN02nCwKn9BEjX7OlkVB9P4Y5oqY7
         mQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736756998; x=1737361798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpNfgPmZHWvswUwSBHQaLXxsDd/iOPSUp9zWO21bZZk=;
        b=acn3cfkGQiXFEaRV7kzHLQErl5h65hYRlvqdsOaBopEzZHt9Nr+/KazJLyOzuXVuqL
         S7PuSyr0hN9RvDZ075JHGz4hwoqgQfFW6w5yKUXzW8M7gbiyVwaYRNSFVGoTUtSJ78u0
         iTkvDNPzMTTQUPkPcnYQ8HGyDJcPAMw3X7kMvbCDfuCdxJgBSIi7MAvJiwfC7TftJQpq
         76j96rMzZKUSMgwta0Xu0v1vd9AXhHLIv+VT9zQFeGD1heLChxPK1aPxL4OG6YRDAksD
         BnqAJYDrIsCAcepGVwcuQeSxVOpRFnTDzd6YtzS1nkYbrafrLzBGRPFCZtOEF8rESNP7
         B00w==
X-Forwarded-Encrypted: i=1; AJvYcCWJ7hJi40der/842TeRUSSBbw2tSgu5NUbXqI7r72iwm8HK9aROWJedOgG2q8g6wNS+goj1KDGMddNjSzi3@vger.kernel.org
X-Gm-Message-State: AOJu0YxOSkyIYVCnyL0RfhA/Ho8ihQeuFXeP211H07jo0dPBKZh1+nax
	cozz9AqY9qcgJndBT7UJhbJKeN1S8d5SBSlWM1YJKNCYeLD5iUWQ1duRnAE/Vdo=
X-Gm-Gg: ASbGncvZFWoXmDZ2OnQoySHLlVnxTtQIpXm/LhzmRCVTAG5isze4jKwTyIhAaoKDvQX
	EjmS04YHClr1yBDOQJ7SRIZes5niOOpE7Ng3gNzAYFOe6Rkve7bEcvGsiH6KdEP8P9dEuJBjHC1
	U5edz+K1TEgn7l1VJhhvewv4/SvH5jd1WzCCICDXHvjWyP3gIN1bbQA4W7yFrrAo3KyxTosbFL6
	eDRdsrwInI+ocuVOWyyIWdRTqOcryEG717p2NzzgC2iY0kcYGYADwe+N0A1GonD2YVmnzIIZeqv
	h7R6pFHTp5NcNY9Q4f6C2qgnVEWMZemlxKna
X-Google-Smtp-Source: AGHT+IE54yzyiPD4ub1IysG2kNFqrLtRmbf0RfdOOdV+LhLhjjBOzskOmKPSTGDp09AS8bI5jIgTSw==
X-Received: by 2002:a05:651c:b08:b0:302:2cb3:bb1d with SMTP id 38308e7fff4ca-305fee0b3a6mr41291591fa.12.1736756998394;
        Mon, 13 Jan 2025 00:29:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0cf1f8sm13837701fa.27.2025.01.13.00.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:29:57 -0800 (PST)
Date: Mon, 13 Jan 2025 10:29:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH RFC 08/11] drm/msm/dsi: Add support for SM8750
Message-ID: <uyidfuh5ul5kcg4keeev6yagmjc5ksun626dyb6kdgwegc76d7@iu7ggdhgt5qr>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-8-b3f15faf4c97@linaro.org>
 <3p7kjok5jzwvgt7dxuad26xgdkjd52v4gbtuudvgkeoj33skqn@afl2ddtsq7s2>
 <4fc7fdd5-36cd-42e6-af4a-e0e429f9f50b@linaro.org>
 <7eupqawhdrbjgsj2p7e3ky7uj62m252i6dzkb6y23btocedp3q@qmw72nmbk2c4>
 <6ee02d22-7a00-4c7c-a5e9-63e91d7d84ba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ee02d22-7a00-4c7c-a5e9-63e91d7d84ba@linaro.org>

On Fri, Jan 10, 2025 at 01:43:28PM +0100, Krzysztof Kozlowski wrote:
> On 10/01/2025 10:17, Dmitry Baryshkov wrote:
> > On Fri, Jan 10, 2025 at 09:59:26AM +0100, Krzysztof Kozlowski wrote:
> >> On 10/01/2025 00:18, Dmitry Baryshkov wrote:
> >>> On Thu, Jan 09, 2025 at 02:08:35PM +0100, Krzysztof Kozlowski wrote:
> >>>> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with two
> >>>> differences worth noting:
> >>>>
> >>>> 1. ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
> >>>>    offsets were just switched.  Currently these registers are not used
> >>>>    in the driver, so the easiest is to document both but keep them
> >>>>    commented out to avoid conflict.
> >>>>
> >>>> 2. DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> >>>>    parents before they are prepared and initial rate is set.  Therefore
> >>>>    assigned-clock-parents are not working here and driver is responsible
> >>>>    for reparenting clocks with proper procedure: see dsi_clk_init_6g_v2_9().
> >>>
> >>> Isn't it a description of CLK_SET_PARENT_GATE and/or
> >>
> >> No - must be gated accross reparent - so opposite.
> >>
> >>> CLK_OPS_PARENT_ENABLE ?
> >>
> >> Yes, but does not work. Probably enabling parent, before
> >> assigned-clocks-parents, happens still too early:
> >>
> >> [    1.623554] DSI PLL(0) lock failed, status=0x00000000
> >> [    1.623556] PLL(0) lock failed
> >> [    1.624650] ------------[ cut here ]------------
> >> [    1.624651] disp_cc_mdss_byte0_clk_src: rcg didn't update its
> >> configuration.
> >>
> >> Or maybe something is missing in the DSI PHY PLL driver?
> > 
> > Do you have the no-zero-freq workaround?
> 
> Yes, it is necessary also for my variant. I did not include it here, but
> I should mention it in the cover letter.

Could you please possibly backtrace the corresponding enable() calls?
I'd let Stephen and/or Bjorn or Konrad to correct me, but I think that
such requirement should be handled by the framework instead of having
the drivers to manually reparent the clocks.

-- 
With best wishes
Dmitry

