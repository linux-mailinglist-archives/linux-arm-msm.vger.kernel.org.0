Return-Path: <linux-arm-msm+bounces-74211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC66DB8A091
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 911A01BC12BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B992A31062E;
	Fri, 19 Sep 2025 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTXw3iGj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A8824DCEB;
	Fri, 19 Sep 2025 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758292844; cv=none; b=GJcdngqz04Bj+aX3DBWrjP9KygSG69kWogYYAvJhCP9aq9rQZWQtaBlk5kHkXogX6cPHH+8IasfcF2L45MEV97Ej2dxDH2J/KBvzjvZFKhBwP5yFd3+YFSHiYeO3S3f+FSDQ5pbvzzX6QFJgVQTE8BNixlhagJ+sO4FzesblbQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758292844; c=relaxed/simple;
	bh=Tp0iF6Qs70aaCWdqaFDcXwePAlPgsbZcyXEX+0AZba8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSOhIkpn7O5OS2IortaLywsQpBPP4EbwHdKDGtgFARMBVBuoVsrolzNki/SPm9PAvAY0BBQuWVwTwiA4lR3YmW44/ig1U3tMFUxIrXqminm5FLAwLREGa0o8WwWOquPnlG3OBkUmdNUjEfWIBhh/MUYVlewCsxYUqpCBKdacHpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTXw3iGj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67BBC4CEF1;
	Fri, 19 Sep 2025 14:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758292844;
	bh=Tp0iF6Qs70aaCWdqaFDcXwePAlPgsbZcyXEX+0AZba8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aTXw3iGj5BpNPnS4VZB1PDxjhfJuw4n1u47rXxN+dpgpGRYXHgDr5I4pmu7ZBE9vj
	 Dl78fOgMKeLFPIcjr999IgGL858FuC0miK2hSZdxG/genbGyOAHbIPrAwOWI2jHw/S
	 RK8ZIlCHRd4GVR8nTPcs/+ejNXAyzJy8z9eL9EYY07fDCWiJd2MGVgVkzpeqdqszm5
	 OX2DKRM8dEEq+6NXd/sLk2ctRXpxHY8w0YKqYVaFwVpn0WAYFLINCwW0u2nPEBL7YT
	 oBhFio/ZPKrM6CyLIaTlyJ6JTef+LTW0i5pHjeTpcXSlvgVdwbNVhsaxSMCNJLWBCy
	 C7bTjykSy1GxA==
Date: Fri, 19 Sep 2025 09:40:42 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: platform: Add Lenovo Thinkpad T14s EC
Message-ID: <20250919144042.GA875871-robh@kernel.org>
References: <20250918-thinkpad-t14s-ec-v5-0-ac0bc6382c5c@collabora.com>
 <20250918-thinkpad-t14s-ec-v5-1-ac0bc6382c5c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-thinkpad-t14s-ec-v5-1-ac0bc6382c5c@collabora.com>

On Thu, Sep 18, 2025 at 11:20:26PM +0200, Sebastian Reichel wrote:
> Add binding for the EC found in the Thinkpad T14s Gen6 Snapdragon,
> which is based on the Qualcomm X1 Elite. Some of the system LEDs
> and extra keys are only accessible via the EC.

s/platform/embedded-controller/ in the subject.

> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>  .../lenovo,thinkpad-t14s-ec.yaml                   | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

