Return-Path: <linux-arm-msm+bounces-29325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BFE95C53D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 08:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D3CE281EEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 06:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF216E2AE;
	Fri, 23 Aug 2024 06:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lfHDNevy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA647345B;
	Fri, 23 Aug 2024 06:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724393678; cv=none; b=KgO0OSi7rQ1CXb7p1DYS3pQ2sKlliG+g3lMqQXZQhE5ym4yyvfecugrI6jV+CVcnD+aUa+o1WG26UT2wgF3zqZyhCVGxCTFAgJdUXcAOBu8+4++wPzvTfuodneI7zO5u5/T+S2srAPhUqpek2pmZT4JzwxYancUymHV4dwRXBYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724393678; c=relaxed/simple;
	bh=7+O/QT9OMuw+bvc3dHqfZlrxUk8r/29ACuYuoGeKbW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUt5HRT8ThLH5w0CYF1j5XVSC3mdfkF7s4WP2vE/JJHT+LQij8oGbYC1BvIUCo9zgPQNzepdREejQzhib5QBxlIvQ5kJfQN7RZ598dK9ag+yxMxV32NwgUGurCbkA7X1rWDIeaE7HthO3NOrnnfmpafgDh/Q+pcWTuxRuIbcucc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lfHDNevy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B496AC32786;
	Fri, 23 Aug 2024 06:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724393678;
	bh=7+O/QT9OMuw+bvc3dHqfZlrxUk8r/29ACuYuoGeKbW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lfHDNevyPmsrYzPialk455WsSVsEVhY2O1Exk8rW1to8EAoe1jJXdemwSKNDbe6QA
	 TRsUqy5bHORrghkKqpcJeb2SpN+ZiI74jmFR0uhmnDLgxK6Qzt0SftHHogta64il9X
	 L0RbuFLT21ISiKIOJcG4UMdDJ3zcJMLhqrpL6XKs=
Date: Fri, 23 Aug 2024 14:14:35 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Faisal Hassan <quic_faisalh@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: fix NULL pointer dereference on
 dwc3_qcom_read_usb2_speed
Message-ID: <2024082315-astride-footrest-ab04@gregkh>
References: <20240813111847.31062-1-quic_faisalh@quicinc.com>
 <ZscgKygXTFON3lKk@hovoldconsulting.com>
 <a3facdb7-e38e-4ef0-aff6-3e6aff0f9d88@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3facdb7-e38e-4ef0-aff6-3e6aff0f9d88@quicinc.com>

On Fri, Aug 23, 2024 at 09:26:18AM +0530, Faisal Hassan wrote:
> 
> 
> On 8/22/2024 4:55 PM, Johan Hovold wrote:
> > On Tue, Aug 13, 2024 at 04:48:47PM +0530, Faisal Hassan wrote:
> >> Null pointer dereference occurs when accessing 'hcd' to detect speed
> >> from dwc3_qcom_suspend after the xhci-hcd is unbound.
> > 
> > Why are you unbinding the xhci driver?
> > 
> 
> On our automotive platforms, when preparing for suspend, a script
> unbinds the xhci driver to remove all devices, ensuring the platform
> reaches the lowest power state.

That used to be the case a decade or so ago, but shouldn't be needed
anymore if your hardware is "sane" and can properly go to sleep.  Why
not just fix the driver to correctly sleep instead of unloading
everything?  This would require you to go through the whole
initialization sequence again when waking up and that can be a long time
overall, right?

thanks,

greg k-h

