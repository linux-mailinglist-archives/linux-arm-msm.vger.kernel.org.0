Return-Path: <linux-arm-msm+bounces-72572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10803B48E58
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 14:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDB8A17346C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 12:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E949305956;
	Mon,  8 Sep 2025 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xdGfxyrL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E4B30507F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 12:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336214; cv=none; b=mdpi4cdpizOVNatZiT5upHXbUXG++jQ6XLAbxtQqpJ1G5uDyUfITpJM4/fnu4O+gWYEaubyoSxQYGpLSoB5w4qW4xd94Q+ZhMy6q/SfrktBNTA0O9eem/7gJhkIlyOoFZ4llMzOulB7QAKLwxBOrjqvmXhQ5Jx5hytGOTqcpEK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336214; c=relaxed/simple;
	bh=i9NEs8V73/3LlyodLKStIRGRG21l4ViD+gJckmHEMhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7YQGQfb8hPwTNPhp8MRC6Kncp5qcKjNs1nzwxgcflW27FYwngnOy4e8fPt8MciaC8OKFda/DZnmbG+1XySOu5G3I4egJkhjKL3avo8a8pw4w+d3CC9HjeWB4sAu/yxpzn/lrJS5dZ7vwcKLOOQlngeyDxQpD/SLJut7d5ZZGCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xdGfxyrL; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-336b071e806so38205061fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 05:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336211; x=1757941011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9NEs8V73/3LlyodLKStIRGRG21l4ViD+gJckmHEMhU=;
        b=xdGfxyrLeHAMO3z7zd0IRWxxO7G2ximE/EoZc3i3KhsEDt5xjzy4pII/exmEbaMo/a
         Fcu8BXKB5vOv8xzlpFoIK4yA5efDEKRDV2YJbzOQM8HgQdtupq2vhIzgP10qRkIKc++o
         lTL9tvpgM8jMZGYuQiTYLrx17XyuaXZ51bNK61vLul7JtHq/I5FdUVuXg/pgpDvRG4KN
         ILPPfFaeurch6yEJN6qFGOtcwg8uD9pKUeh3keEW62knWkj4S/qKbCVpwlKEFO10ywdX
         Ipp7THhob7GZzDXa0woyQc+EwqrnhvoJMZmdJX4ceAog8b0W81BHSEs4cOb10Q79QljR
         I5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336211; x=1757941011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9NEs8V73/3LlyodLKStIRGRG21l4ViD+gJckmHEMhU=;
        b=uOF+xo8tJNy77iWJ1jpuxbUeET9HMnh1v+dPVTIy8PQhioSR4/mZtMYjNUUfLyROeP
         ZIzcSiH0byWBRX6lOagDURo3SaaKdGhivKReDxLUUOkUgWhms9bdDPIv3PBB3REveQ19
         nhlAd65lHob7UtneaLSenpN6YAZ47VjKI+Xn7WVml69mNwiEFS8Mvm2P9W5JgH4F5FHG
         o8d+nn8IBzrW4RWl76dSM3CxUZ9Jic38X4D6phw4eLld9nEe8nlh687HRW3/of9k7lCm
         evMWB23YiIqtY5dXWPvZunqgGtQ8jZDiJc2Mc3v+H4BVEirorz8QfI6A/aoZV6A7HY3Q
         nX8g==
X-Forwarded-Encrypted: i=1; AJvYcCWyQtMigaoUviSpcN1rq3T7haSVDux+PhuMXUU+LVn+Geub7X1BfbbOCNW5Ca1jUlOu5PJZP89K++sF4nf7@vger.kernel.org
X-Gm-Message-State: AOJu0YzL6dp18Ay8tch/4Dp2ZZs7V/u48hC8rDp8zTzj72tGTJEwti5B
	4oq/ylAfX600ARrqfaoON0BUqFHsSPKSc3C1fa5QXvq1Vuc+bHbcNy7/Sd0mkluiLLc7VyQSUu3
	g9G2Hge4DHHeHe/IYPFyLCc7xHi5lRaWvRZffYqsJlA==
X-Gm-Gg: ASbGnctgEh/L6jKjbvVv+lP18HliAPPJM3U6ZcDcDOruzB3IF5pSskHPsW3FLpXogxp
	vfzYxYE0nhgWwE4Y4wdU+29Xt+h4x9n0EejBRveTq66krW8P7I7H6jk+9adyBiC6yVQ6wxFpYmR
	hQZ7bmuc+pc7pfecWfHHlWlGrEFpqN2xkNOT1jdFMedLukjPrJ1hM4PbB91PdoHHeJzVUv8IEIK
	Q2Wj5m2+fxH3+yPh13tcafwV4Wg
X-Google-Smtp-Source: AGHT+IEJ7fijUeRwcBqhdVkGDGPkBaqhhVLbChjEuCa3TFGud0bMeF8EqC3neCfnzC7X5VYOVF0X6+vHRwRYjqQlljM=
X-Received: by 2002:a05:651c:1546:b0:336:c925:550a with SMTP id
 38308e7fff4ca-33b4fe4ac95mr22086341fa.7.1757336210631; Mon, 08 Sep 2025
 05:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905-v6_tlmm-v6-0-1720e5080415@oss.qualcomm.com>
In-Reply-To: <20250905-v6_tlmm-v6-0-1720e5080415@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 14:56:39 +0200
X-Gm-Features: Ac12FXxW5YwGL17gaiHO7OUXNyNZGzF4JRK0vQggGezgngIJlttln-n3I4WN2X4
Message-ID: <CACRpkdZsBGejSXT0D69pvwJn8smS8BGDVp_BNaa7KhrHhUrYyg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	rajendra.nayak@oss.qualcomm.com, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 5:11=E2=80=AFPM Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:

> Introduce Top Level Mode Multiplexer dt-binding and driver for
> Qualcomm's next gen compute SoC - Glymur.
> Device tree changes aren't part of this series and will be posted
> separately after the official announcement of the Glymur SoC

Patches applied!

Yours,
Linus Walleij

