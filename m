Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00FD270CF72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 02:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235356AbjEWAjt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 20:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235543AbjEWAbC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 20:31:02 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCACFD;
        Mon, 22 May 2023 17:23:17 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MKnvsq012515;
        Mon, 22 May 2023 17:23:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=SpYDR9oKqWmKR+RyRrC2lNf+erPHjl7nJfY7B7vr3F4=;
 b=B4YNQFprxvtZy7ImEz6MD6usXA0BDIF5YJmUNzk4+2hi7tCzC17Efh10DXaS9/QRaoGC
 qKCb3Uba5Xlsc9/i/jc32F5HXLMteAgBq0wTGavxgfDk02jTHZ5PG/7ZXhYWWnScYqzH
 EyAjJDLWvq6JkBUf9LwC6G+FWoq7qqp53VfACB0tITcAAsfvLwGPKqdeLwkaPJwekwnX
 wa/G4h5cxXJzWpckObFdBmi5/VqH6wMWlgt4b6QnTvpUXcc4vT4nbmTpkALaW+GC0aav
 vRTeS7uj2c53jJr4BVXiYrPVV6VdHfiNp/eNUOU5IhvQStA17Fi5R9wX16cpegcGdj6B ww== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qpwf4rttq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 17:23:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684801382; bh=SpYDR9oKqWmKR+RyRrC2lNf+erPHjl7nJfY7B7vr3F4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=a4gHlcnNunwgPkJlnd2lJvMUS1YmR6LBdXwxUROJRsBzKGBnl6KT2mF7R7NHZO/ZA
         OiwR3XirCKrADp5MuJFSHJMPjsJDQPAarTy5B0WqCYtyKEy7aZqCk8ecjS+fpKRWu+
         nVwFyP2qh6KYcUmzuxTmdV6BFzzVjaIV39wq/pDYp2zo+9iWA0ouO8DhCALgy03/ee
         z+K0BpXrYCcmcPg6WRNWOIYsDa+KaXc7sJ4LqKt+r4qy4HOlJL/gHxWSIY5cN/ErWM
         wHP2kZrEE7nSVU0dmsEJTAQTrnXWE/kxCSKjGsuIO6ufENUAFFPJBTcRBsnmxHt1e5
         ACOdQ0vMhdC2g==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 81E67404D0;
        Tue, 23 May 2023 00:23:02 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3D898A0062;
        Tue, 23 May 2023 00:23:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qH0UCtLW;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6EB67403EC;
        Tue, 23 May 2023 00:23:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kc8FVI0GgVuWNG8ulj394Z+YefZOKCflSdcQSzYSk8cUfnR8E2M00lp+/2cc3DHbbtgjI2AvE374GQwBLbWTsgAK0QdMlVbAmmAAf1057p5Dealq8Qr3tjli3xxTumxzw2jm7+W1gKkonbzFmqQrf8JbnEZ5ASAKwBSDHWtUL52vtpL03pvPnDd4fuO6OE7KlrlrCRwXrHsDM2ty67N3hMjJDY66y+odR8g+WBRv1X6QxZeyrcwHMeTlmOg2SIb25LoK5QDCbzClqYXpzr2xe4FAtFKtI+iraQqolHu3cIMjJT/zaCUEVVTnhFQcKJUvhJG4UNOZ6h4AQlB0sJK5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpYDR9oKqWmKR+RyRrC2lNf+erPHjl7nJfY7B7vr3F4=;
 b=aY36x3z241pIUWxKcncHngONWnbh2AEdNA9LVI7+yt/DbhCzthR2ogyyNzdaEtWidayxZOH629ey/FEZAWRIcVLdmb/4l4cFTjk/iRtMlFgZv5rHSRuVO8dAoNucVkIbQwLb9vydC9BYufocQlsvq95SoAihuZQ0dXRrxqZMze1Pc9nIINekmdsndHMFKXZG8jyShPjPXBEmknh9vD3a3qRkvy7RXEPOrt0SzXYRiOblsLJulaIhYnpEhfmYf7+xG3EdY22KIETVJQuNvsFvQXdz9VHcwtaNFhiH6NwBCrB8uheeLKWBfz9bwzHo2km6nv2U5sEanCg2Kk0gMMUi6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpYDR9oKqWmKR+RyRrC2lNf+erPHjl7nJfY7B7vr3F4=;
 b=qH0UCtLW1QZiK0Wpq0ZSgKQn3fV6SC/69To8bHkUpVhd681KkUsqVPUwk5CEKDoXWzONRcFbE281cIP+MAGKyEJN7niecwmPAtfVY61A80Hv5jCx8iBzV/inOvAXWrcpfb+B3VQlSMAXlOviSBI+4c61vkVmKfsDi5cgA8YllmY=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 00:22:58 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312%6]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 00:22:58 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 20/97] usb: dwc3-qcom: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH 20/97] usb: dwc3-qcom: Convert to platform remove
 callback returning void
Thread-Index: AQHZiRPEgsWf44U5o0iNnjSdkoYyQa9nB0QA
Date:   Tue, 23 May 2023 00:22:58 +0000
Message-ID: <20230523002252.sprxtyghhy63skng@synopsys.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-21-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-21-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ0PR12MB6808:EE_
x-ms-office365-filtering-correlation-id: a78d6777-2a71-4d9b-ee3a-08db5b23dc74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rAhK6Eqe4d6NVyUlzq5SVGdNbDyqg7uP/fxc21sE3Ts27On+mv/5PvmS+O5hf1td7ZFrIJajLokbPPem7VCZ08AFaSqF6KmE+DQlYEcESWgkyjrLaOYyq8WkdVtrWeSz2KFBf6qnl+y6uvpA3sIfhHZ50bg+hlTgE+GPriOH08MMLAMat5cE8KzDnGcIqN0xKLlRG01u0EzhfsN58LhL5fDdpJChy8fwTkhvgkgU3tnEJVMMf6/+o6Gp9udq4Ff8t0rkO1+K3H2JsvdjfLSTWUT/Ff0NFTIbfBoVPSs+/shCzF4w7+nJHVHtfX/w7CisTEP0ByQccwFPEMbcle+A6PvAbGMZs0R3DrlpNX0PwrxBCjv6jB16UHZZJD9b4ts/DnEJJ7n6fJNnVQkMULjVR3vrUJy548vUBPvdM6ln2rDlzT7w3q/MytgaYEU6eYSafFA2LmEFNj9ZXPTIqPrKbhPdc6t78Qe2uRsHJ4vsjucEXRU1ziNqe+SkIn0c9TrK6EmHSyHd1OtQEHJuCoHWki0v2ULJRc2fCeq3CFGUK/+gqQ+L26jVw1QdsnHtafY9EpR5C0zsvgXp95E9I2b+CrTRSKgMx/9ctuF7E/zbCD8cCt1atD3U1WYNpGl5mRGf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(5660300002)(8936002)(8676002)(66574015)(83380400001)(2906002)(36756003)(186003)(2616005)(122000001)(38100700002)(38070700005)(86362001)(6512007)(6506007)(1076003)(26005)(54906003)(71200400001)(316002)(478600001)(66446008)(64756008)(66476007)(6916009)(4326008)(66556008)(76116006)(66946007)(6486002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDc3clVQRXJRd0czenNXZTFJNjRaWWFjOHJFTHVZSDUxTEd2NjlWNi9MT3Zr?=
 =?utf-8?B?Z1gxN0xXZVNMQXR0eFNPM29tc1RpYWhsWVJIVnhQeWlncmJYbEp1RVJrdTIr?=
 =?utf-8?B?TDQvbDBlNGZSMFdTNmxRdExUNlVFQXAxcDJ0SGp1ajQ0MkZIbElSR21ta25K?=
 =?utf-8?B?MUt5dXZuakI0Nk05MlhrZDIxeGhDSFN1SEhVbTFId0RwdTRSbzdhajRwL3dD?=
 =?utf-8?B?UzZEWTg4RmwxNUFVby9XakRTQ0NYWmRLVS9iK1lIM0dwWGovbTh0Y0Vpbzcv?=
 =?utf-8?B?Nis3T1pWNFRnKzhEQXphY0o4YUc3YlJRQ2dEeEw4TjZUcEo2N25RZzFHT1da?=
 =?utf-8?B?bjVMcHdqK3M2N21taE9xSW5Cd1lXdkYvcm5aUzMrSThETlFEN1c0V3hXYzhW?=
 =?utf-8?B?Y0M3dXNWQkJlbmxFb1VqanVUTGRQY0RnZkxDa241OXgyS05reVVwRTgyR3hG?=
 =?utf-8?B?Vm80cHVFOEJ2SnN3WjRJNXJuSTluZEFqbzNkWjg0S2NFNDI5RjUwMEtjbSt1?=
 =?utf-8?B?NU44bFBEOFVtOE1VWXpDRlk4UDZ5UTFQRGJzdU9HK3VGcEgvL1Irb3RxVTBT?=
 =?utf-8?B?SWQrRnovT0lUZDk5Wjh4enJ0Q1RoYlFGeHJNclludTMyWjQ3RFJLWkVLSWhJ?=
 =?utf-8?B?OFNkWTUxRlhSVVdwV3Rya0FEMXg0aHcvMndEaGxnSjFVREZ4blhCY0dZUFJy?=
 =?utf-8?B?eHB1T3lUUXFBWStzZ3dXNGlTaWRQN2F2dDNGRmZMWG9GbFJrYjdkaWZ2blhj?=
 =?utf-8?B?bForN1phdW9JeW5JSU5PaU16WURRVjVlWHMzZkNhTzA3L1c5bkJoeG9mL21i?=
 =?utf-8?B?NjlYdlBJQnphaUU4bkRYTk1uVlV5cmluYlNFK3ZPdUJRcXNXY3BYSXZhczZG?=
 =?utf-8?B?aEkvdkQ1dzdsYW05eWhGbjJNZURqVFphZ3hLNHdIVXF2alkvODltTTVTWFRU?=
 =?utf-8?B?ZHNTWWpzMlpoL0E5bS9yallDNU5YR01RczBJN2xwRmZmb21LUCtITHY4bnFj?=
 =?utf-8?B?U2NOdmpvZ3VVWTkzNXFNSGFGdXVCSkdITFd4bzdmaVBuNVJheVFvTFdBSjdV?=
 =?utf-8?B?ZjVKMWJ6RVo4ZWx6V08xdVFEZlBBcHYxOVJ0L2MvOXJwL0dCdEdVdEVhOWlX?=
 =?utf-8?B?NGV3bEhIcFVOMS9URkt1ZXpsWFlIUll6QlRNSVU4d21XcDhKTythb0VvRlVM?=
 =?utf-8?B?dXlvOGQ5aitjd01IODZYYTBMdnpIL1pUenNOTTBTUkRabHFXUzJqMkJMOE1R?=
 =?utf-8?B?bTF6UktNd0ZWZlg0QVhBcEhKL0xTZ1FFQmNGNXpDTytUQjVsd0VxTnpINmZ4?=
 =?utf-8?B?OEp5d0wwTWtQNkZtL2lRdCtWYk9LUnNNQmtZMDF0Tkl0aGFEUkV0THZLRDFs?=
 =?utf-8?B?UHk1cFVwdDhiaFpNSnFJblkvUFNoYkIrUEIvcXdCK2xGNXF3azVFcnZ3bStG?=
 =?utf-8?B?ZmdobUZLQVZyOUhESzZMZnl6YTl2U3o2K1JsMXEwalJ1MGt3VTdrTm9POU10?=
 =?utf-8?B?YlFBQ1V2QXQxTERzVzJwUHRmeE1vMnB4R2hUVWJISXYzdmZtVlh0THlGODVj?=
 =?utf-8?B?elVpS1hvaGZHKzhaampqSzBuTkFlK2FuN1haZ1ViNVlDSnMvbFo2bk52Q0dK?=
 =?utf-8?B?M0h5SjBSNndlK0ppMUpnK2tIVDc1NlpRY2pva3NFcXlZWmNhVFhwWGVnclVP?=
 =?utf-8?B?RUhkWWM4WkVIRGhONEkrVnl2cnZVeEQyTFl1QUk2R3oraFJGbTlidndVdTRo?=
 =?utf-8?B?MmNHaTVvQWlnT1I0S3ppY0JJV29GUFBUalFTcmVHVkRtNHI3bHB2WTJMNmd4?=
 =?utf-8?B?cmNESmVBUnJhRmtNdDRMNTZpOFVMbW03V2R2eWtsdG5FQXNxeTRuZG56dkhj?=
 =?utf-8?B?c1Fpb3VmSi9NUVcrSWxPTTBEWnVFbkx2K0h3cWFRQ3A0aUVHOXVQWnF0Ui93?=
 =?utf-8?B?YjRIYmlNVVpsSGt1SkdETmNxUVYrc2NTU202Y3k0am43NXRmbkF1M1ZjWDJL?=
 =?utf-8?B?TkQ0MklUWlhLaENvRlFTYUZJM0RZUWFsT0tzSWNOYUtwbGZzblBKR2JVZklO?=
 =?utf-8?B?ajRyaGp6dU5GZlZlS2s5MkpoeHJKVjJLTmdnUThlU1MwazN0ZTZ0Z3owMmRW?=
 =?utf-8?B?aXlxQ0p1Ym5kNTl6Q3A2VDNmKzZlbHpSNjZIUDd2YVlSRklEdVJocy9ZSmJv?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACECA3ED9CF2844493F6C031AB800537@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?VUc2RWJyOGRVcURwblRmZ1RSelZnbjVIWTlEbGFWWXZ2ZG40aWlpOXEzQXB6?=
 =?utf-8?B?QzE5bFZNZG1wMEFTVlc1cjg2dGNLN09DbXBVVzRZK1JYSzhCVFBjdWRmSEEr?=
 =?utf-8?B?Y3F0SnlJUjNzYnRWNTNsV2JxcGlKaDNHTG1PcHVvaVkzVFU0UXV2YWFWdTZ2?=
 =?utf-8?B?Sk1GcE9pdkdKMU5rc1VSZTNscjNFbDJ4OHRkbmJWVktWMTByTERKSDd3NGVQ?=
 =?utf-8?B?eEMyRERmYVhteHlMWi9rM2pyekgrWDhab09xM0RoU2t3ZHB5eW9wWURGbks5?=
 =?utf-8?B?cmVDTk1rb0Q3WEVMOGFmdXc4djUwdmsweE5TRXV6RWxzT3kxMGlXQjZNaEc5?=
 =?utf-8?B?MVZiY0dwN1dJakpRTmxMb29BZ0ZMQWVtV1FjMGJrMUFwVk1GUkZ2M2M5eVBV?=
 =?utf-8?B?UWZpL1lyeU9OZUZka0RiQ3VTSytSMXpXMit4bkRaOUlYM0xCNkNUMFJ4bS8w?=
 =?utf-8?B?ZENpMTBkRWhqM1FodHd2ZmhHQk5RS2wxQzlLZk05b3hhUTJXVEdKWkJBUVYr?=
 =?utf-8?B?STh4NzFEYmxoc3hURG9yWFgwZUZqNGQrbUZ6aUJlK3B2YUJCOTFDeDZING9L?=
 =?utf-8?B?akIrdUNhcFdUL2hUb056dGhqaDNZSGFjK0RKNFVQWWYwNHhhTG5lL0JCWXIx?=
 =?utf-8?B?Q3YvSVM5V1M2OU82emhYeUVMYVN1eDEvSWhtREpOdGZqVWl1c3pHSzZhVUxx?=
 =?utf-8?B?blkxd2pCdTNzNWY2bWdMN2ZFZ2hkYm1FUExPck1YOEpST3dZL0hpK0QwSTJp?=
 =?utf-8?B?ODRxc3JZeW9OcUJnSnRMNm83aGZJRHF5UmwxVFkwLytjZWR5ZWs3QWFOeTVD?=
 =?utf-8?B?NW9VOFpmWEVxWWZQRGxoSHluaU9tODFGNXcyaW0yWGwwTTlKaW9kOXRaaWtp?=
 =?utf-8?B?eTV3V2orUzVJL2tGaGdBT3BVN2FPRkRZQlUxYmhpYmF2Y1BlVVZEUnlpRnZx?=
 =?utf-8?B?SWVqYThGb0FxQnBLNzlRcmlhU1RSRXNkMEpObEpXVEwyYTc4aTF6RVJiM25D?=
 =?utf-8?B?U3hieW9MWlE2OGxvMktsM1NvZmFHejVwRWJZUWFKNlY2UzI2MmFtaVppaTBP?=
 =?utf-8?B?WFova0gxL05ZWlZkeXdWQ3RyU1VpVzlsMkhGMDF3a3VFOHdORUk1NFY0bnEr?=
 =?utf-8?B?NEZybDR4a2l2UEN3clpjUU5odXJuVVNIb1ZLM3pRdTdtRFJ2aGtPMmpOa2Q5?=
 =?utf-8?B?VnltZjUweFRZVnBEdGY4d1E5NUhVT3hDenNYcCtqOUVCd2oybHlNOGhqZ2F2?=
 =?utf-8?B?SFgvenRyMEhvczlock4xZ1hnaWRlOXgzRzYyNFhHYkFSdzVFZz09?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a78d6777-2a71-4d9b-ee3a-08db5b23dc74
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 00:22:58.3325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CvkpU+njhIYnLA+lWzz2VVYCF5iwIXAuQcUCE6nOLb2bmmRFpt15u/b55vzPu0ifIW+URJR3H5qWAP16XZSVUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808
X-Proofpoint-GUID: 2kZYjJIWqaNyeiC_y8gLqm-YuipO3U-q
X-Proofpoint-ORIG-GUID: 2kZYjJIWqaNyeiC_y8gLqm-YuipO3U-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305230001
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

T24gVGh1LCBNYXkgMTgsIDIwMjMsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0KPiBUaGUgLnJl
bW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGlj
aCBtYWtlcw0KPiBtYW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2li
bGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcgYnkNCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhv
d2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGlnbm9yZWQgKGFwYXJ0IGZyb20NCj4gZW1pdHRp
bmcgYSB3YXJuaW5nKSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFr
cy4gVG8gaW1wcm92ZQ0KPiBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3Zl
IGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3QNCj4gc3RlcCBvZiB0aGlzIHF1ZXN0
IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGljaCBhbHJlYWR5
DQo+IHJldHVybnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycyBhcmUgY29udmVy
dGVkLCAucmVtb3ZlX25ldygpIGlzDQo+IHJlbmFtZWQgdG8gLnJlbW92ZSgpLg0KPiANCj4gVHJp
dmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4g
dGhlIHJlbW92ZQ0KPiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyB8IDYg
KystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgYi9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+IGluZGV4IDk1OWZjOTI1Y2E3Yy4uMTY3Zjg1MWM4
ZTU5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gQEAgLTkzOCw3ICs5MzgsNyBAQCBzdGF0
aWMgaW50IGR3YzNfcWNvbV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAg
CXJldHVybiByZXQ7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBpbnQgZHdjM19xY29tX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArc3RhdGljIHZvaWQgZHdjM19xY29tX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBkd2Mz
X3Fjb20gKnFjb20gPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gIAlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiBAQCAtOTU4LDggKzk1OCw2IEBAIHN0YXRpYyBpbnQg
ZHdjM19xY29tX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgDQo+ICAJ
cG1fcnVudGltZV9hbGxvdyhkZXYpOw0KPiAgCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOw0KPiAt
DQo+IC0JcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQg
ZHdjM19xY29tX3BtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiBAQCAtMTA1Miw3ICsx
MDUwLDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShhY3BpLCBkd2MzX3Fjb21fYWNwaV9tYXRjaCk7
DQo+ICANCj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGR3YzNfcWNvbV9kcml2ZXIg
PSB7DQo+ICAJLnByb2JlCQk9IGR3YzNfcWNvbV9wcm9iZSwNCj4gLQkucmVtb3ZlCQk9IGR3YzNf
cWNvbV9yZW1vdmUsDQo+ICsJLnJlbW92ZV9uZXcJPSBkd2MzX3Fjb21fcmVtb3ZlLA0KPiAgCS5k
cml2ZXIJCT0gew0KPiAgCQkubmFtZQk9ICJkd2MzLXFjb20iLA0KPiAgCQkucG0JPSAmZHdjM19x
Y29tX2Rldl9wbV9vcHMsDQo+IC0tIA0KPiAyLjM5LjINCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBO
Z3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o
