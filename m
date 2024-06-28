Return-Path: <linux-arm-msm+bounces-24624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA6B91BD9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 13:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4286D1F24C4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 11:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55BE156250;
	Fri, 28 Jun 2024 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYg2kNBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E1A1865A;
	Fri, 28 Jun 2024 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719574795; cv=none; b=P6IaAUeGaWjd3wiN7GztEB4yIN/Ql6js+IuNTwDaFprq5IKj9uQxwfg8p5sHzrWyC9QV4MKygpLSTOM2pe7mpE35JtIO7f39To8EqRMMYBSPrBID82E2BNQE1NIHOKVc+pn3tX9CyDWKAHSAnBoco31ilYLI8Nlmad19gNBAIGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719574795; c=relaxed/simple;
	bh=uqjsEP9Qg1vWF6kXVqqKg5kg5r9SvPpi2eItIMkjd/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYyXD4qtEXUpKycvlbsG6BtbnR6RnpZzBHqcfoDl04L0+2Gbw+pPrdhO19k//VtSt+M3jKFAOkoO6PGugGbfZDhGkZAGhIAkoPgld2nX9Y1t/o1KLFjsN4SXj0MBBCIHF7BzjnpkLsDB7DFNEfB06AEienZHIpl+FaR1fQfMask=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYg2kNBU; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cdb0d8107so603395e87.1;
        Fri, 28 Jun 2024 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719574790; x=1720179590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xscV0VcJEeKjlivRMzaEAlqopzfvhsz3/6WEPhufSmY=;
        b=bYg2kNBUkyc6o7IOnJRKjrhcmxbw71iVDEVsxJ8c5e6EByCXdbQKq7aXJDTD9lPrsH
         XF83f2LNdkJhcK35U6LfIZ7DxehEM1bN1fS9aHDt65t+YZlS6jO+kvRjgI5oOCz/Uyx4
         MweLBBaYfM5Yq39Zm8z+g2PhdkzAywXKT9kmyU45AWogH+mpGWr7YEN+fWYICLYjZaXs
         eiVb6GHn/ljB6gXcqP29Lrrmw7Ye5U+qmLOlhw8t+QpHObDHDV7ohZidvBEb5ytQoulS
         FEMC+7J6uTzVxxrQE/wLgEli+fCOzYLrmMt3GF4VOu96mtTcD8WZaXgou+WABQOS1/cK
         B44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719574790; x=1720179590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xscV0VcJEeKjlivRMzaEAlqopzfvhsz3/6WEPhufSmY=;
        b=xILjsyBr+km2Jfqkp55rhGQ2idkGwKvCi+Y0NTSivh0GQdPiLat+fERkLi8v9zWs5c
         snphNlukDU/wWzFDIvPJRaYtrTLXgVDMm6L0OwE24pcZqUGWSmUiw0wHP+3Q9NdmW0Rg
         nDCLNdXNOcju5XPN/dyGv436JkkhcWq1EilQhjZE8bdAwxK3Za1MUsZRKhhFqJ1esj0V
         44A/cp7nUYb1Qd9Ll1shmWO0uh5PdUSlXMgrrwUq6IxdOuffSzWAkXtLJtd0wxANCkUH
         mpn1mR0iz24dxLjUBDBIVzpthyRxx1fHDspO4cLBSJ2EvyiDS4CXg/bFZd+tZYQ8W92v
         FsTA==
X-Forwarded-Encrypted: i=1; AJvYcCWcofa28g8IAk2XKki5a66FrkVA3yyCPMjGi6OpxIwKuRXsZwcq7rr1RUI/6vg/mkXB35DeTBGoKD9SzdLBRqkMtiaxUU2alKB+6g6t/oGh24f4sVCeNgzJydfNvlkjLQOm5Q71MRedX1XtoAvGn3sYmSYal7rfSCRWHHkg41iqDtlH93OF9fQ=
X-Gm-Message-State: AOJu0YyRkF7U963+PN4Hu2zY38bNyNqTd0RcwKf47owsVXJi39OhoGU1
	tcooyKgjKMDZSviZ6qj2pm2cI4ofHPdNMysSAxVKYm1uewWbbrdNg4uA0U0rQ8zB2T2pAndnqnl
	XVju2I9nuHXJ4dXAgH9A/Un7oq0k=
X-Google-Smtp-Source: AGHT+IHp41b4goTlKS9Ylg+h1xztEx9ea6egMqvB7vhy6nlXVdbvAtLjrn8ECpvNeZSMDCyJ57ajbazFFZm76HgzQHM=
X-Received: by 2002:a05:6512:3085:b0:52e:79d8:691 with SMTP id
 2adb3069b0e04-52e79d8089bmr1715651e87.30.1719574789712; Fri, 28 Jun 2024
 04:39:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628-asus-vivobook-s15-v1-0-2a1e4571b8ab@gmail.com> <20240628-asus-vivobook-s15-v1-2-2a1e4571b8ab@gmail.com>
In-Reply-To: <20240628-asus-vivobook-s15-v1-2-2a1e4571b8ab@gmail.com>
From: Xilin Wu <wuxilin123@gmail.com>
Date: Fri, 28 Jun 2024 19:39:37 +0800
Message-ID: <CAEPPPKuD_gJF-c85fDA_6oYrf7=8nA2GL2XZzQ9tu8s3LTOb1w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add device tree for ASUS Vivobook S 15
To: wuxilin123@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please ignore this. I messed up the Makefile :)

Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
=E4=BA=8E2024=E5=B9=B46=E6=9C=8828=E6=97=A5=E5=91=A8=E4=BA=94 19:30=E5=86=
=99=E9=81=93=EF=BC=9A
>
> From: Xilin Wu <wuxilin123@gmail.com>
>
> ASUS Vivobook S 15 is a laptop based on the Qualcomm Snapdragon X Elite
> SoC (X1E78100).
>
> Add the device tree for the laptop with support for the following feature=
s:
>
> - CPU frequency scaling up to 3.4GHz
> - NVMe storage on PCIe 6a (capable of Gen4x4, currently limited to Gen4x2=
)
> - Keyboard and touchpad
> - WCN7850 Wi-Fi
> - Two Type-C ports on the left side (USB3 only in one orientation)
> - internal eDP display
> - ADSP and CDSP remoteprocs
>
> Further details could be found in the cover letter.
>
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  | 515 ++++++++-------=
--
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 613 +++++++++++++++=
++++++
>  2 files changed, 871 insertions(+), 257 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 5576c7d6ea06..dac4e19de654 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -1,262 +1,263 @@
>  # SPDX-License-Identifier: GPL-2.0
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D apq8016-sbc.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D apq8016-sbc.dtb
>
> -apq8016-sbc-usb-host-dtbs      :=3D apq8016-sbc.dtb apq8016-sbc-usb-host=
.dtbo
> +# apq8016-sbc-usb-host-dtbs    :=3D apq8016-sbc.dtb apq8016-sbc-usb-host=
.dtbo
>
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D apq8016-sbc-usb-host.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D apq8016-sbc-d3-camera-mezzanine.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D apq8016-schneider-hmibsc.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D apq8039-t2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D apq8094-sony-xperia-kitakami-karin_w=
indy.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D apq8096-db820c.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D apq8096-ifc6640.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq5018-rdp432-c2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq5018-tplink-archer-ax55-v1.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq5332-rdp441.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq5332-rdp442.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq5332-rdp468.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq5332-rdp474.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq6018-cp01-c1.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq8074-hk01.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq8074-hk10-c1.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq8074-hk10-c2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq9574-rdp418.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq9574-rdp433.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq9574-rdp449.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq9574-rdp453.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D ipq9574-rdp454.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8216-samsung-fortuna3g.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-acer-a1-724.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-alcatel-idol347.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-asus-z00l.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-gplus-fl8005a.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-huawei-g7.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-longcheer-l8150.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-longcheer-l8910.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-motorola-harpia.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-motorola-osprey.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-motorola-surnia.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-mtp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-samsung-a3u-eur.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-samsung-a5u-eur.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-samsung-e5.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-samsung-e7.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-samsung-gprimeltecan.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-samsung-grandmax.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-samsung-grandprimelte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-samsung-gt510.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-samsung-gt58.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-samsung-j5.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-samsung-j5x.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-samsung-rossa.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-samsung-serranove.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-thwc-uf896.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-thwc-ufi001c.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-wingtech-wt88047.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8916-yiming-uz801v3.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8939-huawei-kiwi.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8939-longcheer-l9100.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8939-samsung-a7.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8939-sony-xperia-kanuti-tulip.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8953-motorola-potter.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8953-xiaomi-daisy.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8953-xiaomi-mido.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8953-xiaomi-tissot.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8953-xiaomi-vince.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8956-sony-xperia-loire-kugo.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8956-sony-xperia-loire-suzu.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8992-lg-bullhead-rev-10.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8992-lg-bullhead-rev-101.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8992-msft-lumia-octagon-talkman.d=
tb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8992-xiaomi-libra.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8994-huawei-angler-rev-101.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8994-msft-lumia-octagon-cityman.d=
tb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8994-sony-xperia-kitakami-ivy.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8994-sony-xperia-kitakami-karin.d=
tb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8994-sony-xperia-kitakami-satsuki=
.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8994-sony-xperia-kitakami-sumire.=
dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8994-sony-xperia-kitakami-suzuran=
.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8996-mtp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8996-oneplus3.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8996-oneplus3t.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8996-sony-xperia-tone-dora.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8996-sony-xperia-tone-kagura.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8996-sony-xperia-tone-keyaki.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8996-xiaomi-gemini.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8996pro-xiaomi-natrium.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8996pro-xiaomi-scorpio.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8998-asus-novago-tp370ql.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8998-fxtec-pro1.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8998-hp-envy-x2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8998-lenovo-miix-630.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8998-mtp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8998-oneplus-cheeseburger.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8998-oneplus-dumpling.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8998-sony-xperia-yoshino-lilac.dt=
b
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8998-sony-xperia-yoshino-maple.dt=
b
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8998-sony-xperia-yoshino-poplar.d=
tb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8998-xiaomi-sagit.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-fairphone-fp5.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-idp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-shift-otter.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs404-evb-1000.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs404-evb-4000.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs8550-aim300-aiot.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D qdu1000-idp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-rb1.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb4210-rb2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb5165-rb5.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb5165-rb5-vision-mezzanine.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D qru1000-idp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sa8155p-adp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sa8295p-adp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sa8540p-ride.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sa8775p-ride.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-acer-aspire1.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-idp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-coachz-r1.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-coachz-r1-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-coachz-r3.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-coachz-r3-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-homestar-r2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-homestar-r3.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-homestar-r4.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-kingoftown.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-r1.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-r1-kb.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-r1-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-r3.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-r3-kb.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-r3-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-r9.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-r9-kb.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-r9-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-r10.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-r10-kb.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-r10-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-limozeen-r4.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-limozeen-r9.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-limozeen-r10.dt=
b
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-limozeen-nots-r=
4.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-limozeen-nots-r=
5.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-limozeen-nots-r=
9.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-lazor-limozeen-nots-r=
10.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-pazquel-lte-parade.dt=
b
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-pazquel-lte-ti.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-pazquel-parade.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-pazquel-ti.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-pazquel360-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-pazquel360-wifi.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-pompom-r1.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-pompom-r1-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-pompom-r2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-pompom-r2-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-pompom-r3.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-pompom-r3-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-quackingstick-r0.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-quackingstick-r0-lte.=
dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-wormdingler-rev1-boe.=
dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-wormdingler-rev1-inx.=
dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-wormdingler-rev1-inx-=
rt5682s.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-wormdingler-rev1-boe-=
rt5682s.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-r1.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-trogdor-r1-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-herobrine-crd.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-herobrine-crd-pro.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-herobrine-evoker.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-herobrine-evoker-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-herobrine-herobrine-r1.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-herobrine-villager-r0.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-herobrine-villager-r1.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-herobrine-villager-r1-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-herobrine-zombie.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-herobrine-zombie-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-herobrine-zombie-nvme.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-herobrine-zombie-nvme-lte.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-idp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-idp2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7280-crd-r3.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc8180x-lenovo-flex-5g.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc8180x-primus.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc8280xp-crd.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sc8280xp-lenovo-thinkpad-x13s.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sda660-inforce-ifc6560.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm450-lenovo-tbx605f.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm450-motorola-ali.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm630-sony-xperia-ganges-kirin.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm630-sony-xperia-nile-discovery.dt=
b
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm630-sony-xperia-nile-pioneer.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm630-sony-xperia-nile-voyager.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm632-fairphone-fp3.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm632-motorola-ocean.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm636-sony-xperia-ganges-mermaid.dt=
b
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm660-xiaomi-lavender.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm670-google-sargo.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-cheza-r1.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-cheza-r2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-cheza-r3.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-db845c.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-db845c-navigation-mezzanine.d=
tb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-lg-judyln.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-lg-judyp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-mtp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-oneplus-enchilada.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-oneplus-fajita.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-samsung-starqltechn.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-sony-xperia-tama-akari.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-sony-xperia-tama-akatsuki.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-sony-xperia-tama-apollo.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-xiaomi-beryllium-ebbg.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-xiaomi-beryllium-tianma.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-xiaomi-polaris.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-shift-axolotl.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm850-lenovo-yoga-c630.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm850-samsung-w737.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sdx75-idp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm4250-oneplus-billie2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm4450-qrd.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm6115-fxtec-pro1x.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm6115p-lenovo-j606f.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm6125-sony-xperia-seine-pdx201.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm6125-xiaomi-laurel-sprout.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm6350-sony-xperia-lena-pdx213.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm6375-sony-xperia-murray-pdx225.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm7125-xiaomi-curtana.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm7125-xiaomi-joyeuse.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm7225-fairphone-fp4.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8150-hdk.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8150-microsoft-surface-duo.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8150-mtp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8150-sony-xperia-kumano-bahamut.dt=
b
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8150-sony-xperia-kumano-griffin.dt=
b
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8250-hdk.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8250-mtp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8250-sony-xperia-edo-pdx203.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8250-sony-xperia-edo-pdx206.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8250-xiaomi-elish-boe.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8250-xiaomi-elish-csot.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8250-xiaomi-pipa.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8350-hdk.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8350-microsoft-surface-duo2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8350-mtp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8350-sony-xperia-sagami-pdx214.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8350-sony-xperia-sagami-pdx215.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8450-hdk.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8450-qrd.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8450-sony-xperia-nagara-pdx223.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8450-sony-xperia-nagara-pdx224.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8550-hdk.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8550-mtp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8550-qrd.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8550-samsung-q5q.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8550-sony-xperia-yodo-pdx234.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D apq8016-sbc-usb-host.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D apq8016-sbc-d3-camera-mezzanine.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D apq8016-schneider-hmibsc.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D apq8039-t2.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D apq8094-sony-xperia-kitakami-karin_w=
indy.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D apq8096-db820c.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D apq8096-ifc6640.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq5018-rdp432-c2.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq5018-tplink-archer-ax55-v1.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq5332-rdp441.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq5332-rdp442.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq5332-rdp468.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq5332-rdp474.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq6018-cp01-c1.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq8074-hk01.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq8074-hk10-c1.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq8074-hk10-c2.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq9574-rdp418.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq9574-rdp433.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq9574-rdp449.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq9574-rdp453.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D ipq9574-rdp454.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8216-samsung-fortuna3g.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-acer-a1-724.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-alcatel-idol347.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-asus-z00l.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-gplus-fl8005a.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-huawei-g7.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-longcheer-l8150.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-longcheer-l8910.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-motorola-harpia.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-motorola-osprey.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-motorola-surnia.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-mtp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-samsung-a3u-eur.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-samsung-a5u-eur.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-samsung-e5.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-samsung-e7.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-samsung-gprimeltecan.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-samsung-grandmax.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-samsung-grandprimelte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-samsung-gt510.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-samsung-gt58.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-samsung-j5.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-samsung-j5x.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-samsung-rossa.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-samsung-serranove.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-thwc-uf896.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-thwc-ufi001c.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-wingtech-wt88047.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8916-yiming-uz801v3.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8939-huawei-kiwi.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8939-longcheer-l9100.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8939-samsung-a7.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8939-sony-xperia-kanuti-tulip.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8953-motorola-potter.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8953-xiaomi-daisy.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8953-xiaomi-mido.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8953-xiaomi-tissot.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8953-xiaomi-vince.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8956-sony-xperia-loire-kugo.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8956-sony-xperia-loire-suzu.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8992-lg-bullhead-rev-10.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8992-lg-bullhead-rev-101.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8992-msft-lumia-octagon-talkman.d=
tb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8992-xiaomi-libra.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8994-huawei-angler-rev-101.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8994-msft-lumia-octagon-cityman.d=
tb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8994-sony-xperia-kitakami-ivy.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8994-sony-xperia-kitakami-karin.d=
tb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8994-sony-xperia-kitakami-satsuki=
.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8994-sony-xperia-kitakami-sumire.=
dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8994-sony-xperia-kitakami-suzuran=
.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8996-mtp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8996-oneplus3.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8996-oneplus3t.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8996-sony-xperia-tone-dora.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8996-sony-xperia-tone-kagura.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8996-sony-xperia-tone-keyaki.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8996-xiaomi-gemini.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8996pro-xiaomi-natrium.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8996pro-xiaomi-scorpio.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8998-asus-novago-tp370ql.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8998-fxtec-pro1.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8998-hp-envy-x2.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8998-lenovo-miix-630.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8998-mtp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8998-oneplus-cheeseburger.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8998-oneplus-dumpling.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8998-sony-xperia-yoshino-lilac.dt=
b
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8998-sony-xperia-yoshino-maple.dt=
b
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8998-sony-xperia-yoshino-poplar.d=
tb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8998-xiaomi-sagit.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D qcm6490-fairphone-fp5.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D qcm6490-idp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D qcm6490-shift-otter.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs404-evb-1000.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs404-evb-4000.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs6490-rb3gen2.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs8550-aim300-aiot.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D qdu1000-idp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D qrb2210-rb1.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D qrb4210-rb2.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D qrb5165-rb5.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D qrb5165-rb5-vision-mezzanine.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D qru1000-idp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sa8155p-adp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sa8295p-adp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sa8540p-ride.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sa8775p-ride.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-acer-aspire1.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-idp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-coachz-r1.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-coachz-r1-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-coachz-r3.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-coachz-r3-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-homestar-r2.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-homestar-r3.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-homestar-r4.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-kingoftown.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-r1.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-r1-kb.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-r1-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-r3.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-r3-kb.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-r3-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-r9.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-r9-kb.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-r9-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-r10.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-r10-kb.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-r10-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-limozeen-r4.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-limozeen-r9.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-limozeen-r10.dt=
b
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-limozeen-nots-r=
4.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-limozeen-nots-r=
5.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-limozeen-nots-r=
9.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-lazor-limozeen-nots-r=
10.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-pazquel-lte-parade.dt=
b
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-pazquel-lte-ti.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-pazquel-parade.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-pazquel-ti.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-pazquel360-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-pazquel360-wifi.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-pompom-r1.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-pompom-r1-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-pompom-r2.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-pompom-r2-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-pompom-r3.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-pompom-r3-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-quackingstick-r0.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-quackingstick-r0-lte.=
dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-wormdingler-rev1-boe.=
dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-wormdingler-rev1-inx.=
dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-wormdingler-rev1-inx-=
rt5682s.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-wormdingler-rev1-boe-=
rt5682s.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-r1.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7180-trogdor-r1-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-herobrine-crd.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-herobrine-crd-pro.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-herobrine-evoker.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-herobrine-evoker-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-herobrine-herobrine-r1.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-herobrine-villager-r0.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-herobrine-villager-r1.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-herobrine-villager-r1-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-herobrine-zombie.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-herobrine-zombie-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-herobrine-zombie-nvme.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-herobrine-zombie-nvme-lte.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-idp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-idp2.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc7280-crd-r3.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc8180x-lenovo-flex-5g.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc8180x-primus.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc8280xp-crd.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sc8280xp-lenovo-thinkpad-x13s.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sda660-inforce-ifc6560.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm450-lenovo-tbx605f.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm450-motorola-ali.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm630-sony-xperia-ganges-kirin.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm630-sony-xperia-nile-discovery.dt=
b
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm630-sony-xperia-nile-pioneer.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm630-sony-xperia-nile-voyager.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm632-fairphone-fp3.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm632-motorola-ocean.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm636-sony-xperia-ganges-mermaid.dt=
b
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm660-xiaomi-lavender.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm670-google-sargo.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-cheza-r1.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-cheza-r2.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-cheza-r3.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-db845c.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-db845c-navigation-mezzanine.d=
tb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-lg-judyln.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-lg-judyp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-mtp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-oneplus-enchilada.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-oneplus-fajita.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-samsung-starqltechn.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-sony-xperia-tama-akari.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-sony-xperia-tama-akatsuki.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-sony-xperia-tama-apollo.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-xiaomi-beryllium-ebbg.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-xiaomi-beryllium-tianma.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-xiaomi-polaris.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm845-shift-axolotl.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm850-lenovo-yoga-c630.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdm850-samsung-w737.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sdx75-idp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm4250-oneplus-billie2.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm4450-qrd.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm6115-fxtec-pro1x.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm6115p-lenovo-j606f.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm6125-sony-xperia-seine-pdx201.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm6125-xiaomi-laurel-sprout.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm6350-sony-xperia-lena-pdx213.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm6375-sony-xperia-murray-pdx225.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm7125-xiaomi-curtana.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm7125-xiaomi-joyeuse.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm7225-fairphone-fp4.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8150-hdk.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8150-microsoft-surface-duo.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8150-mtp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8150-sony-xperia-kumano-bahamut.dt=
b
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8150-sony-xperia-kumano-griffin.dt=
b
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8250-hdk.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8250-mtp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8250-sony-xperia-edo-pdx203.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8250-sony-xperia-edo-pdx206.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8250-xiaomi-elish-boe.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8250-xiaomi-elish-csot.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8250-xiaomi-pipa.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8350-hdk.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8350-microsoft-surface-duo2.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8350-mtp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8350-sony-xperia-sagami-pdx214.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8350-sony-xperia-sagami-pdx215.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8450-hdk.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8450-qrd.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8450-sony-xperia-nagara-pdx223.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8450-sony-xperia-nagara-pdx224.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8550-hdk.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8550-mtp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8550-qrd.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8550-samsung-q5q.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8550-sony-xperia-yodo-pdx234.dtb
>
> -sm8650-hdk-display-card-dtbs   :=3D sm8650-hdk.dtb sm8650-hdk-display-ca=
rd.dtbo
> +# sm8650-hdk-display-card-dtbs :=3D sm8650-hdk.dtb sm8650-hdk-display-ca=
rd.dtbo
>
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8650-hdk-display-card.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8650-hdk.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8650-mtp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8650-qrd.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-crd.dtb
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-qcp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8650-hdk-display-card.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8650-hdk.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8650-mtp.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8650-qrd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-asus-vivobook-s15.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D x1e80100-crd.dtb
> +# dtb-$(CONFIG_ARCH_QCOM)      +=3D x1e80100-qcp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/ar=
ch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> new file mode 100644
> index 000000000000..65cb3b0bd109
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> @@ -0,0 +1,613 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + * Copyright (c) 2024, Xilin Wu <wuxilin123@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "x1e80100.dtsi"
> +#include "x1e80100-pmics.dtsi"
> +
> +/ {
> +       model =3D "ASUS Vivobook S 15";
> +       compatible =3D "asus,vivobook-s15", "qcom,x1e80100";
> +       chassis-type =3D "laptop";
> +
> +       pmic-glink {
> +               compatible =3D "qcom,x1e80100-pmic-glink",
> +                            "qcom,sm8550-pmic-glink",
> +                            "qcom,pmic-glink";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               orientation-gpios =3D <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +                                   <&tlmm 123 GPIO_ACTIVE_HIGH>;
> +
> +               connector@0 {
> +                       compatible =3D "usb-c-connector";
> +                       reg =3D <0>;
> +                       power-role =3D "dual";
> +                       data-role =3D "dual";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +
> +                                       pmic_glink_ss0_hs_in: endpoint {
> +                                               remote-endpoint =3D <&usb=
_1_ss0_dwc3_hs>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +
> +                                       pmic_glink_ss0_ss_in: endpoint {
> +                                               remote-endpoint =3D <&usb=
_1_ss0_qmpphy_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               connector@1 {
> +                       compatible =3D "usb-c-connector";
> +                       reg =3D <1>;
> +                       power-role =3D "dual";
> +                       data-role =3D "dual";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +
> +                                       pmic_glink_ss1_hs_in: endpoint {
> +                                               remote-endpoint =3D <&usb=
_1_ss1_dwc3_hs>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +
> +                                       pmic_glink_ss1_ss_in: endpoint {
> +                                               remote-endpoint =3D <&usb=
_1_ss1_qmpphy_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +
> +       reserved-memory {
> +               linux,cma {
> +                       compatible =3D "shared-dma-pool";
> +                       size =3D <0x0 0x8000000>;
> +                       reusable;
> +                       linux,cma-default;
> +               };
> +       };
> +
> +       vph_pwr: vph-pwr-regulator {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "vph_pwr";
> +               regulator-min-microvolt =3D <3700000>;
> +               regulator-max-microvolt =3D <3700000>;
> +
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
> +
> +       vreg_edp_3p3: regulator-edp-3p3 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_EDP_3P3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +
> +               gpio =3D <&tlmm 70 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&edp_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
> +
> +       vreg_nvme: regulator-nvme {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_NVME_3P3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +
> +               gpio =3D <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&nvme_reg_en>;
> +       };
> +};
> +
> +&apps_rsc {
> +       regulators-0 {
> +               compatible =3D "qcom,pm8550-rpmh-regulators";
> +               qcom,pmic-id =3D "b";
> +
> +               vdd-bob1-supply =3D <&vph_pwr>;
> +               vdd-bob2-supply =3D <&vph_pwr>;
> +               vdd-l1-l4-l10-supply =3D <&vreg_s4c_1p8>;
> +               vdd-l2-l13-l14-supply =3D <&vreg_bob1>;
> +               vdd-l5-l16-supply =3D <&vreg_bob1>;
> +               vdd-l6-l7-supply =3D <&vreg_bob2>;
> +               vdd-l8-l9-supply =3D <&vreg_bob1>;
> +               vdd-l12-supply =3D <&vreg_s5j_1p2>;
> +               vdd-l15-supply =3D <&vreg_s4c_1p8>;
> +               vdd-l17-supply =3D <&vreg_bob2>;
> +
> +               vreg_bob1: bob1 {
> +                       regulator-name =3D "vreg_bob1";
> +                       regulator-min-microvolt =3D <3008000>;
> +                       regulator-max-microvolt =3D <3960000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_bob2: bob2 {
> +                       regulator-name =3D "vreg_bob2";
> +                       regulator-min-microvolt =3D <2504000>;
> +                       regulator-max-microvolt =3D <3008000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l2b_3p0: ldo2 {
> +                       regulator-name =3D "vreg_l2b_3p0";
> +                       regulator-min-microvolt =3D <3072000>;
> +                       regulator-max-microvolt =3D <3100000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l14b_3p0: ldo14 {
> +                       regulator-name =3D "vreg_l14b_3p0";
> +                       regulator-min-microvolt =3D <3072000>;
> +                       regulator-max-microvolt =3D <3072000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +
> +       regulators-1 {
> +               compatible =3D "qcom,pm8550ve-rpmh-regulators";
> +               qcom,pmic-id =3D "c";
> +
> +               vdd-l1-supply =3D <&vreg_s5j_1p2>;
> +               vdd-l2-supply =3D <&vreg_s1f_0p7>;
> +               vdd-l3-supply =3D <&vreg_s1f_0p7>;
> +               vdd-s4-supply =3D <&vph_pwr>;
> +
> +               vreg_s4c_1p8: smps4 {
> +                       regulator-name =3D "vreg_s4c_1p8";
> +                       regulator-min-microvolt =3D <1856000>;
> +                       regulator-max-microvolt =3D <2000000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +
> +       regulators-2 {
> +               compatible =3D "qcom,pmc8380-rpmh-regulators";
> +               qcom,pmic-id =3D "d";
> +
> +               vdd-l1-supply =3D <&vreg_s1f_0p7>;
> +               vdd-l2-supply =3D <&vreg_s1f_0p7>;
> +               vdd-l3-supply =3D <&vreg_s4c_1p8>;
> +               vdd-s1-supply =3D <&vph_pwr>;
> +
> +               vreg_l1d_0p8: ldo1 {
> +                       regulator-name =3D "vreg_l1d_0p8";
> +                       regulator-min-microvolt =3D <880000>;
> +                       regulator-max-microvolt =3D <920000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l2d_0p9: ldo2 {
> +                       regulator-name =3D "vreg_l2d_0p9";
> +                       regulator-min-microvolt =3D <912000>;
> +                       regulator-max-microvolt =3D <920000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l3d_1p8: ldo3 {
> +                       regulator-name =3D "vreg_l3d_1p8";
> +                       regulator-min-microvolt =3D <1800000>;
> +                       regulator-max-microvolt =3D <1800000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +
> +       regulators-3 {
> +               compatible =3D "qcom,pmc8380-rpmh-regulators";
> +               qcom,pmic-id =3D "e";
> +
> +               vdd-l2-supply =3D <&vreg_s1f_0p7>;
> +               vdd-l3-supply =3D <&vreg_s5j_1p2>;
> +
> +               vreg_l2e_0p8: ldo2 {
> +                       regulator-name =3D "vreg_l2e_0p8";
> +                       regulator-min-microvolt =3D <880000>;
> +                       regulator-max-microvolt =3D <920000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l3e_1p2: ldo3 {
> +                       regulator-name =3D "vreg_l3e_1p2";
> +                       regulator-min-microvolt =3D <1200000>;
> +                       regulator-max-microvolt =3D <1200000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +
> +       regulators-4 {
> +               compatible =3D "qcom,pmc8380-rpmh-regulators";
> +               qcom,pmic-id =3D "f";
> +
> +               vdd-l1-supply =3D <&vreg_s5j_1p2>;
> +               vdd-l2-supply =3D <&vreg_s5j_1p2>;
> +               vdd-l3-supply =3D <&vreg_s5j_1p2>;
> +               vdd-s1-supply =3D <&vph_pwr>;
> +
> +               vreg_s1f_0p7: smps1 {
> +                       regulator-name =3D "vreg_s1f_0p7";
> +                       regulator-min-microvolt =3D <700000>;
> +                       regulator-max-microvolt =3D <1100000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +
> +       regulators-6 {
> +               compatible =3D "qcom,pm8550ve-rpmh-regulators";
> +               qcom,pmic-id =3D "i";
> +
> +               vdd-l1-supply =3D <&vreg_s4c_1p8>;
> +               vdd-l2-supply =3D <&vreg_s5j_1p2>;
> +               vdd-l3-supply =3D <&vreg_s1f_0p7>;
> +               vdd-s1-supply =3D <&vph_pwr>;
> +               vdd-s2-supply =3D <&vph_pwr>;
> +       };
> +
> +       regulators-7 {
> +               compatible =3D "qcom,pm8550ve-rpmh-regulators";
> +               qcom,pmic-id =3D "j";
> +
> +               vdd-l1-supply =3D <&vreg_s1f_0p7>;
> +               vdd-l2-supply =3D <&vreg_s5j_1p2>;
> +               vdd-l3-supply =3D <&vreg_s1f_0p7>;
> +               vdd-s5-supply =3D <&vph_pwr>;
> +
> +               vreg_s5j_1p2: smps5 {
> +                       regulator-name =3D "vreg_s5j_1p2";
> +                       regulator-min-microvolt =3D <1256000>;
> +                       regulator-max-microvolt =3D <1304000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l1j_0p8: ldo1 {
> +                       regulator-name =3D "vreg_l1j_0p8";
> +                       regulator-min-microvolt =3D <880000>;
> +                       regulator-max-microvolt =3D <920000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l2j_1p2: ldo2 {
> +                       regulator-name =3D "vreg_l2j_1p2";
> +                       regulator-min-microvolt =3D <1200000>;
> +                       regulator-max-microvolt =3D <1200000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l3j_0p8: ldo3 {
> +                       regulator-name =3D "vreg_l3j_0p8";
> +                       regulator-min-microvolt =3D <880000>;
> +                       regulator-max-microvolt =3D <920000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +};
> +
> +&i2c0 {
> +       clock-frequency =3D <400000>;
> +       status =3D "okay";
> +
> +       touchpad@15 {
> +               compatible =3D "hid-over-i2c";
> +               reg =3D <0x15>;
> +
> +               hid-descr-addr =3D <0x1>;
> +               interrupts-extended =3D <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +               pinctrl-0 =3D <&tpad_default>;
> +               pinctrl-names =3D "default";
> +
> +               wakeup-source;
> +       };
> +};
> +
> +&i2c1 {
> +       clock-frequency =3D <400000>;
> +       status =3D "okay";
> +
> +    /* PS8830 USB4 Retimer? @ 0x8 */
> +};
> +
> +&i2c3 {
> +       clock-frequency =3D <400000>;
> +       status =3D "okay";
> +
> +    /* PS8830 USB4 Retimer? @ 0x8 */
> +};
> +
> +&i2c5 {
> +       clock-frequency =3D <400000>;
> +       status =3D "okay";
> +
> +       keyboard@3a {
> +               compatible =3D "hid-over-i2c";
> +               reg =3D <0x3a>;
> +
> +               hid-descr-addr =3D <0x1>;
> +               interrupts-extended =3D <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> +
> +               pinctrl-0 =3D <&kybd_default>;
> +               pinctrl-names =3D "default";
> +
> +               wakeup-source;
> +       };
> +
> +    /* EC? @ 0x5b, 0x76 */
> +};
> +
> +&i2c7 {
> +       clock-frequency =3D <400000>;
> +       status =3D "okay";
> +
> +    /* PS8830 USB4 Retimer? @ 0x8 */
> +};
> +
> +&mdss {
> +       status =3D "okay";
> +};
> +
> +&mdss_dp3 {
> +       compatible =3D "qcom,x1e80100-dp";
> +       /delete-property/ #sound-dai-cells;
> +
> +       status =3D "okay";
> +
> +       aux-bus {
> +               panel {
> +                       compatible =3D "edp-panel";
> +                       power-supply =3D <&vreg_edp_3p3>;
> +
> +                       port {
> +                               edp_panel_in: endpoint {
> +                                       remote-endpoint =3D <&mdss_dp3_ou=
t>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       ports {
> +               port@1 {
> +                       reg =3D <1>;
> +                       mdss_dp3_out: endpoint {
> +                               data-lanes =3D <0 1 2 3>;
> +                               link-frequencies =3D /bits/ 64 <162000000=
0 2700000000 5400000000 8100000000>;
> +
> +                               remote-endpoint =3D <&edp_panel_in>;
> +                       };
> +               };
> +       };
> +};
> +
> +&mdss_dp3_phy {
> +       vdda-phy-supply =3D <&vreg_l3j_0p8>;
> +       vdda-pll-supply =3D <&vreg_l2j_1p2>;
> +
> +       status =3D "okay";
> +};
> +
> +&pcie4 {
> +       status =3D "okay";
> +};
> +
> +&pcie4_phy {
> +       vdda-phy-supply =3D <&vreg_l3j_0p8>;
> +       vdda-pll-supply =3D <&vreg_l3e_1p2>;
> +
> +       status =3D "okay";
> +};
> +
> +&pcie6a {
> +       perst-gpios =3D <&tlmm 152 GPIO_ACTIVE_LOW>;
> +       wake-gpios =3D <&tlmm 154 GPIO_ACTIVE_LOW>;
> +
> +       vddpe-3v3-supply =3D <&vreg_nvme>;
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pcie6a_default>;
> +
> +       status =3D "okay";
> +};
> +
> +&pcie6a_phy {
> +       vdda-phy-supply =3D <&vreg_l1d_0p8>;
> +       vdda-pll-supply =3D <&vreg_l2j_1p2>;
> +
> +       status =3D "okay";
> +};
> +
> +&qupv3_0 {
> +       status =3D "okay";
> +};
> +
> +&qupv3_1 {
> +       status =3D "okay";
> +};
> +
> +&qupv3_2 {
> +       status =3D "okay";
> +};
> +
> +&remoteproc_adsp {
> +       firmware-name =3D "qcom/x1e80100/ASUSTeK/vivobook-s15/qcadsp8380.=
mbn",
> +                       "qcom/x1e80100/ASUSTeK/vivobook-s15/adsp_dtbs.elf=
";
> +
> +       status =3D "okay";
> +};
> +
> +&remoteproc_cdsp {
> +       firmware-name =3D "qcom/x1e80100/ASUSTeK/vivobook-s15/qccdsp8380.=
mbn",
> +                       "qcom/x1e80100/ASUSTeK/vivobook-s15/cdsp_dtbs.elf=
";
> +
> +       status =3D "okay";
> +};
> +
> +&smb2360_0_eusb2_repeater {
> +       vdd18-supply =3D <&vreg_l3d_1p8>;
> +       vdd3-supply =3D <&vreg_l2b_3p0>;
> +};
> +
> +&smb2360_1_eusb2_repeater {
> +       vdd18-supply =3D <&vreg_l3d_1p8>;
> +       vdd3-supply =3D <&vreg_l14b_3p0>;
> +};
> +
> +&smb2360_2 {
> +       status =3D "disabled";
> +};
> +
> +&tlmm {
> +       gpio-reserved-ranges =3D <34 2>, /* Unused */
> +                              <44 4>, /* SPI (TPM) */
> +                              <238 1>; /* UFS Reset */
> +
> +       edp_reg_en: edp-reg-en-state {
> +               pins =3D "gpio70";
> +               function =3D "gpio";
> +               drive-strength =3D <16>;
> +               bias-disable;
> +       };
> +
> +       kybd_default: kybd-default-state {
> +               pins =3D "gpio67";
> +               function =3D "gpio";
> +               bias-disable;
> +       };
> +
> +       nvme_reg_en: nvme-reg-en-state {
> +               pins =3D "gpio18";
> +               function =3D "gpio";
> +               drive-strength =3D <2>;
> +               bias-disable;
> +       };
> +
> +       pcie6a_default: pcie2a-default-state {
> +               clkreq-n-pins {
> +                       pins =3D "gpio153";
> +                       function =3D "pcie6a_clk";
> +                       drive-strength =3D <2>;
> +                       bias-pull-up;
> +               };
> +
> +               perst-n-pins {
> +                       pins =3D "gpio152";
> +                       function =3D "gpio";
> +                       drive-strength =3D <2>;
> +                       bias-pull-down;
> +               };
> +
> +               wake-n-pins {
> +                   pins =3D "gpio154";
> +                   function =3D "gpio";
> +                   drive-strength =3D <2>;
> +                   bias-pull-up;
> +           };
> +       };
> +
> +       tpad_default: tpad-default-state {
> +               pins =3D "gpio3";
> +               function =3D "gpio";
> +               bias-disable;
> +       };
> +};
> +
> +&usb_1_ss0_hsphy {
> +       vdd-supply =3D <&vreg_l2e_0p8>;
> +       vdda12-supply =3D <&vreg_l2j_1p2>;
> +
> +       phys =3D <&smb2360_0_eusb2_repeater>;
> +
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss0_qmpphy {
> +       vdda-phy-supply =3D <&vreg_l3e_1p2>;
> +       vdda-pll-supply =3D <&vreg_l1j_0p8>;
> +
> +       orientation-switch;
> +
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss0 {
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss0_dwc3 {
> +       dr_mode =3D "host";
> +};
> +
> +&usb_1_ss0_dwc3_hs {
> +       remote-endpoint =3D <&pmic_glink_ss0_hs_in>;
> +};
> +
> +&usb_1_ss0_qmpphy_out {
> +       remote-endpoint =3D <&pmic_glink_ss0_ss_in>;
> +};
> +
> +&usb_1_ss1_hsphy {
> +       vdd-supply =3D <&vreg_l2e_0p8>;
> +       vdda12-supply =3D <&vreg_l2j_1p2>;
> +
> +       phys =3D <&smb2360_1_eusb2_repeater>;
> +
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss1_qmpphy {
> +       vdda-phy-supply =3D <&vreg_l3e_1p2>;
> +       vdda-pll-supply =3D <&vreg_l2d_0p9>;
> +
> +       orientation-switch;
> +
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss1 {
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss1_dwc3 {
> +       dr_mode =3D "host";
> +};
> +
> +&usb_1_ss1_dwc3_hs {
> +       remote-endpoint =3D <&pmic_glink_ss1_hs_in>;
> +};
> +
> +&usb_1_ss1_qmpphy_out {
> +       remote-endpoint =3D <&pmic_glink_ss1_ss_in>;
> +};
>
> --
> 2.45.2
>
>

