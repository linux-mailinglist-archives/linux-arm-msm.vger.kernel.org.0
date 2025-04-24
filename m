Return-Path: <linux-arm-msm+bounces-55440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C20CA9B0C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E6B81B817A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE06297A61;
	Thu, 24 Apr 2025 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwUk0Yat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3442973AC
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504076; cv=none; b=HYq2XKR6hm/nVezVUvxZA/+sx1GejX3jb7rTv+i/YJE+a0U8BJahFZLIPH7eL9devhRhoVbPtLzbNTLm9EdYxSESWAA8Cv1CJRcpU0SEIAHnleWNNcfJ4482KlquzE2s0xukiEdfYM19K1GgN+nxDOXpvo0Dxc4LI5efSlQIJro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504076; c=relaxed/simple;
	bh=hc3NuIx//WjHKdboDZgQCca1SVN0OX6YOp4RVVhyM/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQQq3hAa+nf557oGUGchTP7qfAfX0TkYuzTZrg8n89L7HgEYwlQBwvqYmInPyfzGTq3RlolMn6PNwjryc5cL5WvWTt8oc1IePPERITr3B9HbS62DTxjiW0eVenRm/ZckijyDJou2IhAFU9c7p6I/7xfPY7kHISV2RWr7Z4/32uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwUk0Yat; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso9592331fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504072; x=1746108872; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DIIOezRQ1iEeyh6wP7pxRulzkeF5lSrui5rZPEB2VUc=;
        b=UwUk0YatGqkihCHcRF0WXCpJdbvOfbr19WV0vXckF6HbEABibwa4CVO/OAXrn8LE2K
         Qtjqr5hysn2lIIyCIbEd5tzTWUcvnhXssACBU8hiMTKhl2J5LLVCZGtbFLxJtiWb+eED
         Noss6jgFurG+cW6ZtrPOZmAPuVNyz8dStIMOjOVs2YWBcPdCrPnXPZApCqUEhrbkesAt
         fstmM6LzmJnQRrT/dYOSxgc757S5707GF+imQNkxH+KX9Rtap0GeOZL3ZoyqE2ZSDvYy
         ui8SWR5ZIkhASTH78Z+6DVD5xKKG6a7Jds3Z3YM+E/Aiq+tnEfHCHgAvk3UBmwW0rjTs
         gTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504072; x=1746108872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIIOezRQ1iEeyh6wP7pxRulzkeF5lSrui5rZPEB2VUc=;
        b=rdCkZYqI5pqniaVGeIH4x7iOmqCUw2jBxYSCXjZfZyXWmMsXp1UKlQ9pS/6umShUjJ
         Gep5YumNDGEBC+TTwOMZ3CpzwXSmTH05wCx2nQldoFA1zan1UM27VmK1xh962bCl5Uhz
         qhiq2tJjm6oGPn1ghyA1SgUJMnJBM0WmBSaTePBuCnEO2rH+EFL0FkjZogum0irxv6JG
         PCMqRvMWeLltcpx+mJJ9gZB9LYRBInLqXvYaMAGnvYlRJf5OUzZpPiA5bq5RAaJa0jI9
         wTdCZoZ6b8HrZuZ66DS4AJKZZeRqwEHEsFduY/kVVOWAF+Pz3lbYw9Uq7zULS1icGech
         ja2g==
X-Forwarded-Encrypted: i=1; AJvYcCWQlN5akcMkdpnrfnR9eT3aL6PTScgIlN6njyAjKg2Tb0McJ9GjXcijSbDlHXCNJO9fYHgPvyQoduoutXuS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj+pZfbb7q5g0dkFrvcA1QvyGd6Gj2q1m45iiPcaZiqBx8i0O3
	V3v6wXjE14bYSe4Ze8G1MDy4bqLXgkFmCrn3yp9EUZQ8vN7l3aKaRBcEYYPyZqmYOFOu7rnCEZn
	KO6HAh4mVAxfS3MWjn7t++TMLDv0XNI4eFeMvtg==
X-Gm-Gg: ASbGncv4C0z+tAvPSU5ufOSXx9TgUqYMjnrdGfE2Fu2HNjJOdl0tJnJEcgG7bVj9keO
	UqMV05HvjbgnEU9rkRXkeSCuxGMQ7qmemeivT6MlGBBwZ6rGruIJzuFNILwlhToHDDqa3Zxw9tb
	8qvyQP8meOmk4CqVQTjMvb4NWRmCTMHqu6w5m7ky+hqyZYeVDz7c1j+c+w
X-Google-Smtp-Source: AGHT+IGTSgfmE4C9KUY01cBQCa6U+zujjBr3JQn5JFHu87otSRTtbM+9TibC6Ub/YfaplbG5HQdBpJHJtYPG69/HM40=
X-Received: by 2002:a05:651c:885:b0:30d:e104:cd56 with SMTP id
 38308e7fff4ca-3179ffc1202mr10727731fa.39.1745504072212; Thu, 24 Apr 2025
 07:14:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
In-Reply-To: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 24 Apr 2025 08:14:20 -0600
X-Gm-Features: ATxdqUEG7UgU0b-fYJDsj-X6YeibPATP71Sc8xsrfndaXkHmANCAN6IFo1WtuOI
Message-ID: <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] of: Common "memory-region" parsing
To: "Rob Herring (Arm)" <robh@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	"Andrew F. Davis" <afd@ti.com>, "Shah, Tanmay" <tanmay.shah@amd.com>
Cc: Saravana Kannan <saravanak@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

Arnaud, Daniel, Iuliana, Andrew and Tanmay - please test this patchset
on the platforms you are working on.

Thanks,
Mathieu

On Wed, 23 Apr 2025 at 13:42, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> While there's a common function to parse "memory-region" properties for
> DMA pool regions, there's not anything for driver private regions. As a
> result, drivers have resorted to parsing "memory-region" properties
> themselves repeating the same pattern over and over. To fix this, this
> series adds 2 functions to handle those cases:
> of_reserved_mem_region_to_resource() and of_reserved_mem_region_count().
>
> I've converted the whole tree, but just including remoteproc here as
> it has the most cases. I intend to apply the first 3 patches for 6.16
> so the driver conversions can be applied for 6.17.
>
> A git tree with all the drivers converted is here[1].
>
> v2:
> - Fix of_dma_set_restricted_buffer() to maintain behavior on warning msg
> - Export devm_ioremap_resource_wc()
> - Rework handling of resource name to drop unit-address from name as it
>   was before.
> - Link to v1:
>   https://lore.kernel.org/all/20250317232426.952188-1-robh@kernel.org
>
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Rob Herring (Arm) (4):
>       of: reserved_mem: Add functions to parse "memory-region"
>       of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
>       devres: Export devm_ioremap_resource_wc()
>       remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
>
>  drivers/of/device.c                       | 31 +++++-------
>  drivers/of/of_reserved_mem.c              | 80 +++++++++++++++++++++++++++++++
>  drivers/remoteproc/imx_dsp_rproc.c        | 45 +++++++----------
>  drivers/remoteproc/imx_rproc.c            | 68 +++++++++++---------------
>  drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++------
>  drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++++---------------
>  drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++++----------------
>  drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++------
>  drivers/remoteproc/qcom_wcnss.c           | 23 ++++-----
>  drivers/remoteproc/rcar_rproc.c           | 36 ++++++--------
>  drivers/remoteproc/st_remoteproc.c        | 41 ++++++++--------
>  drivers/remoteproc/stm32_rproc.c          | 44 ++++++++---------
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++------
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++------
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++------
>  drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++++------------
>  include/linux/of_reserved_mem.h           | 26 ++++++++++
>  lib/devres.c                              |  1 +
>  18 files changed, 339 insertions(+), 369 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250423-dt-memory-region-v2-a2b15caacc63
>
> Best regards,
> --
> Rob Herring (Arm) <robh@kernel.org>
>

