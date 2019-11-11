Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06E87F781E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2019 16:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbfKKPzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 10:55:01 -0500
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:47016 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726857AbfKKPzB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 10:55:01 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5BA74C0E17;
        Mon, 11 Nov 2019 15:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1573487700; bh=jN+8se8JIrnHuVwHPgthe/xLArbA3Vt76eNxdGMNuWI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=HgzK8I6IJ9xVnUg9pGFlGYsxszSy7fGuUTWSeUCIz0QUwydRf64gHmHVdPPFRKua6
         Daav9+hES8yPHYVsqaSYC+qoXIX5vqhEAB9FKWaax9YUz7RcPGCPVcVrY/FuwvAjMA
         SlZbdLSRHMEaphzgRuwmisRFD+8DCkEyguMRybpB49eIFePfyPuMBfGV6+Eg+Ox2Bx
         jrpnVGSloS/31m7DbM8FtfeyZI+2e4mAkoUwzfsbcPYEtioSW5SO0tG2bXt3bdIymZ
         pjeCY1AKSBfew0IVirn1zb6rZNW74R0ZZbUWRlyg2xFfGni68sY63fsvEeDu5z4Ze4
         IzGM+IRNyhtuQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id F0376A0066;
        Mon, 11 Nov 2019 15:54:59 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 11 Nov 2019 07:55:00 -0800
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 11 Nov 2019 07:54:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oclTFEQFk1O3iaZOFH9eOMLHxGlLzpt+pMIU4l4Kt0gWEvK7pkeNO26xA/K71kHVm5f/FaRAb1n+gVE2AJ44XrYP0twH3ZvSvncutjlomGD458HU9hii8CQjqaIp+ySUK564sHrEgkVhGteC/KabDIY/rywvGtaVvON2gMvEL5Yhsk2hzzTXnNofhqnp9rVsY0JnQj0r2JVeZF57Y4ZkiElCs9GXIwdcF8OItnBU9itC39r4IdE18bZM7nA+OUXcUkQJEJPjCAkqqJ1fnNh0c1pZrNCW3YhaoL8MgHtg86ju/xWzssoi+2xXttUQ2se7iL6JcFIJBOF9kJO0ZRxQNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39z9SR/lzDEOjfQHDkm4H9fMVxjMVG//wtRQTepEI48=;
 b=A8XzfI7iggEZn+YmTBNLib+4eD/6dhrWALSrJ75Ilaku5RHwx4NDeoXFFGL1iEMorLynlbR16PlTk2jjF+Z3vdFZPPVUjLrQsuUCE7hrpZJ8IjZ00YHofsm+qgmtOOuqkAS9p/PHyfBzJcIHxCI/QMffLjxcFj+aliWz6RGkAlGOVogq4jxVSHGOw9XZrmq9ihyzfd4TI5qh95DNgmgb02AkvjAxJIQd92UheUBFGXm9eVStQGsZNylbEr2CMHOO+JnV96AGAQ9F3v6I7jAFhflb91dU6QyOkIA9sR7NLYS5qaQkhNU32W5r1XjgktTRrkcp7PMs9UgnBtH69nr83w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39z9SR/lzDEOjfQHDkm4H9fMVxjMVG//wtRQTepEI48=;
 b=OwPFe/ImrBrJMf9jo+Rozcg9HSm//zetqyUHj0RIF2n2p8OISZOQn0529zGiFG1XIcSF+Laq3juZKQNRc1XUU7pt2UC1aP5A09i30HLufzaTODmBVDaHn4LDXBWZGs7lzP53lgjqwoigtiyWXJSnWBP9Nb6GnJPzqyPFujrwOpI=
Received: from MN2PR12MB3167.namprd12.prod.outlook.com (20.179.80.95) by
 MN2PR12MB3325.namprd12.prod.outlook.com (20.178.243.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Mon, 11 Nov 2019 15:54:57 +0000
Received: from MN2PR12MB3167.namprd12.prod.outlook.com
 ([fe80::2974:feba:8a00:35ef]) by MN2PR12MB3167.namprd12.prod.outlook.com
 ([fe80::2974:feba:8a00:35ef%6]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 15:54:57 +0000
From:   Pedro Sousa <PedroM.Sousa@synopsys.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "rnayak@codeaurora.org" <rnayak@codeaurora.org>,
        "vinholikatti@gmail.com" <vinholikatti@gmail.com>,
        "jejb@linux.vnet.ibm.com" <jejb@linux.vnet.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC:     "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "saravanak@google.com" <saravanak@google.com>,
        "salyzyn@google.com" <salyzyn@google.com>,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] scsi: ufs-qcom: enter and exit hibern8 during
 clock scaling
Thread-Topic: [PATCH v3 2/2] scsi: ufs-qcom: enter and exit hibern8 during
 clock scaling
Thread-Index: AQHVicHjMc01age/aUm6zttfm5YwhqeGN47g
Date:   Mon, 11 Nov 2019 15:54:57 +0000
Message-ID: <MN2PR12MB31675521623C9AFEA87B6076CC740@MN2PR12MB3167.namprd12.prod.outlook.com>
References: <1571849351-819-1-git-send-email-asutoshd@codeaurora.org>
 <1571849351-819-2-git-send-email-asutoshd@codeaurora.org>
In-Reply-To: <1571849351-819-2-git-send-email-asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc291c2FcYXBw?=
 =?us-ascii?Q?ZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5?=
 =?us-ascii?Q?ZTM1Ylxtc2dzXG1zZy05OWMxYTNhYy0wNDliLTExZWEtOWEwYS1iODA4Y2Yz?=
 =?us-ascii?Q?YjJlNWVcYW1lLXRlc3RcOTljMWEzYWQtMDQ5Yi0xMWVhLTlhMGEtYjgwOGNm?=
 =?us-ascii?Q?M2IyZTVlYm9keS50eHQiIHN6PSIyODczIiB0PSIxMzIxNzk2MTI5NDczODQ3?=
 =?us-ascii?Q?OTciIGg9Im11bGxoRUtWaXh6bXJMTndqVFRJQys5emlqVT0iIGlkPSIiIGJs?=
 =?us-ascii?Q?PSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUJRSkFBRGRD?=
 =?us-ascii?Q?VWRjcUpqVkFlWU9NQnlnRVlSQzVnNHdIS0FSaEVJT0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFIQUFBQUNrQ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFF?=
 =?us-ascii?Q?QUFRQUJBQUFBbEF3ZnN3QUFBQUFBQUFBQUFBQUFBSjRBQUFCbUFHa0FiZ0Jo?=
 =?us-ascii?Q?QUc0QVl3QmxBRjhBY0FCc0FHRUFiZ0J1QUdrQWJnQm5BRjhBZHdCaEFIUUFa?=
 =?us-ascii?Q?UUJ5QUcwQVlRQnlBR3NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVB?=
 =?us-ascii?Q?QUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhrQVh3QndB?=
 =?us-ascii?Q?R0VBY2dCMEFHNEFaUUJ5QUhNQVh3Qm5BR1lBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFB?=
 =?us-ascii?Q?QUNlQUFBQVpnQnZBSFVBYmdCa0FISUFlUUJmQUhBQVlRQnlBSFFBYmdCbEFI?=
 =?us-ascii?Q?SUFjd0JmQUhNQVlRQnRBSE1BZFFCdUFHY0FYd0JqQUc4QWJnQm1BQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJtQUc4QWRR?=
 =?us-ascii?Q?QnVBR1FBY2dCNUFGOEFjQUJoQUhJQWRBQnVBR1VBY2dCekFGOEFjd0JoQUcw?=
 =?us-ascii?Q?QWN3QjFBRzRBWndCZkFISUFaUUJ6QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtBWHdC?=
 =?us-ascii?Q?d0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCekFHMEFhUUJqQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0Js?=
 =?us-ascii?Q?QUhJQWN3QmZBSE1BZEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhB?=
 =?us-ascii?Q?ZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWRBQnpB?=
 =?us-ascii?Q?RzBBWXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FY?=
 =?us-ascii?Q?d0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0IxQUcwQVl3QUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFad0IwQUhNQVh3QndBSElBYndCa0FIVUFZd0IwQUY4QWRB?=
 =?us-ascii?Q?QnlBR0VBYVFCdUFHa0FiZ0JuQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCekFH?=
 =?us-ascii?Q?RUFiQUJsQUhNQVh3QmhBR01BWXdCdkFIVUFiZ0IwQUY4QWNBQnNBR0VBYmdB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBSE1BWVFCc0FHVUFjd0JmQUhF?=
 =?us-ascii?Q?QWRRQnZBSFFBWlFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?us-ascii?Q?Q0FBQUFBQUNlQUFBQWN3QnVBSEFBY3dCZkFHd0FhUUJqQUdVQWJnQnpBR1VB?=
 =?us-ascii?Q?WHdCMEFHVUFjZ0J0QUY4QU1RQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6?=
 =?us-ascii?Q?QUc0QWNBQnpBRjhBYkFCcEFHTUFaUUJ1QUhNQVpRQmZBSFFBWlFCeUFHMEFY?=
 =?us-ascii?Q?d0J6QUhRQWRRQmtBR1VBYmdCMEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFIWUFad0JmQUdzQVpRQjVB?=
 =?us-ascii?Q?SGNBYndCeUFHUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFB?=
 =?us-ascii?Q?QUFDQUFBQUFBQT0iLz48L21ldGE+?=
x-dg-rorf: true
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sousa@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1235d88e-232d-4a6c-d0c1-08d766bf804e
x-ms-traffictypediagnostic: MN2PR12MB3325:
x-microsoft-antispam-prvs: <MN2PR12MB33259D25A707574ACF676CA8CC740@MN2PR12MB3325.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(346002)(376002)(136003)(396003)(366004)(199004)(189003)(13464003)(4326008)(76176011)(71190400001)(66066001)(71200400001)(478600001)(7696005)(14454004)(6506007)(55016002)(486006)(186003)(476003)(7736002)(2201001)(53546011)(102836004)(2501003)(26005)(7416002)(25786009)(256004)(14444005)(305945005)(74316002)(86362001)(446003)(11346002)(9686003)(66946007)(8676002)(64756008)(66446008)(99286004)(76116006)(110136005)(54906003)(316002)(8936002)(2906002)(6436002)(229853002)(6116002)(81166006)(3846002)(81156014)(5660300002)(52536014)(33656002)(6246003)(66556008)(66476007);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3325;H:MN2PR12MB3167.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z+dJrNBJ0Dj92RSzVH8+bB1wigcSjS02UwS4D2+4DtrhUmbtV80H9Vplrs5dHwITP7xU1iJMS01j/ZZl2Xhot5UjXxsQtkQ8RvH6FH1tctKtblY3OpTTuB9sD1KGEQaba47HNqpZOr12Vh1x6asdAWwt5RjGpamkm6ljCBMNdFEllqJ6lcWX3/sPQzGW/HPPdeC8jb4M9YsuS+djrlRQyFLOg50VvDd+r3zsfksbb08QvrE1tVg/pXgLmRkqhVMDVoEpDwcmODbaxhY7c4InktpPR4DdVbiDgz4g+VNUNjOo3AEAQmZLIRRT+BydMZgYLjNK2CdB1MJOKZidRC/miPfVSF514JQiQupJ8UMbChLLE6iURGi6fgCvdTxxg6JA8CE3TBGXRLrxK7pMfGRSojboL1Xe/R6HZIHOP4e/vwl4rLUYOd8RN4QBY/BxgYdW
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1235d88e-232d-4a6c-d0c1-08d766bf804e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 15:54:57.1611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N1AhWZmmSoeMgRsP0kARf1Q1UHGQYcJvf1HGJq8HNUrd0QtyuIVdsj7pMShW42mKc6FwnRbBrDSLbi/+xjOkdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3325
X-OriginatorOrg: synopsys.com
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Asutosh,

Please check comments.

-----Original Message-----
From: Asutosh Das <asutoshd@codeaurora.org>=20
Sent: Wednesday, October 23, 2019 5:49 PM
To: cang@codeaurora.org; rnayak@codeaurora.org; vinholikatti@gmail.com; jej=
b@linux.vnet.ibm.com; martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org; kernel-team@android.com; saravanak@google.c=
om; salyzyn@google.com; Asutosh Das <asutoshd@codeaurora.org>; Andy Gross <=
agross@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>; Avri Altman <avr=
i.altman@wdc.com>; Pedro Sousa <pedrom.sousa@synopsys.com>; James E.J. Bott=
omley <jejb@linux.ibm.com>; open list:ARM/QUALCOMM SUPPORT <linux-arm-msm@v=
ger.kernel.org>; open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] scsi: ufs-qcom: enter and exit hibern8 during clock=
 scaling

Qualcomm controller needs to be in hibern8 before scaling clocks.
This change puts the controller in hibern8 state before scaling
and brings it out after scaling of clocks.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index a5b7148..55b1de5 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1305,18 +1305,27 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba=
 *hba,
 	int err =3D 0;
=20
 	if (status =3D=3D PRE_CHANGE) {
+		err =3D ufshcd_uic_hibern8_enter(hba);
+		if (err)
+			return err;
 		if (scale_up)
 			err =3D ufs_qcom_clk_scale_up_pre_change(hba);
 		else
 			err =3D ufs_qcom_clk_scale_down_pre_change(hba);
+		if (err)
+			ufshcd_uic_hibern8_exit(hba);
+
 	} else {
 		if (scale_up)
 			err =3D ufs_qcom_clk_scale_up_post_change(hba);
 		else
 			err =3D ufs_qcom_clk_scale_down_post_change(hba);
=20
-		if (err || !dev_req_params)
+
+		if (err || !dev_req_params) {
+			ufshcd_uic_hibern8_exit(hba);
 			goto out;
+		}
=20
 		ufs_qcom_cfg_timers(hba,
 				    dev_req_params->gear_rx,
@@ -1324,6 +1333,7 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *=
hba,
 				    dev_req_params->hs_rate,
 				    false);
 		ufs_qcom_update_bus_bw_vote(host);
+		ufshcd_uic_hibern8_exit(hba);

Here you are creating the possibility of returning a success even if hibern=
8 exit fails.
If hibern8 exit fails the ufs recovery will be triggered and "err" variable=
 will not get updated=20
in this function, how is this handled? Did you tested this possibility?

 	}
=20
 out:
--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux =
Foundation Collaborative Project.

This is just a doubt, it might make sense in this use case, please give me =
your thoughts.

Thank you,
Pedro Sousa



