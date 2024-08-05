Return-Path: <linux-arm-msm+bounces-27901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AFA94760C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 09:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFCAD1F21597
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 07:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B996149C6F;
	Mon,  5 Aug 2024 07:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XF73iVkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D372AD04
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Aug 2024 07:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722843047; cv=none; b=tGXSgXIsJSprB7XLzIYBh3AHU/QFepmQmQvftGhp29YedsdLM7WKgM1gOoDqQyS50UB4wgEyIh5mtNDL6U2Oyhghk/m9bD9ke9fBwdoPdhLrQyGNLEPUEowoTfCWbIqrqdswkvZ96o4BbydANIDsE0aWT5V8IJWcpgspyzh/8zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722843047; c=relaxed/simple;
	bh=L+M74vZQeXrFJ7Zs9DX32hy+TeQGQ8+ygEOks2os48Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tixVFmvc6x8sKMyubQthbCLiDPlRS+rhEgrFQ3eoGrgi7YQxQrrma8f4EqqDw2y1XiLEX/c2L1uFm2hENBZrMje4a40fT/QbM5UOHzwg+xMsoTPqDmuSxH++qmoInrtV8nk6oaS1zUwYXcYkXS84fyMQbW5tCqIqFqPSyB1clkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XF73iVkY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-530c2e5f4feso2413227e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2024 00:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722843044; x=1723447844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+M74vZQeXrFJ7Zs9DX32hy+TeQGQ8+ygEOks2os48Y=;
        b=XF73iVkYJ4aSevtwzG0icpxYqTrEHr/7hMEdm83hx9XiYNGssfTeI5S56YwrnT0ok+
         PVbmczyH9pME0SJSZ7OZK5/000zafPMwwNLxQ82oasVOotgvnwEg06s6VRdXH1JErnCZ
         YMK5SCo1mO/btqxfwV3iK8c2Y7zBli/N17ri+CYWvbTAJYN1yV0DB03Vdf5g+KoGScmX
         cLRzqw3mRRsKbDJ0E0Ky5xcJtv8Ws4TdX5g2oWKts47pLVadVF+fcrT5K4/U2JSM3usq
         4i4C1zawRFeUU2jxsbNDkdLBkrwNR6/KWI63pMtn+sFCamDsvW0V2qTtIxQ0wDQ9gAoV
         sPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722843044; x=1723447844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+M74vZQeXrFJ7Zs9DX32hy+TeQGQ8+ygEOks2os48Y=;
        b=mhghLfRRn7I2BD+4VCzyC7GIfAqocuXCV8Lmw9hrv60owXQWk84eXCiKuDpdh2AoOU
         3/phhBR1B3dW2YG3vsKjB5Lqmt+B4JfTtH4JUA1xWL9kCwVXMZ2tmz2x8+0ANJVtfsdL
         10DLqOPbl/togu+bn8pI7CY2LQoAmQzIzu9ewGtOXHVyI97I/a6vnTKcjR8nK/DfD659
         kaKSFVKuXVmO+W153ncmQpATWXWnqHNuC3X/3L4cOxCFrFJ8BYZjYN8NgJeeqrahcofa
         Y2VbgykYKxcrM87rkdsIp6fjs0apVR0yOWDSV4y8kyTvAN2BoEDXCtiAENA1X0SDL8fI
         oKAw==
X-Forwarded-Encrypted: i=1; AJvYcCX24y7Q8ehV5gdjKrmHm/FCZK3ndDm159Mu8ZbFAGt21fmxS5T6+atzpVplCab8LcqVciDF9bhAiDjs9BFYDsughdpqqDLkDy0BEeWWMg==
X-Gm-Message-State: AOJu0YxxoTho3JqFjOgYvEKZd0vC0Ylxn6NQIeKXZKFfAzL78iWIK9pa
	ekL1VVoj/jpCMVxstfEukIa3WLC2hiEGPST2QlDa0LBHCw7L4Lyll2GnTXzdJxT6aOcUWBU3yS2
	Ymndfns46+Nc8rmsUXwa9msSKk1ay7dOJIsmlxQ==
X-Google-Smtp-Source: AGHT+IEjQ7ricigROxn0lScb+/voP0agJ/MZ7YuI0SHXP9zdAk1F7JKQWvMDbrukfXWtMUvvy1y/l3/yOr5Dw8g1POA=
X-Received: by 2002:a05:6512:e9c:b0:52c:db22:efbf with SMTP id
 2adb3069b0e04-530bb36f150mr7789093e87.16.1722843043651; Mon, 05 Aug 2024
 00:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711-topic-x1e_pdc_tlmm-v1-1-e278b249d793@linaro.org>
In-Reply-To: <20240711-topic-x1e_pdc_tlmm-v1-1-e278b249d793@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 09:30:32 +0200
Message-ID: <CACRpkdbNEAjX+HBGMSfzoD3ykwfpMHbXoOfERcEjPbOC5-TbzQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: x1e80100: Update PDC hwirq map
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 11:38=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linar=
o.org> wrote:

> The current map seems to be out of sync (and includes a duplicate entry
> for GPIO193..).
>
> Replace it with the map present in shipping devices' ACPI tables.
>
> This new one seems more complete, as it e.g. contains GPIO145 (PCIE6a
> WAKE#)
>
> Fixes: 05e4941d97ef ("pinctrl: qcom: Add X1E80100 pinctrl driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Patch applied for fixes. Sorry for delays!

Yours,
Linus Walleij

