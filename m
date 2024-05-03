Return-Path: <linux-arm-msm+bounces-19165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BE38BA828
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 09:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E36B1C2186A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 07:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85CC14883A;
	Fri,  3 May 2024 07:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NXY54Cev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1B8147C7B
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 May 2024 07:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714722967; cv=none; b=F0vrAk5/IP4rioQE0BJFmQWELdQ4ehgxBPRtXPmj9cmvEcfcuiKw5ujdMiG8kBF7rbkTVeEF7kKDH/erNny03gFwMrHLXH/xH85d3CbbVhkDhZiw5LgGKwpF8QEGXKkLEwkgYzAhpsga5iE1zpMFEkWbxmZHrt32YGK+9TR5oHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714722967; c=relaxed/simple;
	bh=Ep6dJa+eib2MWb1RczSFiTE8NWenqFi4Oi13uS/LRhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AugquUNMCrcNo7HV8UKKCe2+T7ackoj3XGDdhU+tkp3WcXjj/ds4EOvhxIYFVT8K9HUJvOc2XV8l4zCPhLg6EtiAp7So7DVMNQRzZu7Y353+eooeNi/7jDyfrQ/M8weHkq6ri8yahdikWDOVyWUPES0GF8q/PTzsUQ3AUIHgv+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NXY54Cev; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de462f3d992so9364956276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 00:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714722962; x=1715327762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep6dJa+eib2MWb1RczSFiTE8NWenqFi4Oi13uS/LRhM=;
        b=NXY54CevZEj1Kd4wbRD1Y84a+F9+fIkUy8W7fVvqsV2/1GNre502MmCofiNEC97SIa
         eSHLFUxxHd2uSX/Kw5VvpSwryNxN+3fLYyxbkUYnFT0NI0GN+lxUIxxbpjhIc+nV9GZr
         0rDuj+QySuwfKYJapEbj4VdUssa7c8Bw6Np/+PYsiZ0eAdI0daHvf/X4iNlfJUCnLL0+
         I9S/lz7ioakl7IikhdXP8nobXexORI1qQF0cRYwwiEQnqzgbXIKu5mp+6qzbi+xRVN95
         NA5m21JRmVix0IQCdL5spOngDrn1a5EZ8Swvqfq+PEFzO5d7Ve0rI3zRTG/SktOscF8F
         NdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714722962; x=1715327762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ep6dJa+eib2MWb1RczSFiTE8NWenqFi4Oi13uS/LRhM=;
        b=jQhIHmgFsm08+CjdrSQBtoHk3+quzez8jWkWafQThiwc/lzKEWtYssch+VUrRMrCvf
         /6VlOOssZYzgsn5bqcn16xozMiHGvPq/MxOHIKj93qJuA8eq2DrEyDHFjYoGAr6ISTPl
         lPsdzcChIhP6U4GAFDDEPWDfmn44gyle5t3viou4yiFTfb/+TLg6NOy4CLv7iW7SAAik
         LtId2E2+JkeVFxuwUT4YWC7ZmyqxQ8+4R3qdor6kKLyx9iqUnz/MZN70lTn+xGDpc/dw
         t6i2HgS9kHXgKZBSrC33wWHq0tSy1EItcdV9mgSFWXhWh86A3wwvFIzXJC7v/waLY5ui
         VzgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlYX3pwEXFfjHLefrwhoUrlHk0qua5gBnPXy7xlwK/GkOI3WkVG5xRjjIKd/GEYVNPavwiIWl+97gcsd3f/+iam7Z2JOgmNNiqx+sRjQ==
X-Gm-Message-State: AOJu0Ywm890hR80fols1DRPFAIPHpmR+pvuKZ2XkQXhgx784VKbgNsMb
	CSN+9vyPuBiVG0SMVBn+T7YaZ8nf8h+xXl8hOL//I7pyMSxn+XJsVz3yZUj6aSs64V/cOqcuPw9
	lFlPWtTjLi30S2mQq4wHmTzmNflwHN4/nkxcoNw==
X-Google-Smtp-Source: AGHT+IG1waPpChDlKKPqRxrWTMe8tmRvUuz2kdqvOGF8Pbo1P3mQm0IcaVlqwK7WlzOI6U+gWkBKd9aAmVhn85+3mKY=
X-Received: by 2002:a25:ab6e:0:b0:de6:1c1f:b780 with SMTP id
 u101-20020a25ab6e000000b00de61c1fb780mr2221108ybi.44.1714722962639; Fri, 03
 May 2024 00:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423203245.188480-1-danila@jiaxyga.com>
In-Reply-To: <20240423203245.188480-1-danila@jiaxyga.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 09:55:51 +0200
Message-ID: <CACRpkdb0mLzZMyMejMYTFvcsPjX8sADbkrekU7AFXbKc-MJttA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-sm7150: Fix sdc1 and ufs special
 pins regs
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 10:33=E2=80=AFPM Danila Tikhonov <danila@jiaxyga.co=
m> wrote:

> SDC1 and UFS_RESET special pins are located in the west memory bank.
>
> SDC1 have address 0x359a000:
> 0x3500000 (TLMM BASE) + 0x0 (WEST) + 0x9a000 (SDC1_OFFSET) =3D 0x359a000
>
> UFS_RESET have address 0x359f000:
> 0x3500000 (TLMM BASE) + 0x0 (WEST) + 0x9f000 (UFS_OFFSET) =3D 0x359a000
>
> Fixes: b915395c9e04 ("pinctrl: qcom: Add SM7150 pinctrl driver")
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Patch applied as nonurgent as I assume there are no current
users that can be regressed.

Yours,
Linus Walleij

