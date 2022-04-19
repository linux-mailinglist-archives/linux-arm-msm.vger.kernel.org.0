Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEE65075E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 19:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbiDSRGH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 13:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355634AbiDSRFT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 13:05:19 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC22F46B1D
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 09:56:02 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-e2a00f2cc8so18141170fac.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 09:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cU3PsQ96m2bacgHlDzTdRKjnECW2W3GiF9D36CqZr/s=;
        b=Q1S+yCPs7SupLovMDFM3IQDosMFLbgc8WIsAM+J8qB90YWYU8VHVuB6N/G1ECvL8g4
         L0uxwo9lBC7+JxEuwKqpSEMAOGShHgjf/p+nLbhjP6Lje8tJzyu05YRZm0m1dtkqQKDn
         /HU2+grMoR6gH1AgaIZ4Yb7lgK7RhHMNM5TQMQN4LbcKlH2DEHGm4QEq/sZkeSBIKw29
         TMkUY3a+eyIl5KkCkTMk2E0Zmt8inqxI43pO/VnkQMCAhJRUfEMPceHZmuenV62nEUYg
         n8sgrwGe5DQrG8zaTMbEOyDmOSOE8iXobUOGiCoOYlj3W1TlhgCM2AUVLogdcEDHBKBP
         e+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cU3PsQ96m2bacgHlDzTdRKjnECW2W3GiF9D36CqZr/s=;
        b=arzm1VJVSjMve9uCgG3U4vd2k3IwB30LMdbSzVde18YUUjmroRBqVZASEZbRRFCo4w
         ibyZesFeOlPOYhL2HeJAAYOqxmkBfk8sK5cgWNrB2lFcv/ZE1i7wR2Jo5n2/aiVEmZ23
         QzBBnKLL9GgVThYEO5u3V5y7VGZ2U1pv65WqFw6Zstw3Y/ijV8mCAP5vQslwUQA0d7Em
         7SRiXk51n6MraTCclio86OXFTd4+nD+hm4sjy7hPuASI2ykAKKPjA+cLpj0JZY2MHCmL
         Mme8fT61RPVN4V1a6Al0Uo+uK0UpSDvah/hLXBhfkEtJWosq/pD1Rfej4+Z1LkgKoN2Q
         BAcQ==
X-Gm-Message-State: AOAM5308BD/WS3VgOGGeXBXeKRtYHLlofcv5Y+WB4SURmWHZSWbVmW8S
        +q2GFheOTXUhT2OHRhe+TsIT6A==
X-Google-Smtp-Source: ABdhPJxL2k0eDg181dJAp/Ef9UPRdb4j02W0Eb0mz77zIlm9opQ+gz1vRosQYbLVU7nl3PKWo1i46w==
X-Received: by 2002:a05:6870:208:b0:e6:134b:1b04 with SMTP id j8-20020a056870020800b000e6134b1b04mr2615508oad.85.1650387359485;
        Tue, 19 Apr 2022 09:55:59 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id h26-20020a9d799a000000b00604d35aa374sm4482447otm.35.2022.04.19.09.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 09:55:58 -0700 (PDT)
Date:   Tue, 19 Apr 2022 09:58:04 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to
 match yaml
Message-ID: <Yl7qHEIBrZhLzgfH@ripper>
References: <20220419113734.3138095-1-bryan.odonoghue@linaro.org>
 <20220419113734.3138095-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419113734.3138095-2-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 19 Apr 04:37 PDT 2022, Bryan O'Donoghue wrote:

> The documented yaml compat string for the apq8016 is
> "qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
> lpass compat strings the general form is "qcom,socnum-lpass-cpu".
> 
> We need to fix both the driver and dts to match.
> 
> Fixes: dc1ebd1811e9 ("ASoC: qcom: Add apq8016 lpass driver support")
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  sound/soc/qcom/lpass-apq8016.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 3efa133d1c64..10edc5e9c8ef 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -292,7 +292,7 @@ static struct lpass_variant apq8016_data = {
>  };
>  
>  static const struct of_device_id apq8016_lpass_cpu_device_id[] __maybe_unused = {
> -	{ .compatible = "qcom,lpass-cpu-apq8016", .data = &apq8016_data },

Removing this will break existing MSM8916 DTBs, so please retain this
entry with a comment that it's the deprecated compatible.

Regards,
Bjorn

> +	{ .compatible = "qcom,apq8016-lpass-cpu", .data = &apq8016_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, apq8016_lpass_cpu_device_id);
> -- 
> 2.35.1
> 
