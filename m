Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C22C357A90
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 04:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhDHCyc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 22:54:32 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:51050 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229510AbhDHCyc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 22:54:32 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C590E407CF;
        Thu,  8 Apr 2021 02:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617850461; bh=xEc1RelfQLo1RlqabeXqiESnE/u+CI3OwRV8hF2m6OM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=VENrBKvk/S788MU2liFvxvtXljYuUn5yn6pvEeJ4KAhorkEPuU+S8VB9fD5tpMp/m
         jmmRuiGLRQcNYz+4XenZ5NffEZniK7UIhOSDeeDyQnT1x2o/0nzTavu6Hw+K5ndCAZ
         chnY9BnBem6fuikfLw776DhPZw+NC5Ym/qzfuKdWgaXxwy20FIzBpVatbt0iY59i1w
         6RSOWOuHngpWQ5N4t006/giVY0mwKLGmnIVSIvw6XnaB1DXSJ8Vq/Y5yDslzwOCAjC
         jQTl0rbbFgIiBuW+nQKtLHc9GQ/YOOhtz2rBoEHuqAw7I50ADzSbff6QwaiO2+067+
         gKebnH24k/KfQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6C16DA0071;
        Thu,  8 Apr 2021 02:54:20 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B8954801DD;
        Thu,  8 Apr 2021 02:54:19 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="AJn2bMg4";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8LmeqaNTcDmTA61ZQBjWjRqWOIVWXN0HP5WrsEIWBtJq/+6O/lKDcFt5mYgzvwICjoJF4JmcOth9jtEQz2ttKR+h3BVFCy6gTXVLt78yTpO5OHw2ZIrlkbLeK00oOBtYggb1TSdpjxR+B/FsYTKLCHmGy2lTKueGKGiERcvTJHTVDeDX7b5CXUrZuonf90/3CYWGA7vxAczaxa2FQcyUmDddUqttvYoD0ykUKvzgKkkNW8J01kkzLpETgegdNI6lizRNx7KqMHVOUYv3wL2llcR/KNCvhV8Beh0dN9tz8aySXMy1oHxmLxoutgVxJ+onej5Zmm9ZH6/qbsG6y56tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEc1RelfQLo1RlqabeXqiESnE/u+CI3OwRV8hF2m6OM=;
 b=hSSgCgNWwMgcGTuc9o8OsSOkh1HyG+tE4zeHOeqje0o2hOdrrpUOaPzzKsLcqEQooVjWQZYPYA0zCXSDyWl7Kb2QcwtGTG2OrtcOxh5JTD6rX9afo84/HTRbja0rC+xtW9BIoFTZolL6vf+Dwxej1ycqVA6i31WZfg9FYMPyLuQcpVJ99gMtuPxnDS5e4Ld8mWvo9qc5SKi+fsLmuECEGcnIYAjHLoFTOTSaPt61IoQGd43S3WxOccRTswoXCjsFUy2R24NCcHC+RDAxTrfHyRahTp8KPRLFA07sE5l0N7jERwijuVX6ujkY43zmwAo+YY8VjpNnFGx/XaqTGbmxOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEc1RelfQLo1RlqabeXqiESnE/u+CI3OwRV8hF2m6OM=;
 b=AJn2bMg4ZCMK0EVm6tmbsIndQenUImkPZrcj2JZShMccryL35r7nW+rxVLHRdimnyDbdNgiLJq5HwqGZEo+3BDCtr1F/9O3Um7pPG/m/HFCbJYfWFChbCImEHTqspXbT/zZz6FU16OM1D8088qbhL6/MwyeacFSy5Nd2sCvm3HY=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3302.namprd12.prod.outlook.com (2603:10b6:a03:12f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 02:54:18 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4020.018; Thu, 8 Apr 2021
 02:54:18 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Kathiravan T <kathirav@codeaurora.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: reference clock configuration
Thread-Topic: [PATCH] usb: dwc3: reference clock configuration
Thread-Index: AQHW/eInRTRYpSizoUSSkIWQR33qw6qdm2uAgAuy5gCAAOnRAIAACFWAgAAHgACAAAEygA==
Date:   Thu, 8 Apr 2021 02:54:18 +0000
Message-ID: <f197b467-897e-7a4e-6c20-4665ff0d794b@synopsys.com>
References: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
 <f3042097-8569-5882-06db-ae56e05cac59@synopsys.com>
 <8cc9617dc62be17ac3a9420e7750b0ee@codeaurora.org>
 <4e5a3487-bae2-b21a-df90-80b5f0d170ba@synopsys.com>
 <20210408022309.GL904837@yoga>
 <379f7e1a-35ce-511e-74d7-1e22451ad7a6@synopsys.com>
In-Reply-To: <379f7e1a-35ce-511e-74d7-1e22451ad7a6@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed71ff33-a044-467d-6c1e-08d8fa399a48
x-ms-traffictypediagnostic: BYAPR12MB3302:
x-microsoft-antispam-prvs: <BYAPR12MB33023E1CBE2ABAAF44757F31AA749@BYAPR12MB3302.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 78u5MmnqTvn1/cYnpttcYFFBWeESYZ7QkGjcTYHcs37OZrAhV1Wyo8E1mqsIRqasAYDH9oG4a3dMNeHaeY3jy9PYTEdqyjaJhJ6iT5/H+zsU+5sYJ/EXoeEm1PNdAMrlkUgFJZV942zm40hMrSWnQ4qHRQb1aza9xjz+dSu+OjQRMxwtN41Ydbmpm7ZtmYCBG2FZVaLY0QJfVshM3R0Ba5fDmiDaLm39vEwbIlOEPNll7mKWwNKjyePB+tjjiQxBf7dc5bs0wjq018V+qSAdlmQW9NodKmQRTS/riWRz9EFK9669e4wp76+i97yqe7s5SZltpiJj7KRzy2yVBr4Xn3OwnM/E+Xv4l1V3nHBUyfzpMsgBO6x59zDX8653JlLm2ebSY6CAFXgym5sZ7r8gdl3CsDXj+uwOkqLcLUlVe/LNjle68ocgM8/3YlYb4JCS+eWRQR83GgpY8Hwm6uNTUt/LCpvpH+ZrZdPCB6lYqQOxBMAlr+YjsQJxXN2u8vjff3UZIyxQVwS3ic+kWKWvkkUxmZdJ7PE0sjGwpvguIyt/h81KVn5Onq25QORoqEBdM0GwQrrq/wCGpKD9xuz1gaBjO4U8NntqYir0O5V0EIDmwl0XqY6WbwTuGawjBjjDMsTJyI9GUtDUn0xqjq9ehTH5MeeD3qsbcAPeXAZaIYogUl5rt5SBdksEahAFnjubKpSdYzK8XSsuCPrPlnlHqYtmxueqbJencvUJRGI8tzY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(366004)(39860400002)(346002)(376002)(38100700001)(54906003)(36756003)(86362001)(31686004)(5660300002)(6486002)(186003)(2616005)(64756008)(76116006)(71200400001)(8676002)(6916009)(31696002)(8936002)(66946007)(66446008)(66476007)(66556008)(53546011)(4326008)(2906002)(26005)(83380400001)(6512007)(478600001)(6506007)(316002)(84040400003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SVE3UHhpZUlxbFNPcS9iS2ZWekxZT21SaEtmY0pRWmhOQ29FNjlFWEkyMW5T?=
 =?utf-8?B?eC9TLzZNekFWT24vVktkZ2kreVlmbjcyQkMrS1RTWkJGdzkyMWt2N0YxT1lq?=
 =?utf-8?B?dHNsYWo1S0xnRTNwZklDZmErWmFCaVFIaVo5STBnY2I1TWpTZVYvQ3ZSRW9K?=
 =?utf-8?B?K0VsZjdwSzlUWWpaUmtCSGJpWkQ1TW1HQ1FReEJPY2xkS2hwQmc4RGhqZDZm?=
 =?utf-8?B?UmNsb3N3SHY1ejBUNGY5MjRqalYwRTV4anlHK0c0SFdpcnNZNmoySWVVSmE2?=
 =?utf-8?B?VmdXOHZlWlM1TWVmYVlraUFUTUZqK0xubUNoRzBKV1dOVkZLblZqVXZKUmtJ?=
 =?utf-8?B?bS9ha0owYisrV3V2enNmME43bFAyRmNGZ1Jab1A3RHdzRXc4djM1V3BsdG8x?=
 =?utf-8?B?UEZURG96NUFmWk9RZitxczdQZEJnODB0SGlCU2pJVmQ0aFZ1VGsyVjgzQlBY?=
 =?utf-8?B?eGlwMFROK2dEbURpbUdjNUp0M1dkeEZ1TjFpckVvajlzTk9mQVlWbmtTQmpa?=
 =?utf-8?B?eVp5WEEvb1BlUjFtWVRQaVFiLy9mZTRnamZJMTA0cG1Dc2xQSGt2cmdBM3dL?=
 =?utf-8?B?aVRZR3c4akxTbWtQdU1ETDR1NHdFaU5FOWMzc3lEZ3Q5ZlVWZ0ppT2xpaDgv?=
 =?utf-8?B?blV3cWtHcENqQ0xoaVhKWXZPOVJLTmphN2J0SGtRWmV4dDVEUWkzQk5TaWYw?=
 =?utf-8?B?d3pDdXZ4a3QrTTNyVkZUNksydWVhcFZkWkplcXZpTHEwWVJJQW56ZWZ3WHhr?=
 =?utf-8?B?NDZnLyt1aFR1a3pyWExUQWF1UklqMnNEdklJUThQbnhSb29OUzNNVmtBOUpS?=
 =?utf-8?B?ZTZVNktTSTlGdFFxOXljNzF3TnlwbWhpa29SdzVqeXBNNENWYUdNOWdubWdI?=
 =?utf-8?B?Y1oxbkxjRGNINW9QYnE3SDdGbmRzTEhoSlJiMkZPUDVnaks3TWNuMkgzeThY?=
 =?utf-8?B?YTBqTjcvKzlzaHZiWjRlRDc1MSt5SVBKZGppZkdYcGxnNHVaUVdHNU93eUtS?=
 =?utf-8?B?V3hxREt2TkJvU3FRUitWTldiRXdwWjRDQm82MzQ1MitsaEsrWHpvSGZvYndW?=
 =?utf-8?B?RFUyRHc4NjBkRE1VV1cxUWxRanJiWWdONFNRb1RJUzJ6OENGRVdWenVjTG0y?=
 =?utf-8?B?NUZQTEdadEludmx5b3hVNTJhVnZZcldhN1Y0RnovdkJRN1l4QlRDOVlabXBs?=
 =?utf-8?B?ZkxHZEppc0lpeTliNDZhNmJmOGIvcTR5MVJBZC9pd0lLL3l3UVVVR3NJTlZi?=
 =?utf-8?B?c1pPL3B6VllzTHNFK1B3cmdmckpTVWs1SHNTL1hRYnJSaWJsR1NOT0VtTFpM?=
 =?utf-8?B?SjVYV2hnOGZyNDVvR1JNT2hBNXJjczE2bURzQTlXQVpTNHhja0VPRUJVOUNI?=
 =?utf-8?B?UCtUWmcrK0REQXczemp6ckNGbm1Ld1V0akc3K1UrYVBzRjIxUDdwVjV2a21r?=
 =?utf-8?B?MU9TYlhLUzFvNzJHbXFYNStOdkh2RE5kc0NWS2ppSlRqT3lPdTFDclFwemhk?=
 =?utf-8?B?Qm9OdWVhLzN6emhSa1dTOVQ2cTdXUjBWVFVSZ2Q4TmdrWTFGdlVVTG9kUlYr?=
 =?utf-8?B?UjJBQzRNOU55M3FSa0s3d2haMVdBenhURW9QWm5pdDh3YXZxUVlFSTJqakNG?=
 =?utf-8?B?ZzAxWmVrQ09sbkVxb3BJYWRGTXc2KzdJemlQRDk1RkxreEhUejcrK2NLNkZp?=
 =?utf-8?B?dW0rMGw4TWxqQVZsSm94UjhaRm5qT1krTU1YckI4dExGSklCNEFpb1pESmJw?=
 =?utf-8?Q?LTTa296iWD0s/0KEIA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8791E920F563BB4987A3B071C3631260@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed71ff33-a044-467d-6c1e-08d8fa399a48
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 02:54:18.0752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qc/GAvlL85L0eehq76wuV1HjibnScaPApLK8hj42oKN118aIH7llvE2ql36q2xEOsVsaaLH8EJLVL8W54vzW2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3302
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBCam9ybiBBbmRlcnNzb24gd3JvdGU6DQo+PiBPbiBXZWQg
MDcgQXByIDIwOjUzIENEVCAyMDIxLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+Pg0KPj4+IEthdGhp
cmF2YW4gVCB3cm90ZToNCj4+Pj4gT24gMjAyMS0wMy0zMSAwNjo0NywgVGhpbmggTmd1eWVuIHdy
b3RlOg0KPj4+Pj4gQmFydWNoIFNpYWNoIHdyb3RlOg0KPj4+Pj4+IEZyb206IEJhbGFqaSBQcmFr
YXNoIEogPGJqYWdhZGVlQGNvZGVhdXJvcmEub3JnPg0KPj4+Pj4+DQo+Pj4+Pj4gRFdDX1VTQjNf
R0ZMQURKIGFuZCBEV0NfVVNCM19HVUNUTCByZWdpc3RlcnMgY29udGFpbiBvcHRpb25zDQo+Pj4+
Pj4gdG8gY29udHJvbCB0aGUgYmVoYXZpb3Igb2YgY29udHJvbGxlciB3aXRoIHJlc3BlY3QgdG8g
U09GIGFuZCBJVFAuDQo+Pj4+Pj4gVGhlIHJlc2V0IHZhbHVlcyBvZiB0aGVzZSByZWdpc3RlcnMg
YXJlIGFsaWduZWQgZm9yIDE5LjIgTUh6DQo+Pj4+Pj4gcmVmZXJlbmNlIGNsb2NrIHNvdXJjZS4g
VGhpcyBjaGFuZ2Ugd2lsbCBhZGQgb3B0aW9uIHRvIG92ZXJyaWRlDQo+Pj4+Pj4gdGhlc2Ugc2V0
dGluZ3MgZm9yIHJlZmVyZW5jZSBjbG9jayBvdGhlciB0aGFuIDE5LjIgTUh6DQo+Pj4+Pj4NCj4+
Pj4+PiBUZXN0ZWQgb24gSVBRNjAxOCBTb0MgYmFzZWQgQ1AwMSBib2FyZCB3aXRoIDI0TUh6IHJl
ZmVyZW5jZSBjbG9jay4NCj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEJhbGFqaSBQcmFr
YXNoIEogPGJqYWdhZGVlQGNvZGVhdXJvcmEub3JnPg0KPj4+Pj4+IFsgYmFydWNoOiBtZW50aW9u
IHRlc3RlZCBoYXJkd2FyZSBdDQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQmFydWNoIFNpYWNoIDxi
YXJ1Y2hAdGtvcy5jby5pbD4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiDCoC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3VzYi9kd2MzLnR4dMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNSArKw0KPj4+Pj4+IMKg
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDUyICsrKysrKysrKysrKysrKysrKysNCj4+Pj4+PiDCoGRyaXZlcnMvdXNi
L2R3YzMvY29yZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAxMiArKysrKw0KPj4+Pj4+IMKgMyBmaWxlcyBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspDQo+
Pj4+Pj4NCj4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi9kd2MzLnR4dA0KPj4+Pj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi9kd2MzLnR4dA0KPj4+Pj4+IGluZGV4IDFhYWUyYjYxNjBjMS4uNGZmYTg3YjY5N2Rj
IDEwMDY0NA0KPj4+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91
c2IvZHdjMy50eHQNCj4+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdXNiL2R3YzMudHh0DQo+Pj4+Pj4gQEAgLTg5LDYgKzg5LDExIEBAIE9wdGlvbmFsIHByb3Bl
cnRpZXM6DQo+Pj4+Pj4gwqAgLSBzbnBzLHF1aXJrLWZyYW1lLWxlbmd0aC1hZGp1c3RtZW50OiBW
YWx1ZSBmb3IgR0ZMQURKXzMwTUhaIGZpZWxkDQo+Pj4+Pj4gb2YgR0ZMQURKDQo+Pj4+Pj4gwqDC
oMKgwqAgcmVnaXN0ZXIgZm9yIHBvc3Qtc2lsaWNvbiBmcmFtZSBsZW5ndGggYWRqdXN0bWVudCB3
aGVuIHRoZQ0KPj4+Pj4+IMKgwqDCoMKgIGZsYWRqXzMwbWh6X3NkYm5kIHNpZ25hbCBpcyBpbnZh
bGlkIG9yIGluY29ycmVjdC4NCj4+Pj4+PiArIC0gc25wcyxxdWlyay1yZWYtY2xvY2stYWRqdXN0
bWVudDogVmFsdWUgZm9yIEdGTEFESl9SRUZDTEtfKiBmaWVsZHMNCj4+Pj4+PiBvZiBHRkxBREoN
Cj4+Pj4+PiArwqDCoMKgIHJlZ2lzdGVyIGZvciByZWZlcmVuY2UgY2xvY2sgb3RoZXIgdGhhbiAx
OS4yIE1IeiBpcyB1c2VkLg0KPj4+Pj4+ICsgLSBzbnBzLHF1aXJrLXJlZi1jbG9jay1wZXJpb2Q6
IFZhbHVlIGZvciBSRUZDTEtQRVIgZmlsZWQgb2YgR1VDVEwuDQo+Pj4+Pj4gVGhpcyBmaWVsZA0K
Pj4+Pj4+ICvCoMKgwqAgaW5kaWNhdGVzIGluIHRlcm1zIG9mIG5hbm8gc2Vjb25kcyB0aGUgcGVy
aW9kIG9mIHJlZl9jbGsuIFRvDQo+Pj4+Pj4gY2FsY3VsYXRlIHRoZQ0KPj4+Pj4+ICvCoMKgwqAg
aWRlYWwgdmFsdWUsIFJFRkNMS1BFUiA9ICgxL3JlZl9jbGsgaW4gSHopKjEwXjkuDQo+Pj4+Pg0K
Pj4+Pj4gV2h5IGlzIHRoaXMgYSBxdWlyaz8gSXQncyBub3QgYSBxdWlyay4gVGhlIHVzZXIgY2Fu
IGluZm9ybSB0aGUgcmVmX2Nsaw0KPj4+Pj4gcGVyaW9kIHRvIHRoZSBjb250cm9sbGVyIGhlcmUu
DQo+Pj4+Pg0KPj4+Pj4gVGhlIGRlZmF1bHQgdmFsdWUgZnJvbSBHVUNUTC5SRUZDTEtQRVIgaXMg
YSB2YWx1ZSBmcm9tIGNvcmVDb25zdWx0YW50DQo+Pj4+PiBzZXR0aW5nLiBUaGUgZGVzaWduZXIg
a25vd3Mgd2hhdCBwZXJpb2QgaXQgc2hvdWxkIGJlIGFuZCBzaG91bGQgcHJvcGVybHkNCj4+Pj4+
IHNldCBpdCBpZiB0aGUgZGVmYXVsdCBpcyBub3QgY29ycmVjdGx5IHNldC4NCj4+Pj4NCj4+Pj4g
VGhhbmtzIFRoaW5oIGZvciB5b3VyIGlucHV0cy4gQ2FuIHdlIGhhdmUgdGhlIERUIHByb3BlcnR5
IGZvciBib3RoIHRoZQ0KPj4+PiBHVUNUTC5SRUZDTEtQRVIgYW5kIEdGTEFESi5SRUZDTEsqIGZp
ZWxkcz8NCj4+Pj4gU2luY2UgR0ZMQURKLlJFRkNMSyogZmllbGQgdmFsdWVzIGRlcml2ZWQgYmFz
ZWQgb24gdGhlIEdVQ1RMLlJFRkNMS1BFUi4NCj4+Pj4gSW4gb3RoZXIgd29yZHMsIGFyZSB5b3Ug
ZmluZSB3aXRoIHRoZQ0KPj4+PiBhcHByb2FjaCBmb2xsb3dlZCBoZXJlPyBJZiBzbywgd2UgY2Fu
IHdvcmsgb24gdGhlIG5pdHBpY2tzIGFuZCBzZW5kIHRoZSBWMi4NCj4+Pj4NCj4+Pj4gUGxlYXNl
IGxldCB1cyBrbm93IHlvdXIgdGhvdWdodHMgb24gdGhpcy4NCj4+Pj4NCj4+Pg0KPj4+IEhpIEth
dGhpcmF2YW4sDQo+Pj4NCj4+PiBZZXMsIElNTywgdXNpbmcgRFQgcHJvcGVydGllcyB3b3JrIGp1
c3QgZmluZSB0byBpbmZvcm0gdGhlIGNvbnRyb2xsZXIgaWYNCj4+PiB0aGUgZGVmYXVsdCBzZXR0
aW5ncyBkb24ndCBtYXRjaCB0aGUgSFcgY29uZmlndXJhdGlvbi4NCj4+DQo+PiBJJ20gbm90IGFn
YWluc3QgdXNpbmcgYSBzZXBhcmF0ZSBEVCBwcm9wZXJ0eSBpZiB0aGUgaW5mb3JtYXRpb24gaXQN
Cj4+IHByb3ZpZGVzIGNhbid0IGJlIGRlcml2ZWQgZnJvbSB3aGF0J3MgYWxyZWFkeSB0aGVyZS4N
Cj4gDQo+IFRoYXQncyB0aGUgaXNzdWUuIFRoYXQgaW5mb3JtYXRpb24gaXMgbm90IGF2YWlsYWJs
ZSBpZiBkd2MzIGlzIHVzaW5nIFBDSQ0KPiBidXMuDQo+IA0KDQpJIGZvcmdvdCB0byBtZW50aW9u
LiBEV0MzIGNyZWF0ZXMgYW5kIHVzZSBhIHBsYXRmb3JtIGRldmljZSBmcm9tIFBDSS4NCg0KQlIs
DQpUaGluaA0KDQo+Pg0KPj4+IEFzIEkgbWVudGlvbiBpbg0KPj4+IHRoZSBzZXBhcmF0ZSBlbWFp
bCB0aHJlYWQsIHVzaW5nIGNsa19nZXRfcmF0ZSgpIGRvZXNuJ3QgbWFrZSBzZW5zZSBmb3INCj4+
PiBQQ0kgZGV2aWNlcy4NCj4+Pg0KPj4NCj4+IEknbSBzb3JyeSwgY2FuIHlvdSBoZWxwIG1lIHVu
ZGVyc3RhbmQgd2h5IHRoaXMgcmVsYXRlIHRvIFBDST8NCj4gDQo+IEl0J3MgYmVjYXVzZSB0aGUg
Y2xvY2sncyBhdHRyaWJ1dGVzIGFyZSBub3QgZXhwb3NlZCBpZiB3ZSdyZSB1c2luZyB0aGUNCj4g
UENJIGJ1cy4gVGhlIGRyaXZlciBjYW5ub3QgYWNjZXNzIHRoaXMgaW5mb3JtYXRpb24gdW5sZXNz
IHRoZSB1c2VyDQo+IHByb3ZpZGVzIGl0IGluIHNvbWUgb3RoZXIgd2F5Lg0KPiANCj4+DQo+Pj4g
VGhlIHNucHMscXVpcmstcmVmLWNsb2NrLWFkanVzdG1lbnQgcHJvcGVydHkgdXBkYXRlcyBtdWx0
aXBsZSBmaWVsZHMgb2YNCj4+PiB0aGUgR0ZMQURKIGFuZCBub3QganVzdCBHRkxBREpfUkVGQ0xL
X0ZMQURKLiBJJ2Qgc3VnZ2VzdCB0byBzcGxpdCB0aGVtDQo+Pj4gdG8gZGlmZmVyZW50IHByb3Bl
cnRpZXMgZm9yIGRpZmZlcmVudCBmaWVsZHMgZm9yIGNsYXJpdHkuIElmIHRoZSBvdGhlcg0KPj4+
IGZpZWxkcyBvZiBHRkxBREouUkVGQ0xLXyogYXJlIGRlcml2ZWQgYmFzZWQgb24gdGhlIEdVQ1RM
LlJFRkNMS1BFUg0KPj4+IGFjY29yZGluZyB0byB0aGUgZXhhbXBsZSBvZiB0aGUgcHJvZ3JhbW1p
bmcgZ3VpZGUsIHRoZW4gZG8gdGhhdA0KPj4+IGNhbGN1bGF0aW9uIGluIHRoZSBkcml2ZXIgYXMg
ZGVmYXVsdC4NCj4+DQo+PiBJdCBzb3VuZHMgdG8gbWUgdGhhdCByYXRoZXIgdGhhbiBzYXlpbmcg
InJlZmNsayBpcyBYIE1IeiIgeW91IHByb3Bvc2UgYQ0KPj4gc2V0IG9yIHByb3BlcnRpZXMgaW4g
dGhlIGxpbmUgb2YgIndyaXRlIFgsIFksIFogdG8gdGhlc2UgcmVnaXN0ZXJzIiwNCj4+IHdoaWNo
IGlzbid0IHdoYXQgd2UgdHlwaWNhbGx5IHB1dCBpbiBEVC4NCj4gDQo+IERpZmZlcmVudCBmaWVs
ZHMgb2YgdGhlIHJlZ2lzdGVyIGNvbnRyb2wgZGlmZmVyZW50IGZlYXR1cmVzIGFuZCBub3QganVz
dA0KPiB0aGUgInJlZmNsayBpcyBYIE1IeiIuDQo+IA0KPiBHVUNUTCByZWdpc3RlciBmaWVsZCBS
RUZDTEtQRVIgaXMgInJlZmNsayBpcyBYIE1IeiINCj4gDQo+IEdGTEFESiByZWdpc3RlciBmaWVs
ZCBHRkxBREpfUkVGQ0xLX0xQTV9TRUwgZW5hYmxlcyBhIGZlYXR1cmUgdG8gdXNlDQo+IHJlZmNs
ayB0byB0cmFjayBTT0YvSVRQIGNvdW50ZXINCj4gDQo+IEdGTEFESiByZWdpc3RlciBmaWVsZCBH
RkxBREpfUkVGQ0xLX0ZMQURKIGRvIGFkanVzdG1lbnRzIHRvIHRoZSBmcmFtZQ0KPiBsZW5ndGgg
d2hlbiBydW5uaW5nIG9uIHJlZmNsaw0KPiANCj4gR0ZMQURKIHJlZ2lzdGVyIGZpZWxkIEdGTEFE
Sl9SRUZDTEtfMjQwTUhaX0RFQ1IgaXMgYW5vdGhlciBhZGp1c3RtZW50DQo+IGZvciAyNDBNSHoN
Cj4gDQo+IEdGTEFESiByZWdpc3RlciBmaWVsZCBHRkxBREpfUkVGQ0xLXzI0ME1IWkRFQ1JfUExT
MSBpcyBhbm90aGVyIGFkanVzdG1lbnQNCj4gDQo+IE15IHN1Z2dlc3Rpb24gaXMgdG8gaGF2ZSAy
IERUIHByb3BlcnRpZXM6DQo+IDEpIGZvciBHVUNUTC5SRUZDTEtQRVIgZm9yICJyZWZjbGsgaXMg
WCBNSHoiIGJ1dCBpbiB0ZXJtIG9mIHBlcmlvZCBucw0KPiAyKSBmb3IgR0ZMQURKLkdGTEFESl9S
RUZDTEtfTFBNX1NFTCB0byBlbmFibGUgYSBzcGVjaWZpYyBmZWF0dXJlIG9mIHRoZQ0KPiBjb250
cm9sbGVyLiBUaGUgb3RoZXIgZmllbGRzIG9mIEdGTEFESiBjYW4gYmUgY2FsY3VsYXRlZCBhcyBk
ZWZhdWx0DQo+IGFjY29yZGluZyB0byB0aGUgcHJvZ3JhbW1pbmcgZ3VpZGUuDQo+IA0KPiBJcyBp
dCB0eXBpY2FsIHRoYXQgd2UgY29tYmluZSBkaWZmZXJlbnQgZmVhdHVyZXMgaW4gYSBzaW5nbGUg
RFQNCj4gcHJvcGVydHk/IFdoaWNoIHdhcyB3aGF0IHRoaXMgb3JpZ25hbCBwYXRjaCBkaWQgZm9y
IEdGTEFESiByZWdpc3RlciB3aXRoDQo+IHRoZSBmaWVsZHMgbWVudGlvbmVkIGFib3ZlLg0KPiAN
Cj4gQlIsDQo+IFRoaW5oDQo+IA0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBCam9ybg0KPj4NCj4+PiBI
b3dldmVyLCBJJ2Qgc3VnZ2VzdCB0byBjcmVhdGUgYQ0KPj4+IHNlcGFyYXRlIHByb3BlcnR5ICht
YXliZSAic25wcyx1c2UtcmVmY2xrLWZvci1zb2YtaXRwIj8pIHRvIHNlbGVjdA0KPj4+IEdGTEFE
Si5HRkxBREpfUkVGQ0xLX0xQTV9TRUwgb3IgR0NUTC5TT0ZJVFBTWU5DIGRlcGVuZGluZyB3aGV0
aGVyIHRoZQ0KPj4+IGNvbnRyb2xsZXIgaXMgb3BlcmF0aW5nIGFzIGhvc3Qgb3IgZGV2aWNlIG1v
ZGUuDQo+Pj4gTm90ZSB0aGF0IHRoaXMgZmVhdHVyZQ0KPj4+IGlzIG9ubHkgYXZhaWxhYmxlIGZv
ciBEV0NfdXNiMzIgYW5kIERXQ191c2IzMSB2MS44MGEgb3IgaGlnaGVyLiBJIG5lZWQNCj4+PiB0
byBkb3VibGUgY2hlY2sgZm9yIERXQ191c2IzIElQLCBidXQgSSBiZWxpZXZlIGl0J3MgdjMuMzBh
IG9yIGhpZ2hlci4NCj4+Pg0KPj4+IEJ0dywgd2UgZG9uJ3QgbmVlZCB0byBtZW50aW9uIDE5LjIg
TUh6IHNpbmNlIGl0J3MgdGhlIHNwZWNpZmljIGRlZmF1bHQNCj4+PiBjb25maWd1cmF0aW9uIG9m
IHlvdXIgc2V0dXAuIE90aGVyIHNldHVwcyBtYXkgbm90IGJlIHRoZSBzYW1lLg0KPj4+DQo+Pj4g
QlIsDQo+Pj4gVGhpbmgNCj4gDQoNCg==
