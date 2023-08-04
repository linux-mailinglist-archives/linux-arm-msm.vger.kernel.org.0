Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56CE776F867
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 05:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjHDDeU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Aug 2023 23:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjHDDeR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Aug 2023 23:34:17 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2048.outbound.protection.outlook.com [40.107.255.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74604498
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Aug 2023 20:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3/7jy75CqhvxG3cCW5r5xAijEF+dZ5FtzJAZWTAroVCJSHGWKr9eX4yQ/IH6qkIZ7XHoLOGjRoVl1KzoYvcVmIFGjQWBEkgpe+unZgHHqeDTEpvSZg4JKvbDNCIllzYcNzq/kXI5d9o2oNqCoAhfvdtxXfXXF2bqfGgLZp/5pDVPlv2QyNi96Y5VfvpaPJF4kY3/UM0uPjDn2kMzI3DFmdkCgpCGVAjGr0sVuAiXCrtiP9thp/Y/cK3nB5Go2MGtFw14wB6eRdccB64i9Sl35qo4umuX0y+fH9og7EhUAO3pMUCYmE7yVNAV5L3/dAPXynwq8bpyYrfS2dDmkQMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wK4r1KejdKy96DoGKZIS7v7tTFr1anZbWMOqhguDBM=;
 b=d7h0JP6i7x/OahyGHeDLtFzrJCQ476s+A9j6d78mhE9Jxnf6MJZFTWZSJ8yE6DBI1uJ1jRvwp3/6uLHjBLltoNQRAre96OtKxCqQ+JKmLbegPp8IdzARO1TuwYVbQ1bPmqeVgU1rIs+ccCm8PacC4yJCBa3EYE13GmAsnpz/9bfTlowqjgCm+aE0zwbXBl7OciNmY5+npwCoonzAf+y/DjaxP7cv5u9dDlU1hJ+IbTA1RwHwLpqtTPDFF84F/vjBGLHNV2TGNGLPzIS3mGZJwYjRAVmGxLNVJz4FPcPP4mJRceSkyPrJPx4jW6dgV0YGE3+4Anae643ZBlYLrI2DiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wK4r1KejdKy96DoGKZIS7v7tTFr1anZbWMOqhguDBM=;
 b=YfyZ9nKEmWysBIo4L3h26whZhgNlEbpvbeu/qVI5qPJ9upbsPVTtHqCNJZwGajpHxlXJ2KPnUddQScDyNICXvDA2/4IdoUpoZBN01MamEJaXNOlNpOdhdppsdIEnup2w9VDvSN7QKJvFzz4sAm1Dwi7qrVMgeyfAkoCgShYIaBg=
Received: from TY0PR06MB5053.apcprd06.prod.outlook.com (2603:1096:400:1be::13)
 by SG2PR06MB5384.apcprd06.prod.outlook.com (2603:1096:4:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 03:34:10 +0000
Received: from TY0PR06MB5053.apcprd06.prod.outlook.com
 ([fe80::c99a:8bdd:8dc0:bd76]) by TY0PR06MB5053.apcprd06.prod.outlook.com
 ([fe80::c99a:8bdd:8dc0:bd76%6]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 03:34:10 +0000
From:   =?utf-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke.xin@quectel.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke_xinanwen@163.com>
CC:     "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        "slark_xiao@163.com" <slark_xiao@163.com>,
        "fabio.porcedda@gmail.com" <fabio.porcedda@gmail.com>,
        "koen.vandeputte@citymesh.com" <koen.vandeputte@citymesh.com>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "mhi@lists.linux.dev" <mhi@lists.linux.dev>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        =?utf-8?B?SmVycnkgTWVuZyjokpnmnbAp?= <jerry.meng@quectel.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIGJ1czogbWhpOiBob3N0OiBwY2lfZ2VuZXJpYzog?=
 =?utf-8?Q?Add_support_for_Lenovo_RM520N-GL?=
Thread-Topic: [PATCH] bus: mhi: host: pci_generic: Add support for Lenovo
 RM520N-GL
Thread-Index: AQHZwPWNQ1QPRvXznU2l5TXTumzuuK/W4SoAgAKlQtA=
Date:   Fri, 4 Aug 2023 03:34:09 +0000
Message-ID: <TY0PR06MB50538D79FDB64A7146CF76888409A@TY0PR06MB5053.apcprd06.prod.outlook.com>
References: <6c4818921554a259795e63d00fd0b8892-8-23kernel.org@g.corp-email.com>
 <20230802110736.GE57374@thinkpad>
In-Reply-To: <20230802110736.GE57374@thinkpad>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quectel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR06MB5053:EE_|SG2PR06MB5384:EE_
x-ms-office365-filtering-correlation-id: de239a79-d660-425d-06b6-08db949baa46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DcuFc69DBXqoW5ZtaG2KGhYaiORlT2JJKHvlRAVFpIglfQI0H4vgrt0bG7gXXYfPmHoRGky0oi2RR0mseYb2WWBBsWHyBU5Ge09YGwGAH8g7aSBAduLxM7lEYkFmarDxj1rvURPKQri2r63YuVgOC3Hy4CgnxlbDwI7+oTuhwn/v/NLWNt7NUB9lpaX9AnCfkgPdSDsJ53iqlBeTO0GdD9OFo8mHh57X6Ru9U+pW/l9ikiZwoImkLWwFdc6UwHWZEmCTziFf/BgtM3KlD9HfqCNfpLnc5W4OfbtHDY552Xg5cDSg5ed1KtSgTosrttGn5/h2HBcKupMlNhskDCWVgIVvt/cT/I91mipAMUifvCU/r7hEcqFtbQWja2nnpkjOiCZ0PJ5LDafGr04n5HORPwHWT3hIGn+hGT2EBgz30TrnRlHlcydogqDV5Y5La8rHlKVgjTiVdDP/mxkApsZgLK7ToevKluSFPZqNZRZX9c6QVD6HD0sCb06zV+KXCQn25n0pxBYP13wD8SZjan5XjGQ45MhuvJZCjxnHDgkiz4rwZc/w8oWnXsQlVobEB1s/m0P/G+2Ah+80kXp35IDUi5B0YWfH9psonGfbWAaZ3wXwHTUQCwX1z21HesYmUQiI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB5053.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(1800799003)(186006)(66446008)(66556008)(41300700001)(316002)(2906002)(76116006)(66946007)(64756008)(4326008)(66476007)(52536014)(8936002)(5660300002)(122000001)(33656002)(85182001)(26005)(224303003)(38070700005)(6506007)(83380400001)(15974865002)(86362001)(38100700002)(7696005)(478600001)(9686003)(54906003)(71200400001)(110136005)(107886003)(55016003)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHNOdlgrT0FIMmRzY1VON0NvZzZHYStkaUlObFNVdVZQWlN4UXNaMTRzZW80?=
 =?utf-8?B?T2Y5RURNTlVXVmJZSjd4ZWRycmNPWFBoWkptNGxzMzFOendLc1ZCQzBEaHFV?=
 =?utf-8?B?dFdHVnVMZXpFQnJ3SjVPUFltN0xFRGxpU1hkYjIrbGJ6Z1pIblBMSHBPMDd6?=
 =?utf-8?B?aDJaRktKQnNhUVQ1NG8zdHV5ZmVPNmwwZDQ3NW0yU2tJM09RZGU3VCt6LzlZ?=
 =?utf-8?B?VVB6TzYwMVdnOG8yRmsrcnNXR2tkT3VuT0pPdlp4R2VCMVNBdE5mZkdvVCtY?=
 =?utf-8?B?d09pbjY3ZjNta09CRUpZVngvanlmOEFNMTZPOE9nM0xEUnM5TjVyeGhxNzZD?=
 =?utf-8?B?bTBiZ2p1L3VkMFRxWC9QMnpuOUVmM1czOHBJTzRaSUpSL0t0U3RyQWRRZlc5?=
 =?utf-8?B?RDdoNnI5enRnUkxEMzEvOWZmSTNCMTdZbHBuMWdpTEFBRFdjNEJoVjYzdE9Q?=
 =?utf-8?B?VTFqVmhpT3g5cEVzekpINlFJR25Zb2xtb0ZjWjdSbXB2U1RJQVRmSlhXK0hq?=
 =?utf-8?B?QXY2TWJ0UnVBQUs5SDJlazUzalJXcCtGT0lGY09mWHIraWpXMnBRM0VVYXQ0?=
 =?utf-8?B?bWNqdGNKNFRObnhhUzRUTzVpY1dPN01NWTZmYVR5cVdQYW5NKzJPa0dGb1FM?=
 =?utf-8?B?RkNaZG95bHBFSHRPSFNkY1U0b1U1TUFiZm9tVDdnc1NPL3pXRlhyNmFpVHhw?=
 =?utf-8?B?dlhIY3A2OUJ0b1NOVGRwM01SeHdCSE5OQmFjek1UVnNJVi95a0NpZ0NYSHVO?=
 =?utf-8?B?eitrTUVVRmg5TzE4eVJrMHBoY3dQdXViQXNMT09GY1VNS0RaQmFIalloaG9J?=
 =?utf-8?B?bzRGK21KMmFOcGQ5b3BCaTZZSmsxalp2aW83NkNXWDlIOGJXZHk3aUZlcE90?=
 =?utf-8?B?RGRPU2ZSc3FnbXcwK0xWNXdZbEhuaXpTWTRVaDkyb0hUYVk5QWRiQkk4QlNP?=
 =?utf-8?B?OXd1Ry9MUU9HakVkcnQrdVBGT2NWRFhldWhGL2IwTTUxQzhkZ1V2UFZZWXQ3?=
 =?utf-8?B?SGx0aHcydjJoNHZDTUc2ZmZHNFhHZVRTYUxTY0VxOXBESXZXV0xldHlsdG9j?=
 =?utf-8?B?VGVGYlRCUVRBNERRbGJ4YnVVMnlrL0RMcWd6M1p1VWpNN2RCYnU5dDhVdE9m?=
 =?utf-8?B?ekNMbDNkUWV5NG5UVFhVaHNqMjVEV3FLd2ticitwemxvYytyanRneHBrbll4?=
 =?utf-8?B?OTFUWnhwcXRKenh4dXloQ21TY1owVWF0L3ROYWYwR1JOdkhVWm9SU25vWXQ5?=
 =?utf-8?B?Vk1JU3lIL09GOTlMTEM5eGRBRzIvWlRUOTYvUTErSnIvM0FVUnY4S3RMVldB?=
 =?utf-8?B?RjN2NjYveWdQTm1KaHdBQTFKQ05nSlhZbzFIYmJHT3dTYXVNWmo2dld0ejQy?=
 =?utf-8?B?U1k1NHpKSVBybUhrcjMyYUVEZXkyZEg3aFZ3eGQ1TEpDZHlMYlczUHdTRGI3?=
 =?utf-8?B?aTBSTE1hWGVYMThKV2ZFYmlsTGpTbXBUWkRuN2FEeTcvVGgycUMzNkNvN0h0?=
 =?utf-8?B?L3RkZlVEaFp4TnBpT3pKU01FSi95YmtiN29hTDhZRUF4aXBpdTJTb2REYkgy?=
 =?utf-8?B?RFhzWVptU0xFTUN5cHdYbFZDS1hYbTU2V2xZK1RhbldzdWZJWEZZZllXaVVa?=
 =?utf-8?B?anBBQVpCRW9mcHdrSU41bDZsbUZXWk1PVDFMTmkzR1JlYUJwbXpyZXpLYzIr?=
 =?utf-8?B?VWtaRjlReTRGQ0hvOGQxbnpoZ2VNSWdTQlY4dFVmaS9pdHZiSzBXOGpRUHkv?=
 =?utf-8?B?RHdBTnQxa21mSURzbm9mdXljWXE5V3RoMGxBVmZTckJ1TlNhZWlENWsyY2Rk?=
 =?utf-8?B?R2VvUU1qNVZRYVcrM0Rvd3pKS1NtT3NTRGE1d0FqUmFNWVRwT0RnQmpJaTh4?=
 =?utf-8?B?NXZUZEpLSklzMllOOFdPTmpmcUFNUlpkMU5Sd0xOZC9Gc256ZG5zbjJzYTFl?=
 =?utf-8?B?QzMxWTdpNmk0TXptOWdMSmxLTy8wNkJ4ZldpUGx2UUhkRHpmaGd2Y3M5RHpx?=
 =?utf-8?B?MzVJVkFTNm5sLzVpcWlHNGk4SUU4NCtCU3lBdUFmaXQ5THhPNmJwdVEzak5w?=
 =?utf-8?B?d2dRVmsydXNrSzNySnIvbzRLdzNtOTlVaysxOG1Kdkw3SEZNN1ZvdUovSWd6?=
 =?utf-8?Q?0QcDidslRiGyeuYj8mz0PVbD5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5053.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de239a79-d660-425d-06b6-08db949baa46
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 03:34:10.0478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c0xWmVxluUJh8MrbJV051cZ5/jCuetZDJ2AKotuGsy9YzswqdnN/Zl+ZFIuyspHs19DHnC2PLq/sU7W/IdkWYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5384
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgTWFuaQ0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIGNhcmVmdWwgcmV2aWV3IGFu
ZCBzdWdnZXN0aW9ucy4gDQpJIHdpbGwgZml4ZWQgaXQgaW4gcGF0Y2ggVjIgdmVyc2lvbi4NCg0K
6L6b5a6J5paHICBEdWtlIFhpbiB8IFNvZnR3YXJlIERlcGFydG1lbnQgSVggRW5naW5lZXIgfCBR
dWVjdGVsIFdpcmVsZXNzIFNvbHV0aW9ucyBDby4sIEx0ZC4gDQogICAgICAgICAgICANCk1vYmls
ZTogKzg2LTE1Mzc1NDU2MTgzIHwgRW1haWwgOiBEdWtlLnhpbkBxdWVjdGVsLmNvbSAgfCBUZWw6
ICs4Ni0wNTUxLTY1ODY5Mzg2LTg2MzINCldlYnNpdGU6IHd3dy5xdWVjdGVsLmNvbSAgfCBRUTog
NjAyNjU5MDcyIHwgV2VjaGF0OiAxNTM3NTQ1NjE4Mw0KDQpCdWlsZGluZyAxLUMsIENoaW5hIFNw
ZWVjaCBWYWxsZXkgQXJlYSBBLCAzMzM1IFhpeW91IFJvYWQsIEhpZ2gtdGVjaCBab25lLCBIZWZl
aSwgQW5odWkgMjMwMDg4LCBDaGluYSAgICANCuWuieW+veecgeWQiOiCpeW4gumrmOaWsOWMuuS5
oOWPi+i3rzMzMzXlj7fkuK3lm73vvIjlkIjogqXvvInlm73pmYXmmbrog73or63pn7PkuqfkuJrl
m61B5Yy6MeWPt+S4reivlealvCAyMzAwODgNCkhROiBCdWlsZGluZyA1LCBTaGFuZ2hhaSBCdXNp
bmVzcyBQYXJrIFBoYXNlIElJSSAoQXJlYSBCKSwgTm8uMTAxNiBUaWFubGluIFJvYWQsIE1pbmhh
bmcgRGlzdHJpY3QsIFNoYW5naGFpIDIwMDIzMywgQ2hpbmENCuaAu+mDqO+8muS4iua1t+W4gumX
teihjOWMuueUsOael+i3rzEwMTblj7fnp5HmioDnu7/mtLIz5pyf77yIQuWMuu+8iTXlj7fmpbwg
IDIwMDIzMw0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6IE1hbml2YW5uYW4g
U2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPiANCuWPkemAgeaXtumXtDogMjAyM+W5tDjmnIgy
5pelIDE5OjA4DQrmlLbku7bkuro6IER1a2UgWGluKOi+m+WuieaWhykgPGR1a2VfeGluYW53ZW5A
MTYzLmNvbT4NCuaKhOmAgTogbWFuaUBrZXJuZWwub3JnOyBsb2ljLnBvdWxhaW5AbGluYXJvLm9y
Zzsgc2xhcmtfeGlhb0AxNjMuY29tOyBmYWJpby5wb3JjZWRkYUBnbWFpbC5jb207IGtvZW4udmFu
ZGVwdXR0ZUBjaXR5bWVzaC5jb207IGJoZWxnYWFzQGdvb2dsZS5jb207IG1oaUBsaXN0cy5saW51
eC5kZXY7IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnOyBKZXJyeSBNZW5nKOiSmeadsCkg
PGplcnJ5Lm1lbmdAcXVlY3RlbC5jb20+OyBEdWtlIFhpbijovpvlronmlocpIDxkdWtlLnhpbkBx
dWVjdGVsLmNvbT4NCuS4u+mimDogUmU6IFtQQVRDSF0gYnVzOiBtaGk6IGhvc3Q6IHBjaV9nZW5l
cmljOiBBZGQgc3VwcG9ydCBmb3IgTGVub3ZvIFJNNTIwTi1HTA0KDQpPbiBUaHUsIEp1bCAyNywg
MjAyMyBhdCAwNjo0NzowMlBNIC0wNzAwLCBEdWtlIFhpbijovpvlronmlocpIHdyb3RlOg0KDQpJ
dCBpcyBhIFF1ZWN0ZWwgbW9kZW0sIHJpZ2h0PyBUaGVuIGl0IHNob3VsZCBiZSBtZW50aW9uZWQg
YXMgUXVlY3RlbCBpbiBzdWJqZWN0Lg0KDQo+IFRoaXMgbW9kZW0gaXMgZGVzaWduZWQgYmFzZWQg
b24gUXVhbGNvbW0gU0RYNnggYW5kIGl0IHdpbGwgYWxpZ24gd2l0aCB0aGUgcXVlY3RlbCBwcmV2
aW91cyBSTTUyME4tR0wgbW9kZW0gc2V0dGluZ3MuDQoNCnMvaXQgd2lsbCBhbGlnbi93b3Jrcw0K
DQpzL3F1ZWN0ZWwgcHJldmlvdXMvUXVlY3RlbCdzIGV4aXN0aW5nDQoNCj4gQnV0IHRoaXMgb25l
IGlzIGRlc2lnbmVkIGZvciBsZW5vdm8gbGFwdG9wIHVzZWNhc2UsIGhlbmNlIFF1ZWN0ZWwgZ290
IGEgbmV3IFBJRC4NCj4gDQoNCkFsc28sIHdyYXAgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIDc1IGNv
bHVtbnMuIEFuZCBhbHdheXMgcnVuIC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIGFuZCBmaXggd2Fy
bmluZ3MvZXJyb3JzIGJlZm9yZSBwb3N0aW5nIGEgcGF0Y2guDQoNCi0gTWFuaQ0KDQo+IFNpZ25l
ZC1vZmYtYnk6IER1a2UgWGluKOi+m+WuieaWhykgPGR1a2VfeGluYW53ZW5AMTYzLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jIHwgMyArKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jIA0KPiBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L3Bj
aV9nZW5lcmljLmMNCj4gaW5kZXggZmNkODBiYzkyOTc4Li5lNGYyZmI2N2RmYWYgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMNCj4gKysrIGIvZHJpdmVy
cy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYw0KPiBAQCAtNjA0LDYgKzYwNCw5IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBtaGlfcGNpX2lkX3RhYmxlW10gPSB7DQo+ICAJ
LyogUk01MjBOLUdMIChzZHg2eCksIGVTSU0gKi8NCj4gIAl7IFBDSV9ERVZJQ0UoUENJX1ZFTkRP
Ul9JRF9RVUVDVEVMLCAweDEwMDQpLA0KPiAgCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25n
X3QpICZtaGlfcXVlY3RlbF9ybTV4eF9pbmZvIH0sDQo+ICsJLyogUk01MjBOLUdMIChzZHg2eCks
IExlbm92byB2YXJpYW50ICovDQo+ICsJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfUVVFQ1RF
TCwgMHgxMDA3KSwNCj4gKwkJLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSAmbWhpX3F1
ZWN0ZWxfcm01eHhfaW5mbyB9LA0KPiAgCXsgUENJX0RFVklDRShQQ0lfVkVORE9SX0lEX1FVRUNU
RUwsIDB4MTAwZCksIC8qIEVNMTYwUi1HTCAoc2R4MjQpICovDQo+ICAJCS5kcml2ZXJfZGF0YSA9
IChrZXJuZWxfdWxvbmdfdCkgJm1oaV9xdWVjdGVsX2VtMXh4X2luZm8gfSwNCj4gIAl7IFBDSV9E
RVZJQ0UoUENJX1ZFTkRPUl9JRF9RVUVDVEVMLCAweDIwMDEpLCAvKiBFTTEyMFItR0wgZm9yIEZD
Q0wgDQo+IChzZHgyNCkgKi8NCj4gLS0NCj4gMi4yNS4xDQo+IA0KDQotLQ0K4K6u4K6j4K6/4K61
4K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQ0K
