Return-Path: <linux-arm-msm+bounces-44094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C56A03B76
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F07DD3A4BF6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 09:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9FB1E47DC;
	Tue,  7 Jan 2025 09:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPSbZn55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EAB1DE895;
	Tue,  7 Jan 2025 09:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736243192; cv=none; b=nunsz5fLUo2OW8PT3CKnGRyNOUkZbbL0Lulwq+rFFoH8wWdEifxOTmWHXBiIvp1/+jGGZwfi7ctKk6wVcH9PeFcbBzdyVl/4cGYoPj8ZrubplDxcuT+YunashZuSx0sS2xi0gezSa2lY5+cVJXEoPqcv+Y5nJIIUJMLtbIHQYow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736243192; c=relaxed/simple;
	bh=yJqSbQ10V+vjR/1E36mOd8qVjRYd+V2tSgmwlu5jPjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gELIJmTnlUUuZXEX3FKy5ZBYnEguHl4aWUPr/9f07Tyqf4b7Cz3+Ujay373JOS2dcn22hcnafhUYJu1L2B22/n+52OIysAWnLmXV7TyARt6L8AcpM6MhV8EjNoj9YIu4Tifb+5Cu2e9Yq50jeCD16+297j9ey6/PxinnzB3Q7fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPSbZn55; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CB5C4CEDD;
	Tue,  7 Jan 2025 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736243192;
	bh=yJqSbQ10V+vjR/1E36mOd8qVjRYd+V2tSgmwlu5jPjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPSbZn557jZZukwH+EYcIO0DOy+1TXnANWWjibatDnEn/cOYP/A3ZAPjz5MT4xn0N
	 8m29RtBF9PjK+WdA9ZQfrJJMqCxhoeYnxfBcQFMkBq8Kv32N07XHuVzVk1MG4QzcnX
	 MvFhQgUeA8tV6AANanlom9Z1yz6AiCAGeiaHnZXOIFYambziwhJYpnPG1ViTvjgGI1
	 kesRpE5dE+hJp/kYs6ZroocC8r5h83BWdXCdzILsTyx8vFPb4WFDFdtXZBGhDl0IYi
	 xOTeb8Fk8X4yIW0CqlBpAfVh3HUrgizEetENleMiiuHWy5UPWphkBqWtP9FAEJXLF0
	 QqRNX386Lc9Gw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tV6AP-000000007B1-3Ny5;
	Tue, 07 Jan 2025 10:46:29 +0100
Date: Tue, 7 Jan 2025 10:46:29 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/6] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <Z3z39Z_BH1stsO0c@hovoldconsulting.com>
References: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
 <20241112-x1e80100-ps8830-v5-2-4ad83af4d162@linaro.org>
 <Z1CCVjEZMQ6hJ-wK@hovoldconsulting.com>
 <Z3vlTwR+SiZQWVh7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3vlTwR+SiZQWVh7@linaro.org>

On Mon, Jan 06, 2025 at 04:14:39PM +0200, Abel Vesa wrote:
> On 24-12-04 17:24:54, Johan Hovold wrote:
> > On Tue, Nov 12, 2024 at 07:01:11PM +0200, Abel Vesa wrote:

> > > +	/* skip resetting if already configured */
> > > +	if (regmap_test_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
> > > +			     CONN_STATUS_0_CONNECTION_PRESENT))
> > > +		return 0;
> > 
> > What if the device is held in reset? This looks like it only works if
> > the boot firmware has already enabled the retimer. Otherwise you may
> > return success from probe here with the retimer still in reset.
> 
> Please correct me if I'm wrong, but if the read above fails or reads
> anything else than "connection present", then below we go through the
> resetting sequence. If it reads "connection present", then retimer can't
> be in reset.

regmap_test_bits() returns a negative errno if the read fails, so you
need to check that the return value is 1 here to avoid returning success
from probe on failure.

Johan

