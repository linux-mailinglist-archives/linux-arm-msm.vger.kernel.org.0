Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E89634E786F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Mar 2022 16:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348357AbiCYPzm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 11:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242758AbiCYPzl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 11:55:41 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.140.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC9D515AB;
        Fri, 25 Mar 2022 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1648223646; x=1648828446;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/aoa1+Zq0K0WZKl5TW5+S2D+KTZf/9h1ApZ6OjrV01Y=;
  b=wjGQCF72nYD/XyOZJ0F+M8IfLaJ9hZn5v7R+R/6KNPx5bp9mejj4NQxV
   MhXWWbKqZgt7KT1Hyu2i/XOaxhTQzBUpHof4HquWn6wbFLnjp3N/htZLk
   3QlVwluPA2ZxbVcXC6tSlxyHPSO94VaZn3DWmP65+Mmlpm8bCz08qOo9l
   M=;
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 15:54:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ib1RKQAP+FiTR/jwmqZV53US+y1k0FxXXpG96vDQ3EqcaUxkojY61bp2w1TDDSMVM7fO8KkimtVJYrqtqF2FISgDG+WSbgpVZZ56M/cwEZsFbkOYLKv1htG4+EKWnFd26PZK6s0IQA2cbpKgbNzH+tNNhdG79Nd8FZ6mGH5fH6etHoBqqFxutRkU5qDZRDyovH5/EhD15OaUcp1Lr8zu2iiERdRS0zAMlPxhLjIdFYBUNStZtneQp1KQ4Ek/gbH4Ci5BxHUaKf62Fvags/4WF+W8bTs3PilmJ3abpwxsObkMlm5beeSRu7YgzV5Rw2IMebpgyfbE7QbK6ogPEcfOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aoa1+Zq0K0WZKl5TW5+S2D+KTZf/9h1ApZ6OjrV01Y=;
 b=i2RH/tvZYoiOXU57RPcwsg32EChWm9ZsxNwCF4eE1BMrfW1aNXjwrdhphaVG78/pr3wpPAYZpKR9YH7eUkHe7l7cdvXVwvVOkdm2c9IuFlKahd/hMWq2VjoHhOVZD1B/pyC5XAVzFdy7/YFv+bJ3PnLWWTnc8qQe0rIB5207o3F+RDPy2Z2pQ1smIpcuXisSMm2h28ShSMTjn+/BCfgbj/G9bykShBOLr6wYVAzLhPOUrLHrzVC2BQ4EW0G0AEMuxE8Q8qCxtXo6dQO/g9YB9uo/jlnACjiYKC0XCtpzFnAy54EvNAnYXckktI48yZnwZbM54nzHr/c6/XOz/tQP9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by PH0PR02MB7205.namprd02.prod.outlook.com (2603:10b6:510:1a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 15:54:01 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::44bc:87fa:db04:78ff]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::44bc:87fa:db04:78ff%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 15:54:01 +0000
From:   "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To:     Doug Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
CC:     "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        quic_vproddut <quic_vproddut@quicinc.com>
Subject: RE: [PATCH v5 6/9] drm/msm/dp: wait for hpd high before any sink
 interaction
Thread-Topic: [PATCH v5 6/9] drm/msm/dp: wait for hpd high before any sink
 interaction
Thread-Index: AQHYOVx+t0EmYfmqg0GDDNP8bx6Q7qzEWZ+AgAD84oCAAEEEgIAAHHuAgAAYzgCAAAgHAIAKeYQw
Date:   Fri, 25 Mar 2022 15:54:01 +0000
Message-ID: <MW4PR02MB7186835E0D762E51EB9F9515E11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-7-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n520pQKM7mFSE_00ER+F9RKUPrN+y4U8fmsxi7FoFMyOrA@mail.gmail.com>
 <CAD=FV=UWF8K9JPJXFSGMRK-HmCi+2jM3aN6Uy7hyDSu1_azF+w@mail.gmail.com>
 <CAE-0n53U=bqPTGtPx2Ho5axtO6EL6WtOtmFisxSufC6OZERV1Q@mail.gmail.com>
 <CAD=FV=WaK8VFC-BvsFpnUv3mW4svGggQTw1hh+zRCEhGvbgYMQ@mail.gmail.com>
 <CAE-0n52v2m4U0wK6NYf4KBwXmp+TEVhjnGpW4rQHuZSf7TYfgA@mail.gmail.com>
 <CAD=FV=WFkXdXVdqhBcfa48JKcUcbUe2M0bW6-V8zjP8jgvjvHA@mail.gmail.com>
In-Reply-To: <CAD=FV=WFkXdXVdqhBcfa48JKcUcbUe2M0bW6-V8zjP8jgvjvHA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f87114c-5a78-42ed-b096-08da0e77ae3b
x-ms-traffictypediagnostic: PH0PR02MB7205:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR02MB7205925077E983801C3BE6629D1A9@PH0PR02MB7205.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ILMcTbzTyGCkDmjetjEc97AiENdKi7QH3KzQnZkOKbNx4gjKuEmXsilz4YWfYv8gJOUR7noS6K5pr9+MyVw6kQQOzqbsKnxA+zv3vz7L5ueRT8meIAvTdNlFmCZaoAMrjlhV33ri8VXuO1R4/NLh73oiFHXV1tzhuGk4Ix+tzik0U4UJ2AGQrdM9uihE6IA6tb9TopfsnRR1fvCjyF0xv6+qC9LZdW5LS1PSRqTKrDFU1h7Lq4Ou4NDiC0nfsAQc8MfbOV0VONCkfyXoliJC4x5o6WWxKc5eFEbdYV5pR316GxCZ3gcsM9jxCq7opHy4tPiBDZ/wRUlFazOeS2A6edPHQmVMkLXV/7I1gi6BujgX2tZh3l5B3pmEl7cNn2L6e3EQKgplp33EH/0Zh5hy9MKW7q4f/vpuQRbZVybewBbHF3dxi7mTt2ysLUUBNmQ7W39szp8tMxr7D/PU1/vOcNfJfscAFv9IJMEq+k3dsLKT0bgQSvFrZc1FfK5OM6Tu2yBL0ls5fnIkVsa9rkGmuZzspAYFlQvahTFx6Q+0cgP7YcrDebp42rt4wrtNwLCGDwNOKGynXWWaqea5rSLtry7+jk3TRkPYFRw7+lL1dWjLvIyV/lrT2maxn1pvt9lcqWcZezlmQfu+E8RyMgnTrclPAdv+L775jRcS6Upd+3wzUmmDBorrnbbOfIYr1x1h2Ui8k/PkzhtTuYghVkLg3g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR02MB7186.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66556008)(66946007)(64756008)(66446008)(4326008)(8676002)(76116006)(7696005)(316002)(107886003)(6506007)(7416002)(122000001)(71200400001)(55016003)(38070700005)(186003)(26005)(83380400001)(2906002)(54906003)(5660300002)(110136005)(52536014)(38100700002)(86362001)(53546011)(8936002)(9686003)(508600001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djBpRHY1N29NaTVXYTl4ZWkyOHZGQkhPdnRhYm9ZaWk0YVNCRVdSa1JwWGJV?=
 =?utf-8?B?b3h0VkFzalpLdC9UcU1iSlhqYkZ6Zm10emtsdjVRZlorTS9jN0QxTE8zZ0Nn?=
 =?utf-8?B?WlNZaEZmOHg1MUpaZWIzRy9ITWxLWkxIMHg5Q1Y3MTIvMDdXS0pZUko0VFA5?=
 =?utf-8?B?U0xuNXBWRGRTTFF6Rnh0MWFGdk5naVh1QVV6RlR1bS9lQ2JTN09aUk5TRGUr?=
 =?utf-8?B?Zm0yeWw5RVREaCtMT3cxYms3akxYcklsNmRNTHd0eW1kd042WFRyR1dHUk13?=
 =?utf-8?B?S1RTbC9tOU9HOWZTK3pVRnMxRURNREQxTVVtT3ZKS21BN0gzOGlWZWhqMWpP?=
 =?utf-8?B?enBIMFRuU2hNRlUrWXhHaGd2RlErc2VNV1Y1SXE1SVZidlNwa0hKYXdPWWJz?=
 =?utf-8?B?Yk5lMTlvRmNKQlF6UTdPSXZzVXhYZS9UZGptbFJtdE44WVlhRnNCY3cyT1NY?=
 =?utf-8?B?RlBqcVZxSnZFSVdnM2g0aSswWjVOZ2hHeWF4eTdxWHVKbDlGVzUySUgzYzEz?=
 =?utf-8?B?Zi9pQlJjaFdkRmx2MFQ1dXNWVHY5dkFVU1NWTWpQRDZvcnJpZlF0dUlIeGRu?=
 =?utf-8?B?OWxlQ2g5am9xSVJGRkloWm1hOXNZQk95eHVibm9vMVAyR2p5RVVzUVRmOWw1?=
 =?utf-8?B?TVp1em1KdWphdks3OHZKWGFnSlE4VTRyL2tQeCtIc2EwdUV3amxiZC9mN0ts?=
 =?utf-8?B?K0laanNrc1lKNU43elhHNjZLSmFzMG4wcWhkd1dXUnY4TnBqVDFZUDhuY2hy?=
 =?utf-8?B?QWRNUS9PdFBtMnp4dHFKQzVTYXhiT1RUaUxXNU5Cd1A1WDJhZ01ZbFhreXAw?=
 =?utf-8?B?ajZPTUhya21TS21kVDg4NG9HNjQ4ZW9zMTlPckJ5WDN4S1hVV2ZEWHg3czZJ?=
 =?utf-8?B?WE85UnFEeDBzbVNnZUl2djcxWmVkV09WL3IrWFFnWll4UDFFaTU4aGFIODkw?=
 =?utf-8?B?aTJrYXcvS1luS1d3QmlQbmRkbDNESjhGU2RHMEJHNnp5empuQk5kVy9ILzJI?=
 =?utf-8?B?K1RobUNHQzB5b0w3TGZOdlBla3ZWQ0QvMVdieWorYUNBVmM1bFN5ajR6aXZG?=
 =?utf-8?B?bzlJNVJYSlRlSTVrci8yY2tRYXZNcGJKUyswQ3RvZjZkYmYzVGJxWlp6bS9t?=
 =?utf-8?B?NEdJdThtMTRmZzJxVTRVcWljRGVSeFdQTTBYWnFOOTJrdTFPTjh1TDlkY2xC?=
 =?utf-8?B?b0cwU0lyeEU1bDF2clo3RFkzdHhDV0l2U2htb0RqRDRCUzFrZ1ZCTXZVRTBW?=
 =?utf-8?B?UTZiL0pTOEZpWlFGMWtNNWRRb2wyMHI0Nk1kYVNtNjdPZUprYUNTdEp5QTlZ?=
 =?utf-8?B?SW1nMm83M3RIQlZzOTBVVlhIYVdESXMyd0lGU0hCZFN1ak1xelgyaTNuMXZL?=
 =?utf-8?B?eU9mTXJFbjdkV04vRUlWaFM2aE9oVWxpSWcwbldhcGtqdDIvcGlHTjUvTG1r?=
 =?utf-8?B?bzBKYXJwNERweFI4dmdiN1dzWjFmRkpDRlZkSmZZUlZxb1N1SkFCZkdxS3Vh?=
 =?utf-8?B?ZHRHRVJGcm51dTgvOVBOSVpQRUVOeDRJWTVKcHM2UXIxUHJxZ3p0MWpJM2hG?=
 =?utf-8?B?eFRhTGZFRHpsS0NHUHhDUmNieWg1REE1M3dzaytBYmdQOE5IYUJMelIyTlFo?=
 =?utf-8?B?UDJIaDAwemZzMGdDSE0xSUVKWkg0L1RicTd4Y3dRVzd3Ly9DZ3lKQmJZTHhU?=
 =?utf-8?B?TElMWVRlK0JEQkNuR21HLzdsc2FuMGVuRzBLZ1ZFajBCZ0ttSXc0ekYyVHlw?=
 =?utf-8?B?clBZaWo0YitiTTYwNWtqWFYwQ0Z2UEtBUzhqbjNuZXE5SWZvTTIwOERGWnFt?=
 =?utf-8?B?MFNKbW53cXhsd1lPK3Nrd3hLeEc2UThJVml5UUwyRjhBZDdUYUJKeXBqUlQv?=
 =?utf-8?B?Tnp0RzBoWWl4Z0lNYmdmZUFDT2ZHK0IzZ3NhUVdUc092OUY3RjVLdWVXNG9h?=
 =?utf-8?B?SHJiTDQ4YU45UEZxdGR1WnNjRjYzb1VXRE1wS2hFd1BiL3R2SFZTblQ3OTVW?=
 =?utf-8?B?VDlmS09HL3NvMm5PYkl2WEllZ296dXF0ZGpINDloM1J1dTRYd0hMRkdzNUZH?=
 =?utf-8?B?OHMxVVVzWSthWU81ZjhWTk1FQ3pBdTVoMG9GNjVBaUhITkt1bmVBbW5Ca3Jt?=
 =?utf-8?B?aW81Qmd4ZjJsRXdjOTgxQnljS2twNlR0MGFQMG5PcGc0S1dVeDhSYU5CWk9R?=
 =?utf-8?B?TmdkM3FTd1N1OWpGZzU2amVJdWV1ZU5mdE9SejkydnRXNU9GQTcvbHE1S1cw?=
 =?utf-8?B?OW5yRHZvRUdhdEtQV2k4MEJ0TWw0OEpmSFZHOVZOS0Y2MzVsY1ljYWd5SG1B?=
 =?utf-8?B?VlR0OEt3SEY1K25CcEthS0dCNGJkQ3pmb3RDYWtmZ2xqak95aDhNUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f87114c-5a78-42ed-b096-08da0e77ae3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2022 15:54:01.1515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7zyZYuqxvA+VQPxTs4wjtcsE4K7cJ0Ze0DRvDG+M3C+OhgI/KS9Av/GNE1kQ+WslC27uLmglJyeXf28Cf7zC7Di00EZJQ4vidpAS+DDQsLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7205
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG91ZyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgTWFyY2ggMTksIDIwMjIg
NToyNiBBTQ0KPiBUbzogU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3JnPg0KPiBDYzog
U2Fua2VlcnRoIEJpbGxha2FudGkgKFFVSUMpIDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29tPjsg
b3BlbiBsaXN0Ok9QRU4NCj4gRklSTVdBUkUgQU5EIEZMQVRURU5FRCBERVZJQ0UgVFJFRSBCSU5E
SU5HUw0KPiA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBkcmktZGV2ZWwgPGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+Ow0KPiBmcmVlZHJlbm8gPGZyZWVkcmVub0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+OyBsaW51eC1hcm0tbXNtIDxsaW51eC1hcm0tDQo+IG1zbUB2Z2VyLmtl
cm5lbC5vcmc+OyBMS01MIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgUm9iIENsYXJr
DQo+IDxyb2JkY2xhcmtAZ21haWwuY29tPjsgU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5v
cmc+Ow0KPiBxdWljX2thbHlhbnQgPHF1aWNfa2FseWFudEBxdWljaW5jLmNvbT47IEFiaGluYXYg
S3VtYXIgKFFVSUMpDQo+IDxxdWljX2FiaGluYXZrQHF1aWNpbmMuY29tPjsgS3VvZ2VlIEhzaWVo
IChRVUlDKQ0KPiA8cXVpY19raHNpZWhAcXVpY2luYy5jb20+OyBBbmR5IEdyb3NzIDxhZ3Jvc3NA
a2VybmVsLm9yZz47DQo+IGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnOyBSb2IgSGVycmluZyA8
cm9iaCtkdEBrZXJuZWwub3JnPjsNCj4ga3J6aytkdEBrZXJuZWwub3JnOyBTZWFuIFBhdWwgPHNl
YW5AcG9vcmx5LnJ1bj47IERhdmlkIEFpcmxpZQ0KPiA8YWlybGllZEBsaW51eC5pZT47IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IFRoaWVycnkgUmVkaW5nDQo+IDx0aGllcnJ5LnJl
ZGluZ0BnbWFpbC5jb20+OyBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ow0KPiBkbWl0
cnkuYmFyeXNoa292QGxpbmFyby5vcmc7IHF1aWNfdnByb2RkdXQgPHF1aWNfdnByb2RkdXRAcXVp
Y2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgNi85XSBkcm0vbXNtL2RwOiB3YWl0
IGZvciBocGQgaGlnaCBiZWZvcmUgYW55IHNpbmsNCj4gaW50ZXJhY3Rpb24NCj4gDQo+IEhpLA0K
PiANCj4gT24gRnJpLCBNYXIgMTgsIDIwMjIgYXQgNDoyNyBQTSBTdGVwaGVuIEJveWQgPHN3Ym95
ZEBjaHJvbWl1bS5vcmc+DQo+IHdyb3RlOg0KPiA+DQo+ID4gPiA+IFB1c2hpbmcgaHBkIHN0YXRl
IGNoZWNraW5nIGludG8gYXV4IHRyYW5zYWN0aW9ucyBsb29rcyBsaWtlIHRoZQ0KPiA+ID4gPiB3
cm9uZyBkaXJlY3Rpb24uIEFsc28sIGFzIEkgc2FpZCB1cCBhYm92ZSBJIGFtIGNvbmNlcm5lZCB0
aGF0IGV2ZW4NCj4gPiA+ID4gY2hlY2tpbmcgdGhlIEdQSU8gd29uJ3Qgd29yayBhbmQgd2UgbmVl
ZCBzb21lIHdheSB0byBhc2sgdGhlDQo+ID4gPiA+IGJyaWRnZSBpZiBIUEQgaXMgYXNzZXJ0ZWQg
b3Igbm90IGFuZCB0aGVuIGZhbGxiYWNrIHRvIHRoZSBHUElPDQo+ID4gPiA+IG1ldGhvZCBpZiB0
aGUgZGlzcGxheSBwaHkvY29udHJvbGxlciBkb2Vzbid0IGhhdmUgc3VwcG9ydCB0byBjaGVjaw0K
PiA+ID4gPiBIUEQgaW50ZXJuYWxseS4gU29tZXRoaW5nIG9uIHRvcCBvZiBEUk1fQlJJREdFX09Q
X0hQRD8NCj4gPiA+DQo+ID4gPiBJZiB3ZSBjb3VsZCBzb21laG93IGdldCB0aGUgSFBEIHN0YXR1
cyBmcm9tIHRoZSBicmlkZ2UgaW4gdGhlIHBhbmVsDQo+ID4gPiBkcml2ZXIgaXQgZGVmaW5pdGVs
eSB3b3VsZCBiZSBjb252ZW5pZW50LiBJdCBkb2VzIGZlZWwgbGlrZSB0aGF0J3MNCj4gPiA+IGFu
IGltcHJvdmVtZW50IHRoYXQgY291bGQgYmUgZG9uZSBsYXRlciwgdGhvdWdoLiBXZSd2ZSBhbHJl
YWR5DQo+ID4gPiBsYW5kZWQgYSBmZXcgaW5zdGFuY2VzIG9mIGRvaW5nIHdoYXQncyBkb25lIGhl
cmUsIGxpa2UgZm9yDQo+ID4gPiBwYXJhZGUtcHM4NjQwIGFuZCBhbmFsb2dpeF9kcC4gSSBzdXNw
ZWN0IGRlc2lnbmluZyBhIG5ldyBtZWNoYW5pc20NCj4gPiA+IG1pZ2h0IG5vdCBiZSB0aGUgbW9z
dCB0cml2aWFsLg0KPiA+DQo+ID4gV2hhdCBpcyBkb25lIGluIHRoZSBicmlkZ2UgZHJpdmVycyBp
cyB0byB3YWl0IGZvciBhIGZpeGVkIHRpbWVvdXQgYW5kDQo+ID4gYXNzdW1lIGF1eCBpcyByZWFk
eT8gT3IgaXMgaXQgc29tZXRoaW5nIGVsc2U/IElmIHRoZXJlJ3MganVzdCBhIGZpeGVkDQo+ID4g
dGltZW91dCBmb3IgdGhlIGVEUCBjYXNlIGl0IHNvdW5kcyBPSyB0byBkbyB0aGF0IGZvciBub3cg
YW5kIHdlIGNhbg0KPiA+IGZpbmUgdHVuZSBpdCBsYXRlciB0byBhY3R1YWxseSBjaGVjayBIUEQg
c3RhdHVzIHJlZ2lzdGVyIGJlZm9yZSB0aGUNCj4gPiBwYW5lbCB0cmllcyB0byByZWFkIEVESUQu
DQo+IA0KPiBSaWdodC4gRm9yIHRoZSBwYXJhZGUgY2hpcCAod2hpY2ggaXMgb25seSB1c2VkIGZv
ciBlRFAgYXMgZmFyIGFzIEkga25vdy0tbmV2ZXINCj4gRFApIHdhaXRzIGZvciB1cCB0byAyMDAg
bXMuIFNlZSBwczg2NDBfZW5zdXJlX2hwZCgpLg0KPiANCj4gU28gSSBndWVzcyB0bDtkciB0byBT
YW5rZWVydGggdGhhdCBpdCdzIE9LIGZvciBoaXMgcGF0Y2ggdG8gaGF2ZSB0aGUgd2FpdCBpbiB0
aGUNCj4gYXV4IHRyYW5zZmVyIGZ1bmN0aW9uLCBidXQgb25seSBmb3IgZURQLiBPdGhlciBkaXNj
dXNzaW9ucyBoZXJlIGFyZSBhYm91dA0KPiBob3cgd2UgY291bGQgbWFrZSBpdCBiZXR0ZXIgaW4g
ZnV0dXJlIHBhdGNoZXMuDQo+IA0KPiANCg0KVGhlIGF1eCB0cmFuc2FjdGlvbnMgZm9yIGV4dGVy
bmFsIERQIGFyZSBpbml0aWF0ZWQgYnkgdGhlIGRwX2Rpc3BsYXkgZHJpdmVyIG9ubHkgYWZ0ZXIg
dGhlDQpkaXNwbGF5IGlzIGhvdCBwbHVnZ2VkIHRvIHRoZSBjb25uZWN0b3IuIFRoZSBwaHlfaW5p
dCBpcyBuZWNlc3NhcnkgZm9yIHRoZSBhdXggdHJhbnNhY3Rpb25zDQp0byB0YWtlIHBsYWNlLiBT
bywgZm9yIHRoZSBEUCBjYXNlLCBsaWtlIERvdWcgbWVudGlvbmVkIGJlbG93LCB0aGlzIHBhdGNo
IGlzIGludHJvZHVjaW5nDQphbiBvdmVyaGVhZCBvZiB0aHJlZSByZWdpc3RlciByZWFkcyB0byBk
ZXRlY3QgaHBkX2hpZ2ggYmVmb3JlIHBlcmZvcm1pbmcgYXV4IHRyYW5zYWN0aW9ucy4NClNvLCB3
ZSBmZWx0IHRoaXMgd2FzIG9rYXkgdG8gZG8gZm9yIERQLg0KDQpPbiB0aGUgb3RoZXIgaGFuZCwg
Zm9yIGVEUCwgaXQgaXMgbmVjZXNzYXJ5IHRvIHdhaXQgZm9yIHBhbmVsIHJlYWR5IHRocm91Z2gg
dGhpcyBocGQgY29ubmVjdCBzdGF0dXMuDQpDdXJyZW50bHkgdGhlcmUgaXMgbm8gd2F5IHRvIGtu
b3cgd2hpY2ggdHlwZSBvZiBjb25uZWN0b3IgaXQgaXMgaW4gdGhlIGRwX2F1eCBzdWItbW9kdWxl
Lg0KDQpIb3dldmVyLCBhcyB0aGUgZGlzY3Vzc2lvbiBzdWdnZXN0ZWQsIHRvIGhhdmUgdGhlIHdh
aXQgb25seSBmb3IgZURQLCBJIGFtIHRoaW5raW5nIHRvIHBhc3MgdGhlDQpjb25uZWN0b3JfdHlw
ZSBpbmZvcm1hdGlvbiB0byBhdXggc3ViLW1vZHVsZSBhbmQgcmVnaXN0ZXIgZGlmZmVyZW50IGF1
eF90cmFuc2ZlciBmdW5jdGlvbnMNCmZvciBlRFAgYW5kIERQLiBUaGUgZURQIHRyYW5zZmVyIGZ1
bmN0aW9uIHdpbGwgd2FpdCBmb3IgaHBkX2hpZ2ggYW5kIHRoZSBEUCB0cmFuc2ZlciBmdW5jdGlv
bg0Kd2lsbCBiZSBzYW1lIGFzIHRoZSBvbmUgYmVmb3JlIHRoaXMgcGF0Y2guDQoNCldoYXQgZG8g
eW91IHRoaW5rPw0KDQo+ID4gPiBJIGhhdmVuJ3QgYWN0dWFsbHkgdHJpZWQgaXQsIGJ1dCBJIHN1
c3BlY3QgdGhhdCB0byBnZXQgc29tZXRoaW5nDQo+ID4gPiBsaWtlIHdoYXQgeW91J3JlIHRhbGtp
bmcgYWJvdXQgd2UnZCBoYXZlIHRvIGdldCB0aGUgcmVzdCBvZiBkcm0gdG8NCj4gPiA+IGtub3cg
dGhhdCBmb3IgZURQIHBvcnRzIHRoYXQgaXQgc2hvdWxkIGFzc3VtZSBzb21ldGhpbmcgaXMgY29u
bmVjdGVkDQo+ID4gPiBfcmVnYXJkbGVzc18gb2Ygd2hhdCB0aGUgImRldGVjdCIgLyAiSFBEIiBv
cHRpb25zIHNheS4gVGhlbiB3ZSdkDQo+ID4gPiBoYXZlIHRvIGV4dGVuZCB0aGUgZWRwLXBhbmVs
IGNvZGUgdG8gYmUgYWJsZSB0byBiZSBhYmxlIHRvIHF1ZXJ5IHRoZQ0KPiA+ID4gbmV4dCBicmlk
Z2UgaW4gdGhlIGNoYWluIGlmIGEgR1BJTyB3YXNuJ3QgcHJvdmlkZWQuDQo+ID4NCj4gPiBDYW4g
dGhlIHBhbmVsIGludGVycm9nYXRlIHRoZSBicmlkZ2UgY2hhaW4gc29tZWhvdz8gSXQgZmVlbHMg
bGlrZQ0KPiA+IGVpdGhlciBzb21ldGhpbmcgaW4gdGhlIGNoYWluIHNob3VsZCBrbm93IHRoZSBz
dGF0dXMgb2YgSFBEICh0aGUgY2FzZQ0KPiA+IGhlcmUgd2hlcmUgZGlzcGxheSBjb250cm9sbGVy
IGluIHRoZSBTb0Mga25vd3MpIG9yIGl0IHNob3VsZCBiZSBhIGdwaW8NCj4gPiB0byB0aGUgcGFu
ZWwgKHRyb2dkb3IgY2FzZSkuIFRoZSBicmlkZ2Ugb3BzIGNhbiBpbXBsZW1lbnQNCj4gPiBEUk1f
QlJJREdFX09QX0hQRCBhbmQgdGhlIGZpcnN0IGJyaWRnZSBmcm9tIHRoZSBlbmNvZGVyIHRoYXQg
c3VwcG9ydHMNCj4gPiBIUEQgY2FuIGltcGxlbWVudCBzb21lIHNvcnQgb2YgIndhaXQgZm9yIGhw
ZCBhc3NlcnRlZCIgZnVuY3Rpb24gdGhhdA0KPiA+IHRoZSBwYW5lbCB0aGVuIHVzZXMgb25jZSBp
dCBwb3dlcnMgdXAgdGhlIHBhbmVsIGR1cmluZyBwcm9iZS4gSWYgdGhlDQo+ID4gcGFuZWwgaGFz
IGEgZ3BpbyBhbmQgbm90aGluZyBlbHNlIGluIHRoZSBjaGFpbiBjYW4gZGV0ZWN0IGhwZCB0aGVu
IHRoZQ0KPiA+IHBhbmVsIHBvbGxzIHRoZSBncGlvLCBvciBpdCB3YWl0cyBmb3IgdGhlIGFtb3Vu
dCBvZiB0aW1lIGRlbGF5IGFmdGVyDQo+ID4gcG93ZXJpbmcgb24gdGhlIHBhbmVsIGlmIHRoZSBw
YW5lbCdzIGhwZCBmdW5jdGlvbiBpcyBjYWxsZWQuDQo+IA0KPiBZZWFoLCB0aGVyZSBvdWdodCB0
byBiZSBzb21lIHdheSB0byBtYWtlIHNvbWV0aGluZyBsaWtlIHRoYXQgd29yay4gSSBkb24ndA0K
PiB0aGluayBpdCdzIGp1c3QgRFJNX0JSSURHRV9PUF9IUEQsIHRob3VnaCwgZm9yIGEgZmV3IHJl
YXNvbnM6DQo+IA0KPiAxLiBUaGF0IG9wZXJhdGlvbiBhY3R1YWxseSBzcGVjaWZpY2FsbHkgbWVh
bnMgdGhhdCBIUEQgY2FuIGNhdXNlIGFuIGludGVycnVwdA0KPiBhbmQgdGhhdCB0aGUgYnJpZGdl
IHByb21pc2VzIHRvIGNhbGwgZHJtX2JyaWRnZV9ocGRfbm90aWZ5KCkgd2hlbiB0aGUNCj4gaW50
ZXJydXB0IG9jY3Vycy4gSXQgc2VlbXMgdG8gd29yayBoYW5kLWluLWhhbmQgd2l0aA0KPiAiRFJN
X0JSSURHRV9PUF9ERVRFQ1QiLiBJIGtub3cgaXQncyBsZWdpdCB0byBhZHZlcnRpc2UgImRldGVj
dCINCj4gd2l0aG91dCAiSFBEIiAoeW91IGhhdmUgYW4gSFBEIGxpbmUgdGhhdCBjYW4gYmUgcG9s
bGVkIGJ1dCBub3QgY2F1c2UNCj4gaW50ZXJydXB0cykgYnV0IEknZCBoYXZlIHRvIHJlc2VhcmNo
IHdoZXRoZXIgaXQncyBsZWdhbCB0byBhZHZlcnRpc2UgIkhQRCINCj4gd2l0aG91dCAiZGV0ZWN0
Ii4NCj4gDQo+IDIuIElmIGl0IHdlcmUgdXAgdG8gbWUsIEknZCByYXRoZXIgYXZvaWQgY29uZmxh
dGluZyB3aGF0IHdlIG5lZWQgd2l0aCB0aGUNCj4gZXhpc3RpbmcgIkhQRCIgYW5kICJERVRFQ1Qi
IG9wcy4gV2hpbGUgdGhlIGxpbmUgaXMgY2FsbGVkICJIUEQiIGluIHRoZSBlRFANCj4gc3BlYywg
d2hhdCB3ZSdyZSBsb29raW5nIGZvciBoZXJlIGlzIHJlYWxseSBhIGRpZmZlcmVudCBjb25jZXB0
LiBlRFAgcGFuZWxzIGFyZQ0KPiBuZXZlciBob3QgcGx1Z2dlZCBhbmQgYXJlIGFsd2F5cyBwcmVz
ZW50LCBzbyBJJ2QgcGVyc29uYWxseSByYXRoZXIgaXQgYmUgYQ0KPiBuZXcgT1AgbGlrZSAiT1Bf
UEFORUxfUkVBRFkiLiBPZiBjb3Vyc2UsIGluIHdoYXRldmVyIGZ1dHVyZSBwYXRjaCB3ZQ0KPiBj
b3VsZCBhbHdheXMgZGViYXRlIHRoaXMuDQo+IA0KPiAzLiBUaGUgbWFpbiByZWFzb24gSSdkIHBy
ZWZlciBhIGRpZmZlcmVudCBvcCBpcyB0aGF0IEkgdGhpbmsgdXNpbmcgdGhlIGV4aXN0aW5nDQo+
IG9wcyB3aWxsIGNvbmZ1c2UgRFJNIChub3QganVzdCBiZWNhdXNlIEknbSBiZWluZyBwZWRhbnRp
YykuDQo+IElmIERSTSBzZWVzIHRoYXQgdGhlIGVEUCBjb250cm9sbGVyIGRyaXZlciBhZHZlcnRp
c2VzIHRoYXQgaXQgY2FuICJkZXRlY3QiIGFuZA0KPiBzdXBwb3J0ICJocGQiIHRoZW4gaXQgd2ls
bCB1c2UgdGhlc2UgZnVuY3Rpb25zIHRvIGRlY2lkZSB3aGV0aGVyIGl0IHNob3VsZA0KPiBzdGFy
dCB0dXJuaW5nIG9uIHRoZSBwYW5lbC4gLi4uYW5kIGl0IHdvbid0IGV2ZW4gdHJ5IHVzaW5nIHRo
ZSBwYW5lbCB1bnRpbCBvbmUgaXMNCj4gZGV0ZWN0ZWQsIHJpZ2h0PyAuLi5idXQgdGhhdCBtZWFu
cyB0aGF0IGl0IHdvbid0IGJlIHBvd2VyZWQgb24gYW5kIHdpbGwgbmV2ZXINCj4gYmUgZGV0ZWN0
ZWQuIDstKSBUaGlzIGlzIHdoYXQgSSdtIHRyeWluZyB0byBnZXQgYXQ6IGl0J3MgYSBkaWZmZXJl
bnQgY29uY2VwdC4gVGhlDQo+IHBhbmVsIGlzIGFsd2F5cyB0aGVyZSBhbmQgbmV2ZXIgaG90cGx1
Z2dlZC4gVGhlIGV4aXN0aW5nIERSTSBvcHMgKElNTykgYXJlDQo+IGZvciBrbm93aW5nIHdoZXRo
ZXIgYSBwYW5lbCBpcyBwaHlzaWNhbGx5IHByZXNlbnQuIEZvciBlRFAgdGhlIGFuc3dlciBpcw0K
PiBhbHdheXMgYSByZXNvdW5kaW5nICJ5ZXMiLCBldmVuIGlmIHdlIGhhdmUgbm8gYWN0dWFsIGV2
aWRlbmNlIChiZWNhdXNlIHdlDQo+IGNhbid0IGdhdGhlciBldmlkZW5jZSBmb3IgYW4gIm9mZiIg
cGFuZWwpLiBPbiBlRFAgdGhlIEhQRCBsaW5lIHNpbXBseSBtZWFucw0KPiBzb21ldGhpbmcgZGlm
ZmVyZW50IHRoYW4gb24gRFAuDQo+IA0KPiANCj4gPiA+ID4gPiBGb3IgdGhlIERQIGNhc2UgdGhp
cyBzaG91bGQgbm90IGNhdXNlIGFueSBzaWduaWZpY2FudCBvdmVyaGVhZCwgcmlnaHQ/DQo+ID4g
PiA+ID4gSFBEIHNob3VsZCBhbHdheXMgYmUgYXNzZXJ0ZWQgc28gdGhpcyBpcyBiYXNpY2FsbHkg
anVzdCBvbmUNCj4gPiA+ID4gPiBleHRyYSBJTyByZWFkIGNvbmZpcm1pbmcgdGhhdCBIUEQgaXMg
YXNzZXJ0ZWQgd2hpY2ggc2hvdWxkIGJlIGFsbW9zdA0KPiBub3RoaW5nLi4uDQo+ID4gPiA+ID4g
WW91J3JlIGp1c3QgYWJvdXQgdG8gZG8gYSB3aG9sZSBidW5jaCBvZiBJTyByZWFkcy93cml0ZXMg
aW4NCj4gPiA+ID4gPiBvcmRlciB0byBwcm9ncmFtIHRoZSBBVVggdHJhbnNhY3Rpb24gYW55d2F5
Lg0KPiA+ID4gPg0KPiA+ID4gPiBJbiB0aGUgRFAgY2FzZSB0aGUgZG9uZ2xlL2NhYmxlIGNhbiBi
ZSBkaXNjb25uZWN0ZWQgaW4gdGhlIG1pZGRsZQ0KPiA+ID4gPiBvZiBhdXggdHJhbnNhY3Rpb25z
LiBJZiB0aGF0IGhhcHBlbnMgd2UgY291bGQgYmUgd2FpdGluZyBhIHdoaWxlDQo+ID4gPiA+IGlu
IHRoaXMgdHJhbnNmZXIgZnVuY3Rpb24gdG8gdGltZW91dCBsb29raW5nIGZvciB0aGUgc3RhdHVz
IGJpdC4NCj4gPiA+ID4gVGhlIGRyaXZlciBhbHJlYWR5IGdldHMgYW4gInVucGx1ZyIgaXJxIHdo
ZW4gdGhlIGNhYmxlIGlzDQo+ID4gPiA+IGRpc2Nvbm5lY3RlZCB0aG91Z2ggc28gaXQgd291bGQg
YmUgYmV0dGVyIHRvIGZpZ3VyZSBvdXQgYSB3YXkgdG8NCj4gPiA+ID4gc3RvcCB0aGUgYXV4IHRy
YW5zYWN0aW9ucyBxdWlja2x5IHdoZW4gdGhhdCBoYXBwZW5zIHdpdGhvdXQgaGF2aW5nDQo+ID4g
PiA+IHRvIHJlYWQgdGhlIGhhcmR3YXJlIGFuZCBwb2xsIHRoZSBiaXQgdGhhdCB3ZSBhbHJlYWR5
IGtub3cgaXMNCj4gPiA+ID4gZG9vbWVkIHRvIHRpbWVvdXQuIEkgdGhpbmsgYXBwbGUgZG9uZ2xl
cyB0aHJvdyB0aGlzIGxvZ2ljIGZvciBhDQo+ID4gPiA+IGxvb3AgdGhvdWdoIGJlY2F1c2UgdGhl
IEhETUkgY2FibGUgY2FuIGJlIGRpc2Nvbm5lY3RlZCBmcm9tIHRoZQ0KPiA+ID4gPiBkb25nbGUg
YW5kIHRoZW4gd2UgZG9uJ3Qgc2VlIGFuICJ1bnBsdWciIGlycSwganVzdCB0aGUgbnVtYmVyIG9m
IHNpbmtzDQo+IGJlY29tZXMgMC4gTWF5YmUgdGhlcmUncyBhbiBpcnFfaHBkIGV2ZW50LCBub3Qg
c3VyZS4NCj4gPiA+DQo+ID4gPiBBaCwgaW50ZXJlc3RpbmcuIEhhdmluZyBhIERQIGNhYmxlIHVu
cGx1Z2dlZCBpbiB0aGUgbWlkZGxlIG9mIGFuIGF1eA0KPiA+ID4gdHJhbnNhY3Rpb24gZG9lcyBz
ZWVtIGxpa2UgaXQgY291bGQgYmUgYSBwcm9ibGVtLiBXaGF0IGlmIHdlIGp1c3QNCj4gPiA+IHdh
aXQgaW4gdGhlIGNhc2Ugb3VyIGJyaWRnZS50eXBlIGlzICJEUk1fTU9ERV9DT05ORUNUT1JfZURQ
Ij8NCj4gVGhhdA0KPiA+ID4gc2hvdWxkIGJlIGVhc3ksIHJpZ2h0Pw0KPiA+DQo+ID4gU291bmRz
IGxpa2UgaXQgd291bGQgd29yay4gSXMgdGhpcyBzdXBwb3NlZCB0byBmaXggc29tZSBEUCBjYXNl
IGFzDQo+ID4gd2VsbCB0aG91Z2g/IFRoZXJlIHdlcmUgc29tZSBwYXRjaGVzIHRvIHNwZWVkIHVw
IGF1eCBmYWlsdXJlcyB3aGVuIHRoZQ0KPiA+IGRvbmdsZSB3YXMgdW5wbHVnZ2VkIGJ1dCBJIGhh
dmVuJ3QgY2hlY2tlZCBhZnRlciB0aGF0LiBJIGd1ZXNzIHRoaXMNCj4gPiB3YWl0aW5nIGlzIG9u
bHkgaW1wb3J0YW50IGZvciBlRFAgYmVjYXVzZSB0aGUgZWRwLXBhbmVsIGNvZGUgaXMgdHJ5aW5n
DQo+ID4gdG8gcmVhZCBFRElEIGFuZCBpdCBpc24ndCB3YWl0aW5nIGZvciBIUEQgdG8gYmUgYXNz
ZXJ0ZWQgYmVmb3JlIGRvaW5nIHRoYXQuDQo+IA0KPiBSaWdodCwgSSB0aGluayB0aGlzIGlzIG9u
bHkgaW1wb3J0YW50IGZvciBlRFAuDQo+IA0KPiANCj4gPiA+ID4gVGhhdCBkb2Vzbid0IHNvdW5k
IHJpZ2h0Lg0KPiA+ID4gPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgSFBEIHdpbGwgYmUgYXNz
ZXJ0ZWQgYWZ0ZXIgdGhlIHBhbmVsIGlzDQo+ID4gPiA+IHBvd2VyZWQgdXAuIEJlZm9yZSB0aGF0
IEhQRCBpcyBkZWFzc2VydGVkLiBTaW1pbGFybHksIHdoZW4gd2UNCj4gPiA+ID4gcG93ZXIgZG93
biB0aGUgcGFuZWwsIEhQRCB3aWxsIGJlIGRlYXNzZXJ0ZWQuIEkgZ3Vlc3MgRFJNIHdhbnRzIHRv
DQo+ID4gPiA+IGFzc3VtZSB0aGF0IGFuIGVEUCBwYW5lbCBpcyBhbHdheXMgY29ubmVjdGVkPyBU
aGF0IHNvdW5kcyBsaWtlIGl0DQo+ID4gPiA+IG1pZ2h0IGJlIE9LIGFzIGxvbmcgYXMgdXNlcnNw
YWNlIGRvZXNuJ3QgdXNlICJjb25uZWN0ZWQiIHRvIGtub3cNCj4gPiA+ID4gdGhhdCBpdCdzIE9L
IHRvIGRvIHRoaW5ncyBsaWtlIHJlYWQvd3JpdGUgYXV4IG9yIHB1c2ggcGl4ZWxzIHRvIHRoZSBw
YW5lbA0KPiB3aGVuIEhQRCBpcyBkZWFzc2VydGVkLg0KPiA+ID4NCj4gPiA+IElNTyBoYXZpbmcg
dXNlcnNwYWNlIHJlYWRpbmcgLyB3cml0aW5nIGF1eCBkaXJlY3RseSBhbmQgZXhwZWN0aW5nIGl0
DQo+ID4gPiB0byB3b3JrIGlzIGEgdGVycmlibGUgaWRlYSBhbnl3YXkuIEl0J3MgX21heWJlXyBz
b3J0YSBPSyBpbiB0aGUgRFANCj4gPiA+IGNhc2UsIGJ1dCBpdCdzIHJlYWxseSBub3QgZ29vZCBp
biB0aGUgZURQIGNhc2UuIFRvIG1lIGl0J3Mgc29ydGENCj4gPiA+IGxpa2UgZXhwZWN0aW5nIHRo
aW5ncyB0byBiZSBhbWF6aW5nIGFuZCBmb29scHJvb2Ygd2hlbiB5b3UgZ28gYmVoaW5kDQo+ID4g
PiB0aGUga2VybmVsJ3MgYmFjayBhbmQgd3JpdGUgdG8gYW4gaTJjIGRldmljZSB1c2luZyBgaTJj
c2V0IC1mYC4NCj4gPiA+IFN1cmUsIGl0IG1pZ2h0IHdvcmssIGJ1dCBpdCBjYW4gYWxzbyBjb25m
dXNlIHRoZSBoZWNrIG91dCBvZiB0aGluZ3MuDQo+ID4gPiBJdCBhbHNvIHR1cm5zIG91dCB0byBi
ZSBhIGh1Z2UgcHJvYmxlbSB3aGVuIHlvdSBnZXQgdG8gUFNSIGJlY2F1c2UNCj4gPiA+IHVzZXJz
cGFjZSB3aWxsIGdldCBlcnJvcnMgaWYgaXQgdHJpZXMgdG8gd3JpdGUgdG8gdGhlIEFVWCBjaGFu
bmVsDQo+ID4gPiBhbmQgdGhlIHBhbmVsIGlzIGluIFBTUiBtb2RlLiBUaGlzIGNhbWUgdXAgaW4g
dGhlIGNvbnRleHQgb2YgQnJpYW4ncw0KPiA+ID4gYW5hbG9naXggZHAgcGF0Y2hlcyBbMV0uIFRo
ZSByaWdodCBhbnN3ZXIsIGluIG15IG1pbmQsIGlzIHRvIHRyZWF0DQo+ID4gPiB1c2Vyc3BhY2Ug
YWNjZXNzaW5nIHRoZSBBVVggY2hhbm5lbCBkaXJlY3RseSBhcyBtb3JlIG9mIGEgZGVidWcNCj4g
PiA+IGZlYXR1cmUsIGF0IGxlYXN0IGZvciBlRFAgcGFuZWxzLg0KPiA+DQo+ID4gSWYgaXQncyBh
IGRlYnVnIGZlYXR1cmUgdGhlbiBpdCBzaG91bGQgYmUgcmVtb3ZlZCBmcm9tIHRoZSBzeXN0ZW0u
IFRoZQ0KPiA+IGZsb3cgb2YgZGF0YSBpcyBwYXNzaW5nIHRocm91Z2ggdGhlIGtlcm5lbCBzbyBp
ZiB0aGUga2VybmVsIGlzIGdldHRpbmcNCj4gPiBjb25mdXNlZCBhYm91dCBiYWNrZG9vciBhY2Nl
c3Mgb3ZlciBhdXggaXQgc2hvdWxkIHNub29wIHRoZQ0KPiA+IHRyYW5zYWN0aW9ucyBhbmQgYmxv
Y2sgdGhpbmdzIGl0IGRvZXNuJ3QgbGlrZS4gSSBkb24ndCBrbm93IHRoZQ0KPiA+IGJhY2tzdG9y
eSBvbiBhdXggYmVpbmcgZXhwb3NlZCB0byB1c2Vyc3BhY2UsIGJ1dCBsZWF2aW5nIGl0IGluIGEg
YnJva2VuDQo+IHN0YXRlIGlzbid0IGdvb2QuDQo+IA0KPiBBZ3JlZWQsIGl0J3Mgbm90IGEgZ3Jl
YXQgc2l0dWF0aW9uLiA6KA0KPiANCj4gLURvdWcNCg==
