Return-Path: <linux-arm-msm+bounces-64632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7B7B02380
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 20:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8084E7BF24B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 18:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9192F2348;
	Fri, 11 Jul 2025 18:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NU+AYmdS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379421D54E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258071; cv=none; b=fQWChlqulO+AbSPFpYdMCsRbg1f/tQFVfpyaBcBxWn3/rBr1xRnAXirw6Y4X9kV5RTnH55FAWDf7A9cZQIWbGakLTWTjgzKpUktQMdKgdhTlEsmsliUiIJawcfAXkfMW/2vF7QhZdT2xOGM93JJmjzCVkznwJ0kpd41ML4IiNss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258071; c=relaxed/simple;
	bh=9pueYuEIoRhh8Q7SXjsOxjLRBOEiyf+7/9ZBmo6ZPtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kk3TinK5rfhyRnzhDjxqs5QcFky3U4HuupsAxIS5SeudFY7RPGXlqZ86qznpWKmR9+LJWsr2AT+MBM0RAfWE6DVi3ZjRd7awqZz3l4Th175dt0VLtpi8Xd5/tdefeMGnWOzCnqh+WC/Fw+qte+C8TV0WWbxpbY/qPDCrLKfOEnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NU+AYmdS; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so22129421fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 11:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752258068; x=1752862868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFonXyBEBu8bBQGRWXHhhJM0VZMeyX0O0WVctxeWjqk=;
        b=NU+AYmdS2Ww6aEAAyX1OFL3gx8fQMdj2FV6y1Bf3NGinK9IoKNI4s/wwdWq1Trt6wM
         Zx0EwUktzxHcXtEplUngRUWRKxGY1nDWp2u2W79DZqKn8t6zv/lUi43WssItoXrnOGrF
         UcB5OxZBwf4sS2l3d+YxdFlf1B/hSCLWarNX6jNDVvKG/i2WPdB9k5NYgp2Z8phscFqV
         GWnf6n8iHEa2VtI5/H9AKNPUue7gblqgGzl2CMLGJVnzABkKTpXH2PqbmX/PKrCoAsjF
         MZBfgpLRR36M/3pczQhVQMozYmPWyRGvX9xDv1hZHHsSq9FNi7rZRK8y9LAmIk27HNqO
         f0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258068; x=1752862868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFonXyBEBu8bBQGRWXHhhJM0VZMeyX0O0WVctxeWjqk=;
        b=CUaIqZ7JMGO77kpPLu6KDiVjTy7MfSRDZ8YeyG8m4mz2t6D+DrI4LhkgrX2QV9+CnW
         f1dZE8+InqSt8T9z05fQgEaIdNc2w2315lcivK6MxPpuRjLRqlTNeYMSP5iUufnNdhn3
         u4dtB9/hj/yoOYAYv9Ndf7Dl+UVLNEEszCsY5PLFdrRqFZegzj2GF+YGIHONsZEyCGI5
         vZtucXWjjLEpnCt+FYzd+v0cUD5FDENHelZMco+4fyVA8KfoDfgzkwJJjvZHfL6b+BAV
         YKySgYPcQ+Vu9fXmpYr53OAp5JqTQi1+d2DTKidT1Zltwu9YvPTsYjx1ZE+4CTM2x/qR
         WGCA==
X-Forwarded-Encrypted: i=1; AJvYcCU4UZc97W1caNF7/QZTHuEPDICo5djJ87iGpdIfg60ae+ZD1tCxyyYKCr+9wTlFQM9P1WJRtXolDGQbNmqM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3VMbKT72TbpflfIpatKpyWCPnJnq/uYNlBbN14YpOgrp21HJB
	vK8Qpf4A7ZVQe9cSK1txdTRwKvt2xfeL2TRWp0qXb3ovMKCnZNdOsXzd/GcGpmzVUzTRvDaXsU+
	E5HFbjhI1QkvCDNs7ZbjnxBZE4q+Sp5ju//7FW9biWg==
X-Gm-Gg: ASbGncvTXf3lkv4jsdo0O8xeUmIbEljvnlz7RA09yojv2Kfp2WwMkFuUGrwjmqMntIo
	ECDTHgjx33yzj8ciA7IM8hDgv/QjIaX8boRZd7cNoRrF4gQikqU8k5XLW+x7Jlckb9fi6Sc3UNQ
	lcZuVFEVRh9gOq+ajKa5rDDqYreZuG1yAxmXpM+TrXP/2CGtUGMcatWku5lp3wMStLDmraOOUpc
	CL1F4Ma9/aieQc5Wg==
X-Google-Smtp-Source: AGHT+IEvkwHGOLQfSLv38NyMLX/duDgiOrEo48zv9nOud2f/wZg6mazHn+ZXSSe8h4+6KW3mbg6mMV6T7HPqsPw49Lo=
X-Received: by 2002:a2e:a007:0:b0:32a:7d61:ded0 with SMTP id
 38308e7fff4ca-3305341307dmr10521881fa.19.1752258068303; Fri, 11 Jul 2025
 11:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
In-Reply-To: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:20:57 +0200
X-Gm-Features: Ac12FXwUK_6BkBTiMmf0bIqwdADNOgyJE6d12NaL0C0nqmiCzFyAn5E5nDpYZaI
Message-ID: <CACRpkda-ssTEJqcj=vxnz91rj=qYz_rer5p5Db_b=pSdjUj9Ow@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Add support for PMIV0104 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 1:22=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Luca Weiss (4):
>       dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
>       dt-bindings: pinctrl: qcom,pmic-gpio: Add PMIV0104 support
>       pinctrl: qcom: spmi: Add PMIV0104
>       arm64: dts: qcom: Add PMIV0104 PMIC

Patches 2 & 3 applied to the pinctrl tree.

Yours,
Linus Walleij

