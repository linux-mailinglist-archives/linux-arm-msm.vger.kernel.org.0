Return-Path: <linux-arm-msm+bounces-20877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2974A8D2A8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2A9E1F26646
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C3B15B0F1;
	Wed, 29 May 2024 02:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKmBo7Vo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353A815ADA5;
	Wed, 29 May 2024 02:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948239; cv=none; b=h8bFYmSujbVsZL0kT8I6v+0nfuUE/EfFwINmB7/SyhL43fMkBK/q2UHrG1oeT3DhJ+GfKE8YH2irp8l6nZVtErZ02gqSZxP/Im7JxQuC4Q792St2s3kpT0DQIrInMQrKH+8wUc/6foT5WWxx3Wmv+ZxxhReiPjqzMjx5yJExZ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948239; c=relaxed/simple;
	bh=Amd0ZaKiTq3QW1olkeBFmUIFypfq2JePdZVnQMLo0YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbSmldZhzrk8A2nRSzEYKKtOwXOwolGzNChNuFpxDoFRtxEP3LPHfnqfC/VrMnxN/ik36Gbwl01Hhr7cgQlFPg1cbmxQyaC6E2M9ABY1ktDaH1aGMgcBSMLgRqjgA2BSe304x8pqAEhF8JhKi19whMMzQ06Nd6lRAxCSiRHwkz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKmBo7Vo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6818C3277B;
	Wed, 29 May 2024 02:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948239;
	bh=Amd0ZaKiTq3QW1olkeBFmUIFypfq2JePdZVnQMLo0YE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RKmBo7VoZo0QWHBlk6gDCjIU+Vi6tqjPRDaI/jj5fyDXqB0+JXlv1ucllDQUfvT0y
	 XnptGk/6BmZOa3t/7xOGuE/uO2PuMDPrI6PellP01zajSilbyRhcXG3Y9G8OiZYnXh
	 MyizDzWOBq3+TW0H/vCARzQrQQyIz8FUf3M02U0tOqz19MQgwLTfeSKPikAXrDfLeN
	 uAYEOYb92zyDlHN05tUy9VcNPVOdS+Rsa7QN0+6iSVSS9qb6V8OfwBqLxXvFeu8Tl0
	 2Wu++IvFiQ/nPtgdgXqKGPbjoxBD7+Ma0zq1Ql/AoIa9NwO3d99MhOdRPLwUP+ivrV
	 sW8yjTrb0CSOA==
Date: Tue, 28 May 2024 19:08:41 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Chris Lew <quic_clew@quicinc.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: Re: [PATCH v2 3/4] soc: qcom: smem: Add
 qcom_smem_bust_hwspin_lock_by_host()
Message-ID: <qkdw5artkb7vz2tnjkdxivvfkwchna7fxkyo4go6nwb4kc3gv3@t7xt3rrvyvja>
References: <20240524-hwspinlock-bust-v2-0-fb88fd17ca0b@quicinc.com>
 <20240524-hwspinlock-bust-v2-3-fb88fd17ca0b@quicinc.com>
 <nwoeg22jg5yd4amgqqegplygy6aickehvfc6eanmody74h6nss@cmixbwx6vpx4>
 <f0881f3b-036b-462a-9e0c-42ca81807b86@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0881f3b-036b-462a-9e0c-42ca81807b86@quicinc.com>

On Tue, May 28, 2024 at 03:50:25PM -0700, Chris Lew wrote:
> 
> 
> On 5/28/2024 2:55 PM, Bjorn Andersson wrote:
> > On Fri, May 24, 2024 at 06:26:42PM GMT, Chris Lew wrote:
> > > Add qcom_smem_bust_hwspin_lock_by_host to enable remoteproc to bust the
> > > hwspin_lock owned by smem. In the event the remoteproc crashes
> > > unexpectedly, the remoteproc driver can invoke this API to try and bust
> > > the hwspin_lock and release the lock if still held by the remoteproc
> > > device.
> > > 
> > > Signed-off-by: Chris Lew <quic_clew@quicinc.com>
> > > ---
> > >   drivers/soc/qcom/smem.c       | 28 ++++++++++++++++++++++++++++
> > >   include/linux/soc/qcom/smem.h |  2 ++
> > >   2 files changed, 30 insertions(+)
> > > 
> > > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > > index 7191fa0c087f..683599990387 100644
> > > --- a/drivers/soc/qcom/smem.c
> > > +++ b/drivers/soc/qcom/smem.c
> ...
> > > + *
> > > + * Context: Process context.
> > > + *
> > > + * Returns: 0 on success, otherwise negative errno.
> > > + */
> > > +int qcom_smem_bust_hwspin_lock_by_host(unsigned host)
> > > +{
> > > +	if (!__smem)
> > > +		return -EPROBE_DEFER;
> > 
> > This would be called at a time where -EPROBE_DEFER isn't appropriate,
> > the client should invoke qcom_smem_is_available() at probe time to guard
> > against this.
> > 
> 
> Should we keep the null pointer check to prevent null pointer dereference
> and return 0? Or would it be better to allow the null pointer deference to
> go through so we can catch misuse of the API and ask clients to use
> qcom_smem_is_available()?
> 

I like the helpful callstack you get from the NULL pointer
dereference...

Regards,
Bjorn

