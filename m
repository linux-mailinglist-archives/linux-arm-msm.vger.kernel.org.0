Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33A8D719750
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 11:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbjFAJnA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 05:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbjFAJm7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 05:42:59 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D047B139;
        Thu,  1 Jun 2023 02:42:44 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5149c76f4dbso1022135a12.1;
        Thu, 01 Jun 2023 02:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685612563; x=1688204563;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7q5khLoEX4J3lidnUZjzKtgn8/eZ/Y3adwlIXy+1pGo=;
        b=DOk+vfUpNWI6QjumU5Q8+7tLd2D676JlGoIQM4t1DetpGC9GA89dMTgrSitzFdCjeN
         Z77tsGABwvU36zQJ2XcPN5KRSYoPcsSCNtdMjbV3W84CJI8D40lGXeEH+pGa3ob3liUO
         I5DqokWzpfOu/jU0+/NveUCl6Gv4CFsXhYJZyvVW7hGnYAJRsRlbBj/rZkXkfRW+62tC
         v/hIZyCWXaXmcOZDAYUhB9UtQ8nr/4l3/EBrhO1EKwjqVc7SjAYpDtb/bCUF/RiOGS/e
         jGgBjF+wuFDJ79cqaBA4FNM/aiRA+bs51RAV/5u+pTNzxt7ZPSEs/fsg6Tak4a/ReNNO
         cxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685612563; x=1688204563;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7q5khLoEX4J3lidnUZjzKtgn8/eZ/Y3adwlIXy+1pGo=;
        b=fPFSNPOrW/Y/yAPcALeB9684STjQh/9X1H9d4Mp9QXzQec3WOvEV0sHjNEEYcpAevH
         AZaRsSg4HoTd/3ZSs9kCuIHulFhdj9+qacvVlttXLKSBhDSFjGCRx0xMkEncQV9mcI8M
         0ZSA+kjiSoqhl2+k3WpMPA/vQBJO+qS56Xhy2biYo6rX5ELfy+pkWIt4T4TVK0Xl25IA
         aYhNRSH3Rhd/w+ElDYzD0+ObswvgAYa6zx1aF8UnaW3flpH6QYzvbYxKzUhaUnn9E46O
         PUBOZptKYeSkrH5fXLo2PIOAiXDlmbxxhT4A0FDOaOYBFxxJmfzuKD9jZzgDKlnVGHp2
         9JUg==
X-Gm-Message-State: AC+VfDzNo1oFWKXgLM6CfaXY+Zqfio7pwHCQD3sUQez6PfI0z75ELRF8
        PVFU24Pu6e7wTUBRm2TKXq8=
X-Google-Smtp-Source: ACHHUZ4Ut/2p85sdNMlqXBYqd/kF5rcU9VA6xQW4nb4z+SUKQQBkigJa799rdC1rKMIMKpGvTRQY1g==
X-Received: by 2002:a05:6402:349:b0:50b:c89f:f381 with SMTP id r9-20020a056402034900b0050bc89ff381mr5344371edw.29.1685612563085;
        Thu, 01 Jun 2023 02:42:43 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n15-20020a05640206cf00b004fbdfbb5acesm6916135edy.89.2023.06.01.02.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 02:42:42 -0700 (PDT)
Date:   Thu, 1 Jun 2023 11:42:40 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, sam@ravnborg.org, suijingfeng@loongson.cn,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 09/13] drm/tegra: Use regular fbdev I/O helpers
Message-ID: <ZHhoEHn_i79j8IAf@orome>
References: <20230530151228.22979-1-tzimmermann@suse.de>
 <20230530151228.22979-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J8y/7sWNqq9Yj/uK"
Content-Disposition: inline
In-Reply-To: <20230530151228.22979-10-tzimmermann@suse.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--J8y/7sWNqq9Yj/uK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 05:12:24PM +0200, Thomas Zimmermann wrote:
> Use the regular fbdev helpers for framebuffer I/O instead of DRM's
> helpers. Tegra does not use damage handling, so DRM's fbdev helpers
> are mere wrappers around the fbdev code.
>=20
> By using fbdev helpers directly within each DRM fbdev emulation,
> we can eventually remove DRM's wrapper functions entirely.
>=20
> v4:
> 	* use initializer macros for struct fb_ops
> v2:
> 	* use FB_SYS_HELPERS option
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/Kconfig | 1 +
>  drivers/gpu/drm/tegra/fbdev.c | 8 +++-----
>  2 files changed, 4 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--J8y/7sWNqq9Yj/uK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmR4aBAACgkQ3SOs138+
s6EMnhAApvbF83jJgB6q5JCxzWJ69rSVfi9hjhGoa9Wz9miYwATuP3yzLuDbf21b
6diFMn3cJ9yU+3PrBZasS4/WLyXsu0DIW8ZWsexZ2nCnjEmMjBshzfr7CaOHCHAQ
PeobxSDdVCgv898nMOwOOlDHSVpuGbexSge1pq9Tsfid4IDWZHTap1y3a56iyhxy
tsP27T0aQ+2jKYTegSaokFocUaeFper7JWV3mSr1FZH4N8CqskB3p+YMSzdWp9K4
KiSrfAo8w09MPTwy3A/LxzIGXaGofiOUITd/zk6CWEl33Be2v1iva7Anq3cljKiT
KU5vNPVgmK3Fhz0o08cFuUS6t42GtMh/iij/1ZE5HePx5IPkZjJGSpg/9DXNHOA1
68V0xsUPRSUpEIm6Q91oPZVFTF4PGK0rYkRWCIH+C6JW67wvfKbRoUgwbEN+ZrC7
yQMNtpi9HKHq3v/+PahWPiWTEp3K7GAy2HAoEdtP5whzNqohKwn+qIHXC7Cu9tPC
aexe4C80Aq8PBX1v2E/cVRq69BnzDwDZEiBXjRugfzDZn0KhMuPNxFJxwyi27ibK
dWrkkLHypmvS04FY0HGzt5OxuuIPTiiPfg57DAfl9LmTisbXRI9RyPHF508ll9T6
HgJJLHycd7x1y639mAntcOoe9GfgQwA9rUiv4mvIe3EkrJQqBgg=
=793F
-----END PGP SIGNATURE-----

--J8y/7sWNqq9Yj/uK--
