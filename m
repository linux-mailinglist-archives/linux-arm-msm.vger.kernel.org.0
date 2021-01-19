Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C115D2FB454
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 09:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730580AbhASIhk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 03:37:40 -0500
Received: from mail-eopbgr80081.outbound.protection.outlook.com ([40.107.8.81]:40674
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729440AbhASIhW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 03:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1Z/Z8DWuv9RsWkWOq28tZfVUVGuk0qY7bH4FNTgryI=;
 b=GEUxBKBx9QQyKjZLk7/jsXmZmdzyvq6uEDYTkCFSZTlf3MKUuYg/ueKU8nCepdVjaro95iNlXZZH8iggLrq7mtKnpS0lAcib+09G2uiPTo3kkvNYGQGfWZlG6VnBqydH13ffpm+ps2RZQt7qy+3e47Y6lUzisQ9cUxSzZO34Hfc=
Received: from AM0PR03CA0037.eurprd03.prod.outlook.com (2603:10a6:208::14) by
 VE1PR08MB4638.eurprd08.prod.outlook.com (2603:10a6:802:b1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.11; Tue, 19 Jan 2021 08:36:31 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:0:cafe::af) by AM0PR03CA0037.outlook.office365.com
 (2603:10a6:208::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Tue, 19 Jan 2021 08:36:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.12 via Frontend Transport; Tue, 19 Jan 2021 08:36:30 +0000
Received: ("Tessian outbound 8418c949a3fa:v71"); Tue, 19 Jan 2021 08:36:30 +0000
X-CR-MTA-TID: 64aa7808
Received: from 332cb9da62ee.2
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id E93C7A9A-A08B-4029-B885-0828580590ED.1;
        Tue, 19 Jan 2021 08:36:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 332cb9da62ee.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 19 Jan 2021 08:36:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mz9PFiTNa/1LTd5OjgIPvAF9l8k6zwpf5nuQAv8IE1MiOjN9NDIZR0OpmpOmr9qnR3lB/C9+7ARvEIuATr6uLe1YwS/WYxqgsoDkNRGl+F1n6R0rbumic47e2cpyYe3GeQyyjYlghDhxGY3rI4s+HVuCSczN1i4zV0Ee+kf5Nk65bfnVYVK8Hz00WyNX2mgLyTkyBjsJEBhzbPybZhxsWGxry8cdrRp3ej//TAc0mG7TWbnbojHm3i+rh5PUNu+mc/WWt20gKOcqx8iQi0Wtx9Yu1HkLN3OsUCLmfhL/TJeUEJFBMsRVtMJ/e2gPAMIurQNWb1gMVEOK2cQGXhqe/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1Z/Z8DWuv9RsWkWOq28tZfVUVGuk0qY7bH4FNTgryI=;
 b=CdGQXPcYF31mYGpwJQOSiz+nRRQWYWY5hR3zIzStC2LbjafFYx//MHUPP6SGhaEulXdzNcny0N8HlxJjHtWfAE8DvcxWScF91+lQmKHllZrmRIKwvxYtTCxQxuZ5D+nRm4hinhizzSQ+sosmWmGf5/fyK2NGLj7krJlLUFj0Fz3CkvBLT4VSdHP67NMN70eB3nsxPH3YSbR7t+An7Wd7enqJidI1CWh5IBNkE+DffkfpkZ+vK63YqQHeQwfhtQOhN60vthYREbVbqozmI9M0H7TzwGYgVxlOjK2ZfcPkPVGEgJ78L1QgUK4hY2vY9BovVRZCUsUxc053B6OMZycqgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1Z/Z8DWuv9RsWkWOq28tZfVUVGuk0qY7bH4FNTgryI=;
 b=GEUxBKBx9QQyKjZLk7/jsXmZmdzyvq6uEDYTkCFSZTlf3MKUuYg/ueKU8nCepdVjaro95iNlXZZH8iggLrq7mtKnpS0lAcib+09G2uiPTo3kkvNYGQGfWZlG6VnBqydH13ffpm+ps2RZQt7qy+3e47Y6lUzisQ9cUxSzZO34Hfc=
Received: from DB7PR08MB3355.eurprd08.prod.outlook.com (2603:10a6:5:18::18) by
 DB6PR08MB2662.eurprd08.prod.outlook.com (2603:10a6:6:24::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.14; Tue, 19 Jan 2021 08:36:22 +0000
Received: from DB7PR08MB3355.eurprd08.prod.outlook.com
 ([fe80::54aa:8448:7c5a:c39d]) by DB7PR08MB3355.eurprd08.prod.outlook.com
 ([fe80::54aa:8448:7c5a:c39d%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 08:36:22 +0000
From:   Al Grant <Al.Grant@arm.com>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Suzuki Poulose <Suzuki.Poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "leo.yan@linaro.org" <leo.yan@linaro.org>,
        "mnissler@google.com" <mnissler@google.com>
Subject: RE: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
Thread-Topic: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
Thread-Index: AQHWovEvsWZ+JnYi7kC5fouEuMJbYqmY02mAgI/qOQCABawqAIAAlh2AgAAzA3A=
Date:   Tue, 19 Jan 2021 08:36:22 +0000
Message-ID: <DB7PR08MB3355E85C72492D4766F0BEFC86A30@DB7PR08MB3355.eurprd08.prod.outlook.com>
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
 <20201015160257.GA1450102@xps15>
 <dd400fd7017a5d92b55880cf28378267@codeaurora.org>
 <20210118202354.GC464579@xps15>
 <32216e9fa5c9ffb9df1123792d40eafb@codeaurora.org>
In-Reply-To: <32216e9fa5c9ffb9df1123792d40eafb@codeaurora.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 310BCE6E07DBDA47ADB4C4FA5FF2DE09.0
x-checkrecipientchecked: true
Authentication-Results-Original: codeaurora.org; dkim=none (message not
 signed) header.d=none;codeaurora.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [81.148.244.174]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b801f8ff-7cd2-496f-3196-08d8bc55521e
x-ms-traffictypediagnostic: DB6PR08MB2662:|VE1PR08MB4638:
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB4638553EA635D43E84D577A486A30@VE1PR08MB4638.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: SRFonN8ST9KhisOiYj6wiq8nzkBUqkMaMvCnbmM801kHV9lEK0BNDjEbzIGr82vgqfTa8GX/WbfKg8l68lGttJtEt9a5K4rLPXxhlAMCYy1XG1x0VPaHHO8Ayry3WzBgpA4/3S3PIx8g2nqveV8rAMRNM3Zpw/+DWrKEr1MJ8xac8ATu8/FQdnykWa+ePKPtnDd5oGzeGzNxVE0LoYbHvJnrvKZ6l+0DnnZGaX40mzx2a7rFe6ngwUEzxH2ST6WOHW4Q/QkjbDMlVlRywpj3TpynL9NJ53lySKBEsyu9KxpAwnvCJRt+fTk71V/LIFNcQc+/nqpgt/j45pRdRtdL+1wTA5ei15lmcPhk0E7kEGmKKUMZ22FMIzhGQMZgWxftR613s9ZVv9f9cHgggqwyULyBY2EVWdvylOjPY0cnMPhh/dnPy0mvFgxIHttgHGgw
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3355.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(7696005)(110136005)(8676002)(52536014)(53546011)(2906002)(5660300002)(83380400001)(6506007)(316002)(54906003)(71200400001)(86362001)(7416002)(76116006)(4001150100001)(66476007)(66946007)(66556008)(26005)(186003)(8936002)(478600001)(9686003)(4326008)(55016002)(66446008)(33656002)(64756008)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?bzC3vhNuWiIaw2+LoK+LC/SejdsOHQkWl4b5j8bBYGbihByKSk9/ZjCw9Uwj?=
 =?us-ascii?Q?WY0ZQY3uZ/pUy1p6+VpnyhS+Dsv2UNCrlVtP2ND9Ve49Ms1BeAKGvzkSJZmV?=
 =?us-ascii?Q?/uxR8Y9z8l3l7/rnTCKcQ5i3f81WQphzkIPazaBfjECu6GOyFJQqGpIg1Sg8?=
 =?us-ascii?Q?TtprFSEpM01a4iEGbUqbKHYadDrWWQojC0bthNpWrIL7P3mzXz8/IXT2Z5g1?=
 =?us-ascii?Q?FM6UOA4reIFg8B40AYnT5RcA0dWF3TLiFxscIIjAuwHHwyYU1rXHxQaM0ABw?=
 =?us-ascii?Q?t9OigOqXlS3pRAulB17ScT74Cuz6tEHYHWi8b8j3jeeCc4jDoGTf8svJxmro?=
 =?us-ascii?Q?/fXyaLIJNxrx9hWaeK+H09+w6Ytz2eaLkZG18BCxgWbuo0EIUPPp4imj1EdI?=
 =?us-ascii?Q?Fb2V2H5r4v7fPbFqV7kaMs2NS/arZ/EWe7JSBikPtWxjH+4r9i5fBdNKBYU1?=
 =?us-ascii?Q?W2GzA9WMEK9lUFXEfjtduGKciAAPnTqKgmDLqfg0/6fphkDEF6cIZLjNH+rH?=
 =?us-ascii?Q?p5OM4TBLfHiJP8ndxpOKkKwVxOKOpbbuhDPe/S8NihhloYhgXa6nFS6o4uJj?=
 =?us-ascii?Q?chA/qH3m9NGOwAntOMzIOAwvVACyo7YB0kqVIgbFGmcxPBP8xVnAXnGqLCck?=
 =?us-ascii?Q?KOe+5Z7TsxYVy0qxxHwMwHh2zqOs6owV3/pl3EMQ1f+UUPdDqGuihwnpeP6M?=
 =?us-ascii?Q?wtpCKMH7IyCsq6uJnXIZYmwmHHssCc7wg8E552QH9UbcmaA/74kKo4gnmNo0?=
 =?us-ascii?Q?OzwFxH8GIX6doxttDMwBBwYbFevNbiAjA9nSWol01anAymJ3R5HsEGwvZts7?=
 =?us-ascii?Q?hrsWeCDvPG/3fuqiJrNkLCLyRxmTqN202ELN1Nl5VSduRSv/u6mJsaXEZKdK?=
 =?us-ascii?Q?ErCAWXniFVIs192Z0M5v79Nktvb5p17JDlrK5A+tAC4YgAQCKu1YrNbSn1BP?=
 =?us-ascii?Q?n+5vkt1ukV/LHWKtHL3Rm7uzhJgX+zUFDJyXxkT1+0U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2662
Original-Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 81e50597-b340-41bc-c7bd-08d8bc554d0b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9scBirjcWmy3CvekKjTxwAg6bosJuxQWLUyJaFPOuhCkBZ7YaXXiG5J32b1Zhs++dZdVGXFNNlOWikpeprGJkQr0Xxy8RaHJISOlELR+/b7k97ZjIzvD2rT4xhXMk/PntxRzAgRlpRzPTylu6pRQMA5BiQGlLNMBq7cYCLT0z/jYhm6OOYLwbo47F7tc7aVDDWKlcTklkOmAKJlAjbn9q1QDfxh4zeZL1320Hi1miJmCQ/55EV3QgAWGH5IThtB3csNOxgmt+LylBWhlEopVqzLhs6hhg5UbFYaNlunNlSFZZO8FDhXDXv7GXblx7WCGFI9FLnVnEuNtQ8QoBjoIXO01uSshac0VVp7d2KS1V2DmlE8EkXR77LvNvxnItOFsW9D2yel9whEyUhazwRsqAOdByI3iNFYXYD8VrVb/+bNqA7CL1+upWe7q1djHfGD1iv8NKGo+qTy3nE/Ew52fe5teeaBgWHNcV+lGjMtOcU4=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(346002)(136003)(46966006)(33656002)(55016002)(5660300002)(70586007)(81166007)(70206006)(2906002)(356005)(6506007)(9686003)(52536014)(53546011)(8676002)(82740400003)(86362001)(7696005)(8936002)(4001150100001)(450100002)(54906003)(47076005)(336012)(186003)(4326008)(83380400001)(26005)(82310400003)(478600001)(316002)(107886003)(110136005)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 08:36:30.8128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b801f8ff-7cd2-496f-3196-08d8bc55521e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4638
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sai,

> From: saiprakash.ranjan=3Dcodeaurora.org@mg.codeaurora.org
> Hi Mathieu,
>=20
> On 2021-01-19 01:53, Mathieu Poirier wrote:
> > On Fri, Jan 15, 2021 at 11:16:24AM +0530, Sai Prakash Ranjan wrote:
> >> Hello Mathieu, Suzuki
> >>
> >> On 2020-10-15 21:32, Mathieu Poirier wrote:
> >> > On Thu, Oct 15, 2020 at 06:15:22PM +0530, Sai Prakash Ranjan wrote:
> >> > > On production systems with ETMs enabled, it is preferred to
> >> > > exclude kernel mode(NS EL1) tracing for security concerns and
> >> > > support only userspace(NS EL0) tracing. So provide an option via
> >> > > kconfig to exclude kernel mode tracing if it is required.
> >> > > This config is disabled by default and would not affect the
> >> > > current configuration which has both kernel and userspace tracing
> >> > > enabled by default.
> >> > >
> >> >
> >> > One requires root access (or be part of a special trace group) to
> >> > be able to use the cs_etm PMU.  With this kind of elevated access
> >> > restricting tracing at EL1 provides little in terms of security.
> >> >
> >>
> >> Apart from the VM usecase discussed, I am told there are other
> >> security concerns here regarding need to exclude kernel mode tracing
> >> even for the privileged users/root. One such case being the ability
> >> to analyze cryptographic code execution since ETMs can record all
> >> branch instructions including timestamps in the kernel and there may
> >> be other cases as well which I may not be aware of and hence have
> >> added Denis and Mattias. Please let us know if you have any questions
> >> further regarding this not being a security concern.
> >
> > Even if we were to apply this patch there are many ways to compromise
> > a system or get the kernel to reveal important information using the
> > perf subsystem.  I would perfer to tackle the problem at that level
> > rather than concentrating on coresight.
> >
>=20
> Sorry but I did not understand your point. We are talking about the capab=
ilities
> of coresight etm tracing which has the instruction level tracing and a lo=
t more.
> Perf subsystem is just the framework used for it.
> In other words, its not the perf subsystem which does instruction level t=
racing,
> its the coresight etm. Why the perf subsystem should be modified to lockd=
own
> kernel mode? If we were to let perf handle all the trace filtering for di=
fferent
> exception levels, then why do we need the register settings in coresight =
etm
> driver to filter out NS EL* tracing? And more importantly, how do you sup=
pose
> we handle sysfs mode of coresight tracing with perf subsystem?

You both have good points. Mathieu is right that this is not a CoreSight
issue specifically, it is a matter of kernel security policy, and other har=
dware
tracing mechanisms ought to be within its scope. There should be a general
"anti kernel exfiltration" config that applies to all mechanisms within
its scope, and we'd definitely expect that to include Intel PT as well as E=
TM.

A kernel config that forced exclude_kernel on all perf events would deal wi=
th
ETM and PT in one place, but miss the sysfs interface to ETM.

On the other hand, doing it in the ETM drivers would cover the perf and sys=
fs
interfaces to ETM, but would miss Intel PT.

So I think what is needed is a general config option that is both implement=
ed
in perf (excluding all kernel tracing events) and by any drivers that provi=
de
an alternative interface to hardware tracing events.

Al


>=20
> Thanks,
> Sai
>=20
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
