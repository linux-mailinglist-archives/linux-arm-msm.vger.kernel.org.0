Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D93276F5A55
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 16:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjECOoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 10:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbjECOoA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 10:44:00 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460224EEB;
        Wed,  3 May 2023 07:43:58 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-94f7a7a3351so1013281366b.2;
        Wed, 03 May 2023 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683125036; x=1685717036;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YD5yiiH8lBdQsuc2FhY28EjAz9S4ScvskXPOKO+HOF0=;
        b=LflBE05+ByY33rgnNwwSUmfY2e6wAEC0LX04pNcT+W8XbE+2I5peJ4M4Q4yHz/yaAT
         zu1+4I3tTQQE38xm0pfpsnddQ6P3t/BpvPaDrh2U2piFAW2Gm0QOLZ6jHsP4hyftSWtz
         6YwLN39SS4G1Pf7Gig01/JD0BIO/F5vlVjJvve52PsfYXmVXzfTCf6A8nEMAGdm5MDNL
         cc4ZAeGiAZbN6UOw8TbZfBNrf2OcH88NulBn43L3Lg6Roy/pPxkAeeLBeU7WMG+QVaQh
         XJEBAtKMz2XpymW7cFomj+TpM9tNRrne3SYcJX2XcqK99dJFW0yLdeBIC3f+v+gCF66/
         f93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683125036; x=1685717036;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YD5yiiH8lBdQsuc2FhY28EjAz9S4ScvskXPOKO+HOF0=;
        b=ZYxVLsOXC2BuAlqQxTlDDC2T9+/MXopIEjhcdHcCPfj9rikQxOlt6sCP9BXILq8k1l
         GoYbxm7cJKYw9SEumZE+vqI/UExHGDGSVTZRCZ0JChGDAAML42U2vOoUru7oQEUJjZ9Q
         rQ/HDiyjAS52xrjhggO628yr5THuM4zgVaa44fQIQZ1ppGNDAj+woF1eyGvXoYPZ8x4T
         E264agMJV+4q8cD3e6YiQgp9YEP38nUT424q509cezSvILWsgk6zmx39jQev05CksfjZ
         xJJZ9uNNMvTE7nMfAeYteEzcyXwFEoP7oNW5LFL8xxEihh+eMB2m3mUo6PtrUNojuFQ+
         jJwA==
X-Gm-Message-State: AC+VfDz4cZFcpB64pEzEsPd4eCoo2iYl/O/VFo0WbRXsc3KSIHDA+5bc
        BywhUhaKzYWxjJi0fBSM66Y=
X-Google-Smtp-Source: ACHHUZ5WJoxOyWTGN4A9/lSdbP7f4gsHndWXSq8WzQbC9D9SdtSML4JV44DrwZ3GjsiS7QI/QvYX5w==
X-Received: by 2002:a17:907:3684:b0:94e:547b:6301 with SMTP id bi4-20020a170907368400b0094e547b6301mr3242470ejc.8.1683125036374;
        Wed, 03 May 2023 07:43:56 -0700 (PDT)
Received: from orome (p200300e41f053a00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f05:3a00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k9-20020a170906054900b00923f05b2931sm17338188eja.118.2023.05.03.07.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 07:43:55 -0700 (PDT)
Date:   Wed, 3 May 2023 16:43:53 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Steven Price <steven.price@arm.com>,
        Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 02/20] iommu/terga-gart: Replace set_platform_dma_ops()
 with IOMMU_DOMAIN_PLATFORM
Message-ID: <ZFJzKQcKNFHdIWqy@orome>
References: <2-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <1db712d2-9e33-4183-2766-34e32f170507@arm.com>
 <ZFI/D6mnLKYpdIqx@nvidia.com>
 <1a995f30-31fe-354f-ddfe-e944fa36e7a0@arm.com>
 <ZFJlZ03lswl9uHD0@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xQZEb6e6qgBHbQbj"
Content-Disposition: inline
In-Reply-To: <ZFJlZ03lswl9uHD0@nvidia.com>
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


--xQZEb6e6qgBHbQbj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2023 at 10:45:11AM -0300, Jason Gunthorpe wrote:
> On Wed, May 03, 2023 at 01:01:34PM +0100, Robin Murphy wrote:
> > On 2023-05-03 12:01, Jason Gunthorpe wrote:
> > > On Wed, May 03, 2023 at 10:17:29AM +0100, Robin Murphy wrote:
> > > > On 2023-05-01 19:02, Jason Gunthorpe wrote:
> > > > > tegra-gart seems to be kind of wonky since from the start its 'de=
tach_dev'
> > > > > op doesn't actually touch hardware. It is supposed to empty the G=
ART of
> > > > > all translations loaded into it.
> > > >=20
> > > > No, detach should never tear down translations - what if other devi=
ces are
> > > > still using the domain?
> > >=20
> > > ?? All other drivers do this.
> >=20
> > The only driver I'm aware of which effectively tore down mappings by fr=
eeing
> > its pagetable on detach was sprd-iommu, and that was recently fixed on
> > account of it being clearly wrong.
>=20
> By "Teardown" I mean deconfigure the HW.
>=20
> This driver is odd because it doesn't store a page table in the
> iommu_domain, it keeps it in the GART registers so it can't actually
> detach/attach fully correctly. :(
>=20
> > Yes, I'm not disputing that we expect detach to remove that device's
> > *access* to the IOVA (which is what GART can't do...), but it should
> > absolutely not destroy the IOVA mapping itself. Follow that sequence wi=
th
> > iommu_attach_device(dom, dev) again and the caller can expect to be abl=
e to
> > continue using the same translation.
>=20
> Yes
> =20
> > > If the HW is multi-device then it is supposed to have groups.
> >=20
> > Groups are in fact the most practical example: set up a VFIO domain, at=
tach
> > two groups to it, map some IOVAs, detach one of the groups, keep using =
the
> > other. If the detach carried an implicit iommu_unmap() there would be
> > fireworks.
>=20
> Yes, I'm not saying an unmap, I used the word teardown to mean remove
> the HW parts. This gart function doesn't touch the HW at all, that
> cannot be correct.
>=20
> It should have an xarray in the iommu_domain and on detach it should
> purge the GART registers and on attach it should load the xarray into
> the GART registers. We are also technically expecting drivers to
> support map prior to attach, eg for the direct map reserved region
> setup.
>=20
> > > Oh yuk, that is not an UNMANAGED domain either as we now assume empty
> > > UNMANAGED domains are blocking in the core...
> >=20
> > They are, in the sense that accesses within the aperture won't go
> > anywhere.
>=20
> That is not the definition of BLOCKING we came up with.. It is every
> IOVA is blocked and the device is safe to hand to VFIO. It can't be just
> blocking a subset of the IOVA.
>=20
> > It might help if domain->geometry.force_aperture was meaningful, because
> > it's never been clear whether it was supposed to reflect a hardware
> > capability (in which case it should be false for GART) or be an instruc=
tion
> > to the user of the domain (wherein it's a bit pointless that everyone a=
lways
> > sets it).
>=20
> force_aperture looks pointless now. Only two drivers don't set it -
> mtk_v1 and sprd.
>=20
> The only real reader is dma-iommu.c and mtk_v1 doesn't use that.
>=20
> So the only possible user is sprd.
>=20
> The only thing it does is cause dma-iommu.c in ARM64 to use the
> dma-ranges from OF instead of the domain aperture. sprd has no
> dma-ranges in arch/arm64/boot/dts/sprd.
>=20
> Further, sprd hard fails any map attempt outside the aperture, so it
> looks like a bug if the OF somehow chooses a wider aperture as
> dma-iommu.c will start failing maps.

That all sounds odd. of_dma_configure_id() already sets up the DMA mask
based on dma-ranges and the DMA API uses that to restrict what IOVA any
buffers can get mapped to for a given device.

Drivers can obviously still narrow down the DMA mask further if they
have any specific needs. On Tegra, for example, we use this to enforce
bus-level DMA masks. The Ethernet controller for instance might support
40 bit addresses, but the memory bus has a quirk where bit 39 is used
for extra "swizzling", so we have to restrict DMA masks to 39 bits for
all devices, regardless of what the drivers claim.

> Thus, I propose we just remove the whole thing. All drivers must set
> an aperture and the aperture is the pure HW capability to map an
> IOPTE at that address. ie it reflects the design of the page table
> itself and nothing else.

Yeah, that sounds reasonable. If the aperture represents what the IOMMU
supports. Together with each device's DMA mask we should have everything
we need.

>=20
> Probably OF dma-ranges should be reflected in the pre-device reserved
> ranges?
>=20
> This is great, I was starting to look at this part wishing the OF path
> wasn't different, and this is a clear way forward :)
>=20
> For GART, I'm tempted to give GART a blocking domain and just have its
> attach always fail - this is enough to block VFIO. Keep the weirdness
> in one place.. Or ignore it since I doubt anyone is actually using
> this now.

For Tegra GART I think there's indeed no use-cases at the moment. Dmitry
had at one point tried to make use of it because it can be helpful on
some of the older devices that were very memory-constrained. That
support never made it upstream because it required significant changes
in various places, if I recall correctly. For anything with a decent
enough amount of RAM, CMA is usually a better option.

This has occasionally come up in the past and I seem to remember that it
had once been proposed to simply remove tegra-gart and there had been no
objections. Adding Dmitry, if he doesn't have objections to remaving it,
neither do I.

Thierry

--xQZEb6e6qgBHbQbj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmRScyYACgkQ3SOs138+
s6EX8BAAtAoTtMd/zUCfTPSLJoFlCb9irVxChthfIopCBi8kWuCUVdgIcfVQgcGY
BI0/zkB/gc5Mq/AhGAFyaGsktUAM7HOBtQ70EBiguP6HpJETiADAv/y+IJi74J2E
2gbSmyuT12xEy1h9lb5AHnxFBQuvauMRacyNXH7gusOQ89U2OmZA/Q4371Swq8Fq
RkODrJvFQDXdRdHT1g6OsJDmK09GAmWvzn1h6hUdlfDBwE0i4VI+84jh3Qo4Aq8T
zULABDHeQs0znWOWBouIOEdP/5w6BgBi+qr/G/t3dSSDB3/BEqSCyBZVP+lZFLgm
lo6kC0LXJfDXMTSqCS8MC/21xIgdvVF4nGe0Ej/ydn6f1RnxSmnyU7tEyLle8h1I
fW2QQjLg1a/T1wUWDoNd+I66ovQVqEsKhYLRQrDlRbJLHcEj+xBRnEGlk6QShVPl
eSN/75008q6MS0+Y7La/jGHAVyafbG3cXaBBsDokjaObRGJqtadoyRCs5neTfxJp
d2jeqvkDbpkKr/pY0KrwFMOOD4sulARAfYylF39Agpiq0Ua1DYxZdJipWVp/LSvE
eDxBfgrMduV5IplOxCVDzyk++AsjO3YhcrJ0SuS7zfn1fN1SeD4a79x6yq6YvmXh
Gsb0GU1wuQmTk+v0ZPmXhTM30poxyUtxHUsMlvOfgloocyzN3m8=
=fUXH
-----END PGP SIGNATURE-----

--xQZEb6e6qgBHbQbj--
