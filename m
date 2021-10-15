Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3358B42FE0A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 00:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238781AbhJOWXE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 18:23:04 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:52202 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231949AbhJOWXD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 18:23:03 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7E9F3C443E;
        Fri, 15 Oct 2021 22:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1634336456; bh=/nmlYxijr0TD8M0OQjepf6gtQuolqPbVaEf4LN7HOQ4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=OUAQolplWwWdmhomXiO7+Y+m+R98yoomhnmCXCMhIKn3gafEwbiVrQqtMAAAEg7QA
         1pECYIEl9MXy5uZQjqllE7QiCXT6D/WeoZyrkkwIvlTHVT/VCdm2p/v/gnH1Yzy/F8
         bJKK4Ss7IBoPTGLh6SZAxK+peu9bFUMhpvd7iL5HFg4PhJijnHHCPY8iDOr+qATKrw
         9COI2gdi3GF1eCZv+DSw9yYtQYlEYb22DMViGs0GNdjP+7SGQ8RNaPpH3rcSN8Pnd5
         955MW9Ztrt5Oh2Jzw8O4WF/1uVJSDf+8MgN35ngv7/lXqB4l9d/TEFJoN3aCdnWCd6
         ekjWvCMy9XWlw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E13D8A0080;
        Fri, 15 Oct 2021 22:20:54 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 02C9C80072;
        Fri, 15 Oct 2021 22:20:53 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="oGYfVonp";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRSwUZgmGym6GYrJInq1Kg/wEPs1xlWByGyXahbdEU0Uh0GFrUJ6oGTQZodEz0wrmyo9wWrIDIq99l7N/kJOQF8u92vBjjzYdZKfgFNKo01keLzoEllamww5OuW2aXXwdRkfAbp7lKVbDvnAKsLPuVc+KGybtXcCtHME0x2iBZ68v4I9kzuujtHH87a4h6N3WmxKdc/hDCGkmN8ZA5fY6wBN63hCVptZAG2i2li5coIfNypEpd1OtLqL71lKiucbUhWJdxtaPZ85SS9OfZUGvCiyogwUMt/F89KDPsMWziYWcJhQRcjsCN11P1ap4tJzVWSlaKTFGtyvRK0k2M0AbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nmlYxijr0TD8M0OQjepf6gtQuolqPbVaEf4LN7HOQ4=;
 b=ieoUP0sxTMywac/DzfQJW3sOr8h6pOOduyWqYdZs9CqNzODi03Fk5cRyIQ0jnuTJF+Hb2Np36Xsm6ve5iy6UmgXtx8YMmyIaKqakTURM+qZsxD61/1t0etx2VMhi3mD+tiEziXK0ar6IsR+MfxIhUH3XRAbaW/xEBvBegWwHyo9ULvMINIhM9miZFrDoU5Lt/sRzxdAj1N0HuRUUPD/uelmFuibAyZrFR5CE7TFQ+z7V0KWJQEIdaX1tyxBQwARc012YTURYA7nkTsyYNj+NemYR+3YNgedmZ+dRRBLgIsGlG2ho9tO1f/bX+JAVZPNx1wILUuAGPe1+nTkF30cyVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nmlYxijr0TD8M0OQjepf6gtQuolqPbVaEf4LN7HOQ4=;
 b=oGYfVonpDmF4qKadf+pD4CTzjJvVWfsGDiUQqE0zJaCB3sRvayTbBFbuLMccrnaoU33k5BZHWX/ER8T+bcVatxajAbM1O5euZL/AGjx6/z+se9RKFeTXy9aeWfbpD7GkmgHOq5tpnEbc0kP296pnbMpVgbcZUU6gbtXoR7CpSN4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3477.namprd12.prod.outlook.com (2603:10b6:a03:ac::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 22:20:48 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5865:4cfa:3e30:26d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5865:4cfa:3e30:26d6%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 22:20:48 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Topic: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Index: AQHXpVUbI6zrZuzuNkasP7SNAwlUbqucd/uAgAGWZYCAABurgIAEpB8AgCWYFoCACwyIgIABaFuA
Date:   Fri, 15 Oct 2021 22:20:48 +0000
Message-ID: <9ecf98e9-0700-3a38-d056-5479f5188f4c@synopsys.com>
References: <20210909083120.15350-1-jackp@codeaurora.org>
 <6a4bb7a9-2c63-5e1e-f4fc-a5bbc7aaa168@synopsys.com>
 <db0664a9-575f-1c6a-2efc-ec8372e2f1d4@codeaurora.org>
 <6538dd76-5dea-1e31-9459-657898be6d8f@synopsys.com>
 <926df659-7e31-9504-9752-a206f1eb8eaf@codeaurora.org>
 <56339fa2-e476-0f5b-9625-7016294e6be7@synopsys.com>
 <20211015005101.GA16586@jackp-linux.qualcomm.com>
In-Reply-To: <20211015005101.GA16586@jackp-linux.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d99c44a-3a63-41b5-dc40-08d9902a0a5b
x-ms-traffictypediagnostic: BYAPR12MB3477:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3477890C4F1E4DEFD5230E80AAB99@BYAPR12MB3477.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A7VFFqAlnTTMe3eRCgeWBmo4/gp61soB5/CwR6bJ56pnzYtUrvL4hhUc4hkLzxtdEZHbMEvy1B4Tx86qMYGuqgJiKU8cqrgcLezey2PPk8vhM2gj///CszFubKeH6h9ya0j7RJR4SlmChBDCRkw9WgpojNjDqzI2/MHalxTgPLPevNd38cJejvMqyaUYaq0t8Jv5btyvjVKtvEs7gwrPanf17rTEQ44KtZbMTHHuiE+Tw1B80pVfONJ3QHi2Lz0KEmy1m324fdOskmLq+2TALMScgkZ3RgM8M/00kF5RHbAr9AVk5V82aSysvqA+L77QJ8AX0VqfSfeG8gvIvZV68RFmSVqSvNrpniw56ebJHgTN9RYgJeH1sc3Rsb0f9vFdh+aE+PupVFXPINo3KandduIUReaYDdUhP7b4Nuvfb9M7Bpeky8V0ng8ga0gzIlC+aI+eI/Plpw3aepiBGvXMAfdrIvIC2nnzM5br2P9TLSB1eyKZS/hHZgivvBxl7BO6S28EctvI/pjxPU//FSm3R8v4YCBD4oODQ3GTZL7+0GzNiHMQDG5m+MieE8ttriuK4F9ZvshkIUIUgmYlAdISZ244DnvtH9h37v2aS3T1QCbixZR6elOluAP5EnVwD2paNBkp6p0zeo9gloxi3Yb1kA1i0cG15Re7hyFidooyuHnNwfGNBKVSBF0HD4rOwDzi0pOI4phS4CJtiBDHfI3HeIccrN/s8io9KJUW9YQu6nnQbibV+PyFZKRliaVUbOrWh7uXZD89Rm+3eifFj9XtYA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(110136005)(8936002)(122000001)(64756008)(66446008)(8676002)(4326008)(31696002)(38100700002)(66556008)(31686004)(66946007)(66476007)(38070700005)(76116006)(316002)(54906003)(6486002)(36756003)(2906002)(86362001)(71200400001)(53546011)(6506007)(6512007)(83380400001)(508600001)(186003)(26005)(5660300002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2RNZTQ1RE9XWTd4YXVkM2F3MXNVWnFIQmRDdy9ZckZYMTVQbTRZQUhnY0xu?=
 =?utf-8?B?QmVLaXJXL1h3dVlPLzJXOVFydHJHeG1zSkwyL2o1c0VjVXFLQWJLMmkrZU12?=
 =?utf-8?B?d0l0ZWxPWFJqTUJQdTJxdkx6ZndoMHQ0VDZLTmpHN1NqN1FVNzhoWVBDNVZ0?=
 =?utf-8?B?WkZ0Z01PTFJuRXA4dzN5Y2xnVCszR1lxckZWSk8rcTN0SWxBME1wZ2dwNk1v?=
 =?utf-8?B?V1BuaG5nNU9yUDVSZmM4TjUyN0h3blFZOGNyMldhNmVpd2RjRFh3Y3EvL0V3?=
 =?utf-8?B?eEYwK2JLZEtIbWpwcWhCQjNhRUxLbGdOWjdXYWliK3U1bUxLUTJmcW80cFpV?=
 =?utf-8?B?dTBuekRUOC9OVUZRa29kaFAyN0lVUFJwdTBldVk3OHpZT0lqSmdTVmxqMTFp?=
 =?utf-8?B?OHB2eno0UkdPR1QycHR3TFU3RDhGSUlmQ2lYeHNMR3d2NTh4bTRmaG9nYVli?=
 =?utf-8?B?WldHeVBHZkFCanR1bE53RDhLL256RmFQWXlPcUtVdTJNeXdvTmx6QkE1RmlO?=
 =?utf-8?B?dEJuN0VHOTQ2QlB4cjFlTkpDcmtvaDBObUtST0JCSFR0b21IM2hCRXl5ZzRZ?=
 =?utf-8?B?V0Z0cDFDbW1uZXVCRThxYngybGN2K2hvZW5SYjZERC81MTA0NnBEN0lqalVq?=
 =?utf-8?B?ekVsWGNBZTFFcnlWejFCQUZBNC9jeEVLMjIzNTltdjJWTjlBYkFpcFkyYzMv?=
 =?utf-8?B?NzZrd2hvaXRkeVR3U2NhV0E5ZlI1SWZNd3FXcnZUQnVVVjJlcENWeW9MVXk0?=
 =?utf-8?B?aEFFMzBlbmowZkZ5by9qZDdIbFdSUk9oWU9zRnl6Q1VEUlN1eHI2TWQrR1Yv?=
 =?utf-8?B?RWNyYkE2K1pnM3VWSDhIalNkN0RoL3dqR2JIK0JlNXhxQXc2eGR3UlBkWkRU?=
 =?utf-8?B?TVhWVE5jdm0rTTF6TEJmUG5mM09wN2o5ZnZ2TDgzS3BvWlRnS0dsWFVyZTJ5?=
 =?utf-8?B?bUlreGlnNlJJUGVEUE1ZTDlPaFR0eSs3K1lwMXd1MHd4ckM0ZldnZDJVSlcr?=
 =?utf-8?B?S3R5YW43Njd0UExMRU1rSGwwZG5sd2p6UG4ycXJqRGFBQmhBR2gzZGhvT3pq?=
 =?utf-8?B?S0k0N0lUU3MrdlhKUllPSVNJamtLOGNJalc3d24vbGlvR21ndUtLOGVXSVI3?=
 =?utf-8?B?bWRHWldnSjlxQ29qTFE4WldPUUJjdTYvUTlSOGtIMUZOQlJ0YkJZS2t5aEpz?=
 =?utf-8?B?NkdSTVZhYkFBVTdZRG9IL2lLNUtuM1VYVGpuTEgwTFJhR3ZpeTRDdE5VcDdu?=
 =?utf-8?B?dHFHZnRmZnhqcmlFa1FiVUVZYVlKeXJOczY0VmdyWUdnNW0wR1JNQzZZMFRh?=
 =?utf-8?B?WHR3TUV2NzBkSGRkMDhrR0tpb1lnN3BhRzE4Uk50Sk9TQytRZFA1d09tOENl?=
 =?utf-8?B?OVFoMm9laFFMZi9uRFY2T3A2NE1veVJxN0svcWpjOXZtVTZOZ3k1SG10VkZr?=
 =?utf-8?B?ZkZmY3lEbnZvU3RrdmI0SFJpekhPRFpKSUxKMXFmMUV0TFlYYzd0S1A1Wjlm?=
 =?utf-8?B?VzVwdm5xNTFRVVpObTM4ZFZ3MGIwMHR2OUNYdm1UamRSem4xT0krR2IzRngy?=
 =?utf-8?B?bGl4WUdjT1FMdzFQWCtWVDBEWnNURWlzSnpLVFhvVmY3V0xtZzhBNGc4czEx?=
 =?utf-8?B?d0lTNXUwTW9MYjAxcExuL1dFMzNNRGl3RE1zYzg0VjlwbXYzbyt0bUJ3VUM5?=
 =?utf-8?B?a1VpKzRaZXI3bDdtK3NsZkJuMG9lRXpYL0dleWZycVhsRVdpQTdHdXZOY1d5?=
 =?utf-8?Q?VjH8nnibj1EQvBFrlk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A5A6D4CC6529548A83FB0B46C485B90@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d99c44a-3a63-41b5-dc40-08d9902a0a5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 22:20:48.4615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8lqA5nSKGStkWC9tFcCfhQ/vviiXkh8H0+o2yIgLENe9UAwWgqmSXJTqmhAkQQ/ly/ZHmJ5Lx3pZ2sx22bKaVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3477
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SmFjayBQaGFtIHdyb3RlOg0KPiBPbiBGcmksIE9jdCAwOCwgMjAyMSBhdCAxMjowNzoyMEFNICsw
MDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBXZXNsZXkgQ2hlbmcgd3JvdGU6DQo+Pj4NCj4+
Pg0KPj4+IE9uIDkvMTAvMjAyMSA4OjA4IFBNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+Pj4+IFdl
c2xleSBDaGVuZyB3cm90ZToNCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gT24gOS85LzIwMjEgNjoxNSBQ
TSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPj4+Pj4+IEphY2sgUGhhbSB3cm90ZToNCj4+Pj4+Pj4g
U29tZSBmdW5jdGlvbnMgbWF5IGR5bmFtaWNhbGx5IGVuYWJsZSBhbmQgZGlzYWJsZSB0aGVpciBl
bmRwb2ludHMNCj4+Pj4+Pj4gcmVndWxhcmx5IHRocm91Z2hvdXQgdGhlaXIgb3BlcmF0aW9uLCBw
YXJ0aWN1bGFybHkgd2hlbiBTZXQgSW50ZXJmYWNlDQo+Pj4+Pj4+IGlzIGVtcGxveWVkIHRvIHN3
aXRjaCBiZXR3ZWVuIEFsdGVybmF0ZSBTZXR0aW5ncy4gIEZvciBpbnN0YW5jZSB0aGUNCj4+Pj4+
Pj4gVUFDMiBmdW5jdGlvbiBoYXMgaXRzIHJlc3BlY3RpdmUgZW5kcG9pbnRzIGZvciBwbGF5YmFj
ayAmIGNhcHR1cmUNCj4+Pj4+Pj4gYXNzb2NpYXRlZCB3aXRoIEFsdFNldHRpbmcgMSwgaW4gd2hp
Y2ggY2FzZSB0aG9zZSBlbmRwb2ludHMgd291bGQgbm90DQo+Pj4+Pj4+IGdldCBlbmFibGVkIHVu
dGlsIHRoZSBob3N0IGFjdGl2YXRlcyB0aGUgQWx0U2V0dGluZy4gIEFuZCB0aGV5DQo+Pj4+Pj4+
IGNvbnZlcnNlbHkgYmVjb21lIGRpc2FibGVkIHdoZW4gdGhlIGludGVyZmFjZXMnIEFsdFNldHRp
bmcgMCBpcw0KPj4+Pj4+PiBjaG9zZW4uDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFdpdGggdGhlIERXQzMg
RklGTyByZXNpemluZyBhbGdvcml0aG0gcmVjZW50bHkgYWRkZWQsIGV2ZXJ5DQo+Pj4+Pj4+IHVz
Yl9lcF9lbmFibGUoKSBjYWxsIHJlc3VsdHMgaW4gYSBjYWxsIHRvIHJlc2l6ZSB0aGF0IEVQJ3Mg
VFhGSUZPLA0KPj4+Pj4+PiBidXQgaWYgdGhlIHNhbWUgZW5kcG9pbnQgaXMgZW5hYmxlZCBhZ2Fp
biBhbmQgYWdhaW4sIHRoaXMgaW5jb3JyZWN0bHkNCj4+Pj4+Pj4gbGVhZHMgdG8gRklGTyBSQU0g
YWxsb2NhdGlvbiBleGhhdXN0aW9uIGFzIHRoZSBtZWNoYW5pc20gZGlkIG5vdA0KPj4+Pj4+PiBh
Y2NvdW50IGZvciB0aGUgcG9zc2liaWxpdHkgdGhhdCBlbmRwb2ludHMgY2FuIGJlIHJlLWVuYWJs
ZWQgbWFueQ0KPj4+Pj4+PiB0aW1lcy4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gRXhhbXBsZSBsb2cgc3Bs
YXQ6DQo+Pj4+Pj4+DQo+Pj4+Pj4+IAlkd2MzIGE2MDAwMDAuZHdjMzogRmlmb3NpemUoMzcxNykg
PiBSQU0gc2l6ZSgzNDYyKSBlcDNpbiBkZXB0aDoyMTc5NzMxMjcNCj4+Pj4+Pj4gCWNvbmZpZ2Zz
LWdhZGdldCBnYWRnZXQ6IHVfYXVkaW9fc3RhcnRfY2FwdHVyZTo1MjEgRXJyb3IhDQo+Pj4+Pj4+
IAlkd2MzIGE2MDAwMDAuZHdjMzogcmVxdWVzdCAwMDAwMDAwMDBiZTEzZTE4IHdhcyBub3QgcXVl
dWVkIHRvIGVwM2luDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRoaXMgaXMgZWFzaWx5IGZpeGVkIGJ5IGJh
aWxpbmcgb3V0IG9mIGR3YzNfZ2FkZ2V0X3Jlc2l6ZV90eF9maWZvcygpDQo+Pj4+Pj4+IGlmIGFu
IGVuZHBvaW50IGlzIGFscmVhZHkgcmVzaXplZCwgYXZvaWRpbmcgdGhlIGNhbGN1bGF0aW9uIGVy
cm9yDQo+Pj4+Pj4+IHJlc3VsdGluZyBmcm9tIGFjY3VtdWxhdGluZyB0aGUgRVAncyBGSUZPIGRl
cHRoIHJlcGVhdGVkbHkuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEZpeGVzOiA5ZjYwN2EzMDlmYmU5ICgi
dXNiOiBkd2MzOiBSZXNpemUgVFggRklGT3MgdG8gbWVldCBFUCBidXJzdGluZyByZXF1aXJlbWVu
dHMiKQ0KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYWNrIFBoYW0gPGphY2twQGNvZGVhdXJvcmEu
b3JnPg0KPj4+Pj4+PiAtLS0NCj4+Pj4+Pj4gIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgfCA0
ICsrKysNCj4+Pj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4+Pj4+Pj4N
Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJz
L3VzYi9kd2MzL2dhZGdldC5jDQo+Pj4+Pj4+IGluZGV4IDgwNGI1MDU0ODE2My4uYzY0N2M3NmQ3
MzYxIDEwMDY0NA0KPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+Pj4+
Pj4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+Pj4+Pj4gQEAgLTc0Nyw2ICs3
NDcsMTAgQEAgc3RhdGljIGludCBkd2MzX2dhZGdldF9yZXNpemVfdHhfZmlmb3Moc3RydWN0IGR3
YzNfZXAgKmRlcCkNCj4+Pj4+Pj4gIAlpZiAoIXVzYl9lbmRwb2ludF9kaXJfaW4oZGVwLT5lbmRw
b2ludC5kZXNjKSB8fCBkZXAtPm51bWJlciA8PSAxKQ0KPj4+Pj4+PiAgCQlyZXR1cm4gMDsNCj4+
Pj4+Pj4gIA0KPj4+Pj4+PiArCS8qIGJhaWwgaWYgYWxyZWFkeSByZXNpemVkICovDQo+Pj4+Pj4+
ICsJaWYgKGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0dUWEZJRk9TSVooZGVwLT5udW1iZXIg
Pj4gMSkpKQ0KPj4+Pj4+PiArCQlyZXR1cm4gMDsNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiAgCXJhbTFf
ZGVwdGggPSBEV0MzX1JBTTFfREVQVEgoZHdjLT5od3BhcmFtcy5od3BhcmFtczcpOw0KPj4+Pj4+
PiAgDQo+Pj4+Pj4+ICAJaWYgKChkZXAtPmVuZHBvaW50Lm1heGJ1cnN0ID4gMSAmJg0KPj4+Pj4+
Pg0KPj4+Pj4NCj4+Pj4+IEhpIFRoaW5oLA0KPj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IFRoaXMgc2Vl
bXMgbGlrZSBhIHdvcmthcm91bmQgbW9yZSB0aGFuIGEgZml4LiBBcyBwcmV2aW91c2x5IHBvaW50
ZWQgb3V0LA0KPj4+Pj4+IHRoZXJlIHdpbGwgYmUgcHJvYmxlbXMgd2hlbiB0aGVyZSBhcmUgbXVs
dGlwbGUgYWx0ZXJuYXRlIHNldHRpbmcNCj4+Pj4+PiBpbnRlcmZhY2UgWzJdLiBJZiB3ZSdyZSBk
b2luZyB0aGlzIHdheSwgYXJlIHdlIHByb3Blcmx5IGFsbG9jYXRpbmcgdGhlDQo+Pj4+Pj4gZmlm
byBzaXplIGZvciB0aGUgYWx0ZXJuYXRlIHNldHRpbmcgdGhhdCByZXF1aXJlcyB0aGUgbW9zdCBm
aWZvIHNpemUgYW5kDQo+Pj4+Pj4gbm90IGp1c3QgdGhlIGZpcnN0IGFsdC1zZXR0aW5nIDA/IEFs
c28gZGlmZmVyZW50IGFsdC1zZXR0aW5nIGNhbiBoYXZlDQo+Pj4+Pg0KPj4+Pj4gRWFjaCBhbHQg
aW50ZXJmYWNlIHdpbGwgY2FsbCB1c2JfZXBfYXV0b2NvbmZpZygpIHdoaWNoIHNob3VsZCBiZQ0K
Pj4+Pj4gYXNzaWduZWQgZGlmZmVyZW50IGVuZHBvaW50IG51bWJlcnMuICBUaGlzIHdvdWxkIG1l
YW4gdGhhdCBpZiBhbHQgaW50ZiMwDQo+Pj4+PiBnZXRzIHNlbGVjdGVkLCBhbmQgRVAgaXMgZW5h
YmxlZCwgdGhlbiB3ZSB3aWxsIHJlc2l6ZSB0aGUgVFhGSUZPIGFuZCBtYXANCj4+Pj4+IHRoYXQg
RklGTyB0byB0aGUgcGh5c2ljYWwgRVAuICBUaGVuIHdoZW4vaWYgdGhlIGhvc3QgcmVxdWVzdHMg
dGhlIG90aGVyDQo+Pj4+PiBhbHQgaW50ZiMxLCBhbmQgdGhhdCBjYWxscyBFUCBlbmFibGUsIHRo
ZW4gdGhlIGxvZ2ljIHdpbGwgdGhlbiBhdHRlbXB0DQo+Pj4+PiB0byByZXNpemUgYmFzZWQgb24g
dGhlIHBhcmFtZXRlcnMsIGFuZCBhZ2FpbiBtYXAgdGhhdCBGSUZPIHRvIHRoZQ0KPj4+Pj4gcGh5
c2ljYWwgRVAuIChzaW5jZSB3ZSBjYWxsIGF1dG9jb25maWcgb24gYWxsIGludGVyZmFjZXMsIHRo
ZXkgc2hvdWxkIGJlDQo+Pj4+PiBhc3NpZ25lZCBkaWZmZXJlbnQgZW5kcG9pbnRzKQ0KPj4+DQo+
Pj4gSGkgVGhpbmgsDQo+Pj4NCj4+Pj4NCj4+Pj4gVGhhdCdzIG5vdCB0cnVlLiBEaWZmZXJlbnQg
YWx0LXNldHRpbmdzIG9mIGFuIGludGVyZmFjZSBjYW4gc2hhcmUNCj4+Pj4gZW5kcG9pbnQgbnVt
YmVycy4gVGhpcyBpcyBvZnRlbiB0aGUgY2FzZSBmb3IgVUFTUCBkcml2ZXIgd2hlcmUNCj4+Pj4g
YWx0LXNldHRpbmcgMCBpcyBmb3IgQk9UIHByb3RvY29sIGFuZCBhbHQtc2V0dGluZyAxIGlzIFVB
U1AuIFdoZW4gd2UNCj4+Pj4gc3dpdGNoIGFsdC1zZXR0aW5nLCB3ZSBkaXNhYmxlIHRoZSBjdXJy
ZW50IGVuZHBvaW50cyBhbmQgZW5hYmxlIHRoZQ0KPj4+PiBvbGQvbmV3IG9uZXMuDQo+Pj4+DQo+
Pj4NCj4+PiBUaGFua3MgZm9yIHBvaW50aW5nIHRoYXQgdXNlIGNhc2Ugb3V0LiAgTWF5YmUgd2Ug
Y2FuIGNvbnNpZGVyIHNlZWluZyBpZg0KPj4+IHdlIGNhbiB3YWxrIHRocm91Z2ggYWxsIGFsdGVy
bmF0ZSBpbnRlcmZhY2VzIGZvciBhIHBhcnRpY3VsYXIgZnVuY3Rpb24sDQo+Pj4gYW5kIHJlc2l6
ZSBmb3IgdGhlIGxhcmdlc3Qgc2V0dGluZz8gIFRoYXQgbWlnaHQgYmUgYSBwb3NzaWJsZQ0KPj4+
IGltcHJvdmVtZW50IG1hZGUgdG8gdGhlIGNoZWNrX2NvbmZpZygpIGZ1bmN0aW9uLiAgTGV0IG1l
IHN0YXJ0IG1ha2lnbg0KPj4+IHRoZSBjaGFuZ2VzIGZvciB0aGlzIGFuZCB2ZXJpZnlpbmcgaXQu
DQo+Pj4NCj4+DQo+PiBUaGFua3MhDQo+Pg0KPj4gQ3VycmVudGx5IHRoZSBnYWRnZXQgY29uZmln
dXJlcyBlYXJseSBhbmQgaW5mb3JtcyB0aGUgZ2FkZ2V0IGRyaXZlciBvZg0KPj4gaG93IG1hbnkg
ZW5kcG9pbnRzIGFyZSBhdmFpbGFibGUsIHdoaWNoIGRvZXNuJ3QgbGVhdmUgbXVjaCByb29tIGZv
ciB0aGUNCj4+IGdhZGdldCB0byBkbyBvcHRpbWl6YXRpb24vcmVjb25maWd1cmF0aW9uLg0KPj4N
Cj4+IElmIHRoZXJlJ3MgYW4gb3B0aW9uIGZvciB0aGUgY29tcG9zaXRlIGxheWVyIHRvIGluZm9y
bSB0aGUgY29udHJvbGxlcg0KPj4gZHJpdmVyIG9mIHRoZSBlbnRpcmUgY29uZmlndXJhdGlvbiwg
dGhlbiB3ZSBjYW4gdGFrZSBhZHZhbnRhZ2Ugb2YgbW9yZQ0KPj4gZHdjMyBjb250cm9sbGVyIGNh
cGFiaWxpdHkvZmxleGliaWxpdHkgKG5vdCBqdXN0IHJlc2l6aW5nIHR4ZmlmbykuDQo+Pg0KPj4+
Pj4NCj4+Pj4+IEkgYWdyZWUgdGhhdCB0aGVyZSBpcyBjdXJyZW50bHkgYSBsaW1pdGF0aW9uIGJl
Y2F1c2Ugd2UgYXJlIGdvaW5nIHRvDQo+Pj4+PiByZXNlcnZlIGF0IG1pbmltdW0gMSBGSUZPIGZv
ciBCT1RIIGFsdCBpbnRlcmZhY2VzLCBldmVuIHRob3VnaCB0aGVyZSBpcw0KPj4+Pj4gb25seSAx
IGludGVyZmFjZSBhY3RpdmUgYXQgYSB0aW1lLiAgVGhlIG1pc3NpbmcgbG9naWMgdGhhdCB3ZSBt
aWdodCBiZQ0KPj4+Pj4gbWlzc2luZyBpcyBzZWVpbmcgaG93IHdlIGNhbiByZS1wdXJwb3NlIHRo
ZSBGSUZPIHRoYXQgaXMgYmVpbmcgZGlzYWJsZWQuDQo+Pj4+PiAgSG93ZXZlciwgSSB0aGluayBK
YWNrJ3MgZml4IGhlcmUgd291bGQgYmUgYXBwbGljYWJsZSB0byB0aGUgaW1wcm92ZW1lbnQNCj4+
Pj4+IGluIGxvZ2ljIHRvIHJlLXVzZS9yZS1hc3NpZ24gRklGTyBzcGFjZSBhbGxvY2F0ZWQgYnkg
ZGlzYWJsZWQgRVBzIGFsc28uDQo+Pj4+Pg0KPj4+Pg0KPj4+PiBJbXByb3ZlbWVudCBpcyBhbHdh
eXMgZ3JlYXQuIEkganVzdCBob3BlIHdlIGRvbid0IGp1c3Qgc3RvcCB3aGVyZSB3ZSBhcmUNCj4+
Pj4gbm93LiBTaW5jZSB5b3UncmUgd29ya2luZyBvbiB0aGlzIGZlYXR1cmUgYXQgdGhlIG1vbWVu
dCwgaXQgd291bGQgYmUNCj4+Pj4gZ29vZCB0byBhbHNvIHJlc29sdmUgc29tZSBvZiB0aGUgb3V0
c3RhbmRpbmcgaXNzdWVzIGFzIEphY2sncyBmaXggc2VlbXMNCj4+Pj4gdG8gYmUgaW5jb21wbGV0
ZS4NCj4+Pj4NCj4+Pg0KPj4+IElmIHdlIGltcGxlbWVudCB0aGUgaW1wcm92ZW1lbnQgbWVudGlv
bmVkIGFib3ZlLCBJIHRoaW5rIEphY2sncyBmaXggd2lsbA0KPj4+IGJlIGFwcGxpY2FibGUgdGhl
cmUgYXMgd2VsbC4gIElmIHdlIHJlc2l6ZSBmb3IgdGhlIGxhcmdlc3QgYWx0ZXJuYXRlDQo+Pj4g
aW50ZXJmYWNlLCB0aGVuIHRoZXJlIHdvdWxkIGJlIG5vIHJlYXNvbiBmb3IgdXMgdG8gcmVzaXpl
IGFnYWluLg0KPj4+DQo+PiBBcyBsb25nIGFzIHlvdSBoYXZlIHRoZSBhYm92ZSBhcyBwYXJ0IG9m
IHlvdXIgcm9hZG1hcCwgSSBkb24ndCBtaW5kDQo+PiBKYWNrJ3MgZml4IGZvciBub3cuDQo+IA0K
PiBUaGFua3MgZm9yIHlvdXIgaW5wdXQgYXMgYWx3YXlzIFRoaW5oLiAgRG9lcyB0aGUgcGF0Y2gg
c3RpbGwgbG9vayBvayBpbg0KPiBpdHMgY3VycmVudCBzdGF0ZT8gIExhc3QgdGltZSBJIGhhZCBy
ZXNwb25kZWQgdG8gRmVsaXBlIHRoYXQgSSB3b3VsZCB0cnkNCg0KVFggZW5kcG9pbnRzIHNob3Vs
ZCBoYXZlIG5vbi16ZXJvIEdUWEZJRk9TSVouIFVzaW5nIHRoZSByZWdpc3RlciBhcyBhDQpmbGFn
IHRvIGNoZWNrIHdoZXRoZXIgaXQncyBiZWVuIHJlc2l6ZWQgaXMgbm90IG9rLiBBbHNvLCB3aGF0
IGhhcHBlbmVkDQphZnRlciByZXNpemluZyB0aGUgdHhmaWZvPyBEbyB5b3UgcmVzdG9yZSBpdHMg
cHJldmlvdXMgZGVmYXVsdCB2YWx1ZT8NCg0KPiB0byBlbnRlcnRhaW4gYWRkaW5nIGFuIGV4cGxp
Y2l0IGZsYWcgdG8ga2VlcCB0cmFjayBvZiB3aGV0aGVyIGFuIEVQIGhhZA0KPiBiZWVuIHJlc2l6
ZWQgeWV0IG9yIG5vdC4gIFdoZW4gdHJ5aW5nIHRvIGltcGxlbWVudCB0aGlzIGFzIGFub3RoZXIN
Cj4gRFdDM19FUF8qIGJpdCBmb3IgZGVwLT5mbGFncyB3ZSdkIHRoZW4gbmVlZCB0byByZXRhaW4g
dGhpcyBmbGFnIGFjcm9zcw0KPiBlcF9kaXNhYmxlL2VuYWJsZSBjYWxscywgc28gaXQgbG9va3Mg
YSB0aW55IGJpdCBjdW1iZXJzb21lIGJlY2F1c2UNCj4gZGVwLT5mbGFncyBpc24ndCBuZWF0bHkg
MCBhbnltb3JlIDotUC4NCj4gDQo+IFNvIGVwX2Rpc2FibGUoKSB3b3VsZCBuZWVkIHRvIGxvb2sg
c29tZXRoaW5nIGxpa2UgdGhpczoNCj4gDQo+ICBzdGF0aWMgaW50IF9fZHdjM19nYWRnZXRfZXBf
ZGlzYWJsZShzdHJ1Y3QgZHdjM19lcCAqZGVwKQ0KPiAgew0KPiAgLi4uDQo+IAlkZXAtPnN0cmVh
bV9jYXBhYmxlID0gZmFsc2U7DQo+IAlkZXAtPnR5cGUgPSAwOw0KPiAtCWRlcC0+ZmxhZ3MgPSAw
Ow0KPiArCWRlcC0+ZmxhZ3MgJj0gRFdDM19FUF9UWEZJRk9fUkVTSVpFRDsNCg0KSSB0aGluayB5
b3UgbWVhbiB0aGlzPw0KZGVwLT5mbGFncyAmPSB+RFdDM19FUF9UWEZJRk9fUkVTSVpFRDsNCg0K
PiANCj4gCXJldHVybiAwOw0KPiAgfQ0KPiANCj4gVGhlIGZsYWcgd291bGQgYmUgaW5pdGlhbGx5
IHNldCBpbiBkd2MzX2dhZGdldF9yZXNpemVfdHhfZmlmb3MoKSBhbmQNCj4gYWxzbyB3b3VsZCBu
ZWVkIHRvIGJlIGNoZWNrZWQgdGhlcmUgYXMgd2VsbCB0byBhdm9pZCByZS1yZXNpemluZy4gIEl0
DQo+IHdvdWxkIHRoZW4gZ2V0IGNsZWFyZWQgaW4gZHdjM19nYWRnZXRfY2xlYXJfdHhfZmlmb3Mo
KS4NCj4gDQo+IElzIHRoaXMgc3RpbGwgcHJlZmVyYWJsZSB0byB0aGUgY3VycmVudCBwYXRjaCB3
aXRoIGp1c3QgdGhlIHNpbmdsZQ0KPiByZWdpc3RlciByZWFkPw0KPiANCg0KV2hhdCBpZiB3ZSBj
aGFuZ2UgdGhlIGNvbmZpZ3VyYXRpb24gZnJvbSB0aGUgY29uZmlnZnM/IFdvdWxkIHRoZSBmbGFn
DQpwZXJzaXN0PyBJZiB0aGF0J3MgdGhlIGNhc2UsIHRoYXQgZG9lc24ndCBsb29rIHJpZ2h0Lg0K
DQpUaGFua3MsDQpUaGluaA0K
