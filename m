Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B227C2F7C9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 14:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732408AbhAON1h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 08:27:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:43360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729512AbhAON1h (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 08:27:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EC542339D;
        Fri, 15 Jan 2021 13:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610717233;
        bh=XkMBvOrMlXmttQL6yWr2EMCqZJ9XZi6mxY8AcbIEd7U=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=NF/i5idbFV4rx7+m9bHZhAifoxxlz1AhycCYbFawfYMJtf2E3h+DaRUI62pmP+kTx
         l6zL5WHM2aEP9SxmogUNVx/aeiJpYQDfMfK0E1tt6CPsAsvdXQhbApsKgNEakqYUhM
         ZJjR6quoB7qEf6HuQMYVN18MfHM33P/XZf3XrGpTG5prFCqUHwMV+j+EB18chi00A8
         typpcq8LF6oV2aNUrQ3MXFjhBxq9RZqbBtTZ8j7ERtNtzS3+wNqQEFw3O3KIGnNOg1
         wsSwJol6J15ZyBvTASNp7awH6vHRDJpPUGbKJUs/BLSQ9YRalBpXGaxBq2SotXel+g
         4FgUR/siLfa0Q==
From:   Felipe Balbi <balbi@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2] usb: dwc3: qcom: add URS Host support for sdm845
 ACPI boot
In-Reply-To: <20210115035057.10994-1-shawn.guo@linaro.org>
References: <20210115035057.10994-1-shawn.guo@linaro.org>
Date:   Fri, 15 Jan 2021 15:27:06 +0200
Message-ID: <87mtxa1gb9.fsf@kernel.org>
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

Shawn Guo <shawn.guo@linaro.org> writes:
> For sdm845 ACPI boot, the URS (USB Role Switch) node in ACPI DSDT table
> holds the memory resource, while interrupt resources reside in the child
> nodes USB0 and UFN0.  It adds USB0 host support by probing URS node,
> creating platform device for USB0 node, and then retrieve interrupt
> resources from USB0 platform device.

just so I understand this: the interrupt was listed under a separate
device altogether?

Nothing wrong with the patch itself, but just curious.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmABmCoRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQakAQ/+NLg7Vjj3WfesfO3WVyMXH9fWkMsO8nWc
j+COChUr3iUXDNIPHOJMeWbBy3wM22JIaa1hAroaw5a3Qe73ATwXt0WxskeJtQ8h
yzjKhHHFQLKW22hp8yByyjdKkUgrnio5O3FNc+Z7KRbJ/g5yJyhJCyafe+kWrkxd
8HdpquYlfyP27pQZU9bgGvCm9Yyt9y0AuXVBlEqDDPnysJ9O8+ciIc44Y5waTPIu
VYqYrkSEJRfAtMYTFWtRy9PEUieoGuifER41mY2ENmXSsrS0gEhTbNWZs0o3gQfR
1zJTc+D+sfIBmjc+LsddoZ0h0DiObd3cr7BFW0qsIfZBQoUB0X2IoncfpU4yQJNP
cbdjTocq6dA6WLlNF88fuh8RDbBlybexLKXwp0xWuLOEOxtaxFdnAc+yHkchmxEd
CHttqflBtPvooBAcbcfPi/K7bEwb7opVUDg+HjvzhzkulgmsMxzxN0ozp/gu5DhH
h6egI/0ZjUh4fslMxvhOPdmHhnMVY2WFc6sm3bIbNGkeAKawBcuV2Q7rtMpgB0Wk
Wmkr35JdtNTGXpm22nbt/6q6OMbd60p/KxmenE9JW5Yk1cD6/F4AKl8jdjwanpmp
1y0BGCmG2lg9VQGmzKnAjmohZNMkIjsvLwD6NLf681MgNRczfm2klJeBL22f95rf
HAmdCLiO9t8=
=Xjmf
-----END PGP SIGNATURE-----
--=-=-=--
