Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9027B67E25C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 11:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjA0K5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 05:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjA0K5e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 05:57:34 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714DBB759
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 02:57:33 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id o13so4264143pjg.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 02:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ruibmntxorpsi/De8rV50QCf03hqljj6JIfzRYgivpI=;
        b=qbMrns75nXWK5lwt2H954k0wM1zep8CkTvk5ZiIuVcqS37eEi3+zU6JBCE4AdrCdTb
         iYhXQBGfswMhjTtYdRa6TdVM+o2omr+uYtYaVydjF+qpracj9cZ4AJ0GrH42sjR/Ef9z
         D+Xrm86HJqtmphP2O0HEzpnHlN+kS3VuAcoCOm/POkchj7v0iFtCE+3cUtjmqNGP5MvC
         4z5T+/TKwRCpKEmHGYX/4IH3/1bcRy2qM9//3sfadeiu44H8dP+CdNivclUo6YGFbi7n
         UNfB5Lgux4D+2ZziV6gv7n/vsl7FWPVPhqsoFioE8q1MaRepP1dUh8d+wSxIr9RmXNCZ
         qa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ruibmntxorpsi/De8rV50QCf03hqljj6JIfzRYgivpI=;
        b=4u2/+vVVguLaimcYgEMVAucMfvoqV7gjvuNPQN1TCgRScoyoJFzSrW6v8BwVJofl8P
         A9p/pzkZiNQ/RFhAUKX2XMvbBr37KKbEQT+Q33/wTNFsoXDGyw6oh8CsqMEhQTPbo+tf
         tZPH6x57K2kg5vlqmB8cPhqwJ5/IhBNO4n9QUHSVWK2ggwbmCUNUJFSdcM86IQADwGHM
         QxZPEFN+puVAcHqNWvpI/4Vl0eCZ3UjMun/9dY+iYqLRw3EVg1u63NjTHzhyVBv+QJ3a
         BAqjfJ7u+jtx1xtRMjlXs9LxF/qpDqqClr56/8LOLnZZ4XnWkpLt4TUAZFEAj3cgMg4o
         e0ww==
X-Gm-Message-State: AO0yUKW4457sl3WLQea4V1ZsdXokOkSRJAImpaW8VHU09VN56bt7BN8l
        xgdx0ZRH7wlymrcKTbitWg8jYbMUwxvtqR5o/QlkzA==
X-Google-Smtp-Source: AK7set8Id68oohEN2Iqhc4wiq/aX3DpMjhEnOnqOQLoSKPD6+GoFu7V0lL6buhBpZ3AtqLbG+MsIyq8BrfqGM2qN5gU=
X-Received: by 2002:a17:902:e805:b0:196:1462:3279 with SMTP id
 u5-20020a170902e80500b0019614623279mr1910257plg.17.1674817052923; Fri, 27 Jan
 2023 02:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20230125104520.89684-1-quic_kathirav@quicinc.com> <20230125104520.89684-9-quic_kathirav@quicinc.com>
In-Reply-To: <20230125104520.89684-9-quic_kathirav@quicinc.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 27 Jan 2023 11:56:56 +0100
Message-ID: <CAPDyKFqzpABB=DmvzQUZe3-ye6TT07k_g_i7A_A2QRj9ERcBdA@mail.gmail.com>
Subject: Re: [PATCH 08/10] dt-bindings: mmc: sdhci-msm: add IPQ5332 compatible
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, robimarko@gmail.com, quic_gurus@quicinc.com,
        bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Jan 2023 at 11:46, Kathiravan Thirumoorthy
<quic_kathirav@quicinc.com> wrote:
>
> From: Kathiravan T <quic_kathirav@quicinc.com>
>
> The IPQ5332 supports eMMC with an SDHCI controller. Add the appropriate
> compatible to the documentation.
>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 6b89238f0565..ead91f95e877 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -34,6 +34,7 @@ properties:
>            - const: qcom,sdhci-msm-v4 # for sdcc versions less than 5.0
>        - items:
>            - enum:
> +              - qcom,ipq5332-sdhci
>                - qcom,qcs404-sdhci
>                - qcom,sc7180-sdhci
>                - qcom,sc7280-sdhci
> --
> 2.34.1
>
