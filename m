Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1334E7438
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Mar 2022 14:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356238AbiCYNcj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 09:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237277AbiCYNci (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 09:32:38 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A849BAD4;
        Fri, 25 Mar 2022 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1648215063; x=1648819863;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zy9xbP9DjpE5o5gQ0ciOgX3pyyT9H7G5MEq4t4MlKhA=;
  b=iG5D8fF8pTW7mAPHjYb1cAUP7HEv4fqA9j+mMeqaKYz2YKL4iGuMwHn8
   5eNyJL0+348BvFtssuvSWm0Cla5PEADBlcJFRX5ytkSuzApKjw6xrmkA1
   x4ytAI5stuHHefJQzaTEJ01fycd5lDKzUhCCEb9H0cIfEwogwyUjK3Z2f
   E=;
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 13:31:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftmsR7OGAGsM4gOMrjUcsSymts3pcKYNxMoTXfCzucHU1NhSK9lxckbde4BeIwCneBQi9UUoLgDRXZWQ21kPHQom7rK3z+mEWys0YLH5Nyx+gg7Oag0RvxUD+jo1pjuKqBp7idX7LpYpDxiy4DZho8Pjdk7H7JF/nTc09/5zLMwt77XvsBxEpxOZWdgM1lYySu5Inc42zaMBOEyTuuIXNBHamH6IIEJ8FVj5cglkfm4iOcPhEkRxJ9wH5gOkdHSDGrj1upr80euxb0KEQOqy2btsAenlYE50I/TEF602WgDDof9yOLP8/nVjLLuOtWARIz/yMtugtiRzaufsS7I2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zy9xbP9DjpE5o5gQ0ciOgX3pyyT9H7G5MEq4t4MlKhA=;
 b=iArV0eGYSC91C//YcGWFfKXbfZT4UO6MEnmlxvmun01kSA8Zo3eiwsaMUylU5BQji+q/+lFhk+sA4dqHU38bBGztaP9I9+YZqOuBiexoVT5+l8toiqr5Bj5amKDoSLcqPcXHw5XcImvG3wjPwXRJ6jALVbHsOrjZghhqspJEDmAnDk8f/PgEWT2qPpQUyV88UDwrI+V5qPhQ8zmKwRVyWTygyePtTWqBx6TqWFSKI5oZD56PVqhq+ilp6Zwm8Fo07gmaf3maRux4GysdlA5X8ZO75jSI59zw3PzEkq+5QelGEiyh6fR9Z0B8R+FZntHAHcIX5sIlpXa/U3oD8K1ZJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by SA1PR02MB8431.namprd02.prod.outlook.com (2603:10b6:806:1f6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 13:30:58 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::44bc:87fa:db04:78ff]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::44bc:87fa:db04:78ff%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 13:30:58 +0000
From:   "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To:     Stephen Boyd <swboyd@chromium.org>,
        "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "robdclark@gmail.com" <robdclark@gmail.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "dianders@chromium.org" <dianders@chromium.org>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "sean@poorly.run" <sean@poorly.run>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "sam@ravnborg.org" <sam@ravnborg.org>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        quic_vproddut <quic_vproddut@quicinc.com>
Subject: RE: [PATCH v5 2/9] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
Thread-Topic: [PATCH v5 2/9] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
Thread-Index: AQHYOVxnBpAAlUTw+kSisBmWl9Zi3qzEF7aAgAwOrRA=
Date:   Fri, 25 Mar 2022 13:30:58 +0000
Message-ID: <MW4PR02MB718635E7712D44094E6E91F3E11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n52Uzo47N5QzoKOwny3XTrArA4nM-KPqAVxAPewSAyNOWw@mail.gmail.com>
In-Reply-To: <CAE-0n52Uzo47N5QzoKOwny3XTrArA4nM-KPqAVxAPewSAyNOWw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8252a469-f2a0-4618-ce2e-08da0e63b295
x-ms-traffictypediagnostic: SA1PR02MB8431:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SA1PR02MB843145B778161BCD46634E339D1A9@SA1PR02MB8431.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c9zfptgGOj8/95m6bapgqO9tpTnBGIfrh1I0W0RweK3n+QnaU4nU8h6ESKBeox+nHjkCFBZodTH3XEKRv0NKNxE9vB+YN/qLQ13nizH/NSZ08pi0gkomPOYuGDPlY6HEgtgF5BDPW1OdGacIPNVLRfWVHcDleYOHDvVwYx/NOCH+43T+k7xAB8xdnKdWU5T0Gr4zQaz912v/7F4pZB4IyIJtU0VHFgbbWuYNdsB3tfWZVqWAi1msiGXSczPWjPwC0xWHjLDNCZpHNSLt3DtWWv8m5L/hIRc/m6RGyrEastV1OnN8tV2/nTK9EwsK9ErIpqUA6TL+16eAT+8+9JU9wW+oQhr8V3miakvN6jPvwimjSBPb6qKMClil195RkzIL9Xn+KsIlB9Yrf3hj/CrDYeABed/9zZI8EUdkqSNkZX8lrgsrEx5RUHJX3R2CLF5py5Yb1bd2rtTN0L+3+QK2OIvBEEqjPKffzMqwZTHr46OruTd1dV7Wh2Eo588X+YSpvoLFalGDsKvGk93MpyTUifUpQvv7yhrl+1RtlV2ycGFLuU3Vs9oVMEiogxrttTNDTuxFysS2L481V0OYEhXkDWFQ+vlDqgYe1F8aiM2yMDWKxVRP3Q9/xLsGWUrXzz4RGhIKPVjg0eieyDK8p8dG7hMMHieUYslGK+FSPhX3Aso/cbhUjNYUo4HGc9Qocz/BgNuS/cK+Fas+zoVhb86oXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR02MB7186.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7416002)(2906002)(53546011)(5660300002)(83380400001)(7696005)(66946007)(66446008)(6506007)(66476007)(66556008)(316002)(186003)(38100700002)(26005)(508600001)(38070700005)(8936002)(107886003)(4326008)(33656002)(52536014)(8676002)(54906003)(86362001)(55016003)(110136005)(9686003)(71200400001)(76116006)(64756008)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXhyK09lUk5uRWQ4RzVVRDdVVStjNW04eUlZaFVSbUV2R1RBYXIyL3FVbGsz?=
 =?utf-8?B?L3g2anZIZm80NUdOMHhFei9XdC9aK1dmUHVBTGREamhOUCtvRTJMcHFaY29O?=
 =?utf-8?B?ZStCVi9PcjNLaU9pWk4rZE1SNEdtSFNMRWw5WWxoSjBxTGF0Sm1NbmI5UVVB?=
 =?utf-8?B?U0c4ZEJEWU5EaTU0dy9wWno2MUszSmg0UElCZWc5UHBHYkVGZjhuZWMydTU1?=
 =?utf-8?B?enVubTVUdVluY215UTNpTXdwUDZBYW1yRlFaNWorWUdGRFVBNEg0M3prd0dL?=
 =?utf-8?B?TG5DQnJwQUxOOWRHYXpWQm1lZ090WWNnUEhWQ0xudHNudzJ4QVB6SWx6TzF3?=
 =?utf-8?B?RngzSzZpQU4xdmhxWmpyNCtnOUp3T2NBQmFCTTZ6bmlpYXQwWTBRVFNzQUlO?=
 =?utf-8?B?Wk5xN2VhdWFGSTFPVzhkQzBlT2JmNkthb0VNY1NHSnRnSmVrUUNweCtTZGox?=
 =?utf-8?B?UlZUY3hwNmN1VEdFbzRoY3dBSmtpWk5lMUZUVmZCaGI5STNLQkRGQUVpOHJE?=
 =?utf-8?B?Q0RGYzdQWVRCNk5lRnlDQmw1dE5CZDV0VDcxVURRYlVzZHBFQ0xrQ1VlMFJH?=
 =?utf-8?B?OUt2dGw1UlBxS01CUFN6NFR3dFY3TitTR3NBMkU1ZDhlZVQxMU03SEUwN1BY?=
 =?utf-8?B?TUYwTzhNSlhsRW5sUlp3MFFHUGJ0c3Awa1BrWEovLzJhelZRNXVqVXAveE5O?=
 =?utf-8?B?WEJmUCs3TE80ay9PM0JmaVJoVXcwNjBCV3hqUVo4TXROR2hZdzhQMHZKd3Bi?=
 =?utf-8?B?WC9hS2dlMFkzTkw5Z2d0S3FjaFl3enFtZjJFZDhVVGxrNE55TC9JaE9ZWFYz?=
 =?utf-8?B?bW5SVWxFQjB0dkJFck41N2FYTERXMDM4MlBWdEgrdHBQdXZwN1g1SExEZ21P?=
 =?utf-8?B?eHVBMVdlVmdXQXpWM3E3bE5CbWZnVzlpVzFwTkRmV1VkbnI0cERFL1k3R1FX?=
 =?utf-8?B?MC9qNVQ3UzFRRVNmWTMvUDdxVllwRXNRaDVGWkFOTVA4V0xjZHk4WVYzZGFT?=
 =?utf-8?B?TWtRNG9pTXFMblJmblJabWZNcnd1MExXc3Z5REhQeUJISEcyKzJGVkpJQmVL?=
 =?utf-8?B?TTFqQlJ5Qnlpem5QVmtaYmdpTnNrNFc3ekNVVWtMYmZnZnVCYnB2ZWZuUXY5?=
 =?utf-8?B?YjVxckZpdTBmMXRzNmE4ckhJN1IyMWdZbXI4RFFoRk1qRjhWWDkzUXVFY2w5?=
 =?utf-8?B?S01DNU9zZjV5K0pFMWFvZCtidnZxSEtUQi9FL1FuYTFlR0YybmhPUVlHbEJU?=
 =?utf-8?B?ZHJlNkdUckY2aDRtN09BWlBsUHdTQjR0UkNwZFVwWHJFbktDV3Q5emtDQmMz?=
 =?utf-8?B?S2w3amFhTVBTNVMrU2RhT1MzVjdadGxldC96V3N4OEJJZmpZKzRHWENVK280?=
 =?utf-8?B?ZFhwV2doc1oxVGt0YlI2Wi8wcVBVZVJzRkdaSWp1ZDByRitCR29MdU83MHQ2?=
 =?utf-8?B?M3ZvRXEvdkFITGI0eDcySmVaWjVrZjBOa2VGL3c4TEpXeWxrWXpMY01NRnlp?=
 =?utf-8?B?Qk1sZXFJQXkwOFZmOC9TczlkQTdzQk9CdFNobW1ObUlzK1U4YW5mMWZwTEQv?=
 =?utf-8?B?SGlEcGtHeFQwd0U3Y1hUOStKK0JpL0FlSHkyNE85MWwwbFU0VWJTR2ZHTG1w?=
 =?utf-8?B?c0ZRM1lXRGpQT1pZT1gwMncwblF3cWhkeEVzOWpocWd1dm1VUGxJQTBCaEUv?=
 =?utf-8?B?OURHZHhSVUFoRzAxZUdqM1FGdDJxK3VOV2l2amZqQndqUG1vQm5FMm1CM2Mv?=
 =?utf-8?B?RmkzNVdzT2trUmpJYTJJMHZoZGtucGJSejBaRmxwbGwzWmRYK3BaWjNZMmVR?=
 =?utf-8?B?eStMcysrYU1LcTdOOWNyMDdNUUpjY3JETlR6NmdkanNNTnpoYlNaMFdweWdT?=
 =?utf-8?B?SC9HaE1EUWE5ckRUdkxYSFpoeEl6cDRVM20raFhSTHd3MENDQ0pTRnloeER2?=
 =?utf-8?B?VUxGL3IxdzF6REVHSENtS1FBU01MZE1sS3h0cUtkQ1NXKy9jN0s2Qk1BSnE2?=
 =?utf-8?B?Q2xlMXJhdERJMDQveEpXSW5HZjNrSHp1YXdyWXpsYUR4TVVqbWd1T3A3Tlo5?=
 =?utf-8?B?U1JCNzBUczRvQ3FCZG9jZzhjUkovL1drL2lacjlCT0J1M0VZcm1URzVzTmMr?=
 =?utf-8?B?SStVRE9WSGtwVkJRWmJFSG9pVkJ2TVdPdjYvZjJuVGYvYmQwYjVyZ2dUM3py?=
 =?utf-8?B?TjUrUFprSnNlUnp6NjZGZGs2R3djaG9NOXBVdHJOUVFMYUQxTHh5OHdnVlFF?=
 =?utf-8?B?RHozWUxpQW84eWl5QitNMFBvanhsNm9BVTdnbkZmN1Q0eGplSXc1b0xIcUpB?=
 =?utf-8?B?WW1nV3hnem11akhENUhkcFhyem5NdStRVERObmx5eDJMTXFmMkQ2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8252a469-f2a0-4618-ce2e-08da0e63b295
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2022 13:30:58.5028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jAXPBJfDknNCNoyIb5LCRJZiU455PdBLkGTGXo05nm7+v+KUrdLv/PftHyGypqcbfmXq38CcfTmuRqtbmoUFk4pl193gmvBQFDbzsQQRTVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8431
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBCb3lkIDxz
d2JveWRAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDE4LCAyMDIyIDI6NTMg
QU0NCj4gVG86IFNhbmtlZXJ0aCBCaWxsYWthbnRpIChRVUlDKSA8cXVpY19zYmlsbGFrYUBxdWlj
aW5jLmNvbT47DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOw0KPiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51
eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcNCj4gQ2M6IHJvYmRjbGFya0BnbWFpbC5jb207IHNlYW5wYXVsQGNocm9taXVtLm9yZzsgcXVp
Y19rYWx5YW50DQo+IDxxdWljX2thbHlhbnRAcXVpY2luYy5jb20+OyBBYmhpbmF2IEt1bWFyIChR
VUlDKQ0KPiA8cXVpY19hYmhpbmF2a0BxdWljaW5jLmNvbT47IGRpYW5kZXJzQGNocm9taXVtLm9y
ZzsgS3VvZ2VlIEhzaWVoDQo+IChRVUlDKSA8cXVpY19raHNpZWhAcXVpY2luYy5jb20+OyBhZ3Jv
c3NAa2VybmVsLm9yZzsNCj4gYmpvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc7IHJvYmgrZHRAa2Vy
bmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOw0KPiBzZWFuQHBvb3JseS5ydW47IGFpcmxpZWRA
bGludXguaWU7IGRhbmllbEBmZndsbC5jaDsNCj4gdGhpZXJyeS5yZWRpbmdAZ21haWwuY29tOyBz
YW1AcmF2bmJvcmcub3JnOw0KPiBkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc7IHF1aWNfdnBy
b2RkdXQgPHF1aWNfdnByb2RkdXRAcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djUgMi85XSBhcm02NDogZHRzOiBxY29tOiBzYzcyODA6IEFkZCBzdXBwb3J0IGZvciBlRFANCj4g
cGFuZWwgb24gQ1JEDQo+IA0KPiBRdW90aW5nIFNhbmtlZXJ0aCBCaWxsYWthbnRpICgyMDIyLTAz
LTE2IDEwOjM1OjQ3KQ0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20v
c2M3MjgwLWNyZC5kdHMNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAtY3Jk
LmR0cw0KPiA+IGluZGV4IGUyZWZiZGQuLjJkZjY1NGUgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9xY29tL3NjNzI4MC1jcmQuZHRzDQo+ID4gKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9xY29tL3NjNzI4MC1jcmQuZHRzDQo+ID4gQEAgLTcsNiArNyw3IEBADQo+ID4NCj4g
PiAgL2R0cy12MS87DQo+ID4NCj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvcWNv
bSxwbWljLWdwaW8uaD4NCj4gPiAgI2luY2x1ZGUgInNjNzI4MC1pZHAuZHRzaSINCj4gPiAgI2lu
Y2x1ZGUgInNjNzI4MC1pZHAtZWMtaDEuZHRzaSINCj4gPg0KPiA+IEBAIC0yMSw2ICsyMiwyNyBA
QA0KPiA+ICAgICAgICAgY2hvc2VuIHsNCj4gPiAgICAgICAgICAgICAgICAgc3Rkb3V0LXBhdGgg
PSAic2VyaWFsMDoxMTUyMDBuOCI7DQo+ID4gICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAg
IGVkcF8zdjNfcmVndWxhdG9yOiBlZHAtM3YzLXJlZ3VsYXRvciB7DQo+ID4gKyAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsNCj4gPiArICAgICAgICAgICAgICAg
cmVndWxhdG9yLW5hbWUgPSAiZWRwXzN2M19yZWd1bGF0b3IiOw0KPiA+ICsNCj4gPiArICAgICAg
ICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+ID4gKyAgICAg
ICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Ow0KPiA+ICsNCj4g
PiArICAgICAgICAgICAgICAgZ3BpbyA9IDwmdGxtbSA4MCBHUElPX0FDVElWRV9ISUdIPjsNCj4g
PiArICAgICAgICAgICAgICAgZW5hYmxlLWFjdGl2ZS1oaWdoOw0KPiA+ICsNCj4gPiArICAgICAg
ICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArICAgICAgICAgICAgICAg
cGluY3RybC0wID0gPCZlZHBfcGFuZWxfcG93ZXI+Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArDQo+
ID4gKyAgICAgICB2cmVnX2VkcF9icDogdnJlZy1lZHAtYnAtcmVndWxhdG9yIHsNCj4gPiArICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOw0KPiA+ICsgICAgICAg
ICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJ2cmVnX2VkcF9icCI7DQo+ID4gKyAgICAgICAgICAg
ICAgIHJlZ3VsYXRvci1hbHdheXMtb247DQo+ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1i
b290LW9uOw0KPiA+ICsgICAgICAgfTsNCj4gPiAgfTsNCj4gPg0KPiA+ICAmYXBwc19yc2Mgew0K
PiA+IEBAIC03Niw2ICs5OCw1OCBAQCBhcF90c19wZW5fMXY4OiAmaTJjMTMgew0KPiA+ICAgICAg
ICAgfTsNCj4gPiAgfTsNCj4gPg0KPiA+ICsmbWRzcyB7DQo+ID4gKyAgICAgICBzdGF0dXMgPSAi
b2theSI7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmbWRzc19kcCB7DQo+ID4gKyAgICAgICBzdGF0
dXMgPSAib2theSI7DQo+ID4gKw0KPiA+ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsNCj4gPiArICAgICAgIHBpbmN0cmwtMCA9IDwmZHBfaG90X3BsdWdfZGV0PjsNCj4gPiArICAg
ICAgIGRhdGEtbGFuZXMgPSA8MCAxPjsNCj4gPiArICAgICAgIHZkZGEtMXAyLXN1cHBseSA9IDwm
dnJlZ19sNmJfMXAyPjsNCj4gPiArICAgICAgIHZkZGEtMHA5LXN1cHBseSA9IDwmdnJlZ19sMWJf
MHA4PjsgfTsNCj4gPiArDQo+ID4gKyZtZHNzX2VkcCB7DQo+ID4gKyAgICAgICBzdGF0dXMgPSAi
b2theSI7DQo+ID4gKw0KPiA+ICsgICAgICAgZGF0YS1sYW5lcyA9IDwwIDEgMiAzPjsNCj4gDQo+
IElzIHRoaXMgcHJvcGVydHkgbmVjZXNzYXJ5PyBJdCBsb29rcyBsaWtlIHRoZSBkZWZhdWx0Lg0K
PiANCg0KV2lsbCByZW1vdmUgaXQNCg0KPiA+ICsgICAgICAgdmRkYS0xcDItc3VwcGx5ID0gPCZ2
cmVnX2w2Yl8xcDI+Ow0KPiA+ICsgICAgICAgdmRkYS0wcDktc3VwcGx5ID0gPCZ2cmVnX2wxMGNf
MHA4PjsNCj4gPiArDQo+ID4gKyAgICAgICBhdXgtYnVzIHsNCj4gDQo+IENhbiB0aGlzIG1vdmUg
dG8gc2M3MjgwLmR0c2kgYW5kIGdldCBhIHBoYW5kbGU/DQo+DQoNCk9rYXksIEkgd2lsbCBtb3Zl
IHRoaXMgdG8gc2M3MjgwLmR0c2kgbGlrZSBiZWxvdy4NClNoYWxsIEkgZGVmaW5lIHRoZSByZXF1
aXJlZCBwcm9wZXJ0aWVzIHVuZGVyICZtZHNzX2VkcF9wYW5lbCBub2RlIGluIHRoZSBzYzcyODAt
Y3JkMy5kdHM/DQoNCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAuZHRzaQ0K
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NjNzI4MC5kdHNpDQpAQCAtMzI4Myw2ICsz
MjgzLDE4IEBADQoNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRp
c2FibGVkIjsNCg0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhdXgtYnVzIHsNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZHNzX2VkcF9wYW5lbDogcGFu
ZWwgew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJlZHAtcGFuZWwiOw0KKw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcG9ydCB7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG1kc3NfZWRwX3BhbmVsX2luOiBlbmRwb2ludCB7DQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZtZHNzX2VkcF9vdXQ+Ow0KKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB9Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB9Ow0KKw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3J0cyB7DQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47
DQpAQCAtMzI5Niw3ICszMzA4LDkgQEANCg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBvcnRAMSB7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8MT47DQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtZHNzX2VkcF9vdXQ6IGVuZHBvaW50IHsgfTsNCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1kc3NfZWRwX291dDogZW5kcG9pbnQg
ew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZW1vdGUtZW5kcG9pbnQgPSA8Jm1kc3NfZWRwX3BhbmVsX2luPjsNCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfTsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fTsNCiANCj4gPiArICAgICAgICAgICAgICAgZWRwX3BhbmVsOiBlZHAtcGFuZWwgew0KPiANCj4g
SSdkIHByZWZlcg0KPiANCj4gCWVkcF9wYW5lbDogcGFuZWwgew0KPiANCj4gYmVjYXVzZSB0aGVy
ZSdzIG9ubHkgb25lIHBhbmVsIG5vZGUgYXQgdGhpcyBsZXZlbC4NCj4gDQoNCk9rYXkuIEkgd2ls
bCBjaGFuZ2UgaXQuDQoNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
ImVkcC1wYW5lbCI7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLXN1
cHBseSA9IDwmZWRwXzN2M19yZWd1bGF0b3I+Ow0KPiANCj4gVGhpcyBpcyBib2FyZCBzcGVjaWZp
YywgYnV0IEkgdGhvdWdodCBpdCB3YXMgb24gdGhlIHFjYXJkIHNvIHdlIHNob3VsZCBtb3ZlDQo+
IHRoaXMgdG8gc2M3MjgwLXFjYXJkLmR0c2k/DQo+IA0KDQpRY2FyZCBpcyB1c2VkIG9ubHkgZm9y
IGhlcm9icmluZSBhcyBvZiBub3cgYWNjb3JkaW5nIHRvIHRoZSBjb2RlLiBXZSBkZWZpbmVkIHRo
aXMgb25seSBmb3IgQ1JELiBXZSB3aWxsIGRpc2N1c3MgdGhpcyBpbnRlcm5hbGx5IHRvIHVuZGVy
c3RhbmQgdGhlIHBsYW4gYWhlYWQuDQoNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwb3J0
cyB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0g
PDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9ydEAwIHsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlZHBfcGFuZWxfaW46IGVuZHBv
aW50IHsNCj4gDQo+IFRoaXMgY2FuIGJlIHNob3J0ZW5lZCB0bw0KPiANCj4gCQkJcG9ydCB7DQo+
IAkJCQllZHBfcGFuZWxfaW46IGVuZHBvaW50IHsNCj4gDQo+IGFjY29yZGluZyB0byBwYW5lbC1l
ZHAueWFtbA0KPiANCg0KT2theS4gSSB3aWxsIGRvIGl0DQoNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8Jm1kc3Nf
ZWRwX291dD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICB9Ow0K
PiA+ICt9Ow0KPiA+ICsNCj4gPiArJm1kc3NfZWRwX291dCB7DQo+ID4gKyAgICAgICByZW1vdGUt
ZW5kcG9pbnQgPSA8JmVkcF9wYW5lbF9pbj47IH07DQo+ID4gKw0KPiA+ICsmbWRzc19lZHBfcGh5
IHsNCj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZt
ZHNzX21kcCB7DQo+ID4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gK307DQo+ID4gKw0K
PiA+ICAmbnZtZV8zdjNfcmVndWxhdG9yIHsNCj4gPiAgICAgICAgIGdwaW8gPSA8JnRsbW0gNTEg
R1BJT19BQ1RJVkVfSElHSD47ICB9OyBAQCAtODQsNyArMTU4LDI2IEBADQo+ID4gYXBfdHNfcGVu
XzF2ODogJmkyYzEzIHsNCj4gPiAgICAgICAgIHBpbnMgPSAiZ3BpbzUxIjsNCj4gPiAgfTsNCj4g
Pg0KPiA+ICsmcG04MzUwY19ncGlvcyB7DQo+ID4gKyAgICAgICBlZHBfYmxfcG93ZXI6IGVkcC1i
bC1wb3dlciB7DQo+IA0KPiBJcyB0aGlzIHVzZWQgaW4gYSBsYXRlciBwYXRjaD8NCj4NCg0KWWVz
LCB3aWxsIG1vdmUgaXQgdG8gdGhhdCBwYXRjaC4NCiANCj4gPiArICAgICAgICAgICAgICAgcGlu
cyA9ICJncGlvNyI7DQo+ID4gKyAgICAgICAgICAgICAgIGZ1bmN0aW9uID0gIm5vcm1hbCI7DQo+
ID4gKyAgICAgICAgICAgICAgIHFjb20sZHJpdmUtc3RyZW5ndGggPSA8UE1JQ19HUElPX1NUUkVO
R1RIX0xPVz47DQo+ID4gKyAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgIGVkcF9ibF9wd206
IGVkcC1ibC1wd20gew0KPiANCj4gSXMgdGhpcyB1c2VkIGluIGEgbGF0ZXIgcGF0Y2g/IENhbiBp
dCBiZSBtb3ZlZCB0byB0aGUgcGF0Y2ggdGhhdCB1c2VzIGl0Pw0KPiANCg0KWWVzLCB3aWxsIG1v
dmUgaXQgdG8gdGhhdCBwYXRjaC4gV2Ugc3BsaXQgdGhlIHBhdGNoIHRvIGV4Y2x1ZGUgdGhlIGRl
cGVuZGVudCBwd20gbm9kZXMgc28gdGhhdCBCam9ybiBjYW4gbWVyZ2UgdGhpcyBwYXRjaC4gQnV0
IHdlIHdpbGwgbW92ZSBhbGwgdGhlIHJlbGF0ZWQgbm9kZXMgdG8gdGhlIG5leHQgcGF0Y2gNCg0K
PiA+ICsgICAgICAgICAgICAgICBwaW5zID0gImdwaW84IjsNCj4gPiArICAgICAgICAgICAgICAg
ZnVuY3Rpb24gPSAiZnVuYzEiOw0KPiA+ICsgICAgICAgICAgICAgICBxY29tLGRyaXZlLXN0cmVu
Z3RoID0gPFBNSUNfR1BJT19TVFJFTkdUSF9MT1c+Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArfTsN
Cj4gPiArDQo+ID4gICZ0bG1tIHsNCj4gPiArICAgICAgIGVkcF9wYW5lbF9wb3dlcjogZWRwLXBh
bmVsLXBvd2VyIHsNCj4gPiArICAgICAgICAgICAgICAgcGlucyA9ICJncGlvODAiOw0KPiA+ICsg
ICAgICAgICAgICAgICBmdW5jdGlvbiA9ICJncGlvIjsNCj4gDQo+IGZ1bmN0aW9uIG9mIGdwaW8g
aXMgdW5uZWNlc3NhcnkuIFdoZXJlIGlzIHRoZSBiaWFzIGFuZCBkcml2ZS1zdHJlbmd0aA0KPiBz
ZXR0aW5ncz8NCj4gDQoNCldpbGwgYWRkIGl0DQoNCj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+
ICAgICAgICAgdHBfaW50X29kbDogdHAtaW50LW9kbCB7DQo+ID4gICAgICAgICAgICAgICAgIHBp
bnMgPSAiZ3BpbzciOw0KPiA+ICAgICAgICAgICAgICAgICBmdW5jdGlvbiA9ICJncGlvIjsNCj4g
PiAtLQ0KPiA+IDIuNy40DQo+ID4NCg==
