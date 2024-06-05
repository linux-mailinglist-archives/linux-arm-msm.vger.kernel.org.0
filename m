Return-Path: <linux-arm-msm+bounces-21775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D69048FD072
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 16:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD0CE1C20991
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 14:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA36714A90;
	Wed,  5 Jun 2024 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UQSDNqLe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1C125BA
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717596528; cv=none; b=SFlgBVmfMtpZXrJcw3ub0uDPzGKwDSIA5w2qG8soc42QYkIdEBAUdwigv8yLR7f6t5NlgSvaDO3bU2aqrFohKHKjsusTKGdK1v5pGq+fqAcApn4Hs9qymT3anH/kMX48b6bDvwSS7nO2eYWRu/9D3sb+7i+vzetwGY86Pl1HzlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717596528; c=relaxed/simple;
	bh=LiyeTVR61UKKdfGZzWXSIUzQsWrUlb7cMftBdtGQCdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AN+PWOmNoFpX+QqbUXvdiD+iRcaQLyvviQjLQM/X3yjS2VPEUqQTok9TMxcFEZgNcpcPKbvNw47n1cXn47vun7/rqeH1+w1A4uaa6isoH3dgH0u2EsZXvVKHjN8z3sY3jj4ualwKNkA++ZK0k88yrlZsLt2Lj09EhHWn9Y8mAE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UQSDNqLe; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52b93370ad0so6270169e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717596525; x=1718201325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHSispro9byIbJJ27egkXQIvYlTCe/tBCT6tEz+/1ZA=;
        b=UQSDNqLezPtezV0T7GLrpADklMNkI2daMF9cUJOZ7Dr163QK7Yyx6yKmNRPxgvM18/
         MZjxtcIQIfTo8uOKrYF9cr7NdNMtALFIqSnd0sFoOdf5bRNvU8yz2gh/QJr93m1TI7ql
         YQEOyVyaPObc7KI1f/KDp2jhmZy6ejgpWKJcU/rNTJe1TxfF3+uZ4XLG+4Dpfgg2BpmT
         c+Go6TR7N8o+e+pSSb3+Wq5HB+Llxd1++j5J3xLpNwfPjFOCAb1Sbvv0Cu4KZy2QfeqX
         2l2G7x4sSXAon6haMrWWRwNtcMi5Pv40DOFKFKgfg37maxSO+2l9ib5VyXlWS7J79H2t
         X5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717596525; x=1718201325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHSispro9byIbJJ27egkXQIvYlTCe/tBCT6tEz+/1ZA=;
        b=sGVwvZLxvzcWIguriK0evA+LbfVfpIYvpZQ9X5IWp9ohgxE5Y+STdfPOQ7S3dUbbfC
         StdW6nbi+qzMbOXctgX+nBWqQtP54zxQOl25LN6+zrO1EFhr/WqsOslxrWGHmW9geBL5
         NH228ZrgUrT5Gm1fAMDVidK8T3AH8rGFH5s00G1r+DikxD0vStUQJScKFsFBTaIrmlgz
         R56BhGkVJ7lmIn3vTkWywmVcU7ZaJlwz/g/1WsFXyu1+yhG2c634U0V2OkH/O/NVxuGh
         g+WDcENJyLWGh3+5oVq4r4pvAUF0gUL3Teike3MQjgjWTjXMv9GrjSWKZnxwDDEl2zcP
         KKtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV7g0GkZOrGUN1pAEfF8tXuhpv0gvt0pZ7besd3f+dl0mZHEp2vK/FQZo9Fv4IK5gMwSWrM9Xc4UjlpM6DA9g5BKvXSrUTnwcj73fUyA==
X-Gm-Message-State: AOJu0YwIppgfQijaGlxFrZkuw5gHQixBmEwi83WumvQGcm7dAdci4BLo
	EfaE2o1x46zfrqKhB6jrCKSzDPxidOjgtntoi6TrYo+jAwxdFzkaP2oBHTnLMEdNCpq+MUS6x+U
	fG5e3uFL4XQKwXlnPnWfb4EPmMhXs9LabETnBHw==
X-Google-Smtp-Source: AGHT+IHVO+lSKQJ56xItpne0KixFpMYolI8f49B5HwH8eWN98yjpZ4Zaz6HR99APTQLC2bwhfkxQQ0OkpCA0PkyvYmw=
X-Received: by 2002:a05:6512:31ca:b0:518:9ce1:a5bb with SMTP id
 2adb3069b0e04-52bab4fcbfbmr2613769e87.54.1717596524882; Wed, 05 Jun 2024
 07:08:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605122729.24283-1-brgl@bgdev.pl> <171759285132.2201422.6812393889473417095.robh@kernel.org>
In-Reply-To: <171759285132.2201422.6812393889473417095.robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 5 Jun 2024 16:08:33 +0200
Message-ID: <CAMRc=Me34aD=tfoh7YG9Zz1DM0h3DGZFcMonVF0+RDUCUTaNRQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] arm64: dts: qcom: add WiFi modules for several platforms
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 3:12=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Wed, 05 Jun 2024 14:27:25 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Hi!
> >
> > Here are the DTS changes for several Qualcomm boards from the
> > power-sequencing series. To keep the cover-letter short, I won't repeat
> > all the details, they can be found in the cover-letter for v8. Please
> > consider picking them up into the Qualcomm tree. They have all been
> > thorougly tested with the pwrseq series.
> >
> > Changelog:
> >
> > Since v8:
> > - split the DTS patches out into their own series
> > - Link to v8: https://lore.kernel.org/r/20240528-pwrseq-v8-0-d354d52b76=
3c@linaro.org
> >
> > Since v7:
> > - added DTS changes for sm8650-hdk
> > - added circular dependency detection for pwrseq units
> > - fixed a KASAN reported use-after-free error in remove path
> > - improve Kconfig descriptions
> > - fix typos in bindings and Kconfig
> > - fixed issues reported by smatch
> > - fix the unbind path in PCI pwrctl
> > - lots of minor improvements to the pwrseq core
> >
> > Since v6:
> > - kernel doc fixes
> > - drop myself from the DT bindings maintainers list for ath12k
> > - wait until the PCI bridge device is fully added before creating the
> >   PCI pwrctl platform devices for its sub-nodes, otherwise we may see
> >   sysfs and procfs attribute failures (due to duplication, we're
> >   basically trying to probe the same device twice at the same time)
> > - I kept the regulators for QCA6390's ath11k as required as they only
> >   apply to this specific Qualcomm package
> >
> > Since v5:
> > - unify the approach to modelling the WCN WLAN/BT chips by always expos=
ing
> >   the PMU node on the device tree and making the WLAN and BT nodes beco=
me
> >   consumers of its power outputs; this includes a major rework of the D=
T
> >   sources, bindings and driver code; there's no more a separate PCI
> >   pwrctl driver for WCN7850, instead its power-up sequence was moved
> >   into the pwrseq driver common for all WCN chips
> > - don't set load_uA from new regulator consumers
> > - fix reported kerneldoc issues
> > - drop voltage ranges for PMU outputs from DT
> > - many minor tweaks and reworks
> >
> > v1: Original RFC:
> >
> > https://lore.kernel.org/lkml/20240104130123.37115-1-brgl@bgdev.pl/T/
> >
> > v2: First real patch series (should have been PATCH v2) adding what I
> >     referred to back then as PCI power sequencing:
> >
> > https://lore.kernel.org/linux-arm-kernel/2024021413-grumbling-unlivable=
-c145@gregkh/T/
> >
> > v3: RFC for the DT representation of the PMU supplying the WLAN and BT
> >     modules inside the QCA6391 package (was largely separate from the
> >     series but probably should have been called PATCH or RFC v3):
> >
> > https://lore.kernel.org/all/CAMRc=3DMc+GNoi57eTQg71DXkQKjdaoAmCpB=3Dh2n=
dEpGnmdhVV-Q@mail.gmail.com/T/
> >
> > v4: Second attempt at the full series with changed scope (introduction =
of
> >     the pwrseq subsystem, should have been RFC v4)
> >
> > https://lore.kernel.org/lkml/20240201155532.49707-1-brgl@bgdev.pl/T/
> >
> > v5: Two different ways of handling QCA6390 and WCN7850:
> >
> > https://lore.kernel.org/lkml/20240216203215.40870-1-brgl@bgdev.pl/
> >
> > Bartosz Golaszewski (3):
> >   arm64: dts: qcom: sm8550-qrd: add the Wifi node
> >   arm64: dts: qcom: sm8650-qrd: add the Wifi node
> >   arm64: dts: qcom: qrb5165-rb5: add the Wifi node
> >
> > Neil Armstrong (1):
> >   arm64: dts: qcom: sm8650-hdk: add the Wifi node
> >
> >  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 103 ++++++++++++++++++++---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi     |   2 +-
> >  arch/arm64/boot/dts/qcom/sm8550-qrd.dts  |  97 +++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/sm8550.dtsi     |   2 +-
> >  arch/arm64/boot/dts/qcom/sm8650-hdk.dts  |  89 ++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/sm8650-qrd.dts  |  89 ++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/sm8650.dtsi     |   2 +-
> >  7 files changed, 370 insertions(+), 14 deletions(-)
> >
> > --
> > 2.40.1
> >
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> New warnings running 'make CHECK_DTBS=3Dy qcom/qrb5165-rb5.dtb qcom/sm855=
0-qrd.dtb qcom/sm8650-hdk.dtb qcom/sm8650-qrd.dtb' for 20240605122729.24283=
-1-brgl@bgdev.pl:
>
> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: bluetooth: 'vddbtcmx-supply' do=
es not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/net/bluetooth/qual=
comm-bluetooth.yaml#
> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: /wcn7850-pmu: failed to match an=
y schema with compatible: ['qcom,wcn7850-pmu']
> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: /wcn7850-pmu: failed to match an=
y schema with compatible: ['qcom,wcn7850-pmu']
> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: /wcn7850-pmu: failed to match an=
y schema with compatible: ['qcom,wcn7850-pmu']
> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: /qca6390-pmu: failed to match a=
ny schema with compatible: ['qcom,qca6390-pmu']
>
>
>
>
>

Bindings for this were sent separately to for the regulator tree.

Bartosz

