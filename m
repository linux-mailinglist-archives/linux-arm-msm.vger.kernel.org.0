Return-Path: <linux-arm-msm+bounces-9598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 565F184771E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 19:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF8081F253D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 18:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9324E14C5B3;
	Fri,  2 Feb 2024 18:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fqPonD6F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DA914A4E9
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 18:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706897454; cv=none; b=aUYhlJ6VydoAy6/xNT3vsu+d/9DER0iuH/Pl7OFDozExctH8RtbUJZaXP66U1IBRkZoNXJpyxMyRsx53yNE5iSAD8d+VIJkHVGdK8I4vPUNAGDitugkcnlXzI0d+jAI6uet94D2K2sojtNBQ0IQnrrwaalyzqjq+sMswZXvUBc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706897454; c=relaxed/simple;
	bh=Bz5RLrDSI2lz3eGrZ1BaBArmjYUlb+b6xEsdTMAn6jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OzkjeNTo0OtgFrmcUm/L4B97s3C/Yxzp8GNnbBuKAJrbbZpXfId0aFVXtTNyKaOoxR5X9vNH9yN8d+UBEnNZjw9ItdZ+J8wQ7upquYKkOOQiOtASlRRebpZ5yHomW6WIu8nl7QLWl5rTpeQAd1K/ev0a+wL1wCGVqzmX9uDLXtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fqPonD6F; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5ffdf06e009so23591947b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 10:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706897451; x=1707502251; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T9UGts6nGQS3RkEfXeXcR2v8wnlBQKwVVYdgj9qNjJg=;
        b=fqPonD6FmllUQ7g232VwCt3C9y8aURPBGfnJN51oHqJceQvbdcQZdGGerEDS/nynta
         Rl/xb0eWQ/eMXKctZdSZGJrk0gahVdehSsBfcoiiqIZ9GOclOs/gzQbCHtht7f/SFGPQ
         d0BCY8Cwv4Rto3+FOuYMGS/MIiiHUsv+VaZ6TWFLqRgi6ZyZyrI45nb/dmsfQxsHfXGn
         w142I4nvqxDrHSJ5l5q4yBCRfe+fXxnXZhUn532xnPwVU3NeDDLm0DnCz4NqjF763iqi
         9Dq3EIbw0Ry81YjMtnKQxFYlpQ/yWRQ8P0KDTs3Sjj6rbWu7UQdW3z8zqXwGI9G4krAe
         mY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706897451; x=1707502251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9UGts6nGQS3RkEfXeXcR2v8wnlBQKwVVYdgj9qNjJg=;
        b=jozmh+0k9jc434QIaPdaUZVn4zxB16ojMDEFLxR6tAPMwwUrHJUfY8HT6esg/rVyA3
         2idWHfiDdCoGf8kYN3yOpkfh0LyFTkGwZ/FAyeqS/tV4AmRiOOAn1oS0flGaVqKkZ9zV
         rpHvx0cmn2TXbKV2nsOTFNeacKgRTA82WVzrnDZIi67f6vCGR32h5cYj5+ckMCdSo23W
         COYI4ZS33H0PEhunHRe6X96DBtXu+1tAinqr9LLVbX5NcmEj16aNbGkyydtOf40eBJkV
         iYHA1StSSb+W5wdgIlNWeR0+mFrpwSYa5TqB+B/4MJOlT3u0fJxmRMnaiL1mJJyKqtVu
         BFCA==
X-Gm-Message-State: AOJu0YysDr1EJTcKTmSq49IC268oPt4dS97EMFtI0eLYX2CrMriIu9BR
	ZrRZqTZmQzqkCGnyR0ISgU6P/MM8/+2dsg4v8itH/YXmH8zBRsFmOIpwxdOl9HuvFePZGrw1uaM
	ZXDt3l0VFrSEMGcJI6Htpy1K3ANui7jeKPGIZjQ==
X-Google-Smtp-Source: AGHT+IEaGvHddmuizMRHJVxE6vTh6Fz0RMNu2HTzUn5QTT2/OptTAJOP+s9PzIaIo7n/qn5MsZwbga2DCIchY7JwDtA=
X-Received: by 2002:a81:b613:0:b0:604:ea3:6525 with SMTP id
 u19-20020a81b613000000b006040ea36525mr6745858ywh.0.1706897449670; Fri, 02 Feb
 2024 10:10:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122102157.22761-3-brgl@bgdev.pl> <202402030101.nxmgLcAB-lkp@intel.com>
In-Reply-To: <202402030101.nxmgLcAB-lkp@intel.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 2 Feb 2024 19:10:38 +0100
Message-ID: <CACMJSetk29BXrb2ywuWPCsvkDn9k6+0gTbcxmZBUyJteJG2=hA@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 02/12] firmware: qcom: scm: enable the TZ mem allocator
To: kernel test robot <lkp@intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Guru Das Srinagesh <quic_gurus@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@quicinc.com, Deepti Jaggi <quic_djaggi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Feb 2024 at 19:02, kernel test robot <lkp@intel.com> wrote:
>
> Hi Bartosz,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on krzk-dt/for-next v6.8-rc2 next-20240202]
> [cannot apply to arm64/for-next/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/firmware-qcom-add-a-dedicated-TrustZone-buffer-allocator/20240122-182633
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20240122102157.22761-3-brgl%40bgdev.pl
> patch subject: [RESEND PATCH v6 02/12] firmware: qcom: scm: enable the TZ mem allocator
> config: i386-buildonly-randconfig-004-20240202 (https://download.01.org/0day-ci/archive/20240203/202402030101.nxmgLcAB-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030101.nxmgLcAB-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402030101.nxmgLcAB-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: gen_pool_create
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_pool_new) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: gen_pool_best_fit
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_pool_new) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: gen_pool_set_algo
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_pool_new) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: gen_pool_add_owner
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_pool_new) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: gen_pool_destroy
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_pool_new) in archive vmlinux.a
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_pool_free) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: gen_pool_alloc_algo_owner
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_alloc) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: gen_pool_virt_to_phys
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_alloc) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: gen_pool_free_owner
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_alloc) in archive vmlinux.a
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_free) in archive vmlinux.a
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Huh, strange that it took so long to report it. Seems like QCOM_TZMEM
needs to select GENERIC_ALLOCATOR in Kconfig.

Bart

