Return-Path: <linux-arm-msm+bounces-1458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE317F42B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60DC41C20A43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 09:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B287584E2;
	Wed, 22 Nov 2023 09:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2r1HKah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E109F5647E;
	Wed, 22 Nov 2023 09:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B70C433C9;
	Wed, 22 Nov 2023 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646516;
	bh=VC9h/SiN8Zx5aGSBZR6crUirZJCFXIk5eN7BP4+P6I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o2r1HKahm9VWVd8qhtRV5/TA0RzVd6l+Ek0VSBN3s1RHZ4h7noyswlQcQ/YYLC0bk
	 S8X2LCkTa9Cn0lqoVsO7YeEWzqDDF9S00dbajvfkp/V/Nkf6RbrOv60lm2Tu2jKhzH
	 hJHZR8n8AoXCmbsVVJ4HS9/AW6Dt7b2D46VblcZMz174wt5kA9wh4fSSKIjgNyL93o
	 Vh0BPCbwpKejYEmFtM3PBxYReBmcH7yZKTkqkAthHqusQZrsvy/TIyXYFaJRwJzhJL
	 E5WBfi2inJ1LBiPwSpwzZkes9BfR8RHQ7hzLdlH71Y2L2f9A6BHxmwdiPcB7qM765H
	 4tEAIETsNmApQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r5jqk-0008B5-1g;
	Wed, 22 Nov 2023 10:48:50 +0100
Date: Wed, 22 Nov 2023 10:48:50 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Subject: Re: [PATCH 00/12] usb: dwc3: qcom: Flatten dwc3 structure
Message-ID: <ZV3OgorG4G4mwvv1@hovoldconsulting.com>
References: <20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com>

On Mon, Oct 16, 2023 at 08:11:08PM -0700, Bjorn Andersson wrote:
> The USB IP-block found in most Qualcomm platforms is modelled in the
> Linux kernel as 3 different independent device drivers, but as shown by
> the already existing layering violations in the Qualcomm glue driver
> they can not be operated independently.
> 
> With the current implementation, the glue driver registers the core and
> has no way to know when this is done. As a result, e.g. the suspend
> callbacks needs to guard against NULL pointer dereferences when trying
> to peek into the struct dwc3 found in the drvdata of the child.
> 
> Missing from the upstream Qualcomm USB support is handling of role
> switching, in which the glue needs to be notified upon DRD mode changes.
> Several attempts has been made through the years to register callbacks
> etc, but they always fall short when it comes to handling of the core's
> probe deferral on resources etc.

Nice to see this finally being worked on. It's not clear why mode-change
notifications would be a problem though, as if you get such a
notification, you know that core has been probed.
 
> Furhtermore, the DeviceTree binding is a direct representation of the
> Linux driver model, and doesn't necessarily describe "the USB IP-block".

True.

Johan

