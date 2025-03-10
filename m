Return-Path: <linux-arm-msm+bounces-50840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A7DA59470
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 13:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A06B9188B9A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D8E226556;
	Mon, 10 Mar 2025 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtrK1Y82"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD352158D94;
	Mon, 10 Mar 2025 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741609666; cv=none; b=hdHEWrWuhM+r1MS530gasICw1gFR4CBttQEe2utvRKv5QnBGB0VHU3iro91XCrCDJxtACWt9i9yEsMoWoUog5rHgYzLmEw3AAXRoQ0lrn8uC49dX6b9nVg7/z8PL8WMymGQaH0MVnt+MjCXdaN/5Rhx8emUi1zzYXzobxB+96rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741609666; c=relaxed/simple;
	bh=OeSYjs/e3TEnZvrI+XL9ijVLOAQxM4B4wuRjM/3qewE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZPhKTwreiEOTITCsJoPORRBk3BuzUBo8Qk5RQVJnJocevicplWrsBP+GGy3z9dQTMyH5gtl4FDfBtZGLy9HsGuwcrrz5Il4Zoy1tfStfFuVhzTN3TBWNn+d2b1x5/GfVVTOVCrcuX+cR6JxunohGnqTLO2ox4YaHJPRjCvCZ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtrK1Y82; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC66C4CEE5;
	Mon, 10 Mar 2025 12:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609666;
	bh=OeSYjs/e3TEnZvrI+XL9ijVLOAQxM4B4wuRjM/3qewE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtrK1Y82V0rnyJpMlQZ207YSjSiJmeioBG4iufI+ie0Yek0el+yiNIf8NfHA6zN7/
	 MM70fPhhevoQduEPbt/ySZ9r9ka+8c7lYoQphQ4MBqPI40Gm3LjOjbNMVZ1vk8wBGP
	 X+SatA9XGCF1wN3wGYjs0Qjwjovim1+DhdnEIQFunOLguKl7FpGInt7UKkuO3HdGw8
	 qshgTaMQJEORfn7VxXYNXgUcD2zDpNYXceH8Ttzkrso2Ahl1CY2bZP9uYZ3cBObiPP
	 dONjjyz3AlAW16pS/IkhH7TX9oTUFQwRWVyfljDSbPKJNcxwiOBMoHBpP+HMvWQ446
	 Ju3bHOKraWPsA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1trcEP-000000002aK-0C37;
	Mon, 10 Mar 2025 13:27:41 +0100
Date: Mon, 10 Mar 2025 13:27:41 +0100
From: Johan Hovold <johan@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Joel Stanley <joel@jms.id.au>, Sebastian Reichel <sre@kernel.org>,
	Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: x1e80100: enable rtc
Message-ID: <Z87avd83XTYQYIP8@hovoldconsulting.com>
References: <20250219134118.31017-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219134118.31017-1-johan+linaro@kernel.org>

Hi Alexandre,

On Wed, Feb 19, 2025 at 02:41:12PM +0100, Johan Hovold wrote:
> This series adds support for utilising the UEFI firmware RTC offset to
> the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
> Elite machines.

Do you think you could pick up the driver and binding changes here so
that Bjorn can take the DT patches for 6.15?

> Johan Hovold (4):
>   rtc: pm8xxx: add support for uefi offset
>   rtc: pm8xxx: mitigate flash wear
>   arm64: dts: qcom: sc8280xp-x13s: switch to uefi rtc offset
>   arm64: dts: qcom: x1e80100: enable rtc
> 
> Jonathan Marek (2):
>   dt-bindings: rtc: qcom-pm8xxx: document qcom,no-alarm flag
>   rtc: pm8xxx: implement qcom,no-alarm flag for non-HLOS owned alarm

Johan

