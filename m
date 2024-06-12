Return-Path: <linux-arm-msm+bounces-22442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A5390538B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 15:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D38161F23F85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 13:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3829C17B408;
	Wed, 12 Jun 2024 13:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHGEEGJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D4C16EC0F;
	Wed, 12 Jun 2024 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718198405; cv=none; b=S6H7auj0dLQTlYyXQO/TjwwWcqoXChHVOkDeZah1VKjgocivGsk/o9Cs6HvyyJIaBqHfRMVM7BKdXKdCcWR6eI079ctCrd6TbwJX6XYj+yPxXHeSBe3iuIiVttDC1MJD3X84AhoP3lcjG0rrp8lZVWITZas4TopUkp7RUchv7lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718198405; c=relaxed/simple;
	bh=ht4JeB3Vd88zOyRF2cKT3rK5jnnmxZ0bHNHoyEMgEas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O930H8bGhtJVG4NU/ZPJOJmah8mZxKSO7OQMZW4eiu+dGNh6qBr0YS9dtptxEM2SzdfsuWUFargj78y6lWuk+vitKsh43e1VxQtHY5+2o8CLChphS81BeCwt1mkvD2EZ0DDkCsr2/qjhaivaKYCi5oMKitroRk29n5zHh0zTrBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHGEEGJT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B023C4AF1A;
	Wed, 12 Jun 2024 13:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718198404;
	bh=ht4JeB3Vd88zOyRF2cKT3rK5jnnmxZ0bHNHoyEMgEas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHGEEGJT4XsDY6Bjso7S4/lyXNt/mBaaI2ZPaCvb5zWH6SpZMrOT/Fo1g+ha+wPU+
	 Xqws4yNm/QTLPiFIesk5P4GgnS9+jbx+hEnuAul7svvOXJ+iZc9Ihjnj8l66fvSw9L
	 jMJHCnqcQUoH+rBnfRvEee53lUy7qC7gZlO5X7pVwRetsk8SF3gVM0RjJjJrvQ3YH9
	 J9n8YdnanU4NA9lN7+NRhEUJJ0vFpRondgFU12AsTfmgQ/IKoxyicQv9WP1xcDAFRi
	 BGtOPgNG8vD34rof+tiaalIevg1O1YtpIndRFzDoAdqgqPyZdDcJXdV6qW5IGAjLXf
	 iqJwHkyY2vuRA==
Date: Wed, 12 Jun 2024 07:20:03 -0600
From: Rob Herring <robh@kernel.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: jonathan@marek.ca, krzk+dt@kernel.org, quic_khsieh@quicinc.com,
	linux-arm-msm@vger.kernel.org, quic_rmccann@quicinc.com,
	sean@poorly.run, dmitry.baryshkov@linaro.org, tzimmermann@suse.de,
	mripard@kernel.org, linux-kernel@vger.kernel.org,
	konrad.dybcio@linaro.org, dri-devel@lists.freedesktop.org,
	maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
	freedreno@lists.freedesktop.org, marijn.suijten@somainline.org,
	robdclark@gmail.com, conor+dt@kernel.org, swboyd@chromium.org,
	quic_abhinavk@quicinc.com, devicetree@vger.kernel.org,
	airlied@gmail.com, quic_jesszhan@quicinc.com,
	neil.armstrong@linaro.org
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Add SM7150 MDSS
Message-ID: <20240612132003.GA1934293-robh@kernel.org>
References: <20240611223743.113223-1-danila@jiaxyga.com>
 <20240611223743.113223-2-danila@jiaxyga.com>
 <171815244421.3448243.12009673117592867975.robh@kernel.org>
 <727417e8-781c-435c-8abd-f3dfe6b0e5bb@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <727417e8-781c-435c-8abd-f3dfe6b0e5bb@jiaxyga.com>

On Wed, Jun 12, 2024 at 09:19:35AM +0300, Danila Tikhonov wrote:
> On 6/12/24 03:34, Rob Herring (Arm) wrote:
> > On Wed, 12 Jun 2024 01:37:40 +0300, Danila Tikhonov wrote:
> > > Document the MDSS hardware found on the Qualcomm SM7150 platform.
> > > 
> > > Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> > > ---
> > >   .../display/msm/qcom,sm7150-mdss.yaml         | 460 ++++++++++++++++++
> > >   1 file changed, 460 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
> > > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.example.dts:25:18: fatal error: dt-bindings/clock/qcom,sm7150-dispcc.h: No such file or directory
> >     25 |         #include <dt-bindings/clock/qcom,sm7150-dispcc.h>
> >        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.example.dtb] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
> > make: *** [Makefile:240: __sub-make] Error 2
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240611223743.113223-2-danila@jiaxyga.com
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.
> > 
> 
> Yes, this happened because I forgot to add note (same for both dtbindings):
> Depends on commit ca3a91063acc (dt-bindings: clock: qcom: Add SM7150 DISPCC
> clocks)

So then this can't be merged as I imagine that is in a different tree. 
Maybe you want to not use the header for the example.

Rob

