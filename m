Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36053579E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 03:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbhDHBxk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 21:53:40 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:49290 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229505AbhDHBxj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 21:53:39 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4FF0240648;
        Thu,  8 Apr 2021 01:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617846809; bh=AkgYaHCBR5qo9N0WkzLIepK2c7VnV55LkSG2ct7iT30=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=EPIM8NqlWGQCS3vQtwPyIa+pxY8VMmONH2FZMdTOMdAHApFcQ6UWE5VvLBqGbLK09
         7ROxgX3l/IKLTWlDou3GM1sBahMwyHfHx+WwtdHkiDG2EzvQHPXeyZD5o/TGMX6C+C
         nUVoixveSZsP5VZ8XKhniv0dlqSc12P5LmNT9YCr2KQJunP/xyjKJYIBxCUTQVz4Tj
         TOPFNoUab1YACiHPSP/FhgQ8rY+S+Nk1t/Ux6IA1rMUhGIem9YplNsaobYIXnfB4Et
         IOxLkaaDhdZ35dbzyxwnLI9bpKSbJ2SVqMMsDdjpCt5x33R/w6u1AJ/jMyBiM9sh2K
         CzsLW25tzozYA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6FD28A0096;
        Thu,  8 Apr 2021 01:53:26 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3499A801DD;
        Thu,  8 Apr 2021 01:53:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Xd8BS+QO";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9Y2Zzj2kdWpDNMMLzmO5AWDQTLkE9EMkAJkG3c2Srikngu/HmjKoWo54GiCTIQk7kYTVnSYrBxuWtnsq6qdQ3lBoJzZVT9NIZvljLegrqIPce+rphbNbiBMINOBN9WB3437qxvbRlzW3t0a8F9+OF4RCgsD8nqDfw9e3eWotlM4zEyedO0jcMltcZDs0uOTJk2MQ/QfNpCICMlLz/LEw1qnxs3yU0ajoEhCJwTaUpFdATi1f7j/vj4V7wH9I6u2/E4J6CZPG233Q0RIndWy3gS31vbczVeZo3bVlZ91b2mEdvFYdd/42LizPdsgiTtd0YWfQO1ZSmwDxZcPVSbB0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkgYaHCBR5qo9N0WkzLIepK2c7VnV55LkSG2ct7iT30=;
 b=RP0IzpZDScaaZxbDqCwoTToGZmMjpJgZxc/wMgWo4wZXUWw9Nxc0/FrcR909P/MyN4uCwkyECs5xgg0ZbO9N8Z+2dnt5NsewjUxXeyEFcrGPHP0DQAeA2iT8uGo94TFM712oI6vGvidzI6uiuWeoEQLKchO138ZvKEvCa6tsSna3D+MMMFsP/3WHIOgBc9OpakqKCvh6zqRCLo281RrWMs2iw8EpATAka0qQLgcLlMVluqaZYwUdptlhPj+Z8jwlaxvBW4sxpU6VJ9FXC2kGPv7lwsY06stFq6Me283Vl45pRGoTvuN/KpFb/pXaWk3ippm6XuNic8HjhWU0W1XtxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkgYaHCBR5qo9N0WkzLIepK2c7VnV55LkSG2ct7iT30=;
 b=Xd8BS+QONjz8ikaTLdVTh2wJO4oDJmH8BqMvIMJBzYgIwb9mDkPOcNPGITKj9ufgnFFr5ojmrq8u5qa0O6A6YYhBuSwP+tGbFXP99UQLR9R0V3td+Jef3OFkaAorfZjyUF9EmzOnosHG6DjfqGa0SaG1Si5aar/TbS5Ql8AEQ/U=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 01:53:21 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4020.018; Thu, 8 Apr 2021
 01:53:21 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Kathiravan T <kathirav@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Baruch Siach <baruch@tkos.co.il>, Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: reference clock configuration
Thread-Topic: [PATCH] usb: dwc3: reference clock configuration
Thread-Index: AQHW/eInRTRYpSizoUSSkIWQR33qw6qdm2uAgAuy5gCAAOnRAA==
Date:   Thu, 8 Apr 2021 01:53:21 +0000
Message-ID: <4e5a3487-bae2-b21a-df90-80b5f0d170ba@synopsys.com>
References: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
 <f3042097-8569-5882-06db-ae56e05cac59@synopsys.com>
 <8cc9617dc62be17ac3a9420e7750b0ee@codeaurora.org>
In-Reply-To: <8cc9617dc62be17ac3a9420e7750b0ee@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24e13462-1398-4be9-9b9a-08d8fa3116b5
x-ms-traffictypediagnostic: BY5PR12MB4100:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB41004009326BF8F538C97387AA749@BY5PR12MB4100.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YypVk3fOp5OPs53VBfodbwYZYjLOby912fe3dquQ44TS0iDZW2kGAmC7oi731C8IfSVfwat+KO60Ur7A8NSWpUhVwjBw2lQu2SqbkWirkgD3sxwf5t/3ewfh4tvKxebR0qCKkk54g2+MxJt2Tzm/BOIy/yWnjQlhzTuEgTiNrodwhiw4fT6EIb8CC0OUbK8aBuii2R4+s6rhWsr2Fe7zO4pG8tGa2uR8FnqsXNUOIjkeEL2H6nTrg2xLMruatda0LTz2OZMrpzSshNFiheXzP+qMGgRPtFQmPjz0nMbutIwc09nE+GrEpX8JHeAtTepqMVZSPGwTT2ip1oLyfOo0VgBgBKPVwhU5y8VAdiesaT6+sjWOzykZLJkaOCILqo7aEIvJomFXG0BK0Ch9KKEMdNLiX52jUbHjoHow/Fe6TD1Qy67W6lldonEgwL4UUnfzFmtEkbWfKQyOZRRgflzclzq4U0G5/YcO3uzNLd8bVlzKTVwpCvOAaZ31OoFcZawpNCjoSzM8PCO4ANOncTzfDySShsHSIFZBh+o529QILG47Ji31paY+Fw9ATx9ziIXdpzTiYiJ01WHOnJ3+q9jb+Ys4lQGyGTjg7cc3XVIpnVIrrPdWc21pRnWCk7UzkEN3w110EYi+bvJ7BsnqIG7s44yzFCH6Prz9N7a2CHF131DPiUuN0otEgwkM32VtOVHNUKjUZfZZVn9orupf0uRP0y4TeK9Z3JZivBINwEy+BT8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(39860400002)(346002)(136003)(64756008)(31686004)(66556008)(66946007)(66476007)(66446008)(316002)(76116006)(83380400001)(86362001)(6506007)(6512007)(31696002)(2616005)(478600001)(8936002)(36756003)(71200400001)(26005)(8676002)(110136005)(54906003)(6486002)(186003)(2906002)(4326008)(38100700001)(53546011)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QnA0dG9DUjNQY2JjeW42bGhQdjJXTSt6Z0x6RjRlT1pPREdBcUJoOFV0Z0FN?=
 =?utf-8?B?Z29jSDZwK3NvcCtORElWL05naDhCc1l4endCWnkrMHA0aTBxVUJ1WGlFdHI5?=
 =?utf-8?B?YXpOZmVGckpPSVgxbU1XRVFzTzlabjhJNCtiQURQZEpRMW8wZ3QrQWUxc2F1?=
 =?utf-8?B?ZGFRMC83czUyL2ZpR21CTW1UanVWOEhGTjZaajc4ZFM4TU1aVHBEK1QrcWVx?=
 =?utf-8?B?M3lnM1pmWDJ2aG94WFV5NUsvTSsrUkdIOVE4a2cvTnF4SnduRFE5ZUt4SG5B?=
 =?utf-8?B?eVc0dVJDZDc5Y2c4VFlZTWFNUVNFakJ1Qjg3cTJhQU1DOXNqTjArZjhDT1h4?=
 =?utf-8?B?ci9IUkx1T09OS3RvSDFvTUFxSUdadXp5MHlCRUE0dDM4dzBtQUY0SkNFdmZz?=
 =?utf-8?B?Z3lkeXRRRjJzdjN4UDhxeFpmVVYrTk5RUE11d24wSTBxUmd5Mjl1dHdUc2dm?=
 =?utf-8?B?L0xReXFWK09nZ2tMcC9ZMDd2bm0wZWd4RWo4RXJrM0VhaElLcExhaFFDanJw?=
 =?utf-8?B?RDJQK3NMK1MzR05ZOVd4djBJU0t3dzRBMlBGZ3VGZ2h3ZUo0NmY1RExHellu?=
 =?utf-8?B?VEZoOFd3d1FuOTVpcWNrb1Fzc2ZZWHFnNnVndlUwMUg4aWdabE5xOHpsR3Ba?=
 =?utf-8?B?b2lHWmRUTEQ5djF1RFJNem40Q1FCTG1yaWswdTUrL1VWWU9XQWpwL1BaWm9S?=
 =?utf-8?B?R1pHOExlWTN1VmR1bDBvVTAwcTFYc2lPQlFPSHkvdHpwaWRLMEZJVXhDT2dt?=
 =?utf-8?B?WVBLN2ZSb3lwY0V0dHF6bXFyZ2ROVmYvMnVMMTE4cFIxdXdpREVERVJIaXpV?=
 =?utf-8?B?blVxUHFOdmwwRHNSM3hZNXowZmdNdDdTM0FPbVlIZk9vQ1YrZTl2SWp6dFl6?=
 =?utf-8?B?VGc1dGNxZjdKRnRxc1dCSXYyK09FM01DVUJRY1ZNQzcvV3FFemJDazkxemZy?=
 =?utf-8?B?aXdxektWT1Q4Y01YTnNJbmY1dmMvWUM3MWg5UFFKcnl5ZjRpTHlEMDFpSUxa?=
 =?utf-8?B?aU9CT2lEZ0VHSE52OHd5ZEtza0FXMU9oMW5jckRQMnZKQXEwbnNLY2VUQ1Rr?=
 =?utf-8?B?Zm9rYUNkb0lhTWMvSnpWWU8wMEFsVFFoQ1k3Tk1yR2ZtVGorM0hJeC9IdDFU?=
 =?utf-8?B?VFltUmVMQkVXbFVybHRITlIxMkI2SGlQMWNNNHFYK00wbjQranB3TGtESkxi?=
 =?utf-8?B?KzlmeFpNTTB2ZWdvVCtGVTYva1hLa0phaklzV0NYTlJlWENwL3lZYlQ5Y1Jj?=
 =?utf-8?B?ZThSUzJob2VXZmdURk9Xa1NrT0hvZnNucE04WU9VK2tyYzFhWmNzTk42SjQ4?=
 =?utf-8?B?eEVtY1BNa0pEcWFaeXZZcTd6bWdZTkRZQmtLUXBhWTlscVg0MW8yN1FiYXFB?=
 =?utf-8?B?RXByUUNpczd0NVpSL3V4SHJxcWtoNVk4dFRJNlU1WFJRaG5jK0d5a2NLcFVS?=
 =?utf-8?B?aEcydkFQNGE1K3VNV01PbVlKRExzOThycVFNeEpFaE5lVU40Zmg5Z2QxSy91?=
 =?utf-8?B?Nk9UN2FQeEp4cDRNYVVwbm5hc0ZUalp2N1h4emZPamV1b3loc3YvcjZMalNj?=
 =?utf-8?B?NU4vRHJnaFh3RXhSdGxvTTJsQXFPQ2s5NXBtM3VocUJBRVA2aXRFbmFaWGpH?=
 =?utf-8?B?Y01NajNUVEJ0MDdDS1ExaS9DeGZDTlpDWWpiYlFQOEx2QTN1aHhMWFVoZkc5?=
 =?utf-8?B?QS80TktTa0wwVTRsTnd0dWJjS09VOHBsZkJFQzJtUlZyZnp5dmpEV3BHRlhS?=
 =?utf-8?Q?dSRPysyeTeIGKIFCog=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FABE5BAC2BF824FB5F007B723B1BEC9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e13462-1398-4be9-9b9a-08d8fa3116b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 01:53:21.2668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ByyBDuNBMhuDmx8Zqg5DH6lk8E+w7QQzTYi8NhkG/JqMw6QqCEe/KHUfk9pCmXZOmhMhv1wRQ4p4CNGn0ugwQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

S2F0aGlyYXZhbiBUIHdyb3RlOg0KPiBPbiAyMDIxLTAzLTMxIDA2OjQ3LCBUaGluaCBOZ3V5ZW4g
d3JvdGU6DQo+PiBCYXJ1Y2ggU2lhY2ggd3JvdGU6DQo+Pj4gRnJvbTogQmFsYWppIFByYWthc2gg
SiA8YmphZ2FkZWVAY29kZWF1cm9yYS5vcmc+DQo+Pj4NCj4+PiBEV0NfVVNCM19HRkxBREogYW5k
IERXQ19VU0IzX0dVQ1RMIHJlZ2lzdGVycyBjb250YWluIG9wdGlvbnMNCj4+PiB0byBjb250cm9s
IHRoZSBiZWhhdmlvciBvZiBjb250cm9sbGVyIHdpdGggcmVzcGVjdCB0byBTT0YgYW5kIElUUC4N
Cj4+PiBUaGUgcmVzZXQgdmFsdWVzIG9mIHRoZXNlIHJlZ2lzdGVycyBhcmUgYWxpZ25lZCBmb3Ig
MTkuMiBNSHoNCj4+PiByZWZlcmVuY2UgY2xvY2sgc291cmNlLiBUaGlzIGNoYW5nZSB3aWxsIGFk
ZCBvcHRpb24gdG8gb3ZlcnJpZGUNCj4+PiB0aGVzZSBzZXR0aW5ncyBmb3IgcmVmZXJlbmNlIGNs
b2NrIG90aGVyIHRoYW4gMTkuMiBNSHoNCj4+Pg0KPj4+IFRlc3RlZCBvbiBJUFE2MDE4IFNvQyBi
YXNlZCBDUDAxIGJvYXJkIHdpdGggMjRNSHogcmVmZXJlbmNlIGNsb2NrLg0KPj4+DQo+Pj4gU2ln
bmVkLW9mZi1ieTogQmFsYWppIFByYWthc2ggSiA8YmphZ2FkZWVAY29kZWF1cm9yYS5vcmc+DQo+
Pj4gWyBiYXJ1Y2g6IG1lbnRpb24gdGVzdGVkIGhhcmR3YXJlIF0NCj4+PiBTaWduZWQtb2ZmLWJ5
OiBCYXJ1Y2ggU2lhY2ggPGJhcnVjaEB0a29zLmNvLmlsPg0KPj4+IC0tLQ0KPj4+IMKgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA1ICsr
DQo+Pj4gwqBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgNTIgKysrKysrKysrKysrKysrKysrKw0KPj4+IMKgZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDEyICsrKysrDQo+Pj4gwqAzIGZpbGVzIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKykN
Cj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dXNiL2R3YzMudHh0DQo+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L2R3YzMudHh0DQo+Pj4gaW5kZXggMWFhZTJiNjE2MGMxLi40ZmZhODdiNjk3ZGMgMTAwNjQ0DQo+
Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dA0K
Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQN
Cj4+PiBAQCAtODksNiArODksMTEgQEAgT3B0aW9uYWwgcHJvcGVydGllczoNCj4+PiDCoCAtIHNu
cHMscXVpcmstZnJhbWUtbGVuZ3RoLWFkanVzdG1lbnQ6IFZhbHVlIGZvciBHRkxBREpfMzBNSFog
ZmllbGQNCj4+PiBvZiBHRkxBREoNCj4+PiDCoMKgwqDCoCByZWdpc3RlciBmb3IgcG9zdC1zaWxp
Y29uIGZyYW1lIGxlbmd0aCBhZGp1c3RtZW50IHdoZW4gdGhlDQo+Pj4gwqDCoMKgwqAgZmxhZGpf
MzBtaHpfc2RibmQgc2lnbmFsIGlzIGludmFsaWQgb3IgaW5jb3JyZWN0Lg0KPj4+ICsgLSBzbnBz
LHF1aXJrLXJlZi1jbG9jay1hZGp1c3RtZW50OiBWYWx1ZSBmb3IgR0ZMQURKX1JFRkNMS18qIGZp
ZWxkcw0KPj4+IG9mIEdGTEFESg0KPj4+ICvCoMKgwqAgcmVnaXN0ZXIgZm9yIHJlZmVyZW5jZSBj
bG9jayBvdGhlciB0aGFuIDE5LjIgTUh6IGlzIHVzZWQuDQo+Pj4gKyAtIHNucHMscXVpcmstcmVm
LWNsb2NrLXBlcmlvZDogVmFsdWUgZm9yIFJFRkNMS1BFUiBmaWxlZCBvZiBHVUNUTC4NCj4+PiBU
aGlzIGZpZWxkDQo+Pj4gK8KgwqDCoCBpbmRpY2F0ZXMgaW4gdGVybXMgb2YgbmFubyBzZWNvbmRz
IHRoZSBwZXJpb2Qgb2YgcmVmX2Nsay4gVG8NCj4+PiBjYWxjdWxhdGUgdGhlDQo+Pj4gK8KgwqDC
oCBpZGVhbCB2YWx1ZSwgUkVGQ0xLUEVSID0gKDEvcmVmX2NsayBpbiBIeikqMTBeOS4NCj4+DQo+
PiBXaHkgaXMgdGhpcyBhIHF1aXJrPyBJdCdzIG5vdCBhIHF1aXJrLiBUaGUgdXNlciBjYW4gaW5m
b3JtIHRoZSByZWZfY2xrDQo+PiBwZXJpb2QgdG8gdGhlIGNvbnRyb2xsZXIgaGVyZS4NCj4+DQo+
PiBUaGUgZGVmYXVsdCB2YWx1ZSBmcm9tIEdVQ1RMLlJFRkNMS1BFUiBpcyBhIHZhbHVlIGZyb20g
Y29yZUNvbnN1bHRhbnQNCj4+IHNldHRpbmcuIFRoZSBkZXNpZ25lciBrbm93cyB3aGF0IHBlcmlv
ZCBpdCBzaG91bGQgYmUgYW5kIHNob3VsZCBwcm9wZXJseQ0KPj4gc2V0IGl0IGlmIHRoZSBkZWZh
dWx0IGlzIG5vdCBjb3JyZWN0bHkgc2V0Lg0KPiANCj4gVGhhbmtzIFRoaW5oIGZvciB5b3VyIGlu
cHV0cy4gQ2FuIHdlIGhhdmUgdGhlIERUIHByb3BlcnR5IGZvciBib3RoIHRoZQ0KPiBHVUNUTC5S
RUZDTEtQRVIgYW5kIEdGTEFESi5SRUZDTEsqIGZpZWxkcz8NCj4gU2luY2UgR0ZMQURKLlJFRkNM
SyogZmllbGQgdmFsdWVzIGRlcml2ZWQgYmFzZWQgb24gdGhlIEdVQ1RMLlJFRkNMS1BFUi4NCj4g
SW4gb3RoZXIgd29yZHMsIGFyZSB5b3UgZmluZSB3aXRoIHRoZQ0KPiBhcHByb2FjaCBmb2xsb3dl
ZCBoZXJlPyBJZiBzbywgd2UgY2FuIHdvcmsgb24gdGhlIG5pdHBpY2tzIGFuZCBzZW5kIHRoZSBW
Mi4NCj4gDQo+IFBsZWFzZSBsZXQgdXMga25vdyB5b3VyIHRob3VnaHRzIG9uIHRoaXMuDQo+IA0K
DQpIaSBLYXRoaXJhdmFuLA0KDQpZZXMsIElNTywgdXNpbmcgRFQgcHJvcGVydGllcyB3b3JrIGp1
c3QgZmluZSB0byBpbmZvcm0gdGhlIGNvbnRyb2xsZXIgaWYNCnRoZSBkZWZhdWx0IHNldHRpbmdz
IGRvbid0IG1hdGNoIHRoZSBIVyBjb25maWd1cmF0aW9uLiBBcyBJIG1lbnRpb24gaW4NCnRoZSBz
ZXBhcmF0ZSBlbWFpbCB0aHJlYWQsIHVzaW5nIGNsa19nZXRfcmF0ZSgpIGRvZXNuJ3QgbWFrZSBz
ZW5zZSBmb3INClBDSSBkZXZpY2VzLg0KDQpUaGUgc25wcyxxdWlyay1yZWYtY2xvY2stYWRqdXN0
bWVudCBwcm9wZXJ0eSB1cGRhdGVzIG11bHRpcGxlIGZpZWxkcyBvZg0KdGhlIEdGTEFESiBhbmQg
bm90IGp1c3QgR0ZMQURKX1JFRkNMS19GTEFESi4gSSdkIHN1Z2dlc3QgdG8gc3BsaXQgdGhlbQ0K
dG8gZGlmZmVyZW50IHByb3BlcnRpZXMgZm9yIGRpZmZlcmVudCBmaWVsZHMgZm9yIGNsYXJpdHku
IElmIHRoZSBvdGhlcg0KZmllbGRzIG9mIEdGTEFESi5SRUZDTEtfKiBhcmUgZGVyaXZlZCBiYXNl
ZCBvbiB0aGUgR1VDVEwuUkVGQ0xLUEVSDQphY2NvcmRpbmcgdG8gdGhlIGV4YW1wbGUgb2YgdGhl
IHByb2dyYW1taW5nIGd1aWRlLCB0aGVuIGRvIHRoYXQNCmNhbGN1bGF0aW9uIGluIHRoZSBkcml2
ZXIgYXMgZGVmYXVsdC4gSG93ZXZlciwgSSdkIHN1Z2dlc3QgdG8gY3JlYXRlIGENCnNlcGFyYXRl
IHByb3BlcnR5IChtYXliZSAic25wcyx1c2UtcmVmY2xrLWZvci1zb2YtaXRwIj8pIHRvIHNlbGVj
dA0KR0ZMQURKLkdGTEFESl9SRUZDTEtfTFBNX1NFTCBvciBHQ1RMLlNPRklUUFNZTkMgZGVwZW5k
aW5nIHdoZXRoZXIgdGhlDQpjb250cm9sbGVyIGlzIG9wZXJhdGluZyBhcyBob3N0IG9yIGRldmlj
ZSBtb2RlLiBOb3RlIHRoYXQgdGhpcyBmZWF0dXJlDQppcyBvbmx5IGF2YWlsYWJsZSBmb3IgRFdD
X3VzYjMyIGFuZCBEV0NfdXNiMzEgdjEuODBhIG9yIGhpZ2hlci4gSSBuZWVkDQp0byBkb3VibGUg
Y2hlY2sgZm9yIERXQ191c2IzIElQLCBidXQgSSBiZWxpZXZlIGl0J3MgdjMuMzBhIG9yIGhpZ2hl
ci4NCg0KQnR3LCB3ZSBkb24ndCBuZWVkIHRvIG1lbnRpb24gMTkuMiBNSHogc2luY2UgaXQncyB0
aGUgc3BlY2lmaWMgZGVmYXVsdA0KY29uZmlndXJhdGlvbiBvZiB5b3VyIHNldHVwLiBPdGhlciBz
ZXR1cHMgbWF5IG5vdCBiZSB0aGUgc2FtZS4NCg0KQlIsDQpUaGluaA0K
