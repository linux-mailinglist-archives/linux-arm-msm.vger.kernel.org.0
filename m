Return-Path: <linux-arm-msm+bounces-17509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C788A5BF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 22:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4B1A282FDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 20:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153E4811E7;
	Mon, 15 Apr 2024 20:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a2+kMCpI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACF815625E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 20:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713211470; cv=none; b=qTc+E32ojq1qiiDxqxsoYQNgPN3yiXXCnBvdcgtvrI51VBrEwUDvjS8E/WFHBUr3FwLO2W6muDpcKdzw8XW8Rs9cJk+vZ3nku1MaJXR/+2v9OOv1J/ZOA6yXWaTPRi/kf+ronPXh8soJmg3/W5qQOBlY3Wobfz8oVAeoNRD9L4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713211470; c=relaxed/simple;
	bh=HKevHeXkZGuoEWykBFrnnyLmHY+4admTUN+lZ7NyEtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuGjlRUubpriigSxWYJQ/WJRzcU0AZbErvcDHaLrW/CYHt25NRLtwPWM2eP3Dhyzv2/nzZ775fNjE4rVTa04b5/8B4RanuJaCEJcv+CZRt4uq3JiBnWJhThzOgAwmZ5dT7pPFovGQu53Cw9lwfMy97sRpqAkDy5QGV3ps7m8XbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a2+kMCpI; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-61aaf71c495so21499867b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 13:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713211467; x=1713816267; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x+n4yDNeHcrTCJc7XCA965ghIKCFi6oK1ygO6iYz34Q=;
        b=a2+kMCpIIVUrD/mzkxfLOFdfjNSVCTHrvIByBROGwHnn8ZyCZCe4K/QxjDGPx9A3yx
         mHX/UG2DygM/BznGHKBgqdN0M4wrOf830WA6PajdZa7lNamXACjNSpz6TdaYbOz3h6lR
         RJ4/qpr70Jsi5boycQTlvJKEM/LmHY8Ry18EGIa6JWizEunDhBTuyaIvdUE9lArlXOhX
         itvNy8l76aSpUqQaEKOTBZtAGOtxqP6/eNSq0rYoij6oayP/+gjP6yFgAcDEpv77QR9l
         vQI4IswKAzFbwZ4Vh8QWlBVreTDMxOq9zWEUBekG56C1cnWEuWkOJPleqLWsyuDpCFzP
         d9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713211467; x=1713816267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+n4yDNeHcrTCJc7XCA965ghIKCFi6oK1ygO6iYz34Q=;
        b=ecIUfkqlApPgNEcRnJ0fx2Z8GW7oC7d4/UARioezJI4+29z4I6LZeXN9S5J4O238XQ
         QHlBeD7iLwmNHAiN0Q01IuFX2qkWggHIWvjj+n/3E7M0yl4CX38AMU3uUg8BIbcjKEfv
         +cL/6DPezgI/6K5kHRHjfKO0nNWqNhz6RbYdIIvWa4a5unRJ9mjUvtz/yMxXSl6wPOnO
         Kd/0t80fISy2a2NGOXHh7uQmAOe7Hjzg0DKiOMU3IwopG7qTbq2b5JlXHIJE+QHZCLxe
         PlmEby8elbCqPSzmfhpN3X4WvpINO3f3QNZ1HvHPfZBPrKmEJXMGSECYsyq01sSKhzVS
         +SnA==
X-Forwarded-Encrypted: i=1; AJvYcCWYoAp5LFYBGAlNXObuFwoohuzb89Y4bGqbb0NFZHYfBpIQXfQu2wugC3wL8Kpbej2bee25meM9Jgb4zm0hR+TZWck71MC4yZilV/0ZGQ==
X-Gm-Message-State: AOJu0YylkE4RgK+m2TNAnXCc5ffpS2rY6Ls+8/q9abmZqIeuWVEBrAV2
	EwCw3bU7fAWJgWeBiji+2NLZnZ+zFVMNG5Bl59AaDQKWl0w73tVs4dj56wakegTyrZvrfZM9E9y
	9JsxJQ9KEPp7bmsDV1ISguwh4HWVkBC5Tn5195Q==
X-Google-Smtp-Source: AGHT+IFgChYQoIbtXVFNn5dpONcRCuNNKjt9lSve7LdO+2SQ5EoJ4jqt3753eEsEcQ7mld6BIqWcJDJtBnxGz7Zk5/k=
X-Received: by 2002:a25:2e0d:0:b0:dc6:dd80:430e with SMTP id
 u13-20020a252e0d000000b00dc6dd80430emr9293179ybu.27.1713211467602; Mon, 15
 Apr 2024 13:04:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415182052.374494-1-mr.nuke.me@gmail.com> <20240415182052.374494-3-mr.nuke.me@gmail.com>
In-Reply-To: <20240415182052.374494-3-mr.nuke.me@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Apr 2024 23:04:16 +0300
Message-ID: <CAA8EJpq-UOd4dcuLyEvJNW4zckSGq1LSdq4eDMWPHX_98U8F=A@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] clk: qcom: gcc-ipq9574: Add PCIe pipe clocks
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Apr 2024 at 21:21, Alexandru Gagniuc <mr.nuke.me@gmail.com> wrote:
>
> The IPQ9574 has four PCIe "pipe" clocks. These clocks are required by
> PCIe PHYs. Port the pipe clocks from the downstream 5.4 kernel.
>
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  drivers/clk/qcom/gcc-ipq9574.c | 76 ++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

