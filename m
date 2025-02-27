Return-Path: <linux-arm-msm+bounces-49622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47515A474C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9D7416FCA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61BF22C324;
	Thu, 27 Feb 2025 04:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ybQgXjgz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2650D22B5B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631073; cv=none; b=gXYZn4taBZTNsZOMRWIbXgR2aXWz1Y7UIjUWrr+Q0KGKidrtMRHBC3xTveW7gJYYL4rZWFcF1kGqWFfyb2Bw2p2FpC0QT4hm4V7mFe9zly+dm1+IUKpdWJVGcuDh7hZpO8clE9PGrtSTone7EmqLEM0pFWqHyYLG60Iq9PGyvJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631073; c=relaxed/simple;
	bh=3jBk0MgEeBJiMl0PisR+0OksYxGp0Jvkm/YSGldYGlg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tdwQNVRFelQwAegxvXrKwFQ2nBWazD4iwKrG2TLPek2+6M71clSjMHnYSW+r+VGkolYW5hHavuTr91u3Jl4VYY3xmz7+iolOnUHIAdQ6sP5SvfT10DhLncWESA+jCOiS93E04RDVtfs+EyYUgjyaMOlMjwUGCLofBP1agcK1nlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ybQgXjgz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-545284eac3bso418307e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740631070; x=1741235870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6LdIc9yizVRu7YYWVAkfBn83oMhAPA8mxliRfutysA=;
        b=ybQgXjgzfKWFRPmzvAkBz0Ba++ft5yR8ckN3xb2oL2UDZMgv4nL+PLdZZ2KirfFQe6
         tKLOSvog8Z3fc5PkIxsTKb4IcDknacjZCpRiNILC4hFAdnOpjp1DcxY23DZDxrYA1gpb
         baCJJclES8HNpVkvEObXjBdaZIj68BPJOONGbxpJP8wFTc5/XJlPSNom3DYg6f2cJbHu
         VdsHRqv2rjYKdemkdUF45zxCMNqEWkEj+rG0IwYr1BkR4pNrHI9Fpj61FK5Kmtho/iaZ
         aRrZY/ZcPcvDWVC2XxMsSBcqToDlh9B9e9n0GegNadeJ8zCYnTYnY7FR6759DfbzGQsM
         Bv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740631070; x=1741235870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6LdIc9yizVRu7YYWVAkfBn83oMhAPA8mxliRfutysA=;
        b=cUdpJDmVjNhso9T6Z9JBygwZXS9XT6HXiaauObgQvtqEqbPUmuQB8KNNzY8xkEr2Fy
         fXweoKSCtTb75TbH4nJNJGNZ7obbrRhw5ehIWke7wPrTwENz5T7hJgyZ9WfGdJtSuol/
         C751+GwwRfv6NmwQSRulBAmjW/V0PkQS7oSRDNZ4cGAGGZh+t1nG+tDqAMzFhPpNrCgi
         zogR+obSyD5t6ZqMO+Paugcuizkst2BJBLeRtDEvWj/bF62zwV/1gIoe55aKi7tXb22P
         +VO9iWS9Swr4SGtbEN8e21f72FBD65/wJJF/5UNPwTCsg/ccIDwnINdn3u9aeCfbVSfI
         +beg==
X-Forwarded-Encrypted: i=1; AJvYcCWLeqhIm1n86uNlZ66hfqeNV1uBu1D3fK8OdNvd/F6h2kTpF+ZMz3AJJtzyDDDIbCSXB33PycBwuq9CpIYl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj+5fPa0f2YctDo86LS0atYeQpNV3ndadDfuRfccxSMfv06Jpu
	+8KyLrDUNmfIgD3a5/sVBrPNETA4RkzB5lzAHUvHpG+dawCiBYMJ6Zb4Q9zd+5k=
X-Gm-Gg: ASbGncswpJYO6z2nwlUBRVbNOb3N8ovK+FOTHg4PQ6gxlLiPX+JTj7rXL1TbPecOwI2
	g23OyB5vHJ8zoZYEzplLdFyxCvQVflGGPgZnTS7O3EHLzFiOxOe5Y8br/hQLK8NWbM5dnMBHtpI
	L4lblxt1vnbMRUC6pgdVudfTxdR0gkiCPyR/mtWY8gpS0lRZR2Ej7fPKv9QuYxI0ICf8tUc3Kqg
	MyZGYRfAqgkWPbsntLga/cE4aL7r+IDaa1g3+WY4VKeSHWbQJXf6suy4vsXUrPLq8BXUILyTtSd
	NPn/lnYW0kUK1qSmbqO57JnTqtcuj76EAKdFF6dHnQ==
X-Google-Smtp-Source: AGHT+IFVfY7P3tdpU/L92xnHX/l/Kg0ZrZYS+uJyaV20SbfgsFQttCuFyDGhgqjNFTbnxyxtm9a5Og==
X-Received: by 2002:a05:6512:1389:b0:549:38eb:d68b with SMTP id 2adb3069b0e04-5493c5adc66mr4548301e87.33.1740631070243;
        Wed, 26 Feb 2025 20:37:50 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:37:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] drm/msm: Use str_enable_disable-like helpers
Date: Thu, 27 Feb 2025 06:37:27 +0200
Message-Id: <174063096235.3733075.4349530732188818370.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114191724.861601-1-krzysztof.kozlowski@linaro.org>
References: <20250114191724.861601-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Jan 2025 20:17:24 +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Use str_enable_disable-like helpers
      https://gitlab.freedesktop.org/lumag/msm/-/commit/25dc6948a06f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

