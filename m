Return-Path: <linux-arm-msm+bounces-52871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A7A764AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 13:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFAA51885A34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 11:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178C01E130F;
	Mon, 31 Mar 2025 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2NDbTtm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7EC1E1022;
	Mon, 31 Mar 2025 11:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418808; cv=none; b=UyeV4e9Jj/Df2V1IlXZUExHkcxNqbERiG8OkrPsHn6AioB/5nKNbvE8lu78At9jStT3qN48pels5qkCULXOKgDqd9qiX+8vu2Kpfj6zizQNCEu9xVz+YIyBHbzx+VijpHqn1nUyhR2FaY5Nhqrn3Y15b0F2YVEM4rkWFz53uh4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418808; c=relaxed/simple;
	bh=cld3lKxTDUu1Y017kQ5wCwIuFGJrB2vDX2SYmnv1YDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtEXfeJxOqeuWwynuN1w7GqE/ijkwtghDPt0/1GeeOCrvtwqkf/WWwTH3/fvQrOEgtsWJMDrsE7w7ADajizfaKu2u6N0QaAP9NEtcCwwmRTvmPpKAAw7LYkB78z4/VKWLIELueXLTDRxt23T9z7krvZuj3v851GVW5/DSqae34U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2NDbTtm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B86C4CEE3;
	Mon, 31 Mar 2025 11:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743418806;
	bh=cld3lKxTDUu1Y017kQ5wCwIuFGJrB2vDX2SYmnv1YDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g2NDbTtm2fnQtfkndR19AJeXfOsg0aKBR2zhOLRbu/9G8MGRZ1S7rQHaG6x9vRzTy
	 i3af8JbkRk75lFo8ihOyRc0MVCUuvUa8AujywyGInIhU+fKBi8VIrwUqZ7GjjkDd1c
	 V7eYlKTZ+yvSEromo+SjihkEQY+NkhlsEtXc0RSyDGUtnuTQjmnORHU3InLe2ziFYx
	 phqxJ12Hh7ynoTlbCRghVk9JXld7NPMhl2TsXaY6Vm3kAAYNRFtMpitT+LUGQoMlwa
	 LmwWYmAI1sL5Eq8sEjFKyoVN1k1MzPHQIOjYO6veyU1OZbm8043mv5cZpZzdD3FbcY
	 G+5t4zgAyjO1Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tzCsC-000000006dk-0laY;
	Mon, 31 Mar 2025 13:00:08 +0200
Date: Mon, 31 Mar 2025 13:00:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: "Tudor, Laurentiu" <Laurentiu.Tudor1@dell.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dmitry.baryshkov@oss.qualcomm.com,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add
 WiFi/BT pwrseq
Message-ID: <Z-p1uADNVAM9NcAW@hovoldconsulting.com>
References: <20250331073423.3184322-1-alex.vinarskis@gmail.com>
 <20250331073423.3184322-2-alex.vinarskis@gmail.com>
 <Z-pN1qloL2m4BWaq@hovoldconsulting.com>
 <CAMcHhXq9W64MHhOV5i3U4t+ZfKNC_GaBq5X3ZN7VOLt0cjPQPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXq9W64MHhOV5i3U4t+ZfKNC_GaBq5X3ZN7VOLt0cjPQPg@mail.gmail.com>

On Mon, Mar 31, 2025 at 11:38:25AM +0200, Aleksandrs Vinarskis wrote:
> On Mon, 31 Mar 2025 at 10:09, Johan Hovold <johan@kernel.org> wrote:
> >
> > [ +CC: Stephan ]
> >
> > On Mon, Mar 31, 2025 at 08:33:47AM +0100, Aleksandrs Vinarskis wrote:
> > > Add the WiFi/BT nodes for XPS and describe the regulators for the WCN7850
> > > combo chip using the new power sequencing bindings. All voltages are
> > > derived from chained fixed regulators controlled using a single GPIO.
> > >
> > > Based on the commit d09ab685a8f5 ("arm64: dts: qcom: x1e80100-qcp: Add
> > > WiFi/BT pwrseq").
> >
> > Are you sure this is correct and that you don't need to worry about the
> > "how do we model the supplies to an M.2 card" issue?
> >
> > See
> >
> >         https://lore.kernel.org/lkml/Z-KuG0aOwEnxuhp9@linaro.org/
> 
> Dell XPS 9345 does not have an M.2 card, WLAN package is soldered
> directly onboard, hence I am quite sure this is similar to QCP.
> To be certain, perhaps @Tudor, Laurentiu or @Bryan O'Donoghue (if  you
> have it?) could confirm from schematics?

I checked now, it seems you are correct.

Highly annoying that we need all this guess-work boiler plate (about
chip internal details) for what is effectively just two supplies.

Hopefully we can drop that again going forward, but that's a separate
discussion.

> > > With that fixed commit f5b788d0e8cd ("arm64: dts: qcom: Add support for
> > > X1-based Dell XPS 13 9345")
> >
> > Not sure what happened here.
> 
> Bluetooth and WLAN definitions were missing, as at the time I only
> knew the UART port being used for bluetooth, and was missing
> everything else to describe it.

Ah, ok. The above sentence looked like some left-over copy paste. I
guess you don't need to mention it at all since this does not seem to
warrant a proper Fixes tag.

Johan

