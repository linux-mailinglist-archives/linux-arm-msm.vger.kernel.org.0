Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E1643428C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 02:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhJTA34 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 20:29:56 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:40686 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229627AbhJTA34 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 20:29:56 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 815AFC4508;
        Wed, 20 Oct 2021 00:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1634689662; bh=oumeysWyvSZThT2/Q9pdSngSgeeZ3/9uGZfOG7H86fE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=gj+jmJ7LQQ1oasA9AZMVVmEVhv3Hby63NwkK9jLxAopI5QGglFAr8DZaGTjJeDF+/
         J8/+1mYGAJ+3bpnB12IIn29gKsvHUSyfXyFRVwFEuLXa+qKvce/thsPNvFKpiP56x4
         jf1WXq+wEaXnvm5pXRkCTtJiM0frBZLThW5YkrjYw+yeq6OZdQvQA4mXCVWIw6KguV
         pUIJKEVbCsprGKoZAJGymZJ8cOB0VhNJ1B24GPGPgJmvrTCsTB3TJRgVlgiZBJELRo
         h8lZzFelRAgPAl41+EQHKwmizkVYt4cq8lpFzj9izga1XMknVOws8kSuOpqvya2kTn
         QpQ4ukihg1vPQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 02715A005C;
        Wed, 20 Oct 2021 00:27:41 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 73D8340143;
        Wed, 20 Oct 2021 00:27:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="tocZRJg2";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/jEGs8vc5lBxitjVXWXFAg0rrnWQV0A8sNlNk5ctMrXXUxi36+ePyfaCvNtzF28fO5d73E0Maf+Aut1cmANhVKqukJDFaZ5d0xEbQ+nZl1UHQplX0oh87Wa0JFAeG4cMUnDIAjmIEgcDxPSWGV83S8NSx/NL2huuX4muc7mRzlIlbThbat0P+tdSnEErxQMVhKp4keph4ftxr14J3DhDe8rKNqVFLLa57wiVRRjL3VI81iDibOX25wO/9L0F1z8l1r0xb1y9hW8VJiiG1rBiOKHMcRnyRJfJwIHTiqp5bb9Gg8ZRjiBGifF23Ko+m/0b1UemdmHSxrT17qUqGqppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oumeysWyvSZThT2/Q9pdSngSgeeZ3/9uGZfOG7H86fE=;
 b=muyR7gvlsbisoFnX9c2LHGB7FZ/NG/w+A5Q+RneAYuA42TdnhyzLmLXk1bYZ5qfw2QkNS4TH9DOqmQzY66FivXUWnQW8eNsV+swA8p/yQx2aTUIP8yrsR1sWSRnf3Y3wTxss6q4nDtKEwztwhmKutySVKDhrOIHSOLhkFTih+zfBIOBfTr/iOiK+G/ei8kr4zZW9DasMFc5a4/p+gOQ5iU1cZ4gfmrQkObawa0WEA71Fh+egRRJkwJR1GA1n0HjQ+WKWS6WkS60j5PBTzvk0BqnsteDCGEyQo+44Hfp2oB9WmUEBABKV5PwVIcggZT2OJ2gSFft5ZUMMuGqytOLdUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oumeysWyvSZThT2/Q9pdSngSgeeZ3/9uGZfOG7H86fE=;
 b=tocZRJg296+YNzdG9LfBoVaBRBnk0/3H0tPgPu+nGCOnzVsaYFthYSvVPamiEl6N5RuwCp8+bR+FC4MUla8tg1rnUbNqX+T5S6V1MUjuvumw2d96swVrFFKDioanvqTx5hxRifz+nT3g+w6bZU9CXN9KT7lcv7lgrFX2Od8zgWs=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB2664.namprd12.prod.outlook.com (2603:10b6:a03:69::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Wed, 20 Oct
 2021 00:27:39 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5865:4cfa:3e30:26d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5865:4cfa:3e30:26d6%7]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 00:27:39 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Topic: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Index: AQHXpVUbI6zrZuzuNkasP7SNAwlUbqucd/uAgAGWZYCAABurgIAEpB8AgCWYFoCACwyIgIABaFuAgAO90QCAAUEugIAAMmEAgAE7ZAA=
Date:   Wed, 20 Oct 2021 00:27:38 +0000
Message-ID: <539dca19-c900-e13e-5af1-a06a53901fb5@synopsys.com>
References: <20210909083120.15350-1-jackp@codeaurora.org>
 <6a4bb7a9-2c63-5e1e-f4fc-a5bbc7aaa168@synopsys.com>
 <db0664a9-575f-1c6a-2efc-ec8372e2f1d4@codeaurora.org>
 <6538dd76-5dea-1e31-9459-657898be6d8f@synopsys.com>
 <926df659-7e31-9504-9752-a206f1eb8eaf@codeaurora.org>
 <56339fa2-e476-0f5b-9625-7016294e6be7@synopsys.com>
 <20211015005101.GA16586@jackp-linux.qualcomm.com>
 <9ecf98e9-0700-3a38-d056-5479f5188f4c@synopsys.com>
 <20211018072856.GB16586@jackp-linux.qualcomm.com>
 <205c4af2-37dd-6dbf-12ab-5111fadab530@synopsys.com>
 <20211019053848.GC16586@jackp-linux.qualcomm.com>
In-Reply-To: <20211019053848.GC16586@jackp-linux.qualcomm.com>
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
x-ms-office365-filtering-correlation-id: b7fa6588-7a56-4789-b8e2-08d993606c32
x-ms-traffictypediagnostic: BYAPR12MB2664:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2664A93A75248A54349CCD94AABE9@BYAPR12MB2664.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KzKY2k2HVBXleoY8U00X26hx+ZvFqUUOQOE6dkk6dlatBQ+rNwe/IHKAH/OSkLYsda3aqWqAqlUwjLTc7KMPrFomFFMmdL7XSmv9AQu6lEIHOASvDxDJ92HnTDYtY7P5PREiJZzZ5cLAGZ6+wwkV8sFAMxtFirBu8MJVIY1ujI5lMoSp9q1thVvl0kZAiXMi0IekdlQjb//UXf6lP4uOY/cs/B1YHN8vxWM5/vfRy52MyhBZs8IxGwrujeK1Xz/FVGCNHA868L5mjYYNo2JG0oamZDSw45etaFWKW5GfDmDyV9VPdI2lv16POlTilUS+quQUnE/+Hx4GEwQHUnC1PCBVffFzPcjO56xnP5Ts3HssGcvGqFex+BpKbiR/cac35EPRYvpt4WV8IdR+zqG3+Pmgcx5Hqb4CKGr54wd5CCUAPGEOL6pnyMijfotEH/uajYyt/H17t7uG9cSGEOq+vI1q+BYi0XMHhvtA96I/y79l2ZfEnWL4cfl2zGiGd9CPduJPZcZffDZyeF1XvbRoltjhDLo9cAoxzkRMGm1yNGVgYRZP/wg7pWzvXtYUkmxeUpVZphtrl1irZFaAsWCi8lr2cVKGmASfbKoqD81vZ/d/QDb/zfq0IEFRD7kBODhcE4Jy5D/9egPvO1aCFtIMz1TjOD19SO7UBUXQtYQkwgwn3mLSgcyx+kCpFAQwZp9MnMbzKXScKwVMtVjd9xcreBh//aCAV27LSiA6NCa1csUayIJLY4hvrmkk3HDYpwkl/rmrzoNt0+eZ3ghTGBQtgg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(6486002)(5660300002)(2616005)(2906002)(66476007)(66446008)(4326008)(186003)(38070700005)(26005)(6506007)(110136005)(54906003)(8936002)(508600001)(66556008)(64756008)(76116006)(71200400001)(6512007)(8676002)(38100700002)(36756003)(31696002)(31686004)(83380400001)(122000001)(86362001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWJPdDNxVWFYSzBTQzBJV2NKcVdtRXZWcnVhNzdMV2M4eHd2RjR5d3JRWlJo?=
 =?utf-8?B?SlFWc3F5RG9CUVU1eWZudSs5ODdRNzNxc0JkODM1aEVkcWpIV05VT29rcEdQ?=
 =?utf-8?B?c0ZCSTQyVjVGdERYWnBFS0RRUHZaKzFHT1VmcFc3UlFBUnNIK2ZMRzRNWGJM?=
 =?utf-8?B?WTJqUkxqSysyeXpJNzZ4a2IxSFFIR080NVFHN3hWSTBzbG5IcXM1TktrVHJ6?=
 =?utf-8?B?aW13azBQTjFlWHljZzNGcXAvUHNESzNNM3pEZ291c3Q3anJvWHVoRU01OStN?=
 =?utf-8?B?cFpmZFFqN0RHMnR5UXl6WTk0dG1PeW56eWNXcisyTC8vbVUyYVd4bmYrVnBF?=
 =?utf-8?B?UlV6Z2FIakhUVHBBa0x6a0FjU2o1L3lWRkx4N2hNTElNaEMvUEQ1U29NeHpJ?=
 =?utf-8?B?RFpORkNmdmIzRzFSbGw4ckE3Y0pCaUFVbmNiaGFqV1VKbGlKb3FXWnZBbk5m?=
 =?utf-8?B?M3N3SnhPRy9CUzQ0aGtyemZKaFB3NFFLMS8wekIwSEk3ak93WGY0bER3LzZn?=
 =?utf-8?B?UEhpaS83MnU1aTdlQ2FEMWM0K3luVUJ0MWE0b2toS0t5NlhDUFo1TE1tWmYw?=
 =?utf-8?B?S3d1TWVJTEc5ZkJ4V3VNMTVab2hjaVRocWlKcld6bzVzVEt2SWMxNlpESmFp?=
 =?utf-8?B?azl6aG55WjQ2VUFCNFhvWHlic25CTFlybnlUTkMwNjNxRmkrbWhhSVhnSE1n?=
 =?utf-8?B?ckZJUm13cjc4bXd3ak5zK0NiSWdwUWpRYVhmOEtHNko5RW9IaXFoN2oxckpu?=
 =?utf-8?B?L3JOam9tY2N2dmVULzNYeitBWUtmOTJod29rQzJsUXVVOUpDWDJ0eTRGRTlN?=
 =?utf-8?B?c1I5dXAxYldMb3BoZTVSbVBNWlUzUzk3Tm5tZlNJNVZWNWNnUWQvNzIvRnJX?=
 =?utf-8?B?SGxsc2czL3pJekJYYWtsdFpSK1dGRXJmTHhReGxHM0wvWWRUdHBCVVozVUpC?=
 =?utf-8?B?OUJXRWgrd2F1eEhqanlxMmxBdWpTTkVzcXcrUTAxTE9nMlhVdi9JdS9KTGVS?=
 =?utf-8?B?QlFxZjRlVjNNZVA4L0ltL084OG0xQytmTFVZVjRkZE90UGcwTXU5TjFVYzFG?=
 =?utf-8?B?QmVFQzh1M0lhTTM0U1RNVTNXRmtBYkg2YUhLemN6ZG00T2RUdUZ5YzFKYXFJ?=
 =?utf-8?B?SllIODBKczhkNWhIVGRkN09MZnkrZVFmdmd3TzYwU1FkNTZwSFQxTW11R1dp?=
 =?utf-8?B?S3doaG43dFhNOC9pOS9ZdUxJdmdkN0wyYUdjK3Jkd2o0NndQaGNVMUk3V3lX?=
 =?utf-8?B?Zm9ubmpGMkdobHdOQWptdDAvY25rNFE5NWZRTkI5dFBnNnMzdXpwSzdPd1ZT?=
 =?utf-8?B?YmVaemFmemxVblNWQzdzQmZLVWZjc2xaZE1MZFVIdFp1U3F4eS81NXRXU3BN?=
 =?utf-8?B?SjVUS1VNb1NRTk1iYnBwZDVJMW1RTkN1bU5UZkJ0RTN0ZHpmRW9RT3hlNHo1?=
 =?utf-8?B?TVZYTGxUZC9pKzdLTVQrQWlacFZZUkdEMWYxRzBYa2lRMjRRV1FIOVoyY3M0?=
 =?utf-8?B?UWJBTkt2WE9ZTy9KbW9hUUtqRGlRYnJPRWpydUJXV3g3UnQ2NmVUVG5xRlpC?=
 =?utf-8?B?cmc3aGhncW5lckpzdjVibXlYdVVnYWVKNE5pS1BadUd1ZkkwSDYya29HUHlp?=
 =?utf-8?B?NjV2OUh4QTlZa0diZlF1Z2xpSkZUdVpqYmpxbU1YU0RxNkM0TE9QOHJVV2ow?=
 =?utf-8?B?RWtNeXhzYzhMMWRRcG5rNnZaVWRwUXdBRnp4RENocEVXdFFPUWRURHpMbXJa?=
 =?utf-8?Q?Z5Ao757DNsZJbFcE/I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61D77B477687EE4B98559B976CF482F3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7fa6588-7a56-4789-b8e2-08d993606c32
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 00:27:38.9123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pSeqESX7DVk8zK9fam7y2W9gkXQHOz25fB97a3DXw0PHWPCK7iPHziqe8F3MqahiHeXZ9lMyePny5Xxt5uKYyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2664
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SmFjayBQaGFtIHdyb3RlOg0KPiBPbiBUdWUsIE9jdCAxOSwgMjAyMSBhdCAwMjozODozMEFNICsw
MDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBKYWNrIFBoYW0gd3JvdGU6DQo+Pj4gT24gRnJp
LCBPY3QgMTUsIDIwMjEgYXQgMTA6MjA6NDhQTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0K
Pj4+PiBUWCBlbmRwb2ludHMgc2hvdWxkIGhhdmUgbm9uLXplcm8gR1RYRklGT1NJWi4gVXNpbmcg
dGhlIHJlZ2lzdGVyIGFzIGENCj4+Pj4gZmxhZyB0byBjaGVjayB3aGV0aGVyIGl0J3MgYmVlbiBy
ZXNpemVkIGlzIG5vdCBvay4gQWxzbywgd2hhdCBoYXBwZW5lZA0KPj4+PiBhZnRlciByZXNpemlu
ZyB0aGUgdHhmaWZvPyBEbyB5b3UgcmVzdG9yZSBpdHMgcHJldmlvdXMgZGVmYXVsdCB2YWx1ZT8N
Cj4+Pg0KPj4+IFRoZSBjaG9pY2UgdG8gdXNlIHRoZSByZXNpemluZyBhbGdvcml0aG0gaXMgYSBm
aXhlZCBzZXR0aW5nIGRldGVybWluZWQNCj4+PiBieSBkZXZpY2UgcHJvcGVydHkuICBTbyBpZiBp
dCBpcyBlbmFibGVkIGZvciBhIHBhcnRpY3VsYXIgcGxhdGZvcm0NCj4+PiBpbnN0YW5jZSwgaXQg
bWVhbnMgd2UgZG9uJ3QgaW50ZW5kIHRvIHVzZSBhbnkgb2YgdGhlIGRlZmF1bHQgdmFsdWVzLg0K
Pj4+IEFsbCB0aGUgcmVnaXN0ZXJzIHdpbGwgZ2V0IGNsZWFyZWQgdG8gMCB1cG9uIGV2ZXJ5IFNl
dCBDb25maWd1cmF0aW9uIHNvDQo+Pj4gdGhhdCBlYWNoIEVQIGVuYWJsZSBjYWxsIHRoZXJlYWZ0
ZXIgd2lsbCBiZSBzdGFydGluZyBmcm9tIGEgY2xlYW4gc2xhdGUuDQo+Pg0KPj4gU29tZSBmaWVs
ZHMgb2YgR1RYRklGT1NJWiBtYXkgbm90IGdldCBjbGVhcmVkLiBEZXBlbmRzIG9uIHRoZSBjb250
cm9sbGVyDQo+PiB2ZXJzaW9uLCB3ZSBpbnRyb2R1Y2UgZGlmZmVyZW50IGZpZWxkcyAoYXMgdGhl
IGNhc2UgZm9yIERXQzMyIGFuZA0KPj4gRFdDMzEpLiBTbyB0aGlzIG1heSBub3QgYXBwbHkgZm9y
IGFsbCB0aGUgdGltZS4gSSBqdXN0IG5vdGljZWQgdGhhdCB0aGUNCj4+IGVudGlyZSBHVFhGSUZP
U0laIHdhcyB3cml0dGVuIHdpdGggMC4gUGxlYXNlIG9ubHkgd3JpdGUgdG8gdGhlIHNwZWNpZmlj
DQo+PiBmaWVsZHMgd2l0aCBwcm9wZXIgbWFjcm9zLg0KPiANCj4gSG1tLCBJIHRob3VnaHQgV2Vz
bGV5J3Mgb3JpZ2luYWwgY2hhbmdlIGFscmVhZHkgdGFrZXMgY2FyZSB0byBkbyB0aGF0Og0KPiAN
Cg0KSSB3YXMgcmVmZXJyaW5nIHRvIHRoZSBmaWVsZCBzdWNoIGFzIFRYRlJBTU5VTSB0aGF0IHRo
ZSBjaGVjayAiaWYNCihHVFhGSUZPU0laKSIgbWF5IG5vdCB3b3JrIGJlY2F1c2UgdGhpcyBmaWVs
ZCBtYXkgYmUgbm9uLXplcm8gYnkgZGVmYXVsdC4NCg0KPiB2b2lkIGR3YzNfZ2FkZ2V0X2NsZWFy
X3R4X2ZpZm9zKHN0cnVjdCBkd2MzICpkd2MpDQo+IHsNCj4gLi4uDQo+IAkvKiBDbGVhciBleGlz
dGluZyBUWEZJRk8gZm9yIGFsbCBJTiBlcHMgZXhjZXB0IGVwMCAqLw0KPiAJZm9yIChudW0gPSAz
OyBudW0gPCBtaW5fdChpbnQsIGR3Yy0+bnVtX2VwcywgRFdDM19FTkRQT0lOVFNfTlVNKTsNCj4g
ICAgICAgICAgICAgIG51bSArPSAyKSB7DQo+IAkJZGVwID0gZHdjLT5lcHNbbnVtXTsNCj4gCQkv
KiBEb24ndCBjaGFuZ2UgVFhGUkFNTlVNIG9uIHVzYjMxIHZlcnNpb24gKi8NCj4gCQlzaXplID0g
RFdDM19JUF9JUyhEV0MzKSA/IDAgOg0KPiAJCQlkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdDM19H
VFhGSUZPU0laKG51bSA+PiAxKSkgJg0KPiAgICAgICAgICAgICAgICAgCQlEV0MzMV9HVFhGSUZP
U0laX1RYRlJBTU5VTTsNCg0KSSB0aGluayBpdCdzIGJldHRlciB0byB1c2UgbWFza3Mgc3VjaCBh
cyBiZWxvdyBzaW5jZSBpdCdzDQpzZWxmLWRvY3VtZW50ZWQsIGJ1dCBpdCdzIHByb2JhYmx5IGZp
bmUgYXMgaXMuDQoNCnNpemUgJj0gfihEV0MzeF9HVFhGSUZPU0laX1RYRlNBRERSKH4wKSB8IERX
QzN4X0dUWEZJRk9TSVpfVFhGREVQKH4wKSk7DQoNCj4gDQo+IAkJZHdjM193cml0ZWwoZHdjLT5y
ZWdzLCBEV0MzX0dUWEZJRk9TSVoobnVtID4+IDEpLCBzaXplKTsNCj4gCQlkZXAtPmZsYWdzICY9
IH5EV0MzX0VQX1RYRklGT19SRVNJWkVEOw0KPiAJfQ0KPiAJZHdjLT5udW1fZXBfcmVzaXplZCA9
IDA7DQo+IH0NCj4gDQo+IEp1c3QgYmVmb3JlIHRoZSB3cml0ZSwgdGhlIHJlYWQgaXMgbWFza2Vk
IHdpdGggdGhlIFRYRlJBTU5VTSBiaXQgaW4gY2FzZQ0KPiBvZiAhRFdDMywgaS5lLiBEV0MzMSBv
ciBEV0MzMi4gIFRoZSByZXN0IHdvdWxkIGJlIDAnZWQgb3V0LiAgU29ycnkgaWYgbXkNCj4gcHJl
dmlvdXMgcmVwbHkgaW1wbGllZCB0aGUgZW50aXJlIHJlZ2lzdGVyIHdhcyB3cml0dGVuIGFzIDAu
DQo+IA0KDQpGb3IgRFdDMzIsIHRoZSBmaWVsZCBUWEZSQU1OVU0gaXMgcmVwbGFjZWQgd2l0aCBz
b21ldGhpbmcgZWxzZSwgYnV0IHRoZQ0KVFhGU0FERFIgYW5kIFRYRkRFUCBhcmUgdW5jaGFuZ2Vk
IHNpbmNlIERXQzMxLiBDaGVjayB0aGF0IHdlIGRvbid0DQp1bmludGVudGlvbmFsbHkgb3Zlcndy
aXRlIGJpdCgxNSkgb2YgR1RYRklGT1NJWiBmb3IgRFdDMzIgYW5kIERXQzMxIHdoZW4NCnVwZGF0
aW5nIHR4Zmlmby4NCg0KVGhhbmtzLA0KVGhpbmgNCg==
