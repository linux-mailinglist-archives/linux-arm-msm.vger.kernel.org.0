Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 965D9432BEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 04:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhJSCw5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 22:52:57 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:52510 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229692AbhJSCw4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 22:52:56 -0400
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4EE97460B6;
        Tue, 19 Oct 2021 02:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1634611844; bh=QJYkYnA8FMwjP/MepnQs/OKxm02D3y+oIKRmGt8vZuk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=mWNmlZILUyg4wO8qyUOsNzrTYf1rz+gHxXBGD4GZcmqipChefkHLoLmtq5smWO06i
         NOCN3AgiyAUMrwycrjlvSqC+aLCn1ZI6yge/c5jw+pDZxvlYhweZ9ENQaxFa59XvmG
         MgHYxxvCaDtq9UwL9m/jd5+5NDWTfE1Du/O+Ymbd5VsO1WpJmBsiyjpVnEbfGTzFhb
         aaVYUmpZPKWIgsOfZQ8geZoRm3fNl2O/tD/76+1XKQYv0MiFY1QBwYPX+JG5GgRQJD
         FZV5rPuV2GrBHFOLB/jMl2sGoubpFaTuroVQ2yeIu69OGxv1EMd2VTESAyhkaJge7y
         OANaqoG5SVHxg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5252CA00A7;
        Tue, 19 Oct 2021 02:50:43 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 274E140143;
        Tue, 19 Oct 2021 02:50:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Ypx5p5iU";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSxdeT/EgjME0XzD4ZGnjQLei0NMQ5QZ/oFJZV/WImNxsvKOoSPCvTOXUWP3UE+dSDOyaYnn4yoeAjCupFV5SoE3PPGd979GF7nOtOCOW+hh6VogHv3MIfIGnuMh9s2+mT/3dBUZwx12SrdXIaMbCcnyXFYkN3gVNc448lEckj2p6GjLVltq7q4qmX460BAwmP1ksEmqbFAAjA8JmTE1pyVDeOoo4JVsJjz68bWRU0dT3xUSJy7A83Qds8tBAnwGbKvTHS9E0wtzfTHW2RtGYY865J9DHlv+xk0OwzmfK2ipdgeQYGs6YLn8VkiOmKKOd5CyWOOY9AvdoQpAp3txZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJYkYnA8FMwjP/MepnQs/OKxm02D3y+oIKRmGt8vZuk=;
 b=AWtTBKH0Dof50QdCctvItR/sPdzIbrfumz6obL/FwKAXmG32BaGHeJ8DKJiKa6VS5kxPIOq+KxBiU4HGJglFd+vYE7R+fbM0g2TdtgB5mrTFzcXthcV72cCSP2X+ARHhp7liAsaxHfNI+aC05xKNXXpbfooIr/iRHpe9e/c+Ev844iUp2w2EB4UvL74lxKcIYC4Y6IhRyJw5SKipZgpKI73774Yns8SyXtU6CEdUOkqOY8HkDJMirvw3rNYiq2YkyWp8tfLrYZDHX7aMlHyB228ehOHeC38hcdfEORnnta37Nnr9cm/DiFlolmmki9HQh2zMiffOxJiB4GSmvyFSXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJYkYnA8FMwjP/MepnQs/OKxm02D3y+oIKRmGt8vZuk=;
 b=Ypx5p5iUXZ0s0cyLXpIM/yN4ISJff0dLl5RgFpOcbDIFUBvT2eCohwMCe8kFctHOxKg8TqQ3+8eR//wEwZkJKTqjIkNgaEzWCQ1jGV/IdxuasYI8X8MqSW/tUoAjcoz5aPKo+v/hk1OMjmvzI7hQjOSmfWy/NMGDAD0265yPdNI=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB2951.namprd12.prod.outlook.com (2603:10b6:a03:138::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Tue, 19 Oct
 2021 02:50:39 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5865:4cfa:3e30:26d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5865:4cfa:3e30:26d6%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 02:50:39 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: gadget: Skip resizing EP's TX FIFO if
 already resized
Thread-Topic: [PATCH v2] usb: dwc3: gadget: Skip resizing EP's TX FIFO if
 already resized
Thread-Index: AQHXxIIRSK9bwmPlIEW9C+wWaD+4NKvZny6A
Date:   Tue, 19 Oct 2021 02:50:39 +0000
Message-ID: <b2ab6498-4598-8b6c-4e6d-4535697f22be@synopsys.com>
References: <20211019004123.15987-1-jackp@codeaurora.org>
In-Reply-To: <20211019004123.15987-1-jackp@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5861b22c-ee4f-49b8-e95e-08d992ab3c3d
x-ms-traffictypediagnostic: BYAPR12MB2951:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB29510EA4070D9B76E1B45004AABD9@BYAPR12MB2951.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G2BYIRx/QyaakuHn6Q6IlQAdkTgo0dNlagIEO94zTtDBWlt2pCgZ1b2dAaqR1NsG8P1VGdlsUKX/MlzWRSmSuDqYawI8si19NVGH/Sz4RMa3MoNdWkuXaSv1Y/lA5I+JptdKcYmVKNLFWMFe6U2ynTy0MZBJGrmNKqm3E9aJ4WRits30tAmV3TD2DdW3uSxWl1kI7YNjhrp3Ha0traV6ruuPbPdqNma1VVABCRjYuYFRKqdj/P4kEgKyzmBQMxmIVXBHBi4WSVDfSpKUMvQQqL/bGLpY6cfL8uJAr2cBqLXKjw37krpg2TpLbs/LlXfjgJjiayM5yF34/bhlVSivpGh3KWE+F9EUQ0lXaSIIJhXbVe3RYLyMqwtER+lPaLdZKhY9VcL+xf2KM0n5T0HHUkdwrRKK0qY19azbGsGfTYnms6PlGgcll76lDJE3sY1Fwir2+gRCxIvv1I2XvYOFCKy6K5JxK/z7vqwo4f5tkm63a6umFxsupgDRkt3sgmpyjAIi+XB5ZBhLBuaS1O/Ts2pb2mNwkZYNJsEVuZcsjKZSZtCRr1ntOYfeAQpQhpaF84+SwLgV8nIzc0RJ51wpPfhW6mWcgi8xKnRYRdYRSfiCRKUogXWYWAQGI+WOH0zsRH3AVP3b65cdOq0dOoSXO1tasg2ZK/LEjkT0RCLFr6JChUVmYK5001dXC06zs615QpwyPxFNlg4omgc9D3voa3bh7neMU5ddEFhSHYw+JqzhpoDhyIT9cEE8rVYB8WmmHcDerS0Vq+79/AQyN8icjA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(71200400001)(6486002)(4326008)(2906002)(38070700005)(31696002)(31686004)(86362001)(64756008)(6512007)(508600001)(66476007)(66946007)(76116006)(5660300002)(66446008)(2616005)(8936002)(38100700002)(122000001)(66556008)(36756003)(54906003)(110136005)(186003)(6506007)(8676002)(26005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NG8xV29mUHdLOUxDTU4vS0RPaW9iZllBS1VSb2RIZlMxaWpFQlBPQlk0Z25W?=
 =?utf-8?B?dFRSRXpXdFYwWlU1b3o1SmdqL1pFV25DRzFDNkhSVXkvVWxJN3I2TldRejBR?=
 =?utf-8?B?ck41eDYwNC95LzV0ZU8xQVVaRXp5ZFowVHN3OWt1Y0RYN3d2U0xrRUFjeTZw?=
 =?utf-8?B?cTVCRDh6MVZKekw2MUJuL1RZWTFuQTRmSW80T1dHZzByRWE1RWl4UDhLRWVq?=
 =?utf-8?B?bjRhOXFsK3lyZjg5WHlVZlRDNXQvcnlndnd0c3BNbHIrdk9nSU54cVRzVC9v?=
 =?utf-8?B?aTdEbCtCUzZMZ2IxdDdqVTJzdjFnWFFxNVI1LzhwOFd2TVVRZnRTc0w0a3Zm?=
 =?utf-8?B?bXY4UlkxYWlEaVg3eXJNTWRtb3pBcEtYdVlMcllGZjlXR1hJSER6NGpQUjls?=
 =?utf-8?B?MU1KbEUzay9iNHpER2RaYXF2RW4wcE8rN2pzRGR5T2tGRjM0U1krVFNKay9u?=
 =?utf-8?B?L0lML2NKUXFiTnp6UHhzRVlucDNpTEpneVRMOTlCR0pwV3RqbFYzTkhCYkJJ?=
 =?utf-8?B?RG12WjRuK0cxOTJMY3YwUVlyUGZCUXlZaHZxUEE3c2NjMXAwV1JnQU53K2cx?=
 =?utf-8?B?bnJFSE00WkV2eTd6dTVVNG1Sd1NlUGo1LzFWbkRTeFhFcmRjb0JZMVBrZmsv?=
 =?utf-8?B?ajVldElOcXZxNjZoVGE0dTg3emd5aDlDNVE2RTJUcXpneDVOSk4yKzBqTTZH?=
 =?utf-8?B?S29SbnRFSU42UjZabWMwTjBxRXhtU0UyNXRZZERUcWlUL1pwcVRvOUY2THRB?=
 =?utf-8?B?cHpBaXFBb2pacmtyQWdBRXVycy94TmIvSEswWHFNUXRieVdaUWNEWDNIMVBL?=
 =?utf-8?B?SnlsMFJLVTBFUE9DN0tDaXA4WTRPcStGUngvSjRJY0VxTE1ML3hVN3NmYlBS?=
 =?utf-8?B?L3YybUxEcmxiRkpzUW9XazdkQXhRVG1OOTBjNUZDbS9rNE8rdWNPSWU4emUz?=
 =?utf-8?B?R25VUG9BTDhRcGRIVFN6eFpyczRaU0c2UWd0eDk2OW9qeFJ4Yk5kQVpIMGJT?=
 =?utf-8?B?VlV6Wk9QSWJPN2UwOTlMZW1rSFRmMGVVUnhpZ25UaGM4SzJCTFA3ZmZSVmlB?=
 =?utf-8?B?ekRKUlBzeVVnb3VTU2oxZDZLSTNyMkVodWFIcXNVKzhRNFdMc1JXT0k3UUdi?=
 =?utf-8?B?VTJ6WC9OQ1JNVkdRRHN4ak1NNlllclBoak9qYzN5YUZ0Z3NhRjhvRkI1aHBl?=
 =?utf-8?B?bENJSVI3a3VubXFFY3NuVWVqcElHSHRITFFjTEd3UTlqeHAxQ2tQMzFQT1or?=
 =?utf-8?B?c3F6OWhlc29BaVlmKytNTVlGTGdLdmhSc1VtRElSU3IxYjRuZVVXV3hQN1ZS?=
 =?utf-8?B?N3dRNjNleTR2U09UcytnNXlpcTJNN09TdVNJL216V2kwSGc5NllnVUsxTXpq?=
 =?utf-8?B?UUtWdXdYQ3hRTHNWYlpmUm5nbW56K2xFMWFmSW53amFtaDc0aitvY3VXWkh5?=
 =?utf-8?B?eDYraytDbTNuL2Y5V29XLzAyVU1mVW9GQnFYMkliTERCdzA4N2xvYVFQSVRz?=
 =?utf-8?B?ZjQ0dTBTRWl2d2FhQS9YeHZSL1VhY1kyNFhmby9yOUUrY0JYc1pwZXNyRHY0?=
 =?utf-8?B?VXdWSUxlemFxcE4yVmtmaHhHRVZ4R2VrT2FBdmNYN2RLVmtqa2Job00zUXVF?=
 =?utf-8?B?M2hlTkdKbEpobWY2MW5mQk9iZnM2ZlVQL1JudHhyYWZKNE5IU1hsUVNTYmlQ?=
 =?utf-8?B?SHhNMStQYzRNTXpVcHJSYTQ0bU8vaEtaWkp0cFlzdXFFWnM4cXhWd3hVM204?=
 =?utf-8?Q?ucdypoi20ZsuAh1YLA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <402CFF1F39FB204CA8B9642680E09791@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5861b22c-ee4f-49b8-e95e-08d992ab3c3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 02:50:39.6499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dN+xVnarfSHPoE6EwKLzGVrPSEPReoHxQH6KlxBwpBXI96phIaJYztnpmWi/dizFgXSYXiIIBwL02FWeyGTacg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2951
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SmFjayBQaGFtIHdyb3RlOg0KPiBTb21lIGZ1bmN0aW9ucyBtYXkgZHluYW1pY2FsbHkgZW5hYmxl
IGFuZCBkaXNhYmxlIHRoZWlyIGVuZHBvaW50cw0KPiByZWd1bGFybHkgdGhyb3VnaG91dCB0aGVp
ciBvcGVyYXRpb24sIHBhcnRpY3VsYXJseSB3aGVuIFNldCBJbnRlcmZhY2UNCj4gaXMgZW1wbG95
ZWQgdG8gc3dpdGNoIGJldHdlZW4gQWx0ZXJuYXRlIFNldHRpbmdzLiAgRm9yIGluc3RhbmNlIHRo
ZQ0KPiBVQUMyIGZ1bmN0aW9uIGhhcyBpdHMgcmVzcGVjdGl2ZSBlbmRwb2ludHMgZm9yIHBsYXli
YWNrICYgY2FwdHVyZQ0KPiBhc3NvY2lhdGVkIHdpdGggQWx0U2V0dGluZyAxLCBpbiB3aGljaCBj
YXNlIHRob3NlIGVuZHBvaW50cyB3b3VsZCBub3QNCj4gZ2V0IGVuYWJsZWQgdW50aWwgdGhlIGhv
c3QgYWN0aXZhdGVzIHRoZSBBbHRTZXR0aW5nLiAgQW5kIHRoZXkNCj4gY29udmVyc2VseSBiZWNv
bWUgZGlzYWJsZWQgd2hlbiB0aGUgaW50ZXJmYWNlcycgQWx0U2V0dGluZyAwIGlzDQo+IGNob3Nl
bi4NCj4gDQo+IFdpdGggdGhlIERXQzMgRklGTyByZXNpemluZyBhbGdvcml0aG0gcmVjZW50bHkg
YWRkZWQsIGV2ZXJ5DQo+IHVzYl9lcF9lbmFibGUoKSBjYWxsIHJlc3VsdHMgaW4gYSBjYWxsIHRv
IHJlc2l6ZSB0aGF0IEVQJ3MgVFhGSUZPLA0KPiBidXQgaWYgdGhlIHNhbWUgZW5kcG9pbnQgaXMg
ZW5hYmxlZCBhZ2FpbiBhbmQgYWdhaW4sIHRoaXMgaW5jb3JyZWN0bHkNCj4gbGVhZHMgdG8gRklG
TyBSQU0gYWxsb2NhdGlvbiBleGhhdXN0aW9uIGFzIHRoZSBtZWNoYW5pc20gZGlkIG5vdA0KPiBh
Y2NvdW50IGZvciB0aGUgcG9zc2liaWxpdHkgdGhhdCBlbmRwb2ludHMgY2FuIGJlIHJlLWVuYWJs
ZWQgbWFueQ0KPiB0aW1lcy4NCj4gDQo+IEV4YW1wbGUgbG9nIHNwbGF0Og0KPiANCj4gCWR3YzMg
YTYwMDAwMC5kd2MzOiBGaWZvc2l6ZSgzNzE3KSA+IFJBTSBzaXplKDM0NjIpIGVwM2luIGRlcHRo
OjIxNzk3MzEyNw0KPiAJY29uZmlnZnMtZ2FkZ2V0IGdhZGdldDogdV9hdWRpb19zdGFydF9jYXB0
dXJlOjUyMSBFcnJvciENCj4gCWR3YzMgYTYwMDAwMC5kd2MzOiByZXF1ZXN0IDAwMDAwMDAwMGJl
MTNlMTggd2FzIG5vdCBxdWV1ZWQgdG8gZXAzaW4NCj4gDQo+IEFkZCBhbm90aGVyIGJpdCBEV0Mz
X0VQX1RYRklGT19SRVNJWkVEIHRvIGRlcC0+ZmxhZ3MgdG8ga2VlcCB0cmFjayBvZg0KPiB3aGV0
aGVyIGFuIEVQIGhhZCBhbHJlYWR5IGJlZW4gcmVzaXplZCBpbiB0aGUgY3VycmVudCBjb25maWd1
cmF0aW9uLg0KPiBJZiBzbywgYmFpbCBvdXQgb2YgZHdjM19nYWRnZXRfcmVzaXplX3R4X2ZpZm9z
KCkgdG8gYXZvaWQgdGhlDQo+IGNhbGN1bGF0aW9uIGVycm9yIHJlc3VsdGluZyBmcm9tIGFjY3Vt
dWxhdGluZyB0aGUgRVAncyBGSUZPIGRlcHRoDQo+IHJlcGVhdGVkbHkuICBUaGlzIGZsYWcgaXMg
cmV0YWluZWQgYWNyb3NzIG11bHRpcGxlIGVwX2Rpc2FibGUoKSBhbmQNCj4gZXBfZW5hYmxlKCkg
Y2FsbHMgYW5kIGlzIGNsZWFyZWQgd2hlbiBHVFhGSUZPU0labiBpcyByZXNldCBpbg0KPiBkd2Mz
X2dhZGdldF9jbGVhcl90eF9maWZvcygpIHVwb24gcmVjZWl2aW5nIHRoZSBuZXh0IFNldCBDb25m
aWcuDQo+IA0KPiBGaXhlczogOWY2MDdhMzA5ZmJlOSAoInVzYjogZHdjMzogUmVzaXplIFRYIEZJ
Rk9zIHRvIG1lZXQgRVAgYnVyc3RpbmcgcmVxdWlyZW1lbnRzIikNCj4gU2lnbmVkLW9mZi1ieTog
SmFjayBQaGFtIDxqYWNrcEBjb2RlYXVyb3JhLm9yZz4NCj4gLS0tDQo+IHYyOiBBZGRlZCBleHBs
aWNpdCBmbGFnIHRvIGRlcC0+ZmxhZ3MgYW5kIGNoZWNrIHRoYXQgaW5zdGVhZCBvZiBkaXJlY3Rs
eQ0KPiAgICAgcmVhZGluZyB0aGUgR1RYRklGT1NJWm4gcmVnaXN0ZXIuDQo+IA0KPiAgZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmggICB8IDEgKw0KPiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8
IDggKysrKysrKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmggYi9kcml2
ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCA1NjEyYmZkZjM3ZGEuLmYwMzMwNjNmNjk0OCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmgNCj4gQEAgLTcyMyw2ICs3MjMsNyBAQCBzdHJ1Y3QgZHdjM19lcCB7DQo+
ICAjZGVmaW5lIERXQzNfRVBfRk9SQ0VfUkVTVEFSVF9TVFJFQU0JQklUKDkpDQo+ICAjZGVmaW5l
IERXQzNfRVBfRklSU1RfU1RSRUFNX1BSSU1FRAlCSVQoMTApDQo+ICAjZGVmaW5lIERXQzNfRVBf
UEVORElOR19DTEVBUl9TVEFMTAlCSVQoMTEpDQo+ICsjZGVmaW5lIERXQzNfRVBfVFhGSUZPX1JF
U0laRUQJQklUKDEyKQ0KPiAgDQo+ICAJLyogVGhpcyBsYXN0IG9uZSBpcyBzcGVjaWZpYyB0byBF
UDAgKi8NCj4gICNkZWZpbmUgRFdDM19FUDBfRElSX0lOCQlCSVQoMzEpDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0K
PiBpbmRleCA0NTE5ZDA2YzljYTIuLmVkOTdlNDdkMzI2MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy91c2IvZHdjMy9nYWRnZXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+
IEBAIC03MDIsNiArNzAyLDcgQEAgdm9pZCBkd2MzX2dhZGdldF9jbGVhcl90eF9maWZvcyhzdHJ1
Y3QgZHdjMyAqZHdjKQ0KPiAgCQkJCSAgIERXQzMxX0dUWEZJRk9TSVpfVFhGUkFNTlVNOw0KPiAg
DQo+ICAJCWR3YzNfd3JpdGVsKGR3Yy0+cmVncywgRFdDM19HVFhGSUZPU0laKG51bSA+PiAxKSwg
c2l6ZSk7DQo+ICsJCWRlcC0+ZmxhZ3MgJj0gfkRXQzNfRVBfVFhGSUZPX1JFU0laRUQ7DQo+ICAJ
fQ0KPiAgCWR3Yy0+bnVtX2VwX3Jlc2l6ZWQgPSAwOw0KPiAgfQ0KPiBAQCAtNzQ3LDYgKzc0OCwx
MCBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X3Jlc2l6ZV90eF9maWZvcyhzdHJ1Y3QgZHdjM19l
cCAqZGVwKQ0KPiAgCWlmICghdXNiX2VuZHBvaW50X2Rpcl9pbihkZXAtPmVuZHBvaW50LmRlc2Mp
IHx8IGRlcC0+bnVtYmVyIDw9IDEpDQo+ICAJCXJldHVybiAwOw0KPiAgDQo+ICsJLyogYmFpbCBp
ZiBhbHJlYWR5IHJlc2l6ZWQgKi8NCj4gKwlpZiAoZGVwLT5mbGFncyAmIERXQzNfRVBfVFhGSUZP
X1JFU0laRUQpDQo+ICsJCXJldHVybiAwOw0KPiArDQo+ICAJcmFtMV9kZXB0aCA9IERXQzNfUkFN
MV9ERVBUSChkd2MtPmh3cGFyYW1zLmh3cGFyYW1zNyk7DQo+ICANCj4gIAlpZiAoKGRlcC0+ZW5k
cG9pbnQubWF4YnVyc3QgPiAxICYmDQo+IEBAIC04MDcsNiArODEyLDcgQEAgc3RhdGljIGludCBk
d2MzX2dhZGdldF9yZXNpemVfdHhfZmlmb3Moc3RydWN0IGR3YzNfZXAgKmRlcCkNCj4gIAl9DQo+
ICANCj4gIAlkd2MzX3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR1RYRklGT1NJWihkZXAtPm51bWJl
ciA+PiAxKSwgZmlmb19zaXplKTsNCj4gKwlkZXAtPmZsYWdzIHw9IERXQzNfRVBfVFhGSUZPX1JF
U0laRUQ7DQo+ICAJZHdjLT5udW1fZXBfcmVzaXplZCsrOw0KPiAgDQo+ICAJcmV0dXJuIDA7DQo+
IEBAIC05OTUsNyArMTAwMSw3IEBAIHN0YXRpYyBpbnQgX19kd2MzX2dhZGdldF9lcF9kaXNhYmxl
KHN0cnVjdCBkd2MzX2VwICpkZXApDQo+ICANCj4gIAlkZXAtPnN0cmVhbV9jYXBhYmxlID0gZmFs
c2U7DQo+ICAJZGVwLT50eXBlID0gMDsNCj4gLQlkZXAtPmZsYWdzID0gMDsNCj4gKwlkZXAtPmZs
YWdzICY9IERXQzNfRVBfVFhGSUZPX1JFU0laRUQ7DQo+ICANCj4gIAlyZXR1cm4gMDsNCj4gIH0N
Cj4gDQoNClJldmlld2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5j
b20+DQoNClRoYW5rcywNClRoaW5oDQo=
