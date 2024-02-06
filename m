Return-Path: <linux-arm-msm+bounces-10007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC70184BDEB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 20:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6439C28C42F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 19:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3421400B;
	Tue,  6 Feb 2024 19:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lABHGyib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E032114AA7
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 19:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707246513; cv=none; b=luaOAnG6wSlrNDXXIFSjMbQdtDOP/BVSQ1acbGAV9T6p2ei/oaZ/kRJ1ATUTBq6piUeWbfL9LvWATjggjzolfCViq1qt4EnptjLwUU6t3CgFnRDS8Q644VvTmoWeRCyzmhQkY5822E1SWZk6qVNvO/Dw3+J+2WliggbK3P9lszA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707246513; c=relaxed/simple;
	bh=UZTJjPcb2MjuJk4X9agIJ4O2gWUdi3IX7M8uOAzP3So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KfArEz6AUVZ9Msveqea+Pm03zBSUEGb872H6IgznYNBX2WUdF65P5BLlajBj//w8Cg5uDiJYzVqZI5CFiJ7/TGtXTfEO+WQK9bkt3EfalD5NLHK6GOW+HUt/+uLWRE662V5TYA2T1cLEOgF3fgjBPFkBfX2cD7oTC4xuE0eKpis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lABHGyib; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2cf1fd1cc5bso75673091fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 11:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707246509; x=1707851309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MdMobT+8h7P/ZBNgynDgzGAaw5f0RjP4kU2V9E4+mMM=;
        b=lABHGyib9M3NYjj7cXYk/RIaG2/zHk4rYrNZMI365x1Ol0zFqBB2OTMlwoDwtqAUv2
         XgzzOWl48pVuU4xIQNLTTewaagQu3yOSe8h4TJoD/5QrI1j3JSmdc8qyutYO46qtYJ+L
         LaTWWnyk7MxJklDOu2nr5eGSsabjKt3EuCt+y+ed3Cxjwl/BHypLOB4hxtxkjYgnLIfS
         kfKp3l4EDVBxV/7mHEbic8dkdZMgUW7Hm8xixANQuDg+bD2Q1BZFLy8rZaOj57NxHjWC
         TOuM28Wl+pjp3NK4woQ2xBc1OKcb65/RkQ/ct9dbxVt2Iw53dXaFTPSNb4SreSyzZyk+
         wl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707246509; x=1707851309;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MdMobT+8h7P/ZBNgynDgzGAaw5f0RjP4kU2V9E4+mMM=;
        b=qhi32ewE+gNs2zmXL3Gg5BrH0sDdjHR5+T6kD0OTnH6vGrPvub9DnFB9pq8cjnxRtu
         PwF2BgDX9wcrIgMcdyoxsCjnDjG0h77W738xAjeRMDelxPJJjGniI57tmm96cHF9VIYd
         RGf8XDZslWxKMcDPsPR80C7ubnn4dqJCbrWo49aXfxaIwCMCnGqhIVwj9SJ2bdC6//ep
         4hRQGyA4B28KgH76y7eL5XdF77+PEf8fwZVRL80FzOqj0Pg6t8viMRVXyGnVhsKylDbD
         HLg5CKQC4cnqgbz4xP56X+IJGXLtW3M/2CLTg399grKjYWGludf+nhnFkTEjPiZ8v/B2
         kOSg==
X-Gm-Message-State: AOJu0YzVp0oFOhyx2Mtf7SB78aonxMxTWiYQZ56GVWWh36s+KwfU+IF6
	bl0jsc1lQu2qT8pef4QcM0mdpwA8CR8x8VA0ab6IoQb7D2PWY3eT6AldpAxGpxU=
X-Google-Smtp-Source: AGHT+IGJZ+Q4CCq7NP1967q508pkF3nV6233Sdm5IY2dxAmf/nEDmmh8+oenKnnPLSfC9YMB/Rb93g==
X-Received: by 2002:a05:651c:1713:b0:2d0:9c30:e1af with SMTP id be19-20020a05651c171300b002d09c30e1afmr1936187ljb.53.1707246508808;
        Tue, 06 Feb 2024 11:08:28 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWwv1KQlgQ/Y+PE04tvRgGVtPexYwA2ALlogWGTpP+H1isFU41OBdCM+51YfUdAwynKJ9cx5y6GQLuuXdl68pQotMwBIzaP63RERBsPE+Jth8pkvqnJtWrcmfZka/loSHbdhaoG07lmJn6ihYkb1paKcC5moSWInVErUjW97QpmX6zDzyP6I71m5RQHgwx5nsqA2oKnfjQpuCB8NC5jldq4aF8oV5qXkzwiEFotOoM4j6Z1FQA7MCdsH7FD13pdTbDOHzUqUoJ5EuWeNtxw2D58TLt8coNS/p+1aCssYP+TNv+WV/xGcmdDWxZTnRLGtbMZD9W9UH1niLzdw6JtwQ9OX45zakNIZK69Eqsxd2naXydi8WPbDfByyAW1fcoKt4inEC92a8KY5nB7VGa2hd1ClPwIYv4339UotBvprXKNhLZ5kTQ18GHkxdfcsPAUHA83+ah7Phc+7ecE9rDN2yNpB7nNXOnAxrkBieaq8WeqTOvxI+09rP6DvseCjKZWq0RkGPYlCJR27VR+vsOo2P+YzchmvmETsm4mU2eNcBIrIdxJ2sMnJYXdSv1Y54WrrPmNN8p2MHKpJxTsV6WdxaOwObab/BaapzqdxQfJU0WZlZW863YCYsvHqSI9HMqeFgMi4QYw8QwmQMy1hoJTXhwUNtx3uBe+96mxE+Jgpu+Mj2AJoRPVBPdl1aKbpKLuOB7byIPK/o/sjniuI2w/dSh8
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id q24-20020a056402041800b0055ff68cce5asm1325939edv.27.2024.02.06.11.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 11:08:28 -0800 (PST)
Message-ID: <a2f8b2f0-0673-4939-8843-200ccf2c7807@linaro.org>
Date: Tue, 6 Feb 2024 20:08:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] arm64: dts: qcom: msm8976: Add IOMMU nodes
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240121194221.13513-1-a39.skl@gmail.com>
 <20240121194221.13513-2-a39.skl@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240121194221.13513-2-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.01.2024 20:40, Adam Skladowski wrote:
> Add the nodes describing the apps and gpu iommu and its context banks
> that are found on msm8976 SoCs.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 80 +++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> index d2bb1ada361a..118174cfd4d3 100644
> --- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -808,6 +808,86 @@ tcsr: syscon@1937000 {
>  			reg = <0x01937000 0x30000>;
>  		};
>  
> +		apps_iommu: iommu@1e20000 {
> +			compatible = "qcom,msm8976-iommu", "qcom,msm-iommu-v2";
> +			ranges  = <0 0x01e20000 0x20000>;

So.. there's no 'reg', does devm_platform_ioremap_resource() pick up
the corresponding reg space?

Konrad

