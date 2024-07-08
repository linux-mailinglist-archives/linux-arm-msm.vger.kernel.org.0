Return-Path: <linux-arm-msm+bounces-25499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7292992A43E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 16:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB8A92837B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 14:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A7113BC04;
	Mon,  8 Jul 2024 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwd7FWBy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A36A11712
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720447351; cv=none; b=LI3gyg8WcxtwgJmgJRP8bD9TSiJAmM9C9M0aGr5sWeAi1IDcbd6+zeslI/ZIwzmG5LCY0tIaWwhIKeBa5gq6+rPp7ORk/ewjnkNRwvfG7NNMjIWdDcRdbyr2Ri3PExkbN0REC3e3vXU5hMiH6dOB3cnxngWwEWF8jsaV+OCf43A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720447351; c=relaxed/simple;
	bh=XVI1sPWzwf0EC4+VDcRWpuDpJgYiTCP5xfU9hMnPeQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5m+WOsmSsiXFs3fbo7UmQmeIMLZ4s4sRlD6tiNfwItNJFkc7tjOFhYdHzI1mtISpmg4SkVs7v3x4KUxx/qR7A5s4tOBVztoq+ELWHHv0J8Pjy9+IXLOZqLtw2eyUxpujzTLiVq9hn/Uj93Z0i+7p6dHzax78aUzHl9oZ2Id0r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vwd7FWBy; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52ea7d2a039so2958444e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 07:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720447347; x=1721052147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HNkP0Bt8Z9z+t2BG5svCbmD1UB8JpC5ZP0x//z98M3I=;
        b=vwd7FWByCg2Nhz2Hd6DMciRxxJFVGPI2LkrgL+OdtaxwLhSvBneFw71vjBSAokHVOm
         CQlAXRDcFTBgtwpmsizLH7GZVmoItHmZ+6IrMCq6cqTsaNg9bQo9c4u3ffOGPyQJjjgJ
         eS+MrB0PR71RFhYDImCXmym9ug8GeRhMHAIDbWMqnNKRSUSO9RwMUxIyuQWqW1GYCukR
         OQ9iKkjuZupONV/E5nLCx72OxYZe2sXR3j71R6CBgu334wj3KtUsTX+upgag+Az7ezjU
         j0q/D+YQsKsfrjqLA9m8Bmb94m28/T2iXoL/QALV8SvPwOIEgYopE4+Y5SgJhHRWFlQW
         doQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720447347; x=1721052147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNkP0Bt8Z9z+t2BG5svCbmD1UB8JpC5ZP0x//z98M3I=;
        b=nrqlqtXsaLqLw2UIzhtf14tqGPL6HjZt36WxUZx7uN5hrTcUwiyvbWfVItb2fgcqCt
         ZzTiCbgV0I0G5W+N8PaKiMD7lcMV3qRsrmxVmJUiqv38ADHByUNEesUXeWAGZOek0YLo
         czsBydVa8vDNxpMAifdQmBA1CtKxySOLCzvZshgaOOgmkYWSbrMT/UCRvKf2/3jbdFhb
         hc45OmDC7GM2DUvbwhJDuwQvDxOBJ6/F2infyXicXzqL9KU4I4oqfGQWfw1Pw0mRVf1E
         0p4kTJu4+bPBLrdGC0BYcsnilxKmCZdkAHxJYIWrAiqPNxMervXnSjEax88MRtHt7KDL
         BAsg==
X-Forwarded-Encrypted: i=1; AJvYcCWAsO4U2rsjA4Wj6WfET0vvmij7FZ4n40DYguOjpnBoVIGrgL+5bFN1GyFfMzKlX5Pp/phMQLCWBCZ2BQmj3qzhZQt6hbLD0sMOubHKFw==
X-Gm-Message-State: AOJu0YyBj/6qNlbYhR1ocM/k5VMesVNXCCSvGTbqgN+uOilhzxljsm1p
	LKF8ydQnQbEPW2cX8EKCsWuUqLoPvZR1MpVOLRR552ax9AbFikPXw8lJs+jdsvo=
X-Google-Smtp-Source: AGHT+IF/QaQIW5rohmTJn5zHc68r4oDJHttb39KSQE+SaXaKxy3w9B6lXQX2UKAIvJTa9lxjTmfx9Q==
X-Received: by 2002:ac2:5228:0:b0:52c:daa7:8975 with SMTP id 2adb3069b0e04-52ea063230amr8500079e87.18.1720447347349;
        Mon, 08 Jul 2024 07:02:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ead695f29sm509185e87.109.2024.07.08.07.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 07:02:26 -0700 (PDT)
Date: Mon, 8 Jul 2024 17:02:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: clock: qcom: Remove required-opps from
 required list on SM8650
Message-ID: <rbej7rbjiwtgf4reiomtmlv3ef3ljfys5yfzypigrertylucu7@be3v65aeuimb>
References: <20240708130836.19273-1-quic_jkona@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708130836.19273-1-quic_jkona@quicinc.com>

On Mon, Jul 08, 2024 at 06:38:36PM GMT, Jagadeesh Kona wrote:
> On SM8650, the minimum voltage corner supported on MMCX from cmd-db is
> sufficient for clock controllers to operate and there is no need to specify
> the required-opps. Hence remove the required-opps property from the list of
> required properties for SM8650 camcc and videocc bindings.
> 
> This fixes:
> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000:
> 'required-opps' is a required property
> 
> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000:
> 'required-opps' is a required property
> 
> Fixes: a6a61b9701d1 ("dt-bindings: clock: qcom: Add SM8650 video clock controller")
> Fixes: 1ae3f0578e0e ("dt-bindings: clock: qcom: Add SM8650 camera clock controller")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407070147.C9c3oTqS-lkp@intel.com/
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>

You are mentioning just sm8650, but your change applies to other
platforms. Could you please check whether other platforms supported by
these bindings required the opps or not. Make required: conditional and
enabled only for those platforms?

> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml   | 1 -
>  Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index f58edfc10f4c..bd9612d9d7f7 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -57,7 +57,6 @@ required:
>    - compatible
>    - clocks
>    - power-domains
> -  - required-opps
>  
>  unevaluatedProperties: false
>  
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index b2792b4bb554..8a42e2a1a158 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -44,7 +44,6 @@ required:
>    - compatible
>    - clocks
>    - power-domains
> -  - required-opps
>    - '#power-domain-cells'
>  
>  allOf:
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

