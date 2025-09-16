Return-Path: <linux-arm-msm+bounces-73636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA3FB58E14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 07:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 518561BC48FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 05:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E28F2DAFAA;
	Tue, 16 Sep 2025 05:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vyE6eyT0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF7727A929
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 05:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758001743; cv=none; b=iN+ardPWNp29oKY8Tef1g1F3yPIZOLtba2sXxagBGZ1ZRy/AY7T3zv0GTfwPAW/keELSX6OmAvKFYI0D25akQdByA2VYH/f+7LIeo/cMdIejmA9WiR8aCQP+m5ssc6fc/vyNsC9bCg67/lQ/RnF7CYeR0faLLizSo4J9aGGk9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758001743; c=relaxed/simple;
	bh=aablpwZgkDY2HF/H36K+OQMk4Kq3szZsC1rhL0md7XU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KZALKVN004MFnqwhZsHkP2qM7y6lsfO6ddd5r1GPedJ4GIC+bRx+wlrnp2XHyw3UlorKRa842yjCQO/I4cQNhiKddtnIpCz5L1vBQQolH1CeRcEcRYqMnhz2ZPquvFfTzMsBRwnWQez4UHEEQS2JeyK9WkmF0Ki9AxD2sWR3jYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vyE6eyT0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3dae49b1293so2762203f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 22:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758001740; x=1758606540; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+Ij4gEe2LcS6vPzM/CR57NuWgzn7Jx8huZwedt8Tqc=;
        b=vyE6eyT0MwN2srMR7la91gruLAHsfDKkC/uqT2y7dnzmpxT4aBrJvFBUXFuRjrlkhg
         BJMlS1SEf/CJiuAYvoagzi0bw1l+08ehlBDgdoabYAvuN1iRY2J89XjLcEsNGDN9k0ac
         aOjZLNk1nYz+PjPOearTnT8jGsO9sWDnccM5RosHcGGE4ns9SCCi+jtQ9uqyS6IjwXRQ
         kXgTpCZ7C8UbjDFqTDMIU4WYwJNH2K4wzKvVh/FMpDu56Bloqs0h6jObhVfoUPcDQBJ0
         KI8LDEN3FYm5wE6p822OY7ocAFzSOHDGxrmu7nsNAA2pA6lnpeVond2gJ0vTGVm/MMaI
         ak/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001740; x=1758606540;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2+Ij4gEe2LcS6vPzM/CR57NuWgzn7Jx8huZwedt8Tqc=;
        b=C7NvswfMbWtJy3NTOEZMHv/ip6gcixFk+BlE7SbmIg2RAEQygewqaNBmEHdtYiUhO7
         YCNBdfWnWStqpahzEqPsVxmptyredwPkFNzSXYvKaxSS5+bT8eAlD/R6/BQDNbEaz3wa
         e2zDLAUrNACWdOn6xhBi/yVLckycvP0ufLB/+MixJkTCG8deFNHfmpZZbjDPDis9qQWu
         UCde0MxfMhoYsZwy8V/6po+bTNRNFIfW2SL9quL9fITq7fwCjyFZm2u3m0iv8dyN77Ed
         qt3hyeYfqdlWOj2vFsgZq29xqLdc3zC3dnjOdv5HQpE8mT966PEVi12saPaYH+FOaXiy
         pWUA==
X-Gm-Message-State: AOJu0Yw9rk54BX33HaOnqW3T2DaWUHHHcq12Uvu1O1gAZagxg+Ty5yq4
	MkfVhvFO3OQ/qVIWKQU9v6N2klUnU5oiJ8zevPGdYhJgXYmSqaRhsM5tPio8+TwEIs0=
X-Gm-Gg: ASbGncvhfGO45UgWuI1FREaIbzP5Y25iH8ZKtV1t8eXVe00gy2J0vOUFNSbpUHDasTS
	UU3O1+3e0dLzpuFTb5KZn2gF64QFBVRzQVciev0N1IFcPPHgmIQFfqm8WcWX12xm9U4cNBkAL2A
	ILVA8RNCVrSRkZUoAFGXZAlEH7wrKl8LgQYup7mRNvCoJyM7T8f6kPwlr3F42zCZXDNF8T7y9qK
	LSuYW2BLo2myzeBJdkeW4+L52IyYddMWx0qncf6HhJqPEqcbyLSSkwNMbIYEOA0edcoVHO477PV
	XeZPCZI8SzSgvu4Vc3pRJevmixTgTO/MPECI5sTb2VVPa+ahqMF0phzOOr4qn9g0KJQ3qtMCiKz
	boqC3w2rDzTcs6VFMcwbMBIi1RvqFf9ujmo99juBvGU/YTSVkggWHx763Lgcx2dNtRGqj
X-Google-Smtp-Source: AGHT+IF7x+pGpXf85Vy38ChqF7Pkim2OKEyjFcqs8YYGtgVmrGA1ZIZ90uccF0N4NZf54XR53W2Dfw==
X-Received: by 2002:a05:6000:3113:b0:3e2:ac0:8c55 with SMTP id ffacd0b85a97d-3e765a3e423mr13059397f8f.55.1758001740531;
        Mon, 15 Sep 2025 22:49:00 -0700 (PDT)
Received: from localhost (054722ac.skybroadband.com. [5.71.34.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760786ceasm20896593f8f.16.2025.09.15.22.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 22:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 06:48:59 +0100
Message-Id: <DCTZLTRX455M.95MSJULLX6VC@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <tglx@linutronix.de>, <andersson@kernel.org>,
 <pmladek@suse.com>, <rdunlap@infradead.org>, <corbet@lwn.net>,
 <david@redhat.com>, <mhocko@suse.com>, <tudor.ambarus@linaro.org>,
 <mukesh.ojha@oss.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-hardening@vger.kernel.org>, <jonechou@google.com>,
 <rostedt@goodmis.org>, <linux-doc@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [RFC][PATCH v3 15/16] kmemdump: Add Kinfo backend driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Eugen Hristev" <eugen.hristev@linaro.org>
X-Mailer: aerc 0.20.0
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-16-eugen.hristev@linaro.org>
In-Reply-To: <20250912150855.2901211-16-eugen.hristev@linaro.org>

On Fri Sep 12, 2025 at 4:08 PM BST, Eugen Hristev wrote:

[..]

> --- /dev/null
> +++ b/mm/kmemdump/kinfo.c
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *
> + * Copyright 2002 Rusty Russell <rusty@rustcorp.com.au> IBM Corporation
> + * Copyright 2021 Google LLC
> + * Copyright 2025 Linaro Ltd. Eugen Hristev <eugen.hristev@linaro.org>
> + */
> +#include <linux/platform_device.h>
> +#include <linux/kallsyms.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/kmemdump.h>
> +#include <linux/module.h>
> +#include <linux/utsname.h>

Could you please check if the headers are sorted here
and in all other patches in this series?

Also module.h is duplicated.

[..]

> +static int build_info_set(const char *str, const struct kernel_param *kp=
)
> +{
> +	struct kernel_all_info *all_info =3D kinfo->all_info_addr;

here ^^

> +	size_t build_info_size;
> +
> +	if (kinfo->all_info_addr =3D=3D 0 || kinfo->all_info_size =3D=3D 0)
> +		return -ENAVAIL;
> +
> +	all_info =3D (struct kernel_all_info *)kinfo->all_info_addr;

Maybe assignment of all_info on declaration in the beginning of this functi=
on
is not needed then?

> +	build_info_size =3D sizeof(all_info->info.build_info);
> +
> +	memcpy(&all_info->info.build_info, str, min(build_info_size - 1,
> +						    strlen(str)));
> +	update_kernel_all_info(all_info);
> +
> +	if (strlen(str) > build_info_size) {
> +		pr_warn("%s: Build info buffer (len: %zd) can't hold entire string '%s=
'\n",
> +			__func__, build_info_size, str);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}

[...]

Best regards,
Alexey

