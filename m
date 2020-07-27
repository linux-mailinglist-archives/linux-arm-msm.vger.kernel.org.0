Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49DCB22EC97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 14:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgG0MwP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 08:52:15 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:34824 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbgG0MwO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 08:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1595854334; x=1627390334;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bQbJzf/DfVB4h/zZbtOxaKen6hHWvZ7u2L5tYy+l230=;
  b=rv8yXgYbxTOoQ/tjlJ0lsSpPV+lFrMbs0nQtks4LK8Y3uOxpH9IX1/J1
   /DXRDoOvZuaK2TpJt3+snxnbDKAwZ/qcboQP1x0UOb7ksr271RYZF2L/v
   fmWYUW/lqKSa9DEMGhnE64CFzhAkhetsmnE1x1AllHJ1lpnvfHh7e8asr
   lyh5PThKM0SuW83dKOWpIYOogglAjzzsCGV+ErhVYs5wMBN3HKqTw0ag1
   rZT+hmSCZWRG0Ofy7kXfcTq5SzdJ/owjV6F62xwV0uj73Up+YEFuV047i
   mjQDJtr3IVQrcm4ponhhdr41vIm8O6GKry96e4710GZyxK2rXv/ppNhOP
   w==;
IronPort-SDR: iGkEh3Bt6jZpMEDsLLFM5VB5dbumtXTcdClyfpHcp8bnpK2fQGKzyZZKh6oh2tq0GrKMXpatWQ
 KwJ39vRJTBSIu/qIoO/gQhE3pWyJV7/xOzBisYet88VEYl3zGJlUwmUA2IGqt5Ls4IzcNRHskR
 cescTiDh17hu/bABvVrPDEXx/W3xD3O99rU6JPsJvgCa0o/b+tL5QqBeGHyPN52BekG2plBWm6
 ARjkv/AEKjyUKvVYi1D2AEF5M02yKZoIrknTMB163onQhbV91XSmXeCF+agPJdaK0ZxiLjHvQN
 gJI=
X-IronPort-AV: E=Sophos;i="5.75,402,1589212800"; 
   d="scan'208";a="144725032"
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
  by ob1.hgst.iphmx.com with ESMTP; 27 Jul 2020 20:52:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfpywnEwYyDZ4/Ns2pWm5sl5nRB4GauIFUCaEOxne+D2P/d6oQihxyqZUL0irH9+JB3FujjT71p3OIgGD0115Py+nSyWGxGugwXMY+rnoXVcX3pj+0Z/QqCQBzqJgELZy4KsW0fVjBs5tCpWV+o0o5AvS+oL0LWevhLL/CNU/loRZ/GxZc5YE8MnDDKFZ+uzsATJPB+jxV/3+ofTetNGBEFeQR9sfI1j2kl5ymM0HwbDF39zZuNhR5RQSKEZPPayMPnQjZw2BgnFrV0yJz8FHDwDSa5E0cQ7E65myujiQ/NsytluK3KeRelBcJrVIQcl6QBWrutkxP47vy0KdSn2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQbJzf/DfVB4h/zZbtOxaKen6hHWvZ7u2L5tYy+l230=;
 b=VW8U2SwS1hLY+Rnw8qd3PWpXxYqeU9HePtwkizO2KyG77vWWPAFRIVb9ytqnlNX1eOlb3K6N4bfKnKYhh+KldcVJjrrXKF6HA5K/QgJEcZm/NlJVh40855Cb0efpEqf0PNADevU8bh9RR/ZQ/jmd2vbXtpzjuAHdRNCXg6YRy2an/JClYxoPh+Wq04HoitH2uT0M9fIA7eKmfN1lD7llv4Zs3mehwT+cSTzir8I/c0fpbIiiZxVVbN/Tl2o/5CBxOFRjD1aJe6xAxhjAaql8VW09mye//x/DvsrgrFYDahsRPxS9SgiwHMhzsAI5mS2dkREqjSaSuvDAbRaiUiJIsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQbJzf/DfVB4h/zZbtOxaKen6hHWvZ7u2L5tYy+l230=;
 b=TM7e0cf+hEQ+EIbzgagzRu5R7mKyscMJYmoJVfyFf0VaLxntyzTS7iDmhRov7ESFS0O5Bn+laLLF35VQFr89xxguLTtG0SevA7g7TLJLBj1RMtZpd88fNnOKgsuVQ1I5KhV0AJ3UOFQ7LUUWUc/nIaHygzILbTXkSbb38K2XIAM=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4813.namprd04.prod.outlook.com (2603:10b6:805:a9::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Mon, 27 Jul
 2020 12:52:10 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2%4]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 12:52:10 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Can Guo <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>,
        "hongwus@codeaurora.org" <hongwus@codeaurora.org>,
        "rnayak@codeaurora.org" <rnayak@codeaurora.org>,
        "sh425.lee@samsung.com" <sh425.lee@samsung.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "saravanak@google.com" <saravanak@google.com>,
        "salyzyn@google.com" <salyzyn@google.com>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 2/8] ufs: ufs-qcom: Fix race conditions caused by func
 ufs_qcom_testbus_config
Thread-Topic: [PATCH v6 2/8] ufs: ufs-qcom: Fix race conditions caused by func
 ufs_qcom_testbus_config
Thread-Index: AQHWYObsNBWD5934MUSntuL/9NyZb6kbZ4Fg
Date:   Mon, 27 Jul 2020 12:52:10 +0000
Message-ID: <SN6PR04MB4640AF17D6CE3BF597528112FC720@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <1595504787-19429-1-git-send-email-cang@codeaurora.org>
 <1595504787-19429-3-git-send-email-cang@codeaurora.org>
In-Reply-To: <1595504787-19429-3-git-send-email-cang@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 86fa2af9-3956-4150-cecc-08d8322be087
x-ms-traffictypediagnostic: SN6PR04MB4813:
x-microsoft-antispam-prvs: <SN6PR04MB4813C6B13D951E62876594A4FC720@SN6PR04MB4813.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VwQ+m9V2HACP00aOojd7QCyuBC6GsNYbmsuk8UM9ryz2FXZHZpx3hvWDl/AP+h7VB5CXCxJo6x2Q8ume+K7xFX+OtKOvRO4fXlJPFODMC1pgDlm4qBZl6S2+ENtOabCC3YGegsIUdQCgdO+LqkiEZAz/Jmf8rjEK2GVLMrAJBAmumysdC1Ah7YTNYjQBj3LEOQN3SpQLjgbICAGu92msLeMLLYt4MH6S0xf1XI39eLvOv03Ak8xjEnKqiRaQ76Jcmt8X4FJQcGfpWemdkBmj+r+NpOVt2i4tH639iPIVt1o4m3IVeDTySftDZRBpGjMQMnKbhwnYTm259tnYq9T8tJuDeuvoRCw0Ce7myGgGI3Uk/CNgtoLadHQT9/6BYLZz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(52536014)(7696005)(6506007)(110136005)(7416002)(4744005)(2906002)(54906003)(316002)(5660300002)(8936002)(8676002)(66946007)(86362001)(478600001)(9686003)(55016002)(26005)(186003)(64756008)(76116006)(66556008)(66476007)(66446008)(33656002)(71200400001)(4326008)(83380400001)(921003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: dH+poYH0owS50yAcRsq4c0x2YCLgJaGZIYELIytFYJ5NmTmxFpa3HSBj3jNxpt6tC7LSSwY92z1XlhNq+pWli9L/H1VzkI/tfh0pS5SaJZLtueAiiwzA+JmkI7X+xQ7hV+VLQBzoO2V5qxSU5hkgsAarvSR4ihTvMq9kX637vNlZKWanFj4KF2aXoknXV2ykEizGmdxnkDZtlqmu8E1u1bb4r0XmaR/vWktHoKQ8mFzYY0oXo+C/6B1FBi10J5FO6ACX3t6NHGxq8v10itMdm7ZwdxE9zKa+wdmMLN5H1TqkcX4p97LtTinEk+L47kEfiz+nWeqh3ifJJ+Z4sAt5isDES3UMy3fZtvBnH//QqTP3xXDSMnzdiKwb145I+GSEVtzStwpW3KZal4u4/nZ3aVY8Zi1uDZdOtgstq2qnx+78YHePggOTSqOWYZPuPocjiL49JA6xBYIsfMjxTHhrmtmtRFz0EEqpbhy9i6DsrzCF4I6x9X91kwSm0N15NsOD
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4640.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86fa2af9-3956-4150-cecc-08d8322be087
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 12:52:10.4004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L2vAJRfa+moW0bjeNfR6aAnzR/cwRe7VbyhlrT1f4yKonMeAF5QV4qm5CYVhr+2AH+RxsQSD8wLw3Arpz8ky4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4813
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

=20
>=20
> If ufs_qcom_dump_dbg_regs() calls ufs_qcom_testbus_config() from
> ufshcd_suspend/resume and/or clk gate/ungate context,
> pm_runtime_get_sync()
> and ufshcd_hold() will cause racing problems. Fix this by removing the
> unnecessary calls of pm_runtime_get_sync() and ufshcd_hold().
>=20
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
