Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C36DB6CB65C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 07:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjC1Fw4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 01:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjC1Fwy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 01:52:54 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCAB1BFD;
        Mon, 27 Mar 2023 22:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679982773; x=1711518773;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sPuizUW/BrtTukr8FISbZPFHFt/5eO35bvckXP+NtMs=;
  b=kRw4X8oc29JlHt5r9m+CSlib0xJ6Rqm3JphEdZyBl1Gdjdcbz8qPHrpm
   BB/TsKipw/CRgXn9Zhq6PC+7w5adqMx54sN+daiDRwhWjc2qcN86cyEqt
   JJHw6bDm6U1Hv73tlEr/FO2j5kiTOhECSDpkVuGbWKb58EOFrAjY0OKQO
   IF9a/8AbM6fMd2iu10ce6/hn1wKcxkJzQgViS2HZ9ihrBn7fqb6iGumeX
   TJZ4TFVtNw2uVXaXo3MZq7dfukBzFSP+GnZFQF1mJ2EzM0/hvKN2T5+gJ
   UziSw4hbHD9ixHHHgNHrz0KcHaVIcCooWjWmDWpRK3M+eQ/mKZO5gVo7a
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="337982794"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="337982794"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 22:52:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="683756458"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="683756458"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP; 27 Mar 2023 22:52:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 22:52:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 22:52:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 22:52:50 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 22:52:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yul0GVzDdvRL7SdibTBviOKdUykEfnBT4Yeg8IHfNrZ4WIMMq68iis8XrvtgfQcb4JBSho27mfnoRMsJzjlUo1uq8PhLSDfkU4lXY2lQe3Sj2vb1FIKKQpwKZ/Xi0pIcnLHesymWcuYu8/JZFf3Q+OYZ04r1Iixp4ooIQ6d3DIVgfxukWthu0lfHNB09EbQlnqbzNh5X/fwlnmfpAoerPZhKTlc2pYvpKOenBhugtTCeL1fI/p9q6j2PgeogwCkmt+iaky2CtRK2dESWSp1TM0a0BVWMuRyAJZ+B0Hu6aegGvmErqCxvTIRB5tygS00Lp/OzjQUaISFbY5z87Wgr8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPuizUW/BrtTukr8FISbZPFHFt/5eO35bvckXP+NtMs=;
 b=jMmIyZpCjz8AE10QrrjtEXo6DIm7NeiTriMPYRgWlAvVQOC2N8EbjtkcD6tpY2e1SahridoqByjGlxSAmCwsDJ1FwkCbtSA+NqcTIfkjqkE8JOHbGWqv5hls4VpFtVX8qi+oBSnh0e+1a1A0eq3sdbs2t60ehrRW9TXa4HKKZblXY41DY9M9pMBxfbx8gFVBvlCt8QFxArBJ/hgcn3X3Al7uGkwpfrn8zNOky/iibeNRQ2FshjemvM0ZCWguGUhg9b1F4E7xjHmqaX3Xktm3L0lx4s7PWZHODNo+YTLSyHZsx6LK1USrEKFrr8zqLh94fmC/gb8uq0opNPHCFoSCjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.32; Tue, 28 Mar
 2023 05:52:45 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::e382:a793:21e7:fd49]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::e382:a793:21e7:fd49%4]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 05:52:44 +0000
From:   "Kandpal, Suraj" <suraj.kandpal@intel.com>
To:     Mark Yacoub <markyacoub@chromium.org>
CC:     "quic_khsieh@quicinc.com" <quic_khsieh@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "quic_sbillaka@quicinc.com" <quic_sbillaka@quicinc.com>,
        "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
        "Souza, Jose" <jose.souza@intel.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "hbh25y@gmail.com" <hbh25y@gmail.com>,
        "Vasut, Marek" <marex@denx.de>,
        "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "abhinavk@codeaurora.org" <abhinavk@codeaurora.org>,
        "javierm@redhat.com" <javierm@redhat.com>,
        "Murthy, Arun R" <arun.r.murthy@intel.com>,
        "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
        "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
        "Nikula, Jani" <jani.nikula@intel.com>,
        "De Marchi, Lucas" <lucas.demarchi@intel.com>,
        "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
        "swboyd@chromium.org" <swboyd@chromium.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
        "maxime@cerno.tech" <maxime@cerno.tech>,
        "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
        "johan+linaro@kernel.org" <johan+linaro@kernel.org>,
        "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "dianders@chromium.org" <dianders@chromium.org>,
        "Sharma, Swati2" <swati2.sharma@intel.com>,
        "Navare, Manasi D" <manasi.d.navare@intel.com>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>
Subject: RE: [PATCH v6 06/10] drm/i915/hdcp: Retain hdcp_capable return codes
Thread-Topic: [PATCH v6 06/10] drm/i915/hdcp: Retain hdcp_capable return codes
Thread-Index: AQHZK3NzHw1adqIUP0ahY6fdLOLhFK7z909ggBRfsoCAAl9fgIAFY29A
Date:   Tue, 28 Mar 2023 05:52:44 +0000
Message-ID: <SN7PR11MB67505B530C0D2A99321B636EE3889@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-7-markyacoub@google.com>
 <MWHPR11MB1741FB33E933A3285B7DC88DE3BA9@MWHPR11MB1741.namprd11.prod.outlook.com>
 <MWHPR11MB1741D833E10227E8BA1CEE03E3879@MWHPR11MB1741.namprd11.prod.outlook.com>
 <CAJUqKUqhHmvD0K7OzrFKPeBBxprXgLVw1-L-vpNAAS7u4CxNoA@mail.gmail.com>
In-Reply-To: <CAJUqKUqhHmvD0K7OzrFKPeBBxprXgLVw1-L-vpNAAS7u4CxNoA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SJ0PR11MB4894:EE_
x-ms-office365-filtering-correlation-id: f072b2af-3aed-4a35-819a-08db2f50a6ed
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0+e3XTVTrGF3jQIwZjO8U5d7uJVqPVkBDS/THq7ia8hpaR3tbrl3KoaUOQ55pmReLD+jONeCePd5lBJAhvmyUVVDa1TdkBN3t3cEwW5HyfFnJ4MezZtBF6FaB6Zaq/JsVooVf6v5YHrlk53XYQymcPN3Fzgnoo8ON0nn8cNxQBha9HUajFfW4JgfaOHDfjFXXFCJGy2hDAp3SHv3XYDy60E3bDKah1qZNKvR0bwM9N0+pEiXb6NtowYNe2kDCltZnCQai2T2AnRPjdiN9rBBvcN1QMo41ex1fXK2P2pvgDnH6e3IETtBz2yUg54vfKJ9IR3pY+i44QP5qowE9Dm1s0i01gu5iLfKd4dE36srleeKOnfDrWcfF6he4cX1X+AIqqNsmxqMdzXwC3whs0a9iM2iGYEygTVGCK7xW/MY7VcMPUhfSDj+bbry4ZwD4rfuB6n9i3LDUlE6en/0pTmCeaRYne8LlScmfFzN/cnAP+TfORgbieY+HSJ11ZUrXSXfrXXzOaHSybd0yoGn1G8a7zxjSfFV/pPsTBIx7Wmh33+LUJs/H2gRII5FnStYibV5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199021)(316002)(54906003)(478600001)(52536014)(38070700005)(5660300002)(8936002)(122000001)(86362001)(82960400001)(30864003)(2906002)(7416002)(76116006)(6916009)(38100700002)(66446008)(4326008)(66476007)(8676002)(33656002)(7406005)(66556008)(66946007)(64756008)(9686003)(41300700001)(186003)(55016003)(53546011)(6506007)(26005)(83380400001)(71200400001)(7696005)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGY1b3pNMG1ZR0tKTGt0bkQ4OEdLRFViU3hOY20yUEhHelUrSS96RWxJaVpT?=
 =?utf-8?B?bjI0U0JXNU9SWHl1aGtyVEM0ZzhrQURvOWgzSzJxZ2dhQUpxUTNjZXlYdWRD?=
 =?utf-8?B?VVlCZ09kbHMvUDl3Qkx2UEkrQ0FnSUVISTAvZG1ZTXBPTFA3MG4xNFd2WFdN?=
 =?utf-8?B?Y1JaWjR5SzBUbFB1Z0pPcnBIOTVXSFFmQU1aYXB2clNwU3NrcXU0Q0huSVhv?=
 =?utf-8?B?eVVRTWduUEVhYVZlV0U5TTdjVmJxQm44RjhiVFFnUUJ6ZU9kTzA1eXUwOFN2?=
 =?utf-8?B?eTZoN3VkWGtzL25QQ3lYdjk1VlVzUXdvdThuVHNwaXRnYzJPQmdCNnA0d2xM?=
 =?utf-8?B?R1hTSk0wbGdKZmM0RDJWNnJYOFlodkdjZk9WaVF4b1kvWXN2dVEva0RGSVpt?=
 =?utf-8?B?MXlZQk1uT1V1ZzkxcTNUcitKeFlXTCtkL3lTSEJXemRJNnE0aXhFckU3VTNX?=
 =?utf-8?B?N1VLR2dyQWFXRlB0NVRVNFhIeDNsMEJWTlphbFNGaHdMSXRCVjh1S0hvR29T?=
 =?utf-8?B?b25naVFzRU9rRDVwT3RZaytMVmFQbWFjZDZiSWxBZ0lFYk5tQ2xxSTJoT2FI?=
 =?utf-8?B?SUI0TUtYaDdkc3ZiM2V4YlUzQktiaVNCeFFjdTEyVXYxZWlIVFdqWi9TYUFp?=
 =?utf-8?B?Y0hCTTVmeVlmUzErSjlCUmFLVnlzbGhxVE9hc3lkczRCNFlDa1VjQVVOZUZK?=
 =?utf-8?B?N1psaEdPdmsySmJxWGt5QzgzRlcreUhxOGZJeTMzc1BPYVhnampRcXBjVGJQ?=
 =?utf-8?B?blVYVnhCL3hHdFFDYlA1RzJyK1ZaKytXYjAreXBzNlB2bEpuWEdoaHNPN2Rr?=
 =?utf-8?B?YTNsYnJudnNSOVd5MGJpYWg1K1dvdEN1MWZIQ3M5NmZMaGpQdFFLb2pHeGNK?=
 =?utf-8?B?cTlpUkcrZ0hvTmN6bldkaW16SzIxbFlWV29wR0Z2TmZlUTlWTjBQYVU2eEpB?=
 =?utf-8?B?T2lpMEczemFuYzlleVhycVRPODQ5VDFkV20xSEZXVVZGaE9pV01iSENNMVlM?=
 =?utf-8?B?UHNtcFN6dTBMejd3QldWU1p5VzJ1c1RCSURSY1QzeG5KNkVWYWVFdGVQOXlz?=
 =?utf-8?B?OFlzZUplTDlicEVwT0hHSlhNWGk3U29KRHNjQmplclQ2S09MOWFMVjh6c3hW?=
 =?utf-8?B?NXh0NHNVRzhsaUM1S04vWlB4Sy8yZjAxbU5HN21SOXVDelhzUmdPQWlvYVhT?=
 =?utf-8?B?OEUxVDNiWWFzWENEcnNXRGxmNWVQQVdnM0NpdXhMZVc1Z2VqTTJrQ3hTVTBG?=
 =?utf-8?B?N2IrK1NOZW94WlZEMDZRb3Z0dmZVcGhnWkw5TFNLTS96UFU0eDRaZnJuQWlu?=
 =?utf-8?B?QTN1YUpoTEtGRjZRcnJ0R0p6cThER2orTWdmdFRRZytnTHBGc2cycVB6MmhV?=
 =?utf-8?B?QzhCVnJiSUxxRlNEeE13R2RMSU1KZVNCcTA3bmNkS2tldURsVkRNUHROb2Y3?=
 =?utf-8?B?SDA2eVNBbEtjWVBJUzQ3Njhvem5POENOMTUzKyt6eVVnU25Kd2t5dHI1Z0lx?=
 =?utf-8?B?Tk1vSlloc3dPVE52QWl2b2Q2OEdWT3l4MVVmTWRMeXR4a3pYR1Y2cGx1eWhq?=
 =?utf-8?B?VVBWNjcwNXRLbnk5Y2ZkSURSSEpwRWFJTjlieGpMT24vdTdlVnBlNkRNSjZn?=
 =?utf-8?B?ZTZyM0lBTENnNmJ2OXZJNEZncmNwVTVqL0VWUzdLenA0MnNocytXcWlTVVlY?=
 =?utf-8?B?UVRZODRJRzFZdHFQdTFLaDFhbnBvS1BrU0k0MDRZWnNjVGxpdi9VemZSR09X?=
 =?utf-8?B?ZnJqaW1Obk4xSXZjK1RjVVNjRUVWT1JmQ2hHdlFEQ1pETUlzL29jeGFhR01G?=
 =?utf-8?B?ZHM4THd2djBYWU5BTkRPRjBiaS9yN3BTY3d2NWxhUTBxMXVyWTNXSitQcVhE?=
 =?utf-8?B?V2dKaGltTWVSdHl6Z0dmMkI3M2E3bzdza0Y4aEFqM213azMwUS83SnErTm1q?=
 =?utf-8?B?MlRNZkJ5dVNjYWppUUpKUjF4TGNiV3VlWXNtUDBjNzBneHY5QWJxQWJrb0x5?=
 =?utf-8?B?U3UxbThSdlZBMkJQOFJHTTBoZGhKVmx4aEJWUkFLQk9xL0oxSFNSRFljdW5p?=
 =?utf-8?B?NU42b3pWVHM4V1hTT2lxOXdERjNqYU9PV1R3V1Q0Z0crWHNSQnpKSkE3ZDNm?=
 =?utf-8?Q?XEYNov5wtGZ7UxAxyKdV37z83?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f072b2af-3aed-4a35-819a-08db2f50a6ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 05:52:44.7355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oTMClb0IrXQFkllT+ody0Z+10bBlQCQMgkeMm8lsM2IpcUuHt/LzMlGxRZJBpUW11rwq4if4xyf2S4GMvZByZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4894
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyayBZYWNvdWIgPG1h
cmt5YWNvdWJAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgTWFyY2ggMjUsIDIwMjMg
MTI6NTcgQU0NCj4gVG86IEthbmRwYWwsIFN1cmFqIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4N
Cj4gQ2M6IHF1aWNfa2hzaWVoQHF1aWNpbmMuY29tOyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVs
Lm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGZyZWVkcmVub0BsaXN0
cy5mcmVlZGVza3RvcC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBpbnRlbC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgcXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbTsNCj4ga29ucmFkLmR5YmNpb0Bzb21haW5saW5l
Lm9yZzsgU291emEsIEpvc2UgPGpvc2Uuc291emFAaW50ZWwuY29tPjsNCj4gYmpvcm4uYW5kZXJz
c29uQGxpbmFyby5vcmc7IGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZzsNCj4gaGJo
MjV5QGdtYWlsLmNvbTsgVmFzdXQsIE1hcmVrIDxtYXJleEBkZW54LmRlPjsgRGl4aXQsIEFzaHV0
b3NoDQo+IDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+OyBzZWFuQHBvb3JseS5ydW47IGFiaGlu
YXZrQGNvZGVhdXJvcmEub3JnOw0KPiBqYXZpZXJtQHJlZGhhdC5jb207IE11cnRoeSwgQXJ1biBS
IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT47IExpc292c2tpeSwNCj4gU3RhbmlzbGF2IDxzdGFu
aXNsYXYubGlzb3Zza2l5QGludGVsLmNvbT47IGFncm9zc0BrZXJuZWwub3JnOw0KPiBxdWljX2pl
c3N6aGFuQHF1aWNpbmMuY29tOyBOYXV0aXlhbCwgQW5raXQgSyA8YW5raXQuay5uYXV0aXlhbEBp
bnRlbC5jb20+Ow0KPiBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT47IERlIE1h
cmNoaSwgTHVjYXMNCj4gPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IHF1aWNfYWJoaW5hdmtA
cXVpY2luYy5jb207DQo+IHN3Ym95ZEBjaHJvbWl1bS5vcmc7IHJvYmgrZHRAa2VybmVsLm9yZzsN
Cj4gY2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI7IG1heGltZUBjZXJuby50ZWNoOyBWaXZp
LCBSb2RyaWdvDQo+IDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPjsgam9oYW4rbGluYXJvQGtlcm5l
bC5vcmc7DQo+IHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbTsgYW5kZXJzc29uQGtlcm5l
bC5vcmc7DQo+IGRpYW5kZXJzQGNocm9taXVtLm9yZzsgU2hhcm1hLCBTd2F0aTIgPHN3YXRpMi5z
aGFybWFAaW50ZWwuY29tPjsNCj4gTmF2YXJlLCBNYW5hc2kgRCA8bWFuYXNpLmQubmF2YXJlQGlu
dGVsLmNvbT47IHR6aW1tZXJtYW5uQHN1c2UuZGU7DQo+IE1vZGVtLCBCaGFudXByYWthc2ggPGJo
YW51cHJha2FzaC5tb2RlbUBpbnRlbC5jb20+Ow0KPiBkbWl0cnkuYmFyeXNoa292QGxpbmFyby5v
cmc7IHNlYW5wYXVsQGNocm9taXVtLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDA2LzEw
XSBkcm0vaTkxNS9oZGNwOiBSZXRhaW4gaGRjcF9jYXBhYmxlIHJldHVybg0KPiBjb2Rlcw0KPiAN
Cj4gT24gVGh1LCBNYXIgMjMsIDIwMjMgYXQgMzoxOOKAr0FNIEthbmRwYWwsIFN1cmFqIDxzdXJh
ai5rYW5kcGFsQGludGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+DQo+ID4gPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogS2FuZHBhbCwgU3VyYWoNCj4gPiA+
IFNlbnQ6IEZyaWRheSwgTWFyY2ggMTAsIDIwMjMgMTo1NSBQTQ0KPiA+ID4gVG86IE1hcmsgWWFj
b3ViIDxtYXJreWFjb3ViQGNocm9taXVtLm9yZz47DQo+IHF1aWNfa2hzaWVoQHF1aWNpbmMuY29t
Ow0KPiA+ID4gbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7DQo+ID4gPiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+ID4gPiBrZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiBDYzogcXVpY19z
YmlsbGFrYUBxdWljaW5jLmNvbTsga29ucmFkLmR5YmNpb0Bzb21haW5saW5lLm9yZzsgU291emEs
DQo+ID4gPiBKb3NlIDxqb3NlLnNvdXphQGludGVsLmNvbT47IGJqb3JuLmFuZGVyc3NvbkBsaW5h
cm8ub3JnOw0KPiA+ID4ga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOyBoYmgyNXlA
Z21haWwuY29tOyBWYXN1dCwgTWFyZWsNCj4gPiA+IDxtYXJleEBkZW54LmRlPjsgRGl4aXQsIEFz
aHV0b3NoIDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+Ow0KPiA+ID4gc2VhbkBwb29ybHkucnVu
OyBhYmhpbmF2a0Bjb2RlYXVyb3JhLm9yZzsgamF2aWVybUByZWRoYXQuY29tOw0KPiA+ID4gTXVy
dGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPjsgTGlzb3Zza2l5LCBTdGFuaXNs
YXYNCj4gPiA+IDxTdGFuaXNsYXYuTGlzb3Zza2l5QGludGVsLmNvbT47IGFncm9zc0BrZXJuZWwu
b3JnOw0KPiA+ID4gcXVpY19qZXNzemhhbkBxdWljaW5jLmNvbTsgTmF1dGl5YWwsIEFua2l0IEsN
Cj4gPiA+IDxhbmtpdC5rLm5hdXRpeWFsQGludGVsLmNvbT47IE5pa3VsYSwgSmFuaSA8amFuaS5u
aWt1bGFAaW50ZWwuY29tPjsNCj4gPiA+IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hp
QGludGVsLmNvbT47DQo+ID4gPiBxdWljX2FiaGluYXZrQHF1aWNpbmMuY29tOyBzd2JveWRAY2hy
b21pdW0ub3JnOw0KPiByb2JoK2R0QGtlcm5lbC5vcmc7DQo+ID4gPiBjaHJpc3RvcGhlLmphaWxs
ZXRAd2FuYWRvby5mcjsgbWF4aW1lQGNlcm5vLnRlY2g7IFZpdmksIFJvZHJpZ28NCj4gPiA+IDxy
b2RyaWdvLnZpdmlAaW50ZWwuY29tPjsgam9oYW4rbGluYXJvQGtlcm5lbC5vcmc7DQo+ID4gPiB0
dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb207IGFuZGVyc3NvbkBrZXJuZWwub3JnOw0KPiA+
ID4gZGlhbmRlcnNAY2hyb21pdW0ub3JnOyBTaGFybWEsIFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBp
bnRlbC5jb20+Ow0KPiA+ID4gTmF2YXJlLCBNYW5hc2kgRCA8bWFuYXNpLmQubmF2YXJlQGludGVs
LmNvbT47DQo+IHR6aW1tZXJtYW5uQHN1c2UuZGU7DQo+ID4gPiBNb2RlbSwgQmhhbnVwcmFrYXNo
IDxCaGFudXByYWthc2guTW9kZW1AaW50ZWwuY29tPjsNCj4gPiA+IGRtaXRyeS5iYXJ5c2hrb3ZA
bGluYXJvLm9yZzsgc2VhbnBhdWxAY2hyb21pdW0ub3JnDQo+ID4gPiBTdWJqZWN0OiBSRTogW1BB
VENIIHY2IDA2LzEwXSBkcm0vaTkxNS9oZGNwOiBSZXRhaW4gaGRjcF9jYXBhYmxlDQo+ID4gPiBy
ZXR1cm4gY29kZXMNCj4gPiA+DQo+ID4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2NiAwNi8xMF0gZHJt
L2k5MTUvaGRjcDogUmV0YWluIGhkY3BfY2FwYWJsZQ0KPiA+ID4gPiByZXR1cm4gY29kZXMNCj4g
PiA+ID4NCj4gPiA+ID4gRnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+DQo+
ID4gPiA+DQo+ID4gPiA+IFRoZSBzaGltIGZ1bmN0aW9ucyByZXR1cm4gZXJyb3IgY29kZXMsIGJ1
dCB0aGV5IGFyZSBkaXNjYXJkZWQgaW4NCj4gPiA+ID4gaW50ZWxfaGRjcC5jLiBUaGlzIHBhdGNo
IHBsdW1icyB0aGUgcmV0dXJuIGNvZGVzIHRocm91Z2ggc28gdGhleQ0KPiA+ID4gPiBhcmUgcHJv
cGVybHkgaGFuZGxlZC4NCj4gPiA+ID4NCj4gPiA+ID4gQWNrZWQtYnk6IEphbmkgTmlrdWxhIDxq
YW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+ID4gPiA+IFJldmlld2VkLWJ5OiBSb2RyaWdvIFZpdmkg
PHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1
bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJrIFlh
Y291YiA8bWFya3lhY291YkBjaHJvbWl1bS5vcmc+DQo+ID4gPiA+IExpbms6DQo+ID4gPiA+DQo+
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDIxMDkxMzE3
NTc0Ny40NzQ1Ng0KPiA+ID4gPiAtNy0NCj4gPiA+ID4gc2VhbkBwb29ybHkucnVuICN2MQ0KPiA+
ID4gPiBMaW5rOg0KPiA+ID4gPg0KPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
cGF0Y2gvbXNnaWQvMjAyMTA5MTUyMDM4MzQuMTQzOS0NCj4gPiA+ID4gNy0NCj4gPiA+ID4gc2Vh
bkBwb29ybHkucnVuICN2Mg0KPiA+ID4gPiBMaW5rOg0KPiA+ID4gPg0KPiBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAyMTEwMDExNTExNDUuNTU5MTYNCj4g
PiA+ID4gLTctDQo+ID4gPiA+IHNlYW5AcG9vcmx5LnJ1biAjdjMNCj4gPiA+ID4gTGluazoNCj4g
PiA+ID4NCj4gPiA+DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9t
c2dpZC8yMDIxMTEwNTAzMDQzNC4yODI4ODQ1DQo+ID4gPiAtDQo+ID4gPiA+IDctc2VhbkBwb29y
bHkucnVuICN2NA0KPiA+ID4gPiBMaW5rOg0KPiA+ID4gPg0KPiA+ID4NCj4gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMjIwNDExMjA0NzQxLjEwNzQzMDgN
Cj4gPiA+IC0NCj4gPiA+ID4gNy1zZWFuQHBvb3JseS5ydW4gI3Y1DQo+ID4gPiA+DQo+ID4gPiA+
IENoYW5nZXMgaW4gdjI6DQo+ID4gPiA+IC1Ob25lDQo+ID4gPiA+IENoYW5nZXMgaW4gdjM6DQo+
ID4gPiA+IC1Ob25lDQo+ID4gPiA+IENoYW5nZXMgaW4gdjQ6DQo+ID4gPiA+IC1Ob25lDQo+ID4g
PiA+IENoYW5nZXMgaW4gdjU6DQo+ID4gPiA+IC1Ob25lDQo+ID4gPiA+IENoYW5nZXMgaW4gdjY6
DQo+ID4gPiA+IC1SZWJhc2VkDQo+ID4gPiA+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgLi4uL2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMgIHwgIDkgKysrLQ0KPiA+ID4g
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZGNwLmMgICAgIHwgNTEgKysr
KysrKysrKy0tLS0tLS0tLQ0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9oZGNwLmggICAgIHwgIDQgKy0NCj4gPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzcgaW5z
ZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jDQo+
ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVn
ZnMuYw0KPiA+ID4gPiBpbmRleCA3YzcyNTNhMjU0MWMuLjEzYTQxNTNiYjc2ZSAxMDA2NDQNCj4g
PiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2Rl
YnVnZnMuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2Rpc3BsYXlfZGVidWdmcy5jDQo+ID4gPiA+IEBAIC00OTIsNiArNDkyLDcgQEAgc3RhdGljIHZv
aWQgaW50ZWxfcGFuZWxfaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUNCj4gPiA+ID4gKm0sIHN0YXRpYyB2
b2lkIGludGVsX2hkY3BfaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sDQo+ID4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmludGVsX2Nvbm5lY3RvcikN
Cj4gPiA+ID4gew0KPiA+ID4gPiArICAgaW50IHJldDsNCj4gPiA+ID4gICAgIGJvb2wgaGRjcF9j
YXAsIGhkY3AyX2NhcDsNCj4gPiA+ID4NCj4gPiA+ID4gICAgIGlmICghaW50ZWxfY29ubmVjdG9y
LT5oZGNwLnNoaW0pIHsgQEAgLTQ5OSw4ICs1MDAsMTIgQEAgc3RhdGljDQo+ID4gPiA+IHZvaWQg
aW50ZWxfaGRjcF9pbmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwNCj4gPiA+ID4gICAgICAgICAgICAg
Z290byBvdXQ7DQo+ID4gPiA+ICAgICB9DQo+ID4gPiA+DQo+ID4gPiA+IC0gICBoZGNwX2NhcCA9
IGludGVsX2hkY3BfY2FwYWJsZShpbnRlbF9jb25uZWN0b3IpOw0KPiA+ID4gPiAtICAgaGRjcDJf
Y2FwID0gaW50ZWxfaGRjcDJfY2FwYWJsZShpbnRlbF9jb25uZWN0b3IpOw0KPiA+ID4gPiArICAg
cmV0ID0gaW50ZWxfaGRjcF9jYXBhYmxlKGludGVsX2Nvbm5lY3RvciwgJmhkY3BfY2FwKTsNCj4g
PiA+ID4gKyAgIGlmIChyZXQpDQo+ID4gPiA+ICsgICAgICAgICAgIGhkY3BfY2FwID0gZmFsc2U7
DQo+ID4gPiA+ICsgICByZXQgPSBpbnRlbF9oZGNwMl9jYXBhYmxlKGludGVsX2Nvbm5lY3Rvciwg
JmhkY3AyX2NhcCk7DQo+ID4gPiA+ICsgICBpZiAocmV0KQ0KPiA+ID4gPiArICAgICAgICAgICBo
ZGNwMl9jYXAgPSBmYWxzZTsNCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBUaGlzIGRvZXMgbm90IHNl
ZW0gdG8gYmUgYWRkaW5nIHZhbHVlIGhlcmUgYXMgdGhpcyBlcnJvciB3aGljaCB5b3UNCj4gPiA+
IHJlZmVycmVkIHRvIGFzIGJlaW5nIGlnbm9yZWQgaXMgdXNlZCBib3RoIGluIGNhc2Ugb2YgaGRt
aSBhbmQgZHAgaXMNCj4gPiA+IGJlaW5nIHRvIGRldGVybWluZSBpZiBoZGNwX2NhcCBvciBoZGNw
MiBjYXAgaXMgdHJ1ZSBvciBmYWxzZSB3aGljaA0KPiA+ID4geW91IGJhc2ljYWxseSByZWl0ZXJh
dGUgaGVyZSB0b28gY2hlY2sgdGhlIGludGVsX2RwX2hkY3AyX2NhcGFibGUgYW5kDQo+IGludGVs
X2hkbWlfaGRjcDJfY2FwYWJsZSAuDQo+ID4gPiB0aGlzIGNoYW5nZSBpbiBpdHNlbGYgY2FuIGJl
IHJlbW92ZWQuDQo+ID4gPg0KPiA+ID4gUmVnYXJkcywNCj4gPiA+IFN1cmFqIEthbmRwYWwNCj4g
PiA+DQo+IEhleSBTdXJhaiwgd2hhdCB3ZSdyZSB0cnlpbmcgdG8gZG8gaGVyZSBpcyB0byBoYXZl
IGEgZGlzdGluY3Rpb24gYmV0d2VlbiAyDQo+IHRoaW5nczoNCj4gMS4gd2VyZSB3ZSBhYmxlIHRv
IGNoZWNrIG9mIHRoZSBjYXBhYmlsaXR5IG9yIG5vdC4gbGlrZSBkaWQgdGhlIGNvbm5lY3Rpb24g
d29yaw0KPiB3ZWxsIDIuIGlmIHRoZSBjaGVjayB3ZW50IHdlbGwsIHdoYXQgY2FwYWJpbGl0eSB3
ZXJlIHdlcmUgYWJsZSB0byByZWFkIFdlDQo+IG1heSBvciBtYXkgbm90IG5lZWQgYm90aCBpbmZv
LiBCdXQgc2luY2Ugd2UgbW92ZWQgdG8gY29tbW9uIERSTSwgaXQNCj4gbWlnaHQgYmUgYmVzdCBr
ZWVwIHRoZSBkaXN0aW5jdGlvbiBhbmQgZWFjaCBkcml2ZXIgY2FuIGhhbmRsZSBpdCBhcyBpdCBz
ZWVzIGZpdC4NCg0KSGkgTWFyaywNCkhtbSBJIHRoaW5rIGl0IG1ha2Ugc2Vuc2UgdG8gYWxsb3cg
ZWFjaCBkcml2ZXIgdG8gZGVjaWRlIGhvdyB0byBoYW5kbGUgaXQgdGhlbi4NCg0KPiA+ID4gPiAg
ICAgaWYgKGhkY3BfY2FwKQ0KPiA+ID4gPiAgICAgICAgICAgICBzZXFfcHV0cyhtLCAiSERDUDEu
NCAiKTsgZGlmZiAtLWdpdA0KPiA+ID4gPiBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfaGRjcC5jDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9oZGNwLmMNCj4gPiA+ID4gaW5kZXggMGEyMGJjNDFiZTU1Li42MWE4NjJhZTFmMjggMTAwNjQ0
DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5j
DQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5j
DQo+ID4gPiA+IEBAIC0xNzcsNTAgKzE3Nyw0OSBAQCBpbnQgaW50ZWxfaGRjcF9yZWFkX3ZhbGlk
X2Jrc3Yoc3RydWN0DQo+ID4gPiA+IGludGVsX2RpZ2l0YWxfcG9ydCAqZGlnX3BvcnQsICB9DQo+
ID4gPiA+DQo+ID4gPiA+ICAvKiBJcyBIRENQMS40IGNhcGFibGUgb24gUGxhdGZvcm0gYW5kIFNp
bmsgKi8gLWJvb2wNCj4gPiA+ID4gaW50ZWxfaGRjcF9jYXBhYmxlKHN0cnVjdCBpbnRlbF9jb25u
ZWN0b3IgKmNvbm5lY3RvcikNCj4gPiA+ID4gK2ludCBpbnRlbF9oZGNwX2NhcGFibGUoc3RydWN0
IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBib29sDQo+ID4gPiA+ICsqY2FwYWJsZSkNCj4g
PiA+ID4gIHsNCj4gPiA+ID4gICAgIHN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmRpZ19wb3J0
ID0NCj4gPiA+ID4gaW50ZWxfYXR0YWNoZWRfZGlnX3BvcnQoY29ubmVjdG9yKTsNCj4gPiA+ID4g
ICAgIGNvbnN0IHN0cnVjdCBpbnRlbF9oZGNwX3NoaW0gKnNoaW0gPSBjb25uZWN0b3ItPmhkY3Au
c2hpbTsNCj4gPiA+ID4gLSAgIGJvb2wgY2FwYWJsZSA9IGZhbHNlOw0KPiA+ID4gPiAgICAgdTgg
Ymtzdls1XTsNCj4gPiA+ID4NCj4gPiA+ID4gKyAgICpjYXBhYmxlID0gZmFsc2U7DQo+ID4gPiA+
ICsNCj4gPiA+ID4gICAgIGlmICghc2hpbSkNCj4gPiA+ID4gLSAgICAgICAgICAgcmV0dXJuIGNh
cGFibGU7DQo+ID4gPiA+ICsgICAgICAgICAgIHJldHVybiAwOw0KPiA+ID4gPg0KPiA+ID4gPiAt
ICAgaWYgKHNoaW0tPmhkY3BfY2FwYWJsZSkgew0KPiA+ID4gPiAtICAgICAgICAgICBzaGltLT5o
ZGNwX2NhcGFibGUoZGlnX3BvcnQsICZjYXBhYmxlKTsNCj4gPiA+ID4gLSAgIH0gZWxzZSB7DQo+
ID4gPiA+IC0gICAgICAgICAgIGlmICghaW50ZWxfaGRjcF9yZWFkX3ZhbGlkX2Jrc3YoZGlnX3Bv
cnQsIHNoaW0sIGJrc3YpKQ0KPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgIGNhcGFibGUgPSB0
cnVlOw0KPiA+ID4gPiAtICAgfQ0KPiA+ID4gPiArICAgaWYgKHNoaW0tPmhkY3BfY2FwYWJsZSkN
Cj4gPiA+ID4gKyAgICAgICAgICAgcmV0dXJuIHNoaW0tPmhkY3BfY2FwYWJsZShkaWdfcG9ydCwg
Y2FwYWJsZSk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgIGlmICghaW50ZWxfaGRjcF9yZWFkX3Zh
bGlkX2Jrc3YoZGlnX3BvcnQsIHNoaW0sIGJrc3YpKQ0KPiA+ID4gPiArICAgICAgICAgICAqY2Fw
YWJsZSA9IHRydWU7DQo+ID4gPiA+DQo+ID4gPiA+IC0gICByZXR1cm4gY2FwYWJsZTsNCj4gPiA+
ID4gKyAgIHJldHVybiAwOw0KPiA+ID4gPiAgfQ0KPiA+ID4gPg0KPiA+ID4gPiAgLyogSXMgSERD
UDIuMiBjYXBhYmxlIG9uIFBsYXRmb3JtIGFuZCBTaW5rICovIC1ib29sDQo+ID4gPiA+IGludGVs
X2hkY3AyX2NhcGFibGUoc3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0KPiA+ID4g
PiAraW50IGludGVsX2hkY3AyX2NhcGFibGUoc3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29ubmVj
dG9yLCBib29sDQo+ID4gPiA+ICsqY2FwYWJsZSkNCj4gPiA+ID4gIHsNCj4gPiA+ID4gICAgIHN0
cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmRpZ19wb3J0ID0NCj4gPiA+ID4gaW50ZWxfYXR0YWNo
ZWRfZGlnX3BvcnQoY29ubmVjdG9yKTsNCj4gPiA+ID4gICAgIHN0cnVjdCBkcm1faTkxNV9wcml2
YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoY29ubmVjdG9yLT5iYXNlLmRldik7DQo+ID4gPiA+ICAg
ICBzdHJ1Y3QgaW50ZWxfaGRjcCAqaGRjcCA9ICZjb25uZWN0b3ItPmhkY3A7DQo+ID4gPiA+IC0g
ICBib29sIGNhcGFibGUgPSBmYWxzZTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgKmNhcGFibGUg
PSBmYWxzZTsNCj4gPiA+ID4NCj4gPiA+ID4gICAgIC8qIEk5MTUgc3VwcG9ydCBmb3IgSERDUDIu
MiAqLw0KPiA+ID4gPiAgICAgaWYgKCFoZGNwLT5oZGNwMl9zdXBwb3J0ZWQpDQo+ID4gPiA+IC0g
ICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gPiA+ID4gKyAgICAgICAgICAgcmV0dXJuIDA7DQo+
ID4gPiA+DQo+ID4gPiA+ICAgICAvKiBNRUkgaW50ZXJmYWNlIGlzIHNvbGlkICovDQo+ID4gPiA+
ICAgICBtdXRleF9sb2NrKCZkZXZfcHJpdi0+ZGlzcGxheS5oZGNwLmNvbXBfbXV0ZXgpOw0KPiA+
ID4gPiAgICAgaWYgKCFkZXZfcHJpdi0+ZGlzcGxheS5oZGNwLmNvbXBfYWRkZWQgfHwgICFkZXZf
cHJpdi0NCj4gPiA+ID4gPmRpc3BsYXkuaGRjcC5tYXN0ZXIpIHsNCj4gPiA+ID4gICAgICAgICAg
ICAgbXV0ZXhfdW5sb2NrKCZkZXZfcHJpdi0+ZGlzcGxheS5oZGNwLmNvbXBfbXV0ZXgpOw0KPiA+
ID4gPiAtICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+ID4gPiA+ICsgICAgICAgICAgIHJldHVy
biAwOw0KPiA+ID4gPiAgICAgfQ0KPiA+ID4gPiAgICAgbXV0ZXhfdW5sb2NrKCZkZXZfcHJpdi0+
ZGlzcGxheS5oZGNwLmNvbXBfbXV0ZXgpOw0KPiA+ID4gPg0KPiA+ID4gPiAgICAgLyogU2luaydz
IGNhcGFiaWxpdHkgZm9yIEhEQ1AyLjIgKi8NCj4gPiA+ID4gLSAgIGhkY3AtPnNoaW0tPmhkY3Bf
Ml8yX2NhcGFibGUoZGlnX3BvcnQsICZjYXBhYmxlKTsNCj4gPiA+ID4gLQ0KPiA+ID4gPiAtICAg
cmV0dXJuIGNhcGFibGU7DQo+ID4gPiA+ICsgICByZXR1cm4gaGRjcC0+c2hpbS0+aGRjcF8yXzJf
Y2FwYWJsZShkaWdfcG9ydCwgY2FwYWJsZSk7DQo+ID4gPiA+ICB9DQo+ID4gPiA+DQo+ID4gPiA+
ICBzdGF0aWMgYm9vbCBpbnRlbF9oZGNwX2luX3VzZShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
ZGV2X3ByaXYsDQo+ID4gPiA+IEBAIC0NCj4gPiA+ID4gMjM1NSw2ICsyMzU0LDcgQEAgaW50IGlu
dGVsX2hkY3BfZW5hYmxlKHN0cnVjdCBpbnRlbF9jb25uZWN0b3INCj4gPiA+ID4gKmNvbm5lY3Rv
ciwNCj4gPiA+ID4gICAgIHN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmRpZ19wb3J0ID0NCj4g
PiA+ID4gaW50ZWxfYXR0YWNoZWRfZGlnX3BvcnQoY29ubmVjdG9yKTsNCj4gPiA+ID4gICAgIHN0
cnVjdCBpbnRlbF9oZGNwICpoZGNwID0gJmNvbm5lY3Rvci0+aGRjcDsNCj4gPiA+ID4gICAgIHVu
c2lnbmVkIGxvbmcgY2hlY2tfbGlua19pbnRlcnZhbCA9DQo+ID4gPiBEUk1fSERDUF9DSEVDS19Q
RVJJT0RfTVM7DQo+ID4gPiA+ICsgICBib29sIGNhcGFibGU7DQo+ID4gPiA+ICAgICBpbnQgcmV0
ID0gLUVJTlZBTDsNCj4gPiA+ID4NCj4gPiA+ID4gICAgIGlmICghaGRjcC0+c2hpbSkNCj4gPiA+
ID4gQEAgLTIzNzMsMjEgKzIzNzMsMjcgQEAgaW50IGludGVsX2hkY3BfZW5hYmxlKHN0cnVjdA0K
PiA+ID4gPiBpbnRlbF9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4gPiA+ID4gICAgICAqIENvbnNp
ZGVyaW5nIHRoYXQgSERDUDIuMiBpcyBtb3JlIHNlY3VyZSB0aGFuIEhEQ1AxLjQsIElmDQo+ID4g
PiA+IHRoZSBzZXR1cA0KPiA+ID4gPiAgICAgICogaXMgY2FwYWJsZSBvZiBIRENQMi4yLCBpdCBp
cyBwcmVmZXJyZWQgdG8gdXNlIEhEQ1AyLjIuDQo+ID4gPiA+ICAgICAgKi8NCj4gPiA+ID4gLSAg
IGlmIChpbnRlbF9oZGNwMl9jYXBhYmxlKGNvbm5lY3RvcikpIHsNCj4gPiA+ID4gKyAgIHJldCA9
IGludGVsX2hkY3AyX2NhcGFibGUoY29ubmVjdG9yLCAmY2FwYWJsZSk7DQo+ID4gPiA+ICsgICBp
ZiAoY2FwYWJsZSkgew0KPiA+ID4gPiAgICAgICAgICAgICByZXQgPSBfaW50ZWxfaGRjcDJfZW5h
YmxlKGNvbm5lY3Rvcik7DQo+ID4gPiA+IC0gICAgICAgICAgIGlmICghcmV0KQ0KPiA+ID4gPiAr
ICAgICAgICAgICBpZiAoIXJldCkgew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgIGNoZWNr
X2xpbmtfaW50ZXJ2YWwgPQ0KPiA+ID4gPiBEUk1fSERDUDJfQ0hFQ0tfUEVSSU9EX01TOw0KPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPiA+ID4gPiArICAgICAgICAgICB9
DQo+ID4NCj4gPiBISSwNCj4gPiBKdXN0IG5vdGljZWQgYW5vdGhlciBjaGFuZ2VkIGhlcmUgaWYg
YW55IGVycm9yIGlzIHJldHVybmVkIHdpdGgNCj4gPiBpbnRlbF9oZGMyX2NhcGFibGUgWW91IGRp
cmVjdGx5IGp1bXAgdG8gb3V0IHdoaWNoIHdpbGwgc3RvcCB1cyBmcm9tDQo+ID4gZW5hYmxpbmcg
aGRjcCAxLjQgd2Ugc2hvdWxkIGNoZWNrIGZvciBoZGNwIDEuNCBjYXBhYmlsaXR5IGV2ZW4gaWYg
aGRjcA0KPiA+IDIuMiBjYXBhYmlsaXR5IGlzIHJldHVybmVkIHdpdGggYW4gZXJyb3Igb25lIG90
aGVyIHJlYXNvbiBJIGRvbid0IHRoaW5rIHRoZQ0KPiBoYW5kbGluZyBvZiBlcnJvciBjb2RlcyBh
cmUgYWRkaW5nIHZhbHVlIGhlcmUuDQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IFN1cmFqIEthbmRw
YWwNCj4gSGV5IFN1cmFqIC0gdGhlIGdvdG8gaGFwcGVucyBpZiB3ZSBrbm93IHRoYXQgdGhlIGRl
dmljZSBpcyBoZGNwMiBjYXBhYmxlLiBJZg0KPiBpdCdzIGNhcGFibGUsIHdlIGRvIGVuYWJsZSBp
dC4gSWYgd2UgaGF2ZSBubyBlcnJvciByZXR1cm5lZCwgdGhhdCdzIHdoZW4gd2UNCj4gc2tpcCBo
ZGNwMS40IG90aGVyd2lzZSwgaWYgaXQncyBub3QgY2FwYWJsZSwgb3IgdGhlIGVuYWJsZSByZXR1
cm5lZCB3aXRoIGFuDQo+IGVycm9yIGNvZGUsIHdlIGRvbid0IGdvdG8gb3V0IGJ1dCBtb3ZlIG9u
IHRvIHRyeSBvbiBoZGNwIDEuNCBUaGFua3MhDQoNClRoaXMgbG9naWMgd2lsbCBub3Qgd29yayBh
cyBoZGNwMiBjYXBhYmlsaXR5IGlzIGRldGVybWluZWQgYnkgcmVhZGluZyBSeENhcHMgcmVnaXN0
ZXINCmFuZCBoZGNwMS54IGNhcGFiaWxpdHkgaXMgZGV0ZXJtaW5lZCBieSBsb29raW5nIGF0IHRo
ZSBkZXZpY2VzIGJrc3Ygd2hpY2ggbWVhbnMNCnRoZXJlIGlzIGEgcG9zc2liaWxpdHkgaGRjcDIg
bWF5IHRocm93IGFuIGVycm9yIHJlYWRpbmcgdGhlIHJ4Y2FwcyByZWdpc3RlciBidXQgbm90IGlz
c3VlIGFuDQplcnJvciB3aGlsZSByZWFkaW5nIHRoZSBia3N2IGFuZCBzaW5jZSBoZGNwMiBkZXZp
Y2VzIGFsc28gc3VwcG9ydHMgaGRjcCAxLnggaW4gdGhpcyBjYXNlIHdlDQpzaG91bGQgdHJ5IGVu
YWJsZSBoZGNwMS40IGlmIGVycm9yIGlzIGlzc3VlZCBpbiBhdCB0aGUgdGltZSBvZiBoZGNwMiBi
dXQgdGhpcyBjb2RlIG1ha2VzIHRoYXQNCmltcG9zc2libGUuDQoNClJlZ2FyZHMsDQpTdXJhaiBL
YW5kcGFsDQoNCj4gPiA+ID4gICAgIH0NCj4gPiA+ID4NCj4gPiA+ID4gICAgIC8qDQo+ID4gPiA+
ICAgICAgKiBXaGVuIEhEQ1AyLjIgZmFpbHMgYW5kIENvbnRlbnQgVHlwZSBpcyBub3QgVHlwZTEs
IEhEQ1AxLjQgd2lsbA0KPiA+ID4gPiAgICAgICogYmUgYXR0ZW1wdGVkLg0KPiA+ID4gPiAgICAg
ICovDQo+ID4gPiA+IC0gICBpZiAocmV0ICYmIGludGVsX2hkY3BfY2FwYWJsZShjb25uZWN0b3Ip
ICYmDQo+ID4gPiA+IC0gICAgICAgaGRjcC0+Y29udGVudF90eXBlICE9IERSTV9NT0RFX0hEQ1Bf
Q09OVEVOVF9UWVBFMSkgew0KPiA+ID4gPiArICAgcmV0ID0gaW50ZWxfaGRjcF9jYXBhYmxlKGNv
bm5lY3RvciwgJmNhcGFibGUpOw0KPiA+ID4gPiArICAgaWYgKHJldCkNCj4gPiA+ID4gKyAgICAg
ICAgICAgZ290byBvdXQ7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgIGlmIChjYXBhYmxlICYmIGhk
Y3AtPmNvbnRlbnRfdHlwZSAhPQ0KPiA+ID4gPiBEUk1fTU9ERV9IRENQX0NPTlRFTlRfVFlQRTEp
DQo+ID4gPiA+ICAgICAgICAgICAgIHJldCA9IF9pbnRlbF9oZGNwX2VuYWJsZShjb25uZWN0b3Ip
Ow0KPiA+ID4gPiAtICAgfQ0KPiA+ID4gPg0KPiA+ID4gPiArb3V0Og0KPiA+ID4gPiAgICAgaWYg
KCFyZXQpIHsNCj4gPiA+ID4gICAgICAgICAgICAgc2NoZWR1bGVfZGVsYXllZF93b3JrKCZoZGNw
LT5jaGVja193b3JrLA0KPiA+ID4gPiBjaGVja19saW5rX2ludGVydmFsKTsNCj4gPiA+ID4gICAg
ICAgICAgICAgaW50ZWxfaGRjcF91cGRhdGVfdmFsdWUoY29ubmVjdG9yLA0KPiA+ID4gPiBAQCAt
MjM5NSw3ICsyNDAxLDYgQEAgaW50IGludGVsX2hkY3BfZW5hYmxlKHN0cnVjdCBpbnRlbF9jb25u
ZWN0b3INCj4gPiA+ID4gKmNvbm5lY3RvciwNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdHJ1ZSk7DQo+ID4gPiA+ICAgICB9DQo+ID4gPiA+DQo+ID4gPiA+IC1v
dXQ6DQo+ID4gPiA+ICAgICBtdXRleF91bmxvY2soJmRpZ19wb3J0LT5oZGNwX211dGV4KTsNCj4g
PiA+ID4gICAgIG11dGV4X3VubG9jaygmaGRjcC0+bXV0ZXgpOw0KPiA+ID4gPiAgICAgcmV0dXJu
IHJldDsNCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfaGRjcC5oDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9oZGNwLmgNCj4gPiA+ID4gaW5kZXggN2M1ZmQ4NGE3YjY1Li5mMDZmNmU1YTJiMWEgMTAwNjQ0
DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5o
DQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5o
DQo+ID4gPiA+IEBAIC0zMyw4ICszMyw4IEBAIHZvaWQgaW50ZWxfaGRjcF91cGRhdGVfcGlwZShz
dHJ1Y3QNCj4gPiA+ID4gaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3Rh
dGUsDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fY29u
bmVjdG9yX3N0YXRlDQo+ID4gPiA+ICpjb25uX3N0YXRlKTsNCj4gPiA+IGJvb2wNCj4gPiA+ID4g
aXNfaGRjcF9zdXBwb3J0ZWQoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2LCBlbnVt
IHBvcnQNCj4gPiA+ID4gcG9ydCk7IC1ib29sIGludGVsX2hkY3BfY2FwYWJsZShzdHJ1Y3QgaW50
ZWxfY29ubmVjdG9yDQo+ID4gPiA+ICpjb25uZWN0b3IpOyAtYm9vbCBpbnRlbF9oZGNwMl9jYXBh
YmxlKHN0cnVjdCBpbnRlbF9jb25uZWN0b3INCj4gPiA+ID4gKmNvbm5lY3Rvcik7DQo+ID4gPiA+
ICtpbnQgaW50ZWxfaGRjcF9jYXBhYmxlKHN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmNvbm5lY3Rv
ciwgYm9vbA0KPiA+ID4gPiArKmNhcGFibGUpOyBpbnQgaW50ZWxfaGRjcDJfY2FwYWJsZShzdHJ1
Y3QgaW50ZWxfY29ubmVjdG9yDQo+ID4gPiA+ICsqY29ubmVjdG9yLCBib29sICpjYXBhYmxlKTsN
Cj4gPiA+ID4gIHZvaWQgaW50ZWxfaGRjcF9jb21wb25lbnRfaW5pdChzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZQ0KPiA+ID4gPiAqZGV2X3ByaXYpOyB2b2lkIGludGVsX2hkY3BfY29tcG9uZW50X2Zp
bmkoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUNCj4gPiA+ID4gKmRldl9wcml2KTsgdm9pZCBpbnRl
bF9oZGNwX2NsZWFudXAoc3RydWN0IGludGVsX2Nvbm5lY3Rvcg0KPiA+ID4gPiAqY29ubmVjdG9y
KTsNCj4gPiA+ID4gLS0NCj4gPiA+ID4gMi4zOS4wLjI0Ni5nMmE2ZDc0YjU4My1nb29nDQo+ID4N
Cg==
