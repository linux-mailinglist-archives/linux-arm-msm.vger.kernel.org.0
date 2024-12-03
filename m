Return-Path: <linux-arm-msm+bounces-40083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5874C9E1DD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CF1F16641F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D225A1E009F;
	Tue,  3 Dec 2024 13:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eBra507H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BAF1EE031
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733233316; cv=none; b=gT+Phje4kea4u22BnbI4BDTPZHGpqYa7Pum7pWkEq57fOAt9ry1ikX652GphPUXvfDMTjOj7oTX9fT5kP2YZ9YlZtICAWbEI6Ok31fa8dNQhlb6C3SNuXUQNJXF5Ee2kyNtqT2psP8SVbqwlzxp7UW00so1489Kon2lf88PLtJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733233316; c=relaxed/simple;
	bh=DqfltT7T9BezPLgtZyLHK/lyVoHlR7r77Ivrvg4Dg2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2ARRMU+sfsIHsQrg+wSw9tx9bHltsb79IMh7WJ/aBb5VTTi1c/WNVP3po5ExSN/1LPctYPtICY6NEj6I9wmyvOfBO7ok/lpiSKYAWIsYI1wcQXIE8T+xvchj+UgEy+fqSZMwipXTlCqnUetsTeD7wdQnJwQ3W0yG01YybvuUP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eBra507H; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffb5b131d0so54496801fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 05:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733233312; x=1733838112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b9EQvBAb2SX0qrGU/ZgIliBiKbnHvi2rA/qAWxRRbY0=;
        b=eBra507H+jqog4Lr0wPhtilGP+q3t97Y+wM5N+XMDPucSk2F4wIUx94Zd/n4NykM3N
         umAKdQyaZelp2YwsWvXFwnShFTUZxTkyik//einNrO/uoXE+Vbo25SWW52I3Z8H05R2J
         j1bztD9CrrSfX+iKEE77vZNlj0AfDMesEBqbAqxenH5Jz3HEa/smpNl+tAQEIPnziKNR
         k5qwtWt909L3UGyBBCREqjjFC4ERtfnYv7zR3zO4fY+83p5CIIE/J1qY/DMuvcmbtGJ4
         cuHURRjzx9YkvKMyiGE8q7XdWur9YnZcYYYf78ih107JTpYFu3c0trQrRPLFThRlUBPZ
         7png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233312; x=1733838112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9EQvBAb2SX0qrGU/ZgIliBiKbnHvi2rA/qAWxRRbY0=;
        b=M1kaY1SpTG3mPV9n5h2y74h5JkbD4VjUvDZ0LdVIiih3oyPnQOOdEwWPTDEWqClsMl
         CgCxBY9phiSv/BH3z4pPEB5T1giM15ayWJ02gSMs8DoBFbsff5nVSBFNUmW5jjUSeHiK
         fi4rFryE9EHWYoLRAA4XjMA++GwQdVTdkgGk5TUdkEFmRRcjN1VNE+tk2VBJ9DSTK2WT
         iZs0FDQirKMqMT48yIjYtl8kJBzkEOttkK2+sOy99ucFOSCM2Y91VUKkVsUSKzj7V7rj
         BC9ZQNf5l3N5X0Vnlet/FZ29rtlH2/INW7n+bIcEsGcNhZ7Hcj4nsAMrX2u4M/8ee5/G
         /MQw==
X-Forwarded-Encrypted: i=1; AJvYcCUt+GZ1dsMO1q32dybf5iiz1x4Rvu/oKLPVvmIYQIkJ5LohK7afKevDOf5NVwN3nE8PfpsJj8l5LH1BF/c0@vger.kernel.org
X-Gm-Message-State: AOJu0YxzvYLAgxiGJmEOYOydI6qqqVbSAoe8Xd8IbCUxsOetoaFrJV2X
	3SQY4dNdRxc5luP4r3FLoy4cdTs7Z2+In14XpXy8F89mFfgcGWc2YOAqLxhUano=
X-Gm-Gg: ASbGncv0jdjlvx0LcWe72k9HBStPEGuTYzekF5UUYiAqgNXXJrvSNC3TLLjsUQSXXtG
	8ci8K7eYhDObq04eZAIphTfZT0JtFg5pIbG9ljK0cyxxPNwjOkbEn8+jjj5vj/IAd0ggBUhrmos
	Ct+SIi92CcZpUS9FSWP3hDCstZSgRyJNPi8XtugLjnj1NCJEEGPOkqRJ1HooeWv5VkzJ13ZjGfp
	poITr9XEgJp5p7gDBzrKSCqdyzLVVrBNJ85B7htWz4paRzDTdpVcbqFYnVVAhti6KjqjJPaF7oW
	qT+Ek2Tww9+T0Gng/HwInpl8QSBRxQ==
X-Google-Smtp-Source: AGHT+IHpMzPr6Lls4GRyBuCcJBMUBsc/X9uSkqqmTyZzvhlEVvAz5e+LXYqBKqUPPK3QZnPGFneqVQ==
X-Received: by 2002:a2e:a99f:0:b0:2ff:d49f:dd4a with SMTP id 38308e7fff4ca-30014e2437fmr870081fa.21.1733233311908;
        Tue, 03 Dec 2024 05:41:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc75236sm16038451fa.86.2024.12.03.05.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:41:50 -0800 (PST)
Date: Tue, 3 Dec 2024 15:41:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: msm: dp-controller: document
 clock parents better
Message-ID: <gpqrugcsyhz32bvip5mgjtcservhral2o5b6c5nz4ocwbjw5uo@eypv4x6jyrdr>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-2-9a9a43b0624a@quicinc.com>
 <bfa857c2-cd74-4fe2-a88c-3b35a58710b0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfa857c2-cd74-4fe2-a88c-3b35a58710b0@kernel.org>

On Tue, Dec 03, 2024 at 09:01:31AM +0100, Krzysztof Kozlowski wrote:
> On 03/12/2024 04:31, Abhinav Kumar wrote:
> > Document the assigned-clock-parents better for the DP controller node
> > to indicate its functionality better.
> 
> 
> You change the clocks entirely, not "document". I would say that's an
> ABI break if it really is a Linux requirement. You could avoid any
> problems by just dropping the property from binding.

But if you take a look at the existing usage, the proposed change
matches the behaviour. So, I'd say, it's really a change that makes
documentation follow the actual hardware.

> 
> > 
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index 35ae2630c2b3..9fe2bf0484d8 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -72,8 +72,8 @@ properties:
> >  
> >    assigned-clock-parents:
> >      items:
> > -      - description: phy 0 parent
> > -      - description: phy 1 parent
> > +      - description: Link clock PLL output provided by PHY block
> > +      - description: Stream 0 pixel clock PLL output provided by PHY block
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

