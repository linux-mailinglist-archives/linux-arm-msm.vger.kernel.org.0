Return-Path: <linux-arm-msm+bounces-33189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B70829918EB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 19:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 618141F2225B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 17:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A451A157E6B;
	Sat,  5 Oct 2024 17:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTJ4AmFI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729EE15533B;
	Sat,  5 Oct 2024 17:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728149809; cv=none; b=qrat6t4LAOKoQF8WHfAAJyR+WHNURLUj7GVg4ad5yQMBr0u2HNp+Lifo3InS8mZnIZgHowz6IXMYR3oVoWDTDM/Lx4EHrxdyab55AxBaSQpQLajX/ACjB9aCwIZKFGGKoL5TtJLL6nGgITpISaybSzkQgbMGbPRzZiMSv5dhKDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728149809; c=relaxed/simple;
	bh=yORtFNIGSnwAgf8bQuV+m3VvdFwTYQTdH1kGbfyu6mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsS/KrJhSEg0Wzb8gg7KYUeVU5PKytI1bkQSEC50Mh+E53/sy6TyEP4RLurAJ0DY3NA9VlBqV7jjC5asY1AXahZIy+hwiw399d5ll3mPvG/RfUfr4pBIi2HyLpETJuTE33wBQ6o78Tu0JyS96f2OI4+LmQAvMAiWDAM6+CuaXoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTJ4AmFI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3EAC4CEC7;
	Sat,  5 Oct 2024 17:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728149809;
	bh=yORtFNIGSnwAgf8bQuV+m3VvdFwTYQTdH1kGbfyu6mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTJ4AmFIR0uZzinYkzxm5CrluWmoY0VIiQ5YzNP1l4yZEeM7S4osO6ACHkfZr12Kz
	 ZTIOdioCzrAQ6lV2jqeTLIsNoRRLIbPTZvnmQFpvDD7cAChrxw9aycCXVChUS8ALvu
	 LQGmAVki50mGcalaceVmkUVvxYBwmcwO3coGi7ylyCU5JEVWgl0fbAqQcU6NEMHYGV
	 B1QpUcA+zWLNxt6kSe/fA+3ATOLG9qeOw6PiJUswCykDtRKBDoddWyGi65/PnULJxD
	 GrTYJ/zqixWAFLb3v0rPtNCtS+BEZjnQzA6sya++/9g2PCtiP5URyUBWJgXVFHJIWt
	 HvbuNYMo0qq8A==
Date: Sat, 5 Oct 2024 12:36:47 -0500
From: Rob Herring <robh@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Parade PS8830 Type-C
 retimer bindings
Message-ID: <20241005173647.GA429341-robh@kernel.org>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <20241004-x1e80100-ps8830-v2-1-5cd8008c8c40@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-x1e80100-ps8830-v2-1-5cd8008c8c40@linaro.org>

On Fri, Oct 04, 2024 at 04:57:37PM +0300, Abel Vesa wrote:
> Document bindings for the Parade PS8830 Type-C retimer. This retimer is
> currently found on all boards featuring Qualcomm Snapdragon X Elite SoCs
> and it is needed to provide altmode muxing between DP and USB, but also
> connector orientation handling between.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../devicetree/bindings/usb/parade,ps8830.yaml     | 129 +++++++++++++++++++++
>  1 file changed, 129 insertions(+)

Missing R-by from Krzysztof?

