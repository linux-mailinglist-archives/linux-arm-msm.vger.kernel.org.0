Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7252434F619
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 03:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbhCaBRy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 21:17:54 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:47828 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233018AbhCaBR1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 21:17:27 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 782C24014A;
        Wed, 31 Mar 2021 01:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617153447; bh=PbLdDIIk/Z2voyJHqetXxG4i9iv9MZ8zKiEWX8kbU+4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=XoaVR+Kw3oS+18eOYoFsKkBD7QSJQQGcWEPv6Sobj4xKSE3k1YlHxMHs7vJJY7HVU
         CBxaCo4liSllcd5sEP2roZQ77Bozxs7E7sRmN0eIZNst3W5qdD8tCCS/JeiI3l/LMN
         UU4JmonYQldwSl7YVIFTpS0zTdWSSelN8MrI+M3eLJlPKP7QCnTSnjCA5ljvrj0UkD
         /E8EnWLNYg1r/8r43KMMYrVOIbbx2dGVMfoimjGSIwvhNngKioyUMDaFx7pQN2/7/Y
         +Rq+VXPy9FO6+SHRgc+vTGTsxQ8d86vkgxRhtdbCcpikjRG3LVE/HSaqy0JHZrNUIU
         qn53quOZYVhMw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id B168FA0067;
        Wed, 31 Mar 2021 01:17:25 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 19CEC80091;
        Wed, 31 Mar 2021 01:17:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="nKu78rjr";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKL45/KyaabQTpBmYbvrIZLdkI6SAZjMT3eHpUFRBnaad17LyAV12+YgtvTM28d1idSPlmuAVMeJrXo8UScixsyi15++G5bOYBYnMpMSJ1URYQ/vEDWmX5LrhfrwzQbUl6QF368amdZTh8wVsx7S9r1FRn4lNBtKFWX3IFUbWVyBH/Jgt4s3AXH4hfO+NoHTpFVgK0TAj5zvewhyeWARHS5Bhr2NoQiStYrHf8zJkyBXmLOjrPHm5s/TNqvPVfb/F6axtghyT3vafz8TRFVFLseyeHpQ0jjsuqbUPQTY/63WItzFC+EpEFIjbfll/2/ZCj/+YWl0ZOFBsu1pMfuthw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbLdDIIk/Z2voyJHqetXxG4i9iv9MZ8zKiEWX8kbU+4=;
 b=MDbwiVeW8ZFtAbpZEdZmklYZJxIbXdyEuYkhmm3xBm5LDw8gqScGxxPm7+xwb5pamPvjvkTYysatM+YV7rKUhX4tbPZaddPTR4cIcW/jKmnfW0NZnGKUhHzHu3/vcBspsVhiEFzcN5HBSMZibQZQbVQvArqE/bmCvBxUqPpgTG0zd0Vl/K55r1A5qCObYE14US9MYii13GON0dSQGa+RoFHeJhhzdj0tpk8AjlcOfJkh45CHrxF1SMKGctEyJL8bYv+KlFEPBlCbw7xLtZ9g1LDqvD+rnSu5UgWRJFQuXuxQ42bH/kY0tLSxsi79CrY70w3mvaE3ZzVrIijULzCpgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbLdDIIk/Z2voyJHqetXxG4i9iv9MZ8zKiEWX8kbU+4=;
 b=nKu78rjrs8bGJNngqMzi2e1WmmvGm9qHmklin4njcrqAFM0w69qFM7+JEnKjZgYWKXDXHBVf5AwL4cKF2VWPfDERfHFCgcIT5Hh3+oH6PogdEpcPrQYIWXi1pmCdfOAd6fL2VKL/FaGbyXATHRMwIrXNfQL3FyIqdoje4hXO+Ik=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB2949.namprd12.prod.outlook.com (2603:10b6:a03:12f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.32; Wed, 31 Mar
 2021 01:17:20 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 01:17:20 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Baruch Siach <baruch@tkos.co.il>, Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: reference clock configuration
Thread-Topic: [PATCH] usb: dwc3: reference clock configuration
Thread-Index: AQHW/eInRTRYpSizoUSSkIWQR33qw6qdm2uA
Date:   Wed, 31 Mar 2021 01:17:20 +0000
Message-ID: <f3042097-8569-5882-06db-ae56e05cac59@synopsys.com>
References: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
In-Reply-To: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
authentication-results: tkos.co.il; dkim=none (message not signed)
 header.d=none;tkos.co.il; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77a23dc4-2b96-4cf1-6840-08d8f3e2bb84
x-ms-traffictypediagnostic: BYAPR12MB2949:
x-microsoft-antispam-prvs: <BYAPR12MB29495064C148C1325D3744AEAA7C9@BYAPR12MB2949.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XR9w1tSwvHCpgOzyPlCOK26Mg8UWD9HekLeKMkI/whWK/eF5c7eRq2qYTNpPpfx5MLxC3IxtWJ9YUwOg8rrFIsvP6nlotz8OoHsQD0Kg9C7EI5+m9vkm6tXfp5epAjATmICol7aCfZ4RwGWG0nkCuQcZYORw0aNbja8Wn9zvYbo/jjHl0AAY+U66HLccQ1AwtHrkkypfw8RYKZb1e27bw+3sFDy0HOtiaFThuNMPtITOGlzIdhvjrJ+Mn1TeLH80/E7XRdnGbAOCyJhkTplfVJcenynpxrgbjQdH9sIhuf2+0t2mZoIE7lMZEkPkjWRKL6gYk8fkKg1veSi9fIsLEfIE5p20AkhyIVy+wopia1vPikgb9wTFiMFl7Gzk3S/NyeHMVB/XnP5KjFgjyP1sEJ5vLRbQpTco4sZzB0n4LX5YA0k4yuubkEzbmTjD4VIr0D4bLzw4Es7ENUCkHEr+C/C8TSAZXe33++22hJLL7QjceYOPL80mh6X8gGPsZi8GHyZ9zWO32+Id24SJ6gzF1DB9GVQ2Q/gYHOamWD5zMdS2rWBsVCcWgKEtR8tLYhTE3uS8zfNTP4lKGnWRMhnwz2Xd38jE9pDRzo/2uisE4KUAJU3cRN7OclgbfCGc9TtOvQrai7bCrV9g7KdesboNH/CJtVnZ8UxolJqGz9NMwHpM68P/4wisbTHMyrAmFq4j69/ZXcOM/NSHM+hUZxmrLnTw6Ix+9rk7kDpErfmTUZM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(39860400002)(136003)(396003)(4326008)(2616005)(8936002)(8676002)(36756003)(83380400001)(316002)(86362001)(2906002)(110136005)(186003)(26005)(66946007)(5660300002)(54906003)(76116006)(6512007)(31686004)(66476007)(66446008)(31696002)(6486002)(66556008)(478600001)(6506007)(38100700001)(64756008)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?OXJmYVk1Q3EwZUxZVm1yQzBaeXlvb0FBellNaTA1OHFHTSthTkpxUE5pZm81?=
 =?utf-8?B?U2VwOTVQajZvNkFnR0tIYzhya3dET0tLZ3hJODBZNGpaQVZHY2NUN1FNaXV0?=
 =?utf-8?B?b2s2VlZsY2Q3ejFXYTNFcGFnNllRTTNjQWhOaGZXMm9iWHdsQ0hjZUlVUFRm?=
 =?utf-8?B?QTEzdkdqMXc5S08ycFJScmZWN1YzRTE3YUp3YXRKbzVYOEpkRURwdXhsc3V6?=
 =?utf-8?B?RHY5c2Z6YlBIanZSYUgwS0ZvR243YUR3NzB6TE9wVlVBWUg5NGhoTjhma3NV?=
 =?utf-8?B?MlhlaFFvT3c3MVI4SVNYSGFHQWw2cEU3VUpYd0dnUi9DUEwzRFA0Y3Y1V2k0?=
 =?utf-8?B?THVVUWpCVDFVZzZJc05wbVpRdkZISEVzOFovZkx6a0xObU9BazkrcGNuZ1VT?=
 =?utf-8?B?Nm1nK2RYaWYxVlZCOFp6dWhra1h0eUc2ek5oNy93eUUzTzZTWkZIdDlXSDVV?=
 =?utf-8?B?dk9ZUFZPZ2xMN05yTHJQTVhpQWF3ZlYxUnBWekUwNy9IUzQ2VUtBV0RKNHh3?=
 =?utf-8?B?amdmU2ZNTUVzN0pqVmdEeHZkcldRdm1TdmhDUDBLWEtqejRXRE8rbEpmSDV0?=
 =?utf-8?B?WUJORFQ3SkJCUCsrMXhPTDZEVnlVOUxVV3JqU2wweXBvZkp0RXRHc3FOa21l?=
 =?utf-8?B?OTVGZHZ3TWprWUxZY2t1TnZPbWZ2azhJNko2Qnd6d3FCSTkraTVBc0hBbEJt?=
 =?utf-8?B?bktwVVpBNjRCL0x3OXBvWWp1cy9FeVJRa3Q5bEhiemRSSWgxRGdwVDFzS3B3?=
 =?utf-8?B?WHV1K0R5NnlRN3VZZC9GTlFkVDFBU21YMExILzVON2taNWpSUUZtc2Mxek1W?=
 =?utf-8?B?TElEYllWTFR0b2I4L2lnbUpNOE9mY29tVkt3cHg5a1F5RUc3SSsvTTFyOTlF?=
 =?utf-8?B?dEFZQ25zWEtMV21xT1pteDRQVUFzZzZ4a25yZm41cWJFZ1M5ZFd3MlYzOUNS?=
 =?utf-8?B?V0dkNU1lZVpuSzR6U2NWTXpSYm82RUN3SmpjYTJDclo1Z2thVDNLU0ZDZUtC?=
 =?utf-8?B?WStRZEVsQUtuUXBKYVFnYzRsVUQrRVdmWnJaNWpEMlJLOXRpdWp1ek4xdmlu?=
 =?utf-8?B?anpLL3U4OWZmYVlnOEE3dk5FWXB2WEtwM1UwUGY4Q0ZvUVp3UUZJbEdTKzJo?=
 =?utf-8?B?a1hINHd5QjdtQ28vMWlwd0lNVjBEWU1HTitrSVZyVVNrSFZ1UmVFcDUra0dL?=
 =?utf-8?B?ZHIvcXg3MU9KcW55ZEdzTEhleS9sOUE3dC8rSkxnOTRNSzl5ZWg5cDZhZzNB?=
 =?utf-8?B?cXJyVEFzVzhYZnF0clNRVHRPMHlQYUR5Z01jT0tEdFY5NDQ2VjhZZGFnUkhQ?=
 =?utf-8?B?d1pweDkxcUtoMnp1MTh0dXRPaEF6dnFhUHRMbG8wRDI5ckdmRUpXUU9UdFpr?=
 =?utf-8?B?Ny9aQ2RsL2RneTRkdjgrZ0tGSkV1RHc2Q0hGb1ZxQTZ1eUlFRm9DK1hWK0hD?=
 =?utf-8?B?TmFMVDJTTXMxTGh0U3hTNHhoNTU4dTlzcDVWOFV4OXpYNmdHY3UrNS90d1Ny?=
 =?utf-8?B?blZicXRob05ybUlvK2NGQ21kK3hWajBQSmVGQjJuRUVnNXNCNm0vdEZqYXpK?=
 =?utf-8?B?RXVRNFhpaENEUk81ZytzdFVyUjdEdTRUUFhtTWNQSzZqS0g5Uk1FaEY3ajQ3?=
 =?utf-8?B?bW84eTVIeHo4ZmZESDU2OFhrVzdWaXp6YUJSYytublAvL1ovQ0phMG9pV2o3?=
 =?utf-8?B?V3VBak5rMGZsdDBHSDB3ZXBwbDZGOFNHdWVDUzYyMThMUzZZWEllSWd4b09v?=
 =?utf-8?Q?A8+G1RMrdX93jGpjIaEIofxAhY722uutQZZ7YUH?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <40B5B268BCBB4B479CD0DF7E1B6A2E2A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a23dc4-2b96-4cf1-6840-08d8f3e2bb84
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 01:17:20.5531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G/sUt04rWzrd38d7Pik3jKZZdeZXsQ+b9M4FQuCr975V2ZOgUi0Ko6vdKBOzSUWaJKGryts3aQrpppyD7tXlRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2949
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QmFydWNoIFNpYWNoIHdyb3RlOg0KPiBGcm9tOiBCYWxhamkgUHJha2FzaCBKIDxiamFnYWRlZUBj
b2RlYXVyb3JhLm9yZz4NCj4gDQo+IERXQ19VU0IzX0dGTEFESiBhbmQgRFdDX1VTQjNfR1VDVEwg
cmVnaXN0ZXJzIGNvbnRhaW4gb3B0aW9ucw0KPiB0byBjb250cm9sIHRoZSBiZWhhdmlvciBvZiBj
b250cm9sbGVyIHdpdGggcmVzcGVjdCB0byBTT0YgYW5kIElUUC4NCj4gVGhlIHJlc2V0IHZhbHVl
cyBvZiB0aGVzZSByZWdpc3RlcnMgYXJlIGFsaWduZWQgZm9yIDE5LjIgTUh6DQo+IHJlZmVyZW5j
ZSBjbG9jayBzb3VyY2UuIFRoaXMgY2hhbmdlIHdpbGwgYWRkIG9wdGlvbiB0byBvdmVycmlkZQ0K
PiB0aGVzZSBzZXR0aW5ncyBmb3IgcmVmZXJlbmNlIGNsb2NrIG90aGVyIHRoYW4gMTkuMiBNSHoN
Cj4gDQo+IFRlc3RlZCBvbiBJUFE2MDE4IFNvQyBiYXNlZCBDUDAxIGJvYXJkIHdpdGggMjRNSHog
cmVmZXJlbmNlIGNsb2NrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmFsYWppIFByYWthc2ggSiA8
YmphZ2FkZWVAY29kZWF1cm9yYS5vcmc+DQo+IFsgYmFydWNoOiBtZW50aW9uIHRlc3RlZCBoYXJk
d2FyZSBdDQo+IFNpZ25lZC1vZmYtYnk6IEJhcnVjaCBTaWFjaCA8YmFydWNoQHRrb3MuY28uaWw+
DQo+IC0tLQ0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0ICAgICAgICAg
IHwgIDUgKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jICAgICAgICAgICAgICAgICAgICAg
ICB8IDUyICsrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5oICAg
ICAgICAgICAgICAgICAgICAgICB8IDEyICsrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDY5IGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2R3YzMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9kd2MzLnR4dA0KPiBpbmRleCAxYWFlMmI2MTYwYzEuLjRmZmE4N2I2OTdkYyAxMDA2NDQN
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dA0K
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0DQo+
IEBAIC04OSw2ICs4OSwxMSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiAgIC0gc25wcyxxdWly
ay1mcmFtZS1sZW5ndGgtYWRqdXN0bWVudDogVmFsdWUgZm9yIEdGTEFESl8zME1IWiBmaWVsZCBv
ZiBHRkxBREoNCj4gIAlyZWdpc3RlciBmb3IgcG9zdC1zaWxpY29uIGZyYW1lIGxlbmd0aCBhZGp1
c3RtZW50IHdoZW4gdGhlDQo+ICAJZmxhZGpfMzBtaHpfc2RibmQgc2lnbmFsIGlzIGludmFsaWQg
b3IgaW5jb3JyZWN0Lg0KPiArIC0gc25wcyxxdWlyay1yZWYtY2xvY2stYWRqdXN0bWVudDogVmFs
dWUgZm9yIEdGTEFESl9SRUZDTEtfKiBmaWVsZHMgb2YgR0ZMQURKDQo+ICsJcmVnaXN0ZXIgZm9y
IHJlZmVyZW5jZSBjbG9jayBvdGhlciB0aGFuIDE5LjIgTUh6IGlzIHVzZWQuDQo+ICsgLSBzbnBz
LHF1aXJrLXJlZi1jbG9jay1wZXJpb2Q6IFZhbHVlIGZvciBSRUZDTEtQRVIgZmlsZWQgb2YgR1VD
VEwuIFRoaXMgZmllbGQNCj4gKwlpbmRpY2F0ZXMgaW4gdGVybXMgb2YgbmFubyBzZWNvbmRzIHRo
ZSBwZXJpb2Qgb2YgcmVmX2Nsay4gVG8gY2FsY3VsYXRlIHRoZQ0KPiArCWlkZWFsIHZhbHVlLCBS
RUZDTEtQRVIgPSAoMS9yZWZfY2xrIGluIEh6KSoxMF45Lg0KDQpXaHkgaXMgdGhpcyBhIHF1aXJr
PyBJdCdzIG5vdCBhIHF1aXJrLiBUaGUgdXNlciBjYW4gaW5mb3JtIHRoZSByZWZfY2xrDQpwZXJp
b2QgdG8gdGhlIGNvbnRyb2xsZXIgaGVyZS4NCg0KVGhlIGRlZmF1bHQgdmFsdWUgZnJvbSBHVUNU
TC5SRUZDTEtQRVIgaXMgYSB2YWx1ZSBmcm9tIGNvcmVDb25zdWx0YW50DQpzZXR0aW5nLiBUaGUg
ZGVzaWduZXIga25vd3Mgd2hhdCBwZXJpb2QgaXQgc2hvdWxkIGJlIGFuZCBzaG91bGQgcHJvcGVy
bHkNCnNldCBpdCBpZiB0aGUgZGVmYXVsdCBpcyBub3QgY29ycmVjdGx5IHNldC4NCg0KQlIsDQpU
aGluaA0K
