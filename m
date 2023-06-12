Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B24D72B547
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 04:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjFLCCY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Jun 2023 22:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbjFLCCX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Jun 2023 22:02:23 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2046.outbound.protection.outlook.com [40.107.215.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CAB09E
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 19:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNcnPi3MdaT1I9jqc4BTaYD9nNfdvzBEpK8IZlCN+IupZP3tR73jNdvGkoPJX0kDjUA41Um8X1fWVnQPhL9z+0qZds8SkVoj459qvPQmCgZkbXGh8G71cTGYUlUy/1p/jAMHBYQ2x6Ia8J6QKYQljIdx81+usds7dFxhoZ56DE4d/C28uOhpWurqU3yKPRQa/CNMNV9DxqwMQzf7CMTJ1WWcfZPcCMZS0vyic7ymPF79yixXAEuqLKWYzxP/XzpY8QTQhb8/S3CGPHfsMT/Y7h5M5kaEcowPmWbnGgJ5kEv3GHwHj/b+im7B57k/TS6JPLXQH96Mcq96zMxIpovydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzxfM8gfVfqqRPjGA81uL7mvfgDjeaFlkfmKX5SnHbA=;
 b=Zc4QAkTC8L21B/1AmNh3rEXEAQf3L2bBCprL9Z4yDNw1wjUWzztTYK0iJAy9+3y1U9K7MlLNE1tcQpmZhtx+5l9b1nO3oew0PvYRUjl8PCjWE1CGotw7+E4LQHtEhg5HTdGpq9CQa8frR0QjJwvMKliosP4uEX0DvlPmg9ma4iaVa3URlKdmvaA4HUQ2QRHPYQLHYAPEcoP4rgTZGh9P+/KM1NVi6OSPkgY1QISkua2hpGHsdnF6wiGA6b4FhmDEDBadb7tq5SbKv4CVfROPFMBr1fTd9+Q5e2iYnw/k39/XysnqcMMVEWVfDBUFUnj33h3bAqEgIAHni0be7cBzlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzxfM8gfVfqqRPjGA81uL7mvfgDjeaFlkfmKX5SnHbA=;
 b=oHZDo5GxD4rJdxM8xrvgBGh22k2RVOTT/mBgqga/VVdFkHonqcsE5wu8mstgu6B5sfStfqoXASFFmhQCMbPs3SAyHNlKEOGe1sP1N+uKkgwuocdnHpbEOf9W0x1AaGnhwHkS24oGmWfaegeFUQnPSsPBNytbw3w/psL6N1laCTQ=
Received: from SEZPR06MB6087.apcprd06.prod.outlook.com (2603:1096:101:e7::6)
 by TY0PR06MB5031.apcprd06.prod.outlook.com (2603:1096:400:1bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 12 Jun
 2023 02:02:15 +0000
Received: from SEZPR06MB6087.apcprd06.prod.outlook.com
 ([fe80::5adc:bf44:434f:7204]) by SEZPR06MB6087.apcprd06.prod.outlook.com
 ([fe80::5adc:bf44:434f:7204%7]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 02:02:14 +0000
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
Thread-Index: AQHZmevzYyXEhWoR5kmBZxfZxNAUJK+CnOUAgAPRV9A=
Date:   Mon, 12 Jun 2023 02:02:13 +0000
Message-ID: <SEZPR06MB6087B403321E6528CB5589428454A@SEZPR06MB6087.apcprd06.prod.outlook.com>
References: <d86d1878598b633b437f87e5b75196079-6-23kernel.org@g.corp-email.com>
 <20230609153800.GC6847@thinkpad>
In-Reply-To: <20230609153800.GC6847@thinkpad>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quectel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB6087:EE_|TY0PR06MB5031:EE_
x-ms-office365-filtering-correlation-id: 1634930b-6ea6-4e24-8ed6-08db6ae90a6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hfgOq6roQfsUQZof6Dm0YJj4srtnToLCu10+05NgZDAs4WPg1mzboctE1hlDLVRkcQLULb7dXrFlPFLpMPjRbqmZqIZMyA8mz1bIllEVKm1PFal1UrYBF7M/YvR/TJSsVcOPi3YjM1SoRprH6GhLA9BskhE7bnoTEBvTMq+Mk8vp7ptmobCTXcMPPxKHCA2dxMedmWMPjHlYdjPNBCudQ6oOmjT/AQA0tbDXCIj+SAw32w/qJOQ1fq7PC/AZ04G4oOagtIfhIDnzZQkMJSZVguln/Ee4eDcphFQ5o8bEPQ222ywNTlgFVhulE2rBh0L894AP9hfERvVunxLD3zbVphOyrSOp2p5xR8ZPGoObm7TuOzNskji6Q+d7M4njls32Rts7hPqhhk2Xb90jfL6WACQIozfG3fplamtYNVKyO1JUoApUNbhb3kNY7hXDqfGPKNyS5gX1b70hEKqrc4lS5/tmk+40nsABCi4tEh41PGpp0TLYoMHVzdvq0q8IZmhHtkjHzY3+5PTnjFGs6sMnNfHgHFhwaaWDZWZDeUaqT0HmUnEZ7nefHbGF9VUxb9C0746QMSxEDYXQAXnYyLguA1QkRh/RW4RQV8Gh3whGQAKFljG1hP0qb4KFeSYuOhEa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB6087.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39850400004)(366004)(346002)(451199021)(5660300002)(52536014)(7416002)(8936002)(2906002)(76116006)(66556008)(66946007)(64756008)(66476007)(66446008)(4326008)(110136005)(54906003)(7696005)(71200400001)(107886003)(9686003)(26005)(6506007)(316002)(41300700001)(186003)(83380400001)(478600001)(33656002)(15974865002)(224303003)(55016003)(38070700005)(38100700002)(86362001)(85182001)(122000001)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1oxWjFYSDJyZGpuUndBNSt3NlliNUpEYkFiNkNDbEprU3BWUml0VkxSUnQ4?=
 =?utf-8?B?WndlVlVvREViOGNpM1U1bTNpaWc2Zyt0VlVDYk1wODdYOWwwVzB2ZkxJdzYz?=
 =?utf-8?B?WUJzMWF6Y2Z4b1k1R3B5NTlOaENUMVRlMW1BRHlaSVc4R0VhUk8ybFRwYkNM?=
 =?utf-8?B?RlFYR0F1VG1NRjYzQ0ZMNnh4MGZnTmgwbmszWE12eExsejZTSmNQaU8wNTI2?=
 =?utf-8?B?c0VacEVJbTRmV1JRdGNhYXdsMFZVeWx1QlFHaXF5KzBIVWs2NkZzK1FINDVu?=
 =?utf-8?B?c1F0VllJZ2c0VmUxbmVxWDlkYVpsWmxueHVaVUVMdVpxYlY5dEFVUWp1RENm?=
 =?utf-8?B?ekl2a0NxbHFuMy93YkVGSDd1SzZhRTY1NVFGb0orWDNQWG94ZlJxMUdTc2dK?=
 =?utf-8?B?Vi9NY1pKczRwN3FleGk1ckdldnA1dnlxMmMxalNDaWZUaHh6alk2NzR0dFkz?=
 =?utf-8?B?T2dLaGZTMm1pRWJ2Nk40Wmhka1VtV3FPTUYzZGxydnJBOGNHTVpZdkFma0Ux?=
 =?utf-8?B?RzRLOWpCeEtRS2ErZy9BOTA3WW55clREQWhTL0pXSTNENjArTTllNVpobUpO?=
 =?utf-8?B?QWhzSlp6RnhqQjk3czhYMW5QVCtyaVhuVXlwelhQclg3ZnJkZnl0ZnRtY3Bp?=
 =?utf-8?B?Z2RFdi8yYnQwOVlhZWZZYmZYY3VOcjR0TnJiSGxoR3QxNENWWm9rSEY0SVVx?=
 =?utf-8?B?OHRpa1JESlNjcGFxQW1Wd0gvcVZmYVcwQXpYeVJXYmtoMnNrZ2dzZi9WWC9T?=
 =?utf-8?B?blVOdEFIN25sblJlamlGQ2hyZGM1Q3FRY25SSkpud0tSQ0dxMjhwSG84eXRm?=
 =?utf-8?B?VGs3bEJEWnlqMEwwc0lUU01heGJHRWRWZHh3THp6YXR2WUkzTkpqU2dkaHFn?=
 =?utf-8?B?djh0M2VYWDlZc1hsaHN1ZDVzUnhuK0Z1TXNpRjFxWEV3di82aXRMT0x0SFBL?=
 =?utf-8?B?QXQ4K1h2Um9NeDZvNnlONmoySndXL3JMTUR5VGR6SEZSejF1cUZlZjVieFVz?=
 =?utf-8?B?WkVsdndGRmJ3UVBmNlIzWkdIc0VoaVE0UVgrdmpIOWIxVHRuaUwvMDN1MU9M?=
 =?utf-8?B?N0RxOGxzc0J5UXpUcU5oSDRGV0ZGL09VUDlnMWNJUWU2L1hjeVRSQ0QxbmRT?=
 =?utf-8?B?enlVeEpjOWNFQWhBVUNqOVZ0SW5CNlQrdVNwb2RwLzYxTzB0TENNczJidlYx?=
 =?utf-8?B?WUo0SmJOV0dXVjhmYWlsbEgwOWtFbUlUL2w5b2JLSHJxVG5tZHA2L2dKa1VV?=
 =?utf-8?B?NWxiVCtHSkNQaHJ6ZW5Za2dwWHVHM3VqRE9oNW9PVHJTaGZ5dkRBS0N6c0NV?=
 =?utf-8?B?cGRxckxyc1lzWUJYQTFVTmR5ek9qWnVpanVsRzFjSHJKRDQ2N2RzTXhvdVc0?=
 =?utf-8?B?Mk5aWW9DZVk0YXM5VlVuTDJBNlhBS05NTjF3T2NLK0VlYlZqbGRwZWJxL2pz?=
 =?utf-8?B?b3R1NVJuMW9qNlJvd1Z3Q21nelQwcjFvSEswdWtLdCtqZXRTRGZYeGdQUjZ6?=
 =?utf-8?B?V0ppZ3ZRTHBOTFVDSlRneVVOeFlRZ0F4elE1Smd4QTk1U2s0MHl2cmRWWFpO?=
 =?utf-8?B?eEFZUzJueVNlN3dqOUZ4US9xQzFBNUxSY1ZRdENMY0cyNUc2QWdIemRMVmlS?=
 =?utf-8?B?U3dzaU5URUpoczFGRjhpUTlNUzI5azNaSGZ5NksyTk1ySkdVd0Z3UVJFOVlw?=
 =?utf-8?B?Mjk3WWFUOWpVaUVQbWwvclhxSDdZalZoZlc2V3pzMkhWVG9icStwSTdjeXlX?=
 =?utf-8?B?eFNOVGN0My9JOFFrYVBYQTkydzNodWNsZ0xCWmRRZW5lQUQxS2k2QUsvVWFF?=
 =?utf-8?B?U2czeU1SNHJBZHVUQXdrY3NoTzFRczRmZEtIdy91NU5tM3g0eTdLZjUyaWtM?=
 =?utf-8?B?Rys2eTExQnFtdE9lYWZVRVFhV09hNHJiamhzTmttQUhWRGpTZHRlOTdaeHIz?=
 =?utf-8?B?T1E1R1ZYMHdKUldhVU42cXMzM0dYOCt6N2hrVlVieGN5SktndlZVcXVQTnV6?=
 =?utf-8?B?Tk9qdm85VEhYajNscmtZUGllWXVvQ0VoQVVPM3l6cWtLaXhWV2luQXNxME4y?=
 =?utf-8?B?L2VxRnpVTVk5dktJRHM3ZHA3MGxxSnZhOWxlTHo4NkJCdzVCVzl4MXhlY0Jk?=
 =?utf-8?Q?5vYnuVQqv8juDKiBJRi8GhHhr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB6087.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1634930b-6ea6-4e24-8ed6-08db6ae90a6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 02:02:13.7721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: on0HsdLS3/mYpJNkK54PlMEdQ0anzOQsLM4NNpUsjEeixCtYzdilHWbb+dt1qqflQ5mL5xKdkXdu7clD0AgVcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5031
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgTWFuaQ0KDQpPay4gUHJldmlvdXNseSBJIHVzZWQgdG8gc2VlIHNhbWUgbW9kdWxlcyBoYXZp
bmcgdHdvIGRpZmZlcmVudCBJRHMgYmVjYXVzZSB0aGV5IHNoYXJlIGRpZmZlcmVudCBiYXNlbGlu
ZSAoZnJvbSBxY29tKS4gSSB3aWxsIGFtZW5kIHRoZSBjb21taXQgbWVzc2FnZSBhY2NvcmRpbmds
eS4NCkZvciBmdXR1cmUgcGF0Y2hlcywgcGxlYXNlIGluY2x1ZGUgdGhlc2UgaW5mbyBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2UuDQo+PiAgR290IGl0LiBJbiB0aGUgZnV0dXJlIHBhdGNoLCBJIHdpbGwg
YWRkIHRoZSBjb3JyZXNwb25kaW5nIHN1cHBsZW1lbnRhcnkgaW5mb3JtYXRpb24gKHN1Y2ggYXMg
YmFzZWxpbmUpIHRvIG1ha2UgYSBkaWZmZXJlbmNlLg0KICANCiAgVGhhbmsgeW91IHZlcnkgbXVj
aCBmb3IgeW91ciBwYXRpZW50IHJldmlldyBhZ2Fpbi4NCg0K6L6b5a6J5paHwqAgRHVrZSBYaW4g
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
IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPiANCuWPkemAgeaXtumXtDog
MjAyM+W5tDbmnIg55pelIDIzOjM4DQrmlLbku7bkuro6IER1a2UgWGluKOi+m+WuieaWhykgPGR1
a2VfeGluYW53ZW5AMTYzLmNvbT4NCuaKhOmAgTogbG9pYy5wb3VsYWluQGxpbmFyby5vcmc7IHNs
YXJrX3hpYW9AMTYzLmNvbTsgZmFiaW8ucG9yY2VkZGFAZ21haWwuY29tOyBrb2VuLnZhbmRlcHV0
dGVAY2l0eW1lc2guY29tOyBzb25nLmZjQGdtYWlsLmNvbTsgYmhlbGdhYXNAZ29vZ2xlLmNvbTsg
bWhpQGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7IEplcnJ5
IE1lbmco6JKZ5p2wKSA8amVycnkubWVuZ0BxdWVjdGVsLmNvbT47IER1a2UgWGluKOi+m+WuieaW
hykgPGR1a2UueGluQHF1ZWN0ZWwuY29tPg0K5Li76aKYOiBSZTogW1BBVENIIHY0XSBidXM6IG1o
aTogaG9zdDogcGNpX2dlbmVyaWM6IEFkZCBzdXBwb3J0IGZvciBxdWVjdGVsJ3MgbmV3IEVNMTYw
Ui1HTCBwcm9kdWN0DQoNCk9uIFRodSwgSnVuIDA4LCAyMDIzIGF0IDAyOjI5OjI3QU0gLTA3MDAs
IER1a2UgWGluKOi+m+WuieaWhykgd3JvdGU6DQo+IFRoZSBwcm9kdWN0J3Mgd291bGQgdXNlIHRo
ZSBzYW1lIGNvbmZpZyBhcyBwcmV2aW91cyBFTTE2MFItR0wNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IER1a2UgWGluKOi+m+WuieaWhykgPGR1a2VfeGluYW53ZW5AMTYzLmNvbT4NCg0KTW9kaWZpZWQg
dGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBzdWJqZWN0IHRvIHJlZmxlY3QgdGhlIHVzZWNhc2UgYW5k
IGFwcGxpZWQgdG8gbWhpLW5leHQhDQoNCi0gTWFuaQ0KDQo+IFJldmlld2VkLWJ5OiBNYW5pdmFu
bmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz4NCj4gLS0tDQo+IENoYW5nZWxvZw0KPiAN
Cj4gdjMgLT4gdjQNCj4gDQo+ICogVXBkYXRlIGNvbW1pdCBtZXNzYWdlIHRvIGluY2x1ZGUgdGhl
IGNoYW5nZWxvZyBhbmQgcmV2aWV3ZCB0YWcuDQo+IA0KPiB2MiAtPiB2Mw0KPiANCj4gKiBBZGQg
cGF0Y2ggQ0MgdG8gbWhpQGxpc3RzLmxpbnV4LmRldi4NCj4gDQo+IHYxIC0+IHYyDQo+IA0KPiAq
IFJlbW92ZSBTcGFjZSBiZWZvcmUgKi8gYW5kICJmb3IgbGFwdG9wIiBkZXNjcmlwdGlvbi4NCj4g
LS0tDQo+ICBkcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jIHwgMyArKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jIA0KPiBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L3Bj
aV9nZW5lcmljLmMNCj4gaW5kZXggNzBlMzdjNDkwMTUwLi41ZjIwNGI4MTllOTUgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMNCj4gKysrIGIvZHJpdmVy
cy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYw0KPiBAQCAtNTkxLDYgKzU5MSw5IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBtaGlfcGNpX2lkX3RhYmxlW10gPSB7DQo+ICAJ
CS5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkgJm1oaV9xdWVjdGVsX2VtMXh4X2luZm8g
fSwNCj4gIAl7IFBDSV9ERVZJQ0UoUENJX1ZFTkRPUl9JRF9RVUVDVEVMLCAweDEwMDIpLCAvKiBF
TTE2MFItR0wgKHNkeDI0KSAqLw0KPiAgCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3Qp
ICZtaGlfcXVlY3RlbF9lbTF4eF9pbmZvIH0sDQo+ICsJLyogRU0xNjBSLUdMIChzZHgyNCkgKi8N
Cj4gKwl7IFBDSV9ERVZJQ0UoUENJX1ZFTkRPUl9JRF9RVUVDVEVMLCAweDEwMGQpLA0KPiArCQku
ZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpICZtaGlfcXVlY3RlbF9lbTF4eF9pbmZvIH0s
DQo+ICAJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfUVVFQ1RFTCwgMHgyMDAxKSwgLyogRU0x
MjBSLUdMIGZvciBGQ0NMIChzZHgyNCkgKi8NCj4gIAkJLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91
bG9uZ190KSAmbWhpX3F1ZWN0ZWxfZW0xeHhfaW5mbyB9LA0KPiAgCS8qIFQ5OVcxNzUgKHNkeDU1
KSwgQm90aCBmb3IgZVNJTSBhbmQgTm9uLWVTSU0gKi8NCj4gLS0NCj4gMi4yNS4xDQo+IA0KDQot
LSANCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40N
Cg==
