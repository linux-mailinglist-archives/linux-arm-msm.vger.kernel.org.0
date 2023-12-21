Return-Path: <linux-arm-msm+bounces-5685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CC981AB8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 01:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5E5E1C23B67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 00:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94ADE441C;
	Thu, 21 Dec 2023 00:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mbHutCbJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CEC441E
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 00:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a2343c31c4bso23924266b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 16:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703117475; x=1703722275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAV5X+k1qQI1nOHUSW7EkdUMeMAYS/98mQ/cpqxd4GY=;
        b=mbHutCbJBQk9C31fjx8f1kawwpza1qWNyJotzgM4rfndNm6As9Wn066HJnNoGI+vor
         CGs37gl69StoEnf5K1oMErg+XGY/KPyxSIh1jsuhNDkxXFO9g2PvtOTWanLtRhs9Tl3p
         q0ycDgZOuoBpXl/PzGPNM2B5KgEFsYHUCaEns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703117475; x=1703722275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAV5X+k1qQI1nOHUSW7EkdUMeMAYS/98mQ/cpqxd4GY=;
        b=dqsEJaft5Vv0NuJybopYzOeq2d3gfAY9WU9yCq3FWKb3s3eoIz4bF9DDfwVV/k4KWP
         HT2pBWG4INKg/gOSKK3sZpKiphiuYaDXIWlKsNJXLnj3f+ZR5gaeUf1exs0MDkPBd/T/
         uIIlQ6Z2z/jI6j9u0gtxeQXnMwoCZpmhT0RhqOC7ZHGxGNvDUvWT+I9lBChJ/s+uU8f6
         HbF0e5+QPn9QgX1/rHN7EJRb9MVHhaArDefMPtXG6pCaIXKb9o6NtP980h7Coyd6fIke
         qXwxWwzf5BNCO6Wsiej0aZ3hpC/BbCU0DiXP1j/NpF04qPqx7QyayBEsmE0hJNIgSRj6
         RiYw==
X-Gm-Message-State: AOJu0YyJCE6q4Sd6Ht18xPFyHWOQAIbPKCGz+fhrKlK35tx8hW5NEi9I
	3Wj6DHxqvTYlmzy6rdZfhM9CaTWHqmIQbHnYvX6UN7B7
X-Google-Smtp-Source: AGHT+IH6AZQUbB7p3805rhHbQqMkyHObvjQxsxeYvcsKaU7GP/uHQp0GbdwD5vmNCj34TCHyfAmoCg==
X-Received: by 2002:a17:907:b011:b0:a23:4a4f:c2d6 with SMTP id fu17-20020a170907b01100b00a234a4fc2d6mr1802497ejc.21.1703117475469;
        Wed, 20 Dec 2023 16:11:15 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id zt15-20020a170907088f00b00a1da5d9a602sm341545ejb.138.2023.12.20.16.11.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 16:11:14 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-553e36acfbaso5686a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 16:11:14 -0800 (PST)
X-Received: by 2002:a50:f60d:0:b0:553:6de7:43d7 with SMTP id
 c13-20020a50f60d000000b005536de743d7mr3379edn.6.1703117474444; Wed, 20 Dec
 2023 16:11:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220235459.2965548-1-markhas@chromium.org> <20231220165423.v2.14.I7ea3f53272c9b7cd77633adfd18058ba443eed96@changeid>
In-Reply-To: <20231220165423.v2.14.I7ea3f53272c9b7cd77633adfd18058ba443eed96@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Dec 2023 16:10:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WE=HhcBQVVtbm7ev3-MQzeaXuoaRL7WYr0c7-Uhv_v3w@mail.gmail.com>
Message-ID: <CAD=FV=WE=HhcBQVVtbm7ev3-MQzeaXuoaRL7WYr0c7-Uhv_v3w@mail.gmail.com>
Subject: Re: [PATCH v2 14/22] arm64: dts: qcom: sc7280: Enable cros-ec-spi as
 wake source
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Raul Rangel <rrangel@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 20, 2023 at 3:55=E2=80=AFPM Mark Hasemeyer <markhas@chromium.or=
g> wrote:
>
> The cros_ec driver currently assumes that cros-ec-spi compatible device
> nodes are a wakeup-source even though the wakeup-source property is not
> defined.
>
> Add the wakeup-source property to all cros-ec-spi compatible device
> nodes to match expected behavior.
>
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> ---
>
> Changes in v2:
> -Split by arch/soc
>
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

