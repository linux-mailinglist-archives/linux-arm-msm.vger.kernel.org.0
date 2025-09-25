Return-Path: <linux-arm-msm+bounces-75179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA03BA12E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A47017B2164
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D891331D37A;
	Thu, 25 Sep 2025 19:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPKz0rKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475D731C562
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828480; cv=none; b=NO4zSVGrG5Uw3CId8dfdsV/7SHzyRreQD2o7LHhSlCTUrjHGJtojWfFyPZgFR72BtARefzL9vL0oMq0PYuH6vJXYRVBj+uvALVdIxTg1M8GjF3gUQYBoyHXEqxWov1QAS39zGjdbFbn/ahIa8PWPQL1oRAn11s4kzHdlxYa5KsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828480; c=relaxed/simple;
	bh=FkwVFquael2W5EOhY9Ke8xPw4/ZDH8ASTCboaq/0jHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GEkU/sTSNMp1H0Ng1+hruHtIYJtHedDF2OuGJsAczdTEeBWeLziF5yPEj3gQQ7HNNp/XmlfwswuXiYovOaFgjAYp4N4wDaeS3klm+4Zvtokdu1FfAf7bHH0ERLSnP8DpdycsMnB6/SEowpdkA1WAUcKcHKS+xZunT1hVcUG0/Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPKz0rKX; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-55716f2d3b9so1008743137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758828477; x=1759433277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkwVFquael2W5EOhY9Ke8xPw4/ZDH8ASTCboaq/0jHY=;
        b=RPKz0rKXZGAftmJDTX9HSZwBJqcMF67WhKu7f+KlBy2LcY7tXVXcbFniCdDrCuz7s1
         OmPRgFuWHLiR396vEfTQ97MFMo5O40hjEFAciPQ6zhLjQjHZ/UqJve4n1qgxUrZXLM3a
         VkiQSaVKhLPJ/OVt9XIut2AhkMTEG7e/ahjnpfb5oYRu6yMGF2GummzIp+nYEE75zAxu
         4FXOJUSe62UPkdJOTPxEL1dhE/11/d7TfqxR+QyBgmh3uNCm6q5jJ3Qp3Be4E3oYHZws
         7/L8oDdqfAuV2UuMzoWfH3aYvzLSFiyIcLtmjNWaGvG3fbWc1kFcbchGErzaSUYdML6Y
         D+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758828477; x=1759433277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkwVFquael2W5EOhY9Ke8xPw4/ZDH8ASTCboaq/0jHY=;
        b=biM/OpN6YeRl+UMThNF1i3jiMcQdKoBZvaNPv78qWSlD9e1mYTPLiLxyKqy5d33jOg
         +uXYpvPp+f0VJPorTT4OqwT1wNYyrZoIAsCy1Ec1ocwyvf9LTiUY/wbn7B1ZkNckkUUS
         qfwcZozZEstgLwdnfZaibt5hzM7+SRjziBnr/IeGg9jgwkExMzN2Qbwu7Msh3otoW6RN
         nYA3S+g6vYAcHPQvbf7XPK9t3v+APeMMXLiTaPWOfPoH6WPAV574V/dWSqCB/2UUAHpQ
         jSFB6t3Emsl3Y1kw28k624IUGyjNdO5V6d75/tmRxpuyXIWbxcDClO2ZDgUJ0PM2Q+S6
         mmnA==
X-Forwarded-Encrypted: i=1; AJvYcCUv7dZoSaYfSKKAiR/KejgBqOthis48sW39bYWZ4/TL+djJ7Ae6VFGkPOrPzmWIkwdC7CJCSiOWr4Z4+pYY@vger.kernel.org
X-Gm-Message-State: AOJu0YyvrwpQSo9msBumFK9IaS9b+EV3KYgoe6KBLPvvmXWxsRn+IXOJ
	QQhgJfVTsChEgu9WRznZVH15Vwlw4ebfP/moRQjodP8Wtfcn5sckRF/7hU7oqyau+m9h9TAF+T+
	++7ft82r6pO7+KnF6AY3zYPj4zZYs/lo=
X-Gm-Gg: ASbGncuM+TQNlMH5IhvkdIV1wXfBD6UmxQQS68HyHzodLwIAjijHbFy+/kj5X3/5x8f
	S14+bXM8jsZCqbHScO1OZhy0Jhm6AbxPzlOV7BaItA8UspdK1l3g2AQG90eCarnfClb7SV41KFH
	douQo/mz2RXDbfoT/YmkuWfo37T4NkG2DTg024BBAHtejlzVkKA1k6mKD/WWGTV26/Oew0cFnvs
	YDCkA==
X-Google-Smtp-Source: AGHT+IH3c2AR5Kqr4M5jAjMB6cQc4XNNuFzi2a1UhG3oHzbXSwTVflCbFjJWk+Yfw0WGiaxCuX58gsj6hLEPPCxLmgs=
X-Received: by 2002:a05:6102:e11:b0:59c:6e9d:23bb with SMTP id
 ada2fe7eead31-5b28b84a9fcmr411890137.17.1758828477203; Thu, 25 Sep 2025
 12:27:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912-starqltechn-correct_max77705_nodes-v3-0-4ce9f694ecd9@gmail.com>
 <20250912-starqltechn-correct_max77705_nodes-v3-1-4ce9f694ecd9@gmail.com>
 <a3ce0aa6-41d3-4ce8-adff-14c767d7f871@oss.qualcomm.com> <CABTCjFAO=iLauq37M7LOXOmrgAnPxh210bcoujUsL4zEC3634A@mail.gmail.com>
 <60d2cfed-5018-4afb-9db2-6bf423defc7d@oss.qualcomm.com>
In-Reply-To: <60d2cfed-5018-4afb-9db2-6bf423defc7d@oss.qualcomm.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 25 Sep 2025 22:27:46 +0300
X-Gm-Features: AS18NWCiumK4Gvm4CxsGYtlqIR9SF3-IzwYXTXeUKD57lc6j5siyXPl03AqcLsQ
Message-ID: <CABTCjFBDFuN8Javi1w9nAKLqbHW1CB3vL4EGvfHQ8kCRWZJcmQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: max77705: add interrupt-controller node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 25 =D1=81=D0=B5=D0=BD=D1=82. 2025=E2=80=AF=D0=B3. =D0=B2 16:1=
1, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> >
> > See also [max77705 rework interrupt patches](https://lkml.org/lkml/2025=
/8/31/27)
>
> This would be useful to mention as a dependency..
>
> Perhaps >this< patch should be part of that series you referenced, too
> (or they could come together with this DT change even)
>

Referenced series is already applied, so I'll keep that in mind for later
patches.

--=20
Best regards and thanks for review,
Dzmitry

