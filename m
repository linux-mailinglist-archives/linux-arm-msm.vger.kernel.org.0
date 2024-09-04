Return-Path: <linux-arm-msm+bounces-30714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E781C96BC8E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 14:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E1BDB2153A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 12:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88C81D9331;
	Wed,  4 Sep 2024 12:39:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FD71D86CF;
	Wed,  4 Sep 2024 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725453542; cv=none; b=rxxSuA6F2YOegkhJzPGmtEJyySvKNieouqq7F8dAN9ctUmo4kOjDt2DwtvXZPCXzqX+FD5ViqIAMB6Fhl2GNGDxYI/nOyIs5guvibUwo8dqqjhREQ9CnuNXAzS6AIoZyAkFSEQuunaIabXC52Cj5t+AQHf437iQKaUp8Qm0vccY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725453542; c=relaxed/simple;
	bh=XID3dQgcBE0cBiH/qg0Sw2vAwn3NoD4jAts+rjeKbWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BniSqidLGxZwCz4n7peopYpyRaJ0M+XY3F4OxFLmGb3a2nCufW0h6MW/zU40DbxNnmzKqiVx5kcszagSJDaA5URVIJ2Xj2h+z7oOcu6D4ZEiFpdyxgOZcoY3hnxMmS3UJcoDsDjsIhfwHIQU2ZG8nfB05s3SHOsnpEIfsqmw3i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 249A9FEC;
	Wed,  4 Sep 2024 05:39:25 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C77FE3F73B;
	Wed,  4 Sep 2024 05:38:57 -0700 (PDT)
Date: Wed, 4 Sep 2024 13:38:55 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
	cristian.marussi@arm.com, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH V2 1/2] firmware: arm_scmi: Ensure that the message-id
 supports fastchannel
Message-ID: <ZthU36Qkzwa5Ilrb@bogus>
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-2-quic_sibis@quicinc.com>
 <ZtgFj1y5ggipgEOS@hovoldconsulting.com>
 <d482dca4-e61b-4a94-887b-d14422243929@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d482dca4-e61b-4a94-887b-d14422243929@kernel.org>

On Wed, Sep 04, 2024 at 01:29:29PM +0200, Konrad Dybcio wrote:
> On 4.09.2024 9:00 AM, Johan Hovold wrote:

[...]

> >
> > Unfortunately, this patch breaks resume from suspend on the x1e80100 crd:
> >
> >         [   26.919676] CPU4: Booted secondary processor 0x0000010000 [0x511f0011]
> >         [   26.960607] arm-scmi firmware:scmi: timed out in resp(caller: do_xfer+0x164/0x568)
> >         [   26.987142] cpufreq: cpufreq_online: ->get() failed
> >
> > and then the machine hangs (mostly, I saw an nvme timeout message after a
> > while).
> >
> > Make sure you test suspend as well as some of the warnings I reported
> > only show up during suspend.
>
> Eh it looks like PERF_LEVEL_GET (msgid 8) requires the use of FC, but
> the firmware fails to inform us about it through BIT(0) in attrs..
>

Just trying to understand things better here. So the firmware expects OSPM
to just use FC only for PERF_LEVEL_GET and hence doesn't implement the
default/normal channel for PERF_LEVEL_GET(I assume it returns error ?)
but fails to set the attribute indicating FC is available for the domain.

I am not sure if that is stupid choice or there is some cost benefit in
not implementing PERF_LEVEL_GET via normal channel if that is a fact. I
am very much interested to know the reason either way especially if it
is latter.

--
Regards,
Sudeep

