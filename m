Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7CA22ECCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 15:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbgG0NFv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 09:05:51 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:63512 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728141AbgG0NFu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 09:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1595855149; x=1627391149;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XBLeDlVEa8aU/rCqQHeL+MS1mZTn3CwBP7bshXJkW24=;
  b=m34mXa0IlEZ+dgDE8e+QY6Pl065NMORBUFhH8uOXHeaYQ9TjpymEWl3/
   xDhgEhcmXxk5XFaTBPtvAO/Aud/BqkgbPw/dUrMIuB67EqreVn2zXoziU
   L3mL20rEp/qTNrW3SgQGlURfN2YYTUUtpy0BSo7YrV0xw3gG6ECcMqgG2
   3MyiZUR2aJW4En+A/R6xLrP5fEqYB3c3NboNyuSjq7KOHofM4Pr/X/g5t
   TwGaPqy0OMUaqtQZbVA1mOXZzJnLFdY42l9z2EpBy72lyBFzlQwfBbHhv
   7dzPZCTxpbDdWyQ6DcCRfdrAEFy/hjLSSbw5yPs3FKohShk7k48tWEdoT
   g==;
IronPort-SDR: LOxcTL/1Z44YDjkimcg6PFgS3dGcURFN+eUJSUfVfSMCc/odjH6gQ8zmAsFReL4B7AFjRxeOeJ
 CT8q2AUmis2ehSMdR1it4rJD6ooeH8bEQ1zmN0tYp49kjPXvlCQvj6MtmouFCGg8l75kTTBTLj
 bVGAIq/Xdb0Nw+6zmAcoS45KOz/qWcNosBJbetpNh9fV+cnibJLLZWd7PlobIS21V5x03Bd654
 k/mYM2e2SKOF1hz4ciGbW74AYEp58erxgRjgvgk/f2tUh+jRKjNKaVMGk4qWhANDUU842l8fS2
 6qs=
X-IronPort-AV: E=Sophos;i="5.75,402,1589212800"; 
   d="scan'208";a="147770195"
Received: from mail-sn1nam02lp2059.outbound.protection.outlook.com (HELO NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.59])
  by ob1.hgst.iphmx.com with ESMTP; 27 Jul 2020 21:05:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7vZUYUTt83xa6nuXO37XdgSjLi9OH+Smq37JyiK6tZV4Dp3UH/Mvf0wKj96aqdRwoZ5d8wYZizFvsfwnsZ4ejaK0DeVjxvaBlrsVwLF3QDgwBadzjLmmooMQmxi3SzA5Vhlkac2qOmNgrK4QVsqh33vgPaUPJZAfaxIgU6qLgs7Q7oR2AFYKiYj6RoXmmpD0G8KgLurQiJTCWuSlt7Ep8So4gdqU0NiCLk4Qi0uui/qUCMOuTZX5nAjhs+zBtoRfeE7vI/tf2DEgnpMZGau0WNQrIURYzLPxN6GnkxUOffIOmQceYAYPEn9hMaOZef6CZPjYvbSl4QhYMB6EtXyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mesz/BAnlt2txUV30f7OTavWVN73/A6kjzWislba2e4=;
 b=WcK59D18mVQNCydGStz4eUJMnRMdNOxdHrdbGqz8jSXhNzte8ymehcH0EaMdAO7ALLHl7ibfRkMcrgUo2ayRa3fILegVj3xdhDT9HBNHpr40oWhmgvYo2Pw+kx/4uMc4619qLqSef4O9mlI9f4BqowRttBQyK5IGBPvdr6P4ureQt++hMIISkOtSfNLnnkNAivauOolLeNfI0rx/X6Lw0K72OpwMGghcjZJ29AsCm4rQrzaDq63SdnMOkOg7O9JJz74qfYyVfLmW3INQFGsy5hgvN2JRVHmfvPgD3lrsWS/FNZJHFvZj2habXJdaYWWs17KxKRiQ6K/Lh120vPjy0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mesz/BAnlt2txUV30f7OTavWVN73/A6kjzWislba2e4=;
 b=YrAhLvjsXXrRzNwla8If16o7NQ+KaLuIIpCIXLHNVYC/SgBC28/Fj/ekWWLG501dIeooKFQI11ROhYhdwdmr6z+c1cd1mNPvMtSEUrH4z9HepAYyHZ3bWcdnoNe2X8WCn7Le5xlwN/KtWstwVm/FL+tWsHePE2OQj9QpBKD7754=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4638.namprd04.prod.outlook.com (2603:10b6:805:ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.25; Mon, 27 Jul
 2020 13:05:47 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2%4]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 13:05:47 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Can Guo <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>,
        "hongwus@codeaurora.org" <hongwus@codeaurora.org>,
        "rnayak@codeaurora.org" <rnayak@codeaurora.org>,
        "sh425.lee@samsung.com" <sh425.lee@samsung.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "saravanak@google.com" <saravanak@google.com>,
        "salyzyn@google.com" <salyzyn@google.com>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 3/8] scsi: ufs-qcom: Fix schedule while atomic error in
 ufs_qcom_dump_dbg_regs
Thread-Topic: [PATCH v6 3/8] scsi: ufs-qcom: Fix schedule while atomic error
 in ufs_qcom_dump_dbg_regs
Thread-Index: AQHWYObspxomQnEBwESWyP6bVHqVcKkbabGg
Date:   Mon, 27 Jul 2020 13:05:47 +0000
Message-ID: <SN6PR04MB4640F4CEAB7F5FFA51648B6CFC720@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <1595504787-19429-1-git-send-email-cang@codeaurora.org>
 <1595504787-19429-4-git-send-email-cang@codeaurora.org>
In-Reply-To: <1595504787-19429-4-git-send-email-cang@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 419c6f5e-6091-405d-08e0-08d8322dc758
x-ms-traffictypediagnostic: SN6PR04MB4638:
x-microsoft-antispam-prvs: <SN6PR04MB46387FC114078748B48B08BBFC720@SN6PR04MB4638.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gc0bX3VvEwO4X/oTfL9liHnqjGvhNg69SvA42gbShU/WnQoCugwJXKJIc5yKdjJ71rhJ+J4VtyyFWPnpS4quhMalJcB8V7t5ctcLLaVx+6uf+AWENjZbLWurwC9z1tuU2EENpBY2B4EXz1qfkU/9K+KNoF0iOUqnCqeP4HbvbvYWvbfueiDhWUctkLImV1/gmq61eCVDXJFVbJboAC0RddpXT67nVAY7wJ/guHoio+4vbVqVddLMIOz4yVdNDpu8bj8Cas5gf0h6r6F0r6QiZTSWCKGvnAGDGPRULqV0XYUU6vb7M2/NPRN59E521TNF6z95oPKVUnlCUEXGIYqoTNImf7eY+wB2fbtutA9bbnC6nQ4/5n+NQgzE0rkbpuLc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(66446008)(64756008)(66556008)(66946007)(26005)(86362001)(33656002)(66476007)(8676002)(110136005)(186003)(2906002)(4326008)(478600001)(6506007)(76116006)(83380400001)(7696005)(7416002)(71200400001)(8936002)(5660300002)(9686003)(55016002)(54906003)(316002)(52536014)(921003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: A9rX80pKdAEPR88E/2kAgD0eed6OrBr1fs870Hurs7FDgw1V2iqE2R/1FQLj+gDuiKt6llY8WeGUj19mTPFTfjIP9ixS6gEZmPZAhaLdW00JJgEUx6nacO3DcJaQBapMFw1v1YE6yi4cAE8zwhMhE3FhMatK4qmJ4KJFhAhoP4EXFQI+AHxsQhMS6zvhBCX/RyTRbkDoMAY6gNsRG1gkGBIcqWKFLpJb7bXLd1m246PpxP0HEMsRRGEU6o104tn840r++wHFxDkT5YeSZUOnCU4OT/obWKNrm6hghPuka0tLbFbsILdIxrjuGnUuSgyLH0e/NoleUchtF4RucHs+xLfcFjokwMP7mSOt8zhjh4F9eM6opHSyUNJSRFsLPKefAUlSIzxiDOCagJc6h9cjykq90bECamhmZoOIXEBfXt6zpZATVAN4yWtKQV+co4025+7nStY17cwoswUIAwgNAxVLcuqn0r2B9v2CadT2ZgypCI34k50emNIE4SdlPURM
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4640.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 419c6f5e-6091-405d-08e0-08d8322dc758
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 13:05:47.0828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CyPE5CY16lz0vekFVQ7mQ+9jNAaEWSieVa5agZjcCzMLXbKcFMfMPjZ36/qPvDu5xObAwzQvC31QrnmnW6lN0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4638
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Dumping testbus registers needs to sleep a bit intermittently as there ar=
e
> too many of them. Skip them for those contexts where sleep is not allowed=
.
>=20
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 7da27ee..7831b2b 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1651,13 +1651,16 @@ static void ufs_qcom_dump_dbg_regs(struct
> ufs_hba *hba)
>         ufshcd_dump_regs(hba, REG_UFS_SYS1CLK_1US, 16 * 4,
>                          "HCI Vendor Specific Registers ");
>=20
> -       /* sleep a bit intermittently as we are dumping too much data */
>         ufs_qcom_print_hw_debug_reg_all(hba, NULL,
> ufs_qcom_dump_regs_wrapper);
> -       udelay(1000);
> -       ufs_qcom_testbus_read(hba);
> -       udelay(1000);
> -       ufs_qcom_print_unipro_testbus(hba);
> -       udelay(1000);
> +
> +       if (in_task()) {
> +               /* sleep a bit intermittently as we are dumping too much =
data */
> +               usleep_range(1000, 1100);
> +               ufs_qcom_testbus_read(hba);
> +               usleep_range(1000, 1100);
> +               ufs_qcom_print_unipro_testbus(hba);
> +               usleep_range(1000, 1100);
> +       }
>  }
How about moving the intermittent sleep out of the check if preemption is d=
isabled?
And maybe then you need to switch back to uedlay?
