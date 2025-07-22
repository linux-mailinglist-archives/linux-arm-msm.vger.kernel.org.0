Return-Path: <linux-arm-msm+bounces-65988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2569B0D1DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 08:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B25996C5097
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 06:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5C628CF56;
	Tue, 22 Jul 2025 06:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3yhXiBP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C4328B50B;
	Tue, 22 Jul 2025 06:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753165682; cv=none; b=OJkVM3aUxVp/US4FU7v2mgcMglXFPfH6dTu/tY1+/EuBlwlhpTuqj24557frHviVkUWD3d3tm2k0Obym8FPLfrOiTYOy1f05onDTSnW0OJXHqlTMOxT7EZojBPZoOUM4lJv+B2NO1uS98/ipGRVPOBpx/M2KOroHnCOlgvEx49k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753165682; c=relaxed/simple;
	bh=pJZ8mhS5LDJbKuAjpcYWd1QM10ESPDFde8uZW8OLd90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANOozpFWeeAM8A1QIpTUZTsitbT6R7Od7yON3avXGn7CtXTpqr/hoqCEAS6GWF6ZVd4M2yF23WX2fzhjCOiN5N1sNzKCcwS2LuoYBoBSNufg9FslGUUqqCgYTyfyqQAoMOYzCXTGSxFDaNmLdtDxZ7T6guS77qYqo0yOI145F9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3yhXiBP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B532C4CEEB;
	Tue, 22 Jul 2025 06:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753165682;
	bh=pJZ8mhS5LDJbKuAjpcYWd1QM10ESPDFde8uZW8OLd90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l3yhXiBPVEf315vdyJEOMAP3o7xujPgnL9BivoCYfTKWYDKT5AzaPrI+K/G15S9Ck
	 rUtLcYBzWx88LmS/QHppHCBojbbTWzcN+23Q3Xo6c0olL1S+n+Jcq+3tQnAYKQb2NZ
	 VT/yxfGZPwDO5X6tlCr0Cwz1Nukb32uMLtXZEukKEEE1pDr/b5pyUGcJ7OQJkYMzqc
	 tQGKbSOkVTI/hwjk6eiEPV11qOeQptDSYOyXHb7z2R8M1/ZhZeEigDcSZXEMeaoHU8
	 DbmnIQD6f9mqTTePOfnY2JTRwAV5PqFKeEK2OA5ZqbqJ71+7MHSVNP3AUR3nHrDhw4
	 bXy3HMh7RNtgQ==
Date: Tue, 22 Jul 2025 08:27:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, bryan.odonoghue@linaro.org, 
	psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com, 
	quic_vtanuku@quicinc.com, quic_arandive@quicinc.com, quic_cchiluve@quicinc.com, 
	quic_shazhuss@quicinc.com
Subject: Re: [PATCH v7 0/8] Enable QUPs and Serial on SA8255p Qualcomm
 platforms
Message-ID: <20250722-curious-attentive-moth-e3d52c@kuoka>
References: <20250721174532.14022-1-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250721174532.14022-1-quic_ptalari@quicinc.com>

On Mon, Jul 21, 2025 at 11:15:24PM +0530, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM. The device
> drivers request resources operations over SCMI using power and
> performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
> 
> The SCMI performance protocol manages UART baud rates, with each baud
> rate represented by a performance level. Drivers use the
> dev_pm_opp_set_level() API to request the desired baud rate by
> specifying the performance level.
> 
> The QUP drivers are SCMI clients, with clocks, interconnects, pinctrl
> and power-domains abstracted by a SCMI server.
> 
> The serial driver has a dependency on the dev_pm_opp_set_level() function,
> which is applied in the OPP tree's linux-next branch.

Where is the changelog with lore links?

Best regards,
Krzysztof


