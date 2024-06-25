Return-Path: <linux-arm-msm+bounces-24122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CEC916CE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 17:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 218DE1C21599
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 15:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAEA176AD9;
	Tue, 25 Jun 2024 15:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QQ2kr0y2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C25016F91E
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 15:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719328738; cv=none; b=on5p46fxiVIfZRurFg1Qo8aenOQqj+Kx//PK2Uq7aQW9YwoDqr5iz+aZWjG820qDSdTTsA6ZNbeJvzPTsvLOUuWEfGNcr06DsVGwJ65HsDSH/I5JxFLC+cPbkVPOVJ01wCB2g/6Gs7eEGWfnVpKIW/3RGMIxFJzcq8/J3sR/hFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719328738; c=relaxed/simple;
	bh=mZj8HmgKq4m3YHtNZd94nsGMAQh/YBBmlu+PxcHslvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aru+6IKfhRbhpYtdCRL5NjGvZ5BHVX645mBevuTTah70Pz9ajYBBzyp9TuBqeaamVKknDxb8uHfKwOV4r8LQ1PPEeWjd0FuRlXhwJKiphoRCtE7BcbhZ0WBMC6fOE87cjcqtIvkvjUVeWbWOC1F25wj2Bi5Ev48IBqpqWxyL0qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QQ2kr0y2; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so61781191fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 08:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719328734; x=1719933534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sx2HYLsaSgIFg2Oa96eeaBmlhRTVUGHBB/hKxCjYNQo=;
        b=QQ2kr0y2cbrgNAeQ2Bj/fNDMO7tt1JPbzbHFf++6QslpTNXii1Gqk0u34mA1/MywBw
         h9Jq3RO4zf0d1T0u6iXii0FTX5CzQaHIzsz1caANAgYdy3t0O+tT25dTd8FDpWODO9ZQ
         OCa5Y2GVEDkUqomfxASVuejXoW/ogjRJ6Qe8tglsqndXlEl9pegnUsWAQZ9y1DwDCMqp
         8d3mVu1tqM4gRitf3PeksMylAq7OaEAp4jEm3g2SkIkMrU0fXxR+LUmgODqRLWpimeWG
         UXnyPkeYRl5cLS0tScGtKDJHki58965yM0+8BryRTi/qn5y0ciaJWTbykfqgjADVU6Wo
         VzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719328734; x=1719933534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sx2HYLsaSgIFg2Oa96eeaBmlhRTVUGHBB/hKxCjYNQo=;
        b=HNxIo7dLGqx2gvuum3kh1ZIXu5wyxt01LMexJEYc17qniU0N4r5ZK1JJcobJg8Ir3X
         SNy83IyHEmxB1DquO/u6vnRmmrkzifo/QJtVT/Zc1B31x27WGzMtFmHwv45RCjCzFq8y
         7KyZW9FekaSOhw28Kj3F0moH6YsFWs1TEF+pyyl+prz/GuFoYUwWEVvGLZueh+ZPuHmJ
         KuM+YCEsoGKlH8kH/LaRKbiZ9qafBRoGp5ztXycBIgk+qDCd0d3OKTjXotYO+RMn/O/E
         bF/g+abDZ4vaKZUoGm4i2a+foafPE9VH8R2sS7BVJanCh5Jxo3kcDEbw9+VskayHX/jj
         EqvQ==
X-Gm-Message-State: AOJu0Ywc/D1RGbL3kiv94Sa40Co85bWAU4cVgJR/C7iJFqOtRS3s8/6b
	4R6CdPBHFYMqjv7hldsEJdMQjJOeJBtkDkNBSpwWsZXXynYq7421Cep/kxdBGA+fEG7uqQ5W4oD
	rke7JbBs3FxZyQ7YZV64mla/Tdtss5I0k+Aq5xg==
X-Google-Smtp-Source: AGHT+IGlP6Tm/b40/iLFEbi5fEIe/lDxGDCO4P+RlrzHbY56PKFGIr90owQjEXNXIRqgsr7Lwxg736Z4cGfOwruVrLo=
X-Received: by 2002:a2e:998b:0:b0:2ec:59d8:a7e9 with SMTP id
 38308e7fff4ca-2ec5b3e35b1mr45408841fa.52.1719328734531; Tue, 25 Jun 2024
 08:18:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625151430.34024-1-brgl@bgdev.pl>
In-Reply-To: <20240625151430.34024-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Jun 2024 17:18:43 +0200
Message-ID: <CAMRc=Mcm94=Fd6LiRpBLD3bWco6KhZ4+T0YPwAmrtNUosM6VEA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: sa8775p-ride: support both board variants
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 5:14=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Split the current .dts into two: the existing one keeps the name and
> supports revision 2 of the board while patch 2 adds a .dts for revision 3=
.
>
> Changes since v1:
> - add a new compatible for Rev3
>
> Bartosz Golaszewski (3):
>   dt-bindings: arm: qcom: add sa8775p-ride Rev 3
>   arm64: dts: qcom: move common parts for sa8775p-ride variants into a
>     .dtsi
>   arm64: dts: qcom: sa8775p-ride-r3: add new board file
>
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts  |  47 +
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts     | 836 +-----------------
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    | 814 +++++++++++++++++
>  5 files changed, 885 insertions(+), 814 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>
> --
> 2.43.0
>

Eeek -ETOOEARLY, please disregard this one, it requires one more
change. Sorry for the noise.

Bartosz

