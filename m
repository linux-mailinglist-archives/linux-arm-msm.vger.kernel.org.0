Return-Path: <linux-arm-msm+bounces-74999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF431B9DF22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9692189547D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A8726B77A;
	Thu, 25 Sep 2025 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDGpIb/A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E615B25F99B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758787204; cv=none; b=DLxSx4OAgR0zYFxjMeysc6FRQKMnlFLY3w3FrfTDIvBWRGq97Zc833PvcHJ+V7xTX6lEx4Hlm1QJFGdM24lsvtV1owIwoZtlpXxMPS/boN510V1k4F69GE9vXtU60Dk9pffNoc0bHWAiAJk7bKu7aACFiW10QUlf54rfeTMln34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758787204; c=relaxed/simple;
	bh=7qXdKXXOsj0mvp6ytAsYFbzyCIu8LnQTBYD8CUaSCz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dwVd7KesBNhmt8Glrn9yVQpMYBCVbs4SwYYoEVYZVhk41abcNo2mLz+gvrspm9xEM+ebBRuSPZMwaTdpVN7RqiS9OW4KredBnNa4N79n/h7oE+s61b+HibuyhPH8ZkF08SBYfgvxd/1gJWpRohTneOLwFYTNaEVaxNAnuvfRi2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDGpIb/A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2FEC113CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758787203;
	bh=7qXdKXXOsj0mvp6ytAsYFbzyCIu8LnQTBYD8CUaSCz0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gDGpIb/AAHY7BmvLKQVhAkPud8aOgjS4lwAZVKL/c0D9vKFEY6buXdXdMSDSGbYkh
	 Y55KcO8/FLAM10DagOmLS52vDjXhVeRYvS0YRWNZDmfvYCnINnNkJrNoV3ExvJO+t+
	 8s3il0QLAh8Gs/+LiyBJMYWnbk2DJ2xvnsi5T1uq3KxFTKycah32qLHwi/jMS+g7HV
	 X41N95KgdzS8WSk9O3bIetWSqrWwlhbQJmUjCHInrYGUTeBqDgwLj0rdwCiPeiMjAD
	 VNtTTmoXIZ193TyAwYmpPC/uaCqLJtU2/TcqTCscXDK7Il1rn26Jcckx6EzdjjzJ0G
	 /TWe09pr2g4pA==
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-26e68904f0eso7699635ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:00:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjKehBa6WJheVaGE27mp6NrlFqu2TrmKcqzjQk+ZMHxmkQvuN+hVE3cz3pvdXy554ZuJsN/qcLplicDny8@vger.kernel.org
X-Gm-Message-State: AOJu0YzsmzLxe2SuOL5slINPfbjYCSjOpubLk02jJAvZ8ZBru+arkVfE
	9UbbZl1VeYcmQK/IbpcMXBEVPq6qMlIi1CUVZGhTVxJnmXtK4FWmuglJi7B3V3fqzJWWlV71NW6
	+HX95uyQKg4YrdMbRjSFMDd23WCZlW2Q=
X-Google-Smtp-Source: AGHT+IGxDBHtzG1y1A8TxRQbHxlM/lh8MnNKtE4ficteSKY+voap7OAQFkG5IBowYYkJPeYygmSjFYWgo1apHcPTyJw=
X-Received: by 2002:a17:902:da2d:b0:269:8fa3:c227 with SMTP id
 d9443c01a7336-27ed4a06e11mr23701865ad.8.1758787203055; Thu, 25 Sep 2025
 01:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com> <20250924-knp-dts-v1-10-3fdbc4b9e1b1@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-10-3fdbc4b9e1b1@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 16:59:51 +0900
X-Gmail-Original-Message-ID: <CAJKOXPetzYdOvYkzeWmm9pVM1MwJhng4JLn2jsoAuey4jtfrqQ@mail.gmail.com>
X-Gm-Features: AS18NWA6NJniyWWr3aNedu-4COuteCGePq3qztUQX6xR190EEmJVHXNtBeSXTRw
Message-ID: <CAJKOXPetzYdOvYkzeWmm9pVM1MwJhng4JLn2jsoAuey4jtfrqQ@mail.gmail.com>
Subject: Re: [PATCH 10/20] arm64: dts: qcom: Add PMH0104 pmic dtsi
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>
> Add base DTS file for PMH0104 inclduing temp-alarm and GPIO nodes.
>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pmh0104.dtsi | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/pmh0104.dtsi b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
> new file mode 100644
> index 000000000000..f5393fdebe95
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus1 {
> +       pmh0104_j_e1: pmic@PMH0104_J_E1_SID {


This might be fine for Kaanapali, but it's wrong for Glymur.

We discussed it already and I'm surprised you come with completely
different solution, not talking with the community, not aligning to
solve it properly.

Judging by other patches sent now, I recommend to drop it.

And instead just join the talks... Otherwise how am I suppose to look
at this? Everything I said should be repeated?

Best regards,
Krzysztof

