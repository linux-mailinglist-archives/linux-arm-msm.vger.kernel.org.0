Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBD167E8D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 16:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbjA0PBJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 10:01:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233302AbjA0PBI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 10:01:08 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899527ECA;
        Fri, 27 Jan 2023 07:01:06 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30RElbdK026395;
        Fri, 27 Jan 2023 15:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=Ccw41pxsQ5O1Y4J2nk6KK0r41kzkCsHmvPBoxpu4GQU=;
 b=S+9brtSBY6G4//9uTufjNb0c/4wLBOSKO/QRalr70jXdjvcIqPawcG5GrE5lKLcA7WTU
 OXSOqpknoJnxcqRJaiQMGV4kOf6X8qOWoRQmWNGjpSwDg/M5BgxNZM3qxkR2dXxdirN3
 CWrklLWIJ9Z4vJoPLDFPXkcKFxk69EGg4lJh37ChrGrZVvya2slTsziLwGj/LuA+uQZO
 Rcdx50w8eLyBUK2KaJ+qutY/u1TZSj12Hvzvmc2625CdmLPKHFCe+8K0wmxWjiayz+1Q
 bYFv3IXEF6XMUXJI6hqd8JsJAC85Nd8he+eizsmPgUT7ORgib2N8oIjDwt3kQTRrYDXG 1Q== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nbdnybe0b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Jan 2023 15:01:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ti+hYvuT6Pkndvnd9LuzYvniN+xrnZCSuHQiIjTMFCl66A+OyTrKqSX5nyiGgpE4qJA1unGO04zTM6Rufo53V/Mmu2A7FaxXMdybnRdRkUux+/1vM6DW6xA963LQE3Gh1CAljjHbamTKjXqNcBZyixt/oGO6x1n/5NoEsOIE03Dcra59ekqes7X1uS+Lzji3ilHMW6Q8HgGGDZnT+KkVCSlZ3EXJbvtZEBntaFlt2kdgHjT0elzMYSO/yB1R92aRRV7thAMs9X5zj4fK8b5QVYvqhy5HdndRecbGGE8BVU7j7Dz4YdwfWP09F4lpQ4Vh2K7dOnjBiowEI+W/dXAPbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ccw41pxsQ5O1Y4J2nk6KK0r41kzkCsHmvPBoxpu4GQU=;
 b=aqsKORrFI2k2A4dNcR1/5tMn9I7zZ4K6C8ldLIGZdn51EQKKUi+tOa0q0vf1Tr2bmsP5a47IFcdCF+qQeVl/QrUsntpiT4IscCS15umtr/w4XiVZoKrneUf4jbXkr/vnH6UYSjZhgxcky3tn3UH5TBbZoRRMD/Gf28OrpaQzVdtBaZ58ZMavvonOWIBkq4AQhP0fcl71dBbWVCmYnf7dWM5n8I+1oBJm3QF1Q+l0aXrvDaticvY0NwSdLJAELEDyCo6pqDYIgzayVxwOsz3dd7YmrS6jH+Cn0gDKcrkMyeRDKPBcUXhdZKZLGKB89dtyjeHiknL2xza19SOINKqkZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by SA1PR02MB8384.namprd02.prod.outlook.com (2603:10b6:806:1f3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Fri, 27 Jan
 2023 15:00:58 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::d5de:8903:d3c3:8436]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::d5de:8903:d3c3:8436%8]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 15:00:58 +0000
From:   Vinod Polimera <vpolimer@qti.qualcomm.com>
To:     "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
CC:     "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "dianders@chromium.org" <dianders@chromium.org>,
        "swboyd@chromium.org" <swboyd@chromium.org>,
        "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        "Vishnuvardhan Prodduturi (QUIC)" <quic_vproddut@quicinc.com>,
        "Bjorn Andersson (QUIC)" <quic_bjorande@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>
Subject: RE: [PATCH Resend v11 05/15] drm/msm/dp: disable self_refresh_aware
 after entering psr
Thread-Topic: [PATCH Resend v11 05/15] drm/msm/dp: disable self_refresh_aware
 after entering psr
Thread-Index: AQHZLBIiTJRhrb4tt0C2m/SoeuKp966su3mAgADwbBCAACJggIAEmIZA
Date:   Fri, 27 Jan 2023 15:00:57 +0000
Message-ID: <BN0PR02MB8173CC9651E88BBE0D68BF60E4CC9@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1674138393-475-1-git-send-email-quic_vpolimer@quicinc.com>
 <1674138393-475-6-git-send-email-quic_vpolimer@quicinc.com>
 <4a359748-e53c-a178-de09-2c999eb69013@linaro.org>
 <BN0PR02MB8173B73AC4E3DB9A7D0509DCE4C99@BN0PR02MB8173.namprd02.prod.outlook.com>
 <CAA8EJpr_YAD185VKtLD2TDmbYPpe7S4KPkoP-8N95nwKRt9Y=g@mail.gmail.com>
In-Reply-To: <CAA8EJpr_YAD185VKtLD2TDmbYPpe7S4KPkoP-8N95nwKRt9Y=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|SA1PR02MB8384:EE_
x-ms-office365-filtering-correlation-id: 09670fe9-e2d6-4854-3a45-08db00774c14
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QlbbHYLgGEe4Ux/IVGFM+cist7cKCBEL0FAp5EP7MBTCW3lzZLzDRQeoY3bQmY7S85h+HFgvoyJlRYv6UFo1feZe8kCk3e/dJDOsDH8TfABO3yPLjSV39AoXz8M5sGlSjxFgtCVC1Eq0WdCXTSGqimStZuvS/NlGMypdizZfsaM3fCJAlYhAk0Hp2WQkQh/C5jj5VVLLKRWxh42OaIzyDMqiJfXJ2kgCrhJEL1Wei4OzzNL6pMNdFO4YkRQXNdErpgFsQAXt66AgVM2ICvHJmYooLTdzuje2gImc5tuF8QKAt8iOACnFP6aLfdyRdztA+ELlMLu/bLADoB1/OEHwjrjgrm+S+cL1UpIlNIQ4MFS7mV7Y8y0P6kILGpWVHNIrdWK++mjmrUTfgw7qSKdlEjD8bJ2FIImcKrglWukB2MFQDq7nmpEja4P0FV9DHevv28Puv4cKA1NO3q0rU9pHAKF0Q7gMWdYnXPCskhowinvKeyzlhY/ktF4EXK/IymIGp8xDMzUkjnjCkNFx83as7Ozz6oyLHa15Z9/b0rJe/ff1YZ+h8M8/qxFhdjpXysWk5eYMYnQ0eXhiA01+rtpzSxqNHhjN4KOu6/ig3uVflfU+R6HFesfVA9br96Dr3xXTRIUYRENRRBG0aNpxqNDVWp3Yp9OpXPKCfAqcJkEKnEtkYRjsN6ZpYw1Bp00pHmbqJgfmpscDtL2F01dbFCJYB2NdzChRVDi5uDYAAh3CsCI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR02MB8173.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199018)(38100700002)(83380400001)(107886003)(966005)(122000001)(186003)(53546011)(6506007)(26005)(9686003)(2906002)(55016003)(54906003)(8676002)(478600001)(4326008)(52536014)(71200400001)(316002)(5660300002)(66446008)(7696005)(64756008)(6916009)(66946007)(76116006)(66556008)(66476007)(41300700001)(8936002)(38070700005)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckZqenFtQVYwTkhsUE03SGFINDRXWHFsUlhJYXRVUDF4NUgvc0EyQkVMeEJR?=
 =?utf-8?B?OFlFRzN2d3V2dVFDNGhJQlhuVFJOZUNTbkUzUTFCL1MyVDdhUDBWZmRIODYx?=
 =?utf-8?B?NktrUGZYbU55OVByUDYzNEV3RFExOVduVzE5ZWswazhBekIzVmVmVnBKSzJD?=
 =?utf-8?B?T2lwczU3aGNIM1NscVFRNi90TzZLSnF3MkwrUHV4RTBGcDBnam5EYXVqdjBH?=
 =?utf-8?B?OWkwTTR4bWdXdU1BV0tNNi9iTUs5bmpzTVFpVUJkUDZCR1puL0d4TFBOVkNq?=
 =?utf-8?B?K25vY1Ria3dEUXVyaWZMc0t3UUJtUnQvWWl1RFMvRmw4dHd5QTZHYUNCbStL?=
 =?utf-8?B?RFhndmtpb1IrYjJVVStHbExkVGpSNTVUeDdVVjBZbTZTc2g2TGtKV3B0NEg3?=
 =?utf-8?B?eEh4eXNScGlsNHk0VUJBWWtzU0k4TmVKY1ZQVVFYcC9vOXd0V0dwU1Y1Q0NN?=
 =?utf-8?B?U1pxZ1dBRWdUWEJQRWhLdndSNTFKRndwalpPTkFtUnlvdU9xMjFhWGc0M0JV?=
 =?utf-8?B?SDJoR0tmdzdoci9KaGhES0pxT0ZUZjJxbmp5YmVIQnphQ25ZUTRnWElWNTJY?=
 =?utf-8?B?aGZDK2NCTTRVK1Mvd2FzME1JcGsvanFXeERRbnRuVnpxUE9jVEM1NWxnSlBP?=
 =?utf-8?B?aXM3N2RYK2kyalVnT0JqQ1RqdktCYTZXa1A5RXQyaG83MklTaHhvT29FVVZx?=
 =?utf-8?B?QlBKMzllcWQvK2VLSUtON0FVYndmK2dsc0YzbXFXaDVYQkNia3J1M29nNXR6?=
 =?utf-8?B?RUh2UDhJZWNCU04xZDdUbnFWY2pKbGMrYlFaSHAvTnM4alhtMVF4L3NRWVRK?=
 =?utf-8?B?eVIxVjZVRHdrZkZPaEhqRmRqclpNNSs5NE82RW41UDZ1Zm8wZlRyOUtwdnNo?=
 =?utf-8?B?SStSWENjeVVkRWYzZ21DR0k3UTVDNjBROERwRU1OWDRMQVFPUGdKMjlCZVRl?=
 =?utf-8?B?emd6aHFGc1pEN1d0cVYxK1lha1Rld2w3Q0NTVHZkUmdkRktHS0JFN1VGenV5?=
 =?utf-8?B?SHNhTjcvckZDbE5PaTUycm96SlEzb0RHdkxpMm5wNGZUclZMdVRRT2VMT3VF?=
 =?utf-8?B?ckJzcGJZVWRqTkdZbitLZFlyeGJFajA4SmpkM3UwT3NJUUt4YzlWdmJ2K0ZX?=
 =?utf-8?B?UHZiY1BlNzQvTEw3bWc0VFczZU0xd1N4Ni9aVXZUcStHTU5peFFyNjdCMlA0?=
 =?utf-8?B?UElneEN1eWZqYzNFeExFaHhWQVNJbHA2VStHV3BsRWdVMTR2U2lrazgxcDNU?=
 =?utf-8?B?YmhlcmVwSlR1d2N3Q2FLTk5ncGJlOGx5Smd0K0drdW5HcmxNRzVSUkxPYzda?=
 =?utf-8?B?d0dIVXpRMmlIclRsdDZTM25vS3plcEpoakE4UVdhZEUzTWpMTjRQVWI2TjlU?=
 =?utf-8?B?WFBIbG9UQUFINUp3L0pGbnVKbkoxaTRrNE1FR29NYWpaMnJHZXlYZEdnQU5X?=
 =?utf-8?B?cnZPZ2p3RG9kQW9RSmRPVUdodXNpaTg2NlE1eHIvQ0Q2akdSZ3Q5M056bTdB?=
 =?utf-8?B?TDZLbmhKNWpiRVlEZjdWQXJKQnArK25mNCtsTFpyM3VHdWZZZEFPelFOTUtN?=
 =?utf-8?B?bmNxcFc3ZVVkRGdxZ1pLWWxXVEVUOFNCc0FzMUk1dGthb1hocDBST08zOFZu?=
 =?utf-8?B?ck50YU84OXZSUFJkVUpoRE9UYUo3a2dUQ2hRbXZQcmU0QVpvb1RnVHRGVjgx?=
 =?utf-8?B?UHJDRTJXZCtuZ04zQkcwUlNmRThtNmlpRmhEY2U4N2QzdkZtaGpPd2ZWSFJl?=
 =?utf-8?B?VXlmdTNxWFRla1g3OVE0SXFXUjhWVXE2cHg1SjVTVWljUUIxd0RwaFRES20x?=
 =?utf-8?B?alNMN2kvM29kOE9iQVVlMXAzeDh2VUZDeHVacDQ3N0cxbzErVStybDhrV2FT?=
 =?utf-8?B?QlFXU0dCZ1JRc3g2SnN1dnY5eitLbGlDazN6a1JpL3JFSVVmM1NrS1lFSStk?=
 =?utf-8?B?dEwwTlBZYmw3b01yeTVSM2R4ekZZa2wrUTMyUTcxUnc4TjdVK3NhdzdsWFls?=
 =?utf-8?B?RnZ0SmJSNmRkRnMxaUU2c1JDcksvVnA1Wi80UnZnbGZmTkRCUkJ5WXlKZUVt?=
 =?utf-8?B?bktLNnduTUtvc29lUDR3L1FCY00xL3hCQ1ZsKzRyYTdMNllFelBCK0IzakRa?=
 =?utf-8?B?V2svbEVWR0ViaWMxVU5ONmg4NUpMYnlQdDVFMGJRR2x4TzdXU1hYWDdHckF4?=
 =?utf-8?B?T3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: J5kPkxldQ29dWb4O5nkQ5jr0T+EYlFzHZikIkGz0H4Zbtg5o8EuHc44NHA6zQwvedoScdcCd57lIkZ+7HP0IC2zKx7xCGT3WbDIaFqnm/m8VAJxGtsd9pv82evGLx4rAJHA4t5aqBqIqy2reLpfODMRdbvORV91MFuORCV3H42CaiiBTHpEru+c4ok97K+OhyyIKIFqN+GikCas3I7MKYedA05en1AvOvDe2w1YCO3DHzRvUetUEpaBgH8L9x1BeAo2iAb699MdLb9QCNWDISOlNo317N49sZGk7lyDOIvs8pSI8wqci0K+G1HMcCTBzW91LVx7XW+xccruyMbinYFhOsDOVwDSnsjtEL8riTK8WwSuDokeU+F8NyA6vcKHdAyQA/LcaZSIGx7sT2cx7Kx+P2sP/fYDegf2TdPPg9khegI0GlD1LMwCSHIjUUT36P6UqOKfioaV9i7vNaapJ+oRzqd6+HM40fEMMcgcZEyt0X7eYbJUB5hs1zyTdMxwyzoEJP7H+DS2UM0h62AgBUzIjs1r0S46BKd5SnQ2SYN9+71hTCH1zyYKtJwUzqhedbuPS0wmgtN8uCZ3vIc0NUc8cHujU67xYdKVyjhDO+kGyWJydjHuhWmLR3xvspyHud3jArjh6OZ1HgJIVNydiZPd0GnrYS/uTg2HA1P/Pi3fXqKD64HESCDhqmZqWGbAzUsrZMDE1HMrpG6O/9q72vjb0krGnWGPldxY52BWbWloysgMwzDPHwUNfZ8DzuXbsLlvwMR3Cj0kadY4oCDuBw0bNDVlEHIH4K5QtrLH2WeQkHe65VLRwSdqYZhHF1KB1k8/QSIcxbmN/wsZUNB6uH3rKv/p+qv4kMhtJntt901iLGO5s0VuGLpLDulx9NiLI3eAx06YDwobQwQ3FUA1trkqpJHjhU3sDDkKnL5LqVs0=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09670fe9-e2d6-4854-3a45-08db00774c14
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2023 15:00:57.9934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ISi1KYCAF5B6yCri2SnO+AJ9sWnq4DiN+Ompc25pXLitkqPNnZN+TOOSdrCcFy0pYn/H/Aub/Dadgk74CISoR6eA6urY4NixPP5BI1VsXXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8384
X-Proofpoint-ORIG-GUID: fYYGJcSAap1hzt_Uw02WGwoU0dtlqfWV
X-Proofpoint-GUID: fYYGJcSAap1hzt_Uw02WGwoU0dtlqfWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301270142
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEbWl0cnkgQmFyeXNoa292IDxk
bWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMjQs
IDIwMjMgMTA6MTUgUE0NCj4gVG86IFZpbm9kIFBvbGltZXJhIDx2cG9saW1lckBxdGkucXVhbGNv
bW0uY29tPg0KPiBDYzogVmlub2QgUG9saW1lcmEgKFFVSUMpIDxxdWljX3Zwb2xpbWVyQHF1aWNp
bmMuY29tPjsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWFybS1t
c21Admdlci5rZXJuZWwub3JnOw0KPiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgU2Fua2VlcnRoDQo+IEJpbGxha2FudGkgKFFVSUMp
IDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29tPjsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7IHJvYmRjbGFya0BnbWFpbC5jb207IGRpYW5kZXJzQGNocm9taXVtLm9yZzsNCj4gc3di
b3lkQGNocm9taXVtLm9yZzsgS2FseWFuIFRob3RhIChRVUlDKSA8cXVpY19rYWx5YW50QHF1aWNp
bmMuY29tPjsNCj4gS3VvZ2VlIEhzaWVoIChRVUlDKSA8cXVpY19raHNpZWhAcXVpY2luYy5jb20+
OyBWaXNobnV2YXJkaGFuDQo+IFByb2RkdXR1cmkgKFFVSUMpIDxxdWljX3Zwcm9kZHV0QHF1aWNp
bmMuY29tPjsgQmpvcm4gQW5kZXJzc29uIChRVUlDKQ0KPiA8cXVpY19iam9yYW5kZUBxdWljaW5j
LmNvbT47IEFiaGluYXYgS3VtYXIgKFFVSUMpDQo+IDxxdWljX2FiaGluYXZrQHF1aWNpbmMuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFJlc2VuZCB2MTEgMDUvMTVdIGRybS9tc20vZHA6IGRp
c2FibGUNCj4gc2VsZl9yZWZyZXNoX2F3YXJlIGFmdGVyIGVudGVyaW5nIHBzcg0KPiA+IA0KPiBP
biBUdWUsIDI0IEphbiAyMDIzIGF0IDE3OjEwLCBWaW5vZCBQb2xpbWVyYSA8dnBvbGltZXJAcXRp
LnF1YWxjb21tLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+ID4gRnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8u
b3JnPg0KPiA+ID4gU2VudDogVHVlc2RheSwgSmFudWFyeSAyNCwgMjAyMyA1OjUyIEFNDQo+ID4g
PiBUbzogVmlub2QgUG9saW1lcmEgKFFVSUMpIDxxdWljX3Zwb2xpbWVyQHF1aWNpbmMuY29tPjsg
ZHJpLQ0KPiA+ID4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1hcm0tbXNtQHZn
ZXIua2VybmVsLm9yZzsNCj4gPiA+IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+ID4gPiBDYzogU2Fua2VlcnRoIEJpbGxha2FudGkg
KFFVSUMpIDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29tPjsgbGludXgtDQo+ID4gPiBrZXJuZWxA
dmdlci5rZXJuZWwub3JnOyByb2JkY2xhcmtAZ21haWwuY29tOyBkaWFuZGVyc0BjaHJvbWl1bS5v
cmc7DQo+ID4gPiBzd2JveWRAY2hyb21pdW0ub3JnOyBLYWx5YW4gVGhvdGEgKFFVSUMpDQo+IDxx
dWljX2thbHlhbnRAcXVpY2luYy5jb20+Ow0KPiA+ID4gS3VvZ2VlIEhzaWVoIChRVUlDKSA8cXVp
Y19raHNpZWhAcXVpY2luYy5jb20+OyBWaXNobnV2YXJkaGFuDQo+ID4gPiBQcm9kZHV0dXJpIChR
VUlDKSA8cXVpY192cHJvZGR1dEBxdWljaW5jLmNvbT47IEJqb3JuIEFuZGVyc3Nvbg0KPiAoUVVJ
QykNCj4gPiA+IDxxdWljX2Jqb3JhbmRlQHF1aWNpbmMuY29tPjsgQWJoaW5hdiBLdW1hciAoUVVJ
QykNCj4gPiA+IDxxdWljX2FiaGluYXZrQHF1aWNpbmMuY29tPg0KPiA+ID4gU3ViamVjdDogUmU6
IFtQQVRDSCBSZXNlbmQgdjExIDA1LzE1XSBkcm0vbXNtL2RwOiBkaXNhYmxlDQo+ID4gPiBzZWxm
X3JlZnJlc2hfYXdhcmUgYWZ0ZXIgZW50ZXJpbmcgcHNyDQo+ID4gPg0KPiA+ID4NCj4gPiA+IE9u
IDE5LzAxLzIwMjMgMTY6MjYsIFZpbm9kIFBvbGltZXJhIHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBT
YW5rZWVydGggQmlsbGFrYW50aSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4NCj4gPiA+ID4N
Cj4gPiA+ID4gVXBkYXRlZCBmcmFtZXMgZ2V0IHF1ZXVlZCBpZiBzZWxmX3JlZnJlc2hfYXdhcmUg
aXMgc2V0IHdoZW4gdGhlDQo+ID4gPiA+IHNpbmsgaXMgaW4gcHNyLiBUbyBzdXBwb3J0IGJyaWRn
ZSBlbmFibGUgYW5kIGF2b2lkIHF1ZXVpbmcgb2YgdXBkYXRlDQo+ID4gPiA+IGZyYW1lcywgcmVz
ZXQgdGhlIHNlbGZfcmVmcmVzaF9hd2FyZSBzdGF0ZSBhZnRlciBlbnRlcmluZyBwc3IuDQo+ID4g
Pg0KPiA+ID4gSSdtIG5vdCBjb252aW5jZWQgYnkgdGhpcyBjaGFuZ2UuIEUuZy4gYW5hbG9naXgg
Y29kZSBkb2Vzbid0IGRvIHRoaXMuDQo+ID4gPiBDb3VsZCB5b3UgcGxlYXNlIGNsYXJpZnksIHdo
eSBkbyB5b3UgbmVlZCB0byB0b2dnbGUgdGhlDQo+ID4gPiBzZWxmX3JlZnJlc2hfYXdhcmUgZmxh
Zz8NCj4gPiA+DQo+ID4gVGhpcyB3YXMgZG9uZSB0byBmaXggYSBidWcgcmVwb3J0ZWQgYnkgZ29v
Z2xlLiBUaGUgdXNlIGNhc2UgaXMgYXMgZm9sbG93czoNCj4gPiAgICAgICAgIENQVSB3YXMgcnVu
bmluZyBpbiBhIGxvdyBmcmVxdWVuY3kgd2l0aCBkZWJ1ZyBidWlsZC4NCj4gPiAgICAgICAgIFdo
ZW4gc2VsZiByZWZyZXNoIHdhcyB0cmlnZ2VyZWQgYnkgdGhlIGxpYnJhcnksIGR1ZSB0byBzeXN0
ZW0gbGF0ZW5jeSwNCj4gdGhlIHF1ZXVlZCB3b3JrIHdhcyBub3Qgc2NoZWR1bGVkLg0KPiA+ICAg
ICAgICAgVGhlcmUgaW4gYW5vdGhlciBjb21taXQgY2FtZSBhbmQgcmVpbml0aWFsaXplZCB0aGUg
dGltZXIgZm9yIHRoZSBuZXh0DQo+IFBTUiB0cmlnZ2VyLg0KPiA+ICAgICAgICAgVGhpcyBzZXF1
ZW5jZSBoYXBwZW5lZCBtdWx0aXBsZSB0aW1lcyAgYW5kIHdlIGZvdW5kIHRoZXJlIHdlcmUNCj4g
bXVsdGlwbGUgd29ya3Mgd2hpY2ggYXJlIHN0dWNrIGFuZCB5ZXQgdG8gYmUgcnVuLg0KPiANCj4g
V2hlcmUgd2VyZSB3b3JrZXJzIHN0dWNrPyBXYXMgaXQgYSBidXN5IGxvb3AgYXJvdW5kIC1FREVB
RExLIC8NCj4gZHJtX21vZGVzZXRfYmFja29mZigpPyBBbHNvLCB3aGF0IHdlcmUgdGhlciBld21h
IHRpbWVzIGZvciBlbnRyeS9leGl0DQo+IGF2ZyB0aW1lcz8NCj4gDQpJdCBpcyBub3QgIGFuIEVE
RUFETEsgYW5kIHJldHVybiBpcyBzdWNjZXNzZnVsLg0KRW50cnkgYW5kIGV4aXQgdGltZXMgYXJl
IHByb3BlciBidXQgdGhlIHdvcmsgdGhhdCBpcyBnZXR0aW5nIHNjaGVkdWxlZCBhZnRlciB0aW1l
ciBleHBpcnkgaXMgaGFwcGVuaW5nIHZlcnkgbGF0ZS4NCg0KPiBJJ20gYXNraW5nIGJlY2F1c2Ug
dGhlIGlzc3VlIHRoYXQgeW91IGFyZSBkZXNjcmliaW5nIHNvdW5kcyBsaWtlIGENCj4gZ2VuZXJp
YyBvbmUsIG5vdCB0aGUgZHJpdmVyLXNwZWNpZmljIGlzc3VlLiBBbmQgYmVpbmcgZ2VuZXJpYyBp
dA0KPiBzaG91bGQgYmUgaGFuZGxlZCBpbiBhIGdlbmVyaWMgZmFzY2lvbiwgaW4gZHJtX3NlbGZf
cmVmcmVzaF9oZWxwZXIuYy4NCj4gDQo+IEZvciBleGFtcGxlLCBJIGNhbiBpbWFnaW5lIGFkZGlu
ZyBhIHZhcmlhYmxlIHRvIHNyX2RhdGEgdGVsbGluZyB0aGF0DQo+IHRoZSBkcml2ZXIgaXMgaW4g
dGhlIHByb2Nlc3Mgb2YgdHJhbnNpdGlvbmluZyB0byBTUi4gTm90ZTogSSBkaWQgbm90DQo+IHBl
cmZvcm0gYSBmdWxsIHJlc2VhcmNoIGlmIGl0IGlzIGEgd29ya2luZyBzb2x1dGlvbiBvciBub3Qu
IEJ1dCBmcm9tDQo+IHlvdXIgZGVzY3JpcHRpb24gdGhlIGRyaXZlciByZWFsbHkgaGFzIHRvIGJh
aWwgb3V0IGVhcmx5IGZyb20NCj4gZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXJfZW50cnlfd29yaygp
Lg0KPiANCj4gPiAgICAgICAgIEFzIFBTUiB0cmlnZ2VyIGlzIGd1YXJkZWQgYnkgc2VsZl9yZWZy
ZXNoX2F3YXJlLCB3ZSBpbml0aWFsaXplZCB0aGUNCj4gdmFyaWFibGUgc3VjaCB0aGF0LCBpZiB3
ZSBhcmUgaW4gUFNSIHRoZW4gdW50aWwgUFNSIGV4aXQsIHRoZXJlIGNhbm5vdCBiZSBhbnkNCj4g
ZnVydGhlciBQU1IgZW50cnkgYWdhaW4uDQo+ID4NCj4gaHR0cHM6Ly9jaHJvbWl1bS5nb29nbGVz
b3VyY2UuY29tL2Nocm9taXVtb3MvdGhpcmRfcGFydHkva2VybmVsLysvcmVmDQo+IHMvdGFncy92
NS4xNS45MC9kcml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIuYyMxMDUNCj4g
DQo+IFllcywgYW5kIHRoYXQncyB3aGF0IHRyaWdnZXJlZCBteSBhdHRlbnRpb24uIFdlIGFyZSB1
c2luZyBhIHNldCBvZg0KPiBoZWxwZXJzLCB0aGF0IGRlcGVuZCBvbiB0aGUgc2VsZl9yZWZyZXNo
X2F3YXJlIGJlaW5nIHRydWUuIEFuZA0KPiBzdWRkZW5seSB1bmRlciB0aGUgaG9vZCB3ZSBkaXNh
YmxlIHRoaXMgZmxhZy4gSSdkIHNheSB0aGF0IEkgY2FuIG5vdA0KPiBwcmVkaWN0IHRoZSBlZmZl
Y3QgdGhpcyB3aWxsIGhhdmUgb24gdGhlIGhlbHBlcnMgbGlicmFyeSBiZWhhdmlvdXIuDQo+IA0K
PiA+ICAgICAgICAgVGhpcyBoYXMgc29sdmVkIGZldyBmbGlja2VyIGlzc3VlcyBkdXJpbmcgdGhl
IHN0cmVzcyB0ZXN0aW5nLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTYW5rZWVy
dGggQmlsbGFrYW50aSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4NCj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogVmlub2QgUG9saW1lcmEgPHF1aWNfdnBvbGltZXJAcXVpY2luYy5jb20+DQo+ID4g
PiA+IC0tLQ0KPiA+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZHJtLmMgfCAyNw0K
PiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ID4gPiA+ICAgMSBmaWxlIGNoYW5n
ZWQsIDI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZHJtLmMNCj4gPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kcC9kcF9kcm0uYw0KPiA+ID4gPiBpbmRleCAwMjllMDhjLi45MmQxYTFi
IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2RybS5jDQo+
ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZHJtLmMNCj4gPiA+ID4gQEAg
LTEzNCw2ICsxMzQsOCBAQCBzdGF0aWMgdm9pZCBlZHBfYnJpZGdlX2F0b21pY19lbmFibGUoc3Ry
dWN0DQo+ID4gPiBkcm1fYnJpZGdlICpkcm1fYnJpZGdlLA0KPiA+ID4gPiAgICAgICBzdHJ1Y3Qg
ZHJtX2NydGNfc3RhdGUgKm9sZF9jcnRjX3N0YXRlOw0KPiA+ID4gPiAgICAgICBzdHJ1Y3QgbXNt
X2RwX2JyaWRnZSAqZHBfYnJpZGdlID0gdG9fZHBfYnJpZGdlKGRybV9icmlkZ2UpOw0KPiA+ID4g
PiAgICAgICBzdHJ1Y3QgbXNtX2RwICpkcCA9IGRwX2JyaWRnZS0+ZHBfZGlzcGxheTsNCj4gPiA+
ID4gKyAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsNCj4gPiA+ID4gKyAgICAg
c3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUgPSBOVUxMOw0KPiA+ID4gPg0K
PiA+ID4gPiAgICAgICAvKg0KPiA+ID4gPiAgICAgICAgKiBDaGVjayB0aGUgb2xkIHN0YXRlIG9m
IHRoZSBjcnRjIHRvIGRldGVybWluZSBpZiB0aGUgcGFuZWwNCj4gPiA+ID4gQEAgLTE1MCwxMCAr
MTUyLDIyIEBAIHN0YXRpYyB2b2lkIGVkcF9icmlkZ2VfYXRvbWljX2VuYWJsZShzdHJ1Y3QNCj4g
PiA+IGRybV9icmlkZ2UgKmRybV9icmlkZ2UsDQo+ID4gPiA+DQo+ID4gPiA+ICAgICAgIGlmIChv
bGRfY3J0Y19zdGF0ZSAmJiBvbGRfY3J0Y19zdGF0ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZSkgew0K
PiA+ID4gPiAgICAgICAgICAgICAgIGRwX2Rpc3BsYXlfc2V0X3BzcihkcCwgZmFsc2UpOw0KPiA+
ID4gPiAtICAgICAgICAgICAgIHJldHVybjsNCj4gPiA+ID4gKyAgICAgICAgICAgICBnb3RvIHBz
cl9hd2FyZTsNCj4gPiA+ID4gICAgICAgfQ0KPiA+ID4gPg0KPiA+ID4gPiAgICAgICBkcF9icmlk
Z2VfYXRvbWljX2VuYWJsZShkcm1fYnJpZGdlLCBvbGRfYnJpZGdlX3N0YXRlKTsNCj4gPiA+ID4g
Kw0KPiA+ID4gPiArcHNyX2F3YXJlOg0KPiA+ID4gPiArICAgICBjb25uZWN0b3IgPQ0KPiA+ID4g
ZHJtX2F0b21pY19nZXRfbmV3X2Nvbm5lY3Rvcl9mb3JfZW5jb2RlcihhdG9taWNfc3RhdGUsDQo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRybV9icmlkZ2UtPmVuY29kZXIpOw0KPiA+ID4gPiArICAgICBpZiAoY29ubmVjdG9yKQ0K
PiA+ID4gPiArICAgICAgICAgICAgIGNvbm5fc3RhdGUgPQ0KPiA+ID4gZHJtX2F0b21pY19nZXRf
bmV3X2Nvbm5lY3Rvcl9zdGF0ZShhdG9taWNfc3RhdGUsDQo+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29ubmVjdG9y
KTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICBpZiAoY29ubl9zdGF0ZSkgew0KPiA+ID4gPiAr
ICAgICAgICAgICAgIGNvbm5fc3RhdGUtPnNlbGZfcmVmcmVzaF9hd2FyZSA9IGRwLT5wc3Jfc3Vw
cG9ydGVkOw0KPiA+ID4gPiArICAgICB9DQo+ID4gPg0KPiA+ID4gTm8gbmVlZCB0byB3cmFwIGEg
c2luZ2xlIGxpbmUgc3RhdGVtZW50IGluIGJyYWNrZXRzLg0KPiA+ID4NCj4gPiA+ID4gKw0KPiA+
ID4gPiAgIH0NCj4gPiA+ID4NCj4gPiA+ID4gICBzdGF0aWMgdm9pZCBlZHBfYnJpZGdlX2F0b21p
Y19kaXNhYmxlKHN0cnVjdCBkcm1fYnJpZGdlDQo+ICpkcm1fYnJpZGdlLA0KPiA+ID4gPiBAQCAt
MTY0LDYgKzE3OCwxNCBAQCBzdGF0aWMgdm9pZCBlZHBfYnJpZGdlX2F0b21pY19kaXNhYmxlKHN0
cnVjdA0KPiA+ID4gZHJtX2JyaWRnZSAqZHJtX2JyaWRnZSwNCj4gPiA+ID4gICAgICAgc3RydWN0
IGRybV9jcnRjX3N0YXRlICpuZXdfY3J0Y19zdGF0ZSA9IE5VTEwsICpvbGRfY3J0Y19zdGF0ZSA9
DQo+IE5VTEw7DQo+ID4gPiA+ICAgICAgIHN0cnVjdCBtc21fZHBfYnJpZGdlICpkcF9icmlkZ2Ug
PSB0b19kcF9icmlkZ2UoZHJtX2JyaWRnZSk7DQo+ID4gPiA+ICAgICAgIHN0cnVjdCBtc21fZHAg
KmRwID0gZHBfYnJpZGdlLT5kcF9kaXNwbGF5Ow0KPiA+ID4gPiArICAgICBzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yOw0KPiA+ID4gPiArICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9z
dGF0ZSAqY29ubl9zdGF0ZSA9IE5VTEw7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgY29ubmVj
dG9yID0NCj4gPiA+IGRybV9hdG9taWNfZ2V0X29sZF9jb25uZWN0b3JfZm9yX2VuY29kZXIoYXRv
bWljX3N0YXRlLA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBkcm1fYnJpZGdlLT5lbmNvZGVyKTsNCj4gPiA+ID4gKyAgICAgaWYg
KGNvbm5lY3RvcikNCj4gPiA+ID4gKyAgICAgICAgICAgICBjb25uX3N0YXRlID0NCj4gPiA+IGRy
bV9hdG9taWNfZ2V0X25ld19jb25uZWN0b3Jfc3RhdGUoYXRvbWljX3N0YXRlLA0KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbm5lY3Rvcik7DQo+ID4gPiA+DQo+ID4gPiA+ICAgICAgIGNydGMgPSBkcm1fYXRvbWlj
X2dldF9vbGRfY3J0Y19mb3JfZW5jb2RlcihhdG9taWNfc3RhdGUsDQo+ID4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fYnJpZGdlLT5lbmNv
ZGVyKTsNCj4gPiA+ID4gQEAgLTE5MCw2ICsyMTIsOSBAQCBzdGF0aWMgdm9pZCBlZHBfYnJpZGdl
X2F0b21pY19kaXNhYmxlKHN0cnVjdA0KPiA+ID4gZHJtX2JyaWRnZSAqZHJtX2JyaWRnZSwNCj4g
PiA+ID4gICAgICAgICogd2hlbiBkaXNwbGF5IGRpc2FibGUgb2NjdXJzIHdoaWxlIHRoZSBzaW5r
IGlzIGluIHBzciBzdGF0ZS4NCj4gPiA+ID4gICAgICAgICovDQo+ID4gPiA+ICAgICAgIGlmIChu
ZXdfY3J0Y19zdGF0ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZSkgew0KPiA+ID4gPiArICAgICAgICAg
ICAgIGlmIChjb25uX3N0YXRlKQ0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgY29ubl9z
dGF0ZS0+c2VsZl9yZWZyZXNoX2F3YXJlID0gZmFsc2U7DQo+ID4gPiA+ICsNCj4gPiA+ID4gICAg
ICAgICAgICAgICBkcF9kaXNwbGF5X3NldF9wc3IoZHAsIHRydWUpOw0KPiA+ID4gPiAgICAgICAg
ICAgICAgIHJldHVybjsNCj4gPiA+ID4gICAgICAgfSBlbHNlIGlmIChvbGRfY3J0Y19zdGF0ZS0+
c2VsZl9yZWZyZXNoX2FjdGl2ZSkgew0KPiA+ID4NCj4gPiA+IC0tDQo+ID4gPiBXaXRoIGJlc3Qg
d2lzaGVzDQo+ID4gPiBEbWl0cnkNCj4gPg0KPiA+IFRoYW5rcywNCj4gPiBWaW5vZCBQLg0KPiA+
DQo+IA0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg0KLS0NClRoYW5r
cw0KVmlub2QgUC4NCg==
