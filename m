Return-Path: <linux-arm-msm+bounces-35704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 028249AEA67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D5C21F23D5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DAA1F4FC2;
	Thu, 24 Oct 2024 15:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKOXGfWZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D295D1EF0A0;
	Thu, 24 Oct 2024 15:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729783710; cv=none; b=aIfJD4NwZoyJ3b0H+/hX2T7fdTd3k4pGSsfTo7B7B9WzUqAGUqtZC30KCdiBh5bKm6VWBNnnDh8IbnbQcDAcZptGeyOJRlzLmG91E3wjx05XVJM8gO70/zu3KqRcAqnHrRYeIdSIUc49TP+i7igAMTz5kQFKsetYyYTxeaWOadk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729783710; c=relaxed/simple;
	bh=Fs2tc1WwAR2PY2tTefPbWYTpSMFv2nPyy55SErMhtP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZQ29Gojrz9ZMhTlEWq9pPYsVV75D6jo72NrSTV0VZALsOKQfvlPypnQC7NJ57uR/hGB1LHPEGvGOZb3JQz0TNhSLMw0ntlsNGz20C3WArsc+LtQ3d9FpumCFYW5oSpC0Ds+XyP28DqijpBR8ItsQ1cuYZuDH0aWMt1WGkIjRJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKOXGfWZ; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e38fc62b9fso10341197b3.2;
        Thu, 24 Oct 2024 08:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729783708; x=1730388508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrA+PE9QFVQSWd15h41v5TtusoT9a0SkYDwQrFOXSR4=;
        b=dKOXGfWZlb8w2TV6ORCoa2GSdteQMW3Ww8bwNPmkiHrtmUCpMj2L/pU5359U2zxLNK
         zOh8PAZcPT/HFdIJU2du6oGuf6QuInOZe1NL9Znf2yevnw2RHGmgZQRUuaCA/iTfp3oz
         nE5zlv1JoTDA3zdzBtSgL7/u9wck8Jlg96jKtl1xxMj7WZ4UMR8l1tSUUPmU1mAu61iQ
         UUgSqd4TJTicmEanzQGG19Ks0K1ur71rdiG1vSyrB0bFy5+oup8/Z1Y4lLAI/VglFcvu
         mZHLW0SeJ5EtVf931hR55P0CUurVuO+1WTP1HdTLJ9y3X9U6xDAqRt5iiAwgtwMRE/X6
         PwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729783708; x=1730388508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrA+PE9QFVQSWd15h41v5TtusoT9a0SkYDwQrFOXSR4=;
        b=uPEqKyhgs4pM3YnkNirpfESfYCwmFqS0bXHwjVpdS2yFsCy++jF5tKWacLzU+mm6Vb
         WgO+5IuH9yUbqNDBAxPO75UU+L4wzVf4yhezE4I6knuB9memBi3XrXmSf59DWOi6JAHM
         ANho+MB5Qs3OnREGO6mgtpRhoQ5Wi+W7ycSZgyOtWk5WdXM4WJY1VHyDtPRDylbDic5J
         xabUPz5m2ueSMKnpS1G+k3xKD9JpmA/l/TY3k/Vuo1Q36uKUqgbcEnB4NTRgOjlbcKQ5
         W9dWegXLftvMcu/NvPdXuFV8h10fJXHz81TqisuY20zrpKTth6zGP9wmd/Cjy6kMcm/p
         L8qg==
X-Forwarded-Encrypted: i=1; AJvYcCU7ApozTMW6sDVKkLPANP7hZGKieoA+QvdlvnDu5Mp2wXOqmiclhbq5C/o3j48eAl75TTM1QaXk39WLOMg=@vger.kernel.org, AJvYcCU8//vezLo3OKNiKMY40Inepzpp0WFBEWV0R4HYrkRqyTvnBgPZ4j52LTqJebcF8iu1nF1kAqHYzAmVXLKj@vger.kernel.org, AJvYcCUBqgV6ftGTNcpMZr3sWybADfG8ClsUKXsMFKXOj7KU4FJH1g5pQq5WnqBH3TkLr7Ic7K3dl3/oh3HSenxG@vger.kernel.org, AJvYcCW5lOtyEE20Ujru1vmOhhWfPvz1gQ0NXCMikjLPIw5mI5svtY3qvATSveKtYClmLONHocaE+Z+PF8NpmbTjvj8q@vger.kernel.org, AJvYcCXkZx4hply13gHMAuujRUYSJgGbXoS9XgXcYIjC67IrwEafc4JzTaVofSqYDNNEATCpDyFXZwTe9x+q@vger.kernel.org, AJvYcCXrN5Gwi6XSRxp0Q92etCnZB8MW+GnjW99phCv8HqqKJD1zRE6ol0BrrqKn3VSugemqMTfZN5cD/P47FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIpnC7T9T+lp8QtQJNi7oXDhHk3rfvjwb4vLhjOrNYUg4Zca0j
	ksAAaHZ/99Wk/is5bYp/TBK/ISjv5qSX82EdgFQEdTGj1Z/H3tGem12Kc+7V72g7iv0OTlW7Imy
	R3V2bnjfFZzhN76nPXmzgzGw/V/s=
X-Google-Smtp-Source: AGHT+IFRyXW0hYO2Swz9RLGo1csIv7IsSIQzzTKkoxMY8+2S6NZhcmqrrYbuG7/FRn1ItAKRcQRE+umN/jZ8cxvEJOI=
X-Received: by 2002:a05:690c:fd5:b0:6dd:ce14:a245 with SMTP id
 00721157ae682-6e7f0dc1121mr77233267b3.6.1729783707713; Thu, 24 Oct 2024
 08:28:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
 <20240916085741.1636554-2-quic_mdalam@quicinc.com> <20240921185519.GA2187@quark.localdomain>
 <ZvJt9ceeL18XKrTc@infradead.org> <ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com>
 <ZxHwgsm2iP2Z_3at@infradead.org> <CAAdYy_mVy3uXPqWbjPzK_i8w7Okq73wKBQyc95TbnonE36rPgQ@mail.gmail.com>
 <ZxH4lnkQNhTP5fe6@infradead.org> <D96294E2-F17A-4E58-90FB-1D17747048E5@gmail.com>
 <ZxieZPlH-S9pakYW@infradead.org> <CAAdYy_ms=VmvxZy9QiMkwcNk21a2kVy73c8-NxUh4dNJuLefCg@mail.gmail.com>
 <dfe48df3-5527-4aed-889a-224221cbd190@demonlair.co.uk>
In-Reply-To: <dfe48df3-5527-4aed-889a-224221cbd190@demonlair.co.uk>
From: Adrian Vovk <adrianvovk@gmail.com>
Date: Thu, 24 Oct 2024 11:28:16 -0400
Message-ID: <CAAdYy_=n19fT2U1KUcF+etvbLGiOgdVZ7DceBQiHqEtXcOa-Ow@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
To: Geoff Back <geoff@demonlair.co.uk>
Cc: Christoph Hellwig <hch@infradead.org>, Eric Biggers <ebiggers@kernel.org>, 
	Md Sadre Alam <quic_mdalam@quicinc.com>, axboe@kernel.dk, song@kernel.org, 
	yukuai3@huawei.com, agk@redhat.com, snitzer@kernel.org, 
	Mikulas Patocka <mpatocka@redhat.com>, adrian.hunter@intel.com, quic_asutoshd@quicinc.com, 
	ritesh.list@gmail.com, ulf.hansson@linaro.org, andersson@kernel.org, 
	konradybcio@kernel.org, kees@kernel.org, gustavoars@kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, dm-devel@lists.linux.dev, 
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, quic_srichara@quicinc.com, 
	quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 4:11=E2=80=AFAM Geoff Back <geoff@demonlair.co.uk> =
wrote:
>
>
> On 24/10/2024 03:52, Adrian Vovk wrote:
> > On Wed, Oct 23, 2024 at 2:57=E2=80=AFAM Christoph Hellwig <hch@infradea=
d.org> wrote:
> >> On Fri, Oct 18, 2024 at 11:03:50AM -0400, Adrian Vovk wrote:
> >>> Sure, but then this way you're encrypting each partition twice. Once =
by the dm-crypt inside of the partition, and again by the dm-crypt that's u=
nder the partition table. This double encryption is ruinous for performance=
, so it's just not a feasible solution and thus people don't do this. Would=
 be nice if we had the flexibility though.
>
> As an encrypted-systems administrator, I would actively expect and
> require that stacked encryption layers WOULD each encrypt.  If I have
> set up full disk encryption, then as an administrator I expect that to
> be obeyed without exception, regardless of whether some higher level
> file system has done encryption already.
>
> Anything that allows a higher level to bypass the full disk encryption
> layer is, in my opinion, a bug and a serious security hole.

Sure I'm sure there's usecases where passthrough doesn't make sense.
It should absolutely be an opt-in flag on the dm target, so you the
administrator at setup time can choose whether or not you perform
double-encryption (and it defaults to doing so). Because there are
usecases where it doesn't matter, and for those usecases we'd set the
flag and allow passthrough for performance reasons.

- Adrian

