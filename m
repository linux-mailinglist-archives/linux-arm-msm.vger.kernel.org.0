Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3DE3F5382
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 00:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233130AbhHWWvI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 18:51:08 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45150 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229632AbhHWWvI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 18:51:08 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DA8E5C052D;
        Mon, 23 Aug 2021 22:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1629759024; bh=xqI1RgE5/ZzoStKiafzyfmcUV9XBrDSZONlKbf70wl8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=kws90nl7I60yCbiMlokvORatP4dELuHj56PciXMMpWwdZeZQzbJ/HwPmvukw7kPSo
         PAAcCj73a8m2O2FM8NOiqoRsFmk6QGa25rir/xYSSq6Ue6EcDyGzo3KeWoFct1dVFV
         CzCEpUShabJlSOUnErUnRjFxNhp1g60tiEJzRAOm3ztSP7QqTym+CBu3CE5eOjlpqr
         bwElNYlebm82NJpaEBabsH+u682ZIHXsY37fvupo2Sw5Yfl8vDuAtnWxuurBqlLhK3
         jNq1g4OIDnfM/W0TcGUmwLlmxTAxDG0VvVH5bIj48EFEqLmCbOpffzOh9jvuU9kXL8
         0qwpL5Yl5gCbg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 14478A008A;
        Mon, 23 Aug 2021 22:50:21 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A5FD34011B;
        Mon, 23 Aug 2021 22:50:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="sl+3NYc0";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7s8xTYvD7nqw2/cs9XCnVyJzRBkU1TWmYpr9+qgwIWinWQloxBeyjdrrKbas+KCaLb5unyZqYTiToYP7u78lcQvynV6Pqn+G30SnEqeouoR80gM6NpO0Us0MTllnlsTtGuq75lEXG/rhB1z5bxCw1CjYoUyD1AbSSnnWCkr/QvdvOgWQ2IDUsQBbWE4c3YakcOzI5UlFY4sJ/NIwSaGjNK7VTEUDzyyFii77zDFV/QKwSQhY7DTKUQba38q55SW5AZJ5DwnnVMjVEuu7cjbWB7QilgWo2xMo3Nreyd863XlCHLw8+EC0+cboWqwVMkeJR4S9ztUU51OVe5NoF4w9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqI1RgE5/ZzoStKiafzyfmcUV9XBrDSZONlKbf70wl8=;
 b=cWq29/pmyFYEABRgt1TepnjvsfFqBz+L7ImHSAPEnXVbk1zkLv9DB/2neeu3DO8ER4zf022XXK7YMG0ZwAuMG4Zb4ybaNQTaq0yl9hPiNiJv/afIrIIytTJ6WM5hoq/T7/LtcH+KkVA1IrQCiVMLFt8cRGWEO42f65GzgF8dqIhn5nhNdRS3XNyAkRSZQl5OJxdhjYVdmzq5NytbXF9nh6IZ4PhCTSdFdlTHUN2hAcQBECDeW+gyJ6RXyVPI2PNz3MEahNVann7J6CsoMo4f48BYcpXW0ukRn1vWxvlOdK/cI6CgGOG4DY8RpryKXSKKugx6L2qZTMHFDC0m81X6Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqI1RgE5/ZzoStKiafzyfmcUV9XBrDSZONlKbf70wl8=;
 b=sl+3NYc0PAckFLhFZmHXESvkwFCs6Ais7ZQuQQQhPUg0sYohos3ZF8DKzkJZqnlotm4224ygGLIAjch2P7tpwBiXTgkiUAYqKGwKMI5pINQkqW6e6RDixJ3+DXhvaDRqYqwt8YMBAQSQRl4hhzsIR/Gqwbg7aMK9ji9BhopOcOg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (20.179.58.12) by
 BYAPR12MB2951.namprd12.prod.outlook.com (20.179.93.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Mon, 23 Aug 2021 22:50:17 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::163:f142:621e:3db9]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::163:f142:621e:3db9%7]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 22:50:17 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Ferry Toth <fntoth@gmail.com>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "frowand.list@gmail.com" <frowand.list@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
Thread-Topic: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
Thread-Index: AQHXY19XAZwi78yISkmpAHKEyem9Z6sYsRqAgAANNYCAAApZfoACgUQAgAUa4ICALydQAIAAzcQAgABJ21yAAjMkAIAAmKmAgAB83gCAAAkpgIAALyYAgADa2ICAIGneAIAAjDEAgAKqKYCAAWINgIAA1WGAgADOsQCAAA8PAIAEoCeAgAFDLoCAAAX7gIAAA9iAgAB5oQA=
Date:   Mon, 23 Aug 2021 22:50:16 +0000
Message-ID: <7ad8b755-1fa0-3be4-3f2e-a4d95858e450@synopsys.com>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <87v951ldlt.fsf@kernel.org> <d9aef50c-4bd1-4957-13d8-0b6a14b9fcd0@gmail.com>
 <87pmv9l1dv.fsf@kernel.org> <9dc6cd83-17b9-7075-0934-6b9d41b6875d@gmail.com>
 <87a6mbudvc.fsf@kernel.org> <6e8bb4ad-fe68-ad36-7416-2b8e10b6ae96@gmail.com>
 <877dhev68a.fsf@kernel.org> <cca69e90-b0ef-00b8-75d3-3bf959a93b45@gmail.com>
 <874kchvcq0.fsf@kernel.org> <e59f1201-2aa2-9075-1f94-a6ae7a046dc1@gmail.com>
 <8735raj766.fsf@kernel.org> <b3417c2c-613b-8ef6-2e2d-6e2cf9a5d5fd@gmail.com>
 <b3e820f0-9c94-7cba-a248-3b2ec5378ab0@gmail.com>
 <d298df65-417b-f318-9374-b463a15d8308@ivitera.com>
 <a7d7f0dd-dfbb-5eef-d1da-8cbdab5fc4a7@gmail.com>
 <c4e29ac0-1df1-3c64-1218-3687f07e7f77@ivitera.com>
 <1fb52c92-9319-c035-722f-695ab34723dd@gmail.com>
 <702c72cd-40e4-e641-797a-764e7e611afb@ivitera.com>
 <CAHp75VeZBLgf8YhEjdOV1Hva_dJh_=VHRGyVb=r44yh-9n+F4A@mail.gmail.com>
 <d1fb0ad5-e304-8864-a2e4-42d5f652a6a7@ivitera.com>
In-Reply-To: <d1fb0ad5-e304-8864-a2e4-42d5f652a6a7@ivitera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ivitera.com; dkim=none (message not signed)
 header.d=none;ivitera.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45ba8f90-1f7d-429f-80bc-08d966886085
x-ms-traffictypediagnostic: BYAPR12MB2951:
x-microsoft-antispam-prvs: <BYAPR12MB29511047F825201042CB5E18AAC49@BYAPR12MB2951.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XFfPci2k839k81iHt+dQr2C77XWEBo6rIu7KuV3CE6cVYbSa7uPHQwF1DG6cOwYS8clOxlwCNdBm0EV5X6MbuZgjW+qbR/x1gr1f78d6zft6+ZUsFbPNImG9xiJtuLl/y/KZh/EuiP9vbP5magThrzu6W4L8QQ+eFdhMY7aJ3c/heNJDstbhaBpWDS3COCZRwAQt50LAh79ki53T+0LDw+qEUSCoQTHjh02W3A20uJuOsmJiASk2dNVUEHcuWdIgzz7oWYzoHdRxJKrG61xmm/htMHvg1FEgyIp7+y7I2+VSsHLUYxY54oJlH+yxTbXD55BjYwhRLzNH+MwlKqlfGd7beRcGMv0xOAmVYCa/9V5tAqDUuEEmz33Glk13LFk+Fo/fhiD3lbNURjf9D6Oc2eOCSJbyPaBFPHdx+7kMStmdUX5LoclGG9VozbqGO+wWLvxNWc079gBnHWWA1U4bC6yZoHTd6S0hhWFfboCkhay3ndGMMfXZ9fB/TeTmosOxIQTx1csR8zWiwGa25dAUa+0jTgX/mo3OtR7ujemuXAULyvujVXBmq4+oL4OqcRg5aPc97EjrUI02Mx3aMp+TwGO+XewtWgsrNTpXiQVuezBwMa9+jte1B8XEUsHZxY11Hl2+v96jv7/3VsN0zL63kIlG2Mrl6PC7/5EYfm/wCDnaZkUCDWj14PMuN6WmMxl5xPRkggo7Vs1lp0LfQj5Dr+JlU0oiw+0ELH1m6rDGZ12e7RYUHcIK4rZps+dBIuQJxmAZy1vcoUFbAp07LN+eOwHR0U6ehCujf2Ev4wsJca9JpNh4r+ySEt0oS2XOeW3+k4jPQAOE0XqHY+UPDrRKBZi4dtc9PhKsqEVBLrrrCu8nm3UbotB2mdq+pN4Lwnbq/PQaR6hq4fcKok1FJsGGJQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(346002)(136003)(396003)(366004)(31696002)(6486002)(966005)(110136005)(2616005)(71200400001)(2906002)(83380400001)(8936002)(478600001)(53546011)(6506007)(31686004)(36756003)(38100700002)(86362001)(4326008)(122000001)(66476007)(66556008)(64756008)(76116006)(38070700005)(186003)(66946007)(66446008)(7416002)(6512007)(5660300002)(54906003)(26005)(316002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVpSeVd3Ti9VWWxXa1VBc1pCWlpEM2x4Z0RlYTRYYUtET2dhb1IrMmtYZ0Ey?=
 =?utf-8?B?QVpiWDNoOXpJVldFY1dRVEFCT25EOVRmNFh6RjErWUt6TU9tRlRxc1cxM2R5?=
 =?utf-8?B?UHpvcXBIR2JNeXJiamtLa05uT25Mc1NuSGE4cEwxN0FsNFNsMmpiVS9HL0R2?=
 =?utf-8?B?V1Y3K0dJMkRObFJ5ZlRYUjFPRi9TS3dJSU8xRVNBNitNVlo0THRYMldCcGlU?=
 =?utf-8?B?dU9KWnZsUWN5Ly96c01CWXdheU1sbzJzVkFRajd3a3pCTHJrY2ZDclhrMXFB?=
 =?utf-8?B?RHFjTlVWL1Y1MmVSVi9VVWVya09JU3BHQ1dDZG9ZUEw4R2UxN2dua2V0d3N6?=
 =?utf-8?B?RUd2Vk9ZeXJBVmEwRHVzTGhPR0F2NWQvT1JobWY1OUVlK1MvZHRLN0p6MHVy?=
 =?utf-8?B?Z1JYeis3NkNxUHkxYTRxRC9seGMza1crczY2bHhCMktDbVRScW5rWXhteStt?=
 =?utf-8?B?TENWczdGVW41Vnl4LzJmTEc4citkMEhleTdXNUtDNzlJRVArNFY0WUJhcm5C?=
 =?utf-8?B?WHh4K1ZlVXFleEE1MEh4cWkzaGFDNjZkaC9tREFxODdaU1AvNnYxRklwR2RE?=
 =?utf-8?B?VDFnVUFCZUs5Q3RUdUc3Z3JvTFN3N1crdnVvdG5XTGpJMkpLOE9zQlhyQlpD?=
 =?utf-8?B?Nk8vaWFhOFpPb0Q4aENUK1N3WVRlK0lUbk55RmhKVnYvZHhFWHRmakdha21D?=
 =?utf-8?B?bGpVYkpyR2JmemdVVjgwdE5xclBXVGJMV3ZwMU5EY2VrK2NXdVpqZWtsZFRo?=
 =?utf-8?B?VFdjd2cyRzB1TU1PR0xlMlVCMjY3TGd3aXdkK1RnMUhkVzFra0pIR05NZ3NY?=
 =?utf-8?B?Yk1LSnhqYUdISVpkYnk2NE5pWEl4QkMrb3BjVHFGU05ndUMwaTNtN0I3bnJ4?=
 =?utf-8?B?OU1ybUQxeExwYk9NYlVBclE4YjRTUEdaNFNuTkZVb2Zjd1dLRzZkVUdQMWN5?=
 =?utf-8?B?YUg4anZBYjU0a2pkS1A3QlBJeGFyTmdFQmhMcDhvQ1Fiend2bWZ4dE1yaXRj?=
 =?utf-8?B?ODFSdnJKVXBjTmJGdWQ0dE4yRUc0N1FoRDQzRUQzN3pWQjlidEV3L3luZVln?=
 =?utf-8?B?UmFWTkh5Ni9DRm1hK2d3RVVFaVZPbWt6ZkFLbzk5UEpNN1E0OGNxZGdoa3Bk?=
 =?utf-8?B?NUdPSnRsaTNFSFB1SFBKREZ5V25hblVDRnR5U3BHaUZXWkRmWGZtN0VEWm9W?=
 =?utf-8?B?SGE4aU42S3N1Y3RyY0lPbnVnVmZKd0IyS1V5SEZqVGNPUnVES0NZMEorOXh0?=
 =?utf-8?B?cENYOTBqdVpheVdzdmFFMUZGejBCckxKdmRDS0QySDZOUlN3UVRyRHVFYThS?=
 =?utf-8?B?YzlpSjNtL2oxcjRXaFFkb1lBTWx5Qm0zbitPUFRFTFdpQmQxMnV5K1ZaUjZD?=
 =?utf-8?B?TTNiRXQxUE45Z3MzWkRkeU1uRlVremZDTFJSWVdaSFdqOW1ybGp2Vmp4Sy9L?=
 =?utf-8?B?QzYydFJTQUJjQUQ4dzRlOW5pNGVVSmVNeEhrM1A2aDhLU1c2RTVpaGdqQ3Zp?=
 =?utf-8?B?RG0vMEJ6Y0hDVGZlNmxCdWtyL0FlaDBTOWM5K0w3MDJrQm93cWdoMWIrRWY3?=
 =?utf-8?B?dzVmQnZCNWhnUjFOd2pnZWxJSE9ydHdqc2RpZ0daRXNWRFJUUlFzVFB2SEt0?=
 =?utf-8?B?SXQ5cmdQOTJVSmxVUXBVOUt1WWxTY2JoNUtQanR1QzBBV2V6dDFmR3gxa0hN?=
 =?utf-8?B?Y1ZVTElJMEIvV29hNGlhcGZDVjVHaHVWSy9jSkdMYnhzSEZNNkNhbHMvUVlN?=
 =?utf-8?Q?2CyGmAKcmqZdhw5NvE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADC72D9C548A9F43A4111815C41FD2F6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ba8f90-1f7d-429f-80bc-08d966886085
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 22:50:16.9293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Krjz2tPRxivl9w/RHkynqpNSmOrHjql73IK396Nxg4LVcpvxVB11E+JWJ+ZZFxOOpUkdC+91rqDCZ6Ny9LOQWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2951
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

UGF2ZWwgSG9mbWFuIHdyb3RlOg0KPiANCj4gDQo+IERuZSAyMy4gMDguIDIxIHYgMTc6MjEgQW5k
eSBTaGV2Y2hlbmtvIG5hcHNhbChhKToNCj4+IE9uIE1vbiwgQXVnIDIzLCAyMDIxIGF0IDU6NTkg
UE0gUGF2ZWwgSG9mbWFuDQo+PiA8cGF2ZWwuaG9mbWFuQGl2aXRlcmEuY29tPiB3cm90ZToNCj4+
PiBEbmUgMjIuIDA4LiAyMSB2IDIxOjQzIEZlcnJ5IFRvdGggbmFwc2FsKGEpOg0KPj4+PiBPcCAx
OS0wOC0yMDIxIG9tIDIzOjA0IHNjaHJlZWYgUGF2ZWwgSG9mbWFuOg0KPj4+Pj4gRG5lIDE5LiAw
OC4gMjEgdiAyMjoxMCBGZXJyeSBUb3RoIG5hcHNhbChhKToNCj4+Pj4+PiBPcCAxOS0wOC0yMDIx
IG9tIDA5OjUxIHNjaHJlZWYgUGF2ZWwgSG9mbWFuOg0KPj4+Pj4+PiBEbmUgMTguIDA4LiAyMSB2
IDIxOjA3IEZlcnJ5IFRvdGggbmFwc2FsKGEpOg0KPj4+Pj4+Pj4gT3AgMTgtMDgtMjAyMSBvbSAw
MDowMCBzY2hyZWVmIEZlcnJ5IFRvdGg6DQo+Pg0KPj4gLi4uDQo+Pg0KPj4+Pj4+Pj4gU28sIHdo
ZXJlIGRvIHdlIGdvIGZyb20gaGVyZT8NCj4+Pj4+Pj4NCj4+Pj4+Pj4gSSBrbm93IHRoZSBwYXRj
aGVzIGhhdmUgYmVlbiB0ZXN0ZWQgb24gZHdjMiAoYnkgbWUgYW5kIG90aGVycykuwqAgSQ0KPj4+
Pj4+PiBkbyBub3Qga25vdyBpZiBSdXNsYW4gb3IgSmVyb21lIHRlc3RlZCB0aGVtIG9uIGR3YzMg
YnV0IHByb2JhYmx5DQo+Pj4+Pj4+IG5vdC4gUnVzbGFuIGhhcyB0YWxrZWQgYWJvdXQgUlBpICht
eSBjYXNlIHRvbykgYW5kIEJlYWdsZWJvbmVCbGFjaywNCj4+Pj4+Pj4gYm90aCB3aXRoIGR3YzIu
IFBlcmhhcHMgdGhlIGR3YzIgYmVoYXZlcyBhIGJpdCBkaWZmZXJlbnRseSB0aGFuDQo+Pj4+Pj4+
IGR3YzM/DQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRoZSBwYXRjaGVzIGFkZCBhIG5ldyBFUC1JTiBmb3Ig
YXN5bmMgZmVlZGJhY2suIEkgYW0gc29ycnkgSSBoYXZlDQo+Pj4+Pj4+IG5vdCBmb2xsb3dlZCB5
b3VyIGxvbmcgdGhyZWFkIChpdCBzdGFydGVkIGFzIHVucmVsYXRlZCB0byB1YWMpLiBEb2VzDQo+
Pj4+Pj4+IHRoZSBwcm9ibGVtIGFwcGVhciB3aXRoIGZfdWFjMSBvciBmX3VhYzI/IFBsZWFzZSBo
b3cgaGF2ZSB5b3UNCj4+Pj4+Pj4gcmVhY2hlZCB0aGUgYWJvdmUgcHJvYmxlbT8NCj4+Pj4+Pg0K
Pj4+Pj4+IEknbSBzb3JyeSB0b28uIEkgZmlyc3QgYmVsaWV2ZWQgdGhlIGlzc3VlIHdhcyByZWxh
dGVkIHRvIHRoZSBwYXRjaA0KPj4+Pj4+IG1lbnRpb25lZCBpbiB0aGUgc3ViamVjdCBsaW5lLg0K
Pj4+Pj4+DQo+Pj4+Pj4gVGhlIHByb2JsZW0gYXBwYWVycyB3aXRoIGZfdWFjMi4gSSBib3N0IEVk
aXNvbl9BcmR1aW5vIGJvYXJkIGluIGhvc3QNCj4+Pj4+PiBtb2RlICh0aGVyZSBpcyBhIHN3aXRj
aCBhbGxvd2luZyB0byBzZWxlY3QgaG9zdC9kZXZpY2UgbW9kZSkuIFdoZW4NCj4+Pj4+PiBmbGlw
cGluZyB0aGUgc3dpdGNoIHRvIGRldmljZSBtb2RlIHVkZXYgcnVuIGEgc2NyaXB0Og0KPj4+Pj4+
IEJ1dCBhcyBJIGFtIHVzaW5nIGNvbmZpZ2ZzIChleGNlcnB0IGZvbGxvd3MpIGFuZCBqdXN0IGRp
c2FibGluZyB0aGUNCj4+Pj4+PiBsYXN0IDIgbGluZSByZXNvbHZlcyB0aGUgaXNzdWUsIEknbSBn
dWVzc2luZyB1YWMyIGlzIHRoZSBpc3N1ZS4gT3INCj4+Pj4+PiBleGNlZWRpbmcgdGhlIGF2YWls
YWJsZSByZXNvdXJjZXMuDQo+Pj4+Pj4NCj4+Pj4+PiAjIENyZWF0ZSBkaXJlY3Rvcnkgc3RydWN0
dXJlDQo+Pj4+Pj4gbWtkaXIgIiR7R0FER0VUX0JBU0VfRElSfSINCj4+Pj4+PiBjZCAiJHtHQURH
RVRfQkFTRV9ESVJ9Ig0KPj4+Pj4+IG1rZGlyIC1wIGNvbmZpZ3MvYy4xL3N0cmluZ3MvMHg0MDkN
Cj4+Pj4+PiBta2RpciAtcCBzdHJpbmdzLzB4NDA5DQo+Pj4+Pj4NCj4+Pj4+PiAjIFNlcmlhbCBk
ZXZpY2UNCj4+Pj4+PiBta2RpciBmdW5jdGlvbnMvZ3Nlci51c2IwDQo+Pj4+Pj4gbG4gLXMgZnVu
Y3Rpb25zL2dzZXIudXNiMCBjb25maWdzL2MuMS8NCj4+Pj4+PiAjIyMNCj4+Pj4+Pg0KPj4+Pj4+
ICMgRXRoZXJuZXQgZGV2aWNlDQo+Pj4+Pj4gbWtkaXIgZnVuY3Rpb25zL2VlbS51c2IwDQo+Pj4+
Pj4gZWNobyAiJHtERVZfRVRIX0FERFJ9IiA+IGZ1bmN0aW9ucy9lZW0udXNiMC9kZXZfYWRkcg0K
Pj4+Pj4+IGVjaG8gIiR7SE9TVF9FVEhfQUREUn0iID4gZnVuY3Rpb25zL2VlbS51c2IwL2hvc3Rf
YWRkcg0KPj4+Pj4+IGxuIC1zIGZ1bmN0aW9ucy9lZW0udXNiMCBjb25maWdzL2MuMS8NCj4+Pj4+
Pg0KPj4+Pj4+ICMgTWFzcyBTdG9yYWdlIGRldmljZQ0KPj4+Pj4+IG1rZGlyIGZ1bmN0aW9ucy9t
YXNzX3N0b3JhZ2UudXNiMA0KPj4+Pj4+IGVjaG8gMSA+IGZ1bmN0aW9ucy9tYXNzX3N0b3JhZ2Uu
dXNiMC9zdGFsbA0KPj4+Pj4+IGVjaG8gMCA+IGZ1bmN0aW9ucy9tYXNzX3N0b3JhZ2UudXNiMC9s
dW4uMC9jZHJvbQ0KPj4+Pj4+IGVjaG8gMCA+IGZ1bmN0aW9ucy9tYXNzX3N0b3JhZ2UudXNiMC9s
dW4uMC9ybw0KPj4+Pj4+IGVjaG8gMCA+IGZ1bmN0aW9ucy9tYXNzX3N0b3JhZ2UudXNiMC9sdW4u
MC9ub2Z1YQ0KPj4+Pj4+IGVjaG8gIiR7VVNCRElTS30iID4gZnVuY3Rpb25zL21hc3Nfc3RvcmFn
ZS51c2IwL2x1bi4wL2ZpbGUNCj4+Pj4+PiBsbiAtcyBmdW5jdGlvbnMvbWFzc19zdG9yYWdlLnVz
YjAgY29uZmlncy9jLjEvDQo+Pj4+Pj4NCj4+Pj4+PiAjIFVBQzIgZGV2aWNlDQo+Pj4+Pj4gbWtk
aXIgZnVuY3Rpb25zL3VhYzIudXNiMA0KPj4+Pj4+IGxuIC1zIGZ1bmN0aW9ucy91YWMyLnVzYjAg
Y29uZmlncy9jLjENCj4+Pj4+PiAuLi4uDQo+Pj4+Pg0KPj4+Pj4gQXMgeW91IHNheSwgY291bGQg
cGVyaGFwcyB0aGUgcmVhc29uIGJlIHRoYXQgdGhlIGV4dHJhIEVQLUlOIGFkZGVkIGluDQo+Pj4+
PiB0aG9zZSBwYXRjaGVzIChwcmV2aW91c2x5IDEsIG5vdyAyIHdpdGggdGhlIGRlZmF1bHQgY29u
ZmlnIHlvdSB1c2UpDQo+Pj4+PiBleGNlZWRzIHlvdXIgRVAtSU4gbWF4IGNvdW50IG9yIGF2YWls
YWJsZSBmaWZvcyBzb21laG93P8KgIFlvdSBoYXZlIGENCj4+Pj4+IG51bWJlciBvZiBmdW5jdGlv
bnMgaW5pdGlhbGl6ZWQuIElmIHlvdSBjaGFuZ2UgdGhlIGxvYWQgb3JkZXIgb2YgdGhlDQo+Pj4+
PiBmdW5jdGlvbnMsIGRvIHlvdSBnZXQgdGhlIGVycm9yIGxhdGVyIHdpdGggYSBkaWZmZXJlbnQg
ZnVuY3Rpb24/IEp1c3QNCj4+Pj4+IGd1ZXNzaW5nLi4uDQo+Pj4+Pg0KPj4+Pj4gWW91IHNob3Vs
ZCBiZSBhYmxlIHRvIHN3aXRjaCB0aGUgZGVmYXVsdCBhc3luYyBFUC1PVVQgKHdoaWNoDQo+Pj4+
PiBjb25maWd1cmVzIHRoZSBuZXcgZmVlZGJhY2sgRVAtSU4gKSB0byBhZGFwdGl2ZSBFUC1PVVQg
KHdoaWNoIHJlcXVpcmVzDQo+Pj4+PiBubyBmZWVkYmFjayBFUCkgd2l0aCBjX3N5bmM9OCBwYXJh
bWV0ZXIgb2YgZl91YWMyLg0KPj4+Pj4NCj4+Pj4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMv
X19odHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xNC1yYzYvc291cmNlL2RyaXZl
cnMvdXNiL2dhZGdldC9mdW5jdGlvbi9mX3VhYzIuYypMNDdfXztJdyEhQTRGMlI5R19wZyFMQnlT
ck1femdNR1YweC16WjduU3JzNTR5SncxR2xucFVWVVZ4ZFFFOFBlc3pTTVo2T2tGWDhsU29pZ3dS
YldRekxjVSQNCj4+Pj4+DQo+Pj4+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTQtcmM2L3NvdXJjZS9kcml2ZXJzL3VzYi9n
YWRnZXQvZnVuY3Rpb24vZl91YWMyLmMqTDgzMF9fO0l3ISFBNEYyUjlHX3BnIUxCeVNyTV96Z01H
VjB4LXpaN25TcnM1NHlKdzFHbG5wVVZVVnhkUUU4UGVzelNNWjZPa0ZYOGxTb2lnd1JmUDVUZFpD
JA0KPj4+Pj4NCj4+Pj4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC92NS4xNC1yYzYvc291cmNlL2luY2x1ZGUvdWFwaS9saW51eC91
c2IvY2g5LmgqTDQ1M19fO0l3ISFBNEYyUjlHX3BnIUxCeVNyTV96Z01HVjB4LXpaN25TcnM1NHlK
dzFHbG5wVVZVVnhkUUU4UGVzelNNWjZPa0ZYOGxTb2lnd1JlanpNYldPJA0KPj4+Pj4NCj4+Pj4+
IERvZXMgdGhhdCBmaXggdGhlIHByb2JsZW0/DQo+Pj4+DQo+Pj4+IE5vdCBzdXJlIGhvdyB0byBk
byB0aGF0LiBEbyB5b3UgbWVhbiB0aGUgbW9kdWxlIHNob3VsZCBoYXZlIGEgcGFyYW1ldGVyDQo+
Pj4+IGNhbGxlZCBjX3N5bmM/IGBtb2RpbmZvYCBsaXN0IG5vIHBhcmFtZXRlcnMgZm9yIHVzYl9m
X3VhYzIuDQo+Pj4NCj4+PiBUaG9zZSBhcmUgY29uZmlnZnMgcGFyYW1zLCBub3QgYXZhaWxhYmxl
IGluIG1vZGluZm8uDQo+Pj4NCj4+PiBJIGNoZWNrZWQgYW5kIHRoZSB2YWx1ZSBpcyAiYWRhcHRp
dmUiDQo+Pj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y1LjE0LXJjNy9zb3VyY2UvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9u
L2ZfdWFjMi5jKkwxMzEyX187SXchIUE0RjJSOUdfcGchTEJ5U3JNX3pnTUdWMHgtelo3blNyczU0
eUp3MUdsbnBVVlVWeGRRRThQZXN6U01aNk9rRlg4bFNvaWd3UlRFVGNic04kDQo+Pg0KPj4NCj4+
PiBJbiB5b3VyIGNvbmZpZ2ZzIHNjcmlwdDoNCj4+DQo+PiBLZXJuZWwgc2hvdWxkbid0IGNyYXNo
IHdpdGggYW55IGF2YWlsYWJsZSBzZXQgb2YgY29uZmlndXJhdGlvbg0KPj4gcGFyYW1ldGVycywg
cmlnaHQ/IFNvLCBldmVuIGlmIHRoZSBwYXJhbWV0ZXIgd291bGQgZml4IHRoZSBjcmFzaCB0aGUN
Cj4+IHNlcmllcyBpcyBidWdneSBhbmQgaGFzIHRvIGJlIHJldmVydGVkIGluIG15IG9waW5pb24u
DQo+IA0KPiBTdXJlLCBubyBwcm9ibGVtIHdpdGggcmV2ZXJ0aW5nLiBJIGFtIGp1c3QgdHJ5aW5n
IHRvIHN0YXJ0IHVwIHNvbWUNCj4gdHJvdWJsZXNob290aW5nLiBBIHJlc291cmNlIGV4aGF1c3Rp
b24gd2FzIG1lbnRpb25lZCBoZXJlLCB0aGF0J3Mgd2h5IEkNCj4gc3VnZ2VzdGVkIGEgd2F5IHRv
IHRlc3QgdGhlIHBhdGNoIHdpdGggdGhlIG9yaWdpbmFsIG51bWJlciBvZiBlbmRwb2ludHMNCj4g
YWxsb2NhdGVkLiBJIGRvIG5vdCBnZXQgYW55IGNyYXNoZXMgb24gbXkgc2V0dXAgd2hpY2ggdXNl
cyBmZXdlciBnYWRnZXQNCj4gZnVuY3Rpb25zLiBUaGF0J3Mgd2h5IEkgYXNrZWQgd2hhdCBoYXBw
ZW5zIGlmIHRoZSBmdW5jdGlvbnMgbG9hZCBvcmRlcg0KPiBpcyBjaGFuZ2VkLiBJIGFtIGFmcmFp
ZCB0aGlzIHRocmVhZCBpcyBzbyBjb21wbGV4IHRoYXQgdGhlIGFjdHVhbA0KPiBwcm9ibGVtIGhh
cyBiZWVuIGJ1cnJpZWQgaW4gdGhlIGhpc3RvcnkuDQo+IA0KDQpBcyBJIHBvaW50ZWQgb3V0IHBy
ZXZpb3VzbHksIHRoZSBjcmFzaCBpcyBwcm9iYWJseSBiZWNhdXNlIG9mIGZfdWFjMg0KcHJlbWF0
dXJlbHkgZnJlZWluZyBmZWVkYmFjayByZXF1ZXN0IGJlZm9yZSBpdHMgY29tcGxldGlvbi4NCnVz
Yl9lcF9kZXF1ZXVlKCkgaXMgYXN5bmNocm9ub3VzLiBkd2MyKCkgbWF5IHRyZWF0IGl0IGFzIGEg
c3luY2hyb25vdXMNCmNhbGwgc28geW91IGRpZG4ndCBnZXQgYSBjcmFzaC4NCg0KPiBBZ2Fpbiwg
SSBhbSBub3QgdGhlIGF1dGhvciBvZiB0aGUgcGF0Y2hlcywgbXkgVVNCIGtub3dsZWRnZSBpcyB3
YXkNCj4gdW5zdWZmaWNpZW50IGZvciB0aGF0LiBJIGFtIHRyeWluZyB0byBtYWtlIHRoZW0gd29y
ayBhcyB0aGV5IGFyZQ0KPiBpbXBvcnRhbnQgYW5kIG1ha2UgdGhlIGV4aXN0aW5nIGF1ZGlvIGdh
ZGdldCBhY3R1YWxseSB1c2FibGUuDQo+IA0KDQpJJ20gbm90IHN1cmUgaG93IGVhc3kgaXQgaXMg
Zm9yIHlvdSB0byBvYnRhaW4vdGVzdCBhIGRldmljZSB3aXRoIGR3YzMsDQpidXQgaXQgd291bGQg
YmUgZ3JlYXQgdG8gYWxzbyBoYXZlIGl0IGFzIHBhcnQgb2YgeW91ciB0ZXN0aW5nIHN1aXRlLiA6
KQ0KDQpUaGFua3MsDQpUaGluaA0K
