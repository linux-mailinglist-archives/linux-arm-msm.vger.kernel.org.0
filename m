Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64D7C553060
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 13:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347054AbiFULEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 07:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiFULEb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 07:04:31 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E8F38A9;
        Tue, 21 Jun 2022 04:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
  s=qccesdkim1; t=1655809470; x=1656414270;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Qr9gGDH1MmgHvc9LRJakg9rPb1NmhwVKIF2EWIX1QNE=;
  b=imn6yWACunZYu2KSXfsij70QOr98HK1b+erZbO8riO+SsQDR1eDmamcz
   kiBeCO0TEuhGcYktVyXl+j8/mnki0C1tJ9C/HmTnF83N7kSQnrTG3flyt
   wJR5pbvTRgSJJxbor0c/aZC3zpYjGVyKnTe70o6F53mISmbsVuQsOb6aX
   0=;
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 11:04:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBiXR+kFp+X2amBx3jmCPFhC2oAPoORQpsro0lichtHDvdQ8dF4X6qJhp3l44AozwKwFQaYsxasrgRs3KzM3qcz1xnBh2rKe27YH3UxzX6Yk76rf235PmtjoB8QN7OnqQnq2I+k6MbJVbZyzFkPfFDRPheK7bz3B+64+NQtwF9o9SE51Q5ExwMbOARlkFhwCI9mqevFs7FYL8mnG5XYfGagXE4JApeaEmdQ9ReDLEGRujuLFWy+u+zwptOVqLm+6svUAKZ+9vTieU59LPYHzckqMAv+O7hWBXtnVZj3IbmRDuMzmQYfF4Iq3uRamR5zCKIO4FNkNKwKmBFml16T7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qr9gGDH1MmgHvc9LRJakg9rPb1NmhwVKIF2EWIX1QNE=;
 b=oattHoVpHwYM9cgDaO09kYRbGuFDFYVvE11eVul6wP7LTANNxRoSoi2g8tEdT4hlgxt9UreUk24tqQ1UIHasviZKP7HKHtukGN4luAN8tFasJwkm0QQurNvJvwiNvc9r82ajPcKYyFw8ZHLfrXUIIgGSmLEfGVVWmcxJ+lvb+XKEt0R9Mf2k8BGx2IhHo0/u4CHIJN5bDlm3dxFQPoVWKKucnDy/c18uWDWASY64Yf489QJLivWyhAO2BfffSXabUSUzHYYH7ptPw3OXjNrcUCpvKffnBz5N3sZwaf0lenQB5BM4tH9lsmwwZRg0UUoC+Bg1c3Z3PxP5qQ9tVxAGRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by SJ0PR02MB7597.namprd02.prod.outlook.com (2603:10b6:a03:319::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Tue, 21 Jun
 2022 11:04:24 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::5483:ae3f:a820:b25e]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::5483:ae3f:a820:b25e%7]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 11:04:24 +0000
From:   Vinod Polimera <vpolimer@qti.qualcomm.com>
To:     Stephen Boyd <swboyd@chromium.org>,
        "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "dianders@chromium.org" <dianders@chromium.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "krzysztof.kozlowski@canonical.com" 
        <krzysztof.kozlowski@canonical.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "sam@ravnborg.org" <sam@ravnborg.org>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
CC:     "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>,
        "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>,
        "Vishnuvardhan Prodduturi (QUIC)" <quic_vproddut@quicinc.com>
Subject: RE: [PATCH v2 4/4] drm/msm/disp/dpu1: add PSR support for eDP
 interface in dpu driver
Thread-Topic: [PATCH v2 4/4] drm/msm/disp/dpu1: add PSR support for eDP
 interface in dpu driver
Thread-Index: AQHYJzKa8Soye2VFBEOcCg6sN+JNZqygGBcAgLpUmFA=
Date:   Tue, 21 Jun 2022 11:04:24 +0000
Message-ID: <BN0PR02MB8173F4B08B8E25D33F8E92D1E4B39@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-5-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n523rt_ThJSr=NTrjb2ASpb_4nnwNo9bTw8fZcz-yH9opQ@mail.gmail.com>
In-Reply-To: <CAE-0n523rt_ThJSr=NTrjb2ASpb_4nnwNo9bTw8fZcz-yH9opQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c7d9ea1-b572-4e2b-8472-08da5375cd45
x-ms-traffictypediagnostic: SJ0PR02MB7597:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR02MB759723584B615DAC1AD6DBEBE4B39@SJ0PR02MB7597.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 09MIRgK1yjnQVtkoptbOO/pwsKL3LJc+NZcScFBejetNB6qdTJeo+0tDpSVQW13n1Oug+2xDtDoIRbw8bEqKQq04CzvxSO/F+iBPg6WFN2c8YTnzwAbR/+4fr/Mfjx/sOJDasGAPv3gUyfe2WQFCM4lsne4Z+d78Maw/ucoxnZur3oryGeK+f9OlLerM8A0CjIpriwAV+ZA8ZRB7vd5IJSArIUQ+59zDB1RskVZ14wvRz0zXlPkexYVhyLTqHJ5ksP58brvegH2qSaBFs8BBI/69HraerFTsAMI1033RnU0fB59gpIJVqPBj/+hFgsglTWU1reC7cefOsGMsPq1N27WcL2mGQwWzygPMlJqXgSV+dAGkSzHfiseTzjJB5BscRKc6P2j466XOaLzgQbMP+AjeEBYkJo8vqDnihhutGH8BD+J6MwkTwuwwbi00FO1ofYQ7bqpHsG1K6IrYjGUtzvCzV0p04+w9GAbS8bK+4SODS3FjTpRyN2prC8Bz3CR5JgLoTtiGwpSSP5i+g6sPGsHsjKRNiTfitUJkMWJffloUwCuiEYu0B8LYNtq5Lm+1qtoLRGEFhaiYesP5y1tBcwwi1eNhsd8RgZ6SRTNhjt7rklCM/e5rttFtPU5t1gNndjXHieMrR3zlaRxtNZXSW/CjxQhQHr9z5VQoF1KaUtvHJuE/wH5Fvl3old6+wj6T9J/70MjVF9JW68mY5G8fTKizhMiKiGOi8gqBYUoIJdU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR02MB8173.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(122000001)(6506007)(921005)(38070700005)(38100700002)(110136005)(55016003)(316002)(54906003)(64756008)(186003)(7696005)(71200400001)(26005)(8676002)(66556008)(9686003)(66446008)(83380400001)(2906002)(76116006)(4326008)(7416002)(33656002)(8936002)(107886003)(86362001)(5660300002)(478600001)(52536014)(41300700001)(66476007)(53546011)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDJ3VmNwLzF6WTZ3NTI0MFpjaU92VmlzYWFrbk5jdUY4dUFUVlUwOWZkSXBO?=
 =?utf-8?B?bFdNaEFBNmV2WTJnVXJ6eUtqc0dsMTgxN1gyUVcwSlRvdUtWcUdtMFNjRERP?=
 =?utf-8?B?TlAvNytaUlo0azV5RFN5bTExSXZqcDBGNm95VjZnRmo2Qi9iVUxEMVRTZDVx?=
 =?utf-8?B?NXlCU2YwVnZ1SFBuQm1UQmxPTmJYWnNwYnlRSXZxbWdPTWJFQUJscy9YZ1BB?=
 =?utf-8?B?NHdacGI4NVFjNGdUa2JnS3lGUGVyQWJtY2ZUYnJFdHFWeGlPaE82dFlMZjRK?=
 =?utf-8?B?KzFrWCtSZzJmVzlROHhqOEY3a3M0dnovSENNK1lYaXhLK0ZpdFE3TU8xL05X?=
 =?utf-8?B?U0hpL0NHV0NuKzVDYVNoanpOVHZoUk5PMmROdGVUVHFvNElXbklnZGczbGI0?=
 =?utf-8?B?RXdxM3VkNGo3RGdVT05MZFBHalBucGhnS0RjaGxGemdGSlhkdjUwbkdRWHRr?=
 =?utf-8?B?ZWxYYzd6K21OZktkWkI5d2VCaGVkakpyQS9aWVZUbE5HNGlINHpHZUIzQlhr?=
 =?utf-8?B?ajBHUFJnU1dvSHZSN3J4UkszWGFHdk94aklUTGtsZENobGkwVERFTm5yaG1l?=
 =?utf-8?B?WnFqUXJNdWp6V25QZllZaWRpcVZrdGZKejU5SUNVengzTVJENDBWbTFIbDVK?=
 =?utf-8?B?VDdEL0VXU0Vzb3BOTlNWT1M0TEpLTkhGUVZFbFZaVi9ONzhDbXltcC9ldGJM?=
 =?utf-8?B?M1JEalVNTHpmcHpzdjE3L0RkT005a3hEN1BQMlk0QjVCTmJiT01oQ3RpeVZB?=
 =?utf-8?B?ellSZnJlQ3c2cUp0cFF5Y3NPUEtnMWQwWTk0S0JHT2xWdFYvdlZXSmdZeEho?=
 =?utf-8?B?ZStuQTdQR2swOVZIUXZEeDF5OGF3WU5weGlVbmpjQlZyemFzb25sZ1RNWEdm?=
 =?utf-8?B?RlN1Q0c4c2x3MVlpV3JaRFdLUTJUUUVYcnIrSGJnTHJXV012U0FVWEVCMzNt?=
 =?utf-8?B?UkppYjNNWnpPWjQyN3dDVWhSTk5WUWNFWDN1UXdQd2xhQVloUk1uT2RlK0Yx?=
 =?utf-8?B?K1pxdHZPdFNJN1J4Y2d4Skl5QUNBeHhjZDJJcWRMVUVHT0lZeEF4V0RWL3d1?=
 =?utf-8?B?T1YvaWlrYStOMXdGdE5aVVV4NmxSZHFMbDNqbVpacDZ0L0UwWngxRjNzNnNq?=
 =?utf-8?B?ajZOckV2K3Y1RngzS0RPRXpRUjR6VzNpYS9YaW9UQ2kvOWNSendUcTdCM3hS?=
 =?utf-8?B?VzJCbXhwQlFmZlpreklVS3ZqZklBelJMajhjVTlMUG9TbWhERzBxUXBtVmVn?=
 =?utf-8?B?cEZMZFByTjNWZlNPUmZvZWYybWtOL3o3TmZTWlJYWjZEZzFrRU1GWVI0QWNL?=
 =?utf-8?B?L3FPQ1pyL1dYL01OUHhCSzltdW1Jb3ZHN3FQcEpCUjArQUxpSTRBTTB2VWtv?=
 =?utf-8?B?YTQ2M0V4a0hBcVZIUFAxQ2hCYXI3SG5ncGNMM2duSGtuK2wwMDBlVFJMcnNB?=
 =?utf-8?B?THFqNjJ5UWNwMG8xRjdYZVAzZlhEYkdUbjFoTElBd2ZTTHlIVEJnWUVCUldE?=
 =?utf-8?B?TGtBeVpzbkhpb1lnR3Ixc0VNbWtkODRRbTR6M0Zld1VmS3NoRGE4M3hBTFVp?=
 =?utf-8?B?TkdJUldzNGpXMGVrUXBDSnp6bzMrVFk1RVo1SUxzUGNQNXBpQUlnNXlRdmxk?=
 =?utf-8?B?aU0yY3hWUDVLeXVIeFN3bjNTQzFDS2lwUXdGR0I4dE53Tno3NTRGK0NqaWV5?=
 =?utf-8?B?ckJIc3R1RUYxbUZXMGdVR2Vsd1VGc2lEZWhVbDFpNys1MlkzYmx0MHVHT0c2?=
 =?utf-8?B?cGlHQ3FYYWg5WFZaSXZYdG15VXJ0NFFEVjF0dk0xQS9oN0w0NCs5ZUZiMUl1?=
 =?utf-8?B?aGFZZ0hoWVdMWjBoRXZ2MkUxanN3Z1laMmxDYThWVDZSMk9JUjBTWGxuSGhJ?=
 =?utf-8?B?NTJwZUhYaFlZdkNEaE9xOER1Z3lKMXo5UlAzdmdzcXc3eVpJaklIYmFYb1hN?=
 =?utf-8?B?S3RsV214NkI3bkFQZzRoMTFLdmpIMDgwaVphRzBrVnU3UGpwd0M5VTloR1Ri?=
 =?utf-8?B?UFY3M21RNlB0eHNMOGZneDF1eHBJSFYrVjIxZGxTYVAyVHJkUGpZdENldm9Q?=
 =?utf-8?B?MVRCR1BucGJ0Yzg5MXpNaWkwSkI2dlorNUlJY2IxcG14U1VxbXMvU0FEaGJ2?=
 =?utf-8?B?UG9kSnRhd2VoTzdqbXMxcHZzTVF0N0s1T0VIbDh0NDI4SDBuK25MUERVSyty?=
 =?utf-8?B?UW9td3VxOVRKbTJxT3NOMUljZElnR0tPODNZbWJUUnM5NUFmQmo3RGx3MFo2?=
 =?utf-8?B?NXdiY0tJaFlodm9Bd1BoYzRiaWp2TE1HOFk3ZVZVUFJ0NjVweUlNSktNTlhQ?=
 =?utf-8?B?TmFFbjd1YittcjVZN05zY2JYK3dpVFd5ODM2aUhCSXNnOGxXd2JCU0MzQm9k?=
 =?utf-8?Q?bv3IwfJeztHswWJk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7d9ea1-b572-4e2b-8472-08da5375cd45
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 11:04:24.6042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nrkm/gaiC2tRen4fyc5Cprp03zRirfVDq50N8OVd0XccnYZkFjL4sghFa7tyc/FuQvA2kRUK+7eFLQdxb1kxStmRatcJcW+pzV6lqN2stwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7597
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBCb3lkIDxz
d2JveWRAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDIzLCAyMDIy
IDI6NTkgQU0NCj4gVG86IHF1aWNfdnBvbGltZXIgPHF1aWNfdnBvbGltZXJAcXVpY2luYy5jb20+
OyBhZ3Jvc3NAa2VybmVsLm9yZzsNCj4gYWlybGllZEBsaW51eC5pZTsgYmpvcm4uYW5kZXJzc29u
QGxpbmFyby5vcmc7IGRhbmllbEBmZndsbC5jaDsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc7IGRpYW5kZXJzQGNocm9taXVtLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGtyenlzenRvZi5rb3ps
b3dza2lAY2Fub25pY2FsLmNvbTsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyByb2JkY2xhcmtAZ21haWwuY29tOyByb2JoK2R0
QGtlcm5lbC5vcmc7DQo+IHNhbUByYXZuYm9yZy5vcmc7IHNlYW5wYXVsQGNocm9taXVtLm9yZzsg
dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tDQo+IENjOiBxdWljX2thbHlhbnQgPHF1aWNfa2FseWFu
dEBxdWljaW5jLmNvbT47IFNhbmtlZXJ0aCBCaWxsYWthbnRpIChRVUlDKQ0KPiA8cXVpY19zYmls
bGFrYUBxdWljaW5jLmNvbT47IHF1aWNfdnByb2RkdXQgPHF1aWNfdnByb2RkdXRAcXVpY2luYy5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNC80XSBkcm0vbXNtL2Rpc3AvZHB1MTogYWRk
IFBTUiBzdXBwb3J0IGZvciBlRFANCj4gaW50ZXJmYWNlIGluIGRwdSBkcml2ZXINCj4gDQo+IFdB
Uk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBs
ZWFzZSBiZSB3YXJ5DQo+IG9mIGFueSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBl
bmFibGUgbWFjcm9zLg0KPiANCj4gUXVvdGluZyBWaW5vZCBQb2xpbWVyYSAoMjAyMi0wMi0yMSAw
Njo1MToyNikNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2NydGMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMN
Cj4gPiBpbmRleCBlN2M5ZmUxLi5iYTMyNDBjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jDQo+ID4gQEAgLTk1MSw2ICs5NTIsMTQgQEAgc3RhdGlj
IHZvaWQgZHB1X2NydGNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsDQo+ID4NCj4gPiAg
ICAgICAgIERSTV9ERUJVR19LTVMoImNydGMlZFxuIiwgY3J0Yy0+YmFzZS5pZCk7DQo+ID4NCj4g
PiArICAgICAgIGlmIChvbGRfY3J0Y19zdGF0ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZSkgew0KPiA+
ICsgICAgICAgICAgICAgICBkcm1fZm9yX2VhY2hfZW5jb2Rlcl9tYXNrKGVuY29kZXIsIGNydGMt
PmRldiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbGRfY3J0Y19zdGF0
ZS0+ZW5jb2Rlcl9tYXNrKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZHB1X2VuY29k
ZXJfYXNzaWduX2NydGMoZW5jb2RlciwgTlVMTCk7DQo+ID4gKyAgICAgICAgICAgICAgIH0NCj4g
PiArICAgICAgICAgICAgICAgcmV0dXJuOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiAgICAg
ICAgIC8qIERpc2FibGUvc2F2ZSB2YmxhbmsgaXJxIGhhbmRsaW5nICovDQo+ID4gICAgICAgICBk
cm1fY3J0Y192Ymxhbmtfb2ZmKGNydGMpOw0KPiA+DQo+ID4gQEAgLTk2Miw3ICs5NzEsMTIgQEAg
c3RhdGljIHZvaWQgZHB1X2NydGNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsDQo+ID4g
ICAgICAgICAgICAgICAgICAqLw0KPiA+ICAgICAgICAgICAgICAgICBpZiAoZHB1X2VuY29kZXJf
Z2V0X2ludGZfbW9kZShlbmNvZGVyKSA9PSBJTlRGX01PREVfVklERU8pDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgcmVsZWFzZV9iYW5kd2lkdGggPSB0cnVlOw0KPiA+IC0gICAgICAgICAg
ICAgICBkcHVfZW5jb2Rlcl9hc3NpZ25fY3J0YyhlbmNvZGVyLCBOVUxMKTsNCj4gPiArICAgICAg
ICAgICAgICAgLyogSWYgZGlzYWJsZSBpcyB0cmlnZ2VyZWQgZHVyaW5nIHBzciBhY3RpdmUoZS5n
OiBzY3JlZW4gZGltIGluIFBTUiksDQo+IA0KPiBNdWx0aWxpbmUgY29tbWVudHMgc3RhcnQgd2l0
aCAvKiBvbiBhIGxpbmUgYnkgaXRzZWxmDQo+IA0KPiAgICAgICAgICAgICAgICAgLyoNCj4gICAg
ICAgICAgICAgICAgICAqIElmIGRpc2FibGUgaXMgdHJpZ2dlcmVkIC4uLg0KPiANCj4gPiArICAg
ICAgICAgICAgICAgICogd2Ugd2lsbCBuZWVkIGVuY29kZXItPmNydGMgY29ubmVjdGlvbiB0byBw
cm9jZXNzIHRoZSBkZXZpY2UNCj4gc2xlZXAgJg0KPiA+ICsgICAgICAgICAgICAgICAgKiBwcmVz
ZXJ2ZSBpdCBkdXJpbmcgcHNyIHNlcXVlbmNlLg0KPiA+ICsgICAgICAgICAgICAgICAgKi8NCj4g
PiArICAgICAgICAgICAgICAgaWYgKCFjcnRjLT5zdGF0ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZSkN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBkcHVfZW5jb2Rlcl9hc3NpZ25fY3J0YyhlbmNv
ZGVyLCBOVUxMKTsNCj4gPiAgICAgICAgIH0NCj4gPg0KPiA+ICAgICAgICAgLyogd2FpdCBmb3Ig
ZnJhbWVfZXZlbnRfZG9uZSBjb21wbGV0aW9uICovDQo+ID4gQEAgLTEwMTAsNiArMTAyNCw4IEBA
IHN0YXRpYyB2b2lkIGRwdV9jcnRjX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsDQo+ID4g
ICAgICAgICBzdHJ1Y3QgZHB1X2NydGMgKmRwdV9jcnRjID0gdG9fZHB1X2NydGMoY3J0Yyk7DQo+
ID4gICAgICAgICBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7DQo+ID4gICAgICAgICBib29s
IHJlcXVlc3RfYmFuZHdpZHRoID0gZmFsc2U7DQo+ID4gKyAgICAgICBzdHJ1Y3QgZHJtX2NydGNf
c3RhdGUgKm9sZF9jcnRjX3N0YXRlID0NCj4gPiArICAgICAgICAgICAgICAgZHJtX2F0b21pY19n
ZXRfb2xkX2NydGNfc3RhdGUoc3RhdGUsIGNydGMpOw0KPiANCj4gVXNlIHR3byBsaW5lcw0KPiAN
Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9jcnRjX3N0YXRlOw0KPiANCj4g
ICAgICAgICBvbGRfY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X29sZF9jcnRjX3N0YXRlKHN0
YXRlLCBjcnRjKTsNCj4gDQo+ID4NCj4gPiAgICAgICAgIHBtX3J1bnRpbWVfZ2V0X3N5bmMoY3J0
Yy0+ZGV2LT5kZXYpOw0KPiA+DQo+ID4gQEAgLTEwMzIsOCArMTA0OCwxMCBAQCBzdGF0aWMgdm9p
ZCBkcHVfY3J0Y19lbmFibGUoc3RydWN0IGRybV9jcnRjDQo+ICpjcnRjLA0KPiA+ICAgICAgICAg
dHJhY2VfZHB1X2NydGNfZW5hYmxlKERSTUlEKGNydGMpLCB0cnVlLCBkcHVfY3J0Yyk7DQo+ID4g
ICAgICAgICBkcHVfY3J0Yy0+ZW5hYmxlZCA9IHRydWU7DQo+ID4NCj4gPiAtICAgICAgIGRybV9m
b3JfZWFjaF9lbmNvZGVyX21hc2soZW5jb2RlciwgY3J0Yy0+ZGV2LCBjcnRjLT5zdGF0ZS0NCj4g
PmVuY29kZXJfbWFzaykNCj4gPiAtICAgICAgICAgICAgICAgZHB1X2VuY29kZXJfYXNzaWduX2Ny
dGMoZW5jb2RlciwgY3J0Yyk7DQo+ID4gKyAgICAgICBpZiAoIW9sZF9jcnRjX3N0YXRlLT5zZWxm
X3JlZnJlc2hfYWN0aXZlKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGRybV9mb3JfZWFjaF9lbmNv
ZGVyX21hc2soZW5jb2RlciwgY3J0Yy0+ZGV2LCBjcnRjLT5zdGF0ZS0NCj4gPmVuY29kZXJfbWFz
aykNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBkcHVfZW5jb2Rlcl9hc3NpZ25fY3J0Yyhl
bmNvZGVyLCBjcnRjKTsNCj4gDQo+IE1ha2UgdGhlc2UgdHdvIGxpbmVzIGFib3ZlIGludG8gYSBm
dW5jdGlvbiB3aXRoIGEgbWVhbmluZ2Z1bCBuYW1lPw0KPiBkcHVfZW5jb2Rlcl9hc3NpZ25fY3J0
Y3MoKT8gQW5kIHRoZW4gcHVzaCB0aGUgZW5jb2RlciBtYXNrIGl0ZXJhdGlvbg0KPiBpbnRvIHRo
ZSBsb29wIGJ5IHBhc3NpbmcgdGhlIG1hc2sgYXMgYSBmdW5jdGlvbiBhcmd1bWVudC4gSSBzZWUN
Cj4gZHB1X2VuY29kZXJfYXNzaWduX2NydGMoKSB0YWtlcyBhIHNwaW5sb2NrLCBzbyB3ZSBjb3Vs
ZCBwcm9iYWJseSB0YWtlDQo+IHRoYXQgbG9jayBvdXQgdG9vIGFuZCBwdXNoIGl0IGludG8gdGhp
cyBuZXcgZnVuY3Rpb24gdG8gYXZvaWQgZ3JhYmJpbmcNCj4gYW5kIGRyb3BwaW5nIHRoZSBzcGlu
bG9jayBtdWx0aXBsZSB0aW1lcy4NCiBlbmMgc3BpbmxvY2sgaXMgc3BlY2lmaWMgdG8gZWFjaCBk
cHVfZW5jIHdoaWNoIHdpbGwgZ3JhYiB0aGUgbG9jayBmb3IgZWFjaCBjcnRjIGFzc2lnbi4gDQo+
IA0KPiA+ICsgICAgICAgfQ0KPiA+DQo+ID4gICAgICAgICAvKiBFbmFibGUvcmVzdG9yZSB2Ymxh
bmsgaXJxIGhhbmRsaW5nICovDQo+ID4gICAgICAgICBkcm1fY3J0Y192Ymxhbmtfb24oY3J0Yyk7
DQo+ID4gQEAgLTE0OTcsNyArMTUxNSw3IEBAIHN0cnVjdCBkcm1fY3J0YyAqZHB1X2NydGNfaW5p
dChzdHJ1Y3QgZHJtX2RldmljZQ0KPiAqZGV2LCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4g
PiAgew0KPiA+ICAgICAgICAgc3RydWN0IGRybV9jcnRjICpjcnRjID0gTlVMTDsNCj4gPiAgICAg
ICAgIHN0cnVjdCBkcHVfY3J0YyAqZHB1X2NydGMgPSBOVUxMOw0KPiA+IC0gICAgICAgaW50IGk7
DQo+ID4gKyAgICAgICBpbnQgaSwgcmV0Ow0KPiA+DQo+ID4gICAgICAgICBkcHVfY3J0YyA9IGt6
YWxsb2Moc2l6ZW9mKCpkcHVfY3J0YyksIEdGUF9LRVJORUwpOw0KPiA+ICAgICAgICAgaWYgKCFk
cHVfY3J0YykNCj4gPiBAQCAtMTUzNCw2ICsxNTUyLDExIEBAIHN0cnVjdCBkcm1fY3J0YyAqZHB1
X2NydGNfaW5pdChzdHJ1Y3QNCj4gZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX3BsYW5lICpw
bGFuZSwNCj4gPiAgICAgICAgIC8qIGluaXRpYWxpemUgZXZlbnQgaGFuZGxpbmcgKi8NCj4gPiAg
ICAgICAgIHNwaW5fbG9ja19pbml0KCZkcHVfY3J0Yy0+ZXZlbnRfbG9jayk7DQo+ID4NCj4gPiAr
ICAgICAgIHJldCA9IGRybV9zZWxmX3JlZnJlc2hfaGVscGVyX2luaXQoY3J0Yyk7DQo+ID4gKyAg
ICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAgICBEUFVfRVJST1IoIkZhaWxlZCB0byBp
bml0aWFsaXplICVzIHdpdGggU1IgaGVscGVycyAlZFxuIiwNCj4gDQo+IFdoYXQgaXMgU1I/IFdy
aXRlIHNlbGYtcmVmcmVzaD8NCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY3J0Yy0+
bmFtZSwgcmV0KTsNCj4gPiArDQo+ID4gICAgICAgICBEUk1fREVCVUdfS01TKCIlczogc3VjY2Vz
c2Z1bGx5IGluaXRpYWxpemVkIGNydGNcbiIsIGRwdV9jcnRjLQ0KPiA+bmFtZSk7DQo+ID4gICAg
ICAgICByZXR1cm4gY3J0YzsNCj4gPiAgfQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2VuY29kZXIuYw0KPiA+IGluZGV4IDZlYWM0MTcuLmJhOWQ4ZWEgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMNCj4g
PiBAQCAtMjE3LDYgKzIxNywxNCBAQCBzdGF0aWMgdTMyIGRpdGhlcl9tYXRyaXhbRElUSEVSX01B
VFJJWF9TWl0gPSB7DQo+ID4gICAgICAgICAxNSwgNywgMTMsIDUsIDMsIDExLCAxLCA5LCAxMiwg
NCwgMTQsIDYsIDAsIDgsIDIsIDEwDQo+ID4gIH07DQo+ID4NCj4gPiArc3RhdGljIGlubGluZSBi
b29sIGlzX3NlbGZfcmVmcmVzaF9hY3RpdmUoc3RydWN0IGRybV9jcnRjX3N0YXRlICpzdGF0ZSkN
Cj4gDQo+IGNvbnN0IGRybV9jcnRjX3N0YXRlPw0KPiANCj4gPiArew0KPiA+ICsgICAgICAgaWYg
KHN0YXRlICYmIHN0YXRlLT5zZWxmX3JlZnJlc2hfYWN0aXZlKQ0KPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gdHJ1ZTsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gZmFsc2U7DQo+IA0KPiAg
ICAgICAgIHJldHVybiBzdGF0ZSAmJiBzdGF0ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZTsNCj4gDQo+
ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyB2b2lkIF9kcHVfZW5jb2Rlcl9zZXR1cF9kaXRoZXIo
c3RydWN0IGRwdV9od19waW5ncG9uZw0KPiAqaHdfcHAsIHVuc2lnbmVkIGJwYykNCj4gPiAgew0K
PiA+ICAgICAgICAgc3RydWN0IGRwdV9od19kaXRoZXJfY2ZnIGRpdGhlcl9jZmcgPSB7IDAgfTsN
Cj4gPiBAQCAtNjI5LDcgKzYzNyw4IEBAIHN0YXRpYyBpbnQgZHB1X2VuY29kZXJfdmlydF9hdG9t
aWNfY2hlY2soDQo+ID4gICAgICAgICAgICAgICAgIGlmIChkcm1fYXRvbWljX2NydGNfbmVlZHNf
bW9kZXNldChjcnRjX3N0YXRlKSkgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGRwdV9y
bV9yZWxlYXNlKGdsb2JhbF9zdGF0ZSwgZHJtX2VuYyk7DQo+ID4NCj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICBpZiAoIWNydGNfc3RhdGUtPmFjdGl2ZV9jaGFuZ2VkIHx8IGNydGNfc3RhdGUt
PmFjdGl2ZSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIWNydGNfc3RhdGUtPmFj
dGl2ZV9jaGFuZ2VkIHx8IGNydGNfc3RhdGUtPmFjdGl2ZSB8fA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjcnRjX3N0YXRlLT5zZWxmX3JlZnJlc2hfYWN0aXZl
KQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gZHB1X3JtX3Jlc2Vy
dmUoJmRwdV9rbXMtPnJtLCBnbG9iYWxfc3RhdGUsDQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZHJtX2VuYywgY3J0Y19zdGF0ZSwgdG9wb2xvZ3kp
Ow0KPiA+ICAgICAgICAgICAgICAgICB9DQo+ID4gQEAgLTExODIsMTEgKzExOTEsMzAgQEAgc3Rh
dGljIHZvaWQgZHB1X2VuY29kZXJfdmlydF9kaXNhYmxlKHN0cnVjdA0KPiBkcm1fZW5jb2RlciAq
ZHJtX2VuYywNCj4gPiAgew0KPiA+ICAgICAgICAgc3RydWN0IGRwdV9lbmNvZGVyX3ZpcnQgKmRw
dV9lbmMgPSBOVUxMOw0KPiA+ICAgICAgICAgc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdjsN
Cj4gPiArICAgICAgIHN0cnVjdCBkcm1fY3J0YyAqY3J0YzsNCj4gPiArICAgICAgIHN0cnVjdCBk
cm1fY3J0Y19zdGF0ZSAqb2xkX3N0YXRlOw0KPiA+ICAgICAgICAgaW50IGkgPSAwOw0KPiA+DQo+
ID4gICAgICAgICBkcHVfZW5jID0gdG9fZHB1X2VuY29kZXJfdmlydChkcm1fZW5jKTsNCj4gPiAg
ICAgICAgIERQVV9ERUJVR19FTkMoZHB1X2VuYywgIlxuIik7DQo+IA0KPiBQcmVzdW1hYmx5IHRo
aXMgcHJpbnQgd2FudHMgYSB2YWxpZCAnZHB1X2VuYycgcG9pbnRlci4NCj4gDQo+ID4NCj4gPiAr
ICAgICAgIGlmICghZHJtX2VuYykgew0KPiANCj4gU28gdGhpcyBjaGVjayBmb3IgIWRybV9lbmMg
aXMgaW1wb3NzaWJsZT8gUGxlYXNlIHJlbW92ZSBpdC4NCj4gDQo+ID4gKyAgICAgICAgICAgICAg
IERQVV9FUlJPUigiaW52YWxpZCBlbmNvZGVyXG4iKTsNCj4gPiArICAgICAgICAgICAgICAgcmV0
dXJuOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsgICAgICAgZHB1X2VuYyA9IHRvX2RwdV9lbmNvZGVy
X3ZpcnQoZHJtX2VuYyk7DQo+IA0KPiBXZSBnb3QgaXQgYWdhaW4/DQo+IA0KPiA+ICsNCj4gPiAr
ICAgICAgIGNydGMgPSBkcHVfZW5jLT5jcnRjOw0KPiA+ICsNCj4gPiArICAgICAgIG9sZF9zdGF0
ZSA9IGRybV9hdG9taWNfZ2V0X29sZF9jcnRjX3N0YXRlKHN0YXRlLCBjcnRjKTsNCj4gPiArDQo+
ID4gKyAgICAgICAvKg0KPiA+ICsgICAgICAgICogVGhlIGVuY29kZXIgdHVybiBvZmYgYWxyZWFk
eSBvY2N1cnJlZCB3aGVuIHNlbGYgcmVmcmVzaCBtb2RlDQo+IA0KPiBzL3R1cm4gb2ZmL2Rpc2Fi
bGUvDQo+IA0KPiA+ICsgICAgICAgICogd2FzIHNldCBlYXJsaWVyLCBpbiB0aGUgb2xkX3N0YXRl
IGZvciB0aGUgY29ycmVzcG9uZGluZyBjcnRjLg0KPiA+ICsgICAgICAgICovDQo+ID4gKyAgICAg
ICBpZiAoZHJtX2VuYy0+ZW5jb2Rlcl90eXBlID09IERSTV9NT0RFX0VOQ09ERVJfVE1EUyAmJg0K
PiBpc19zZWxmX3JlZnJlc2hfYWN0aXZlKG9sZF9zdGF0ZSkpDQo+ID4gKyAgICAgICAgICAgICAg
IHJldHVybjsNCj4gPiArDQo+ID4gICAgICAgICBtdXRleF9sb2NrKCZkcHVfZW5jLT5lbmNfbG9j
ayk7DQo+ID4gICAgICAgICBkcHVfZW5jLT5lbmFibGVkID0gZmFsc2U7DQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jDQo+IGIvZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jDQo+ID4gaW5kZXggNDdmZTExYS4u
ZDU1MGY5MCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfa21zLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21z
LmMNCj4gPiBAQCAtNDk1LDcgKzQ5NSw3IEBAIHN0YXRpYyB2b2lkIGRwdV9rbXNfd2FpdF9mb3Jf
Y29tbWl0X2RvbmUoc3RydWN0DQo+IG1zbV9rbXMgKmttcywNCj4gPiAgICAgICAgICAgICAgICAg
cmV0dXJuOw0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gLSAgICAgICBpZiAoIWNydGMtPnN0YXRl
LT5hY3RpdmUpIHsNCj4gPiArICAgICAgIGlmICghZHJtX2F0b21pY19jcnRjX2VmZmVjdGl2ZWx5
X2FjdGl2ZShjcnRjLT5zdGF0ZSkpIHsNCj4gPiAgICAgICAgICAgICAgICAgRFBVX0RFQlVHKCJb
Y3J0YzolZF0gbm90IGFjdGl2ZVxuIiwgY3J0Yy0+YmFzZS5pZCk7DQo+ID4gICAgICAgICAgICAg
ICAgIHJldHVybjsNCj4gPiAgICAgICAgIH0NCj4gPiAtLQ0KPiA+IDIuNy40DQo+ID4NCg==
