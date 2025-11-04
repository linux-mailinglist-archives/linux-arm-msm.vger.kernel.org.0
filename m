Return-Path: <linux-arm-msm+bounces-80316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A7DC3154A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 14:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4596D1887133
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 13:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F432FB97F;
	Tue,  4 Nov 2025 13:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YFKkKFxn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF1D32939F
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762264569; cv=none; b=GqTvxIivDf2ZpO5Tqr0sl62UpIL+dERSo3/pCnYOEbybXPqVVIlY5T7kJaqZyjpxHtP6x01vxX2gO3CwHbv6Te+3Wtn2XX992vC0lxfAb9xQnyRoBCDNc+k55PkuokvnMZ42jWeFzj8KJXrMIV0js3xl8bzkkgZN1i4Lts5uMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762264569; c=relaxed/simple;
	bh=Nk+e5LhOXq+Tmrjv3KNGu3kVW3GltI/oydlbegPLvhs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FI47TmePJ+NjuUnbJuQfOudGuR/lSxvgFEiSVBJkxeRvGjBojrSLfS7XQ+e3EIAoyBrcowU8deUmMyplhhDjZCoxxHhY+7GtR9UZ1EMYJ9gBJ2xgxQk66JvpnE3mVGVQmKVuN5akih+b9R2IM0k+Uh6rbbJW8t1WxylxpTrO/+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YFKkKFxn; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7155207964so361509566b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 05:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762264565; x=1762869365; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9xqeXfYjcP291VncmE7WWBGfjBpgWY07soqm4ctLrA=;
        b=YFKkKFxngWlMvC/yByJlU1jGogG12tAIMhGG7cnibFQZqlmgtrlL2f8s6K1LIVhP/2
         Zr9RTqMB5HWcAG6uzSeKj1ggVZdVk1xLl/21+fLBRwctJAh0NFGQextCA8jZmKXKgEVf
         e3GHlm4PBiOUnyb5ldz1pY+qF+cCMm5QANxQBe61t/Fd3eNE9cwdMwgnSOAKP2ay4sZg
         3H0ajljobZ17yvD9HHrWlAojaDXte8U6ty2atAW+xtZEfMTj8XzoSwRzLYFIaIIoK1JK
         bltEtsSG/yAkQK4B9RH7mdRU6VGdCIjAP+05aBLAjhowjlEM0URTFzIVG9zxVbPsWJio
         7tAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762264565; x=1762869365;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/9xqeXfYjcP291VncmE7WWBGfjBpgWY07soqm4ctLrA=;
        b=pA/66cxa7N+nQLbrGTUXbI0XteJrvodgxnBMuiC8kuaCF+6Bk5WyQL4ITTa/PVlGvo
         D6ggWJQis5hfwWtNieEDY/x4yXf07Tl4AZ9OniCGEIsflqmztadhfdCiDwcuxUspGLKI
         cL6+IGifE04Ok1k7PrdTyucXNKpI91kwfKAWrGtd2xrfJM8HUlBatygfJ/DlkBpk4AOC
         UHKpicVWRjRCfM7Wi9Py9yHRL6QQT0DEv0b+qKnqhUs33BnXr1W9Mr1mm5HVth8v7Tt9
         KOG+wspBWne2X5oD3WckAe676Z51mobNzSJGYj3/tloA+Nn6hb+lKtjqJX5dcXDBwbna
         fLGw==
X-Forwarded-Encrypted: i=1; AJvYcCXmu7xpouC1ANquNw81Y2G2DRVl8fGUVyEYoXNYmF/SVioIsyWW2wh9BQyByRhxPkL1rofmqakVJBxbp8+6@vger.kernel.org
X-Gm-Message-State: AOJu0YzLTCVbjVYHWycFqJQwILSZVC1UZIgi36xlcWBqvJ28O9ghsTpi
	eteKdawoDWcN5aZJeDZBUzWRq/pXMMfLG/LW4SlFeGect0Vo2zkWIdoMktX7y4+PS/A=
X-Gm-Gg: ASbGncvNzK4cZdRybLE1WNlj5QLKT7TYDnBQMTET/v2+TKTBx8U8E6vxbEbsnYioFvM
	fA1bikvLaEMJ1poIndpft3xYd5DpBWZpgetSqAQ9yd9+UzBmrfFGrDQDeG0I1BE3SIqkUgiuFKz
	N/qOVsWoR5gFD60iE8dhG9PVE7EklcJCJbRRoMcuwQF1F5Q64KhtoiYoFlXmjT8HFCIJ+8201hi
	MotN6p0rkauuJuDSaFyDqZEX1zuVBjE6BgEWRIe/edrnM424YwUGAOL6YwGvjBBhcmv8H5PrRY5
	dVGHmGUwZyFbG/yR6Lq7ypL/xwgvzAxaFZmukD+b/5J89FQeCtJubjCSJ8KLxFgSyBKj+I0uwvI
	Ubh9Am0sFjxkJXsCaA36lJZne91LKqYhO2fwripJbzKvougUBySD+uEFjLDqQci3YcScXK8h/At
	SbZrArn91kpQ+QVA==
X-Google-Smtp-Source: AGHT+IHg9hzENV90vT/x+1SvpgnGo7dcxlkRT1qTgL5xvtzGvp0xcgTMKZtHtHlnlzzokSRFGidBrQ==
X-Received: by 2002:a17:907:608b:b0:b2e:9926:3919 with SMTP id a640c23a62f3a-b707018c40dmr1622075266b.22.1762264565514;
        Tue, 04 Nov 2025 05:56:05 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f273fsm215301566b.17.2025.11.04.05.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 05:56:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Nov 2025 13:56:05 +0000
Message-Id: <DDZYNH5X7EEQ.3TSTRMMMIXUSD@linaro.org>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: rename dtsi files for qcm2290,
 sc7280 and x1p42100
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
 <176210698627.937813.1347882402480558851.b4-ty@kernel.org>
In-Reply-To: <176210698627.937813.1347882402480558851.b4-ty@kernel.org>

On Sun Nov 2, 2025 at 6:09 PM GMT, Bjorn Andersson wrote:
>
> On Thu, 30 Oct 2025 20:20:12 +0200, Dmitry Baryshkov wrote:
>> Follow the earlier example and rename several more base DTSI files for
>> the platforms where we have (or expect) several SKU ids for a single
>> platform.
>>=20
>>=20
>
> Applied, thanks!
>
> [1/3] arm64: dts: qcom: rename qcm2290 to agatti
>       commit: 021df9dee9cd63eee1cfae1bb2381db11a1a45d7
> [2/3] arm64: dts: qcom: rename sc7280 to kodiak
>       commit: dd6edcd7d3e42b143a2f86e8d30ded62106a8972
> [3/3] arm64: dts: qcom: rename x1p42100 to purwa
>       commit: ef659a5bd91bed7fae2c2a150f8ecca06599ac03

FWIW tags/trailers are missing in the commit log:
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=3D=
for-next&id=3D021df9dee9cd63eee1cfae1bb2381db11a1a45d7

Thanks,
Alexey


