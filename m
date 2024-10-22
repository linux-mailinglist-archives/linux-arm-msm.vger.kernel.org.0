Return-Path: <linux-arm-msm+bounces-35350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB269A9AE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 09:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A556DB23329
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8549C14A4D1;
	Tue, 22 Oct 2024 07:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9ZaOq85"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515E6149C41;
	Tue, 22 Oct 2024 07:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729581932; cv=none; b=fEdMhRY5G18Fqu6dT1UttQv7l/gTEnpYatNoxEjOLQrPaVD8xy6dq7wz7gflo8wI4+2MGcKoJFYZ1sYJqM4CyTkE/qmlt8WXgJXR2ZsK4+i1xUsDN8ZIq44dJn6HttSXBpIYv6f5juBVuhmcTFY/MvsnhPE7fAQmPaW+Wjq60Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729581932; c=relaxed/simple;
	bh=zowprF69nfhPdKQnL+MSI1acjh7ULk2gd17Lc+eGNh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbaVkiXK1moXaHvP8j5NsA+7ytW7x3Gkrj0k0WkORvIuSdJyI9afV6qo0/sejujqrF4FTHP21aF+4pVsqkkWbRmfCjcHE+gM+71B60iOADAjVFiixV51bishZiOVBUBK73CxPFS/V5ZC7UGcsm8UWOtan0GfvEDBJACr9PJ+4fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9ZaOq85; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB31AC4CEC3;
	Tue, 22 Oct 2024 07:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729581931;
	bh=zowprF69nfhPdKQnL+MSI1acjh7ULk2gd17Lc+eGNh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W9ZaOq85cFvQLJS78UE/g2249ffKe48oON7Bn+HY824PcMIv8+oU8leAYCGQrxYai
	 a0vBSo2S3fdlG1OXbXwkdJ+R1J+uS+jDzQ/JOU/vS7dfn/PDKxmWTGKvC4j76+6FS8
	 gkEupWB4c/v3CFL02dukhdo+izRDPUAoo+3fOMxIDGjaQWBvuDHpdvgHGNkUkTJQoT
	 6BrQri5pfdx0/dr58zdvJ7DcLn+337XMg9IK5PY3ZqbMejOzk5rP9qrJ2iGgMW7kMQ
	 4eR2dAdYSwwZAQHYVVXj26mCM4h3xitw2Xj3DWiF8zJ77BEQbk3hovleiTdtPKmXCg
	 04eHHQmX11nDw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t39Gw-000000004OJ-0nGl;
	Tue, 22 Oct 2024 09:25:42 +0200
Date: Tue, 22 Oct 2024 09:25:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] usb: typec: Add new driver for Parade PS8830
 Type-C Retimer
Message-ID: <ZxdTdqs2ReKwoFfb@hovoldconsulting.com>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <Zw5i9dcSMOG4n3PW@hovoldconsulting.com>
 <Zw5oOUeN/v+tz+SY@linaro.org>
 <ZxCoDHq871x_0Nbm@hovoldconsulting.com>
 <ZxDJ8I6ZXOLv/KbR@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxDJ8I6ZXOLv/KbR@linaro.org>

On Thu, Oct 17, 2024 at 11:25:20AM +0300, Abel Vesa wrote:
> On 24-10-17 08:00:44, Johan Hovold wrote:

> > I can confirm that marking the regulators as having been left on by the
> > bootloader so that they are not disabled temporarily during boot indeed
> > fixes the coldplug issue here.
> > 
> > That however makes me wonder whether something is missing in the driver
> > so that it still relies on setup having been done by the boot firmware.
> > 
> > Have you tried actually asserting reset during probe to verify that
> > driver can configure the retimers itself without relying on the boot
> > firmware?
> 
> We do not want to reset the retimers on probe because we won't be able
> to figure out the orientation config until next pmic glink notify comes.
> The pmic glink notify only triggers on USB event, which never comes
> until you replug the device. So in order to have coldplug orientation
> configured correctly in the retimer, we need to make sure the retimer
> holds state until unplug.

Ok, thanks for clarifying. As we've discussed off-list it should be
possible to retrieve the orientation from the orientation gpios, but I'm
sure there are bits missing in the kernel for propagating that
information to the retimers currently.

If I understood you correctly you did reset and reinitialise the
retimers in v1, which is useful during development at least to make sure
that the driver is complete.

Johan

