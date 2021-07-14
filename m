Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBD53C7C73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 05:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237662AbhGNDNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 23:13:21 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50120 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237435AbhGNDNV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 23:13:21 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 850E3C0B6B;
        Wed, 14 Jul 2021 03:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1626232230; bh=0ciTjj5l8ebJNhNeqqjKPAQCpdxc6zYM2IbVWnHTSYU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ODxmpClaiGW26SuPORuNFf0WhxDhKfDDbEWNNZJP12P2v9KzEmRJef+rQCe7sFBR3
         Jol0ioBz5JtZU8FqeelxPwOdx1+ZyEf7tyntKLqw3H83Uo+PdmE9gKIm/9cGzrIPui
         4IN4FrRWMEeuCHxjbSskYSfSsF7FP4Hm5S+yHu7Bb9V7wgujt778OsozNCitJdo1ca
         NK4Xbm0EU3VtMTqGh1EeN0eFZkncQU+jbA2pnRjh9Wz/HoupUzAODdcPECfyg8fu/9
         7mD7ulqk8RJQpPjT5+BqT5Ggr8klq/RyUioXEutbIQfbmo5yJ+goNLHZh32ckYy8gj
         10loJ4NEdAa7Q==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 8DBA0A0081;
        Wed, 14 Jul 2021 03:10:28 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 377004011B;
        Wed, 14 Jul 2021 03:10:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="JklevVAo";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdLPJqtek0FWlSG72TkAJZXLnO/xZfmLWjCyL0dyC/Uk9x5oDmQ5GWb4erqCE1qHeKeJH8WKTs5S3XanuDjI1b42C6/gicN+M9eC65AWFuTh978n9dtGYNzowGp2twMIg2sWFKtZUEso34PJzItFYyiESwt63B2O5K4f6d41ByAXj5pir7BU2WMhCrHkXDeYiAetdkHdQPlVZ9K+jbt8Zq7IkDrdLSMa/GxXBzZ3cJ4tw7+7mG2ewjLo7iYe7VGiBgnT4NL+EGxb6cefQ96gqvHCDEvjRQlriqpb6wkYXJow3CEgZqR+bjSpHFCIjvuR1h9BeSY2H4l34MXX9KKjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ciTjj5l8ebJNhNeqqjKPAQCpdxc6zYM2IbVWnHTSYU=;
 b=FkOjmBLhb/A4pDgkkUFPuTREV16ddxUhTl8w93ExMXDyNOXp1h2QXx3mKaGDENI0w+JroLeuJN4JQ09M/i0dbbidOJo+dAJEkFlpEWA4BBalkQuypPMbgBeCj9WMga5mvhfCLFbj4Dodb9p/W3zv/TmtFVtg5Twxrd7R3E+EY9e94YHscbHQY6nKeUW+lN0gtQO5QWds0ENFilbsnasyaCqq1nNtjKdt1f+Hys4N04Ci6r94TxtccBdVdKLicWWJ13/e2kUElNwEGv4S96YUvXesQ/udR3WWAKJUygu8+h5MXVFN09G7TElPfL8qbX1Vp8OuIcnenHro/Dw+aHkjew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ciTjj5l8ebJNhNeqqjKPAQCpdxc6zYM2IbVWnHTSYU=;
 b=JklevVAo3w+WkojFyhV0C8krfcRU2DW3wwTCHi+x0E9F3tu/y+m9ahieXrJEM+xj3/Ynxr/kgY98sH3NafEGptJp4ZPbLsiVbxH5s3bUQiyi4kLEtOiy4S4jtV/a1og7+oCeW9J5ZKo8Jv9IpVcDs4HZrbzbM2mwrRdMGsS9HV8=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Wed, 14 Jul
 2021 03:10:25 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::1582:d559:a0db:29e4]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::1582:d559:a0db:29e4%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 03:10:25 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "frowand.list@gmail.com" <frowand.list@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>
Subject: Re: [PATCH v14 3/6] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Thread-Topic: [PATCH v14 3/6] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Thread-Index: AQHXdWvmr0dK2TF02kiXSnoLeHYyUatAA0oAgACW+4CAATZ2AA==
Date:   Wed, 14 Jul 2021 03:10:25 +0000
Message-ID: <e08dac42-e999-fd97-21ab-34cd70429f03@synopsys.com>
References: <1625908395-5498-1-git-send-email-wcheng@codeaurora.org>
 <1625908395-5498-4-git-send-email-wcheng@codeaurora.org>
 <b65463e9-3a8d-1ee5-3e26-09990aa8ec53@synopsys.com>
 <87czrmzjym.fsf@kernel.org>
In-Reply-To: <87czrmzjym.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba0744cf-4ed3-463d-c4de-08d94674ecf0
x-ms-traffictypediagnostic: BY5PR12MB4116:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB41169EC8395D941FD5DF9AE6AA139@BY5PR12MB4116.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5+/mo7RRHbqbcits8km5TqZCNc5y24mWhf7BtU8QwYOPuR9+k+KCtwOeedOM3Lyui2o1zwWBjUb5UfH2WpRHd8i5jbARjivmIaonTWOiE2rGAYDp3QoyPybLQyqnEPMJOGRr2J+Sl4KDBzFPRf2wCQdoGGcip23QZy26o4OUSw6G/D1p/2LyfeIHOM5oCPaCOev6weP7q7m+0mZkczeRToQlFUz5dRh4C5/DLJmwDwgaNAz/Qo4+14AYPOO7aGz9EcA8f8KgfxWPp0hmSwU6EggtQ2xtOh5eCGpebau/HdT/4iKMthp6LwmePUMlaMmOHaYLjd2zVoBIGLjo8l8KPrLsH9UnlB1oVXEQT7KyrqM/DI175lrQf9jtAXU7GPvYJ0/3A+9sgTT6DOBSpsBxhTUYsy5G/nRjLaJtIWtAAQBOoI92AlIew/tORCKK/BAMt3mPET4a+4dqNiXUfsDFS6vUYBTEcJavANGuUC4q5fAgB2IDCXU14WHNpo5R9jbsPb/dWzCEH6kgMW+zJhesIpb+7Au95Yvhs0lBWzsgtyQywOAlok89OACv68wIzcOORJ75CyxTnfXqN9AzFjV6mOTMLXlJ8MClJAh31Erix7srae4zXJFYnVc/dpsDtGEfEW8hwz1WPkcCgHb2SvjWxKXbyhJqj5Qx4eYiXqxFHyTIybHaPWrzuqv32+4jI9VeE938cJANzhsvZyDTMFLnjmV1GK19hHhS7Bk2N13qgXzklhaDlLTJwvYX78/YMFFB+I9A83H5ZF5LJ56y6x3CqQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(136003)(346002)(376002)(366004)(8936002)(8676002)(110136005)(36756003)(38100700002)(316002)(4326008)(54906003)(7416002)(478600001)(2616005)(66476007)(66446008)(6506007)(186003)(6486002)(2906002)(86362001)(76116006)(122000001)(31696002)(31686004)(66946007)(5660300002)(66556008)(64756008)(6512007)(83380400001)(26005)(71200400001)(38070700004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzB4U09QdWhmaTg5WGRpSXdkWkNsQUJ1WXFibTVUd2lXa0IrMUR0SWFkUzJU?=
 =?utf-8?B?RFdJdktUcEN1K0FmMFA4RFREc3dYblhRWUFOanlzSVQ4VlFoS1VZMGtUaW5R?=
 =?utf-8?B?U0hWNHVxUk51Rll3elJ6Zm5uVDU2RzNiRDU4ZW9tK3diTFAxUTNLeXRwQTVI?=
 =?utf-8?B?WUg5eUpjeXJQY09pRG4zdFp5eGlYN1JzT0xibFZnRWhidktyVkZLbkJlcG9w?=
 =?utf-8?B?U0c1Z3JHdk8zZ1g1c0RyenAxbVgrUlFrUmhMbEx6d1VYQ1NCeXRyalVLQStn?=
 =?utf-8?B?NytpeFF5blBZWXJnNHlYV2pzUld6TlZUSGFiUDR6aGJyK3RCZGs2ekxZbWN6?=
 =?utf-8?B?Y0d4aGhYUzkxajhHdkVybXM3QUEzL1NlWDRLMFJQRXlBdDhnQVZQeTF5MUwr?=
 =?utf-8?B?ZmhycURvbExrSCsycmo1TkJrQ2xMOHJBUFJwN3htb2s0NFBJQVNyRXBlU2Zn?=
 =?utf-8?B?cG10UFlqK1dtTnZZNVhHdDBTOFVPTm5TbUU2TlB5TGxSL0k0ellUMmw3OENs?=
 =?utf-8?B?SVl0MENJTmhZSTV6a2JsUERraHpmSks2dFk1eXJoUm9wYkQ2TFc4R21ZUzVD?=
 =?utf-8?B?dG8zMktSWHZUSXNydG1lU1liWWVIbmtldjY4NmlTMGxrVFlscWFyd1NTNlZW?=
 =?utf-8?B?clUwVlc0STl6Y2o0N1ZqQjRGdWNyeENQdUZuNmhHMXRDZGdURGNZR1BnRkF4?=
 =?utf-8?B?OXNtVnBwK2IzOHJzYUlmNXAxb1UyWDRoT3J0Q2VWR3BFMENCUDZnNFVXbXhV?=
 =?utf-8?B?Vk5SR3NSeFRHZ25VL09KeTdaVEthUGpCQ0g3RUxsVzFlV0kxeU1zMFBsVStC?=
 =?utf-8?B?VTl6cmJ2eTJKaURJMzI0Y0h4eDc0Z09SeHNtTldLSjNyOXZKY3RqS2cvckdF?=
 =?utf-8?B?aFl0azM4azVJVnBtUkNlYVVOLzlGQXozSXczSGtIQ0o5bHlpQWNBbzlJMzR3?=
 =?utf-8?B?TDEyZkxzR091UWRORllaVkt0d3NjWG5CcHJOVkpIazAyc2U4RTFQclpGdlBx?=
 =?utf-8?B?amE5NlZBTXYwTFB3THJpcFZFNTZBUzhDaHk2Q3NBdnkrQ2xtd1ZLbG01U21k?=
 =?utf-8?B?NThRS1NGVEVTSldQY2NqZW5Fc2xaeXRONTlqN1pKcFMrcHM2Vzdqem9WRkxY?=
 =?utf-8?B?NGErbGlJSnBGaGMrKzlqR2wyMDByQk1QZHpxQXFqbGxGK3FSN3RlZzRGQ253?=
 =?utf-8?B?RmJQa1JxY3BjOUx6RG5nZW9BQzJEWGs0TFF0bjJOQjJXeEdhcStFTHZoaHM1?=
 =?utf-8?B?dnlCVGpqOVc4YjNEYTlTSnB6M0RUMmNZKzlVRlphNVFmTFlvd2V3OWF4VUNm?=
 =?utf-8?B?RUl1WnNxdWRHWk92c2dCV1ZWTThYaHJPTy9kOHF6VDAvWDNpQmpJVEV6VXN0?=
 =?utf-8?B?YzlEMlJzQi82UjVDaWFCZWtBczljeW1xWmJObExMM3gxcFpnQ3AxdkVZM2Rn?=
 =?utf-8?B?aGtzZERBWEFqd0FRV0JTenFtbFVEOUcxUllKUGd6eVNKY3k4ZFc5bS85R2Zn?=
 =?utf-8?B?MzV6eHJlOFM4blBtRVNpb3M1QjdUa0YzRlRpbjlIeEhVNmVnaGxiMVlaTTlH?=
 =?utf-8?B?eGc4YjRiWS9yRk56RnkxL3gwY1FOeU1jd1BBNS9qcTQ4bW0wOWZ1T0JjejIy?=
 =?utf-8?B?WWg3VXJucW9XRzQyZzEzdU5BakQ2NjZnR2pzaE1USS92TXM2VmlpVlM2aHIy?=
 =?utf-8?B?clIvYU9yU0F3UnN5b0x1ak93QkdTT1VUd0VpTHRRa2FKUS93Q3pPSzNmbERj?=
 =?utf-8?Q?OUeF6Ji6KaWax78W3o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08EAD1BC5545ED4883B5A4D5B278AE24@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0744cf-4ed3-463d-c4de-08d94674ecf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 03:10:25.3829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F7uXg6/TeqC1XVP3GBv3RgzrV8/BIFMRWhg+v2KNlijTepmVt/ZcjAV4HsBabyvqAIVeZ/u08F/w3OacSx1yrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RmVsaXBlIEJhbGJpIHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBUaGluaCBOZ3V5ZW4gPFRoaW5o
Lk5ndXllbkBzeW5vcHN5cy5jb20+IHdyaXRlczoNCj4+IFdlc2xleSBDaGVuZyB3cm90ZToNCj4+
PiBTb21lIGRldmljZXMgaGF2ZSBVU0IgY29tcG9zaXRpb25zIHdoaWNoIG1heSByZXF1aXJlIG11
bHRpcGxlIGVuZHBvaW50cw0KPj4+IHRoYXQgc3VwcG9ydCBFUCBidXJzdGluZy4gIEhXIGRlZmlu
ZWQgVFggRklGTyBzaXplcyBtYXkgbm90IGFsd2F5cyBiZQ0KPj4+IHN1ZmZpY2llbnQgZm9yIHRo
ZXNlIGNvbXBvc2l0aW9ucy4gIEJ5IHV0aWxpemluZyBmbGV4aWJsZSBUWCBGSUZPDQo+Pj4gYWxs
b2NhdGlvbiwgdGhpcyBhbGxvd3MgZm9yIGVuZHBvaW50cyB0byByZXF1ZXN0IHRoZSByZXF1aXJl
ZCBGSUZPIGRlcHRoIHRvDQo+Pj4gYWNoaWV2ZSBoaWdoZXIgYmFuZHdpZHRoLiAgV2l0aCBzb21l
IGhpZ2hlciBiTWF4QnVyc3QgY29uZmlndXJhdGlvbnMsIHVzaW5nDQo+Pj4gYSBsYXJnZXIgVFgg
RklGTyBzaXplIHJlc3VsdHMgaW4gYmV0dGVyIFRYIHRocm91Z2hwdXQuDQo+Pj4NCj4+PiBCeSBp
bnRyb2R1Y2luZyB0aGUgY2hlY2tfY29uZmlnKCkgY2FsbGJhY2ssIHRoZSByZXNpemluZyBsb2dp
YyBjYW4gZmV0Y2gNCj4+PiB0aGUgbWF4aW11bSBudW1iZXIgb2YgZW5kcG9pbnRzIHVzZWQgaW4g
dGhlIFVTQiBjb21wb3NpdGlvbiAoY2FuIGNvbnRhaW4NCj4+PiBtdWx0aXBsZSBjb25maWd1cmF0
aW9ucyksIHdoaWNoIGhlbHBzIGVuc3VyZSB0aGF0IHRoZSByZXNpemluZyBsb2dpYyBjYW4NCj4+
PiBmdWxmaWxsIHRoZSBjb25maWd1cmF0aW9uKHMpLCBvciByZXR1cm4gYW4gZXJyb3IgdG8gdGhl
IGdhZGdldCBsYXllcg0KPj4+IG90aGVyd2lzZSBkdXJpbmcgYmluZCB0aW1lLg0KPj4+DQo+Pj4g
U2lnbmVkLW9mZi1ieTogV2VzbGV5IENoZW5nIDx3Y2hlbmdAY29kZWF1cm9yYS5vcmc+DQo+Pj4g
LS0tDQo+Pj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jICAgfCAgMTUgKysrDQo+Pj4gIGRyaXZl
cnMvdXNiL2R3YzMvY29yZS5oICAgfCAgMTYgKysrKw0KPj4+ICBkcml2ZXJzL3VzYi9kd2MzL2Vw
MC5jICAgIHwgICAyICsNCj4+PiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8IDIzMiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4gIDQgZmlsZXMg
Y2hhbmdlZCwgMjY1IGluc2VydGlvbnMoKykNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+Pj4gaW5kZXggYmE3
NGFkNy4uYjE5NGFlY2QgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMN
Cj4+PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPj4+IEBAIC0xMjY3LDYgKzEyNjcs
NyBAQCBzdGF0aWMgdm9pZCBkd2MzX2dldF9wcm9wZXJ0aWVzKHN0cnVjdCBkd2MzICpkd2MpDQo+
Pj4gIAl1OAkJCXJ4X21heF9idXJzdF9wcmQ7DQo+Pj4gIAl1OAkJCXR4X3Rocl9udW1fcGt0X3By
ZDsNCj4+PiAgCXU4CQkJdHhfbWF4X2J1cnN0X3ByZDsNCj4+PiArCXU4CQkJdHhfZmlmb19yZXNp
emVfbWF4X251bTsNCj4+PiAgCWNvbnN0IGNoYXIJCSp1c2JfcHN5X25hbWU7DQo+Pj4gIAlpbnQJ
CQlyZXQ7DQo+Pj4gIA0KPj4+IEBAIC0xMjgyLDYgKzEyODMsMTMgQEAgc3RhdGljIHZvaWQgZHdj
M19nZXRfcHJvcGVydGllcyhzdHJ1Y3QgZHdjMyAqZHdjKQ0KPj4+ICAJICovDQo+Pj4gIAloaXJk
X3RocmVzaG9sZCA9IDEyOw0KPj4+ICANCj4+PiArCS8qDQo+Pj4gKwkgKiBkZWZhdWx0IHRvIGEg
VFhGSUZPIHNpemUgbGFyZ2UgZW5vdWdoIHRvIGZpdCA2IG1heCBwYWNrZXRzLiAgVGhpcw0KPj4+
ICsJICogYWxsb3dzIGZvciBzeXN0ZW1zIHdpdGggbGFyZ2VyIGJ1cyBsYXRlbmNpZXMgdG8gaGF2
ZSBzb21lIGhlYWRyb29tDQo+Pj4gKwkgKiBmb3IgZW5kcG9pbnRzIHRoYXQgaGF2ZSBhIGxhcmdl
IGJNYXhCdXJzdCB2YWx1ZS4NCj4+PiArCSAqLw0KPj4+ICsJdHhfZmlmb19yZXNpemVfbWF4X251
bSA9IDY7DQo+Pj4gKw0KPj4+ICAJZHdjLT5tYXhpbXVtX3NwZWVkID0gdXNiX2dldF9tYXhpbXVt
X3NwZWVkKGRldik7DQo+Pj4gIAlkd2MtPm1heF9zc3BfcmF0ZSA9IHVzYl9nZXRfbWF4aW11bV9z
c3BfcmF0ZShkZXYpOw0KPj4+ICAJZHdjLT5kcl9tb2RlID0gdXNiX2dldF9kcl9tb2RlKGRldik7
DQo+Pj4gQEAgLTEzMjUsNiArMTMzMywxMSBAQCBzdGF0aWMgdm9pZCBkd2MzX2dldF9wcm9wZXJ0
aWVzKHN0cnVjdCBkd2MzICpkd2MpDQo+Pj4gIAkJCQkmdHhfdGhyX251bV9wa3RfcHJkKTsNCj4+
PiAgCWRldmljZV9wcm9wZXJ0eV9yZWFkX3U4KGRldiwgInNucHMsdHgtbWF4LWJ1cnN0LXByZCIs
DQo+Pj4gIAkJCQkmdHhfbWF4X2J1cnN0X3ByZCk7DQo+Pj4gKwlkd2MtPmRvX2ZpZm9fcmVzaXpl
ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsDQo+Pj4gKwkJCQkJCQkidHgtZmlmby1y
ZXNpemUiKTsNCj4+PiArCWlmIChkd2MtPmRvX2ZpZm9fcmVzaXplKQ0KPj4+ICsJCWRldmljZV9w
cm9wZXJ0eV9yZWFkX3U4KGRldiwgInR4LWZpZm8tbWF4LW51bSIsDQo+Pj4gKwkJCQkJJnR4X2Zp
Zm9fcmVzaXplX21heF9udW0pOw0KPj4NCj4+IFdoeSBpcyB0aGlzIGNoZWNrIGhlcmU/IFRoZSBk
d2MtPnR4X2ZpZm9fcmVzaXplX21heF9udW0gc2hvdWxkIHN0b3JlDQo+PiB3aGF0ZXZlciBwcm9w
ZXJ0eSB0aGUgdXNlciBzZXRzLiBXaGV0aGVyIHRoZSBkcml2ZXIgd2FudHMgdG8gdXNlIHRoaXMN
Cj4gDQo+IEFjayENCj4gDQo+PiBwcm9wZXJ0eSBzaG91bGQgZGVwZW5kIG9uICJkd2MtPmRvX2Zp
Zm9fcmVzaXplIi4gQWxzbyB3aHkgZG9uJ3Qgd2UgaGF2ZQ0KPj4gInNucHMsIiBwcmVmaXggdG8g
YmUgY29uc2lzdGVudCB3aXRoIHRoZSBvdGhlciBwcm9wZXJ0aWVzPw0KPiANCj4gQWNrIQ0KPiAN
Cj4+IENhbiB3ZSBlbmZvcmNlIHRvIGEgc2luZ2xlIHByb3BlcnR5PyBJZiB0aGUgZGVzaWduZXIg
d2FudHMgdG8gZW5hYmxlDQo+PiB0aGlzIGZlYXR1cmUsIGhlL3NoZSBjYW4gdG8gcHJvdmlkZSB0
aGUgdHgtZmlmby1tYXgtbnVtLiBUaGlzIHdvdWxkDQo+PiBzaW1wbGlmeSB0aGUgZHJpdmVyIGEg
Yml0LiBTaW5jZSB0aGlzIGlzIHRvIG9wdGltaXplIGZvciBwZXJmb3JtYW5jZSwNCj4+IHRoZSB1
c2VyIHNob3VsZCBrbm93L3dhbnQvdGVzdCB0aGUgc3BlY2lmaWMgdmFsdWUgaWYgdGhleSB3YW50
IHRvIHNldA0KPj4gZm9yIHRoZWlyIHNldHVwIGFuZCBub3QgaG9waW5nIHRoYXQgdGhlIGRlZmF1
bHQgc2V0dGluZyBub3QgYnJlYWsgdGhlaXINCj4+IHNldHVwLiBTbyB3ZSBjYW4gcmVtb3ZlIHRo
ZSAiZG9fZmlmb19yZXNpemUiIHByb3BlcnR5IGFuZCBqdXN0IGNoZWNrDQo+PiB3aGV0aGVyIHR4
X2ZpZm9fcmVzaXplX21heF9udW0gaXMgc2V0Lg0KPiANCj4gQWNrIQ0KPiANCj4gQWxsIHZlcnkg
dmFsaWQgcG9pbnRzIDotKQ0KPiANCg0KTG9va3MgbGlrZSB0aGlzIHNlcmllcyBhbHJlYWR5IGxh
bmRlZCBpbiBHcmVnJ3MgdGVzdGluZyBicmFuY2guIE5vdCBzdXJlDQpob3cgd2UgdXN1YWxseSBo
YW5kbGUgdGhpcyB0byBhZGRyZXNzIHNvbWUgb2Ygb3VyIGNvbmNlcm5zLiBBZGQgZml4DQpwYXRj
aGVzIG9uIHRvcCBvZiBHcmVnJ3MgdGVzdGluZyBicmFuY2g/DQoNCkJSLA0KVGhpbmgNCg0K
