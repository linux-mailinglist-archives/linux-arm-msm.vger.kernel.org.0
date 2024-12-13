Return-Path: <linux-arm-msm+bounces-41920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CED9F070F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFA4D280D51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790F419AA58;
	Fri, 13 Dec 2024 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tu3CVgZ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498CA185B78;
	Fri, 13 Dec 2024 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734080442; cv=none; b=LsHZR/MHiQNzDXlaDqtxQyDW5baC6UZVJp/xHXbnpijsPsCFDX8QvldiIZlCjtFLhmHSP4aFHKIA/q0s+BqZ25WpMzKjh1G9qK6Yd9jeni3pcooYSZnLOapy5zZCY1PQRqtCIQV5GpKkRN4Co4tsGuXDSRCCAdnCGgeLtL034iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734080442; c=relaxed/simple;
	bh=UZNnvkExZ7zuNWaU7B62b6NVp5W1UDxqMDFQPWrdMNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZTjuowjZU362wbcoCpMowSnmdZq5FnZTf0cWY9R3ilqHmjyxAXuHrC1RKjCgHcX0J+HyJnASSPzeIk16er0JPkh+KXzyQDGEw+c+hTkToSi11gvIMEiS9LQ+H+SIUgXaC9Ww/Ib71Az0Gw4CAdvHTQ3UPxwwjZbFbRVZM/xnAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tu3CVgZ7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1483BC4CED0;
	Fri, 13 Dec 2024 09:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734080442;
	bh=UZNnvkExZ7zuNWaU7B62b6NVp5W1UDxqMDFQPWrdMNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tu3CVgZ7Evx65zdlJIl6G5/MMh2qarRbd3z04tzbrsCpbGdLQa1u6fA03CqtffY5W
	 M7DHizrDUsVE+I5SWcKYFXNU8WreOHFHHlhme/EPcRvxgKyXwfc6qJEQi7rUQ6yUg5
	 qKsU7sxtmvLZwl4ok5Usp55BQjpilrE3ScCVzRJapMqWTBX5nOBW9JV6Wedic77X97
	 Recwh/XqSqLhnvDKEKHWLCjrrKPyXn/r+wI7Ci3zEv2UUcQ1c+GX1kQKoq5t5K674l
	 cOvtmFpm3hYZVoO2RE65Z5Q57F39i+K5G9iTTZHqFacYKFOgCJgWsW1XjDT8vhbK+J
	 cvmFlVsNO8LgQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tM1XR-000000000mJ-2S3o;
	Fri, 13 Dec 2024 10:00:46 +0100
Date: Fri, 13 Dec 2024 10:00:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2] usb: typec: ucsi: Set orientation as none when
 connector is unplugged
Message-ID: <Z1v3ve3M3s8cmGhA@hovoldconsulting.com>
References: <20241212-usb-typec-ucsi-glink-add-orientation-none-v2-1-db5a50498a77@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-usb-typec-ucsi-glink-add-orientation-none-v2-1-db5a50498a77@linaro.org>

On Thu, Dec 12, 2024 at 07:37:43PM +0200, Abel Vesa wrote:
> The current implementation of the ucsi glink client connector_status()
> callback is only relying on the state of the gpio. This means that even
> when the cable is unplugged, the orientation propagated to the switches
> along the graph is "orientation normal", instead of "orientation none",
> which would be the correct one in this case.
> 
> One of the Qualcomm DP-USB PHY combo drivers, which needs to be aware of
> the orientation change, is relying on the "orientation none" to skip
> the reinitialization of the entire PHY. Since the ucsi glink client
> advertises "orientation normal" even when the cable is unplugged, the
> mentioned PHY is taken down and reinitialized when in fact it should be
> left as-is. This triggers a crash within the displayport controller driver
> in turn, which brings the whole system down on some Qualcomm platforms.
> Propagating "orientation none" from the ucsi glink client on the
> connector_status() callback hides the problem of the mentioned PHY driver
> away for now. But the "orientation none" is nonetheless the correct one
> to be used in this case.
> 
> So propagate the "orientation none" instead when the connector status
> flags says cable is disconnected.
> 
> Fixes: 76716fd5bf09 ("usb: typec: ucsi: glink: move GPIO reading into connector_status callback")
> Cc: stable@vger.kernel.org # 6.10
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
> - Re-worded the commit message to explain a bit more what is happening.
> - Added Fixes tag and CC'ed stable.
> - Dropped the RFC prefix.
> - Used the new UCSI_CONSTAT macro which did not exist when v1 was sent.
> - Link to v1: https://lore.kernel.org/r/20241017-usb-typec-ucsi-glink-add-orientation-none-v1-1-0fdc7e49a7e7@linaro.org

Thanks for the update.

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

