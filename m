Return-Path: <linux-arm-msm+bounces-4244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E023E80D218
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 17:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BDBB1F21803
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 16:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0941B3985C;
	Mon, 11 Dec 2023 16:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0sdzlHz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B5A34546;
	Mon, 11 Dec 2023 16:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58BFCC433C8;
	Mon, 11 Dec 2023 16:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702312698;
	bh=uT3+vtv8HvVFAQ4LBmaj/5ll70qrpowhUoWCN8h1EKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0sdzlHzEI3Kvyn+aJJE+//AB/HyRXlUCzj0PeNF1vDfIfo7i+WeYD+xwuZD4/6zO
	 qWZe6lIs0vd/eMbwZsURybmS1k8ZlnKdurb/8l6F2jlWJGnYM+OSEMkXU30EAcpu4Y
	 h8sx+bHkmZKNuilNAIa7em232OhoPJSO+vtQu6C5q56xi36ly/8bjmOxldnx09zl5+
	 J+A2REZGk8Xbv2htMOBm59RaZ/8UaW8tSvR1wYX7p9MlRwJM28obbFvRAYq3Iw40Gq
	 6yX0/lW7c5v7Y02JrYRme9mLIbNgGJWgZQ8eq+QPhbG0rnxcd64Ldoje70yUjfqcm9
	 fze+I5j0TV/hQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rCjJB-00069a-0E;
	Mon, 11 Dec 2023 17:39:05 +0100
Date: Mon, 11 Dec 2023 17:39:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] ARM/arm64: dts: qcom: fix USB wakeup interrupt
 types
Message-ID: <ZXc7KcjF82EgiXWd@hovoldconsulting.com>
References: <20231120164331.8116-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120164331.8116-1-johan+linaro@kernel.org>

On Mon, Nov 20, 2023 at 05:43:20PM +0100, Johan Hovold wrote:

> It turns out a number Qualcomm devicetrees have also gotten the trigger
> types wrong, something which this series addresses.
> 
> Specifically, the HS/SS PHY wakeup interrupts are level triggered while
> the DP/DM HS PHY interrupts are edge triggered, and which edge to
> trigger on depends both on the use-case and on whether a Low speed or
> Full/High speed device is connected.
> 
> Fortunately, there should be no dependency between this series and USB
> one as all devicetree use the correct trigger type for the HS/SS PHY
> interrupts and the HS one has never been armed by Linux anyway. The
> DP/DM interrupt trigger types are also updated on suspend currently.

Konrad reported off-list that the sc8180x patch in this series breaks
probe of the dwc3 driver.

Turns out a number of these SoCs were using GIC interrupts for the
DP/DM_HS_PHY interrupts despite the fact that the driver tries to
reconfigure these as IRQ_TYPE_EDGE_FALLING (which the GIC does not
support) to detect disconnect events during suspend.

This is obviously broken and the proper fix is to replace the GIC
interrupts with the corresponding PDC interrupts. I believe Konrad is
digging out the magic numbers at this moment.

The following patches will need a follow-up fix:

>   ARM: dts: qcom: sdx55: fix USB wakeup interrupt types

>   arm64: dts: qcom: sc8180x: fix USB wakeup interrupt types
>   arm64: dts: qcom: sdm670: fix USB wakeup interrupt types
>   arm64: dts: qcom: sdm845: fix USB wakeup interrupt types
>   arm64: dts: qcom: sm6375: fix USB wakeup interrupt types
>   arm64: dts: qcom: sm8150: fix USB wakeup interrupt types

Sorry about not noticing this.

Johan

