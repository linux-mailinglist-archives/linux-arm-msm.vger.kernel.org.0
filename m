Return-Path: <linux-arm-msm+bounces-69767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F32DB2C5DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 15:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4370681713
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 13:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867CA33EAE1;
	Tue, 19 Aug 2025 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhPDByNm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B60033CE88;
	Tue, 19 Aug 2025 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755610534; cv=none; b=kWxeS4gzQmQeWxgqa4KBz7z3X9ctmQvihERs2Fxu9ir/xr4atDSFobLIbq1pyipPQcfAN8/XihBb7JZpxCANPCv2sQkL9m6negtVne4IOm5Z5mfURnQ7wasgw8ndXTp7jJYyfmGD2wAlXcK27E7mVlHEU3oCDmqfneFrSCvMD1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755610534; c=relaxed/simple;
	bh=R9Sy8VQpNOrJ8/sl1lL2re/tMQ75cIWyis0ycpDudBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/yqyV7GfdOKsPTE/ZjownQRPYHJzJTDVMeaL+R+O/G9uqA0BuKuu3nJ5F5BjP8YDVaNLuUYDhe3l0K3i85OINh+K1kfhQggdJXpNSgioG1jGCrUSGAyIG3tx6j5Jp1O7WagXEoNuMeOU7WLFx40fueJTcXgQyWAVDpgAM8bWpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhPDByNm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE93C116B1;
	Tue, 19 Aug 2025 13:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755610533;
	bh=R9Sy8VQpNOrJ8/sl1lL2re/tMQ75cIWyis0ycpDudBY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DhPDByNmUaahaYOad5JwcHU8LV9bkjrUAKT+ZpSbsJaT+bqrd5FpB1d3jATBRnXyo
	 2IOTmdXHj+ZR+KKJrwGUBclOfPdhdrhX1kyHmsSom3W/2g3vG1hk2G2DQFpRdcd9z8
	 X4e7qvYm2zPIqzuulrpny+TEkXNXzB6EI0X0j11UtgRrB6bKgpi52eQ9nzTpQTwe65
	 JTQ1o8fo7Mv+p443UYTy5Vc3YMiWCu3k+TiwGPhv9ftfAwTGrk46jTHljjo4M9j9Ye
	 CUYETsku00O4m91oMpTNaCUeGTknhuZ7m3QGIsPprFo4jDIzni2J3pwuEKLxc+6q7U
	 ++7TAWQ+8ydRw==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7a3ee3cso817685066b.2;
        Tue, 19 Aug 2025 06:35:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6UYM0+6Iy0aOFP9/oNIk3zpUwJbdd4EfL+ym242C7L9ZZqL0D4FEkt7aPHkucy13PeJAB6jiDTpPPtZz4@vger.kernel.org, AJvYcCUtwCGp0cCWo6L8RVr5Re/xNboM+1gLSI5aBlDNg7vVg8lwBpluGZMjqa93g25qf/dGPWpqtiQA2UP9U1j0cA==@vger.kernel.org, AJvYcCV2x4WYg1Qdc3sP5v02H3u+hXpWy3GuWzAcbS+2/MMT+qApSf8eAIPe0evqKXlnS+GwUGQA760vmZsq@vger.kernel.org, AJvYcCXk4x18D/UwqcqAfKU2H7ucVk4QS5x9mpX3ZrL3xIv2zPqPgrmplkm5warL6z1o3z+NQk+8GFYVS+Ibivs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4MNa2QXLST5gde706xsNsNheAe0qT29LR/Z2V/lpitd7uWEPB
	/zBbOB03xcxIswRwxpxOAuouS+Z8XPhGqrg+mnRzrGdCum8Cbxe5ZYBmsJPavuAx97BC1u9Vx8Y
	r3MkKY0exlNXEjtt9K0moUDpt0DhnhA==
X-Google-Smtp-Source: AGHT+IH2MkYx7kpJ+xN9k3+oODecUEIgiLoLvMLtyUB1pi/Kr5EqVSB7WGUHwSSty8Ksq7ALpKgNCHIiH3bxADNv84A=
X-Received: by 2002:a17:907:d8e:b0:afd:bd24:4de1 with SMTP id
 a640c23a62f3a-afddd0cf7efmr261603866b.33.1755610532515; Tue, 19 Aug 2025
 06:35:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 19 Aug 2025 08:35:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKG+dcMgp1QF4F3Oxh5Shvagg6cSde=g1JMcEAquZhH_Q@mail.gmail.com>
X-Gm-Features: Ac12FXwlOsoI_6EYLq8GGEsTwxxs1hQzLvyShUqH2EB_7YD-9IGjwYC8P64fEO4
Message-ID: <CAL_JsqKG+dcMgp1QF4F3Oxh5Shvagg6cSde=g1JMcEAquZhH_Q@mail.gmail.com>
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
To: srinivas.kandagatla@oss.qualcomm.com
Cc: srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 8:28=E2=80=AFAM <srinivas.kandagatla@oss.qualcomm.c=
om> wrote:
>
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>
> Qcom Slimbus controller driver is totally unused and dead code, there is
> no point in keeping this driver in the kernel without users.
>
> This patch removes the driver along with device tree bindings.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/slimbus/qcom,slim.yaml           |  86 --
>  drivers/slimbus/Kconfig                       |   7 -
>  drivers/slimbus/Makefile                      |   3 -
>  drivers/slimbus/qcom-ctrl.c                   | 735 ------------------
>  4 files changed, 831 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/slimbus/qcom,slim.y=
aml
>  delete mode 100644 drivers/slimbus/qcom-ctrl.c

This adds warnings to dt_binding_check:

Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
/example-0/soc/slim@28080000: failed to match any schema with
compatible: ['qcom,apq8064-slim', 'qcom,slim']
Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
/example-0/soc/slim@28080000: failed to match any schema with
compatible: ['qcom,apq8064-slim', 'qcom,slim']

