Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3198A74FFBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 08:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231975AbjGLGxN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 02:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231920AbjGLGxL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 02:53:11 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2042.outbound.protection.outlook.com [40.107.215.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF351720
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 23:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUu0fJ2d7EoDUxdbzAczG3BuVzS0onSswUpdkOStMyNv7BlKoRPyYwC5v+itXDAGZFldN6vEOpAVjhcZZuXeYEQN+g2nrWAjYb8Pboy4+4K9om0PGfOpd9aCWfmcmmT/cWUt2o80tQSSRdfk9G1MynOKBUvGifzarlJZzJ0OmFDPrIttqcGQ2TvFgqurGS0WsZ8pP5t3x00XvYbQ06u4P9mQuK7/TVxLSaiIaM5xc+3ZfslPG999xp+P38ejTISuVd6AV9MxuQiAtX87XhTMrrGhIuGBu5sc8LUFieNOoXle6Jwqd4paz/Wh4AtRMBaLdV1XBDnX0UVoviKlwOm/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+tFuG8shNGpB1H5qB1lUbhmJfIh206dUe7WdxkKslw=;
 b=KuRNz+STaRoHzzScC5nun295iBuBzyi3zXUuaPtA0y4B7dXq4BJR5EMOWkcgnHzOZn3r0573m38pPPFlOjNFDcXwkZsN9zO6Og0UTWWp869F/VjGIXwe5JCwOfjqxrZTSyG/MmVotFzq5Eh7PtgdOGx8qi2xd7g765BOdb0Y6PFYDrBuGppxQIFTFvoFzXuJAZIk2ICuk5cXYM7WHbRnMUGL1lsiE5DaLWAiWO60lQIQu5SClct7U4eczgdqwNiithWJjSSvuvkYqd3EV+UC9eDQx865Uki5GO5lOJF/GlkW8Vo6ItbFj/x/Vd2onjBoAUO4UmS+x1nQUpoabQQytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+tFuG8shNGpB1H5qB1lUbhmJfIh206dUe7WdxkKslw=;
 b=AK/h4yVnAzgOpILICrpOeXwRQ921ZPhr1MHYwdk2TJXOag3eYQEK0gVWObhPpniKa/p7ceMGrVtfQv2gVR7NUK7JBskD4TvC/skJsgEI6vS3MdTxFfMLa3G6grtOCqNAJJ2LGtzD9dg+Y92/80vWE8wndbZWwCRxShZ3rppTu40=
Received: from TY0PR06MB5053.apcprd06.prod.outlook.com (2603:1096:400:1be::13)
 by TYSPR06MB6411.apcprd06.prod.outlook.com (2603:1096:400:42a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 06:53:02 +0000
Received: from TY0PR06MB5053.apcprd06.prod.outlook.com
 ([fe80::7639:af3a:3aa1:bf5a]) by TY0PR06MB5053.apcprd06.prod.outlook.com
 ([fe80::7639:af3a:3aa1:bf5a%7]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 06:53:02 +0000
From:   =?utf-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke.xin@quectel.com>
To:     "mani@kernel.org" <mani@kernel.org>,
        "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        "slark_xiao@163.com" <slark_xiao@163.com>
CC:     "fabio.porcedda@gmail.com" <fabio.porcedda@gmail.com>,
        "koen.vandeputte@citymesh.com" <koen.vandeputte@citymesh.com>,
        "song.fc@gmail.com" <song.fc@gmail.com>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "mhi@lists.linux.dev" <mhi@lists.linux.dev>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        =?utf-8?B?SmVycnkgTWVuZyjokpnmnbAp?= <jerry.meng@quectel.com>,
        =?utf-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke_xinanwen@163.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjZdIGJ1czogbWhpOiBob3N0OiBwY2lfZ2VuZXJp?=
 =?utf-8?Q?c:_Add_support_for_Quectel_RM520N-GL_modem?=
Thread-Topic: [PATCH v6] bus: mhi: host: pci_generic: Add support for Quectel
 RM520N-GL modem
Thread-Index: AQHZqxt8uhgt6dFEvk6CWHgi/y4h56+1w3aA
Date:   Wed, 12 Jul 2023 06:53:01 +0000
Message-ID: <TY0PR06MB5053AFE3D6325CA6C0BD4A8B8436A@TY0PR06MB5053.apcprd06.prod.outlook.com>
References: <49141a5a22d12d7539ab567cd4e7629f30-6-23163.com@g.corp-email.com>
 <20230630062318.12114-1-duke_xinanwen@163.com>
In-Reply-To: <20230630062318.12114-1-duke_xinanwen@163.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quectel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR06MB5053:EE_|TYSPR06MB6411:EE_
x-ms-office365-filtering-correlation-id: cb964902-365e-41e2-14e3-08db82a4a2cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9M80hfM2B5rD4/Gvc0kJs1poVR+44/3V/XRieeoy/+ptp6L8Qly6Le4soK6+VN5ViMFzuGoc1ZyqGiT6wHscaGXlBlIkLAx5BrNFPP5ejosRJbRtyCfV9I+GVH+HdYQgdTAp2Pc68xuLho8eaWLeIdC0Z+PSkff7fATrZQ5/6A3cBF3tWUFqXuqResGKMFb4BiqXANPgtvswNA+MfUqdbvQVR7QWgr1ZkA1byIj6ICEl61ioQVmFfGmkof6GZiN5DLU/LjyA/78ck8OPyWNjT7nSaTl6Gmxdw4Hkafdh7Hg6k8b0JPf6f3EHEylmnY+GTie3qlYo0IeXDQyxYy9kIDqRI0gzQsxWfwz+mHWXGIzTU4ETDfFRYuRXakZj0NkeIVTfb+RN1jLCo5MpHgyTJU/WvBhSt+bg6MLKM+b2E6IZ+FW+eIKIxCeMN/l7QswVKXrIuOl3JsJu4x57VIi/HpAyufeuXe6rMggpJdUV+2UxAGpt1aSBw8mxHfPpyZ8FDBVYrTBk2c5xHtGw1nRpv2ip2m2sJ/AC2Wm8G269wowQilg6HhNr+yHD3hES4vdEH60T3hfzAtnJPPmeuUCTr2ATyND65fOqQ8ig+A6Fg1cXPlBPA+IKbTqXLuRgViE7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB5053.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(76116006)(66946007)(66556008)(66446008)(66476007)(64756008)(33656002)(224303003)(2906002)(55016003)(316002)(4326008)(83380400001)(9686003)(41300700001)(85182001)(7416002)(5660300002)(110136005)(26005)(54906003)(52536014)(38100700002)(6506007)(71200400001)(8936002)(86362001)(122000001)(478600001)(38070700005)(186003)(7696005)(15974865002)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVJHSFRqTzVtMWtGOVZDZ0xwR0dYcUlyMDh3eVE2aVJrUkkwZ2NzalBpK2JH?=
 =?utf-8?B?Q2F5aFpTNmMzNURIRlZYL2d4SVhYK09JODYxa3FJUDlCcXBBOGpmVUtUdU92?=
 =?utf-8?B?Y3pUcHlrSExhejE4RCtBbjQ1SzZCbDBLUlA4OGhzNUorZ1Nld2RwUTlJZGV5?=
 =?utf-8?B?bnRjcnpRVUQzY0FnQnp0allxc0NjNUZjOStlWWhkNE1VdmNVSmc2c3lhOEMx?=
 =?utf-8?B?Ym5OM1hlNVF3S3FOUWlhTDVKWDFEN1dYL01Ob1FMN3Y2V1ZyV0Z1dXNMbWZz?=
 =?utf-8?B?MW5kZ2krUHJodFdsMFozaCtuclVxZHJTYjFHTlFXSmRURmZzaDBsdGJaaDlB?=
 =?utf-8?B?a25na1hTUFA3ZFFDVHBMWFBYbHBSUTVTWGdQZ2QvVE5qcHJWUyt5UUZrcUo1?=
 =?utf-8?B?eUVnd09sMXZ5cmpzQ0xMMG1iK09ucnlqN0ZrQzNDMEpPcitEUEhsd0lESmk5?=
 =?utf-8?B?RTdvbWZNWEtPVHBGS3FWVi9RQjB5dEVPZUh4U09IMVJXdHVGWHQzSE41anNp?=
 =?utf-8?B?M0c1WHloU04xOU8zbmJoZ2U0TWNldm9YNlk0VGdaTkE0LzVnRjFqTytzVGpH?=
 =?utf-8?B?VzZISEcwR0lCVWNncFBjdG5kZGp6cGxKWis5RXRvQlVGaFBSbXR5RlQzNkFx?=
 =?utf-8?B?TjgwL3JuWGtubnVBUEl2U3ppRXUvZERlWkFkYzl5bnNaNmlMb1ZaR1hMNnBF?=
 =?utf-8?B?NGdIemRHNHhrbWtnc054TE5PekUwMllVVGxsbkJ4aDJhZkcvL1FEL1JKQ1Rt?=
 =?utf-8?B?cEZDS1ZCUDNackdITlNuMjZvakZ0L3M2ajlvUGl2bmpOelZER2gwZlZxMU12?=
 =?utf-8?B?dHNVWkhCZWdOMHlMeTBkYTVGbzZJMm5qOWFSOTd5T090K3g2dlgvVHRDV00y?=
 =?utf-8?B?UGE2NW1PTVIwZ1BZYlYyQ0lyZE5sOHR3OXRNcGJYa3pybzk0NlhnaTJxbEQy?=
 =?utf-8?B?dzhmOWE3SCtQNmxMWHRLTU5mTHZhczZ3cW5HV3Q0SldUdHV0b0J3cjNDbHV4?=
 =?utf-8?B?Q0tCYldmeHFteVNzS3BhZ1dFWDNzNm11NDlnNnJ3S2N5d0ExcG45bmhUTTRN?=
 =?utf-8?B?MVFCanNWc1RXTys0MU5mUm5UUjVXR1hldTIyaHhKVENYT0ZPN3l5cUN1MHpC?=
 =?utf-8?B?aWdZRHV6UjE4ZUJPVndMTndyUklRdi9pV2R2ZGwvQWNmbGNCQ3dhd2VlYmRC?=
 =?utf-8?B?UTRSNUUrdVJDVVFNaE0xSkRhTW9wRXRwZWtWYWJzSkg5TDE1T1ZwUGovTmtl?=
 =?utf-8?B?M2JZYnZ3cjJCM05aaDc0c1kzYXlmK3Jsd3lkUTRFelk4bkYzbnl5OStWa0wr?=
 =?utf-8?B?eFpkbXBGZzZ3bVdVSmpCM2xkVWYzZkVZS09kQ1dTL016M2dRd04wSWNJeEdP?=
 =?utf-8?B?bk0xbjdVUnZ6ME5WTUo5Zkh6bFVsK0pDZEtuVlN4Z1FPZjVNQ0M3QWNsdXF2?=
 =?utf-8?B?bWlieXpPR3QremViSys3dkpFWTVPNDM1L1g5NXZRdVdpZ1oybWw4VlUzcU9p?=
 =?utf-8?B?dG1yazh3R080SlZoWkJNV0EySDhOV2tEVkVEeE1UaDZJR3JBSHR4bXNkWlg5?=
 =?utf-8?B?bS9FeWF1MDR6cWFmeDdzdTZ1Z0lsYVFmZ0NVZTVVYldub0duVTVxUWhTUDYv?=
 =?utf-8?B?bkEwM09JUTZNNjRsMDZwZVEwZUNUTGY3WkVSczJ4UXV4VFRYUU1WeFFwcFQw?=
 =?utf-8?B?cTlYVHdVczJBSWhrdlB5aDFWZ2MvVFh3NzB4T2VOcHFlbER0TVY1Yjg2cUk4?=
 =?utf-8?B?aWRpN1dmM2FidWZpV3cvczA1OGt1ZGpCR24wb0wvMkxtcEwzd2ZEVmJPdi9H?=
 =?utf-8?B?eC94SXUxUWlVY3FQOUwrd3UyUGJ3YnBidUtZMTdhTGEyNDMvZXpRazZBNzVN?=
 =?utf-8?B?ZUJEcFFUd0tjcmFOWWY5WUdYWllTMFptQ1pVN3hJSDFVZmZRTEhPR2g5UWt4?=
 =?utf-8?B?VThHNXdrcTVGeGp3US9ZZnhSSUJFYUxrcFpScG53NUdhWDNlckZvSDVSMUpr?=
 =?utf-8?B?MXZLK0FyRHJQWDRPZzg3Q3RYQytqbENXcWdCS2xaa2tqak92WHlhUVhsYVF3?=
 =?utf-8?B?aEtIOHZmVExyT2wzQnliQUVMeGpRT21VK3lEUnV5SmRYQUtLRjlOV1FiN2dv?=
 =?utf-8?Q?2hfUV2Osblf+Tt8g4XDjGL3yR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5053.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb964902-365e-41e2-14e3-08db82a4a2cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 06:53:02.0378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y23uYVvihhBkbQsNIEmWyDl/E6klSZomLDRUhMXG5BpkipaqMXKCsj6g+Q3hOG2UihlqrxZ2FpQNCgdbrrcI+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6411
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgTWFuaQ0KDQpFeGN1c2UgbWUsIHlvdSBtYXkgaGF2ZSBmb3Jnb3R0ZW4gdG8gcmV2aWV3IG15
IFtQQVRDSCB2Nl0gLCBwbGVhc2UgaGVscCB0byBjaGVjayBpdC4NCg0KDQrovpvlronmlocgIER1
a2UgWGluIHwgU29mdHdhcmUgRGVwYXJ0bWVudCBJWCBFbmdpbmVlciB8IFF1ZWN0ZWwgV2lyZWxl
c3MgU29sdXRpb25zIENvLiwgTHRkLiANCiAgICAgICAgICAgIA0KTW9iaWxlOiArODYtMTUzNzU0
NTYxODMgfCBFbWFpbCA6IER1a2UueGluQHF1ZWN0ZWwuY29tICB8IFRlbDogKzg2LTA1NTEtNjU4
NjkzODYtODYzMg0KV2Vic2l0ZTogd3d3LnF1ZWN0ZWwuY29tICB8IFFROiA2MDI2NTkwNzIgfCBX
ZWNoYXQ6IDE1Mzc1NDU2MTgzDQoNCkJ1aWxkaW5nIDEtQywgQ2hpbmEgU3BlZWNoIFZhbGxleSBB
cmVhIEEsIDMzMzUgWGl5b3UgUm9hZCwgSGlnaC10ZWNoIFpvbmUsIEhlZmVpLCBBbmh1aSAyMzAw
ODgsIENoaW5hICAgIA0K5a6J5b6955yB5ZCI6IKl5biC6auY5paw5Yy65Lmg5Y+L6LevMzMzNeWP
t+S4reWbve+8iOWQiOiCpe+8ieWbvemZheaZuuiDveivremfs+S6p+S4muWbrUHljLox5Y+35Lit
6K+V5qW8IDIzMDA4OA0KSFE6IEJ1aWxkaW5nIDUsIFNoYW5naGFpIEJ1c2luZXNzIFBhcmsgUGhh
c2UgSUlJIChBcmVhIEIpLCBOby4xMDE2IFRpYW5saW4gUm9hZCwgTWluaGFuZyBEaXN0cmljdCwg
U2hhbmdoYWkgMjAwMjMzLCBDaGluYQ0K5oC76YOo77ya5LiK5rW35biC6Ze16KGM5Yy655Sw5p6X
6LevMTAxNuWPt+enkeaKgOe7v+a0sjPmnJ/vvIhC5Yy677yJNeWPt+alvCAgMjAwMjMzDQoNCi0t
LS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogRHVrZSBYaW4o6L6b5a6J5paHKSA8ZHVr
ZV94aW5hbndlbkAxNjMuY29tPiANCuWPkemAgeaXtumXtDogMjAyM+W5tDbmnIgzMOaXpSAxNDoy
Mw0K5pS25Lu25Lq6OiBtYW5pQGtlcm5lbC5vcmc7IGxvaWMucG91bGFpbkBsaW5hcm8ub3JnOyBz
bGFya194aWFvQDE2My5jb20NCuaKhOmAgTogZmFiaW8ucG9yY2VkZGFAZ21haWwuY29tOyBrb2Vu
LnZhbmRlcHV0dGVAY2l0eW1lc2guY29tOyBzb25nLmZjQGdtYWlsLmNvbTsgYmhlbGdhYXNAZ29v
Z2xlLmNvbTsgbWhpQGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5v
cmc7IEplcnJ5IE1lbmco6JKZ5p2wKSA8amVycnkubWVuZ0BxdWVjdGVsLmNvbT47IER1a2UgWGlu
KOi+m+WuieaWhykgPGR1a2UueGluQHF1ZWN0ZWwuY29tPjsgRHVrZSBYaW4o6L6b5a6J5paHKSA8
ZHVrZV94aW5hbndlbkAxNjMuY29tPg0K5Li76aKYOiBbUEFUQ0ggdjZdIGJ1czogbWhpOiBob3N0
OiBwY2lfZ2VuZXJpYzogQWRkIHN1cHBvcnQgZm9yIFF1ZWN0ZWwgUk01MjBOLUdMIG1vZGVtDQoN
CkFkZCBNSEkgaW50ZXJmYWNlIGRlZmluaXRpb24gZm9yIFJNNTIwIHByb2R1Y3QgYmFzZWQgb24g
UXVhbGNvbW0gU0RYNlggY2hpcA0KDQpTaWduZWQtb2ZmLWJ5OiBEdWtlIFhpbijovpvlronmlocp
IDxkdWtlX3hpbmFud2VuQDE2My5jb20+DQpSZXZpZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNp
dmFtIDxtYW5pQGtlcm5lbC5vcmc+DQotLS0NCkNoYW5nZWxvZw0KDQp2NSAtPiB2Ng0KDQoqIFVw
ZGF0ZSBjb21taXQgbWVzc2FnZSB0byBpbmNsdWRlIHRoZSBjaGFuZ2Vsb2cgYW5kIHJldmlld2Qg
dGFnLg0KDQp2NCAtPiB2NQ0KDQoqIEFkZCBwYXRjaCBDQyB0byBtaGlAbGlzdHMubGludXguZGV2
Lg0KDQp2MyAtPiB2NA0KDQoqIExpbWl0IGNoYXJhY3RlciBsZW5ndGggdG8gNzUgY2hhcmFjdGVy
cyBhbmQgYWRqdXN0ZWQgInByb2plY3QiIGRlc2NyaXB0aW9uIHRvICJwcm9kdWN0Ii4NCg0KdjIg
LT4gdjMNCg0KKiBTb3J0ZWQgYWRkIHJtNTIwIGlkIGluIG1oaV9wY2lfaWRfdGFibGUgYW5kIG1v
ZGlmeSBjb21taXQgbWVzc2FnZS4NCg0KdjEgLT4gdjINCg0KKiBVc2UgW21vZGVtX3F1ZWN0ZWxf
ZW0xeHhfY29uZmlnXSBjb21wYXRpYmxlIGluc3RlYWQgb2YgZHVwbGljYXRpbmcgdGhlIGNvbmZp
Z3VyYXRpb24uDQotLS0NCiBkcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jIHwgMTMg
KysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jIGIvZHJpdmVycy9idXMv
bWhpL2hvc3QvcGNpX2dlbmVyaWMuYw0KaW5kZXggNzBlMzdjNDkwMTUwLi4xZTdjYWE2MmYxMTQg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jDQorKysgYi9k
cml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jDQpAQCAtMzUyLDYgKzM1MiwxNiBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG1oaV9wY2lfZGV2X2luZm8gbWhpX3F1ZWN0ZWxfZW0xeHhfaW5m
byA9IHsNCiAJLnNpZGViYW5kX3dha2UgPSB0cnVlLA0KIH07DQogDQorc3RhdGljIGNvbnN0IHN0
cnVjdCBtaGlfcGNpX2Rldl9pbmZvIG1oaV9xdWVjdGVsX3JtNXh4X2luZm8gPSB7DQorCS5uYW1l
ID0gInF1ZWN0ZWwtcm01eHgiLA0KKwkuZWRsID0gInFjb20vcHJvZ19maXJlaG9zZV9zZHg2eC5l
bGYiLA0KKwkuY29uZmlnID0gJm1vZGVtX3F1ZWN0ZWxfZW0xeHhfY29uZmlnLA0KKwkuYmFyX251
bSA9IE1ISV9QQ0lfREVGQVVMVF9CQVJfTlVNLA0KKwkuZG1hX2RhdGFfd2lkdGggPSAzMiwNCisJ
Lm1ydV9kZWZhdWx0ID0gMzI3NjgsDQorCS5zaWRlYmFuZF93YWtlID0gdHJ1ZSwNCit9Ow0KKw0K
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX2NoYW5uZWxfY29uZmlnIG1oaV9mb3hjb25uX3NkeDU1
X2NoYW5uZWxzW10gPSB7DQogCU1ISV9DSEFOTkVMX0NPTkZJR19VTCgwLCAiTE9PUEJBQ0siLCAz
MiwgMCksDQogCU1ISV9DSEFOTkVMX0NPTkZJR19ETCgxLCAiTE9PUEJBQ0siLCAzMiwgMCksIEBA
IC01OTEsNiArNjAxLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIG1oaV9w
Y2lfaWRfdGFibGVbXSA9IHsNCiAJCS5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkgJm1o
aV9xdWVjdGVsX2VtMXh4X2luZm8gfSwNCiAJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfUVVF
Q1RFTCwgMHgxMDAyKSwgLyogRU0xNjBSLUdMIChzZHgyNCkgKi8NCiAJCS5kcml2ZXJfZGF0YSA9
IChrZXJuZWxfdWxvbmdfdCkgJm1oaV9xdWVjdGVsX2VtMXh4X2luZm8gfSwNCisJLyogUk01MjBO
LUdMIChzZHg2eCksIGVTSU0gKi8NCisJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfUVVFQ1RF
TCwgMHgxMDA0KSwNCisJCS5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkgJm1oaV9xdWVj
dGVsX3JtNXh4X2luZm8gfSwNCiAJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfUVVFQ1RFTCwg
MHgyMDAxKSwgLyogRU0xMjBSLUdMIGZvciBGQ0NMIChzZHgyNCkgKi8NCiAJCS5kcml2ZXJfZGF0
YSA9IChrZXJuZWxfdWxvbmdfdCkgJm1oaV9xdWVjdGVsX2VtMXh4X2luZm8gfSwNCiAJLyogVDk5
VzE3NSAoc2R4NTUpLCBCb3RoIGZvciBlU0lNIGFuZCBOb24tZVNJTSAqLw0KLS0NCjIuMjUuMQ0K
DQo=
