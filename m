Return-Path: <linux-arm-msm+bounces-3740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0147808BC5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 16:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A2801F21340
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 15:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2455144C88;
	Thu,  7 Dec 2023 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgL9KtdY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F196040BFC;
	Thu,  7 Dec 2023 15:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5FDC433C7;
	Thu,  7 Dec 2023 15:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701962869;
	bh=WuHw8xBDQ4YPG0E788n4gpBGlBKTZtk7wXdWqhrweF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TgL9KtdYlG4PFBVAkV/sg39gPBkBc1aKidxwfqYRrzk2ZA4RHPcOPy0HGyeZso8Z9
	 bhTJU6U4hfQspY18LbEMb55CsfoESrH1Tg1OqsgRGFNMxO62AlQRTGZZXNuSo/sbAK
	 wgoumdqFMPTxtnbfsBKet6cgEgWu/Lh16lt5PMi/wfTyaBqDvOuW3KJ0chfmEWDSo9
	 bpe9/6+b75Tzpp6pHxxT1hlnHTVzvXVXlked6bsW6oetQnPGFgjpBZHaxXuGle+8h4
	 RgooKFeqnIWvdCRijDdkC3u+hFpn747kWtx/08ovW73iluc+N74sD1qPEZv1+Jvbnq
	 h5hls87q6xxfQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rBGIp-0000q6-1V;
	Thu, 07 Dec 2023 16:28:39 +0100
Date: Thu, 7 Dec 2023 16:28:39 +0100
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
Subject: Re: [PATCH v2 2/6] usb: dwc3: qcom: Rename hs_phy_irq to
 qusb2_phy_irq
Message-ID: <ZXHkpwji_AzXMjfm@hovoldconsulting.com>
References: <20231204100950.28712-1-quic_kriskura@quicinc.com>
 <20231204100950.28712-3-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204100950.28712-3-quic_kriskura@quicinc.com>

On Mon, Dec 04, 2023 at 03:39:46PM +0530, Krishna Kurapati wrote:
> For wakeup to work, driver needs to enable interrupts that depict what is
> happening on th DP/DM lines. On QUSB targets, this is identified by

typo: the

> qusb2_phy whereas on SoCs using Femto PHY, separate {dp,dm}_hs_phy_irq's
> are used instead.
> 
> The implementation incorrectly names qusb2_phy interrupts as "hs_phy_irq".
> Clean this up so that driver would be using only qusb2/(dp & dm) for wakeup
> purposes.

Here too you should say something about why this won't break any systems
booting using an older devicetree. Specifically, the QUSB2 PHY interrupt
has never been armed on any system running mainline as those bits never
made it upstream.

So an alternative to this could also be to just drop the QUSB2 PHY
interrupt handling from this driver for now.

Johan

