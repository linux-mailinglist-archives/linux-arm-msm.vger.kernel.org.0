Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B64F3728D02
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 03:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjFIBVM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 21:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjFIBVL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 21:21:11 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2060.outbound.protection.outlook.com [40.107.117.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AC0198C
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 18:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ml5WbX2U1M4Mx4RI28LoD3XTUvQ8myVRKDTGhLRzFRUah6HiRXnVw/uUw+uvSKIXfNgDmCcoCw1h72ZFf+GjNcFWuRwl8Z07v0twI0K9kPUy76hCtSfxlrwx4aIcsEZdpsB9/DOVk9F3n1SWWWKiej7s02xnnUDLsuRXvIrClgnHHq6audIyBttNssA7HT4iWQYGeAMfDbO9X+he1Ua1enVl3aEesgbKME1leBVE0U75Ix1GzdkD6bfP3Z7e3Vi0tHjHbSgMOas+uaq9gRKhZHMwnJmPkHWVERacTnQ3YpoklYxUudHbjN7ZNGoPaGyiwyvT3W5/fgvR+MxyvsV6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pho3psphsy+B1uh30qezGpYoE9uCh7zErXXf75+Fqy4=;
 b=TmhyNdbZ5aYLZb5yfY3dvSV9xPwp98zITro0Y6xRH9018nfJ3SJRZYydEWCg1EC01Po+1d7B03eLjWNbz4FWJTRKJR7ZnVTHB8zWdlGekcQmXXZsxStSVG5O3/nfP6zUFsfYrB2tJUX7WXz+2cNO4C2pB5TepwxRxhvlWZ7zvKSQTX1UVwvzTZujJy/3V+KwzuaqyO2aG3LgMwCjxoZsjOWPDAemXNTZi8zhfKMehug3ZYB16JA6FW+yIOzcL5X557/eeCjUvFdzJLtAigwSnWuDnskdOxL2io7FR3yj51+zm1PwgfaYQpaO82R4+Yuai0rA3DVVbd3d7vJP54bA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pho3psphsy+B1uh30qezGpYoE9uCh7zErXXf75+Fqy4=;
 b=IpscD+2KlXv8C1urEr/mi7/YZkOUR32siiK8NNp5n0KZJNDljTY7X5NOwjgwhZNHYu0TALMf8D2zs5qKsCWQjUxQXSyxzcoGuWjGSlFww4sidd3J/69gpR1T+rpxSIhM3V4SSWCmrZMK84MSVOCB+/LSoHOGCKfoY94gSKGbNCs=
Received: from SEZPR06MB6087.apcprd06.prod.outlook.com (2603:1096:101:e7::6)
 by KL1PR0601MB4097.apcprd06.prod.outlook.com (2603:1096:820:32::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 01:21:03 +0000
Received: from SEZPR06MB6087.apcprd06.prod.outlook.com
 ([fe80::5adc:bf44:434f:7204]) by SEZPR06MB6087.apcprd06.prod.outlook.com
 ([fe80::5adc:bf44:434f:7204%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 01:21:03 +0000
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
Thread-Index: AQHZmevzYyXEhWoR5kmBZxfZxNAUJK+BEkAAgACW/UA=
Date:   Fri, 9 Jun 2023 01:21:02 +0000
Message-ID: <SEZPR06MB6087F7C2AAE5B5FB0F5AFF7E8451A@SEZPR06MB6087.apcprd06.prod.outlook.com>
References: <ac814d016b03c3164dbd8cd7c94f8b4f9-6-23kernel.org@g.corp-email.com>
 <20230608160530.GC8632@thinkpad>
In-Reply-To: <20230608160530.GC8632@thinkpad>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quectel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB6087:EE_|KL1PR0601MB4097:EE_
x-ms-office365-filtering-correlation-id: 292c72c8-2117-45cf-7ad0-08db6887ca7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PawyS39rKW5riTv6zXGJ6aIKUj6SBb6zujFHRmvRYSPRqfrK1d9So5iIiNP9TOlvZctU6UAftte1q1g7fj1DLLucuj0Mhtgd+VYm2gds8lFV/cHnBRRBqdCsVQ8EXWJMNDvP7nihdXt12NiUZTc2aQxh5qwQCRGSNbW93horhUOjPJ7LOdF0XbGy58swWBzTi776MzMCPqVSquM4stdnLXaq9kF8/WWV19iPunaIMARGk8VBd0/To3e2naCIHWZhKRQ009fKi5gcfdG9bijN5ocF0KhE/uHT2A3ZuvC+XuiY+/0iDaBQBNsbxp9XlhQ+IOF9XQ5LXU3/hds2azZbCVdreZ19K1bGr7JZ6rAMQokIa2if1XNBqbtnKB74okEXQKhGI7KUkuQwAYNunLYBdHMT9sh7uk+InAAQSmLClh005xnknSC4sNL06G54IBhiQKoKMqF9Pbr4IiK2YBliL7JLn/dpsmJVmH1j+gyvddhCReoRhXtY+PyTM6ef/jDjSWg88AaHxBp+hgbXfcRY7D25E+9ie29AmBWl4Xgxkx+oQd1niNnEagc/Etug2HwrtJyjyNi+D9HFu5IMUIJ4argNCdxX7Ucak852M5+6Sy2twTyyy7JO4kWTGLqbuYsg
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB6087.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(55016003)(71200400001)(7696005)(64756008)(110136005)(54906003)(478600001)(316002)(8936002)(41300700001)(66446008)(76116006)(66946007)(4326008)(66476007)(66556008)(38100700002)(186003)(122000001)(9686003)(83380400001)(26005)(6506007)(107886003)(86362001)(52536014)(7416002)(38070700005)(15974865002)(33656002)(2906002)(85182001)(5660300002)(224303003)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUdqZkE5MUVyTjJnSk5UNWRwLzlraCtJZFJtcWREUnNtT3d0RkZ6Ump4Nno5?=
 =?utf-8?B?cXJlUzR5SHBIZ05RamdCNTVKL2wyb1dvaHJhSTVjcDR4WHRNOVhjclYrbjk4?=
 =?utf-8?B?RFpKbFRHOFV2T0I0ZzVYY2JSUlhvOC84QTJPS0ZrU3VSZGhNWXBRdE9kVXNB?=
 =?utf-8?B?SUJWa1lWbEhtNVMzZWs4M3FJaW5QUHg1TStlYnRXNnJTUUd6MVljamdwLzg3?=
 =?utf-8?B?bHk2NHNwUldYeXI0VE5EYTV3QlJHbUJXaGRBbE1xa0lobjF6V0tncjRZcWNJ?=
 =?utf-8?B?RlB5RFRWamZtV3BaY0g4OTRPRVUrRUVuR25tL1pkdXV0enZiZzlSdm4zd2t4?=
 =?utf-8?B?OVNDOWVWL3NVdTJldzRxaE41UUIvSmxETkNXNmtVMHdMVnFSOWtqVUFpbU02?=
 =?utf-8?B?WFF3MzJXQVFIM1g1dysxMEtvc2dxNUFJbWxlakw4T0c2RDI0S2xMOE1JbmFK?=
 =?utf-8?B?a21qYy9yNGsyczhodXRxdldObjNXRHl6akZsNEJlMjF5dkFVaHRuMDRqc3R2?=
 =?utf-8?B?bm5CUkw4OFN4SE00a1NYMXRTLzRvNnhWdVRNL1RYbUhBbWxaMHVXV2NhbGE4?=
 =?utf-8?B?VEZDTm5XcWpMTFczaEkyRWVEVmVLMVVmOHZjbE5KMi9wcmd4c09HN20xZDd6?=
 =?utf-8?B?UHNkUFZGQlhWekpwT1FnV0NpTmpLV2pWWlpsVHQvZFY5NUpHKzZUK0dmNjI0?=
 =?utf-8?B?cTBhaVl0QVh4alcvM01hdnk2MTFXcWg3SnVPeHgxNjFLMkVtTVUrZi9iald3?=
 =?utf-8?B?WEV3a1dZbXdwTzdZZS9ZYlBJalBjRUJOMHEzTE1hTDlkbkI4ZnVEOHBKWGpj?=
 =?utf-8?B?OEZrNVZOYTdJSS9UUmxtTEVDQVFuN3JDaXJPdldzVExoY00yMFozUC9MVkxZ?=
 =?utf-8?B?cVJkNTk1WnpsV1dTUXhXVmdNOXdJMVNsOG5Cc2w0QnA3R0NNeUJHakozWkEr?=
 =?utf-8?B?UUVselA1azF6eWQzaVcwUW5HTkhMN0hvMXJhYmFUdHR6NVJOcnBOYmh2OEVS?=
 =?utf-8?B?SmprdkdkQUlUMjdwM3UrODg2dU5RMHNocW5aRCtWVVovb1NhaDVMNUJ4VGti?=
 =?utf-8?B?UUIyRzRuQlV0eElEaGhHZFpWc1FKVS8wRWxRdkcxd2xETmVtNUNER0xQaHVa?=
 =?utf-8?B?Rk1wU003NFNpTmRPWnFEbHg2enNnM2RNWEFhNk1aQkdmaHpSME01STZMaWQ0?=
 =?utf-8?B?T1Rwb09jU0lpTVNsdjhqOWxLcndkSUVWNU4zeVEzQVlzMDY5TXQvMjBJc0Fj?=
 =?utf-8?B?SmpFVmNDZzI0eEFVSkUrelJFb3ZoYUk1cWZEdmoraVBjTW5HZUVaKys1bkVa?=
 =?utf-8?B?QkZmenVZeVlEaDVCdFBvK0QybUtSbjNacytQdVFYNEh4RWY1Qkk1WGEybTBw?=
 =?utf-8?B?UkU5ZURIaWZ6V29kYmpUYmFpU1o5eWlaUDB3YzNGWXJWNzFQZE1jRFAzMUFr?=
 =?utf-8?B?Nmd1R3JCVzM0SExsUmY4b1RETkdiTWIwNHZYQzFoMVQwOTVDaTg2ZmNMdTNI?=
 =?utf-8?B?RzBnTkxETDBldkR2bFJ0b0lic2tjVWpYbjNYNk12L0tUTUlITGNtclR2UDU4?=
 =?utf-8?B?YktOZ2ZTUkFzZjNaT2lzbC9kZS9LNHJ0dlJ0K2lxbDliYi9iL25MakR5UEJO?=
 =?utf-8?B?eHo3eDdLTE5DYmZYeCtrME1zWmYzRUxsRWhFNmp2R0Y1QXYxcjRDMnZQbDJK?=
 =?utf-8?B?TDM5SDNySHNyYUY1emlhWHk5bElFemlqbUQwMU45NDArNDFlcnJVNTB6TlRo?=
 =?utf-8?B?MnBmS0N0NWtjazU0VG5XcHhIYmdJOFVDaDlJSnRpOURjTld2Vm5QS0xpREVh?=
 =?utf-8?B?SHJxcEREeUNPbjl6Qmw2cVdoYWtON2Y3TVZrUWIzc3BrSXpSRUJHQ3Qza1lr?=
 =?utf-8?B?NEdHYW56UXczZTNHSjlDeU91MGRYR1hDd1N0eE1BZ3pTUW0zUTBudENNT3Fn?=
 =?utf-8?B?dFdVNFQzL3QvNXdVODRsb3lncERYU3BSaW1xNlhVUGhCYkNBRHVmWkp1ckNR?=
 =?utf-8?B?Q1RUL3d4cmRpeWQyUG56cVM0VVcrZjdXNHVVb1VFU3R0WllHcGsyaXNzNkJF?=
 =?utf-8?B?S3I0SjBhdUF6SDBvQXAvQldiTGtEbmE5VHRadkJjRkRkbUpNc2RXck5BcGNt?=
 =?utf-8?Q?K3nEk7jXibC5GcEGdYUrs7LkF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB6087.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292c72c8-2117-45cf-7ad0-08db6887ca7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 01:21:02.9681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VzrYFKzy471TBftUDj30wEJ0M6NUxtaqJpSR8j+U31iqE/9HrkO5lwLpppG4DCkBbQcKykB1xii7cIQu7QIGUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4097
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgTWFuaQ0KDQpFTTE2MFItR0wgaXMgZXhhY3RseSB0aGUgc2FtZSBuYW1lIGFzIHRoZSBvbGQg
bW9kZW0gd2l0aCBzYW1lIGNoaXBzZXQuIFdoYXQgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0
aGVzZSB0d28/DQo+PiBGcm9tIG15IHBvaW50IG9mIHZpZXcsIHRoZXJlIGFyZSBvbmx5IHR3byBF
TTE2MFItR0wgcHJvZHVjdHMgd2l0aCBkaWZmZXJlbnQgUENJZSBpZHMsIGFuZCB0aGUgSFcgYW5k
IFNXIG9mIHRoZSBtb2R1bGUgYXJlIHRoZSBzYW1lLiANCiAgIFRoZSBuZXcgRU0xNjBSLUdMIHBy
b2R1Y3QgaXMgZGVzaWduZWQgdG8gZml0IHRoZSBjdXN0b21lcidzIG5ldyBsYXB0b3AuDQoNCg0K
6L6b5a6J5paHwqAgRHVrZSBYaW4gfCBTb2Z0d2FyZSBEZXBhcnRtZW50IElYIEVuZ2luZWVyIHwg
UXVlY3RlbCBXaXJlbGVzcyBTb2x1dGlvbnMgQ28uLCBMdGQuIA0KwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCANCk1vYmlsZTogKzg2LTE1Mzc1NDU2MTgzIHwgRW1haWwgOiBEdWtlLnhpbkBxdWVjdGVs
LmNvbcKgIHwgVGVsOiArODYtMDU1MS02NTg2OTM4Ni04NjMyDQpXZWJzaXRlOiB3d3cucXVlY3Rl
bC5jb23CoCB8IFFROiA2MDI2NTkwNzIgfCBXZWNoYXQ6IDE1Mzc1NDU2MTgzDQoNCkJ1aWxkaW5n
wqAxLUMswqBDaGluYcKgU3BlZWNowqBWYWxsZXnCoEFyZWHCoEEswqAzMzM1wqBYaXlvdcKgUm9h
ZCzCoEhpZ2gtdGVjaMKgWm9uZSzCoEhlZmVpLMKgQW5odWnCoDIzMDA4OCzCoENoaW5hwqDCoMKg
IA0K5a6J5b6955yB5ZCI6IKl5biC6auY5paw5Yy65Lmg5Y+L6LevMzMzNeWPt+S4reWbve+8iOWQ
iOiCpe+8ieWbvemZheaZuuiDveivremfs+S6p+S4muWbrUHljLox5Y+35Lit6K+V5qW8IDIzMDA4
OA0KSFE6IEJ1aWxkaW5nIDUsIFNoYW5naGFpIEJ1c2luZXNzIFBhcmsgUGhhc2UgSUlJIChBcmVh
IEIpLCBOby4xMDE2IFRpYW5saW4gUm9hZCwgTWluaGFuZyBEaXN0cmljdCwgU2hhbmdoYWkgMjAw
MjMzLCBDaGluYQ0K5oC76YOo77ya5LiK5rW35biC6Ze16KGM5Yy655Sw5p6X6LevMTAxNuWPt+en
keaKgOe7v+a0sjPmnJ/vvIhC5Yy677yJNeWPt+alvMKgIDIwMDIzMw0KDQotLS0tLemCruS7tuWO
n+S7ti0tLS0tDQrlj5Hku7bkuro6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwu
b3JnPiANCuWPkemAgeaXtumXtDogMjAyM+W5tDbmnIg55pelIDA6MDYNCuaUtuS7tuS6ujogRHVr
ZSBYaW4o6L6b5a6J5paHKSA8ZHVrZV94aW5hbndlbkAxNjMuY29tPg0K5oqE6YCBOiBsb2ljLnBv
dWxhaW5AbGluYXJvLm9yZzsgc2xhcmtfeGlhb0AxNjMuY29tOyBmYWJpby5wb3JjZWRkYUBnbWFp
bC5jb207IGtvZW4udmFuZGVwdXR0ZUBjaXR5bWVzaC5jb207IHNvbmcuZmNAZ21haWwuY29tOyBi
aGVsZ2Fhc0Bnb29nbGUuY29tOyBtaGlAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0tbXNtQHZn
ZXIua2VybmVsLm9yZzsgSmVycnkgTWVuZyjokpnmnbApIDxqZXJyeS5tZW5nQHF1ZWN0ZWwuY29t
PjsgRHVrZSBYaW4o6L6b5a6J5paHKSA8ZHVrZS54aW5AcXVlY3RlbC5jb20+DQrkuLvpopg6IFJl
OiBbUEFUQ0ggdjRdIGJ1czogbWhpOiBob3N0OiBwY2lfZ2VuZXJpYzogQWRkIHN1cHBvcnQgZm9y
IHF1ZWN0ZWwncyBuZXcgRU0xNjBSLUdMIHByb2R1Y3QNCg0KT24gVGh1LCBKdW4gMDgsIDIwMjMg
YXQgMDI6Mjk6MjdBTSAtMDcwMCwgRHVrZSBYaW4o6L6b5a6J5paHKSB3cm90ZToNCj4gVGhlIHBy
b2R1Y3QncyB3b3VsZCB1c2UgdGhlIHNhbWUgY29uZmlnIGFzIHByZXZpb3VzIEVNMTYwUi1HTA0K
PiANCj4gU2lnbmVkLW9mZi1ieTogRHVrZSBYaW4o6L6b5a6J5paHKSA8ZHVrZV94aW5hbndlbkAx
NjMuY29tPg0KPiBSZXZpZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5l
bC5vcmc+DQo+IC0tLQ0KPiBDaGFuZ2Vsb2cNCj4gDQo+IHYzIC0+IHY0DQo+IA0KPiAqIFVwZGF0
ZSBjb21taXQgbWVzc2FnZSB0byBpbmNsdWRlIHRoZSBjaGFuZ2Vsb2cgYW5kIHJldmlld2QgdGFn
Lg0KPiANCj4gdjIgLT4gdjMNCj4gDQo+ICogQWRkIHBhdGNoIENDIHRvIG1oaUBsaXN0cy5saW51
eC5kZXYuDQo+IA0KPiB2MSAtPiB2Mg0KPiANCj4gKiBSZW1vdmUgU3BhY2UgYmVmb3JlICovIGFu
ZCAiZm9yIGxhcHRvcCIgZGVzY3JpcHRpb24uDQo+IC0tLQ0KPiAgZHJpdmVycy9idXMvbWhpL2hv
c3QvcGNpX2dlbmVyaWMuYyB8IDMgKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMu
YyANCj4gYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jDQo+IGluZGV4IDcwZTM3
YzQ5MDE1MC4uNWYyMDRiODE5ZTk1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2J1cy9taGkvaG9z
dC9wY2lfZ2VuZXJpYy5jDQo+ICsrKyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmlj
LmMNCj4gQEAgLTU5MSw2ICs1OTEsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2Vf
aWQgbWhpX3BjaV9pZF90YWJsZVtdID0gew0KPiAgCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vs
b25nX3QpICZtaGlfcXVlY3RlbF9lbTF4eF9pbmZvIH0sDQo+ICAJeyBQQ0lfREVWSUNFKFBDSV9W
RU5ET1JfSURfUVVFQ1RFTCwgMHgxMDAyKSwgLyogRU0xNjBSLUdMIChzZHgyNCkgKi8NCj4gIAkJ
LmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSAmbWhpX3F1ZWN0ZWxfZW0xeHhfaW5mbyB9
LA0KPiArCS8qIEVNMTYwUi1HTCAoc2R4MjQpICovDQo+ICsJeyBQQ0lfREVWSUNFKFBDSV9WRU5E
T1JfSURfUVVFQ1RFTCwgMHgxMDBkKSwNCj4gKwkJLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9u
Z190KSAmbWhpX3F1ZWN0ZWxfZW0xeHhfaW5mbyB9LA0KDQpFTTE2MFItR0wgaXMgZXhhY3RseSB0
aGUgc2FtZSBuYW1lIGFzIHRoZSBvbGQgbW9kZW0gd2l0aCBzYW1lIGNoaXBzZXQuIFdoYXQgaXMg
dGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGVzZSB0d28/DQoNCi0gTWFuaQ0KDQo+ICAJeyBQQ0lf
REVWSUNFKFBDSV9WRU5ET1JfSURfUVVFQ1RFTCwgMHgyMDAxKSwgLyogRU0xMjBSLUdMIGZvciBG
Q0NMIChzZHgyNCkgKi8NCj4gIAkJLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSAmbWhp
X3F1ZWN0ZWxfZW0xeHhfaW5mbyB9LA0KPiAgCS8qIFQ5OVcxNzUgKHNkeDU1KSwgQm90aCBmb3Ig
ZVNJTSBhbmQgTm9uLWVTSU0gKi8NCj4gLS0NCj4gMi4yNS4xDQo+IA0KDQotLSANCuCuruCuo+Cu
v+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40NCg==
