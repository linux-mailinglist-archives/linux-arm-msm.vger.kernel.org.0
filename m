Return-Path: <linux-arm-msm+bounces-35439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C10E9AB242
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF885B21415
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A0119D082;
	Tue, 22 Oct 2024 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRSh7wcv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9BC2E406;
	Tue, 22 Oct 2024 15:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729611551; cv=none; b=NscB1p7c26eDeEjuJaQglW0783I3k4VPnxKwYihhyj/nGIJXG+uEQRFlRRWtrxjyrEhWDN3iiBrSYqLai7f6vJRih/CKqJBqJNbrXFLDsakX4i9sJoteOoJGzjoNt175XYrL8c3v8EBjRKx+2PP8ZpqXiMVPEMC0YGrrwbrkHOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729611551; c=relaxed/simple;
	bh=HBAd+pH1suGBZHzKJW+16YwwQdaznnAtSA8k0AlCw/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFoQjMRX7sdT2i/KntK5xzagRAKvwEk+75Sb5+QpVWEp0sfrGQN4J16DvdKTfXwaGSbOU0cF36D6Whl9NLCzGDsy3tLvkHt9b1r6Ha7NV8DDjlSuMVOik+0fpDo1P9xw5MjPUp2+BMap7Y2WhBhYVwzOluU4UOhudmt0yrUf0NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRSh7wcv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F6AC4CEC3;
	Tue, 22 Oct 2024 15:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729611550;
	bh=HBAd+pH1suGBZHzKJW+16YwwQdaznnAtSA8k0AlCw/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRSh7wcv1VAvmrR8bGUr+cmGKAsxlIyr93qsBirHrXE0NQTlCHrKa6jwh6BKM1U92
	 1VzPCJOr6wTWFtc+TccGtAVu89N3Fso3SGT0FS+n0wPvwM+rxviMIaY7thYvxfuOEb
	 Wz1qC2qs9E3SJtVSt33E+rw8ZSST8mDjW7cPfuB6UoN4Tl91BaIH5HDMNiv3r3aB1/
	 kWKM5lpJxYxliuRtKhGHzhPJTnhC3XxthvDbSRaX0kONEHzVsr16/5/Wk2/4LhSjcS
	 D7ewARlnNhmDkIsn19WF8luwc8JWSKyXMsxUU6p3iX0z8oA74Kim6fswJNpN5ckAmI
	 ksfeW2H9yErKA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t3Gyg-000000001MB-0xbc;
	Tue, 22 Oct 2024 17:39:22 +0200
Date: Tue, 22 Oct 2024 17:39:22 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] rpmsg: glink: Handle rejected intent request better
Message-ID: <ZxfHKncYLeiIH3io@hovoldconsulting.com>
References: <20241022-pmic-glink-ecancelled-v1-0-9e26fc74e0a3@oss.qualcomm.com>
 <20241022-pmic-glink-ecancelled-v1-1-9e26fc74e0a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-pmic-glink-ecancelled-v1-1-9e26fc74e0a3@oss.qualcomm.com>

On Tue, Oct 22, 2024 at 04:17:11AM +0000, Bjorn Andersson wrote:
> The initial implementation of request intent response handling dealt
> with two outcomes; granted allocations, and all other cases being
> considered -ECANCELLED (likely from "cancelling the operation as the
> remote is going down").

For the benefit of casual reviewers and contributors, could you add
introductory comment about what "intents" are?

> But on some channels intent allocation is not supported, instead the
> remote will pre-allocate and announce a fixed number of intents for the
> sender to use. If for such channels an rpmsg_send() is being invoked
> before any channels have been announced, an intent request will be
> issued and as this comes back rejected the call is failed with
> -ECANCELLED.

It's actually the one L -ECANCELED

s/is failed/fails/ ?
 
> Given that this is reported in the same way as the remote being shut
> down, there's no way for the client to differentiate the two cases.
> 
> In line with the original GLINK design, change the return value to
> -EAGAIN for the case where the remote rejects an intent allocation
> request.
> 
> It's tempting to handle this case in the GLINK core, as we expect
> intents to show up in this case. But there's no way to distinguish
> between this case and a rejection for a too big allocation, nor is it
> possible to predict if a currently used (and seeminly suitable) intent

seemingly

> will be returned for reuse or not. As such, returning the error to the
> client and allow it to react seems to be the only sensible solution.

s/allow/allowing/ ?

> In addition to this, commit 'c05dfce0b89e ("rpmsg: glink: Wait for
> intent, not just request ack")' changed the logic such that the code
> always wait for an intent request response and an intent. This works out
> in most cases, but in the event that a intent request is rejected and no

an intent

> further intent arrives (e.g. client asks for a too big intent), the code
> will stall for 10 seconds and then return -ETIMEDOUT; instead of a more
> suitable error.
> 
> This change also resulted in intent requests racing with the shutdown of
> the remote would be exposed to this same problem, unless some intent
> happens to arrive. A patch for this was developed and posted by Sarannya
> S [1], and has been incorporated here.
> 
> To summarize, the intent request can end in 4 ways:
> - Timeout, no response arrived => return -ETIMEDOUT
> - Abort TX, the edge is going away => return -ECANCELLED
> - Intent request was rejected => return -EAGAIN
> - Intent request was accepted, and an intent arrived => return 0
> 
> This patch was developed with input from Sarannya S, Deepak Kumar Singh,
> and Chris Lew.
> 
> [1] https://lore.kernel.org/all/20240925072328.1163183-1-quic_deesin@quicinc.com/
> 
> Fixes: c05dfce0b89e ("rpmsg: glink: Wait for intent, not just request ack")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Nit picks aside, this was all nice and clear.

Tested-by: Johan Hovold <johan+linaro@kernel.org>

