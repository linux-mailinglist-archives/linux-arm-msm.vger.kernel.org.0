Return-Path: <linux-arm-msm+bounces-47618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D03A3111D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 17:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43863160575
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 16:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFAF1F91F6;
	Tue, 11 Feb 2025 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUaxMBZs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520D826BDAB;
	Tue, 11 Feb 2025 16:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290846; cv=none; b=c4j19y1oJjZMuiScFe545HJTTJs+ETAWRy2DZ41JTCBs2GC0w65J61kqeps81FV4r1EC/ohgYGAaEgPGj8R7ws9uM5YKn8Opyf+fW7SBe404U6Z+njJUu2nVZ1Xq+hCcWxz0KEQ2F6Ck7/7w8FlOqgJRldHbkBDRylS5lHMJq/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290846; c=relaxed/simple;
	bh=P1WfyrU9DP00tpwK1PSMyOyXYZZW0lJXA7LiW4icLKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HN3e3B5VVVoQq1S+Snlh/BYKh9xJtF2OeYPYMc8beunmgstYzH2CdHtY6rGBvsSAOtGGSHVBgFsLsTMQzqy2i90KJG18+CsOpXKmZOZU2xujYVvr4WwBkye/ARmNOtki+j+jaUj7Zk6WzG0c3oqUGpv2RPovG8TZ44f6SI45vc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUaxMBZs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB71CC4CEE5;
	Tue, 11 Feb 2025 16:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739290845;
	bh=P1WfyrU9DP00tpwK1PSMyOyXYZZW0lJXA7LiW4icLKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUaxMBZsNBcg/yDHNo8fFMEwU8DVFkeQMNKh1CKQuMfvWJ+GCyo+0JJeWEI5x70in
	 C+uA8mkVLfNl5gq0mm9e4S5Vo1zPntWZYbSluEJWpc8OWwBqiS2Lje7QB61N+jlQeb
	 RBj3Jw3q+OjV0Hp56MAmkIm0Yi6Bvye0tv6dO8wrfWtuiw1WQd1FU6p46ds/m+mYqc
	 OIxgJq62qXO+KOJEtLYN6DOe7WmDROyTDkEaJ576PIH7GnUA9IjNWKUq5vjvWR8w5Z
	 UNBDGCOkjg68j0F4B5tMQc3h3slcuKH/UvwR8FxINtohnAPOxOoOYidFHW/0xhlr9n
	 LQ7FscY7Ktntw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tht0H-000000004p6-2C4y;
	Tue, 11 Feb 2025 17:20:53 +0100
Date: Tue, 11 Feb 2025 17:20:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Yushan Li <quic_yushli@quicinc.com>
Subject: Re: [PATCH RESEND v5] arm64: dts: qcom: Add coresight nodes for
 x1e80100
Message-ID: <Z6t45aOGDkotqM4Z@hovoldconsulting.com>
References: <20241205054904.535465-1-quic_jiegan@quicinc.com>
 <Z6oDdq-qAJPf9-ef@hovoldconsulting.com>
 <fe6c7c26-91d6-402f-80b6-018ee40e9ed7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe6c7c26-91d6-402f-80b6-018ee40e9ed7@quicinc.com>

On Tue, Feb 11, 2025 at 09:37:43AM +0800, Jie Gan wrote:
> On 2/10/2025 9:47 PM, Johan Hovold wrote:

> > This patch is now in 6.14-rc1 and results in the logs being spammed with
> > 200+ messages about cyclic dependencies. I'd expect something like this
> > to at least be mentioned in the commit message:
> > 
> > [    0.250732] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
> > [    0.250854] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000

> > ...

> > [    0.301582] /soc@0/funnel@10d13000: Fixed dependency cycle(s) with /soc@0/funnel@10d04000
> > [    0.301639] /soc@0/funnel@10d13000: Fixed dependency cycle(s) with /soc@0/tpda@10d12000
> > 
> > [    0.317624] Callback from call_rcu_tasks() invoked.
> > 
> > Has anyone looked into what is causing this and if anything can be done
> > about it?

> These lines have been printed by following API, 
> fw_devlink_create_devlink, it's pr_info:
> 
> ...
> 	device_links_write_lock();
> 	if (__fw_devlink_relax_cycles(link->consumer, sup_handle)) {
> 		__fwnode_link_cycle(link);
> 		pr_debug("----- cycle: end -----\n");
> 		pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
> 			link->consumer, sup_handle);
> 	}
> ...

Right, and we had a few of these already, but not several hundreds. I
meant to ask if anyone has looked into whether this indicates a problem
with the patch or binding (or devlink code) or if these notifications
are simply expected.

> I am not sure we can change it to pr_debug to decrease annoying messages.

That may be an option, but I assume the current printk level is used so
that people get a chance to spot potential issues. Otherwise, we should
definitely silence it.

Johan

