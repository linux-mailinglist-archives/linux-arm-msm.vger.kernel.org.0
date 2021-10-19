Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0290F432BE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 04:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbhJSCks (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 22:40:48 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:37048 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229663AbhJSCkr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 22:40:47 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 01CF5C449F;
        Tue, 19 Oct 2021 02:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1634611115; bh=VoRGVMfREamgZ/5P7THO7XcIL0z5WFlnn/w/6udvpdY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=BG07F01VNtEe4lDTGqgpoBDzsEHE2fCQSbX+hAiZfAqqLsNRpGe70v3N0TRyr2xGz
         SIW3oIaYmxDERgIz0unNSolv+jy5Qi//aaTkEvLJ4uRdINNxsrDspcSUAAXOfeJ0eV
         JrSbUi7QqmwkTelXrQpireFXdflqmkPONGwy5HqXwmQxwqQWS2wTmlxNlfWmsvr+53
         yyq2lsnnyyBbsvDDtVFtOIXBy7RbVKFlHsn9swT9HTh9V85A0285UPHLpLzC/vxwAt
         4cS9FRFISPW/xWGtMEAEXEk29BAOTaLi+Uw90QK3noIeHtDfYKsooiYHlAckpSYlII
         9Wgn3NTi7LLow==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 0890DA006D;
        Tue, 19 Oct 2021 02:38:33 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id EC931800B9;
        Tue, 19 Oct 2021 02:38:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="B/f63kwB";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/oKSrqrLoQhryto7IrUoDt4wUuRQPX5d55s9pRsnW6K8PGBt38aiT0ASJanGatXsulONlG0c1MHKgTIsD4hnmjXdhpjs9TNM3xndVNO06PoQoNLvNnvFHbFkTfHyUo01VAhjOy4gxx6JmCmO4xqA/e0tpK4DlvwtPLJx+xcBnATlzKZwosk9d78/62qlxNVJXtGALw++5KxS+aLzIJOLLwifsPjpM8WCcz1sRPdkDvriH1PEb6qDziOkB/RDGUMfgqRRE8nHkNlZ8F0AQwYoDMtcBQ7engnRzOKZWHWtmOigI/9LA1oc/PcNXbui8UTM/cuaogcCRtn8o9GxVGYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoRGVMfREamgZ/5P7THO7XcIL0z5WFlnn/w/6udvpdY=;
 b=MFK7/V1mg5P/8XkoR2BRSqumaQ/URw8l4NVCzKnWT6+VWIUKJgJ49+gWWgniDQZmMtSOny1bdRk3XLE9t+++XA0dAq/IP6bqU7E+ekcISHlqz8u0NBMn1b7TFuc7+cC403u60/5mskapdop6j2Lh3TzI8wN/ivBcmRKAPzqIue7d3S70tavlYHVSf/avI0gZ80qDL304RQZ9ymFjdjhYhAHXVl5U6KYaWhL5weQbo5M3wzalf1+lqAh7CFDnIV/JdJDkfleWwcWF58gMvefokTCI9T3jGu51G58Tw4f2QE11xs4yq4P01gYkZDZlPzChiwr7tk6MYDEWWGcUZ7l7hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoRGVMfREamgZ/5P7THO7XcIL0z5WFlnn/w/6udvpdY=;
 b=B/f63kwB0R2tY4DbwwaK6zD8QgTbC6bw9WeLT8U8CuFwFSQB+EZMpmZwhgW9jSS00V0nHxFGTCVUD6ChoiBbWO7JDDY93lquoFohHdrOBU7GTU62urAiu0zIIW3mSI26zIL2CSqv+Z8EmYP3c5t2g9OJFFj6Ee+aO+Mv994lUhc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB2901.namprd12.prod.outlook.com (2603:10b6:a03:138::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 02:38:30 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5865:4cfa:3e30:26d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5865:4cfa:3e30:26d6%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 02:38:30 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Topic: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Index: AQHXpVUbI6zrZuzuNkasP7SNAwlUbqucd/uAgAGWZYCAABurgIAEpB8AgCWYFoCACwyIgIABaFuAgAO90QCAAUEugA==
Date:   Tue, 19 Oct 2021 02:38:30 +0000
Message-ID: <205c4af2-37dd-6dbf-12ab-5111fadab530@synopsys.com>
References: <20210909083120.15350-1-jackp@codeaurora.org>
 <6a4bb7a9-2c63-5e1e-f4fc-a5bbc7aaa168@synopsys.com>
 <db0664a9-575f-1c6a-2efc-ec8372e2f1d4@codeaurora.org>
 <6538dd76-5dea-1e31-9459-657898be6d8f@synopsys.com>
 <926df659-7e31-9504-9752-a206f1eb8eaf@codeaurora.org>
 <56339fa2-e476-0f5b-9625-7016294e6be7@synopsys.com>
 <20211015005101.GA16586@jackp-linux.qualcomm.com>
 <9ecf98e9-0700-3a38-d056-5479f5188f4c@synopsys.com>
 <20211018072856.GB16586@jackp-linux.qualcomm.com>
In-Reply-To: <20211018072856.GB16586@jackp-linux.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bd0c670-bc11-4357-4857-08d992a98957
x-ms-traffictypediagnostic: BYAPR12MB2901:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB29015467115A7E910C00F90DAABD9@BYAPR12MB2901.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p5rcbfFvXz1LwuHOmfAWBqFMSWNcHsACuYOLp09oH81B5DY9mx71Zg00B2OT9AF77Ve1xD1VsXDSy1k5IJsJV5rg2AsVtUrW0RHNQhla2O23p0vKjkFtrK1mTXWbN4wZuxWjzwzDyVSUa63d6rqrUHt81NGjqNk0isABRKB3hL1UaT+lcmQu6gnLQKWhxQeyjN16mBU8c/3BZ1HkYQBlVckCCTrrnJpNkyv00RZrgdxZohOLwDdAIsGo0p0dposrCUGjnDuzvpFaR+oalKtE+hRWe2Ieiw9BawwPXWtq9c0aZVhIW3z/bz0wddm/9+DXQq1WGb3fL/LFtPo5b9Vkcl4PueKEUj8m/qikowB5U75GMIbVHjD0x9pz8+hr1hni37Ar8yvdx9qJGWlg5j5J+PKpEoSFCcA/bo/kmujKVHrcXTmOIC6b4TaH0HMAhMdmWUNYuySK021F9dCebPOY9IPa3gZ70dbCwTk+pNgpqUNqoZsk7BRHC4frJDmZ5r2G8lUVvU6uQ7U4M4bSc80SI7LjT4cQMIxD2gy7hX9ULNPjLLc8qZmvleqEKUWGBm5xo1Qje+9JeKMw1/ExUiR5k1AIL15s7XLnd+PRZNQuPFCpkFCbayUJX2Zdyhr8ujEfAiRlejB8AUR6VBnTSikCLbUydSANp34YvCoaypGmz//eIl5XUfIyl4yDywEw/dSz15ntFd+v9xxMw5BVDtVx7Ktm5/cU/e1sw6VihkkcXVljtOgIaprXCYk7B/rmAvbHIJsblralVsFIj+zPNP2B+g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(53546011)(6512007)(64756008)(6506007)(76116006)(66556008)(66476007)(66946007)(66446008)(2616005)(508600001)(83380400001)(4326008)(31686004)(8936002)(2906002)(38100700002)(8676002)(38070700005)(316002)(122000001)(5660300002)(31696002)(86362001)(54906003)(36756003)(6486002)(110136005)(26005)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzFwYXMyaUU2QzdNNjMvVE51NElMbVFjR09DU0lMZVlpeGVNWEx3TFlSOTkv?=
 =?utf-8?B?eWh2bEt1ZUhRVHd3amt1UXNwdE1lcGRrNlJyMlVnSU5jUDVkcFg4eFlaU2Fz?=
 =?utf-8?B?eERVNGxMU0praWYrcVl0TVVINCtLV3RGWUQ1VzYvNFpQOWUxSTVnR2ppZndN?=
 =?utf-8?B?N2lrUkp3SnpaMU4zM0JQNjIrQjVHRlNXbm1nZVAvaU15aXU3RjJYNC9abWpy?=
 =?utf-8?B?WU4rS2hCZ2M4RHFvQnltcmlUNURSOExGeXZ6RFpoV0tlUU5mSHMxd05jTEc1?=
 =?utf-8?B?cE5OY20vbk94Zy9iM2VaWFJHMGhub21NRVNLS1Yyd3NQT2p3bEIzTHpQMUJO?=
 =?utf-8?B?TnJUQmlrU3d6aTBjeDVGZGFPNDNEOWRlMy9HK0VZVnFlenZtb0RFL0JaM3V4?=
 =?utf-8?B?VHl1d2lTaXdqMFpQdUZ0bG53ajhVMVp1VUNnZEZWY3lldDRNMUpwc29tTnJN?=
 =?utf-8?B?UXlMbmFaNzBEcWdYZTU2NXF5UitSSkZ5REUrRmZiQ1ArUVh0Um9DR3J4a1ox?=
 =?utf-8?B?NUI3UVhyaHE2bmd5QzlDVTUzN2FwN01vZmdxTmtVYUJXVWREYmt1U0hVQWlj?=
 =?utf-8?B?ckVQcmRyOHZ6M0ttRStxZlRoUTc0eStlNzNqQVRiRDRPbzMzQ0lnWXlGZU56?=
 =?utf-8?B?Ynpqcjg0V1d3RVUzQytDb0pxUGxUMzhXYXJZRGFmcUdtNXdhMHBvdmJiZFZk?=
 =?utf-8?B?cUlpWldDbjhJMlQ0aDFaWVdoRkovL25wbFhIcVpGQW1MUlJIb3JNelpMMG01?=
 =?utf-8?B?bm8zaGg5Z09NT0pXWEpnbEJISUFIWG5sa2lyQ01IeTNGQlBwb1pPNE5LN09L?=
 =?utf-8?B?aWpUZ28vc1I0S0Y1cElwRmp1MGRyS3hOK1lCcU5wbTVZZy9WSmkvd05TWjls?=
 =?utf-8?B?eGt2Y3FQU1RyaTlsL0VhYzg4UHBvMlA3TExQWUlGN0lzcXFiZ3F6b0hseFF6?=
 =?utf-8?B?YnhXN2tIQXVPM1BOTHMvZlAxOGtQT0NKTFJzemVjVGVCVkJXMFR4akZOM1k4?=
 =?utf-8?B?SnlVbHY4eUZjTHlTclVOTlZTN05VOFNSNS9SU2EyZVlBVmtzU3VnSHNwWjlN?=
 =?utf-8?B?RkdmMDZtNFUxTEpkTWZwRkZCSTA1VC8zS28vOXZsQlpPbTVublN6czYwcTFL?=
 =?utf-8?B?N1pPbGt4Wkg3TnlVR0duWTE0UU1xMk9uaGgwdmxjSkdHNTNVQmh5SzNYMzJD?=
 =?utf-8?B?citpY3VoNzJKYlNXV0hmRjBmT0dTeTNNNzNBRDQyRGV4RUdUaGU1NXk0SldU?=
 =?utf-8?B?T0oxei9KN3cxVGxYWm5HUzgwQThldlBTZG1BZ3dTVFNnMWxORWRaS1FaZ3k1?=
 =?utf-8?B?Y0lkWnpWWHdhTE81NTAvdDRBeWhJNTUxRndaakxzc04yMG9YQUJmaUNZdWlN?=
 =?utf-8?B?WkhkRWtER0Z6alBweTV4V0dVdFVhVjZ2R3BpTlp2WUVWRkZ5bnBmV3BDU1Z6?=
 =?utf-8?B?Q2h6UU5CdVJwL1VqT3RTRFlZS3VDakpyK3BHNTJqL1A3UWJ6REIrV001akVC?=
 =?utf-8?B?TTg0STk5ZnBQditEeWtYMHphVWQ2b0w3eEUvME9WNTZXaVdxeEJIcmRhazBP?=
 =?utf-8?B?MTFNY283VXJPMXU5d0pRcENSQ25Tb1pLaVpINUI2NUZoN0hxYnpSZkwrVnBN?=
 =?utf-8?B?R014ZEYyNUFucGl6RXNoMVBDYzNVdzVUWXdxcjJ1K2lpczl5ZkMrRzYvaHla?=
 =?utf-8?B?K0RYZUMxakhRWU1TYnRsSHdzTFlUbloxTEtlZTZ2eWxLcEhXNlg4bXlFeTlr?=
 =?utf-8?Q?LXx1DZvaxw/AZvlL20=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F15F611208E7EA4CA24A7D7D3B14845D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd0c670-bc11-4357-4857-08d992a98957
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 02:38:30.0623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aMlBcgG6i946CrN+KK4OD69SUshmS3yz96nygcUqH+8x8Z2sqMXNwpZcuMLC0RHJfeOkgCaPHcXNDVPYMcfxdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2901
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SmFjayBQaGFtIHdyb3RlOg0KPiBPbiBGcmksIE9jdCAxNSwgMjAyMSBhdCAxMDoyMDo0OFBNICsw
MDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBKYWNrIFBoYW0gd3JvdGU6DQo+Pj4gT24gRnJp
LCBPY3QgMDgsIDIwMjEgYXQgMTI6MDc6MjBBTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0K
Pj4+PiBXZXNsZXkgQ2hlbmcgd3JvdGU6DQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4+IE9uIDkvMTAvMjAy
MSA4OjA4IFBNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+Pj4+Pj4gV2VzbGV5IENoZW5nIHdyb3Rl
Og0KPj4+Pj4+Pg0KPj4+Pj4+Pg0KPj4+Pj4+PiBPbiA5LzkvMjAyMSA2OjE1IFBNLCBUaGluaCBO
Z3V5ZW4gd3JvdGU6DQo+Pj4+Pj4+PiBKYWNrIFBoYW0gd3JvdGU6DQo+Pj4+Pj4+Pj4gU29tZSBm
dW5jdGlvbnMgbWF5IGR5bmFtaWNhbGx5IGVuYWJsZSBhbmQgZGlzYWJsZSB0aGVpciBlbmRwb2lu
dHMNCj4+Pj4+Pj4+PiByZWd1bGFybHkgdGhyb3VnaG91dCB0aGVpciBvcGVyYXRpb24sIHBhcnRp
Y3VsYXJseSB3aGVuIFNldCBJbnRlcmZhY2UNCj4+Pj4+Pj4+PiBpcyBlbXBsb3llZCB0byBzd2l0
Y2ggYmV0d2VlbiBBbHRlcm5hdGUgU2V0dGluZ3MuICBGb3IgaW5zdGFuY2UgdGhlDQo+Pj4+Pj4+
Pj4gVUFDMiBmdW5jdGlvbiBoYXMgaXRzIHJlc3BlY3RpdmUgZW5kcG9pbnRzIGZvciBwbGF5YmFj
ayAmIGNhcHR1cmUNCj4+Pj4+Pj4+PiBhc3NvY2lhdGVkIHdpdGggQWx0U2V0dGluZyAxLCBpbiB3
aGljaCBjYXNlIHRob3NlIGVuZHBvaW50cyB3b3VsZCBub3QNCj4+Pj4+Pj4+PiBnZXQgZW5hYmxl
ZCB1bnRpbCB0aGUgaG9zdCBhY3RpdmF0ZXMgdGhlIEFsdFNldHRpbmcuICBBbmQgdGhleQ0KPj4+
Pj4+Pj4+IGNvbnZlcnNlbHkgYmVjb21lIGRpc2FibGVkIHdoZW4gdGhlIGludGVyZmFjZXMnIEFs
dFNldHRpbmcgMCBpcw0KPj4+Pj4+Pj4+IGNob3Nlbi4NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IFdp
dGggdGhlIERXQzMgRklGTyByZXNpemluZyBhbGdvcml0aG0gcmVjZW50bHkgYWRkZWQsIGV2ZXJ5
DQo+Pj4+Pj4+Pj4gdXNiX2VwX2VuYWJsZSgpIGNhbGwgcmVzdWx0cyBpbiBhIGNhbGwgdG8gcmVz
aXplIHRoYXQgRVAncyBUWEZJRk8sDQo+Pj4+Pj4+Pj4gYnV0IGlmIHRoZSBzYW1lIGVuZHBvaW50
IGlzIGVuYWJsZWQgYWdhaW4gYW5kIGFnYWluLCB0aGlzIGluY29ycmVjdGx5DQo+Pj4+Pj4+Pj4g
bGVhZHMgdG8gRklGTyBSQU0gYWxsb2NhdGlvbiBleGhhdXN0aW9uIGFzIHRoZSBtZWNoYW5pc20g
ZGlkIG5vdA0KPj4+Pj4+Pj4+IGFjY291bnQgZm9yIHRoZSBwb3NzaWJpbGl0eSB0aGF0IGVuZHBv
aW50cyBjYW4gYmUgcmUtZW5hYmxlZCBtYW55DQo+Pj4+Pj4+Pj4gdGltZXMuDQo+Pj4+Pj4+Pj4N
Cj4+Pj4+Pj4+PiBFeGFtcGxlIGxvZyBzcGxhdDoNCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IAlkd2Mz
IGE2MDAwMDAuZHdjMzogRmlmb3NpemUoMzcxNykgPiBSQU0gc2l6ZSgzNDYyKSBlcDNpbiBkZXB0
aDoyMTc5NzMxMjcNCj4+Pj4+Pj4+PiAJY29uZmlnZnMtZ2FkZ2V0IGdhZGdldDogdV9hdWRpb19z
dGFydF9jYXB0dXJlOjUyMSBFcnJvciENCj4+Pj4+Pj4+PiAJZHdjMyBhNjAwMDAwLmR3YzM6IHJl
cXVlc3QgMDAwMDAwMDAwYmUxM2UxOCB3YXMgbm90IHF1ZXVlZCB0byBlcDNpbg0KPj4+Pj4+Pj4+
DQo+Pj4+Pj4+Pj4gVGhpcyBpcyBlYXNpbHkgZml4ZWQgYnkgYmFpbGluZyBvdXQgb2YgZHdjM19n
YWRnZXRfcmVzaXplX3R4X2ZpZm9zKCkNCj4+Pj4+Pj4+PiBpZiBhbiBlbmRwb2ludCBpcyBhbHJl
YWR5IHJlc2l6ZWQsIGF2b2lkaW5nIHRoZSBjYWxjdWxhdGlvbiBlcnJvcg0KPj4+Pj4+Pj4+IHJl
c3VsdGluZyBmcm9tIGFjY3VtdWxhdGluZyB0aGUgRVAncyBGSUZPIGRlcHRoIHJlcGVhdGVkbHku
DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBGaXhlczogOWY2MDdhMzA5ZmJlOSAoInVzYjogZHdjMzog
UmVzaXplIFRYIEZJRk9zIHRvIG1lZXQgRVAgYnVyc3RpbmcgcmVxdWlyZW1lbnRzIikNCj4+Pj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYWNrIFBoYW0gPGphY2twQGNvZGVhdXJvcmEub3JnPg0KPj4+
Pj4+Pj4+IC0tLQ0KPj4+Pj4+Pj4+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgNCArKysr
DQo+Pj4+Pj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVy
cy91c2IvZHdjMy9nYWRnZXQuYw0KPj4+Pj4+Pj4+IGluZGV4IDgwNGI1MDU0ODE2My4uYzY0N2M3
NmQ3MzYxIDEwMDY0NA0KPj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMN
Cj4+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+Pj4+Pj4+Pj4gQEAg
LTc0Nyw2ICs3NDcsMTAgQEAgc3RhdGljIGludCBkd2MzX2dhZGdldF9yZXNpemVfdHhfZmlmb3Mo
c3RydWN0IGR3YzNfZXAgKmRlcCkNCj4+Pj4+Pj4+PiAgCWlmICghdXNiX2VuZHBvaW50X2Rpcl9p
bihkZXAtPmVuZHBvaW50LmRlc2MpIHx8IGRlcC0+bnVtYmVyIDw9IDEpDQo+Pj4+Pj4+Pj4gIAkJ
cmV0dXJuIDA7DQo+Pj4+Pj4+Pj4gIA0KPj4+Pj4+Pj4+ICsJLyogYmFpbCBpZiBhbHJlYWR5IHJl
c2l6ZWQgKi8NCj4+Pj4+Pj4+PiArCWlmIChkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdDM19HVFhG
SUZPU0laKGRlcC0+bnVtYmVyID4+IDEpKSkNCj4+Pj4+Pj4+PiArCQlyZXR1cm4gMDsNCj4+Pj4+
Pj4+PiArDQo+Pj4+Pj4+Pj4gIAlyYW0xX2RlcHRoID0gRFdDM19SQU0xX0RFUFRIKGR3Yy0+aHdw
YXJhbXMuaHdwYXJhbXM3KTsNCj4+Pj4+Pj4+PiAgDQo+Pj4+Pj4+Pj4gIAlpZiAoKGRlcC0+ZW5k
cG9pbnQubWF4YnVyc3QgPiAxICYmDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gSGkgVGhp
bmgsDQo+Pj4+Pj4+DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gVGhpcyBzZWVtcyBsaWtlIGEgd29ya2Fy
b3VuZCBtb3JlIHRoYW4gYSBmaXguIEFzIHByZXZpb3VzbHkgcG9pbnRlZCBvdXQsDQo+Pj4+Pj4+
PiB0aGVyZSB3aWxsIGJlIHByb2JsZW1zIHdoZW4gdGhlcmUgYXJlIG11bHRpcGxlIGFsdGVybmF0
ZSBzZXR0aW5nDQo+Pj4+Pj4+PiBpbnRlcmZhY2UgWzJdLiBJZiB3ZSdyZSBkb2luZyB0aGlzIHdh
eSwgYXJlIHdlIHByb3Blcmx5IGFsbG9jYXRpbmcgdGhlDQo+Pj4+Pj4+PiBmaWZvIHNpemUgZm9y
IHRoZSBhbHRlcm5hdGUgc2V0dGluZyB0aGF0IHJlcXVpcmVzIHRoZSBtb3N0IGZpZm8gc2l6ZSBh
bmQNCj4+Pj4+Pj4+IG5vdCBqdXN0IHRoZSBmaXJzdCBhbHQtc2V0dGluZyAwPyBBbHNvIGRpZmZl
cmVudCBhbHQtc2V0dGluZyBjYW4gaGF2ZQ0KPj4+Pj4+Pg0KPj4+Pj4+PiBFYWNoIGFsdCBpbnRl
cmZhY2Ugd2lsbCBjYWxsIHVzYl9lcF9hdXRvY29uZmlnKCkgd2hpY2ggc2hvdWxkIGJlDQo+Pj4+
Pj4+IGFzc2lnbmVkIGRpZmZlcmVudCBlbmRwb2ludCBudW1iZXJzLiAgVGhpcyB3b3VsZCBtZWFu
IHRoYXQgaWYgYWx0IGludGYjMA0KPj4+Pj4+PiBnZXRzIHNlbGVjdGVkLCBhbmQgRVAgaXMgZW5h
YmxlZCwgdGhlbiB3ZSB3aWxsIHJlc2l6ZSB0aGUgVFhGSUZPIGFuZCBtYXANCj4+Pj4+Pj4gdGhh
dCBGSUZPIHRvIHRoZSBwaHlzaWNhbCBFUC4gIFRoZW4gd2hlbi9pZiB0aGUgaG9zdCByZXF1ZXN0
cyB0aGUgb3RoZXINCj4+Pj4+Pj4gYWx0IGludGYjMSwgYW5kIHRoYXQgY2FsbHMgRVAgZW5hYmxl
LCB0aGVuIHRoZSBsb2dpYyB3aWxsIHRoZW4gYXR0ZW1wdA0KPj4+Pj4+PiB0byByZXNpemUgYmFz
ZWQgb24gdGhlIHBhcmFtZXRlcnMsIGFuZCBhZ2FpbiBtYXAgdGhhdCBGSUZPIHRvIHRoZQ0KPj4+
Pj4+PiBwaHlzaWNhbCBFUC4gKHNpbmNlIHdlIGNhbGwgYXV0b2NvbmZpZyBvbiBhbGwgaW50ZXJm
YWNlcywgdGhleSBzaG91bGQgYmUNCj4+Pj4+Pj4gYXNzaWduZWQgZGlmZmVyZW50IGVuZHBvaW50
cykNCj4+Pj4+DQo+Pj4+PiBIaSBUaGluaCwNCj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4+PiBUaGF0J3Mg
bm90IHRydWUuIERpZmZlcmVudCBhbHQtc2V0dGluZ3Mgb2YgYW4gaW50ZXJmYWNlIGNhbiBzaGFy
ZQ0KPj4+Pj4+IGVuZHBvaW50IG51bWJlcnMuIFRoaXMgaXMgb2Z0ZW4gdGhlIGNhc2UgZm9yIFVB
U1AgZHJpdmVyIHdoZXJlDQo+Pj4+Pj4gYWx0LXNldHRpbmcgMCBpcyBmb3IgQk9UIHByb3RvY29s
IGFuZCBhbHQtc2V0dGluZyAxIGlzIFVBU1AuIFdoZW4gd2UNCj4+Pj4+PiBzd2l0Y2ggYWx0LXNl
dHRpbmcsIHdlIGRpc2FibGUgdGhlIGN1cnJlbnQgZW5kcG9pbnRzIGFuZCBlbmFibGUgdGhlDQo+
Pj4+Pj4gb2xkL25ldyBvbmVzLg0KPj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gVGhhbmtzIGZvciBwb2lu
dGluZyB0aGF0IHVzZSBjYXNlIG91dC4gIE1heWJlIHdlIGNhbiBjb25zaWRlciBzZWVpbmcgaWYN
Cj4+Pj4+IHdlIGNhbiB3YWxrIHRocm91Z2ggYWxsIGFsdGVybmF0ZSBpbnRlcmZhY2VzIGZvciBh
IHBhcnRpY3VsYXIgZnVuY3Rpb24sDQo+Pj4+PiBhbmQgcmVzaXplIGZvciB0aGUgbGFyZ2VzdCBz
ZXR0aW5nPyAgVGhhdCBtaWdodCBiZSBhIHBvc3NpYmxlDQo+Pj4+PiBpbXByb3ZlbWVudCBtYWRl
IHRvIHRoZSBjaGVja19jb25maWcoKSBmdW5jdGlvbi4gIExldCBtZSBzdGFydCBtYWtpZ24NCj4+
Pj4+IHRoZSBjaGFuZ2VzIGZvciB0aGlzIGFuZCB2ZXJpZnlpbmcgaXQuDQo+Pj4+Pg0KPj4+Pg0K
Pj4+PiBUaGFua3MhDQo+Pj4+DQo+Pj4+IEN1cnJlbnRseSB0aGUgZ2FkZ2V0IGNvbmZpZ3VyZXMg
ZWFybHkgYW5kIGluZm9ybXMgdGhlIGdhZGdldCBkcml2ZXIgb2YNCj4+Pj4gaG93IG1hbnkgZW5k
cG9pbnRzIGFyZSBhdmFpbGFibGUsIHdoaWNoIGRvZXNuJ3QgbGVhdmUgbXVjaCByb29tIGZvciB0
aGUNCj4+Pj4gZ2FkZ2V0IHRvIGRvIG9wdGltaXphdGlvbi9yZWNvbmZpZ3VyYXRpb24uDQo+Pj4+
DQo+Pj4+IElmIHRoZXJlJ3MgYW4gb3B0aW9uIGZvciB0aGUgY29tcG9zaXRlIGxheWVyIHRvIGlu
Zm9ybSB0aGUgY29udHJvbGxlcg0KPj4+PiBkcml2ZXIgb2YgdGhlIGVudGlyZSBjb25maWd1cmF0
aW9uLCB0aGVuIHdlIGNhbiB0YWtlIGFkdmFudGFnZSBvZiBtb3JlDQo+Pj4+IGR3YzMgY29udHJv
bGxlciBjYXBhYmlsaXR5L2ZsZXhpYmlsaXR5IChub3QganVzdCByZXNpemluZyB0eGZpZm8pLg0K
Pj4+Pg0KPj4+Pj4+Pg0KPj4+Pj4+PiBJIGFncmVlIHRoYXQgdGhlcmUgaXMgY3VycmVudGx5IGEg
bGltaXRhdGlvbiBiZWNhdXNlIHdlIGFyZSBnb2luZyB0bw0KPj4+Pj4+PiByZXNlcnZlIGF0IG1p
bmltdW0gMSBGSUZPIGZvciBCT1RIIGFsdCBpbnRlcmZhY2VzLCBldmVuIHRob3VnaCB0aGVyZSBp
cw0KPj4+Pj4+PiBvbmx5IDEgaW50ZXJmYWNlIGFjdGl2ZSBhdCBhIHRpbWUuICBUaGUgbWlzc2lu
ZyBsb2dpYyB0aGF0IHdlIG1pZ2h0IGJlDQo+Pj4+Pj4+IG1pc3NpbmcgaXMgc2VlaW5nIGhvdyB3
ZSBjYW4gcmUtcHVycG9zZSB0aGUgRklGTyB0aGF0IGlzIGJlaW5nIGRpc2FibGVkLg0KPj4+Pj4+
PiAgSG93ZXZlciwgSSB0aGluayBKYWNrJ3MgZml4IGhlcmUgd291bGQgYmUgYXBwbGljYWJsZSB0
byB0aGUgaW1wcm92ZW1lbnQNCj4+Pj4+Pj4gaW4gbG9naWMgdG8gcmUtdXNlL3JlLWFzc2lnbiBG
SUZPIHNwYWNlIGFsbG9jYXRlZCBieSBkaXNhYmxlZCBFUHMgYWxzby4NCj4+Pj4+Pj4NCj4+Pj4+
Pg0KPj4+Pj4+IEltcHJvdmVtZW50IGlzIGFsd2F5cyBncmVhdC4gSSBqdXN0IGhvcGUgd2UgZG9u
J3QganVzdCBzdG9wIHdoZXJlIHdlIGFyZQ0KPj4+Pj4+IG5vdy4gU2luY2UgeW91J3JlIHdvcmtp
bmcgb24gdGhpcyBmZWF0dXJlIGF0IHRoZSBtb21lbnQsIGl0IHdvdWxkIGJlDQo+Pj4+Pj4gZ29v
ZCB0byBhbHNvIHJlc29sdmUgc29tZSBvZiB0aGUgb3V0c3RhbmRpbmcgaXNzdWVzIGFzIEphY2sn
cyBmaXggc2VlbXMNCj4+Pj4+PiB0byBiZSBpbmNvbXBsZXRlLg0KPj4+Pj4+DQo+Pj4+Pg0KPj4+
Pj4gSWYgd2UgaW1wbGVtZW50IHRoZSBpbXByb3ZlbWVudCBtZW50aW9uZWQgYWJvdmUsIEkgdGhp
bmsgSmFjaydzIGZpeCB3aWxsDQo+Pj4+PiBiZSBhcHBsaWNhYmxlIHRoZXJlIGFzIHdlbGwuICBJ
ZiB3ZSByZXNpemUgZm9yIHRoZSBsYXJnZXN0IGFsdGVybmF0ZQ0KPj4+Pj4gaW50ZXJmYWNlLCB0
aGVuIHRoZXJlIHdvdWxkIGJlIG5vIHJlYXNvbiBmb3IgdXMgdG8gcmVzaXplIGFnYWluLg0KPj4+
Pj4NCj4+Pj4gQXMgbG9uZyBhcyB5b3UgaGF2ZSB0aGUgYWJvdmUgYXMgcGFydCBvZiB5b3VyIHJv
YWRtYXAsIEkgZG9uJ3QgbWluZA0KPj4+PiBKYWNrJ3MgZml4IGZvciBub3cuDQo+Pj4NCj4+PiBU
aGFua3MgZm9yIHlvdXIgaW5wdXQgYXMgYWx3YXlzIFRoaW5oLiAgRG9lcyB0aGUgcGF0Y2ggc3Rp
bGwgbG9vayBvayBpbg0KPj4+IGl0cyBjdXJyZW50IHN0YXRlPyAgTGFzdCB0aW1lIEkgaGFkIHJl
c3BvbmRlZCB0byBGZWxpcGUgdGhhdCBJIHdvdWxkIHRyeQ0KPj4NCj4+IFRYIGVuZHBvaW50cyBz
aG91bGQgaGF2ZSBub24temVybyBHVFhGSUZPU0laLiBVc2luZyB0aGUgcmVnaXN0ZXIgYXMgYQ0K
Pj4gZmxhZyB0byBjaGVjayB3aGV0aGVyIGl0J3MgYmVlbiByZXNpemVkIGlzIG5vdCBvay4gQWxz
bywgd2hhdCBoYXBwZW5lZA0KPj4gYWZ0ZXIgcmVzaXppbmcgdGhlIHR4Zmlmbz8gRG8geW91IHJl
c3RvcmUgaXRzIHByZXZpb3VzIGRlZmF1bHQgdmFsdWU/DQo+IA0KPiBUaGUgY2hvaWNlIHRvIHVz
ZSB0aGUgcmVzaXppbmcgYWxnb3JpdGhtIGlzIGEgZml4ZWQgc2V0dGluZyBkZXRlcm1pbmVkDQo+
IGJ5IGRldmljZSBwcm9wZXJ0eS4gIFNvIGlmIGl0IGlzIGVuYWJsZWQgZm9yIGEgcGFydGljdWxh
ciBwbGF0Zm9ybQ0KPiBpbnN0YW5jZSwgaXQgbWVhbnMgd2UgZG9uJ3QgaW50ZW5kIHRvIHVzZSBh
bnkgb2YgdGhlIGRlZmF1bHQgdmFsdWVzLg0KPiBBbGwgdGhlIHJlZ2lzdGVycyB3aWxsIGdldCBj
bGVhcmVkIHRvIDAgdXBvbiBldmVyeSBTZXQgQ29uZmlndXJhdGlvbiBzbw0KPiB0aGF0IGVhY2gg
RVAgZW5hYmxlIGNhbGwgdGhlcmVhZnRlciB3aWxsIGJlIHN0YXJ0aW5nIGZyb20gYSBjbGVhbiBz
bGF0ZS4NCg0KU29tZSBmaWVsZHMgb2YgR1RYRklGT1NJWiBtYXkgbm90IGdldCBjbGVhcmVkLiBE
ZXBlbmRzIG9uIHRoZSBjb250cm9sbGVyDQp2ZXJzaW9uLCB3ZSBpbnRyb2R1Y2UgZGlmZmVyZW50
IGZpZWxkcyAoYXMgdGhlIGNhc2UgZm9yIERXQzMyIGFuZA0KRFdDMzEpLiBTbyB0aGlzIG1heSBu
b3QgYXBwbHkgZm9yIGFsbCB0aGUgdGltZS4gSSBqdXN0IG5vdGljZWQgdGhhdCB0aGUNCmVudGly
ZSBHVFhGSUZPU0laIHdhcyB3cml0dGVuIHdpdGggMC4gUGxlYXNlIG9ubHkgd3JpdGUgdG8gdGhl
IHNwZWNpZmljDQpmaWVsZHMgd2l0aCBwcm9wZXIgbWFjcm9zLg0KDQo+IA0KPiBBcyB5b3UgY29y
cmVjdGx5IHBvaW50ZWQgb3V0IGhvd2V2ZXIsIHRoaXMgZG9lc24ndCBxdWl0ZSB3b3JrIHdlbGwg
Zm9yDQo+IEFsdFNldHRpbmdzIHdoZXJlIEVQcyBtYXkgY29tZSBhbmQgZ28gd2VsbCBhZnRlciB0
aGUgU2V0IENvbmZpZy4gIFRoaXMNCj4gd2lsbCBiZSB3aGVyZSBmdXR1cmUgaW1wcm92ZW1lbnRz
IHdpbGwgaG9wZWZ1bGx5IGFkZHJlc3MuDQo+IA0KPj4+IHRvIGVudGVydGFpbiBhZGRpbmcgYW4g
ZXhwbGljaXQgZmxhZyB0byBrZWVwIHRyYWNrIG9mIHdoZXRoZXIgYW4gRVAgaGFkDQo+Pj4gYmVl
biByZXNpemVkIHlldCBvciBub3QuICBXaGVuIHRyeWluZyB0byBpbXBsZW1lbnQgdGhpcyBhcyBh
bm90aGVyDQo+Pj4gRFdDM19FUF8qIGJpdCBmb3IgZGVwLT5mbGFncyB3ZSdkIHRoZW4gbmVlZCB0
byByZXRhaW4gdGhpcyBmbGFnIGFjcm9zcw0KPj4+IGVwX2Rpc2FibGUvZW5hYmxlIGNhbGxzLCBz
byBpdCBsb29rcyBhIHRpbnkgYml0IGN1bWJlcnNvbWUgYmVjYXVzZQ0KPj4+IGRlcC0+ZmxhZ3Mg
aXNuJ3QgbmVhdGx5IDAgYW55bW9yZSA6LVAuDQo+Pj4NCj4+PiBTbyBlcF9kaXNhYmxlKCkgd291
bGQgbmVlZCB0byBsb29rIHNvbWV0aGluZyBsaWtlIHRoaXM6DQo+Pj4NCj4+PiAgc3RhdGljIGlu
dCBfX2R3YzNfZ2FkZ2V0X2VwX2Rpc2FibGUoc3RydWN0IGR3YzNfZXAgKmRlcCkNCj4+PiAgew0K
Pj4+ICAuLi4NCj4+PiAJZGVwLT5zdHJlYW1fY2FwYWJsZSA9IGZhbHNlOw0KPj4+IAlkZXAtPnR5
cGUgPSAwOw0KPj4+IC0JZGVwLT5mbGFncyA9IDA7DQo+Pj4gKwlkZXAtPmZsYWdzICY9IERXQzNf
RVBfVFhGSUZPX1JFU0laRUQ7DQo+Pg0KPj4gSSB0aGluayB5b3UgbWVhbiB0aGlzPw0KPj4gZGVw
LT5mbGFncyAmPSB+RFdDM19FUF9UWEZJRk9fUkVTSVpFRDsNCj4gDQo+IE5vIEkgZG8gbWVhbiBB
TkQgd2l0aG91dCBhbnkgaW52ZXJ0aW5nLCBzaW5jZSBpZiB0aGF0IGZsYWcgd2FzIHNldCB3ZQ0K
PiBuZWVkIHRvIGtlZXAgaXQgc3RpbGwgc2V0IGFmdGVyIGRpc2FibGluZy4NCj4gDQo+Pj4gCXJl
dHVybiAwOw0KPj4+ICB9DQo+Pj4NCj4+PiBUaGUgZmxhZyB3b3VsZCBiZSBpbml0aWFsbHkgc2V0
IGluIGR3YzNfZ2FkZ2V0X3Jlc2l6ZV90eF9maWZvcygpIGFuZA0KPj4+IGFsc28gd291bGQgbmVl
ZCB0byBiZSBjaGVja2VkIHRoZXJlIGFzIHdlbGwgdG8gYXZvaWQgcmUtcmVzaXppbmcuICBJdA0K
Pj4+IHdvdWxkIHRoZW4gZ2V0IGNsZWFyZWQgaW4gZHdjM19nYWRnZXRfY2xlYXJfdHhfZmlmb3Mo
KS4NCj4+Pg0KPj4+IElzIHRoaXMgc3RpbGwgcHJlZmVyYWJsZSB0byB0aGUgY3VycmVudCBwYXRj
aCB3aXRoIGp1c3QgdGhlIHNpbmdsZQ0KPj4+IHJlZ2lzdGVyIHJlYWQ/DQo+Pj4NCj4+DQo+PiBX
aGF0IGlmIHdlIGNoYW5nZSB0aGUgY29uZmlndXJhdGlvbiBmcm9tIHRoZSBjb25maWdmcz8gV291
bGQgdGhlIGZsYWcNCj4+IHBlcnNpc3Q/IElmIHRoYXQncyB0aGUgY2FzZSwgdGhhdCBkb2Vzbid0
IGxvb2sgcmlnaHQuDQo+IA0KPiBZZXMsIGl0IG1pZ2h0IHN0aWxsIGJlIHNldCwgYnV0IHRoaXMg
aXMgb25seSBhIHRyYW5zaWVudCBzdGF0ZS4gIEl0IHdpbGwNCj4gZXZlbnR1YWxseSBnZXQgY2xl
YXJlZCBhdCB0aGUgdGltZSB0aGUgR1RYRklGT1NJWiBpcyByZXNldCBiYWNrIHRvIDANCj4gZHVy
aW5nIGR3YzNfZ2FkZ2V0X2NsZWFyX3R4X2ZpZm9zKCkgd2hlbiB0aGUgbmV4dCBTZXQgQ29uZmln
IChpbg0KPiBkd2MzX2VwMF9zZXRfY29uZmlnKCkpIGlzIHJlY2VpdmVkIGR1cmluZyBlbnVtZXJh
dGlvbiBpbiB0aGUgbmV3DQo+IGNvbmZpZ3VyYXRpb24uDQo+IA0KPiBJIGNhbiBnbyBhaGVhZCB3
aXRoIFYyIG9mIHRoaXMgcGF0Y2ggdXNpbmcgdGhpcyBmbGFnIHRvIGJlIG1vcmUgY2xlYXIuDQo+
IA0KDQpJIHRoaW5rIHVzaW5nIGEgZmxhZyBpcyBjbGVhcmVyIGFsc28uDQoNClRoYW5rcywNClRo
aW5oDQo=
