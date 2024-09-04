Return-Path: <linux-arm-msm+bounces-30762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD0D96C3FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 18:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9C8D2861DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 16:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465851E0B80;
	Wed,  4 Sep 2024 16:20:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0191DEFDF;
	Wed,  4 Sep 2024 16:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725466840; cv=none; b=FYyvQhpsZNbTGpODXTFM4Z1ySSAfNNqsjPgXM8p6zMOvBWoaILFwz0XF3WsYfIRkAnvO3O3Bazqj5jqaezSrPu9wr3DoovJFR0ApPwF2VyNHe5rHQPhSwRuX7J6XKzZNEguienEqFMn6nqWin3CD9W8t3eb1Yazp200qyrfPm/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725466840; c=relaxed/simple;
	bh=44bA6BwrJ4kjcy61z8WkXTayUCzaRUSgsnywj45YQIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrjbmzDmI1VoZVrqi33OkzUfAl/JnTm3gefbSg2ifKUwuKS1T8babBPILe8RjAPx/aFaOeQ9XfjRkUlk2l9Xplf7ISX2CJKeZV36b2LudIl2Yl1cf1OC391Dj01ZbxVBqBMmjilv3gY+Pm1W0Qd3antuOh444GqKqP5wkdLnHOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57C64FEC;
	Wed,  4 Sep 2024 09:21:04 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF8DF3F73B;
	Wed,  4 Sep 2024 09:20:36 -0700 (PDT)
Date: Wed, 4 Sep 2024 17:20:34 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, cristian.marussi@arm.com,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	johan@kernel.org, konradybcio@kernel.org
Subject: Re: [PATCH V2 2/2] firmware: arm_scmi: Skip adding bad duplicates
Message-ID: <ZtiI0u0nAUbWEAAR@pluto>
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-3-quic_sibis@quicinc.com>
 <ZtiG7YLcnOR9IIuE@bogus>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtiG7YLcnOR9IIuE@bogus>

On Wed, Sep 04, 2024 at 05:12:29PM +0100, Sudeep Holla wrote:
> On Wed, Sep 04, 2024 at 08:43:24AM +0530, Sibi Sankar wrote:
> > Ensure that the bad duplicates reported by the platform firmware doesn't
> > get added to the opp-tables.
> >
> 
> I am really interested to know if the platform firmware is presenting
> duplicates intentionally for some unknown reasons and we are just speculating
> it to be broken firmware or is it really broken firmware.
> 
> For me, it is very hard to digest something like OPP tables which is there
> for a very long time now is not very well understood by firmware authors.
> How many duplicates are we seeing on this platform really ? If it is
> just one I can understand. More than one is hard to miss from the OPP
> tables in the firmware.
> 
> While I am not opposing to make the driver handle these duplicates,
> I am just worried if they are put there intentionally for reasons we
> don't understand yet or not published.
> 

The number of duplicates reported in logs makes me suspect the same...seems
like intentional/by_design .... but at first I stick to the general issue
of handling bad fw replies and how to survive kernel side at first...but I
indeed share your same concerns...

Thanks,
Cristian

