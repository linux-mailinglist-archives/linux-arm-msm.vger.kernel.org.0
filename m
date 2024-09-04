Return-Path: <linux-arm-msm+bounces-30634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A30B296B2B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 09:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E8F8B20BA4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 07:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072F8145B38;
	Wed,  4 Sep 2024 07:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTd51cB0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C840213B290;
	Wed,  4 Sep 2024 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725434448; cv=none; b=sLoIq0GS2LQWsfhPGd7h3o0XKHSoCYEG2hi2JWBj4n2YWD6FPuzYdBvQ31YUsuDz+QGL29gVgqEpLYJSjHQlBzAesc3UgHqQ9POOC0KQNfsJFpuAMzpw2xL5wt0sBGMPAkXKoy5vJq3eXhPH24c6OcEYYdYxizkesiE7f3vYV5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725434448; c=relaxed/simple;
	bh=7LNfFiXbjo7lumWI/Ys4K1KVKj5QLLQTvPgzMihTVLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjamIWp3UEsBSXJKFn8i3K6voLSeN2fj96w0aeckw2ucfrCihn/mtN0Zke1YX1FnfZIjK6qSlQu45qcc1M6UxtoAVGxPE489LQdDFIAKMskMua2uWT+My97iAzrhFl3RFymewdIDHRO54c2m7KmAvErF27zPh7rkuAzKeYUCQgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTd51cB0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B1CC4CEC2;
	Wed,  4 Sep 2024 07:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725434448;
	bh=7LNfFiXbjo7lumWI/Ys4K1KVKj5QLLQTvPgzMihTVLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTd51cB0yGAuYjeno1J2UWEv7/7gArrZ7IBToGz6QzZsNCKj+QbqAYJdMQ3/dyYRN
	 YL/dwbAjpfUvR9VPsAYy0vHyZ4XPALgWbspaasFM9940SSFqaCf8eEF5Ho57E9YDG7
	 gChUFcggE6rh25N63HE2IdPyeGTpwVkUtpS0TT36XIAFq947IT9352ZZtVP54I3KZS
	 nejZ8FR6lRoDstltzzwnH148Yw110UOD4lmeLpUoZ9VQ5WAGfCw1yobjBobAnEwNj1
	 BuXJoEzc+JKJbJvnUshTIrS3pIT6jXZBSWFRnHirTm092x0bsZdLTaAYhl6ZCHiTzC
	 fyA6VviQS4dfw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1slkK8-000000001SQ-1Ggi;
	Wed, 04 Sep 2024 09:21:05 +0200
Date: Wed, 4 Sep 2024 09:21:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: ulf.hansson@linaro.org, sudeep.holla@arm.com, cristian.marussi@arm.com,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com
Subject: Re: [PATCH] pmdomain: arm: Fix debugfs node creation failure
Message-ID: <ZtgKYD87GF0fDucE@hovoldconsulting.com>
References: <20240703110741.2668800-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703110741.2668800-1-quic_sibis@quicinc.com>

On Wed, Jul 03, 2024 at 04:37:41PM +0530, Sibi Sankar wrote:
> The domain attributes returned by the perf protocol can end up
> reporting identical names across domains, resulting in debugfs
> node creation failure. Fix this duplication by appending the
> domain-id to the domain name.
> 
> Logs:
> debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
> debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
> 
> Fixes: 2af23ceb8624 ("pmdomain: arm: Add the SCMI performance domain")

Please include:

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Link: https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/

> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>

I now that this patch is being reworked, but please note that the
following warnings that I reported are seen also with this patch:

[    9.119117] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
[    9.129146] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
[    9.160328] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
[    9.175229] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16

which seems to suggest that the approach taken by this patch is not
necessarily the right one.

Can you please also comment on why this is an issue on x1e80100 in the
commit message?

Johan

