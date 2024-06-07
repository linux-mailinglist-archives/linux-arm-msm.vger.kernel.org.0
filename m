Return-Path: <linux-arm-msm+bounces-22097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4934900D1B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 22:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 814C81F22FA7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 20:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF41018C3B;
	Fri,  7 Jun 2024 20:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="So3o4KgY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E697914EC4D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 20:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717792914; cv=none; b=ipUVmTyfScQSVFauLr/bhDoODvXfX8SCRaIIYYWfvIFVikdzZeXFTsNUNxIHXKhNiwt6hOY7sEYP3gbIA/ui4dqbKpgDu3gCRcvtfgtM4hrxZWKwK4lqFFyWqIrIIX2lua7RCBm/G0UwhKoiojkcDhDxoDYjlbzapcsScj4xrV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717792914; c=relaxed/simple;
	bh=QwcbaZoQ+Yee26Jb+ql0p85dQz9bJRrQSYUy76gUCq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpqcs/Z1dcNu87xaadJWWPUFKiq9hpgYsZ3gQRl/eNv4WTF8u1W+/Ifm4jjF8Py0Waf+HAPCZbeCV1YeeXyYJP42TbQO6S9dIVkej94x0yfKFLwfDJfguNojq6Mc0cwVnW4qe1m8/79cizXjEPulRJKoVOEJp12uCtt36TuMcvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=So3o4KgY; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so28461091fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 13:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717792910; x=1718397710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwcbaZoQ+Yee26Jb+ql0p85dQz9bJRrQSYUy76gUCq4=;
        b=So3o4KgYFADqTBiZz6AvnNANjvih1XiGUhFyvhOhhuRmcw+Q6uZGTq1GaPDiiIZcyr
         fVdG7C9LsT2eCuhMu/HLCm2f4y0VNDGKng6Iet3DUyrN7w3Ge0Mq1g0ZEmLLRqt+JyQ1
         3WoNX0xTHEvTwa4CNl/QgzrNKoXVVEI7dWvMAW5LbFyj3miVppcmesmhpxnd0E1ZckIC
         wLDx3kLZZcTI/ljk6/RPpt19Iy4ThPgUUNPEtnNm24LhPqWdv1HBoqWBP2oyqpfjMLVE
         PthV/Wchp2k6hp3p8MvoZEQPvpc931s9609T5m4lWtB3Sy5BrN/8x71IkYgipp9T11We
         6L1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717792910; x=1718397710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwcbaZoQ+Yee26Jb+ql0p85dQz9bJRrQSYUy76gUCq4=;
        b=PJyz5gSZUNQAHos/AA2qdE6nrbvH2XDuwqrTdApXiFmPhTA5soOZhQMvVBm4cbsjHI
         lYNCI6TBhbMC6plFlsGZ2lXt2x3FhoizsBgpK0Kl7QUcpY/c3ZI3ouk9gf869mx1xShX
         mM382CjOPMh7XDcZjjFpK92sbGVfNbmuB2eLGTcsEP63ABlFp8pbuEDj32CQI0w+69FD
         tKXa91m7pjCS1QlbN67CW9zytQ8eb8lWCaxX0QFkhGENo+8IGHYc8sYvH/pqVliYnVGX
         I480vJy4rAeG+jAEHMB6J8h9rf++WWBqPZrE2b5rLoUVj3N+AjEHSLMFTQHi9HBQQQgN
         Q25A==
X-Forwarded-Encrypted: i=1; AJvYcCUevvBht2CDtSOXNTObYfUJzoiYD85AbRna1lu6DN2FB3adBBHlvjfxmM+Rykd/ruGShTb5K6yt2uJrUM9aZsP+TgMm4b/PBa6/S0IaXw==
X-Gm-Message-State: AOJu0YyFFNlebaBFhSXLtQU6TY4qaQT02i6t/+UNPeFxdD9UmRYAei2c
	DDITY8TC7DW3U8kImiTQ2CnatOru3q7ZAglPuI2BbtPgi48tR5i03nERW/5WIWQ1/fjgtDf+nJo
	/n5EXq3qVvGhXRDp84ZJuspiYMQPFUSX21NWvhA==
X-Google-Smtp-Source: AGHT+IHfCFJf2M/tFYz19u9X+qNfBNDzdDdxpEaj73D1R8VEv84ZK3f41ejPHNA4IddpcKA+3ZLPp9T4DCMairlKTTI=
X-Received: by 2002:a05:6512:239a:b0:52b:ad6e:87ac with SMTP id
 2adb3069b0e04-52bb9f8efd4mr2789384e87.41.1717792910110; Fri, 07 Jun 2024
 13:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240523230619.256882-2-mailingradian@gmail.com>
In-Reply-To: <20240523230619.256882-2-mailingradian@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Jun 2024 22:41:39 +0200
Message-ID: <CACRpkdaPBDRGU=ih6YPV7CwftMV5paL4ciemBswbfM6ZkpcdRw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sdm670: add pdc wakeirq map
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 1:06=E2=80=AFAM Richard Acayan <mailingradian@gmail=
.com> wrote:

> The PDC was hooked up as a wakeup parent in the DTS in
> commit 71f080633d1e ("arm64: dts: qcom: sdm670: Hook up PDC as
> wakeup-parent of TLMM"), but the wakeirq mapping was not defined so it
> had no effect. Add the mapping for wakeup interrupts on the PDC to their
> corresponding pins.
>
> Configuring a pin IRQ as dual-edge would break it unless the
> wakeirq_dual_edge_errata flag is set.
>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

No comments, so patch applied.

Yours,
Linus Walleij

