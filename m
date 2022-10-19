Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4F81604E3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 19:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbiJSRJ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 13:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbiJSRJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 13:09:25 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C180F19D
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 10:09:19 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JH4CtC007409;
        Wed, 19 Oct 2022 17:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=705GBc8qCdtzN5SK1Pc4Tkfu74BghHrVRntSXh7CmeA=;
 b=YpsGKspY7go+7arGt/PStYm7GNhMhLmuE4+Rlj4BY+uSBXil6yuv7bVkgoeKlv3dlGMd
 v1LumCJMP9uYPiD8XAHc4xCkfFBscHHexNINF9pWcmSfLOvkVFmZ1shBdrUIQjfIp716
 RFdLWw0fvKieD/Ip5Tb/MKQWSVtIfhfRfuE5f83/+RSBYRr1eIFXghl+cEWFd1hl223C
 tL8Pcj5HeSGIqgYwfklaSqq9cQwk7hlkrhuLNy9pLYbRe6HvPzRNSAGjXLtPojm50Zsp
 RPCMIbhZZoisjm0g3B3XiP8QWrH08vQhkz8Z56AVk2ikymwnmgAZeSahJF8Io9pdNssd BQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kak1c0fxn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Oct 2022 17:09:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bG29M6n4j7R032tSKQZrwCs6bBkmYM42hQweP+undL7fcN8+xodRDExZF3fkTvRRf0xGWARAXviPSs9w6ZqQOfD06AAYdhVKumLKuXqpG84DQHpjNJ/qmcH7juS/2HMukXXXBJIJ4AUQBv2TO5y/+JNhcV1QZWg00U3juyb0Xzz2xeu1qaBeaqrgLnN8+GHTEM5FNHcQkiQblwc1Pgy97VZys+Xg5TaYxqdkmkgitu9dBQPl9tpW/mcPel+L7TPGDuQLwPN8XqJNxrjVhOJdn53GPR44rN5Fv+v/jl1pgOvre282IFx4vby27ve7rikbIhhybmtotMhl7Myb84iTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=705GBc8qCdtzN5SK1Pc4Tkfu74BghHrVRntSXh7CmeA=;
 b=l3g0OdrFY6PUHAVjaXqyY6Sc0ZtwA+HC7FKXE2395RKTdJ1aJj7MTIG09dn3PA3a3e1E+KMShEP6ZxLcT8XOiPZ9SHROsuspafhRNuKopyKY6P94rvzI5scldS/SmFE7IY4pzAqdPXfpnoro/XgKAVO81+POTc02C84Ij+5gMRwtugwQCifXtXmrjdef6JI/FNbGryXBXcEyshxKDYAIsSdyWBLSjxrqxEi8U4bRK6o9xRnZAcfA5M82BMGlSgS+paLnlP7k132XM70lZPhh9yZTNOIlqwswlTqPIqkSLY9kgVVmxrls4ey3EPRYdDhhK6h346TPaw6X0ECqnGyCKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DM8PR02MB8169.namprd02.prod.outlook.com (2603:10b6:8:1a::14) by
 CH0PR02MB8243.namprd02.prod.outlook.com (2603:10b6:610:f6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.29; Wed, 19 Oct 2022 17:09:11 +0000
Received: from DM8PR02MB8169.namprd02.prod.outlook.com
 ([fe80::967e:9edc:811e:732c]) by DM8PR02MB8169.namprd02.prod.outlook.com
 ([fe80::967e:9edc:811e:732c%9]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 17:09:11 +0000
From:   Vikash Garodia <vgarodia@qti.qualcomm.com>
To:     Rob Clark <robdclark@gmail.com>,
        Nathan Hebert <nhebert@chromium.org>
CC:     "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: RE: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
Thread-Topic: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
Thread-Index: AQHY4zaxg/lZaiowmEuMDgK5jkU/CK4V30oAgAACkgCAABGx4A==
Date:   Wed, 19 Oct 2022 17:09:11 +0000
Message-ID: <DM8PR02MB8169E5D5C972BE45207F70C2F32B9@DM8PR02MB8169.namprd02.prod.outlook.com>
References: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
 <CAF6AEGvvsx+6OSxOaqjoUO=J4tO_J5ZSidenx9EXdz34_myBqQ@mail.gmail.com>
 <CAF6AEGtsw5GTB+MzvA7mE8y=m6qDFtQNFnnAVtuFSxnDAT0YuA@mail.gmail.com>
In-Reply-To: <CAF6AEGtsw5GTB+MzvA7mE8y=m6qDFtQNFnnAVtuFSxnDAT0YuA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR02MB8169:EE_|CH0PR02MB8243:EE_
x-ms-office365-filtering-correlation-id: 3d1bf550-0fa5-48de-ac9a-08dab1f4a461
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OH6AV/NYnVwLCTLKfzI58Jxq1Fxl6sLaEak+lbL1Sl9+OhTjn0FeC7bjUSzoviL87AM8qkUu/b1ruPCDTRuJOLXaN6XGMwi+lJyuJZHtdlHq+elF24XJC6d+hebQYCx9Q5Z71h7syzkZDjTRZ/9abhw1UvyJZfZa3mNi6KIiozG4h+aj+vfBi9ZAls/X2WgHy5wZUFrn8/+ZP8Z7rdT5U0SWT4Y9LhzrDuzdZ/j8r/s96ZSs44fk2rnV4M70h2rYRf8BrtEaR8qZNUjEBxMpkQ7xWNgaOoRp5PUSsHeP6YgGQDJkmyiQmUTj1XgSMIT+oMqKdj+rBcfx+a1LTpWTMKTKzyfGV2pHWPzUYVKrdNNBHhNuIQ9pXBE/WuD9gW1+Xoqmqy9QhghaxSb6RhxHgPaCghREBqu4KYE3ojPfDJ1RVqmpfiJfCS92haD/QtqoFe12NoIYZiMPjFVL+ogcc887OZnXLYjwwqa/t2LxGbyTWKb88oAS1xNgxTJ646D7KrJXx4xPw/kV86t1CZ+wFepA+oK3/VssFrX61PpPYFcDcRMD3m36pfMysi/5aS1eUvni+nAu4P7Vgfb8W4Abo1UOd2yZsia7aF2yeN915EXexg+bcXTVCNjlLzKGtd+L6LDqeklpm5FCkOT2cN2iKvIN9yh8ZkCzoIw8KBwMvhnGSxuvKxARUQSxjDzrUwt2Q2urnQbH2z102gwtZM7mJiLxDjtWC0/IPyvP+TM+RL4am819VG/giwAC728If7OsSo36Cjs8DxzDJg4zCbj9YuveRczQk0xR1TjHiI8x/Kg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8169.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199015)(122000001)(26005)(38100700002)(86362001)(38070700005)(33656002)(76116006)(8676002)(55016003)(316002)(66556008)(64756008)(66946007)(54906003)(110136005)(4326008)(66476007)(66446008)(4001150100001)(15650500001)(2906002)(41300700001)(52536014)(8936002)(5660300002)(83380400001)(966005)(478600001)(186003)(71200400001)(53546011)(9686003)(6506007)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MURIWWdEZ1liMUczTGVUM0llSU5jQjI2cVM5OVBQU3VxRW1ZdVJ1WDl1WkF4?=
 =?utf-8?B?QWpaSEZTRnVDVU5vU1pvYWVTVHNvcEdWVGJ3QnVtSk42R0VWNHBGcDFka3Y2?=
 =?utf-8?B?Zi9VUzYrdUJPblU2Y1VZTHlaeVFtOEU1YVhQNFBkeFdjdlpjN0FsK3lub0px?=
 =?utf-8?B?dU1kbGFTUUNwV1NyS01xVEJBeTF5ZVNYcWV4eVdrK2w5M1Q0OXY1RHpVY0xo?=
 =?utf-8?B?eHpGS2lYUE90dys1M0NqZlEzTlJkdTB3MmordWoxVG5SSmRCWnppYUszdU5p?=
 =?utf-8?B?QXo1OU43Q3NrSjVnSHFFWmFoeXJyNDc0cm9Da2ZIdlNZeDlBeEF2bW01OWFk?=
 =?utf-8?B?TnIzbUVqZWxCUWI2aTdqMWpNUjRlSkhacXV2dEFZYkZ0SCtJMU9FMXc4RGI4?=
 =?utf-8?B?cURqRWxMdC8zTVY0WCsxa2tvc2dQb2MrK2VEWUpCWjdmTHQrdFhyeXNHbEZ4?=
 =?utf-8?B?Wm83UW9lb1BqSWVyYi93ckx4R09veFE1SDNJMlhLZTJ6QlloMDN6aUIrRmxO?=
 =?utf-8?B?REUxWlZ2alU2ZXdoMHpVa3l6VUwyMXdlNllFU09MMkxwcFRQN016MWZSOGw1?=
 =?utf-8?B?NkV0c3M4QXYrTy9aK0hOelNWOFppNnRSUDZocnlVcXJWeGMwY2J3MnBtNWxG?=
 =?utf-8?B?VXNOSEUzcmt3d25GeXB6Nkc4aXVyM0pBY3Jmclhvc01DeUlvV0lJK3lDcmQ0?=
 =?utf-8?B?SG1rSW5oM1p4RWRzSlNZRjVjeE9XVUppelJyVWNCNXd2SFVtZ1QzTFcrRWsr?=
 =?utf-8?B?YVBLcm1DQzdNbW50R0R2T1c5WTZzMUVKeTVZZmwvNzlsZS9YczVTQWxyOStQ?=
 =?utf-8?B?dUY4NE80eDFQTzhKQzdOMDFwOFFNRjlVcFlhYjUrTjY4TllTdUhHdUpUczZT?=
 =?utf-8?B?TXR6M0crS1B1ellsUlZSc0FEV1p0a1N5ZURJejE5NS81RjVpOU5mU2FtemIw?=
 =?utf-8?B?VVJkN2tCUGZ2VUkvTTFoZHJZVG4yVnBzTlZ5QlpLYTJOUWxmU0xvblZyQzdU?=
 =?utf-8?B?aVFtdWVxUVFSWElBaXN6cUprb0QwMnZ0a0ZqckZkY1QzazZBdk9DNmtJR2Nm?=
 =?utf-8?B?L0c2aVl3UWZ0SGlPaDBsZ1pTRnd0d2tJcko0ZWpDSGppdS8rMlMrZTZXQ3VO?=
 =?utf-8?B?SFFDYk9mMDZ4RENIY2M5M2prS0JES1ZpY2RPNnMwUUUwNEIraDRmem9iN0pD?=
 =?utf-8?B?UVpNYWdiazVkRUsrb0JzMzNGM2E0TnIvY0o3WDFUSDJaSmMzZndsVFNrT096?=
 =?utf-8?B?RnVlRDVxZkwxYVArMEFGZVk0Z01Fa3lnT2dkOVJHeTNBalMvNGpscGMxM1Vm?=
 =?utf-8?B?MUhvNEozK09IcEJiNGo3S2RPcllCQjNCM0NiZit2WkVaM0tIZWFiZzR6WUQ0?=
 =?utf-8?B?ZjMvVy9hOUFqYjg4aHM3WVFzTnU1RlBxcWVDQWNmL01aOVRPRldhSkFRa3Vx?=
 =?utf-8?B?QzNnYWFqS2g0bmowdWE3REMreWlQbE80dmdES2R5c01YdzVyWForZ0Y5b0x5?=
 =?utf-8?B?WmxKTnpXMjlMYlh5ejAvckxJcHc4TWZGYUphZmc4TFo3Z3FnMXNvQnNSemZG?=
 =?utf-8?B?OVM2dFBmNWN1bHFrYkV2MTNYdEg3NlpMc2Q3TmdBUlZMNzMrQ2l3M2FjYkhl?=
 =?utf-8?B?NWlvS0hWMHV2YVZ2UWxpeDZmM1B5ZFFNek9XMWhNQmE4Nmo3MFprektHQzJF?=
 =?utf-8?B?VUpTRVZPNGt5N1JtZlFnVVV6NzgwdkhMOWpyYnZqVXlUOEs1clFhT3U4ZTln?=
 =?utf-8?B?Q0s5cUx2bDBSWTJ1WGZSTFlXQXA2Z3FMTE5ObEFib2gwZjlhSEY4QXUxbE9n?=
 =?utf-8?B?ZVVKN3c1V00waHg2M3NROEdzTUZHb2FkT1ZVTHpnL0ZoOFpOL0cvRE1QaW15?=
 =?utf-8?B?WEZXTVZqS1EvWEdLU2ZtMHRjSnUzQWNlZklGOU5hTlBFQ3FtVFZCTVM1Qnhy?=
 =?utf-8?B?d1pQZlFvc2t4SmhkVW9JKzlTV0d1c1ZYMmREWVZxZExVSWdwR3ZIMGRieUpC?=
 =?utf-8?B?ZTVDYTRYaFRMYTVqWFRKN3FOdWZUc0JLOC9mL2h2S1dLRytvMEIycmVQd0ho?=
 =?utf-8?B?UXNNRllVRk8vMFdjZHFxSjlwdUViT2daL3I2Y0J2cmhnOTlWU29JR0F2Q0I2?=
 =?utf-8?B?ZG1nb2VabU80azgvbFZ2KzEyMVhVOGlzSnNOLzJYaEg5cVRIUnRsR0w4Vjdl?=
 =?utf-8?B?a2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8169.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1bf550-0fa5-48de-ac9a-08dab1f4a461
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 17:09:11.4191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n3QfKlhC5N2R7w7j/Y6rkIhOq2NgcXxLXXZD/TZLZC5+kgDv6W2DBiw6yuswCVmga3mKkcAZYIR+qgxbgr17NMIeQE3wc1cxjpaYFdw3AXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8243
X-Proofpoint-GUID: idPCzIJMLPu-cLxhJ9BKTTN5JEafa_3D
X-Proofpoint-ORIG-GUID: idPCzIJMLPu-cLxhJ9BKTTN5JEafa_3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_09,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210190096
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgUm9iLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBDbGFy
ayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDE5LCAy
MDIyIDk6MzIgUE0NCj4gVG86IE5hdGhhbiBIZWJlcnQgPG5oZWJlcnRAY2hyb21pdW0ub3JnPg0K
PiBDYzogbGludXgtZmlybXdhcmVAa2VybmVsLm9yZzsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5l
bC5vcmc7IFZpa2FzaA0KPiBHYXJvZGlhIChRVUlDKSA8cXVpY192Z2Fyb2RpYUBxdWljaW5jLmNv
bT47IEZyaXR6IEtvZW5pZw0KPiA8ZnJrb2VuaWdAY2hyb21pdW0ub3JnPjsgQmpvcm4gQW5kZXJz
c29uIDxhbmRlcnNzb25Aa2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQVUxMXTogcWNvbTog
U0M3MTgwIGFuZCBTQzcyODAgdmVudXMgZmlybXdhcmUgdXBkYXRlcw0KPiANCj4gV0FSTklORzog
VGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJl
IHdhcnkgb2YNCj4gYW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBt
YWNyb3MuDQo+IA0KPiBBY3R1YWxseSwgaXNuJ3QgdGhlIC5tYm4gdGhlIGpvaW5lZCBmdz8gIElm
IHNvIGFsbCB5b3UgbmVlZCB0byBkbyBpcyByZW1vdmUgdGhlDQo+IG90aGVyIGZpbGVzPw0KLm1i
biBpcyB0aGUgY29tcGxldGUgZmlybXdhcmUgaW1hZ2UuIFdlIGhhdmUgbWlncmF0ZWQgdG8gLm1i
biBmb3Igc2M3MjgwLCB3aGlsZSB0aGUNCkluaXRpYWwgZGF5cyBvZiBzYzcyODAgd2FzIHdpdGgg
Lm1kdCBiaW5hcmllcyAoc3BsaXQgb25lcykuIFNvIHRvIHN1cHBvcnQgdGhlIGJvYXJkcyB3aGlj
aA0KSGF2ZSBub3QgdXBncmFkZWQgdGhlIGRyaXZlciwgd2UgYXJlIHJldGFpbmluZyBhbGwgYmlu
YXJpZXMuDQoNCj4gT24gV2VkLCBPY3QgMTksIDIwMjIgYXQgODo1MiBBTSBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BnbWFpbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSG1tLCBkb2VzIHZlbnVzIG5vdCBz
dXBwb3J0IHRoZSBjb21iaW5lZCBmaXJtd2FyZSB5ZXQ/ICBFbHNld2hlcmUNCj4gPiB3ZSd2ZSBt
b3ZlZCBhd2F5IGZyb20gc3BsaXQgZncgdG8gdXNpbmcgYSBzaW5nbGUgRUxGIGZpbGUuLg0KPiA+
DQo+ID4gQlIsDQo+ID4gLVINCj4gPg0KPiA+IE9uIFR1ZSwgT2N0IDE4LCAyMDIyIGF0IDI6MTgg
UE0gTmF0aGFuIEhlYmVydCA8bmhlYmVydEBjaHJvbWl1bS5vcmc+DQo+IHdyb3RlOg0KPiA+ID4N
Cj4gPiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQNCj4gNDg0MDdmZmQ3YWRi
OTUxMTcwMTU0NzA2OGIxZTZmMDk1NmJkMWM5NDoNCj4gPiA+DQo+ID4gPiAgIGNubTogdXBkYXRl
IGNoaXBzJm1lZGlhIHdhdmU1MjFjIGZpcm13YXJlLiAoMjAyMi0xMC0xNyAxMDoyMDo0Mw0KPiA+
ID4gLTA0MDApDQo+ID4gPg0KPiA+ID4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRv
cnkgYXQ6DQo+ID4gPg0KPiA+ID4gICBodHRwczovL2dpdGh1Yi5jb20vbmF0aGFuLWdvb2dsZS9s
aW51eC1maXJtd2FyZS5naXQNCj4gPiA+IHVwZGF0ZV9zYzcxODBfYW5kX3NjNzI4MF9maXJtd2Fy
ZXMNCj4gPiA+DQo+ID4gPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8NCj4gNzZlMTYw
MzY2YTI4MDEwZmEwNmRkYzk2NTY1OWMzOGE0NGQxNTlkOToNCj4gPiA+DQo+ID4gPiAgIHFjb206
IHVwZGF0ZSB2ZW51cyBmaXJtd2FyZSBmaWxlcyBmb3IgVlBVLTIuMCAoMjAyMi0xMC0xOCAxMzo0
Mjo1OA0KPiA+ID4gLTA3MDApDQo+ID4gPg0KPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ID4gTmF0aGFuIEhl
YmVydCAoMik6DQo+ID4gPiAgICAgICBxY29tOiB1cGRhdGUgdmVudXMgZmlybXdhcmUgZmlsZXMg
Zm9yIHY1LjQNCj4gPiA+ICAgICAgIHFjb206IHVwZGF0ZSB2ZW51cyBmaXJtd2FyZSBmaWxlcyBm
b3IgVlBVLTIuMA0KPiA+ID4NCj4gPiA+ICBxY29tL3ZlbnVzLTUuNC92ZW51cy5iMDAgfCBCaW4g
MjEyIC0+IDIxMiBieXRlcw0KPiA+ID4gIHFjb20vdmVudXMtNS40L3ZlbnVzLmIwMSB8IEJpbiA2
ODA4IC0+IDY4MDggYnl0ZXMNCj4gPiA+ICBxY29tL3ZlbnVzLTUuNC92ZW51cy5iMDIgfCBCaW4g
ODczNTk2IC0+IDg3NTAyMCBieXRlcw0KPiA+ID4gIHFjb20vdmVudXMtNS40L3ZlbnVzLmIwMyB8
IEJpbiAzMzc5MiAtPiAzMzg5NiBieXRlcw0KPiA+ID4gcWNvbS92ZW51cy01LjQvdmVudXMubWJu
IHwgQmluIDkxOTcwOCAtPiA5MjEyMzYgYnl0ZXMNCj4gPiA+IHFjb20vdmVudXMtNS40L3ZlbnVz
Lm1kdCB8IEJpbiA3MDIwIC0+IDcwMjAgYnl0ZXMNCj4gPiA+ICBxY29tL3ZwdS0yLjAvdmVudXMu
YjAwICAgfCBCaW4gNjkyIC0+IDY5MiBieXRlcw0KPiA+ID4gIHFjb20vdnB1LTIuMC92ZW51cy5i
MDEgICB8IEJpbiA3Mzc2IC0+IDczNzYgYnl0ZXMNCj4gPiA+ICBxY29tL3ZwdS0yLjAvdmVudXMu
YjAyICAgfCBCaW4gMzAwIC0+IDMwMCBieXRlcw0KPiA+ID4gIHFjb20vdnB1LTIuMC92ZW51cy5i
MDQgICB8IEJpbiAyMCAtPiAyMCBieXRlcw0KPiA+ID4gIHFjb20vdnB1LTIuMC92ZW51cy5iMDkg
ICB8IEJpbiA5MzkxODQgLT4gOTM5NDcyIGJ5dGVzDQo+ID4gPiAgcWNvbS92cHUtMi4wL3ZlbnVz
LmIxMCAgIHwgQmluIDQyOTc2IC0+IDQzMTIwIGJ5dGVzDQo+ID4gPiAgcWNvbS92cHUtMi4wL3Zl
bnVzLm1ibiAgIHwgQmluIDIwMzExODggLT4gMjAzMTYyMCBieXRlcw0KPiA+ID4gIHFjb20vdnB1
LTIuMC92ZW51cy5tZHQgICB8IEJpbiA4MDY4IC0+IDgwNjggYnl0ZXMNCj4gPiA+ICAxNCBmaWxl
cyBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQoNClRoYW5rcywNClZp
a2FzaA0K
