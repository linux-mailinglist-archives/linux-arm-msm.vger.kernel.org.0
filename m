Return-Path: <linux-arm-msm+bounces-38499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E235B9D3D54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 15:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0A39B2AC71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 14:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC501BD4EB;
	Wed, 20 Nov 2024 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="U+ubVhvL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B781CB323
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732111660; cv=none; b=kpqDqy199GoJ/8tASVNIfaIEwU0ish1/13SNSyB0OO+Izg3khLkc0YBDkzLFZOYLfAPlCaxdyz8I3HiRenZ3+0U9CVTMwE71TIAQaAIRG9LJm2BkIxlhLxKRY8ZUX20VwVg8YqbTM4uYbazC50dQrEb4J4bGnc89dkA/ZuABB1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732111660; c=relaxed/simple;
	bh=yPWH5BbYvZQzKT4XZKsH3Lkntk3W+CBpWBfedkE+RYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbRImPOaGKAh7+Le5APq2rOk6FtaksLSfwNDIah6hV29gO4AuYHA8RNyl7ljzZbMYu5k74hs+IWjZOHb8UtlDOShd5AhrJEpzu0ln6dist5XCUAmtICHQeRhox3RoDdP1o1TcXPd04PTsrgMIOZBoqDu/YY/gwgRtKdYvZSxzTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=U+ubVhvL; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539d9fffea1so2137720e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 06:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732111656; x=1732716456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KI/xaFgppdO+gE0cZzeDEPSWwSf0mLTY9cnAOBa5yWM=;
        b=U+ubVhvLFNpjwFhVkllfUtpQ8VPJ4IZScnyad8RDk+bMP7ANhoPpvxKJKKqfLMjbr3
         yIINBux+3fSUuxJWxKB6yegYAbYiaKKtX21JlykSg2r80lwns1yzOAIiWB0cU8uEl538
         s4EHBEl3qwww8Fc1PIYYW8M6c7RuLPsG4JwaU5H8gTnUHE+mOxK7Cgh1ibsx/8bfhAvi
         OXnRHrxUSZOfsAzV65Pn+Ryh0LG4nOuNHneIejsKeZgZBqvAI8Xd0OMoS59Hc+QwruB7
         hAv7q9k7ty1w87oPNwkcj8I/3EwNP2VvPqna/Nb6mmd1Tzuvzv/vRhvcfLEd5m4/BqVe
         36Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111656; x=1732716456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KI/xaFgppdO+gE0cZzeDEPSWwSf0mLTY9cnAOBa5yWM=;
        b=YZ3GqT625FYH8Uikk+6Ou92DrOyQHWfyNeUTUsHDX0Yo8PIlhQIk2IWERxUbSIiumg
         TKNR9zZyRHDqTgjQjDY5aOA0REKjeoJYFotVDNlvaRr+hR9Urk2iqJJQVgQGZ5Ecqq24
         t/Qowe4eF+N7rML0aLlQsBFs5KGiS6Qcf5D+2/5D0Q3CFREo9W8LX0a+s7TZRgzDi6WL
         QYakcnOkAZg2qZ/YySvuIfMXzBZhn4OFfFBccl+r1JhEQOUFTpVo/hYKuxJCupMvBrkx
         Cyhyu3a7VHXFwWRdksJGj0KFsVBTfLZCwf8H6ztkI8PP/bgO22XiHUc2whI8vCFacWWw
         VNsw==
X-Forwarded-Encrypted: i=1; AJvYcCVyWdnz/LnxRbxLXcPtS7Mk+PWVuC1SZjf55fBKKEEMabAwJ2nG2J0IMvKdbazK0zFs4P7ynIxJAOPM5tTs@vger.kernel.org
X-Gm-Message-State: AOJu0YxhRfCgHvgSlthJ888rE2715Yzn2oJXnt6cg6YRfL3wQ9zWUQvf
	l0Z3zIAK9Aq2gmS3MFAqIPJ+r5eOCsP5VOuvw3Qj8/9T1bXAMFBVrQ+BQp9NtgIpYh6hZLOqW+e
	iPO6giAL/42o7kiALmeyqRKJ99bWTOSWyciWpExjk2PXFBonCAyM=
X-Gm-Gg: ASbGncuWcrONEgQEkRp80RdpOi4oY7pAf+KaSJMBM24On4hwzopWtnHKcS/2BN5Ypih
	HiuuOCaxCOqr3wva2eywbzLyfjuwR9viIz95C+afvB0S1zg2DlPRoap0wT+kqVFg=
X-Google-Smtp-Source: AGHT+IFKgxNSKwbtSzBNKNLLTIQE4JJpKE33C1dK0JAtnRSxVqVfqAZCSb1tyvUX+Ky6nt/MRup21tUZ9IbFHz1NYGg=
X-Received: by 2002:a05:6512:3292:b0:539:8f4d:a7dc with SMTP id
 2adb3069b0e04-53dc1374d55mr1253738e87.48.1732111655972; Wed, 20 Nov 2024
 06:07:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-0-7056127007a7@linaro.org>
 <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-3-7056127007a7@linaro.org>
In-Reply-To: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-3-7056127007a7@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Nov 2024 15:07:24 +0100
Message-ID: <CAMRc=Me=Eu6+SpdguKurWgQDrpuo4qTCwWO6GfzS=YuA9vUzOw@mail.gmail.com>
Subject: Re: [PATCH 3/6] firmware: qcom: scm: Handle various probe ordering
 for qcom_scm_assign_mem()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mukesh Ojha <quic_mojha@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kuldeep Singh <quic_kuldsing@quicinc.com>, 
	Elliot Berman <quic_eberman@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>, Andy Gross <andy.gross@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 7:37=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The SCM driver can defer or fail probe, or just load a bit later so
> callers of qcom_scm_assign_mem() should defer if the device is not ready.
>
> This fixes theoretical NULL pointer exception, triggered via introducing
> probe deferral in SCM driver with call trace:
>
>   qcom_tzmem_alloc+0x70/0x1ac (P)
>   qcom_tzmem_alloc+0x64/0x1ac (L)
>   qcom_scm_assign_mem+0x78/0x194
>   qcom_rmtfs_mem_probe+0x2d4/0x38c
>   platform_probe+0x68/0xc8
>
> Fixes: d82bd359972a ("firmware: scm: Add new SCM call API for switching m=
emory ownership")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> I am not sure about commit introducing it (Fixes tag) thus not Cc-ing
> stable.
> ---
>  drivers/firmware/qcom/qcom_scm.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index 5d91b8e22844608f35432f1ba9c08d477d4ff762..93212c8f20ad65ecc44804b00=
f4b93e3eaaf8d95 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1075,6 +1075,9 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_=
t mem_sz,
>         int ret, i, b;
>         u64 srcvm_bits =3D *srcvm;
>
> +       if (!qcom_scm_is_available())
> +               return -EPROBE_DEFER;
> +

Should we be returning -EPROBE_DEFER from functions that are not
necessarily limited to being used in probe()? For instance ath10k uses
it in a workqueue job. I think this is why this driver is probed in
subsys_initcall() rather than module_initcall().

Bart

>         src_sz =3D hweight64(srcvm_bits) * sizeof(*src);
>         mem_to_map_sz =3D sizeof(*mem_to_map);
>         dest_sz =3D dest_cnt * sizeof(*destvm);
>
> --
> 2.43.0
>
>

