Return-Path: <linux-arm-msm+bounces-14847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF493886E11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 15:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96E9A288FFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 14:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FC946BA6;
	Fri, 22 Mar 2024 14:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObXyUU3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA82446453;
	Fri, 22 Mar 2024 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711116592; cv=none; b=fsTAkZdbpy7IFV1i4OGTKO/K/J7ylPhe+PzltwWi0ZVoWXRmzgk15iokgUQWce8v6XJBl8xaa0AgYT+YlCgDihSyVliTEi6jZXUInjYajUcTc+JlhGATitkTQ7Kx0YAarLzU1nSxNBo52+24tdiUv7oxriyV20SEDIccGuUjsY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711116592; c=relaxed/simple;
	bh=3hjrSiZrXVvhQPVUAwTazg/nHINEV1fiqNYHTv2SMNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5CXjmXQHOEXcHPMj3LDDs/ex4SAjlCrlkdUVTHyXXhJgD0H/+sznBR8xVSjCzwmjIjDOYYw9ZhiEfhEFneATxXxP+mNun+dpSgpixTJKO2wAMe/Akmn9yuwqd3A/vz2Ey8khtf9EyMxEYabfhekZYDaLXfeSYJQgHapvPqBWJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObXyUU3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C70C433F1;
	Fri, 22 Mar 2024 14:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711116591;
	bh=3hjrSiZrXVvhQPVUAwTazg/nHINEV1fiqNYHTv2SMNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ObXyUU3ZWvUjxheQokI0qKNL1E8ywhyyR8oCV0CpcsemvVe4HcUysp+dRIZFqkYZP
	 UOFl//Is9VaKgl1TEY8SQ2bD3TldKZ6kdpF4tlDr2v0UHDIEBaM/azoAIf0bU5cvju
	 CLfVQ6mCU2ikedscI1yh6S5CA6yKL8rtVehwRNK4aoADMJPHLux+WwGRtpMzhYdcFT
	 qYEFFgKURWy+qSNOtVL7lSuCWTWAtHS9f+robJE/NNDrkl/fVg72YyCNYAaAoXJqhT
	 CfGPcBXjLLBtGVVfkX0WDDOmXzn1WiewBODqCaXNKBdsZFGEWog9YvWLq3S6nJ2gAr
	 lWUE6MxzNuW/A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rnfaq-000000000r3-3AKN;
	Fri, 22 Mar 2024 15:10:00 +0100
Date: Fri, 22 Mar 2024 15:10:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/7] usb: typec: ucsi: fix several issues manifesting on
 Qualcomm platforms
Message-ID: <Zf2ROG1Dl274-F5K@hovoldconsulting.com>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
 <Zf12vSHvDiFTufLE@hovoldconsulting.com>
 <CAA8EJpoat+u6OK35BNEUT3xv5Da0UdMKhC-wEs0ZoViSr7xFZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoat+u6OK35BNEUT3xv5Da0UdMKhC-wEs0ZoViSr7xFZg@mail.gmail.com>

On Fri, Mar 22, 2024 at 03:39:36PM +0200, Dmitry Baryshkov wrote:
> On Fri, 22 Mar 2024 at 14:16, Johan Hovold <johan@kernel.org> wrote:
> > On Wed, Mar 13, 2024 at 05:54:10AM +0200, Dmitry Baryshkov wrote:

> > > Dmitry Baryshkov (7):
> > >       usb: typec: ucsi: fix race condition in connection change ACK'ing
> > >       usb: typec: ucsi: acknowledge the UCSI_CCI_NOT_SUPPORTED
> > >       usb: typec: ucsi: make ACK_CC_CI rules more obvious
> > >       usb: typec: ucsi: allow non-partner GET_PDOS for Qualcomm devices
> > >       usb: typec: ucsi: limit the UCSI_NO_PARTNER_PDOS even further
> > >       usb: typec: ucsi: properly register partner's PD device
> >
> > >       soc: qcom: pmic_glink: reenable UCSI on sc8280xp
> >
> > I just gave this series a quick spin on my X13s and it seems there are
> > still some issues that needs to be resolved before merging at least the
> > final patch in this series:
> >
> > [    7.786167] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> > [    7.786445] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)

> > I see these errors on boot both with and without my charger and ethernet
> > device connected.
> 
> Just to doublecheck: do you have latest adsp installed?

Yes, there has only been one adsp fw released to linux-firmware and
that's the one I'm using.

If this depends on anything newer that should have been mentioned in
the commit message and we obviously can't enable UCSI until that
firmware has been released.

> Do you have your bootloaders updated?

Yes.

> If you back up the patch #5 ("limit the UCSI_NO_PARTNER_PDOS even
> further"), does it still break for you?

I don't understand what you mean by "back up the patch #5". Revert
(drop) patch 5?

The errors are still there with patch 5 reverted.

Johan

