Return-Path: <linux-arm-msm+bounces-51272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7943FA5F212
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 12:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD72C3AC2B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 11:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39306265CD9;
	Thu, 13 Mar 2025 11:13:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0665FB95;
	Thu, 13 Mar 2025 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741864430; cv=none; b=HTVsYmQ/nMez6P8kVHFEHYE9frl86fyOn0Dtgoq6FLPVgGqwvNLYx93maRg1BZZKQgtmUNDbStUCwz0dEBu9fJy7fSEltOifQjrh2js8G9FcxMY2vzJoWYYrl4KEpkE7J41R+9ZnAxql9RJkcaa+Kmk+0HiQSzCH0frjGf50rjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741864430; c=relaxed/simple;
	bh=HRqlj3f451EuGpE4aN6v6KzfunskA5WFsS38RpEwOSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tiALX9EYvWHZMdIEzC3WuHisI4TRWJtBNZGyds2yxnehtiAHmasrXTKyN4GmwU88GpG7fHwZbDU/5W0AZKrt8gDQ0IvVVV3m3AzjTRhdGWj6xAelgMx0nsg6e3MI2IE1e0FFEBOmFCzngSlgKdpJdKtlsUTn9Lkj/EbVIKRO+JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86718c2c3b9so385944241.2;
        Thu, 13 Mar 2025 04:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741864425; x=1742469225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+aTfeoVSIyB0YffFidlDzeB2TUKfGBiv94evK8t4xc=;
        b=ObZV/au5jmBMZXY75luoojHUbmvGogTAqreJmA+IIH/ExLs3TtWUzxlNXc4LehyoBA
         jG5nT4Z/B+h7CRbpGXDYWnuJHPqE1+AEpqraKOwn/KEhujPxoPVaNHa0OhCRrxfrkOqJ
         b/sMp3LCsaFIAxwqRllDF3RzDcZj/QOi7zF0bSBPFdslcVSWpemGdC3iLEZ2KU0NnN+s
         SRZBmZZ0rYAQwYdlxiWWHudbHyU7WbyC5HVl706awYzTxnAaBTuFs3iC1Unrqex+oVu1
         s5qrkPAgBpID9pepnppbnu+rsKrwMGvsG4Fz9Z3IQ1i4Lswc9jRyV3gKYXYw6zMl1ayQ
         O7xA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ3kcz1VLhnBmzMqwtS9id8ygMag3N7wscuTdA6nKN681uS0y0x4cgHi5SBeTLw6/ilZJz51B2+itI@vger.kernel.org, AJvYcCX6IofZiIbOgDWh/uA8Yy6HY8x6vrjSxA7RwAUMwFjQ9FeheMF0nwi/CpNM8nI1AWxQ1iQzmvSuoOGYZAV/cA==@vger.kernel.org, AJvYcCXfdHN0fcH9yidS9GLSwiQxf2uKt10vdTLVotv2dNSGKf4pr94IhjmygV9BZEBgosnO+hyvSaVAee7FUFp7@vger.kernel.org, AJvYcCXj4eWwUuOhdlelgWo31Gpa7FuwEoc3+LTbtYA3qy2LzFb6ZoLEhi00mdRvTBAqH5azRaLfRPH4@vger.kernel.org, AJvYcCXvkzItTigmD/MmcNn+pFc6XhColgKDB0LbblQaJXGADRfSURrqG+NsNgyM8KhMLt7R5blWiQ2tSCXA@vger.kernel.org
X-Gm-Message-State: AOJu0YxEwNxT7HfcyFKdlOlyDfNzwdRupno6BNWVQ0rhsbt2vQodCgCm
	awZZNCBkSIuu+z1LiE8vv9PVSQK2zPK/wiRaHBhHpF9iDBziuEPZIUgDe29n
X-Gm-Gg: ASbGncsXk+fBkIz5tZHgdVl2btXsW2cq3066jJV5p1eFD6wmTTyZri5NjeyR6gC1kxt
	LZMv6+QKOnn7f6XEwhFAlSREzczGWGz0nlx8fLJo4Y3cC3cusfM6WU2D/f7nk3l+MzsK67VgplH
	oKH1I2FI/4PJQElcTAnoVQaCSvA14J9Y3w5bR873hLTsh6hV5RK0xtSRdfG2H+blvUu4zljuRPV
	O2vtyPBKxKvphu1MyIDN1Hxn9U+7PfHAJhLQO2WBI1bm1PnBZ4sxAm/R26yj8JFmNwBQ3yRonvw
	N6j6t24RHCbOe5mlq7gmGI7a4azaSMr8TdGVtEgxJwM5gFmAAZwuwGqEzLbwy8LqF/2gf/8J0TI
	x4pz4gqE=
X-Google-Smtp-Source: AGHT+IFx3ko6Ysd7DNw6CJ37Ci5grYHyEPZJGZ2nrkXEINIv8uNUpv8Briaa/BVOKoToXTfJCTMibA==
X-Received: by 2002:a05:6102:5491:b0:4ba:eb24:fb28 with SMTP id ada2fe7eead31-4c34d20cd1fmr12077830137.3.1741864425520;
        Thu, 13 Mar 2025 04:13:45 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c374f646cbsm127309137.16.2025.03.13.04.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 04:13:44 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso416372241.3;
        Thu, 13 Mar 2025 04:13:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6jX0Lh/nN97+/kIExraptGYK/UWcbcPdxKmwa6HtOzZxaVk4IoXeSNSMP4o9w3TivPypKaO0A@vger.kernel.org, AJvYcCWwWtc2XMdSlaT2SHIkXds/a4aWMhnORLFgBhSkErQBzX0uX8G556yFFMKEfGhgiiuDaraZUQQY235Pr977@vger.kernel.org, AJvYcCXDRUWLevKcBpq7M4ShFvimI6G06pAmDOI1743m2CD+I6a5oURCahOJMM6bYoDWg+aX6ZAz3tW/+f7e@vger.kernel.org, AJvYcCXTK20WBzr518AQ354hvJmkM9wBXWrTjvSZXp9PRsvj/VNTm9qCmyThG4WA8fvzuKDaRYgszRZTeCzi@vger.kernel.org, AJvYcCXZMTk/YlsjjYEwglfdDmVdv0DEh0LYxJ6vdiWyvt2LTBE2zCEkCDIKvbIelIlyUeP/qJGCY8EFRrTKTj+sMg==@vger.kernel.org
X-Received: by 2002:a05:6102:6058:b0:4c3:64bc:7d16 with SMTP id
 ada2fe7eead31-4c364bc826emr6410107137.16.1741864424462; Thu, 13 Mar 2025
 04:13:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
In-Reply-To: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Mar 2025 12:13:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_YE2pf+SxXR5sWG1+aG8wv5MtRWk+0+ZF_n8ao7seRg@mail.gmail.com>
X-Gm-Features: AQ5f1JqRTMYro5mN9behN-6IiqjAuHgeViZHARDgbLMt0YG5Pc6vqgxhUbgQtPQ
Message-ID: <CAMuHMdV_YE2pf+SxXR5sWG1+aG8wv5MtRWk+0+ZF_n8ao7seRg@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] Add NSS clock controller support for IPQ9574
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	konradybcio@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	p.zabel@pengutronix.de, richardcochran@gmail.com, geert+renesas@glider.be, 
	lumag@kernel.org, heiko@sntech.de, biju.das.jz@bp.renesas.com, 
	quic_tdas@quicinc.com, nfraprado@collabora.com, 
	elinor.montmasson@savoirfairelinux.com, ross.burton@arm.com, 
	javier.carrasco@wolfvision.net, ebiggers@google.com, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	quic_varada@quicinc.com, quic_srichara@quicinc.com
Content-Type: text/plain; charset="UTF-8"

Hi Manikanta,

On Thu, 13 Mar 2025 at 12:04, Manikanta Mylavarapu
<quic_mmanikan@quicinc.com> wrote:
> Add bindings, driver and devicetree node for networking sub system clock
> controller on IPQ9574. Also add support for gpll0_out_aux clock
> which serves as the parent for some nss clocks.
>
> Changes in V12:

Thanks for your series!

>  .../bindings/clock/qcom,ipq9574-nsscc.yaml    |   98 +
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         |   29 +
>  arch/arm64/configs/defconfig                  |    1 +
>  drivers/clk/qcom/Kconfig                      |    7 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/gcc-ipq9574.c                |   15 +
>  drivers/clk/qcom/nsscc-ipq9574.c              | 3110 +++++++++++++++++
>  include/dt-bindings/clock/qcom,ipq9574-gcc.h  |    1 +
>  .../dt-bindings/clock/qcom,ipq9574-nsscc.h    |  152 +
>  .../dt-bindings/reset/qcom,ipq9574-nsscc.h    |  134 +

I don't think you need to CC people who just modified the arm64
defconfig before, but never touched qcom clock drivers.  The list of
maintainers and reviewers reported by scripts/get_maintainer.pl is
already quite large.

So please drop me from future submissions.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

