Return-Path: <linux-arm-msm+bounces-17661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 824A98A7E8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 10:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F8551F21B69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 08:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F95126F2C;
	Wed, 17 Apr 2024 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="anB29Elb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EC01272C7
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713343490; cv=none; b=iOAGfwQy4vtpcZQh+vw0la8cohvTHzERSAMrNfEbBDSa3dLkVXAp7qKOp/KFGeGGhlULcwOY1yv6a3AQYQtlIbHr/GjNMsFpYqXpfa/6qALMpB41mG/wCLOYNM0E6IEyjAb6rTbfB1nUhMwvl1EFwJqOUZzMIJ9fWt+wZrS47uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713343490; c=relaxed/simple;
	bh=62qdf0MjfZ9+olO2ON2tKhaWuTwZqvJ4hVI3GsU0ZsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIdIp0t/BVQm2HIKHIONSh3SD+dnaWnNo3u55VD8YT48/i7nWHd8R1Dw7RXONqy8ipCJB6trrB9HI3mAJSe7IBni1Ax2uEpQQSvnxPGfQPRxIM3GkeFSB0UtPu1UGkNP73t/fjBiAnZf0kr/x2i4euY++l7JZhjWybXQlxcRHNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=anB29Elb; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso4762491276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 01:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713343488; x=1713948288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUPDHuJgbEhcxGrf9RO0YvQKRqZaKvY08c3XMxThMtg=;
        b=anB29ElbwgCn2H+zjD63i8KMz5CG+MJcqx6grJL4b7kC7Ojn+WmV2O5rlbHZscUJ4C
         s4fMyU1+lyzoIHAMRNIQhT0dqNy3v0pr1wprRF6hm0FXxCwBKmk27gT2UP4UFmlSQFVU
         hRYfjO8iOKykuRYUQCBDQ29KrNF+dehHUmmzXj249X9sBaQJSqmuBNR0QP4vlXvaMe81
         hdy0dyyI0YEyXkv2Xmj3R6LjQjFM9u9xcHLRCaZ3/fEkBNWaszyGC/mQkwId8VZg2sRu
         0ollAv6zl7qEXssBBV3g5N7kFTRHg1stBH0Bab6EGck1br3f1GMaavnETGbyu01fuqwN
         O4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713343488; x=1713948288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUPDHuJgbEhcxGrf9RO0YvQKRqZaKvY08c3XMxThMtg=;
        b=EQaiWlk2dbNeoOn9Oa30G6QKEIQhw/WG3qxNF1PQtINzQqtsLZjZxVrM8gRkj8chSB
         qQvNvCUCx70pSbjOU2YoESHjLd34YRh9Gtk5hvAlMaf1LPYr4dFEdwG+ZmylruGWq3qT
         fd/RZMNz1Sw2zcKPcYsVMCazB5YInpVnJGgDzmlZa+hHdwahVyF9YWVeLGKop/rZggvm
         P/n/Bpwad7PQRXBCsg5sdqV2rz7OSJ9bYhQCjTvNP9MhhUIOVLDdYL75MXNkz4j0Fd3W
         tlNm4OA8DCKi3CTj3JNzklinD7cCUZkhctu20BjKBKS2fi/Z9vVXEOJyjbKR2NdtZBHc
         wG8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaaZe/lEb7aFRqGXQjFimJ0ltd93OhUlHU6wFzC4Ukty/NB9gHafuCghmaVmH+/QdQZh/5W1vYHEmtpIVs/+EIg38qcN5cEmVxM48jyg==
X-Gm-Message-State: AOJu0Yy5CBqJc7R0GnMyJNsP1Edg0f7DkjMJVcKU/ANqb/zs2dCIpdQ0
	Gu/G5Ocu0evmynf2a1L9hJsw8ckcpUroSTsFyFrvo78+E3c/DFUypKH5+jj7OBxRtur1AGjPDZ+
	t8/KIW0QCb5wKRN+qQvo3SjE4h6u+vrhvOyupnw==
X-Google-Smtp-Source: AGHT+IEqHMRvom0iWLGcDMIX6MMDmGJuXm9C6a6p3VWgXb1lMC9v99HG9mosDP74t16pkkQoXUvXtUBwwTi6W1xBvYw=
X-Received: by 2002:a25:ae97:0:b0:dc7:140:8c0c with SMTP id
 b23-20020a25ae97000000b00dc701408c0cmr16434750ybj.23.1713343487742; Wed, 17
 Apr 2024 01:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411064614.7409-1-krzk@kernel.org>
In-Reply-To: <20240411064614.7409-1-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:44:36 +0200
Message-ID: <CACRpkdYDDJ9g5iSZvi_4pPdH3LWNd7PHS4QP5mkt2q+O+t_FAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: freescale: imx8ulp: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	zhanghongchen <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 8:46=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> can be built and used as modules on some generic kernel.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

All five patches applied, thanks for fixing this Krzysztof!

Yours,
Linus Walleij

