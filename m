Return-Path: <linux-arm-msm+bounces-50194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2712A4E141
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 15:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48B763BF1AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 14:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9D32459C0;
	Tue,  4 Mar 2025 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsZj4rsm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC8B241CA3
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741098685; cv=pass; b=ICs72QIiz4fLQ3HixpQkmm4eQt/47Z+QUy8ZneAIDvMAWHY7gqMZwTamzF13u1Lz8GD+BFDvNCnWfVBh1kUVMVtGxtZySl/oHWgcLA3/nJX/wghTIhTir//McOO+u9iu0KH7odlnS+U03hLICEULUDaWzoW4/RhGzh5repfUUYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741098685; c=relaxed/simple;
	bh=x9DafxnZjhibXkXWWLnjj9HDJzQbEq4SqW+dqvT9BE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZkvspVC/soju0OhAXYMjEgT76fWVn1GYgOOWoVfltXzT2i+OrS6O93edxNX4gF0N/L0N/EpN67uueogAvk9RC40tARV8wTjJ7Goj1TS9v2BpMXBEMWR06b2ys8V8YC2xBugFiBi0cEB4WnAMf0a5xhs8dj4RlUwnc5Ru/KNC1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsZj4rsm; arc=none smtp.client-ip=10.30.226.201; arc=pass smtp.client-ip=160.75.25.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id BDAAA40D4DF4
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 17:16:40 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bsZj4rsm
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6d4d6NfBzFw6N
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 17:15:29 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id A9F184273D; Tue,  4 Mar 2025 17:15:24 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsZj4rsm
X-Envelope-From: <linux-kernel+bounces-541460-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsZj4rsm
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 010E24233E
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:00:39 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 9102B3063EFE
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:00:39 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A17C3A69E4
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D68D1F418B;
	Mon,  3 Mar 2025 10:54:01 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AC91F4174;
	Mon,  3 Mar 2025 10:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999238; cv=none; b=TxIxOZ3OL9+FCcsfp9huwT8Qt/yGkGqH9PFCxz0alt2DNdQXF+mftAwGx/XDJMZlA1G726Kt05JVjgUJEuPRtl0GGRWMGUeTBwqhP/TlztuWEEyxyS2htN+uDeinb2BMWGPMXACFrFGoJtENu/cu0As2UHlmX21lba4gJ9lJagU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999238; c=relaxed/simple;
	bh=x9DafxnZjhibXkXWWLnjj9HDJzQbEq4SqW+dqvT9BE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LayTcC4whr+lsILUhN978RZWMyR7eEXUfflMEpIa66X3ZkYgxZX7Csi6aVzUtUE9b7dtKbRz4/KYsUK488CS8uqvqTTK48wzi3ZKjPFlDZ0N15ZxWa+kisoi50fAfS0nMcGges60Jv+0Ci4W+euYzoxh8qiRUKfrzsQ1jkUfp1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsZj4rsm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B62C4CED6;
	Mon,  3 Mar 2025 10:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740999237;
	bh=x9DafxnZjhibXkXWWLnjj9HDJzQbEq4SqW+dqvT9BE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bsZj4rsmU/F1Q2BWq6kCpwkZDU8bVlA5ZeliPJWlRLGcHiBIqoXbE5TfGDzBOhBwc
	 p8JrexXMSUL9Npt1IJkXoFZIXS/Xzpca/ZXIXmIcbJbBjLhIY9eqJdnAty/xT6cdJS
	 ZXZR6JMTUGw1nGuLhCJT7vdxC66+OnAhbhg/rABx3SxOc5PrPYPP5wpEcCBFXoetOT
	 GfiJcw2UwoDGJgYm0Z+rlVUwrAfT+oAzbbx8mxcsmqtjUirh9c+An1ud6YpVTgwgW6
	 4F6WSjW8PBqOYFoOo7R3wf7ms0edgoSoPZJ5B7pucS4y2HSYxT13CeyYeHDnWlEyjQ
	 6GzZwpJ/dD7Cw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tp3Qm-000000004Ws-0yFQ;
	Mon, 03 Mar 2025 11:53:52 +0100
Date: Mon, 3 Mar 2025 11:53:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z8WKQJcPTQDIXaKD@hovoldconsulting.com>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
 <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
 <Z77l1NflYXTnRyg0@hovoldconsulting.com>
 <Z8AjhHsVT9ZQTtZX@pluto>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8AjhHsVT9ZQTtZX@pluto>
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6d4d6NfBzFw6N
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741702536.38904@IzcDto7d9piTVKm7S2ObvA
X-ITU-MailScanner-SpamCheck: not spam

Hi Cristian,

On Thu, Feb 27, 2025 at 08:34:44AM +0000, Cristian Marussi wrote:
> On Wed, Feb 26, 2025 at 10:58:44AM +0100, Johan Hovold wrote:

> > Something like that, yes. :) I didn't try to implement it, but it seems
> > like it should be possible implement this is a way that keeps the quirk
> > handling isolated.
> 
> I hope next week to have a better look at this, in tne meantime just a
> few considerations....
> 
> Sooner or later we should have introduced some sort of quirk framework
> in SCMI to deal systematically with potentially out-of-spec FW, but as
> in the name, it should be some sort of framework where you have a table of
> quirks, related activation conditions and a few very well isolated points
> where the quirks are placed and take action if enabled...this does not
> seem the case here where instead an ad-hoc param is added to the function
> that needs to be quirked...this does not scale and will make the codebase
> a mess IMHO...

Sounds good. At least we have a good understanding now of how this
particular firmware is broken so it would be great if you could use
this as a test case for the implementation.

In summary, we need to force the use of a fast channel for
PERF_LEVEL_GET on these machines, or possibly fall back to the current
behaviour of only using the domain attribute to determine whether the
fast channels should be initialised.

The latter may allow for a less intrusive implementation even if we'd
still see:

	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.

when not supported for all messages (e.g. with the current firmware).

> Last but not least, these quirks 'activations' in the SCMI world should
> be driven mainly by the VENDOR/SUB-VENDOR/IMPLEMENTATION_VERS triple and
> only as a last resort by a platform compatible match...because the
> IMPLEMENTATION_VERSION, exposed by the FW and gathered via SCMI Base
> protocol, is completely under the vendor control so it can, and should, be
> used to identify broken FW-versions...indeed all the distinct SCMI protocols
> are anyway versioned elsewhere according to the spec, so there is no need to
> repeat SCMI protocol version here..I mean it is an IMPLEMENTATION version
> 
> As an example on a JUNO the SCP reference FW reports:
> 
> arm-scmi arm-scmi.1.auto: SCMI Protocol v2.0 'arm:arm' Firmware version 0x20f0000
> 
> where the FW version represent something like the FW release tag, I think...not
> really sure about the menaing our FW gys give to it, BUT definitely it is not
> a bare copy of the SCMI protocol version...
> 
> So...
> ...does the platfom-to-be-quirked at hand properly use the IMPLEMENTATION_VERSION
> flag in a sensible way ?
> IOW does that change between a bad and good (or less bad :D) version ?

I guess only Sibi and Qualcomm can answer that. Both machines I have
that suffer from this report:

	arm-scmi arm-scmi.0.auto: SCMI Protocol v2.0 'Qualcomm:' Firmware version 0x20000

and I'm not sure if any fixed firmware has made it out to the vendors
yet or if the version was bumped when this was fixed.

On the other hand, perhaps forcing fast channel initialisation for
PERF_LEVEL_GET on all 'Qualcomm' firmware would work (i.e. only based on
VENDOR).

> Because shooting with the platform 'compatible-gun' should be the last resort
> if all of the above does NOT happen in this beloved fw...
> 
> Anyway, after all of this babbling, I know, talk is cheap :D...so now I will shut
> up and see if I can prototype something generic to deal with quirks, possibly
> next week...

Much appreciated, thanks.

Johan


