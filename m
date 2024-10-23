Return-Path: <linux-arm-msm+bounces-35632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CF19AD6C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 23:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A112C1F24224
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 21:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CE4198A3F;
	Wed, 23 Oct 2024 21:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+6Jgn7i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EF817108A;
	Wed, 23 Oct 2024 21:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729719096; cv=none; b=SQm9TMOppMU31xOeo3x0jirqdJxGKXB5nq2+frOG6HdZ3wJAK0iER27SemgrYOKfxUUay5N2Ft6w7CIWu6PnILj/d6HcwpnsyUpcEdHEE+zB8TejJucZRrRXM6uyjqQ7jewaQI6j9fHcl3H35oMvvC1SqpGjOotwFs3cJ/yxOOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729719096; c=relaxed/simple;
	bh=LbCI2PN/0jC6zPzrg6dmuj7Dinb1Q8hOBK3BrrW9mQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVaLaVYx22mhOrHV5QRbIbf+6V2EEY6a/7cQpyimpPVC0YRIdtM39NIWA6RhvBCcI7GN+h2H9N9GP1hQ2p6voXK1FeJGTMfA4IYENZ+BSfvJ6Vu1WUXPLWA4oCPn4F9ObA0ZAjAJ/7XwoicqV57pbe0NodcGx3S7GAN5NxLNCL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+6Jgn7i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2083CC4CEC6;
	Wed, 23 Oct 2024 21:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729719096;
	bh=LbCI2PN/0jC6zPzrg6dmuj7Dinb1Q8hOBK3BrrW9mQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e+6Jgn7i0D5IThPc/OZrx3PuvEpFuJ5sG+L4iZnDPq3ofNXt2KC7XEwBtz8xFBDVn
	 iiFiRAy04+3cR00TSiNRdCI1B9zrcs/zh0Rdh3gEcRDWvNUL/y0BQB2NRRGIxDzR8R
	 stu4PO65rbUg90c12IbkGBvU2TIfNA4Hl3ZFFM3+EH8pRLmCZKhnPar8zm0tYs/lTe
	 fATWWF7FCfkef3wf0hXARcFod1Aj3aEQQ9k6RUxx0y8aevZ0zRzqPt8x5LZCOYkr17
	 G3MwGKR+1OMCQDsigbFDA2+/KAfKte6qZJpf8x6hNGD2kGJLmIrewAhZGHG8bw32sF
	 j8x4eFe4O1zFg==
Date: Wed, 23 Oct 2024 21:31:34 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
	quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
	quic_neersoni@quicinc.com, quic_gaurkash@quicinc.com
Subject: Re: [PATCH RFC 0/2] Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
Message-ID: <20241023213134.GC3736641@google.com>
References: <20241006135530.17363-1-quic_spuppala@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241006135530.17363-1-quic_spuppala@quicinc.com>

On Sun, Oct 06, 2024 at 07:25:28PM +0530, Seshu Madhavi Puppala wrote:
> Crypto reprogram all keys is called for each MMC runtime
> suspend/resume in current upstream design.

Is that correct?  I thought that similar to what is done for UFS, the key
reprogramming happens only after the MMC controller is reset.  I thought that is
different from a runtime suspend.

If it's in fact triggering more often, maybe that is what needs to be fixed?

- Eric

