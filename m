Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F34202964
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2020 09:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729425AbgFUHkd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jun 2020 03:40:33 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:21819 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729423AbgFUHkc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jun 2020 03:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1592725230; x=1624261230;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wTqIFPxVA9Q3I8xaWQppRZAdiEgL/jYjBU3DXiEaM8A=;
  b=Mu+hv5LXVzHOItqKyFRmvtrtRy1NkUDw15gonl0wPRvwBenOahpW2cfM
   6EY7bEcB1mVI8ZUOKCEFHPccKlnBlQCWOdhuNu8Ykgnvdx7zr+9MA45QV
   H6XegH1cbV1hdeHDatbbH6ihQu/W/OiVTV2hASpjf8fNGbnZHb28Xy5Qt
   2Gzh73rKkha0PSDSZ+EkPdqV93GiSDYZtgKbvyls/yxZ2whB2VDgu1tYk
   7RjLuwddxc70q6PCyPVN722L17VGwexsO3W8IMMn/p8r/f1clws3Wa0yv
   uv3RJ1BlHvtM0AO9dkRXRfcaRG/0BOpRSHyr3WpF8Ee6LHSi0JPtl0ZQI
   Q==;
IronPort-SDR: e7sgF8t8T9VnunLqNolSNwinSDlSeFZW1yTWFrYSzWvgslviIffR1UNW1BfuL23W3e9g1LicRm
 pgoFyTU+Bhx/Fgp+RAbxoSusAfZXSkH7pqNgLDuDVTHpqQIH2DKhdYmcYAwGull8yd4q8nbM2l
 MCafI8P09Tr7o5sM6S7kMLRzDvTRalE9KJqXdXoWZIigBGBXh0Hdv+rGBEjGZh0iC/81n63uOb
 xc3IFxlFk//cnpa0vN3bhl3BAPeAzpeLZ7UOVF6q3WCOPJyFJb/Wk0xt6OjNJYxQTBU51nLSNU
 Ee4=
X-IronPort-AV: E=Sophos;i="5.75,262,1589212800"; 
   d="scan'208";a="249732757"
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
  by ob1.hgst.iphmx.com with ESMTP; 21 Jun 2020 15:40:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzuNh8GCLhxzMcLZei58p8Kxk1kyTZ4bOxRCygbDLv68vjPNCTGDcl/TjXdxFEHs8wLH+xMrnNtio5nxC0qGACUKCze1uIEo/O4Ts8wOx31kQX22fmzzmxv86ZaQzNuTPWq3cLAheB/Aw98uJhwoaCgb64x7DVe/1Szx58pdHS2IsUkQyJNZkV4bt740Mfo7G+HKzgfRkogxnvLpf9yJgIS9bQLzO057508FaC2A/yCykKxV8IT9WumYXtHdRd9jQujhXa0SAifGcg03DZnHbMppEakyR9V/ubdnliWuY2k75g563Eul2faDUCmNinibjgl/ErnO7dkx95lr9WAHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTqIFPxVA9Q3I8xaWQppRZAdiEgL/jYjBU3DXiEaM8A=;
 b=C0t9xXJb115Y6lU4mQj1zaZvF5eyme/jzoZLKuD0hyRyx/DGKmPRvvQejpq/GsF+/Cp0KIOEoRRL/AuctWlDvJz1L2cwCojeRuHrIpMyqreaWiRc8jjMq0uP5D0QY2KmXzoBTnpmDCazrAmuK1X4Cd5HDwzt7Gj/D0xzNdFeFIv3wgztP/wphZWulgZRJQvBtwpPWinx4vOsTdVlBmC74Dx/bDEGd31aTTOeal795cI+abKqO2pnnJfxwJ308BlXXeHHSbpiJxgX0TlHwycGT/5VrXRXHjcWUd8YDjYvij/1R/SOtWbGkkuoEminabhtJn281hDnnX4WPdEh6JKUrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTqIFPxVA9Q3I8xaWQppRZAdiEgL/jYjBU3DXiEaM8A=;
 b=bQzEA+XYE3oF+2UqrGErKcaYl7Y4Oee7/P+S+l26TJu6Nv+LGz9dRIpll+b98qaNWyYTMPeYhrIHi3RR78aBMjc7kkVm85SDSwBtLYRPxNYonDdPyTP2DiIDMYaspwzzyDhhtjhR7+Wgt4ea+DMpIPItmJP+BxrKlLhMeLlYq/w=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4719.namprd04.prod.outlook.com (2603:10b6:805:ab::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Sun, 21 Jun
 2020 07:40:28 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::9cbe:995f:c25f:d288]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::9cbe:995f:c25f:d288%6]) with mapi id 15.20.3109.026; Sun, 21 Jun 2020
 07:40:28 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Rob Clark <robdclark@gmail.com>,
        Asutosh Das <asutoshd@codeaurora.org>
CC:     "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: RE: [PATCH v1 1/3] scsi: ufs: add write booster feature support
Thread-Topic: [PATCH v1 1/3] scsi: ufs: add write booster feature support
Thread-Index: AQHWDe+W7UlEmvGhl0KH0X2uPaojCKjic3aAgACsRFA=
Date:   Sun, 21 Jun 2020 07:40:27 +0000
Message-ID: <SN6PR04MB46402FD7981F9FCA2111AB37FC960@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <cover.1586374414.git.asutoshd@codeaurora.org>
 <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
 <CAF6AEGvgmfYoybv4XMVVH85fGMr-eDfpzxdzkFWCx-2N5PEw2w@mail.gmail.com>
In-Reply-To: <CAF6AEGvgmfYoybv4XMVVH85fGMr-eDfpzxdzkFWCx-2N5PEw2w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9db0b9fe-04b8-4dd0-a3b2-08d815b65e30
x-ms-traffictypediagnostic: SN6PR04MB4719:
x-microsoft-antispam-prvs: <SN6PR04MB471975E8786CD81509D44461FC960@SN6PR04MB4719.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04410E544A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5s3Z+PxadhbFHebrokhTpL3Xe/eakFKJHHhFEmAq1iRgexStnhvQjtvgyPV/mGtTlZF+U2PijlbfExSCXXugOKueuc0tia4eClTEeNosgcBhlyyh/oW2TJct0ykJnxxPqoeL/5lbeZPE9ZEK7bVwK64u451frsxEHraovQLDh4yk7CJZ5CzqRhTcBqZw4pA7+mnnahANpKWAxcXumu47SHH76gJdY107aiscKvravbirYs9LM4/iwvfT3vBESmg5O1+2NNToUElsXQ/FUq5A4Hnfe1jiSYsGuVI8GwMJ9pLXfV9xlFJYDCWnIlrjCvul+ZfXcx6UEARsFdQnIqn1cQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39850400004)(376002)(366004)(136003)(346002)(396003)(76116006)(54906003)(86362001)(478600001)(8676002)(66946007)(83380400001)(4326008)(64756008)(66446008)(52536014)(66556008)(33656002)(66476007)(5660300002)(8936002)(55016002)(26005)(186003)(7416002)(2906002)(316002)(110136005)(7696005)(71200400001)(53546011)(6506007)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: xMnZNN6e1wBlcMEi3LiCdmApmDIMkDhI7SNF5WTgu6IuTXg9aWfmJ9TlXTH+TeDo2pykp4zomtL3XK0gO16OmENAgMRlLsdJIWKzsUbXTLp0QgvmDt/K4NkFjBwCw4M8hceZsT1+5uAzOjOY9mqIfGTHWFgnlRh6wQzxyjunoHMt5nnoOzaasOTGHvg6TZHFqU2fHf4WdnpRvU5DWlNeE1x+4YPt7P1z1Wgf08juLeLShKt1Y0P3+dnpwRGk7blxqwZz1Xx29fNAxvIzYICbwk8fgzyTeXFnRR8JJ4W/2ZQjfWIH9FjBBpGXBRbKDxFjwFGrd5tJg2gdGM5xh51wqZnPUzl4LnP/SexJ3I12za2hjlsbvkdCrUAu6M7M+q5k0ve//kly7NQW4Cx0OJMXDAylGIK4BQ6q+lXoS8qoDFfHon+1XFHLQ1Ona2XnzcojWPmXkCFxvUwY0fa81NE/ied41fybfM7N7Cf4SNgyXBc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db0b9fe-04b8-4dd0-a3b2-08d815b65e30
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2020 07:40:27.9633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6l5wo3jOWVIu/OYQwH90WVf2cZzsm2qolHmmpFOFGMm6lj0uYlTFSBhRNLG3AdR0hbgFnWHgRna5UF94IgeOmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4719
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IA0KPiANCj4gT24gV2VkLCBBcHIgOCwgMjAyMCBhdCAzOjAwIFBNIEFzdXRvc2ggRGFzIDxhc3V0
b3NoZEBjb2RlYXVyb3JhLm9yZz4NCj4gd3JvdGU6DQo+ID4NCj4gPiBUaGUgd3JpdGUgcGVyZm9y
bWFuY2Ugb2YgVExDIE5BTkQgaXMgY29uc2lkZXJhYmx5DQo+ID4gbG93ZXIgdGhhbiBTTEMgTkFO
RC4gVXNpbmcgU0xDIE5BTkQgYXMgYSBXcml0ZUJvb3N0ZXINCj4gPiBCdWZmZXIgZW5hYmxlcyB0
aGUgd3JpdGUgcmVxdWVzdCB0byBiZSBwcm9jZXNzZWQgd2l0aA0KPiA+IGxvd2VyIGxhdGVuY3kg
YW5kIGltcHJvdmVzIHRoZSBvdmVyYWxsIHdyaXRlIHBlcmZvcm1hbmNlLg0KPiA+DQo+ID4gQWRk
cyBzdXBwb3J0IGZvciBzaGFyZWQtYnVmZmVyIG1vZGUgV3JpdGVCb29zdGVyLg0KPiA+DQo+ID4g
V3JpdGVCb29zdGVyIGVuYWJsZTogU1cgZW5hYmxlcyBpdCB3aGVuIGNsb2NrcyBhcmUNCj4gPiBz
Y2FsZWQgdXAsIHRodXMgaXQncyBlbmFibGVkIG9ubHkgaW4gaGlnaCBsb2FkIGNvbmRpdGlvbnMu
DQo+ID4NCj4gPiBXcml0ZUJvb3N0ZXIgZGlzYWJsZTogU1cgd2lsbCBkaXNhYmxlIHRoZSBmZWF0
dXJlLA0KPiA+IHdoZW4gY2xvY2tzIGFyZSBzY2FsZWQgZG93bi4gVGh1cyB3cml0ZXMgd291bGQg
Z28gYXMgbm9ybWFsDQo+ID4gd3JpdGVzLg0KPiANCj4gYnR3LCBpbiB2NS44LXJjMSAocGx1cyBo
YW5kZnVsIG9mIHJlbWFpbmluZyBwYXRjaGVzIGZvciBsZW5vdm8gYzYzMA0KPiBsYXB0b3AgKHNk
bTg1MCkpLCBJJ20gc2VlaW5nIGEgbG90IG9mOg0KPiANCj4gICB1ZnNoY2QtcWNvbSAxZDg0MDAw
LnVmc2hjOiB1ZnNoY2RfcXVlcnlfZmxhZzogU2VuZGluZyBmbGFnIHF1ZXJ5IGZvcg0KPiBpZG4g
MTQgZmFpbGVkLCBlcnIgPSAyNTMNCj4gICB1ZnNoY2QtcWNvbSAxZDg0MDAwLnVmc2hjOiB1ZnNo
Y2RfcXVlcnlfZmxhZzogU2VuZGluZyBmbGFnIHF1ZXJ5IGZvcg0KPiBpZG4gMTQgZmFpbGVkLCBl
cnIgPSAyNTMNCj4gICB1ZnNoY2QtcWNvbSAxZDg0MDAwLnVmc2hjOiB1ZnNoY2RfcXVlcnlfZmxh
Z19yZXRyeTogcXVlcnkgYXR0cmlidXRlLA0KPiBvcGNvZGUgNiwgaWRuIDE0LCBmYWlsZWQgd2l0
aCBlcnJvciAyNTMgYWZ0ZXIgMyByZXRpcmVzDQo+ICAgdWZzaGNkLXFjb20gMWQ4NDAwMC51ZnNo
YzogdWZzaGNkX3diX2N0cmwgd3JpdGUgYm9vc3RlciBlbmFibGUgZmFpbGVkIDI1Mw0KPiANCj4g
YW5kIGF0IGxlYXN0IHN1YmplY3RpdmVseSwgY29tcGlsaW5nIG1lc2Egc2VlbXMgc2xvd2VyLCB3
aGljaCBzZWVtcw0KPiBsaWtlIGl0IG1pZ2h0IGJlIHJlbGF0ZWQ/DQpUaGlzIGxvb2tzIGxpa2Ug
YSBkZXZpY2UgaXNzdWUgdG8gYmUgdGFrZW4gd2l0aCB0aGUgZmxhc2ggdmVuZG9yOg0KVGhlIGRl
dmljZSByZXBvcnRzIHRoYXQgaXQgc3VwcG9ydHMgd2QsIGJ1dCByZXR1cm5zIGluYWxpZCBpZG4g
Zm9yIGZsYWcgMHhlLi4uDQoNClRoYW5rcywNCkF2cmkNCg==
