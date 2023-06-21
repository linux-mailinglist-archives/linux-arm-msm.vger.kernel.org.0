Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 764F1738200
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 13:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbjFUKiD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 06:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232441AbjFUKhL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 06:37:11 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2062.outbound.protection.outlook.com [40.107.117.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80948E57
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 03:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cm0yVumoMj8L5NcYntLe4TtH6yax1C7SkO1UWXX/uG20cqRrrBykejTHiMPEFFKZLgzfXdTuXne691xrISuaJhOVelu7qVkf5oYPzp7zAHZKeozjgAkDrpmuH8RKPm6vefZiI/nz6gBbSgrQs6ne2aCo/z7fgQTsTQP8F+PXpPvdMkiTDWvgtj5w5n1Q1MPrscQX2w5Qm3TZHLaS8WuZgG7AaknWeB3YCfqKFkKkfVCzwkXnxom7wOyv0+M5Gh1w1lGY2l8Yd9foLmoGA0zSjtzFGo5pOZHG5PyoGCW1U9Cqzf85XboBnK52MKCI21Za3tmy48ZoK6UvYmPN+pG5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FceW7JXb2fhcYQC+Cwk4ql/WQM5t0aj1UQANNElR7oM=;
 b=PDwWKhIP57EKM6IvJYAPy6Mic5R2ovMAgRi35mqzdjrhWxlkXgMMJ3RwtbBDZfOR5wAfijVNvCi8r6SgTMP5f6PQAyKRPAELiTUY3E3p+YrYjWLLe5uZLohqm/N8yoTaQ8ldAT/EbM4Hif/A3U3kFbW3QXkPLQI2LcENnD5iUYxe/26NzxHO7AzBI0aH1HAv8EmK+c59iEhycwQIQfmoAhCcZpWaNlVOvTE7whXgs2q9bKw503XD2CVh+sXAGKcX/tijU7KDoi3j3FrbvuI7iA7b78SWMScxusDczzyarr6aycK0SF1uC9dY5J2xZsFYRHJOKwHzx4C6XvYvnr0hww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FceW7JXb2fhcYQC+Cwk4ql/WQM5t0aj1UQANNElR7oM=;
 b=AeG1cqJeMUBJJd5L5aECkOGHlyGU/R9REtRHf8Th1xc4I9TCRmoRC1OEfUV989nq1MwqetMDgmwRIkaEfzqFQYUuHl9uLIB1AdiMY1S5onFktqDNCYnLQPUPtHB3Tp6NOUVD/X/fJvvZKmAVl5KA2imSuVcENel6IxUVbAvojtQ=
Received: from SEZPR06MB6087.apcprd06.prod.outlook.com (2603:1096:101:e7::6)
 by PUZPR06MB5724.apcprd06.prod.outlook.com (2603:1096:301:f4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 10:36:36 +0000
Received: from SEZPR06MB6087.apcprd06.prod.outlook.com
 ([fe80::7fc8:2717:74f9:a30a]) by SEZPR06MB6087.apcprd06.prod.outlook.com
 ([fe80::7fc8:2717:74f9:a30a%6]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 10:36:36 +0000
From:   =?utf-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke.xin@quectel.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke_xinanwen@163.com>
CC:     "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        "slark_xiao@163.com" <slark_xiao@163.com>,
        "fabio.porcedda@gmail.com" <fabio.porcedda@gmail.com>,
        "koen.vandeputte@citymesh.com" <koen.vandeputte@citymesh.com>,
        "song.fc@gmail.com" <song.fc@gmail.com>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "mhi@lists.linux.dev" <mhi@lists.linux.dev>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        =?utf-8?B?SmVycnkgTWVuZyjokpnmnbAp?= <jerry.meng@quectel.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjRdIGJ1czogbWhpOiBob3N0OiBwY2lfZ2VuZXJp?=
 =?utf-8?B?YzogQWRkIHN1cHBvcnQgZm9yIHF1ZWN0ZWwncyBuZXcgRU0xNjBSLUdMIHBy?=
 =?utf-8?Q?oduct?=
Thread-Topic: [PATCH v4] bus: mhi: host: pci_generic: Add support for
 quectel's new EM160R-GL product
Thread-Index: AQHZmevzYyXEhWoR5kmBZxfZxNAUJK+CnOUAgAPRV9CADrLVgA==
Date:   Wed, 21 Jun 2023 10:36:36 +0000
Message-ID: <SEZPR06MB608764064A2D2E91117C2610845DA@SEZPR06MB6087.apcprd06.prod.outlook.com>
References: <d86d1878598b633b437f87e5b75196079-6-23kernel.org@g.corp-email.com>
 <20230609153800.GC6847@thinkpad>
 <SEZPR06MB6087B403321E6528CB5589428454A@SEZPR06MB6087.apcprd06.prod.outlook.com>
In-Reply-To: <SEZPR06MB6087B403321E6528CB5589428454A@SEZPR06MB6087.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quectel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB6087:EE_|PUZPR06MB5724:EE_
x-ms-office365-filtering-correlation-id: cf842f8b-4da4-485c-42cd-08db724363a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bO+K5ggrgKiqzt2G78kkW9qZ7yo9BKvgTF6VoKGoA7z+0l9PaXEjQKypJoVODMbFIOyIvy0uNbFlYFVezepb2RExYf347f8WLVFBcpTlTqqzIIu8wFpPH6sqjnnqILSfozLrnAn8Fahr2T4cVjSlKI34ZO9ohAo6WaXF1WsZsXgJlqk4nA5GsvPioQU+1nzKBkU9/34FgZpGJ0fuK/XhZx1BJ38wts7KilUGeWbjn5/b+3tRyv5f8xUR8XYY7uJV1uoro1jeGpspJjA39yWZuEJa9xF7Z6xGHbD3dSwGOHg1QFypuGYYXLO0ERDtZBnvSIrqg156jm5WkU2RR9go1oTAx9iM7uf0vfjmPZ/F6tCaymcuim6Ry7073kW0h68xoBwh0fOwXYg5cg7qPHM2TTfwHurkJ8QkF0BKEF2uWomSCS81Ji/A+TQ77u04LFGzWZtlm9QHAsIW44/LoEfwxlBfwWH+ZHCmfXL73M7lXCBfxFXJbg4fxldgiTlrlNY9BD6hZ7/+sZZJSVECInpfrON002TfQH5J5Rc6ksDFSeBmkAuaI4UsTAlr+XmwUYN1warC3v4EC9hAKzEsj7zqR1KA7M+AM5Y706WHUSNh3iOJwR25IEwiat0dgovMbRLt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB6087.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199021)(7696005)(38100700002)(6506007)(71200400001)(122000001)(107886003)(9686003)(26005)(186003)(83380400001)(55016003)(110136005)(41300700001)(86362001)(54906003)(38070700005)(478600001)(224303003)(316002)(66556008)(85182001)(66946007)(66446008)(64756008)(66476007)(15974865002)(4326008)(33656002)(8936002)(76116006)(52536014)(5660300002)(2906002)(7416002)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekRlczExTWxrODlQclh1eWhlYmhwa2ZLeUNhaWZ5Z3RuS0I4M1M3aW41VlFs?=
 =?utf-8?B?ZDJvRXZXWXdjWi9DZ3ZPZHhpNE8zT25aTGZ0ejgzQ2lLd0JOaDJ2bDJmMmxl?=
 =?utf-8?B?K25JZkVPSndIUGRIL2NCSm5xRkp2Q3VGODFOOHJFUXp3SW1ISlAwRGRkbGto?=
 =?utf-8?B?Mm4wSCsrN2NEdHBsQVRYQ3Z6dnJ4Z2kxRlNWSVRXbTJKN1NwZmxyc3VWb05h?=
 =?utf-8?B?MXpyS3dMbitSeDhZTU81Z2VZUzdqVzgwWldlQTNCd3c1bE5UcWN5TWord0pp?=
 =?utf-8?B?aXZYU1E5UUttcDBEanExMHllTE1TWTBrWkRDTlR4YW16eHJDNXBWYmxaVkt6?=
 =?utf-8?B?VVljRUJ3ZzBxVCtyc21yeExsbjBhZmZNMUZMT09yakN6Z0IzMUZTSXY0SVlV?=
 =?utf-8?B?YVd4bmVHM2Q1VW9wT2xMU0h4STdFaGNSN2REK3F3a0h1S3lvMXpTM3NZQWZG?=
 =?utf-8?B?UjRhSmM1clljcDVxZzRlMXFpT09oMGRGWmtXdkN2NkU0ai9meVMyY0d1NThk?=
 =?utf-8?B?ZFJxeE54M1VTcDRMUGJHVUFNRGxuRGJRcnpkQkEza2xlRDRNaTgxaHZhN3Fk?=
 =?utf-8?B?OVF2eXBPblU1YlYxVDhDbVBZWU5WRlB5RWhjbkx5bnUxSitGclhMRU1YbnF0?=
 =?utf-8?B?c3c1dTNpNVNkWVppUXk0SFpnemJVaWZWTVFFdWt0WTVzK3FKc011Sy8zclds?=
 =?utf-8?B?RHA0ZWRsNjZNb2s4NFBFYnI2YzhJOEd4NlhGRVdsQmlGSzB6RFZLb3pxYnd1?=
 =?utf-8?B?bWk2b1oyYlN6eExFQzY5enFUcytqR0ppZnlxVllobDhab0VublJ3OGYzdG5Q?=
 =?utf-8?B?aXhJTzgvYitWaWJOTlp2V3VwMnJwK0VLOUhXZm9USlNsNEpaSFZsdUk5cCs4?=
 =?utf-8?B?b2JpSWwzbkwwbGI0dVY4cnY2YlRyeWJxeGswTi8xc3JpbUdRRjkvQTlDVksw?=
 =?utf-8?B?RzlpM0dzRnY5Zk5OUWZ4L0UveCthZHgxUVdXQWFQajljdE13VFZHVUwzYXd3?=
 =?utf-8?B?aktNMnlWNWdtWWFrUlErelVHbmVhckI2ZXM0c0dnZzN3M3dQaHpaRTdEQTZH?=
 =?utf-8?B?NENrdUxYNlg0L09zQjNKRXJrT2VCRjVLcFdXWHpPZWxyNVh3VXRNbnpFdFFN?=
 =?utf-8?B?dU9EYUhVVkFYSzZWVG1CN1BhMy9UYTFXQWtFWFVpNTR0OUxOQ0FnSHNvQUlz?=
 =?utf-8?B?Q1RoN1BReTJOZTJGSVFPQkVGQy9wcUg4ZnVLZ29ZVE9NZWVTcFZ5dzZhTzlk?=
 =?utf-8?B?YjhUWjcwQkFCTFRCa2RDN2hNUk9JSUdmaDZheTNNL3hoQzFDSzVvNjlMN2or?=
 =?utf-8?B?UUNyZ3QvRkoyTXVVN2Z4eC9QbUJ3dVNWcks2UzVvMzd4dkhLNkpPNmFVWlBo?=
 =?utf-8?B?RUtrVTJ4ekxKMW5iVDlUVC9NdVNwT1BMQU1pb2tqVGxnNmZWUlpzalpvRkIz?=
 =?utf-8?B?b2FsWXJmQlY0RVgwNURKcUU2NTRPNUdjUDJSaVY1STVJU28wNFdyUEV1VmRX?=
 =?utf-8?B?VmpjZ1F5RkdTblMwVHpiSjduSlRQMlBJYWlvZWNFWENvTzBvNzlsekZjdWZw?=
 =?utf-8?B?SFdDSVI3bDZwV05rNWF0NmZzTG40OThDV2dZdFNPZDFTeUYrZ2gyVVcyV3lS?=
 =?utf-8?B?SzBaVW9seUVDOUhzZGcvS1VWaTEyMVpLS1laejZhYXdZTndocWZzNmJRRExE?=
 =?utf-8?B?U2hFMFUweVIrejBzUDI2bWtJbEwrY1o1YnA4QUU3VmNIYjAwQ3BvbjB6c09x?=
 =?utf-8?B?TzV2Qkx4SVpPdzliWGdUc2VpR2VXVnVUOXRtdW9FWS94WkNXdkw5NTBmNVFs?=
 =?utf-8?B?ZjdxZUVmU2VESmx4YzA1a2dhWDcxbUh1OWJtY3NxeG94UzEzN2J2ck1LK2li?=
 =?utf-8?B?RDlRZXgwQWt2WFBGM2xiRUhSdGhhWFZxNWJ1cHpZazRpUG41WlloSUxCZG4v?=
 =?utf-8?B?RmdUb25OK25DY012Y2ZMa3VXTlUxdjN1QnhZQUJGOWJ5dWp1cHFSSnowcERs?=
 =?utf-8?B?dHplWk9JbTVlYWxzUGdGZzM1OUR5QVc4VmFBbTBTOWZqRGI5Wmh5dWY3STV6?=
 =?utf-8?B?LzZwSmVwVVQ0SGVTbkJuSHBlRzh1RG52Qy9zelZyMTRsVXBBT05JUDI2QVRQ?=
 =?utf-8?Q?yQ0rjYvaCIwwlJ5bCvmSVV2i1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB6087.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf842f8b-4da4-485c-42cd-08db724363a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 10:36:36.3231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d+6Fl6I6T8sTR7c04WaFcv81NOhWBAK0s6rOuBqLvlO7Kbau9bSLhuwR9VvwLC80ZdYDfml0LBSzr61Yw3eqRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5724
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgTWFuaQ0KDQpSZWdhcmRpbmcgW1BBVENIIHY0XSBzdWJtaXNzaW9uIGZvciByZXZpZXcsIEkg
d291bGQgbGlrZSB0byBjb25maXJtIHdpdGggeW91IHdoZXRoZXIgdGhlcmUgYXJlIGFueSBkZWZl
Y3RzIHRoYXQgbmVlZCB0byBiZSBjb3JyZWN0ZWQ/DQoNCg0K6L6b5a6J5paHwqAgRHVrZSBYaW4g
fCBTb2Z0d2FyZSBEZXBhcnRtZW50IElYIEVuZ2luZWVyIHwgUXVlY3RlbCBXaXJlbGVzcyBTb2x1
dGlvbnMgQ28uLCBMdGQuIA0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCANCk1vYmlsZTogKzg2LTE1
Mzc1NDU2MTgzIHwgRW1haWwgOiBEdWtlLnhpbkBxdWVjdGVsLmNvbcKgIHwgVGVsOiArODYtMDU1
MS02NTg2OTM4Ni04NjMyDQpXZWJzaXRlOiB3d3cucXVlY3RlbC5jb23CoCB8IFFROiA2MDI2NTkw
NzIgfCBXZWNoYXQ6IDE1Mzc1NDU2MTgzDQoNCkJ1aWxkaW5nwqAxLUMswqBDaGluYcKgU3BlZWNo
wqBWYWxsZXnCoEFyZWHCoEEswqAzMzM1wqBYaXlvdcKgUm9hZCzCoEhpZ2gtdGVjaMKgWm9uZSzC
oEhlZmVpLMKgQW5odWnCoDIzMDA4OCzCoENoaW5hwqDCoMKgIA0K5a6J5b6955yB5ZCI6IKl5biC
6auY5paw5Yy65Lmg5Y+L6LevMzMzNeWPt+S4reWbve+8iOWQiOiCpe+8ieWbvemZheaZuuiDveiv
remfs+S6p+S4muWbrUHljLox5Y+35Lit6K+V5qW8IDIzMDA4OA0KSFE6IEJ1aWxkaW5nIDUsIFNo
YW5naGFpIEJ1c2luZXNzIFBhcmsgUGhhc2UgSUlJIChBcmVhIEIpLCBOby4xMDE2IFRpYW5saW4g
Um9hZCwgTWluaGFuZyBEaXN0cmljdCwgU2hhbmdoYWkgMjAwMjMzLCBDaGluYQ0K5oC76YOo77ya
5LiK5rW35biC6Ze16KGM5Yy655Sw5p6X6LevMTAxNuWPt+enkeaKgOe7v+a0sjPmnJ/vvIhC5Yy6
77yJNeWPt+alvMKgIDIwMDIzMw0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6
IER1a2UgWGluKOi+m+WuieaWhykgDQrlj5HpgIHml7bpl7Q6IDIwMjPlubQ25pyIMTLml6UgMTA6
MDINCuaUtuS7tuS6ujogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+OyBE
dWtlIFhpbijovpvlronmlocpIDxkdWtlX3hpbmFud2VuQDE2My5jb20+DQrmioTpgIE6IGxvaWMu
cG91bGFpbkBsaW5hcm8ub3JnOyBzbGFya194aWFvQDE2My5jb207IGZhYmlvLnBvcmNlZGRhQGdt
YWlsLmNvbTsga29lbi52YW5kZXB1dHRlQGNpdHltZXNoLmNvbTsgc29uZy5mY0BnbWFpbC5jb207
IGJoZWxnYWFzQGdvb2dsZS5jb207IG1oaUBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS1tc21A
dmdlci5rZXJuZWwub3JnOyBKZXJyeSBNZW5nKOiSmeadsCkgPGplcnJ5Lm1lbmdAUVVFQ1RFTC5D
T00+DQrkuLvpopg6IOWbnuWkjTogW1BBVENIIHY0XSBidXM6IG1oaTogaG9zdDogcGNpX2dlbmVy
aWM6IEFkZCBzdXBwb3J0IGZvciBxdWVjdGVsJ3MgbmV3IEVNMTYwUi1HTCBwcm9kdWN0DQoNCkhp
IE1hbmkNCg0KT2suIFByZXZpb3VzbHkgSSB1c2VkIHRvIHNlZSBzYW1lIG1vZHVsZXMgaGF2aW5n
IHR3byBkaWZmZXJlbnQgSURzIGJlY2F1c2UgdGhleSBzaGFyZSBkaWZmZXJlbnQgYmFzZWxpbmUg
KGZyb20gcWNvbSkuIEkgd2lsbCBhbWVuZCB0aGUgY29tbWl0IG1lc3NhZ2UgYWNjb3JkaW5nbHku
DQpGb3IgZnV0dXJlIHBhdGNoZXMsIHBsZWFzZSBpbmNsdWRlIHRoZXNlIGluZm8gaW4gdGhlIGNv
bW1pdCBtZXNzYWdlLg0KPj4gIEdvdCBpdC4gSW4gdGhlIGZ1dHVyZSBwYXRjaCwgSSB3aWxsIGFk
ZCB0aGUgY29ycmVzcG9uZGluZyBzdXBwbGVtZW50YXJ5IGluZm9ybWF0aW9uIChzdWNoIGFzIGJh
c2VsaW5lKSB0byBtYWtlIGEgZGlmZmVyZW5jZS4NCiAgDQogIFRoYW5rIHlvdSB2ZXJ5IG11Y2gg
Zm9yIHlvdXIgcGF0aWVudCByZXZpZXcgYWdhaW4uDQoNCui+m+WuieaWh8KgIER1a2UgWGluIHwg
U29mdHdhcmUgRGVwYXJ0bWVudCBJWCBFbmdpbmVlciB8IFF1ZWN0ZWwgV2lyZWxlc3MgU29sdXRp
b25zIENvLiwgTHRkLiANCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgDQpNb2JpbGU6ICs4Ni0xNTM3
NTQ1NjE4MyB8IEVtYWlsIDogRHVrZS54aW5AcXVlY3RlbC5jb23CoCB8IFRlbDogKzg2LTA1NTEt
NjU4NjkzODYtODYzMg0KV2Vic2l0ZTogd3d3LnF1ZWN0ZWwuY29twqAgfCBRUTogNjAyNjU5MDcy
IHwgV2VjaGF0OiAxNTM3NTQ1NjE4Mw0KDQpCdWlsZGluZ8KgMS1DLMKgQ2hpbmHCoFNwZWVjaMKg
VmFsbGV5wqBBcmVhwqBBLMKgMzMzNcKgWGl5b3XCoFJvYWQswqBIaWdoLXRlY2jCoFpvbmUswqBI
ZWZlaSzCoEFuaHVpwqAyMzAwODgswqBDaGluYcKgwqDCoCANCuWuieW+veecgeWQiOiCpeW4gumr
mOaWsOWMuuS5oOWPi+i3rzMzMzXlj7fkuK3lm73vvIjlkIjogqXvvInlm73pmYXmmbrog73or63p
n7PkuqfkuJrlm61B5Yy6MeWPt+S4reivlealvCAyMzAwODgNCkhROiBCdWlsZGluZyA1LCBTaGFu
Z2hhaSBCdXNpbmVzcyBQYXJrIFBoYXNlIElJSSAoQXJlYSBCKSwgTm8uMTAxNiBUaWFubGluIFJv
YWQsIE1pbmhhbmcgRGlzdHJpY3QsIFNoYW5naGFpIDIwMDIzMywgQ2hpbmENCuaAu+mDqO+8muS4
iua1t+W4gumXteihjOWMuueUsOael+i3rzEwMTblj7fnp5HmioDnu7/mtLIz5pyf77yIQuWMuu+8
iTXlj7fmpbzCoCAyMDAyMzMNCg0KLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6OiBN
YW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz4gDQrlj5HpgIHml7bpl7Q6IDIw
MjPlubQ25pyIOeaXpSAyMzozOA0K5pS25Lu25Lq6OiBEdWtlIFhpbijovpvlronmlocpIDxkdWtl
X3hpbmFud2VuQDE2My5jb20+DQrmioTpgIE6IGxvaWMucG91bGFpbkBsaW5hcm8ub3JnOyBzbGFy
a194aWFvQDE2My5jb207IGZhYmlvLnBvcmNlZGRhQGdtYWlsLmNvbTsga29lbi52YW5kZXB1dHRl
QGNpdHltZXNoLmNvbTsgc29uZy5mY0BnbWFpbC5jb207IGJoZWxnYWFzQGdvb2dsZS5jb207IG1o
aUBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnOyBKZXJyeSBN
ZW5nKOiSmeadsCkgPGplcnJ5Lm1lbmdAcXVlY3RlbC5jb20+OyBEdWtlIFhpbijovpvlronmlocp
IDxkdWtlLnhpbkBxdWVjdGVsLmNvbT4NCuS4u+mimDogUmU6IFtQQVRDSCB2NF0gYnVzOiBtaGk6
IGhvc3Q6IHBjaV9nZW5lcmljOiBBZGQgc3VwcG9ydCBmb3IgcXVlY3RlbCdzIG5ldyBFTTE2MFIt
R0wgcHJvZHVjdA0KDQpPbiBUaHUsIEp1biAwOCwgMjAyMyBhdCAwMjoyOToyN0FNIC0wNzAwLCBE
dWtlIFhpbijovpvlronmlocpIHdyb3RlOg0KPiBUaGUgcHJvZHVjdCdzIHdvdWxkIHVzZSB0aGUg
c2FtZSBjb25maWcgYXMgcHJldmlvdXMgRU0xNjBSLUdMDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBE
dWtlIFhpbijovpvlronmlocpIDxkdWtlX3hpbmFud2VuQDE2My5jb20+DQoNCk1vZGlmaWVkIHRo
ZSBjb21taXQgbWVzc2FnZSBhbmQgc3ViamVjdCB0byByZWZsZWN0IHRoZSB1c2VjYXNlIGFuZCBh
cHBsaWVkIHRvIG1oaS1uZXh0IQ0KDQotIE1hbmkNCg0KPiBSZXZpZXdlZC1ieTogTWFuaXZhbm5h
biBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiBDaGFuZ2Vsb2cNCj4gDQo+
IHYzIC0+IHY0DQo+IA0KPiAqIFVwZGF0ZSBjb21taXQgbWVzc2FnZSB0byBpbmNsdWRlIHRoZSBj
aGFuZ2Vsb2cgYW5kIHJldmlld2QgdGFnLg0KPiANCj4gdjIgLT4gdjMNCj4gDQo+ICogQWRkIHBh
dGNoIENDIHRvIG1oaUBsaXN0cy5saW51eC5kZXYuDQo+IA0KPiB2MSAtPiB2Mg0KPiANCj4gKiBS
ZW1vdmUgU3BhY2UgYmVmb3JlICovIGFuZCAiZm9yIGxhcHRvcCIgZGVzY3JpcHRpb24uDQo+IC0t
LQ0KPiAgZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyB8IDMgKysrDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9i
dXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyANCj4gYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lf
Z2VuZXJpYy5jDQo+IGluZGV4IDcwZTM3YzQ5MDE1MC4uNWYyMDRiODE5ZTk1IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jDQo+ICsrKyBiL2RyaXZlcnMv
YnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMNCj4gQEAgLTU5MSw2ICs1OTEsOSBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgbWhpX3BjaV9pZF90YWJsZVtdID0gew0KPiAgCQku
ZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpICZtaGlfcXVlY3RlbF9lbTF4eF9pbmZvIH0s
DQo+ICAJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfUVVFQ1RFTCwgMHgxMDAyKSwgLyogRU0x
NjBSLUdMIChzZHgyNCkgKi8NCj4gIAkJLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSAm
bWhpX3F1ZWN0ZWxfZW0xeHhfaW5mbyB9LA0KPiArCS8qIEVNMTYwUi1HTCAoc2R4MjQpICovDQo+
ICsJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfUVVFQ1RFTCwgMHgxMDBkKSwNCj4gKwkJLmRy
aXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSAmbWhpX3F1ZWN0ZWxfZW0xeHhfaW5mbyB9LA0K
PiAgCXsgUENJX0RFVklDRShQQ0lfVkVORE9SX0lEX1FVRUNURUwsIDB4MjAwMSksIC8qIEVNMTIw
Ui1HTCBmb3IgRkNDTCAoc2R4MjQpICovDQo+ICAJCS5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxv
bmdfdCkgJm1oaV9xdWVjdGVsX2VtMXh4X2luZm8gfSwNCj4gIAkvKiBUOTlXMTc1IChzZHg1NSks
IEJvdGggZm9yIGVTSU0gYW5kIE5vbi1lU0lNICovDQo+IC0tDQo+IDIuMjUuMQ0KPiANCg0KLS0g
DQrgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NDQo=
