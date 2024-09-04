Return-Path: <linux-arm-msm+bounces-30627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A3796B240
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 09:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C67711C2118E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 07:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E2113D882;
	Wed,  4 Sep 2024 07:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlWhKMY+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14416A8D2;
	Wed,  4 Sep 2024 07:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725433215; cv=none; b=R6fw8hQd3G5TfQcAuucDjheDDnj4/0oWNhkksRO1/oFsO2JSQO5F7MW8gOHNGLduQVgaA22Fo9r7sFyGYa6CoHguD08SIS+7J72RDxfq9DTrbMqqsTYFKwT2xzOiVqVyLDykibSaabX78IXi/Zu83dRNNAHfzFbOkw83+hKQ+hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725433215; c=relaxed/simple;
	bh=7MUwc0Qz0mHMQ92cWtSf9OiJINGcpduG0xrHBToFdFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXgTHf0lpgZZBdG9cI+Jqwe2+EP0HAXoOuy99mzFlUrdEMU/6wrYmwWS4K1JG1HL4v5eo4IWapPtzwvGP60gxbFzOSa5BZj8+Zq18qOKPCAMezKvaBuhIw6MuI8lEo2Owxc6h+bSDUGfnJeLJvHBkZUf498PqLLYIEhqh+6P62A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlWhKMY+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D98DC4CEC3;
	Wed,  4 Sep 2024 07:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725433214;
	bh=7MUwc0Qz0mHMQ92cWtSf9OiJINGcpduG0xrHBToFdFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PlWhKMY+y29pV2JFKEgiVv1fRmL7I6BIjNLFtnSo2ClJ0W2PC5eXWq+p5L7yDGZIT
	 OhDNggb/1Q05WL09OIpO1g7ARtP76HSjqwNDnUxCFgPmpqMFS4fzFExYxca7WjuNgX
	 UH3925GZYmOyM1IvdnCT5ckT/X1CHXWU69nRBVoqpIanBc40kV0n/Th6+4Ig7chcX0
	 qvr0//Ecmn7ubYaoH9FljyNg65Lv2egcv3EyOXMVlRUtZS3dbD/KEc3BPKJsdm0vD2
	 VyPEqLFLcOd9ZMGQwZOvZjty2l3YVbCWqtGoIG6k6/3yTJkqGL2TbKNm4TBWrkcMLC
	 FEUERxPzRF5KQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1slk0F-0000000012U-0M0T;
	Wed, 04 Sep 2024 09:00:31 +0200
Date: Wed, 4 Sep 2024 09:00:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [PATCH V2 1/2] firmware: arm_scmi: Ensure that the message-id
 supports fastchannel
Message-ID: <ZtgFj1y5ggipgEOS@hovoldconsulting.com>
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-2-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904031324.2901114-2-quic_sibis@quicinc.com>

On Wed, Sep 04, 2024 at 08:43:23AM +0530, Sibi Sankar wrote:
> Currently the perf and powercap protocol relies on the protocol domain
> attributes, which just ensures that one fastchannel per domain, before
> instantiating fastchannels for all possible message-ids. Fix this by
> ensuring that each message-id supports fastchannel before initialization.

Please include the warnings that I reported seeing on x1e80100 and that
this patch suppresses to the commit message:

arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.
 
> Fixes: 6f9ea4dabd2d ("firmware: arm_scmi: Generalize the fast channel support")

And add:

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Link: https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/

(or use Closes: if you prefer).

> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
> 
> v1:
> * add missing MSG_SUPPORTS_FASTCHANNEL definition.

Unfortunately, this patch breaks resume from suspend on the x1e80100 crd:

        [   26.919676] CPU4: Booted secondary processor 0x0000010000 [0x511f0011]
        [   26.960607] arm-scmi firmware:scmi: timed out in resp(caller: do_xfer+0x164/0x568)
        [   26.987142] cpufreq: cpufreq_online: ->get() failed

and then the machine hangs (mostly, I saw an nvme timeout message after a
while).

Make sure you test suspend as well as some of the warnings I reported
only show up during suspend.

Johan

