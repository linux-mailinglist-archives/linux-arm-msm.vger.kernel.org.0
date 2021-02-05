Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9434D310623
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 08:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhBEH6G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 02:58:06 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:18011 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbhBEH6D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 02:58:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1612511882; x=1644047882;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0xgnZ9A12niYrC+rQAokDtvBj+/H/iNUl9NcZssJ+KY=;
  b=XGNwP2ZnC/6Xe4gz6G5vbA9dx7Zim4nBMPVD9/o/Nl4P4cFypy3wRjYB
   LgqbzQEgTkfAOi3+1B2IYmFZX5b9hkywRBKHvv2TTiHssHOUCfz667OnA
   SrcDCnYlAdM/kUfG/Ddrr1/15ICd0rxlaWN8LcSUGQUMUxDk3XnUVkQQq
   EHlgIf2mwrgEibNE/RYG7/GVt/8VXIZEgo1ktPP7lYAvqA5C86U7XGAsS
   enlzilhEwfrA3M5kAvTDjZR3+mJI7RJam5ncD529PRDg5HsgqIFxg4Wmn
   UHMVUzp9qPETaHPb9Zs8FGpUz6J7Q9z0UXuEw60KBOwF1+gd3eCbtpC5Q
   g==;
IronPort-SDR: fyzyKyIwGYRfgwfhf7pEaTkmYc53kKsDBQJLWYomIaep90IRc9Zg9VV4oOYkRoUPs38+I7G4De
 llne6EYC6tyHkYjk1/cxcavlwLALLf3ulEbrV72S4Cz3Uv6v6HpKHyuU5qTFwEZ+1EiRQIbEb0
 iGzSQvY30BvJ4PNzDmKYxM3WmIKCIIdxNNZ/vf/a3G49iJ4IwQZn/YUpJn4dbpYOyc8AUcTjGx
 Nng/deMVSgl5CWdN+0cDWsqTSXWexI4m5kzljnE6iZvbOduWeQJrl9JtRjCg4ERM/a/Z3SQgNr
 F5Q=
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="269644708"
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
  by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2021 15:56:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFbNmlM6cD6yrq3foajhdPIOt7RfJwdxj5JuopBP0ceVq1ckleEDPv934oVxtDmjgcBlV3Sw+mZeQdunu9wHIcVbn7xmzjL0pp3FKLXNMxbznAiFQXhdw/1gpSCkW2YaqpyUZZaNoT3862BbZ+/0mcFEf2KSxKkxz9dJsR9yHoL6ktaxEtPUri1dXEeBF8L/n5br+hf5PboS6n3ffZ0DyW2pXkWI7/AzmGPxPq6iXNstQdCi4asU1waC4WDy+WoqF6QKDUmaN0H5mIJYfxa4JbMb1CaEm6dlUH9eutoZnCeKJlFRqjyOkiF6ZLToYS8LNuUV10ZhllPySANI7fuE9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZSv6MkHw8EbY5rcG5OSlWBY/7NUemcu7rTkQB19/1U=;
 b=ZIfToMMYe4GAU0LAGYegu6JZ89fem6+F2xMjCoxDr8rrwznlIgVAXnmt0Xq+tO8JRUfMQ7AFY9OgK+0ZiCwEUeoxR6/mEN4nfvObVTDfRXqV/FVaqhZ4jhIhQMYLxeqHAX2gJ6xVMeqYUziCU7Z2bbkK6z8/bmKFsbUHq2RRzCF+dRzLNfTD/gFodbEDac8FjjzkdArLi2ZWnapfhuWMHg9ikRHrJlVZwgn06qYnND6TA78w28WJrUzYcGk7WNTc5rqnmRJFDOSICgl7oi9JKAcVL+9iDs5s6Ol3gKFgotiyEtP3mQvIbfnSkoeWNgDxhn0Fhu783qsVdmWB4Mei8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZSv6MkHw8EbY5rcG5OSlWBY/7NUemcu7rTkQB19/1U=;
 b=F78d71UTycJLotNDHMiCY//VXLWRVSkHieX0RX8qD7iGR044+Bw1/oQkoZtCDBUktFS4/HUZo5u2OH4g5tVqAJUXgbhk14Rb0Vp3uaR4oy2DFEtdhJDhgRpXVeWZigFCsIY2e0brV8AeRbNPMadsXLfdOqrBdU4h3aSDQzE6YHs=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB5083.namprd04.prod.outlook.com (2603:10b6:5:12::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.23; Fri, 5 Feb 2021 07:56:55 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66%3]) with mapi id 15.20.3805.027; Fri, 5 Feb 2021
 07:56:55 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: RE: [RFC PATCH v2 0/2] Fix deadlock in ufs
Thread-Topic: [RFC PATCH v2 0/2] Fix deadlock in ufs
Thread-Index: AQHW+y62BDWX6X6k8kupYsmVqHFwfapIfw8AgACs1EA=
Date:   Fri, 5 Feb 2021 07:56:54 +0000
Message-ID: <DM6PR04MB6575692524202EC91E2A5480FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <84a182cc-de9c-4d6d-2193-3a44e4c88c8b@codeaurora.org>
 <20210201214802.GB420232@rowland.harvard.edu>
 <20210202205245.GA8444@stor-presley.qualcomm.com>
 <20210202220536.GA464234@rowland.harvard.edu>
 <20210204001354.GD37557@stor-presley.qualcomm.com>
 <20210204194831.GA567391@rowland.harvard.edu>
 <20210204211424.GH37557@stor-presley.qualcomm.com>
In-Reply-To: <20210204211424.GH37557@stor-presley.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 97091310-530b-4bf8-913d-08d8c9ab9b06
x-ms-traffictypediagnostic: DM6PR04MB5083:
x-microsoft-antispam-prvs: <DM6PR04MB5083ADBBD11F7713E071DAE2FCB29@DM6PR04MB5083.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n6nmYH57+UCcBC0yhATm/3u19OORz8v+kspwmZOOUmDdea7pTn9LFVwQcea0CeTkEkWB6mwL4lJMbTdfQ6h2GwpxKLM/4jWZyH7DRzXpQ4BF8G/sHTx1RQ+ILBtXrGsO4WVlFIzNH/cJYCSZuviXlGPBVcJchrXoaiM+RTB0Qa0KTLsqkwFbR6JDRE8p/b9dBskxguQH8a9obQVTdIrHn9B52RuchICa6FCs63dwaNxdK9bTxiXF4FjLrHsJeEeHwUotu9/m2r+OkDm7KDihM680/aKorPPwymmoHG3DALhzLGEUm/ljHWxGFbVh8f3k3cydjRhji8p+KXgLwPuIAn4QLECb9haIBFNwA4/B9NJ6JJV4b3Nx6ptRipGN0WyVCf4zSHj6QI+pPB1xiQGBbD1Gqnn5Z/1th6Q2pevR5CnOwbojHimbZMCoEISFDDJIyQNucgONbdPq8qygcIfj20nI74u7657fwX4VKzgWquMgHFpJC1I7GoF8GfEycd++OoJuuRvvTVWNa1AuJuj8Ow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(66446008)(478600001)(55016002)(186003)(5660300002)(7696005)(4326008)(9686003)(66556008)(66476007)(64756008)(66946007)(8676002)(86362001)(8936002)(2906002)(316002)(6506007)(33656002)(54906003)(83380400001)(76116006)(71200400001)(110136005)(52536014)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?C6A39yjzB7IyF+W9YZxMwZC+zTl8jd5pfuh0hiCd4vhCWs1OOAQmb/D23ZqD?=
 =?us-ascii?Q?CjkAo+KgWMDsFIadgGa1fJqTfELm8JvujlcLJzzDbLwEmx+QHj3B8Ru9BO9t?=
 =?us-ascii?Q?gD0gt7XNudfU3limZXGu9wqZMc3qYN1X5NwTQI3LArFGNscUc6uSX6JGErX7?=
 =?us-ascii?Q?EfmVwW/eK81RjbkXTwomcu8rhgNHvz05LSWqWrQ4JePdd1UCuVRdd2yxMlKG?=
 =?us-ascii?Q?CYegfcNAEwQQyPyJP1+wvbrBQQOPfwUr2d7+MOTTMuUqO0AkaNOOI1cK3zw0?=
 =?us-ascii?Q?Av7GrmNrDZii/3PPmtq5pOoh8pno2pFwk2FpxvGArSP2+a5503e7uVGmMGox?=
 =?us-ascii?Q?R5hLDWYB7M/tHuDbvT/p+tQm9h+n84PW2j6VvhIn9WeG9/TAVIZDf1Y5AlVZ?=
 =?us-ascii?Q?d5CuoSdHW/SpOCZHMyapzfjti93r0e5NkgJ8kV3bXRwi2P7ii9RGrxNvgZTx?=
 =?us-ascii?Q?mxJtYBPB/s1QeVPq7O46RYTJ5/W2aqRcofR1UbpcKxxrIPBb35U007t3oGma?=
 =?us-ascii?Q?ul6ZC+YHxxOkGUX+pVON1DplBSL9U2jJdqBanEHg6gfsN1xKp11H8NWfbuDj?=
 =?us-ascii?Q?rd8i8kXCWtM87ma0aJaBns8e4FUvEI89lqG+z/LNt32QUMqGVZjKYZmXzb4g?=
 =?us-ascii?Q?0Tz7RpTbI+p9b3TVCtw4FTjJZLYx+XeAmgx7rToHcHlFa+64yXWd+FANjeUX?=
 =?us-ascii?Q?OBmRu+sHeBuHY7VRBVfErVlRceuvWxL2FWSwG4Kpyo16rT/LlkWH4mcLnRW1?=
 =?us-ascii?Q?FoitWSrMwLZlFeHvn8MaK0y3mtAuXESudmrpGOCAoM/5R2bupFfgqQTIgEYV?=
 =?us-ascii?Q?+Kyt7dpdft1ygidWu5XbooelkJ8MVQ/bbXHS2R28++aZT6uQj6NlMnUHS9sD?=
 =?us-ascii?Q?MfCNQvnZvKwXQNeJHvrfJOgSKGXav18Dvmbz3kfozpHWTrElvWsBfFl0FNbA?=
 =?us-ascii?Q?tTAwNga5yYl+rkYW1Kz3AYni5+Z+4gLzY3HX4+Ffs779UNOeFehqoecIKOg5?=
 =?us-ascii?Q?13I8kWlWs0zDFctj3Xz6UfdtuUbuUeEKkoZrLvSbCsn5dL6R0UtDEmKa3bye?=
 =?us-ascii?Q?e3V7tJofjePoPJwFaGS2HcoUXe2WdA+EWbN/D8/Y4RU2EPRdBuXrHE+WfJFW?=
 =?us-ascii?Q?mBzwRmFPJSB+32zz/+FFDHGU48UGAyPbrO4a6lWlvAEMkGcmWBjhDTWeJCo5?=
 =?us-ascii?Q?icIrxWbdMbk2MiJWh0UpZnwMiTpGn0kVsIhOZQi5LQQ7w1zxRm1QcdAulBvy?=
 =?us-ascii?Q?aKywFm0V/QKglQmoPvG5VvwtC/1bc5f7Fr7+Ykjwuf0mF8DzzycfwnQjprWG?=
 =?us-ascii?Q?MQO/ILODTZmbn1L51coK7lEL?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97091310-530b-4bf8-913d-08d8c9ab9b06
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 07:56:54.9269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oqfrgl49KuaWqMrlesUO8wKWlMymeswk7dTgN5YBmUGgX65zSF19IcVq6ap7TLlYtJYWhAfnjt9rgdxBMLlk3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5083
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
> On Thu, Feb 04 2021 at 11:48 -0800, Alan Stern wrote:
> >On Wed, Feb 03, 2021 at 04:13:54PM -0800, Asutosh Das wrote:
> >> Thanks Alan.
> >> I understand the issues with the current ufs design.
> >>
> >> ufs has a wlun (well-known lun) that handles power management
> commands,
> >> such as SSUs. Now this wlun (device wlun) is registered as a scsi_devi=
ce.
> >> It's queue is also set up for runtime-pm. Likewise there're 2
> >> more wluns, BOOT and RPMB.
> >>
> >> Currently, the scsi devices independently runtime suspend/resume - req=
uest
> driven.
> >> So to send SSU while suspending wlun (scsi_device) this scsi device sh=
ould
> >> be the last to be runtime suspended amongst all other ufs luns (scsi d=
evices).
> The
> >> reason is syncronize_cache() is sent to luns during their suspend and =
if SSU
> has
> >> been sent already, it mostly would fail.
> >
> >The SCSI subsystem assumes that different LUNs operate independently.
> >Evidently that isn't true here.
> >
> >> Perhaps that's the reason to send SSU during platform-device suspend. =
I'm
> not
> >> sure if that's the right thing to do, but that's what it is now and is=
 causing
> >> this deadlock.
> >> Now this wlun is also registered to bsg and some applications interact=
 with
> rpmb
> >> wlun and the device-wlun using that interface. Registering the
> corresponding
> >> queues to runtime-pm ensures that the whole path is resumed before the
> request
> >> is issued.
> >> Because, we see this deadlock, in the RFC patch, I skipped registering=
 the
> >> queues representing the wluns to runtime-pm, thus removing the
> restrictions to
> >> issue the request until queue is resumed.
> >> But when the requests come-in via bsg, the device has to be resumed. H=
ence
> the
> >> get_sync()/put_sync() in bsg driver.
> >
> >Does the bsg interface send its I/O requests to the LUNs through the
> >block request queue?
> >
> >
> >> The reason for initiating get_sync()/put_sync() on the parent device w=
as
> because
> >> the corresponding queue of this wlun was not setup for runtime-pm
> anymore.
> >> And for ufs resuming the scsi device essentially means sending a SSU t=
o wlun
> >> which the ufs platform device does in its runtime resume now. I'm not =
sure
> if
> >> that was a good idea though, hence the RFC on the patches.
> >>
> >> And now it looks to me that adding a cb to sd_suspend_runtime may not
> work.
> >> Because the scsi devices suspend asynchronously and the wlun suspends
> earlier than the others.
> >>
> >> [    7.846165]scsi 0:0:0:49488: scsi_runtime_idle
> >> [    7.851547]scsi 0:0:0:49488: device wlun
> >> [    7.851809]sd 0:0:0:49488: scsi_runtime_idle
> >> [    7.861536]sd 0:0:0:49488: scsi_runtime_suspend < suspends prior to=
 other
> luns
> >> [...]
> >> [   12.861984]sd 0:0:0:1: [sdb] Synchronizing SCSI cache
> >> [   12.868894]sd 0:0:0:2: [sdc] Synchronizing SCSI cache
> >> [   13.124331]sd 0:0:0:0: [sda] Synchronizing SCSI cache
> >> [   13.143961]sd 0:0:0:3: [sdd] Synchronizing SCSI cache
> >> [   13.163876]sd 0:0:0:6: [sdg] Synchronizing SCSI cache
> >> [   13.164024]sd 0:0:0:4: [sde] Synchronizing SCSI cache
> >> [   13.167066]sd 0:0:0:5: [sdf] Synchronizing SCSI cache
> >> [   17.101285]sd 0:0:0:7: [sdh] Synchronizing SCSI cache
> >> [   73.889551]sd 0:0:0:4: [sde] Synchronizing SCSI cache
> >>
> >> I'm not sure if there's a way to force the wlun to suspend only after =
all other
> luns are suspended.
> >> Is there? I hope Bart/others help provide some inputs on this.
> >
> >I don't know what would work best for you; it depends on how the LUNs
> >are used.  But one possibility is to make sure that whenever the boot
> >and rpmb wluns are resumed, the device wlun is also resumed.  So for
> >example, the runtime-resume callback routines for the rpmb and boot
> >wluns could call pm_runtime_get_sync() for the device wlun, and their
> >runtime-suspend callback routines could call pm_runtime_put() for the
> >device wlun.  And of course there would have to be appropriate
> >operations when those LUNs are bound to and unbound from their drivers.
> >
> >Alan Stern
> >
> Thanks Alan.
> CanG & I had some discussions on it as well the other day.
> I'm now looking into creating a device link between the siblings.
> e.g. make the device wlun as a supplier for all the other luns & wluns.
> So device wlun (supplier) wouldn't suspend (runtime/system) until all of =
the
> other
> consumers are suspended. After this linking, I can move all the
> pm commands that are being sent by host to the dedicated suspend routine =
of
> the device
> wlun and the host needn't send any cmds during its suspend and layering
> violation wouldn't take place.
Regardless of your above proposal, as for the issues you were witnessing wi=
th rpmb,
That started this RFC in the first place, and the whole clearing uac series=
 for that matter:
 "In order to conduct FFU or RPMB operations, UFS needs to clear UNIT ATTEN=
TION condition...."

Functionally, This was already done for the device wlun, and only added the=
 rpmb wlun.

Now you are trying to solve stuff because the rpmb is not provisioned.
a) There should be no relation between response to request-sense command,
 and if the key is programmed or not. And=20
b) rpmb is accessed from user-space.  If it is not provisioned, it should p=
rocessed the error (-7)
    and realize that by itself.  And also, It only makes sense that if need=
ed,
    the access sequence will include  the request-sense command.

Therefore, IMHO, just reverting Randall commit (1918651f2d7e) and fixing th=
e user-space code
Should suffice.

Thanks,
Avri

