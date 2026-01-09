Return-Path: <linux-arm-msm+bounces-88313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFE6D0B090
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 16:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1FFF23008174
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 15:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A853358BD;
	Fri,  9 Jan 2026 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YElPG/0V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9595C35CBDF;
	Fri,  9 Jan 2026 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973796; cv=none; b=O0Fc5un7ogT5Go8Iq4Z5fnexc+xs0AbjnvR/eoSBEpfngtwkuQfiNxROSSgwi6FAkzGiQnZ7k22KKb71Ih8URS9TDasf0LsEn1B14yJvn7D/asqHeI/Z3dP5NZ6kxa1LXnQ18eI7sBt0OOIip1UsEMIPI7dvHydwxfIUJgJY7lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973796; c=relaxed/simple;
	bh=ks5cLM4HjmJnxZRS9mtcBfjstrm3sF2xoB7Xv8yMahY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0+wzTxu/tH+CFY3cCkH6y6WsEL5l1QElF9bX8ZERKgqkAoaWqN3lV53Hfyf/frNXPYnkIg+X9hOVF6wmC25vFO9AbFTM7gAqp+8k1K9eEWpmLXCjznhNRKxzs/9Dj3gc0UOz20asio6jEB+nGOXBWIzZxwg37UgkKD3vGejt9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YElPG/0V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87AE3C4CEF1;
	Fri,  9 Jan 2026 15:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767973796;
	bh=ks5cLM4HjmJnxZRS9mtcBfjstrm3sF2xoB7Xv8yMahY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YElPG/0Vu5oezq25vOQYaGh3AArlcnn+slPhobPg6WMdAtTPsU3Doq7YBYHeYGd2J
	 JnLQuh+7XC9szSlkxLZuLrQDdnVboOsLE2b7TvbU9GINrYW8+PMtktV+xsTI6IbKwh
	 iHvoVNbQW2km3yqIeuJxe+mB4bEvXgvTIgkb83Q/1msPWxjuGnZdX193NHneuPMsR0
	 sISbHmWRnvNGow01JHBUXoRbsIH7TY2pQ9EFgW5Avs0g1KiP5/xmGhC8l1ExyS1ZKI
	 d561TxHnO2zptZiqQQSQlHzOBu3/26HLB+cpqcs/4VkHi0c6d4AsJpP2kfWdjpPmtY
	 N4aNNwHU6T6tQ==
Date: Fri, 9 Jan 2026 09:49:52 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shazad Hussain <quic_shazhuss@quicinc.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Melody Olvera <quic_molvera@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, stable@vger.kernel.org
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
Message-ID: <jejrexm235dxondzjbk5ek46ilq2gbrrhoojfcghkcpclqvtks@yfsgrxueo5es>
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
 <a42f963f-a869-4789-a353-e574ba22eca8@oss.qualcomm.com>
 <edca97aa-429e-4a6b-95a0-2a6dfe510ef2@oss.qualcomm.com>
 <500313f1-51fd-450e-877e-e4626b7652bc@oss.qualcomm.com>
 <4d61e8b3-0d40-4b78-9f40-a68b05284a3d@oss.qualcomm.com>
 <e917e98a-4ff3-45b8-87a0-fe0d6823ac2e@oss.qualcomm.com>
 <2lpx7rsko24e45gexsv3jp4ntwwenag47vgproqljqeuk4j7iy@zgh6hrln4h4e>
 <aVuIsUR0pinI0Wp7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVuIsUR0pinI0Wp7@linaro.org>

On Mon, Jan 05, 2026 at 10:47:29AM +0100, Stephan Gerhold wrote:
> On Mon, Jan 05, 2026 at 10:44:39AM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Jan 02, 2026 at 02:57:56PM +0100, Konrad Dybcio wrote:
> > > On 1/2/26 2:19 PM, Krishna Chaitanya Chundru wrote:
> > > > On 1/2/2026 5:09 PM, Konrad Dybcio wrote:
> > > >> On 1/2/26 12:36 PM, Krishna Chaitanya Chundru wrote:
> > > >>> On 1/2/2026 5:04 PM, Konrad Dybcio wrote:
> > > >>>> On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
> > > >>>>> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
> > > >>>>> can happen during scenarios such as system suspend and breaks the resume
> > > >>>>> of PCIe controllers from suspend.
> > > >>>> Isn't turning the GDSCs off what we want though? At least during system
> > > >>>> suspend?
> > > >>> If we are keeping link in D3cold it makes sense, but currently we are not keeping in D3cold
> > > >>> so we don't expect them to get off.
> > > >> Since we seem to be tackling that in parallel, it seems to make sense
> > > >> that adding a mechanism to let the PCIe driver select "on" vs "ret" vs
> > > >> "off" could be useful for us
> > > > At least I am not aware of such API where we can tell genpd not to turn off gdsc
> > > > at runtime if we are keeping the device in D3cold state.
> > > > But anyway the PCIe gdsc supports Retention, in that case adding this flag here makes
> > > > more sense as it represents HW.
> > > > sm8450,sm8650 also had similar problem which are fixed by mani[1].
> > > 
> > > Perhaps I should ask for a clarification - is retention superior to
> > > powering the GDSC off? Does it have any power costs?
> > > 
> > 
> > In terms of power saving it is not superior, but that's not the only factor we
> > should consider here. If we keep GDSCs PWRSTS_OFF_ON, then the devices (PCIe)
> > need to be be in D3Cold. Sure we can change that using the new genpd API
> > dev_pm_genpd_rpm_always_on() dynamically, but I would prefer to avoid doing
> > that.
> > 
> > In my POV, GDSCs default state should be retention, so that the GDSCs will stay
> > ON if the rentention is not entered in hw and enter retention otherwise. This
> > requires no extra modification in the genpd client drivers. One more benefit is,
> > the hw can enter low power state even when the device is not in D3Cold state
> > i.e., during s2idle (provided we unvote other resources).
> > 
> 
> What about PCIe instances that are completely unused? The boot firmware
> on X1E for example is notorious for powering on completely unused PCIe
> links and powering them down in some half-baked off state (the &pcie3
> instance, in particular). I'm not sure if the GDSC remains on, but if it
> does then the unused PD cleanup would also only put them in retention
> state. I can't think of a good reason to keep those on at all.
> 

Conceptually I agree, but do we have any data indicating that there's
practical benefit to this complication?

> The implementation of PWRSTS_RET_ON essentially makes the PD power_off()
> callback a no-op. Everything in Linux (sysfs, debugfs, ...) will tell
> you that the power domain has been shut down, but at the end it will
> remain fully powered until you manage to reach a retention state for the
> parent power domain. Due to other consumers, that will likely happen
> only if you reach VDDmin or some equivalent SoC-wide low-power state,
> something barely any (or none?) of the platforms supported upstream is
> capable of today.
> 

Yes, PWRSTS_RET_ON effectively means that Linux has "dropped its vote"
on the GDSC and its parents. But with the caveat that we assume when
going to ON again some state will have been retained.

> PWRSTS_RET_ON is actually pretty close to setting GENPD_FLAG_ALWAYS_ON,
> the only advantage of PWRSTS_RET_ON I can think of is that unused GDSCs
> remain off iff you are lucky enough that the boot firmware has not
> already turned them on.
> 

Doesn't GENPD_FLAG_ALWAYS_ON imply that the parent will also be always
on?

> IMHO, for GDSCs that support OFF state in the hardware, PWRSTS_RET_ON is
> a hack to workaround limitations in the consumer drivers. They should
> either save/restore registers and handle the power collapse or they
> should vote for the power domain to stay on. That way, sysfs/debugfs
> will show the real votes held by Linux and you won't be mislead when
> looking at those while trying to optimize power consumption.
> 

No, it's not working around limitations in the consumer drivers.

It does work around a limitation in the API, in that the consumer
drivers can't indicate in which cases they would be willing to restore
and in which cases they would prefer retention. This is something the
downstream solution has had, but we don't have a sensible and generic
way to provide this.

Keeping GDSCs in retention is a huge gain when it comes to the time it
takes to resume the system after being in low power. PCIe is a good
example of this, where the GDSC certainly support entering OFF, at the
cost of tearing link and all down.

Regards,
Bjorn

> Thanks,
> Stephan

