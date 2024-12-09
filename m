Return-Path: <linux-arm-msm+bounces-41123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC189E9A26
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 16:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C58D283950
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 15:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCD21BEF9F;
	Mon,  9 Dec 2024 15:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZuLuFD/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8E41BEF89
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 15:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733757310; cv=none; b=Nsaeu9WtPrVgKaLPqPuW9xlV6rMweomy+CEPTaVET+Qs33QT6dehx3CbzRYhup7oDejak/fGx6IYSKkukAtqTkPogeTeTFmJHXnwoiulsMNcEpDclXck0JYOKbWPs9NDjy6qgQZEWtLMGIgx238mumOqi8TQfIqRdn7mUd5KX54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733757310; c=relaxed/simple;
	bh=giYJMMFxAcT7bJn/ZT2Ij8F4WbQ9ZNFzbR5iQsND47w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=td/nCfpA3VOstIJom24yPayFZp0RCT5DvTXkQJAHxzSn0WV1C8IUe1ND2Kb69IT+8vRUl5Np/oQBVtyhVWqALUL/41PKlT9TqjwKzRNB/XFXEVDqjvQgs7oGJAQjrI16Hc9+p48l90A6PewKOiXXTIurVu6T8anHGsRYgyJxMzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZuLuFD/; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e3984b1db09so3763846276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 07:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733757308; x=1734362108; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=79FjHzmk+8gNH6FLPZtW1LA4qvljbcXHoaAkCRGOlJY=;
        b=eZuLuFD/G3Th92cexRMTs+DDBlIvMrvhQLc3Hbpfyl27Uo8QcuZ1Cys1nRN+mJWGk5
         VaClr13OzMLyTyfb4/WNa+Tkx9tqnoEEfnhUBh3hW1dZ1FepbGWTLPwJsK/0Wle5VmqH
         xiaXl05aUm4hTuHuq/Wx8D2IxKqInLkg+0YTDJQK30FZcC+3Tr5cGrP/k13FA73ow2XU
         K4F8j6Snq0t9Nkx6g4i2f4ARiXFEFuuN+vjk/XOjlt/pk9zQWhrOlaj0GmO9BgRJ3+Cs
         rG1tVWKOjgGiXdb6f7PJAEoljc00NLAPJIcBcCrWsTWH3dHix6rV+8eeOaGiqG7ukOW2
         5iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733757308; x=1734362108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79FjHzmk+8gNH6FLPZtW1LA4qvljbcXHoaAkCRGOlJY=;
        b=AwuQbmHd4wXbDPW1MtQ8Dih/8kVi77N9Y10Tv8xADoFlh7O5zP7nOFc/zTBcWIZeN4
         ZBZI3WA3PZ7h/4Y+NJvLmdR2hpjLZxcps7Y9s5bURfz4oxjUO1SJFF59PLwjYm+HBg+D
         t6tAS0cve/S8sc9eDGMxOjXiq1E8iEjuD0vRNsFyUZvseYTQv/kp99PS23yZbfoIJ/rw
         YC1HKjpq/htgLXZsmIkY5wlCjx9k5czVGERQT3zt+jzyZJO7fGk9NQp4VV00PMrEvP2M
         QEUVoc4tsNyU0ae2jdE82T4KldSw2I4rrT8DlyDQsShaKS2/6vM0mzkoQm3fjJbs8gZ6
         +cYg==
X-Forwarded-Encrypted: i=1; AJvYcCUXCBFur9xXyB5WAddKTRjNPkPo6I6WRFEEifdtxxvNRZxzftQFp0hZBireG8wGXL4vkAudPC3KhrZ2YjKx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6RiuYF6HgW4uZZyYeqN/nnHhZVsCLAjmtxC4LCz4/jjXhR2CE
	PSjCSwnTjHJCh45UM/O3vu/winlkZJFBhPXP0Wirmwjhg+IoxBXpMmXruPsHXaQ3Ql26+ogsVu4
	ylXOLIxPcUWTsc+t+m5h9MA8QThlQyIJYFg+bLA==
X-Gm-Gg: ASbGncsvoMP4DLcPo4/+CvBF4EMjw868a/Y74KfqWdqTqYYbQ64Pf/k7QJYdfftSZiy
	jRh4y+JQUyXODXZzrN85cveRYMssuTFEV8px5o16rAXtPh5bTtPxBXxToexTrO5g=
X-Google-Smtp-Source: AGHT+IFy3RwQr2sUIlpt53uiHIi1MMG4K8VGA3uVdd9gLgjmNQyY8wIL1JDnIoJTEc/VtRo9eJdlgbr7XTcFzsgGGSM=
X-Received: by 2002:a05:690c:6103:b0:6e3:37a7:8a98 with SMTP id
 00721157ae682-6f022e840d5mr10212517b3.14.1733757308349; Mon, 09 Dec 2024
 07:15:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
 <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-5-9061013c8d92@linaro.org>
In-Reply-To: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-5-9061013c8d92@linaro.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 9 Dec 2024 16:14:57 +0100
Message-ID: <CACMJSeuge3vd7UbhQq6XfFUGbCwUbEa6wOAB_u8=Ovfs7O0BJw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] firmware: qcom: scm: smc: Handle missing SCM device
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mukesh Ojha <quic_mojha@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Kuldeep Singh <quic_kuldsing@quicinc.com>, 
	Elliot Berman <quic_eberman@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>, Andy Gross <andy.gross@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Dec 2024 at 15:28, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Commit ca61d6836e6f ("firmware: qcom: scm: fix a NULL-pointer
> dereference") makes it explicit that qcom_scm_get_tzmem_pool() can
> return NULL, therefore its users should handle this.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_scm-smc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
> index 2b4c2826f57251f25a1bc37c3b467dde28e1268b..3f10b23ec941b558e1d91761011776bb5c9d11b5 100644
> --- a/drivers/firmware/qcom/qcom_scm-smc.c
> +++ b/drivers/firmware/qcom/qcom_scm-smc.c
> @@ -173,6 +173,9 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
>                 smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
>
>         if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
> +               if (!mempool)
> +                       return -EINVAL;
> +
>                 args_virt = qcom_tzmem_alloc(mempool,
>                                              SCM_SMC_N_EXT_ARGS * sizeof(u64),
>                                              flag);
>
> --
> 2.43.0
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

