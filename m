Return-Path: <linux-arm-msm+bounces-37760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D819C6D06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 11:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EB4FB22B87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 10:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E171FDFBD;
	Wed, 13 Nov 2024 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fj4IeXX4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6297E1BD9DC
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731494149; cv=none; b=IKDsoaG8D2LwuVBN2+M9FAevlDd/svx3nXZgSBbDE7iTgnJv/VGArX7Ltucroi0Dxk45EOctPuSSsPdhU4Qusnhob0G3ur0aMmC7gEudKMMQsjf0IU4dxc+zCQxF2HHsvdvFD5FWUGSVdBG7A8QuF4J9sc7Khc50OGRdAtPEiuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731494149; c=relaxed/simple;
	bh=tvSQveL4ZNKaT17R19YRy4ou5GvUrxgvspZno4PsLPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5hgXhPsLGEoLF2C+qrUoPNTsaR6Xb5hsw8r1hhavHzBZStznybNr3hfqEeIRYWYZEpoKY5yDDgDn4Bko2GomQyK/iRcFGLjJYFy/sQ5ZqHHaBwjr1aBoxuQnriICGdPLsGVe37G+vaJknT9tck/F/fzNJ8Rs8abqKa9Fud7z0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fj4IeXX4; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ff3232ee75so33988701fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 02:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731494145; x=1732098945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvSQveL4ZNKaT17R19YRy4ou5GvUrxgvspZno4PsLPI=;
        b=fj4IeXX4XiBLvuA2rPdndYu80VmdUg09rbAnv+dcr7MGhyAwjSLzWInBkUUJld+HEK
         WuboBVHh2ZgcyFGs1A720iiqtC5roOZwoBeg66N5NwlnYH1hjR03t/X9oAglYlE/+fLX
         D8GAvSXCRg/AMRvs3Xal0PTTM+ZYOj2uPZPbPviTuViLpkdyAzcFSMFesj0haErXCn5Z
         beDfu1GgfOCY1a7zevuQjC5O/0Yy2BLW3Eyl3mCMbn3PZIAIYJ4PZLu+Lxh1mVz+gSO6
         qdsGzbmk9XqCDBEAEdUYaPntBsuDY72/GFsgnSOqIxZv97WGvHWCL4REpf5DTHpTq68G
         bhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731494145; x=1732098945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvSQveL4ZNKaT17R19YRy4ou5GvUrxgvspZno4PsLPI=;
        b=sNSCnApwQYUzko874Ps00aCDqLwozXdg2041eqGNwugX8nysmRZz4t5OyJ86ssUnnx
         /wcPQINbW0CGVMbXNvUYtak4vtFx5kSJHCl4iNtJiRyMO0JaViFj59L+ktfV89tlxiNo
         UssybWuVDUEm3itiq7pojMSbPiy7I3U1CyCyfvY5FbLUd3hYWnW+3UK/nW69hFNUdCKp
         9nHYSdIiTDWb+sWkk3VJ5leH0YHwkaGti4iatomsM4DVOYeak37nMwIb6Jf/Vq2RI+eS
         pp3BMkXedoChBm5g9jEsOOQt1NqIfyBoPSp2vJFpm1VrfF8hz2g6iBaTjLLyvbUBCscO
         LL3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzUYULD9iVuUVGL/Ac+H9eihl6RQMCcCx86JbndWaZMUKYdvFcOutY6pAShR2b/gs6vU7vU5LLdSIhb7LN@vger.kernel.org
X-Gm-Message-State: AOJu0YzU3ZBZbvlJJze5nSYssDwMzDxAGqf9rbjnqd83tVibBzTyJqJ7
	nsxX6YVZjhaaW7mMaUWf4dX8n7iYHbTQ9lIldOfRDA96FBZIAYnZJu4McLh0zJIq/x+k7KNBqOF
	EKbT3E/Esnn0B7632zvhzDUuaREv1W5bF0o3Nhw==
X-Google-Smtp-Source: AGHT+IGO61t/piOQ54Ce2aHGK+yl3sQvYvS7vWigZwnBMLRlsxtH474c/h1XAYOCKrPLFzb2ccMr1lF7r/2+NuZ2ju8=
X-Received: by 2002:a2e:a913:0:b0:2fb:5d2c:7509 with SMTP id
 38308e7fff4ca-2ff201824damr96451511fa.14.1731494145249; Wed, 13 Nov 2024
 02:35:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112-sa8775p_cpuidle-v1-1-66ff3ba72464@quicinc.com>
In-Reply-To: <20241112-sa8775p_cpuidle-v1-1-66ff3ba72464@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Nov 2024 11:35:34 +0100
Message-ID: <CAMRc=McEjDbhuUV9zEBfT+OUHLS3ARYFvSMau=eXsomh2yiavg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add CPUs to psci power domain
To: Maulik Shah <quic_mkshah@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_lsrao@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 12:22=E2=80=AFPM Maulik Shah <quic_mkshah@quicinc.c=
om> wrote:
>
> Commit 4f79d0deae37 ("arm64: dts: qcom: sa8775p: add CPU idle states")
> already added cpu and cluster idle-states but have not added CPU devices
> to psci power domain without which idle states do not get detected.
>
> Add CPUs to psci power domain.
>
> Fixes: 4f79d0deae37 ("arm64: dts: qcom: sa8775p: add CPU idle states")
> Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Which reminds me there's this comment from Konrad that needs
addressing too[1]. I'll try to make time for it this week.

Bart

[1] https://lore.kernel.org/all/06895dff-bdbf-4dfd-8f00-ee850297ec12@kernel=
.org/

