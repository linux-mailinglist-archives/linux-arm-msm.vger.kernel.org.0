Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720952565A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Aug 2020 09:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgH2HcN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Aug 2020 03:32:13 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:4371 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgH2HcL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Aug 2020 03:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1598686331; x=1630222331;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SMfWT8t8Ye/STTHMxxumJ7xfGDzJOeasYwnCTcVmnHY=;
  b=AgqIy+rvFxhb+WzTZlAoSBPjMEQf+nu1orGzZ51PUdUyMu5RnlsZRNod
   1I2Jmt5XVxDQ3BnNEEQnr3DM5w2d0nPnqTtSqy/3nh0rM75EgT9pgnQJL
   BnJ6SY1nLQpbynuHRlV8Ci7HCNVrpLIeryanbMiyubtxwGxJycEn6tiMD
   g04BDj0c6GSQFLpGvgP5lGmxFezz82o8juvDaLLckIW32Q7/0DNltmoTz
   vFFYX5i5C1K7dWXJbYxo/WHrTFrt5JOj/eq/4OeEXYWI0FtzFFI2+jWlH
   NlV2Ljvx/uVk9gGoEh3vS60d9d5MeiwguZRxghtjBm4ovSZEoyc47Ln/r
   Q==;
IronPort-SDR: YjeE12eBj8qKE23jUYjKh9quf4Rpyi7dghDKCi5jmaQHx7sL9MbCVyxbEvkn9G7PVwjOJ9WGJg
 1oDXSCtXLmepNxTiCOKGFjV0XqdKkTWEqpic8weoUo1uRXrYs3ywbJzVium80omX4exflDQuKQ
 wrho5oNnbdo54UDGZVUt+dk17PjHGU/K7Ye2r+X4Mqm+hoadVehCLGe6bAUXVlwBuJF3q2hQqs
 4wIQs+J6BwdlgeDlANol1JKK6jyjx6Eg9uNW7UjQzsx6RBB10oPUGK/7lsvft5AO/szZQJ1qg+
 iL4=
X-IronPort-AV: E=Sophos;i="5.76,366,1592841600"; 
   d="scan'208";a="150455914"
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
  by ob1.hgst.iphmx.com with ESMTP; 29 Aug 2020 15:32:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePtgQ6RnK77fcuPl1574PzGGLHrvFlrbMO8L29eiT3/c8zc914VnIjQFlo8ek/zmNja/VNHrbsJzs2402B+qDnmmTwIvhLoPO2vxRbn2U3DHC3iE7oRFwKEWLk9vbG4dBUr/0Hy2jH/SH2brKP6PNP7T8lovCS+AM3t9d17/IEwYJHslhw1SZ0mKufhQ3lADUcunBlIRvd9/jxRwGtXTBANYrJbzCqh4+WrDmjJ9VY3CXgiHNtNyJYmPeut8W/gv0ApWu52y/bImyOvZPH6uGkewuKFj4uctE7uB0sayNrKY5tSWTw7FgX2S6fht8A34YyybkC6/lA+AGkC7+/4xkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMfWT8t8Ye/STTHMxxumJ7xfGDzJOeasYwnCTcVmnHY=;
 b=FINxorYjYmaVjjUrxnfj7z+H85oaBovdrIhQjbw6f1cGkatkX0afjLqBpm7Dx10QLHuwpsxcOiw9TVY2NqC01JD0IdSuQToKxETGvDxtFqD+aRsYV6So9fv26JSREqXFgwess8ndQC4YtouVUnfCTTc0caA4/8SVQaU0S/GLEk2krUbhQFXPwqKj1TQ3lK4UIl2a22yF8w6nJjfU+8SuNtYGer2s0324meOj4eoxSXq8rB4YXt3mK9D50a/3Il3HI9ApSOmz2z8vYkq8TAcQrwY75uT1rJ7HcmOsjfcdqvVZm3rPLS52CFgdTrK7AFCw86Bn5ByBcVgrJ6rUf3gnug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMfWT8t8Ye/STTHMxxumJ7xfGDzJOeasYwnCTcVmnHY=;
 b=IpEGE/K5gF1Krz99tHdri00jQowIjOyv0a/yjoRW0l8qTF+VFAJKUh8nuB+WBrzO/0V0GpRtQdux1NvGibv+flKqBSjKhb0exir6Ydh7ivGeuF0sX7Tyyp12JborHe9UZiSUPilHniGx1qZylU3DK31Xtjf3XUSCwLUuZyvEwVg=
Received: from BY5PR04MB6705.namprd04.prod.outlook.com (2603:10b6:a03:220::8)
 by BYAPR04MB4711.namprd04.prod.outlook.com (2603:10b6:a03:14::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Sat, 29 Aug
 2020 07:32:05 +0000
Received: from BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::1083:4093:49fa:a3fd]) by BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::1083:4093:49fa:a3fd%2]) with mapi id 15.20.3326.023; Sat, 29 Aug 2020
 07:32:05 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
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
Thread-Index: AQHWfaC3kd0c1Nm+d0KoEDt9jyytd6lOsAkw
Date:   Sat, 29 Aug 2020 07:32:05 +0000
Message-ID: <BY5PR04MB6705177184FC1A0E5F7710FDFC530@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <b141cfcd7998b8933635828b56fbb64f8ad4d175.1598661071.git.nguyenb@codeaurora.org>
In-Reply-To: <b141cfcd7998b8933635828b56fbb64f8ad4d175.1598661071.git.nguyenb@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 88308c96-14eb-41cb-eeec-08d84beda125
x-ms-traffictypediagnostic: BYAPR04MB4711:
x-microsoft-antispam-prvs: <BYAPR04MB4711B8F6BBF6A302EE1FA0E6FC530@BYAPR04MB4711.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pUY5iEuY79n/z8Wpt2y2Wn8gWz1LIpWol8GLHuIRECSvOvqfEFoM9Hwmq6pQAe/FrERi78Lq/zUZsvonsvOB/aYRibEsqMo+fIoYLLtsf5VjdZku6yoKqpDbeFn3L3I0UAscCf1+cxS0ej9+qMFqSsbRXck3U8Bn7woTwfn4QH5fDQBlvshyZuwLZPnqGVMvaPWDfhXptulc6FWWPXoJRhx0887G1MygV9wwWxebVhUfBBo3Aj0hqDQUp5weNe1lVb+TJvojw5sfiY/WrmsqKehrcxnVQ3D7jhFeBm+g4UNtnmzTJjBXO7aS0fsHizjJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6705.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(2906002)(316002)(86362001)(7416002)(7696005)(6506007)(54906003)(4744005)(71200400001)(110136005)(4326008)(66476007)(186003)(55016002)(8936002)(26005)(33656002)(478600001)(66446008)(66946007)(64756008)(66556008)(52536014)(83380400001)(76116006)(8676002)(5660300002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: O1b4C1RIPSUwB86UDbF/YWm63BWjwJoLShpz0bUFPm3pDzgHEZr2Fg/f80ErgzVyyyCfN6izZfhdsa7pCsPA8lp/+p5X65s0nnhSdHFjmrNZ8YzI7DxadqZuXFYETuYSzj0x8M1Q3BsA0RR6cTUpFpxZ7SVfYFERyNaALyETyoYMeqFQPGlHX8Xeyu2lgfuAZQgTUcQej/sNRjpqu6i4cd78XLCW+XsFuPDKWyuZklv1aTlQE7lyijmHFgaMtGU9zvc0Q4eGVRyilevMJmr4dZZ8VZRfqu8cXmWTmSMe+UXeJDrzMkxh98O5qfbW+5cEsbHC5HvtKE+P4Sg458zlh4DKVao5H0EoeADv03klNvIBD+PkHFV4lX87yc234ncw+0nPbW7pKthZvKvc1PVqSTcvYDRt5NeC0nGpRxLhu0rWNBkRsuz2FujcTyETaRWgWEwF+Cdf0lCfwkACRfF0mPtLD96JefYmjj47lz4+3tZbOjGa5TrkaS85OWFUrWfeOg7T/D2mCiplwiY+0oB/LC5Jwg3AwrPJ7cPnbU78SEFdytCjk8mX2znUKEQZ4r2epzPEEsqR8IjTIvAMHZiI5zeysWvh4+y2yWjZS8zsSMa0TT8saGk+VO8pH6yuBdOInSLzr2g4rUZLB12My+f5xw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6705.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88308c96-14eb-41cb-eeec-08d84beda125
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2020 07:32:05.4282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gnd5piqZyUH14hTGgCm8Cb2hS9jknGsM1RAo3jGR9lNgyONWHHz/l5lVmtOSgUILc2mIUnc9XRZCR16sbmFMEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4711
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

=20
>=20
> The zero value Auto-Hibernate Timer is a valid setting, and it
> indicates the Auto-Hibernate feature being disabled. Correctly
Right. So " ufshcd_auto_hibern8_enable" is no longer an appropriate name.
Maybe ufshcd_auto_hibern8_set instead?

Also, did you verified that no other platform relies on its non-zero value?

Thanks,
Avri
