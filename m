Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C911C65D3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 04:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729674AbgEFCSK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 22:18:10 -0400
Received: from mail-eopbgr40077.outbound.protection.outlook.com ([40.107.4.77]:22729
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727989AbgEFCSK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 22:18:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmJRnm/sghv6CQWdWrE0HEvTvDdSVXrs65v1zoTiF75mklpDRLNsvqqS+iHJ2N3dAr/hn/b6lJTM7C1gqR1+mheoghu6wuyD2Iu6eoon1eLOqKbFsH0G3/zqaVjXTOs1YbWQ1H29PGrk9TkeL7LM20tmgoRmoJTtAJtaH9ScEyooxFWqaR4rSEl+Vh4M7VdU20QohJH3MFD+eDQLaPhaFlwMZLvlNQKdQaer/6CjJeDpHWVmqj36DY7HbZwJFEI2KZXcgc7Ji/g1T/8hQapcwPX+uc1vOkb0Ndv32JjIGICPYkXlhUAke/fNKqWYWy0vQh8cBW+50C/ZJdXujgSJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JH8eqxJNxiGkVfLJTbAtLPKdQs9tl6OGAPqJLx1EUx8=;
 b=KBSR9EMvdUxCRfDrLQ04IzHd57laqDahYLGwK6ZrMU7HzkUXNFyCeU/Olud3D10N5ACkifUlcQ9BzUFATsK6tPJd+WGN8u3DJ4nOjNn05PQkI6RvcdXwg+wcXky9QzMLXHwE7tfO3u89zqQaVFQ1EvYisfb/coI93OV6ICevqchkMYddSm+ADU7XJPdoyoKOFcb3YCsgGZLhJ0CjjuWQVwVX9JSXjJoY+sFlUCGu1cbnv7WyWaDLDcAdBYkZszQNROwqT3p670FHX4gmF1Dx65ZhHAbnC1alc0v8r2ZsaqdjH6Ixrv4OiLGhqtnKRbidfNebHphphhhuSRpuALJ96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JH8eqxJNxiGkVfLJTbAtLPKdQs9tl6OGAPqJLx1EUx8=;
 b=TZFqXT7loHRQFLzF2M04U8GwP7MVqFHzgkn57c9tSFGNJyYNPdX8AbKo+Uc0ZIS8PLbPxYomieOpy+eRYA/CCOWkJUfQ4KemdbXXsQjga6+HZg1YilnqR67Etxx4aiZ9x8IVFyX3UHNul+CzjeQE1sbA8P/GXkd3jBMnAk79S1o=
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB8PR04MB6860.eurprd04.prod.outlook.com (2603:10a6:10:112::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Wed, 6 May
 2020 02:18:06 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::a8c8:d7c3:a11e:f104]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::a8c8:d7c3:a11e:f104%9]) with mapi id 15.20.2979.028; Wed, 6 May 2020
 02:18:06 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 0/2] ChipIdea USB role-switch fixes and tweaks
Thread-Topic: [PATCH 0/2] ChipIdea USB role-switch fixes and tweaks
Thread-Index: AQHWImVm1OV264f+60ikb7zYfizcgKiaVHqA
Date:   Wed, 6 May 2020 02:18:06 +0000
Message-ID: <20200506021831.GA30237@b29397-desktop>
References: <20200504224346.613377-1-bryan.odonoghue@linaro.org>
In-Reply-To: <20200504224346.613377-1-bryan.odonoghue@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 08ec73b2-02fc-42f6-98ac-08d7f163b6b0
x-ms-traffictypediagnostic: DB8PR04MB6860:
x-microsoft-antispam-prvs: <DB8PR04MB68603A2AFCA90B1224E6D56B8BA40@DB8PR04MB6860.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YYiZNNvAMJdN8GQWgHLFoDq8XhN7kPjW0qkCPaauoc5Np070SVmVMhiOBQvnKcYPFcsAVImYKA7o6eSDR7S6HZsC50tVFr+C0r7rksaSyqIwTO1AuNJSkQ5kNJ3SsuKdJc86lJu5N69h03kK3uJM0a9gtGhicCvfdY9Thxx8EZyfMxnlJ/50bbwfEY85XQb7MFmw4uGpfZPAXbOBR+Whu2tbM4K8xRBCFBj+YPOkFGfJJl+pZjHF+TzxOk/fSOPBX1OrVxLV8Rbj1p2Uy5+XLHv0itiItPSXiQCVMkMIEXBu7VUAI2Fe6uiELKLBDx8SHE/qhls3j9i712+xFr3FdpM5YNo6zMV8Yk+6LQchO46IAjlQZynrf60GeWxF/zj6m8QY2m+sY6/L38k3sLln2eIGFm6WFWxQzqxpJPMrWZovVlRZ0vPrDPRffFLYb24DX3NzJNQYgEXGLW1N4IZQQP6e5Mx9nCYnWa+DtW2ESY5ACz7rm23zs/pRe+kKGa9NzCgpr/31/1ZbnVXouEZSKA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(366004)(346002)(376002)(396003)(39860400002)(136003)(33430700001)(86362001)(1076003)(5660300002)(4744005)(71200400001)(91956017)(66556008)(44832011)(76116006)(66946007)(66476007)(66446008)(6916009)(64756008)(33716001)(8676002)(8936002)(6512007)(33656002)(33440700001)(9686003)(186003)(6486002)(316002)(26005)(53546011)(6506007)(54906003)(478600001)(4326008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: y86Ck7C0MkqHmfkH6O478yTp7WtL7378CmEGikk5cL+gspvr6Y2cWidAoBQab/wB2h+g31TVhg8pOmuq72EbYdgqqJst24NwLta0SDRqvklGInvwca7iNuNBpJUz6ohVCUMpzLChOowV6QWXCMYFXP7b1ylMGmAzKPgimIjtpVVQX6P6O9egX63z8FrtDz0lWnO7+DUZ4q2mSkVckIlmfG3uKSDOZiyqMverVmRDV/ReEDW4ULhjOyAJXYZkoizT3Y2ciU7ce3mO37sp6KQ6fvCj+DEYjIk/biNgRfk0giCTD2Oh4v7x9GwBODrqCmHVbXBMxWN9Hxq59hwOPoIAqKsGbDbw2POXsgF5vp3FeSM2py7sDpEj3JKOP+qXpUnWH2UItObDuOya59PZ9Zjk/xDAO3h82tC3hEN/h21U+IV4jRpc5xWuxSbL4XMWZ1IKtlGH4IP9NnYqKvKabaKQjg81genJKjzfeu1oDheaknBOew6GeUC5wRklw6E2kVomADHPBLwI2xOIesx2OZU0DgyGuW8SgM6yH7qinpXss6zI8ih2Sp8xtf53PBQDgqxeJqG4ci/E1sAn5GuZOqJNpHS5ZlNqMF6P1GmfZNyP9s3pGxstJzUgGd/w1HSsH2a/o1OIUa2ImTAOz9WtqpEOXmCGhoRA8JzEw4bJ38xxJGiBLBM+M7/CYfZKSYDeI/y0f1CPq8hYvvn1xtNyIAa3xJuAJY/OgTul9wubAjjiPGypmBjCyKqX/LRcrWuzNIDmOi62JJoBXvFwMeOx7dSdEIJ7+zM9irOmdCEJ1R19F40=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <408BBB554F672D4D9ACED128C58FD8FC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ec73b2-02fc-42f6-98ac-08d7f163b6b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 02:18:06.3385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: loeLs3u0zFYZpFL7U7I5PosQT4serzC8aRpN89qMUxtvIDlXtFlDkMblz2oicMRTV9gudy7k5it8SAOCvSTnnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6860
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-05-04 23:43:44, Bryan O'Donoghue wrote:
> This set addresses two things:
>=20
> - A bug when using the USB role-switch API.
>   If we are using role-switch we still want to switch HS_PHY_GENCONFIG_2
>   bits.
>=20
> - Adding the flag to allow user-space to control the USB role as other
>   controllers already support.
>=20
> Bryan O'Donoghue (2):
>   usb: chipidea: msm: Ensure proper controller reset using role switch
>     API
>   usb: chipidea: Enable user-space triggered role-switching
>=20
>  drivers/usb/chipidea/ci_hdrc_msm.c | 2 +-
>  drivers/usb/chipidea/core.c        | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20

Applied both, thanks.

--=20

Thanks,
Peter Chen=
