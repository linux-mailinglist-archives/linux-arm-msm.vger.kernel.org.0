Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623983C7C5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 04:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237836AbhGNDBi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 23:01:38 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:33524 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237628AbhGNDBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 23:01:38 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B913A402D2;
        Wed, 14 Jul 2021 02:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1626231527; bh=hLqqxQ8WALHHuTVOdW2PsM/94s6HsU2+Rp50Oe/UjHI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=QlgBPUsZmaW91xHXK5PcL3WPh7+iS1dMsvy71CA4teOvbK7OpXc9XQ+4yNc5tGp3y
         fXcqkfw1Lll08FxuAeX0o5cFQmSC7BxlPaGSZoULnw3sxlcPKLQFNi1KleXVwXEr7e
         S+0wNXRi7Vw3E0+djvAI4028jVudA7SGTrZsLxHh8CdfXrQG8OGYrc5dvYmHK7hbC1
         1njfk2G8kBaZyNOxqjEHj6W3qcSuUz0tzG30ESMDi0XhBE23FKGAyQRj/BYN8zyZZV
         nxDhCSbGC78g4yYQCGVRsE+DUuuomD9ENN+ZpaEh79cIKxFrIiiSwz/q7upJrfzOrF
         Uc9EGZtVK+t4g==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 38F7FA0077;
        Wed, 14 Jul 2021 02:58:44 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2B7BD400F9;
        Wed, 14 Jul 2021 02:58:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="eF41jTPv";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zq4bAIimHa9iTBQ7gtbOwCS9sBCQ6qgjAxBo/xquXLBf3UAXYTqLKzSE39WOYcLgEImC0kybUJ9nQVg923iFlF8f5VDThPPwLrNHQDM1VE8O+vEDHaQPQREM32BGzg/kdugGsKup/nGdvFpxScVrMpv5XVv6t3kgDjmP8f8M14GnJEr0yTrFcXeVnLE8TwF4Bhm/XXa3V0KQ2HT3W/FuzVT2QzAva4jgbe6ivhRVdam7kWMYpWvRIghfxgNkTbDKyZPC8fklhLOLl9m5u+/rM1mUlqbJO3qUivXnRoc9l0fB30s/fVLQqDo/kcW/O1W/wnmgqw8SB1DOmdDzLCVvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLqqxQ8WALHHuTVOdW2PsM/94s6HsU2+Rp50Oe/UjHI=;
 b=oA3s6kN4DMQfQDxOx31C8F+hdhOZ3zLboSFw3+ApT1oYEM4OPHNHg8kTzAbrBqnAk+HA1PQUj0FzUdK63Km7EfRaVTGAXaupLNauQYKn7wUJ/9gaH+m+nwb5tId9PxrO0SxHJw1z+nBlGmtY4ndIssKSebuk3dDOmuJMPLRw+301+QSgaNvoCL5BEj/r9AstMwJ6PIRrZ+D6EC71yDpThOjmSPJ+COF10ER5bjBAfNIScg5qX5UY2Gx9O2EiDx25UUK3MUSg3Gdbh7sod/YfBCtD0KoJs8IRNx0+15abPnHnGrqGH3eq+uLcrge84tfDbpIBwr6nI1FPVqyl0rIYeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLqqxQ8WALHHuTVOdW2PsM/94s6HsU2+Rp50Oe/UjHI=;
 b=eF41jTPvt235kzOzCyUdydt1cjN8Wkt+PyVlDqkkMt2ob2Z2zU1EuQsOszRoefjVv5ivVZ73aqZUlmQnOdL5rTBZ2t6ud4nTe1BXxgBkddcm5hgiGxps4GmOIN9g1pANISNgWKEoBWSen7O7qnU2X2eLgZg5uIYdPbVpkVUNPV4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB4725.namprd12.prod.outlook.com (2603:10b6:a03:a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Wed, 14 Jul
 2021 02:58:42 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::1582:d559:a0db:29e4]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::1582:d559:a0db:29e4%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 02:58:41 +0000
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
Thread-Index: AQHXdWvmr0dK2TF02kiXSnoLeHYyUatAA0oAgACW+4CAATMwgA==
Date:   Wed, 14 Jul 2021 02:58:41 +0000
Message-ID: <6a009d83-bb4e-b783-a110-343bc8fb21a6@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 1f671700-cdf1-4975-5dd7-08d94673499c
x-ms-traffictypediagnostic: BYAPR12MB4725:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB47259CE29E51912FA64C070DAA139@BYAPR12MB4725.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kONnjml+1+Ts/z8y6iuLdmtVRgh5RUYZ99bHlja599N51QZFgw7XLpWaw2yDuLsd1GAuvifIxbk20fqSEtWU5BUeFrn299OLJI8IQIfUmtDEAYMTklVy1iI4kii7zthEfkatS4HnxBbtiJWdDoxVpq05Se5v5p56Cp1h8YCjjkMB4GCxeJbkDltqYMF4SvrHpes1be6/Rq3gPSxSLLNlp3rPrn4e8SgJCvwqIbTXe5Aq66UfDTU/CPbp2wnsCy2PM0/gxSf0kH9rAlu834Ig2KkJlWHn+0++ezC6H/InAadX1OPCDGSQTg804xln8W/fvR3kKDi9dO3xsanbAuf2xwEj+ZbonWMhxDBGxaQHqm5NRHv/HksUQqlzqtG0gAzejtYs6XfvlYYmAR8xzAqhQonouhJQnR6VcxY6nqKx5f4eXJaX19j1w1nE6Lsdy4qUyos8y+XPoRGg6EEpvgRizkEWfBtv9CBUI+1P1an1fVHPqpTpwnjfUoPk3CzKxQI7YicyJAtoIR2WNH4yAZgbORvjMu/aMgGmWk3pirUE17HxdVjufrWICXWD7GZpWW2utodru+EhX1w9ulbcYPaerWCBg0lX1yKkEBoVcN7fPgveGwWHHSWJx5mV52aRJTMtKbypkeO9lYyHQ/u7eUag06PxyJhuVG3GA0vxxLHgIK+dSw/UDYn/Ps7nrUnQD9vmKvcec9i4sdTY/kDSiuJOg145MbQK98p4o5xhVb8blUw01yDq6HNde/tthVuBRXe9lQLF3ZeNocwOWaALmubgzg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(396003)(376002)(346002)(6506007)(8936002)(54906003)(110136005)(38100700002)(122000001)(7416002)(316002)(478600001)(31686004)(71200400001)(8676002)(86362001)(31696002)(6486002)(186003)(5660300002)(6512007)(66946007)(66476007)(76116006)(2616005)(83380400001)(36756003)(26005)(64756008)(2906002)(4326008)(66446008)(66556008)(38070700004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUsyQlhYVjdoTW5sb1ZaMjd0cTdGaXNHWnZQVG56VXYrSFJSOGxHbHhTNmkw?=
 =?utf-8?B?WUJsRGFXZU05YXR6RTViS0FEQWNDWG9LVTh4eVl5dmdpdGZreGZGMDZ2MTAy?=
 =?utf-8?B?b2lMaDhLeEVlbGdoOFdBTnJ1R0FldGNubmYvQkVhR3RiT0tyQVpwcGRoYVlu?=
 =?utf-8?B?OExBUGtlNlpWdXJQa3IvR3krR2xSOU1CN2d2aXlFYllQNFN4TzZVSDRFd2tJ?=
 =?utf-8?B?NWVJSzdyTnBxeWduKyt4b0NYc01hclllL05zN1kzTVdvbFRpc2IwZzE4dXYw?=
 =?utf-8?B?cVc4SUZNcUJtcWQzREtpUHQzbzdrTlJjc1lwY3N6VC82dXVOSTFlVG1tL05h?=
 =?utf-8?B?K0ZMS0R0Ylo4b3NEMi9ub0t4dzVvZHh6bWUwR0NXVWl4S2dXNUU0c0s5TnlU?=
 =?utf-8?B?RnBOS3ljdlhCNlZrUDRzTlVobzA4dDBlbXU3V2o2b28vY0M1SXhEeU92VjEv?=
 =?utf-8?B?WlFwYUVUYytHWEl6dEVTdEh4N2tVbUJORTk0SXdUb2pmL1JBOFpLUnk0Ykk4?=
 =?utf-8?B?SGdKU2xDcDNpM1NDRUNPUS9JZ1BQbGs5L0MxdDNzdm9xZHk4VzJIRktGamhN?=
 =?utf-8?B?RGNZS2k0TW4zUHUvbzJQeVRZdUtOMmhGK2ZJVXVKMUtVcVN4SGozVm9MTkV5?=
 =?utf-8?B?VUJNWVJablQzM3ZkdzBha3U3K2tkTjdEZTBDRnpJanI1UlQ2dnkwcTV3WTBk?=
 =?utf-8?B?Y2o5dlBHbU5rMkx0MjVYWWt4NnZMVGhjTk1IOExCdE1tYnlCaGRXOUFtcXZr?=
 =?utf-8?B?YVZYUUQxTm1MTDhySzJOcXhjTUEzUFM5MWZYcUFKYVFRMFVSZzBITFlKVU40?=
 =?utf-8?B?aFpZRW14Q3FSbE8veGFUVmxnNWg1UklOc25CVHFUQ011WlFQc1E4Sm1QZGtB?=
 =?utf-8?B?V0ZKWGhsU2tGa2xVL3BGWmFmT0IrZGFpUEZyYkdjMTNTNlBhWFl5S0JDTS9I?=
 =?utf-8?B?bWFHU0QxZFdZV1Q5Q0hudGlNYXlQalZRM0FlZUFHYkx0eEJmdFJEU3JhZy81?=
 =?utf-8?B?TE94V1RrVGhTMEV5THJZT2ZDSmhhVGViVU4wcjUvR3VEMzY4NU83SDNJM09v?=
 =?utf-8?B?SHNwdUZqUHArbkIxY1dYT0R0aXZibU1wc0N2TU9aNVpTS2JIcmZhanM4b1o5?=
 =?utf-8?B?Y1NsWDhHZWx1WGFiejlPdmJLcFZMMEtVTWpSZG0yVjNOMXR6NEo3N1RkdVJt?=
 =?utf-8?B?a1BsaFdGWjNQY29GenlUZHRWRWVtOGlZN3RYU3BBOVdGKzM4L1RxTXd1KzA2?=
 =?utf-8?B?WEs3RUtyeElGb1JhNlFvcHRiYlpOU2U5VXdrQzBROE1yTm1lYkxWUkVrK3Bo?=
 =?utf-8?B?UEFHeGVTMlBkTlJETCtGSXh0eEtUOUdlZUtpVmI0UEgzUndqcFNuSU5DMkZ2?=
 =?utf-8?B?ZzZES3ZNUi9xcGU5S0tFWnRHR2ZKc1hTZ29DNHN4d2lreUdkNzZvbW9JRU9W?=
 =?utf-8?B?Ym90TjArQUhRcW1oYWRXaXBFVzBURkp3Vm5qY2hxRWJoUDh6WWE2T2kyQWE3?=
 =?utf-8?B?MWVHcFpmbnJodXQ2cEFWeTVGS0U5Wkd2Y1FaNkw1a3FXeGtZR3NRd2paRlZ4?=
 =?utf-8?B?VTExelVEWHhINkpkbHFFWVJ0OXpPQnlZUUtKbTZiVWxTVXM5eHdMam1VSHp4?=
 =?utf-8?B?bHJkMlZ6Mkk2RWdkRXZwSSs1U3l1cGpraVlCcVp4SkJYOWlLL2NvQVRndHBL?=
 =?utf-8?B?aGU3MGoyOUFJY3cwWWEwcDEzMTNacENDMFVJUXFVVzRKa0dIcXREZlJYZGlk?=
 =?utf-8?Q?/7X52vIXZKkrbIL4Ts=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A92A81A1FA8C242B9FF24B37CB10F2E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f671700-cdf1-4975-5dd7-08d94673499c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 02:58:41.8114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8QeD/KDhgHZ0H2eXuP8gXgUDaAr0NvYKDmjWXy8OYEcl+/o7YsE/69aog5nJZnBHBJaBILykj6t3/27vqigWEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4725
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
Y2hhbmdlZCwgMjY1IGluc2VydGlvbnMoKykNCj4+Pg0KDQo8c25pcD4NCg0KPj4+ICsvKg0KPj4+
ICsgKiBkd2MzX2dhZGdldF9yZXNpemVfdHhfZmlmb3MgLSByZWFsbG9jYXRlIGZpZm8gc3BhY2Vz
IGZvciBjdXJyZW50IHVzZS1jYXNlDQo+Pj4gKyAqIEBkd2M6IHBvaW50ZXIgdG8gb3VyIGNvbnRl
eHQgc3RydWN0dXJlDQo+Pj4gKyAqDQo+Pj4gKyAqIFRoaXMgZnVuY3Rpb24gd2lsbCBhIGJlc3Qg
ZWZmb3J0IEZJRk8gYWxsb2NhdGlvbiBpbiBvcmRlcg0KPj4+ICsgKiB0byBpbXByb3ZlIEZJRk8g
dXNhZ2UgYW5kIHRocm91Z2hwdXQsIHdoaWxlIHN0aWxsIGFsbG93aW5nDQo+Pj4gKyAqIHVzIHRv
IGVuYWJsZSBhcyBtYW55IGVuZHBvaW50cyBhcyBwb3NzaWJsZS4NCj4+PiArICoNCj4+PiArICog
S2VlcCBpbiBtaW5kIHRoYXQgdGhpcyBvcGVyYXRpb24gd2lsbCBiZSBoaWdobHkgZGVwZW5kZW50
DQo+Pj4gKyAqIG9uIHRoZSBjb25maWd1cmVkIHNpemUgZm9yIFJBTTEgLSB3aGljaCBjb250YWlu
cyBUeEZpZm8gLSwNCj4+PiArICogdGhlIGFtb3VudCBvZiBlbmRwb2ludHMgZW5hYmxlZCBvbiBj
b3JlQ29uc3VsdGFudCB0b29sLCBhbmQNCj4+PiArICogdGhlIHdpZHRoIG9mIHRoZSBNYXN0ZXIg
QnVzLg0KPj4+ICsgKg0KPj4+ICsgKiBJbiBnZW5lcmFsLCBGSUZPIGRlcHRocyBhcmUgcmVwcmVz
ZW50ZWQgd2l0aCB0aGUgZm9sbG93aW5nIGVxdWF0aW9uOg0KPj4+ICsgKg0KPj4+ICsgKiBmaWZv
X3NpemUgPSBtdWx0ICogKChtYXhfcGFja2V0ICsgbWR3aWR0aCkvbWR3aWR0aCArIDEpICsgMQ0K
Pj4+ICsgKg0KPj4+ICsgKiBJbiBjb25qdW5jdGlvbiB3aXRoIGR3YzNfZ2FkZ2V0X2NoZWNrX2Nv
bmZpZygpLCB0aGlzIHJlc2l6aW5nIGxvZ2ljIHdpbGwNCj4+PiArICogZW5zdXJlIHRoYXQgYWxs
IGVuZHBvaW50cyB3aWxsIGhhdmUgZW5vdWdoIGludGVybmFsIG1lbW9yeSBmb3Igb25lIG1heA0K
Pj4+ICsgKiBwYWNrZXQgcGVyIGVuZHBvaW50Lg0KPj4+ICsgKi8NCj4+PiArc3RhdGljIGludCBk
d2MzX2dhZGdldF9yZXNpemVfdHhfZmlmb3Moc3RydWN0IGR3YzNfZXAgKmRlcCkNCj4+PiArew0K
Pj4+ICsJc3RydWN0IGR3YzMgKmR3YyA9IGRlcC0+ZHdjOw0KPj4+ICsJaW50IGZpZm9fMF9zdGFy
dDsNCj4+PiArCWludCByYW0xX2RlcHRoOw0KPj4+ICsJaW50IGZpZm9fc2l6ZTsNCj4+PiArCWlu
dCBtaW5fZGVwdGg7DQo+Pj4gKwlpbnQgbnVtX2luX2VwOw0KPj4+ICsJaW50IHJlbWFpbmluZzsN
Cj4+PiArCWludCBudW1fZmlmb3MgPSAxOw0KPj4+ICsJaW50IGZpZm87DQo+Pj4gKwlpbnQgdG1w
Ow0KPj4+ICsNCj4+PiArCWlmICghZHdjLT5kb19maWZvX3Jlc2l6ZSkNCj4+PiArCQlyZXR1cm4g
MDsNCj4+PiArDQo+Pj4gKwkvKiByZXNpemUgSU4gZW5kcG9pbnRzIGV4Y2VwdCBlcDAgKi8NCj4+
PiArCWlmICghdXNiX2VuZHBvaW50X2Rpcl9pbihkZXAtPmVuZHBvaW50LmRlc2MpIHx8IGRlcC0+
bnVtYmVyIDw9IDEpDQo+Pj4gKwkJcmV0dXJuIDA7DQo+Pg0KPj4+ICsNCj4+PiArCXJhbTFfZGVw
dGggPSBEV0MzX1JBTTFfREVQVEgoZHdjLT5od3BhcmFtcy5od3BhcmFtczcpOw0KPj4+ICsNCj4+
PiArCWlmICgoZGVwLT5lbmRwb2ludC5tYXhidXJzdCA+IDEgJiYNCj4+PiArCSAgICAgdXNiX2Vu
ZHBvaW50X3hmZXJfYnVsayhkZXAtPmVuZHBvaW50LmRlc2MpKSB8fA0KPj4+ICsJICAgIHVzYl9l
bmRwb2ludF94ZmVyX2lzb2MoZGVwLT5lbmRwb2ludC5kZXNjKSkNCj4+PiArCQludW1fZmlmb3Mg
PSAzOw0KPj4+ICsNCj4+PiArCWlmIChkZXAtPmVuZHBvaW50Lm1heGJ1cnN0ID4gNiAmJg0KPj4+
ICsJICAgIHVzYl9lbmRwb2ludF94ZmVyX2J1bGsoZGVwLT5lbmRwb2ludC5kZXNjKSAmJiBEV0Mz
X0lQX0lTKERXQzMxKSkNCj4+PiArCQludW1fZmlmb3MgPSBkd2MtPnR4X2ZpZm9fcmVzaXplX21h
eF9udW07DQo+Pg0KPj4gV2h5IG9ubHkgYnVsaz8gSXNvYyBzaG91bGQgYmUgYXQgbGVhc3QgZXF1
YWwgb3IgbW9yZSB0aGFuIGJ1bGsuDQo+PiBBbHNvLCBtYWtlIHRoaXMgYXBwbGljYWJsZSB0byBE
V0NfdXNiMzIgYWxzby4NCj4gDQo+IHRoaXMgc2hvdWxkIGJlIGFwcGxpY2FibGUgdG8gYWxsIERX
QzMgdmVyc2lvbnMsIG5vPyBkd2MzLCAzMSBhbmQgMzIuDQo+IA0KDQpZZXMuDQoNCkJSLA0KVGhp
bmgNCg==
