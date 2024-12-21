Return-Path: <linux-arm-msm+bounces-43036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BA29F9F24
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 08:58:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C81A16AA44
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 07:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999D51EC4D5;
	Sat, 21 Dec 2024 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRdEhwaW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2026E8837;
	Sat, 21 Dec 2024 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734767918; cv=none; b=kgLWtPDDj+oMxnSgpa0q/nVM1xJXICL4IGwDzarKIkpqS6+XbjFkxs/YMRld4G7cHUv+MkYvy4sfLHlLFgrZKRs4Y7xeQRi7w9CY1p9YjYwNanTkajytHCMx0ZG3DERmV7+Ltg3u63Z7Dhpe17qAaC9jD9kLn9tzb78wfb7wFmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734767918; c=relaxed/simple;
	bh=wYmMsWyt/+ngt9SyrGGZcO8m+JTh2JpGL6sMgEF5SUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WorhYvRmHnjmWWA0or2t0vGWHaKKQ8rUbqVs7zdfu1eIDdPYoaGou68y0x4NEmeHkjFyMQd8KR9Da/STDhYue0ZdRPN7Uqj/1sLjlD/veJfXPL7CV/rWk81eZxgNB6ad8PlUJt8kEEL3fu6dacyspomW0a+6o2PA1AD6MmU3vbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRdEhwaW; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-728e729562fso2357689b3a.0;
        Fri, 20 Dec 2024 23:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734767916; x=1735372716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGIYBfSfZLjtj/EgE2O68jF8wEqNoJxGNUW9IUSfjRs=;
        b=FRdEhwaW9m7H1ni3o2mxjaqNAQVxdZgliJxC/vCHUHph8wFbHr0+pFN38IgOTIrlPC
         h7tQ9IrrESwsV9frDnx0blVdHrQfmDkK8LjQ48FRbjuBYAIv32HbJ2Zj5qtIZaWI1Qdg
         gRMs65t3KGt7vosyMP9TPYRDLNac92N5dsGfbAKA/ocRwRvf+2JWUc83ke8BkybFVR0d
         6LGWbXDkXmfHU5PiIJMeZMc2KvrtcSRAYn20C24i3fCCKGboWZ5cHCk/QXwU/F0cvbK8
         9TGeVJkCA82OHfi/kEHY5UIStBTzcAVoBGd9PVqdhJ/FedM7aSnx4qewgUfbx+X8i3dh
         pQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734767916; x=1735372716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGIYBfSfZLjtj/EgE2O68jF8wEqNoJxGNUW9IUSfjRs=;
        b=kZhQ/lWM4vS8xZPjfSMeOT8lQBFPHl5FAZmpB1evOMmqmSekzw6hSJxxcyucDI2C7t
         kLPjnCMzhQIcNGgkzCX1HF2xCcgWDEe5Mek/ijJ5GE5LuDW15/5BTo6KO3PNk6nGhmGi
         98gwWQioco5B+tdBRnIi+mbuzUx21OFq5pH5CnADZLiuBO6VI51GTHaXw8mu+nuJ6kkF
         U4xRG5msb23/TJvwhokh00OEFVzDdMxL85Adbxhzt6sFoZU22YSgxkKdhDxyelZAUaC6
         Eo9ZerYThYe2ENmdnnYHM+fcCCxn0KhWupRyALioNM/5fFPpB2PGvaDxI9R/CQ2qE5Jy
         Gb1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnUVPYKRku5DT8ymL6H0JrZI7t6YwFz/jDUooFUW/j8ZT/DvUBX5sxxzHWhkuqyTmM/uCLuN0Mlxflq5RZbQ==@vger.kernel.org, AJvYcCVTnDcUQrWHnXHtaIxBt3q9fW5xFd1aYFhJzQf2QiogypICKeHLLw2Ij2kHxGsK9M9mtg7M3lxEiP+s@vger.kernel.org, AJvYcCWR1ObTqQ4/HMMJldXp8/RxbbHQca95qdHrhlHhtgI5vtYQq9E4olV8wbwEnEytgXYFv1XCXmJUWyIP49JH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz73Bw4sl1k1POogZ3GwvZVLn/aaNI+ELlc2TRW253sHM/wsIKF
	iEa+cLmpq3yxrXLER5Wo3K9+xfPBn5+k4QlwoIynkxbJUjWlMw/wyl0NmzQ5fFSjPg==
X-Gm-Gg: ASbGncvcPoFZcC2OtW59PnQdCv83Kv8P8HR5rxfnO5FN9fsF4/TGdW1iLs58oErlVlB
	SFkVyu7QlQabHPoDT4PaZ0k3iGnS4+YcTackB20KeVRTAzXU6rXRFQDXaWTqKPuhcCHqDRORKXU
	UbSC5mye8YUb0sGO5I9EqZAnHHfu/bw3cgdlP8f6Shm+Jm3CgwImJFaV4qqNF9/31EVgVESA3eJ
	bDTshnhp3DLgHDmPwmZzGp4pTrS1EgPco22ztZ5PREPRho8+WQaLcM=
X-Google-Smtp-Source: AGHT+IHesNqn4ntgvacOsGaQUKmFZ7Jl18ru0JwABapiXHuOjzjJbAqQ89WrqvpnEaqluAGV+KOCfw==
X-Received: by 2002:a05:6a00:23c1:b0:72a:bc54:be9e with SMTP id d2e1a72fcca58-72abde30d9dmr6744470b3a.15.1734767916379;
        Fri, 20 Dec 2024 23:58:36 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8164d3sm4263858b3a.15.2024.12.20.23.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 23:58:35 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: johan+linaro@kernel.org,
	konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	chenxuecong2009@outlook.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gty0622@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)
Date: Sat, 21 Dec 2024 15:57:12 +0800
Message-ID: <20241221075718.466570-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <d46f0ad4-4319-496f-9093-54bb5a000875@oss.qualcomm.com>
References: <d46f0ad4-4319-496f-9093-54bb5a000875@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Messing up, reply again to fix thread.

On Sat, Dec 21, 2024 at 5:14 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> On 20.12.2024 5:05 PM, Pengyu Luo wrote:
>

[...]

> > +     chosen {
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +
> > +             framebuffer0: framebuffer@c6200000 {
> > +                     compatible = "simple-framebuffer";
> > +                     reg = <0x0 0xc6200000 0x0 0x02400000>;
> > +                     width = <1600>;
> > +                     height = <2560>;
> > +                     stride = <(1600 * 4)>;
> > +                     format = "a8r8g8b8";
> > +             };
> > +     };
>
> I still don't understand why efifb doesn't work for you.
>

In v1, you asked me

> Very very weird. Are you booting with clk_ignore_unused pd_ignore_unused
> in kernel cmdline?

I said yes, as Johan suggested in here (see [1]). I am adding Johan.

> Could you share your .config file?

Here please, https://pastebin.com/UKew61ZC

>
> Konrad
>

Best wishes,
Pengyu

[1] https://github.com/jhovold/linux/wiki/X13s#kernel-command-line

