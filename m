Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54011519D24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 12:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234626AbiEDKmL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 06:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348348AbiEDKmF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 06:42:05 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0091C2AC54
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 03:38:24 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 16so1096838lju.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 03:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e0/S6UE8kVYqDNad7z3pjtRuJgpmgvfwcT2yCsHCfEM=;
        b=d6aE1Ig3kJW12Aq8yvux6ub9aoclrmtZQHodl+2SCNC1TTVIXN2a1xcOKMo477nJZM
         SYZJZnn/rjIOvYvEOSZT2kWMjKEd/8O9GrUloItb29+AVGSwuBw0s/OUfTYXbcaMixgr
         YNdnKaRQiFPHQ7yd004TWRlTGlB0KKgMZmgrAK40rawynkvyzNHrt1WmQDTyww2hh6T1
         0b5cqCZJLb3MbtQZRn/PlJnEglVfDAvFBFIL0iCsix5AuCHH0lYC3TxNE4GqR6oPAIeM
         7uvfx97tO7AaevpDLUPVRb3LwkpkblXSYQxj3xyFGg6TspgCo8DqCwfyq7yJZe63eq64
         1jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e0/S6UE8kVYqDNad7z3pjtRuJgpmgvfwcT2yCsHCfEM=;
        b=goNuHe7f/oKpyCsDqvIGORCbJor4AUCsn0jf20riBDh5638j5WcQXemYlF9FipUoZf
         /d5UCjdIKSxohPwjieH9Y9cBLYXXyoN3HpvV0VKCsvXGjbFCyqquNVe9+60ID952CLxQ
         AB/+vziajRkoovbqwkTB9mDwe3kAoRsvZWh00dYiex3OLcJJEqOXivLXjgG5WA8M6ctP
         /1YidKMMT9xEpG8sO/vU1T199ECvJ4mqHOY5sN/wHMygAMYIq5ZUPke1L9iAcJeAldOz
         I+8SaArCuE6GiBCg3a6oe2sf9pMizbPehhsoWLnO+tpwV1oH+zrJQR0rUsvONYMenMZf
         nIKw==
X-Gm-Message-State: AOAM5334V9XgGK1bLO+JBcNs5daOfI8gpVF+EJBxePlESoLegUj7YiwL
        fW0OSzNUBsZov1YgYhCyrIufOJwh5iS0ZT7v7m2j2g==
X-Google-Smtp-Source: ABdhPJxNdFWS/wru3JHuLyOEikz5IC7uPf4QUB9vcB6u578vrjN4goN8ah7xYQTsnbdk4O0TiH3kqranj+niTENGv8M=
X-Received: by 2002:a05:651c:988:b0:24a:c21f:7057 with SMTP id
 b8-20020a05651c098800b0024ac21f7057mr12487369ljq.16.1651660703238; Wed, 04
 May 2022 03:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <1651480665-14978-1-git-send-email-quic_rohiagar@quicinc.com> <1651480665-14978-2-git-send-email-quic_rohiagar@quicinc.com>
In-Reply-To: <1651480665-14978-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 4 May 2022 12:37:46 +0200
Message-ID: <CAPDyKFqmPdzR-RrQUf2bkr6KnSNVUt4uS5Tj31ug+y95ZSXhxA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mmc: sdhci-msm: Document the SDX65 compatible
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        adrian.hunter@intel.com, bhupesh.sharma@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 2 May 2022 at 10:38, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
>
> The SDHCI controller on SDX65 is based on MSM SDHCI v5 IP. Hence,
> document the compatible with "qcom,sdhci-msm-v5" as the fallback.
>
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index da42a88..e423633 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -33,6 +33,7 @@ properties:
>                - qcom,sdm630-sdhci
>                - qcom,sdm845-sdhci
>                - qcom,sdx55-sdhci
> +              - qcom,sdx65-sdhci
>                - qcom,sm6125-sdhci
>                - qcom,sm6350-sdhci
>                - qcom,sm8150-sdhci
> --
> 2.7.4
>
