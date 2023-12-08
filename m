Return-Path: <linux-arm-msm+bounces-3895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 589DB809E70
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 09:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89DA41C20BF9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 08:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C9A6D1B;
	Fri,  8 Dec 2023 08:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooIB+cJB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5041125B8;
	Fri,  8 Dec 2023 08:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2BFC433C7;
	Fri,  8 Dec 2023 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702024792;
	bh=Pw4Eb7AKWlmZ7qhGxk+DnQn5VwPy9d+b6klBHvzAo9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ooIB+cJBPw8bbCgaY3LP1/osy1fQDRCZyb0Ni7mJNXYxcDZ42zGT3wt2UkoiZlvt2
	 anAYPBVUZprv5eYf0aXbfNub7SncVkGamjklodoFVa6gYg+SSsOQzTiAwnpeAZq8yE
	 r4x3JKnlklHP5jC9F5nepWWLaeodUpCnCmdAkQsekXsI03iQhAfUk+zz7kkG7AHkwA
	 LMF+Wp3igkZSRll9ETiAvyAmkCXDmiYoGxk4gce9IpD6+RKA5A9JXjDzItlAq2hNwj
	 CQ2wawbvhu+JQU8EJhHpMMiMc3sA1bFxwA37qG928Mm+wrS3CFFCl/jxe32AN6IGEB
	 1P5hKwe7VvjjQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rBWPZ-0003vN-2O;
	Fri, 08 Dec 2023 09:40:41 +0100
Date: Fri, 8 Dec 2023 09:40:41 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/2] usb: typec: ucsi: add workaround for several
 Qualcomm platforms
Message-ID: <ZXLWiVJYWdlwOBou@hovoldconsulting.com>
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>

On Wed, Oct 25, 2023 at 02:49:28PM +0300, Dmitry Baryshkov wrote:
> The UCSI firmware on Qualcomm SC8180X, SC8280XP and SM8350 are buggy.
> Submitting UCSI_GET_PDOS command for partners which do not actually
> support PD and do not have PDOs causes firmware to crash, preventing
> further UCSI activity. Firmware on newer platforms have fixed this
> issue. In order to still be able to use UCSI functionality on the
> mentioned platforms (e.g. to be able to handle USB role switching),
> apply a workaround that completely shortcuts UCSI_GET_PDOS command for
> the USB-C partner.
> 
> This has been tested on sm8350 only, but should apply to other
> platforms. I did not enable UCSI for sc8180x yet, it has slightly
> different implementation, which I'd like to get tested first.

Has no one tested this on sc8280xp/x13s before merging?

I see a bunch of errors with this series applied to 6.7-rc4:

[   11.999960] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
[   12.000430] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-110)
[   17.120515] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
[   17.124204] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
[   23.264792] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
[   23.264953] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)

Is it just broken or am I missing some undocumented dependency that is
only in linux-next?

Johan

