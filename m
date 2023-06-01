Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A540971EFB2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 18:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbjFAQwL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 12:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjFAQwI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 12:52:08 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659541BE;
        Thu,  1 Jun 2023 09:51:44 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-96fab30d1e1so252295066b.0;
        Thu, 01 Jun 2023 09:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685638275; x=1688230275;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6aw7YI0APlK+a4Ho7hkA2bZ/IE4Hfe3r+p1hUTo22w=;
        b=P5K1gIvm5lMpyivClcYlSPpZk74Scq23UC7J49ZKXtd2Ty5NCk14Pzlmiw6G4TAT4e
         R1SGrpIa7IOeMrrklx7UG2tAsiq9TFD4L8+GH42Zwqhfq/57kAkCKDh9e1B9u0uiq27N
         Z2+cMvWVhGdpGqS04+8eMH1XROW5TNrSoWp21DvbX4Cljkzg06zAxgkEeZxXqtAHLxHn
         Ukmg1ow9zsxYl1omDwPfgFBfHdDY/RlrCywsx1cRypvE8ktrFFqeuPghyapZVqcnmPfd
         pHVao4wq68V+9Udu892pd4CZQNueuUSskC33wv4222J7q5LLmeCFeujIxSJZqtaz7HbM
         QbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685638275; x=1688230275;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6aw7YI0APlK+a4Ho7hkA2bZ/IE4Hfe3r+p1hUTo22w=;
        b=fKPNEMp/U6snZTRUz+tYWTu2y/IILBAEvWnS1EZL2awC6ErHzXNeTOO0/KhmQx0Ma7
         knIyfgCSWCD93BRz3q3ptoMBqFNuDJbySn4QZ+FBJVn/cthB6jALOtNY0mnLHUJOfSBm
         +Zz8MWzYrkMU/MsWXL3Wq6JIAU8WvJB4AQ4Ew4em8XAK40FTXXY/dCbT5Lc45KWs3rcW
         oJEWyrXVxvaic1vqF6or2tjBy2MIQvTGYYr40WAj/oRf4jPqld33+S/wKcxhtjSrtqtc
         c9Ic3b++Oh1ZowwzNTBz+V8xhCz4i/6IqMamlvaJ/r5cRtgQz5eqyNs6luerZDajtoOv
         726Q==
X-Gm-Message-State: AC+VfDyhTDQPm/1ivpSWRMzwXlmOfrykpIYOpgRudIphc7x6EngO7xSN
        5HL6ldJJV2L6FTzmaLhAuv4=
X-Google-Smtp-Source: ACHHUZ6tapSBvaY3YL2Ex5VOuVrYb3aIm5DVnhvBJZ6q0GGzp5g+K/kybtTX/EWGyJOG95QWxE5s1Q==
X-Received: by 2002:a17:907:7f15:b0:94a:4e86:31bc with SMTP id qf21-20020a1709077f1500b0094a4e8631bcmr2589785ejc.13.1685638274568;
        Thu, 01 Jun 2023 09:51:14 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s7-20020a170906c30700b0094f410225c7sm10744283ejz.169.2023.06.01.09.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 09:51:14 -0700 (PDT)
Date:   Thu, 1 Jun 2023 18:51:11 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Kevin Tian <kevin.tian@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linuxppc-dev@lists.ozlabs.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 05/25] iommu/tegra-gart: Remove tegra-gart
Message-ID: <ZHjMf9_uunlvVWtB@orome>
References: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
 <5-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0JJNQg2cyOE2ETg4"
Content-Disposition: inline
In-Reply-To: <5-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
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


--0JJNQg2cyOE2ETg4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 09:00:38PM -0300, Jason Gunthorpe wrote:
> Thierry says this is not used anymore, and doesn't think it ever will
> be. The HW it supports is about 10 years old now and newer HW uses
> different IOMMU drivers.
>=20
> As this is the only driver with a GART approach, and it doesn't really
> meet the driver expectations from the IOMMU core, let's just remove it
> so we don't have to think about how to make it fit in.
>=20
> It has a number of identified problems:
>  - The assignment of iommu_groups doesn't match the HW behavior
>=20
>  - It claims to have an UNMANAGED domain but it is really an IDENTITY
>    domain with a translation aperture. This is inconsistent with the core
>    expectation for security sensitive operations
>=20
>  - It doesn't implement a SW page table under struct iommu_domain so
>    * It can't accept a map until the domain is attached
>    * It forgets about all maps after the domain is detached
>    * It doesn't clear the HW of maps once the domain is detached
>      (made worse by having the wrong groups)
>=20
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/arm/configs/multi_v7_defconfig |   1 -
>  arch/arm/configs/tegra_defconfig    |   1 -
>  drivers/iommu/Kconfig               |  11 -
>  drivers/iommu/Makefile              |   1 -
>  drivers/iommu/tegra-gart.c          | 371 ----------------------------
>  drivers/memory/tegra/mc.c           |  34 ---
>  drivers/memory/tegra/tegra20.c      |  28 ---
>  include/soc/tegra/mc.h              |  26 --
>  8 files changed, 473 deletions(-)
>  delete mode 100644 drivers/iommu/tegra-gart.c

To clarify, I think this hardware could very well be used again, but I
don't think it makes sense to use it in the context of the IOMMU
subsystem. If anybody wants to make use of this on Tegra20, it probably
makes more sense to move the GART programming into whatever driver ends
up using it instead of jumping through all these hoops just to make it
work like something it isn't.

Acked-by: Thierry Reding <treding@nvidia.com>

--0JJNQg2cyOE2ETg4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmR4zHwACgkQ3SOs138+
s6EzXg/4sDDYzIY93jnjqgBAzF26DdM9+f9tNLS+tEhgUpn3WoMfZ+2mVBZJ6Qvl
+zK/7cpay72mra2XCdI2nBDl4fc/MivQMZ2uBvnu1mNY4uQypRWZsVlnpKO5nkpf
55oa0ZvczaCmITixiNpt58qIRcL/+Rwn+kuXCMcfZYr8WXq09eTZJ/E0SndTbgRv
RNPyDbkY2T939Z3KYEhZH3filqm0ul9asQvbO31FsU+htgOT6XEYwanpd1jZuV+E
uemlmy/fYzUkBbJoZ1wk9/pbYhZqlvZnOF3XvyJXOfsbrBiP/gkDstxYeMS86AVq
ITwKKqX80dphMpO6Af5OEpuKjrh6wtzPgdgcKIMIgd6aQADSX5xLsQ/P0kIqI0em
H679cza6Mm7Nl7NwmAMCiOVL568ME8criReWPK5nEnRg4TLj1AvsKLAubgHxXIP/
Hzxox5RDNL5ubE2gcko6btoFu+yXxvxGT9nF1YcJxBcWUhHPVqpwg1q403RqF0bE
Kfcfzs07wR/OM8vsXJxYxZdgE7HdZkh/vZnE0MWmiaGCHDaPZdx8vsMW8g0G1Wn9
a3GXa18+zdEntyjXiH2QaNuytRlcnTWX6Egc9uLjzjyWgjW8dA2PHN70fli1p+Zf
wv1qFNssXNER2qzepDmLQj621WybUok9GAhhWu0jfezY8b75zw==
=Ciid
-----END PGP SIGNATURE-----

--0JJNQg2cyOE2ETg4--
