Return-Path: <linux-arm-msm+bounces-3660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5098084F1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 10:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CBC21C21735
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 09:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC06C35271;
	Thu,  7 Dec 2023 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHXPpKQX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52DC1E489;
	Thu,  7 Dec 2023 09:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5B0C433CB;
	Thu,  7 Dec 2023 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701942621;
	bh=YzfxSDFRzoSe+GPPF5UuUyQYbQJvr9Enxd0o7o5jPHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHXPpKQXNg1pjrxlf+/vHYiq9+FKp+oLoG9ASwloceCLg8aaYwtTfaAwvxhn4XvS1
	 DDLjyxmy6a7zqgWmqaqwBIMNlH4Z0lyJ9e19DBmJLP9KTjs/7bIHknLni1a2EWehPK
	 /D/EXii6OkGi6Y+6YLz3Fp7eYYw2AoHHAwyEv4GCpmENzrAuWGmrGaLXeyxsTGNoim
	 ly3l4lZOdcwtem6tDSDM36aw6K6rsY7UaIMvgPSJgEDfebhwrO22E2eWEE1mXj7Pb3
	 jFXIHA6NuKLi/s/nGnz+sloz2UT8/kceEzhR4E+nk+lK/lAERZqbxiFD+J/Y3gBBOt
	 t2lxQPYABvoTg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rBB2D-0008FF-0j;
	Thu, 07 Dec 2023 10:51:09 +0100
Date: Thu, 7 Dec 2023 10:51:09 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
	quic_skananth@quicinc.com, quic_vpernami@quicinc.com,
	quic_parass@quicinc.com
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,qmp: Add PCIe
 qcom,refclk-always-on property
Message-ID: <ZXGVjY9gYMD6-xFJ@hovoldconsulting.com>
References: <20231127-refclk_always_on-v3-1-26d969fa8f1d@quicinc.com>
 <78815f1b-7390-40de-8afd-ac71806f4051@linaro.org>
 <24fae40a-453b-b14c-923f-88758a246aa7@quicinc.com>
 <20231201060716.GJ4009@thinkpad>
 <166d307e-7d1b-48b5-90db-9b6df01d87c2@linaro.org>
 <20231201111033.GL4009@thinkpad>
 <f844cd1e-7e4f-4836-bc9a-2e1ed13f064f@linaro.org>
 <20231201123054.GM4009@thinkpad>
 <3a7376aa-18a2-41cb-a4c9-680e735ce75b@linaro.org>
 <20231206131009.GD12802@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206131009.GD12802@thinkpad>

On Wed, Dec 06, 2023 at 06:40:09PM +0530, Manivannan Sadhasivam wrote:

> OK. How about, "qcom,broken-refclk"? This reflects the fact that the default
> refclk operation is broken on this platform, so the OS should be prepared for
> it (by keeping it always on).

Shouldn't that be

	qcom,broken-clkreq

since its the CLKREQ# signal used to request REFCLK that is broken, not
the REFCLK itself?

Johan

