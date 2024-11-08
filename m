Return-Path: <linux-arm-msm+bounces-37368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 998899C27C4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 23:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15F1CB22686
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 22:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DBD1E200A;
	Fri,  8 Nov 2024 22:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oiMLQm19"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A641C1F0E
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 22:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731106170; cv=none; b=ZFNK+8q40smv69YIYqDyFT86X35soki20yzMq2GCUCwKouGc/ZlTFVS0SXLsEVKEGYixQmI9x65iDn13jYv2LuOQ4Sq8PUrXOVuwO+pk31N0+7iyBM2C8WnCW8nQsM8bLpGmyQEV/VknrwxsZcWSskSYrVF/6g/vwj6zfG4zgak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731106170; c=relaxed/simple;
	bh=fnrkhe8TaQ1l/3VdZlmr9/dllUYARg0Pzcml1/ngw+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nw4M9ELoUfSGRZLlx4PfV5M4O1YVTi+BtlZu40e+TQr2IY3Kq9VVZQtEJX+zV4Fhg10irYVHYMHlpCKg3C6saJI+TXICFAlohp6lg5gRKf9EpfglGT0rVocxdn5ahik/jfO6bJvEohy0n27shhZEUiFBbHhTJlNF3LhHJJqngT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oiMLQm19; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e38fc62b9fso23978707b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 14:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731106168; x=1731710968; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qSBQVmACqUTbTDk3RCcuhyjlRE/y0cfNYPF2dNV1Uek=;
        b=oiMLQm19o4BVy9YLPfk5Fju3MGkigMFfejyG8FsjMBVId5dEAL5W4zW7FsVye6C3Iu
         g/AQr6OeQKb+byMt7nWZdldldyUWULW+zeIDERXjT39hWwYs5kkerYaL3Q2+3K6/Cryb
         sNIaYl7AwHqQRxFn0GvR8l9EAsQSziYivsiTD3hD27XqD/BoiDb42OA58ovsAsE5HeNu
         3auDY3EziUG/OLm0pwPElVKUL6V1dU4UHB8mB6kiIRGSGYa7/QbHT4uCDik1gGhKzQnh
         hjxO6nK46Nf80TATtTzUnKJx/bzWxXiT5y9Zvk7ipdsB6dO1GbASrCU9eo/yibKFPb+H
         KZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731106168; x=1731710968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSBQVmACqUTbTDk3RCcuhyjlRE/y0cfNYPF2dNV1Uek=;
        b=DWPPFBvDUDEAWKQ7iB0laFWA87UrrS4Rc2MDyewJUh3TqOt88SLawNRKWcdR6Hnw28
         P3ZZvOHFHFuQMUAPFUcKS6q9ESIKTAExsDTXmnjxbstbw2CCa+pyIQZDWRra5mKlyd5J
         Pc+sS93GtX0IsFcAOSUKUNcFfZU3BBnP4xk9svwOJsQXHclDIclU/qb72vAWnzrW5qL0
         8JVSofnt4SRrAaq3GmdTyumNlL66UrKhh/3oSMv0cv3yrPSoaE0aWDSx3C6cPY5hF1rg
         WBDTBwvWGITSWukU5OufvhrXFvKUfpEqiKm97BFILyrrVVCCQ8nc2kEUKsJpKl/mH4S6
         reqA==
X-Forwarded-Encrypted: i=1; AJvYcCVowhGLVnFVzZgIYw3PISQ17McR3FfLcBp7RapyxZuHccDRCAko45mGfTmh1ZeUWTzFxWs41vTZVdmj3v0j@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4yLRysDn1ng7UTpOJU+MoR9EMWE9MPKox9NyhXiXcAk9F0wX6
	sKvgtLB3cJkNvjEWnQYSJa0bDwiLN5eqvXwoiOvJHHJcveQdykdSFD2c+i0YOBs/+wMolrRVOF2
	HmXeoUVykc6EVWCJOJ1krVuH9Z1aYX48Yuk+IaQ==
X-Google-Smtp-Source: AGHT+IH4tpHfN7a6089tjUF6WTZojFqAuHw/WE50022OvTS0d41/eF6UokIMdvNNzOUavomqiSkkLArgCl3qa0fbIi0=
X-Received: by 2002:a05:690c:88c:b0:6db:e280:a3ae with SMTP id
 00721157ae682-6eadddadde0mr52739937b3.23.1731106167960; Fri, 08 Nov 2024
 14:49:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-0-c1e173369657@linaro.org>
In-Reply-To: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-0-c1e173369657@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Nov 2024 00:49:16 +0200
Message-ID: <CAA8EJprX=2i335rm5JovkBYAYd=ku=yaNgFJVXh03BYEantGAw@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: x1e80100: Fix missing address/size
 cells warnings
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 Nov 2024 at 00:05, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> The commit 4b28a0dec185 ("of: WARN on deprecated #address-cells/#size-cells
> handling") now forces all parent nodes to describe the #adress-cells
> and #size-cells, otherwise it will throw a warning.
>
> Note that this patch is currently only in -next.
>
> Fix all warnings on the X Elite by adding these two properties to all
> parent nodes that don't have them.

The individual patches are incorrect per my understanding. None of
those child nodes use addressing, so adding #address-cells = <1> is
incorrect. Maybe it should be #address-cells = <0>, but that looks a
bit ridiculous to me.

>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Abel Vesa (3):
>       arm64: dts: qcom: x1e80100: Add missing #address-cells/#size-cells to firmware node
>       arm64: dts: qcom: x1e80100: Add missing #address-cells/#size-cells to ADSP GPR nodes
>       arm64: dts: qcom: x1e80100-pmics: Add missing #address-cells/#size-cells to pmk8550_pon
>
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi |  3 +++
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi       | 10 ++++++++++
>  2 files changed, 13 insertions(+)
> ---
> base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
> change-id: 20241108-x1e80100-fix-address-size-cells-missing-warnings-1cfba11bfdbd
>
> Best regards,
> --
> Abel Vesa <abel.vesa@linaro.org>
>


-- 
With best wishes
Dmitry

