Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6752571E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 04:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbgHaCaA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Aug 2020 22:30:00 -0400
Received: from mail-vi1eur05on2048.outbound.protection.outlook.com ([40.107.21.48]:40737
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726940AbgHaC3x (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Aug 2020 22:29:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKY3Nxduz2KFVnaxDsRC6stsqol+xhkaohV4abMtm5mjQh1a2HMPZ41t4LUjoomS+Nwe6IYEufHQlwSzb4kSnP+IKfCvKazj5VlE8z7UUzXPpjF+WqxoG2IKIBJfNGuoK/9ebBzY5ooyu2a4ymcyooCShsPRgiH3fCFS48HLVOqT+oUPZENnHN9kCGTwfi9ReTyUKIX+zbh0xoJ+zI0R3jsklkOO0zqblgf2gOo001oR1+D8WVKKaBB0MKxw2pt4fkUvab3P5cKfpyq4sKIbG19Psj+cgKRELW8M0zhZvjXKSX25sdc9d/JYxeijkp5pM+aE9fJPm+5W9HpD2QBhbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtFXeV3h5SXLvBEWDjcWbCjKLzEdW1nSjJEWFaeswLQ=;
 b=eWPbKG0tgv1qpZbnCjS+QMlDsz29K5f1ze+roWGW0H1wlmu762kdrpvXWW/VZcA8pl7Y57iYVVq7l7gJ5e1oGiuf8G3zg1xm1c8BbJu20c9LOgnB05WOS6SLPFblDN6cWb9VLcPy4oMmrk7SoaWwcE1nih5gFUcOrGSJTDqYcZbvTvjykojmwRr/1HPmIoHr9lrLwGWh1RjpPDx65HoaqgrHK2MdFOJy7V3aJR4+B/uK9FhQVmwQUck7PZ/RPJhuwqLpu8ltkl49qW10pKaemRp8kLVJDvUWLSfruutBbdk30Z3MrZ2T1fBR7kh4FxsRuOK0fJn0U3lJhFR5mWCiWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtFXeV3h5SXLvBEWDjcWbCjKLzEdW1nSjJEWFaeswLQ=;
 b=MXbNIGH6K2vXotCEKldT/8seQ9NOK7CNoTCSwu35/MtfOY96zHkuwrCwxzb1X+hV52EKdtQ6A0vKM2o1kCI+BWVO9NuDymKIhSJoNzGFbqg8w0rTya6yL70WapCvlf7Vo7VrVuXkFaXf+bfbCxcsGY/vYmHr0VB6ZNi+D6/WwVE=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4245.eurprd04.prod.outlook.com (2603:10a6:209:4f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.24; Mon, 31 Aug
 2020 02:29:48 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 02:29:48 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Wesley Cheng <wcheng@codeaurora.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>
Subject: Re: [RFC v5 4/6] usb: gadget: configfs: Check USB configuration
 before adding
Thread-Topic: [RFC v5 4/6] usb: gadget: configfs: Check USB configuration
 before adding
Thread-Index: AQHWfcmPpEbUbGD8pEumd+WlyoI7WKlRgTuA
Date:   Mon, 31 Aug 2020 02:29:48 +0000
Message-ID: <20200831022825.GA15756@b29397-desktop>
References: <20200829055846.19034-1-wcheng@codeaurora.org>
 <20200829055846.19034-5-wcheng@codeaurora.org>
In-Reply-To: <20200829055846.19034-5-wcheng@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 63e33dec-9300-4b6c-97cc-08d84d55bba9
x-ms-traffictypediagnostic: AM6PR04MB4245:
x-microsoft-antispam-prvs: <AM6PR04MB4245FB348F7E6FF8BC088A7B8B510@AM6PR04MB4245.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q99bLq916nXPK3UQPJdEdvJ+ATD57IKr3T2UVLF5av4yJ2hMveBplHfe11694I6FkLvZey5N5OB1PKn/JX6xEHGOrdnbuDAjfS9BOTXcxzb/l02YIFjqWdWvkFaIuRF5ZrD4rNaOnQ2PoUj/25Hi82VmjfqUhUZzpMh0N88Mtu6UyFsvIac1voAhEh7N7EvH6LfZRJk84F7SBn1voZKdZq6XynHJiodatbAkIpX2Da5loAPHbut5aiAphS7lWDmBXp5nrhoJKpWYdQ1Iimx6NxscXZlul8s8EDbTDGovF3gu5DUo6qRZ27IRcrsSE0AX4GdtWLIq4v7cRNrFRnerzA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(346002)(396003)(136003)(39860400002)(366004)(5660300002)(66476007)(66946007)(64756008)(44832011)(8936002)(8676002)(6506007)(53546011)(6916009)(33656002)(7416002)(66556008)(66446008)(9686003)(83380400001)(26005)(316002)(54906003)(186003)(33716001)(76116006)(91956017)(6486002)(6512007)(2906002)(1076003)(86362001)(71200400001)(4326008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: LtXs5Kz9uZw+UQN3a3EI7qnWmCPH+aYPsNK4Anv4ed4FW7yLJ1Au6jbkPwVLXkwVn+URujyuN/Qh9TP31+tWlR+NVDIs6Ka8TIDuvNpaPmgivD2OX0G/fHWqieXjBRaVp33Rr2jclmEhppsvFwp7MgNJ2UHjsR8IfD9V1eeUeI0agTCdZc9kL+kle41YdEcpYwYji7ypA2clcPuwi42DdAPN4/gzdFXrrz0ex++TilGeAXlq0h4AjgTp2khGvqwSb+emqD9heX1+OyG/Rp1PO6PD8zwTKdU9BzxT1QD3XBYLLwfMl/Oaz3fjSLC3uqyeT+NyW4XUo6csTIjSeXdVfhWOTakMJZbiuICEj3hyhDeZKa/x8RI/gE+ZEEnb7VMeEGoPUeWjKAO/ulNhT9uYcESeiJfdEWTQQ5kScGFQp0klQvpwD3RtVdBDVi7/rSUVec9nryFpTKHDLSHSXwn1Ybh73Crnpfrx2fizZufhOOcX2z+Bf8nDjiIUzxVUuQwWs6i82mtYJmv75XD1VdcTj7uZaISZuU+ZCdjd+cUTBBPkl3L9FgBe2ptAuoj5GsKmh4jCW3vc/PWkvjFUW4tiH/SEdl7v345im9G/v4363R/ApgsOSxo2hUUKVizHAwggX/xeBvdcwZLoQXtsmKeGog==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2AD5C8FB23B1BA4596D5507D200A053D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e33dec-9300-4b6c-97cc-08d84d55bba9
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 02:29:48.8260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ymrFU8IPCtWlsG23FqGzwkCfCw+P5YA98o+nGWfI1m6L9cr9/MAydpDNFuwYNm51lf3TZ3ZyDuW0CnsiDsuJ1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4245
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-08-28 22:58:44, Wesley Cheng wrote:
> Ensure that the USB gadget is able to support the configuration being
> added based on the number of endpoints required from all interfaces.  Thi=
s
> is for accounting for any bandwidth or space limitations.
>=20
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/usb/gadget/configfs.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.=
c
> index 56051bb97349..7c74c04b1d8c 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -1361,6 +1361,7 @@ static int configfs_composite_bind(struct usb_gadge=
t *gadget,
>  		struct usb_function *f;
>  		struct usb_function *tmp;
>  		struct gadget_config_name *cn;
> +		unsigned long ep_map =3D 0;
> =20
>  		if (gadget_is_otg(gadget))
>  			c->descriptors =3D otg_desc;
> @@ -1390,7 +1391,28 @@ static int configfs_composite_bind(struct usb_gadg=
et *gadget,
>  				list_add(&f->list, &cfg->func_list);
>  				goto err_purge_funcs;
>  			}
> +			if (f->ss_descriptors) {
> +				struct usb_descriptor_header **d;
> +
> +				d =3D f->ss_descriptors;
> +				for (; *d; ++d) {
> +					struct usb_endpoint_descriptor *ep;
> +					int addr;
> +
> +					if ((*d)->bDescriptorType !=3D USB_DT_ENDPOINT)
> +						continue;
> +
> +					ep =3D (struct usb_endpoint_descriptor *)*d;
> +					addr =3D ((ep->bEndpointAddress & 0x80) >> 3) |
> +						(ep->bEndpointAddress & 0x0f);

">> 3" or "<< 3?

> +					set_bit(addr, &ep_map);

You want to record all endpoints on ep_map? Considering there are
four EP_IN (1-4), and four EP_OUT (1-4), what the value of ep_map
would like?

> +				}
> +			}
>  		}
> +		ret =3D usb_gadget_check_config(cdev->gadget, ep_map);
> +		if (ret)
> +			goto err_purge_funcs;
> +

You may move this patch after your 4nd patch to avoid "git bisect"
issue.

>  		usb_ep_autoconfig_reset(cdev->gadget);
>  	}
>  	if (cdev->use_os_string) {
> --=20
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum=
,
> a Linux Foundation Collaborative Project
>=20

--=20

Thanks,
Peter Chen=
