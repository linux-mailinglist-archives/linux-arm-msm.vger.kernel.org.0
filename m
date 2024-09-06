Return-Path: <linux-arm-msm+bounces-31134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F69096F774
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 16:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A33DDB20FC2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 14:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EBA1D172C;
	Fri,  6 Sep 2024 14:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1a7U9Qa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01138172BA9;
	Fri,  6 Sep 2024 14:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634368; cv=none; b=SopD/R8wY56JkTOEOsHFFqX9Xk2s/gOgKJpZly1Q9xLT/Py6eYlF2yIwArCKc0s95c8s2MgyqlYHtAM+9dnA6tqHCvQjwIZpmT2jWa/ArTzjD0dXA968GNP42bDA75Jiofdk6Cbst1xwMzfa/xjASywulYwIjCR0Nz6TwUsR21A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634368; c=relaxed/simple;
	bh=3kB8JTs7MpRpTKnwYyM1DCNjyPquzyUbSpH6JXUZUnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRO2IXt5Mleji8tRudjYk8cgaDbBdJKbDklZM1IfoNAT/+QWODkqgZBfU7gUGVnHYZhtke7veJf0rXAUrVsu5aGlXp2rTONP2gwKFaf1MjlK2LpGme91QWEAkv0vMrsqKAO8iIVGnoEuAJiltNI4vHyBUnZJbG96ypBL1ZU+cgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1a7U9Qa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693ABC4CEC4;
	Fri,  6 Sep 2024 14:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725634367;
	bh=3kB8JTs7MpRpTKnwYyM1DCNjyPquzyUbSpH6JXUZUnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1a7U9QaAMgphGBt51CclHTBBa3dFP2CS/XL8IxjXjBp91XcNnaWySmhmI6cP3whm
	 tnM8/gWUFzuQgQS3YjhimhFkDG5aqjDQHpW3I7eKlKYwOWwUSyrtTNshvhvggP8KYB
	 BqTvkU7usoAr+9z+BTwYVuLbapL2wgDc/sHVgrReqStFvsVHCDIHxYN4oZJkZTcvie
	 T7W+nh2nqHjpzXsr+tKUdnbX+vT20GmFYGQvFvHFWE6bL1vtmngRyUc9w8PDJdgVhz
	 960XEXIBvD+s4b03eTmJNzbnwsHydcXss0tRRgDp5GOpGL/DtmY1BOXOM1qWrjNRm/
	 3dnMfjW/2ZFJw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1smaKh-000000005HB-4529;
	Fri, 06 Sep 2024 16:53:08 +0200
Date: Fri, 6 Sep 2024 16:53:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
Message-ID: <ZtsXUyBRV9yDeq1P@hovoldconsulting.com>
References: <20240905122023.47251-1-brgl@bgdev.pl>
 <20240905122023.47251-2-brgl@bgdev.pl>
 <6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
 <CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
 <CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
 <CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
 <d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org>
 <87v7zagcyf.fsf@kernel.org>
 <ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q>

On Thu, Sep 05, 2024 at 10:26:04PM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 05, 2024 at 09:41:44PM GMT, Kalle Valo wrote:

> > There have not been really any naming rules for the variant string, it
> > just needs to be unique so that it doesn't conflict with other variant
> > strings. What have you been thinking?
> 
> QC_8380_CRD (following DMI / Windows name) or QC_X1E80100_CRD (following
> marketing name). Or maybe QTI_ instead of QC_. WDYT?

The x1e80100 uses ath12k and the calibration data was recently pushed to
linux firmware (and does not use a calibration variant).

This thread is about sc8280xp and ath11k as I guess you've noticed by
now.

Johan

