Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3B565F8AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 02:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236600AbjAFBJ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 20:09:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236609AbjAFBJX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 20:09:23 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A1472D07
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 17:09:18 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id u8so467060ilg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 17:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a25YKiMypj1O1dkTeTf+41PYk2LkMRy8jApaMHcF3hQ=;
        b=GfxYAaRQLGPOFoa26ErjjUE1UpmyQRlEngmnyE784ps7wQu+AricDPJa32a22yCALt
         MhTCHBUleQASsrn09sMtfYq+H7L60n1dUwQJXnti6/CBbWRriMiw0gwrC/O9nGYfNf80
         VtBY32mpB98Hg5zawDJAzkbyNAKgHVFOwTbtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a25YKiMypj1O1dkTeTf+41PYk2LkMRy8jApaMHcF3hQ=;
        b=sqbBEYG1C4Nj+4AEuIi/5Fp+hiO4ceZSRmFAd6N/ea1YTLHPY1IruN5iT/ieLBNIV0
         dyXsJxiMD7AUQg2/6S4XjqGPNibFq3+7JOeRdbB/JdYnJT2WZ2lFeDExNZLzzBpFtHlq
         2mIGZQ3AWoZNhXIlLZFs3VKogOiP65ZqhRg8fSDFEHgjSwotSKHlQotwG+K+nqGgqEcE
         hhQxAENE3o5JHabstgd3VCvMeoLN5q3mQqCr1cAzM2/Rt5gg/0xIziOIE9w31iTQbbBs
         lMLMtSmno4Wiof8s96ldTyn5qaECyr11eP1iRGB0d/ObJlr73VJDwoCLwiVHawwNKY/n
         1f/g==
X-Gm-Message-State: AFqh2koZRGKYsLXvoKX2ogmilYimz1jGqTH1WmsCWug9M7fBrJQ/Kmq2
        BMZBHF6Z27CEoRcD7nTYYFbGMg==
X-Google-Smtp-Source: AMrXdXsIxoPdIf7iemjPcehOoQbWhnzgHIYcO03uSrBdXX69Tjy1MRwwWy0vr8DbtCAKgqVNGwRwdw==
X-Received: by 2002:a92:b10:0:b0:302:364f:68f4 with SMTP id b16-20020a920b10000000b00302364f68f4mr36470087ilf.17.1672967357902;
        Thu, 05 Jan 2023 17:09:17 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id i2-20020a023b42000000b0039e0a7bf3a2sm5385077jaf.179.2023.01.05.17.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 17:09:17 -0800 (PST)
Date:   Fri, 6 Jan 2023 01:09:17 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     linux-remoteproc@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, mathieu.poirier@linaro.org,
        corbet@lwn.net
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom: Add reg-names and
 power-domain-names
Message-ID: <Y7d0vcAwNDsZouWF@google.com>
References: <1672924363-22938-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1672924363-22938-1-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 05, 2023 at 06:42:43PM +0530, Srinivasa Rao Mandadapu wrote:

> Subject: dt-bindings: remoteproc: qcom: Add reg-names and power-domain-name

For all qcom remoteprocs?

Please make it clear in the subject that this is for sc7280-adsp-pil.

> Add reg-names and power-domain-names for remoteproc ADSP pheripheral
> loader. This is to make compatible with remoteproc ADSP PIL driver.
> Also change power domain from LCX to CX.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml  | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
> index 94ca7a0..b5bee2c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
> @@ -23,6 +23,11 @@ properties:
>        - description: qdsp6ss register
>        - description: efuse q6ss register
>  
> +  reg-names:
> +    items:
> +      - const: qdsp6ss_base
> +      - const: lpass_efuse
> +
>    iommus:
>      items:
>        - description: Phandle to apps_smmu node with sid mask
> @@ -57,7 +62,11 @@ properties:
>  
>    power-domains:
>      items:
> -      - description: LCX power domain
> +      - description: CX power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: cx
>  
>    resets:
>      items:
> -- 
> 2.7.4
> 
