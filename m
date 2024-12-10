Return-Path: <linux-arm-msm+bounces-41312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE819EB1C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 14:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46E5F168813
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 13:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12A01A256B;
	Tue, 10 Dec 2024 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cas5dQYS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8329519DF99;
	Tue, 10 Dec 2024 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733836699; cv=none; b=dj2S3JjVA16YJzc/XfohlPGyrriYk6vb0ZQdl60NCGySm/MmxBYEdbV9d/Sc0Z79JwqcE1ry4LqRmKoM685pr8WoMK7YufPy+/MWmS/rgT4ZoG6wSFu9EJo/MC4N3msJ3++ghm1r6hyMMdCqThTyWjpNqPlbGXYWMcCvr3cB3MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733836699; c=relaxed/simple;
	bh=uIhQoJGYiDFo8tFm8p4NlRafWkGjon8JvpSmePl2JMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOAu4q06wPDkrw6NSbAtfK+FihnKfRnuOKIpq7ZJ0s1TXGs7mPZkjBirFTrDLcX1mzmZUVmOZOkmBi3JEQ5aPCKPNCxrKJpPYyvOmvHuBZrIc8iYFAPCbBmNoTcZmv5zVFkdGyQTuo90RZ6DbOBWENVlHQ+AiU+RtUyKazG7cUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cas5dQYS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBB9C4CED6;
	Tue, 10 Dec 2024 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733836699;
	bh=uIhQoJGYiDFo8tFm8p4NlRafWkGjon8JvpSmePl2JMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cas5dQYSHHhm8M/gB6qwrIbPiixehQJUFtK1qDl77QQXEQHApgI27VWeZaKte04bC
	 JW5qTVuFuMOWZb/XdcV4Rbg68xnRHEGf6ZH1+vmhL+De5BCzl2xJLBYQPuSONEPBfx
	 yRDchOYP9r94Q+2N7I8DifGBcu1zFQodE8ehMRXjBnuVE9/J7Mc0PjVRQUzzDq1JwP
	 3UQEA2fPGVK1rHZuIK+6f6kNPKvHxYDjy3ye8zNBneDsDkbuseMdSvvx/Cr8UeT6mb
	 Y/+yiBj9nfjI8nhHlczlTW0bYrJ4rJIeB8rT4LcUODRsS7Ni+ZpOiQaZKdeAeMQ+qC
	 jGFA+XgCE6xpw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tL084-000000000ye-2T37;
	Tue, 10 Dec 2024 14:18:21 +0100
Date: Tue, 10 Dec 2024 14:18:20 +0100
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>,
	Xilin Wu <wuxilin123@gmail.com>, Abel Vesa <abel.vesa@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] arm64: dts: qcom: x1e*: Fix USB QMP PHY supplies
Message-ID: <Z1g_nFhYXrBxHtrb@hovoldconsulting.com>
References: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>

On Tue, Dec 10, 2024 at 10:07:31AM +0100, Stephan Gerhold wrote:
> On the X1E80100 CRD, &vreg_l3e_1p2 only powers &usb_mp_qmpphy0/1
> (i.e. USBSS_3 and USBSS_4). The QMP PHYs for USB_0, USB_1 and USB_2
> are actually powered by &vreg_l2j_1p2.
> 
> Since most X1E device trees just mirror the power supplies from the
> x1e80100-crd device tree, this series fixes up all the X1E boards with
> the same change.

Nice find! I've confirmed that this matches both the CRD and T14s
schematics.

> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> Stephan Gerhold (8):
>       arm64: dts: qcom: x1e001de-devkit: Fix USB QMP PHY supplies
>       arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix USB QMP PHY supplies

nit: We've been using the shorter "x1e78100-t14s" prefix for this one so
far. This may apply to some of the others as well.

>       arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix USB QMP PHY supplies
>       arm64: dts: qcom: x1e80100-crd: Fix USB QMP PHY supplies
>       arm64: dts: qcom: x1e80100-dell-xps13-9345: Fix USB QMP PHY supplies
>       arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix USB QMP PHY supplies
>       arm64: dts: qcom: x1e80100-microsoft-romulus: Fix USB QMP PHY supplies
>       arm64: dts: qcom: x1e80100-qcp: Fix USB QMP PHY supplies

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Johan

