Return-Path: <linux-arm-msm+bounces-39708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E0C9DF00B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 12:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E24D281881
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 11:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF8015990E;
	Sat, 30 Nov 2024 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="F4ps5g9z";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="0emyQyRX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [81.169.146.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE4613C3F2;
	Sat, 30 Nov 2024 11:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732965099; cv=pass; b=qFCql+7VF0nVO8xInN11+JAuz5Vx8mBFd9iegA9p8dqUILzXmuNAVkaVCa2vxxXbYB2YEowf/qhJsFdNge/CpuZ0Zl8tEc4EBXudpZVQpU0GsSEmD9dBlgpLTiOGCktVKn26uGAQknq2ooeW4KpDOgqy2EWrgF5y5hYLL4rgyYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732965099; c=relaxed/simple;
	bh=Lal23WwM3grnfFq2PGxDkv9fm1BPR93AVPi/DnsQIdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZJP/Eq8Ckre3Lc8KegnD7tsEUA2SEhEAGHL2jR0EuxEGcNno6p/GJbigayyVzPAZNaXodDxVrbbpSlKKgFzre3v0x1bQAJb2G4K1ol5X/ID8DZeGz0KyXYwfQ19BF5vIkWZZh8kN7XZxJg1uJh0ZC86bFBQ5mrdiuXT+p5TaLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gerhold.net; spf=none smtp.mailfrom=gerhold.net; dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=F4ps5g9z; dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=0emyQyRX; arc=pass smtp.client-ip=81.169.146.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gerhold.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=gerhold.net
ARC-Seal: i=1; a=rsa-sha256; t=1732964368; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=nA9HgE1GTTLFq+gFYvOa3LO+b1/9gHmSzEs/8SHxOSXl3aIqVtZq2MyMTin425T19I
    le2ZK2YneM/gfACB/guYDPRDDNEtff8KP95WXy8f3uygvtyEM2sBC0q5k+VTPnmDu4PF
    KIYagSfCovjKowBZdG1a4Qgv8SkERWBMEDx57zY2buMBa40xlkCX/qzHyWwi4kjOD/d5
    Z6jgPQhXZAWZm5LS/wQOAgv+wyucFvvsj0ZhSf2PdAhHDKM8wTIEgGcK9DrmFejENLh7
    YYuO6RGC//Mgsq4IJwuQKYGahE2Sqw0ssjIAmAeIF1LWwkuyFepucX9JEJ5H9Rr9t/4K
    EuJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1732964368;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=IuCKuBhmqhPKmuHwQ+z2MxXyeSZUC4dD8RoNANFUEEc=;
    b=AF551vqk6G7SsKD5AnRQ+gKog0efiqSe1cgWTTeBPfSd7md7jnGIbaQo2ytlkfvIUZ
    uGW2R2Xc55ALCI+W9rdmFHmn2Owd3XAACu7qNUEcDIdKkSMW9yht59PKgBJ0Z9ED5ObP
    7ZrwjMN9hcFU9bmerMmtvDgVbYgjlSuzUhHvSGpsr9JrCGVHMkM8LuyQit9x7ELB+E2E
    WrNB9qvPC+flQX3YXY9yPGmjTpUTbE9W6/BQYvBecfAzbHNl4AJa9Yp3b14UNgMBss9T
    lwgMUNcbZP6fp2SGGcqlFpNtycMvS0pyntBfXyFb2io4jR2NcGyFP16YLGRDl/T6Qmzg
    7Rjw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1732964368;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=IuCKuBhmqhPKmuHwQ+z2MxXyeSZUC4dD8RoNANFUEEc=;
    b=F4ps5g9z+rSz1oVv72g0Ae8OHGTT4LBrzolpmsh7yXJYxZXPqIox10yf3VB0eisT3R
    4aL5mCGM5xyqykRcfavbe+LDAnxwyC9/V+57Sfs0MZHfWETR76bpQR1fpXRVwv269JJZ
    1YhsFSBVPBP2RiL2VupY5ZaOkvU0z3mXhEdfqVyVfdmg3pKo5z6l7OJejroyf/x2qyiL
    anp5x0TsnIo9Ts0mTDQAtR3Nha+j3mGe1nOQ+nObTHabA/Zg6khWhwlRLmtFZVqBINAv
    nV6772ouFx+b9199XdlnHe7LGqBRZjjM/h9RxhHTEalW1GaZvuJD6ZY/QgrkFbJKNqQo
    VLCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1732964368;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=IuCKuBhmqhPKmuHwQ+z2MxXyeSZUC4dD8RoNANFUEEc=;
    b=0emyQyRXg202tsYfiNHGi9fyH2oKrEDYzsb20LzfBlERnlGSnjMywUXrxQ9YxYW+tx
    RK+fUeLsBzx02E9lmFCQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL2ZfaQ"
Received: from gerhold.net
    by smtp.strato.de (RZmta 51.2.11 AUTH)
    with ESMTPSA id R9fca90AUAxR7Zu
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 30 Nov 2024 11:59:27 +0100 (CET)
Date: Sat, 30 Nov 2024 11:59:26 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Leo Yan <leo.yan@linux.dev>,
	Joseph Gates <jgates@squareup.com>,
	Georgi Djakov <djakov@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
	Zac Crosby <zac@squareup.com>,
	Bastian =?iso-8859-1?Q?K=F6cher?= <git@kchr.de>,
	Jeremy McNicoll <jeremymc@redhat.com>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	cros-qcom-dts-watchers@chromium.org,
	Stephen Boyd <swboyd@chromium.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Martin Botka <martin.botka@somainline.org>,
	Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Fenglin Wu <quic_fenglinw@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jun Nie <jun.nie@linaro.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v2 01/31] arm64: dts: qcom: msm8916: correct sleep clock
 frequency
Message-ID: <Z0rvVT98rPMXsTS_@gerhold.net>
References: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
 <20241130-fix-board-clocks-v2-1-b9a35858657e@linaro.org>
 <Z0rnRC_BqgkE3w1P@gerhold.net>
 <al3tckby2jg7imhieehqwemygf6y5csfg7xfjta7alawhwfqv7@6gha46tr3rhx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <al3tckby2jg7imhieehqwemygf6y5csfg7xfjta7alawhwfqv7@6gha46tr3rhx>
Content-Transfer-Encoding: 7bit

On Sat, Nov 30, 2024 at 12:42:24PM +0200, Dmitry Baryshkov wrote:
>On Sat, Nov 30, 2024 at 11:21:56AM +0100, Stephan Gerhold wrote:
>> On Sat, Nov 30, 2024 at 03:44:13AM +0200, Dmitry Baryshkov wrote:
>> > The MSM8916 platform uses PM8916 to provide sleep clock. According to the
>> > documentation, that clock has 32.7645 kHz frequency. Correct the sleep
>> > clock definition.
>> >
>> > Fixes: f4fb6aeafaaa ("arm64: dts: qcom: msm8916: Add fixed rate on-board oscillators")
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Thanks for spotting this! This fix looks good independent of the more
>> controversial "arm64: dts: qcom: move board clocks to SoC DTSI files"
>> changes. Maybe move these to a separate series?
>>
>> > ---
>> > arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
>> > 1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>> > index 5e558bcc9d87893486352e5e211f131d4a1f67e5..8f35c9af18782aa1da7089988692e6588c4b7c5d 100644
>> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
>> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>> > @@ -125,7 +125,7 @@ xo_board: xo-board {
>> > 		sleep_clk: sleep-clk {
>> > 			compatible = "fixed-clock";
>> > 			#clock-cells = <0>;
>> > -			clock-frequency = <32768>;
>> > +			clock-frequency = <32764>;
>>
>> To be precise the PM8916 specification says the sleep clock is "The 19.2
>> MHz XO divided by 586". Maybe we can actually describe it that way with
>> a fixed-factor-clock?
>>
>> 		sleep_clk: sleep-clk {
>> 			compatible = "fixed-factor-clock";
>> 			clocks = <&xo_board>;
>> 			#clock-cells = <0>;
>> 			clock-div = <586>;
>> 			clock-mult = <1>;
>> 		};
>
>I thought about it, but then it's also not complete truth (at least for
>some of PMICs, don't remember if that's the case for PM8916): there is
>an external XO and also there is an on-PMIC RC, which is further
>divided with PMIC actually selecting which source to use as a source for
>sleep_clk.
>

This exists on PM8916 as well, but I'm not sure it's worth taking it
into consideration here. The PM8916 specification says XO "is the source
of sleep clock when the device is in active and sleep mode". The RC is
used "during PMIC power-up" and "in active or sleep mode only if other
sources are unavailable".

>>
>> If we keep the fixed-clock with the hardcoded frequency I wonder if we
>> should put 32765 instead of 32764. If you calculate it exactly it's
>> slightly closer to 32765 than 32764. :-)
>>
>> 	19200000/586 = 32764.505119453926 = ~32765
>
>Well, I think according to the most typical rounding rules it is 32764.

I think typically you round up on .5? But it's not even exactly half-way
at .500 - given that it's .505, I think any rounding function other than
floor() should round that up to 32765. :-)

Thanks,
Stephan

