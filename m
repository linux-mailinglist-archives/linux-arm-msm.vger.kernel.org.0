Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BC165323B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Dec 2022 15:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbiLUOKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Dec 2022 09:10:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbiLUOKP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Dec 2022 09:10:15 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F1B220EC;
        Wed, 21 Dec 2022 06:10:13 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BLCH4mf030785;
        Wed, 21 Dec 2022 14:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=gtRv6Jzy2Z4VkM3px0hIYOokIcd1s9aURgewvZy6gJg=;
 b=Qp7uBWtPreHMACOaA0otRlifg05hqrsYvJkGmfP7/RRgweDnIR91DbfBfbaSpeYW2/F5
 IL5s7CZK1k75zuJSWy793W9AYUp+SiieEPMZWxj78u7HAI+1MCMKHBKwaWFgLtGRCR/K
 7qTllk9BfQ6qjy3k3bOttchjg8NH0JtvfayXkeQftX4cMXQ85RI+LFLZ0Mz56t9bbIqd
 KTApt4oDZndHFzSS+BeDVJpQwnad+kYs3OWvW6FQJDwop4VEBC4ZYTEKdMnxSbkMN5OM
 +43vQJJ4UF9i5kSAMQkgg5XCZG8Ym4uFHmScwn0tVK+AlV/cPM6WvIFaIymS/9+/C4zL 3Q== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mkcxvayhv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Dec 2022 14:10:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7Th20bn2mhmOOq3KbosWTNPPfOT4ToWzcX8qvpCKFn9BG9PW92dWtOcG4mOKcbWrmQ9JFL3maAI8IKG3QruBd1ZxXVe/BKfqufoEb4TJByvzIDCyu0ffJmuLBnKpYBvneWN8YnCeeS5uAQykRgguZKjOsg2+Xl2uFRE7FGgXAVDDR0jvfwH2yxMWGFX/oz2EH0zkfnK4P5jUI3mTnL97hRlSA7AlmlFrGS1otlA6NTNuwyMKsoJ6s5y6W78SIUtEgcQA/0+QUSgHu/DKM5pNTG1kfhhB/L/GLyev8X1Z6cvCfYxVXnCwRkGGDhdig3ZCS0VjxqXUavMtWMIZA2YYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtRv6Jzy2Z4VkM3px0hIYOokIcd1s9aURgewvZy6gJg=;
 b=hSx0Qu/XERGq1mjvofIh6MNKdnsH4720nl7fwptIBIwUaYjjkrqEFPcK3GI7iw4QB9oDT2tS+cylXXZQ9NHrxyjqbivuLZkkPNTRxOjExu0XjBp2yVfIvedY1wivFOHqyaz/ccksyYQvObzBq9xdnXkgQ9KVpltMcLyBLTujip0UPm8SuwZsLy0bmCvnWDji5eeU3ayaWI9mukYxpS4DaPnIJyxRoNEIsDcO1gbqiDWePxnBs3euj0xaINkgU8nevJ/lLuszqG89pMifWiSjiryTHRbQdbNRvOJB/4r2O/mFQFVBEmyfNeBKu2bbXXiCPDtAsimW5bVWxn/U4ZCIVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by DM6PR02MB6988.namprd02.prod.outlook.com (2603:10b6:5:22c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 14:10:05 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::d5de:8903:d3c3:8436]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::d5de:8903:d3c3:8436%5]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 14:10:05 +0000
From:   Vinod Polimera <vpolimer@qti.qualcomm.com>
To:     "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "dianders@chromium.org" <dianders@chromium.org>,
        "swboyd@chromium.org" <swboyd@chromium.org>,
        "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        "Vishnuvardhan Prodduturi (QUIC)" <quic_vproddut@quicinc.com>,
        "Bjorn Andersson (QUIC)" <quic_bjorande@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v9 01/15] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
Thread-Topic: [PATCH v9 01/15] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
Thread-Index: AQHZD6O7UUOWi/ZRbEiIIfuKZzCiQ65tg+yAgArn7aA=
Date:   Wed, 21 Dec 2022 14:10:05 +0000
Message-ID: <BN0PR02MB8173B06FA578D6BC22AC6424E4EB9@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1671012352-1825-1-git-send-email-quic_vpolimer@quicinc.com>
 <1671012352-1825-2-git-send-email-quic_vpolimer@quicinc.com>
 <7ad7654a-b0a0-c08a-d111-cd34d38c36e0@linaro.org>
In-Reply-To: <7ad7654a-b0a0-c08a-d111-cd34d38c36e0@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|DM6PR02MB6988:EE_
x-ms-office365-filtering-correlation-id: eaeb0bef-b9a8-4e82-06f2-08dae35d0f17
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jd1l0m+Mevjjitp4yYAXUd7SOQpBsHGY+AyH+xPLV1s49HhPgV98F+RStD3rRsBUGd3fjKUe9uBvU/HTNjY3LYKbggb0bVpsPi9g+wKgPhEXRFi3hW4Kjmz+qjqLl1yq2csTTf60ZvzFcrDj3ivxENY0gQYVPkkGQwlbllUJm+6WlK64UnF+6xMG7RaV6LjxbHmH5fefcMLRMybKl/HGojZ4HvxmmvBGYh7C3ZUX0jPoOUJ3dB6TQoQrCBBqlTkIhPWZPvEl3Ecf15vS+D+Cd8Jt4EzfHTHCVxK/ioDa2EJoXktxWEp5KysgLv8rPhxqMYfEZNToHbKPxPuDN+UJFOXlibm0iqgLZxpfhDZ0i0vsPYG1G1gxOVUi0drYkriSvVRSHwW36LwhfWj7cViNfnTBsg63Nx7OhakD92ns4Q518YS6TRTa0GdYq0PxbBCQz1uZemsVROKGGhMgRGIzFskiADiSoOCdy/xF7mx7k/qol808HYLREj7JsExcj4qcQoygBYbEGiETNn6kofXG3uVqmIXa/hKrW9ZTxOuaZYdwdXiVfZkQSUY6xtZeYdVss+jXKWDQ5h7IJg5iBnPOjR0UMxyc2/ezuogMU0PmBSSXW+Y2eXKTGE30SgIa5JYnXnQJrunhEF/TJ15f6nIeZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR02MB8173.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199015)(5660300002)(71200400001)(33656002)(55016003)(38100700002)(2906002)(122000001)(53546011)(38070700005)(8936002)(83380400001)(110136005)(66946007)(41300700001)(86362001)(52536014)(186003)(66556008)(26005)(9686003)(8676002)(66446008)(66476007)(4326008)(478600001)(64756008)(316002)(966005)(7696005)(54906003)(6506007)(76116006)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VklucjJMemJrMlNnbVdjYTJNa1ZuSUhidVVJUlZxVW04YndaWEdYZHZJU0dn?=
 =?utf-8?B?RFZqTGR1b1RqSEtsVmRMcE5vcHVtMDRtSEpETC8wWElYSEVHVVRPbFBzbTF2?=
 =?utf-8?B?YTZrOHNKMThIL1hVemFQKzZnYXl2bkpuc3hwZk9XS2dJRTI4NDBWYmpGUHFm?=
 =?utf-8?B?cGlxcmE4QXdZRThQc2QzTmdZWEtpQURaM0ZRUTA5bkw5cWdEYVRGdTZVOU1q?=
 =?utf-8?B?bUI1cng5YU4zekNmSUdIZmdDWWVjWE5OVHByQ1BSVEVRK2hWTU9FOXBrdnFJ?=
 =?utf-8?B?Yi9uRi94QWNXandWL284eklYMDJBT1RDQktteXA1UE5ma0k4dmJTbUoxeFJv?=
 =?utf-8?B?SDFaM1kxbjJRVlpoU09CSEhwUFRHdHVRdjF0WVdCZWJVU3FXY3J3RDJLOVp6?=
 =?utf-8?B?QjFjbHgraUR4dEVCSlBWUzdUd09HNnQrMGxYcVhua1pxMG9HQ0hORll6NElj?=
 =?utf-8?B?VWh4QUxWLzBweDJxdVdPblVYVzdabjdnQTI4QkNLOVg3WjlFSVl1MjR3SVRP?=
 =?utf-8?B?VW84SzFjWHZUdUVTcDl2clBxTHduZnBGMlY3SFRORHU0ZUtDREp5TlgrcFMv?=
 =?utf-8?B?UVdSZXBaMDluck9MZUk2VDF0bGF2cGZpN2hjVUJ6bTF5QlpIa3dPZFBHTjBY?=
 =?utf-8?B?cXlhZmJSS0tpUmRsVThubk9XeFRWNm91OE55L3dQeW9BZTFYQjNOOTY4Ykw1?=
 =?utf-8?B?SGpLUUpvckVOeGJNdWF4cG5GL1hRRXpvVGNQSHJ4U0crZlVlTEkwdUcxOVZ1?=
 =?utf-8?B?VmpubEE4K1RBYnhsYVhiNDVYa1FVem1QUENVRDFpTER5VDBJRmhXWmt2UERB?=
 =?utf-8?B?dEQwa2luZkxKNkNNSUpEdE5vN1dHUzlEczNZRjRXSjNIOFVoUjBvaS94UURr?=
 =?utf-8?B?Q3ZXQ1RHVnRhRkdRYmRRekFXWkhyTTNEbUtzT0ZkWW5nb2RhM0VGTXF2VS9S?=
 =?utf-8?B?MzJ5SlBEY2FUR0x5WFgzUWdKSk5MYXRNZUYzd0RLM0xzNndDT0Z0a0pGRWNW?=
 =?utf-8?B?clRXQjNtdVZ3Y01JeGVieGgxeS8xeUZaRGZCUER0d2prNmljWW5IQmd5VWRo?=
 =?utf-8?B?ZXR5enpCZXdBOW5Lam4xbE43d3RIb1EyWDgyMTlsZklUQVl1dHh2MEJIbE5P?=
 =?utf-8?B?TG9IRVN0R3g4U1BITGIveVNaTzNpbjBOZUZHcXl4YjNXcVBXNXlCY2RlRnI4?=
 =?utf-8?B?c0xOUC9oR1dNRmpOVUxiaGxHcnJuN21US2JLVndVUjdjUGk1ZkN2MjRkVGVm?=
 =?utf-8?B?ZnROTnBPZE5iRGd5YjJ4Q1A1N2wweFI2alFtN2FrQXEwaVlabE4ydHJ4eGRH?=
 =?utf-8?B?cFFOVG1RQkJaMmY3QzNEM0lKbXlxN1FxWUFyY2ljZi9Oc2pZUkpWOWZ2c1pS?=
 =?utf-8?B?MjRSZlljRmFhUVA3cWNFdmthK1F5YkFsUkIvZDVRS0l1Mml5UEFFcGVsSWlv?=
 =?utf-8?B?TnZiQVRUQm9WRE92dlRvS0k1MTJwbVFibnZZQk4rUDJZdDVKOHVGT2lXT29T?=
 =?utf-8?B?TndjeEtJbzlTZS8zc0E3RGNBVlhDc1UvTDBCbXlOUmRSTzl3ZVZCSTF5Vk5i?=
 =?utf-8?B?cUM4OTZ0Q2M1dU9LWTBLR0VxOUQ1UjRvOURWTU4yTDAxWnBDQnQzTEdBdDJx?=
 =?utf-8?B?ekJCRFpTQU96d2VRdjZGdWp4Z3VZcUZPV3VXampVRDhSMUMzamt0bXhZN245?=
 =?utf-8?B?M0krZ092T1lqcWthY29maXJvUkdQRU1CM0hVZDNOSmlLdU02RVlZNGl1bXZm?=
 =?utf-8?B?a0pzWlRSZ1ZjQTAxZWRGcDJRL3l2SnBUdlVOaUZhTmZteThTNFpDcWpjRjd5?=
 =?utf-8?B?VkVtZE5NT0FBNmwyU290elBxZkFVTExjd1kvWVpTSFJSd0dnKyt3NWNIOTFV?=
 =?utf-8?B?NHNJdVh4dGxnTG9ZZG9VRTJaSkhLVnZRWlZ3M2ZBUytoVUF6RElSNXdhNTVi?=
 =?utf-8?B?RjZFQzB4Z1luQU1yZ2p4NDFiV2tsZHlYVnhlUTVyQ1cwRnNLc1lzSGRmTVF5?=
 =?utf-8?B?ekJIeWZYdWlUMDVBSjdPM1JpZXN3cVI5WWJJSjc1STd6ZDdoSXFoVmY5MDlW?=
 =?utf-8?B?NDlLUkt4djlxa1ZrQ3gvUU51UjY2c3pSNEVFTFFrV3c3eGxZZTZlQmhOeDlu?=
 =?utf-8?B?OUdMd0swek1uU0JKbmlhN2dYN0NicHhaTTRCbkV0azhMc0JjOW00R3U4TjNM?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaeb0bef-b9a8-4e82-06f2-08dae35d0f17
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 14:10:05.0665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7f2zcPd9E78k6DsvoAFFB0Q/ON1cjQkzK3rwEJ7DWQ2bneKbyidhnR1u5PCPV6lXFb1beNz+kqyfZXcGYujKCxPLZy4rMbrdvLmzz2jMpfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6988
X-Proofpoint-GUID: jPZnvK3K-Wc3z00P2u2NETwhMP53L28E
X-Proofpoint-ORIG-GUID: jPZnvK3K-Wc3z00P2u2NETwhMP53L28E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_07,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=933 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210118
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIERlY2Vt
YmVyIDE0LCAyMDIyIDk6MDUgUE0NCj4gVG86IFZpbm9kIFBvbGltZXJhIChRVUlDKSA8cXVpY192
cG9saW1lckBxdWljaW5jLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsNCj4gZnJlZWRyZW5vQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IHJvYmRjbGFya0BnbWFpbC5jb207DQo+IGRpYW5kZXJzQGNocm9t
aXVtLm9yZzsgc3dib3lkQGNocm9taXVtLm9yZzsgS2FseWFuIFRob3RhIChRVUlDKQ0KPiA8cXVp
Y19rYWx5YW50QHF1aWNpbmMuY29tPjsgS3VvZ2VlIEhzaWVoIChRVUlDKQ0KPiA8cXVpY19raHNp
ZWhAcXVpY2luYy5jb20+OyBWaXNobnV2YXJkaGFuIFByb2RkdXR1cmkgKFFVSUMpDQo+IDxxdWlj
X3Zwcm9kZHV0QHF1aWNpbmMuY29tPjsgQmpvcm4gQW5kZXJzc29uIChRVUlDKQ0KPiA8cXVpY19i
am9yYW5kZUBxdWljaW5jLmNvbT47IEFyYXZpbmQgVmVua2F0ZXN3YXJhbiAoUVVJQykNCj4gPHF1
aWNfYXJhdmluZGhAcXVpY2luYy5jb20+OyBBYmhpbmF2IEt1bWFyIChRVUlDKQ0KPiA8cXVpY19h
YmhpbmF2a0BxdWljaW5jLmNvbT47IFNhbmtlZXJ0aCBCaWxsYWthbnRpIChRVUlDKQ0KPiA8cXVp
Y19zYmlsbGFrYUBxdWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OSAwMS8xNV0g
ZHJtL21zbS9kaXNwL2RwdTogY2xlYXIgZHB1X2Fzc2lnbl9jcnRjIGFuZA0KPiBnZXQgY3J0YyBm
cm9tIGNvbm5lY3RvciBzdGF0ZSBpbnN0ZWFkIG9mIGRwdV9lbmMNCj4gDQo+IFdBUk5JTkc6IFRo
aXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3
YXJ5DQo+IG9mIGFueSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFj
cm9zLg0KPiANCj4gT24gMTQvMTIvMjAyMiAxMjowNSwgVmlub2QgUG9saW1lcmEgd3JvdGU6DQo+
ID4gVXBkYXRlIGNydGMgcmV0cmlldmFsIGZyb20gZHB1X2VuYyB0byBkcHVfZW5jIGNvbm5lY3Rv
ciBzdGF0ZSwNCj4gPiBzaW5jZSBuZXcgbGlua3MgZ2V0IHNldCBhcyBwYXJ0IG9mIHRoZSBkcHUg
ZW5jIHZpcnQgbW9kZSBzZXQuDQo+ID4gVGhlIGRwdV9lbmMtPmNydGMgY2FjaGUgaXMgbm8gbW9y
ZSBuZWVkZWQsIGhlbmNlIGNsZWFuaW5nIGl0IGFzDQo+ID4gcGFydCBvZiB0aGlzIGNoYW5nZS4N
Cj4gPg0KPiA+IFRoaXMgcGF0Y2ggaXMgZGVwZW5kZW50IG9uIHRoZSBzZXJpZXM6DQo+ID4gaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMTA5NjkvDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBWaW5vZCBQb2xpbWVyYSA8cXVpY192cG9saW1lckBxdWljaW5jLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMg
ICAgfCAgNCAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNv
ZGVyLmMgfCA0MiArKysrKysrKystLS0tLS0tLS0NCj4gLS0tLS0tLS0tLS0NCj4gPiAgIGRyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmggfCAgOCAtLS0tLS0NCj4gPiAg
IDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMu
Yw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMNCj4gPiBpbmRl
eCAzZjcyZDM4Li4yODlkNTFlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9jcnRjLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfY3J0Yy5jDQo+ID4gQEAgLTEwMjksNyArMTAyOSw2IEBAIHN0YXRpYyB2b2lkIGRw
dV9jcnRjX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiA+ICAgICAgICAgICAgICAg
ICovDQo+ID4gICAgICAgICAgICAgICBpZiAoZHB1X2VuY29kZXJfZ2V0X2ludGZfbW9kZShlbmNv
ZGVyKSA9PSBJTlRGX01PREVfVklERU8pDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJlbGVh
c2VfYmFuZHdpZHRoID0gdHJ1ZTsNCj4gPiAtICAgICAgICAgICAgIGRwdV9lbmNvZGVyX2Fzc2ln
bl9jcnRjKGVuY29kZXIsIE5VTEwpOw0KPiA+ICAgICAgIH0NCj4gPg0KPiA+ICAgICAgIC8qIHdh
aXQgZm9yIGZyYW1lX2V2ZW50X2RvbmUgY29tcGxldGlvbiAqLw0KPiA+IEBAIC0xMDk5LDkgKzEw
OTgsNiBAQCBzdGF0aWMgdm9pZCBkcHVfY3J0Y19lbmFibGUoc3RydWN0IGRybV9jcnRjICpjcnRj
LA0KPiA+ICAgICAgIHRyYWNlX2RwdV9jcnRjX2VuYWJsZShEUk1JRChjcnRjKSwgdHJ1ZSwgZHB1
X2NydGMpOw0KPiA+ICAgICAgIGRwdV9jcnRjLT5lbmFibGVkID0gdHJ1ZTsNCj4gPg0KPiA+IC0g
ICAgIGRybV9mb3JfZWFjaF9lbmNvZGVyX21hc2soZW5jb2RlciwgY3J0Yy0+ZGV2LCBjcnRjLT5z
dGF0ZS0NCj4gPmVuY29kZXJfbWFzaykNCj4gPiAtICAgICAgICAgICAgIGRwdV9lbmNvZGVyX2Fz
c2lnbl9jcnRjKGVuY29kZXIsIGNydGMpOw0KPiA+IC0NCj4gPiAgICAgICAvKiBFbmFibGUvcmVz
dG9yZSB2YmxhbmsgaXJxIGhhbmRsaW5nICovDQo+ID4gICAgICAgZHJtX2NydGNfdmJsYW5rX29u
KGNydGMpOw0KPiA+ICAgfQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfZW5jb2Rlci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2VuY29kZXIuYw0KPiA+IGluZGV4IGE1ODUwMzYuLmI5YjI1NGQgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMNCj4gPiBAQCAtMTMy
LDExICsxMzIsNiBAQCBlbnVtIGRwdV9lbmNfcmNfc3RhdGVzIHsNCj4gPiAgICAqIEBpbnRmc19z
d2FwcGVkOiAgV2hldGhlciBvciBub3QgdGhlIHBoeXNfZW5jIGludGVyZmFjZXMgaGF2ZSBiZWVu
DQo+IHN3YXBwZWQNCj4gPiAgICAqICAgICAgICAgICAgICAgICAgZm9yIHBhcnRpYWwgdXBkYXRl
IHJpZ2h0LW9ubHkgY2FzZXMsIHN1Y2ggYXMgcGluZ3BvbmcNCj4gPiAgICAqICAgICAgICAgICAg
ICAgICAgc3BsaXQgd2hlcmUgdmlydHVhbCBwaW5ncG9uZyBkb2VzIG5vdCBnZW5lcmF0ZSBJUlFz
DQo+ID4gLSAqIEBjcnRjOiAgICAgICAgICAgIFBvaW50ZXIgdG8gdGhlIGN1cnJlbnRseSBhc3Np
Z25lZCBjcnRjLiBOb3JtYWxseSB5b3UNCj4gPiAtICogICAgICAgICAgICAgICAgICAgd291bGQg
dXNlIGNydGMtPnN0YXRlLT5lbmNvZGVyX21hc2sgdG8gZGV0ZXJtaW5lIHRoZQ0KPiA+IC0gKiAg
ICAgICAgICAgICAgICAgICBsaW5rIGJldHdlZW4gZW5jb2Rlci9jcnRjLiBIb3dldmVyIGluIHRo
aXMgY2FzZSB3ZSBuZWVkDQo+ID4gLSAqICAgICAgICAgICAgICAgICAgIHRvIHRyYWNrIGNydGMg
aW4gdGhlIGRpc2FibGUoKSBob29rIHdoaWNoIGlzIGNhbGxlZA0KPiA+IC0gKiAgICAgICAgICAg
ICAgICAgICBfYWZ0ZXJfIGVuY29kZXJfbWFzayBpcyBjbGVhcmVkLg0KPiA+ICAgICogQGNvbm5l
Y3RvcjogICAgICAgICAgICAgIElmIGEgbW9kZSBpcyBzZXQsIGNhY2hlZCBwb2ludGVyIHRvIHRo
ZSBhY3RpdmUNCj4gY29ubmVjdG9yDQo+ID4gICAgKiBAY3J0Y19raWNrb2ZmX2NiOiAgICAgICAg
ICAgICAgICBDYWxsYmFjayBpbnRvIENSVEMgdGhhdCB3aWxsIGZsdXNoICYgc3RhcnQNCj4gPiAg
ICAqICAgICAgICAgICAgICAgICAgICAgICAgICBhbGwgQ1RMIHBhdGhzDQo+ID4gQEAgLTE4MSw3
ICsxNzYsNiBAQCBzdHJ1Y3QgZHB1X2VuY29kZXJfdmlydCB7DQo+ID4NCj4gPiAgICAgICBib29s
IGludGZzX3N3YXBwZWQ7DQo+ID4NCj4gPiAtICAgICBzdHJ1Y3QgZHJtX2NydGMgKmNydGM7DQo+
ID4gICAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsNCj4gPg0KPiA+ICAgICAg
IHN0cnVjdCBkZW50cnkgKmRlYnVnZnNfcm9vdDsNCj4gPiBAQCAtMTMxNyw3ICsxMzExLDcgQEAg
c3RhdGljIHZvaWQgZHB1X2VuY29kZXJfdmJsYW5rX2NhbGxiYWNrKHN0cnVjdA0KPiBkcm1fZW5j
b2RlciAqZHJtX2VuYywNCj4gPiAgICAgICAgICAgICAgIHN0cnVjdCBkcHVfZW5jb2Rlcl9waHlz
ICpwaHlfZW5jKQ0KPiA+ICAgew0KPiA+ICAgICAgIHN0cnVjdCBkcHVfZW5jb2Rlcl92aXJ0ICpk
cHVfZW5jID0gTlVMTDsNCj4gPiAtICAgICB1bnNpZ25lZCBsb25nIGxvY2tfZmxhZ3M7DQo+ID4g
KyAgICAgc3RydWN0IGRybV9jcnRjICpjcnRjOw0KPiA+DQo+ID4gICAgICAgaWYgKCFkcm1fZW5j
IHx8ICFwaHlfZW5jKQ0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuOw0KPiA+IEBAIC0xMzI1LDEy
ICsxMzE5LDEzIEBAIHN0YXRpYyB2b2lkIGRwdV9lbmNvZGVyX3ZibGFua19jYWxsYmFjayhzdHJ1
Y3QNCj4gZHJtX2VuY29kZXIgKmRybV9lbmMsDQo+ID4gICAgICAgRFBVX0FUUkFDRV9CRUdJTigi
ZW5jb2Rlcl92YmxhbmtfY2FsbGJhY2siKTsNCj4gPiAgICAgICBkcHVfZW5jID0gdG9fZHB1X2Vu
Y29kZXJfdmlydChkcm1fZW5jKTsNCj4gPg0KPiA+IC0gICAgIGF0b21pY19pbmMoJnBoeV9lbmMt
PnZzeW5jX2NudCk7DQo+ID4gKyAgICAgaWYgKCFkcHVfZW5jLT5jb25uZWN0b3IgfHwgIWRwdV9l
bmMtPmNvbm5lY3Rvci0+c3RhdGUgfHwNCj4gPiArICAgICAgICAgIWRwdV9lbmMtPmNvbm5lY3Rv
ci0+c3RhdGUtPmNydGMpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm47DQo+ID4NCj4gPiAtICAg
ICBzcGluX2xvY2tfaXJxc2F2ZSgmZHB1X2VuYy0+ZW5jX3NwaW5sb2NrLCBsb2NrX2ZsYWdzKTsN
Cj4gPiAtICAgICBpZiAoZHB1X2VuYy0+Y3J0YykNCj4gPiAtICAgICAgICAgICAgIGRwdV9jcnRj
X3ZibGFua19jYWxsYmFjayhkcHVfZW5jLT5jcnRjKTsNCj4gPiAtICAgICBzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZkcHVfZW5jLT5lbmNfc3BpbmxvY2ssIGxvY2tfZmxhZ3MpOw0KPiA+ICsgICAg
IGF0b21pY19pbmMoJnBoeV9lbmMtPnZzeW5jX2NudCk7DQo+ID4gKyAgICAgY3J0YyA9IGRwdV9l
bmMtPmNvbm5lY3Rvci0+c3RhdGUtPmNydGM7DQo+ID4gKyAgICAgZHB1X2NydGNfdmJsYW5rX2Nh
bGxiYWNrKGNydGMpOw0KPiA+DQo+ID4gICAgICAgRFBVX0FUUkFDRV9FTkQoImVuY29kZXJfdmJs
YW5rX2NhbGxiYWNrIik7DQo+ID4gICB9DQo+ID4gQEAgLTEzNTMsMzMgKzEzNDgsMjIgQEAgc3Rh
dGljIHZvaWQNCj4gZHB1X2VuY29kZXJfdW5kZXJydW5fY2FsbGJhY2soc3RydWN0IGRybV9lbmNv
ZGVyICpkcm1fZW5jLA0KPiA+ICAgICAgIERQVV9BVFJBQ0VfRU5EKCJlbmNvZGVyX3VuZGVycnVu
X2NhbGxiYWNrIik7DQo+ID4gICB9DQo+ID4NCj4gPiAtdm9pZCBkcHVfZW5jb2Rlcl9hc3NpZ25f
Y3J0YyhzdHJ1Y3QgZHJtX2VuY29kZXIgKmRybV9lbmMsIHN0cnVjdA0KPiBkcm1fY3J0YyAqY3J0
YykNCj4gPiAtew0KPiA+IC0gICAgIHN0cnVjdCBkcHVfZW5jb2Rlcl92aXJ0ICpkcHVfZW5jID0g
dG9fZHB1X2VuY29kZXJfdmlydChkcm1fZW5jKTsNCj4gPiAtICAgICB1bnNpZ25lZCBsb25nIGxv
Y2tfZmxhZ3M7DQo+ID4gLQ0KPiA+IC0gICAgIHNwaW5fbG9ja19pcnFzYXZlKCZkcHVfZW5jLT5l
bmNfc3BpbmxvY2ssIGxvY2tfZmxhZ3MpOw0KPiA+IC0gICAgIC8qIGNydGMgc2hvdWxkIGFsd2F5
cyBiZSBjbGVhcmVkIGJlZm9yZSByZS1hc3NpZ25pbmcgKi8NCj4gPiAtICAgICBXQVJOX09OKGNy
dGMgJiYgZHB1X2VuYy0+Y3J0Yyk7DQo+ID4gLSAgICAgZHB1X2VuYy0+Y3J0YyA9IGNydGM7DQo+
ID4gLSAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHB1X2VuYy0+ZW5jX3NwaW5sb2NrLCBs
b2NrX2ZsYWdzKTsNCj4gPiAtfQ0KPiA+IC0NCj4gPiAgIHZvaWQgZHB1X2VuY29kZXJfdG9nZ2xl
X3ZibGFua19mb3JfY3J0YyhzdHJ1Y3QgZHJtX2VuY29kZXINCj4gKmRybV9lbmMsDQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
IGJvb2wgZW5hYmxlKQ0KPiA+ICAgew0KPiA+ICAgICAgIHN0cnVjdCBkcHVfZW5jb2Rlcl92aXJ0
ICpkcHVfZW5jID0gdG9fZHB1X2VuY29kZXJfdmlydChkcm1fZW5jKTsNCj4gPiAtICAgICB1bnNp
Z25lZCBsb25nIGxvY2tfZmxhZ3M7DQo+ID4gKyAgICAgc3RydWN0IGRybV9jcnRjICpuZXdfY3J0
YzsNCj4gPiAgICAgICBpbnQgaTsNCj4gPg0KPiA+ICAgICAgIHRyYWNlX2RwdV9lbmNfdmJsYW5r
X2NiKERSTUlEKGRybV9lbmMpLCBlbmFibGUpOw0KPiA+DQo+ID4gLSAgICAgc3Bpbl9sb2NrX2ly
cXNhdmUoJmRwdV9lbmMtPmVuY19zcGlubG9jaywgbG9ja19mbGFncyk7DQo+ID4gLSAgICAgaWYg
KGRwdV9lbmMtPmNydGMgIT0gY3J0Yykgew0KPiA+IC0gICAgICAgICAgICAgc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmZHB1X2VuYy0+ZW5jX3NwaW5sb2NrLCBsb2NrX2ZsYWdzKTsNCj4gPiArICAg
ICBpZiAoIWRwdV9lbmMtPmNvbm5lY3RvciB8fCAhZHB1X2VuYy0+Y29ubmVjdG9yLT5zdGF0ZSkN
Cj4gPiArICAgICAgICAgICAgIHJldHVybjsNCj4gPiArDQo+ID4gKyAgICAgbmV3X2NydGMgPSBk
cHVfZW5jLT5jb25uZWN0b3ItPnN0YXRlLT5jcnRjOw0KPiA+ICsgICAgIGlmICghbmV3X2NydGMg
fHwgbmV3X2NydGMgIT0gY3J0Yykgew0KPiANCj4gSSBkb24ndCBsaWtlIGdvaW5nIHRocm91Z2gg
YWxsIHRoZSBwb2ludGVycyBhbmQgc3RhdGVzIHdpdGhvdXQgbG9ja3MuDQo+IFRoZSBjb25uZWN0
b3ItPnN0YXRlIGNhbiBwb3RlbnRpYWxseSBjaGVjay4gU28sIEknZCBwcm9wb3NlIGV2ZW4gc2lt
cGxlcg0KPiBzb2x1dGlvbjoganVzdCBzdG9yZSB0aGUgY3J0YyBpbiB0aGUgZHB1X2VuYyBhdCB0
aGUgY3JlYXRpb24gdGltZS4gVGhlbg0KPiB5b3UgY2FuIHVzZSB0aGUgcmVzdCBvZiB0aGUgY3Vy
cmVudCBkcHVfZW5jLT5jcnRjIGFzIGV4cGVjdGVkLg0KDQpDYW4gaSBkbyBhcyBiZWxvdy4NCkFm
dGVyIGVuY29kZXIgdG8gY3J0YyBpcyBwaW5uZWQsIGkgY2FuIHVwZGF0ZSBkcHVfZW5jb2RlciBz
dHJ1Y3R1cmUgdGhhdCBpcyBhdHRhY2hlZCB3aXRoIGRybV9lbmMgd2l0aCB0aGUgY3J0YyBjcmVh
dGVkIGR1cmluZyBkcm1fb2JqX2luaXQNCg0KQEAgLTgxNiw2ICs4MTYsNyBAQCBzdGF0aWMgaW50
IF9kcHVfa21zX2RybV9vYmpfaW5pdChzdHJ1Y3QgZHB1X2ttcyAqZHB1X2ttcykNCiAgICAgICAg
ICAgICAgICB9DQogICAgICAgICAgICAgICAgcHJpdi0+Y3J0Y3NbcHJpdi0+bnVtX2NydGNzKytd
ID0gY3J0YzsNCiAgICAgICAgICAgICAgICBlbmNvZGVyLT5wb3NzaWJsZV9jcnRjcyA9IDEgPDwg
ZHJtX2NydGNfaW5kZXgoY3J0Yyk7DQogICAgICAgICAgICAgICsgZHB1X2VuY29kZXJfYXNzaWdu
X2NydGMoZW5jb2RlciwgY3J0Yyk7DQogICAgICAgICAgICAgICAgaSsrOw0KICAgICAgICB9DQoN
ClRoYW5rcywNClZpbm9kIFAuDQo+IA0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuOw0KPiA+ICAg
ICAgIH0NCj4gPiAtICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkcHVfZW5jLT5lbmNfc3Bp
bmxvY2ssIGxvY2tfZmxhZ3MpOw0KPiA+DQo+ID4gICAgICAgZm9yIChpID0gMDsgaSA8IGRwdV9l
bmMtPm51bV9waHlzX2VuY3M7IGkrKykgew0KPiA+ICAgICAgICAgICAgICAgc3RydWN0IGRwdV9l
bmNvZGVyX3BoeXMgKnBoeXMgPSBkcHVfZW5jLT5waHlzX2VuY3NbaV07DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmgNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5oDQo+ID4gaW5kZXggN2YzZDgy
My4uZWI5ZmM3YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfZW5jb2Rlci5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2VuY29kZXIuaA0KPiA+IEBAIC00MCwxNCArNDAsNiBAQCBzdHJ1Y3QgbXNtX2Rpc3BsYXlf
aW5mbyB7DQo+ID4gICB9Ow0KPiA+DQo+ID4gICAvKioNCj4gPiAtICogZHB1X2VuY29kZXJfYXNz
aWduX2NydGMgLSBMaW5rIHRoZSBlbmNvZGVyIHRvIHRoZSBjcnRjIGl0J3MgYXNzaWduZWQgdG8N
Cj4gPiAtICogQGVuY29kZXI6IGVuY29kZXIgcG9pbnRlcg0KPiA+IC0gKiBAY3J0YzogICAgY3J0
YyBwb2ludGVyDQo+ID4gLSAqLw0KPiA+IC12b2lkIGRwdV9lbmNvZGVyX2Fzc2lnbl9jcnRjKHN0
cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgZHJtX2NydGMgKmNydGMpOw0KPiA+IC0NCj4gPiAtLyoqDQo+ID4gICAgKiBkcHVf
ZW5jb2Rlcl90b2dnbGVfdmJsYW5rX2Zvcl9jcnRjIC0gVG9nZ2xlcyB2YmxhbmsgaW50ZXJydXB0
cyBvbiBvcg0KPiBvZmYgaWYNCj4gPiAgICAqICB0aGUgZW5jb2RlciBpcyBhc3NpZ25lZCB0byB0
aGUgZ2l2ZW4gY3J0Yw0KPiA+ICAgICogQGVuY29kZXI6ICAgICAgICBlbmNvZGVyIHBvaW50ZXIN
Cj4gDQo+IC0tDQo+IFdpdGggYmVzdCB3aXNoZXMNCj4gRG1pdHJ5DQoNCg==
