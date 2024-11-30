Return-Path: <linux-arm-msm+bounces-39704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF5A9DEFEB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 11:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3605928181E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 10:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D80815573D;
	Sat, 30 Nov 2024 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="ZA9RZz6m";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="Od4cOYRk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C7014B087;
	Sat, 30 Nov 2024 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732962485; cv=pass; b=Ft2UoLKjEjO2/FigyiS9h3sWynvKndTdZG1DyjNlxgLKtmicaHENfkQYeAQyL+V8B9z08B4G/ZDBO6oe/QgLguNMURWKZV0QsxjxNjrOSPtGsreag37hYKbtM5i41nWj452XEsV4CPlNSCU7b0+99tNPoeQF61vhkOM2Rb6UE8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732962485; c=relaxed/simple;
	bh=JrPCuNfhtGHWRQBFGIpFjDXkNB5NqIxhBVEgyx4jj70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TocANa7Jf5tNiffWY2P9f6TE4Sdq13FEwQsQNEGypfI8IYhMFnTBfFWQWZPHVtGIHA5YG9XC07HpNKx9FBGX7UHHa8RBNW3Kc04UrDfulN3E3pX1XRANIUoMFmUFH2zkZ/c9Ir0xr0ytZ1WF0sNrVFDTjQC4ZgnykgOsEcC+Jmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gerhold.net; spf=none smtp.mailfrom=gerhold.net; dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=ZA9RZz6m; dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=Od4cOYRk; arc=pass smtp.client-ip=85.215.255.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gerhold.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=gerhold.net
ARC-Seal: i=1; a=rsa-sha256; t=1732962120; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tsaXbKsw28Up7MB7mwT2MdFeR7MDE2YBfWaZ5aCBPcExRjW7owlw7DmfXyqsfCSSBH
    umzyoh9Ve8oa9FUGy6tIl/H1MH1UstkxxyZCZ+X5FKJPn5gqxQmOfHWQb20UOFdLwaLL
    0Opr97uCSWo1d1uBEjcjHmMo1E2PkKabFh9XaLYbRmohxoYc/oWx0G5oWcbCn/u1I02n
    PwrFOyNcQrLqmmk0eeF5P7PdsDpXASFmv4tZibKdzEDFaewVWAib/WegpG4SJ8HgZ90A
    PcnfnuvVNyWp+B7Yi7XUvGVo0oPH+9K2/5KnTHYbkV82Es4wXL+3SbwB3rNUmQ6OSZ9x
    KLug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1732962120;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=geOUoMwFkQb/Vr5ZTpb9cAiTBRqAl8sjoQLrszyxSnU=;
    b=JaaU1Nm9iFZ+zvZAHH+jWuUZ6XRJulMhbiIPPR86qzTPqv8O/En0tteIl6kx0daCRU
    Z3vHnBXo1VMd63EA0VsySlkswoCHVKP+xIaFEdszv6kavCVuC5i9GL1U/jotxc4LdQeR
    WIMw7QRUsvuYCIo/ZsE//u5NhbP0fkf5MoP3IyNB/TlMGd8PHFORyFO++tQelPlX8SAU
    ztFxu2uxUa1YMWeXUlVSlmz+cZllbFpEQM6Xlf7DQS05nEsrFMC+2s2O9fsrBQfPvsyW
    2tkA9XWmjBAwh6+hbbk+KcczuqV1Eh7nTCdjTF6Qraf/M77RTA1ut4AU6l+dJoBK4uP5
    Rj2A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1732962120;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=geOUoMwFkQb/Vr5ZTpb9cAiTBRqAl8sjoQLrszyxSnU=;
    b=ZA9RZz6mnAheO19lb3KaIYj/U57D1NPaefxyqOGk9y98H3E4RUEpSvhAikB1Y9YOpD
    4uIyg4qTtjesnlXyB/MhCTyVf4qsL2Vx6EI8728pzfv7QI6R/ln3UA2ZroZI+NI2rHds
    A3lGDO+luh+W8txkWftzEyqZKq9a+RvdmhMKOveNJIajvAB7GSEw1WILag+sOiAPlAjp
    k5w1YRvNr5Lfctrc3oZjy6nNGK5yg6H7GsHt5HuVgXpzKoPZ3Wl9SL5Y9kGF2OMBmObV
    tjg9N/0dJvenPMGTLHhGgOPvdzlZ04omX4uH3xOlSeWhayiEluj/oKwgFp1/VL9RZdrF
    /dYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1732962120;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=geOUoMwFkQb/Vr5ZTpb9cAiTBRqAl8sjoQLrszyxSnU=;
    b=Od4cOYRkKaGIOoYjsJspYn0fsnFtJsqklIkdYfj+0L8exaDFU9/oCw137GIwhhENoh
    dK0yhXLiWTKmsNu/t2CQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL2ZfaQ"
Received: from gerhold.net
    by smtp.strato.de (RZmta 51.2.11 AUTH)
    with ESMTPSA id R9fca90AUALx7SB
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 30 Nov 2024 11:21:59 +0100 (CET)
Date: Sat, 30 Nov 2024 11:21:56 +0100
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
	Andy Gross <andy.gross@linaro.org>,
	Jeremy McNicoll <jeremymc@redhat.com>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
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
	Jun Nie <jun.nie@linaro.org>, James Willcox <jwillcox@squareup.com>,
	Max Chen <mchen@squareup.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Benjamin Li <benl@squareup.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v2 01/31] arm64: dts: qcom: msm8916: correct sleep clock
 frequency
Message-ID: <Z0rnRC_BqgkE3w1P@gerhold.net>
References: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
 <20241130-fix-board-clocks-v2-1-b9a35858657e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241130-fix-board-clocks-v2-1-b9a35858657e@linaro.org>
Content-Transfer-Encoding: 7bit

On Sat, Nov 30, 2024 at 03:44:13AM +0200, Dmitry Baryshkov wrote:
>The MSM8916 platform uses PM8916 to provide sleep clock. According to the
>documentation, that clock has 32.7645 kHz frequency. Correct the sleep
>clock definition.
>
>Fixes: f4fb6aeafaaa ("arm64: dts: qcom: msm8916: Add fixed rate on-board oscillators")
>Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks for spotting this! This fix looks good independent of the more
controversial "arm64: dts: qcom: move board clocks to SoC DTSI files"
changes. Maybe move these to a separate series?

>---
> arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>index 5e558bcc9d87893486352e5e211f131d4a1f67e5..8f35c9af18782aa1da7089988692e6588c4b7c5d 100644
>--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
>+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>@@ -125,7 +125,7 @@ xo_board: xo-board {
> 		sleep_clk: sleep-clk {
> 			compatible = "fixed-clock";
> 			#clock-cells = <0>;
>-			clock-frequency = <32768>;
>+			clock-frequency = <32764>;

To be precise the PM8916 specification says the sleep clock is "The 19.2
MHz XO divided by 586". Maybe we can actually describe it that way with
a fixed-factor-clock?

		sleep_clk: sleep-clk {
			compatible = "fixed-factor-clock";
			clocks = <&xo_board>;
			#clock-cells = <0>;
			clock-div = <586>;
			clock-mult = <1>;
		};

If we keep the fixed-clock with the hardcoded frequency I wonder if we
should put 32765 instead of 32764. If you calculate it exactly it's
slightly closer to 32765 than 32764. :-)

	19200000/586 = 32764.505119453926 = ~32765

Thanks,
Stephan

