Return-Path: <linux-arm-msm+bounces-44029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E485FA02FFE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 19:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D74081621D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 18:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760F01DF252;
	Mon,  6 Jan 2025 18:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMctdXIM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440101DE8A6;
	Mon,  6 Jan 2025 18:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736189787; cv=none; b=nfqHYOC6EZUuBDYceIrdAfojAZEg2UbRCCU04elDRXB6sXmANwGpli5IIURuvXEdGInD3WRzPZpW6V1MQrYlDf/FHb3OgW+005jhc9nIRO7N6aQojfB9Yx1MV9S/IO8bx7Vp5t4FYr/QodDIiCd0hpHfjcecah0J17EHcgMFGGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736189787; c=relaxed/simple;
	bh=Pox58ccZasjXxgjpaGIl/eerDHad2dRa00TG832moAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBIEvilXKfRgKbyJ4e1hBUGNwtyv7tAjDWUDG5hribR22P4shRKmo0gkRqP8A8ECBG67EZP9UC4ROzO6CegqOq46tFjbw2mQzd2rpG5SzsoagYGqHAc/KqDJ0tTW4Pp/dTcIyldQU0KqS1PasC6zf+UTvaTtMOLirFY0ZdATz3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMctdXIM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E86C4CED2;
	Mon,  6 Jan 2025 18:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736189786;
	bh=Pox58ccZasjXxgjpaGIl/eerDHad2dRa00TG832moAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMctdXIM/e7MBwI9lsEA3ApFR9xcUbF1P6p+Nt4EtsJB6LyxpwDSIRvY+PvzcO1Ee
	 ZTbGX4Dstm4XTaxXaCOs+CVF2MaerzZdCpCoRUUCmf7BYAoj8E0y0OJgjjnBWQFVU+
	 OdUmQrFYMfADS9v4zutobFOmndVtNeJtzm92nA6rg3sweDxbNrbrSt8szDVgo+rxF7
	 oY4YXM5xUpJaDPSHfGvmSKG6Nv0h95cGtcBEio1iawVKTaSpoKyuXstQQ3xkKnQ3Ty
	 bpYYBgv/X6e01CZ6Jh82aYxQMs16c4xYiFqrYis7FPMWVWrOUQEP8V57juJ1OuW8o0
	 Rw9QwB2d9xbuQ==
Date: Mon, 6 Jan 2025 12:56:25 -0600
From: Rob Herring <robh@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xin Liu <quic_liuxin@quicinc.com>
Subject: Re: [PATCH v3] dt-bindings: remoteproc: qcom,sa8775p-pas: Document
 QCS8300 remoteproc
Message-ID: <20250106185625.GA711119-robh@kernel.org>
References: <20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com>
 <1b405496-bba9-4fc9-833f-6d2f662068ba@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b405496-bba9-4fc9-833f-6d2f662068ba@quicinc.com>

On Thu, Nov 14, 2024 at 05:23:25PM +0800, Jingyi Wang wrote:
> 
> Hi Maintainers,
> 
> On 9/25/2024 3:21 PM, Jingyi Wang wrote:
> > Document the components used to boot the ADSP, CDSP and GPDSP on the
> > Qualcomm QCS8300 SoC. Use fallback to indicate the compatibility of the
> > remoteproc on the QCS8300 with that on the SA8775P.
> > 
> > Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> > Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> > Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> > ---
> <...>
> > 
> > Best regards,
> 
> Gentle ping for the patch apply.

I've applied it, but Bjorn should have. If there's been any discussion 
and more than 2 weeks pass, you should resend the patch with tags added. 
A discussion means "expect another version" to maintainers.

Rob

