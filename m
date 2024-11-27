Return-Path: <linux-arm-msm+bounces-39352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE61E9DAC17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 17:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BB711696B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 16:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9A5201008;
	Wed, 27 Nov 2024 16:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c8ruGZyF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF29200BB3
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732726391; cv=none; b=FZx0RLlAv/+1rixaMSkUWXKGmt5kXHYvuEF/Zi3lT5TKxCL+bUTITg8DUrY6EHMok3ACfraM/98iW5tC9OZ2fql4Ihl7yM7KvNGyhXpdMuEQ3Eh6Cuthx0m6bwIvcD4kxsIVMUjZwHSh7nA87QqU3dPpcpYJhsXE43iUfsfUpo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732726391; c=relaxed/simple;
	bh=ANjrQtX+FOZpXZD7Z3yfhh/CtDwI28c9VtHVDdzAeb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJ15QLJw33neTXEMb41p6uoRyV7tusJ9JS6pYEAJWzdVYRE9n1DIe33iUycbqcs+Ux8KjsxvM6kRDvoVq6Xy3EgK7d89kZg9tiWngByq4msT47MRALpGudlUR/peGWBRzWzAAQ3BZwzMVncOwLtFAa13bMVWN4A1jnYpsyPv9mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c8ruGZyF; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffc1009a06so57044241fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 08:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732726386; x=1733331186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/7v30ajDWU7DkHOcX4MYPBB8oCwa2yjywh2jvuIi8/Q=;
        b=c8ruGZyFm4NSpyKA6tQYvz9U30ZcGc8PpWVxfWlf2AFrVDpKmsrmmnM+OuaQJpBsa8
         0r+0VOqX62+Sw9mPD+cqTGNyNNRXSIbgmL3U8dtbRr5Zk8eOJiJ86/xF/uCEmzjR1Rk2
         F7Fdk0P/8ZU3uhaLTJh01SCPZniscCPr0K4XCP+s38YYsudfpiGvOU6lvBZkslzPs0p9
         zbGyUPa45qxJ/py9Y9BB4hnUdYOcIw2xpR1Lj39IPdSbSh0uuyU3xe4aE7jCkKS9wub5
         TRNtIZZrv1V/XdB2lyzUilHs+X4k0BreSK5IMCYq+FVY/fwmhbe9E16dDuPaewCnJk4U
         QQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732726386; x=1733331186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7v30ajDWU7DkHOcX4MYPBB8oCwa2yjywh2jvuIi8/Q=;
        b=eH+PVnq4ZjgVzeP67RyicVVm/8Koe2L+IJnQVTKXY1mAtGsoBqslIuW4waPLOsGM38
         BZ4V2K5EXYtDRE1fbzFYHRx9sHwgYotEPShysqZ2ZIicOTDnLqtlBfKgR1JKytc++CdG
         RUnj+MaTlWp+L0I9ZqRZ3O7SBYYpi8xq9m32TK8n9CNGW5ty1Zb8ArXhRypWFuXrljBC
         s3OGdGYEDWjLcHI1x59NRX/VImP2t8xymIVECeUZ2VLfFvVAwjpt2KVis+/ZobS02QYK
         mulq8mZzz6hD1qdkMd9FnFshXaDUaRuDyu66SxD3hvD+n00DQzujpQSTWwCUgQ5g1Puh
         GT9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUv3BPKfQaZoNM92c6Aw4CtgMQX6nwOjJMIolZmDvlKJuVe/l0XMnIXUMFl1j5oTpSP9lav0lseabmzO+m/@vger.kernel.org
X-Gm-Message-State: AOJu0YzAyQ+pOYhb1hXyqfR0dGDxrOpMGlj/GahZjbAyATIZ/w8xzb+2
	2+NXa/TIzQisMvP+oy46VU2xkq2wNjYGjzcr6LTttkNwPnB2FIiWcsWoO35oq+3Dzpgpz4rA9I4
	k
X-Gm-Gg: ASbGncvrGWnHvbx9Mf2vkqQbNPzKHLY+PsD+w/deAa04zy3CRpTWOqJVeI3H8bwJAcE
	GqYV8EDBLNGoFuiNH0RBjBH60SNDgCeXWdStRB2l9FDauFMzEExOalQtUsQ4c5GvFWxK7sLNxqY
	edTgylDzkJ+KuCBrMy6jrNudAlhkwC2sSRZ37S+2A3vQauve5D1faeNJGoU/Tu84/O3niBsAdbK
	iuH/S74dZ3en+egfFStVLZLfJqnGgtTd0hMiyZlSQe4mT81alJQsmzlsrifiX+DzfUKRkFVDmbF
	HtTHuERZkVaN9iwmvME4rhghiKtyUQ==
X-Google-Smtp-Source: AGHT+IH9+UmAn6betfIOs+qsqlgP3V0EyfCx7dxI/UYHXIvmC+OteQf/W08K+APQntKbnIIC9qhNXg==
X-Received: by 2002:a2e:ab0a:0:b0:2fb:3df8:6a8c with SMTP id 38308e7fff4ca-2ffd604aa06mr29609471fa.23.1732726386324;
        Wed, 27 Nov 2024 08:53:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffae685041sm18160251fa.48.2024.11.27.08.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 08:53:05 -0800 (PST)
Date: Wed, 27 Nov 2024 18:53:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>, 
	Georgi Djakov <djakov@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Odelu Kukatla <quic_okukatla@quicinc.com>, 
	Mike Tipton <quic_mdtipton@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V6 3/4] dt-bindings: interconnect: Add generic compatible
 qcom,epss-l3-perf
Message-ID: <zchtx32wtii2mzy2pp4lp4gdaim7w56kih7jcqes4tyhu24r3n@dagazlsdgdcv>
References: <20241125174511.45-1-quic_rlaggysh@quicinc.com>
 <20241125174511.45-4-quic_rlaggysh@quicinc.com>
 <20241127142304.GA3443205-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127142304.GA3443205-robh@kernel.org>

On Wed, Nov 27, 2024 at 08:23:04AM -0600, Rob Herring wrote:
> On Mon, Nov 25, 2024 at 05:45:10PM +0000, Raviteja Laggyshetty wrote:
> > EPSS instance on sc7280, sm8250 SoCs, use PERF_STATE register instead of
> > REG_L3_VOTE to scale L3 clocks, hence adding a new generic compatible
> > "qcom,epss-l3-perf" for these targets.
> 
> Is this a h/w difference from prior blocks or you just want to use B 
> instead of A while the h/w has both A and B? The latter sounds like 
> driver policy.
> 
> It is also an ABI break for s/w that didn't understand 
> qcom,epss-l3-perf.

As the bindings keep old compatible strings in addition to the new
qcom,epss-l3-perf, where is the ABI break? Old SW will use old entries,
newer can use either of those.

> 
> > 
> > Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> > ---
> >  .../devicetree/bindings/interconnect/qcom,osm-l3.yaml      | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> > index 21dae0b92819..e24399ca110f 100644
> > --- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> > +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> > @@ -28,12 +28,15 @@ properties:
> >            - const: qcom,osm-l3
> >        - items:
> >            - enum:
> > -              - qcom,sc7280-epss-l3
> >                - qcom,sc8280xp-epss-l3
> >                - qcom,sm6375-cpucp-l3
> > -              - qcom,sm8250-epss-l3
> >                - qcom,sm8350-epss-l3
> >            - const: qcom,epss-l3
> > +      - items:
> > +          - enum:
> > +              - qcom,sc7280-epss-l3
> > +              - qcom,sm8250-epss-l3
> > +          - const: qcom,epss-l3-perf
> >  
> >    reg:
> >      maxItems: 1
> > -- 
> > 2.39.2
> > 

-- 
With best wishes
Dmitry

