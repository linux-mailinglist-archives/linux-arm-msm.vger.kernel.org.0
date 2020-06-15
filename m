Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D5F1F8C23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2020 03:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgFOBoE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Jun 2020 21:44:04 -0400
Received: from mail-eopbgr40051.outbound.protection.outlook.com ([40.107.4.51]:36934
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727946AbgFOBoE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Jun 2020 21:44:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4ldQ9wuKnImPWg70KlZ6RzHJHDsZL0D8tdQ5jHQp/LizWLQjvBYfr8BtqnWVPG+cnxHTRzh3yxu+5D13/XDKpkp+MHJPmNSvFooblG7azlSWZURpLjnUEj4YqvS0hT2zDMh2Ywb0FlvU1dyaFH1MJqW1ByhdUnznVMenP48BQM7qYcXohehIBzRvgVe85ZxhNpbsXwvl3pUBivkGs3mfUIttA02mX01L5Qn+RhkkzvY0WV03/e8SdmAtVbMVfGpuB3Cep7eJpTQQzRw+wISXFv4PF3/fiGRKF62AwRwJWfXXQaxLoDrFl8bRe6S+VG4Wflfdb9LmbRC2plzrHXWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vghfboLsFKfABaduR7Z+S06naU75Y/mNfqzAPql5k4=;
 b=nYzltESDd7eVfPm30mTPqEaq3NRFMdITNFTjUQFjcCvQZrKqUr5MRA3TzrjrJHDh05LEsBPKCURfPqoIeeI3H0zS3DRuLzcbQreWRzVD5pzaDteOnmYZ3gfi8ec+C3JQ4eBtPSL0VfksL4dcoywyr/3NiwnhBGVbWJIB11bv2JDyyey0fB0UUJClbwwDG+sP90MZArw2IGfQO9VJknRE/G+9OETnKyTQFdR+CiKfHaPB6R7F0lY9oUhF+zW6aAGPbzWaqqK9Tbvmpebzztbs7Gxyv86BDaxteQnOxY+0fGHbeKV5q4pP0ZJ23zozzcaaZ22/cy58Tr2rfs6weQXcsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vghfboLsFKfABaduR7Z+S06naU75Y/mNfqzAPql5k4=;
 b=h49eDckZf1ors9LLE1ZpgbiKvB9DvVo0/c6K75nioOUQ5W9GMr5wjuMj8eXO3+Ex4eS9bo3yyeakliXfjoIN5yJPyO6k5L6VZLUVU63VTMgI8Qs303gwukWFhM0cOcUnp3D8qM46sHYlMCxdozsfq/aXHhO44NN5m+ZBX2tFSfQ=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7111.eurprd04.prod.outlook.com (2603:10a6:20b:118::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Mon, 15 Jun
 2020 01:44:00 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3088.029; Mon, 15 Jun 2020
 01:44:00 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH 2/2] usb: dwc3: Host wake up support from system suspend
Thread-Topic: [PATCH 2/2] usb: dwc3: Host wake up support from system suspend
Thread-Index: AQHWP/yk3Ds0XPnWRk2lm9dM/5Lml6jY7QUA
Date:   Mon, 15 Jun 2020 01:43:59 +0000
Message-ID: <20200615014423.GA14073@b29397-desktop>
References: <1591885683-29514-1-git-send-email-sanm@codeaurora.org>
 <1591885683-29514-3-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1591885683-29514-3-git-send-email-sanm@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 296e7fc9-883a-4190-7c15-08d810cd9384
x-ms-traffictypediagnostic: AM7PR04MB7111:
x-microsoft-antispam-prvs: <AM7PR04MB7111E54D6C6EA616BA735EE08B9C0@AM7PR04MB7111.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /nmTThL4CBGIzdX7lUXLLGB/JYfeVLXIuWZrvlZrZXSBPE6mWXkTw7JPoD6kgrAJ62id7HQ+qHhLYkTb7/cX9Crz+Z1fUkp/YzvvKxm86iAVuNhVIPMpADecDuRL6aVDEbiFUCDAmQJaRwuPGemZogdEapNQWHRCMyHorAaux56yTBhAXnyo4AMZhMJ3OR3fWJ4I48Z+1kTwQPT4FSVvFqualjN80iKSqTyjNDC835H6KGtEO6dfV/VwrDDtYngycf/ZuMTDQUCoHES1TwDluP+uBlNPGhCgX0glhIQOFWIzYKMHjMJOyCm3Wij0kJ9DY4t2tiqfNpvFHktv6kxy3A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(186003)(7416002)(4326008)(71200400001)(8676002)(66556008)(9686003)(2906002)(6486002)(91956017)(8936002)(44832011)(76116006)(64756008)(6512007)(66946007)(66446008)(66476007)(15650500001)(6916009)(33656002)(33716001)(86362001)(5660300002)(26005)(53546011)(478600001)(83380400001)(1076003)(316002)(6506007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: SSdGHJN1og3AQnE8snsBaaP9T2HLf5s8k03CO72WdUJusVUofhLIfRacWqXrqK9AU7EAsCsoywLJWzp8Z1so0u+XBVgv4plbZcK8jtkr6CjCP+S1TkqTCKNp6oP9O2AD3BI6xMuOO5BwGGoGv6Euir+1bGNqJLxlMTzoNYJ4rgp56emv6BvGvXILwqIiYeEwrIQxJClQHIISfMLHv0fWOpir7Ts3wuzcl0tbVN8vp7wxjexVvpsT+nk3aoQ/1BMeQ6/joehELF716bKBjXjrat22GnDQ91FbyfocSUSiwEVn/snHgLnfx9VsqejfWm5axWlqtaPOCGYdIzqyvQAqOjHsy/nrjQGulYVktObFIOy1kaSV+3cFKUqixNUPYZJXmQA0/Y1Z9rn2SYO310e2uxuR4eZfSirNAHlLW3yA4IAyeZEQ6XHMYQqF54y4DfRW5SH0LL0309o7X4liazqlYEIXOU7fQSs2zM0QOZI4GV0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <571B2A92D9B6F7488E811D1102381E4C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 296e7fc9-883a-4190-7c15-08d810cd9384
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 01:44:00.0456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99wIwgKNnRhcUUH4TRfaCT5qhFwKxwDFi0Y+wvoGUU+Phf9YcvRRgzoVZbDbtla46q8kLD1D5zCTOd1uc4czxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7111
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-06-11 19:58:03, Sandeep Maheswaram wrote:
> Avoiding phy powerdown in host mode so that it can be wake up by devices.
> Set usb controller wakeup capable when wakeup capable devices are
> connected to the host.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/core.c      | 47 ++++++++++++++++++++++++++-----
>  drivers/usb/dwc3/core.h      |  1 +
>  drivers/usb/dwc3/dwc3-qcom.c | 66 +++++++++++++++++++++++++++++++++-----=
------
>  3 files changed, 91 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 25c686a7..8370350 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -31,15 +31,19 @@
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/of.h>
>  #include <linux/usb/otg.h>
> +#include <linux/usb/hcd.h>
> =20
>  #include "core.h"
>  #include "gadget.h"
>  #include "io.h"
> =20
>  #include "debug.h"
> +#include "../host/xhci.h"
> =20
>  #define DWC3_DEFAULT_AUTOSUSPEND_DELAY	5000 /* ms */
> =20
> +bool need_phy_for_wakeup;

Global variable may not suitable.

> +
>  /**
>   * dwc3_get_dr_mode - Validates and sets dr_mode
>   * @dwc: pointer to our context structure
> @@ -1627,10 +1631,36 @@ static int dwc3_core_init_for_resume(struct dwc3 =
*dwc)
>  	return ret;
>  }
> =20
> +static void dwc3_set_phy_speed_flags(struct dwc3 *dwc)
> +{
> +
> +	int i, num_ports;
> +	u32 reg;
> +	struct usb_hcd	*hcd =3D platform_get_drvdata(dwc->xhci);
> +	struct xhci_hcd	*xhci_hcd =3D hcd_to_xhci(hcd);
> +
> +	dwc->hs_phy_flags &=3D ~(PHY_MODE_USB_HOST_HS | PHY_MODE_USB_HOST_LS);
> +
> +	reg =3D readl(&xhci_hcd->cap_regs->hcs_params1);
> +
> +	num_ports =3D HCS_MAX_PORTS(reg);
> +	for (i =3D 0; i < num_ports; i++) {
> +		reg =3D readl(&xhci_hcd->op_regs->port_status_base + i*0x10);
> +		if (reg & PORT_PE) {
> +			if (DEV_HIGHSPEED(reg) || DEV_FULLSPEED(reg))
> +				dwc->hs_phy_flags |=3D PHY_MODE_USB_HOST_HS;
> +			else if (DEV_LOWSPEED(reg))
> +				dwc->hs_phy_flags |=3D PHY_MODE_USB_HOST_LS;
> +		}
> +	}
> +	phy_set_mode(dwc->usb2_generic_phy, dwc->hs_phy_flags);
> +}
> +
>  static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  {
>  	unsigned long	flags;
>  	u32 reg;
> +	struct usb_hcd  *hcd =3D platform_get_drvdata(dwc->xhci);
> =20
>  	switch (dwc->current_dr_role) {
>  	case DWC3_GCTL_PRTCAP_DEVICE:
> @@ -1643,9 +1673,10 @@ static int dwc3_suspend_common(struct dwc3 *dwc, p=
m_message_t msg)
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> +		dwc3_set_phy_speed_flags(dwc);
>  		if (!PMSG_IS_AUTO(msg)) {
> -			dwc3_core_exit(dwc);
> -			break;
> +			if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
> +				need_phy_for_wakeup =3D true;

You may only need to check device_may_wakeup(dwc->dev) for wakeup
enabled since it is at controller driver, and we only need to let
controller's wakeup feature be ready if needed.

It is not easy for driver to judge if all /sys/../wakeup/enabled are
true, consider the use case: there is a HUB with USB mouse on the
controller, if the wakeup is not enabled for USB mouse, the controller
will not be waken up through click the mouse.

>  		}
> =20
>  		/* Let controller to suspend HSPHY before PHY driver suspends */
> @@ -1705,11 +1736,13 @@ static int dwc3_resume_common(struct dwc3 *dwc, p=
m_message_t msg)
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
>  		if (!PMSG_IS_AUTO(msg)) {
> -			ret =3D dwc3_core_init_for_resume(dwc);
> -			if (ret)
> -				return ret;
> -			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
> -			break;
> +			if (!need_phy_for_wakeup) {
> +				ret =3D dwc3_core_init_for_resume(dwc);
> +				if (ret)
> +					return ret;
> +				dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
> +				break;
> +			}
>  		}
>  		/* Restore GUSB2PHYCFG bits that were modified in suspend */
>  		reg =3D dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 013f42a..ff02d41 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1094,6 +1094,7 @@ struct dwc3 {
>  	struct phy		*usb3_generic_phy;
> =20
>  	bool			phys_ready;
> +	int			hs_phy_flags;
> =20
>  	struct ulpi		*ulpi;
>  	bool			ulpi_ready;
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 1dfd024..ec183646 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c

You may split core and glue changes as two patches.

> @@ -19,6 +19,7 @@
>  #include <linux/usb/of.h>
>  #include <linux/reset.h>
>  #include <linux/iopoll.h>
> +#include <linux/usb/hcd.h>
> =20
>  #include "core.h"
> =20
> @@ -192,21 +193,34 @@ static int dwc3_qcom_register_extcon(struct dwc3_qc=
om *qcom)
> =20
>  	if (qcom->ss_phy_irq) {
>  		enable_irq(qcom->ss_phy_irq);
>  		enable_irq_wake(qcom->ss_phy_irq);
> @@ -240,6 +267,11 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  {
>  	u32 val;
>  	int i;
> +	struct dwc3 *dwc =3D platform_get_drvdata(qcom->dwc3);
> +	struct usb_hcd  *hcd =3D platform_get_drvdata(dwc->xhci);
> +
> +	if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
> +		device_init_wakeup(qcom->dev, 1);

You could let the glue layer wakeup entry always there through:
device_set_wakeup_capable(dev, true), and the user could choose
if the wakeup is enabled or not.

Peter
> =20
>  	if (qcom->is_suspended)
>  		return 0;
> @@ -262,6 +294,8 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>  	int ret;
>  	int i;
> =20
> +	device_init_wakeup(qcom->dev, 0);
> +
>  	if (!qcom->is_suspended)
>  		return 0;
> =20
> --=20
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>=20

--=20

Thanks,
Peter Chen=
