Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B20925A4D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 07:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgIBFKd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 01:10:33 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:6012 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgIBFKa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 01:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1599023428; x=1630559428;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Mck26RQzN5xmNC5QAv5OOxbey49vtuBE6wweHry4UzA=;
  b=b3MC0sS0KHIBuY2YX/GCXQ3qXMDQ8W7F0uTTSYz4hv/D3dSlW6c7RsRZ
   +eaipqnLcxSvmbtVIP0pbBPdq8edS+g6sZ0beZma3TkcTsZGHzk59vn/F
   5Gyv/PKPKJL+DItwAWVpAAtTTHKCCGLCuaGTCoX4FTSEIKHHWW4464HXI
   CNYiLdbdwSgbvHJJTtW9Q5kHjhVe7XhEb/VbU94FQXMB6Qq9sRO/5FL/M
   wQ4xyg+v1FSvCoI/BK9l3C2uoI10EUFA6vev6ieKcyl2KZI+MpBH1zBbh
   9W8m8ZfHKEiVSgrrjc8JSTH+zApltiHkp3/vhmVd++tH6DubOfqgkga2p
   Q==;
IronPort-SDR: iAnFgyusQRUalp/mCk1baiv068tzzPuFo95n0g3b7PCpx724hNwmN6hgIbHxlMOaPTK2sIxhGt
 NdHQt4d3AV7djfPynJ2zTgeqeJz/A7sAtYSz2FB8x00Og15N1KVHOLcnj74mm74NnHwyjPwVDa
 LKYTaQQ+NghIpZ8V8bTIM36mFpnEDjeQoLzt7sgiVf3tfjboKRk/z2M9rq/qmkAhgNhtJkqT1F
 JZamA/XNoY/5ssLOoBWRc1WoTx5gQcA5AUDsD4axHVEUE1LTP9sGy5VwPAhqO3LZTWMozbRPF7
 yzM=
X-IronPort-AV: E=Sophos;i="5.76,381,1592841600"; 
   d="scan'208";a="147603230"
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
  by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2020 13:10:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyxxyfGhZ1JZHUS/gTd596zGL2M5GT19sSUBEqR3zfQOCnMtId7tnr46TvUjCgbJtGrDXqt7zBo55gi8N6tvRrlJMAx6AZh/qmcLDmkcjpNi/gqhYDbHfPg3Tyjsr960sLtvRY1higEKjQwtYI8ouIVGf+Cgy3tFMtoKQL3xr13khlwnI/oPvchWdghvrLm+z0Jv6WXNg59szsC6jZyRSLwbbSqTn9hIL7Jve5GVt2HFPeAYDcwQPmz9rKmKfpO4RxY/sik+IscLt27MUvNrWQCZq9AtHPAJ6w88lMPzEKEo2VmxKBrhUWFoB8qyGqb9ObcFpRk0ANKWEyFW80mVyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mck26RQzN5xmNC5QAv5OOxbey49vtuBE6wweHry4UzA=;
 b=RvSKBHI5CNZUZflixHF7b8txsCQxfqWMjKV2pg+5VGnSCj0xDHNw8pYeTFHnZ0uCQwO6QYp0xlpipy4zorSeJAOO6jNAYxxNjV7O+IXXQ+W0PAmDNKOamZc4MvDKRJKIAgMuHm+sxGv0r1ibgue5oe17tcitm/n+Zqm/tdcDOLYP8JVnC59aJi76pgsKLPM32GiZer1hssmBnWvkT4I3zvWV5e0130Aus2/wmiuVQb39wN7bPYVkEzojP0v2HYEuz+h0k1hj+o2Wwzed/ETad6YfVTtx/y4pdysnZqa0Qna0x8j3aBdNDEQWDkp0D2DoWBIydX0pGV9b70viXKBzhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mck26RQzN5xmNC5QAv5OOxbey49vtuBE6wweHry4UzA=;
 b=T3MF2QhMQPnOAb1XezFZjJNZXM2v7fsGIpT4aTZkk4LS0gXPGakiq54d31k0Sgkgt00hDP5h7Z0NErY/IzHwKa/PB85FEIP8G5uSisB59Zckqe88A9LvHdv/oVIU9ZREzg9chmcrWskdOfy7s9UP4e73EexhNuOFvaVOb4DLM7w=
Received: from BY5PR04MB6705.namprd04.prod.outlook.com (2603:10b6:a03:220::8)
 by BYAPR04MB5767.namprd04.prod.outlook.com (2603:10b6:a03:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 05:10:23 +0000
Received: from BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::1083:4093:49fa:a3fd]) by BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::1083:4093:49fa:a3fd%2]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 05:10:23 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>
CC:     "cang@codeaurora.org" <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 1/1] scsi: ufshcd: Allow zero value setting to
 Auto-Hibernate Timer
Thread-Topic: [PATCH v1 1/1] scsi: ufshcd: Allow zero value setting to
 Auto-Hibernate Timer
Thread-Index: AQHWfaC3kd0c1Nm+d0KoEDt9jyytd6lOsAkwgAPXxwCAAkrNAA==
Date:   Wed, 2 Sep 2020 05:10:23 +0000
Message-ID: <BY5PR04MB67058266FB01737736CFC978FC2F0@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <b141cfcd7998b8933635828b56fbb64f8ad4d175.1598661071.git.nguyenb@codeaurora.org>
 <BY5PR04MB6705177184FC1A0E5F7710FDFC530@BY5PR04MB6705.namprd04.prod.outlook.com>
 <96e34a8d7d52dfbc47738f04d2a127c2@codeaurora.org>
In-Reply-To: <96e34a8d7d52dfbc47738f04d2a127c2@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f6914c38-d949-40c0-ea37-08d84efe7f62
x-ms-traffictypediagnostic: BYAPR04MB5767:
x-microsoft-antispam-prvs: <BYAPR04MB576755241CA685B9A2FCC905FC2F0@BYAPR04MB5767.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qiOeiQWildYDvFdYx8C1y7tmDkFV4ningbkIWlfOyJXrJ9Vx0oNE5qT/xLKIbMzCebM9rpMCckKC9wayj6BwtByYQqENULbH1ZK2+JTmmySk9R7ugzy4ITDQ0LYRrGCeVm98mZURNKYa/elojJ4+FbRnQvr+b2+HN5Q5tcbhy4sAqXM14dfZBIjjsLpawTLW0Kh2ACv1O3qiueQVA7JvTfUPSOo1Sjp1vUdEs7d22JDgMzeKiSRO+EMwozfF88qOVBD/ngZn02irxMNnWD2dJxD9z/IyYagibhKJLL8fhlGUTZID/RwEKMEG3ws3sWsK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6705.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(76116006)(83380400001)(86362001)(4326008)(316002)(2906002)(54906003)(26005)(52536014)(9686003)(186003)(478600001)(53546011)(66946007)(64756008)(55016002)(66476007)(71200400001)(6916009)(66556008)(66446008)(8676002)(5660300002)(7416002)(8936002)(6506007)(33656002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 1Q7ybvo8JSqdArxVPjyB1fXKh2s/fijEUwO5JMFoi4nUX7d9yY6cPn6OFyvzKuYQiUNDAEgNref9YpS0mLMq87lwF2hS+vQiGQU1mprQz5c23QDU8wqRA4dpVpNV5TygqwNS0/jOw7Pc6O9qVlkl1xOARWx1VChkf1UoSqdS5LtC6gfd0BiQ63gd53YbKRqa0cvO9nUgL/fJScV1Yz1qgMh8P7vThkXfbegmTDaxjblopacjdtOMtwXY/gPig1eZhL3luNEbbfO3zrytMG7mbm+I8Jwjpou1qPU2eFi+y//oxQWaX8DDDXo5QWoZCVDXYGDeeg4F4r0qPBVDOhUWbbJF3p9AsTTS5aRE7HL2Dv748DpePa9PhGXRcPVcFvo2FCean4LtLTV7nLGlt5zriLPh5ml0JyLh981u8thqarc9TpG4SlrXuITnkOdwTxAK6lZF+HXDkB8CcSYqpPIz+C9X0jTGlYC2jXqyqw9EZv0B8F1YFdYcRwPCm720bDAgkbjQuIVNaTqf2J7D4uIzFdUf6/l8MvsxqluNYfh3BV9BM1XVAmAQRzMb9BlWoMw6UwJardIUYTweOcoPenAG2Wf13Heo+Sv2vR8MCsS0SjAYcZOQeIFYYUv5/hKx+RrQ+NDVIXnOpC+4OLBav3AnGA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6705.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6914c38-d949-40c0-ea37-08d84efe7f62
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 05:10:23.7847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kZfUngvAt0g1xZlMpMLt8aZWEqFYpRSf7d+miJeGix7Ju9cByBZqO+epG/R/dDNKiaYiwLMLlTyGZhud9yFs0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5767
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IA0KPiANCj4gT24gMjAyMC0wOC0yOSAwMDozMiwgQXZyaSBBbHRtYW4gd3JvdGU6DQo+ID4+DQo+
ID4+IFRoZSB6ZXJvIHZhbHVlIEF1dG8tSGliZXJuYXRlIFRpbWVyIGlzIGEgdmFsaWQgc2V0dGlu
ZywgYW5kIGl0DQo+ID4+IGluZGljYXRlcyB0aGUgQXV0by1IaWJlcm5hdGUgZmVhdHVyZSBiZWlu
ZyBkaXNhYmxlZC4gQ29ycmVjdGx5DQo+ID4gUmlnaHQuIFNvICIgdWZzaGNkX2F1dG9faGliZXJu
OF9lbmFibGUiIGlzIG5vIGxvbmdlciBhbiBhcHByb3ByaWF0ZQ0KPiA+IG5hbWUuDQo+ID4gTWF5
YmUgdWZzaGNkX2F1dG9faGliZXJuOF9zZXQgaW5zdGVhZD8NCj4gVGhhbmtzIGZvciB5b3VyIGNv
bW1lbnQuIEkgYW0gb2sgd2l0aCB0aGUgbmFtZSBjaGFuZ2Ugc3VnZ2VzdGlvbi4NCj4gPg0KPiA+
IEFsc28sIGRpZCB5b3UgdmVyaWZpZWQgdGhhdCBubyBvdGhlciBwbGF0Zm9ybSByZWxpZXMgb24g
aXRzIG5vbi16ZXJvDQo+ID4gdmFsdWU/DQo+IEkgb25seSB0ZXN0ZWQgdGhlIGNoYW5nZSBvbiBR
dWFsY29tbSdzIHBsYXRmb3JtLiBJIGRvIG5vdCBoYXZlIG90aGVyDQo+IHBsYXRmb3JtcyB0byBk
byB0aGUgdGVzdC4NCj4gVGhlIFVGUyBob3N0IGNvbnRyb2xsZXIgc3BlYyBKRVNEMjIwRSwgU2Vj
dGlvbiA1LjIuNSBzYXlzDQo+ICJTb2Z0d2FyZSB3cml0ZXMg4oCcMOKAnSB0byBkaXNhYmxlIEF1
dG8tSGliZXJuYXRlIElkbGUgVGltZXIiLiBTbyB0aGUgc3BlYw0KPiBzdXBwb3J0cyB0aGlzIHpl
cm8gdmFsdWUuDQo+IFNvbWUgb3B0aW9uczoNCj4gLSBXZSBjb3VsZCBhZGQgYSBoYmEtPmNhcHMg
c28gdGhhdCB3ZSBvbmx5IGFwcGx5IHRoZSBjaGFuZ2UgZm9yDQo+IFF1YWxjb21tJ3MgcGxhdGZv
cm1zLg0KPiBUaGlzIGlzIG5vdCBwcmVmZXJyZWQgYmVjYXVzZSBpdCBpcyBmb2xsb3dpbmcgdGhl
IHNwZWMgaW1wbGVtZW50YXRpb25zLg0KPiAtIE9yIG90aGVyIHBsYXRmb3JtcyB0aGF0IGRvIG5v
dCBzdXBwb3J0IHRoZSB6ZXJvIHZhbHVlIG5lZWRzIGEgY2Fwcy4NClllYWgsIEkgZG9uJ3QgdGhp
bmsgYW5vdGhlciBjYXBzIGlzIHJlcXVpcmVkLA0KTWF5YmUganVzdCBhbiBhY2sgZnJvbSBTdGFu
bGV5Lg0KDQpUaGFua3MsDQpBdnJpDQo=
