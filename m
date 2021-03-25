Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2683491EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 13:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhCYM3e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 08:29:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:40072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229788AbhCYM3L (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 08:29:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CFA261582;
        Thu, 25 Mar 2021 12:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616675350;
        bh=nft8tr30HZq9nXI1FChxCciEQBQ02Qli6EbN444l7bk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Z326JnL1YBI2HTBx9TcJMmhTcleJZWah6y1tlzRvaaEL87deuLUAZBNOzYxpBL1UV
         4ndKQrMmhZDdvfuA4wm/Bl6+cgJgtdMH9gETuaEZt9pek1K1lFOK7l63C7gxWWp6nS
         CJ+DBU5/R/AXbsqsTJRloj6ciZ6EWzAVJoB8ryLvxICqMoMOZ5Yo7YeGZ0WCv5MA4Y
         IExDdODilMdS8+4+qq/qM6Uxi/UgEHazrBP7kZCRFj/JqS7xNFrqd3DxjUdIyINAdQ
         WacbFlTY23RNXtgly9tZ0MgXz0kZ+Hv8uDh3OSHGAjK9So1foW56VGDG1z3QDlp7oh
         0WRyiSn88zNbw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jian Dong <dj0227@163.com>, matthias.bgg@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        huyue2@yulong.com, Jian Dong <dongjian@yulong.com>
Subject: Re: [PATCH] regulator: Use IRQF_ONESHOT
In-Reply-To: <9428d264-aafa-793f-8c6c-86c55213f5f9@canonical.com>
References: <1616501538-120724-1-git-send-email-dj0227@163.com>
 <9428d264-aafa-793f-8c6c-86c55213f5f9@canonical.com>
Date:   Thu, 25 Mar 2021 14:29:02 +0200
Message-ID: <87v99fju29.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> writes:
> On 23/03/2021 13:12, Jian Dong wrote:
>> From: Jian Dong <dongjian@yulong.com>
>>=20
>> Fixes coccicheck error:
>>=20
>> drivers/regulator/mt6360-regulator.c:388:8-33: ERROR:
>> drivers/regulator/pca9450-regulator.c:781:7-32: ERROR:
>> drivers/regulator/slg51000-regulator.c:480:8-33: ERROR:
>> drivers/regulator/qcom-labibb-regulator.c:364:8-33: ERROR:
>> Threaded IRQ with no primary handler requested without IRQF_ONESHOT
>>=20
>> Signed-off-by: Jian Dong <dongjian@yulong.com>
>> ---
>>  drivers/regulator/mt6360-regulator.c      | 4 ++--
>>  drivers/regulator/pca9450-regulator.c     | 2 +-
>>  drivers/regulator/qcom-labibb-regulator.c | 3 ++-
>>  drivers/regulator/slg51000-regulator.c    | 4 ++--
>>  4 files changed, 7 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/drivers/regulator/mt6360-regulator.c b/drivers/regulator/mt=
6360-regulator.c
>> index 15308ee..947350d 100644
>> --- a/drivers/regulator/mt6360-regulator.c
>> +++ b/drivers/regulator/mt6360-regulator.c
>> @@ -385,8 +385,8 @@ static int mt6360_regulator_irq_register(struct plat=
form_device *pdev,
>>  			return irq;
>>  		}
>>=20=20
>> -		ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL, irq_desc->ha=
ndler, 0,
>> -						irq_desc->name, rdev);
>> +		ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL, irq_desc->ha=
ndler,
>> +					IRQF_ONESHOT, irq_desc->name, rdev);
>
> This does not look like trivial rename/replace fix. This should be
> tested but it looks that you just did what coccinelle asked for, without
> testing.

Right, but it must be done. If things work today, they work out of sheer
luck. Also, which evidence is there that $subject wasn't tested?

>> diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/p=
ca9450-regulator.c
>> index 2f7ee21..d4bc1c3 100644
>> --- a/drivers/regulator/pca9450-regulator.c
>> +++ b/drivers/regulator/pca9450-regulator.c
>> @@ -780,7 +780,7 @@ static int pca9450_i2c_probe(struct i2c_client *i2c,
>>=20=20
>>  	ret =3D devm_request_threaded_irq(pca9450->dev, pca9450->irq, NULL,
>>  					pca9450_irq_handler,
>> -					(IRQF_TRIGGER_FALLING | IRQF_ONESHOT),
>> +					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>
> How this is related to the missing IRQF_ONESHOT?

agreed.

>> diff --git a/drivers/regulator/slg51000-regulator.c b/drivers/regulator/=
slg51000-regulator.c
>> index 75a941f..3f310ab 100644
>> --- a/drivers/regulator/slg51000-regulator.c
>> +++ b/drivers/regulator/slg51000-regulator.c
>> @@ -479,8 +479,8 @@ static int slg51000_i2c_probe(struct i2c_client *cli=
ent)
>>  	if (chip->chip_irq) {
>>  		ret =3D devm_request_threaded_irq(dev, chip->chip_irq, NULL,
>>  						slg51000_irq_handler,
>> -						(IRQF_TRIGGER_HIGH |
>> -						IRQF_ONESHOT),
>> +						IRQF_TRIGGER_HIGH |
>> +						IRQF_ONESHOT,
>>  						"slg51000-irq", chip);
>
> How this is related to the missing IRQF_ONESHOT?

agreed.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmBcgg4RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQY8kA/9HGCbG0EumvL8wuCCIOFu4yF1PMxrdGGR
lW+2nNwf5fvukqzU8/5t4XC1DQnwxoLntrnB6oXcTc8eBSuqrAX93dlhZmSoBUs4
g4OE27VGJx0+18pN3JR8eQDjFp/Y84zjPlEiJQ7UjB6SJLAdbzUp4q6w1gvT68fd
FXWdangAhoV+lSF6idIdZ+4nHLPxu81fKmBJC5hs2XNDydXC8pVq1XrZSc9WbACA
lcRQ04GJeWk0n/X5zTjabLspc+f5GgtHes1Kmk4p8TfH4pTbrX7J9bvigaCb2ODU
kE2N+Vqe/owbeLGmEwnS8LYdPSAZzAiMUeb1eRD74/cgYgp+0CSFxiZSG1m3zckC
hjmTxT79eqTD5nq+n7b7W/lPJVxZ9e/BKqbvoUpmxpnFVj0yZYCSouAUbUK9pHos
hl3wG+ZbEZtHTwE/F0bfpTbnbp6V8SyyGx1jMATUDzPt+LcjLyDc8Ac8BYfcRdEw
hXgTf2IAgxc8FICC3lkWZk19yGefs0g+LHkMII5tFEoMtCBGCiYEQt8/r6/MBK5u
eaEJ3yXfuUCcDZfBAYQXmUwyUT3GYaTr71OsJeDX2rGP9HufFmip71cvAbZ7jZ9S
czu7YN+oy071bO878qT72bjcYBYXELnBXs5GHyeNZFy0gcAxDV8PFMG1nuSiAMoa
SallkfPoA0I=
=R8GZ
-----END PGP SIGNATURE-----
--=-=-=--
