Return-Path: <linux-arm-msm+bounces-60731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B567AAD3169
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2992A189606C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 09:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDEC28AAFF;
	Tue, 10 Jun 2025 09:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVHFbyf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00A428A40D;
	Tue, 10 Jun 2025 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546699; cv=none; b=SG3xoybcePLsCfU21RcCbf2fE1BRgb3NnM430O9ReJSsE+S9NQcATgPbrvYTmUhJT5UEi+P68qQ9fMS6ONj2cjzbKavLvUXQdZXSf/UnzJ7Tz+viY4+lMKwditFKPpe8v3CQ/qGJYABWxSHiHjNLKBbSbXY/pfjkL5ZnCN2h/mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546699; c=relaxed/simple;
	bh=gtuGk4aRFSpL1zHBjW3pY01TZxS1XUNvzlXCe18x3zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLGjU/2RfhNIZAx09t9gZS0VpuXOypYtGkDQIWHC/iyMVKqpT8HoKVgE3Kj9dwjO/IvrhDigZfsWYLOEUIsQTybO7kqqddBWQjKxmWRS5qNhClFeiYa3f7zyo5qNdjHrONnwC0Sa6Ul6G1XfZbzKAMtxy6GPHFVmMntsYr/ydP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVHFbyf9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so1565613f8f.1;
        Tue, 10 Jun 2025 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749546694; x=1750151494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/J4JSHATnk9TCsjKFzEkFQy2OXqCakBAt2qzrcv/bCo=;
        b=XVHFbyf9jfTgu2x3aTUinhkOaN0IGwVj2iHy4Ig4n/CFRk/iT0pN3ueu5L7o5xHyZA
         04GvFt1vySd9FAF4OAPbTdqpqb1/IRLB/cS6aqusR2vGgf37wJAM2STMEAwUf0PNdtry
         WPs+/gFgq15fsO0Lj14O/Ufajv9bEvcfKB/6YSSqxdYWEFtCetR1DTySOj6nO+Rw3uQN
         YI5E5/M9Sd6gG/nghSm/fB0uBUTdJ7MQ8Gtopis9A+GLQP7JPqJs5m4TLJzxKV+QBtGN
         uSM48d9e2yUqO/4FDqkIaIb/3I47s72y4sRqgFaN2wUpX4X6qRGNRxRhZVRQvED+mFoY
         DN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546694; x=1750151494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J4JSHATnk9TCsjKFzEkFQy2OXqCakBAt2qzrcv/bCo=;
        b=VM3z1igABNlVOMvShCOY1po06RwmjsbAWTh2oDusIZN+JstBuFi1MMzi6h5cRZCbvP
         UP9tPnIrOalzcXuApY65ZVYNvsnCh0gL4sjvr0rcs3spEXum6U8vc7qCtWfAu4xXg8lg
         f/o4OnBsyrdlOfUhp7J+SqDQgmiDufqZouRF8i76CmgTGoeBprD037NoiedGxWJwuLUp
         RFVnwShq9daWk6Hx/R5IL42XZNG6dbN3i8SLtxut+nDH2x2n+uMdPW0O5/RK1fred/Xs
         BGUU+tv+3eRSrK5uAb6q67G+YoQKUIiTuPX/dmlgJn1HLiVBOSRCyvC6d9KATj94WQfb
         bZew==
X-Forwarded-Encrypted: i=1; AJvYcCUeFs6YUIxntCNQDB+GtneWRF3esLQi4mNAqJFN9fFPIthZnlx3nMon6F87YXKVaCFJpIPKNX8ErFU2bA==@vger.kernel.org, AJvYcCUgbQTniPNFEvS9i1LsvRCbtz9wpksgBX7dXedgGzYq8LM5ob44UknW3OIgbDHYgMF9qJiz5G2LwoVcj0fg@vger.kernel.org, AJvYcCUqpYdO8SaqDso2S9rLLTHi3vkqTFqpAz/U6502/uC3JAccpGozoexdwz7nHU5F+CmjCyFcd9SA66uM7SC1hOJAviM=@vger.kernel.org, AJvYcCWtguHFm3yJdkqCMKj7P7Nmd0g799wgmQF3TlwrGpkN+YdWO1mM0VGyHKY6+aub7XfNus6zy6bpzGy6sfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLeMhN7iQQOGF+CUlA8yaJBjZI+ZdtW2ZecKNr4HPpD5t3w2iH
	FQ3meZd4/z36MEJcjEbvXkD053t+/6+SCPaAumwELd7OL3Uhk4hpdK6B
X-Gm-Gg: ASbGncuS0V1eO2vdvMQhh5+CP5p/h/9/eUlkKQF295FmeRvaZtcx1eZalMzE/Y8+A9j
	ywIFFZdGBbGtqUdkHIQXCli7RpEQblA51mrU9Yp+BIsxvycULG0675Ofq5G/8/Y5CPUAGuCRten
	ExTPmqz0WI1jA0tSgsikDREAYquEHklAkdt7Jn+gKs/hA2SxXzDR8KhwnVU7gVZxvKl2LhdFKKQ
	m3Y2QGBKq++ODNA5xcJOKgkSFcA3Tog2v9GhdHKKSuXszIVpjMY4PK/ihOH4iSn5DbD9De/KFyT
	kGJof/KhKertpufjyfTn/S4FFPPZuC+ODU7frEs7G50b3+tv+1G1mYnTmDuKEjg3+x50t/CEjtN
	29TIBwCamxUZtFTBv635J68XDHsyiVzdmR7yqV2LReiAel3YJ
X-Google-Smtp-Source: AGHT+IGiaud+NmiD3BNjNEkh0KdS8oAZ8TPOqcLbBsZsD4cCdkMv4OiwbthBO25zWdPhWgZ1rXZiAA==
X-Received: by 2002:a5d:588a:0:b0:3a4:f936:7882 with SMTP id ffacd0b85a97d-3a531ced06fmr13875069f8f.55.1749546693846;
        Tue, 10 Jun 2025 02:11:33 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320580af6sm6174635e9.1.2025.06.10.02.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:11:32 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:11:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Woodhouse <dwmw2@infradead.org>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev, 
	Janne Grunau <j@jannau.net>, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Robin Murphy <robin.murphy@arm.com>, 
	Samuel Holland <samuel@sholland.org>, Sven Peter <sven@kernel.org>, Krishna Reddy <vdumpa@nvidia.com>, 
	virtualization@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>, 
	Yong Wu <yong.wu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 4/7] iommu: Remove iommu_ops pgsize_bitmap from simple
 drivers
Message-ID: <zkfsgkps6z5wyjxdl3wmn2piwgir7swgml4jomuhxxkedne22d@hwzwxvcwpu3h>
References: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="noll3rebw4hmh74s"
Content-Disposition: inline
In-Reply-To: <4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>


--noll3rebw4hmh74s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/7] iommu: Remove iommu_ops pgsize_bitmap from simple
 drivers
MIME-Version: 1.0

On Mon, Jun 09, 2025 at 05:41:28PM -0300, Jason Gunthorpe wrote:
[...]
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 61897d50162dd7..fa0913e9346c71 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -318,6 +318,8 @@ static struct iommu_domain *tegra_smmu_domain_alloc_p=
aging(struct device *dev)
> =20
>  	spin_lock_init(&as->lock);
> =20
> +	as->domain.pgsize_bitmap =3D SZ_4K;
> +
>  	/* setup aperture */
>  	as->domain.geometry.aperture_start =3D 0;
>  	as->domain.geometry.aperture_end =3D 0xffffffff;
> @@ -1002,7 +1004,6 @@ static const struct iommu_ops tegra_smmu_ops =3D {
>  	.probe_device =3D tegra_smmu_probe_device,
>  	.device_group =3D tegra_smmu_device_group,
>  	.of_xlate =3D tegra_smmu_of_xlate,
> -	.pgsize_bitmap =3D SZ_4K,
>  	.default_domain_ops =3D &(const struct iommu_domain_ops) {
>  		.attach_dev	=3D tegra_smmu_attach_dev,
>  		.map_pages	=3D tegra_smmu_map,

Acked-by: Thierry Reding <treding@nvidia.com>

--noll3rebw4hmh74s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH9sIACgkQ3SOs138+
s6HNrxAAo93PCboo986Da72XguJIozPLAKyIbWbaeG0mAjcZN8YUqcSh21C3Xp4m
qkNL3FwIbtg55H/1upzln07ZErFxc56r95b+GjnH7G4+X4608YnbKmdlZMxzkhpk
Hiqglce9T205CGZdT2oaZeO26+zHlTeh3LBiiR4o0eurhupQldQ9evEZ5qVseZDA
FOHY9nWWRDf0/HkM/+MpPA/8cXnNUpME3+OMZIWf6E0Fk0YJnGKS/FIj/aoYPvJI
9cHiJLi/xs2mxDGh9xUuYDXRcapqzGw6fpsFzJM4G1dEDbYctUR9IOgvdWJ/vzNk
zYnCdPC4tMYkkOwW85wmXbkVUkbTplxVlLUrVBDVjsou2gKfhKOj/lXWBQjWXJ2w
PWaIHU9l+OSWsvXB3qkUtROmoqFqrf4+XA/2kV9AlRJO7rrb0hK8yj42rtjec2ix
y5aU/5/v0Hcr+d09jaikpqhAx1miE9mHEFObqRBtOVko2pZ4l/DD6OVWBNDJyqHM
9fX438+BucatKIy11m72MpW4m9FdBxwhPEfpyQSc79NCDtoKzoxE0wGFzxqcKyys
EMGegmdKh0OKQke0uP2Ieo02BIp7sCoCf4m98nTRTYfOGTgfXO4kmfccAUeki59x
5ez2fDP654E1ESVH+Xn7bWfBKtFiuw6IlaPL+CPNnjcaAxxtDUk=
=E5td
-----END PGP SIGNATURE-----

--noll3rebw4hmh74s--

