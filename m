Return-Path: <linux-arm-msm+bounces-51523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F303DA6240E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 02:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AF563BE853
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 01:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F4E11187;
	Sat, 15 Mar 2025 01:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpIDYybX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E6F8460;
	Sat, 15 Mar 2025 01:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742002242; cv=none; b=W1+f/Hs+j+3NN4aeZ6y+66BrfkUdGLB5c3Ky+G2kjU/31HEFeBodj4ofLW/P4hMlEbrbL/3VRuctV+9jc/7a4JNfRSAQQ71aDK5S5WI9Ffl+jF7iozaZVCq4AasK74lMVdU1KlPpNoKwjD+8jGlRFLOM2z6eAyLkJfrnJWlv1HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742002242; c=relaxed/simple;
	bh=KaZb+So+kIJ61pd5tlqkvNoM0CboHenzCId7dCf8GHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1fuDjpvzbxDic+m8entuMgcHE3knk3t2WxnZea/pX7EJLH86SqOAn/BZsVore/NfwOQ/PLXHHazDcReb9JRJa6nk6B19QKJQqKqA/qk5D46qDyHwVWEfV+Zhnl4pLmeRc6beRAY96RfifhLZTLUkV603py3QLchspQgn8ubq4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpIDYybX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D381C4CEE3;
	Sat, 15 Mar 2025 01:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742002241;
	bh=KaZb+So+kIJ61pd5tlqkvNoM0CboHenzCId7dCf8GHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpIDYybXEBqiKvhsBGuVjbelj1QhN4p+jn5ghGw1dgEOhNnRPGIDn2rhd9YxuyESP
	 Y/B/NciJCUSrdlLkt9NGnGueuoV6ISNV5HC7oHbix9YOtUNuj4XjoNpeBHC1/9VLKf
	 4x8Yv3PbVz3Yl7dKbbKTI4uCPc3al+GpWOWkxzUhOXQBaDK6hUPxTgfEiOREpx7gBQ
	 7PSxj6NufgIkO58M+N09v1rK5OH9Qew1EB58jXgQvTrsCdn4DUUpXs/86I5Qo3mSn9
	 80MBUvidbap7xYjKYTjr/g+fXkXiC6UlBquKb6j+0I6+kvRjeKF1hgy0iZEk5iLgVD
	 0SXFUXFp2O48A==
Date: Fri, 14 Mar 2025 21:30:40 -0400
From: Sasha Levin <sashal@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.13 32/32] irqchip/qcom-pdc: Workaround hardware
 register bug on X1E80100
Message-ID: <Z9TYQAwauX3q7WKb@lappy>
References: <20250224111638.2212832-1-sashal@kernel.org>
 <20250224111638.2212832-32-sashal@kernel.org>
 <Z7yGLDkI1T4laWBd@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z7yGLDkI1T4laWBd@hovoldconsulting.com>

On Mon, Feb 24, 2025 at 03:46:04PM +0100, Johan Hovold wrote:
>Hi Sasha,
>
>On Mon, Feb 24, 2025 at 06:16:38AM -0500, Sasha Levin wrote:
>> From: Stephan Gerhold <stephan.gerhold@linaro.org>
>>
>> [ Upstream commit e9a48ea4d90be251e0d057d41665745caccb0351 ]
>>
>> On X1E80100, there is a hardware bug in the register logic of the
>> IRQ_ENABLE_BANK register: While read accesses work on the normal address,
>> all write accesses must be made to a shifted address. Without a workaround
>> for this, the wrong interrupt gets enabled in the PDC and it is impossible
>> to wakeup from deep suspend (CX collapse). This has not caused problems so
>> far, because the deep suspend state was not enabled. A workaround is
>> required now since work is ongoing to fix this.
>
>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
>> Link: https://lore.kernel.org/all/20250218-x1e80100-pdc-hw-wa-v2-1-29be4c98e355@linaro.org
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This one was not marked for backporting on purpose and is not needed in
>older kernels, please drop from all autosel queues.

Will do, thanks!

-- 
Thanks,
Sasha

