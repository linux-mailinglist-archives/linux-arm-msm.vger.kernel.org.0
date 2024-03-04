Return-Path: <linux-arm-msm+bounces-13251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C5386FE6A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 11:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A91241F21025
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 10:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A089224C2;
	Mon,  4 Mar 2024 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fUjoQhLx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A7B210F8;
	Mon,  4 Mar 2024 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709546974; cv=none; b=WsGOWiSHrVUmcf9nsOoAakwgZYrldk4CCN0NLijS+aV90zbEPiZ9SPdy84SP36dRqQWGJO/6HjaI6Snn8DfVwVrWrOmcJYHNPW72p2c1n0fzeLWPKupXO1JxuxbwnOQdxEavQinu1dhV/FXp0QfmDJvuyOl7Tr41glj3lBMrk0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709546974; c=relaxed/simple;
	bh=Izjjw7sldMOtF6Y1reRK0ij8DWIrD/K1rKRrggk5yRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Epn3cvVUuJJSmnJ2Y/Q7+W3ACb1DhpGgUzLoGJc3y5UZJSD+EcQMRxBEvadAL9IUTZ/zFlivMHIw97EvNPQEr/PFcfXCrI40RTRv1q87X5l/W0vbJ0Z5SzVkhgu6v5UAp2AG0uCyC0sRbruYYfuvltEZQJ8xU7R7majEE6G97iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fUjoQhLx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBDBFC433C7;
	Mon,  4 Mar 2024 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709546974;
	bh=Izjjw7sldMOtF6Y1reRK0ij8DWIrD/K1rKRrggk5yRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUjoQhLxKuAL3ix7LNPLwyxQk+6d8fu2TjdPY2vRDnN6X0iV+/oOHOrdspHRkY/4u
	 2NAUbL9EA0CbMbX34sJMwHOQWRDrj71lAqnZzsCW93JGftzY8rA34PYeaExeku0CUG
	 qt2KCELlqBzF4MsSngCWtow57mTcRPzMc1my9RmE=
Date: Mon, 4 Mar 2024 11:09:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: qrb2210-rb1: enable Type-C
 support
Message-ID: <2024030456-felt-tip-frequency-f8b9@gregkh>
References: <20240304-pm4125-typec-v4-0-f3601a16f9ea@linaro.org>
 <2024030414-stark-service-ce78@gregkh>
 <CAA8EJpoCm+jqMsd6=pnpd+cCtqLYnMWLmrNQgjiyhi7ugeUjvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoCm+jqMsd6=pnpd+cCtqLYnMWLmrNQgjiyhi7ugeUjvA@mail.gmail.com>

On Mon, Mar 04, 2024 at 11:51:27AM +0200, Dmitry Baryshkov wrote:
> On Mon, 4 Mar 2024 at 11:49, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Mar 04, 2024 at 11:26:09AM +0200, Dmitry Baryshkov wrote:
> > > Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
> > > Robotics RB2 platform) and implement Type-C handling for the Qualcomm
> > > Robotics RB1 platform.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Patch 1 added, 2 did not apply to my tree :(
> 
> Thank you!
> Yes, patch 2 should go through arm-soc.

Having patch series where each one goes to a different tree makes it
really hard for maintainers to know what to do, and our tools want to
take a whole series, not individual ones.  Next time perhaps split it
up?

thanks,

greg k-h

