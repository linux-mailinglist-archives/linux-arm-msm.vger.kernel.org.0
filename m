Return-Path: <linux-arm-msm+bounces-15136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4EE88BCA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 09:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3554B1F34BD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 08:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC38FBFC;
	Tue, 26 Mar 2024 08:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hC0vCnzR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2C13DAC01;
	Tue, 26 Mar 2024 08:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711442489; cv=none; b=DuJvcbGMoCYjnn+UMV2mHz472iokcwfCDO4dP9LRUMjQI74EOJKzyNQnNh74UBa98wSj19WebYvX/F4OqVTDHGXLe6eoz8WtRFI/OavQE+atLX2AfSz/IaVx82mupJn7WFaOq03NTu8afsjs2r+Hbe5JD1GanXGiDzPu1HabaPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711442489; c=relaxed/simple;
	bh=s3Y5LkcJQN20xjSmIYi1tJZcUYC36nkGzb2O3cLJfks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGzjaE1080ILAfdDNopuXNMeWfMdDNldPtQDddm4o8iWMNhAb9itChJdzzaBuE8ege/yDAXwWmLFOnkYdIYbXjLftZcq3QVbQ7auWyZcK5131YNCh91V1hpuLs6vIAYzeOcYxHTF4/hqKR8axYzQ0/a2bwpMRruB2jq9Fv/s6ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hC0vCnzR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA52C433C7;
	Tue, 26 Mar 2024 08:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711442489;
	bh=s3Y5LkcJQN20xjSmIYi1tJZcUYC36nkGzb2O3cLJfks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hC0vCnzR0lDXbfPmyt935zY387vwAbBeh34M7cQylYiHXqTHcf4OATBDQL0NnZK5H
	 XWDWmU6MKNlq4I7lNLsoXXtxmlH2kOHs3z76CgX/ChBXlcFNp7M71YuL1da7XVdn35
	 6w2scdmrbPpeefSxKC+BxCRrkvU3nCNorbV4Kyg3xWspkctp0gQMywhqJWbXHrJ2aK
	 rZw1Igvl7QaRd4+w+TZG7F4AwfUgzqw2HxAwTKs4tLJDD9RrfnaAh36rbQCVhoIYYT
	 NoAVz2z2w/6UAuhyziKbydXFP2RQnvPdPpVSoHvyQkPJqcLw0Tu5kzdlxcTCMIMo4v
	 gT1vCp8w59Ejw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rp2ND-00000000635-2rSm;
	Tue, 26 Mar 2024 09:41:36 +0100
Date: Tue, 26 Mar 2024 09:41:35 +0100
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
Message-ID: <ZgKKPyLUr8qoMi9t@hovoldconsulting.com>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
 <Zf12vSHvDiFTufLE@hovoldconsulting.com>
 <CAA8EJprAzy41pn7RMtRgbA-3MO8LoMf8UXQqJ3hD-SzHS_=AOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprAzy41pn7RMtRgbA-3MO8LoMf8UXQqJ3hD-SzHS_=AOg@mail.gmail.com>

On Mon, Mar 25, 2024 at 10:56:21PM +0200, Dmitry Baryshkov wrote:
> On Fri, 22 Mar 2024 at 14:16, Johan Hovold <johan@kernel.org> wrote:

> > I just gave this series a quick spin on my X13s and it seems there are
> > still some issues that needs to be resolved before merging at least the
> > final patch in this series:
> >
> > [    7.786167] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> > [    7.786445] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> > [    7.883493] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> > [    7.883614] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> > [    7.905194] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> > [    7.905295] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> > [    7.913340] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> > [    7.913409] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> 
> I have traced what is causing these messages. During UCSI startup the
> ucsi_register_port() function queries for PDOs associated with the
> on-board USB-C port. This is allowed by the spec. Qualcomm firmware
> detects that there is no PD-device connected and instead of returning
> corresponding set of PDOs returns Eerror Indicator set to 1b but then
> it returns zero error status in response to GET_ERROR_STATUS, causing
> "unknown error 0" code. I have checked the PPM, it doesn't even have
> the code to set the error status properly in this case (not to mention
> that asking for device's PDOs should not be an error, unless the
> command is inappropriate for the target.
> 
> Thus said, I think the driver is behaving correctly. Granted that
> these messages are harmless, we can ignore them for now. I'll later
> check if we can update PD information for the device's ports when PD
> device is attached. I have verified that once the PD device is
> attached, corresponding GET_PDOS command returns correct set of PD
> objects. Ccurrently the driver registers usb_power_delivery devices,
> but with neither source nor sink set of capabilities.
> 
> An alternative option is to drop patches 4 and 5, keeping
> 'NO_PARTNER_PDOS' quirk equivalent to 'don't send GET_PDOS at all'.
> However I'd like to abstain from this option, since it doesn't allow
> us to check PD capabilities of the attached device.
> 
> Heikki, Johan, WDYT?

Whatever you do, you need to suppress those errors above before enabling
anything more on sc8280xp (e.g. even if it means adding a quirk to the
driver).

Johan

