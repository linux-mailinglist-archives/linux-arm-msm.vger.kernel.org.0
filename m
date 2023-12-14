Return-Path: <linux-arm-msm+bounces-4670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FD88128EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 08:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86C2D1F2117C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 07:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298E01095C;
	Thu, 14 Dec 2023 07:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5jzaMu8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA5E10958
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 07:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E68C433C7;
	Thu, 14 Dec 2023 07:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702538195;
	bh=3TpFSw6c14ZZQZiXkduDLlSNFGLigPiCkjMZk553ex8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5jzaMu8+fN+K6vHUbhaWDmbgt2ncJZr/CbWW9NMRVvAJTdZE230GqM9K5GKvGzdp
	 dzJT3eSES44awaJfFDmQbv34b+ekXPBe4eHYPa4MKpNHLqhcQ14EctPF9hwGYW3Skh
	 8cMF57s7i609078CATCWc+MjVAzr4ypyKi4uOiRmqcpXq3LSA5l2PJpQEJ5WSAb0wq
	 ZOx+JMX9BBin0q0/nCOYIfKuW8e8V0IeVYeNzPzp6ZbZcSeGO+uI/0JwdvTQutv1l7
	 SVcdkzQXUUK7MNVqiNri7lvWwi9k0Kj9zyWHggi486k2YfqKnTZuslbsQn2zEGwAAC
	 ATLwVJ9PqrZCQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rDfxR-0000pv-34;
	Thu, 14 Dec 2023 08:16:34 +0100
Date: Thu, 14 Dec 2023 08:16:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: pmic_glink: Fix boot when QRTR=m
Message-ID: <ZXqr0RFw9KsP876v@hovoldconsulting.com>
References: <20231213210644.8702-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213210644.8702-1-robdclark@gmail.com>

On Wed, Dec 13, 2023 at 01:06:43PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We need to bail out before adding/removing devices, if we are going
> to -EPROBE_DEFER.  Otherwise boot will get stuck forever at
> deferred_probe_initcall().

Can please you expand on why this is a problem here in the commit
message?

The aux devices appear to be tore down correctly in the probe error
paths so how exactly does that lead to deferred_probe_initcall() being
stuck? This sounds like we may have a problem elsewhere which this patch
is papering over.

Also where does the probe deferral come from in your case?
pdr_handle_alloc()?

If this is a correct fix, I'd also expect there to be a Fixes and
CC-stable tag.

Johan

