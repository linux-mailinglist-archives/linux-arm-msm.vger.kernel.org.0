Return-Path: <linux-arm-msm+bounces-3741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2AD808BDE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 16:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA659B20A47
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 15:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C9444C9D;
	Thu,  7 Dec 2023 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKI5e+Z7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82C244C96;
	Thu,  7 Dec 2023 15:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE94C433C9;
	Thu,  7 Dec 2023 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701963089;
	bh=6F4ahMF1HkJD/fLnjNXZvdSTw88g4sCNHF10gcN6v14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKI5e+Z7SRmOTHUEIpDvA0cfxmqVkOIgYb/ExhWL1GIr38FKOpv+LUlJTrLJmw/Bt
	 kM3hr9wKXV16NNrg/pDjrwLb1mRts+uOP3R44iRTU40lzeWP9KauCr8PZ7WUp+STg8
	 +6l/Vp8jg4G9pxQq105DqH4p+pcWSYSerhKYSW7lanNTLa9u0bFDNCBVZLEe0yHMMB
	 zh5Qr7k6SxCPfKrXIvi1NSDri9SQEIqW5qHx6+E8w+u+vv0N53+ImF6jTg/Od2hmYP
	 BPpJGR8RMkWWCo8AF1WQQgSGAKDn0UHq0GjoYj+PrT/O2vfUwy/F+/Cuj54Y6dJWRC
	 F6hfLSUK5kokQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rBGMN-0000r2-1S;
	Thu, 07 Dec 2023 16:32:19 +0100
Date: Thu, 7 Dec 2023 16:32:19 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: Fix hs_phy_irq for QUSB2 targets
Message-ID: <ZXHlg3orGSEXjO7w@hovoldconsulting.com>
References: <20231204100950.28712-1-quic_kriskura@quicinc.com>
 <20231204100950.28712-4-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204100950.28712-4-quic_kriskura@quicinc.com>

On Mon, Dec 04, 2023 at 03:39:47PM +0530, Krishna Kurapati wrote:
> On several QUSB2 Targets, the hs_phy_irq mentioned is actually
> qusb2_phy interrupt specific to QUSB2 Phy's. Rename hs_phy_irq

('PHY' throughout)

> to qusb_phy for such targets.

'qusb2_phy'

> In actuality, the hs_phy_irq is also present in these targets, but
> kept in for debug purposes in hw test environments. This is not
> triggered by default and its functionality is mutually exclusive
> to that of qusb2_phy interrupt.
> 
> Add missing hs_phy_irq's, pwr_event irq's for qusb2 phy targets.

You also add some SS_PHY interrupts which could potentially enable
remote wakeup.

> Also modify order of interrupts in accordance to bindings update.

Say something here to as to why this is safe (e.g. all known current
users look up these interrupts by name).
 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>

Johan

