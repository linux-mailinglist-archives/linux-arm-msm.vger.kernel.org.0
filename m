Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B48D1B3F34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 12:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgDVKff (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 06:35:35 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:2815 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731381AbgDVKfc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 06:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1587551732; x=1619087732;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MdrS2JP0e0emC0iygxoUjItHdbhZL0AN0RAyFpbOMIo=;
  b=jGXtLpkbQsa9oZwx2TlCglccH4eLx1bysv5AKLfsx1FnBCb16pRBdlIO
   mAtr+Mu6HrmY73RaO8ZJumCR+R7GgFB+Z5q7nSNMCXqwh7laJJ27QdGjY
   gNxIYjmzA1uvksGgh4d21C+Kr8T1xNkWGghkUQS1GIISP1tGIxZBe7/VV
   UrEyKFEvpBIx1dPg8uaZzTJaBLxDwh/RgcQXikVjysQDWIgRuT+0SlDIn
   +qib5beCTm2RIB3pQ3cJW0bsD9E8+TWZQAMwtjjH3kVsKUx2hKGq9SMEB
   Q5tzN13VkxtQezs0809txMbviOy7VnxbCMQkT055TZUxEGUFqicIXlm56
   A==;
IronPort-SDR: CV3UUf1sWeOfwluMsbMlr/xFgtEozRMtmoSmenfK/hhYIPVuHX5+bVaLTp8hIepz9WsJAAFvyV
 moulelecz0j2zZg0te11F+TGwEbg2tnUiomaENO2HJbXwNDJHJNoMeO3OfjTbe3QutbkHGaV6u
 JSvZ0Pq5gxbhsj3uDKr8Xxy78xiCBUpaSfApfxMbmuyYDUKMyK864z1h0hUWPHwoWUXNW4JkLI
 wD6lEAN8deV/Ef9G9C1+RExkAsDRnJcMotUITns2CTF+ewt6tdOXVUht9w2ioXLqyJewoK+mvC
 ZG0=
X-IronPort-AV: E=Sophos;i="5.72,413,1580745600"; 
   d="scan'208";a="137300294"
Received: from mail-cys01nam02lp2059.outbound.protection.outlook.com (HELO NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.59])
  by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2020 18:35:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrLqFrunRvFSEbXo0iwzPLwZYmZnSNpNr89kUDib1MAfqYe1piBv34nibaip0QcfBUdC+AQogRSMHRol/zJgP+/eEfEop/n9Fd4YwKkA4PaBD1T0KwWYoC8qgPqx1/lj3OxpxjH7Es6ljAMesZwWgBaLUVm1hSDY0nkqnEUaQ454xKm1WOx6+liRHrBWdb9u+Izfdml6M/3uYlZnnBVrEr+r5PKIiJgmuthn4kDXkCmcnqyffcXV3quAygDyFO1TN3BJC0o/KeKHFCIMYGpS5PmNHf3L8rYYaCf90coh05ysJpL+onRRWR9qOqxdbd8PL5nJzuUZ+Xann7npeOgUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQHKrUYqInIdoHSn5IvHnZwZu6R8f2ANu7K/ZctM1rI=;
 b=Txq52ZmWyIW9sCNj/QodSYa+z276/qK6Sioq8tUKBhWF7jFIiGXajL8v8WLF5ZZqdHG48Q1NkUcf6kMY4YcQQ6RoA2JCM6xjZUqntBr3Cx0rO5iDqC1uaSCFwsn088u9RJyIPxnR4JCSU5tTNSIladJ2jbB8Nr+5ygLFm11WhyOqUZ30lu5PwFO07oZhG+otddWNCUaXcHyM82oVJBQOOGLTdQfa/XfEKhctW+75iBG8aY2RmR1ySG/s1ZE5DR/MELhcGCQUTIZQ5MGEjoq2Kc9QX7p1yYe4xePB4ji1Jd+OZwBzAvLfNrwHfJ9LwAibXJR5IPinXaywVOzKEMT1hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQHKrUYqInIdoHSn5IvHnZwZu6R8f2ANu7K/ZctM1rI=;
 b=FFqSxCdvOI7x3mOwjGQVgiHZqwSBb9tz7IWzvFyZMTxdxGa4FImW7BqZxw2DFwYE6X2uua7cZ6sRg7JuF+3rfxO3F1Ajfm6xwZObOwjyRcj92S1dQ9mQXTq5kmsbQu6aUz4sAoeSQLc754ns982ZerduHADEdaW8rNsaYNuUNWg=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB3839.namprd04.prod.outlook.com (2603:10b6:805:3f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Wed, 22 Apr
 2020 10:35:29 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b%5]) with mapi id 15.20.2937.012; Wed, 22 Apr 2020
 10:35:29 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] scsi: ufs: add write booster feature support
Thread-Topic: [PATCH v2 1/3] scsi: ufs: add write booster feature support
Thread-Index: AQHWGC/ZP5mEb4mHQU6B/JvojeGq46iE8eUA
Date:   Wed, 22 Apr 2020 10:35:29 +0000
Message-ID: <SN6PR04MB4640895F87719D8B04D0F74EFCD20@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <cover.1586374414.git.asutoshd@codeaurora.org>
 <6519cd576299d5881129b0e48870a53a0afc7835.1587509578.git.asutoshd@codeaurora.org>
In-Reply-To: <6519cd576299d5881129b0e48870a53a0afc7835.1587509578.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dee2446c-0967-4f6a-9c4c-08d7e6a8e0b5
x-ms-traffictypediagnostic: SN6PR04MB3839:
x-microsoft-antispam-prvs: <SN6PR04MB38393317710B3147EC98C2E2FCD20@SN6PR04MB3839.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03818C953D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(66446008)(64756008)(81156014)(8936002)(55016002)(316002)(7696005)(110136005)(6506007)(26005)(4744005)(54906003)(8676002)(52536014)(2906002)(66556008)(71200400001)(186003)(4326008)(5660300002)(86362001)(478600001)(9686003)(66946007)(76116006)(33656002)(66476007)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YqvxcmwJ0X67fQfqAK52bKSyRcPmOYAt56XzqTWcfS8Xv3TJKAZA0PAwaMLQkrCTykHvtOEIIy7lyqVQSJKXTYBzO0ca92d5Thcwy2MzmWshAWZZRfq7NZwJRbDdnqQOPhA77Dd1ffRROpOD5WTgGDC+koCN93id9xqvCGbS4QmRSzGkAIyB63Uf590PA74La0Noat6ROuMRAz4bsnCLx7uHBYyWXqtP94gmLDUzvd6EqG6T04FbV1xcZjPmy1M5Piuw8psvdPcT84TJZRfEu5cDwpkoMvY5cYPEUNj/zzirZONAgrpjJ//kF5sRTmcWbblDACO1nyoCEsGIVjApbd7Vu6cnmH6MHA5wGqwHapGTrjGnvFyS4F6Xa7nazFh0sugDnNTteYIVgJ4wc2A7pr/rwuVx7qxZkAzN43iYNWOJqQKa3gFmDe83aBpbNaJd
x-ms-exchange-antispam-messagedata: vocKJWG7JMIcLmlSE+shZlqIvxxNhTPXM/xBqdUOMd8xERfE36UOMbC0nt7q4tViybIg6R00QzlkD1XWK+G6vXxLdyXuwrK/YRFzzF54hSxac+97fwqRWBj8ksU1+k8bvNc50ywJQy+0mQCqWZHrHw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee2446c-0967-4f6a-9c4c-08d7e6a8e0b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2020 10:35:29.3847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +v7hzeZIhnqfljXX7Y1Qn2llxJ8A5RMNAquaPX7ue/amETBjzwJRF3ajc3hWlBTv/e1FsEq82qvcZbnYhgBlCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3839
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> +       /* Enable Write Booster if we have scaled up else disable it */
> +       if (!ret) {
> +               up_write(&hba->clk_scaling_lock);
> +               ufshcd_wb_ctrl(hba, scale_up);
> +               down_write(&hba->clk_scaling_lock);
> +       }
Maybe add "goto out_unprepare" if ufshcd_scale_gear() in the clause above,
Instead of checking !ret, to follow the function flow.

Thanks,
Avri

