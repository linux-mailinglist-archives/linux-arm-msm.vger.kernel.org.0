Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD6C35B3FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Apr 2021 14:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233696AbhDKMHi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Apr 2021 08:07:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:42494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229804AbhDKMHh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Apr 2021 08:07:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB436610A7;
        Sun, 11 Apr 2021 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618142841;
        bh=DN4RrAwJyhBssC8LbKB2uz36ObHqbn6/GUqX9Y2e91M=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=WbQWWx7+7ZosAGghnRxHAg7LUaiMYpEA+rxKCNc5w1/xNV/cFejP+dy8EP8EouAt/
         xwVBgC7sDGQbBzhoWwmddmU/ouXkaaV7HKGt2gb0wlYtqB8dq7V0jW9yq0ZVJd5t63
         yPEkAj6ox2YcvoOnQkV90xI3UGW4QcR5h5kM/R6dKJE//QTdO8tqnSJCoDbPOBpp83
         7M6xpoBEKMXHC8rID/vqn+O4vtC18l/QCI0/UAHfUtdm0pbPCeOXfzQviXmOcGhXgh
         rWfZJ+kB6MO6kxNZARTSCKgZHdU4EdNmxg/tWM2ZXf/Pt00MvuZEr0EQjBdgIt2MiP
         7bhsKt+KjvRCQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Bixuan Cui <cuibixuan@huawei.com>, cuibixuan@huawei.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] usb: dwc3: qcom: Remove redundant dev_err call in
 dwc3_qcom_probe()
In-Reply-To: <20210410024818.65659-1-cuibixuan@huawei.com>
References: <20210410024818.65659-1-cuibixuan@huawei.com>
Date:   Sun, 11 Apr 2021 15:07:14 +0300
Message-ID: <87czv1nhxp.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Bixuan Cui <cuibixuan@huawei.com> writes:

> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmBy5nIRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbk7xAAiOwQ4vSom7i+uiyTztDwYXKM24Kz5agC
w2Q8G7klIfubc8RvZZUKxdHHh6EBZ8rKEHSuYYELXB640sToWjmQP87B/TVzdd5a
tOg/txOAnrsVHi4m3HPxcPnvV78resQkw0Y146glK5hGxa//SNxHQnBT1fu2/Iih
Mltw7+RGzVvl5WjO+NU6/X/zaYnGJ1BSaZZ8+UH6yfMSyaSwcneFfSwWSdNzkVsV
XUiXI/SnWefjDNPn/QkoNXwuAeaGmp+SJ9YuvWFeHc57p3VRtiWw/6boaCnQcI8w
nHiA2n/IT6BttVmQD+FLkLDx5brv5zzx2qYnEplDY42SNoH5i37TFNOaHT/GUZBz
rWTbuw5ctOC+PIFDZrXZHns8P5PVp3a0HfSmwvqfKXY8KBfYso+6Js2hX1mEcOUA
lOIKAD9jD/wNjUYRiAlwAllQAf/0EDm9StoTP21G5iHWyaNqAM2GdRdoYGRSWwyZ
g8wE6Ypa19kxOKFcRI2Tkav5+cUUh23eD3hDLoTktz1ndAFMGpeYhiouB79oQOHw
TG6JFXZNCm+bK2+8l1ccnKLvLQSg+J2wX7heK1Pm8W7G8RZ0VdYnL6ebVmHXdfZo
omjFfwLTFJ+oV7ufNkHmYn4s5hlf4WmLbf5XsDq2DnDw0m/ldNMZBmYYGLqCPX6U
UpctOfNbIeo=
=7uoe
-----END PGP SIGNATURE-----
--=-=-=--
