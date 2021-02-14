Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1F231AFA1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Feb 2021 08:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhBNHtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Feb 2021 02:49:25 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:48374 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhBNHtY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Feb 2021 02:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1613289660; x=1644825660;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KSLolCJAFSxJ+25qAVEroJZUdW8c8dN5sP+adQdXWYw=;
  b=CMArOAS5hCUKGP+lATQqQIX5eEMtC/R16IX1A2W2eUKHzaHVAAPna3ss
   mlVH8EbGT9mlH+mRD5RlSbGfUsCzdixWFpa5fK0K87S6zsPBYQy6wmu/J
   u8uCB5/nmtCbo8wdfNlSLql5lVniYE4Pm6o9HvVZqTC4xADC71XhQ0wuN
   maqueEsp0zJQrKslxnBJw3yWjDy8qoC1BgtqTXORBqCKm6I/s0oepV9tO
   DjGnuYVICywJkH9guDWnXlJ9C2WZYd3uThbm45HZ/U5DdnQ0o7W7LyB8w
   4K4U1pzHwkDzi0dQ04Kdqy5AnbBOO4V/iYFAsqBBi88fBi/BjEUCmRLyX
   Q==;
IronPort-SDR: XmdjpI7Gl+Hqb6SOGEV3H3cmXxa+a1nBtxPVizDhFaJ9ntqHNgEsAubH0rJHbkSMh+jCv8pc5/
 Pqnp7gCYtPHjeNxFOmEbN16NavBACKUF3Wj5eqagYebDokF5gG06k1NtHFxWGvBWdd+zcwHysx
 Hsw8Ai67fkbMAU88Ez1H9r131q5msBF3GbcGkQDcrQtJXPsBaLJ1N0KQq1Gu1whd7mzT0qO8dK
 jKXpUIqMkjke1brEE60VQz5lnYZKEFfAybWrDTuA8ahEFIPXtjulAZdNcRELUETQ6CmZx1E5Dx
 VPs=
X-IronPort-AV: E=Sophos;i="5.81,178,1610380800"; 
   d="scan'208";a="264067373"
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
  by ob1.hgst.iphmx.com with ESMTP; 14 Feb 2021 15:59:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agA115eunnZhea7ROwDRya942mqUX0yyA2j9MZ+lxaqKUFCHitQA1j0Ae+jtG6NRPozq+SYN7lLrbAchPTYuXKHi+4WRpu7N4cGnHn/0ozkbnJvxIMVs3DdAjl8q5q8sGUwaCjsM/MjdbRRUBXyeAHqraa5baZPyLKpV/JEqfTSu0jRcftiDV5uzB0znZGvy6gLfXbI235OZ/j7RUSoKmw+BBFk8sm4w4lyfx3VAA3GHgsh+RJPMVY8vf1ZOQQVAj0XiOdQgIGOYPAuQwX6a0PrlXQbC24++k7rR5l/zUVqb2DqXjqKT4TriPrQeTjeqsV51EKCz2czcS1WVdM77XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSLolCJAFSxJ+25qAVEroJZUdW8c8dN5sP+adQdXWYw=;
 b=HpSqKZZqklnWt18CSXAIlh7U6T56E+WZmFiW5vr3JI/nYUngDZRpkGYAMiXfYcfDO6MmIR0w1sDtCZM4rbwtK44s+zrri0PAN6Q/D02SqcTTGLfdE8fRphQMEYL4N7PQouSrc9g/jQi2rrzGk/STCHLQKwSghX8+UhzhocE5+fwwYZY3gSSg8rNAp5MYYkPrUHZ5OpZE3muKWfRKJkj2nWps3sUgY3MMnVrkXJu6NrnRN4wqkvlJsvJofcilJ4J+Fim6tUqdzEzz5dpJIL/ffWMwGIbnSFiz7s31jId9TvjM8OW2XssCUp1k47gFRqAC9Kl7G14NLyMhRGLBnSatgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSLolCJAFSxJ+25qAVEroJZUdW8c8dN5sP+adQdXWYw=;
 b=NTUiSMwM8uEid7sDNTQTALGG7MOkvYU+yPDIrMK5/4w/mOVzZkR3gAVNzxkNXgMinA71KDUz/IDqzE5WO+5TTcYrz5xF6yGOoqJ0byxic2oNFHSGIZWeRax9+qpl+byVNZIvPY7zkWpm6/1ETEYbhFH75HbnEW9cqwKTilavuLs=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM5PR04MB1100.namprd04.prod.outlook.com (2603:10b6:4:46::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.29; Sun, 14 Feb 2021 07:48:10 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66%4]) with mapi id 15.20.3846.039; Sun, 14 Feb 2021
 07:48:10 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Avri Altman <Avri.Altman@wdc.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Subject: RE: [RFC PATCH v3 0/1] Enable power management for ufs wlun 
Thread-Topic: [RFC PATCH v3 0/1] Enable power management for ufs wlun 
Thread-Index: AQHXAKtK6bkpCHugCkOJOgXYFyz9BapWjQWAgAC8EdA=
Date:   Sun, 14 Feb 2021 07:48:10 +0000
Message-ID: <DM6PR04MB65758D026C49C4DE9606CCD2FC899@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <cover.1613070911.git.asutoshd@codeaurora.org>
 <DM6PR04MB6575172ABC466BA0824743D5FC8A9@DM6PR04MB6575.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB6575172ABC466BA0824743D5FC8A9@DM6PR04MB6575.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 34efa399-a9ef-4ff8-0d7b-08d8d0bce043
x-ms-traffictypediagnostic: DM5PR04MB1100:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR04MB110043353353A1563836EB1CFC899@DM5PR04MB1100.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GNdqUjpi52sNLEHcqibltpfHbkzWfJQv417RsCaQsFMsR21xMZUowbBWkYCb+8KnHYYA98ZKGUPGjN47X+3gS1H27rrkxMQJuDSMyQ8UmxjF1YeVAtF0lggnVtaHBp4rnny+sKRB52qcv1JCoRwfyfki87+INY1R37tnvUvWh1g/cZGk2yLuzaLYhvURs+fOgR+qek+E9jI8xaAZ0bxBg1DwKWDdSHUI8M0oPs22XJ2iU+x1F0tGyhc1fCLb9XLogUc6cSjDVzGhprLBUjuYjM+E1L6w0zEy4DmeQgxSsXoG+haRsoeyP53HfMQ1rQDwZikf0p3Of4v4KUiqQLWLXAg3v6s/IAXrvtG3uw0PLp++2jJrNF6kvcnA1MjMCy/X3cT66bWI68DLtM2meeW9+zwsD2aIAWVl800MSsEuMeZmrk8/GqHE3g5xlaIqOurxQKJ3kJRU4iwuXPXQkNiqurMIgGU3UHBzxl8Rt6GU6GkmaiQI53iPrc7XGb5kiqVHR0UtFIAMawxKEaPzY18e8w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(39850400004)(396003)(26005)(55016002)(76116006)(83380400001)(110136005)(6506007)(54906003)(186003)(316002)(2906002)(7696005)(478600001)(66946007)(66476007)(4326008)(86362001)(9686003)(33656002)(64756008)(66446008)(66556008)(52536014)(8676002)(8936002)(4743002)(5660300002)(4744005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?k3Nit3QPI+tMBbAYdAytDNYIPfoZsS+TlcsA1nKJuhivuWs9vj9KvdPj0TSS?=
 =?us-ascii?Q?B/bQjpldjbS0gqpm6iZt13i+aLzB+zlGL1CPdP9qW2Juicxv6wRgGQWso9Ne?=
 =?us-ascii?Q?ULDtn7TxNXja3AyygTHuSB3KJrF4r4enhAecbnMs1zLq99BGobxXdRGWa/zQ?=
 =?us-ascii?Q?ZxAEaW9lYAh9KXmVudiZR6oLhHP3aqHMGqIoYyqXaF+p41GGvqZFOC4tD7T4?=
 =?us-ascii?Q?Gd70ZHiCR0+20J6TrIRTIEC8CyrwKXyZ8arPQf/XiWNMiSrB1IWytkEt/TgE?=
 =?us-ascii?Q?Tg+7oTLsP0vj1u5rQrbAC1nrRXYYsmw0kd8AnzBp/Pz+uFn5Q4ZzRxbX/Joi?=
 =?us-ascii?Q?woC/HCZ7sHMcOe5UHT47fmqqOgbG6lID6NHpOx/97ewl9i6tc9cTFBVWPcKe?=
 =?us-ascii?Q?R5Yu9oBbqDyyx0t08rzvNgScME3fiO9S4LdjxzJz8VKEvit84OI0Hx0Z2b68?=
 =?us-ascii?Q?CyVkAqqso3cIyYyQv97PE1epcAbuSd78DgHCNEjB59sljGI6yDsbDeouEmpM?=
 =?us-ascii?Q?zVy/Ban1flOS+smkngJHE0G1fQM13TAA3BJmvOY+I453rQI+mR+8SJdo73aa?=
 =?us-ascii?Q?FOMU40BkqSU5XLEQr7mGAp7UR6Qkk0SN/x8ooWrmMGdYiIa5eZU6KOZPxXL9?=
 =?us-ascii?Q?liHgRVQ9L26oJJO2hZ+GKksILoi9LG7levDLM83gfbZwCG5wp9XeR1Q9RVKe?=
 =?us-ascii?Q?UdKjRMOhbXVOuR3SbMdkuT5nhHCqNT8tU98BWVF3UdhUU6NWS1m10p8AueNT?=
 =?us-ascii?Q?jHaqefV0l6MT3fs8djaeo/l26f+CYTRRttRVBGEexz6kxd7XZSQM7n8Zy5Qk?=
 =?us-ascii?Q?Q8sm4zp+J+LwizJo0ffyG/BTVLOdnOa8cKnxGSS/2leN4kCmOV4hKImP88iU?=
 =?us-ascii?Q?85fJD58P+KJ2zyfFRqftcl6ccdpku9+UDwFWCPa2dA//hLAg/9QlZ0tiurCd?=
 =?us-ascii?Q?a/4RKFeInWhjo8OaOjm6ZvPbiqVmi8RyEpelqgN9sdZVCxGIvzP3OuxjursY?=
 =?us-ascii?Q?2ar09xhQvWcif6uCuRxeedAQdeF0kHfGXU52OE+Oa/P831xl1A/m+blepRuR?=
 =?us-ascii?Q?Ng1pqqy3StDWC8JlZj0rFR4iRuzQfuWTZA8636wkhgGLlnN88PVyROpA+2Rj?=
 =?us-ascii?Q?OnWuLnjb4ltR8+pcL6FCbnc9v2th0st9ljRakNecQkhDhsi1aO5U8klgwi2f?=
 =?us-ascii?Q?pEQFXiuVdRNJEXKBH/I4yeO2/Psi/qFugDcd6FwhSBzBzq0J6JBBPwRrHpyw?=
 =?us-ascii?Q?WEpygorDLaxl2SeZmpoxbZZuYuj3gxfIeyl0QmKF/jH0MjhVpfnZOv3jiBzr?=
 =?us-ascii?Q?YiOcxTW/vidvsGw/7dFjPyd/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34efa399-a9ef-4ff8-0d7b-08d8d0bce043
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2021 07:48:10.6102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eBCR7cjVqyo2YH+MBA/JaLqhF7kSFrWpbJ6LUhDVsoHATWPNoZs7mxjSYmw7wpZJG6/P8kOQzW2ti4+zGKaGyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1100
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> >
> > This patch attempts to fix a deadlock in ufs while sending SSU.
> > Recently, blk_queue_enter() added a check to not process requests if th=
e
> > queue is suspended. That leads to a resume of the associated device whi=
ch
> > is suspended. In ufs, that device is ufs device wlun and it's parent is
> > ufs_hba. This resume tries to resume ufs device wlun which in turn trie=
s
> > to resume ufs_hba, which is already in the process of suspending, thus
> > causing a deadlock.
> >
> > This patch takes care of:
> > * Suspending the ufs device lun only after all other luns are suspended
> ufs device lun -> ufs device wlun
You might also want to consider, as a preliminary step in your series,
reverting one or more of the recent "clear uac" patches,
As you are nailing the root cause of the issues/live-lock they witnessed.

Thanks,
Avri

