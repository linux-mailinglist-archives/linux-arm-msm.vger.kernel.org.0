Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F29C725CCC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 13:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239338AbjFGLMM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 07:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240248AbjFGLMI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 07:12:08 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2061.outbound.protection.outlook.com [40.107.117.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58331735
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 04:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQcz4XdQ7PUyG0l2kovFpySbXXS7O3q3czKPtuQQp/8yeI7pDYDN/YrCgJ4Gel6sSY+qLD4i7MKF41i5peeiN6E1UwrauhotZsWLdATZGYqLpwNVT0STHqnfSzBoJPozVY9cvsAH7/kGqhLuFr6dMzU/Q9VX/7fcW9Oe+cpXAFxNUPp7+OKcke8G6XzEi6JNqK0VdEoWQmQ8OoZfWCZuLGYAqqA5LwrQbja0PNtJOTnRUIFUl87RtwTk7v6dsC3ihIvZRrg2VzILqOY/bBfy8l/7eKM9Je8Om9u33K6cZhOR0PIz6mQBBi15WeeW8/1tat0x3J05S1eYBh0G+Dguow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwKX6JOTTGVRs0d88Tcq77Dh4SZDXtpzCJkIld/GRCk=;
 b=bwy29cJr4826JsUX+waZzrpSTf7wRkrzhiHMc/cCxvHH28ZTy9gQ1GEErA82NYTAPIhmmc1wLFly8+sZYA+frc3v8EQO2TDM7rZGOLpC6OqE9+T82hLhmCWyxUYOS8QhC3Vl95hTlyo/Zs30MuOZA2bU4+DzS/lno2a+T2nFlOUGLC2jBvNdHxPZyRKhf8xuT8nGtbXhqpr0kxdAeZXkR3kYnWOqF/J6Algw2c0p3jNaWLFSb4cFyDh+CWTMqe1dFHSooOG0kixhhpyytcY/12Ig5tEhaKdFhE326kuS1berqktHsz5GtjlPGMeyC391LgU1X1V9hZTKRk4an1pj3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwKX6JOTTGVRs0d88Tcq77Dh4SZDXtpzCJkIld/GRCk=;
 b=Y9K20QPj6CscA3PEYpC8YmRO8JPR/Qsr7ijr30DqMrK0qYKrarlWHLBzlIMmUkcjA4XnV2EoiLeEjRvdkC93ZFhP7ivyKWK4J2HXEWolq7ds9nAyWPEj+6iu2AVL8fOCRdDzx2gmjSSLYpuxPfsNQJ90pA6hGb7efMxOopd5DB8=
Received: from SEZPR06MB6087.apcprd06.prod.outlook.com (2603:1096:101:e7::6)
 by TYZPR06MB3935.apcprd06.prod.outlook.com (2603:1096:400:6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Wed, 7 Jun
 2023 11:12:00 +0000
Received: from SEZPR06MB6087.apcprd06.prod.outlook.com
 ([fe80::5adc:bf44:434f:7204]) by SEZPR06MB6087.apcprd06.prod.outlook.com
 ([fe80::5adc:bf44:434f:7204%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 11:11:59 +0000
From:   =?utf-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke.xin@quectel.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke_xinanwen@163.com>
CC:     "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        "slark_xiao@163.com" <slark_xiao@163.com>,
        "fabio.porcedda@gmail.com" <fabio.porcedda@gmail.com>,
        "koen.vandeputte@citymesh.com" <koen.vandeputte@citymesh.com>,
        "quic_jhugo@quicinc.com" <quic_jhugo@quicinc.com>,
        "johan+linaro@kernel.org" <johan+linaro@kernel.org>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "mhi@lists.linux.dev" <mhi@lists.linux.dev>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        =?utf-8?B?SmVycnkgTWVuZyjokpnmnbAp?= <jerry.meng@quectel.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjZdIGJ1czogbWhpOiBob3N0OiBwY2lfZ2VuZXJp?=
 =?utf-8?Q?c:_Add_support_for_Quectel_RM520N-GL_modem?=
Thread-Topic: [PATCH v6] bus: mhi: host: pci_generic: Add support for Quectel
 RM520N-GL modem
Thread-Index: AQHZmGNNvTDcGxFYDU6VgP9agPpHLq99pCuAgAGLvMA=
Date:   Wed, 7 Jun 2023 11:11:58 +0000
Message-ID: <SEZPR06MB60878112EE8EEEC73B1400848453A@SEZPR06MB6087.apcprd06.prod.outlook.com>
References: <5fcba17f46eb5e86a43e294ad9b5b67f6-6-23kernel.org@g.corp-email.com>
 <20230606113145.GB51623@thinkpad>
In-Reply-To: <20230606113145.GB51623@thinkpad>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quectel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB6087:EE_|TYZPR06MB3935:EE_
x-ms-office365-filtering-correlation-id: 27e93efa-e2e3-428b-1c82-08db6748031a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vnLhCVH4UwJFsEzYXmOw/vMp8eeWvL9LGXQCfxJMpr/2u+NLzUNtW6R0E3cARHW+YD9N3Qzmj8wGN1KfnQP4SGv15Fji1ZbsWQNnq9yw13wmB9JgN4Dlbd210UtChaXsHz3MYgxk3VU39DGG7QGD4rhWmggQKz2ah9csmOCpG3lWajusvOwlRnOZLK/QlwDMf0uIl7QyRyCv4jb3r3mFL3qQ8luK6Xa2HQy2355g/ltD0pPr90YvjgpAbvGhsvu+3/IDEMjaIAYj8H9hE4D893wUAX8GeCY4RBrm2E1oCsO45aTGPPqi1bfKAKr00B91pGP5grz3Znx0tl4K5M2932KhDCDyauvqJQGce+R2Hsc/f6FCidIOdqHpMGQP68daLvRsckfUV4AeJS0Ua6o/QG5E+6lDfVv5qGguAL5yYep4Y6oTaStb2Vpo7DoS8eLtbvuqFhlfJnxK+bYnrI984z4nHb8DNEQmBTR5niuZrt0zq9B+u5QHjpKDMy3s2CqlLWPZn6dMREnRWCJHckjkMCPHmeP+pUv+zDZJA1aEVzm2jBl0e+nsjPCLwoAQUnqWu5MdC97b47ZNwvTxOVXiaI+ETz598NK6QNLVr1IETtXnjpwcN9RO33zIq1+BiTSv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB6087.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199021)(85182001)(478600001)(5660300002)(224303003)(52536014)(38070700005)(110136005)(54906003)(8936002)(71200400001)(316002)(4326008)(66476007)(122000001)(64756008)(76116006)(66446008)(66556008)(66946007)(41300700001)(38100700002)(2906002)(7416002)(55016003)(33656002)(26005)(6506007)(9686003)(107886003)(86362001)(186003)(15974865002)(83380400001)(966005)(7696005)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWtXalBMRmlrZWpSQzZGNTZqQVI3QVlINVdSeGZwd3NaUFAvZjhjNytFSENJ?=
 =?utf-8?B?My9IN2tMc1VUb3lmdGFORFQzWkVKTUdQbStYbHQ0M0V0OXc4eHFDRnlOZ1Jp?=
 =?utf-8?B?NElZNHdKWHRKRFJtUTlvcm1sR2FoWlFtaEU1Nmc5SHFPTThlWkVMeE9JeEVI?=
 =?utf-8?B?bWxyYzVuT2lUSmFJL2FyY3Nocnl2NDJUMlhOM2hqS2dOM1hxa0lma1NGbVF3?=
 =?utf-8?B?ckdxL1VUcDhIOGcvTTVpNkJoenZSL2JPS29iMEpIbzNSRlVSOUlwaDkyNXZK?=
 =?utf-8?B?NExzNit5QjhLV0FibHkwUG9Jb2QwTzF0SWp2Y2E5MDZYa1JNT1dGemlTcHFo?=
 =?utf-8?B?allXZkxEUjBtWVkwN1ZQMll3anFFdzQ5N0hXelo5TDdzYkdVbDRKYU03NXl4?=
 =?utf-8?B?SnA2Zk5QRHREc0dJVFE5cS9YMmdxZjA4R2RCUURtVWFrTWNsd2FhbDA0UnRp?=
 =?utf-8?B?R0krNDVRTFNrUU9CYWgrYTVCRVFWT0xRQnZ1YW1sWVVVQ2dySE03b1AyNTlQ?=
 =?utf-8?B?aThXajJaOURlaFpCbHFaaU5XaWZYUnJnV3MzNk5wdm55Vmw2dHZDUStqTEZa?=
 =?utf-8?B?T3d5eEZic0Y3VHBMUmhmK053QURiT2huNTdiK3VFdmxyL1RMUmpYNUR1TmRs?=
 =?utf-8?B?Mm9aNVZ3VmFObmVQSm5SNWxScmhXQTk1L2VnK2k4OTAyVkRWRlBhMkZLWGgw?=
 =?utf-8?B?clVhZGZtWjdXWXdjdXk3VTV6bnVKVHBKci8rWnM4cU1iUTNzU2dnWjhyWkxJ?=
 =?utf-8?B?L1hyZi9yNmd0dHhrSHRSZkh3KzVoK2s1eFZVZGYweEhrem5FeE5HSWNQU0ty?=
 =?utf-8?B?SityNExqaXQ4ZU5QbmplRCtoZnRYSlFsV0xlVkZ1amc2THZGRTlaZXNkNS9J?=
 =?utf-8?B?Y1Z1NldKTlpQcS90M2Rld2lZRFM2bnVadzYyRDRDZ2QzRFRjaUxsakJFOXVq?=
 =?utf-8?B?SjRnTlM2eEcrZXp3OXVmYlk5YWNJT0Q2aUxzeEw5Q3hUNlpDcll6VU5FRStS?=
 =?utf-8?B?YTJFQ3VTSHB2NnZ2S0dwbGxwSnQ2dUZZTmhXZHdRZVp6OUJyZGRhNEdBMjNv?=
 =?utf-8?B?MTRDblVjVjZjbCtLU0g3UXUrV0FyVlhxYXcxeGpiQzFFMkljaGZHV3ROcy9y?=
 =?utf-8?B?dHJFS0dCaXZKc091TFRPbmlvQ1ZvNHU3ZUN4UGxEWG9hajBwYWtDaXQzcCtF?=
 =?utf-8?B?TXp5K0Z6M0VzeUhmbVVCa3pxNC9aSU5saDhaamI3WWN5WWpDcncvOERyRjBK?=
 =?utf-8?B?MHdNMVMrRzgvcXhvN0FqbzFoV0F1eVhEZTdzWFFjekttUHNWVGhyOW9hYmxl?=
 =?utf-8?B?Ujc2bHN5Z0pzdkI4VEZVcFV2TW1PaXlBQnBQVTNXM3dyUUFUNGxaL0pKc0NW?=
 =?utf-8?B?OHRNUWJzd3pGOTBmVzVKUndDL0xkZVFXVVBRZTYwYnZZOXV6L21SS3ZBVWtl?=
 =?utf-8?B?d212S2RtWWpPRU12bUtjRGp0ck9oSlRhSWxDejNTNW9uTHdwLzVEWkRSbjMv?=
 =?utf-8?B?anBaVmtOV3FQa2UyS0p5RFZVNDJPRmtVUkZpVitMSG5DMEtFSlp6Z1kxaXRq?=
 =?utf-8?B?bUdSdWZRNVRtcmtlUE1ZVkprZmg0cTdtMjZYMFJoVE1RNi8xYk1YNHNKRHBC?=
 =?utf-8?B?c0FyRVNsYmxNbkJhNlU2TVlVZVR4WVpWVGphMytEcFdqTmdja0xIL1JyKzc5?=
 =?utf-8?B?UnowVGMzVnBkWkpGSEdwYk5icU5VRk5rVFhCbHpwSjdqcnIraXFUeGpKUFRH?=
 =?utf-8?B?ZjRJR0dvem4wVEtJaGFIK1NDMzVZTkU2QUJBQ2E0NERtUmZpKzZkeXdCOFFD?=
 =?utf-8?B?cE5VbmdWWVZ2ODg0dUoybWFWZjZ1R0pDMkdOaFNtUnRkSEZYUWg4MDh4UUly?=
 =?utf-8?B?YjNMazcrUzhibTFta3ZxRnpHVUdWUjh5MGF5NWxHbWdsbkxISnV2TENoTHNn?=
 =?utf-8?B?bURvemZ6cFJObldSazBpVTJDdWloR3hQUXNOKzhETVI2R2hrZHVDd1B4UFVn?=
 =?utf-8?B?eGZXNERESkxrcStMRUE2ckJYWUlCSHYvM2FucFpJVVNvT1FOeEdXVm1sV0VP?=
 =?utf-8?B?M3N1UDlSWXZOT1dBbEFTSDlKUEVNNFMzeWFOWmF5NUtkM09GWS9LMXhnT2NQ?=
 =?utf-8?Q?omWBTtVkITEip9veLYgT9PLXG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB6087.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e93efa-e2e3-428b-1c82-08db6748031a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 11:11:58.9864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bi9/pCNt+FoK+hG0eUjb7xbGd62UOBAUms/7cZ3uFmJM7ek2iWKjmW8smaUPcXUj5extPXpV532fbCc20LXxzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3935
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgTWFuaQ0KDQoNCkRlZXBseSBzb3JyeSwgSSB3aWxsIGNhcmVmdWxseSBjaGVjayBhbmQgcmVz
dWJtaXQgYWNjb3JkaW5nIHRvIFtwYXRjaCBzdWJtaXNzaW9vbiBndWlkZWxpbmVzXS4NCg0KVGhh
bmsgeW91IGZvciB5b3VyIHJldmlldy4NCg0KDQrovpvlronmlofCoCBEdWtlIFhpbiB8IFNvZnR3
YXJlIERlcGFydG1lbnQgSVggRW5naW5lZXIgfCBRdWVjdGVsIFdpcmVsZXNzIFNvbHV0aW9ucyBD
by4sIEx0ZC4gDQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIA0KTW9iaWxlOiArODYtMTUzNzU0NTYx
ODMgfCBFbWFpbCA6IER1a2UueGluQHF1ZWN0ZWwuY29twqAgfCBUZWw6ICs4Ni0wNTUxLTY1ODY5
Mzg2LTg2MzINCldlYnNpdGU6IHd3dy5xdWVjdGVsLmNvbcKgIHwgUVE6IDYwMjY1OTA3MiB8IFdl
Y2hhdDogMTUzNzU0NTYxODMNCg0KQnVpbGRpbmfCoDEtQyzCoENoaW5hwqBTcGVlY2jCoFZhbGxl
ecKgQXJlYcKgQSzCoDMzMzXCoFhpeW91wqBSb2FkLMKgSGlnaC10ZWNowqBab25lLMKgSGVmZWks
wqBBbmh1acKgMjMwMDg4LMKgQ2hpbmHCoMKgwqAgDQrlronlvr3nnIHlkIjogqXluILpq5jmlrDl
jLrkuaDlj4vot68zMzM15Y+35Lit5Zu977yI5ZCI6IKl77yJ5Zu96ZmF5pm66IO96K+t6Z+z5Lqn
5Lia5ZutQeWMujHlj7fkuK3or5XmpbwgMjMwMDg4DQpIUTogQnVpbGRpbmcgNSwgU2hhbmdoYWkg
QnVzaW5lc3MgUGFyayBQaGFzZSBJSUkgKEFyZWEgQiksIE5vLjEwMTYgVGlhbmxpbiBSb2FkLCBN
aW5oYW5nIERpc3RyaWN0LCBTaGFuZ2hhaSAyMDAyMzMsIENoaW5hDQrmgLvpg6jvvJrkuIrmtbfl
uILpl7XooYzljLrnlLDmnpfot68xMDE25Y+356eR5oqA57u/5rSyM+acn++8iELljLrvvIk15Y+3
5qW8wqAgMjAwMjMzDQoNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogTWFuaXZh
bm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+IA0K5Y+R6YCB5pe26Ze0OiAyMDIz5bm0
NuaciDbml6UgMTk6MzINCuaUtuS7tuS6ujogRHVrZSBYaW4o6L6b5a6J5paHKSA8ZHVrZV94aW5h
bndlbkAxNjMuY29tPg0K5oqE6YCBOiBsb2ljLnBvdWxhaW5AbGluYXJvLm9yZzsgc2xhcmtfeGlh
b0AxNjMuY29tOyBmYWJpby5wb3JjZWRkYUBnbWFpbC5jb207IGtvZW4udmFuZGVwdXR0ZUBjaXR5
bWVzaC5jb207IHF1aWNfamh1Z29AcXVpY2luYy5jb207IGpvaGFuK2xpbmFyb0BrZXJuZWwub3Jn
OyBiaGVsZ2Fhc0Bnb29nbGUuY29tOyBtaGlAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0tbXNt
QHZnZXIua2VybmVsLm9yZzsgSmVycnkgTWVuZyjokpnmnbApIDxqZXJyeS5tZW5nQHF1ZWN0ZWwu
Y29tPjsgRHVrZSBYaW4o6L6b5a6J5paHKSA8ZHVrZS54aW5AcXVlY3RlbC5jb20+DQrkuLvpopg6
IFJlOiBbUEFUQ0ggdjZdIGJ1czogbWhpOiBob3N0OiBwY2lfZ2VuZXJpYzogQWRkIHN1cHBvcnQg
Zm9yIFF1ZWN0ZWwgUk01MjBOLUdMIG1vZGVtDQoNCk9uIFR1ZSwgSnVuIDA2LCAyMDIzIGF0IDAz
OjM5OjMyQU0gLTA3MDAsIER1a2UgWGluKOi+m+WuieaWhykgd3JvdGU6DQo+IEFkZCBNSEkgaW50
ZXJmYWNlIGRlZmluaXRpb24gZm9yIFJNNTIwIHByb2R1Y3QgYmFzZWQgb24gUXVhbGNvbW0gU0RY
NlggDQo+IGNoaXANCj4gDQo+IFNpZ25lZC1vZmYtYnk6IER1a2UgWGluKOi+m+WuieaWhykgPGR1
a2VfeGluYW53ZW5AMTYzLmNvbT4NCj4gLS0tDQoNCldoYXQgaGFzIGNoYW5nZWQgc2luY2UgdjE/
IFdoZXJlIGlzIHRoZSBjaGFuZ2Vsb2c/IEkgY2xlYXJseSBtZW50aW9uZWQgdGhhdCB5b3UgbmVl
ZCB0byBhZGQgY2hhbmdlbG9nIGFuZCBhbHNvIGtlZXAgdGhlIHJldmlldyB0YWdzIGdpdmVuIGZv
ciBlYXJsaWVyIHJldmlzaW9ucy4NCg0KSSBjYW5ub3QgcmVwZWF0IHRoaXMgbWVzc2FnZSBmb3Ig
ZXZlcnkgaXRlcmF0aW9uLiBZb3UgYXJlIHdhc3RpbmcgZXZlcnlvbmUncyB0aW1lIGJ5IG5vdCBh
ZGhlcmluZyB0byBwYXRjaCBzdWJtaXNzaW9vbiBndWlkZWxpbmVzOg0KDQpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJl
ZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3MvNS5Qb3N0aW5nLnJzdA0KDQotIE1hbmkNCg0KPiAgZHJp
dmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyB8IDEzICsrKysrKysrKysrKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyANCj4gYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9w
Y2lfZ2VuZXJpYy5jDQo+IGluZGV4IGRiMGEwYjA2MmQ4ZS4uNjliZTk2OTY3MmYxIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jDQo+ICsrKyBiL2RyaXZl
cnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMNCj4gQEAgLTMzNCw2ICszMzQsMTYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtaGlfcGNpX2Rldl9pbmZvIG1oaV9xdWVjdGVsX2VtMXh4X2luZm8g
PSB7DQo+ICAJLnNpZGViYW5kX3dha2UgPSB0cnVlLA0KPiAgfTsNCj4gIA0KPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBtaGlfcGNpX2Rldl9pbmZvIG1oaV9xdWVjdGVsX3JtNXh4X2luZm8gPSB7DQo+
ICsJLm5hbWUgPSAicXVlY3RlbC1ybTV4eCIsDQo+ICsJLmVkbCA9ICJxY29tL3Byb2dfZmlyZWhv
c2Vfc2R4NnguZWxmIiwNCj4gKwkuY29uZmlnID0gJm1vZGVtX3F1ZWN0ZWxfZW0xeHhfY29uZmln
LA0KPiArCS5iYXJfbnVtID0gTUhJX1BDSV9ERUZBVUxUX0JBUl9OVU0sDQo+ICsJLmRtYV9kYXRh
X3dpZHRoID0gMzIsDQo+ICsJLm1ydV9kZWZhdWx0ID0gMzI3NjgsDQo+ICsJLnNpZGViYW5kX3dh
a2UgPSB0cnVlLA0KPiArfTsNCj4gKw0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfY2hhbm5l
bF9jb25maWcgbWhpX2ZveGNvbm5fc2R4NTVfY2hhbm5lbHNbXSA9IHsNCj4gIAlNSElfQ0hBTk5F
TF9DT05GSUdfVUwoMCwgIkxPT1BCQUNLIiwgMzIsIDApLA0KPiAgCU1ISV9DSEFOTkVMX0NPTkZJ
R19ETCgxLCAiTE9PUEJBQ0siLCAzMiwgMCksIEBAIC01NzMsNiArNTgzLDkgQEAgDQo+IHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBtaGlfcGNpX2lkX3RhYmxlW10gPSB7DQo+ICAJ
CS5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkgJm1oaV9xdWVjdGVsX2VtMXh4X2luZm8g
fSwNCj4gIAl7IFBDSV9ERVZJQ0UoUENJX1ZFTkRPUl9JRF9RVUVDVEVMLCAweDEwMDIpLCAvKiBF
TTE2MFItR0wgKHNkeDI0KSAqLw0KPiAgCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3Qp
ICZtaGlfcXVlY3RlbF9lbTF4eF9pbmZvIH0sDQo+ICsJLyogUk01MjBOLUdMIChzZHg2eCksIGVT
SU0gKi8NCj4gKwl7IFBDSV9ERVZJQ0UoUENJX1ZFTkRPUl9JRF9RVUVDVEVMLCAweDEwMDQpLA0K
PiArCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpICZtaGlfcXVlY3RlbF9ybTV4eF9p
bmZvIH0sDQo+ICAJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfUVVFQ1RFTCwgMHgyMDAxKSwg
LyogRU0xMjBSLUdMIGZvciBGQ0NMIChzZHgyNCkgKi8NCj4gIAkJLmRyaXZlcl9kYXRhID0gKGtl
cm5lbF91bG9uZ190KSAmbWhpX3F1ZWN0ZWxfZW0xeHhfaW5mbyB9LA0KPiAgCS8qIFQ5OVcxNzUg
KHNkeDU1KSwgQm90aCBmb3IgZVNJTSBhbmQgTm9uLWVTSU0gKi8NCj4gLS0NCj4gMi4yNS4xDQo+
IA0KDQotLSANCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXg
rq7gr40NCg==
