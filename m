Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F6B4260F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 02:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234268AbhJHAJU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 20:09:20 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:59778 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231335AbhJHAJT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 20:09:19 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C2892C41E7;
        Fri,  8 Oct 2021 00:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1633651645; bh=uCi3DAu/o8m1d9OrOKnEC/fOmPMNLI9hRCqsQX33Geg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=G/A0AVo1SBVrN/9z95W93TuKYI+NrlRN9RfiflzHKaqnxbD8HNPrl9zZMha5Fn6gz
         YGIGh7vmaw66lgWsidRrbJNI+CzPWazX9CYe48dzA3pa3tGdLsW300v7oKncesgS+P
         aYLKBxYmDkNlqB81aUqaEMKGnsFUcZCYKGX5YnlnE/ahxeJDvrHZwH3hx1ON8wX8aG
         vM+42vYC7yJ8mDGlWU+iSxF3RW8gK9jf5u3CdA+mZbozv9w424Dn9muGilAjTVHG4K
         r0UMODP8htbIpNImfLRY0vwRuRXKF+1+6Rv0cjAm9m/T4P7XT/B8/yd1XIQx2E8h5J
         aGkKDIUouy18A==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id B2794A0070;
        Fri,  8 Oct 2021 00:07:23 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B4BBF400C6;
        Fri,  8 Oct 2021 00:07:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="WpOov0UP";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbgDPxkhpQdLkt+vddl9AIdcIXcoEmmWW/BAgncxTXneS2z1xS1qmlAuxK38QIBsonb7qNBQw2NcOo/ieeJCymqPpBE8orTDRr/K2+8o3sY9Muorxb9GnYcuZozryWiuH0+YNv5mEl8olri4hFchXASY9qWyq4h+hC9aiUQ4z1pnphG7yNvWSs5hiJlOjd/udh74GGkOvBv/2C8lncv0on3W0sz8SE3CJigOU5BFjdlqQ/aVl2MUBa7WWmdbd6ApjtJhSbKnBHxKgFnlBfxCJFs9aICTMyp8qJNR/Dr7Jsk2uoB1ydtJiFkP50Sy6vfVZrY/ZSK3TFGl3XcsLb6Bgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCi3DAu/o8m1d9OrOKnEC/fOmPMNLI9hRCqsQX33Geg=;
 b=VovWajHQI2UPUNRU5eBML55Fu/yA0jzDaTk6BP0+RTEawLWBH7WdyonfH4h0JD2r0PFCwjK9Dkz1EgUUmdFyWVt0H7L9G7R5vkqEowhXnUiH/cDuVLiGkdo1jEd04v2IvgdRVEDAs5fIkpHE2oPyATPl/CNoFePwoJQzkEmckGJUcP4ziTyZTYmWNy7G4EKSA/sLnAp3vFtHREf41bGtUXcORppP72W6ly26ghbP9RC0njE+jzJrReqCyet4+C83QQo/zaMqzd8njbRydHi/JGz3zz7ZAcxIMWx4fzHU/XlfcN4PGcwAoTsRj/+aI/sm+LSNd7XdxSA9MCc/FJ2aUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCi3DAu/o8m1d9OrOKnEC/fOmPMNLI9hRCqsQX33Geg=;
 b=WpOov0UPQY1w8B2DK3Z7xs+JlzjBsWT7Bw10sAOjGyQkXLbiagDIS85+ELdTZoFGS8T9nJf6iT9T1Z6OlvsNDIkpMOlODFs0hwVsgddXJXYE9deyRKIS2xKXN/iuDfTHZPb7Vk2GWwzIqt0BxBxA8HGMYJipKiI5ej0rvH2GoOg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB2663.namprd12.prod.outlook.com (2603:10b6:a03:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 00:07:20 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5967:b5df:7ee5:e45b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5967:b5df:7ee5:e45b%6]) with mapi id 15.20.4587.020; Fri, 8 Oct 2021
 00:07:20 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Wesley Cheng <wcheng@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Topic: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Index: AQHXpVUbI6zrZuzuNkasP7SNAwlUbqucd/uAgAGWZYCAABurgIAEpB8AgCWYFoA=
Date:   Fri, 8 Oct 2021 00:07:20 +0000
Message-ID: <56339fa2-e476-0f5b-9625-7016294e6be7@synopsys.com>
References: <20210909083120.15350-1-jackp@codeaurora.org>
 <6a4bb7a9-2c63-5e1e-f4fc-a5bbc7aaa168@synopsys.com>
 <db0664a9-575f-1c6a-2efc-ec8372e2f1d4@codeaurora.org>
 <6538dd76-5dea-1e31-9459-657898be6d8f@synopsys.com>
 <926df659-7e31-9504-9752-a206f1eb8eaf@codeaurora.org>
In-Reply-To: <926df659-7e31-9504-9752-a206f1eb8eaf@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0336e4a-d954-41d8-dfda-08d989ef9900
x-ms-traffictypediagnostic: BYAPR12MB2663:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB26635A27F6422EC800A3E73DAAB29@BYAPR12MB2663.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +lGSD7dIXQ7Ee3QEFgJdXsxqL+uEvbaZokEoD3vfR3L+R38MJgzfj3DlFapCMm0zSzq4qEERTS2Pw8XIOaRHgHlGyNx1dlK4TDG2u0W3TZ3NBAsP+wDwGE82Qnk3T+DTz7vYR9uWvJTMR3YBDRXudMujXWINX2865gNd3QRXW90yA4XlBSeB7EHQg/OQtBIRdJvPbH5dXDDLx5nqUUwZhuBa8amcL9tTrNZHwg+7aUgzAyQrs49wCAOvfWDr3CX+sUecusfacfdo6vCVDwsgsE5Pa3+0NzVcrsgmbfH0JaeT+0x2EtZCqWvePmLXBcQrjsrkEoFkcPeVncOEd2i1QQlMoLDqPqTjcxCsG/Mzcp5f4K/5fkD7Qu2AhvmxXhfeKCue7smB5TChJoqa6Gn35gwikah5YzYiDBkf5Zl5lZ3a5TixPe06jWz9zPa038RHqODKU5DTyRO458GrhdPfN5LtXJMpDCXmpb0nSVPxDOpL7BLjKmzxPy04YBS/aMKVEHwsrxCrFgdGtqzgDBmAMdEaNO30Xm5AHBeVOSfMVq4I/8k0okIwvsd7+0f4P3vtp8dMyR0qZF3f1x6symuZWJfWOxS9b0NY6FTG58BLxRWUSVziMJFGvMV8G0SZz94+UuT5oteV+7Im7axAVq8GEkhMcmpM8XH2cG52uKDK6/urQLWXgHO7sJHnt3DTNJuAeG++x6z3W+In5NN6cn4wIAwQG9/OZFyVg0xEA3mgJV9nHCRmOMyrMsZUvJNw/hTmYSj/FKaLsz03raFlsbtMSQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(64756008)(66446008)(316002)(66476007)(66946007)(66556008)(76116006)(110136005)(6512007)(31686004)(54906003)(36756003)(8676002)(6486002)(8936002)(2616005)(186003)(86362001)(26005)(5660300002)(2906002)(31696002)(71200400001)(4326008)(83380400001)(53546011)(38070700005)(122000001)(6506007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0ZGT0FqOXhIWnd6YkFkVEtzVWh6RVcxbWRZZGpTT2xRdlpRZGppMW1MUVU5?=
 =?utf-8?B?Rmh3c0xzMmlxME1EVUpsNGQ0d1VrT3RSQnFRY2FHL01UMFZYeEw1S2srK3dr?=
 =?utf-8?B?TEJua2pFbkN5U2NtTVZaZXR6UzUxUnNiYWZGbmlvQmxUbTFlS1JCTlpZVzUz?=
 =?utf-8?B?SnEwMWpZbkNwMmJiNWtKNDdzb1NSV0wxcUIvRlA0dTRzQmJiWk10eFZWTWhN?=
 =?utf-8?B?bDQ4L0QzdUVmL29hQWZKRS9XK3ZUcStsVTlZTVJRaUN1emJVYlFiNE1iNHdZ?=
 =?utf-8?B?dU5tS0FiYWJ5WjB5eUl3dmRuaFFXcitTK0oyM0gweVJtdG9ybzBZNDZkRmZE?=
 =?utf-8?B?M3Fhajh4YkZQc25RbGd1eXRNN3lxMHVnbVduWEw2ZkVrM1E2aURidVNWWkhK?=
 =?utf-8?B?T1lGTzcvNXZpeHZhQjlsbTUrTmxWcEx1K0Fjd084a2JtWDFUenZ2NCszVmFo?=
 =?utf-8?B?UDJQUzd1QzUwSjkwRTlJa0s2RngrZVhtNTNCSHQ0UW1PRmZwaWRHYUtqS3Ay?=
 =?utf-8?B?d1V5ejV3ZVBNaGZQLzhNNGcxQnpEdzdPTDNweG5FaVdxd2tzb2dzVTYrQmJ4?=
 =?utf-8?B?SjVxK29sU3djcENYV3A4aDdrL3lRVnlnK2lzUFQ1TGlZUEVFbHI4eDhxZjlO?=
 =?utf-8?B?SGN3ZENhQUw1Z1drUzNjbkpnYkZXbm4wc044TFUycm0wcURNem92NmRra1Ev?=
 =?utf-8?B?NHprdW1USnZMOVp1SXBmMjFuMitqbFM1MmV0ZkxaWXhGd3lGQ0JrYlRnR3lF?=
 =?utf-8?B?UENta3ZUU1RCL3dYcXBMQnZWR2hlVjZkQ1J1eTJ3Vng5UXB5T3hJc0YzUnh0?=
 =?utf-8?B?V0g0MUlaZzFTNnllWG1PbDlTQms2R1FwYTNEMW94bFFIRFdMR25yMWx2SmRG?=
 =?utf-8?B?ZmgwS0wzbGtkTStIbGNCeTM0eU43MEhpcm5aMXVDazFXQ0hUa1dyczBYc3hJ?=
 =?utf-8?B?TWxob3FGaDVsa0N5SDEvVlhORUszWWNmQUd0bnpRUEtQZENQVkJGSGpXam4r?=
 =?utf-8?B?TlpqSklDWGEvTjFCT1ZodGthd0k0OERwYkxsZUtxTzNsbzdGZEhpTS9OOTNh?=
 =?utf-8?B?am5VZDA0ek9aNWZxbFUzQUliMUwwMEJETEdVUGQ4K1VRSjRCMDlCQ2FNakYx?=
 =?utf-8?B?UEQ1QXgzTThlUUVzMzdiZmV4L21IYUZCNkdDcnMwMUNwUngxa2tqaEc1VVkw?=
 =?utf-8?B?TXVPdnB1L0plQkExVVkwRUwyeWs0SHVVbGFhS3MxSUxyeWJUQ1pBbWJTUVNN?=
 =?utf-8?B?aUtVWFR3dFh0M0Y2UGJTRjF4NXJET0ZNeXpZN2VYNGdCMGRBZzJ5RGd5MkpO?=
 =?utf-8?B?K0V6MGQ3UCszNzkwYmR6MlVYUnNucTl5N0U3R2NFWkl2MmdlbFlnbmV3R1RN?=
 =?utf-8?B?NmZzUyttelBiRjg4Q1JjUjhvSDZSZHlkVm9MenVTNFdPN0FDYXlPMHlUcUtU?=
 =?utf-8?B?clBLN25VUWhYRldRcGg2d2d4SjBSUElMSGhtWTF5KytRYUxUY2JraTFibElV?=
 =?utf-8?B?cTViL3ZBRjA0eGsyeXFYQTlJUkp4NkVmTURPOTNReHVCelJ1eHpZS2xrZG51?=
 =?utf-8?B?VXBzYjZ1VWtDSk9BSkh0N3NxcjlyRFJSdTBUTERydnpmK25hRkFPcHJPMkdy?=
 =?utf-8?B?N21uRmtsL1hsRmpqcmJVbkZaT1dKUmdnMDhkUTgxZzVlSndOcTkvQWdrWFVX?=
 =?utf-8?B?MTNtQlB6U1A2T0d0Z0lEQkE1L2NxK1d2a3ZxVFJCTVRRZHRIQWszR1FJYVNv?=
 =?utf-8?Q?trUkRdGWrWMkWXjJoQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9FF2004F25FB647981DD33CF7398A14@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0336e4a-d954-41d8-dfda-08d989ef9900
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 00:07:20.5556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HtHUkbt/Bj1/H9v2dkUcX1mF66XnoyLlqeYk79t6FEcREQHv6BjHwsUPggPoy27EClHypZVfzGHqkufDofRNkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2663
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V2VzbGV5IENoZW5nIHdyb3RlOg0KPiANCj4gDQo+IE9uIDkvMTAvMjAyMSA4OjA4IFBNLCBUaGlu
aCBOZ3V5ZW4gd3JvdGU6DQo+PiBXZXNsZXkgQ2hlbmcgd3JvdGU6DQo+Pj4NCj4+Pg0KPj4+IE9u
IDkvOS8yMDIxIDY6MTUgUE0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+Pj4gSmFjayBQaGFtIHdy
b3RlOg0KPj4+Pj4gU29tZSBmdW5jdGlvbnMgbWF5IGR5bmFtaWNhbGx5IGVuYWJsZSBhbmQgZGlz
YWJsZSB0aGVpciBlbmRwb2ludHMNCj4+Pj4+IHJlZ3VsYXJseSB0aHJvdWdob3V0IHRoZWlyIG9w
ZXJhdGlvbiwgcGFydGljdWxhcmx5IHdoZW4gU2V0IEludGVyZmFjZQ0KPj4+Pj4gaXMgZW1wbG95
ZWQgdG8gc3dpdGNoIGJldHdlZW4gQWx0ZXJuYXRlIFNldHRpbmdzLiAgRm9yIGluc3RhbmNlIHRo
ZQ0KPj4+Pj4gVUFDMiBmdW5jdGlvbiBoYXMgaXRzIHJlc3BlY3RpdmUgZW5kcG9pbnRzIGZvciBw
bGF5YmFjayAmIGNhcHR1cmUNCj4+Pj4+IGFzc29jaWF0ZWQgd2l0aCBBbHRTZXR0aW5nIDEsIGlu
IHdoaWNoIGNhc2UgdGhvc2UgZW5kcG9pbnRzIHdvdWxkIG5vdA0KPj4+Pj4gZ2V0IGVuYWJsZWQg
dW50aWwgdGhlIGhvc3QgYWN0aXZhdGVzIHRoZSBBbHRTZXR0aW5nLiAgQW5kIHRoZXkNCj4+Pj4+
IGNvbnZlcnNlbHkgYmVjb21lIGRpc2FibGVkIHdoZW4gdGhlIGludGVyZmFjZXMnIEFsdFNldHRp
bmcgMCBpcw0KPj4+Pj4gY2hvc2VuLg0KPj4+Pj4NCj4+Pj4+IFdpdGggdGhlIERXQzMgRklGTyBy
ZXNpemluZyBhbGdvcml0aG0gcmVjZW50bHkgYWRkZWQsIGV2ZXJ5DQo+Pj4+PiB1c2JfZXBfZW5h
YmxlKCkgY2FsbCByZXN1bHRzIGluIGEgY2FsbCB0byByZXNpemUgdGhhdCBFUCdzIFRYRklGTywN
Cj4+Pj4+IGJ1dCBpZiB0aGUgc2FtZSBlbmRwb2ludCBpcyBlbmFibGVkIGFnYWluIGFuZCBhZ2Fp
biwgdGhpcyBpbmNvcnJlY3RseQ0KPj4+Pj4gbGVhZHMgdG8gRklGTyBSQU0gYWxsb2NhdGlvbiBl
eGhhdXN0aW9uIGFzIHRoZSBtZWNoYW5pc20gZGlkIG5vdA0KPj4+Pj4gYWNjb3VudCBmb3IgdGhl
IHBvc3NpYmlsaXR5IHRoYXQgZW5kcG9pbnRzIGNhbiBiZSByZS1lbmFibGVkIG1hbnkNCj4+Pj4+
IHRpbWVzLg0KPj4+Pj4NCj4+Pj4+IEV4YW1wbGUgbG9nIHNwbGF0Og0KPj4+Pj4NCj4+Pj4+IAlk
d2MzIGE2MDAwMDAuZHdjMzogRmlmb3NpemUoMzcxNykgPiBSQU0gc2l6ZSgzNDYyKSBlcDNpbiBk
ZXB0aDoyMTc5NzMxMjcNCj4+Pj4+IAljb25maWdmcy1nYWRnZXQgZ2FkZ2V0OiB1X2F1ZGlvX3N0
YXJ0X2NhcHR1cmU6NTIxIEVycm9yIQ0KPj4+Pj4gCWR3YzMgYTYwMDAwMC5kd2MzOiByZXF1ZXN0
IDAwMDAwMDAwMGJlMTNlMTggd2FzIG5vdCBxdWV1ZWQgdG8gZXAzaW4NCj4+Pj4+DQo+Pj4+PiBU
aGlzIGlzIGVhc2lseSBmaXhlZCBieSBiYWlsaW5nIG91dCBvZiBkd2MzX2dhZGdldF9yZXNpemVf
dHhfZmlmb3MoKQ0KPj4+Pj4gaWYgYW4gZW5kcG9pbnQgaXMgYWxyZWFkeSByZXNpemVkLCBhdm9p
ZGluZyB0aGUgY2FsY3VsYXRpb24gZXJyb3INCj4+Pj4+IHJlc3VsdGluZyBmcm9tIGFjY3VtdWxh
dGluZyB0aGUgRVAncyBGSUZPIGRlcHRoIHJlcGVhdGVkbHkuDQo+Pj4+Pg0KPj4+Pj4gRml4ZXM6
IDlmNjA3YTMwOWZiZTkgKCJ1c2I6IGR3YzM6IFJlc2l6ZSBUWCBGSUZPcyB0byBtZWV0IEVQIGJ1
cnN0aW5nIHJlcXVpcmVtZW50cyIpDQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYWNrIFBoYW0gPGph
Y2twQGNvZGVhdXJvcmEub3JnPg0KPj4+Pj4gLS0tDQo+Pj4+PiAgZHJpdmVycy91c2IvZHdjMy9n
YWRnZXQuYyB8IDQgKysrKw0KPj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykN
Cj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+Pj4+IGluZGV4IDgwNGI1MDU0ODE2My4uYzY0N2M3
NmQ3MzYxIDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4+
Pj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4+Pj4gQEAgLTc0Nyw2ICs3NDcs
MTAgQEAgc3RhdGljIGludCBkd2MzX2dhZGdldF9yZXNpemVfdHhfZmlmb3Moc3RydWN0IGR3YzNf
ZXAgKmRlcCkNCj4+Pj4+ICAJaWYgKCF1c2JfZW5kcG9pbnRfZGlyX2luKGRlcC0+ZW5kcG9pbnQu
ZGVzYykgfHwgZGVwLT5udW1iZXIgPD0gMSkNCj4+Pj4+ICAJCXJldHVybiAwOw0KPj4+Pj4gIA0K
Pj4+Pj4gKwkvKiBiYWlsIGlmIGFscmVhZHkgcmVzaXplZCAqLw0KPj4+Pj4gKwlpZiAoZHdjM19y
ZWFkbChkd2MtPnJlZ3MsIERXQzNfR1RYRklGT1NJWihkZXAtPm51bWJlciA+PiAxKSkpDQo+Pj4+
PiArCQlyZXR1cm4gMDsNCj4+Pj4+ICsNCj4+Pj4+ICAJcmFtMV9kZXB0aCA9IERXQzNfUkFNMV9E
RVBUSChkd2MtPmh3cGFyYW1zLmh3cGFyYW1zNyk7DQo+Pj4+PiAgDQo+Pj4+PiAgCWlmICgoZGVw
LT5lbmRwb2ludC5tYXhidXJzdCA+IDEgJiYNCj4+Pj4+DQo+Pj4NCj4+PiBIaSBUaGluaCwNCj4+
Pg0KPj4+Pg0KPj4+PiBUaGlzIHNlZW1zIGxpa2UgYSB3b3JrYXJvdW5kIG1vcmUgdGhhbiBhIGZp
eC4gQXMgcHJldmlvdXNseSBwb2ludGVkIG91dCwNCj4+Pj4gdGhlcmUgd2lsbCBiZSBwcm9ibGVt
cyB3aGVuIHRoZXJlIGFyZSBtdWx0aXBsZSBhbHRlcm5hdGUgc2V0dGluZw0KPj4+PiBpbnRlcmZh
Y2UgWzJdLiBJZiB3ZSdyZSBkb2luZyB0aGlzIHdheSwgYXJlIHdlIHByb3Blcmx5IGFsbG9jYXRp
bmcgdGhlDQo+Pj4+IGZpZm8gc2l6ZSBmb3IgdGhlIGFsdGVybmF0ZSBzZXR0aW5nIHRoYXQgcmVx
dWlyZXMgdGhlIG1vc3QgZmlmbyBzaXplIGFuZA0KPj4+PiBub3QganVzdCB0aGUgZmlyc3QgYWx0
LXNldHRpbmcgMD8gQWxzbyBkaWZmZXJlbnQgYWx0LXNldHRpbmcgY2FuIGhhdmUNCj4+Pg0KPj4+
IEVhY2ggYWx0IGludGVyZmFjZSB3aWxsIGNhbGwgdXNiX2VwX2F1dG9jb25maWcoKSB3aGljaCBz
aG91bGQgYmUNCj4+PiBhc3NpZ25lZCBkaWZmZXJlbnQgZW5kcG9pbnQgbnVtYmVycy4gIFRoaXMg
d291bGQgbWVhbiB0aGF0IGlmIGFsdCBpbnRmIzANCj4+PiBnZXRzIHNlbGVjdGVkLCBhbmQgRVAg
aXMgZW5hYmxlZCwgdGhlbiB3ZSB3aWxsIHJlc2l6ZSB0aGUgVFhGSUZPIGFuZCBtYXANCj4+PiB0
aGF0IEZJRk8gdG8gdGhlIHBoeXNpY2FsIEVQLiAgVGhlbiB3aGVuL2lmIHRoZSBob3N0IHJlcXVl
c3RzIHRoZSBvdGhlcg0KPj4+IGFsdCBpbnRmIzEsIGFuZCB0aGF0IGNhbGxzIEVQIGVuYWJsZSwg
dGhlbiB0aGUgbG9naWMgd2lsbCB0aGVuIGF0dGVtcHQNCj4+PiB0byByZXNpemUgYmFzZWQgb24g
dGhlIHBhcmFtZXRlcnMsIGFuZCBhZ2FpbiBtYXAgdGhhdCBGSUZPIHRvIHRoZQ0KPj4+IHBoeXNp
Y2FsIEVQLiAoc2luY2Ugd2UgY2FsbCBhdXRvY29uZmlnIG9uIGFsbCBpbnRlcmZhY2VzLCB0aGV5
IHNob3VsZCBiZQ0KPj4+IGFzc2lnbmVkIGRpZmZlcmVudCBlbmRwb2ludHMpDQo+IA0KPiBIaSBU
aGluaCwNCj4gDQo+Pg0KPj4gVGhhdCdzIG5vdCB0cnVlLiBEaWZmZXJlbnQgYWx0LXNldHRpbmdz
IG9mIGFuIGludGVyZmFjZSBjYW4gc2hhcmUNCj4+IGVuZHBvaW50IG51bWJlcnMuIFRoaXMgaXMg
b2Z0ZW4gdGhlIGNhc2UgZm9yIFVBU1AgZHJpdmVyIHdoZXJlDQo+PiBhbHQtc2V0dGluZyAwIGlz
IGZvciBCT1QgcHJvdG9jb2wgYW5kIGFsdC1zZXR0aW5nIDEgaXMgVUFTUC4gV2hlbiB3ZQ0KPj4g
c3dpdGNoIGFsdC1zZXR0aW5nLCB3ZSBkaXNhYmxlIHRoZSBjdXJyZW50IGVuZHBvaW50cyBhbmQg
ZW5hYmxlIHRoZQ0KPj4gb2xkL25ldyBvbmVzLg0KPj4NCj4gDQo+IFRoYW5rcyBmb3IgcG9pbnRp
bmcgdGhhdCB1c2UgY2FzZSBvdXQuICBNYXliZSB3ZSBjYW4gY29uc2lkZXIgc2VlaW5nIGlmDQo+
IHdlIGNhbiB3YWxrIHRocm91Z2ggYWxsIGFsdGVybmF0ZSBpbnRlcmZhY2VzIGZvciBhIHBhcnRp
Y3VsYXIgZnVuY3Rpb24sDQo+IGFuZCByZXNpemUgZm9yIHRoZSBsYXJnZXN0IHNldHRpbmc/ICBU
aGF0IG1pZ2h0IGJlIGEgcG9zc2libGUNCj4gaW1wcm92ZW1lbnQgbWFkZSB0byB0aGUgY2hlY2tf
Y29uZmlnKCkgZnVuY3Rpb24uICBMZXQgbWUgc3RhcnQgbWFraWduDQo+IHRoZSBjaGFuZ2VzIGZv
ciB0aGlzIGFuZCB2ZXJpZnlpbmcgaXQuDQo+IA0KDQpUaGFua3MhDQoNCkN1cnJlbnRseSB0aGUg
Z2FkZ2V0IGNvbmZpZ3VyZXMgZWFybHkgYW5kIGluZm9ybXMgdGhlIGdhZGdldCBkcml2ZXIgb2YN
CmhvdyBtYW55IGVuZHBvaW50cyBhcmUgYXZhaWxhYmxlLCB3aGljaCBkb2Vzbid0IGxlYXZlIG11
Y2ggcm9vbSBmb3IgdGhlDQpnYWRnZXQgdG8gZG8gb3B0aW1pemF0aW9uL3JlY29uZmlndXJhdGlv
bi4NCg0KSWYgdGhlcmUncyBhbiBvcHRpb24gZm9yIHRoZSBjb21wb3NpdGUgbGF5ZXIgdG8gaW5m
b3JtIHRoZSBjb250cm9sbGVyDQpkcml2ZXIgb2YgdGhlIGVudGlyZSBjb25maWd1cmF0aW9uLCB0
aGVuIHdlIGNhbiB0YWtlIGFkdmFudGFnZSBvZiBtb3JlDQpkd2MzIGNvbnRyb2xsZXIgY2FwYWJp
bGl0eS9mbGV4aWJpbGl0eSAobm90IGp1c3QgcmVzaXppbmcgdHhmaWZvKS4NCg0KPj4+DQo+Pj4g
SSBhZ3JlZSB0aGF0IHRoZXJlIGlzIGN1cnJlbnRseSBhIGxpbWl0YXRpb24gYmVjYXVzZSB3ZSBh
cmUgZ29pbmcgdG8NCj4+PiByZXNlcnZlIGF0IG1pbmltdW0gMSBGSUZPIGZvciBCT1RIIGFsdCBp
bnRlcmZhY2VzLCBldmVuIHRob3VnaCB0aGVyZSBpcw0KPj4+IG9ubHkgMSBpbnRlcmZhY2UgYWN0
aXZlIGF0IGEgdGltZS4gIFRoZSBtaXNzaW5nIGxvZ2ljIHRoYXQgd2UgbWlnaHQgYmUNCj4+PiBt
aXNzaW5nIGlzIHNlZWluZyBob3cgd2UgY2FuIHJlLXB1cnBvc2UgdGhlIEZJRk8gdGhhdCBpcyBi
ZWluZyBkaXNhYmxlZC4NCj4+PiAgSG93ZXZlciwgSSB0aGluayBKYWNrJ3MgZml4IGhlcmUgd291
bGQgYmUgYXBwbGljYWJsZSB0byB0aGUgaW1wcm92ZW1lbnQNCj4+PiBpbiBsb2dpYyB0byByZS11
c2UvcmUtYXNzaWduIEZJRk8gc3BhY2UgYWxsb2NhdGVkIGJ5IGRpc2FibGVkIEVQcyBhbHNvLg0K
Pj4+DQo+Pg0KPj4gSW1wcm92ZW1lbnQgaXMgYWx3YXlzIGdyZWF0LiBJIGp1c3QgaG9wZSB3ZSBk
b24ndCBqdXN0IHN0b3Agd2hlcmUgd2UgYXJlDQo+PiBub3cuIFNpbmNlIHlvdSdyZSB3b3JraW5n
IG9uIHRoaXMgZmVhdHVyZSBhdCB0aGUgbW9tZW50LCBpdCB3b3VsZCBiZQ0KPj4gZ29vZCB0byBh
bHNvIHJlc29sdmUgc29tZSBvZiB0aGUgb3V0c3RhbmRpbmcgaXNzdWVzIGFzIEphY2sncyBmaXgg
c2VlbXMNCj4+IHRvIGJlIGluY29tcGxldGUuDQo+Pg0KPiANCj4gSWYgd2UgaW1wbGVtZW50IHRo
ZSBpbXByb3ZlbWVudCBtZW50aW9uZWQgYWJvdmUsIEkgdGhpbmsgSmFjaydzIGZpeCB3aWxsDQo+
IGJlIGFwcGxpY2FibGUgdGhlcmUgYXMgd2VsbC4gIElmIHdlIHJlc2l6ZSBmb3IgdGhlIGxhcmdl
c3QgYWx0ZXJuYXRlDQo+IGludGVyZmFjZSwgdGhlbiB0aGVyZSB3b3VsZCBiZSBubyByZWFzb24g
Zm9yIHVzIHRvIHJlc2l6ZSBhZ2Fpbi4NCj4gDQpBcyBsb25nIGFzIHlvdSBoYXZlIHRoZSBhYm92
ZSBhcyBwYXJ0IG9mIHlvdXIgcm9hZG1hcCwgSSBkb24ndCBtaW5kDQpKYWNrJ3MgZml4IGZvciBu
b3cuIERlcGVuZHMgb24geW91ciBpbXBsZW1lbnRhdGlvbiwgSmFjaydzIGZpeCBtYXkgbm90DQpi
ZSBhcHBsaWNhYmxlLiBSZWdhcmRsZXNzLCB1bHRpbWF0ZWx5IGl0J3MgdXAgdG8gRmVsaXBlLiA6
KQ0KDQo+Pj4+IGRpZmZlcmVudCBlbmRwb2ludHMsIHRoZSBsb2dpYyBoYW5kbGluZyB0aGlzIG1h
eSBub3QgYmUgc2ltcGxlLg0KPj4+Pg0KPj4+PiBUaGVyZSBhcmUgYSBmZXcgcmV2aWV3IGNvbW1l
bnRzIGZvciBXZXNsZXkuIEhvcGVmdWxseSB0aGV5IGdldCByZXNvbHZlZA0KPj4+PiBldmVudHVh
bGx5Lg0KPj4+DQo+Pj4gQXMgbWVudGlvbmVkIGFib3ZlLCB0aGVyZSBpcyBhIGxvdCBvZiBjb25z
aWRlcmF0aW9ucyB3ZSBuZWVkIHRvIG1ha2UNCj4+PiB3aGVuIGxvb2tpbmcgYXQgdGhlIGFtb3Vu
dCBvZiBjb21iaW5hdGlvbnMgdGhhdCBjYW4gYmUgZG9uZSBmb3IgYSBVU0INCj4+PiBjb25maWd1
cmF0aW9uLiAgV2Ugb2J2aW91c2x5IHdhbnQgdG8gc2VlIGlmIHdlIGNhbiBmaW5kIGEgd2F5IHRv
DQo+Pj4gcmUtYWxsb2NhdGUgRklGTyBzcGFjZSwgYnV0IGl0IGdldHMgY29tcGxpY2F0ZWQgaWYg
d2UgcnVuIGludG8gYQ0KPj4+ICJmcmFnbWVudGVkIiBzaXR1YXRpb24gd2hlcmUgdGhlIFJBTSBh
c3NvY2lhdGVkIHRvIHRoZSBFUCBiZWluZw0KPj4+IHJlLWFsbG9jYXRlZCBpcyBpbiBiZXR3ZWVu
IDIgdGhhdCBhcmUgYWN0aXZlLg0KPj4+DQo+Pg0KPj4gSSdkIGxpa2UgdG8gaGF2ZSB0aGlzIGZl
YXR1cmUgYWRkZWQsIGFuZCBpdCB3b3VsZCBiZSBncmVhdCBpZiBpdCBjYW4NCj4+IG92ZXJjb21l
IHNvbWUgb2YgdGhlIGN1cnJlbnQgbGltaXRhdGlvbnMuIEF0IHRoZSBtb21lbnQsIGlmIHRoaXMg
ZmVhdHVyZQ0KPj4gaXMgZW5hYmxlZCwgaXQgbWF5IGltcHJvdmUgc29tZSBhcHBsaWNhdGlvbnMs
IGJ1dCBpdCBtYXkgYWxzbyBjYXVzZQ0KPj4gcmVncmVzc2lvbiBmb3Igc29tZS4gQXMgSSBub3Rl
ZCwgdGhlIGZpeCBtYXkgbm90IGJlIHNpbXBsZSwgYnV0IEkgaG9wZQ0KPj4gdGhpcyBmZWF0dXJl
IGNhbiB3b3JrIGZvciB2YXJpb3VzIGFwcGxpY2F0aW9ucyBhbmQgbm90IGp1c3QgYSBsaW1pdGVk
IGZldy4NCj4+DQo+IA0KPiBBZ3JlZWQsIHRoZXJlIGFyZSBzb21lIHVzZSBjYXNlcyB0aGF0IHdl
IG1heSBub3QgY29uc2lkZXIgaW4gb3VyDQo+IHBsYXRmb3JtLCBzbyBJIGFwcHJlY2lhdGUgdGhl
IGlucHV0Lg0KPiANCg0KKFNvcnJ5IGZvciB0aGUgZGVsYXkgcmVzcG9uc2UuIEkgd2FzIG9uIHZh
Y2F0aW9uLikNCg0KQlIsDQpUaGluaA0K
