Return-Path: <linux-arm-msm+bounces-9244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7556843F71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 13:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46678B2B64D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 12:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5433079935;
	Wed, 31 Jan 2024 12:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1kcHeM/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A7578B41
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 12:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706704022; cv=none; b=bsbgqVecsuSTtYuwydQWEnixyisSwXpPuS5kNNx+y6GqD2f+QB+h20HUByzIbv5E+Awjq7VX0li3Hoe3vV4/WUdF5wxsL/OdEKNbOzrDuQnQwV7H746DNc5IuqnPiaje5uZAc6yC8x5bO3OGIRi/sJQbzsHfM3091maHqJmh3q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706704022; c=relaxed/simple;
	bh=H9HsAc6EPMnurDsAxVdEA3FB5kKp89C8i+CXaQzDOPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/NwBy3Ia19wBE7L/4x2y3NsLYACrDKBlwJ7Egz0YxQGN7dzP59KDGi7C7DmifZ2p1xjz/2kj20hkyv/2ZIhfmBsDks4KJE5rCbjNZklRS1FVbXyv8DhC2GGWT/EkFMtoOMTnvt1TGtPh3MJ0BsQfzGY1AU6TlnyLy8OnEDGWvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H1kcHeM/; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-603c5d7997aso37802667b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 04:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706704019; x=1707308819; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5L/tMbC6cusFxl6pPtmgbyUWE6zqIJ5tXoW7n67BpgU=;
        b=H1kcHeM/vaq0oJ0fr5yde6rIKw5tn0Mc7nH6KGnPx6RMFbOuhfksqsxY24Gp2ZVbRN
         pWgfB2gGE5qYbaTMF3j9jPGep+U7Ugn+jfcNqK0YDB1qIaXEQ3rZRo9QI7fhS8OGBdVd
         qO05ilH1WCqa+Dnn2faAa5aPWNBCgkTGilvzN27BQwaRuY2ubvfHphmeiiDcyyX+4HLi
         ittVFCuRHUhp2owtYbgqlNO7ILkx9Y8JGbSQ3FvhzfcpEQindj0W5Bp3H45Rdlci4Rxa
         F8XSHUQNbs67pGSHXPevVUsMkMdvG3IVHugGqPbDKLuhmHokafqlSFnlcy0gqjZtkw3O
         OHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706704019; x=1707308819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5L/tMbC6cusFxl6pPtmgbyUWE6zqIJ5tXoW7n67BpgU=;
        b=RgajRG3VTRmxPZpTlDqXO2tzk8U/+ezc8sgHM6siVbc7oiH2fQLG+p7jIynh9LYiL7
         +Or4JTydull4g3WIhHkwd4pH4vUzQnqAKGKG2BQK5IW33aSoBdCfj+NLsMOJ1/EetA0l
         si2uZFLO3jmSkoIrDuWDSTFOrMgeoeGRZB6JMyOo1w3kfU/NsvrCxhyQyLDwPI3Qjnzl
         RjYFPwguSCROZNNu/IeEb+o4IzzI0O3008JsEkhoMFpkiNDFqRfU89nMYXs/2LETQRJa
         VlPS6F79z4+F8I9156LH41mU1Hc/PCUPB1iKlMMcONv/sHA8cHQQGUtkoSsL9QqV9DhZ
         I4aA==
X-Gm-Message-State: AOJu0Yy0R3kIBsJEHd8QWdKvfcNg+/DUUpFBEVrHY9BsvtfMVlxfVWNd
	PHpRBXTpdV2dJnkzHjXaSD+DI30XXeObZVD4cWnM8qifDQRZhz8acxJqz5dZaUy80dgkt39c4UH
	2YRa4I6Aax6j89l2S46BB7YLcFSUNVKANXjJy2A==
X-Google-Smtp-Source: AGHT+IExYmsDKD7JI6oFpFxZmf5OrGsPJTsIRy8SKXYafhZhPWCKnGPjAVGUqWeYdTGmEHNqG1M57c/2/8Su1nWdyHM=
X-Received: by 2002:a25:acda:0:b0:dc3:6990:99eb with SMTP id
 x26-20020a25acda000000b00dc3699099ebmr1464707ybd.55.1706704019522; Wed, 31
 Jan 2024 04:26:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131102003.2061203-1-amadeus@jmu.edu.cn> <20240131102003.2061203-2-amadeus@jmu.edu.cn>
In-Reply-To: <20240131102003.2061203-2-amadeus@jmu.edu.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 14:26:48 +0200
Message-ID: <CAA8EJpo01ZoqLt=fyL1Pau0DVhCL=38yEdnCThA7=AnLyS98yA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: ipq6018: add ipq6000 CPU OPP tables
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jan 2024 at 12:23, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Some IPQ6000 SoCs don't have pmic chips, and fused 1.2GHz.
> Add a separate CPU OPP tables for these SoCs.
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/ipq6000-opp.dtsi | 49 +++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq6000-opp.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq6000-opp.dtsi b/arch/arm64/boot/dts/qcom/ipq6000-opp.dtsi
> new file mode 100644
> index 000000000000..acb4774da33e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq6000-opp.dtsi
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * IPQ6000 without PMIC (MP5496) CPU OPP tables
> + */
> +
> +/ {
> +       cpu_opp_table: opp-table-cpu {
> +               compatible = "operating-points-v2-kryo-cpu";
> +               nvmem-cells = <&cpu_speed_bin>;
> +               opp-shared;
> +
> +               opp-864000000 {
> +                       opp-hz = /bits/ 64 <864000000>;
> +                       opp-microvolt = <725000>;
> +                       opp-supported-hw = <0xf>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1056000000 {
> +                       opp-hz = /bits/ 64 <1056000000>;
> +                       opp-microvolt = <787500>;
> +                       opp-supported-hw = <0xf>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1200000000 {
> +                       opp-hz = /bits/ 64 <1200000000>;
> +                       opp-microvolt = <850000>;
> +                       opp-supported-hw = <0x4>;
> +                       clock-latency-ns = <200000>;
> +               };

I don't see this OPP entry in the existing table. If it is supported
by the SoC, please add it to that table instead.

> +       };
> +};
> +
> +&CPU0 {
> +       operating-points-v2 = <&cpu_opp_table>;
> +};
> +
> +&CPU1 {
> +       operating-points-v2 = <&cpu_opp_table>;
> +};
> +
> +&CPU2 {
> +       operating-points-v2 = <&cpu_opp_table>;
> +};
> +
> +&CPU3 {
> +       operating-points-v2 = <&cpu_opp_table>;
> +};
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

