Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 632906A86E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 17:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjCBQjS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 11:39:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjCBQjP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 11:39:15 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0018C16315;
        Thu,  2 Mar 2023 08:38:43 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 322EjJ4I019664;
        Thu, 2 Mar 2023 16:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=xK8fFkV9olEXQKTzoXICC9FISn54ckJalYxINyDQ5T8=;
 b=VRJD6olBJPIHk4+qKZIBHRKzE2i5Ve/BbaUpNtemQfRAX0VNDDq+qWcDTv5dYUhVz5Yb
 ePmt5KNPB4sdU8cUcSI8RsaprjHeHQSoAjW/HJDdnoo+w4MeZ6hf+8nJftN+1Xr6Nh1i
 0I9nIwDADapeyU4r7v7RDfYn0ztqAit/wHvLfztooAYbKWgeko1cfzzwLAZRSDVLAp/F
 /ttI+UQFVcVZ8ZkubGOUAgCuaZoSmOqmtAhFs41RN0cga5d0++rXKVHUIAl2lZLStDYe
 UBE8x1AC5ymq4oNvnUJYIEcsipvDL8KOUvq1EB75pqFoaS7AcaTIJo9/t9QrqVY8Bt7l Qw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p25jwm5fr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Mar 2023 16:38:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5IB0p5hKy6nQ4NOGzL6dx7Ps1mVzQRARj211vx63pS8tu0iEPuiwYQZIuTrbHA6r0U03NRbMFpeEcdT8/0p8yRaWRh5MYKu5ahVJdbmLK9fCHnj6RZdBGd15vDCT/ObvwOxBChy806IkquiVfKdZbZUHY/m+X4pJJoA0SrW5e5jv8tbCzMp0iJkEHBkm6bNk1Ms/QDNiN8KpiA6LcL2SgtUTJ884kgyV6woLZkELhWdPBRfXSXtHF3+kxHTZ79dUxisgJF+BLwkCGjGWPiUQOcZQahgAq2jSmvFsQXT5vkIHdq/4UFoFoJ1ozCYwd8sIN4B4G2o9h65vcSElpse5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xK8fFkV9olEXQKTzoXICC9FISn54ckJalYxINyDQ5T8=;
 b=TR+7lecCXaqi8Aa/0i7vf7XTM7vdk8mDRDTD5ZiOK9PTpBXJs6GUOG4GYSX4bdkNU6Nvm02XwNyXnGY4zGaKqxFTPso7k3nTaJIjbiRSyYVm49egkGkv8vpw5dyaZBEZxtWt6JiF6Ni+IHl8Bzil3Gk0QXqEjJh7YRFAUAWa8+YBRPZ7dThv4Ey7nm3c/wyaam1ATbBcO/WbSvsTpTZ/JowsfxRxLfM511iowCOyh2ABSC6QSd5V7kJSoMzkIT141r6A2E4MbGIs+NrjAYGGXYU/2gwKTeD8C+ShgOAayTnDyuuUk89vFts3rMuE1vYz4wV2msLamgSCl3Spc0lVaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by BL0PR02MB6545.namprd02.prod.outlook.com (2603:10b6:208:1c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Thu, 2 Mar
 2023 16:38:37 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::b5e6:371c:98fc:7915]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::b5e6:371c:98fc:7915%7]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 16:38:37 +0000
From:   Vinod Polimera <vpolimer@qti.qualcomm.com>
To:     Doug Anderson <dianders@chromium.org>,
        "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>
CC:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "swboyd@chromium.org" <swboyd@chromium.org>,
        "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        "Vishnuvardhan Prodduturi (QUIC)" <quic_vproddut@quicinc.com>,
        "Bjorn Andersson (QUIC)" <quic_bjorande@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v13 00/13] Add PSR support for eDP
Thread-Topic: [PATCH v13 00/13] Add PSR support for eDP
Thread-Index: AQHZPv8oVsNSRLUTekW+gZyq39M1jK7mY9CAgAAX+YCAAVB10A==
Date:   Thu, 2 Mar 2023 16:38:36 +0000
Message-ID: <BN0PR02MB817364CB1B25F1B468FDA9F5E4B29@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1676219337-6526-1-git-send-email-quic_vpolimer@quicinc.com>
 <CAD=FV=XvjFQ-7KNsW2YQQ-LzJonCcHz_rj-oOhB0jh_99ficKA@mail.gmail.com>
 <CAD=FV=VD2V=NvNCotU_bLH4LuGEO8W8a0sH0uc--KsaUsneSFg@mail.gmail.com>
In-Reply-To: <CAD=FV=VD2V=NvNCotU_bLH4LuGEO8W8a0sH0uc--KsaUsneSFg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|BL0PR02MB6545:EE_
x-ms-office365-filtering-correlation-id: 67813852-7c1f-4daa-d45d-08db1b3c9245
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MWxr19F+NgDXoJvYdTWcyjwA0FG118e8/G8uMFN4M19znLWMNheRxdpho4OP35qmAKUf+4j72f0OSmJ1CLP78JDRdxtyeCWT6sRZcPnmNZPyIS/JzOHMVt/dBe61B2XEzGKhYz+goGVHMaIaT0INtdSCpZabXo8hMsA+cjcJCB6PX3aYdY487DiMQLmYDvrG+wvWOEY8rxLb++bsENGIFtdkJxbllvMkXGxvjvPWv9O1jx+ccs0+8jck0kYisyorjSfiU7F5Db8SQIJbfoW1FWDW2KEYNFILuzc4lYiMdJATui3s06yum0qB+jHLplqQdWIxhwxcU7ydgdUl56XUhVsD0Yk4eLEQzh4OgjYt8G3MLL5jHZfW9dAS80SowtnW1OwVmCGcZ31R72Mc6mk14IgFET9gm9TIj1VbF7AzKq0ut0T+2MWv9gZ85BTpeXoPHqjTQgeNvZkQnvwzwRCYcD07oIB+eyC0tMdzGazEUzzkav0AOY7rGiw4gMWe3Y7pX39281P2Ug1us/70MIkB++KBGLiXV2sGT1jJVb8qXazxIZHWHxWAyuwO7AvFL98oNHLUB2nPEkyxfx95vGmo1qcTDQjkKml1oKzWa8QnZ/C/RvilmN9VTYbDZikHDjM/GDDN7iD1m8WjWFLeFmzw1A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR02MB8173.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199018)(107886003)(53546011)(966005)(6506007)(186003)(9686003)(26005)(316002)(41300700001)(54906003)(110136005)(4326008)(66556008)(66476007)(7696005)(66446008)(66946007)(8676002)(2906002)(76116006)(64756008)(71200400001)(8936002)(52536014)(478600001)(5660300002)(122000001)(38100700002)(55016003)(33656002)(38070700005)(86362001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RG5OaDByVGpBb2tvdTNaakdmWjQxcmNoejc1M1V4WnBEOGtoQ2syTEkwWDBC?=
 =?utf-8?B?ajVodFJMV3hXcVRjYUNqVlB1QUU1WGFLQ2lsSHdiYmVXYVVJOUIwTlhBTW1Z?=
 =?utf-8?B?RDZBcnluQTQwdmgxR0ZIT1VPUTg1azdtcGRrWmtDN2lreXltZ1lIN1JHcUJ0?=
 =?utf-8?B?K0trYllCbndRMXZ5bVhvVUpyQ01HQ25WQWIrc1pXbDd1R2RQeTJmWkoxU3Zs?=
 =?utf-8?B?czdtYlQ5M2ZQQUppU1VBSVhtek1WMjRnNjdDYW81VzdiM1hFenJxZTFoS2Q4?=
 =?utf-8?B?VUxFRTZGRmhURjh1QVhFVmdFSDZSR3hDeVRxSnlGWW4rL2xpbEtuTEFXSU14?=
 =?utf-8?B?bzUxaFRSY0F4ZXNDdWcwOFgxaE00dVJJMDBhaEVjcS8rd3lkVW83QUZsRjJY?=
 =?utf-8?B?SEtVOFByeDVNR205Q2dxdmVDRTloa0F0WnY3MDkzZ3oyR1hXUHZIeVo5Ujla?=
 =?utf-8?B?OW9XVUxPb3IydG51UWtjZ2JsRjRXSzlKZktyanNLWWNCZkxCbEdYcFc2ZnVz?=
 =?utf-8?B?Q0ZkSzFvTjQ4ZElsZmI2SnBBNmF1SkRlSFdWUFdnK1k0bGVxMTQyQVVESzFF?=
 =?utf-8?B?SFJUMURKb0NGbnpnZlBFczZrakF0ZzBTbE9JbFNvR3g2WUJkS29TVXI4K09C?=
 =?utf-8?B?R0VqUU5uMjJ2OTN3Y1h1USsrb05oOW8wdmM1UXdzMVNFYkhPZXlORjlXUE51?=
 =?utf-8?B?VnNtaWxqUkR4S3ZReEZKckdRaFdvNGs3dmdjRnU5L1k0TXhTSVJGcFZmQjVE?=
 =?utf-8?B?aTJwQ0F2RCs4VzA4RkNyT3Jwc3lvZTlHQnd5bXpRb1hDZG9yQS94RjgyOGRW?=
 =?utf-8?B?aEhXN1BkUEF0cFp5S3VubnVLQ2ZieUFiU0VUVUdpYi9iSzdCMk5HcVhBSC9T?=
 =?utf-8?B?T3VPREt1UGkvWHRBOTR2Qm9HOE9lR1ZmYms1L2RLTGJseXFZREI2YjE1eWlD?=
 =?utf-8?B?WnY1eGFEN2gwU1p0cytKUDIwbFNpZEpCcC8rdlJ2YnFmTFdrMllSYjVKb2Fn?=
 =?utf-8?B?Sy9rRCszMmtlcmMwNDcwMVAzT3c0V3RSUkM4MWtsNmFJb2RuQ09kR2JUdlU4?=
 =?utf-8?B?ZENJdEw5cUdPeTVFT3lxOUd5OXViK0VmOE9JcnRHOEUrL2RjTjdlWnFLa3BC?=
 =?utf-8?B?Nm8rVEU0OUV1Wk1NeFhFUWV6SmEzQXlHZVU4R1FZQ3BxSU9NLzBxMlJoK2lT?=
 =?utf-8?B?RHlKWDBHS0xWT3pOU3FFbkZJekROWWYxUGxrZTloRzJLK25GTEVvR1libFZN?=
 =?utf-8?B?VE55a3JaLzR0NnRWYjVvdGxBeFNXVUFUWmNUY3poRDJYVXNNVVdPNzR3UVBp?=
 =?utf-8?B?dmN5V3FuQUEzRExTdU15S3UvSmN1UWl3RUVDK3pWdDVQL3AxYkZkL3pkYTN1?=
 =?utf-8?B?WDJDL2N2d0pJRHZ3bll2b3RYT3VsKzMyL1hwMFA1Y015MTAvdWkyWnZHZmNQ?=
 =?utf-8?B?UXE4VWFDcHZ3ekJwalNGQkZIdjNPQUJXYnNnSW9Ndm13dzJsOFRhRVRFMG5N?=
 =?utf-8?B?dVd4RDkxZUVvY0tONlhVS3VNLzYrSFpWUDFhYjhnZDlSVHF0djVHLzB6cTAz?=
 =?utf-8?B?ZWFyZ0NJMkZFTGhTa1hhaUsxYkNFQWNPR3drQnArK3BOc3FVNnpaOFRqT3pO?=
 =?utf-8?B?MmVpa2Nuamgzazd1SFRQVDA0WmRncTNicWttUmJGYTVPRC9JUjk3ZTk3bWtW?=
 =?utf-8?B?ckMwNnYzSlhJT2ZwbTAvOUUrYmx3T0tCR2Vnb1A4eHhGR002N01EZVE2L3gy?=
 =?utf-8?B?R1ZKZ0Y3ZXJoamdEN1c5bXNRY3VBZStLMWhWa0tWRlhNdTQ1RldMRW1KOW9h?=
 =?utf-8?B?VFJmU29IdnRRUUlIWWpKNGs1THRzOUV2cXZoaTNGbXQ3a3grWUR1VVVSQURZ?=
 =?utf-8?B?NGN5L1dVeGZXYlc3TXljS1JQSWNLRG50SEY5WXJuT1VzbE54VDdnVWVNbzNL?=
 =?utf-8?B?ZWdjN0VTMXhnUFB1WS9WZlR0U0xDeXdSYUJCZGVwYWdRcUpYUExxVzkwcS9V?=
 =?utf-8?B?ZFJtU1NJUTJwYmViSVRvdlo1TVU2VXN3aDNUdU5lWVZXOTlTWUhwU3ErdTFJ?=
 =?utf-8?B?Zjlxd0RyV21xTDNraUhnYVd1NTliczM4UE5QMjkyM0pnU3Y5WmRmM3M1bHdE?=
 =?utf-8?B?Y0UydlZzQjBLajBpYnVoTXVXN1dGelhpNjBneE5jNmdaVXhrRG5RZW5qNjVq?=
 =?utf-8?B?SWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Yx1fBk61HHv0AjhQC6AxM0q5vmK6OjHllCpfGkc4tcIGO+HtgZhvvhv0WGZqPV2DVrJrkP1FwGNdf9zPOgjFNAwDZqzWd4+V8B3S1UR7+Iv28eP37fNZKPvmz4XLoLbf45CwNdAfsH0b2EfswvjXmxtA+OO8tw8NjPxBW7YIhhzKIuPAwfN01Z98NHafuYg9bxApnoNjCVwa3cCjOoLhQUnTWBSBmrc0hZy2qGz5GPgioEGW8Lr7EBd9QJzaf4//lGwoaPQh1BhCzsAjyrrM+lH2USrgC9fkp0s8GBLyGkLFS/fprl7JW7cKLm+tliFDjV8m5aX4Bo5nivQ3yCwLWzN4VYUUfLVVBiY1gakYocJEZlhOexXrX+r4TxjlFPXN+gXaPJ5K2EI7DJwKCWO4myWXBVu9fJj5gfsibykSN72gfqFjSrEdY4+L0NrMD1OIqcRiw77q7WQUxkTe6qONlMUjB29bnhznPTmkRcU2eYTHoWgly3g58c4gDJ6ZTUuMj6J+/49A78ccWG1Dt7vgTj6BJu1d+A04DZN1cT4fwxodPcziUpGZahUtGnvpw0eV7RIqFOrNbZWh3TMkC5GjQdsUbARwePZP0n+dNGPOZ4GOBPz71JVAF5GFwtyqKALtRcuKBjESO4O2dh7i01Z+0RDfDmAHdxMDQKIJAdRXBY2DduHZ95vHnzxSryocVAWXDX1C2/+Z9lNhrg7TeWRTHtfRtsfN5ycW7S2o0wEpNyq0LjzCPi64CNAVeQbvk0wfVGQcH1i1Wzyl5LNFK1I41bqCzMJIUr6Lig7/QUo1A66zYofI2xkqYP3dbI4P581lpbbaaaEdcmEKGvgMNaCZfaZENgxVxuQku+mUaUJg+zrWnasD2kSIXns8Y9KLlFXzCeIpMLxe3UfOTTYiX0UnKetfrDeP0kFY3OqdF6oaLKE=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67813852-7c1f-4daa-d45d-08db1b3c9245
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2023 16:38:36.8469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q/1TDiWqp1hQ+h4pFYv68lX5JdQhet6rDwvV67sPZHk2mT/CgmkUOp/6o1mq/vwhZI4EiYwT16ERxS3xXPaAEtJTZtMA9W0an72rTDDKIqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6545
X-Proofpoint-GUID: pR16-2BMJv1nZba8PvdwoU8f3JPN-S4O
X-Proofpoint-ORIG-GUID: pR16-2BMJv1nZba8PvdwoU8f3JPN-S4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_10,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 suspectscore=0 phishscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303020144
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG91ZyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMiwgMjAyMyAy
OjAyIEFNDQo+IFRvOiBWaW5vZCBQb2xpbWVyYSAoUVVJQykgPHF1aWNfdnBvbGltZXJAcXVpY2lu
Yy5jb20+DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1hcm0t
bXNtQHZnZXIua2VybmVsLm9yZzsNCj4gZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyByb2JkY2xhcmtAZ21haWwuY29tOyBzd2JveWRAY2hyb21pdW0ub3JnOw0KPiBLYWx5YW4g
VGhvdGEgKFFVSUMpIDxxdWljX2thbHlhbnRAcXVpY2luYy5jb20+Ow0KPiBkbWl0cnkuYmFyeXNo
a292QGxpbmFyby5vcmc7IEt1b2dlZSBIc2llaCAoUVVJQykNCj4gPHF1aWNfa2hzaWVoQHF1aWNp
bmMuY29tPjsgVmlzaG51dmFyZGhhbiBQcm9kZHV0dXJpIChRVUlDKQ0KPiA8cXVpY192cHJvZGR1
dEBxdWljaW5jLmNvbT47IEJqb3JuIEFuZGVyc3NvbiAoUVVJQykNCj4gPHF1aWNfYmpvcmFuZGVA
cXVpY2luYy5jb20+OyBBYmhpbmF2IEt1bWFyIChRVUlDKQ0KPiA8cXVpY19hYmhpbmF2a0BxdWlj
aW5jLmNvbT47IFNhbmtlZXJ0aCBCaWxsYWthbnRpIChRVUlDKQ0KPiA8cXVpY19zYmlsbGFrYUBx
dWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTMgMDAvMTNdIEFkZCBQU1Igc3Vw
cG9ydCBmb3IgZURQDQo+IA0KPiBIaSwNCj4gDQo+IE9uIFdlZCwgTWFyIDEsIDIwMjMgYXQgMTE6
MDbigK9BTSBEb3VnIEFuZGVyc29uDQo+IDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOg0K
PiA+DQo+ID4gSGksDQo+ID4NCj4gPiBPbiBTdW4sIEZlYiAxMiwgMjAyMyBhdCA4OjI54oCvQU0g
Vmlub2QgUG9saW1lcmENCj4gPiA8cXVpY192cG9saW1lckBxdWljaW5jLmNvbT4gd3JvdGU6DQo+
ID4gPg0KPiA+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiA+ICAgLSBVc2UgZHAgYnJpZGdlIHRvIHNl
dCBwc3IgZW50cnkvZXhpdCBpbnN0ZWFkIG9mIGRwdV9lbm9jZGVyLg0KPiA+ID4gICAtIERvbid0
IG1vZGlmeSB3aGl0ZXNwYWNlcy4NCj4gPiA+ICAgLSBTZXQgc2VsZiByZWZyZXNoIGF3YXJlIGZy
b20gYXRvbWljX2NoZWNrLg0KPiA+ID4gICAtIFNldCBzZWxmIHJlZnJlc2ggYXdhcmUgb25seSBp
ZiBwc3IgaXMgc3VwcG9ydGVkLg0KPiA+ID4gICAtIFByb3ZpZGUgYSBzdHViIGZvciBtc21fZHBf
ZGlzcGxheV9zZXRfcHNyLg0KPiA+ID4gICAtIE1vdmUgZHAgZnVuY3Rpb25zIHRvIGJyaWRnZSBj
b2RlLg0KPiA+ID4NCj4gPiA+IENoYW5nZXMgaW4gdjM6DQo+ID4gPiAgIC0gQ2hhbmdlIGNhbGxi
YWNrIG5hbWVzIHRvIHJlZmxlY3QgYXRvbWljIGludGVyZmFjZXMuDQo+ID4gPiAgIC0gTW92ZSBi
cmlkZ2UgY2FsbGJhY2sgY2hhbmdlIHRvIHNlcGFyYXRlIHBhdGNoIGFzIHN1Z2dlc3RlZCBieSBE
bWl0cnkuDQo+ID4gPiAgIC0gUmVtb3ZlIHBzciBmdW5jdGlvbiBkZWNsYXJhdGlvbiBmcm9tIG1z
bV9kcnYuaC4NCj4gPiA+ICAgLSBTZXQgc2VsZl9yZWZyZXNoX2F3YXJlIGZsYWcgb25seSBpZiBw
c3IgaXMgc3VwcG9ydGVkLg0KPiA+ID4gICAtIE1vZGlmeSB0aGUgdmFyaWFibGUgbmFtZXMgdG8g
c2ltcGxlciBmb3JtLg0KPiA+ID4gICAtIERlZmluZSBiaXQgZmllbGRzIGZvciBQU1Igc2V0dGlu
Z3MuDQo+ID4gPiAgIC0gQWRkIGNvbW1lbnRzIGV4cGxhaW5pbmcgdGhlIHN0ZXBzIHRvIGVudGVy
L2V4aXQgcHNyLg0KPiA+ID4gICAtIENoYW5nZSBEUk1fSU5GTyB0byBkcm1fZGJnX2RiLg0KPiA+
ID4NCj4gPiA+IENoYW5nZXMgaW4gdjQ6DQo+ID4gPiAgIC0gTW92ZSB0aGUgZ2V0IGNydGMgZnVu
Y3Rpb25zIHRvIGRybV9hdG9taWMuDQo+ID4gPiAgIC0gQWRkIGF0b21pYyBmdW5jdGlvbnMgZm9y
IERQIGJyaWRnZSB0b28uDQo+ID4gPiAgIC0gQWRkIHRlcm5hcnkgb3BlcmF0b3IgdG8gY2hvb3Nl
IGVEUCBvciBEUCBvcHMuDQo+ID4gPiAgIC0gUmV0dXJuIHRydWUvZmFsc2UgaW5zdGVhZCBvZiAx
LzAuDQo+ID4gPiAgIC0gbW9kZV92YWxpZCBtaXNzaW5nIGluIHRoZSBlRFAgYnJpZGdlIG9wcy4N
Cj4gPiA+ICAgLSBNb3ZlIHRoZSBmdW5jdGlvbnMgdG8gZ2V0IGNydGMgaW50byBkcm1fYXRvbWlj
LmMuDQo+ID4gPiAgIC0gRml4IGNvbXBpbGF0aW9uIGlzc3Vlcy4NCj4gPiA+ICAgLSBSZW1vdmUg
ZHB1X2Fzc2lnbl9jcnRjIGFuZCBnZXQgY3J0YyBmcm9tIGRybV9lbmMgaW5zdGVhZCBvZg0KPiBk
cHVfZW5jLg0KPiA+ID4gICAtIENoZWNrIGZvciBjcnRjIHN0YXRlIGVuYWJsZSB3aGlsZSByZXNl
cnZpbmcgcmVzb3VyY2VzLg0KPiA+ID4NCj4gPiA+IENoYW5nZXMgaW4gdjU6DQo+ID4gPiAgIC0g
TW92ZSB0aGUgbW9kZV92YWxpZCBjaGFuZ2VzIGludG8gYSBkaWZmZXJlbnQgcGF0Y2guDQo+ID4g
PiAgIC0gQ29tcGxldGUgcHNyX29wX2NvbXAgb25seSB3aGVuIGlzciBpcyBzZXQuDQo+ID4gPiAg
IC0gTW92ZSB0aGUgRFAgYXRvbWljIGNhbGxiYWNrIGNoYW5nZXMgdG8gYSBkaWZmZXJlbnQgcGF0
Y2guDQo+ID4gPiAgIC0gR2V0IGNydGMgZnJvbSBkcm0gY29ubmVjdG9yIHN0YXRlIGNydGMuDQo+
ID4gPiAgIC0gTW92ZSB0byBzZXBhcmF0ZSBwYXRjaCBmb3IgY2hlY2sgZm9yIGNydGMgc3RhdGUg
ZW5hYmxlIHdoaWxlDQo+ID4gPiByZXNlcnZpbmcgcmVzb3VyY2VzLg0KPiA+ID4NCj4gPiA+IENo
YW5nZXMgaW4gdjY6DQo+ID4gPiAgIC0gUmVtb3ZlIGNydGMgZnJvbSBkcHVfZW5jb2Rlcl92aXJ0
IHN0cnVjdC4NCj4gPiA+ICAgLSBmaXggY3J0YyBjaGVjayBkdXJpbmcgdmJsYW5rIHRvZ2dsZSBj
cnRjLg0KPiA+ID4gICAtIE1pc2MgY2hhbmdlcy4NCj4gPiA+DQo+ID4gPiBDaGFuZ2VzIGluIHY3
Og0KPiA+ID4gICAtIEFkZCBmaXggZm9yIHVuZGVycnVuIGlzc3VlIG9uIGthc2FuIGJ1aWxkLg0K
PiA+ID4NCj4gPiA+IENoYW5nZXMgaW4gdjg6DQo+ID4gPiAgIC0gRHJvcCB0aGUgZW5jIHNwaW5s
b2NrIGFzIGl0IHdvbid0IHNlcnZlIGFueSBwdXJwb3NlIGluDQo+ID4gPiBwcm90ZXRjaW5nIGNv
bm4gc3RhdGUuKERtaXRyeS9Eb3VnKQ0KPiA+ID4NCj4gPiA+IENoYW5nZXMgaW4gdjk6DQo+ID4g
PiAgIC0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlIGFuZCBmaXggYWxpZ25tZW50IHVzaW5nIHNwYWNl
cy4oTWFyaWpuKQ0KPiA+ID4gICAtIE1pc2MgY2hhbmdlcy4oTWFyaWpuKQ0KPiA+ID4NCj4gPiA+
IENoYW5nZXMgaW4gdjEwOg0KPiA+ID4gICAtIEdldCBjcnRjIGNhY2hlZCBpbiBkcHVfZW5jIGR1
cmluZyBvYmogaW5pdC4oRG1pdHJ5KQ0KPiA+ID4NCj4gPiA+IENoYW5nZXMgaW4gdjExOg0KPiA+
ID4gICAtIFJlbW92ZSBjcnRjIGNhY2hlZCBpbiBkcHVfZW5jIGR1cmluZyBvYmogaW5pdC4NCj4g
PiA+ICAgLSBVcGRhdGUgZHB1X2VuYyBjcnRjIHN0YXRlIG9uIGNydGMgZW5hYmxlL2Rpc2FibGUg
ZHVyaW5nIHNlbGYgcmVmcmVzaC4NCj4gPiA+DQo+ID4gPiBDaGFuZ2VzIGluIHYxMjoNCj4gPiA+
ICAgLSBVcGRhdGUgc2M3MTgwIGludGYgbWFzayB0byBnZXQgaW50ZiB0aW1pbmcgZ2VuIHN0YXR1
cw0KPiA+ID4gYmFzZWQgb24gRFBVX0lOVEZfU1RBVFVTX1NVUFBPUlRFRCBiaXQuKERtaXRyeSkN
Cj4gPiA+ICAgLSBSZW1vdmUgImNsZWFyIGFjdGl2ZSBpbnRlcmZhY2UgaW4gdGhlIGRhdGFwYXRo
IGNsZWFudXAiIGNoYW5nZQ0KPiA+ID4gYXMgaXQgaXMgYWxyZWFkeSBpbmNsdWRlZC4NCj4gPiA+
DQo+ID4gPiBDaGFuZ2VzIGluIHYxMzoNCj4gPiA+ICAgLSBNb3ZlIGNvcmUgY2hhbmdlcyB0byB0
b3Agb2YgdGhlIHNlcmllcy4oRG1pdHJ5KQ0KPiA+ID4gICAtIERyb3Agc2VsZiByZWZyZXNoIGF3
YXJlIGRpc2FibGUgY2hhbmdlIGFmdGVyIHBzciBlbnRyeS4oRG1pdHJ5KQ0KPiA+ID4NCj4gPiA+
IFZpbm9kIFBvbGltZXJhICgxMyk6DQo+ID4gPiAgIGRybTogYWRkIGhlbHBlciBmdW5jdGlvbnMg
dG8gcmV0cmlldmUgb2xkIGFuZCBuZXcgY3J0Yw0KPiA+ID4gICBkcm0vYnJpZGdlOiB1c2UgYXRv
bWljIGVuYWJsZS9kaXNhYmxlIGNhbGxiYWNrcyBmb3IgcGFuZWwgYnJpZGdlDQo+ID4gPiAgIGRy
bS9icmlkZ2U6IGFkZCBwc3Igc3VwcG9ydCBmb3IgcGFuZWwgYnJpZGdlIGNhbGxiYWNrcw0KPiA+
ID4gICBkcm0vbXNtL2Rpc3AvZHB1OiBjaGVjayBmb3IgY3J0YyBlbmFibGUgcmF0aGVyIHRoYW4g
Y3J0YyBhY3RpdmUgdG8NCj4gPiA+ICAgICByZWxlYXNlIHNoYXJlZCByZXNvdXJjZXMNCj4gPiA+
ICAgZHJtL21zbS9kaXNwL2RwdTogZ2V0IHRpbWluZyBlbmdpbmUgc3RhdHVzIGZyb20gaW50ZiBz
dGF0dXMgcmVnaXN0ZXINCj4gPiA+ICAgZHJtL21zbS9kaXNwL2RwdTogd2FpdCBmb3IgZXh0cmEg
dnN5bmMgdGlsbCB0aW1pbmcgZW5naW5lIHN0YXR1cyBpcw0KPiA+ID4gICAgIGRpc2FibGVkDQo+
ID4gPiAgIGRybS9tc20vZGlzcC9kcHU6IHJlc2V0IHRoZSBkYXRhcGF0aCBhZnRlciB0aW1pbmcg
ZW5naW5lIGRpc2FibGUNCj4gPiA+ICAgZHJtL21zbS9kcDogdXNlIGF0b21pYyBjYWxsYmFja3Mg
Zm9yIERQIGJyaWRnZSBvcHMNCj4gPiA+ICAgZHJtL21zbS9kcDogQWRkIGJhc2ljIFBTUiBzdXBw
b3J0IGZvciBlRFANCj4gPiA+ICAgZHJtL21zbS9kcDogdXNlIHRoZSBlRFAgYnJpZGdlIG9wcyB0
byB2YWxpZGF0ZSBlRFAgbW9kZXMNCj4gPiA+ICAgZHJtL21zbS9kaXNwL2RwdTogdXNlIGF0b21p
YyBlbmFibGUvZGlzYWJsZSBjYWxsYmFja3MgZm9yIGVuY29kZXINCj4gPiA+ICAgICBmdW5jdGlv
bnMNCj4gPiA+ICAgZHJtL21zbS9kaXNwL2RwdTogYWRkIFBTUiBzdXBwb3J0IGZvciBlRFAgaW50
ZXJmYWNlIGluIGRwdSBkcml2ZXINCj4gPiA+ICAgZHJtL21zbS9kaXNwL2RwdTogdXBkYXRlIGRw
dV9lbmMgY3J0YyBzdGF0ZSBvbiBjcnRjIGVuYWJsZS9kaXNhYmxlDQo+ID4gPiAgICAgZHVyaW5n
IHNlbGYgcmVmcmVzaA0KPiA+DQo+ID4gSSdtIGN1cmlvdXMgd2hhdCB0aGUgcGxhbiBpcyBmb3Ig
bGFuZGluZyB0aGlzIHNlcmllcy4gSSBjb3VsZCBsYW5kIHRoZQ0KPiA+IGZpcnN0IHR3byBpbiBk
cm0tbWlzYyBpZiB5b3Ugd2FudCwgYnV0IEknbSBhIGxvd2x5IGNvbW1pdHRlciBhbmQgc28gSQ0K
PiA+IGNvdWxkbid0IG1ha2UgYW4gaW1tdXRhYmxlIGJyYW5jaCBmb3IgeW91IG5vciBjYW4gSSBv
ZmZpY2lhbGx5IEFjayB0aGUNCj4gPiBjaGFuZ2VzIHRvIGxhbmQgaW4geW91ciBicmFuY2guIFRo
YXQgbWVhbnMgeW91J2QgYmUgYmxvY2tlZCBmb3IgYW4NCj4gPiBleHRyYSB2ZXJzaW9uLiBEbyB5
b3UgYWxyZWFkeSBoYXZlIGEgcGxhbj8gSWYgbm90LCB0aGVuIG1heWJlIHdlIG5lZWQNCj4gPiB0
byBnZXQgaW4gdG91Y2ggd2l0aCBvbmUgb2YgdGhlIG1haW50YWluZXJzIFsxXSBvZiBkcm0tbWlz
Yz8gVGhhdCdzDQo+ID4gZG9jdW1lbnRlZCBbMl0gdG8gYmUgaW4gdGhlaXIgc2V0IG9mIHJlc3Bv
bnNpYmlsaXRpZXMuDQo+ID4NCj4gPiBbMV0gaHR0cHM6Ly9kcm0ucGFnZXMuZnJlZWRlc2t0b3Au
b3JnL21haW50YWluZXItDQo+IHRvb2xzL3JlcG9zaXRvcmllcy5odG1sI2RybS1taXNjLXJlcG9z
aXRvcnkNCj4gPiBbMl0gaHR0cHM6Ly9kcm0ucGFnZXMuZnJlZWRlc2t0b3Aub3JnL21haW50YWlu
ZXItdG9vbHMvbWFpbnRhaW5lci1kcm0tDQo+IG1pc2MuaHRtbCNtYWludGFpbmVyLXMtZHV0aWVz
DQo+IA0KPiBUaGUgYWJvdmUgcXVlc3Rpb24gYWJvdXQgaG93IHdlJ2QgbGFuZCB0aGlzIGlzIHN0
aWxsIGEgZ29vZCBvbmUsIGJ1dA0KPiBwZXJoYXBzIGxlc3MgcmVsZXZhbnQgcXVpdGUgeWV0IGJl
Y2F1c2UsIGF0IGxlYXN0IGluIG15IHRlc3RpbmcsIHRoZQ0KPiBjdXJyZW50IHNlcmllcyBkb2Vz
bid0IHdvcmsuIDotLw0KPiANCj4gSSBrbm93IHByZXZpb3VzIHZlcnNpb25zIHdvcmtlZCwgc28g
SSB3ZW50IGJhY2sgYW5kIHRyaWVkIG9sZGVyDQo+IHZlcnNpb25zLiBJdCB0dXJucyBvdXQgdGhh
dCB2MTIgX2RvZXNfIHdvcmsgZm9yIG1lLCBidXQgdjEzIGRvZXNuJ3QNCj4gd29yay4gVGhlIGRp
ZmZlcmVuY2UgaXMgdmVyeSBzbWFsbC4gSSdtIGFzc3VtaW5nIHlvdSBtYWRlIHNvbWUgY2hhbmdl
cw0KPiBpbiB2MTMgYW5kIHRoZXkgbG9va2VkIHNvIHNtYWxsIHRoYXQgeW91IGp1c3Qgc2VudCB2
MTMgb3V0IHdpdGhvdXQNCj4gdGVzdGluZz8gLi4ub3IsIG9mIGNvdXJzZSwgdGhlcmUncyBhbHdh
eXMgYSBwb3NzaWJpbGl0eSB0aGF0IEkgbWVzc2VkDQo+IHVwIGluIHRlc3RpbmcgdGhpcyBteXNl
bGYsIHRob3VnaCBJIGRpZCByZXBlYXQgbXkgcmVzdWx0cyBhbmQgdGhleQ0KPiB3ZXJlIGNvbnNp
c3RlbnQuDQo+IA0KPiBGV0lXLCBteSB0ZXN0aW5nIHdhcyByb3VnaGx5IHRvIGRvIHRoaXMgb24g
YSBkZXZpY2UgdGhhdCBoYWQgYQ0KPiBQU1ItZW5hYmxlZCBlRFAgZGlzcGxheToNCj4gDQo+IGVj
aG8gImRwX2NhdGFsb2dfY3RybF9zZXRfcHNyIiA+DQo+IC9zeXMva2VybmVsL2RlYnVnL3RyYWNp
bmcvc2V0X2Z0cmFjZV9maWx0ZXINCj4gZWNobyBmdW5jdGlvbiA+IC9zeXMva2VybmVsL2RlYnVn
L3RyYWNpbmcvY3VycmVudF90cmFjZXINCj4gZWNobyAxID4gL3N5cy9rZXJuZWwvZGVidWcvdHJh
Y2luZy90cmFjaW5nX29uDQo+IGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nL3RyYWNlX3Bp
cGUNCj4gDQo+IEkgc2hvdWxkIHNlZSBhIHNwbGF0IGluIHRoZSB0cmFjZSBidWZmZXJzIGVhY2gg
dGltZSBQU1IgaXMgZW50ZXJlZCBvcg0KPiBleGl0ZWQuIE9uIHYxMiBJIGdldCBzcGxhdHMgYXMg
dGhlIGN1cnNvciBvbiBteSBzY3JlZW4gYmxpbmtzLiBPbiB2MTMsDQo+IGl0J3MganVzdCBzaWxl
bmNlLg0KPiANCj4gUGxlYXNlIGNvbmZpcm0gdGhhdCB5b3UgdGVzdGVkIHYxMy4gSWYgeW91J3Jl
IGNvbmZpZGVudCB0aGF0IHYxMyB3b3Jrcw0KPiB0aGVuIEkgY2FuIGRpZyBmdXJ0aGVyIG15c2Vs
Zi4NCg0KVGhhbmtzLCBEb3VnIGZvciBjYXRjaGluZyB0aGlzLiANCkkgZGlkbid0IHBlciBzYXkg
dGVzdCBWMTMgYXMgSSBkaWQgbm90IG1ha2UgYW55IGNoYW5nZXMgYXBhcnQgZnJvbSBkcm9wcGlu
ZyBhIHBhdGNoIGZvciBmbGlja2VyLg0KIEFwcGFyZW50bHkgZmxpY2tlciBmaXggd2FzIHJldXNp
bmcgc2VsZi1yZWZyZXNoIGF3YXJlIHZhcmlhYmxlIGFuZCBkcm9wcGluZyB0aGUgcGF0Y2ggY2F1
c2VkDQpub3QgdG8gaW5pdGlhbGl6ZSBpdC4gSXQgd2FzIGFuIGhvbmVzdCBtaXN0YWtlLg0KDQpJ
IHB1c2hlZCBhIG5ldyBwYXRjaCB0byBzZXQgc2VsZi1yZWZyZXNoIGF3YXJlIGFzIHBhcnQgb2Yg
djE0LiANCkl0IGluY2x1ZGVzIGFsbCB0aGUgdW50b3VjaGVkIHBhdGNoZXMgb2YgdjEzIHBsdXMg
b25lIGFkZGl0aW9uYWwgcGF0Y2ggdG8gc2V0IHNlbGYtcmVmcmVzaCBhd2FyZS4NCkkgaGF2ZSB0
ZXN0ZWQgdGhlc2UgY2hhbmdlcyBhbmQgUFNSIGlzIGdldHRpbmcgZXhlcmNpc2VkLg0KDQpUaGFu
a3MgQWdhaW4sDQpWaW5vZA0KDQo+IA0KPiAtRG91Zw0K
