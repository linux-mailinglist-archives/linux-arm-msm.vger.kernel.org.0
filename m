Return-Path: <linux-arm-msm+bounces-1079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C197F0747
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Nov 2023 16:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E303F280D5F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Nov 2023 15:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC88C134DF;
	Sun, 19 Nov 2023 15:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928A8115;
	Sun, 19 Nov 2023 07:59:44 -0800 (PST)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-586beb5e6a7so2122578eaf.1;
        Sun, 19 Nov 2023 07:59:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700409584; x=1701014384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfGhwLIo9hLzUaGK9AUt1pvtXqjzHP7zbLzf7n78acQ=;
        b=YV/fUvpolaWPUqDRaFcuxjqxjeWN7GVF+DgkCa11eU+WQ+FiJ2f8MxwThLNow6LbJ5
         FlnvVqTIini/WuOqvLZKOg7AWCF4Xjcw7AqBFwZkPlglhiZ5csLZQuQsdxP2Hi/2+rLy
         BVNYULCH5xi3sjkI62PYEHA7/nUh/erm/er7edqoAUE1UWrl5BzdaBFYEGBcmnpPjSXm
         RDBQ4e1Hp/HmQjxTnxWWs1HpEoeLooqZiZ7FY+LsQd6NR+OYj9EQpVnR+Jtl+STV8924
         lwAIDi1GjI7kkRU7AgYi0obZvAlcx8izwULnTOyW7VcLMFw6Skh7y0PK/KvR7xb/cGPb
         YpJg==
X-Gm-Message-State: AOJu0YxU1WYGH/Q4Nhk3UJz8LFU6XcERS7ZUij3i47vk1pa3B7ehHUCK
	3PtW4tXspqpAevFtahD0ww==
X-Google-Smtp-Source: AGHT+IFDvTfoBxOlEPNQzwJ55CPDGGnOGDwH8/gT5bTEDsWf1L4anTDjY94DEiF8uhtEkxbGx1E5OA==
X-Received: by 2002:a05:6820:2202:b0:581:6a56:f3bf with SMTP id cj2-20020a056820220200b005816a56f3bfmr5055152oob.5.1700409583840;
        Sun, 19 Nov 2023 07:59:43 -0800 (PST)
Received: from herring.priv ([2607:fb90:45e3:889f:15b4:1348:6d64:224b])
        by smtp.gmail.com with ESMTPSA id b30-20020a4a98e1000000b0056d361ca33fsm1125759ooj.16.2023.11.19.07.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 07:59:43 -0800 (PST)
Received: (nullmailer pid 262617 invoked by uid 1000);
	Sun, 19 Nov 2023 15:59:35 -0000
Date: Sun, 19 Nov 2023 09:59:35 -0600
From: Rob Herring <robh@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com, ulf.hansson@linaro.org, agross@kernel.org, conor+dt@kernel.org, ayan.kumar.halder@amd.com, j@jannau.net, dmitry.baryshkov@linaro.org, nfraprado@collabora.com, m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com, lpieralisi@kernel.org, quic_rjendra@quicinc.com, abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, quic_tsoni@quicinc.com, neil.armstrong@linaro.org
Subject: Re: [PATCH V2 1/5] dt-bindings: arm: cpus: Add qcom,oryon compatible
Message-ID: <20231119155935.GA260100-robh@kernel.org>
References: <20231117113931.26660-1-quic_sibis@quicinc.com>
 <20231117113931.26660-2-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117113931.26660-2-quic_sibis@quicinc.com>

On Fri, Nov 17, 2023 at 05:09:27PM +0530, Sibi Sankar wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> These are the CPU cores in Qualcomm's X1E80100 SoC.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
> 
> v2:
> * Update the part number from sc8380xp to x1e80100.
> 
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index ffd526363fda..cc5a21b47e26 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -198,6 +198,7 @@ properties:
>        - qcom,kryo660
>        - qcom,kryo685
>        - qcom,kryo780
> +      - qcom,oryon

Wasn't it previously said 'oryon' is not specific enough?

Also, please describe what oryon is in the commit msg.

Rob

