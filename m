Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06771DC168
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 23:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgETVdn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 17:33:43 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:30356 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgETVdm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 17:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590010421; x=1621546421;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Co7SOBZeBIcC6AaYPGkCwGxunR9+98vMinbo5IPtjf0=;
  b=HPI0qj9a2MtY/ZEeQjdS1hd8URczJ1T/MINrDNQXB9sSXe/VMJ5Wnxht
   5ao99vEVI/1oxovN3CvNYnvJ1TujP406u0ro8pnSK9v+Oj4NlQ0fJfetG
   cvqR7cFMZySDXLnDZbKkQFcVuyTY7vsaezBPpL6i70Prt/Jxr2uK0423/
   dNmfoiDEWdllgCVs+X0Qid2yDY1WL62ZVCVC/A7lRNAQm4qkC35ngY/qX
   xii9RoyyJZuNXDArg0ZmOc/NKBr56fFcYw8idgqnMFIzn+rtYaXNSCQ4F
   Xpv3oK9GKdWV/WTC+VgCRVOfAjC56LNztoAhCngiWEcM7JaZPUHlTeSf2
   A==;
IronPort-SDR: X0OgFjqOK4ICUPfq3E/2KX+72ZGUnrEfruHdfrwYZG7q6E34+QtqOjyTOWRgIJXEMpdBTvwVE3
 M0FC8eWpocrpZjeFLju5UUB84R1H9xGRsLhB5eGl3SqYu/+o21HYg4m1Z/cORNtQLXkfl9Z4j3
 0uhsChMabzVdDeE0HRJPfAYInqbgPEJPHVg6l/3sY53HYQmw+bTTP5Mmfs+4BClpXsknfvioqt
 IZVxr5IDD2+IEaZWd2uCVjlf7Rb0kQFm/6ij+EOZBxf0yBVe1845hH45IOpHEqgV43jnyHIPaQ
 bZA=
X-IronPort-AV: E=Sophos;i="5.73,415,1583164800"; 
   d="scan'208";a="138486720"
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
  by ob1.hgst.iphmx.com with ESMTP; 21 May 2020 05:33:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNdv4WZomxjz1qYrH+4/nxjqjshIXvYPKsTWgMvrlqauUjUunuc+BrHFaLiI9gX0AIBBZr8L4ip+XTAtNGIEpBEpB5B/HaTVLgwhudITt68/FlbbpojS7T8WeJq1KYGqROdv1LxGA9tAczRLrF9ikokaQx+z/SooM23j98fUBAlus/S3a1JLPkVW/Azo3istu0XripeA+E/fM0eE41/qt5bjqfH37EfCxG7QlNbnlz0GgOIIqYx+686Op+glBNOCgXyX5J5jyXzKI0L32nHZ+0MhQN7XXS7Ot+3mZoa/T0zq5VjPV0jysV4digtKQnYCHcZu5tT+5kDXBBRwXv0Ddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Co7SOBZeBIcC6AaYPGkCwGxunR9+98vMinbo5IPtjf0=;
 b=Slq92VDExhPXvY6ZJWr0dYhfBkVXm2XSaIrrjszNP53aVpiuU3UwrGHyAsBpkdYtqar+I0tNSqVmjuzmB+nutChGdqTX6KUYEDUY25SIy2m4ExNF3SKcsrnkSUCWzCjSM45AzJHzPbA4/6KTN1VfeWzj12jZ1i5WmBbuLLT/lz5Af9iIxclEeeoeijt2aMYZDrn9b8vMN75yYtBDNkkX9Y/MmZH2UN3NYc3EFTamMuCBhSviY9/LmtLb0pEApk7xyUlYc0kwpUTFyl6nrPJRww22KHeHMDUyJnM2+VUYull57YkW5MZM95ODZEgIbbRhanLzNjpclHxOgTm2zTtT8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Co7SOBZeBIcC6AaYPGkCwGxunR9+98vMinbo5IPtjf0=;
 b=U1pYvLoDJmv4hBuLiGsCAmWHwEDywPYH19XGoudr1gPVQycuoKV6LqMOwUTvZCgXDkqaJdkPMJgvlM3sCamVFjnc4vZ8UxSi9OnVru+rRcYcFPjsO84womkuTYTwkdqfvlhiuDNZiE/41CnVvPQIzsUh07b8zu8jZRzBObRhIwM=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4094.namprd04.prod.outlook.com (2603:10b6:805:4a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 21:33:38 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::9cbe:995f:c25f:d288]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::9cbe:995f:c25f:d288%6]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 21:33:38 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "PedroM.Sousa@synopsys.com" <PedroM.Sousa@synopsys.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 2/2] scsi: ufs-qcom: enter and exit hibern8 during
 clock scaling
Thread-Topic: [PATCH v4 2/2] scsi: ufs-qcom: enter and exit hibern8 during
 clock scaling
Thread-Index: AQHWLs+aURSVuu3/rEe19CGhEeTU+aixfJxw
Date:   Wed, 20 May 2020 21:33:37 +0000
Message-ID: <SN6PR04MB464071B647084B0EB111992DFCB60@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <186237103353b5a79c3496e619fca894dbc78600.1589997078.git.asutoshd@codeaurora.org>
 <9b67c25eb7c0bf80075b36660aebdb3788207353.1589997078.git.asutoshd@codeaurora.org>
In-Reply-To: <9b67c25eb7c0bf80075b36660aebdb3788207353.1589997078.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2a00:a040:188:8f6c:2c4a:d7ba:2b72:69e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f5411620-9b86-4e14-8810-08d7fd057546
x-ms-traffictypediagnostic: SN6PR04MB4094:
x-microsoft-antispam-prvs: <SN6PR04MB4094F177058F25B294562D88FCB60@SN6PR04MB4094.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04097B7F7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fUUk79Y//9GonvIm6ZDKEO6XwDnWqBHnUDZJ5Ig9CYSxir23wsz0AMaMpocbcs5/fNHDKp6uEfTWv57Npu8b/7YyIIKbpyf5UHMD12YcuwF9MPhICYNwZY9j2mwsHN3hWXpoakH+gb5ZP/nCYL3ZPuLnb+Ofw+LGZu/9wO5JoZvcbAhLCXnUPCcMJYB3vz5pfDH23z5tu2Y21j0LZIEMcqsM7aPR95Lci3bGjeJHUtGcs5UIxE1EPjpTZ4RrBnRrxfCFr/KvFXUslmi4kWddo3w88B4LaqN2868baUwrHHFUJwizilZTal5+/gdQ3fx8Dgej3n57X1PSY0nGyfSxgA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(4326008)(6506007)(7696005)(8676002)(86362001)(8936002)(316002)(66556008)(66446008)(64756008)(478600001)(186003)(33656002)(2906002)(76116006)(66946007)(66476007)(5660300002)(9686003)(52536014)(55016002)(110136005)(54906003)(71200400001)(4744005)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: l4FMCDACgW8ph7Jz1X9wfRSDgZY3w78AY5tvJdp8NQT8heUVhSeeM66CctU8gJuu9RDdZKmQFcyldalh+vkBKRT34Nko2FCnEiraewn1MtQFuWKNCUECu8d51B30Sx9FGV3m7VUMON93qbz63bsmNHrl4vBEkWks4aRIAD+XxyanBnV5t2kSoEBdUuRGuCEBi8gAoIlZ95b0GN6NkmRdQ0tBjuygSDNEap+vfWKemh9bQkGyz9kKIQ7h1KooYcTaSfIWABUtZHsLRIh4sPmve7QQVKsTMhaS6Z5QNCdo7g37bLQsLKle0w3+f7anNPUKbXq/TGbGnhuofPfX2IQ7/6QURk8s7TpOqJGyrdDoG1R7nIVXNEW6OXCr4EF/NokuAnMWyaQya54o8ACXWIUgqg/H2NsVfGcLIQVGQ1TyeNo2/659sHGwNxjXGHEgDZdx7b6y/lRO2RTNTfSI0CTSi+52bfmeFEhgZKzqhnwG4s87ENg3nDXyi76NNNQev4JMXXeudWRnhfiL1d3CMp5bgvsUwaMAJUxu0DYiNBdsvp0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5411620-9b86-4e14-8810-08d7fd057546
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 21:33:37.9425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dx/cRUF8+Tf13TauzPNthf0Co3DCQhZC45fxzoDQkVBLQiJPg+FHYqqJiwHAlbuItyEgN5UPRtv8t2s3egB4yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4094
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

>=20
>=20
> Qualcomm controller needs to be in hibern8 before scaling clocks.
> This change puts the controller in hibern8 state before scaling
> and brings it out after scaling of clocks.
>=20
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>

I guess that your previous versions are pretty far back - ,
I noticed a comment by Pedro, so you might want to resend this series.

What happens if the pre-change is successful,
but you are not getting to the post change because, e.g. ufshcd_set_clk_fre=
q failed?

Also, this piece of code is ~5 years old, so you might want to elaborate on=
 how come hibernation is now needed.

Thanks,
Avri
