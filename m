Return-Path: <linux-arm-msm+bounces-20492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A988CF6FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 02:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 672E91F21874
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 00:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDF3653;
	Mon, 27 May 2024 00:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9pxCDdP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F7B64D;
	Mon, 27 May 2024 00:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716769726; cv=none; b=Vl0WZpNz+Ywtuto4oPl6tD1fwRGAOwJbR64kwBo6N9BM61zm8zoF0B8f9fTvnWVQ8f0knmgGfFpJGsqfQ9W4kFionnqWOze8dIhi57jp82jR22A7i5gu5oWZv9Dhpe8beuEWLgOjyaM2r+nKRIhfx8NbLAeumPoBfU5PMe3S1zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716769726; c=relaxed/simple;
	bh=zIGvqg9C2cc/RoiPwzBBqxZiUhayYAnjEKOC116yeN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mV7SgjgS9UksgXrbyoX+uyUFqlJQ59I2l1NeA5v9fkBNWBvWHygc1hDA+73niLNXzpjRg0fGQJ7+xGk3imJpJxSFhFUZtbERTIDVDxJvJaxkW/fnRWJrtduEIzdwhcWAjZ0/1AQxpl12wqGfjA0VVXXMC9lYCrh+wFI2gyA+AWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9pxCDdP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AAA6C2BD10;
	Mon, 27 May 2024 00:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716769725;
	bh=zIGvqg9C2cc/RoiPwzBBqxZiUhayYAnjEKOC116yeN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9pxCDdPTcZbJk487OCtN3drARKnpYRanClbooRgz7JDyi0pWENvornsabqMg9Z6+
	 vUuhb15uAHlDu0RrhubLZjGJNwKDAXWFJ1rDK0gDm4HoB+InCYZVYpaF3pfgmS4NCj
	 1+WYcsiJbasmVVAvsL2x8t+J5xipZn8qWp+PeJq+6741edfDlkVVTuQcCbpr2tyfVx
	 hCAIIrDbXNsT7MebZLrkv4ySchQKXPozemY72rHF662WMzJV7AfSJm5xGVOeTbI6r2
	 CgrqSTtXhydJboJOVvh3ZUKp7k0iJmo4pxjAgkWviiiYc4ykPUOC3Vnb+qDBp5Iq48
	 Nu9AEbtEVaU1g==
Date: Sun, 26 May 2024 19:28:42 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Komal Bajaj <quic_kbajaj@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, quic_wcheng@quicinc.com, quic_ppratap@quicinc.com, 
	Jack Pham <quic_jackp@quicinc.com>, Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Subject: Re: [PATCH v3 0/3] Add devicetree support of USB for QDU/QRU1000
Message-ID: <km2c2tkd5j3vedrmttpn4nydqpfhhz4bwgtzmngwbok4vic6q6@nshjtqcqmklm>
References: <20240502090326.21489-1-quic_kbajaj@quicinc.com>
 <CAA8EJprPLqj7GQM0vmN25U2+3kDow=NH8=-VC2N-0p92Ub3iCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprPLqj7GQM0vmN25U2+3kDow=NH8=-VC2N-0p92Ub3iCA@mail.gmail.com>

On Thu, May 02, 2024 at 12:09:41PM GMT, Dmitry Baryshkov wrote:
> On Thu, 2 May 2024 at 12:04, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
> >
> > This series adds devicetree nodes to support interconnects and usb for qdu/qru1000.
> > This is based on previously sent driver series[1].
> >
> > ------
> > Changes in v3:
> > * As per comments on upstream[2], to get role-switch working on QDU/QRU1000, it was recommended to
> >   use the actual TI switch driver. Since driver doesn't have the functionality to provide role-switch
> >   based on gpio, thus reverting back USB dr_mode to peripheral and removed the remote end-point nodes
> >   and usb-conn-gpio based role switch functionality.
> 
> This is not correct. The recommendation was to describe hardware properly.
> Which means adding schema description, adding  ti,your-switch
> compatible to the usb-conn-gpio.c driver, etc.
> 

In addition to wrangling the ti,switch implementation (and binding) into
something that only deals with the gpios and not actually talks to the
chip, this would also require us to add support for fishing out
vbus-supply of the connector and control that from said driver (or from
dwc3, or from dwc3-qcom...).

Given that I find it acceptable to pick up the peripheral-only support
as presented...

Regards,
Bjorn

> > * Link to v2: https://lore.kernel.org/linux-arm-msm/20240319091020.15137-1-quic_kbajaj@quicinc.com/
> >
> > Changes in v2:
> > * Changes qmpphy node name
> > * Changes dr_mode to otg and added USB-B port USB role switch
> > * Dropped maximum-speed property from usb dwc3 node
> > * Link to v1: https://lore.kernel.org/linux-arm-msm/20240311120859.18489-1-quic_kbajaj@quicinc.com/
> >
> > [1] https://lore.kernel.org/linux-arm-msm/20240502082017.13777-1-quic_kbajaj@quicinc.com/
> > [2] https://lore.kernel.org/all/CAA8EJppNZrLzT=vGS0NXnKJT_wL+bMB9jFhJ9K7b7FPgFQbcig@mail.gmail.com/
> > ------
> >
> > Komal Bajaj (3):
> >   arm64: dts: qcom: qdu1000: Add USB3 and PHY support
> >   arm64: dts: qcom: qdu1000-idp: enable USB nodes
> >   arm64: dts: qcom: qru1000-idp: enable USB nodes
> >
> >  arch/arm64/boot/dts/qcom/qdu1000-idp.dts |  23 +++++
> >  arch/arm64/boot/dts/qcom/qdu1000.dtsi    | 120 +++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/qru1000-idp.dts |  23 +++++
> >  3 files changed, 166 insertions(+)
> >
> > --
> > 2.42.0
> >
> >
> 
> 
> -- 
> With best wishes
> Dmitry

