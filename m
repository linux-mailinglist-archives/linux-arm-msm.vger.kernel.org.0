Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6977619294A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 14:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbgCYNLo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 09:11:44 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:36885 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbgCYNLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 09:11:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1585141904; x=1616677904;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HVv5YclHeLLcNlH0AGIMT+Jyb0FrttGbX/9YbXsTtI0=;
  b=Wnkn1AXNaYDSTaUo/l3MejT0k1q8Bw2LLUFeq1mXd9Wdrno769N6Sth8
   WvtABMrFiBktoHk6+lGNRH1zR0nEezODkszPPUUNwlnmEvEFq/2Yx4qmS
   FJBSzDCV1X9/ZyUuGppUVfhro/mlOVnxuzB3L1tsweVBCCYVBnHwTjA57
   WnpyGB7Cme1djr12+OVKLmmMCAwh229jpo0mwD/UsVbg3Ie9sqz28xO1U
   3Yg5GJP10kNam6sj5s9Og78IBs5/AaVzt9PxjYbDsEesxoaSYiO5Y/rSK
   Ksvupq/kzk74NEyHeZigrRz07v7JIufsvfCIv33FKNy4ooBpXWSXe8+oJ
   w==;
IronPort-SDR: OBuae43YG4RBtCvgV9M3BkjhaPL+t8LQyLrczf98JZHba4ljFT+QnudsytwBvzdJreS+X5k8wL
 XNjo9gLTvbiiqU3OggvNoPHKQPQHLimzZsbe0auHGeX2S5hFmJiLFu+L+TYW6h73jFNWvkZXJf
 OEgCco7M/LXnO3Z6C/OSZiVrFe1XYWR7Lom2iux/7Cj4Yq42bsNqTjEXjLLq+0sOif9eVew3xk
 ouinEg7/WE8vLhHKHJ1Om/OdOk+AL3wt3TCcZh7Og2njK4RD5MFtIcPPeTxvloIdLFE1nr36rz
 FUM=
X-IronPort-AV: E=Sophos;i="5.72,304,1580745600"; 
   d="scan'208";a="241957517"
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
  by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2020 21:11:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BD+cwA7pa3Xbq9uKch94++28GWLfIxj4Omj0U3EmDSQYFOjCipADBZ85cmPR4IBCu4z9FAKjakzSEQ4kZVffFfgC00nNTStDfcNTzF0ugvxmGxX5HBeAVFqiTQCzV+MImHBUC6o8+CdxuwvjHjdhSO2CVAOG+LFyqTUsUZ2S3/kx7yyRkdEiXhv70DllTm92w42CIcmpK5ycTVOtWaurTeqXKBmomReo0nygB/aOJILZtggDJWkfJ+aLwVwycIK6J4byHoBpP7n2Ht+dHh16BUWHKOalfp6REioyYN3Y0kF5Sl8mO+jvSnCJHbdDfBiT4TbLuuJry1jkw7N9u+z+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVv5YclHeLLcNlH0AGIMT+Jyb0FrttGbX/9YbXsTtI0=;
 b=BtRGp3+5M4DMzzs5Kv82TgqE3PWQvQNxXVp8oSydE1nZszUt63bPsJ4yECLVM0LZtkl86A7HqWx0A3bCnJexBsooywGNz/5XqRvF1e1j2FUy/8KA7tCQ0Opx14TR6rjfTonf6JHXBxAnbUtwNC4egfnZhQxevVxMm9SlXzvr9YRg7MxLGvKEiLjuSkZ+IeIxyoToOzWiJp9oNpqLZzFn7TtlMbmXK7d0GMTAN247gCTixdnao50Vv85+6O7ZlVHK58NmF2X8RVSRsQNy5eaGNXJqz3Ki0HD0oEcKbw7ttQI034o8mSApE2CWnFYNy23IFYjq9Pye/6ZF8PzW2KfOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVv5YclHeLLcNlH0AGIMT+Jyb0FrttGbX/9YbXsTtI0=;
 b=oLiBjC+j0I6A38/ULuUh4QNp4bbZFFbmv7eD+xnPJk0XKFZ5mRA0m71Jmzzp7ZpxNTbj2NzM7x0AluGkUIoD2SHyieR9Sf4FK0dm9hDHLX9QE38IJPLCSyVRTQ7u2UBLVafb/AQCagn2ciiXrYDA5DriDGIsoplNzDtKu55DQNw=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4256.namprd04.prod.outlook.com (2603:10b6:805:31::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Wed, 25 Mar
 2020 13:11:41 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b%5]) with mapi id 15.20.2835.021; Wed, 25 Mar 2020
 13:11:41 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 3/3] scsi: ufs-qcom: Override devfreq parameters
Thread-Topic: [PATCH v1 3/3] scsi: ufs-qcom: Override devfreq parameters
Thread-Index: AQHWAjlcpqA7jaPL8EOL1y/uhTivaahZJxag
Date:   Wed, 25 Mar 2020 13:11:40 +0000
Message-ID: <SN6PR04MB46402BF8525B5BEC29B81858FCCE0@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <ebd9ea7d0ebb1884b15e4fe7e3e03460c1e3c52b.1585094538.git.asutoshd@codeaurora.org>
 <8595b24c49bd84974ced1fec5a8eecdeeae47746.1585094538.git.asutoshd@codeaurora.org>
In-Reply-To: <8595b24c49bd84974ced1fec5a8eecdeeae47746.1585094538.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e649e846-5c8c-4010-5f1d-08d7d0be0f0d
x-ms-traffictypediagnostic: SN6PR04MB4256:
x-microsoft-antispam-prvs: <SN6PR04MB42565110B79E77BF1891270FFCCE0@SN6PR04MB4256.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(316002)(54906003)(110136005)(558084003)(9686003)(7416002)(55016002)(26005)(186003)(2906002)(33656002)(8936002)(71200400001)(86362001)(66446008)(5660300002)(66946007)(66476007)(7696005)(478600001)(66556008)(64756008)(6506007)(4326008)(52536014)(76116006)(8676002)(81156014)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:SN6PR04MB4256;H:SN6PR04MB4640.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e1orLibYq0GFqAGWs5y9XYEjaOBRHfORgQkkU/C9KLpnkiWvwYl+A/gvUp3Z8g/OYAinrSZCfEC3yPy+nq2Z7uT4KJk/KpUDe+P2ezKqhaWXW1O1B2k6Z6uRe8R1cG2N4Lc0PVET4TzBiz12Ti7Yfqt2nTU3yl7s2KXHZMp1jFHuEJWwox8dWPv59NMO3oaQetanrnxww9tTqwjGjuSClJhmwTxZma9DZqASKpppnyNnpts2Ivhqe7yR+LLTGk6iW5mKJ+IKOh5E1hZdOpQk8XkqYGepBL3pQ83mWYcovDiIrXUmfKVhGnj90Nxnbknq2WH+xuVBzV+HqNtajuHXzXJkyg8nuCln4U2bbWh8saCPku8IqnEmPoQDKjL6E3kd/WemqGXc0v9cEACwHF87gfk2WETjKdekhc05cC6obF+4bPftDNOwjwH3eTKFvnIx
x-ms-exchange-antispam-messagedata: oXMVX8jnXxFuFxrQII7xtDgsbIzk4wEnjKCYSvK1UU8RMWA4wbYlRbboQqWgaywAkjGM0XeSi4Veb0SlCiE8sOA797V/aozCPQn1Tos/3V+jYSNcdIJYojwfaCklUHn+gjMH6F2NTooXMFANd7yhMQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e649e846-5c8c-4010-5f1d-08d7d0be0f0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 13:11:40.9765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+HXKHQkDfCXKNVS5aI4+JjKcGRNF/47zO4gr23SpoW4Eg7MsSfZnX7+YnNNgn/ITvMTReWdbkpqL3FR/i9whA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4256
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>=20
> Override devfreq parameters for power-performance
> trade-off.
>=20
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
