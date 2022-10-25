Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D21D660C3BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 08:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbiJYGVJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 02:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbiJYGVG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 02:21:06 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA7E2A432
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 23:20:59 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29P5YB8e015929;
        Tue, 25 Oct 2022 06:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=kRCUebsdNYQLfxnN2LYGvzSbqyZgSGYrDxDyExqdcbo=;
 b=nqhfCIevBIC9GEVm1LlcK3nf60f9cw4eS8I2nSdD0d7pjT3v6r3tUneb3Y9KWep47mU8
 GE/gyizsPzoy65IenFhFhOai4tMOa/FCd8nTmN9Er4tt/La0ZaNq6/1jUUfhudAPxWUl
 K8I3hF81Gk1OtG0ByQVAcrdEQEXD6RFyGes87VdfcbkVNq1S9X8Cabw5k3LmflBAzVeM
 jSpFN317pEYxrR3KpnhAdj7b8gt6Sc2wb0jgWVpClUE4kb56N7Dkw6LmlTuWY1wO5EuC
 fLwZAfKd4S/w6HGlLBwpOZafE7ZF2WGaPqGZY43nMuq2Azxd3aHvYAYz6dI1wxD8kYfi 4A== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kc9pv5yyp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Oct 2022 06:20:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEiacOGID8n4KFeECjRUECQFApTATqj9xMsym+zUMpx3YYRUikWGY3zKtKQRCtk2yRVcwe38SF2E5H+JIXT2CIaO3sszPysR/WzcUtBzryK0MjipmOZWOwc4987NHySDQ/ptj/i96dDEbElMFx2VwiJmm8HiYil7ErrItNDf4P6O+jnTU7iu+u53GkC1D25E4+FYobYIGUZqWA87P8fqzq9QYWz21ooieDzsCOyhrLTSv3Q1wgcnjUIjJh0JzXqxPKDynFUgB/7eenCCUw8XgI4MbkRyRBo3MJvbRs/TE/lrea85Fb68PsORpp2kVrihxl6yvq+NsILFH5vfE0ClVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRCUebsdNYQLfxnN2LYGvzSbqyZgSGYrDxDyExqdcbo=;
 b=eYyVx6k0NsA7TcnZ8OiodM282p4Md7Ht7fJukoKyZzPnliKfP8h+QIFcF7Dd3levDt66jbGwYQAfn2p3SvwKDJd7H0nzUcsWebtLj989Z/lzqw0h6+UKUmjy9sK4grD9PEObRigBnwWmfwRmEXPqgxtPgVuMnmuKSEJn0PVRLNjjETo1t3J+BNxi6JR3H1mCHEbxKLHr2ItNQ2Tq8dOwxSQh+X+lfMmE36IBB/lwDez7fN/NazuQ03iZzJHYC5UXtOGLHoV9hhxepwgrF0+Ki37yXu+J5NmlmCu1smQzGQpTRbKEP/iGRVvuJ8v6/akEAOMssfnNnWuQWRvZs8qIBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DM8PR02MB8169.namprd02.prod.outlook.com (2603:10b6:8:1a::14) by
 BL3PR02MB8297.namprd02.prod.outlook.com (2603:10b6:208:344::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 06:20:53 +0000
Received: from DM8PR02MB8169.namprd02.prod.outlook.com
 ([fe80::967e:9edc:811e:732c]) by DM8PR02MB8169.namprd02.prod.outlook.com
 ([fe80::967e:9edc:811e:732c%9]) with mapi id 15.20.5723.033; Tue, 25 Oct 2022
 06:20:53 +0000
From:   Vikash Garodia <vgarodia@qti.qualcomm.com>
To:     "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        Nathan Hebert <nhebert@chromium.org>
CC:     Rob Clark <robdclark@gmail.com>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: RE: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
Thread-Topic: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
Thread-Index: AQHY4zaxg/lZaiowmEuMDgK5jkU/CK4V30oAgAACkgCAABGx4IABjpcAgAATMgCABxbSQA==
Date:   Tue, 25 Oct 2022 06:20:53 +0000
Message-ID: <DM8PR02MB8169A81C4117598D4053084EF3319@DM8PR02MB8169.namprd02.prod.outlook.com>
References: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
 <CAF6AEGvvsx+6OSxOaqjoUO=J4tO_J5ZSidenx9EXdz34_myBqQ@mail.gmail.com>
 <CAF6AEGtsw5GTB+MzvA7mE8y=m6qDFtQNFnnAVtuFSxnDAT0YuA@mail.gmail.com>
 <DM8PR02MB8169E5D5C972BE45207F70C2F32B9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <CANHAJhG2PM-KS9GVHOE0xh+5KpKy5qjFBqteRGqNONiasjprBg@mail.gmail.com>
 <CAA8EJprUPw8NChfOferwXEmahkhOHrQvRxpVOhpNJUoZgexHkQ@mail.gmail.com>
In-Reply-To: <CAA8EJprUPw8NChfOferwXEmahkhOHrQvRxpVOhpNJUoZgexHkQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR02MB8169:EE_|BL3PR02MB8297:EE_
x-ms-office365-filtering-correlation-id: a171b572-94ed-475e-1d52-08dab65111bc
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bqdiOtZc3RzgBFU5samvcc9qhDNkGRJLTmSu3qvQezOa+KXDMU+Ub4qvDBVYQh2DSGoXXvUlFhxRtgGWVuVoNuJuSAI+ZxluZ1qQ/OimDk8fR6xPf2G8DlT7FrvtA9DSzaKZagKeDsTtTiA8Mn3KciKp6D7dZvC5lXwVF4/AywugCNQBYsS9ta4itSO6O2IW+/NT88UV80xMaYAXCBwyp0Zj/YxAZ8yfYBwaEs+fRQ18asZT3cGox0eB3bQ7Fy42AwxlL/BCGNsZVuT8zUwoi2HG9eGOh5F1yD895SItRctyJE74o7efczc0qOPv8ake5GPXWjQCTWe6+vDlOgHvSmN49xg/mLCgRV7RYU5HubSuTWZY9wwGKDK0rG1uEfG5DMV1FmXkX816ViRu5jTEYXOMG8U/Gd9bpryXyUotBRiuI9NKmBACbwtJ5J6PTeefgbU2HUwbVLDkfFnVv5yZXkMbgGKbXyBvNRL6nrupnrrqzT9dk/KtZqwoDz7D3jiVde4ZhJuje4HZ0rHscVEOCPGTS8ebTa1KUiwlRuyK0mXpeT4kpIOyaF20hVyfNKerePmwi8K9StTuNueEaJFhqz72yTPwRLjtwc7BfthspZYUlX3/k7NTb19GQwVB56Q+rpXXAlQ7FHsgnDgGCt+HiK5qeuNfBhCnKS4lkGjNH/EKh/VxgCFpOYWv3LjTRIzVxhHUkojxDwHY3QtzeTIY0jqKGQCFKQlIBoq/VT1u8G7GLS86s4umqHMbKYsEdvKxu+sH2VjcBdBjn0ahwybbQJg2tSZ/QsLZZwcdD8xVUgI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8169.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199015)(66446008)(33656002)(64756008)(66556008)(41300700001)(478600001)(186003)(76116006)(66946007)(8676002)(66476007)(38100700002)(2906002)(4326008)(966005)(122000001)(38070700005)(83380400001)(71200400001)(86362001)(54906003)(110136005)(316002)(55016003)(9686003)(26005)(6506007)(53546011)(52536014)(15650500001)(8936002)(7696005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3VHcnNVZ2JzemRVVE5nNVlKSXpRQVo0R2haNXFFeWwxeXhGZzJWMXQydkE5?=
 =?utf-8?B?L2xiY0JmWDdmcElsMmtHY1JFRWVxWmJzaFFUKzN6dWt0aTNJMzlPNEZJeStP?=
 =?utf-8?B?OEg2eE1TZCs0dlNsRnlTZnQzeWNvNi9BSE9XcWxJNkJUZkNIb3F5Q3FMMmsw?=
 =?utf-8?B?NTBTSnVscHl5M2QrOVlmN1VEUWIxYktScE9SN2VtamFzdHJRb3k0c0gwODRN?=
 =?utf-8?B?c3d1RS9KZVF0M3lNeFcweE5wQjVSTW5DL2VVN1ZteFVMQ2o4cVBlTHdHZkNp?=
 =?utf-8?B?KzRGWFVDTmNHU2gya2k3bU5MaVl3QlNFOThnUzI1T3BDR25CUTVlSm0wMWE3?=
 =?utf-8?B?OFRhcmhFOGF0MmVMQXpMaFdmWjJYb1dmNVNLdUs0MEkwYjg5OGxrTk9DTUhS?=
 =?utf-8?B?SW9xcXlrWFhkNG8zVXFCS0hYcHhyVFRvMGMxK3dZdVVKVVVMRHRUbDRoL29W?=
 =?utf-8?B?bHNsTjZDOUFrd1IyMFhSQzBZMGtSWXZoNmlJNk1SaC80WnlKc3dRT0JxTTJY?=
 =?utf-8?B?ZXJEMENncWtjSmR6QkRUajhubkU4ZXdyaUdBQUptdWNzYmpBS01GUGdnVEk2?=
 =?utf-8?B?THdmMi9iK28zeVNpdlkyUCt3dW44TEczQ3NkL0RvY1MxWlJoWkNjMDYwbUt2?=
 =?utf-8?B?bTNoclVxczlXbEdObDlWL0UwUm1VQndma2tGd0xlTlBsTzd2ZmxTa3VoUjZv?=
 =?utf-8?B?ZG0xRm1oQy85S1IzOCt1SEVPbVZMdkNzWTdDY2FGZ0duYnZJRDFTQTNEOFB4?=
 =?utf-8?B?U2pieWNtdUxXTXhkcVpuT0tDRjVsY0VEa1loNDJCZTJoRHhISkdIdGtSYkpX?=
 =?utf-8?B?UVRqWHdoVGhQb0Jaa0llc0p5WkNEQnIrUWR1YXBKNWdTWlBwOEFkUlI5WmZG?=
 =?utf-8?B?K2F0UmNWTXcybURsMnpQSDVJTEtKV09YMDBQaU1BbW9CL3UvejdONG9BdkxC?=
 =?utf-8?B?NEpINVlWOXJNakRKK2Irb0dWd253VVM5WnM0QXEvTmlqdmdMQkFHa2VBeXVC?=
 =?utf-8?B?MGpNQmxsZG43bGF5M0hSZTljaTZid3hVMlBmL0RhamhiUFdDQ3l3TDRmWUVL?=
 =?utf-8?B?eGp3bjlrYVZFcjFIZWJzN21rTFJyM0R3cDgrcHNXejZkQXl3MmVhai9IMWZM?=
 =?utf-8?B?aTk0dnBqVGdrYzZWYnRVVG5FV1QvWXVTMUY1cVoxQXIxeTVtSWR1SjRxbWxq?=
 =?utf-8?B?dSs1Q0Joek80QVMwdFZhQWdRUFpWc2x2NWdNaHEwcUh5LzJZcGxibmxKR3FG?=
 =?utf-8?B?VCsrRWZHb1lIdUUvVVF6ZG1rbzlyRE5sbFZtcTFQYVJmSnZHL2d1OFl1MUwy?=
 =?utf-8?B?dmdiOUlNQXhWeXZWWFBQTmh1MW1rS2hmNUdMNGVsVC83L09uUldzVGxyUjFk?=
 =?utf-8?B?aE5LUm10a1hoL3UrdDdLWldFc1E0T1hLdmNuUmc2RGdiRzZ5bjJaNXIyZXg0?=
 =?utf-8?B?RDZxVkVHbzBpTWVlelF0TGtQejNsMFdvQnVLcTZ5Tm1ZQm9vYXNzdFk2TDl1?=
 =?utf-8?B?SVRTQ2lYNlJId3NsQWs3clVEK0VhVnhjcjFCZXZUdzQ4bURZOWY1ZGJiczJ4?=
 =?utf-8?B?bG1IYzdXOW1tVytxVk45MlVlNmp3T3VTWGVoTEhnUzUzK1duQ2xoWEQrUTND?=
 =?utf-8?B?U1RybDFManlralErdW9QNElKWDhIU3J1RzBCd3pBdHcxV0pFeTlNenFIZ1lS?=
 =?utf-8?B?Zjl4amdEdVRvbHIrVHM2ZkVWYlNWZXNoSGdIZDNlOFNuam9NbWpVVVpmZ0sr?=
 =?utf-8?B?cFhLMkluMlptR0tTSzQxbE0xOXRoU2xFL1htd0dRelB4WWVYZkNjdUc3QnVQ?=
 =?utf-8?B?RDUxczJDSzY0dGcrV2sxdWk1d240Y0hhNnNJbXNsSW5weHM4K1VRQXpCK3B1?=
 =?utf-8?B?T2pYZGlVdElYa3hoMjRqaG52YUd3QXJoZUllbkw4bDdMcmxFOTExTWJPcjNz?=
 =?utf-8?B?SUFtS1FUUXZCVGd1Mi92N0NCQWNESzU5ZHJmUFlIOTFMUVJjR3A3a3JMOWUy?=
 =?utf-8?B?NHhreFBDa2drRHBBZktveWlSaTExSUJVK3dHQmp1UHZtRnRadHMvSURnVGdt?=
 =?utf-8?B?UmF2dmI3NStjWnRXR1NMdnRrcmhnaXVLK0FRaU5udm1rNjB2OEgwR3kzcjRq?=
 =?utf-8?B?eEhjbEpFTm5zN0c3WTJYSDBqQlRLVVVwNlg3bjZ4TGcrdnBRQ1RLbXB4RkI4?=
 =?utf-8?B?VWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8169.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a171b572-94ed-475e-1d52-08dab65111bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 06:20:53.1868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q2tBoks/o1u8nKETd9QMtHnIevy7AoeLnZOBiu1ad1m7Lv4CzNAY2trygihwgCW788833Z5ZTdZ9vjKWJkwCGZFLfanitU8zR3EzhMD0yYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8297
X-Proofpoint-ORIG-GUID: pz5P5f_DdfB6yPw532gJjVu8Cj7nbrXs
X-Proofpoint-GUID: pz5P5f_DdfB6yPw532gJjVu8Cj7nbrXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_01,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210250035
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgRG1pdHJ5LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERtaXRy
eSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4gU2VudDogVGh1cnNk
YXksIE9jdG9iZXIgMjAsIDIwMjIgMTE6MzEgUE0NCj4gVG86IE5hdGhhbiBIZWJlcnQgPG5oZWJl
cnRAY2hyb21pdW0ub3JnPg0KPiBDYzogVmlrYXNoIEdhcm9kaWEgPHZnYXJvZGlhQHF0aS5xdWFs
Y29tbS5jb20+OyBSb2IgQ2xhcmsNCj4gPHJvYmRjbGFya0BnbWFpbC5jb20+OyBsaW51eC1maXJt
d2FyZUBrZXJuZWwub3JnOyBsaW51eC1hcm0tDQo+IG1zbUB2Z2VyLmtlcm5lbC5vcmc7IFZpa2Fz
aCBHYXJvZGlhIChRVUlDKSA8cXVpY192Z2Fyb2RpYUBxdWljaW5jLmNvbT47DQo+IEZyaXR6IEtv
ZW5pZyA8ZnJrb2VuaWdAY2hyb21pdW0ub3JnPjsgQmpvcm4gQW5kZXJzc29uDQo+IDxhbmRlcnNz
b25Aa2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQVUxMXTogcWNvbTogU0M3MTgwIGFuZCBT
QzcyODAgdmVudXMgZmlybXdhcmUgdXBkYXRlcw0KPiANCj4gV0FSTklORzogVGhpcyBlbWFpbCBv
cmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJlIHdhcnkgb2YNCj4g
YW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+IA0K
PiBIaSwNCj4gDQo+IE9uIFRodSwgMjAgT2N0IDIwMjIgYXQgMTk6NTIsIE5hdGhhbiBIZWJlcnQg
PG5oZWJlcnRAY2hyb21pdW0ub3JnPg0KPiB3cm90ZToNCj4gPg0KPiA+IE9uIFdlZCwgT2N0IDE5
LCAyMDIyIGF0IDEwOjA5IEFNIFZpa2FzaCBHYXJvZGlhDQo+ID4gPHZnYXJvZGlhQHF0aS5xdWFs
Y29tbS5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEhpIFJvYiwNCj4gPiA+DQo+ID4gPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IFJvYiBDbGFyayA8cm9iZGNs
YXJrQGdtYWlsLmNvbT4NCj4gPiA+ID4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDE5LCAyMDIy
IDk6MzIgUE0NCj4gPiA+ID4gVG86IE5hdGhhbiBIZWJlcnQgPG5oZWJlcnRAY2hyb21pdW0ub3Jn
Pg0KPiA+ID4gPiBDYzogbGludXgtZmlybXdhcmVAa2VybmVsLm9yZzsgbGludXgtYXJtLW1zbUB2
Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiA+IFZpa2FzaCBHYXJvZGlhIChRVUlDKSA8cXVpY192Z2Fy
b2RpYUBxdWljaW5jLmNvbT47IEZyaXR6IEtvZW5pZw0KPiA+ID4gPiA8ZnJrb2VuaWdAY2hyb21p
dW0ub3JnPjsgQmpvcm4gQW5kZXJzc29uIDxhbmRlcnNzb25Aa2VybmVsLm9yZz4NCj4gPiA+ID4g
U3ViamVjdDogUmU6IFtQVUxMXTogcWNvbTogU0M3MTgwIGFuZCBTQzcyODAgdmVudXMgZmlybXdh
cmUNCj4gPiA+ID4gdXBkYXRlcw0KPiA+ID4gPg0KPiA+ID4gPiBXQVJOSU5HOiBUaGlzIGVtYWls
IG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUNCj4gPiA+ID4g
d2FyeSBvZiBhbnkgbGlua3Mgb3IgYXR0YWNobWVudHMsIGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jv
cy4NCj4gPiA+ID4NCj4gPiA+ID4gQWN0dWFsbHksIGlzbid0IHRoZSAubWJuIHRoZSBqb2luZWQg
Znc/ICBJZiBzbyBhbGwgeW91IG5lZWQgdG8gZG8NCj4gPiA+ID4gaXMgcmVtb3ZlIHRoZSBvdGhl
ciBmaWxlcz8NCj4gPiA+IC5tYm4gaXMgdGhlIGNvbXBsZXRlIGZpcm13YXJlIGltYWdlLiBXZSBo
YXZlIG1pZ3JhdGVkIHRvIC5tYm4gZm9yDQo+ID4gPiBzYzcyODAsIHdoaWxlIHRoZSBJbml0aWFs
IGRheXMgb2Ygc2M3MjgwIHdhcyB3aXRoIC5tZHQgYmluYXJpZXMNCj4gPiA+IChzcGxpdCBvbmVz
KS4gU28gdG8gc3VwcG9ydCB0aGUgYm9hcmRzIHdoaWNoIEhhdmUgbm90IHVwZ3JhZGVkIHRoZSBk
cml2ZXIsDQo+IHdlIGFyZSByZXRhaW5pbmcgYWxsIGJpbmFyaWVzLg0KPiA+ID4NCj4gPg0KPiA+
IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIChvbiBhbmQgb2ZmLWxpc3QpLiBJIHdpbGwgcHVzaCBh
IFYyIG9mIHRoZQ0KPiA+IHB1bGwgcmVxdWVzdCB3aXRoIHRoZSBmb2xsb3dpbmcgY2hhbmdlczoN
Cj4gPg0KPiA+IDEuIFVwZGF0ZSBib3RoIHNwbGl0IGFuZCBub24tc3BsaXQgYmluYXJpZXMgZm9y
IHZlbnVzLTUuNCAoU0M3MTgwKS4NCj4gPiBBbHNvLCB1cGRhdGUgdGhlIHZlcnNpb24gaW4gV0hF
TkNFLiBXZSBjYW4gcmVtb3ZlIHRoZSBsZWdhY3kgc3BsaXQNCj4gPiBpbWFnZXMgaW4gYSBsYXRl
ciBjb21taXQgaWYgaXQgaXMgZmVhc2libGUgdG8gZG8gc28uDQo+IA0KPiBUaGUgbWR0IGxvYWRl
ciBkb2Vzbid0IGNhcmUgYWJvdXQgdGhlIGZpbGUgZXh0ZW5zaW9uLCB0aGUgbWR0IGxvYWRlciB3
aWxsDQo+IGRldGVybWluZSB0aGUgdHlwZSBvZiB0aGUgZmlsZSBiYXNlZCBvbiB0aGUgZmlsZSBj
b250ZW50cy4gVGh1cyBJJ2Qgc3VnZ2VzdCBhZGRpbmcNCj4gb25seSBtYm4gZmlsZXMgYW5kIGFk
ZGluZyBhIGNvbXBhdCBzeW1saW5rcyBwb2ludGluZyBmcm9tIHZlbnVzLm1kdCB0bw0KPiB2ZW51
cy5tYm4NCg0Kc2M3MTgwIGlzIHVzaW5nIHZlbnVzLTUuNCBmaXJtd2FyZSBhbmQgY3VycmVudGx5
IHRoZSBuYW1lIGlzIHBhc3NlZCBhcyAicWNvbS92ZW51cy01LjQvdmVudXMubWR0IiB3aGlsZSBt
YWtpbmcgY2FsbCB0byAicmVxdWVzdF9maXJtd2FyZSgpIg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Fjb20vdmVu
dXMvY29yZS5jI0w3NjUNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9z
b3VyY2UvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9xY29tL3ZlbnVzL2Zpcm13YXJlLmMjTDEwNA0K
DQpJSVVDLCBiZWZvcmUgd2UgcmVtb3ZlIHRoZSBzcGxpdCBmaWxlcyAoLm1kdCksIHdlIHNob3Vs
ZCBhbHNvIG1ha2UgY2hhbmdlIGluIGRyaXZlciB0byB1cGRhdGUgdGhlIG5hbWUgZnJvbSAubWR0
IHRvIC5tYm4uDQpQbGVhc2UgaGVscCB0byBjbGFyaWZ5IGlmIHdlIGNhbiByZW1vdmUgdGhlIHNw
bGl0IGZpbGVzIHdpdGggZHJpdmVyIHN0aWxsIHJlZmVycmluZyB0byAicWNvbS92ZW51cy01LjQv
dmVudXMubWR0IiBpbiBjYWxsIHRvIHJlcXVlc3RfZmlybXdhcmUoKS4NCg0KPiA+IDIuIFJlbW92
ZSB0aGUgc3BsaXQgZmlybXdhcmUgaW1hZ2VzIGZvciB2cHUtMi4wIChTQzcyODApLiBUaGVyZSBp
cyBubw0KPiA+IHJlbGVhc2VkIGRldmljZSB0aGF0IHVzZXMgdGhlIG9sZGVyIGZpcm13YXJlIGxv
YWRlci4gSSBoYXZlIHRlc3RlZCB0bw0KPiA+IG1ha2Ugc3VyZSB0aGUgbm9uLXNwbGl0IGltYWdl
IGNhbiBiZSBsb2FkZWQgYW5kIHRoYXQgdGhlIHZlbnVzIG1lZGlhDQo+ID4gZnVuY3Rpb25zIHdv
cmsgb24gYQ0KPiA+IFNDNzI4MCBkZXZpY2UgdXNpbmcgYSBDaHJvbWVPUyBrZXJuZWwgYmFzZWQg
b24gNS4xNS4NCj4gPiAzLiBVcGRhdGUgdGhlIFZQVS0yLjAgbm9uLXNwbGl0IGJpbmFyaWVzIHRv
IHRoZSBsYXRlc3QgdmVyc2lvbiBhbmQNCj4gPiB1cGRhdGUgdGhlIHZlcnNpb24gaW4gdGhlIFdI
RU5DRSBmaWxlLg0KPiANCj4gDQo+IC0tDQo+IFdpdGggYmVzdCB3aXNoZXMNCj4gRG1pdHJ5DQo=
