Return-Path: <linux-arm-msm+bounces-4771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDE181315D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 14:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BEB7283188
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 13:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240615644F;
	Thu, 14 Dec 2023 13:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EDTSgdQf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB00811B
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 05:25:31 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3ba2e03e21cso819250b6e.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 05:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702560331; x=1703165131; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eo7TGQBzn+xvDaIXlVE1yhtwxZPi3kc+TmPKNu4tZfk=;
        b=EDTSgdQfPOU6U0gFwNy+66Yab8MPSQBA2O2DOJsfhulwvg42phVjO1IaY0Ri7+1nGP
         As3jEUfwOQOZSXNxfW3dipB/1BkBL2RZPBsjNE6GG45dSl/n1HicYe15i1QVCISzAdUz
         yBaaZXTGpP0EoyVf/A1TcWIxqVOx86T/DITauwdxMv5tI2OEnnt6H5hZMfVmch42cHkw
         5o6pDj5CgsYacZXpt0QWIlL1FfpZl07DUbBfqBIed4+8+x0okvimvxqqMifR2p3xEGU4
         IdG13ujBPiY+l8y4BVqVyetUbOSa0tnWZaQCKSitc3KNnCxrT9UF2K8bQIXKenVgu+7w
         hSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702560331; x=1703165131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eo7TGQBzn+xvDaIXlVE1yhtwxZPi3kc+TmPKNu4tZfk=;
        b=c/mTZ07tSzesx3DGcqSnA1q1vVSmbKvkdnph1fdL/sookwwhEB/5JiEHc5hdJNFiye
         lCqRYO5FkRtkQK98oyfc2r4eXuMG1JR8fRAsbt40ZIJBteHgBnpdiBPvUVgs6dg8PFRh
         wD1XQTUvuzYFxN+9oZYEp6jpW8AkB2q2IARY29TtwbtkhysoWBQlEvc+NWAybaLLiZxl
         Z6uX3OJLOdeOcKNwNAG8+73X5yLA57Stq5bRbKKy5dUTJadg0FFt1B8G47ZwwrjpepIL
         05DL12DuSgvpGwtdhe9bXFIdZp+NXiKiQ7BeJlH1Euaqa/8IwnR6quvPfMRsnPe22lNT
         flaQ==
X-Gm-Message-State: AOJu0YxaY52cnWmKhVnE24C/25x5bNKIVU+gdPvmUuZa2+F1rTgcwheO
	cIMPgkeBN8bv3Yr1JPpfo+vdky+tyOaltfNvXvjcnA==
X-Google-Smtp-Source: AGHT+IFzdyL1hLeqb8Sbzc8WcBydPWEyXrbfKDtVNXXVr3Jq/fC9bOiQavMRKtNc8m4GTFyYjRL/EATVRO2Y28yHMBw=
X-Received: by 2002:a05:6808:11d0:b0:3ba:1309:4375 with SMTP id
 p16-20020a05680811d000b003ba13094375mr5150407oiv.57.1702560331209; Thu, 14
 Dec 2023 05:25:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1353f064-62b2-486e-b6d3-1f9fcf5bb1e1@linaro.org>
In-Reply-To: <1353f064-62b2-486e-b6d3-1f9fcf5bb1e1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 15:25:20 +0200
Message-ID: <CAA8EJpr-yQyqEFGpo2hj6+s4z+W=gAFns=19=6p52wDphi5ThQ@mail.gmail.com>
Subject: Re: [GIT PULL] Add Audio topology firmware for Qualcomm SM8550 and
 SM8650 QRD platforms
To: neil.armstrong@linaro.org
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Dec 2023 at 14:55, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The following changes since commit c52dc2526009abe1a685f190423f605c01ac1b86:
>
>    Merge branch 'mlimonci/missing-dep-ci' into 'main' (2023-12-12 11:56:26 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/neil.armstrong/linux-firmware.git sm8550-sm8650-audio-fw
>
> for you to fetch changes up to b80907ec3a811aff9afdeceb7410ad408f7e0de4:
>
>    qcom: Add Audio firmware for SM8650 QRD (2023-12-14 13:22:35 +0100)

Acked-by: Dmitry Baryshov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

