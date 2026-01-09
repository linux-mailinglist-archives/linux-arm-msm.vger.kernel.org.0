Return-Path: <linux-arm-msm+bounces-88323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A587D0C191
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 20:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 887813031CCB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 19:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFB93148C6;
	Fri,  9 Jan 2026 19:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHYDPOUm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1D12DC79B;
	Fri,  9 Jan 2026 19:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767987659; cv=none; b=kBNsvAQ+Dzua8uCUjgIP8KogwMwsbvPwxAOoyUZPtrWYHfWpUGVgaAtTUzsZtM4T8f8/Mj4bOhgT5eSwkYAsuF+gHggD76jyVEdEKYHKpb9KjekjTW+6nvRt4eEDeG3ZLxymiAdrXBdTYZ9qRfvzgU7llC/Qfwrjpgw7SneJiv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767987659; c=relaxed/simple;
	bh=K114Y/2DXsxwB0Z4/yzyF8aPZhYVllYZ0Vxt76G48Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8SmSmBMxUDGvsV2ydOTKwC7xa4vRPRGDm4Y6xv+kprTYW0A+liaO7RTQaAyj4ovmRW0e4w+Qi0SkJjSdVcU4w7ojKLRtnbMLrKVq3TNAHYzEkNL5fOjY6NZc39QqUbuo+LzZ32ypbtO6E5++f1CGP567ckZZvqo1Zp499WpYpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHYDPOUm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2B5C4CEF1;
	Fri,  9 Jan 2026 19:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767987659;
	bh=K114Y/2DXsxwB0Z4/yzyF8aPZhYVllYZ0Vxt76G48Ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gHYDPOUmX2FmjXHRjY9gCzf5HWebFR036L7t0+lcnZXrk/jf8CVNqWimmb/D/uB91
	 pzE2P5jIGtUCcCjLYxlSCveRvvUsi1+0JxaMcc0+p44kWBmcxyK8TX9iNPUE+SL5SO
	 wGe4TMsmcG0oCUefkK7+Op1yk2kUpjqw5AB49EPEiLl56T3gFV0qwtmMD6cji2Mgv/
	 8ItA09NodZ0OKb6CQoLyvSTy+TM43DmyZpZFEWhARKSOt1wvdghD9V6/T5TGXwQwM9
	 q3EUVX734YyWdM3gLET6T8XJmFuMKQRLkDJKxz8Cn59H5FyIEkVpCwvtCyLq/dsJ22
	 LKF0iIVlwKJig==
Date: Fri, 9 Jan 2026 13:40:56 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@linaro.org, mukesh.savaliya@oss.qualcomm.com
Subject: Re: [PATCH 1/1] arm64: dts: qcom: talos: Drop opp-shared from QUP
 OPP table
Message-ID: <vmrpdu7fn776vkwrhwvtuwkpsxaco4gt4worl43mpvk73ft67a@cbkg6gmqss5x>
References: <20251111170350.525832-1-viken.dadhaniya@oss.qualcomm.com>
 <ivinuu2ofm2hf7jvnw67gjfwo46bepunconf5g4kzdcaxs4jvm@6dm5btokf2zi>
 <efec8f09-8bb7-9739-5a1f-ce4a1c54771e@oss.qualcomm.com>
 <nm4hiy6vd5b3t65dagjx5m5qjfjdcnehz2s5w4lyu44eaqnwkc@hnmyhokxufz5>
 <13ea5fd7-b28b-b6c0-752f-a7d4b4677298@oss.qualcomm.com>
 <e5cef414-912e-4387-9a47-494567fe2360@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5cef414-912e-4387-9a47-494567fe2360@oss.qualcomm.com>

On Wed, Dec 17, 2025 at 09:20:09PM +0530, Viken Dadhaniya wrote:
> Hi Bjorn and Dmitry,
> 
> On 11/24/2025 3:10 PM, Viken Dadhaniya wrote:
> > 
> > 
> > On 11/21/2025 5:33 PM, Dmitry Baryshkov wrote:
> >> On Fri, Nov 21, 2025 at 03:37:21PM +0530, Viken Dadhaniya wrote:
> >>>
> >>>
> >>> On 11/12/2025 1:25 AM, Bjorn Andersson wrote:
> >>>> On Tue, Nov 11, 2025 at 10:33:50PM +0530, Viken Dadhaniya wrote:
> >>>>> QUP devices are currently marked with opp-shared in their OPP table,
> >>>>> causing the kernel to treat them as part of a shared OPP domain. This
> >>>>> leads to the qcom_geni_serial driver failing to probe with error
> >>>>> -EBUSY (-16).
> >>>>>
> >>>>> Remove the opp-shared property to ensure the OPP framework treats the
> >>>>> QUP OPP table as device-specific, allowing the serial driver to probe
> >>>>> successfully
> >>>>>
> >>>>> Fixes: f6746dc9e379 ("arm64: dts: qcom: qcs615: Add QUPv3 configuration")
> >>>>
> >>>> This was merged 11 months ago, and Yu Zhang added bluetooth support 3
> >>>> months ago. What changed to break the QUP users? I think it's reasonable
> >>>> to use this "Fixes", but we should document - at least on the mailing
> >>>> list, where the regression happened.
> >>>>
> >>>> Regards,
> >>>> Bjorn
> >>>
> >>> I’ve checked the older Linux versions and found that this issue started occurring after the following change:
> >>> https://lore.kernel.org/linux-devicetree/20250630064338.2487409-1-viken.dadhaniya@oss.qualcomm.com/
> >>
> >> Hmm, but it's your patch. How was it tested?
> > 
> > For this patch, I had verified only the I²C instance and compared it against other SoCs (like sc7280.dtsi). But missed to validate all other instances from  SPI/Serial.
> > I realized now and will make sure to test all possible nodes in future changes to avoid such gap.
> > 
> 
> I hope the above information addresses your question. 
> The current change has been validated for the SPI, Serial, and I2C drivers,
> and it is functioning as expected.

I'm sorry, but above you write "verified only I2C ... But missed to
validate all other instances" and here you write "validated SPI, Serial,
and I2C drivers".

Did you test it or not?

Or are you saying that you only tested I2C, but have now verified also
SPI and Serial?

Regards,
Bjorn

> Please let us know if you have any further queries.
> 
> >>
> >>>
> >>>>
> >>>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> >>>>> ---
> >>>>>  arch/arm64/boot/dts/qcom/talos.dtsi | 1 -
> >>>>>  1 file changed, 1 deletion(-)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> >>>>> index eb6f69be4a82..ed89d2d509d5 100644
> >>>>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> >>>>> @@ -536,7 +536,6 @@ cdsp_smp2p_in: slave-kernel {
> >>>>>  
> >>>>>  	qup_opp_table: opp-table-qup {
> >>>>>  		compatible = "operating-points-v2";
> >>>>> -		opp-shared;
> >>>>>  
> >>>>>  		opp-75000000 {
> >>>>>  			opp-hz = /bits/ 64 <75000000>;
> >>>>> -- 
> >>>>> 2.34.1
> >>>>>
> >>

