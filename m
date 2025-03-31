Return-Path: <linux-arm-msm+bounces-52889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B5FA76D4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 21:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80B5B3AC4F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 19:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A0F21884B;
	Mon, 31 Mar 2025 19:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9dVvoYO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D203215064;
	Mon, 31 Mar 2025 19:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447994; cv=none; b=bWcJsbAMcvWhZ7gccPvPVdHkJ1rId6FFMd7jlYjg/XcQ/SsiS5YlMt5CntmQ2OQJIzu15PSN8JWujfydJiGQzUJbVVhcVqOUCPF1x7Rel0ODQvQCK8j1okDDdlIZDfpmJ26QE5BVmQEa0TaF1UuQ0xMY5voTg3gz2uwFl/69XU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447994; c=relaxed/simple;
	bh=GSdezILBg9AMDpFKqDEOgXG/5H5Ir4ccpT5zJFC+l7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZcK8mQtFpGYr1NeEcVC35IdSF4n+jT8MTpR4jAksb48jBqhuyLKEeiNKoDDmoWGLDOEVqE3XXVtue310y0povy5kgnCKOPD9G+Yl/pKpD61emQ3/8BvPckhtP781wlagscIkcDzqZi/+Jh6UyCw6T8OlFB3BDls9FCDg5o58Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9dVvoYO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6166C4CEE3;
	Mon, 31 Mar 2025 19:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743447994;
	bh=GSdezILBg9AMDpFKqDEOgXG/5H5Ir4ccpT5zJFC+l7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9dVvoYO+m2E0z+eIzLPbDNzONgi8HajZJ+BveufehFXOOD6oJv0c5fhvHRdOyOEk
	 4oP3K8nwcpRWbz8XdzdaLL20UzQWo/eiYnJonoV4T0v59MEZEv4uzZslVwABnOg+E8
	 +ISP62fh4ynBERZPr7i7PMgTHf5mvRMiSLP1boea0CHoVE7QAxjjR/w5T848kiy/1x
	 C9Jaaz3rEuekkkzW5HP5M9GgCYhdUwGm1W/67/Mjv6HDhA4ZDLR9C/JZfsm4okGO60
	 G1XzRyeVM5RTbfUof1e0oBS9vYtvmv64to/JGdMk6n0+19T7HiAmkKM6BdZ07BljGd
	 rmx+0kYv2bUUQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tzKSz-000000004BU-2Amd;
	Mon, 31 Mar 2025 21:06:37 +0200
Date: Mon, 31 Mar 2025 21:06:37 +0200
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
Message-ID: <Z-rnvSKEysdDyj4s@hovoldconsulting.com>
References: <20250331073423.3184322-1-alex.vinarskis@gmail.com>
 <20250331073423.3184322-2-alex.vinarskis@gmail.com>
 <Z-pN1qloL2m4BWaq@hovoldconsulting.com>
 <CAMcHhXq9W64MHhOV5i3U4t+ZfKNC_GaBq5X3ZN7VOLt0cjPQPg@mail.gmail.com>
 <Z-p1uADNVAM9NcAW@hovoldconsulting.com>
 <CAMcHhXqO2Ej3UAej9QodX1NNCHAk956++=oakPxx-MkpOucJ2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXqO2Ej3UAej9QodX1NNCHAk956++=oakPxx-MkpOucJ2Q@mail.gmail.com>

On Mon, Mar 31, 2025 at 06:51:03PM +0200, Aleksandrs Vinarskis wrote:
> On Mon, 31 Mar 2025 at 13:00, Johan Hovold <johan@kernel.org> wrote:
> > On Mon, Mar 31, 2025 at 11:38:25AM +0200, Aleksandrs Vinarskis wrote:
> > > On Mon, 31 Mar 2025 at 10:09, Johan Hovold <johan@kernel.org> wrote:
> > > > On Mon, Mar 31, 2025 at 08:33:47AM +0100, Aleksandrs Vinarskis wrote:
> > > > > Add the WiFi/BT nodes for XPS and describe the regulators for the WCN7850
> > > > > combo chip using the new power sequencing bindings. All voltages are
> > > > > derived from chained fixed regulators controlled using a single GPIO.
> > > > >
> > > > > Based on the commit d09ab685a8f5 ("arm64: dts: qcom: x1e80100-qcp: Add
> > > > > WiFi/BT pwrseq").

> > > > > With that fixed commit f5b788d0e8cd ("arm64: dts: qcom: Add support for
> > > > > X1-based Dell XPS 13 9345")
> > > >
> > > > Not sure what happened here.
> > >
> > > Bluetooth and WLAN definitions were missing, as at the time I only
> > > knew the UART port being used for bluetooth, and was missing
> > > everything else to describe it.
> >
> > Ah, ok. The above sentence looked like some left-over copy paste. I
> > guess you don't need to mention it at all since this does not seem to
> > warrant a proper Fixes tag.
> 
> It was a suggestion from Dmitry in v1. Though indeed it does not
> warrant a proper Fixed tag, as it is something  that was left out from
> the initial series, I think it's fine to keep it like this, if it's
> okay with you?

I think you misinterpreted Dmitry here. He just said that after you
added the reference to the commit you based this on to the commit
message you could add his reviewed-by tag ("With that fixed: R-B: Dmitry
...")

	https://lore.kernel.org/all/ou7w4hvbbz72nzrm45gfhpq2uzkuwpfudqeh2o34tcnbnazxgz@glmuryu5dh3s/

As it stands it's hard to understand what that sentence means and why
it is there (looks like a copy paste mistake). I suggest you just drop
it.

Johan

