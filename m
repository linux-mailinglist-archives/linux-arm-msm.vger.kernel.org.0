Return-Path: <linux-arm-msm+bounces-33304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 702F99922B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 04:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2095E1F21C0D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 02:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77ADB1078B;
	Mon,  7 Oct 2024 02:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYrik45r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFE5231C8F;
	Mon,  7 Oct 2024 02:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728266736; cv=none; b=jwsZLNPWGOCQcMEzodPbHvmCKpugiFdpcuol2cc1PsTciINguMQ7hju6OUDoV2ePVMfGlxqeZiwCq8d6pQqPFckfuBzEN5ss9X+Aal3GyKQpAJx1hXJKtkHowdcbkEHGT0cbAMIKDKUWT/+pPkXLYwJF2P0ZYyL5R7sbp0N0KRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728266736; c=relaxed/simple;
	bh=vSS0mNwLd9L+a8nwXnNp0Jjzmc3ypK3JiuMBpd0vKxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMbxoaB50tbNW/0Vx7CVO5usoMOG8vUGRWNRrsJdGyDYyI4mgDzmAkQfP7n2kXqcmdcmCz5raDpyYbkmq5GvWsBkMa8/dz/7yW03bskfk0WamCsilAC3RKBduZebqcPOFm5j/LNG3NdaZ9HO7wVwOD1wIctlVbMEGpqiSyMZVE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYrik45r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFAA8C4CEC5;
	Mon,  7 Oct 2024 02:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728266735;
	bh=vSS0mNwLd9L+a8nwXnNp0Jjzmc3ypK3JiuMBpd0vKxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZYrik45rt6Iey0b4ietxizbHV+OiHLzD6XF7gs6+Niyrn9PXSCCvPFcEbHBMMSv9H
	 jx1e08ninm99nBdELwQCJZoaNx77pSpxhvyJXML6LHgyoskP9RDJrla0jK0rpOovK1
	 9KrVpgQmKZe1Q4Ve5BwCgOWk/mFIlWQ9cG7a51Gvv0ssDv4CSvvl1r2r6BRTnWExUq
	 Od9zrMzaZvlI2qshpfndGjptbbry/+oysQU3UmCIrrg6WagjosGo26JS/GIbQd8Jcj
	 9GvG3XGGqBiQA2dAx3oDYhrOQcFA7C2XgwuZzwtjjELEaSehjhJr7xbbFHsoAgBke5
	 NDgcT2tTBMmAw==
Date: Sun, 6 Oct 2024 21:05:32 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Om Prakash Singh <quic_omprsing@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Gaurav Kashyap <quic_gaurkash@quicinc.com>
Subject: Re: [PATCH v7 0/2] arm64: dts: qcom: extend the register range for
 ICE on sm8[56]50
Message-ID: <2rnw2kge5iigcf3p356rsw3wtg2a7ztufygjkdxr7vguafymnc@gz6pky5rd5qg>
References: <20241001-wrapped-keys-dts-v7-0-a668519b7ffe@linaro.org>
 <Zv/0DVQNEsJPoyCR@hu-bjorande-lv.qualcomm.com>
 <CAMRc=Mc__SzjxA_XoYcco=zLUvtbSCyWmdhx=NOXt5CGLWGK1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc__SzjxA_XoYcco=zLUvtbSCyWmdhx=NOXt5CGLWGK1w@mail.gmail.com>

On Fri, Oct 04, 2024 at 04:13:15PM GMT, Bartosz Golaszewski wrote:
> On Fri, Oct 4, 2024 at 3:56 PM Bjorn Andersson
> <quic_bjorande@quicinc.com> wrote:
> >
> > On Tue, Oct 01, 2024 at 10:35:29AM +0200, Bartosz Golaszewski wrote:
> > > The following changes extend the register range for ICE IPs on sm8550
> > > and sm8650 in order to cover the registers used for wrapped key support
> > > on these platforms.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Changes in v7:
> > > - bring the ICE register range up to its full size of 0x18000
> > > - Link to v6: https://lore.kernel.org/r/20240906-wrapped-keys-dts-v6-0-3f0287cf167e@linaro.org
> > >
> > > Changes in v6:
> > > - split out the DT changes into a separate series
> >
> > Bartosz, this strategy of "let's split things such that the maintainers
> > can't see the full picture" is just BS. It needs to stop.
> >
> 
> You're exaggerating, I'm not doing anything like this. You're still
> Cc'ed on the single big series containing the code changes for wrapped
> keys. The full picture is over there.
> 
> > Now you will argue that these patches stands on their own, and that
> 
> Yes, that's precisely what I'm going to say, because it's true.

Good, I fully agree with you here.

> 0x18000 is the true register size (as per QCom docs) for ICE on
> sm8[56]50 and sa8775p too and that alone warrants this change. If we
> can get the DTS changes out of the way of wrapped keys, then that's
> just a bonus.
> 
> > might be a valid case, but the argumentation you're making in the commit
> > message clearly ties them to the code changes you're making somewhere
> > else.
> >
> 
> Are you referring to "(...) registers used for wrapped key support on
> these platforms"? I could argue that it just says what the additional
> registers are used for but I can drop the mention of this from the
> message and just say "0x18000 is the true register range for ICE on
> sm8650" if that works for you.
> 

Please update the commit messages of the two patches to not say that
they are enabling HWKM on the platforms, but that you're expanding the
mmio region to cover the whole IP-block. I think it makes sense to
mention that this will allow us to enable HWKM.

Thanks,
Bjorn

