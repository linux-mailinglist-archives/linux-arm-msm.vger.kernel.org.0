Return-Path: <linux-arm-msm+bounces-75751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC42ABB2353
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 03:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DB033A3D33
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 01:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477792BD11;
	Thu,  2 Oct 2025 01:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3LkUMBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1658A9463;
	Thu,  2 Oct 2025 01:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759367115; cv=none; b=G9HT3DzpWXDdyFJSQmNpM8sGk2mNan/xo+QJGXA8L/uFHE/V3MMytis17aqhkarhPWhLn+nCwRhIce44tCUujCe9fZ4iLSc/pokUnSAytcYGClARb7jcDF6+lpJDIbbJl3h0UH9yFHTU8O7IPinG5CUA9VIVrkei3HORdH5LxeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759367115; c=relaxed/simple;
	bh=9+VYVFxox0DL0YYyNv3hqViaZYhr3vK3YfN8lCChz+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6qn0oiXbIN9Ilz7plEGXReA2csdtWkR1MVF4N3aBqm3P1i1B/ID8s5T48if18KSgzMUQwybQ6O5cWBM6E2AOd3frV6P/4zyFf5xfYGYkxWjudN5Sm05Dtj5IWy11ATUY6FevQhuRyjo2ounetUl+jwwFhXIJMNRebZAkYodMiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3LkUMBa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BBCC4CEF1;
	Thu,  2 Oct 2025 01:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367114;
	bh=9+VYVFxox0DL0YYyNv3hqViaZYhr3vK3YfN8lCChz+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R3LkUMBaWfiGaUeocLQ9ZHgJsWqC23FDt/jKC9VzhyeflCo8u8isn9HykMpCe1a89
	 JweeqDPSNQdKXgLeq7VzsJjgSe05hQYOIUg6wQfec9mpDhv+UhIhjz19ZFKoACvHLG
	 9ZlZQWJFsCD7XEMKMRMV/QsZazTsLKxTWK83CTC9j8MX6G8E73oNsGPb8sM51yj/Vb
	 1sW3QGPFRkMqcNpQ3TWrwu2ZTW7t4ppTBiXeHRyMtlj1oynQBLIij3O1y/OZXQ8Z5Z
	 gI9qv9Xew6a+nRcKgm3kQa98pgka50dpOtvgxgCOM783Ar185p52+aAN2dtHTXk6m4
	 4jsZUJV++rLaQ==
Date: Wed, 1 Oct 2025 20:05:12 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: display: panel-simple-dsi: Remove
 Samsung S6E3FC2 compatible
Message-ID: <20251002010512.GA2810258-robh@kernel.org>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-2-9293016768f7@ixit.cz>
 <mdgdqm4qurstamxyt4nvkrabf2k57sf6so7qp7plmhtpqh4qtk@vohj4ofwhyt7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mdgdqm4qurstamxyt4nvkrabf2k57sf6so7qp7plmhtpqh4qtk@vohj4ofwhyt7>

On Thu, Sep 25, 2025 at 11:51:47PM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 11:12:48AM +0200, David Heidelberg via B4 Relay wrote:
> > From: David Heidelberg <david@ixit.cz>
> > 
> > Follow up commit introduce the proper device tree definition for the DDIC.
> 
> And the reason being?
> 
> > 
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> >  Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> > index 9b92a05791ccf99061ab7a1e01937bb832a96fe6..6c1249a224c8a170b33fd3f331f985f16914cb2c 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> > @@ -56,8 +56,6 @@ properties:
> >        - panasonic,vvx10f034n00
> >          # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
> >        - samsung,s6e3fa7-ams559nk06
> > -        # Samsung s6e3fc2x01 1080x2340 AMOLED panel
> > -      - samsung,s6e3fc2x01

If this is already in use, you can't just remove it. In the end, 
compatible is just a unique id. So if this referred to a specific panel 
used, then we are stuck with it even if the naming is not ideal.

Rob

