Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12EBB6D3B72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 03:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjDCBWf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Apr 2023 21:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbjDCBWe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Apr 2023 21:22:34 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2058.outbound.protection.outlook.com [40.107.215.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9456DAF09;
        Sun,  2 Apr 2023 18:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A12pjbRXq4TNJ8hZ5pR1zo2AxTLK2j1wMZKoX1CjSF1M98DhSQSnqtpSmBSBaTxJdPOIYbopSNc77/i2OVVgBzoeQ1ePmluI20wfp3YJyiTAJ+XqPKbWlZeMn3sdF97buyKvQLCtpUQkGmzVimfKvf3Uzhobw18xTwHQF65jRjwIlIChYgxdutXr9HJ+LW1B3JUBQZDNaafIVteX3/o6HcZN04htFbiH5CbK3l9byn4nhf5/CzuGZKSyoxr842oSgfgsvGGds4FpjdYlBdqZyzSWnKNX+Zn+Ava+TmIoSUdAtWXQVTN6VsKNfSOJN1Xhnby0sDKwskJtZf2J5rVpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4crZMkf8vnapZg4pqe10cS6tjvqtKknqn9Q9rKLVSM=;
 b=gmXRU6RMZsvpt8v3j21Ii27vc2QPoT3jV7aqXsUY8h2g3dVHCIgm8Bd359aE46yy/Br5Icv5V4UTNUDNxHOz8koygZ0fy2cuHyEID590MfC+LYekaprdqpptJHeH+VwZB2fePh+LQqQAf/3dOZOHD/EVB8SS459DiyDj0uM4INF8ngMnWYZ04zdmwUgj7uzUC1ZvKRi/EMQHzolg43xStp7CQsCmmFh7GAb4Phef/6zj5QIsTr5hI2xcEXyXMlC9vbK96Cl3tqhEbTWqIGPu3ZapP/ER/UziJV+4MtcllXjOK0FYdbYZkSeIWTH4+HMUpCHmyA5RXNLkA8m3TLgzkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4crZMkf8vnapZg4pqe10cS6tjvqtKknqn9Q9rKLVSM=;
 b=eqEzVUmM3ZX7Ngf4X1sxpJrE2JdBF3pwTzuOroHA/yRw1qP851VknYK+k1luogV909jRcQcchzVgx6kse//TZoJnSDViq/wmJTj/fmT/T33MAPUIrJpzaHSAQlzWAdX8ssfnRf7RJaIRCl54qHpZgwQu+4HTMY9pNfAOEGc2rL4=
Received: from SEZPR06MB6087.apcprd06.prod.outlook.com (2603:1096:101:e7::6)
 by SEYPR06MB6082.apcprd06.prod.outlook.com (2603:1096:101:d7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 01:21:30 +0000
Received: from SEZPR06MB6087.apcprd06.prod.outlook.com
 ([fe80::5adc:bf44:434f:7204]) by SEZPR06MB6087.apcprd06.prod.outlook.com
 ([fe80::5adc:bf44:434f:7204%7]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 01:21:30 +0000
From:   =?utf-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke.xin@quectel.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        =?utf-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke_xinanwen@163.com>
CC:     "mani@kernel.org" <mani@kernel.org>,
        "slark_xiao@163.com" <slark_xiao@163.com>,
        "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        "dnlplm@gmail.com" <dnlplm@gmail.com>,
        "yonglin.tan@outlook.com" <yonglin.tan@outlook.com>,
        "fabio.porcedda@gmail.com" <fabio.porcedda@gmail.com>,
        "mhi@lists.linux.dev" <mhi@lists.linux.dev>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "inux-kernel@vger.kernel.org" <inux-kernel@vger.kernel.org>,
        =?utf-8?B?SmVycnkgTWVuZyjokpnmnbAp?= <jerry.meng@quectel.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjNdIGJ1czogbWhpOiBob3N0OiBwY2lfZ2VuZXJp?=
 =?utf-8?Q?c:_Add_support_for_Quectel_RM520N-GL_modem?=
Thread-Topic: [PATCH v3] bus: mhi: host: pci_generic: Add support for Quectel
 RM520N-GL modem
Thread-Index: AQHZMsMjG+R55USCWUe7fkeK+LM0gq64QpYAgGDqlaA=
Date:   Mon, 3 Apr 2023 01:21:29 +0000
Message-ID: <SEZPR06MB608778264B368ABF3F10785584929@SEZPR06MB6087.apcprd06.prod.outlook.com>
References: <5d722f4810c89cf2baec3644adce988031-1-23linuxfoundation.org@g.corp-email.com>
 <Y9jbWEcx4frG/V7F@kroah.com>
In-Reply-To: <Y9jbWEcx4frG/V7F@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quectel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB6087:EE_|SEYPR06MB6082:EE_
x-ms-office365-filtering-correlation-id: 5fc36eac-7991-4c80-1675-08db33e1c0e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xTwL5idvkk0EWjXEXl6zXQUsE3ws+GeCxZXxlw2M17qkCORfi3nyekBBa14sUpJFflFiKt+AQ+DKXjwpd2Bm7/Ca8cIpSDws1llwlIv52gpPUfNT+CE6PL/Q9t/a2OEOnE8UFBWAP0ZcmfUZUsSYcCbOv+S1Y5LdhnN2G1LBK+eL8vqQgHg+YH+PPw07rY0RIUStIfjAPcYHQH0UXsJkXfXzDbJpJFFs9ShV9ttALj106kTtJt7qbJs7hQBHWEFpRFe9G5FV9t4tn/j/tGuemd0B0tdfKCN867ye0OkVks05bBPq185L012PRnb7kgpSwDi0u4aGIltU1rkippQfw2SCP72IOQ+RAjV836Otbtz4eNMbmCkmZ/0hwOW4pIJwjfGkQGZlwdKka3fW7YjOj3YocbYe+lluJJLHpYDQhWty3Uox/xLnOssBDpRf2lZ6ulrWXAPelJOEsSMfzDNWRiPRHp4Bzs2+EUsUyRd7kXanVhiHpJ2sGjbiqX3NeUdknNP4Kl75aWpdCpD3SZpxbd7QBdg0176P9ObU/Ly9lR8K+iAiTJ+tYOm7GI69PqsSr+2JYs3Fs9T9ifmzi3RcJC70peS9COfoKPwCLfNuaHwVvJmSKxHjQ7/4R8Z+S59p
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB6087.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(346002)(366004)(136003)(396003)(451199021)(86362001)(38070700005)(85182001)(224303003)(15974865002)(33656002)(2906002)(55016003)(7696005)(71200400001)(83380400001)(186003)(9686003)(6506007)(26005)(45080400002)(107886003)(4326008)(478600001)(76116006)(66556008)(66946007)(66476007)(64756008)(66446008)(41300700001)(5660300002)(7416002)(38100700002)(122000001)(54906003)(110136005)(316002)(52536014)(8936002)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFR4NFhiQnZBYlN5cjJOK2VtZ3MwNEJZVzBXR0JsaUVKQWpjNkd3aHNVZk84?=
 =?utf-8?B?bjF3dm95OHMxVFlUMHExMUdXN3FsbVEwZUp0U0FVeVBSTWlmWEFzM3BZbWlr?=
 =?utf-8?B?QXRlTUI2VEtMTkVKbjZ5OUpIUnIrWm45c1BvR1kzNlZGQlBjV2ZFZFlqcnlw?=
 =?utf-8?B?OTh3a0E0dnc1Q3JHcUVieE4wN3lnTkdlUysvcElMMTVlbGhhVVJSNEk5ZGlz?=
 =?utf-8?B?V0RQTmVta20zWjFtRHduZjlZQzhhTGlYK1RTbC8wWnpFT1N2bVBwQVpMOG1L?=
 =?utf-8?B?cHE0c1c1alhTUk5ycWFhcWdEZ0hkaThRMkowYlBUZ1QyOURHMnBxbVR5blVs?=
 =?utf-8?B?UVlCQnFlODh3aGFIVllnTTE2eVpWSzgvN24xd1V5MVlDQlgyQll4VTlLcEZa?=
 =?utf-8?B?ODl3Ung3aEgxT1R5L0JvbEFrelJIRDNlblNJMVl1YUlTNnh5ZmZUQW90NnFN?=
 =?utf-8?B?b2VtNGdWYzdjeG12RURQRGxmKzc3eHg0Y250WGpRTWZNNm90Mk53Y2x6RlBN?=
 =?utf-8?B?VXY2YjM4dVo5dWFOM0VwQWNDMXJYTU9oWmNFUzRSYUFudytSWjBJVENZLzRa?=
 =?utf-8?B?QVYwckpPYk9qbDF4TDB3YXpESzFBRS83eTJTVitDVFVCcHcyaXNENFJmR2xz?=
 =?utf-8?B?dzNtdzVpYnNETzEwMldDREtRcHlxREs1NlRYMExXNVFBcHhVdndMbTZqUVZL?=
 =?utf-8?B?Y0hXT0pIa2pGdXhxVmtUQ1IrSnArVkxOekJMSVZrMmhxdyt1Qm9yMnF1M0po?=
 =?utf-8?B?b0o4eTdFQnJ1ZTJsT3AxeE12SWdvN2RZOUxhZ1JjbHdUSkRJWithaUVLZ0FJ?=
 =?utf-8?B?dDdmMjZUWGZXOFFGVU9kV0ZQZk85ZmtRSG9oc1hXTm5lVzlFa3RMMytuSnVN?=
 =?utf-8?B?UlRuNWV6d3ZUYkV1TjVUZkxXS204R2ZwRHhneE5UZU1uM1puVnIwM2lCYlVw?=
 =?utf-8?B?UVpJZkNhOXB0MVJUdjllMTlVUzhDSFBOczdqWlN2RitjZGU2aXhhSGV1dW5W?=
 =?utf-8?B?L0dldGNZdkJKNW16cml6QUlUU2RzQytQK2M3blRPQ0pKaGtjMU5WemZpUXdh?=
 =?utf-8?B?NmhDNEhQV29VSlY2UVBzcHlBRHZxdk84RzdGT1Y2L0EzT20wYTNHU1FDZnla?=
 =?utf-8?B?SXFZV0sxTzFKTnZvM2krdlc1L0IxSWVHWGptSVAwMXZIaWovSUExQlF0Wmor?=
 =?utf-8?B?TkJEbkMyV0ROT3ZnNXVmZ0dBWE5NYzFIejFJb3BQSXZqOExtZFcxWUVHNDk5?=
 =?utf-8?B?V01COTJPcUVvUXFwb2dlOTFSQUJvSVRMSnI1ZzRxRWFMdmswR2lobkM5ZlVx?=
 =?utf-8?B?TDNkRVV3WWNrYW8zRFVRZjBTMms5OTVneHNsdUUvby93N3B4MlVGQnZVZFBL?=
 =?utf-8?B?aFU1WjYvblB3bEhEcnpXT3g5YXFIZG9oQjFmaXROMi9BWjRlTEJlQW1ZNDNm?=
 =?utf-8?B?czNkWW9SZjdoUU1raWJ4d2dRM3publFyak9peGtSMXN5M1NRVkpHa3U1RTBs?=
 =?utf-8?B?ZVJlYkVZbzNBY25SUVJ0cjJUVUpWN1ZDMk0vR2hCNWZJNk0wZERuUEhDRGJw?=
 =?utf-8?B?bUFUOFNNZHdQaURNcHhmUjV3ZVJMUXpOeS9yciszZW9pWWpKNnBPVmtrMHZa?=
 =?utf-8?B?MnBiUTM0ZEM3WGFGcjJ6OVJSa2tMYXJjYjVlRlJqSEF0b3A1ZGkrdEk0eGZx?=
 =?utf-8?B?WVp1bUVyZGxad3BWbDlrcG5yYXhKZzJuNWdRLzBTUEJLT3FGOHNTOHRJeWFJ?=
 =?utf-8?B?djI2UW5BUjR5cURPMzEvZk83Y2YzaW9PUzVEVklWMWNTeHd5Z1RQbGltYzUy?=
 =?utf-8?B?eXIwb2ZEZ0Q4azJHQlJrTlF0UmRNRTNGaHNkTHk1Njh6YWZPam5VcVF1ZTZS?=
 =?utf-8?B?OFJzb2ZyMVdCdzNBTHNHU3lnd0VqOStTaS9XZzVCV0tkZ2J4VjU3ekRueUlx?=
 =?utf-8?B?SWhZNnhvSmhJR29od1BDYm9sOHNRSjdWRUY3Slc5WmNSdHN6cUdmK3RMcTNG?=
 =?utf-8?B?aXRRVjFaMVZuc1FNVm1UTGZVV0VHa2dPU2tiTXd6dzh2eUpKQllOMWFRa3NO?=
 =?utf-8?B?Q3VSQmxGUDBjRXp4dTVraUdramo1a0RjdmhyaE05U1hseElyd2tVL2dJSEVy?=
 =?utf-8?Q?hXzOOFhVMY4LoYW4UTZZyiQy7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB6087.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc36eac-7991-4c80-1675-08db33e1c0e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 01:21:29.9740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YTNyMBnkInFSGUQqs8GDM5Cc5aO9RYuytwRJ9EnMDA12nAulQerKgntMgQw1lMPFM0ocxeDwS2r01/9R5ANWDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6082
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgTWFuaQ0KDQpJJ20gc29ycnkuIEkgbWlnaHQgYm90aGVyIHlvdS4gDQoNCkkgd2FudCB0byBr
bm93IHRoZSByZXZpZXcgcHJvZ3Jlc3Mgb2YgW1BBVENIIHYzXSwgaXQgc2VlbXMgdGhhdCB5b3Ug
aGF2ZSBmb3Jnb3R0ZW4gbXkgW1BBVENIIHYzXS4gWW91IGdhdmUgc29tZSBtb2RpZmljYXRpb24g
c3VnZ2VzdGlvbnMgaW4gW1BBVENIIHYyXSwgSSByZXZpc2VkIHRoZW0gYW5kIHN1Ym1pdHRlZCB0
aGVtIHRvIFtQQVRDSCB2M10uDQoNCg0K6L6b5a6J5paHRHVrZSBYaW4gfCBTb2Z0d2FyZSBEZXBh
cnRtZW50IElYIEVuZ2luZWVyIHwgUXVlY3RlbCBXaXJlbGVzcyBTb2x1dGlvbnMgQ28uLCBMdGQu
IA0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCANCk1vYmlsZTogKzg2LTE1Mzc1NDU2MTgzIHwgRW1h
aWwgOiBEdWtlLnhpbkBxdWVjdGVsLmNvbcKgIHwgVGVsOiArODYtMDU1MS02NTg2OTM4Ni04NjMy
DQpXZWJzaXRlOiB3d3cucXVlY3RlbC5jb23CoCB8IFFROiA2MDI2NTkwNzIgfCBXZWNoYXQ6IDE1
Mzc1NDU2MTgzDQoNCkJ1aWxkaW5nwqAxLUMswqBDaGluYcKgU3BlZWNowqBWYWxsZXnCoEFyZWHC
oEEswqAzMzM1wqBYaXlvdcKgUm9hZCzCoEhpZ2gtdGVjaMKgWm9uZSzCoEhlZmVpLMKgQW5odWnC
oDIzMDA4OCzCoENoaW5hwqDCoMKgIA0K5a6J5b6955yB5ZCI6IKl5biC6auY5paw5Yy65Lmg5Y+L
6LevMzMzNeWPt+S4reWbve+8iOWQiOiCpe+8ieWbvemZheaZuuiDveivremfs+S6p+S4muWbrUHl
jLox5Y+35Lit6K+V5qW8IDIzMDA4OA0KSFE6IEJ1aWxkaW5nIDUsIFNoYW5naGFpIEJ1c2luZXNz
IFBhcmsgUGhhc2UgSUlJIChBcmVhIEIpLCBOby4xMDE2IFRpYW5saW4gUm9hZCwgTWluaGFuZyBE
aXN0cmljdCwgU2hhbmdoYWkgMjAwMjMzLCBDaGluYQ0K5oC76YOo77ya5LiK5rW35biC6Ze16KGM
5Yy655Sw5p6X6LevMTAxNuWPt+enkeaKgOe7v+a0sjPmnJ/vvIhC5Yy677yJNeWPt+alvMKgIDIw
MDIzMw0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6IEdyZWcgS0ggPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPiANCuWPkemAgeaXtumXtDogMjAyM+W5tDHmnIgzMeaXpSAx
NzoxMg0K5pS25Lu25Lq6OiBEdWtlIFhpbijovpvlronmlocpIDxkdWtlX3hpbmFud2VuQDE2My5j
b20+DQrmioTpgIE6IG1hbmlAa2VybmVsLm9yZzsgc2xhcmtfeGlhb0AxNjMuY29tOyBsb2ljLnBv
dWxhaW5AbGluYXJvLm9yZzsgZG5scGxtQGdtYWlsLmNvbTsgeW9uZ2xpbi50YW5Ab3V0bG9vay5j
b207IGZhYmlvLnBvcmNlZGRhQGdtYWlsLmNvbTsgbWhpQGxpc3RzLmxpbnV4LmRldjsgbGludXgt
YXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7IGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgSmVy
cnkgTWVuZyjokpnmnbApIDxqZXJyeS5tZW5nQHF1ZWN0ZWwuY29tPjsgRHVrZSBYaW4o6L6b5a6J
5paHKSA8ZHVrZS54aW5AcXVlY3RlbC5jb20+DQrkuLvpopg6IFJlOiBbUEFUQ0ggdjNdIGJ1czog
bWhpOiBob3N0OiBwY2lfZ2VuZXJpYzogQWRkIHN1cHBvcnQgZm9yIFF1ZWN0ZWwgUk01MjBOLUdM
IG1vZGVtDQoNCk9uIEZyaSwgSmFuIDI3LCAyMDIzIGF0IDA2OjQ3OjU0UE0gLTA4MDAsIER1a2Ug
WGluKOi+m+WuieaWhykgd3JvdGU6DQo+IFRoZSBwcm9qZWN0IGlzIGJhc2VkIG9uIFF1YWxjb21t
J3Mgc2R4NnggY2hpcHMgZm9yIGxhcHRvcCxzbyB0aGUgbWhpIA0KPiBpbnRlcmZhY2UgZGVmaW5p
dGlvbiBhbmQgZW51bWVyYXRpb24gYWxpZ24gd2l0aCBwcmV2aW91cyBRdWVjdGVsIHNkeDI0IA0K
PiBjb25maWd1cmF0aW9uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEdWtlIFhpbijovpvlronmlocp
IDxkdWtlX3hpbmFud2VuQDE2My5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9idXMvbWhpL2hvc3Qv
cGNpX2dlbmVyaWMuYyB8IDEzICsrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBp
bnNlcnRpb25zKCspDQo+IA0KDQpIaSwNCg0KVGhpcyBpcyB0aGUgZnJpZW5kbHkgcGF0Y2gtYm90
IG9mIEdyZWcgS3JvYWgtSGFydG1hbi4gIFlvdSBoYXZlIHNlbnQgaGltIGEgcGF0Y2ggdGhhdCBo
YXMgdHJpZ2dlcmVkIHRoaXMgcmVzcG9uc2UuICBIZSB1c2VkIHRvIG1hbnVhbGx5IHJlc3BvbmQg
dG8gdGhlc2UgY29tbW9uIHByb2JsZW1zLCBidXQgaW4gb3JkZXIgdG8gc2F2ZSBoaXMgc2FuaXR5
IChoZSBrZXB0IHdyaXRpbmcgdGhlIHNhbWUgdGhpbmcgb3ZlciBhbmQgb3ZlciwgeWV0IHRvIGRp
ZmZlcmVudCBwZW9wbGUpLCBJIHdhcyBjcmVhdGVkLiAgSG9wZWZ1bGx5IHlvdSB3aWxsIG5vdCB0
YWtlIG9mZmVuY2UgYW5kIHdpbGwgZml4IHRoZSBwcm9ibGVtIGluIHlvdXIgcGF0Y2ggYW5kIHJl
c3VibWl0IGl0IHNvIHRoYXQgaXQgY2FuIGJlIGFjY2VwdGVkIGludG8gdGhlIExpbnV4IGtlcm5l
bCB0cmVlLg0KDQpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1lc3NhZ2UgYmVjYXVzZSBvZiB0aGUg
Zm9sbG93aW5nIGNvbW1vbiBlcnJvcihzKSBhcyBpbmRpY2F0ZWQgYmVsb3c6DQoNCi0gVGhpcyBs
b29rcyBsaWtlIGEgbmV3IHZlcnNpb24gb2YgYSBwcmV2aW91c2x5IHN1Ym1pdHRlZCBwYXRjaCwg
YnV0IHlvdQ0KICBkaWQgbm90IGxpc3QgYmVsb3cgdGhlIC0tLSBsaW5lIGFueSBjaGFuZ2VzIGZy
b20gdGhlIHByZXZpb3VzIHZlcnNpb24uDQogIFBsZWFzZSByZWFkIHRoZSBzZWN0aW9uIGVudGl0
bGVkICJUaGUgY2Fub25pY2FsIHBhdGNoIGZvcm1hdCIgaW4gdGhlDQogIGtlcm5lbCBmaWxlLCBE
b2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCBmb3Igd2hhdA0KICBu
ZWVkcyB0byBiZSBkb25lIGhlcmUgdG8gcHJvcGVybHkgZGVzY3JpYmUgdGhpcy4NCg0KSWYgeW91
IHdpc2ggdG8gZGlzY3VzcyB0aGlzIHByb2JsZW0gZnVydGhlciwgb3IgeW91IGhhdmUgcXVlc3Rp
b25zIGFib3V0IGhvdyB0byByZXNvbHZlIHRoaXMgaXNzdWUsIHBsZWFzZSBmZWVsIGZyZWUgdG8g
cmVzcG9uZCB0byB0aGlzIGVtYWlsIGFuZCBHcmVnIHdpbGwgcmVwbHkgb25jZSBoZSBoYXMgZHVn
IG91dCBmcm9tIHRoZSBwZW5kaW5nIHBhdGNoZXMgcmVjZWl2ZWQgZnJvbSBvdGhlciBkZXZlbG9w
ZXJzLg0KDQp0aGFua3MsDQoNCmdyZWcgay1oJ3MgcGF0Y2ggZW1haWwgYm90DQo=
