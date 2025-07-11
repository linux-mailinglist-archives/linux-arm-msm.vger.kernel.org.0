Return-Path: <linux-arm-msm+bounces-64526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84435B01837
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD95916E3A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECE927B4EB;
	Fri, 11 Jul 2025 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YnF55Iyr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C312D279DC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226795; cv=none; b=TJSkVfY0mVXFRaVxj9Qvc/vBv425IPVMqqY5S5EfUAXfBRcoIfZr/ZrtTguuA9EDp1F1hQ/PvmbEQsU3ygzLikUR/Ln93F2GcZ05NN8/A4rdH8+CJ0tgFJ9Z3cjG/Eym4GwEso429LnapgBmdYr9G7ILd8UlcHzXySj08EUtoP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226795; c=relaxed/simple;
	bh=pGQpbekutr1+Uf+KF67JGtP7oLUb+5ENqzKXL2RpdgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r3jnnpVZAIYZZmgVXnvrqj8a6E9R+UYQatrAd2y6zIK2qPKKxNU9f8/ws8DTzpoDnzC0M3rDLqBMbXCXzZzMwkbjrtaWJH/FH4DKx/ijaA/ZnI7PkZ9kcSiD7VZRKKjqKAkNSVD9jxY99XAGej8h1Gq69116hdT2Rokbl0vDHew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YnF55Iyr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-558fa0b2cc8so1606714e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 02:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752226792; x=1752831592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGQpbekutr1+Uf+KF67JGtP7oLUb+5ENqzKXL2RpdgY=;
        b=YnF55Iyr+f1TQQBbW+4dbQpbrWbGMYN1qe48O6u6eLvCyjKF7Apae2xFP0GknxCzpx
         yEqV86rbbOVvww8lcw8A9ML6J4FOTGrf9pd+F14XixhNimXWJJ2oYAuV/gw3fQ5sOZ1x
         jx5OLZSMCgXc0PgXDo5FS4tv+dta7z4+2zzQ+5ca3eMVV0sNxlhsyXdX8KXH2H6mcGv3
         tVQpzyrTzm2Ih8dViGm3M0HblxcHo0FKsvSaqhJwRy25FDDbl7bB/Wyk+KvUXOX2eqJn
         MZEXQ9tuhKMFVI2a6dzFz/fG28TyrWWyb5cbGvMB+4SgOl9CxUk8FfHnxHJA+rA1yInY
         Nwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752226792; x=1752831592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGQpbekutr1+Uf+KF67JGtP7oLUb+5ENqzKXL2RpdgY=;
        b=Cvd7poknuZKpSQjPOFZEb6jB1Zo+cZJ9nI1n2EPGaTGrPMgV/+Hc+TZsZ1QRssyH9t
         LsSCqfLuUgB8pqHVJj62tsLcy2yjELkByFE1tcMEcqukBi1cbnDkiHdyQAPoB3prAXZW
         A8fU0cMnp35pY7Hamc1dQAAJO+a5R0lQKbGM1m39yb3wPg1RP1I8lL24M8YifygkKdV1
         tVYleI2fRaN2J4oS4U3Of+dkW0dXxwzclXLHgi9tZFt2DB34zXoRWwW7ftNE+ww2IsN1
         n/DdATU4obEeKIJGnlkg0J2us0RFtSUvfPjwBUxK6ppOZO5CnP2WnUOJdJclrEgQMD58
         JSxA==
X-Forwarded-Encrypted: i=1; AJvYcCVfBQF91jC2i6Z4HXUlPSxAxYUoNfqBfoht4mDlYr++aXb8JnfJlwLwirhZBNYGfdKo3qeEX7ylKNlHCkRv@vger.kernel.org
X-Gm-Message-State: AOJu0YxcIvsfyeYU03MKlfuH4NSSyyow2VeAA/7GpPTKWFJGgOiQG9PJ
	4Gb4djp8fxDZ2slNpdncsrde6Bxu9/KrGV7nnjNz0pMEmkQQmwKQRwz68oETMvJhh7aKiZILql1
	IMpaCVwDUNhklpTn7f4zGO0vJx5op+7KJ88lkYdhPAA==
X-Gm-Gg: ASbGnctCP6hoqDLFEC05BkEGo29jYVJR8OZ3KVAwKPjyUz8Xb1lo41qles9kWdbkLQm
	S5ztNHxxfEZqEmmjviElGy6hI065HslQ112kYRtq5tpjZzBel2GGwZC6/8KPUtipnxpFElEj0ct
	0GE52L7OfE1o+JrXSxUzJnAjAFHlwzYe3TJpc5RZASoC6fmiLJ/KaySXRCAZvfbRRd2S7mWxGjy
	FESml9iDIp9cvz2FzIeMPbX1ewQlNEewZO/5Dr4pa+YdQuB
X-Google-Smtp-Source: AGHT+IEFk4At+JNCjXR8Uv2tek5dQDztaiCpOCt16GcwngGIlLiBnZEyMFdRM1jzv3F2PaNLrKmME9qrl+gtzXvZYmI=
X-Received: by 2002:a05:6512:10ca:b0:553:2375:c6ea with SMTP id
 2adb3069b0e04-55a04625e5dmr712182e87.50.1752226791849; Fri, 11 Jul 2025
 02:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-pci-pwrctrl-perst-v1-0-c3c7e513e312@kernel.org> <20250707-pci-pwrctrl-perst-v1-1-c3c7e513e312@kernel.org>
In-Reply-To: <20250707-pci-pwrctrl-perst-v1-1-c3c7e513e312@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 11 Jul 2025 11:39:40 +0200
X-Gm-Features: Ac12FXzo6YM4ZlaH08l4154uUlIyN8MLpDwn2Iir1feRC033f3iJ5476U0K0Xzg
Message-ID: <CAMRc=Me5992+A0UhR3BA0+oRBepb94k2TWGDiY1Wdwh_9cC-eA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] PCI/pwrctrl: Move pci_pwrctrl_init() before
 turning ON the supplies
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 8:18=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> To allow pwrctrl core to parse the generic resources such as PERST# GPIO
> before turning on the supplies.
>
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

