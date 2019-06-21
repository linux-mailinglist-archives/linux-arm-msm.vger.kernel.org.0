Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3F664EF5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 21:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbfFUTZ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 15:25:27 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:39314 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726266AbfFUTZ1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 15:25:27 -0400
Received: from g550jk.localnet (80-110-121-20.cgn.dynamic.surfer.at [80.110.121.20])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id DDD3EC663D;
        Fri, 21 Jun 2019 19:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1561145124; bh=HlfvDRv1zWzENIDFIHiWiXrRjeuASpykgmq5MVyk/4s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=X5uKBNmULH5RZmrECX8UHikZYwliCJOk09xdllZiJTVCcO4nKBbMvTckGunvBpjVw
         cz6ETGpdTNUvcXxJYoO3qWbawlhEfNLJySS7y+PKm6JmsVV5pujTNa7NZscKfuTOB6
         OtUdSPXkTBncnyAP0bIGlBMTa8G3sz58DkVjjRqs=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Brian Masney <masneyb@onstation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        ~martijnbraam/pmos-upstream@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: msm8974-FP2: add reboot-mode node
Date:   Fri, 21 Jun 2019 21:25:17 +0200
Message-ID: <4607058.UzJteFJyig@g550jk>
In-Reply-To: <20190621000122.GA13036@onstation.org>
References: <20190620225824.2845-1-luca@z3ntu.xyz> <20190621000122.GA13036@onstation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1702504.p497Uvq6SK"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--nextPart1702504.p497Uvq6SK
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Freitag, 21. Juni 2019 02:01:22 CEST you wrote:
> I think that it makes sense to put this snippet in qcom-msm8974.dtsi
> with a status of disabled, and then enable it in
> qcom-msm8974-fairphone-fp2.dts like so:
> 
> imem@fe805000 {
> 	status = "ok";
> };

Do you want me to put the whole node in the the dtsi file? Even though these 
values are the same, there are also custom vendor-specified values for specific 
phones.

This opens another question, which values we should put into the dts files. For 
example in the fairphone 2 bootloader source there's also the unused
#define ALARM_BOOT        0x77665503

and behind a #if VERIFIED_BOOT :
#define DM_VERITY_LOGGING    0x77665508
#define DM_VERITY_ENFORCING  0x77665509
#define DM_VERITY_KEYSCLEAR  0x7766550A

and 0x77665501 ("mode-normal") isn't used in the bootloader at all.

On the Linux kernel side, it has bootloader (0x77665500), recovery 
(0x77665502), rtc (0x77665503), oem-* (0x6f656d00 | somevalue), edl (some 
other addresses), and the else statements writes the 0x77665501 value in my 
patch.

> What's the pmOS utility that utilizes this? I'll test it on the Nexus 5.

"reboot-mode" at https://gitlab.com/postmarketOS/pmaports/merge_requests/442

> Thanks,
> 
> Brian


--nextPart1702504.p497Uvq6SK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE66ocILd+OiPORlvAOY2pEqPLBhkFAl0NLx0ACgkQOY2pEqPL
BhnupQ/+J5X6iAzE9VLMNps5lmr199+6n3YYOUtSk5H2cFxggDEpTM5xY3fxbNPD
vVzkoL0EgcAu8N5V+FyBCkuG77a16NIls9c+UXDIGMKSs8RdfU5d3BbEYJNWSqUX
mztUFZGQDqs8l9Ho1QaslS6f5mgIpgPHgY9kfmlqBikX0XtK4I+rE4EXatZ65K4Z
eAb2RQtX+22aBPxMGInd20Eb19Hn/6TAzPEFW1oCAjauG8ObcNpjuLPM9eZ1Kefw
ZmmHUznGDibDM/zsQC7HgbNTGCWJMStWCZze+LCANc/p8Oy2AgbDt/wKWg2azpiE
+T0QqKM7LMaH468hPuyfG4EkPGdC3ROBKIIV/VoaU1XijR2Jnjuyx4gA9EPsLWTK
MajOUIur3W9+7j1v3GFtkYntuk557Kxus5gO0T2hQGk7DuQRjAIOLiacg2n3X7sb
aeE+Gat1nA++HwQM3VChm3rMPruY17FyioONl4bnDhI8PMg8xTFb7ym8iaL8gMeY
CBqAR3LZp/vQSAmbkIQHQ8taVfJNePTGvBooDtkuY0+Hh9qfwBpOaRm6jw9MgT8c
DlXnXvlkKPVNAkRbFOYeZKrLS5GH1ANlKP9V3Fdd4XoH+YEwf37Gd4wMukVeOadW
GHIemce2KyzLYeHU3lL2XLYSGUyjz6lB7ENTpDb0OdTkSocAnx0=
=FshW
-----END PGP SIGNATURE-----

--nextPart1702504.p497Uvq6SK--



