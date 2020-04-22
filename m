Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFB51B3EAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 12:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730595AbgDVKa1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 06:30:27 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:42326 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728657AbgDVK26 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 06:28:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1587551338; x=1619087338;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DGf7G5RE1rVwKwWmuAnWNKUHNUHFVsH7GZDeqXLbxtY=;
  b=LE3Fzdw5UIbq+QCwjczFgZ2hKpFv6Y3lf85QU5yUkn3nXM40HHLD3OJe
   jTc1DntkFDccTuGr7RsHgVBdGW+oE9EZ/g9fRXWrturdmFkUgt0MhyQJu
   VNS+lWPaXhAXViQOz5co6jEmx8vwlOY2yD3HfI40Hyj7Iakr+pLYtOQaJ
   WF9aTxq9JzmytRmuiwZKsGh0FQgfPgTS65KZtJsxna+u9GCK7dVB6I+Wa
   +2bOA4Y9mU4Kq0ddk+VOwNbBZUg3OSSShVEjEopmUk93OhMrA1Haz/Ptq
   j9TiW99Qb5fcahJixACi5XOKW5NmCcj/Y76inhHqsAI337z0EjTpO2DPa
   Q==;
IronPort-SDR: cZupk81fYqPvqluZYMr8vz9fDtWDUx40uVVZS5gpshixcvLgfl62i2avHoVUTSjsOZKlZePCD3
 +SOs/Axqdz+BYI96UC7t/QbZYFuxA3zX1tLqkeryMpJDdR7hP5glCUGfi/RdLPi3Mg/1OOX9T5
 ucViJ4ZWjcVBn549N1exZKlOVTYJDnTL0s2d0NtkhXQmyfeUV169Z0eONg9g2GyXfOOmQuWIKI
 ZteyNoIoHFvQBPnl1YBQMxQvjJDfef496+ZGQZqaKfqc3NPnszjs6c7jIABHlGlZKDQEmFPshI
 T0U=
X-IronPort-AV: E=Sophos;i="5.72,413,1580745600"; 
   d="scan'208";a="135870967"
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
  by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2020 18:28:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2VR49Rw/g8urjkZ+lhi5uWscaMZyQ7OitXqObDifrNiuOxx4UZg+1YPWjM3Pqb1IjV9V+tjrdKdXlxFz7s3RD+WcdsnYRVXt0fL+uSvizOHd9PbRfUkaawt7t/iwi98XOyNTrraqgnwykHHx/EPhgwyTXAdvN8jtttzV4CayTxJrKx5jBxzFPS92+TaqYVHyx1FLe//Mk6eKdqL/GqqO8IKY74Cw7UOwndWdQWr030ShIMIWI2Mtn3Ke3ETQoBln4PHQN+mDKkvepAZbINeSHHruoS6dhS0jEfoEXM80a9XX7vRYQbsxKGVzgSDLT8jLMGgaFCwxO00Fn7p+qubsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zwQDOrHT5IqUmw8PktNp+2qNxp1DCFK5A9tzpVucU8=;
 b=aGzYbS0xXNRHmhdidfzXRvNrM5QRhmFXu6D/y75CFZHH8Nh0nnPLxyrKHkHxqXdVHWR7KClnCgIORc8xnA5nncU9IYiF5KC317KJ/6pbCue7szgxlL61FsY4ISvQihJMAQ5aiQD7PeKuURLNtxv5thcWz/O5yqZPnHPDRcASzSXirEsOKy0IHxmx+RmfJU2C4h+xVZIYH/Q6vx5I1Bjdrl61uxyNoWcpFjCH22fGa8cOkiiCbChGXXo9ZvFzpa1WuBu6cPVnE4tiGppSWVy3Mk40Fxe8VBsZ1rH8z4di/aYpydEvwQU3wNastJTgF3QdkERu95ZZbkfORpnUdO+1lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zwQDOrHT5IqUmw8PktNp+2qNxp1DCFK5A9tzpVucU8=;
 b=Kfd8kDLl5H1edRM556V2N+nTHjuyz8l3enBmY673Gl6LtKGyhuVpkAWrgrPct/e6TO3Dgz9HW+hNNi4nwwQ1HrzBXjjOzz9tDQbFsP0eQfNIfevkrt6oHmmZ14qJJwUwExh+Jsbj/dtddjnPRkoPmc70FZFNZdUsCG6zthhiC1M=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4976.namprd04.prod.outlook.com (2603:10b6:805:92::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Wed, 22 Apr
 2020 10:28:55 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b%5]) with mapi id 15.20.2937.012; Wed, 22 Apr 2020
 10:28:55 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] scsi: ufs: add write booster feature support
Thread-Topic: [PATCH v2 1/3] scsi: ufs: add write booster feature support
Thread-Index: AQHWGC/ZP5mEb4mHQU6B/JvojeGq46iE7Pyw
Date:   Wed, 22 Apr 2020 10:28:55 +0000
Message-ID: <SN6PR04MB4640D6EFA64A15E3624E081EFCD20@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <cover.1586374414.git.asutoshd@codeaurora.org>
 <6519cd576299d5881129b0e48870a53a0afc7835.1587509578.git.asutoshd@codeaurora.org>
In-Reply-To: <6519cd576299d5881129b0e48870a53a0afc7835.1587509578.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c3cf105f-9c93-4dfd-7d81-08d7e6a7f5a8
x-ms-traffictypediagnostic: SN6PR04MB4976:
x-microsoft-antispam-prvs: <SN6PR04MB49766E3E6DF4E68CABFA3AD0FCD20@SN6PR04MB4976.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 03818C953D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(7416002)(186003)(5660300002)(71200400001)(4326008)(7696005)(33656002)(86362001)(66946007)(9686003)(66446008)(6506007)(55016002)(66556008)(64756008)(66476007)(8936002)(2906002)(8676002)(54906003)(76116006)(52536014)(110136005)(478600001)(316002)(4744005)(81156014)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 55gXcnvdAh7NKzQmXcXtNUzrU5+rN1zp6L2E8nDF8A+G9dopDY49naNDD4TSeO3GMvpM5rJYjZn3ZVFIaK/wPklrJ6CgCeo/yAw52Z6nRPhmmxCqAZpzvvSwg3PqnDiCu//OeMV9NK6tb/fyxNrPiMtjg7C4e/k0oHZGr88dPLC6zb8ygiM4C8KuhrFYo1N20vHBxlkhD7hdzbVUJzlDTWhASpK9R1m7HSn2NbpsvU78nqtfafHEjDsHeypXzOmDluM/cTNHuKkfKyYtSh2pSBHe9DXm2gL6nFRkHFLI7zYLiRDtVmto91NNQOdVNAcytt44upUfSkm6CVlzzjxOj7u6Hxwgmv6MOa0dDuZkmbdNjz13axd+2Y8dzPPtvmZwoWg8WbwDztEPnanPkrCeR4wNhcj889+urLO3iBllDX0JQlDyJnv4C4zh3gOizn42
x-ms-exchange-antispam-messagedata: 4nfPs5C70exH9WG7KeO/6TsXKJm0AZmAVsM9cLKa445Zr1SnuRkVDqJdqm/kf9K1FuNNknDqcMpysj9tqkGX23mNVKPyW6d9kG7pn1dlbTF9uOAgBuxVkeTS04NtyX9/zXbs4uIPV8OVy1GDvzpv9Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cf105f-9c93-4dfd-7d81-08d7e6a7f5a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2020 10:28:55.0432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m69WzyV+LXf3VRNxvVdjSTHq9Z7mRxdRLGclxcSb7j+zC3UDqM53xiocGOm+EzzJzvcX3eh2L+zo1/89HMmqvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4976
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


> +
> +       if (!hba->dev_info.b_presrv_uspc_en &&
> +           (avail_buf <=3D UFS_WB_10_PERCENT_BUF_REMAIN))
> +               return true;
If you are in reduced mode, but avail_buf > 10%,
you still get into ufshcd_wb_presrv_usrspc_keep_vcc_on(),
Which you don't want.

> +
> +       return ufshcd_wb_presrv_usrspc_keep_vcc_on(hba, avail_buf);
> +}
> +

Thanks,
Avri
