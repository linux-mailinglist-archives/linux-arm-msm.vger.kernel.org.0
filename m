Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 818D34F9BD5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 19:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235182AbiDHRkp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 13:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235169AbiDHRkm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 13:40:42 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.140.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CEAC79388;
        Fri,  8 Apr 2022 10:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
  s=qccesdkim1; t=1649439517; x=1650044317;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Di+qhl6NDN4XOkLXncdLTv0HjMnaR2sx7cE3sSXIUQ8=;
  b=oNYjqXhGmazbdBBVVsXBToC/xZ9m9O36QPN7hA3ZCgmfZ5vL5PBUV4az
   YR4ZkVm4utKQMnEulCQ032fGNrxd49O+O41nXBWVYbkjEE2rYAjUaGQ3m
   Ky7rJhi202vY1dETlSZHV5tYfjVZR/V6Rx6aLfgoTxnzHMpwJITLql+CZ
   s=;
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 17:38:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8OpA4Z8jV2t91CAQe5tmlQ25a567e+xKS5LW00gESayAJudOecTPIVlSMYiF6zgcOtVXhWFhCJNhWMMF9sPnAH5kWeTBMlVUHUEUZhwcAY8E8GUNs9JaHPTirnU5pJQbPLUeCGwNZYA5GNZN3sGeNsYiC9t1Piot2JDiCXjVCRP+DgWWhXRxZaT3IfADA0F7uHQs6lfYKEfJ0PCW+j8o93Wxu37PoOHOrJgE4tzLPJlK2RWuHeCUTu7jEsann3WQuX34NdqYXxUYzP5fVqHMcVOrcy+kY6/JzuNrfHEPqp/Hi621ZsNqPtDqkMtMMAndubZAV7ABYDCEbWN4aYdgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Di+qhl6NDN4XOkLXncdLTv0HjMnaR2sx7cE3sSXIUQ8=;
 b=lmHwUhQEeb8263mXPMJRr8r3NhH8c0Not0GAG7oNIhH8UlK6UrOReRigXvHBxUImmRrD1o9PzqygJh5wY61iU8RdPeR/rP0BfPOJlKVrHbKLoXFrqVqMm2Fqcoc1z83utb14neFVeZPki0DvIOlmUEuWssg8gmeqrBql6yq7i/kxlvFZ0S2ilIDH19nfsdNnEEH1Gb5dQtr2JMlIICUoedjjJGRlz4dYYdJGeQtZIqLvi78gdejdHy8efsTzZa0aQdZhYXq4a/LBJ3Gx0VGbPTcFLBG4DZmZ6nUXgNufxMf/u4gz0nwu0FVRdgFGSTsArY6xU4eJronKwhrWKq05/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by BN6PR02MB2291.namprd02.prod.outlook.com (2603:10b6:404:2c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 17:38:31 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 17:38:31 +0000
From:   Sankeerth Billakanti <sbillaka@qti.qualcomm.com>
To:     "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
CC:     "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>,
        Doug Anderson <dianders@chromium.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        "swboyd@chromium.org" <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "sean@poorly.run" <sean@poorly.run>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>
Subject: RE: [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid differently from
 dp
Thread-Topic: [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid differently
 from dp
Thread-Index: AQHYRE/UsJWR5XLNukW2wMYYKa9U06zYfJ8AgACEi0CAASMMgIAF9JqAgAA0tICABDr0AIABcYYAgAA2HwCAABgQAIAABvOA
Date:   Fri, 8 Apr 2022 17:38:31 +0000
Message-ID: <MW4PR02MB7186C2AB04AAC0F8D2C74B32E1E99@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
 <CAA8EJprvE31ex3fCQHZ-=x+EWHK4UZ0qqHRh+rH4dk5TPhmVyw@mail.gmail.com>
 <MW4PR02MB71867220A90FCFED295830D0E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAD=FV=VK0D_GzYBv+u+o6-ks-UAsw97__0mWsSn9OycX72LJFg@mail.gmail.com>
 <MW4PR02MB71865B8E17F3D194B05013EDE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAA8EJpqFh7c9ohDbR_0kG5t106-djE7TYfaoAbiT-W4-294jTw@mail.gmail.com>
 <MW4PR02MB71868617E96D59D659EFD87EE1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAA8EJpqd+JVHqjNrwZ4MHi+9JMdA5QPX2UwGpeM6RhUntv0brA@mail.gmail.com>
 <MW4PR02MB7186577BFEEF3CCD8DED3D44E1E99@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAA8EJpo4MjqZDY4oLzS9ob6LPAe5gU=eqVz6m62_DaPAnxwWTQ@mail.gmail.com>
In-Reply-To: <CAA8EJpo4MjqZDY4oLzS9ob6LPAe5gU=eqVz6m62_DaPAnxwWTQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9168bf52-5e9f-41ce-e312-08da19869947
x-ms-traffictypediagnostic: BN6PR02MB2291:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR02MB22912C16A1439F1AAAA0A9D6E1E99@BN6PR02MB2291.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 36+ryNkwcn9xCmA6lWRAikli/HJeR1I0ekDyNmlN8l1Gw0WFzBCLKP+MNy+mpnPNphTOSsOYXfqV60g41ykPbdjWEzW5Zpihz/nS0nxnHu+VSvnth1LRT5RHNqKHxtCkArDMK7j7iSNjn8i5a1uaVr3+Aw8IjzQEFeG4ZTM02TY6+AqkkVOakKJwdMrfDWo7N3xLnabVZMASHW3Dh8WRx72h6Jpvy5xaVRBujgPxgIvM1YDnj4qJwssPrqyZ+G0EWBirwTWaaSYSejESQRL9ndjFaJngbARSC8QktLUTKTO5derCrfQxxQ/9aHuzMTtNbrk4uMUVQN59ZTxYU3+/jKq1w9oMAwciMWO0j6i63cmL6fazj+055bt76L//japj2pcYEx7KcIaaqlR22Y3aZQAnvH2KmWLyV8QsmOH1S+PuabUrh8+kX9H0isZpvX99lfsvjAd4m/pUVCxZUBcs2oDxRjSvhN41K4VaDe2h9MuHc6/coCCmzwFAqVNwYSGIrbgyH3E7ueSYpxAOpuce2KJ4aedh6EUWcYQ7prq6AsFVty+SgkZrsGfajLo84uKjEPB/ceFRKIde64lWiZNGhqSsacVeq+xoY+wO5bztcnDmuPt3jtfAwYyo9QAPtkmsBUd4IEBz0XRsG1qXxaDGh6L3ojduL9A9SDmBWFx8CL/Jmv9fJi4r238qj3Ij6asaRKSn1OFA0t5aWB9D16eYwA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR02MB7186.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(6506007)(7696005)(26005)(9686003)(38100700002)(122000001)(2906002)(8936002)(52536014)(107886003)(7416002)(6916009)(54906003)(316002)(5660300002)(4326008)(66476007)(71200400001)(33656002)(64756008)(38070700005)(76116006)(966005)(66446008)(66946007)(508600001)(66556008)(55016003)(8676002)(83380400001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVdDQllKYUV3YUVkeVVSZzVSQjlFVUZSNitZTjhuV1NJS3gwMFB6K1AwT0Y3?=
 =?utf-8?B?RDhCNWhySzd1bWwrTTVsNEo5ZGZ2cGNWOGlWaHgwZU5zT3ZySnVjdEp5UlpO?=
 =?utf-8?B?dnFTL1VyN0NOM01SVCtiN2pYS2dOR2FMb3hYbmp5eC90Vk9OaWRpY2ZUcEU2?=
 =?utf-8?B?Q1NXOXNlUDAwNG9LSnZ2eUl4UjVSYldReVpWRXVWdC80QmNzV3d6YjlCODRS?=
 =?utf-8?B?NWZFUDl4MUwrUUpEZWtBYnprMjhNemQ0cjk1UHp2YlFoQjlYck9OcjRJc0hz?=
 =?utf-8?B?ZUEzeFg0QXdUMStzeEZuMStnQmJzYnZ2R21XN2xXNVZwVmROME90MVBkRlVk?=
 =?utf-8?B?Z1NHTW9DYUNyNEw4Z3c1VnM0dFk5ZkdlT1JuNno3ZzlTdmdQOWxzd0lwc2g5?=
 =?utf-8?B?VGNVNCtDM1BJSzRWR1RmbVhMS3FvUXlDbGJBbmNtelhaQ0lyQnYrbk5PTTVa?=
 =?utf-8?B?cWYvQXBiNGRtV3lOZDNrdURpQ1ZKT0ZIMGlZVWtGOVV1c1VvTFAvM05MS2Mx?=
 =?utf-8?B?VFZ2QUI4aFVDNEsyUUVFZGJLRDZIOFZlZGpsWk9taDljcXBEQ2E2d29uM1Vq?=
 =?utf-8?B?ZWNmMU9rN0M2M1Frd0hxbVJyRTRsY3YzSEM2Q2N1dnlwUzBoait0TUdFdU5M?=
 =?utf-8?B?WUhldEE2VHh6ZStibGJobVl5QUgwT3o4WTJLNEsrUkRKVTZoMlNvSVJySStZ?=
 =?utf-8?B?c1BVdDlLcXM5VXBSVnJkc3B6eStNZ0N0SVdBSEgyb2pGRlIreXF2dW1LWTZE?=
 =?utf-8?B?YXFGRThxc3NWbnhSY0ZzblNaQTBDVTYwU0N3bU90T0RQUnBoakIwaFd2aU9I?=
 =?utf-8?B?RFdEbklPTlQ2cktZNDJHaU5rc21neWtEby9MVml4SWNoWk5qeHArRkZDTUdp?=
 =?utf-8?B?T1pPMjJ5ZFV5cjlUN0xWd0NBU2czbHdDaE5lTmJWN0tOd1lZNkF6WFRmNDlo?=
 =?utf-8?B?ME5nU01CajhnVnZyYll1MFROYkdIb3ZLUU1OVGVORXl6ZVRxbTVaRXc3QnpB?=
 =?utf-8?B?Z0Nybk9jTVpFRUNKeDkwT2xFeUdRMUVsYnFabjFOL2N0Z0svQTFyTUxNSEk3?=
 =?utf-8?B?anorZWxjUDlaSmRlMjNYYWZRN0V0T1c4QVdoS0F3OFhiM1lBVGhOV0JEWlZr?=
 =?utf-8?B?SnNXSkNmZjZCV0VwaHRxWHRycDE0SEROdkhuQjUyUGNjcHBZZkhFdVZQenc1?=
 =?utf-8?B?WGxOQzh6Nlhzc1hzZUk3eTFsK1VmUnlRVk5OTUU3VEZMNExxMGYxdFREZFZL?=
 =?utf-8?B?UkI5LysveitueWZZYXhSVkRwdXBKYnErRGJGVkFraW1Jc0lkVlE0T1VRVUpv?=
 =?utf-8?B?QWRFdGhJVDZKdXhVOE5RYzVNaWVuNmJmQjJoK1p2dGt6YlBqWXJyWnRwMnlY?=
 =?utf-8?B?TjNtcnQ5Rjk1QTNzY1JZU1pIejV0cUYvWnR0U2VZTzBrUVV3UFE2KzdXTmlz?=
 =?utf-8?B?Z2R1d25tY1Y2MTJKbDljT2p4NElUZDlkSDhKNnBZbWFYTUw0S3MvVUROemRI?=
 =?utf-8?B?bFh4TlRMcEpUdUE4Ni9OYXVvZjV5ejdnTkU5Mk5oR1lrYmFJWEN1eFdiMkFQ?=
 =?utf-8?B?ZmIrR1FPSTJZTjdlREd4UFU4KzJ5NnQ2enFYVHdOUGF2Nzg3QlI1VE1OWEVU?=
 =?utf-8?B?ems4OTcvS1VxTWo1cStNRXVWaFZtZ2Fyb05YSE1TNysxODJwSkVvUzk2Uko4?=
 =?utf-8?B?WmZLZVFyeEdwM1Q4YVBlNkpNY3V0V3BWRFlnNlpEQit3bmorMGV2N29HZis3?=
 =?utf-8?B?MTF1cFR0TVNNWnVKd2U4UzJwY3FiRlo2U3JKVkV3d0xiZFNlY3l4ZithTUNi?=
 =?utf-8?B?ZGFwNGlDZjRhK2RDTHlBY2F3dVhzYlFiRFFHUjV5cjZ0SHNmQTVKK0dpc3lv?=
 =?utf-8?B?YWJsYzdhbkNYUG8ycVJucXRFS2ZQR0xtbk1LajAwZ1luVGpCbzBUWDlKWkV0?=
 =?utf-8?B?dkFlb3IxQy9GLzJackcxQzEvOE5SWVlJNXJwQmVBWXB1ZWZwNVV4aDNSQ2lt?=
 =?utf-8?B?Q1gxYnpJbTFVTGVqSlJsQWRWTTY3V3Z2eFNSeGtzNWJvRFRqRjVDeDIzNzhB?=
 =?utf-8?B?emw2bkYyNEdYcUNNaVVLenlZcWFDNllqVmo0SStaZUxqQ0dwQVpwUHhGb2lR?=
 =?utf-8?B?cHU2RVpsY2w0RHRJaWFQSGVyc1NGb0tlOGdTcmhrQ2R5UE4yaHhyeEJkMmJS?=
 =?utf-8?B?eUdRSzBxNE12YWZDWWNFOFVGcHd2QWRJMUZTbFRzTDNpQWlpR2l3RnNQVXVr?=
 =?utf-8?B?YlZYeE4zL0tZcUkrb2dxOEJwRStpY3NlMFpWUEtJNmJ0MHV1blRtTG5vVDRY?=
 =?utf-8?B?ZVVibER5alE1UmcyTTNUK1AyT3ZFbWtWUTVYTGFFZUtEUkZEbjZIc1JUUmpE?=
 =?utf-8?Q?wYLsDcG+VxK6gfKU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9168bf52-5e9f-41ce-e312-08da19869947
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 17:38:31.2878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I/ctAEDIZ3dvsgZ+LvL6yhui816oIUXv4+RW4517NHbMxZ50j+mdC7PWykP7QL/lpaLdTBk8TlH51TaC1hGpQ1FA94RaNV1ud1hiX+H+314=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2291
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PiA+ID4gPiA+ID4gPiA+ID4gT24gV2VkLCAzMCBNYXIgMjAyMiBhdCAxOTowNCwgU2Fua2VlcnRo
IEJpbGxha2FudGkNCj4gPiA+ID4gPiA+ID4gPiA+IDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29t
PiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gVGhlIHBh
bmVsLWVkcCBkcml2ZXIgbW9kZXMgbmVlZHMgdG8gYmUgdmFsaWRhdGVkDQo+ID4gPiA+ID4gPiA+
ID4gPiA+IGRpZmZlcmVudGx5IGZyb20gRFAgYmVjYXVzZSB0aGUgbGluayBjYXBhYmlsaXRpZXMg
YXJlDQo+ID4gPiA+ID4gPiA+ID4gPiA+IG5vdCBhdmFpbGFibGUgZm9yIEVEUCBieQ0KPiA+ID4g
PiA+IHRoYXQgdGltZS4NCj4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogU2Fua2VlcnRoIEJpbGxha2FudGkNCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PHF1aWNfc2JpbGxha2FAcXVpY2luYy5jb20+DQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiA+ID4gVGhpcyBzaG91bGQgbm90IGJlIG5lY2Vzc2FyeSBhZnRlcg0KPiA+ID4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4NCj4gaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzQ3OTI2MS8/c2VyaWVzPTEwMTY4MiZyZXY9MS4NCj4g
PiA+ID4gPiA+ID4gPiA+IENvdWxkIHlvdSBwbGVhc2UgY2hlY2s/DQo+ID4gPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gVGhlIGNoZWNrIGZvciBEUF9NQVhf
UElYRUxfQ0xLX0tIWiBpcyBub3QgbmVjZXNzYXJ5DQo+ID4gPiA+ID4gPiA+ID4gYW55bW9yZSBi
dXQNCj4gPiA+ID4gPiB3ZQ0KPiA+ID4gPiA+ID4gPiA+IG5lZWQgdG8gcmV0dXJuIGVhcmx5IGZv
ciBlRFAgYmVjYXVzZSB1bmxpa2UgRFAsIGVEUA0KPiA+ID4gPiA+ID4gPiA+IGNvbnRleHQgd2ls
bCBub3QgaGF2ZSB0aGUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIG51bWJlciBvZg0KPiA+ID4gPiA+
ID4gPiA+IGxhbmVzIGFuZCBsaW5rDQo+ID4gPiBjbG9jay4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gPiA+IFNvLCBJIHdpbGwgbW9kaWZ5IHRoZSBwYXRjaCB0byByZXR1cm4gYWZ0ZXIg
dGhlDQo+ID4gPiA+ID4gPiA+ID4gRFBfTUFYX1BJWEVMX0NMS19LSFoNCj4gPiA+ID4gPiA+ID4g
Y2hlY2sgaWYgaXNfZURQIGlzIHNldC4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gSSBo
YXZlbid0IHdhbGtlZCB0aHJvdWdoIGFsbCB0aGUgcmVsZXZhbnQgY29kZSBidXQgc29tZXRoaW5n
DQo+ID4gPiA+ID4gPiA+IHlvdSBzYWlkIGFib3ZlIHNvdW5kcyBzdHJhbmdlLiBZb3Ugc2F5IHRo
YXQgZm9yIGVEUCB3ZSBkb24ndA0KPiA+ID4gPiA+ID4gPiBoYXZlIGluZm8gYWJvdXQgdGhlIG51
bWJlciBvZiBsYW5lcz8gV2UgX3Nob3VsZF8uDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+
IEl0J3MgY2VydGFpbmx5IHBvc3NpYmxlIHRvIGhhdmUgYSBwYW5lbCB0aGF0IHN1cHBvcnRzDQo+
ID4gPiA+ID4gPiA+IF9laXRoZXJfIDEgb3INCj4gPiA+ID4gPiA+ID4gMiBsYW5lcyBidXQgdGhl
biBvbmx5IHBoeXNpY2FsbHkgY29ubmVjdCAxIGxhbmUgdG8gaXQuIC4uLm9yDQo+ID4gPiA+ID4g
PiA+IHlvdSBjb3VsZCBoYXZlIGEgcGFuZWwgdGhhdCBzdXBwb3J0cyAyIG9yIDQgbGFuZXMgYW5k
IHlvdQ0KPiA+ID4gPiA+ID4gPiBvbmx5IGNvbm5lY3QgMQ0KPiA+ID4gbGFuZS4NCj4gPiA+ID4g
PiA+ID4gU2VlLCBmb3IgaW5zdGFuY2UsIHRpX3NuX2JyaWRnZV9wYXJzZV9sYW5lcy4gVGhlcmUg
d2UgYXNzdW1lDQo+ID4gPiA+ID4gPiA+IDQgbGFuZXMgYnV0IGlmIGEgImRhdGEtbGFuZXMiIHBy
b3BlcnR5IGlzIHByZXNlbnQgdGhlbiB3ZQ0KPiA+ID4gPiA+ID4gPiBjYW4gdXNlIHRoYXQgdG8g
a25vdyB0aGF0IGZld2VyIGxhbmVzIGFyZSBwaHlzaWNhbGx5IGNvbm5lY3RlZC4NCj4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gSXQncyBhbHNvIHBvc3NpYmxlIHRvIGNvbm5lY3QgbW9yZSBs
YW5lcyB0byBhIHBhbmVsIHRoYW4gaXQgc3VwcG9ydHMuDQo+ID4gPiA+ID4gPiA+IFlvdSBjb3Vs
ZCBjb25uZWN0IDIgbGFuZXMgdG8gaXQgYnV0IHRoZW4gaXQgb25seSBzdXBwb3J0cyAxLg0KPiA+
ID4gPiA+ID4gPiBUaGlzIGNhc2UgbmVlZHMgdG8gYmUgaGFuZGxlZCBhcyB3ZWxsLi4uDQo+ID4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gSSB3YXMgcmVmZXJyaW5nIHRvIHRo
ZSBjaGVja3Mgd2UgZG8gZm9yIERQIGluDQo+ID4gPiA+ID4gPiBkcF9icmlkZ2VfbW9kZV92YWxp
ZC4gV2UgY2hlY2sgaWYgdGhlIExpbmsgYmFuZHdpZHRoIGNhbg0KPiA+ID4gPiA+ID4gc3VwcG9y
dCB0aGUgcGl4ZWwgYmFuZHdpZHRoLiBGb3IgYW4gZXh0ZXJuYWwgRFAgY29ubmVjdGlvbiwNCj4g
PiA+ID4gPiA+IHRoZSBJbml0aWFsIERQQ0QvRURJRCByZWFkIGFmdGVyIGNhYmxlIGNvbm5lY3Rp
b24gd2lsbCByZXR1cm4NCj4gPiA+ID4gPiA+IHRoZSBzaW5rIGNhcGFiaWxpdGllcyBsaWtlIGxp
bmsgcmF0ZSwgbGFuZSBjb3VudCBhbmQgYnBwDQo+ID4gPiA+ID4gPiBpbmZvcm1hdGlvbiB0aGF0
IGFyZSB1c2VkIHRvIHdlIGZpbHRlciBvdXQgdGhlIHVuc3VwcG9ydGVkDQo+ID4gPiA+ID4gbW9k
ZXMgZnJvbSB0aGUgbGlzdCBvZiBtb2RlcyBmcm9tIEVESUQuDQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gRm9yIGVEUCBjYXNlLCB0aGUgZHAgZHJpdmVyIHBlcmZvcm1zIHRoZSBmaXJzdCBkcGNk
IHJlYWQNCj4gPiA+ID4gPiA+IGR1cmluZyBicmlkZ2VfZW5hYmxlLiBUaGUgZHBfYnJpZGdlX21v
ZGVfdmFsaWQgZnVuY3Rpb24gaXMNCj4gPiA+ID4gPiA+IGV4ZWN1dGVkIGJlZm9yZSBicmlkZ2Vf
ZW5hYmxlIGFuZCBoZW5jZSBkb2VzIG5vdCBoYXZlIHRoZSBmdWxsDQo+ID4gPiA+ID4gPiBsaW5r
IG9yIHRoZSBzaW5rIGNhcGFiaWxpdGllcyBpbmZvcm1hdGlvbiBsaWtlIGV4dGVybmFsIERQIGNv
bm5lY3Rpb24sDQo+IGJ5IHRoZW4uDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJdCBzb3VuZHMgdG8g
bWUgbGlrZSB3ZSBzaG91bGQgZW11bGF0ZSB0aGUgSFBEIGV2ZW50IGZvciBlRFAgdG8NCj4gPiA+
ID4gPiBiZSBoYW5kbGVkIGVhcmxpZXIgdGhhbiB0aGUgZ2V0X21vZGVzKCkvcHJlcGFyZSgpIGNh
bGxzIGFyZQ0KPiBhdHRlbXB0ZWQuDQo+ID4gPiA+ID4gSG93ZXZlciB0aGlzIG1pZ2h0IG9wZW4g
YW5vdGhlciBjYW4gb2Ygd29ybXMuDQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gRm9yIERQ
LCB0aGUgSFBEIGhhbmRsZXIgbWFpbmx5IGluaXRpYXRlcyBsaW5rIHRyYWluaW5nIGFuZCBnZXRz
IHRoZSBFRElELg0KPiA+ID4gPg0KPiA+ID4gPiBCZWZvcmUgYWRkaW5nIHN1cHBvcnQgZm9yIGEg
c2VwYXJhdGUgZURQIHBhbmVsLCB3ZSBoYWQgZGlzY3Vzc2VkDQo+ID4gPiA+IGFib3V0IHRoaXMg
aW50ZXJuYWxseSBhbmQgZGVjaWRlZCB0byBlbXVsYXRlIGVEUCBIUEQgZHVyaW5nDQo+ID4gPiA+
IGVuYWJsZSgpLiBNYWluIHJlYXNvbiBiZWluZywgZURQIHBvd2VyIGlzIGd1YXJhbnRlZWQgdG8g
YmUgb24gb25seQ0KPiA+ID4gPiBhZnRlcg0KPiA+ID4gYnJpZGdlX2VuYWJsZSgpLg0KPiA+ID4g
PiBTbywgZURQIGxpbmsgdHJhaW5pbmcgY2FuIGhhcHBlbiBhbmQgc3VzdGFpbiBvbmx5IGFmdGVy
IGJyaWRnZV9lbmFibGUoKS4NCj4gPiA+ID4NCj4gPiA+ID4gRW11bGF0aW5nIEhQRCBiZWZvcmUv
ZHVyaW5nIGdldF9tb2RlcyB3aWxsIG5vdCBoYXZlIGFueSBlZmZlY3QNCj4gYmVjYXVzZToNCj4g
PiA+DQo+ID4gPiBBcyB3ZSBoYXZlIHNlZW4sIHRoZSB0ZXJtIEhQRCBpcyBzaWduaWZpY2FudGx5
IG92ZXJsb2FkZWQuIFdoYXQgZG8NCj4gPiA+IHlvdSB3YW50IHRvIGVtdWxhdGU/DQo+ID4gPg0K
PiA+DQo+ID4gT24gRFAsIHdlIHVzZSBIUEQgZXZlbnQgZm9yIGxpbmsgdHJhaW5pbmcgYW5kIEVE
SUQgcmVhZC4NCj4gPg0KPiA+IEkgdW5kZXJzdG9vZCB0aGF0IHlvdSB3YW50ZWQgbWUgdG8gZW11
bGF0ZSBIUEQgZXZlbnQgYmVmb3JlDQo+ID4gZ2V0X21vZGVzKCkgYnV0IGJlY2F1c2UgdGhlIHBh
bmVsIHBvd2VyIGlzIGNvbnRyb2xsZWQgYnkgcGFuZWwtZWRwLA0KPiA+IHdoYXRldmVyIHByb2dy
YW1taW5nIHdlIGRvIG9uIHRoZSBzaW5rIHNpZGUgd2lsbCBiZSByZXNldCB3aGVuIHBhbmVsDQo+
ID4gcG93ZXIgd2lsbCBiZSB0dXJuZWQgb2ZmIGJ5IHRoZSBwbV9ydW50aW1lX3B1dF9hdXRvc3Vz
cGVuZCgpIG9mIHRoZQ0KPiBwYW5lbC1lZHAgaW4gcGFuZWxfZWRwX2dldF9tb2RlcygpLg0KPiAN
Cj4gVGhlIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgd291bGRuJ3Qgc3VzcGVuZCB0aGUg
ZGV2aWNlDQo+IGltbWVkaWF0ZWx5LiBJdCB3aWxsIGJlIHN1c3BlbmRlZCBhZnRlciB0aGUgZ3Jh
Y2UgcGVyaW9kIGZpbmlzaGVkLCBpZiBub2JvZHkNCj4gcmVzdW1lcyB0aGUgZGV2aWNlcyBhZ2Fp
bi4gVGhpcyBpcyBob3cgaXQgd29ya3MgaW4gdGhlDQo+IHNuNjVkc2k4NiBkcml2ZXIuIEl0IHNl
dHMgdGhlIHRpbWVvdXQgZGVsYXkgbG9uZyBlbm91Z2gsIHNvIHRoYXQgZ2V0X21vZGVzDQo+IGFu
ZCBwcmVfZW5hYmxlIHdvdWxkIHR5cGljYWxseSB3b3JrIHRvZ2V0aGVyIHdpdGhvdXQgc3VzcGVu
ZGluZyB0aGUgaG9zdC4NCj4gDQoNCk9rYXkuIFdlIGFyZSBub3QgaW1wbGVtZW50aW5nIGEgYnJp
ZGdlIHByZV9lbmFibGUgY3VycmVudGx5DQoNCj4gPg0KPiA+ID4gPg0KPiA+ID4gPiAxLiBnZXRf
bW9kZXMoKSB3aWxsIGdvIHRvIHBhbmVsJ3MgZ2V0X21vZGVzKCkgZnVuY3Rpb24gdG8gcG93ZXIg
b24NCj4gPiA+ID4gcmVhZCBFRElEDQo+ID4gPiA+DQo+ID4gPiA+IDIuIHBhbmVsIHBvd2VyIHdp
bGwgYmUgdHVybmVkIG9mZiBhZnRlciBnZXRfbW9kZXMoKS4gUGFuZWwgcG93ZXINCj4gPiA+ID4g
b2ZmIHdpbGwgcmVzZXQgZXZlcnkgd3JpdGUgdHJhbnNhY3Rpb24gaW4gRFBDRC4gYW55d2F5DQo+
ID4gPiA+IGludmFsaWRhdGluZyBsaW5rIHRyYWluaW5nDQo+ID4gPg0KPiA+ID4gSSB0ZW5kIHRv
IGFncmVlIHdpdGggRG91ZyBoZXJlLiBlRFAgbGluayBwb3dlciBzdGF0dXMgc2hvdWxkIGJlDQo+
ID4gPiBoYW5kbGVkIGJ5IHRoZSBwbV9ydW50aW1lX2F1dG9zdXNwZW5kIHdpdGggZ3JhY2UgcGVy
aW9kIGJlaW5nIGhpZ2gNCj4gPiA+IGVub3VnaCB0byBjb3ZlciB0aGUgdGltZXNsb3QgYmV0d2Vl
biBnZXRfbW9kZSgpIGFuZCBlbmFibGUoKS4NCj4gPiA+DQo+ID4gPiBwYW5lbC1lZHAgYWxyZWFk
eSBkb2VzIG1vc3Qgb2YgcmVxdWlyZWQgd29yay4NCj4gPiA+DQo+ID4NCj4gPiBUaGUgZURQIGNv
bnRyb2xsZXIgcmVzb3VyY2VzIGFyZSBlbmFibGVkIHRocm91Z2ggdGhlIGhvc3RfaW5pdCgpIGFu
ZA0KPiA+IHRoZSBsaW5rIHJlc291cmNlcyBuZWVkIHRvIGJlIHBvd2VyZWQgb24gZm9yIGRvaW5n
IGxpbmsgdHJhaW5pbmcsDQo+ID4gd2hpY2ggbmVlZHMgdG8gaGFwcGVuIGluIHRoZSBlbmFibGUo
KSB3aXRoIGdlbmVyaWMgcGFuZWwtZWRwLg0KPiANCj4gbm90aGluZyB3cm9uZyB3aXRoIHRoYXQg
dXAgdG8gbm93DQo+IA0KPiA+DQo+ID4gPiA+DQo+ID4gPiA+IDMuIG1vZGVfdmFsaWQgd2lsbCBs
YW5kIGluIGRwIGRyaXZlciBidXQgcGFuZWwgd2lsbCBub3QgYmUgcG93ZXJlZA0KPiA+ID4gPiBv
biBhdCB0aGF0IHRpbWUgYW5kIHdlIGNhbm5vdCBkbyBhdXggdHJhbnNmZXJzIG9yIERQQ0QgcmVh
ZCB3cml0ZXMuDQo+ID4gPg0KPiA+ID4gV2h5IGRvIHdlIG5lZWQgdG8gcGVyZm9ybSBBVVggd3Jp
dGVzIGluIG1vZGVfdmFsaWQ/DQo+ID4gPg0KPiA+DQo+ID4gSSBhbSB0cnlpbmcgdG8ganVzdGlm
eSB3aHkgd2UgY2Fubm90IGhhdmUgbW9kZV92YWxpZCgpIGltcGxlbWVudGF0aW9uDQo+IHNpbWls
YXIgdG8gRFAgZm9yIGVEUC4NCj4gPiBUaGUgZGV0ZWN0KCkgYW5kIGdldF9tb2RlcygpIGFyZSBj
YWxsZWQgZnJvbSBwYW5lbCBicmlkZ2UgYW5kIHBhbmVsLQ0KPiBlZHAuYyByZXNwZWN0aXZlbHku
DQo+ID4gVGhlIGZpcnN0IGVEUCBzcGVjaWZpYyBjYWxsIHdoaWNoIHdpbGwgbGFuZCBpbiB0aGUg
ZHBfZHJpdmVyIGlzDQo+ID4gbW9kZV92YWxpZCgpLCBpbiB3aGljaCB0aGUgY29udHJvbGxlciBj
YW5ub3QgcGVyZm9ybSBhdXggYWNjZXNzIGJlY2F1c2UNCj4gdGhlIHBhbmVsIHdpbGwgbm90IGJl
IHBvd2VyZWQtb24uDQo+IA0KPiBJIGZhaWwgdG8gdW5kZXJzdGFuZCB3aHkgeW91J2QgbGlrZSB0
byBwZXJmb3JtIGF1eCBhY2Nlc3MgZnJvbSBtb2RlX3ZhbGlkIGF0DQo+IGFsbC4NCg0KSSBkb24n
dCB3YW50IHRvIHBlcmZvcm0gaXQgaW4gbW9kZV92YWxpZC4gSSBhbSBqdXN0IHNheWluZyB0aGF0
LCBhcGFydCBmcm9tIG1vZGVfdmFsaWQoKSwNCnRoZXJlIGlzIG5vIG90aGVyIGVEUCBjYWxsIChv
dGhlciB0aGFuIGF1eF90cmFuc2Zlcikgd2hpY2ggd2lsbCBsYW5kIGluIHRoZSBEUCBkcml2ZXIg
YmVmb3JlIHRoZSBtb2RlX3NldCgpLg0KU28sIGN1cnJlbnRseSB0aGVyZSBpcyBubyBmdW5jdGlv
biBpbiB3aGljaCB3ZSBjYW4gZ2V0IHRoZSBlRFAgc2luayBjYXBhYmlsaXRpZXMgYmVmb3JlIGVu
YWJsZSgpLg0KU28sIHdlIGFzc3VtZSB0aGUgbW9kZSB3aWxsIGJlIHN1cHBvcnRlZCBpZiB0aGUg
cGl4ZWwgY2xvY2sgaXMgbGVzcyB0aGFuIHRoZSBtYXggY2xvY2sgb2YgNjc1TUh6Lg0KDQo+IA0K
PiA+IEFzIHRoZSBwYW5lbC1wb3dlciBhbmQgYmFja2xpZ2h0IGFyZSBwYW5lbCByZXNvdXJjZXMs
IHdlIGFyZSBub3QNCj4gPiBlbmFibGluZy92b3RpbmcgZm9yIHRoZW0gZnJvbSB0aGUgRFAvZURQ
IGNvbnRyb2xsZXIgZHJpdmVyLg0KPiANCj4gY29ycmVjdA0KPiANCj4gPg0KPiA+ID4gPg0KPiA+
ID4gPiA+ID4gU28sIHdlIG5lZWQgdG8gcHJvY2VlZCB3aXRoIHRoZSByZXBvcnRlZCBtb2RlIGZv
ciBlRFAuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBXZWxsLi4uIEV2ZW4gaWYgZHVyaW5nIHRoZSBm
aXJzdCBjYWxsIHRvIGdldF9tb2RlcygpIHRoZSBEUENEIGlzDQo+ID4gPiA+ID4gbm90IHJlYWQs
IGR1cmluZyBzdWJzZXF1ZW50IGNhbGxzIHRoZSBkcml2ZXIgaGFzIG5lY2Vzc2FyeQ0KPiA+ID4g
PiA+IGluZm9ybWF0aW9uLCBzbyBpdCBjYW4gcHJvY2VlZCB3aXRoIGFsbCB0aGUgY2hlY2tzLCBj
YW4ndCBpdD8NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBnZXRfbW9kZXMoKSBjdXJyZW50
bHkgZG9lcyBub3QgbGFuZCBpbiBEUCBkcml2ZXIuIEl0IGdldHMgZXhlY3V0ZWQNCj4gPiA+ID4g
aW4gcGFuZWwgYnJpZGdlLiBCdXQgdGhlIG1vZGVfdmFsaWQoKSBjb21lcyB0byBEUCBkcml2ZXIg
dG8gY2hlY2sNCj4gPiA+ID4gdGhlIGNvbnRyb2xsZXIgY29tcGF0aWJpbGl0eS4NCj4gPiA+DQo+
ID4gPiBZZXMsIHRoaXMgaXMgY29ycmVjdC4gdGhlIERQJ3MgbW9kZV92YWxpZCgpIGtub3dzIHRo
ZSBoYXJkd2FyZQ0KPiA+ID4gbGltaXRhdGlvbnMgKG1heCBjbG9jayBzcGVlZCwgYW1vdW50IG9m
IGxhbmVzLCBldGMpIGFuZCB0aHVzIGl0IGNhbg0KPiA+ID4gZGVjaWRlIHdoZXRoZXIgdGhlIG1v
ZGUgaXMgc3VwcG9ydGVkIGJ5IHRoZSB3aG9sZSBjaGFpbiBvciBub3QuDQo+ID4gPiBXZSBzaG91
bGQgbm90IHNraXAgc3VjaCBjaGVja3MgZm9yIHRoZSBlRFAuDQo+ID4gPg0KPiA+ID4NCj4gPg0K
PiA+IEZvciBlRFAsIHdlIGhhdmUgbm8gaW5mb3JtYXRpb24gYWJvdXQgdGhlIG51bWJlciBvZiBs
YW5lcyBvciB0aGUgbGluaw0KPiA+IHJhdGUgc3VwcG9ydGVkIFdlIG9ubHkga25vdyB0aGUgbWF4
IGxhbmVzIGZyb20gdGhlIGRhdGEtbGFuZXMgRFQNCj4gcHJvcGVydHkuDQo+IA0KPiBJZiB0aGUg
ZGV2aWNlIGNvbm5lY3RzIGp1c3QgYSBzaW5nbGUgbGluZSB0byB0aGUgZURQIHBhbmVsLCB0aGUg
RFQgd2lsbCBiZQ0KPiBjaGFuZ2VkIHRvIGxpc3QgdGhhdCBzaW5nbGUgbGFuZS4NCj4gSXQgbG9v
a3MgbGlrZSB3ZSBoYXZlIHRvIGNhbGwgZHBfcGFuZWxfcmVhZF9zaW5rX2NhcHMoKSBzb21ld2hl
cmUgZm9yIHRoZQ0KPiBlRFAgY2FzZS4gRm9yIHRoZSBEUCBjYXNlIHRoZSBIUEQgY2FsbGJhY2tz
IGRvIHRoaXMgd29yay4NCj4gDQo+IE5vLCBtb2RlX3ZhbGlkIGRvZXNuJ3QgbG9vayBsaWtlIGEg
cHJvcGVyIHBsYWNlLiBXZSBhbHJlYWR5IGhhdmUgcmVhZA0KPiBtb2Rlcywgc28gdGhlIEFVWCBi
dXMgaGFzIGJlZW4gcG93ZXJlZCBmb3Igc29tZSB0aW1lLiBXZSBjb3VsZCBkbyBpdA0KPiBlYXJs
aWVyLg0KDQpDb3JyZWN0LCB3ZSBoYXZlIHRvIGRvIGl0IGVhcmxpZXIuIEJ1dCBpcyB0aGVyZSBz
b21lIGZ1bmN0aW9uIGluIHdoaWNoIHdlIGNhbiBnZXQNCnRoZSBkcF9wYW5lbF9yZWFkX3Npbmtf
Y2FwcygpIGJlZm9yZSBnZXRfbW9kZXM/DQoNCkEgd2F5IGNvdWxkIGJlIHRvIGltcGxlbWVudCB0
aGUgbW9kZV92YWxpZCBhbHNvIGluIHBhbmVsLWVEUCBhbG9uZyB3aXRoIHRoZQ0KZ2V0X21vZGVz
LiBXZSBjYW4gcmVhZCB0aGUgc2luayBjYXBhYmlsaXRpZXMgaW4gZ2V0X21vZGVzIGluIHBhbmVs
LWVkcC5jIGFuZA0KY2hlY2sgaW4gdGhlIG1vZGVfdmFsaWQoKSBpbiBwYW5lbC1lZHAuYy4NCg0K
SSBhbHNvIGZlZWwgdGhlIG1vZGVfdmFsaWQoKSBuZWVkcyB0byBjaGVjayBpZiBhIGNvbnRyb2xs
ZXIgY2FuIHN1cHBvcnQgaXQgcmF0aGVyDQp0aGFuIHRoZSBwYW5lbC4gU28sIEkgY2Fubm90IGZp
bmQgYSB3YXkgd2hlcmUgdG8gZ2V0IHRoZSBzaW5rIGNhcHMgbm93IGJlZm9yZQ0KdGhlIG1vZGVf
c2V0KCkgb3IgZW5hYmxlKCkNCg0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0
cnkNCg==
