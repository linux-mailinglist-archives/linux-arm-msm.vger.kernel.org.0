Return-Path: <linux-arm-msm+bounces-13572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAB987486E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 08:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40F89283ADC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 07:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906D51D529;
	Thu,  7 Mar 2024 07:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A7PS3Vtl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB16C17BB5
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 07:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709794981; cv=none; b=n9IbftALgEcxeYboRMNrqyV1YC0dH6svirb4TNdEhA8TPD8DrK91GQMAsEk9kiLjM4n4K0zxZ8quI39u+4Ixu549QhbzKaiF5uhSbt731aDYF5ksquoz784ieN3cnMShONfvl7bIZeSDh87UzZ1yqv96Fo0b2WGItq+BZIjeCeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709794981; c=relaxed/simple;
	bh=OBe7iFZuReG8P/0g/nf5f3rbxG1c9+A1XatMuNZhyvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gmAiYSloVaTMyp5IRlbtoYtKcz3Q2bdKBn7Lm81I71Potj1N1L12YWwgx9nHiu92Mk9EzYuBYxkbYXf1ByvCuCBofv/tl5Bion1khCQKq4DfGEQz/mbedsrWGAtIh3+7r0vyXTvEe/N7tnzKDHtQnSLLAjze/5SvWoSBom19hwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A7PS3Vtl; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7ce4512d308so368083241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 23:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709794978; x=1710399778; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rtVcoO9EdMVwfooxI7FOluwLbnU5D53g+z6OZi75Lq4=;
        b=A7PS3VtlNdmCV2le9Ici8iRzxmVlr7Jiz0qyJmhEri2+PQCx1t8oIt1A2U+eGW2yJo
         DgtI3geHXRRm5yso5VmR9z2Z2hqZe6TicS8LkRTus7cVznHA6QL4GgB2dr00SBuBu11g
         J+5DJviVqRx6Znex4PZcBUMomXhsLoC/4dakCYK+UkWALiGMIrMQe35xVjYz3pJ5LYGW
         M0OMsG237xKiRrc/VXjyOEGAxUJ9ieaNz0n3D3jd6kl2KJfjy7EIXwzmx/hgp6aGDuiv
         lkq978Ot+fqLT6U/h+xaTj8JFkeyL6ZfE0XYDULrJACMVHlU/NLrqL4KwM/BY1k4xQ/8
         xPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709794978; x=1710399778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rtVcoO9EdMVwfooxI7FOluwLbnU5D53g+z6OZi75Lq4=;
        b=EcrxAW5QiWNM5X7EF6NBOzq/afynDgljB/PM68Nr+GA0tcaEHVIUUsD6kg6Ae3N4iv
         NAR/XZLQjqz+T0n27amgVCqOx6LPxMoMk3LsZgNW106ej5G9h3omJGEvrT2HLMLLLP+t
         4HWt/nos0DJ9s/ZBhbDszvC4qizGhNqgIBB824TiDAFIgwMp8j9bzBHdD6yzGWKWvfZG
         pM4uz/eMJNFoiZg1He7RH3HpJddwqCtOM06mzKD1sRbm7+QXY83yG7U4sZKmMb/NQRbT
         TBAC/W8IX5jdTkTcstS01yZ4FYLU9V7JMLYrBYeEd1KJom8690OF1PcuLA8V8pOuHJBK
         kI5A==
X-Forwarded-Encrypted: i=1; AJvYcCXQEX+RhBKaq1R9AcS6uNfZKsLfBNTOVbKe5V77kklNtLVMwH5moGt7XQX9oBaP5EiXInHjGUNdCAEkD8674u+ewem291h6emfjWe7hjw==
X-Gm-Message-State: AOJu0YxOOlI7tcvTu/UF00OGn5CFveK7G7o3BruSo4/H66xFlOg91YWX
	dYxeSu77aqFZbeQ9fQrDsLlKiZHyWYfXSh/OdDgB7rkCSUrBby21EjpOeh8ZepZEuqeg62Ic/FE
	JUCnzRGAT9amunowvX04BDGKFCCBp8IqrePsqfg==
X-Google-Smtp-Source: AGHT+IFRYze7tO1U5koqDn3Os1b2lN61jQUOyyUQbuPdUoRc6ftbDI4kO7dIUuGq9SfX8vhQ8vNrAhsojMO8KHr5g2w=
X-Received: by 2002:a05:6102:304c:b0:472:5968:b670 with SMTP id
 w12-20020a056102304c00b004725968b670mr261914vsa.9.1709794976121; Wed, 06 Mar
 2024 23:02:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306200910.2732835-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20240306200910.2732835-1-volodymyr_babchuk@epam.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 7 Mar 2024 12:32:45 +0530
Message-ID: <CAFA6WYPKJ7N9UUcX607gkcHF7kTswxaQYe4sCcgJXVa_pXSnMw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: add reset name for ethernet node
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 01:39, Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Add reset-names property to the ethernet@20000 node. This patch does
> not change behavior on Linux, but it is needed for U-Boot, as it tries
> to find the reset by name, not by index.
>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 761a6757dc26f..c2e65d6a2ac62 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -951,6 +951,7 @@ ethernet: ethernet@20000 {
>
>                         power-domains = <&gcc EMAC_GDSC>;
>                         resets = <&gcc GCC_EMAC_BCR>;
> +                       resets-names = "emac";

I suppose you meant reset-names here instead?

-Sumit

>
>                         iommus = <&apps_smmu 0x3c0 0x0>;
>
> --
> 2.43.0

