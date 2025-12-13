Return-Path: <linux-arm-msm+bounces-85155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ED2CBB14D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 17:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D3363000798
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 16:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A5D283686;
	Sat, 13 Dec 2025 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t8QKCbk1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31E62D8DAF
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 16:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765643185; cv=pass; b=fq1zJCJZXyDPSY+ruFzXqWRtr2jWNDWdCV/yT3vXqwpoCYrZ3/Mxl0TXMgXYp3Expmm1JV9P7NgjDU/itMEgBhYm11dqKoiYNWD+AE/ZfOMiZbbWv5qyhGoE6yxZOSXgi0V9MiW+MTkhF6rx3T7zW91aIccPqPnfB2e+c76LbQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765643185; c=relaxed/simple;
	bh=hEBudBX3Q01w199DsTrrFGpPOeohMRWrBP1pwxGVdm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYzUHdsXNzzx87E4H7X6O9NDrMmUBvgWPNJMgzd0TFIatseWpBPYhrKlo2sJpKQO+xv1/TFb6PwtMh10eefDRFbSGpII7hBJtAfbxgwbXKuZBnLlU/HxQTqGZXKuBZRVLLq5/68fWTU2lSa5U7ITP+ogzFD1DHYM1+2D+r3Wz1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t8QKCbk1; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64969e4c588so30583a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 08:26:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765643182; cv=none;
        d=google.com; s=arc-20240605;
        b=OsowJkY9WkpapiQTTOZe82wzk/KwLSDyt4bVC11k8ugXO22XYgIWxNLveb52C3z5Tg
         a/ux/kyDyn9PiLa7fuzQHobDorETb7zrIUl2msX45R2SGrV5vl0qY8lAhFUSZmLXB1e2
         h6AkNU+RaXPKp13FSh0Fe+mttphaUltGU5kczA0Wvzjhw2IbyXPIHIZ46Ns1napY0mo5
         +Bjkx3RDFmAc4LHCnc7WjTgZaIIBdePerbfgOFdsRyxBrLA8jqTgC3xBGTeCnQhnm22N
         9+uhZ52ObQrFgwb3j+Q5FkKrF+FYF6b4dB41ErVNip4JpXFZ+NNO4f0oakEL3OzMqcZc
         wj0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UCcUMaLmmuSJyWtPXvbL8wx2gaEQjZqepTePqkogohg=;
        fh=MjwbLGSkhtUToXv9BfJljR+WkTiOoDyGSpcIykBVHBs=;
        b=dZrZd8P20wVyYfEI9rCJADWcazHvShzjuZwy3ZAE6wygZugsdV5GoxN/3vhdpeyy3L
         tDz75RPGeK+qcn7hkMfXBDjm1lc/EsSPlf4BD8rTIBQjjvsB2YXS5fwRdMj0WKMH3lvc
         jGfSBtdgq9/fyMwZBaBSwyZQ3T9EyHEVnkM3h7cMefbwbeo4uI81/VvEmKCSbH/RS0XE
         Cbrw4y5iIzdTfRJy7fU7+glZfzKH7DdEPxMEX2RVUSqJg1LeF2nH+qndLxc8OcAcEOVg
         pInwSnktwPTf+NwYRYuIlg8yYiaXjs6EBRTU4dy3jCqb5ZKhcQHCF4NvK6JRLGGH/h16
         Zkxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765643182; x=1766247982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCcUMaLmmuSJyWtPXvbL8wx2gaEQjZqepTePqkogohg=;
        b=t8QKCbk1TybRm+hIkp8I6RokTjqO4TMhksmZT6mXwPPet8rYm4J6qT/2B/h+XszKAJ
         I/ueeejSKGbimJSjSIM+Y9kMZ+osBljaucqEXHgqS7bx1NU6je4/5GaEoWbBn9QT+eNz
         OGGTS1QTlRnjfjqBld7wOetHPz/t8vYKMjVKnlkuRG81ty/5kVpD8a/ca3OZEMvawCfi
         jMXxiXKYdWawxb9owE8WJEtV+Od+5oqud7AJtJJ6XEIQGFDC7pFjuM+ZYorM0ryGYsts
         OlNoOEZM5/d9fd8eb2g/z1TUeQ7vFejESQwnIAscVfYNfAhxhMDlL6QiziTRawMBDNwq
         8c/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765643182; x=1766247982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UCcUMaLmmuSJyWtPXvbL8wx2gaEQjZqepTePqkogohg=;
        b=H1p5Ik6l5F2MN2NQQqv+qLfl5jauLvEoxnLfkCrj29Yjq3Ou17j6+wK9Y1wGIg+O4S
         PWjN2FtvjHcSluhyzo4PmxsYmg5GtcfFeJTkjL0sYGHvfeYDrqcN8EzeUPAqcNIaq/Yw
         QrD2rb57Jwy6f+tSbrZNqhXrHnaTWsb4V7AZRvpAFgI6xmls887ekZpYGAvih0csa0P6
         gZDWEAk5WIofjSpUrLwSIGwyhKENv6s7vXDFhCl03aeTwRI/VkF3mWwHCz7NB0H3LCEB
         h1hvCZLEySybcPKUeLCRTDol7h7Jrs5rgBdyhKKpQDPpo7cVLhCaYSPq6CwwhZUB9TWI
         1nNg==
X-Forwarded-Encrypted: i=1; AJvYcCVboa6wsM2R2nYWKeJvFAhWq+lHWcOZeYbMYE4r62ffXwGmIhVKWDo2XZ1FILcUbxVS2CynclMgZ7SN+nup@vger.kernel.org
X-Gm-Message-State: AOJu0YzReyfxCyQMCc9U5U9bg181xsrZuMkDyNB4iYBCcT4/RuaY2MgE
	74sMu5hqJP2hA7SygFG1P15BaDZPo3KzOtHBtMMhQ20NjFFnTdiRHMEzHivKqNk3PITiaGTKyRY
	OvjT95P3mm6B2MiisBzZOEJc1bXJMSL0h7gb1H3mG
X-Gm-Gg: AY/fxX7szAP61PrW8dXsuP3U/ckQxI7PGwlXzZ3KDQXfd1KcHZ1GwNdFoHy7vxt6P0I
	3hveU/HUJ9X+wnJj9YtzI0yHMRkbTk4p6fxiz4F7JAGAdsnJ5dAQuXHm/A5hpi+Xkc/OloZJ0B1
	9dIrHcINP86id7Zhdd+nmzbgsNLfUi1H2/7EQ3QI6yVccRMYFWnXiOjivmEhy49z3UOzSCUhHzQ
	9rkI6qDieh25JVEYVbeb1Am5qUB5ptgGNRmM1AajoO+V+9bSVSU2FxEADEW76PzsAdjIVgzkcW0
	DiBoDi3CpxIaO/VJaay18GH7NQ==
X-Google-Smtp-Source: AGHT+IEUdvD3cjPJQUd+i/38ghXd7WenRONQcYN+rKti7PPh2t3kdQCDmEphkPsjiPrvX15XZMhthgHlSRSiTWQxA1g=
X-Received: by 2002:a05:6402:717:b0:643:1fab:c9fa with SMTP id
 4fb4d7f45d1cf-649b08ebd80mr24795a12.9.1765643181930; Sat, 13 Dec 2025
 08:26:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com> <2025121339-giggle-throat-3ef5@gregkh>
In-Reply-To: <2025121339-giggle-throat-3ef5@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Sat, 13 Dec 2025 08:26:06 -0800
X-Gm-Features: AQt7F2pmvKYqLnlo-7jEPckxGSTBhy44qunYOEwxpz9Yk_kxzY64crBZWsMxapc
Message-ID: <CAGSQo03JTd3g7RYsqQcGNwWR708JMg3wOnnBxxii_SuxN=49oQ@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Greg KH <greg@kroah.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 5:28=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> > Re-implements qcom-socinfo driver in Rust, using `Scoped`-based DebugFS
> > bindings.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> > This patch converts the QC socinfo driver to Rust, intended to be the
> > first Rust driver in Android that is owned by a vendor rather than the
> > platform.
>
> Um, shouldn't you have a signed-off-by from the maintainers of the .c
> file here?  You are deleting it, and then not adding anything to the
> MAINTAINERS file to take ownership of this new file, which I thought
> checkpatch would have warned about.

Checkpatch did not warn me about this, but I did add the maintainers
of that file on this RFC, so we can see how they feel about it on this
thread.

>
> thanks,
>
> greg k-h

