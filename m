Return-Path: <linux-arm-msm+bounces-85154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B57CBB14A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 17:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F03ED300CB96
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 16:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231B32D9782;
	Sat, 13 Dec 2025 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZXCYt6VT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7F52D838C
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 16:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765643115; cv=pass; b=Z0UFlwotnZRfuI7wWViTBs44oePzv2jP+bY2yreuV2Y5AKjK2nRORFklqr5H+3jzr+llowUPfK7+b8hW0qWDRHOuVnXEoxwx3SD4CzuZifZStYzYwkIkOTeLZ+bfDDJI1Is2L8EEaWMiukt23vt4tSZ5ICw4KxLaAfvdPekIbio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765643115; c=relaxed/simple;
	bh=YAnZzpjbBwBWlqenRjdeOvVeURSHJvqxbcXNkssf0m0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HLhTmkSRFSq6I/mNCZEljkzsvO4svqrXOf8d/aAmRO2eO2tWCNDlSvOsjxouXH8BDYfXjXtNQOAdUCRtOm9/+YzYqUX7Dctfzq/1cWeFSqzWcGbA1Ua0I98kxDq/MpUe1erSiGncKXJdQzP8qmNj9Od3ZrHOecPybRhh3Q2ae8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZXCYt6VT; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-644fbd758b3so30185a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 08:25:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765643112; cv=none;
        d=google.com; s=arc-20240605;
        b=X6YclMFKWx5UNSuOTglqmuiJ2RBY79gNhc6h1O/otkC27HuvfksuONVyu0V1b71cYJ
         x2evd5xYGvyxEg+gqznnim/7l4Sj3m6NT+t5otV1KKBVOxR7CZ193GJXnBJBagJsktTw
         17G6TBuPqzwsgEImav+Q2+HjbBrVfx8Ohy9UdggQjdfrzOx3fX6FuXaDoS1Ye4oX0egl
         NCL6z+p5soxY2jvhk1MBLs2oawpEVaNNYsfeC/deXyMRopMA90yhJx3GAxspWNv3TIfr
         h2HrhI8q+MLbzcCViyhU9c1QBrK7kb5D3oS8v037VHaW6MyLrK3wsFPkHHzirFoQHfeW
         47fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qkuU2QpOJIUvy477P8mZDSi2Umf+2ZZ4kkB+P93Igz8=;
        fh=ojP2gY2WAlMwU59PBYO0WF3QsJpHE5Nk4dBHFNCHyvw=;
        b=YYfqZLGB+rVPD3Ot1yURnYZ5ZRmJK+kUqP9Z6mhJNdvwLdsrerddo0FfzQshlB/OhJ
         TJ2c+aZHdVsxE0HuticuEZ1xCtra8UizY+QXaIz7M0d7BZ7Ff1IMSsQDE75h7FB61Xq+
         tCdVF+l4PqJ2bgTUtyiD4uvypEAuQYGu772uUKjM1QZHd3WTwFBy2K8Ae1+Ono/sNZSA
         iO0ZTJaWSKGka5fL6qmGtCR51tVLszog7xTZFfuFLzN9YfEwAnm48Yzi3TY3rq+39QCt
         NwBLPQ8ttEWXpZLdHnEVAVGFMLd4MB49VVob1VUZnC4to3kxwBA0hWgAG/CBQ37WWZwc
         7zsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765643112; x=1766247912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkuU2QpOJIUvy477P8mZDSi2Umf+2ZZ4kkB+P93Igz8=;
        b=ZXCYt6VTniEINfW5eBE9SU8jVFKws2qN3OB7YTMuPVH3sINodC58UOSuifMKk8Q3mz
         rmz5ZxpkVXETrzaDUjZ1/wZe+YOMf8PTo4noWOVrKEkXJbdHpqK6pQkmrRVo1ke3EnrL
         gjC+xggg+d/AXSTckSpXhPJ3IRMGvWe7sfwtIIhx1ubzXkEaNW1kITtMjJscfOfdhJsx
         E5GEbGSvcUtgsSzsR2my9WsNIq9NrSUzjEDpuWuWO7shEG//DPh1yybyB/yy3jBP5kVc
         mPHI2Phi2+/XcxzPQ7rFBViANIcImMun8i1TuWW2Ktqd/oWKwVmRBMXg9TR/A2lCAaWT
         MnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765643112; x=1766247912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qkuU2QpOJIUvy477P8mZDSi2Umf+2ZZ4kkB+P93Igz8=;
        b=jz39cJcSLU1tcy8eCiSKQdTMP1yPp7sSRdkMR69E1r+HqKjkMaRXCvO1dyh0ep0H7a
         nIJc0R0Ais/3PkJndhCtSi9axQV/0LV+U229Wv4uBf3xfpIjxcIGr+9Hols53R3+7dMN
         Y7PL0fQmvK9E1bB+O4wqiEaFY4c+rtuNrI1loxBcPl5/b3NWDk48q/uVdEaJMzP4kXCq
         Z2SEZl/7Stqu+0TKPxPuDeLdzVOgO5WPNU8617GzcxAii8wpMJwspmB3TBQSck9Ljo9V
         38XpauKvN2UNs8niBwYhnxwBgi8OShSxNpmu/fIjSbhwsBHnVXBYUkzEy1yq5a6clRtC
         gcHg==
X-Forwarded-Encrypted: i=1; AJvYcCV6s5xX4h64YqyGJzzLudjYeMkBb58/XY2P2S3ql86+udK+wQ376qrUUe3VCpm5v6d+ll145dbh6e9wZ/vL@vger.kernel.org
X-Gm-Message-State: AOJu0YxqKjV3nLzgUhfggBXGwxnlCs1gq49E2ZKXlMpMEGXXzcBPYoMK
	Zlw/mTv8ocljsPA4SWZFFRlciqK17BmtEDkfN1pPZIgWvdcAyxAldJ0VKDNqqyXV4PZKVxMM7tv
	qv4wTPmhFpcOI8N8sLyQ4TmC6LjI/a+iko5KTerlv
X-Gm-Gg: AY/fxX4v6IasC4Fva7C9JApoMT9ecynQ9H2p0xxhMIcR1DAuOqqnJaZnDBjR+eGUQKN
	0LH1YbkWalhucPJmDkjaGxsEqSBRGGIkqkkfXifITM6BKg2UvkBbI7TFPc4CFC+5cZxFvKltFr9
	zYX6igFtmlh/vQKDv0wNzAjR+uH5aiiYiX+J39YRdAUezfqst7fQHpP9Wq/usFFHRQVIh+TSnNi
	IorLuRP72ykgfZiGXiL6+QkKd6sPhrB/B1EW0lVhscNxuXbF/9pwFZ5ViZPn/coJB/vTh6hDFLi
	Vfbf9teXKmZfjl0OteL4unZQyA==
X-Google-Smtp-Source: AGHT+IHlyJhnracVgNkSH6sJ3VIaGS7tv2RfDg7Zb2bwsXSyz7Si0k9LU9wFEB63RmvI9k8PDpzPf7a543mVVoDz97Y=
X-Received: by 2002:aa7:c4cb:0:b0:643:6975:5380 with SMTP id
 4fb4d7f45d1cf-649b0899656mr27353a12.14.1765643111359; Sat, 13 Dec 2025
 08:25:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com> <2025121303-railing-fountain-bebf@gregkh>
In-Reply-To: <2025121303-railing-fountain-bebf@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Sat, 13 Dec 2025 08:24:55 -0800
X-Gm-Features: AQt7F2rNZWVlEAhBEp8mKqO2tMqx4M7nqSCG6O3FgARgI9k9Njcg_E4ZsUfDmiU
Message-ID: <CAGSQo01yhgPVRzeZjGu=xV-eHMARRThYL7bbD4o=VskG3mYLCw@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 5:57=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> Shouldn't this all just be in 1 .rs file?  By not doing that, you have a
> number of public symbols (that are very generic), that will "pollute"
> the global namespace of the kernel symbol table (unless rust does this
> somehow differently?)

Rust produces one compilation unit per "crate". In this case,
`socinfo` is the crate, and the other files are included as "modules".
Symbols defined in them are not public unless annotated with `pub`.
`pub(crate)` makes them only exported within the scope of the crate,
i.e. inside the single produced `.o` file.

> But putting this all in 1 file should solve all of that, and remove all
> global symbols.  Especially for just a small and simple driver like
> this, no need to split it up at all.

I'm willing to put it all in one file if that's preferred for
organizational purposes, but as explained above, this shouldn't bloat
the symbol count in Rust. If it were my own codebase this would be
separate files, so up to y'all what level of granularity you'd prefer.

>
> thanks,
>
> greg k-h

