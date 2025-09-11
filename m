Return-Path: <linux-arm-msm+bounces-73073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F1AB52C3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 10:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67F39564F38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 08:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FE72E62A1;
	Thu, 11 Sep 2025 08:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JZRFB0Ke"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C14B2D480F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 08:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757580740; cv=none; b=h7+L6+zHDnKKP1883nmfIOdNUnkat7me92rMV8CvCxQV0/nkSnzvl8ILbCXGMr6e6Pvq3u29+Bo3bqlWQU4OP5QxuuiIpgyvjEc8GAJrUqf2cP6212qhvylck3688b6E9kru6K2YEPmRSfgnW5nlndsaL/yw7c8+8hOolQzAyLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757580740; c=relaxed/simple;
	bh=kZ5fy3elgau6E9A2kLbn2WoncgvNZoGo+/fR8M35qT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QB//wjgRpp8RNFpRbDWwXwA3utJBh8WZ6NnmpApNH9ADSoR4FojcNaDUzghd3rKwsB4DoXk8n4hqZeKP891QzAXFNApk31x4Xh+3v7mxRRp1i17NttwFEJBcCj6eQfHXh6Yf1WI21tVj1lHtg8ykEyAGBUlXtrraeQOxbqN4PLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JZRFB0Ke; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3dce6eed889so483327f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 01:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757580736; x=1758185536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u8qJmsLMZ59bKpzRgTLez2aQP8hw0rBkTZMNNSe6hBQ=;
        b=JZRFB0KeLs8Ij4PmVWP7EmYXSooGPShhxU+UiJRDgsvBIHwZDgdROxL/Wp7q2N4bRg
         h62SQ3YcaRwTXu0JzH1CVWZ+32dm6vfClYIjpOjvuk+csJDo9YbeKlSVmrl3SjZHs6sS
         GP3cgC0uaec2t/6hfMnRa9+Y/cSkhsr+8evdzITUULWyUzvfoXU+K8UhC4NycHScOC1G
         6x8T2mJIIuANu0jJe5XGs4hJJjEybp3L/anh3X8E5L6T/9l+yQpgcL25j+5t/SA1kCyo
         CQ/J1FhyQXMGeFZYQBLmNQkxcC6LL4OKxGLwHgKGCpt4amBDlRLYJOp4lIrzxniwRzIz
         +4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580736; x=1758185536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8qJmsLMZ59bKpzRgTLez2aQP8hw0rBkTZMNNSe6hBQ=;
        b=SmnbMdnS3pfPXPRk4bQdTNZQh9/PAz3l/HlPLlgyuVlu1R7AY12lhA0O2nuvnkjlHL
         rhUG1ZR3kiFiLellqPE+TlBel7dSRooCPui9FteGQI13Rc48WlZSAvYrSybBd7wEALMe
         jWVf06xMh28jmhYDG7Q0gsfYJBLkyGuP9Z7HIARS84/l4I/mKAY78SjxGStYl30GTljX
         +g8rXHd/XlZO+BCtc6piVYnOUYGk45KQsO0v01sp6OCWxwiqX3IDaFCq2Hv0rSlgk4dk
         24uRUOr0Tc2ZyYnMbsUHYnjR7Vax8xpie8u/D7M4L/9RTrRynCW5Yxju1HWOzDGQ31cN
         oWDg==
X-Forwarded-Encrypted: i=1; AJvYcCUFmc9sIldpUE6bN/MOfbJqoEn04fxr6OaKdWtUwkz55A2+ZWFzEgvC9rUqQNnEkaOIfjNYt1f/GGj8yAKV@vger.kernel.org
X-Gm-Message-State: AOJu0YwVGrzUbGc/XxT8quuTgX9dZCI1lZVR8VcT/Q1/wbdP5ppVrOCd
	5CuE0Xkr0CdQZfw47AAgMI33wavRcfk0neZLoxCBnUGXrUfYrp01jvHimcv+TLOQObM=
X-Gm-Gg: ASbGnctCLRVODlhWNUrcJfuFj1/8B1zb4KYYVAf0r0SdOb38UedTDofaNUSuVWqVqR5
	AY5KlDhC5YFggNXeFkzvt1HXxs/g88Sku3+2jH08bhA2IinnE4dF3yIhRlntbRj+uA9Grnb8CdK
	NpIj+PEIBdyTnIMcRNNqPjj4fYpD9eZE3ORAtpTmtZxgjOXMTyV8ES85kCLtgaifHNZZlo6t4Pt
	xGR8gmDUOSeKrLByGcmvn/4SitzXZ/GkT2fM17o7kwI6c9sJ/6AQrHzwWgAfnaeMJH8kNH55qx9
	ryBP4bQXYI+0rhs374oImhshwF8wAfonUD2KLraNZTuGH64LEIZpRPvI9WvzZ9viMQDEKYnTFJb
	tWssgpAj+2U/LWfdQx4Spwg==
X-Google-Smtp-Source: AGHT+IHqlhwEH3jYn5iJwUlpidH2lKZr/CFhHYU+IwRD/boV7YUGofPRtjLqATt1fADPaiU6f8KjMQ==
X-Received: by 2002:a5d:588c:0:b0:3e1:6b:bb17 with SMTP id ffacd0b85a97d-3e64c4a8213mr14929470f8f.48.1757580735700;
        Thu, 11 Sep 2025 01:52:15 -0700 (PDT)
Received: from linaro.org ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760786cddsm1619682f8f.14.2025.09.11.01.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:52:14 -0700 (PDT)
Date: Thu, 11 Sep 2025 11:52:13 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom: edp: Add Glymur platform support
Message-ID: <wetzewmbraeawwintmxqntjhvennq5iu2jeegel3glk7y6rsnf@4vwscm5bwezr>
References: <20250909-phy-qcom-edp-add-glymur-support-v2-0-02553381e47d@linaro.org>
 <20250909-phy-qcom-edp-add-glymur-support-v2-3-02553381e47d@linaro.org>
 <3bo2xr3jb3hrzsetjzd62dmcif2biizvoanxwtyhr2dmkb4g7x@dgrcvzujcwgq>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bo2xr3jb3hrzsetjzd62dmcif2biizvoanxwtyhr2dmkb4g7x@dgrcvzujcwgq>

On 25-09-09 14:12:46, Dmitry Baryshkov wrote:
> On Tue, Sep 09, 2025 at 01:07:28PM +0300, Abel Vesa wrote:
> > The Qualcomm Glymur platform has the new v8 version
> > of the eDP/DP PHY. So rework the driver to support this
> > new version and add the platform specific configuration data.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-edp.c | 242 ++++++++++++++++++++++++++++++++++--
> >  1 file changed, 235 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> > index ca9bb9d70e29e1a132bd499fb9f74b5837acf45b..b670cda0fa066d3ff45c66b73cc67e165e55b79a 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> > @@ -26,13 +26,15 @@
> >  #include "phy-qcom-qmp-qserdes-com-v4.h"
> >  #include "phy-qcom-qmp-qserdes-com-v6.h"
> >  
> > +#include "phy-qcom-qmp-dp-qserdes-com-v8.h"
> > +
> >  /* EDP_PHY registers */
> >  #define DP_PHY_CFG                              0x0010
> >  #define DP_PHY_CFG_1                            0x0014
> >  #define DP_PHY_PD_CTL                           0x001c
> >  #define DP_PHY_MODE                             0x0020
> >  
> > -#define DP_AUX_CFG_SIZE                         10
> > +#define DP_AUX_CFG_SIZE                         13
> 
> If it differs from platform to platform, do we need to continue defining
> it?
> 
> Also, if the AUX CFG size has increased, didn't it cause other registers
> to shift too?

AFAICT, all platforms have AUX_CFG0 through AUX_CFG12, we just didn't
need to write anything to the last two so far.

