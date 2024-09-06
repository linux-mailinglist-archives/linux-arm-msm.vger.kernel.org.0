Return-Path: <linux-arm-msm+bounces-31132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7905D96F75A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 16:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE6E8B2544C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 14:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218E61D1F7C;
	Fri,  6 Sep 2024 14:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OaD/ctsQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92B81D1F70;
	Fri,  6 Sep 2024 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634152; cv=none; b=rEkNlnsmU7ew8HVwI+49lNFiGwFNKM1QAmfB5wExmrV5YPY2QyJr05G27ph6MVrfTd9sO3ZXSJt9Xvat+0mNn+rX22fhzXnnDvc4jsDNx01DKFpnxRx4oGFcpbYDUW+1yxwTJQVha3YoT4j6pjadMHzwtaUX14li7jOnjpvFE0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634152; c=relaxed/simple;
	bh=q8NFAWndytiAyShc0RsLlL4YDsYpowOBThyUoQqO95s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCW5WKJ2quooCRxmma8vpaxZAUhNAB/RHJ3JNnAdhg9jZoXBglFybMAyD8i5rRFeqTWtlvkLrrWJwHEJvl0LfeIuNNkRZbPJ0irvmNVtLyjbP3z0PiPG/lfOrbL42bUd/EjbxxAn4UDdPW9Rt5N+9M3w5XphYGeK60k2CvKueZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OaD/ctsQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C872C4CEC6;
	Fri,  6 Sep 2024 14:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725634151;
	bh=q8NFAWndytiAyShc0RsLlL4YDsYpowOBThyUoQqO95s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OaD/ctsQ4iXV0nrrBeprUpDNN1sNKukqG5wifippuTa4rHRjuJpdK/TrFPcXxzTAJ
	 0j0FCL9XPfj6DfxlvbrdEArx5OeRhJv9PxUGM0ywA0hBFpnNyxLV9ipG/H6UxfN5mw
	 LOYgISlNE1Evk+Ele42Te9tlIDrAiwQuLN601Gv1S3nDTfYxz6zwtMZDIGaHlDfitK
	 tu9xxdAN4w06DN04yZDy6Cbn2WJkteUm73zD/iawT+h//cohpXHZJEhwHwxN7YUZZ/
	 +kzppUP86j/FZbLB5Hbni2hADgcU2PTdZWGcojSto3Ye0ZU/KT8NpeR6VyGf3kONoP
	 eTv7flitAbWsg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1smaHD-000000005ly-40G9;
	Fri, 06 Sep 2024 16:49:32 +0200
Date: Fri, 6 Sep 2024 16:49:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp-x13s: keep less
 regulators always-on
Message-ID: <ZtsWe6IDKU4rvHIT@hovoldconsulting.com>
References: <20240905122023.47251-1-brgl@bgdev.pl>
 <20240905122023.47251-5-brgl@bgdev.pl>
 <Ztm6fzmoeWcCpqvi@hovoldconsulting.com>
 <CAMRc=McDHi5EVpBjsuFE+JHgBhh84tsT6xr5PWO5yeU8zbS99Q@mail.gmail.com>
 <n7scbcdbse4m4rilkegqsinallgkryayjzqojnxtr7qozgxwp7@7mgropizypbz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <n7scbcdbse4m4rilkegqsinallgkryayjzqojnxtr7qozgxwp7@7mgropizypbz>

On Thu, Sep 05, 2024 at 10:27:24PM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 05, 2024 at 08:23:39PM GMT, Bartosz Golaszewski wrote:
> > On Thu, Sep 5, 2024 at 4:04 PM Johan Hovold <johan@kernel.org> wrote:
> > > On Thu, Sep 05, 2024 at 02:20:22PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > Remove the regulator-always-on property from the ones that used to be
> > > > implicitly needed by the on-board WCN6855 now that its PMU is modeled in
> > > > device-tree.

> > > What makes you think s10b is only used by wcn6855?
> > 
> > I didn't say that. It's used by many components but they seem to be
> > all described in DT. But I get it, the schematics show it in so many
> > places, it would be risky to not keep it on.
> 
> Well, that depends on the consumers. If all consumers are good and
> voting, then it should be safe.

Right. But in this case, not all consumers are described in DT (e.g.
ddr) and this is effectively an always-on rail.

Johan

