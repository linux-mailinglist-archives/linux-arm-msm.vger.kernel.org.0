Return-Path: <linux-arm-msm+bounces-75877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 627A6BB67F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 12:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2171A4EA9B6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 10:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920882EB841;
	Fri,  3 Oct 2025 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yJQobbHs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E076C2EAB89
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759488951; cv=none; b=ehfZvQq//cGMgJwOq3o+jhx569ZHiVbtf6/PifGcFG/hI2baAff2mV1dUOwb58+ujTKKuC3y+05CfftcCeZd9eRtkqrFPGlGHuEWKa3OwmC3I/p/yMQL63De6r7b8Li8q8o3l7SafxoWUMTP9vw6hUS0OXIFObKtqqek42dOYQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759488951; c=relaxed/simple;
	bh=KChLKSNNxImhmb85Mo/OCLoDmoiyuSxlxjqr9/wUHno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eUvHG75YL/itqjdwr4JZpq+cSF+XOK4r6jJ7lg+lv8laT8UpaTniyHXPjRYS7uf8LLuBjZpSD+7scSLHAX2jhvMCnoeVs5Vxiw6kifovxFNkinODktmgvQLnswNiE/Zuvy6fk+d38CTHP1cx8WNTxBIYry3KENbfukTVPz3dcBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yJQobbHs; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso2897921e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 03:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759488947; x=1760093747; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KChLKSNNxImhmb85Mo/OCLoDmoiyuSxlxjqr9/wUHno=;
        b=yJQobbHsF+Nyb4RPYgZr0NJ8omtIWZu0ESZxpaPEJ5O0eZtAoE6/LFCd4vmK86M/WG
         mYl/e7IdYmKEjHAJ0hafKhyh7E8fde6npBr08kV3K6cOq85IvXtfqsA3tkN/H0AtsHfd
         t+iNJ5nzyikfGed9kayawce/D8p34EH7RmD8SoYDZbxy9RVy7Fx0O8HNciU4PSSg+5BR
         y3A+EscyVsHK5+yCD3Xr8emxPvkF/4FY0gyVHRgEsGZRe1lyU21GhKfP7OAGxiEU9Z6A
         TBnoO2rDirBg2hyA4GFDrsH/KWOxiGpwRZ38+SHNoa74yU3lP721V0D7tpJqBkmioMtK
         FEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759488947; x=1760093747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KChLKSNNxImhmb85Mo/OCLoDmoiyuSxlxjqr9/wUHno=;
        b=YBDy7umcZydSc8z7hNB3xKv+kWQgKAHRgEG7AWdQA7a6Tedo75QyypBUJodz2Z970W
         QhmhlLHRwSPqVJ1pjpscUy6ySEYjtbPLLmBzam8DpiFzbUb55MDpoIPaTIHlniN3bA/e
         UROb+Vvo4st0KegVf1KQQhm/NUGS8TpUD+NlWRbzAdETMW7YP02ez41RQ9xDhgzslNiT
         fm960k3SorAXSrTktf7e9TLsW9fbyKPCj0AW+Ovf8E6xl5mBU2pWGqm8ww1YxFlJwOFI
         oQ+C1lg/Rw4jPDB74MT3YFMrji7LrA/KiEEF/nupsZ1WiaKDQl5s6/S9v7e1zOJdypaR
         XLUA==
X-Forwarded-Encrypted: i=1; AJvYcCXRiYRGiMnhddOfpG0hw1MWffH6Rl2cgBQbjNYaiLgU05EOcjIAH3TYug9cIyjCLaP/GVzN/PFINqVaHLiu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3tkEpYBWh8urM0IC8k52v+bOO2cSrIlxPaPqGh75TzIyN5XTt
	8rZUHVZBcjXIWnkZcJQJcl65qJvG544bQ7ya/zVif04YpaFR9/rg75tb5p0VWq4P/BUHz7bMpSG
	QzIP76slfyfphpBLMyy895x3sS76jBlYsvsQWLWI5DmJFkJFHFBHreqT8kw==
X-Gm-Gg: ASbGnctBNnG1KLsiDJzBo+fz9PlWw/rqKc1Hsh6qOAynpc3m5vV4f2Hju7a3CBm5hWV
	9igpxnO5ro3neIsXzd2HCQFYkjESieapRdQ2BzJ+WygsQHs5PGelxVYP4dYIwrGsRGpcWcxbbwY
	I6TAveG6rcDbfNXcLsSse5cnsNt/GQXhmc+eM3A+GfSBpnmiRWKW7ABnKbMVuxftuP//3YBJ+Dc
	bnq3yQdHpyLH60wE72mdkTn/owJkEJLVHCBjc1Io5DhL1qAZyGkFW4PtrlhaOY1h0+nXjKx
X-Google-Smtp-Source: AGHT+IE+mDtAHcj8cofetU5hFSC919BiuXGPbquu3PKU0UznoaKUN13j3pgLN59a6ZtfWEBTY/v4Bw3wEb2vT1GSTdc=
X-Received: by 2002:a2e:be25:0:b0:336:c873:1b10 with SMTP id
 38308e7fff4ca-374c36cc060mr6748801fa.15.1759488947068; Fri, 03 Oct 2025
 03:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
 <20250924-glymur-pinctrl-driver-v2-1-11bef014a778@oss.qualcomm.com>
In-Reply-To: <20250924-glymur-pinctrl-driver-v2-1-11bef014a778@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Oct 2025 12:55:34 +0200
X-Gm-Features: AS18NWAW-daWoNVINmwOmpTVjv-RaNkrGx2GTsWudsPfvxarUw2lB4KUyWnktIo
Message-ID: <CAMRc=McSfXDmObrBeCAnawe-BMB+824yEbWR+4vxJai9-n9+tQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: qcom,pmic-gpio: Add GPIO
 bindings for Glymur PMICs
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 7:01=E2=80=AFPM Kamal Wadhwa
<kamal.wadhwa@oss.qualcomm.com> wrote:
>
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>
> Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
> to include compatible strings for PMK8850, PMH0101, PMH0104, PMH0110
> and PMCX0102 PMICs.
>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

