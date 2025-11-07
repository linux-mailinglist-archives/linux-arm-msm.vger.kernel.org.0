Return-Path: <linux-arm-msm+bounces-80790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E1009C409F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 16:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 459664F0B59
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 15:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3837732BF2F;
	Fri,  7 Nov 2025 15:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FZ/RnJ6f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179862F83BC
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762529841; cv=none; b=JV9VqUIFd9ssUEaorwd13cHuP6wEUWk1axoW4DrdJESi7AuCzhCh/80nni+JEEIWKw9j6XKTzxcn7475k4I7rQcUMRJWo8BxSgNH6FM6XhNi7kSgB2iE3tqbS8Eh9K36awzYRiVfZJrR9ULDeauYTBc2ri76gEX3OKQ5K+64nHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762529841; c=relaxed/simple;
	bh=YAtagVcx34LiTu2Em+AG4zrD5yn9L45QqXjTBIFCHBE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZdJIetjxInBm/LIZU03/JYQ25gkA/P2anPDCe/yv8CHXoeLl+9nFaEupLgmJi12NMfMDtljveX218b1MuWoSpt3CnmuPT9u7htvaILCHPmJH/ev/upMYVwQMN+kRlvZSgbJZ6/8+cMNkvPuVHt3t/x4vpIFXyVNzcAbNXARlIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FZ/RnJ6f; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-594285c6509so1035221e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 07:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762529836; x=1763134636; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kTtcdT44O12GZqFLnS478W/Jpk+0DJ3d4h0jXmuqd2w=;
        b=FZ/RnJ6fWpPxXrB2+fvFJJZde+Vmv7M2WbHBwXXnJsLl529BoFWAb/F6fQUuE1SMkG
         EIDp94UvQU7xiUsXn7yVYAum3qPN9Tug63tdpkbry6XmHbMfgBXeBA3QgUza9AJrt8gr
         NTC7yy01wLjCDZ0AHLPZcSIB+LZckQIF7HRckGGC7cKh9mj3kwz0irNlIHEp0p0MqzsO
         tbHrFwWwjeGJQSjNn9c2wNbMD4S03m+6QSp/6EPzr+nebdXVL7fJ/t2V2+JBDWg+U7/w
         nYKQncAVBWHvguzUVBU7dXgs4mr1Qt6Ttq5uffS4VjbqXz65x8VnMoGmSsYm1vJkMR0v
         g/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762529836; x=1763134636;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTtcdT44O12GZqFLnS478W/Jpk+0DJ3d4h0jXmuqd2w=;
        b=Syjvv+2IFv9+0lAv6I3QfaEVvi7xfzE1MKnNuyrL/rBE3m7JiES51NNAKCvSwq5561
         3vQ37PuZwMxsLx/GyKliUCFBk+UpTLQPV/CpGJoY4OfPH8iTEelEEz8UkioPCzBepEWZ
         Josf+mKA6OsofcSeyR8XfFOe49hmwMglIZoAxN9LlcJGvVU/BCidQoKfk9i1+zopZ4qC
         BIKXKJ/2cddOE8Odv52Nd912C7dGni6Y0+ALtLdCC0P5i905T2htHqaTBeyE+eQ+ylTd
         Fyaub5JBDxlIwAB+R1styR6k0Jbf9aqbIeBBaWmxljJphF0S6PC/EigjQ+kJcX/rEvRC
         GhVg==
X-Gm-Message-State: AOJu0YxZeq4Xr+rvQFiNuWnhEuBdIDUvMm97Cqs+HlF7klUmP4QaNrNF
	Lyg39jlI8x51UMqYrY+h4NkSJxkfhbIaKzDHdjr4B3XM8b6YHRXRs9Y1dIuJGDDtEIeHqhkzvT/
	L5smkMOAxZVQsPkdQqHE76U7mhPhpssuX6/WCDuBjqg==
X-Gm-Gg: ASbGnctNCAuDnbm7NTLGs3ub/zLaDtNqLvxZFmkW79Hfhfej8HRkZGXORfgKufiOyhd
	bg+3PwrEhliAaFJmh24GMRdmshTw1W6vTJMmRPjqaM4Jk26peQVmmh3MUALhyz8QYgMxES+rE+m
	3IOmndjPpHq3rvJKfKxAXpDhjRnbcZv4sXCAgphKdXJA9RmwaOxhAgGKtgYdKmJi91olqZaYbHw
	tc8HFIxjHqEuMnbh1fqyUZ8a5qFisGR8rXzC7VYz7o0eIsZg3YDjPm6HfXNPNtAGGGuFK6XPLXQ
	wtje+l+mNntdYro=
X-Google-Smtp-Source: AGHT+IFIQWLvyizEJkA6WQQPfls6s2Ke/GDQq2r3QKt0gm0TI4N21r92bi9oP4EBFVG7CQqpb1Qa/kmwxqVMsaEgQbA=
X-Received: by 2002:a05:6512:114f:b0:57e:c1e6:ba8 with SMTP id
 2adb3069b0e04-59456b689ecmr1167747e87.12.1762529836073; Fri, 07 Nov 2025
 07:37:16 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Nov 2025 07:37:15 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Nov 2025 07:37:15 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251107033924.3707495-1-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107033924.3707495-1-quic_shuaz@quicinc.com>
Date: Fri, 7 Nov 2025 07:37:15 -0800
X-Gm-Features: AWmQ_bm8xW_kPpRTsH9WNw3ymMoDp75e2yehSkvO8IUPn-NE_tXci0xOQuXb2kk
Message-ID: <CAMRc=Mce4KU_zWzbmM=gNzHi4XOGQWdA_MTPBRt15GfnSX5Crg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Fix SSR unable to wake up bug
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	quic_chejiang@quicinc.com, quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Nov 2025 04:39:22 +0100, Shuai Zhang <quic_shuaz@quicinc.com> said:
> This patch series fixes delayed hw_error handling during SSR.
>
> Patch 1 adds a wakeup to ensure hw_error is processed promptly after coredump collection.
> Patch 2 corrects the timeout unit from jiffies to ms.
>
> Changes v3:
> - patch2 add Fixes tag
> - Link to v2
>   https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@quicinc.com/
>
> Changes v2:
> - Split timeout conversion into a separate patch.
> - Clarified commit messages and added test case description.
> - Link to v1
>   https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@quicinc.com/
>
> Shuai Zhang (2):
>   Bluetooth: qca: Fix delayed hw_error handling due to missing wakeup
>     during SSR
>   Bluetooth: hci_qca: Convert timeout from jiffies to ms
>
>  drivers/bluetooth/hci_qca.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> --

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

