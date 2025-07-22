Return-Path: <linux-arm-msm+bounces-66100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C92B0DD5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C1AF1C8683C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656252EB5D5;
	Tue, 22 Jul 2025 14:07:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABB42EBBB9;
	Tue, 22 Jul 2025 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753193227; cv=none; b=VRK+dUxqc7ixbwrLljQkKT6Y7QnrOj5K3sBhYor9kb3vHyRil6MD5EatmVBA2EKWqDBYyQJOt1HOGOlsA4ShVtZc6rdTS8+J6RKdfa26ubawGyDMHbY5vQbYLhZtUUija6VVNq1L0c1kvss3jqoNYMMAt+gPfXLM881NLXcafDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753193227; c=relaxed/simple;
	bh=/mX9h5YKQzQFslBtOIGwHxGxd4RPUUrJGC0seadhRVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTeqr0QB2TpgbvhGnBoMKrJSsp6uJFwstvz4zxxk3vR0BzaVgmmpyHozAavt+c1umt2ugwlydi7N4lRjrRZSj0XWHyZ2t4vZeK2mJqKhCRaRNMOsndsfmothDQ1hg4dkUn3L7Lg0jlmgFbCT8HosFWMOwYeC86g2HOIVi30Vw2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA639152B;
	Tue, 22 Jul 2025 07:06:56 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC11E3F5A1;
	Tue, 22 Jul 2025 07:07:01 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:06:59 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yingchao Deng <quic_yingdeng@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
Message-ID: <20250722140659.GI3137075@e132581.arm.com>
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com>
 <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
 <20250722091425.GH3137075@e132581.arm.com>
 <CAJ9a7VhLLgAak_4FB=iW0izXprM4W+RsKfHUeo=XUHh9LwtUsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VhLLgAak_4FB=iW0izXprM4W+RsKfHUeo=XUHh9LwtUsA@mail.gmail.com>

On Tue, Jul 22, 2025 at 01:00:18PM +0100, Mike Leach wrote:

[...]

> For a change of this magnitude to a CS component, that the ID
> registers will also have to change. This is a requirement of the
> Visible Component Architecture in the CoreSight specification.
> External tools cannot see the device tree.
> 
> This is effectively no longer an ARM designed component, so the
> CoreSight specification requires that the DEVARCH register change to
> show qualcomm as the designer, and the architecture value change to
> represent this component.
> DEVID should be used to allow the driver to pick up parameters such as
> number of triggers as per the existing CTI component.
> 
> If this component is Coresight compliant then the driver can use the
> ID registers to configure to the extended trigger architecture.
> 
> With complete remapping of most of the registers, and the dropping of
> claim tag compatibility - which appears to be a breach of the
> CoreSight specification - it may be better to have a completely
> separate driver for this component.

Good point. I'd like to confirm with the Qualcomm team: apart from the
differences in register offsets and claim bits, does this CTI module
have exactly the same bit layout and usage as CTI standard
implementation?

If yes, then from a maintenance perspective, we probably don't want to
have two CTI drivers with identical register settings. It seems plausible
to encapsulate register access and claim logic into several functions.

  void cti_reg_writel(u32 val, struct cti_drvdata *drvdata, bool relax);
  u32 cti_reg_readl(struct cti_drvdata *drvdata, bool relax);
  int cti_claim_device(struct cti_drvdata *drvdata);
  int cti_disclaim_device(struct cti_drvdata *drvdata, bool unlocked);

Thanks,
Leo

