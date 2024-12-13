Return-Path: <linux-arm-msm+bounces-42084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 334419F11AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7761F18813D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC081E378C;
	Fri, 13 Dec 2024 16:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drwqEi1K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEB91E00AC;
	Fri, 13 Dec 2024 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734105658; cv=none; b=LAg4Pd49crfot/Tp0eySJO8F2K0FW0TEc2AEgL8csqNC7R3Pe0cQ3uKerBwaOBNSm0fyi2NtETLsL5XVVJEOVwPb81FgPEZzZN/Ggr333IiOzwuAQxCrxKGktt+dDNmoaru10BawBmRTCbBQdvvzceceUrshXO3BKvx+luSBAXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734105658; c=relaxed/simple;
	bh=5XQWrcX5GyYj8LFdIhYGQZjcjue5NcViLdKUXQX6Lxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ri4zoShkDI1nppMHQtjI9QGtiNzf+8ie8XadT/265vqVl6RXc9ZNhx7p7c0f4YW3aQwEow65tNGqQ/bogqju/uWrqFCA5W7VKgN+8SaysPxhpHgksXrDbbhIFOC6sGuWm12lIXkIANM3/Y7otqa9SNHQpNWkYLh9SCX3k/g4urI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drwqEi1K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94892C4CED0;
	Fri, 13 Dec 2024 16:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734105657;
	bh=5XQWrcX5GyYj8LFdIhYGQZjcjue5NcViLdKUXQX6Lxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=drwqEi1KUb45YUFYPuSo7fSS3CvrrB4cd7pP6+asr3gUVR+0zWLlIoiwSC4Z/YJV0
	 1vJfqDd7hWfU1BTM58kqEYDnQLK/4RAYzMlt2PH5APM1YOWFBIefrCkgnlTRxJQCEo
	 IlxUytji6/3dL/IHjXaBUqq5mQvaI9RnTVJ7Vx3O1+0ax8P6QU8cymPxtS17j9Z+AP
	 Mx2IeWA8LzXbgk3JpLdAJNIVKAykWrNS3STLVp+s4FK7UpTj5PYt5AgEwUOz9tUEUu
	 2Ln+JafCNPnoQfaRkOm64U4iBQCB7N7x8CMcV0xkbe8WcB42ffxnR5DphgukxBMUkO
	 ZPuoIXPVEYIDQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tM86A-000000005sw-2DjX;
	Fri, 13 Dec 2024 17:01:02 +0100
Date: Fri, 13 Dec 2024 17:01:02 +0100
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 13/23] arm64: dts: qcom: x1e80100: Fix ADSP memory
 base and length
Message-ID: <Z1xaPvyBap5Q4vXC@hovoldconsulting.com>
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
 <20241213-dts-qcom-cdsp-mpss-base-address-v3-13-2e0036fccd8d@linaro.org>
 <Z1xUUAnxsCY33umS@hovoldconsulting.com>
 <7edc0cb7-d6fd-4395-b2ca-dfce243f066c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7edc0cb7-d6fd-4395-b2ca-dfce243f066c@linaro.org>

On Fri, Dec 13, 2024 at 04:45:30PM +0100, Krzysztof Kozlowski wrote:
> On 13/12/2024 16:35, Johan Hovold wrote:
> > On Fri, Dec 13, 2024 at 03:54:02PM +0100, Krzysztof Kozlowski wrote:
> >> The address space in ADSP PAS (Peripheral Authentication Service)
> >> remoteproc node should point to the QDSP PUB address space
> >> (QDSP6...SS_PUB): 0x0680_0000 with length of 0x10000.
> >>
> >> 0x3000_0000, value used so far, is the main region of CDSP and was
> >> simply copied from other/older DTS.
> >>
> >> Correct the base address and length, which also moves the node to
> >> different place to keep things sorted by unit address.  The diff looks
> >> big, but only the unit address and "reg" property were changed.  This
> >> should have no functional impact on Linux users, because PAS loader does
> >> not use this address space at all.
> >>
> >> Fixes: 5f2a9cd4b104 ("arm64: dts: qcom: x1e80100: Add ADSP/CDSP remoteproc nodes")
> >> Cc: stable@vger.kernel.org
> > 
> > Why bother with backporting any of these when there is no functional
> > impact?
> 
> Not sure, I assumed someone might be using kernel DTS from stable
> branches in other projects. Kernel is the source of DTS and stable
> kernel has the DTS in both stable and fixed way. If 3rd party project
> keeps pulling always latest DTS from latest kernel, they will see so
> many ABI breaks and so many incompatibilities (we discussed it in
> Vienna) that they will probably curse their approach and say "never
> again". Using stable branch DTS could be a solution.

That makes some sense.

> Such 3rd party project might actually use above device nodes in their
> drivers. It's just some of Linux kernel drivers which do not use them
> (other like PIL seems to use addresses).

But this is more questionable given that the current addresses are
completely off in this case.

> Plus DTS is used by 3rd party Linux kernels (out of tree), which while
> we do not care in a way of driving our development, but we do consider
> them possible users. They also might be relying on stable kernel branch
> for this.

Same here.

I realise this is a bit of a grey area, but given the size of the diffs
and the no functional impact this could be an opportunity to try to
uphold the stable kernel rules:

	- It cannot be bigger than 100 lines, with context.
	- It must either fix a real bug that bothers people or just add
	  a device ID.

Johan

