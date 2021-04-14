Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D27A35EF50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 10:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349954AbhDNIOt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 04:14:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:34440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348355AbhDNIOs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 04:14:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA6D261222;
        Wed, 14 Apr 2021 08:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618388067;
        bh=eyJvos0Ftnqm8tRluK8Dm6HkcCy4KxqjxYjQabzApjU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ohPsIJtmb1nHNgk4p25enpaiSwEL5mVy8OlZyhSkK3KzL0pRHNAXNIPMy9acIS/nC
         pJ8Uue1PJNxrrvC7YgoCOG8eJmKX0vpK576Jk6msgzgqhXY5stgDtPyF6TZAB4b8D/
         FJQfygBdfM8cVnOSCxkJRX1tI7BhkoSmzGDxrJoRb4NYPWU3rD41exsEgOK2uo7QSG
         BFy1g8Tgu6Ha+xyIVoQpjj5FswPUWNbKlYRApmldfX/7n3c43YKzUPwloMQbVh8r/v
         8kwafZ/bRYlLkgsvQ71oKtbzWOvGega/jCmegWZZkJ4GJQMC4FvooKfa2X2BD6//0V
         m+VSVezor1f9g==
From:   Felipe Balbi <balbi@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>, caleb@connolly.tech,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8150: add i2c nodes
In-Reply-To: <20210408161953.26298-3-caleb@connolly.tech>
References: <20210408161953.26298-3-caleb@connolly.tech>
Date:   Wed, 14 Apr 2021 11:14:19 +0300
Message-ID: <874kg9p9k4.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Caleb Connolly <caleb@connolly.tech> writes:

> Tested on the OnePlus 7 Pro (including DMA).
>
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Tested on Microsoft Surface Duo (DTS will be sent after -rc1)

Tested-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmB2pFsRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYJng//f6Mm+/zbynbZedGD4wKL8FFeaOV82DhY
jNyxofB6UgLAUU2nj6hDGFJ+1Tt/+roi1SPfePBlh5xJkUW3osUZ9uHfBO1EdRHS
NZ/0U2BVy6Rufzrf8xtXml8WBBnOHp3Qnh0TTyRR0dIPiCLlBFQnsNVs6qD2Kd4k
1VCmSKE6r6RQecZUubED7wmPL2VuoewRuInuF4ICvO8lLS6GXLohI5vysDD96nK/
AaWw/4hCnIwU6tXgKnl6GfZIRrfwI5G2rRyBJH9wr2/HhmRuKOuyX2y89AycNpBH
J4lv2r8hALd0+wp9HkfctDEcT1TDuPWwm/A7x2b6XH5Uv6DPiqoo+1F5LMgzY4t9
waDfdjtCXHa9Kd4OY8w5AnMdfbhmK/dHpRE6SS9D8K/UGeA8GHRlS9WKMyleC6HY
DPtJqjJO6K9ma/TJKKONsGFr66nn6T1JzglMAcQ3RVP4gEbljfr6i3KPpGjHQ8ik
aWL8azCk6qapafkWCJpaXeEKuCwj4NjY22wC1JfYSqXUWomll1V1qO17eQuAP80b
ELZw8cqi4Pki70YjY2QWHFnMjw4ZuHrNN8m9YxgBWKPA82aNaejuJOoglOkgzuOT
h10ZK7i9+nb4JIr1NZmrQf2dwKdR3HdeOPKEXCkq26W3q2tMe1kZVRR0YwWYaEy7
v0sQpjls5OI=
=vuvI
-----END PGP SIGNATURE-----
--=-=-=--
