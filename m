Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E84DF60DC02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 09:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbiJZHVB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 03:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbiJZHVA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 03:21:00 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C3957BD1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 00:20:59 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q5hr5N009975;
        Wed, 26 Oct 2022 07:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=4K+8jZAFgoZYK263OMyomVTLt9iPIRpW48dRMYwqi9M=;
 b=dIuD2NrufU8Hsi/JNQWDpIcMtV1FvM91gvytme/Q58IFb1cDowbK30yXbhvrs0W+x8QO
 +03PKp3kx9b5iKCugWdWB0kj1zY7c2rhBYiwZg+fIUuzd1hofZSvMkEKLsimkzuoFrZv
 adWA7drXfGcEg0WL8nLVxOb+r6Klq4/mvjNZUloEgJVNN1avdyBYSfMyYKjiZ491PtxT
 Wk/BXzEeqIdKZGfJxaUTT3EguMLF99Fgp7Gu/XJDuPgkMazN95CPlyeVgo9hsgP6dxKY
 xvI56c9dlWdV8+q1Oeo1kQOSY/8tFEnIDrBsKQjbyZ5HgwWjbE1eq2rYLZOdDZWyQ8a6 2g== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kevbr8ktv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Oct 2022 07:20:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aalGV1LrOsugoPhBFxkClt8axAr24F26i1Z+dvxzQHSLhXbVMcFhF17r5Ly9LBrziT8V5fPS8NRXvLZttJM0nGFo2fK0pkd4V+4jqG/AtfyYe2TxNy7PauxzUqr2Afw99fedWTZmuYwK7EQcOOiWHRfTpz45c3xDSot5D5gDMim/YIUQpFsx1WRAb63rWL53xwfxnFaMtak+dXA0lD9eYqZMqioE54wDr5Rfa/e6WVBuooD2wjotE+OTtW0I4gNa9tFM/HszRbEmJRgSZIqJ0+fkttdEKDXcSJqpTJ8M4Dizgtv+s59DtG0Wh5T/0dacZ6EQCXFEvR0ZYqSc7R3NvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4K+8jZAFgoZYK263OMyomVTLt9iPIRpW48dRMYwqi9M=;
 b=XDl26EoHYodzi3V1kVa9rvcqndz9TIjcd+nqxEsAPUiD6SAvkP4AeZwc+vMpcC9U3k8QPxcybcDG4jJVSmgSZObOdLzInYnc5aIyQdedjCmqX4OH5zCF/fwnLSnMICv52ECdoxyMJ8baolNaC7O1H10Gdm1jEhwX8G034sL9ctIK7BkLeRnMSPYBuC323ukXd46mgFlaFUKHP69CSCKmb1ARJtbQzLYRxNBCrXX8eqWwHxqtXmH1Hetqwuz3zQzvoXSOU30ukJTx/So6rZrbV9jJAwE3ZEjALZLjpeFP9+2m7poHkzyoEC8w91cnCRtXdKEJmP/5NxRGg+tm6o4aQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DM8PR02MB8169.namprd02.prod.outlook.com (2603:10b6:8:1a::14) by
 DM6PR02MB6698.namprd02.prod.outlook.com (2603:10b6:5:217::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.26; Wed, 26 Oct 2022 07:20:53 +0000
Received: from DM8PR02MB8169.namprd02.prod.outlook.com
 ([fe80::967e:9edc:811e:732c]) by DM8PR02MB8169.namprd02.prod.outlook.com
 ([fe80::967e:9edc:811e:732c%9]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 07:20:53 +0000
From:   Vikash Garodia <vgarodia@qti.qualcomm.com>
To:     Nathan Hebert <nhebert@chromium.org>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
CC:     "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>
Subject: RE: [PULL V4]: qcom: SC7180 and SC7280 venus firmware updates
Thread-Topic: [PULL V4]: qcom: SC7180 and SC7280 venus firmware updates
Thread-Index: AQHY6LlFLYxgaVwbLE2emLyi21Lp1a4fpZAAgAABf4CAAJ4DEA==
Date:   Wed, 26 Oct 2022 07:20:53 +0000
Message-ID: <DM8PR02MB8169E094A6CF46DED4D745E3F3309@DM8PR02MB8169.namprd02.prod.outlook.com>
References: <CANHAJhH41JnZA_fPNczMpBwnTy5P-5xhgPY5_eHkOsBzx0Qy=A@mail.gmail.com>
 <d31e3aa3-fdec-f0b1-f400-0ea6055a0f6c@linaro.org>
 <CANHAJhFiVRxaDwfV5ej0c5o7JJ6cjRwoUiy2dvnSyGHo1H_ibA@mail.gmail.com>
In-Reply-To: <CANHAJhFiVRxaDwfV5ej0c5o7JJ6cjRwoUiy2dvnSyGHo1H_ibA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR02MB8169:EE_|DM6PR02MB6698:EE_
x-ms-office365-filtering-correlation-id: 614827b7-6594-496e-fe49-08dab7229e00
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3sR+LX4wC5XinQ8O5Q63cIO3Ix+aRZO2lohnFNJuULR0oirEBL9zwUv9/aJi5Ci17RP+ikaowt1r8cFHgIbyXyXTd/p1ztOxSaK9AMF36lso/4P+AyJEZPm8O/nsuoPtpIi5FGRkh/hOpCFtIc5l56Oc38Pfqs+SIX1mf51YDBa7QxzvbRTTHPCq0Deql+b84UEHGTGkJVjYYU2I+44hhvyG6N/Jz1Itj0pEe/1envDW7IVB8BsaE13CykA66Gd9k9WBEjOrCDgypDFc0aGOwATc/mT1fyp42vDU1p8yOn7UdNDhFyvU/YfAvS65OOzwCBFafghksoo7+NJI1ejukyleeObY7VRVeBjCQuVtmOLgoY2k4cUMugcxvbpkcZjgLHm67emq+FMR/TUKIhyu0y/tMC/YDtVEB8T8bajUeU0Pu+QBaowFJV0Pgqo7Os3ebxdATKJoC6kHZ1rabzu14xcZisLireIav0xkCeUzg4DWlulaAWpdordA3m0yKzaD6jhvi0soAPN8pxW7zTS2Of8kyJEty/yjLKnNDBEFiNmNijATHeD7qXZEGvW+1LLpXQ04aw2YvvtKrfMUJI9aZOxxt/Ace+ZTbalcsWKpdrevOwMWZsadPNDLA6on4ZD1rD3Uyie7d2lMEnTQtWbl56uJBTOZi19MV0aiK0SnnpctIZGCtwq/1j22GlsHM726yHnBuZFmHIUT6ZZvkgp7IXm/155sRllAptP64+jOH9rm48bcn6vdyWiPf7eqcSbzNCV7IWceXY90pfGKwQBsMiAwrBxA6GlEsGNYpM2N/X0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8169.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199015)(478600001)(966005)(7696005)(26005)(9686003)(71200400001)(53546011)(6506007)(8676002)(66556008)(38070700005)(76116006)(4326008)(38100700002)(52536014)(66446008)(64756008)(41300700001)(66476007)(66946007)(122000001)(8936002)(5660300002)(83380400001)(186003)(33656002)(86362001)(316002)(54906003)(110136005)(2906002)(15650500001)(4001150100001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzVFMHBScTNKeGR0QUFnTmxiTzFocnNMK0FQT1QrUG1GcUcySS9RRDZzM3dC?=
 =?utf-8?B?ekxDTlkybGZpdHhNc096MnpmYVRtWlpTQk90TGpIT09DbllTRlVuU3lvTW9R?=
 =?utf-8?B?eHdsQW1WVkZnMHhKWUtPTDNWbjNQUURYejNPRVRXWjFHRWx6ay9qN1FZajZt?=
 =?utf-8?B?NUZsQlBzOWYvL1hqYWVWeDd3aURxdm9DeEhMYXB0Z1ZwamI2UFRISzh4bWlq?=
 =?utf-8?B?elBBZlhDdEtrd2kyWHJKZE1OUDZoT1JuOE9iMTVSbFgyamhPODlHZWRSMy91?=
 =?utf-8?B?cDEvSUpaS21EdlNWcFVhbm1CTHZ1VHRudlNFOEFmT3o5ZzhqV1p1V0xjT2ho?=
 =?utf-8?B?SHB4aFA5TWpSSGpud25wSjZ0TlNyZGFEV2g4VU5JbS8yT3Q2UUtjbk45M21p?=
 =?utf-8?B?aWtjS3ZvSmpSUXdCQko5QXJuNUdGZ0hTcUtlL1M0Uy96cVFGQVI4b2lmak1n?=
 =?utf-8?B?UHN4ZzhOSUFIeUc1bmpJRkRFbkd2Z3B6WUZYcXZiVG8xR3psMmlHWVNwUTRq?=
 =?utf-8?B?Vk5tckFJM1RIelRkRHlXTTYrdDRLQ3ViM1pWcWkzMXdvR0NQNmVwUkVDSHMx?=
 =?utf-8?B?QzZxcWthV2xWbTYzOEFmOUlQQisyMTF3L21TTTRESllRWnpTV0MrVnVZeFZo?=
 =?utf-8?B?TGZHZkxQU3JtdkNhRFZSeGlTZll3dlNxUk8rbzFyT056VEFPait4SklPcVJt?=
 =?utf-8?B?VmIrNjBCUk5EajRmUUtYS0hBUEFLbVJMZkJoRlU3TTltZnp4WGVRejVHTUc4?=
 =?utf-8?B?bStuaEF5NGwrTlpXWHA3cGJCNUtFMDIvMzhGUGYyQ2tMQUt1T05Va3hPMW54?=
 =?utf-8?B?ejlXdnkxbjFrQnhiVWxzVmE3TmZPcmtEcHZ4RHlPKzAzTXN3c2hudUJaVDlZ?=
 =?utf-8?B?SDJ0eHRhQ3k0eXIrUXllS3RZMzNTTXJaN3piTitQYXh1MlBpYUMwSFVNbWs0?=
 =?utf-8?B?ckw3WXhleFozMGdLNTdJQW5pYXZRb01TNnNVM3RoaEdONk5VUG5VSkhkajJp?=
 =?utf-8?B?ZUR1VHlJWFYwYmsrMStyaTFUQjR4NTBCaVhWT1IvcjBCbm5vTmk3c21rMVFh?=
 =?utf-8?B?Smozd2xvMnVJT2gyck4yWU14STlQZmo4c2RjSGpkcnR1RlR5bU10QTl4d3pI?=
 =?utf-8?B?RGtYbTllek53NCtVMExONTN2UDRtWXFtb3FsQjZoZkp4SWhjSmFaOEZBbWVX?=
 =?utf-8?B?SmlMNVM4U3dueUJWUC9BWGVmTE5tek1TdlJyQ0dBc1ZIS05veDIwVzdPRndm?=
 =?utf-8?B?K1BHVWtmUDRpVzhEUGwya2E2R1ZzZUdRa3RFa3owZWNiSTNGZkdBeSsvVjVT?=
 =?utf-8?B?Q3dCNVJ4enNqL3Q1T0huWGd0eDEyQW1Pek1CSldSa0creVRJamo3MWRZdnJt?=
 =?utf-8?B?TXRnWmF4S0JMdE5QSjFoTzdvOVJIS1g2SmROeWh6UVgxSkIyd0tZclZ6U0FP?=
 =?utf-8?B?WjFCVzlsU2JtRmh4QitwNGRSeEJhenV4NENpbkxrQ0ZuYkl0Rkd0amxxYjh1?=
 =?utf-8?B?bGdQem94a0F4UytlRXhmVGNwVTN6VUlzUG1YektlakxrWGcyTngwWlI5SlRZ?=
 =?utf-8?B?V3FJZjdmRjRyRkk2aWxrMHl5dEgxRGllQ1AvbGExOFNRT1djS1hNQWl1WDJw?=
 =?utf-8?B?aUR0SFlDTTMxdmlrSjlmR1VXaEJVSGZSK09ubG9BbTc3dkY4MThPTkdoVFJO?=
 =?utf-8?B?RVN0NUdXZ0FOWFkwUlFrQXBwZDJpWUFWOGxWQ0JqUEdleU1hcXdSd3ArQzBJ?=
 =?utf-8?B?UGRKSnlLVFhCaFpIQzB0dVU1bEVzbENLM3RFelJEc3NzQkNFWjBjL1hrbGUv?=
 =?utf-8?B?aWN1dHRhZ0NlT29QZTJ4ZFlIbU5MZVI3a2lVYy9uY3ovckMyR0RWMEdFcTJn?=
 =?utf-8?B?UVpVMnlVU0ZDRTFkcms2QUxjVjM0OEpmWFZTMTRsQ3VQV0dPRGRUTU4zQzlu?=
 =?utf-8?B?NXRhYkF3dDlXYThTdUJ6QlpnS1Y3dVdQYnhIdEFXc2VwUHplQ1UrVUJRQUdG?=
 =?utf-8?B?ZDBjVVIxM0lFL24yLzhQOTNja3BWbmRrRlRxOXhtQWo2LzBERXJBQXp0TS9h?=
 =?utf-8?B?dDg4V3V5RkkxZ1E0S05IczhFajR5RG1XTDdPOTNkMUlGcnhEeENVcWdPSWN0?=
 =?utf-8?B?SE9YdTNZbEdFcW0xSGRTaVhUR3djbHJ4WXB0VGhrMHhMQnk4bDBlT2dBd25i?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8169.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 614827b7-6594-496e-fe49-08dab7229e00
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2022 07:20:53.3827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FReGrT0YomYAw3XbrTd1EPVmgQ5rPhmmYSrtWQ7TlynklwSPuhHv6vGg7fpIgdt1ln02JEmKSIdrcvY6aWkCbrV7XgQ2CCh0mcbMvyx0HG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6698
X-Proofpoint-ORIG-GUID: NPMxEQfmDyuzRp77ajbQ8tuqE086t5t-
X-Proofpoint-GUID: NPMxEQfmDyuzRp77ajbQ8tuqE086t5t-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_04,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210260040
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgTmF0aGFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5hdGhh
biBIZWJlcnQgPG5oZWJlcnRAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9i
ZXIgMjYsIDIwMjIgMzoyNCBBTQ0KPiBUbzogZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnDQo+
IENjOiBsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnOyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVs
Lm9yZzsgQmpvcm4NCj4gQW5kZXJzc29uIDxhbmRlcnNzb25Aa2VybmVsLm9yZz47IEZyaXR6IEtv
ZW5pZyA8ZnJrb2VuaWdAY2hyb21pdW0ub3JnPjsNCj4gVmlrYXNoIEdhcm9kaWEgPHZnYXJvZGlh
QHF0aS5xdWFsY29tbS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUFVMTCBWNF06IHFjb206IFNDNzE4
MCBhbmQgU0M3MjgwIHZlbnVzIGZpcm13YXJlIHVwZGF0ZXMNCj4gDQo+IFdBUk5JTkc6IFRoaXMg
ZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5
IG9mDQo+IGFueSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFjcm9z
Lg0KPiANCj4gT24gVHVlLCBPY3QgMjUsIDIwMjIgYXQgMjo0OCBQTSBEbWl0cnkgQmFyeXNoa292
DQo+IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gT24gMjYv
MTAvMjAyMiAwMDozMiwgTmF0aGFuIEhlYmVydCB3cm90ZToNCj4gPiA+IFRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyBzaW5jZSBjb21taXQNCj4gNDg0MDdmZmQ3YWRiOTUxMTcwMTU0NzA2OGIxZTZmMDk1
NmJkMWM5NDoNCj4gPiA+DQo+ID4gPiAgICBjbm06IHVwZGF0ZSBjaGlwcyZtZWRpYSB3YXZlNTIx
YyBmaXJtd2FyZS4gKDIwMjItMTAtMTcgMTA6MjA6NDMNCj4gPiA+IC0wNDAwKQ0KPiA+ID4NCj4g
PiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiA+ID4NCj4gPiA+
ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9uYXRoYW4tZ29vZ2xlL2xpbnV4LWZpcm13YXJlLmdpdA0K
PiA+ID4gdXBkYXRlX3NjNzE4MF9hbmRfc2M3MjgwX2Zpcm13YXJlX3Y0DQo+ID4gPg0KPiA+ID4g
Zm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQo+IDA1ZGY4ZTY1MTgyZjdlZTk0NWY4MjZl
NDFiNWVhYTE3YzE4OGE4ZGY6DQo+ID4gPg0KPiA+ID4gICAgcWNvbTogdXBkYXRlIHZlbnVzIGZp
cm13YXJlIGZpbGVzIGZvciBWUFUtMi4wICgyMDIyLTEwLTI1DQo+ID4gPiAxNDoxNjo1OSAtMDcw
MCkNCj4gPiA+DQo+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiBOYXRoYW4gSGViZXJ0ICg0KToNCj4gPiA+
ICAgICAgICBxY29tOiByZXBsYWNlIHNwbGl0IFNDNzE4MCB2ZW51cyBmaXJtd2FyZSBpbWFnZXMg
d2l0aCBzeW1saW5rDQo+ID4gPiAgICAgICAgcWNvbTogdXBkYXRlIHZlbnVzIGZpcm13YXJlIGZp
bGUgZm9yIHY1LjQNCj4gPiA+ICAgICAgICBxY29tOiByZW1vdmUgc3BsaXQgU0M3MjgwIHZlbnVz
IGZpcm13YXJlIGltYWdlcw0KPiA+ID4gICAgICAgIHFjb206IHVwZGF0ZSB2ZW51cyBmaXJtd2Fy
ZSBmaWxlcyBmb3IgVlBVLTIuMA0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IERtaXRyeSBCYXJ5c2hr
b3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4gPg0KPiA+IFBsZWFzZSBleGN1c2Ug
bWUgZm9yIGJlaW5nIHRvbyBwaWNreS4NCj4gTm8gd29ycmllcyEgVGhhbmtzIGZvciBoZWxwaW5n
IG1lIGdldCB0aGUgY2hhbmdlIHJpZ2h0Lg0KDQpSZXZpZXdlZC1ieTogVmlrYXNoIEdhcm9kaWEg
PHF1aWNfdmdhcm9kaWFAcXVpY2luYy5jb20+DQoNCj4gPg0KPiA+IC0tDQo+ID4gV2l0aCBiZXN0
IHdpc2hlcw0KPiA+IERtaXRyeQ0KPiA+DQo=
