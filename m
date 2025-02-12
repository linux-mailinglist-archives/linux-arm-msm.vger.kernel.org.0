Return-Path: <linux-arm-msm+bounces-47805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46787A32DEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 18:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06A111631C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E7225C6E4;
	Wed, 12 Feb 2025 17:52:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A6F2116E0;
	Wed, 12 Feb 2025 17:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739382756; cv=none; b=j6UYIISdP38q+3n+3wUvZ3DTDxmUwqWQC91nWfw4s40evtuh93Mx7kSxDjbXrs+Ku8nA73uGEOA57wnBZz1n8T0w0LqkZ5g9rDPfQHWB8B6j2Hl33DZ9RktXYf+W/QDQepxRzcSps77kEcMYYe7g6tPQ9cqdpMZpJfZdy7hHr6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739382756; c=relaxed/simple;
	bh=+NhNCKZXDZb6dqspfC+iGIXo+Hw4ID8DAzEvUY6Mf2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5Bew9m0rL2Mj7ADU53F65OtPUKqKNqtZlUcip7PchVpuKO2+VW7ikyVSZRnCkskNUcm8Ogd+gto8lcGHTPoVEsvXpSAx8Gg1vm6TGbQLIgncIRkPKwUhr5yATO2DBC4KzxNk0ZwE8j9q9hASVQ6yBMxqaJuZTkNyamGbMk9yH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B181C4CEE2;
	Wed, 12 Feb 2025 17:52:31 +0000 (UTC)
Date: Wed, 12 Feb 2025 17:52:29 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: James Morse <james.morse@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Scott Bauer <sbauer@quicinc.com>, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
Message-ID: <Z6zf3YJq6qqoJQRi@arm.com>
References: <20250107200715.422172-1-dianders@chromium.org>
 <20250107120555.v4.2.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
 <e6820d63-a8da-4ebb-b078-741ab3fcd262@arm.com>
 <CAD=FV=WTe-yULo9iVUX-4o8cskPNp8dK-N9pKq6MxqrPX3UMGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WTe-yULo9iVUX-4o8cskPNp8dK-N9pKq6MxqrPX3UMGw@mail.gmail.com>

On Wed, Jan 29, 2025 at 11:14:20AM -0800, Doug Anderson wrote:
> On Wed, Jan 29, 2025 at 8:43 AM James Morse <james.morse@arm.com> wrote:
> > Arm have recently updated that table of CPUs
> > with extra entries (thanks for picking those up!) - but now that patch can't be easily
> > applied to older kernels.
> > I suspect making the reporting assuming-vulnerable may make other CPUs come out of the
> > wood work too...
> >
> > Could we avoid changing this unless we really need to?
> 
> Will / Catalin: Do either of you have an opinion here?

Is this about whether to report "vulnerable" for unknown CPUs? I think
Will suggested this:

https://lore.kernel.org/all/20241219175128.GA25477@willie-the-truck/

That said, some patch splitting will help to make review easier. Should
such change be back-portable as well? I think so, it's not only for CPUs
we'll see in the future.

-- 
Catalin

