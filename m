Return-Path: <linux-arm-msm+bounces-34438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1FD99EA4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EEB428A049
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 12:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152411C07CD;
	Tue, 15 Oct 2024 12:49:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712161C07CA;
	Tue, 15 Oct 2024 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728996576; cv=none; b=j9DNk0f5N+9tCfK5XTzynvrBSFXOac3u0kmbiU/mUM2lnjfolLAHnHgWJGWCi3AXWdctv52go76vvSpW+8HTdwH0pmHSYiCTur+tQzf+Z/vLl1A40GR7T1GMWa8Qj3rY67Tf6rlWLctUK0LkdUYNe2CT678P6PYHGBNS87hbjso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728996576; c=relaxed/simple;
	bh=8BvFXXute3E0Aou5zajU1W75cfTVEa2qVOBZGsbdEus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nywHWyryls9oX4q3hpLQSBmNIV/IUjhwcjZRxUWRmCSsvLvUFSe2/0wJKHXEx75S2SLfOzLI3wyBoLms6kqlZ61VJTBJrZYT+3Er2BbtJMGIqGS0kxPquV7gYFXslLPsTnCwxPUOfGHAVtg/rxVflWyYiJowyW0TK2O3n2/TziU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77F5EDA7;
	Tue, 15 Oct 2024 05:50:03 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75C843F51B;
	Tue, 15 Oct 2024 05:49:32 -0700 (PDT)
Date: Tue, 15 Oct 2024 13:49:29 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Xinqi Zhang <quic_xinqzhan@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-msm@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: fix slab-use-after-free in
 scmi_bus_notifier
Message-ID: <Zw5k2clQgGPQfRau@pluto>
References: <20241015-fix-arm-scmi-slab-use-after-free-v1-1-b006eba9c8df@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015-fix-arm-scmi-slab-use-after-free-v1-1-b006eba9c8df@quicinc.com>

On Tue, Oct 15, 2024 at 06:48:25PM +0800, Xinqi Zhang wrote:
> Move release of scmi_dev->name into scmi_device_release to
> avoid slab-use-after-free.
> 

Hi,

Thanks for reporting this.

Can you add a bit more of conetxt in the commit message on when this
happens ? From the stacktrace seems related to an early chan_setup failure
and the subsequent complete shutdown of the SCMI stack.

And also a Fixes tag would be useful.

Thanks,
Cristian

