Return-Path: <linux-arm-msm+bounces-66760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB04B12B92
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 19:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F18B1C2260A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 17:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549F02877D3;
	Sat, 26 Jul 2025 17:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOqzOZOS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A5C28750C;
	Sat, 26 Jul 2025 17:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753549922; cv=none; b=Gg/DDw1l19ZmfeHLr2BOy0KuX77kNY/0W8z733+BofuMT6Jh8nt6ymMsH4SOnfMGjbkXGNnQvixq6oZvlIY1H+67FJsb7xEfAWG2JDoDEO1zt68aGLYtCfP3OrWW8SqvURk385Dw/tfMsVHO/P0BtN0965nC2u2mYn85CZXMrlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753549922; c=relaxed/simple;
	bh=rbCHqu5g+PtQzNMLvBDPb0/RV2wi01i4KdX1ANI0vaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IroB+JaczGgPQzE9tR7yj5U3n4igUVxpPZlclTYZdCX/98pPvhomLMWfJNP2deOtqY0ATVCCiMHlBclXvJuHM76Y9tbzNMH3j4lpz6XneG9RUDye1U8HjPIYD42w8smpBACo0ud7yF4pMYHNDfN2jcxJMS/JpuJWoPH1jhiMGAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOqzOZOS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B162FC4CEED;
	Sat, 26 Jul 2025 17:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753549921;
	bh=rbCHqu5g+PtQzNMLvBDPb0/RV2wi01i4KdX1ANI0vaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOqzOZOSdy4bu3tujbaeZeDeyXdFKmVFMRi7oEDbsn5YWEg7yg4qGttFH/5s6nADo
	 8QyY3nUKWaGqDH9JPJ2gUZTlcxOa6xrc2mJOj/9kmRr9EP//zWIbvVEasrXpUrXblK
	 ILS3+raUWsO2aGz/Q2RbXAs9TLgmchrwDu7bpA6/dzCOy9PTnwVCFV0mOJWx3Q6SuB
	 WeRidwQjxZ49ai8Y2Wlk2JwwCAQYWWqVXqZ6DgbqB+iaNHENwMBTwdLEcGYAxzHbYx
	 5IZoHxqh8eOV8GiUAUExWOkUKLL3Gj+w5y8sUiH9M5jJ2ND0pQ7B3BcRhvwQDW7LW2
	 ckApRb6hweqDg==
Date: Sat, 26 Jul 2025 12:11:58 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Wasim Nazir <wasim.nazir@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
Message-ID: <vc2z57myldazay75qwbxotxr5siooqny2vviu6yznna3fdj3ed@6fpcy7dcg6t3>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>
 <20250723-swinging-chirpy-hornet-eed2f2@kuoka>
 <159eb27b-fca8-4f7e-b604-ba19d6f9ada7@oss.qualcomm.com>
 <e718d0d8-87e7-435f-9174-7b376bf6fa2f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e718d0d8-87e7-435f-9174-7b376bf6fa2f@kernel.org>

On Thu, Jul 24, 2025 at 02:51:54PM +0200, Krzysztof Kozlowski wrote:
> On 24/07/2025 14:47, Konrad Dybcio wrote:
> > On 7/23/25 10:29 AM, 'Krzysztof Kozlowski' via kernel wrote:
> >> On Tue, Jul 22, 2025 at 08:19:20PM +0530, Wasim Nazir wrote:
> >>> SA8775P, QCS9100 and QCS9075 are all variants of the same die,
> >>> collectively referred to as lemans. Most notably, the last of them
> >>> has the SAIL (Safety Island) fused off, but remains identical
> >>> otherwise.
> >>>
> >>> In an effort to streamline the codebase, rename the SoC DTSI, moving
> >>> away from less meaningful numerical model identifiers.
> >>>
> >>> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} | 0
> >>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi             | 2 +-
> >>
> >> No, stop with this rename.
> >>
> >> There is no policy of renaming existing files.
> > 
> > There's no policy against renaming existing files either.
> 
> There is, because you break all the users. All the distros, bootloaders
> using this DTS, people's scripts.
> 

None of these users are affected by the rename of the .dtsi file.

Patch 5 does have user impact, so that one would be "controversial".
From the answers I've gotten, I'm questioning which of thees files
actually has users - but that's best done in a standalone patch removing
or renaming them, with a proper commit message.

> > 
> >> It's ridicilous. Just
> >> because you introduced a new naming model for NEW SOC, does not mean you
> >> now going to rename all boards which you already upstreamed.
> > 
> > This is a genuine improvement, trying to untangle the mess that you
> > expressed vast discontent about..
> > 
> > There will be new boards based on this family of SoCs submitted either
> > way, so I really think it makes sense to solve it once and for all,
> > instead of bikeshedding over it again and again each time you get a new
> > dt-bindings change in your inbox.
> > 
> > I understand you're unhappy about patch 6, but the others are
> > basically code janitoring.
> 
> Renaming already accepted DTS is not improvement and not untangling
> anything.

No, but the rename of the dtsi file and avoiding introducing yet another
qcs<random numbers> prefix in the soup is a huge improvement.

> These names were discussed (for very long time) and agreed on.
> What is the point of spending DT maintainers time to discuss the sa8775p
> earlier when year later you come and start reversing things (like in
> patch 6).
> 

There was no point, all the information wasn't brought to those
discussions...

What we know now is that QCS9100 and QCS9075 (and perhaps more?) are the
Lemans IoT product line and the EVK is the main development board
there on.

It's unclear if there are any lingering users of sa8775p-ride, but
the platform we describe in sa8775p.dtsi doesn't exist anymore. To the
best of my understanding, any users of the ride hardware should be on
qcs9100-ride...

Regards,
Bjorn

