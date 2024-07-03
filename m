Return-Path: <linux-arm-msm+bounces-25156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC1E92605B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACDD21C2194B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B61416B384;
	Wed,  3 Jul 2024 12:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c61hXd0T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE61713A25B
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720009919; cv=none; b=fHqChsUclxGWhtV+bv4h2fCTTTGGWybBxPTXr3Z5w3LoP44jLQv6nHpgfDnvUmXaFgYGSCmeTMc0hnF9yt9BzWYkBA1vxTnupOSXZGYNsoLxDoDvMf4DSmBNvNzBSt0kZPXGqgh7fc3WikaMGX2r5kQ3Js/uZMy+KSJbkIK1Yj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720009919; c=relaxed/simple;
	bh=0WsJacWyt8E7yx/VSCN49ZeOyHeRmLxybP/jwc6iDKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+xjBOzVyV5iVlduITkTZVav3rZPN53v7fjYiQYeyJ6JMUP1wASPopJbMpekVm2Wq6yb6niYcgCoo3Ko5fG5iDUTPkj0Ltf/c+DjmxWZntkTn7S5TSvENfXxw9nyVAwwASLhkMt/JvqwCK5y+9dyb79yJrFJK3B0fHnp6d9vCfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c61hXd0T; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ee794ebffbso24219131fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 05:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720009916; x=1720614716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WsJacWyt8E7yx/VSCN49ZeOyHeRmLxybP/jwc6iDKQ=;
        b=c61hXd0Ts1JjFiDDmbj8mInwuiV7u7G7W1vrZWMmTKZi5+T5hIogFZ6/Hp3Awc+MFf
         ISnYyD06Y5XUYfAW4IEHsUO5+ZV/iIREv+IMT792WJcxnQ0e8ZFizNI0BM7wLVWPTckG
         9mnOWAjRjfq28keQVpHzla9UdScNO+Fl38jHjJYb7GA8Excx03sON/fv88b/9depkJ3Z
         vtRTCt6C6PUzkUjzb9ZFRSlq2oeD8+TdbGFVsCBTGdp0hRhRi+WwrmSf4IE0H8Y6dFV1
         ePkltkmT7y1yeWjYziH19Mpj0dhwH00343AFuZHijCH7aaZBEPYAPlIymIF4GH4CRlVg
         V+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720009916; x=1720614716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WsJacWyt8E7yx/VSCN49ZeOyHeRmLxybP/jwc6iDKQ=;
        b=pNkrFksflbQUhNCuiUYJsYzVTAe2FdhhznMExe1xQZtG9E/uVo6Lr116ki8ipX6nHE
         K9BoJOwG0RQgfDq9TLHrEbH5Sitwh587N8ehWL0plhucdmKaDUIR1SgLuOterKp3i5MR
         pOB3643tVdOX141FbBPwC48JbyvuMPgmZnoeYHKS5+lvhoYknOZAgxnLBLqA5SHFlZ34
         kfsWFXjrCefDfJP5C4MO2iIyUK9yarx0UMJ+z8XDPA3Oaod4NevOzzKRG5EWkImVNAKg
         OHDZZt+M+OMRBi9nI0ZIXgZGzkdmtFSm4UWYC0eeshdPg1uTaVMnBOC7uviJ2or6LkOF
         KY8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHza/gHTZQ/JOPRvNlMD1ti6VsOqR2TOzv60qCoEy0Ywaw/CcDuU3+FxMAeYMv9ytFwZ9SdBn7yQj55EWAqpfZK+J7tHxKkn1mVeY4Uw==
X-Gm-Message-State: AOJu0Ywh0YY71ddLEnDPYfIsbxqJIUrhknWXXQhnV8X6ox2XvBoyHKUf
	u4a7V7h40IOsiLHj3BZB3HcwdMB4WKyVZzJJJYHmIeIv2lb0o7CQnOcG+RXI47geketSQZJMxg9
	ZWAtWUB/iKde2qe9Cz0GuGDWyxe/0HKstQi+mFQwc4nTnYRrT
X-Google-Smtp-Source: AGHT+IGyU3wFEVZSUJ686bAHyx26jn9iQj70J+h9EnuMaXqU4LAFuMwiO8Tl9bWYBd1agpNYYRtBxAHFq2cglzpoNZ4=
X-Received: by 2002:a05:651c:1a06:b0:2ee:8720:b4b8 with SMTP id
 38308e7fff4ca-2ee8720b68amr10644331fa.39.1720009915916; Wed, 03 Jul 2024
 05:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627003654.242870-1-alexey.klimov@linaro.org>
In-Reply-To: <20240627003654.242870-1-alexey.klimov@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2024 14:31:44 +0200
Message-ID: <CACRpkdaxJdr-B3CmL3iUPgZHo5sTLsisrDaaBQaPpug5tTQBVw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: increase MAX_NR_GPIO to 32
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	andersson@kernel.org, krzysztof.kozlowski@linaro.org, 
	linux-gpio@vger.kernel.org, dmitry.baryshkov@linaro.org, 
	konradybcio@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 2:36=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:

> Account for more than only 23 GPIOs in LPASS Low Power Island pinctrl
> generic driver. The previous value 23 was chosen to satisfy existing
> SoC-specific drivers. However SM4250 LPI pinctrl uses more than 23 GPIOs
> and its probe routine fails on:

Patch applied!

Yours,
Linus Walleij

