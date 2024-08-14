Return-Path: <linux-arm-msm+bounces-28543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA76952282
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 21:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46DDE28491E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 19:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9891BE249;
	Wed, 14 Aug 2024 19:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bB5iQ2JD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0311B4C42;
	Wed, 14 Aug 2024 19:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723662742; cv=none; b=R9LTGb1LhzOk0Ku1LfkJpooGjCk/rUBPjPdQ0A1uL7iiUDACy4sJ7uC40nadBjdMFW+N6LorQn6YYI9krobJ0JRHFMi7r1Okuyc4B7dTvJ/18li4rPAxsn5IVLl83ku3qh7BOmjLuQpJC4mJK+hDYNwWRnlM0zdj/3JMiiFBNW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723662742; c=relaxed/simple;
	bh=MxWVFVGMu8yeZFa1Q/ovILbgW1opbuMIzYsgxtugszI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sSayvYCwcjShkI0IaY+2dm/DV9fymRUOKOvoQEZsJiHXWRgTqORzSqXl1Ux77wiUaSX8TYrKBGGv0xXYaBerQIp7iE302yotcNQ5L0SX9xJpnXRCQX44uwKKVNB1vhs7/g1Ud4XYYrAsrLyincAnjeTHHeJoFquvrlTTwn0hKRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bB5iQ2JD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158DCC116B1;
	Wed, 14 Aug 2024 19:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1723662741;
	bh=MxWVFVGMu8yeZFa1Q/ovILbgW1opbuMIzYsgxtugszI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bB5iQ2JDXAxlojsRpOLf+rBymIfn8Fw/b2M4Zwt2mt7UGRFJXzsMOFftRmHihEuXA
	 oq8nAaveXQZdF/ai5SIMK9EI7+61NbQ0jtOfcEGacEwBK7qMlLZdF3AcnI6+qw7KdB
	 lCQwbKZg23ZugXUKrKPjv8N9i25zG1sEjxJea16g=
Date: Wed, 14 Aug 2024 12:12:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 akinobu.mita@gmail.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH 1/3] fault-inject: improve build for
 CONFIG_FAULT_INJECTION=n
Message-Id: <20240814121220.adcbbc0db20c6821a05da11e@linux-foundation.org>
In-Reply-To: <87cymbzj50.fsf@intel.com>
References: <20240813121237.2382534-1-jani.nikula@intel.com>
	<20240813192450.9aff86552e06a48924b7bbc1@linux-foundation.org>
	<87cymbzj50.fsf@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Aug 2024 09:57:31 +0300 Jani Nikula <jani.nikula@intel.com> wrote:

> > Removing a nested include exposes all those sites which were
> > erroneously depending upon that nested include.  Here's what I have
> > found so far, there will be more.
> 
> Right. I didn't hit them with the configs I tried... though I wonder why
> not, especially lib/fault-inject.c puzzles me.
> 
> How do you want to proceed? Arguably uncovering and fixing those places
> is good, but that's kind of an unintended consequence here.

Is OK, it's a good change.  I fixed everything which my usual build
testing covers.  Other things will be reported and I'll fix those also.
If you have time to eyeball the 36 files which include fault-inject.h
then that would help things along.


