Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7679C4B6C05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 13:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233510AbiBOM2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 07:28:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236596AbiBOM2r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 07:28:47 -0500
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.140.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A57E107D13;
        Tue, 15 Feb 2022 04:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
  s=qccesdkim1; t=1644928117; x=1645532917;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SVXqX8ZKpddoE4yz51cSNso6TX4nGiLFhTYTabzXpVo=;
  b=VGC9GqoDUAR7qSA8R/04MtmzT7+MwoSO0diz2Q20S+jydm8vO7uowOgc
   SgoRF85nXhmpPNcX8vm75pjsJu/OIF7TonlGtSAkCZD7jiLMKWlJ6lr2T
   PXfERWF8c4cYHdQP/Pf2X5lf7BXlx72yWD0vKV1rHtEIWS2VeC7IUiGhI
   s=;
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 12:28:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1q12gr3XdruT05kCSWzWgVvraaYgD+BrtJ7C3qdzPrVTFqaNXzaw3ugFh/1CdSiMW7RhPe2JGZIayBUsxK2vHiH2dqHH459W0lR43i/+jZuWUsvVA8zYjKfkONy5XZR353fAsBwXbxEOCGmbI0Gth3X7QuJzX9m9DnIxg0Nx4N50ASBRNTCfm3FqJ2n9iko6MVhF5RpsZmWfkkxZERA4PPnhVel6iheyEmBIHzNKABHdFNWfIxhRmMMerlG6nFkb+KTIBzKvb2cElnNO48pJfMlWp1nVk5Qc0rPfkR8/tIukKXJlf8VI7f9rKlpjD2vmZLaTUl36aPDSa0+rPPEYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVXqX8ZKpddoE4yz51cSNso6TX4nGiLFhTYTabzXpVo=;
 b=AqU7VEdjtZGEhX6czZ9VXLfZTG0a90U7mJasEHdg5BeWGcW6mxW5noekDj4ETqgYAvhSlyNRy6vQ0lotBe0f/GL0L7WDJZvAc2aI7aPMVYVtQfv6ixieyZoh58g2hSSrQnTe4JRI/97DQNtAflnoRH4SBuHvRo6Ao1W+beHQMKeRwyPJw+59wlC8WImJIoP3UyB6Z2hSkaSBgdbkv1B2I1C6dtct1xVbsHgvOy0wrrTAvX3vbAW7Rkmiiy80R1n22kIUOP/a+m9sPXrasczqr8noPuJRCQRWan5sIePVL+90UCiPoa2d3O2XqQ7wMGW0gYD5N1NQwFduTXZlEX163g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from PH0PR02MB8455.namprd02.prod.outlook.com (2603:10b6:510:dc::23)
 by BN6PR02MB2562.namprd02.prod.outlook.com (2603:10b6:404:58::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 12:28:30 +0000
Received: from PH0PR02MB8455.namprd02.prod.outlook.com
 ([fe80::699d:a091:bb6a:49d]) by PH0PR02MB8455.namprd02.prod.outlook.com
 ([fe80::699d:a091:bb6a:49d%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 12:28:30 +0000
From:   "Sajida Bhanu (Temp)" <c_sbhanu@qti.qualcomm.com>
To:     Adrian Hunter <adrian.hunter@intel.com>,
        "Sajida Bhanu (Temp) (QUIC)" <quic_c_sbhanu@quicinc.com>,
        "Asutosh Das (QUIC)" <quic_asutoshd@quicinc.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "stummala@codeaurora.org" <stummala@codeaurora.org>,
        "vbadigan@codeaurora.org" <vbadigan@codeaurora.org>,
        "Ram Prakash Gupta (QUIC)" <quic_rampraka@quicinc.com>,
        "Pradeep Pragallapati (QUIC)" <quic_pragalla@quicinc.com>,
        "sartgarg@codeaurora.org" <sartgarg@codeaurora.org>,
        "nitirawa@codeaurora.org" <nitirawa@codeaurora.org>,
        "sayalil@codeaurora.org" <sayalil@codeaurora.org>,
        Liangliang Lu <luliang@codeaurora.org>,
        "Bao D . Nguyen" <nguyenb@codeaurora.org>
Subject: RE: [PATCH V3 1/4] mmc: sdhci: Capture eMMC and SD card errors
Thread-Topic: [PATCH V3 1/4] mmc: sdhci: Capture eMMC and SD card errors
Thread-Index: AQHYDiMD5UGg5mvpCkudYe96kOYBs6xtDw2AgAcEA9CACrghgIALVgVAgAPZNQCABrErwA==
Date:   Tue, 15 Feb 2022 12:28:30 +0000
Message-ID: <PH0PR02MB8455B0D6F7C6BF679484BD34CD349@PH0PR02MB8455.namprd02.prod.outlook.com>
References: <1642699582-14785-1-git-send-email-quic_c_sbhanu@quicinc.com>
 <1642699582-14785-2-git-send-email-quic_c_sbhanu@quicinc.com>
 <b28d2d19-b8fb-c58b-f661-6b5f0760b1a4@intel.com>
 <SJ0PR02MB844953E6B8E29BCDCC6222ACCD5F9@SJ0PR02MB8449.namprd02.prod.outlook.com>
 <a999067d-3723-1c9b-ed7e-91cd4856b7ee@intel.com>
 <SJ0PR02MB84499D9B53FAE4E3173669CFCD2D9@SJ0PR02MB8449.namprd02.prod.outlook.com>
 <d56166f7-762f-413c-ab49-15b91f1c95a9@intel.com>
In-Reply-To: <d56166f7-762f-413c-ab49-15b91f1c95a9@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1b4cd3b-bee5-4892-48a8-08d9f07eace3
x-ms-traffictypediagnostic: BN6PR02MB2562:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR02MB256246A8E7DC3A14F2BFFB85CD349@BN6PR02MB2562.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J/QmeGS80ho+Hk7mAqa/Enh56Ejus37wCU0BAfsCNhlI2uoJ0u8hjdeujCZKSP8TfiI2hUaeFhBbZsm0+c/hoQ0gLC7xmBC1gdrrggbfBQ6OUAZcTNloyzyjjNX8icwQjaD6ZVVfyKwtNW7ZbHHd3pEf07XN7K3eJBNhgdgOFrKwCwl6IZBYWn5VyucuElllMtC/CwVA9M97+N9/uKZf7xDW1+QsosTu6wnEqDae+D5u1PVn8/zyzhC1o6Y2M7Z675jlwUhzAIjAYJMZKr9K5JvB7R3Cf5k7UvunsTNP1ru/H8FH7ztB+cKa9w/inib083kM5An1IaDGnWU126ggJQUGwCmRxL9SoCOII9q00UK3n6ejuMfa93W8pOnRRbtEDcT5kytgc5OU9HgUjsRGU702ox817CnPjPkO8q4lsXQ9clb5toWCFM2cADljHwLbCZj99SeEvQTa4EWWLf1qlUsNUgUQlA6gsvbPW++bYuY+mLTq4FE+WgyvN0jAmc4xlX9zjcpUnW8cpCrkjrwILCHBLfSsfGEpMbFrbboK35/D4YssdiyC1cNvfiwmH6RJ7jEgeyQyCPBwv9alK7hsad5hyZQgXYuKyrlRcE0K/1IeK3WE7GVF8HAkagxnZDRcCe8YcW2ioZXwQMU8uZpzgJNE7Ud/Ib/jzuzwvXBM4VpWAalEnZWYbXZO3sX0r8jECSObizzu29wf53cgLB5UQw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB8455.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(316002)(38070700005)(508600001)(86362001)(110136005)(54906003)(66446008)(66556008)(66946007)(66476007)(76116006)(64756008)(9686003)(4326008)(8676002)(55016003)(53546011)(71200400001)(33656002)(6506007)(7696005)(83380400001)(52536014)(8936002)(7416002)(5660300002)(26005)(30864003)(186003)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dklXRGJYRUtxekIwSGFXWk1yZUdhOERkWkxYVWZGSGFjV2g5WlJVOTlVeDYz?=
 =?utf-8?B?cXBJcWIzaEhBWjlqUkxPUFJSNVJXZ1phZ3BaRktyem9NbzJuZFlZNUEzN1NH?=
 =?utf-8?B?ZUxWUjR2cmp4SWFNKzJFd0dlc3owejF4NVVpWjRLa0lOcjJ1RWpHeWx2b2o5?=
 =?utf-8?B?c1l5ZXBFcFZqR3pJeHh2cThvZ2VNdjlUVFNCMVBnRnN5QzFTbHpBaml5eDE2?=
 =?utf-8?B?QVlWYWQ2dXZ0eDFSaklNc3hWTlFac3pVZHQ3dUNQM1ZCOUxaWEtIMGtIWEla?=
 =?utf-8?B?NVNlYU4rNG9UcHRKV3ZKaVRiemt3NVUrNzhQVEZCT3Byby9mS1VCak92dHQx?=
 =?utf-8?B?dGVzeEVjR1lVOHFsSjc3eHRZVkRIOXFtUWJ3dFJuSkxPQkJTTmh3MVNwTHk4?=
 =?utf-8?B?TVpzOUZ2MlFmQyt4OUo3MXhEVENwa1QzMXhpdnhmLzhzQTY2V3NBQVVubTdo?=
 =?utf-8?B?a1VYVHJyc2EwRkk5QmgxdzR5S3dHVkx5VC92M2xQMktyZGZ0dkVmalgrQjNa?=
 =?utf-8?B?OEFubjVXQmFicmwzaTQzTWRXNmRKN29sMjlpQUxSR2kvTlF1cGl0eUZ6cDdX?=
 =?utf-8?B?REkxckpVdWRLYlY5dTZ1c1RSR2dkNEh4eUs4aElZeHg3UFlucjMyZzFuMUtR?=
 =?utf-8?B?cW1pejZ5YnZJSFRjczY1VVJsNGo5RVR2NlArY0E1aFhNUFZEUm92YkJsSUlo?=
 =?utf-8?B?SjZ4QVh4Y0RVRHowaEs1MmNPQnErdHZaL2R1ejdySjAyWXNUNm5BbkhVU2RZ?=
 =?utf-8?B?dnByNklBYmJXVVl1S3FsM04rdTQ3QjJFWFRpZzN3OHZpcWxESEJiMTlQR0Vs?=
 =?utf-8?B?cnpKT21qaXg4N1JVZThqeDBldndoNnpZL1IxMkx1ZUl1OGtPSWRhWTY3TDRo?=
 =?utf-8?B?Rkc3a1htVGNCSExIeXEramxXMjNUcGVBWVMxSkIzY0ZKbHZTWXk4VGMvVXky?=
 =?utf-8?B?ZnFWS1Y1Uk5Xdm5ZWFd4eFVMVzhzdjB2YW5SSWlVYjEzSFM4Y2hCS01HSHFa?=
 =?utf-8?B?a0Z0dHA1ZmJyc1dSYnU1cUpBSFVzTVZ1Skl2aGRDcEVhZklFUEZsbngzQUNu?=
 =?utf-8?B?ZVRGRTN3T2gvSVdyZlNPZjBRVHJBVy80K1llaGVuKzJpRnhVUlRPeVBzRW5m?=
 =?utf-8?B?V0ZUQ3lnTVBhVVF3UXV4YnE1d1JTcEZnankwbW05ZU1pM20yWnNuU2VRUC9C?=
 =?utf-8?B?eGFlTzNFblJNVnJVTUw4cUdhMXM3VWhxVkhCTWgzM3Q0NU1ZMytuL3ZHRll3?=
 =?utf-8?B?QUVqMWQ5M1VxQlRWKzh2MzZxL3hncGdtWnlSMWMrSXVlVlY5KzhKdkFicXFL?=
 =?utf-8?B?SXJtVDFHS2JzbnhmaXRsWmdJOTdOMjVwTCtzSTNSRTBGRWtDYmU5Q1RvTDlh?=
 =?utf-8?B?SURPUm83YnU2T1N5MU12N1NPMDkwT1Y5dDRTb3daeFFkeXVLVlpJRUIySzNS?=
 =?utf-8?B?YWQvWnBqZWxoYVJ4NzR2b2ZDR1pZN1czSlNTWW52Uk9YZGRjNFlyeXFOajJG?=
 =?utf-8?B?d2FLZzZBVUlYcjQvNytyVERRWTlPdExMK3o4VDkwbk5McTRJUWFLVVFBTTFl?=
 =?utf-8?B?YUNoWUtXbVlhVVpoeG1VTGdEai95Y1g1c3FFK3k3eDNBYklBa0p1Rk9TNGJB?=
 =?utf-8?B?M3J6bUNoUmpsVDBzTGF2Mnp5UFlDcWZPcnVSejhTbzh0akc5VUxxQmtrTkYv?=
 =?utf-8?B?R2JEd0xKTEErTXNmRG5ENkRibXhhelBRL3ZIYUI3S1kwbnJjQnVUdUhnbzhp?=
 =?utf-8?B?MWUxL3RpYWxjYVROUFVML0tObVkrWG5CSUp2Sms4TklyY2V5d3VlS0JISUtn?=
 =?utf-8?B?UEVOQ3B6QzVCZm9YK2ZNL0xNUVFTZ05hSk9tZWgweStyeFlUb2tTOWJaMUND?=
 =?utf-8?B?UEsybFVJQ2hyeldWSVk0emcvVFVENWttOWlaNythVjN0UDJhQlViUGFWamxp?=
 =?utf-8?B?WkJMeDB5WGdwSGkxVWZmK0cyeVo1NkxZS0hsemVkWVEwVytJSDRvc2EzaGJ6?=
 =?utf-8?B?dXB1ZHYyYllUSGVJVE93dTFkL0JrUWNtWGFCaWhKT0hhYjl0WDh1R2pPd2ZN?=
 =?utf-8?B?ZUc3M0RDeVdSbGNZMm50UTlpRSsvZ2Rjek1yV3QzRE1VV3lXODUvWm9QelV2?=
 =?utf-8?B?MHJvQlludWVIbi9teitRRjRWbDdzRkV2dGhwcklaZHdaZWZBQ0VkdW9JbkJW?=
 =?utf-8?B?TXpuL0dmYXNmUjcxWHkwSVRtZVdqTWc0TTljVFY2cXJ4ODFCQ2p3RFlSdnkr?=
 =?utf-8?B?NURPZTc1bktzN2V6a0VuR1FQMjJRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB8455.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b4cd3b-bee5-4892-48a8-08d9f07eace3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 12:28:30.5508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ykES+cp/6CakOz2FuubA8jEc60F7FA3cgIoh3W+QdQkxf7UbSaywROtlnD/QTJJn2CBr8j8C6UqW2CwQO10pwFc3Id2i3osqcMs7rWlse04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2562
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgQWRyaWFuLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNClBsZWFzZSBmaW5kIHRoZSBp
bmxpbmUgY29tbWVudHMuDQoNClRoYW5rcywNClNhamlkYQ0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPiANClNl
bnQ6IEZyaWRheSwgRmVicnVhcnkgMTEsIDIwMjIgMTE6MjEgQU0NClRvOiBTYWppZGEgQmhhbnUg
KFRlbXApIChRVUlDKSA8cXVpY19jX3NiaGFudUBxdWljaW5jLmNvbT47IEFzdXRvc2ggRGFzIChR
VUlDKSA8cXVpY19hc3V0b3NoZEBxdWljaW5jLmNvbT47IHVsZi5oYW5zc29uQGxpbmFyby5vcmc7
IGFncm9zc0BrZXJuZWwub3JnOyBiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZzsgbGludXgtbW1j
QHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcNCkNjOiBzdHVtbWFsYUBjb2RlYXVyb3JhLm9yZzsgdmJhZGln
YW5AY29kZWF1cm9yYS5vcmc7IFJhbSBQcmFrYXNoIEd1cHRhIChRVUlDKSA8cXVpY19yYW1wcmFr
YUBxdWljaW5jLmNvbT47IFByYWRlZXAgUHJhZ2FsbGFwYXRpIChRVUlDKSA8cXVpY19wcmFnYWxs
YUBxdWljaW5jLmNvbT47IHNhcnRnYXJnQGNvZGVhdXJvcmEub3JnOyBuaXRpcmF3YUBjb2RlYXVy
b3JhLm9yZzsgc2F5YWxpbEBjb2RlYXVyb3JhLm9yZzsgTGlhbmdsaWFuZyBMdSA8bHVsaWFuZ0Bj
b2RlYXVyb3JhLm9yZz47IEJhbyBEIC4gTmd1eWVuIDxuZ3V5ZW5iQGNvZGVhdXJvcmEub3JnPg0K
U3ViamVjdDogUmU6IFtQQVRDSCBWMyAxLzRdIG1tYzogc2RoY2k6IENhcHR1cmUgZU1NQyBhbmQg
U0QgY2FyZCBlcnJvcnMNCg0KV0FSTklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0
c2lkZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJlIHdhcnkgb2YgYW55IGxpbmtzIG9yIGF0dGFjaG1l
bnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQoNCk9uIDA4LzAyLzIwMjIgMjE6MDQsIFNh
amlkYSBCaGFudSAoVGVtcCkgKFFVSUMpIHdyb3RlOg0KPiBIaSwNCj4NCj4gVGhhbmtzIGZvciB0
aGUgcmV2aWV3Lg0KPg0KPiBQbGVhc2UgZmluZCB0aGUgaW5saW5lIGNvbW1lbnRzDQo+DQo+IFRo
YW5rcywNCj4gU2FqaWRhDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFk
cmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBG
ZWJydWFyeSAxLCAyMDIyIDc6MjggUE0NCj4gVG86IFNhamlkYSBCaGFudSAoVGVtcCkgPGNfc2Jo
YW51QHF0aS5xdWFsY29tbS5jb20+OyBTYWppZGEgQmhhbnUgDQo+IChUZW1wKSAoUVVJQykgPHF1
aWNfY19zYmhhbnVAcXVpY2luYy5jb20+OyBBc3V0b3NoIERhcyAoUVVJQykgDQo+IDxxdWljX2Fz
dXRvc2hkQHF1aWNpbmMuY29tPjsgdWxmLmhhbnNzb25AbGluYXJvLm9yZzsgDQo+IGFncm9zc0Br
ZXJuZWwub3JnOyBiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZzsgDQo+IGxpbnV4LW1tY0B2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnOyANCj4gbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZw0KPiBDYzogc3R1bW1hbGFAY29kZWF1cm9yYS5vcmc7IHZiYWRp
Z2FuQGNvZGVhdXJvcmEub3JnOyBSYW0gUHJha2FzaCANCj4gR3VwdGEgKFFVSUMpIDxxdWljX3Jh
bXByYWthQHF1aWNpbmMuY29tPjsgUHJhZGVlcCBQcmFnYWxsYXBhdGkgKFFVSUMpIA0KPiA8cXVp
Y19wcmFnYWxsYUBxdWljaW5jLmNvbT47IHNhcnRnYXJnQGNvZGVhdXJvcmEub3JnOyANCj4gbml0
aXJhd2FAY29kZWF1cm9yYS5vcmc7IHNheWFsaWxAY29kZWF1cm9yYS5vcmc7IExpYW5nbGlhbmcg
THUgDQo+IDxsdWxpYW5nQGNvZGVhdXJvcmEub3JnPjsgQmFvIEQgLiBOZ3V5ZW4gPG5ndXllbmJA
Y29kZWF1cm9yYS5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjMgMS80XSBtbWM6IHNkaGNp
OiBDYXB0dXJlIGVNTUMgYW5kIFNEIGNhcmQgDQo+IGVycm9ycw0KPg0KPiBPbiAyNS8wMS8yMDIy
IDIwOjE3LCBTYWppZGEgQmhhbnUgKFRlbXApIHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gVGhhbmtz
IGZvciAgdGhlIFJldmlldy4NCj4+DQo+PiBQbGVhc2UgZmluZCB0aGUgaW5saW5lIGNvbW1lbnRz
Lg0KPj4NCj4+IFRoYW5rcywNCj4+IFNhamlkYQ0KPj4NCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+PiBGcm9tOiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4N
Cj4+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAyMSwgMjAyMiAxMjozOCBQTQ0KPj4gVG86IFNhamlk
YSBCaGFudSAoVGVtcCkgKFFVSUMpIDxxdWljX2Nfc2JoYW51QHF1aWNpbmMuY29tPjsgQXN1dG9z
aCANCj4+IERhcyAoUVVJQykgPHF1aWNfYXN1dG9zaGRAcXVpY2luYy5jb20+OyB1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnOyANCj4+IGFncm9zc0BrZXJuZWwub3JnOyBiam9ybi5hbmRlcnNzb25AbGlu
YXJvLm9yZzsgDQo+PiBsaW51eC1tbWNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0tbXNtQHZn
ZXIua2VybmVsLm9yZzsgDQo+PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+PiBDYzog
c3R1bW1hbGFAY29kZWF1cm9yYS5vcmc7IHZiYWRpZ2FuQGNvZGVhdXJvcmEub3JnOyBSYW0gUHJh
a2FzaCANCj4+IEd1cHRhIChRVUlDKSA8cXVpY19yYW1wcmFrYUBxdWljaW5jLmNvbT47IFByYWRl
ZXAgUHJhZ2FsbGFwYXRpIChRVUlDKSANCj4+IDxxdWljX3ByYWdhbGxhQHF1aWNpbmMuY29tPjsg
c2FydGdhcmdAY29kZWF1cm9yYS5vcmc7IA0KPj4gbml0aXJhd2FAY29kZWF1cm9yYS5vcmc7IHNh
eWFsaWxAY29kZWF1cm9yYS5vcmc7IExpYW5nbGlhbmcgTHUgDQo+PiA8bHVsaWFuZ0Bjb2RlYXVy
b3JhLm9yZz47IEJhbyBEIC4gTmd1eWVuIDxuZ3V5ZW5iQGNvZGVhdXJvcmEub3JnPg0KPj4gU3Vi
amVjdDogUmU6IFtQQVRDSCBWMyAxLzRdIG1tYzogc2RoY2k6IENhcHR1cmUgZU1NQyBhbmQgU0Qg
Y2FyZCANCj4+IGVycm9ycw0KPj4NCj4+IE9uIDIwLzAxLzIwMjIgMTk6MjYsIFNoYWlrIFNhamlk
YSBCaGFudSB3cm90ZToNCj4+PiBBZGQgY2hhbmdlcyB0byBjYXB0dXJlIGVNTUMgYW5kIFNEIGNh
cmQgZXJyb3JzLg0KPj4+IFRoaXMgaXMgdXNlZnVsIGZvciBkZWJ1ZyBhbmQgdGVzdGluZy4NCj4+
Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFNoYWlrIFNhamlkYSBCaGFudSA8cXVpY19jX3NiaGFudUBx
dWljaW5jLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBMaWFuZ2xpYW5nIEx1IDxsdWxpYW5nQGNv
ZGVhdXJvcmEub3JnPg0KPj4+IFNpZ25lZC1vZmYtYnk6IFNheWFsaSBMb2toYW5kZSA8c2F5YWxp
bEBjb2RlYXVyb3JhLm9yZz4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBCYW8gRC4gTmd1eWVuIDxuZ3V5
ZW5iQGNvZGVhdXJvcmEub3JnPg0KPj4+IC0tLQ0KPj4+ICBkcml2ZXJzL21tYy9ob3N0L3NkaGNp
LW1zbS5jIHwgIDMgKysNCj4+PiAgZHJpdmVycy9tbWMvaG9zdC9zZGhjaS5jICAgICB8IDcyICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+Pj4gIGluY2x1ZGUv
bGludXgvbW1jL2hvc3QuaCAgICAgfCAzMSArKysrKysrKysrKysrKysrKysrDQo+Pj4gIDMgZmls
ZXMgY2hhbmdlZCwgOTQgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1tc20uYyANCj4+PiBiL2RyaXZlcnMv
bW1jL2hvc3Qvc2RoY2ktbXNtLmMgaW5kZXggNTBjNzFlMC4uMzA5ZWI3YiAxMDA2NDQNCj4+PiAt
LS0gYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW1zbS5jDQo+Pj4gKysrIGIvZHJpdmVycy9tbWMv
aG9zdC9zZGhjaS1tc20uYw0KPj4+IEBAIC0xMjgsNiArMTI4LDggQEANCj4+Pg0KPj4+ICAjZGVm
aW5lIE1TTV9NTUNfQVVUT1NVU1BFTkRfREVMQVlfTVMgICAgICAgNTANCj4+Pg0KPj4+ICsjZGVm
aW5lIE1TTV9NTUNfRVJSX1NUQVRTX0VOQUJMRSAxDQo+Pj4gKw0KPj4+ICAvKiBUaW1lb3V0IHZh
bHVlIHRvIGF2b2lkIGluZmluaXRlIHdhaXRpbmcgZm9yIHB3cl9pcnEgKi8gICNkZWZpbmUgDQo+
Pj4gTVNNX1BXUl9JUlFfVElNRU9VVF9NUyA1MDAwDQo+Pj4NCj4+PiBAQCAtMjczNCw2ICsyNzM2
LDcgQEAgc3RhdGljIGludCBzZGhjaV9tc21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4+PiAgICAgaWYgKHJldCkNCj4+PiAgICAgICAgICAgICBnb3RvIHBtX3J1bnRpbWVf
ZGlzYWJsZTsNCj4+Pg0KPj4+ICsgICBob3N0LT5tbWMtPmVycl9zdGF0c19lbmFibGVkID0gTVNN
X01NQ19FUlJfU1RBVFNfRU5BQkxFOw0KPj4NCj4+IFBsZWFzZSByZW1vdmUgdGhpcy4gU0RIQ0kg
d2lsbCBlbmFibGUgZXJyb3Igc3RhdHMuDQo+Pg0KPj4+Pj4+Pj4gU3VyZS4NCj4+DQo+Pj4gICAg
IHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koJnBkZXYtPmRldik7DQo+Pj4gICAgIHBtX3J1bnRp
bWVfcHV0X2F1dG9zdXNwZW5kKCZwZGV2LT5kZXYpOw0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbW1jL2hvc3Qvc2RoY2kuYyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2kuYyANCj4+PiBp
bmRleCAwN2M2ZGExLi43NGIzNTZlIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3Qv
c2RoY2kuYw0KPj4+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2kuYw0KPj4+IEBAIC0xMTMs
NiArMTEzLDggQEAgdm9pZCBzZGhjaV9kdW1wcmVncyhzdHJ1Y3Qgc2RoY2lfaG9zdCAqaG9zdCkN
Cj4+PiAgICAgaWYgKGhvc3QtPm9wcy0+ZHVtcF92ZW5kb3JfcmVncykNCj4+PiAgICAgICAgICAg
ICBob3N0LT5vcHMtPmR1bXBfdmVuZG9yX3JlZ3MoaG9zdCk7DQo+Pj4NCj4+PiArICAgaWYgKGhv
c3QtPm1tYy0+ZXJyX3N0YXRzX2VuYWJsZWQpDQo+Pj4gKyAgICAgICAgICAgbW1jX2RlYnVnZnNf
ZXJyX3N0YXRzX2VuYWJsZShob3N0LT5tbWMpOw0KPj4NCj4+IFBsZWFzZSBtb3ZlIHRoaXMgdG8g
c2RoY2lfc2V0dXBfaG9zdCgpIGFuZCBjYWxsIGl0IHVuY29uZGl0aW9uYWxseSANCj4+IGkuZS4g
anVzdA0KPj4NCj4+ICAgICAgbW1jX2RlYnVnZnNfZXJyX3N0YXRzX2VuYWJsZShob3N0LT5tbWMp
Ow0KPj4NCj4+DQo+Pj4+Pj4+Pj4gbW1jX2RlYnVnZnNfZXJyX3N0YXRzX2VuYWJsZSgpIHdpbGwg
c2V0IGVycl9zdGF0ZSAsIHRoYXQgbWVhbnMgc29tZSBlcnJvcnMgb2NjdXJyZWQgaW4gZHJpdmVy
IGxldmVsLg0KPj4gSWYgd2UgbW92ZSB0aGlzIGNhbGwgdG8gc2RoY2lfc2V0dXBfaG9zdCgpLCB0
aGVuIGl0IHdpbGwgc2V0IGlmIG5vIGVycm9ycyBhbHNvIHJpZ2h0Pw0KPg0KPiBUaGVuIGl0IHNl
ZW1zIGxpa2UgeW91IHdhbnQgdG8gc2V0IGVycl9zdGF0ZSA9IHRydWUgaW4gDQo+IG1tY19kZWJ1
Z2ZzX2Vycl9zdGF0c19pbmMoKQ0KPg0KPj4+Pj4+IE5vIC4uSSBoYXZlIHVwZGF0ZWQgIGVycl9z
dGF0ZSA9IHRydWUgaW4gc2RoY2lfZHVtcHJlZ3MoKSBiZWNhdXNlIGlmIGFueSBlcnJvcnMgKHNl
cmlvdXMpIGluIGRyaXZlciwgIHdlIGFyZSBjYWxsaW5nIHNkaGNpX2R1bXByZWdzKCkuDQoNCkkg
c2VlLCBidXQgaXQgaXMgbm90IE9LIHRvIG1peCB1cCB0aGUgcmVnaXN0ZXIgZHVtcCB3aXRoIGVy
cm9yIGxvZ2dpbmcuDQpQZXJoYXBzIGFkZCBhbm90aGVyIGVycm9yIHR5cGUgYW5kIGluY3JlbWVu
dCB0aGF0IHdoZW4gbmVlZGVkLg0KDQo+Pj4+PiBva2F5IHN1cmUuDQo+DQo+Pg0KPj4NCj4+PiAg
ICAgU0RIQ0lfRFVNUCgiPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT1cbiIpOw0KPj4+ICB9DQo+Pj4gIEVYUE9SVF9TWU1CT0xfR1BMKHNkaGNpX2R1bXByZWdzKTsN
Cj4+PiBAQCAtMzE1OSw2ICszMTYxLDggQEAgc3RhdGljIHZvaWQgc2RoY2lfdGltZW91dF90aW1l
cihzdHJ1Y3QgdGltZXJfbGlzdCAqdCkNCj4+PiAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmhvc3Qt
PmxvY2ssIGZsYWdzKTsNCj4+Pg0KPj4+ICAgICBpZiAoaG9zdC0+Y21kICYmICFzZGhjaV9kYXRh
X2xpbmVfY21kKGhvc3QtPmNtZCkpIHsNCj4+PiArICAgICAgICAgICBpZiAoaG9zdC0+bW1jICYm
IGhvc3QtPm1tYy0+ZXJyX3N0YXRzX2VuYWJsZWQpDQo+Pj4gKyAgICAgICAgICAgICAgICAgICBt
bWNfZGVidWdmc19lcnJfc3RhdHNfaW5jKGhvc3QtPm1tYywgDQo+Pj4gKyBNTUNfRVJSX1JFUV9U
SU1FT1VUKTsNCj4+DQo+PiBQbGVhc2UgcmVtb3ZlIHRoZSAnaWYgKCknLCBpLmUuIGp1c3QgbWFr
ZSBpdCwgdW5jb25kaXRpb25hbGx5Og0KPj4NCj4+ICAgICAgICAgICAgICBtbWNfZGVidWdmc19l
cnJfc3RhdHNfaW5jKGhvc3QtPm1tYywgDQo+PiBNTUNfRVJSX1JFUV9USU1FT1VUKTsNCj4+DQo+
PiBTYW1lIGZvciBvdGhlciBjYWxscyB0byBtbWNfZGVidWdmc19lcnJfc3RhdHNfaW5jKCkNCj4+
DQo+Pj4+Pj4+Pj4+IFN1cmUuDQo+Pg0KPj4+ICAgICAgICAgICAgIHByX2VycigiJXM6IFRpbWVv
dXQgd2FpdGluZyBmb3IgaGFyZHdhcmUgY21kIGludGVycnVwdC5cbiIsDQo+Pj4gICAgICAgICAg
ICAgICAgICAgIG1tY19ob3N0bmFtZShob3N0LT5tbWMpKTsNCj4+PiAgICAgICAgICAgICBzZGhj
aV9kdW1wcmVncyhob3N0KTsNCj4+PiBAQCAtMzE4MSw2ICszMTg1LDggQEAgc3RhdGljIHZvaWQg
c2RoY2lfdGltZW91dF9kYXRhX3RpbWVyKHN0cnVjdCANCj4+PiB0aW1lcl9saXN0ICp0KQ0KPj4+
DQo+Pj4gICAgIGlmIChob3N0LT5kYXRhIHx8IGhvc3QtPmRhdGFfY21kIHx8DQo+Pj4gICAgICAg
ICAoaG9zdC0+Y21kICYmIHNkaGNpX2RhdGFfbGluZV9jbWQoaG9zdC0+Y21kKSkpIHsNCj4+PiAr
ICAgICAgICAgICBpZiAoaG9zdC0+bW1jICYmIGhvc3QtPm1tYy0+ZXJyX3N0YXRzX2VuYWJsZWQp
DQo+Pj4gKyAgICAgICAgICAgICAgICAgICBtbWNfZGVidWdmc19lcnJfc3RhdHNfaW5jKGhvc3Qt
Pm1tYywgDQo+Pj4gKyBNTUNfRVJSX1JFUV9USU1FT1VUKTsNCj4+PiAgICAgICAgICAgICBwcl9l
cnIoIiVzOiBUaW1lb3V0IHdhaXRpbmcgZm9yIGhhcmR3YXJlIGludGVycnVwdC5cbiIsDQo+Pj4g
ICAgICAgICAgICAgICAgICAgIG1tY19ob3N0bmFtZShob3N0LT5tbWMpKTsNCj4+PiAgICAgICAg
ICAgICBzZGhjaV9kdW1wcmVncyhob3N0KTsNCj4+PiBAQCAtMzI0MCwxMSArMzI0NiwxOCBAQCBz
dGF0aWMgdm9pZCBzZGhjaV9jbWRfaXJxKHN0cnVjdCBzZGhjaV9ob3N0IA0KPj4+ICpob3N0LCB1
MzIgaW50bWFzaywgdTMyICppbnRtYXNrX3ApDQo+Pj4NCj4+PiAgICAgaWYgKGludG1hc2sgJiAo
U0RIQ0lfSU5UX1RJTUVPVVQgfCBTREhDSV9JTlRfQ1JDIHwNCj4+PiAgICAgICAgICAgICAgICAg
ICAgU0RIQ0lfSU5UX0VORF9CSVQgfCBTREhDSV9JTlRfSU5ERVgpKSB7DQo+Pj4gLSAgICAgICAg
ICAgaWYgKGludG1hc2sgJiBTREhDSV9JTlRfVElNRU9VVCkNCj4+PiArICAgICAgICAgICBpZiAo
aW50bWFzayAmIFNESENJX0lOVF9USU1FT1VUKSB7DQo+Pj4gICAgICAgICAgICAgICAgICAgICBo
b3N0LT5jbWQtPmVycm9yID0gLUVUSU1FRE9VVDsNCj4+PiAtICAgICAgICAgICBlbHNlDQo+Pj4g
KyAgICAgICAgICAgICAgICAgICBpZiAoaG9zdC0+bW1jICYmIGhvc3QtPm1tYy0+ZXJyX3N0YXRz
X2VuYWJsZWQpDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIG1tY19kZWJ1Z2ZzX2Vy
cl9zdGF0c19pbmMoaG9zdC0+bW1jLCBNTUNfRVJSX0NNRF9USU1FT1VUKTsNCj4+PiArICAgICAg
ICAgICB9IGVsc2Ugew0KPj4+ICAgICAgICAgICAgICAgICAgICAgaG9zdC0+Y21kLT5lcnJvciA9
IC1FSUxTRVE7DQo+Pj4gLQ0KPj4+ICsgICAgICAgICAgICAgICAgICAgaWYgKGhvc3QtPmNtZC0+
b3Bjb2RlICE9IE1NQ19TRU5EX1RVTklOR19CTE9DSyB8fA0KPj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGhvc3QtPmNtZC0+b3Bjb2RlICE9IE1NQ19TRU5EX1RVTklOR19C
TE9DS19IUzIwMCkgew0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoaG9zdC0+
bW1jICYmIGhvc3QtPm1tYy0+ZXJyX3N0YXRzX2VuYWJsZWQpDQo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbW1jX2RlYnVnZnNfZXJyX3N0YXRzX2luYyhob3N0LT5tbWMs
IE1NQ19FUlJfQ01EX0NSQyk7DQo+Pj4gKyAgICAgICAgICAgICAgICAgICB9DQo+Pj4gKyAgICAg
ICAgICAgfQ0KPj4+ICAgICAgICAgICAgIC8qIFRyZWF0IGRhdGEgY29tbWFuZCBDUkMgZXJyb3Ig
dGhlIHNhbWUgYXMgZGF0YSBDUkMgZXJyb3IgKi8NCj4+PiAgICAgICAgICAgICBpZiAoaG9zdC0+
Y21kLT5kYXRhICYmDQo+Pj4gICAgICAgICAgICAgICAgIChpbnRtYXNrICYgKFNESENJX0lOVF9D
UkMgfCBTREhDSV9JTlRfVElNRU9VVCkpID09IA0KPj4+IEBAIC0zMjY1LDYNCj4+PiArMzI3OCw4
IEBAIHN0YXRpYyB2b2lkIHNkaGNpX2NtZF9pcnEoc3RydWN0IHNkaGNpX2hvc3QgKmhvc3QsIHUz
MiANCj4+PiAraW50bWFzaywgdTMyICppbnRtYXNrX3ApDQo+Pj4gICAgICAgICAgICAgaW50IGVy
ciA9IChhdXRvX2NtZF9zdGF0dXMgJiBTREhDSV9BVVRPX0NNRF9USU1FT1VUKSA/DQo+Pj4gICAg
ICAgICAgICAgICAgICAgICAgIC1FVElNRURPVVQgOg0KPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAtRUlMU0VROw0KPj4+ICsgICAgICAgICAgIGlmIChob3N0LT5tbWMgJiYgaG9zdC0+bW1jLT5l
cnJfc3RhdHNfZW5hYmxlZCkNCj4+PiArICAgICAgICAgICAgICAgICAgIG1tY19kZWJ1Z2ZzX2Vy
cl9zdGF0c19pbmMoaG9zdC0+bW1jLCANCj4+PiArIE1NQ19FUlJfQVVUT19DTUQpOw0KPj4+DQo+
Pj4gICAgICAgICAgICAgaWYgKHNkaGNpX2F1dG9fY21kMjMoaG9zdCwgbXJxKSkgew0KPj4+ICAg
ICAgICAgICAgICAgICAgICAgbXJxLT5zYmMtPmVycm9yID0gZXJyOyBAQCAtMzM0Miw2ICszMzU3
LDggQEAgDQo+Pj4gc3RhdGljIHZvaWQgc2RoY2lfZGF0YV9pcnEoc3RydWN0IHNkaGNpX2hvc3Qg
Kmhvc3QsIHUzMiBpbnRtYXNrKQ0KPj4+ICAgICAgICAgICAgICAgICAgICAgaWYgKGludG1hc2sg
JiBTREhDSV9JTlRfREFUQV9USU1FT1VUKSB7DQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGhvc3QtPmRhdGFfY21kID0gTlVMTDsNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZGF0YV9jbWQtPmVycm9yID0gLUVUSU1FRE9VVDsNCj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKGhvc3QtPm1tYyAmJiBob3N0LT5tbWMtPmVycl9zdGF0c19lbmFibGVkKQ0K
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPj4+ICsgbW1jX2RlYnVn
ZnNfZXJyX3N0YXRzX2luYyhob3N0LT5tbWMsIE1NQ19FUlJfQ01EX1RJTUVPVVQpOw0KPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBfX3NkaGNpX2ZpbmlzaF9tcnEoaG9zdCwgZGF0YV9j
bWQtPm1ycSk7DQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsNCj4+PiAg
ICAgICAgICAgICAgICAgICAgIH0NCj4+PiBAQCAtMzM3NSwxOCArMzM5MiwyOSBAQCBzdGF0aWMg
dm9pZCBzZGhjaV9kYXRhX2lycShzdHJ1Y3Qgc2RoY2lfaG9zdCAqaG9zdCwgdTMyIGludG1hc2sp
DQo+Pj4gICAgICAgICAgICAgcmV0dXJuOw0KPj4+ICAgICB9DQo+Pj4NCj4+PiAtICAgaWYgKGlu
dG1hc2sgJiBTREhDSV9JTlRfREFUQV9USU1FT1VUKQ0KPj4+ICsgICBpZiAoaW50bWFzayAmIFNE
SENJX0lOVF9EQVRBX1RJTUVPVVQpIHsNCj4+PiAgICAgICAgICAgICBob3N0LT5kYXRhLT5lcnJv
ciA9IC1FVElNRURPVVQ7DQo+Pj4gKyAgICAgICAgICAgaWYgKGhvc3QtPm1tYyAmJiBob3N0LT5t
bWMtPmVycl9zdGF0c19lbmFibGVkKQ0KPj4+ICsgICAgICAgICAgICAgICAgICAgbW1jX2RlYnVn
ZnNfZXJyX3N0YXRzX2luYyhob3N0LT5tbWMsIE1NQ19FUlJfREFUX1RJTUVPVVQpOw0KPj4+ICsg
ICB9DQo+Pj4gICAgIGVsc2UgaWYgKGludG1hc2sgJiBTREhDSV9JTlRfREFUQV9FTkRfQklUKQ0K
Pj4+ICAgICAgICAgICAgIGhvc3QtPmRhdGEtPmVycm9yID0gLUVJTFNFUTsNCj4+PiAgICAgZWxz
ZSBpZiAoKGludG1hc2sgJiBTREhDSV9JTlRfREFUQV9DUkMpICYmDQo+Pj4gICAgICAgICAgICAg
U0RIQ0lfR0VUX0NNRChzZGhjaV9yZWFkdyhob3N0LCBTREhDSV9DT01NQU5EKSkNCj4+PiAtICAg
ICAgICAgICAgICAgICAgICE9IE1NQ19CVVNfVEVTVF9SKQ0KPj4+ICsgICAgICAgICAgICAgICAg
ICAgIT0gTU1DX0JVU19URVNUX1IpIHsNCj4+PiAgICAgICAgICAgICBob3N0LT5kYXRhLT5lcnJv
ciA9IC1FSUxTRVE7DQo+Pj4gKyAgICAgICAgICAgaWYgKGhvc3QtPmNtZC0+b3Bjb2RlICE9IE1N
Q19TRU5EX1RVTklOR19CTE9DSyB8fA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBo
b3N0LT5jbWQtPm9wY29kZSAhPSBNTUNfU0VORF9UVU5JTkdfQkxPQ0tfSFMyMDApIHsNCj4+PiAr
ICAgICAgICAgICAgICAgICAgIGlmIChob3N0LT5tbWMgJiYgaG9zdC0+bW1jLT5lcnJfc3RhdHNf
ZW5hYmxlZCkNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgbW1jX2RlYnVnZnNfZXJy
X3N0YXRzX2luYyhob3N0LT5tbWMsIE1NQ19FUlJfREFUX0NSQyk7DQo+Pj4gKyAgICAgICAgICAg
fQ0KPj4+ICsgICB9DQo+Pj4gICAgIGVsc2UgaWYgKGludG1hc2sgJiBTREhDSV9JTlRfQURNQV9F
UlJPUikgew0KPj4+ICAgICAgICAgICAgIHByX2VycigiJXM6IEFETUEgZXJyb3I6IDB4JTA4eFxu
IiwgbW1jX2hvc3RuYW1lKGhvc3QtPm1tYyksDQo+Pj4gICAgICAgICAgICAgICAgICAgIGludG1h
c2spOw0KPj4+ICAgICAgICAgICAgIHNkaGNpX2FkbWFfc2hvd19lcnJvcihob3N0KTsNCj4+PiAr
ICAgICAgICAgICBpZiAoaG9zdC0+bW1jICYmIGhvc3QtPm1tYy0+ZXJyX3N0YXRzX2VuYWJsZWQp
DQo+Pj4gKyAgICAgICAgICAgICAgICAgICBtbWNfZGVidWdmc19lcnJfc3RhdHNfaW5jKGhvc3Qt
Pm1tYywgDQo+Pj4gKyBNTUNfRVJSX0FETUEpOw0KPj4+ICAgICAgICAgICAgIGhvc3QtPmRhdGEt
PmVycm9yID0gLUVJTzsNCj4+PiAgICAgICAgICAgICBpZiAoaG9zdC0+b3BzLT5hZG1hX3dvcmth
cm91bmQpDQo+Pj4gICAgICAgICAgICAgICAgICAgICBob3N0LT5vcHMtPmFkbWFfd29ya2Fyb3Vu
ZChob3N0LCBpbnRtYXNrKTsgQEAgDQo+Pj4gLTM5MDUsMjAgKzM5MzMsNDAgQEAgYm9vbCBzZGhj
aV9jcWVfaXJxKHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0LCB1MzIgaW50bWFzaywgaW50ICpjbWRf
ZXJyb3IsDQo+Pj4gICAgIGlmICghaG9zdC0+Y3FlX29uKQ0KPj4+ICAgICAgICAgICAgIHJldHVy
biBmYWxzZTsNCj4+Pg0KPj4+IC0gICBpZiAoaW50bWFzayAmIChTREhDSV9JTlRfSU5ERVggfCBT
REhDSV9JTlRfRU5EX0JJVCB8IFNESENJX0lOVF9DUkMpKQ0KPj4+ICsgICBpZiAoaW50bWFzayAm
IChTREhDSV9JTlRfSU5ERVggfCBTREhDSV9JTlRfRU5EX0JJVCB8DQo+Pj4gK1NESENJX0lOVF9D
UkMpKSB7DQo+Pj4gICAgICAgICAgICAgKmNtZF9lcnJvciA9IC1FSUxTRVE7DQo+Pj4gLSAgIGVs
c2UgaWYgKGludG1hc2sgJiBTREhDSV9JTlRfVElNRU9VVCkNCj4+PiArICAgICAgICAgICBpZiAo
aW50bWFzayAmIFNESENJX0lOVF9DUkMpIHsNCj4+PiArICAgICAgICAgICAgICAgICAgIGlmICho
b3N0LT5jbWQtPm9wY29kZSAhPSBNTUNfU0VORF9UVU5JTkdfQkxPQ0sgfHwNCj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBob3N0LT5jbWQtPm9wY29kZSAhPSBNTUNfU0VO
RF9UVU5JTkdfQkxPQ0tfSFMyMDApIHsNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
aWYgKGhvc3QtPm1tYyAmJiBob3N0LT5tbWMtPmVycl9zdGF0c19lbmFibGVkKQ0KPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1tY19kZWJ1Z2ZzX2Vycl9zdGF0c19pbmMo
aG9zdC0+bW1jLCBNTUNfRVJSX0NNRF9DUkMpOw0KPj4+ICsgICAgICAgICAgICAgICAgICAgfQ0K
Pj4+ICsgICAgICAgICAgIH0NCj4+PiArICAgfSBlbHNlIGlmIChpbnRtYXNrICYgU0RIQ0lfSU5U
X1RJTUVPVVQpIHsNCj4+PiAgICAgICAgICAgICAqY21kX2Vycm9yID0gLUVUSU1FRE9VVDsNCj4+
PiAtICAgZWxzZQ0KPj4+ICsgICAgICAgICAgIGlmIChob3N0LT5tbWMgJiYgaG9zdC0+bW1jLT5l
cnJfc3RhdHNfZW5hYmxlZCkNCj4+PiArICAgICAgICAgICAgICAgICAgIG1tY19kZWJ1Z2ZzX2Vy
cl9zdGF0c19pbmMoaG9zdC0+bW1jLCBNTUNfRVJSX0NNRF9USU1FT1VUKTsNCj4+PiArICAgfSBl
bHNlDQo+Pj4gICAgICAgICAgICAgKmNtZF9lcnJvciA9IDA7DQo+Pj4NCj4+PiAtICAgaWYgKGlu
dG1hc2sgJiAoU0RIQ0lfSU5UX0RBVEFfRU5EX0JJVCB8IFNESENJX0lOVF9EQVRBX0NSQykpDQo+
Pj4gKyAgIGlmIChpbnRtYXNrICYgKFNESENJX0lOVF9EQVRBX0VORF9CSVQgfCBTREhDSV9JTlRf
REFUQV9DUkMpKSB7DQo+Pj4gICAgICAgICAgICAgKmRhdGFfZXJyb3IgPSAtRUlMU0VROw0KPj4+
IC0gICBlbHNlIGlmIChpbnRtYXNrICYgU0RIQ0lfSU5UX0RBVEFfVElNRU9VVCkNCj4+PiArICAg
ICAgICAgICBpZiAoaW50bWFzayAmIFNESENJX0lOVF9EQVRBX0NSQykgew0KPj4+ICsgICAgICAg
ICAgICAgICAgICAgaWYgKGhvc3QtPmNtZC0+b3Bjb2RlICE9IE1NQ19TRU5EX1RVTklOR19CTE9D
SyB8fA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhvc3QtPmNtZC0+
b3Bjb2RlICE9IE1NQ19TRU5EX1RVTklOR19CTE9DS19IUzIwMCkgew0KPj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpZiAoaG9zdC0+bW1jICYmIGhvc3QtPm1tYy0+ZXJyX3N0YXRzX2Vu
YWJsZWQpDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbW1jX2RlYnVn
ZnNfZXJyX3N0YXRzX2luYyhob3N0LT5tbWMsIE1NQ19FUlJfREFUX0NSQyk7DQo+Pj4gKyAgICAg
ICAgICAgICAgICAgICB9DQo+Pj4gKyAgICAgICAgICAgfQ0KPj4+ICsgICB9IGVsc2UgaWYgKGlu
dG1hc2sgJiBTREhDSV9JTlRfREFUQV9USU1FT1VUKSB7DQo+Pj4gICAgICAgICAgICAgKmRhdGFf
ZXJyb3IgPSAtRVRJTUVET1VUOw0KPj4+IC0gICBlbHNlIGlmIChpbnRtYXNrICYgU0RIQ0lfSU5U
X0FETUFfRVJST1IpDQo+Pj4gKyAgICAgICAgICAgaWYgKGhvc3QtPm1tYyAmJiBob3N0LT5tbWMt
PmVycl9zdGF0c19lbmFibGVkKQ0KPj4+ICsgICAgICAgICAgICAgICAgICAgbW1jX2RlYnVnZnNf
ZXJyX3N0YXRzX2luYyhob3N0LT5tbWMsIE1NQ19FUlJfREFUX1RJTUVPVVQpOw0KPj4+ICsgICB9
IGVsc2UgaWYgKGludG1hc2sgJiBTREhDSV9JTlRfQURNQV9FUlJPUikgew0KPj4+ICAgICAgICAg
ICAgICpkYXRhX2Vycm9yID0gLUVJTzsNCj4+PiAtICAgZWxzZQ0KPj4+ICsgICAgICAgICAgIGlm
IChob3N0LT5tbWMgJiYgaG9zdC0+bW1jLT5lcnJfc3RhdHNfZW5hYmxlZCkNCj4+PiArICAgICAg
ICAgICAgICAgICAgIG1tY19kZWJ1Z2ZzX2Vycl9zdGF0c19pbmMoaG9zdC0+bW1jLCBNTUNfRVJS
X0FETUEpOw0KPj4+ICsgICB9IGVsc2UNCj4+PiAgICAgICAgICAgICAqZGF0YV9lcnJvciA9IDA7
DQo+Pj4NCj4+PiAgICAgLyogQ2xlYXIgc2VsZWN0ZWQgaW50ZXJydXB0cy4gKi8gZGlmZiAtLWdp
dCANCj4+PiBhL2luY2x1ZGUvbGludXgvbW1jL2hvc3QuaCBiL2luY2x1ZGUvbGludXgvbW1jL2hv
c3QuaA0KPj4NCj4+IENoYW5nZXMgdG8gaG9zdC5oIGFyZSBjb3JlIGNoYW5nZXMgYW5kIGJlbG9u
ZyBpbiBwYXRjaCAzLCB3aGljaCBzaG91bGQgYmUgdGhlIGZpcnN0IHBhdGNoLg0KPj4NCj4+Pj4+
Pj4gU3VyZS4NCj4+DQo+Pj4gaW5kZXggN2FmYjU3Yy4uODgzYjUwYiAxMDA2NDQNCj4+PiAtLS0g
YS9pbmNsdWRlL2xpbnV4L21tYy9ob3N0LmgNCj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L21tYy9o
b3N0LmgNCj4+PiBAQCAtOTMsNiArOTMsMjMgQEAgc3RydWN0IG1tY19jbGtfcGhhc2VfbWFwIHsN
Cj4+Pg0KPj4+ICBzdHJ1Y3QgbW1jX2hvc3Q7DQo+Pj4NCj4+PiArZW51bSBtbWNfZXJyX3N0YXQg
ew0KPj4+ICsgICBNTUNfRVJSX0NNRF9USU1FT1VULA0KPj4+ICsgICBNTUNfRVJSX0NNRF9DUkMs
DQo+Pj4gKyAgIE1NQ19FUlJfREFUX1RJTUVPVVQsDQo+Pj4gKyAgIE1NQ19FUlJfREFUX0NSQywN
Cj4+PiArICAgTU1DX0VSUl9BVVRPX0NNRCwNCj4+PiArICAgTU1DX0VSUl9BRE1BLA0KPj4+ICsg
ICBNTUNfRVJSX1RVTklORywNCj4+PiArICAgTU1DX0VSUl9DTURRX1JFRCwNCj4+PiArICAgTU1D
X0VSUl9DTURRX0dDRSwNCj4+PiArICAgTU1DX0VSUl9DTURRX0lDQ0UsDQo+Pj4gKyAgIE1NQ19F
UlJfUkVRX1RJTUVPVVQsDQo+Pj4gKyAgIE1NQ19FUlJfQ01EUV9SRVFfVElNRU9VVCwNCj4+PiAr
ICAgTU1DX0VSUl9JQ0VfQ0ZHLA0KPj4+ICsgICBNTUNfRVJSX01BWCwNCj4+PiArfTsNCj4+PiAr
DQo+Pj4gIHN0cnVjdCBtbWNfaG9zdF9vcHMgew0KPj4+ICAgICAvKg0KPj4+ICAgICAgKiBJdCBp
cyBvcHRpb25hbCBmb3IgdGhlIGhvc3QgdG8gaW1wbGVtZW50IHByZV9yZXEgYW5kIHBvc3RfcmVx
IA0KPj4+IGluIEBAIC01MDAsNiArNTE3LDkgQEAgc3RydWN0IG1tY19ob3N0IHsNCj4+Pg0KPj4+
ICAgICAvKiBIb3N0IFNvZnR3YXJlIFF1ZXVlIHN1cHBvcnQgKi8NCj4+PiAgICAgYm9vbCAgICAg
ICAgICAgICAgICAgICAgaHNxX2VuYWJsZWQ7DQo+Pj4gKyAgIHUzMiAgICAgICAgICAgICAgICAg
ICAgIGVycl9zdGF0c1tNTUNfRVJSX01BWF07DQo+Pj4gKyAgIGJvb2wgICAgICAgICAgICAgICAg
ICAgIGVycl9zdGF0c19lbmFibGVkOw0KPj4+ICsgICBib29sICAgICAgICAgICAgICAgICAgICBl
cnJfc3RhdGU7DQo+Pg0KPj4gUGxlYXNlIGRyb3AgZXJyX3N0YXRlIGZvciBub3cNCj4+DQo+Pj4+
Pj4+Pj4gZmlyc3Qgd2UgY2FuIGNoZWNrIHRoaXMgdmFyaWFibGUgcmlnaHQsICBpZiBpdCBpcyBz
ZXQgdGhlbiB3ZSBjYW4gZ28gYW5kIGNoZWNrIGVycl9zdGF0c1tdIHRvIGtub3cgbW9yZSBvbiB0
eXBlIG9mIGVycm9yIChkYXRhIC9jbWQgdGltZW91dCBvciBDUkMgZXJyb3JzIGV0Yy4pLg0KPj4g
UGxlYXNlIGxldCBtZSBrbm93IHlvdXIgb3BpbmlvbiBvbiB0aGlzLg0KPg0KPiBBcyBJIHdyb3Rl
IGFib3ZlLCB5b3UgY291bGQgc2V0IGVycl9zdGF0ZSBpbiBtbWNfZGVidWdmc19lcnJfc3RhdHNf
aW5jKCkuDQo+IEJ1dCBtYXliZSBtYWtlIHRoZSBlcnJfc3RhdGUgYWRkaXRpb24gYSBzZXBhcmF0
ZSBwYXRjaCBzbyBpdCBpcyBlYXN5IHRvIHNlZSBob3cgaXQgd29ya3MuDQo+DQo+Pj4+Pj4gU3Vy
ZSB3aWxsIHBvc3Qgc2VwYXJhdGUgcGF0Y2ggZm9yIGVycl9zdGF0ZSBzZXR0aW5ncy4NCj4NCj4+
DQo+Pj4NCj4+PiAgICAgdW5zaWduZWQgbG9uZyAgICAgICAgICAgcHJpdmF0ZVtdIF9fX19jYWNo
ZWxpbmVfYWxpZ25lZDsNCj4+PiAgfTsNCj4+PiBAQCAtNjM1LDYgKzY1NSwxNyBAQCBzdGF0aWMg
aW5saW5lIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIG1tY19nZXRfZG1hX2RpcihzdHJ1Y3QgbW1j
X2RhdGEgKmRhdGEpDQo+Pj4gICAgIHJldHVybiBkYXRhLT5mbGFncyAmIE1NQ19EQVRBX1dSSVRF
ID8gRE1BX1RPX0RFVklDRSA6DQo+Pj4gRE1BX0ZST01fREVWSUNFOyAgfQ0KPj4+DQo+Pj4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBtbWNfZGVidWdmc19lcnJfc3RhdHNfZW5hYmxlKHN0cnVjdCBtbWNf
aG9zdA0KPj4+ICsqbW1jKQ0KPj4NCj4+IFBsZWFzZSB1c2UgJ2hvc3QnIGFzIHRoZSBtbWNfaG9z
dCBwYXJhbWV0ZXIgaW4gdGhpcyBmaWxlLg0KPj4NCj4+PiArew0KPj4+ICsgICBtbWMtPmVycl9z
dGF0ZSA9IHRydWU7DQo+Pg0KPj4gTGV0J3MgbWFrZSB0aGlzOg0KPj4NCj4+ICAgICAgaG9zdC0+
ZXJyX3N0YXRzX2VuYWJsZWQgPSB0cnVlOw0KPj4NCj4+Pj4+Pj4+IFN1cmUuDQo+Pg0KPj4+ICt9
DQo+Pj4gKw0KPj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgbW1jX2RlYnVnZnNfZXJyX3N0YXRzX2lu
YyhzdHJ1Y3QgbW1jX2hvc3QgKm1tYywNCj4+PiArICAgICAgICAgICBlbnVtIG1tY19lcnJfc3Rh
dCBzdGF0KSB7DQo+Pj4gKw0KPj4NCj4+IFBsZWFzZSByZW1vdmUgYmxhbmsgbGluZSBoZXJlDQo+
Pg0KPj4+Pj4+Pj4gc3VyZS4NCj4+DQo+Pj4gKyAgIG1tYy0+ZXJyX3N0YXRzW3N0YXRdICs9IDE7
DQo+Pj4gK30NCj4+PiArDQo+Pj4gIGludCBtbWNfc2VuZF90dW5pbmcoc3RydWN0IG1tY19ob3N0
ICpob3N0LCB1MzIgb3Bjb2RlLCBpbnQgDQo+Pj4gKmNtZF9lcnJvcik7ICBpbnQgbW1jX3NlbmRf
YWJvcnRfdHVuaW5nKHN0cnVjdCBtbWNfaG9zdCAqaG9zdCwgdTMyIA0KPj4+IG9wY29kZSk7ICBp
bnQgbW1jX2dldF9leHRfY3NkKHN0cnVjdCBtbWNfY2FyZCAqY2FyZCwgdTggDQo+Pj4gKipuZXdf
ZXh0X2NzZCk7DQo+Pj4NCj4+DQo+DQoNCg==
