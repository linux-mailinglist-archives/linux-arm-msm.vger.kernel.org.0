Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7954E44436
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 18:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730879AbfFMQfj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 12:35:39 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39067 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404046AbfFMQf3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 12:35:29 -0400
Received: by mail-wm1-f66.google.com with SMTP id z23so10797361wma.4;
        Thu, 13 Jun 2019 09:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CdU3AkHiGyVIlUJsXB82LDChYizZRFvTCAKkkb1a9Bo=;
        b=d21HABiSP22hYq6h2HqZvldGkD4KwFsLbe2nO07JgkifWj0n4vD0ejq10JdusropKA
         YP96a/ggrRLmwTlidX1zYOwLTTXsiJH551QUJmoK4cBh4WpCxGKz8Kn/uYGhb06UfZ6N
         j4RdWgRKhPgN188N8oiDPBv7oyI+9je3uKohQdNf8sDXc3H4AbKIcuQ78mwtlfjhhR3B
         zzFLHCGl6Fo1DTuchVDz1NHIjsQaDgroHBpaqatm9Se8lPtL4zAs0xVTjn3sgeW9GJn3
         iB9UyijNjXwP/DSzbp2aWx+gJ6Z0MzidOSvO9rdIx9m/7DS/nsMx/v6vhYTVOkMvACWL
         mNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CdU3AkHiGyVIlUJsXB82LDChYizZRFvTCAKkkb1a9Bo=;
        b=h9Volw+ShA/ku7NZl+wH3H5+RfenS5bYObJrpy2D8J7PNtZQ5IFNg9aXgUFmaB93KT
         QiYdh++8uo/Y7biC77TFHDXN34JGSUNh7kGP4JbKOERMDfNodocBsaOO2GfH5z0oGW8r
         mMIiOVn+IZBz0Kqkd6WLCqs4zI9t2fOhB42Urp0WYD8cMFSmsbN5/C/X6wQLbr47WRkk
         nz2UlC+Tjx+zeKtt/63bDdcjR/CZhh+RJz2+/MIw3f8YdZkq3Fex0hGSddrLjK6Y1FGW
         LA6BHKZsK58+k60T9/Wqgulh5v7EoX2r7kkZhRMMojkOqKtCVpYvGGj4w66WKSIXR5lE
         XIyA==
X-Gm-Message-State: APjAAAUZNd9vm0VTW7x1CAkK1z6DXsFhe1kf+Sq+JGmAKcDXWiWpKQ7m
        yRmEbc/ouRey7h4b5TXA6Vk=
X-Google-Smtp-Source: APXvYqzTMsGQ5gi7WuA5z1F9IWEkNjr/KmvxNpinkh3KQ2V8PASKooKQ8TQ9V8D6BrB+t6HYIGVZmQ==
X-Received: by 2002:a7b:c251:: with SMTP id b17mr4698049wmj.143.1560443726939;
        Thu, 13 Jun 2019 09:35:26 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id d18sm223569wrn.26.2019.06.13.09.35.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 09:35:26 -0700 (PDT)
Date:   Thu, 13 Jun 2019 18:35:25 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     joro@8bytes.org, m.szyprowski@samsung.com, kgene@kernel.org,
        krzk@kernel.org, will.deacon@arm.com, robin.murphy@arm.com,
        agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        heiko@sntech.de, jonathanh@nvidia.com,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 10/10] iommu/tegra-smmu: convert to SPDX license tags
Message-ID: <20190613163525.GB3258@ulmo>
References: <20190613162703.986-1-tiny.windzz@gmail.com>
 <20190613162703.986-10-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline
In-Reply-To: <20190613162703.986-10-tiny.windzz@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 12:27:03PM -0400, Yangtao Li wrote:
> Updates license to use SPDX-License-Identifier.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Ce00ACgkQ3SOs138+
s6FKzA//cTztUQT0grkWSjIr7uw4dhz8d4QkKoLpgJNMBy86/9lW7oGsYjGSTQd8
TElU4HT1/mbjm22/k8CS7uzTkDVIzJpLTMWIsvzJ8xlBD81/lnzau+NgzFxbCe+D
4FwpGJd9wsi1b3h1eWFzxsrY8xi17liG26hKPMl5I0uvPs0XXgIJxLvxshpwU5IH
p+Q7EDpSkcbtyxJCFcVNWQsAi0SsDawMHk42EHYEZYqgywlMfWqW/nisTODLcQGy
dWKABd5zclXza3ISw77plAvPu/7XZ79QGOLVadS2qEydL2Ec8cJg2JZovnn3hl3U
5Q7R7dq+3ArKEQXYiUhUNxNJ+pjiusO2mgn2elLB8gMcf3UehFZ6lVhFbkOete7H
rA5gaZhZd1nDC9J3wuTnCjlLDvWB/IcapgPLEiP1rvvAUJCgaQmAWgzsJs8wXm1B
robCwCzXX9q7ktjBLpeVGrrFtPDruXHWC1qcQI//nJdr7QPhliTbgrSt5+H83eY/
07UXShb9r+n+v4j8slwC6G9uuMZzq0o0OowDC3PXc5S+GXruiyVt1wB2+Z6RTvbF
P0mHLRfpPnsxC9YBejsrhVCRWHS71CQc9xuuRczo0smJXlmb3sU5KGZhZJaHWNTs
nPbGRR7vEW3lhNbSpACEZzLweA6/ALaRgri+qx3cHHnx6biX+A4=
=nAP7
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
