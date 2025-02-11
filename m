Return-Path: <linux-arm-msm+bounces-47611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D96A31023
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 16:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D8DC18895D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 15:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2E5253B50;
	Tue, 11 Feb 2025 15:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POAgMeYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD9F1C5D40;
	Tue, 11 Feb 2025 15:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288948; cv=none; b=NUxGo/q/4NYdK8erDOGujZ+HYdHMWeWpUyyiFuESXu0P2Fdh8cIQ4p7hJjG9UoKkI3qf3oedIlXnd9KD88UmCjejIMXw5Ah8xSs9L2NEQxBDSgoPzqHQNtwawN6vhmie0btC/O7LLFt3FuflJEPdDBWZC5T7mSIJieucV3YNZoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288948; c=relaxed/simple;
	bh=3EQeArKVuSS2xUvVQrhKQvF/b394Kw09lDcZ77uB2EY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QON5skalfc3AmhIAkPsaRoDgMF9MpLxlKmFu5ts5rBVMb72Kcld7lhRW61epe+8sj8d5fhs9CY1kluH7B9Bd5YD1hV+dkhLGbEzeIIyjxQi0M5F8h7e9Hn1s0v88FG/fJZj/Wtp84s7NjEzgNSJHFL5MwH/F2qTeNj0qw8IIW7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POAgMeYq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F99C4CEDD;
	Tue, 11 Feb 2025 15:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739288947;
	bh=3EQeArKVuSS2xUvVQrhKQvF/b394Kw09lDcZ77uB2EY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POAgMeYqZKWpC21kkbADYp6yy9VPCNzvsL/N+XIWW6qGhM8fVGJvDIm4DEY/TM7Dg
	 UI+b7KkYka4n6KKfqNIklAWkCue7bFxSvBgEPSQi7St6A9xmC+TF21WzcZbyz10dkb
	 FvI3EKSCikQUTgKIBB3CQmQzK58J739b5Ra6uFzbqU5E+Y6GhSzUCkoFI2awQWx52R
	 nRpWHmELEyoTMcWmHwHxqANgPx2Z9/2eP8eh7PNM6hGzVouGcQ/eLeZINOhjEYii7n
	 OWyK8a1Ulyp2yzWHLNIl8nPgnXL64LzJBXfjkgwKdLTXaAULv+Hg47W1EHIB2kyl2v
	 Vp4bjdrG7IM5g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thsVe-000000002eT-3j27;
	Tue, 11 Feb 2025 16:49:14 +0100
Date: Tue, 11 Feb 2025 16:49:14 +0100
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
Message-ID: <Z6txevdftVNww0wD@hovoldconsulting.com>
References: <20250211-x1e80100-pwrseq-qcp-v2-1-c4349ca974ab@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-x1e80100-pwrseq-qcp-v2-1-c4349ca974ab@linaro.org>

On Tue, Feb 11, 2025 at 04:01:56PM +0100, Stephan Gerhold wrote:
> Add the WiFi/BT nodes for QCP and describe the regulators for the WCN7850
> combo chip using the new power sequencing bindings. All voltages are
> derived from chained fixed regulators controlled using a single GPIO.
> 
> The same setup also works for CRD (and likely most of the other X1E80100
> laptops). However, unlike the QCP they use soldered or removable M.2 cards
> supplied by a single 3.3V fixed regulator. The other necessary voltages are
> then derived inside the M.2 card. Describing this properly requires
> new bindings, so this commit only adds QCP for now.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Changes in v2:
> - Rebase on qcom for-next, patch 1-2 were applied already
> - Mention dummy regulator warning
> - Link to v1: https://lore.kernel.org/r/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org
> ---
> The Linux driver currently warns about a missing regulator supply:
> 
>   pwrseq-qcom_wcn wcn7850-pmu: supply vddio1p2 not found, using dummy regulator
>
> This supply exists on the WCN7850 chip, but nothing is connected there on
> the QCP. Discussion is still open how to hide this warning in the driver,
> but since the DT is correct and the same setup is already used on SM8550
> upstream, this shouldn't block this patch.

I thought Bartosz was gonna fix his driver...

> @@ -337,6 +338,101 @@ usb_1_ss2_sbu_mux: endpoint {
>  			};
>  		};
>  	};
> +
> +	vreg_wcn_3p3: regulator-wcn-3p3 {

Please keep the nodes sorted by name. These should all go above the usb
muxes.

Johan

