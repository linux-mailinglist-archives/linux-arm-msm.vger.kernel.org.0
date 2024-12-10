Return-Path: <linux-arm-msm+bounces-41335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5109EB52A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 551DD1672C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 15:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C677D1BAED6;
	Tue, 10 Dec 2024 15:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3jUrQ/o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1101B6D15;
	Tue, 10 Dec 2024 15:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733845081; cv=none; b=RS4MzCuvD++xW4sNP/cBDcz0rVym5aJQ++MWwWM9CZF9LsB7x3oSBt/t2e4CAYjh8BJZDCkpdOZxBpmRHUhl115YHll9Y43g7uWPLS7ihhlcFcvZ60PZhz/x9FkmG1ABGRmXm7sc4ApdYowScemLDKiyu02KOcky6E5PVNnIOtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733845081; c=relaxed/simple;
	bh=jQK1rR1TMvB+c92tZIZFn3e/MNAuxBIas8wMffGZ9kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdSAWsse8s+yqOfax80zYe1tI4a0ueGe+vyrPRg8TH6zKKDW1kCx+KEJptiu4OojAfH4WFHGqJ35Bem2hxU+C7kO5Ur2PcJ2ZK95QhoZ2O98jcjTNzEjfFMBQkNovPKCjUH+oh8wpMax9rYmXFmOjfTZSuF1Ox/pq4MgX3/DVhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3jUrQ/o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075EFC4CED6;
	Tue, 10 Dec 2024 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733845081;
	bh=jQK1rR1TMvB+c92tZIZFn3e/MNAuxBIas8wMffGZ9kM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3jUrQ/oItoI7/e4GWclAQx1QJLfU+7C4Y5iao/wpINumo9dV9kb2kZDNxApQoBBT
	 3SVHm2yW4DouAXkTJ9yV+2h2vPcWCIJ/L/V1RxcW0M3THGg/iKDA7XgVZqOGn/D9/o
	 4RL1uWO5ktrC0VgTGMEOSYr+KRes8RUcBMBDEOkh6K0IRCNgI+xRFlej6ZBNxtaE0q
	 DvC1Z2AabKOvEdkhyYl1wUVAyr7Wrm3tt2s45L6EksBtabMEU3blUvJNS281Ezpt/Y
	 1WwR0iynZchFwLQeJ505mXzArN1YcYUWyPrrvwwnxeplvg4iMM3qQnXJiNNmf2fgrk
	 +5Zot4ho3v2YQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tL2JH-000000005Ts-3oHF;
	Tue, 10 Dec 2024 16:38:03 +0100
Date: Tue, 10 Dec 2024 16:38:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xilin Wu <wuxilin123@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] arm64: dts: qcom: x1e*: Fix USB QMP PHY supplies
Message-ID: <Z1hgW-_pqqCpIwH0@hovoldconsulting.com>
References: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
 <Z1g_nFhYXrBxHtrb@hovoldconsulting.com>
 <86ttbbsm69.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ttbbsm69.wl-maz@kernel.org>

On Tue, Dec 10, 2024 at 01:27:26PM +0000, Marc Zyngier wrote:
> On Tue, 10 Dec 2024 13:18:20 +0000,
> Johan Hovold <johan@kernel.org> wrote:
> > 
> > On Tue, Dec 10, 2024 at 10:07:31AM +0100, Stephan Gerhold wrote:
> > > On the X1E80100 CRD, &vreg_l3e_1p2 only powers &usb_mp_qmpphy0/1
> > > (i.e. USBSS_3 and USBSS_4). The QMP PHYs for USB_0, USB_1 and USB_2
> > > are actually powered by &vreg_l2j_1p2.
> > > 
> > > Since most X1E device trees just mirror the power supplies from the
> > > x1e80100-crd device tree, this series fixes up all the X1E boards with
> > > the same change.
> > 
> > Nice find! I've confirmed that this matches both the CRD and T14s
> > schematics.
> 
> Can someone with access to the schematics confirm that the devkit
> indeed has the same supplies?

Sibi, can you confirm our assumption that these definitions were copied
from the CRD devicetree and need to be fixed like this also for the
devkit?

Johan

