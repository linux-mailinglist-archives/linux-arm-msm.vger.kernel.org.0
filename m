Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9F1264328
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 12:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730336AbgIJKCN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 06:02:13 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:26367 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729971AbgIJKCJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 06:02:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1599732128; x=1631268128;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9BHLGls136Gg6KcgEPigRxw7h5iUt5xfNUxzt6zd+SQ=;
  b=qAHPkyhF1j+U58Ndx/fNAcPaCYABXiVH/le4Sn9RaekbPrZsdJjd9IG7
   hqKcxjdqJT7IRsWfAY0bhF6a3lrP4mx4pdCmE6gfThRDFjHP5GD9vu/KO
   NqExMhBa202eB9nSVHfPOMF/m7ycmVvcc1pW0Tx1l7aAIM+fpdOM6/p2R
   NS27RMd0zE/RG/5gu3LD5Tgbh65LDpZC2Gk9iLvIlCxpRwurgyk4SnKNF
   1XF+TtrYT384Y+h93+XjWX70qpMxX6ptzdk+piEfyuWqHF1B0BqQM9JGN
   FmGgTbBmy6P7vOrDsaDwTwkPuk5WBu3BWZiHnsAr8B4KBhi9cdoOeYOuP
   A==;
IronPort-SDR: Y5LU5RbevJD/mFfEWStWpWxse9gVpcmNxdxIhHjEOZaLn7mMa2bt33iGJxt7RFCcDBhlALaF0a
 rOMM5N3cg3LmEdQBrXW44X8M3VL5e6hVf0JfLAqE4Ut9H3VJQSpnhaGToFEl4HzTbn9AGv0rFZ
 MYR/J3w4JXqMN98x//PP8HKj59YGVVmHY+8oIk+/Vfxo6Ua/zMHsxeDZzu9v2Rg1Z7KHpxIOq3
 k3dttS0i1zkh6CpQfXYyvUfwQU0qNyXBFv/loaFnDwXqa5nJsEmFacy0GWwjxHtjJTQfEsQpLe
 gRU=
X-IronPort-AV: E=Sophos;i="5.76,412,1592841600"; 
   d="scan'208";a="146942068"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
  by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2020 18:02:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejTigs8TVP2QYLx4fse3/TsK5KwLB2afIvJboImvfXR2+mbPaZrl6Flib4zPVDzqSKK1/LldqcbnxJx1G5/eQ+6Wdt3nH7AxZ5aeHhS7ae3/P+UoJFRC+WZe2AxeY65ZAF0lEoDL2aQF3jd4ofxCEVTrIL2IPssw6Z7lM7dGTWb88iy/Fou0YRBK2JgzEZvHtzZxZqfONsGczinAVJbjJCyBfomQ5977685pyUv5c8XfCKgKxsqdQQMZWhbKSHlSU5ZTNzE5xwZKcVcUZWVcse38ZjZdZRVX2HLRkPTZsMrlcd/idDg2n2Rxh5BwDCDSsKUc/S9MM0D2XYLShtFBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BHLGls136Gg6KcgEPigRxw7h5iUt5xfNUxzt6zd+SQ=;
 b=f2Z5om7u2ni8ON+W2DjQLpb713/snEsug1YtIXDVaETMTZIO5qia3/uRNUrDQz4anUBlBr4wJhyxMuDg3wK0AgP/mRrEuevrJO4hm9disW6URm/hrjE9O+qgGnDmcyDONmP4SbqAtYIHqbF6es2oY0SWlr59buUIfXYE4QsqT2Y0WoPbRSJ5u80TUsQycYZ9D+uU/4bymG5lQ8NYcIaa0cRuRFk15xnUsB/4D3pP2ZiEvbSNG8V5phH4ddWLH8vfZhr1TZPuKpQghF6aq4mJ1rHLtYmocOshAadsrJe7ZYw8y/ChjONHZlUkxMhQ869D5N4PjC7/9tTLG3yaDn96Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BHLGls136Gg6KcgEPigRxw7h5iUt5xfNUxzt6zd+SQ=;
 b=c5wE3DeQYs8cJgVNr6hR7Zb+EJ/tO0SMEHcHb3XeUwrGFpNw2oqg9aYrjcT4GojzaV4DzXbwEA+VdOiOaw+dQOyh2KKJpki0jbJmX78QUIL7qXMjECcxdMM+KJEQJehE0lgKr5RcvrbKzYb+swdtpryqb48Q174mxfnU9ptbgh0=
Received: from BY5PR04MB6705.namprd04.prod.outlook.com (2603:10b6:a03:220::8)
 by BYAPR04MB5511.namprd04.prod.outlook.com (2603:10b6:a03:eb::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 10:02:05 +0000
Received: from BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::2c49:48e2:e9fb:d5a0]) by BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::2c49:48e2:e9fb:d5a0%9]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 10:02:05 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 1/1] scsi: ufshcd: Properly set the device Icc Level
Thread-Topic: [PATCH v1 1/1] scsi: ufshcd: Properly set the device Icc Level
Thread-Index: AQHWhxG+0K54wBwZM0eA3rPrh1VjiKlhodNw
Date:   Thu, 10 Sep 2020 10:02:05 +0000
Message-ID: <BY5PR04MB6705A865E35CDA367249DC4EFC270@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <5c9d6f76303bbe5188bf839b2ea5e5bf530e7281.1598923023.git.nguyenb@codeaurora.org>
 <0101017475a11d00-6def34a7-db5d-472c-9dcc-215a80510402-000000@us-west-2.amazonses.com>
In-Reply-To: <0101017475a11d00-6def34a7-db5d-472c-9dcc-215a80510402-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2a00:a040:188:8f6c:c9c6:4a8e:98b2:ddf5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 00827195-87a2-479a-de5d-08d855709279
x-ms-traffictypediagnostic: BYAPR04MB5511:
x-microsoft-antispam-prvs: <BYAPR04MB55114B9A247FF534C2081332FC270@BYAPR04MB5511.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QUifcPxqtnyBSf/dStbajTjGLarmTOmlaEDiwx+bLrqZz7SXfwwrHQcR/npx10a4sqed6cIIBAwFmti2i65HeEVA5ewq0DBQmMlyv9DxZodCdRrJO6bhCpdpjk20/SeIVz5DwT2xEDOPKUmtEjq/60zUwNLnagoaVcqL1LXR/w8aYxO3oUq/s12hOwxiR5ADdhb+kMrj3iUaQJaxfXa1DV/vcr9ZTan6tuWZ06pXT3haFx/PMaybCGOPygmHNCreDYX95eW19RXiAJQM8KVK1JTRQLUvxtUUQFzez1gdn6jwUMJIhTS3Q39FwPf1+9Vw0/+a3I7tJrnr6Ty9eKv8BA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6705.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(53546011)(66556008)(52536014)(478600001)(316002)(6506007)(66476007)(8936002)(4326008)(7416002)(64756008)(186003)(66446008)(55016002)(4744005)(33656002)(66946007)(71200400001)(54906003)(8676002)(9686003)(7696005)(86362001)(76116006)(5660300002)(2906002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 3awd6YyFeeL/c8pOCgwLFjkOqoi0zh7bvyxMvLLvq8kXU6/6cLwQreIpuJGRBka8hwVwaRwOjp0cynYGlTSEHB41xizjwP2jMKVT/e+lY3QA1yZUFDpyUetcTD8zTjHkUdMfY6dcjSUZ6u7C79szPaa32usUhF7sS0/WsWKSw+v8ZmafDTH1mf716klDi9xj+5wiAfHA0TBReYZ5ieWM4Lqnizt5sCoLeWy7bg/pHrSEm0jymfC9ioj11hIffJD2NyNzUOsRIfeYYykhSe6XpkyJ2yIafL632yOS3UMNeVgumzCBeh5QIqma+1jE57VujZGZDPPsljlfLVBgSbq9jcJ3JsE7NmgdQ98SX56eFOxF1cZPXo5zwkGtgEwtKT49Dud8q40rfRKTes8PF4ht5sdujuf7ESEyM2mVOEZcGjnINyWXsUyF1LlySwyJvY+SzUa6h9E4wZLxHIli5TiiV6i2A7l9VGxzM2Ym8xJJ8G2qHTaaOBcoAsInQceOS9reYW9oPLz+KrckNFPrcg1WcxTFEazU5bcu06nC9TOB+OYJkB8MXlyOPePhCHrrLdsTa790Vqm0hpaMai1J+EgEQPngwH4z3djFuUDpLjrHFMmRhHuf07jeYNwFWbIImML7xiyODyqbq0rM45Ivyac3r5YyYlZd6P8lPMI8KnrizRvBfjPpm9syx0RL3bg8g+HW9t6VhyD4mQc2yfmw7hw7Fg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6705.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00827195-87a2-479a-de5d-08d855709279
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 10:02:05.2743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 74za/KBpCaFGX3q6efWR77VF2L3Ra6YxjRg8kLfPgdTckwK28uvWD06viut0rRyknOqZOnU0nh5JjLsA196Awg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5511
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
> On 2020-08-31 18:19, Bao D. Nguyen wrote:
> > UFS version 3.0 and later devices require Vcc and Vccq power supplies
> > with Vccq2 being optional. While earlier UFS version 2.0 and 2.1
> > devices, the Vcc and Vccq2 are required with Vccq being optional.
> > Check the required power supplies used by the device
> > and set the device's supported Icc level properly.
Practically you are correct - most flash vendors moved in UFS3.1 to 1.2 sup=
ply instead of 1.8.
However, the host should provide all 3 supplies to the device because -=20
a) A flash vendor might want to still use 1.8 in its UFS3.1 device, and
b) We should allow a degenerated configurations, e.g. 3.1 devices, that are=
 degenerated to 2.1 or 2.2

That said, I think we can entirely remove the check in the beginning of the=
 function,
But not because the spec allows it, but because each supply is explicitly c=
hecked later on,
before reading its applicable max current entry in the power descriptor.

Thanks,
Avri
