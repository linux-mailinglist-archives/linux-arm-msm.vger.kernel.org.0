Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55EB3C5A44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 13:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238181AbhGLJpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 05:45:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:53764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234094AbhGLJpO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 05:45:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B582760FE9;
        Mon, 12 Jul 2021 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626082946;
        bh=Qh9aRe+w2O3BEIaSWxVtGbcCHzgHWQrrlLvYEpdfYdg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=JfPH1eiQymOWJjQTN8+IkVCo8OPqtIzwZZj9MlzmJE1qJXgHe44Kia14W/qtL5RCd
         7imFCLdtpxF7VsxioYKRX+SnQCrXISeoIDs7Z5V7tGcsRus9FYdVtLdtDCgV9yv27l
         GPwlaKObHOG7kg+VdNodZCko2/i8whKu5ojFEG0WkzsRl7dtD8J3TDZJdFgN7EIyiM
         r7DNmdvResxV8tVOUllm8oJBApCT4yCekfCuDuJgH7dah5zRH8oOM25VJTjk34BUTJ
         anefkJFYWo8IEb512w43YxQtzfsNSgYu9z5VnAXe28r8sxrN9PzFzJs1vmrbT9vFXj
         F6dxx0lgxxaKg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>
Subject: Re: [PATCH v8 6/6] usb: dwc3: qcom: Keep power domain on to support
 wakeup
In-Reply-To: <YNo97HQXmYjUNz/C@google.com>
References: <1624882097-23265-1-git-send-email-sanm@codeaurora.org>
 <1624882097-23265-7-git-send-email-sanm@codeaurora.org>
 <YNo97HQXmYjUNz/C@google.com>
Date:   Mon, 12 Jul 2021 12:42:17 +0300
Message-ID: <87fswjzx52.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Matthias Kaehlcke <mka@chromium.org> writes:
> On Mon, Jun 28, 2021 at 05:38:17PM +0530, Sandeep Maheswaram wrote:
>> If wakeup capable devices are connected to the controller (directly
>> or through hubs) at suspend time keep the power domain on in order
>> to support wakeup from these devices.
>>=20
>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>> ---
>> Checking phy_power_off flag instead of usb_wakeup_enabled_descendants=20
>> to keep gdsc active.
>>=20
>>  drivers/usb/dwc3/dwc3-qcom.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>=20
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index 82125bc..ba31aa3 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/of_platform.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/phy/phy.h>
>> +#include <linux/pm_domain.h>
>>  #include <linux/usb/of.h>
>>  #include <linux/reset.h>
>>  #include <linux/iopoll.h>
>> @@ -355,9 +356,15 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>>  	u32 val;
>>  	int i, ret;
>>=20=20
>> +	struct dwc3 *dwc =3D platform_get_drvdata(qcom->dwc3);
>> +	struct generic_pm_domain *genpd =3D pd_to_genpd(qcom->dev->pm_domain);
>> +
>>  	if (qcom->is_suspended)
>>  		return 0;
>>=20=20
>> +	if (!dwc->phy_power_off && dwc->xhci)
>> +		genpd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
>> +
>>  	val =3D readl(qcom->qscratch_base + PWR_EVNT_IRQ_STAT_REG);
>>  	if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
>>  		dev_err(qcom->dev, "HS-PHY not in L2\n");
>> @@ -382,9 +389,15 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>>  	int ret;
>>  	int i;
>>=20=20
>> +	struct dwc3 *dwc =3D platform_get_drvdata(qcom->dwc3);
>> +	struct generic_pm_domain *genpd =3D pd_to_genpd(qcom->dev->pm_domain);
>> +
>>  	if (!qcom->is_suspended)
>>  		return 0;
>>=20=20
>> +	if (dwc->xhci)
>> +		genpd->flags &=3D ~GENPD_FLAG_ACTIVE_WAKEUP;
>> +
>>  	if (device_may_wakeup(qcom->dev))
>>  		dwc3_qcom_disable_interrupts(qcom);
>>=20=20
>
> This is essentially the same as v7, which Felipe NAKed
> (https://patchwork.kernel.org/project/linux-arm-msm/patch/1619586716-8687=
-6-git-send-email-sanm@codeaurora.org/)
>
> I think Felipe wants to see the handling of the power domain in the
> xhci-plat driver. One problem here is that the power domain is owned

this is not exactly what I meant to say, though. I want drivers to be
self-contained. I.e. dwc3 doesn't modify xhci data and vice-versa. There
are a few assummpmtions that we can make, though. The structure is
usually like this:

glue {
  dwc3 {
    xhci
  };
};

This means that in order for glue_suspend() to run, dwc3 has to suspend
first and xhci has to suspend before dwc3.

For example, in the suspend call above, qcom (the glue) is directly
accessing dwc3 core data, which is incorrect. It looks like we want to
know if the PHY is not powered off and if it isn't, then we want to
change the power domain ACTIVE_WAKEUP flag. Now, phy_power_off is false
whenever any of xHCI's children enable USB wakeup.

It seems like we need to way to generically propagate that knowledge up
the parent tree. I.e., a parent needs to know if its child is wakeup
capable, then dwc3 could, in its suspend routine:

static int dwc3_suspend(struct device *dev)
{
	/* ... */

	if (device_children_wakeup_capable(dev))
        	device_enable_wakeup(dev);

	/* ... */
}

and similarly for qcom glue:

static int dwc3_qcom_suspend(struct device *dev)
{
	/* ... */

	if (device_children_wakeup_capable(dev)) {
        	device_enable_wakeup(dev);
		genpd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
        }

	/* ... */
}

It also seems plausible that this could be done at driver core and
completely hidden away from drivers.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDsDnkRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUidxQf/XaJ3wL82F8xWVAmW/ut6uzXgVMRCxFQu
cplBWLqwIA4B+fes0gZ7jz1+pEoXVbAeX282TTxttOQPOJut6+HHrU2SS+5ayTES
ppEE3ll+d923UN5GpN2xzh5dKD1/zxpeEKpIZyPmAD6f7YdOlDVKAy/VKifNIChg
5ENdcRwyZzefHNzrYDBluiQ56kXAo7qe57mQCwL2OZExyqMoRCnzdB8iLXb7N4Kh
bGCxWlLhN/ze+Ta7Oo9W+N/LRVCllrCDSXKl1Zr+JvGYBOgmOjBD48CtJzvQC1Xw
xZQ9eUcVf2we6Y6VkueIswO0MdIxkE6U8YhJgSQ+GNFwZs3ZDFezoA==
=iD1X
-----END PGP SIGNATURE-----
--=-=-=--
