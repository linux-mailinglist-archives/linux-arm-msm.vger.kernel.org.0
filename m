Return-Path: <linux-arm-msm+bounces-66025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D01CB0D58E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 11:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CA0D171D28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 09:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F192DCF47;
	Tue, 22 Jul 2025 09:14:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7612D3EF6;
	Tue, 22 Jul 2025 09:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753175670; cv=none; b=HSjtOy1MXVvvi5Azgne/xIviBW/+wZQP5lbZ4GnFPvAU09XnQk6QF4fXKJSxj6sjbGch6thZo30+s3NYAzQoZSEytClH4J7Me4eO4Pqu7hJNZPAJz+JitdNucKzda7SSTc6FJlPkx2UgoDMqtVt1raD3wck9CzCXzjOdK2CqecQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753175670; c=relaxed/simple;
	bh=CYh/VYZbC0NWaYCS572O+2ZDHE8xiIaEU+K07/U4Lmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9nbxz9sMH7V5ooRowrpEzWOEaIIT5biqlHzxQdxf4ijAGrUZwLMyJZv1QHjZBo4rKxVtIwiGZY29BNRydY7MSuRaStGdb/+UFmYi4m4zHw/TB1xJFL3veghqJsII1/xBx8lWXWG+qjQXijfO9pfrNOxJ0Mm7ql1eh5/WH8pAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E237F152B;
	Tue, 22 Jul 2025 02:14:21 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 002423F66E;
	Tue, 22 Jul 2025 02:14:26 -0700 (PDT)
Date: Tue, 22 Jul 2025 10:14:25 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mao Jinlong <quic_jinlmao@quicinc.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yingchao Deng <quic_yingdeng@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
Message-ID: <20250722091425.GH3137075@e132581.arm.com>
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com>
 <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>

On Tue, Jul 22, 2025 at 09:49:28AM +0100, Suzuki Kuruppassery Poulose wrote:
> On 22/07/2025 09:14, Mao Jinlong wrote:
> > From: Yingchao Deng <quic_yingdeng@quicinc.com>
> > 
> > Add Qualcomm extended CTI support in CTI binding file. Qualcomm
> > extended CTI supports up to 128 triggers.
> > 
> > Signed-off-by: Yingchao Deng <quic_yingdeng@quicinc.com>
> > Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> > ---
> >   Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > index 2d5545a2b49c..1aa27461f5bc 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > @@ -84,7 +84,9 @@ properties:
> >             - const: arm,coresight-cti
> >             - const: arm,primecell
> >         - items:
> > -          - const: arm,coresight-cti-v8-arch
> > +          - enum:
> > +              - arm,coresight-cti-v8-arch
> > +              - qcom,coresight-cti-extended
> 
> Why not call it qcom,coresight-cti ?
> 
> There are no other "qcom,coresight-cti", so "extended" is not required.
> Is this specific to CPU (i.e., CPU bound) ?

I roughly went through the second path. Combining two patches in this
series, I am wandering if can directly check registers (e.g. PID/CID)
to find CTI with qcom extension. If so, you do not need an extra DT
binding, right?

Thanks,
Leo

> Suzuki
> 
> >             - const: arm,coresight-cti
> >             - const: arm,primecell
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

