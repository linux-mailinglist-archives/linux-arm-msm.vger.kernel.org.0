Return-Path: <linux-arm-msm+bounces-76983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC58BD287F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC04C188BBAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6752FF14C;
	Mon, 13 Oct 2025 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fz2c4lHa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1A81FE451
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350858; cv=none; b=m+wnLTjoOQE0o6e2OznDuUV8aYIlGt6T6mzonzEqZy81oXK20KqG2M0zlZHNGcvaeha7eyWoN4BR4/uVntliC0R1PW3WN78LL23Mx3vwOBMAyqUPZKz6PIRyTt3Vt/+AeP04Vbm4k3f92ayO773O+68EcbusxzHS4Sr+kCe/msI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350858; c=relaxed/simple;
	bh=fcU2hvtiqOtEJL5DakbifgKs3PKbbo/P/l9WB2Vxgmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsvHKrLpl+lUKOktJITsZln2Gbjh1j60Y8mwWEXLPX3zuecJOxkoITQ7S0b8G+XOI1iaNazRA50NcHD8b1e7haaObwV2YPqDWwMfPNipYlcGHehkA6+RqAIq3nEHNd3IPM+PSJ2h57PlYN686M98KVLSJlpqYoHMZVWnlQ0SL28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fz2c4lHa; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57a59124323so4378352e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760350855; x=1760955655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcU2hvtiqOtEJL5DakbifgKs3PKbbo/P/l9WB2Vxgmw=;
        b=Fz2c4lHawMhML302WcaxTdmKakCyxrcgU71KG18zCt2xVZVQgKmgf+5vIjvgLBfDuG
         qX0yxy9yJKJlbSlMiIhz8EaWm8r+CzeLUwUIiCRwAyOeIsOUQNeffXEVotzBqsBWRCsT
         Vsze7zA4qijnrT/TcW3llTSsSAsFGALmE4Crw/v7iUGCTTBJ4VVuZWJa8WGUQgQ5bfuy
         Ic2YN2K56ftmCOSrgFAu+Pszt93hwgkakVt21PNc5mArC++DYy2YDmmJFXF94hwd7cWk
         6teGYCIFz1rCnpeGomOCDMSQNWyS74MHiYByUWrpTsC1H9Hrkol3aYp9x+H9Gli4Zb3N
         Y8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350855; x=1760955655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcU2hvtiqOtEJL5DakbifgKs3PKbbo/P/l9WB2Vxgmw=;
        b=p6vOlrSJ9VjvjgizPCkY3O66hkGHpMJMbNKZQMAN6PeZ0C4WI4PKHB5hNyheQLmhJA
         3I1oT91YeYGWyaBIbl0A1Fpp8pvReV8yvF5AQvtwKagigRE0Mi+wHNHrR/Mf79YrJvkq
         oHA45h7uB7bTxtYn0yw/8/DAI+LyrGDat63cazcOls/mVMA68JDZUX6gE6wk32wneRqI
         ANqa7Wnv4eYdWki9Y77aVjx6RNtR/Pgv7KI/eTsTRDlP2bv+MAwqP3h7PBhA+kdjCYJw
         ilAWuV9vJTmzptUlVqRjt/n0Irq5H3C4iO290zqzfrJcLWRjtl0MdqLz7suPtQ/39Gyw
         12GA==
X-Forwarded-Encrypted: i=1; AJvYcCVhb3kDHFC8YJxcmdVGJRyGRaBQYg1eJXW4QJ1fjKK1iUOIcRFYb3liXr4OEyxOZSelGuLz+FjEFRzaCjIX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj+PdhmJqkTHptAkUfyG9uu09ib5j0wxhkkq6ygWnw/0jiK4+R
	d48gjZRY8JnQQ16h2c+VsEtXaSnVSUFEZUNbApAIklzajIeDZ9ZkdvjnRq4XzE3/R7gb1y/GGij
	aZyJ7CAXCTpVpy/G8Hk0OsZWXnXls/lnj7diH5XFEeQ==
X-Gm-Gg: ASbGncteHF8TuUxJ3G/yXpc4HeVBJ9EDwGwksoQ5ij/XMfbvdUH3AFuklzyDXd1EHpY
	XlZdK520Vo7O8nQbHbfz7SOSkJDd6nDh8Gr6L7V8msBUeqX3mkmoC2XpCsMhmcuKCRb+9dN9Cnp
	I2ev8So4i/hRVERYlnuWROyczqjC9jaP/jek1b8kz+fpk33q/wEgOM29mxmGdHKos9FfH1b8w6v
	2RdFzTwZGsyh+eVjzSTO3vP0e1796bPmm0tzPRt
X-Google-Smtp-Source: AGHT+IE++Os0fqy/yAdlOz9d4PkLf+Ls3GL9g7Q3/yU3hmM5XrfEXc8t6zWUa5j0eDtIzoB0htW5M0TX+JNvYxihyhc=
X-Received: by 2002:a2e:9fcb:0:b0:372:9505:725b with SMTP id
 38308e7fff4ca-37609e4618dmr53758041fa.34.1760350855219; Mon, 13 Oct 2025
 03:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
In-Reply-To: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:20:44 +0200
X-Gm-Features: AS18NWAZSnNIZfjSNsmIQeFXxWAey48VNVaVOsP1_d-0RO6HcJ_1-u8sQfmWEbo
Message-ID: <CACRpkdaU3Y778=Fnb1K2fAqAZhuAYrCuchF_+FuHpLR9o=UNEg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: Update dt-binding and driver to support
 Glymur PMICs
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kamal,

thanks for your patch!

On Wed, Sep 24, 2025 at 7:01=E2=80=AFPM Kamal Wadhwa
<kamal.wadhwa@oss.qualcomm.com> wrote:

> This series contains patches to update the PINCTRL drivers
> and device tree bindings needed to support the new GPIO types
> for PMICs present on boards with Qualcomm's next-generation
> compute SoC - Glymur.
>
> Device tree changes are not included in this series and will
> be posted separately after the official announcement of the
> Glymur SoC.
>
> Changes in v2:
> - Split into two series: SPMI and PINCTRL(this series)
> - Included the DT bindings in this series, previously posted separately.
> - Link to v1: https://lore.kernel.org/all/20250920-glymur-spmi-v8-gpio-dr=
iver-v1-0-23df93b7818a@oss.qualcomm.com/
>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Patches applied for v6.19.

Yours,
Linus Walleij

