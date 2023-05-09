Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5036FC1D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 10:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbjEIIhy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 04:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232838AbjEIIhy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 04:37:54 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50BFE55B8
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 01:37:52 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f42c86543bso1942225e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 May 2023 01:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683621471; x=1686213471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oaH5bMyyF/pRBIEeFPGeW8T3yMB7Pu8EJCEKG63OvYQ=;
        b=OivsJeqlYDQKXvjGnGzWbFoyvy4TxHfVcnOhnrQ4+WfFGt0Rolo4waPg8tkZnR9B1L
         SHzR++dleWUsyYZi9aqrvdv89xfLYQOY1I+fS0NCwqJvnOM929eh1hrEwiAvSJJuzFYO
         Yo/GTqy7E3VMjEqrQQ0gGaSn2q+lZRtjS2D+yV1IUFbjjc22mJp5WclnIQrZB0+ltSU5
         SFXRqSYrC4KUSRYpeOSpmAVUhElcoLTDAZ/A9et9sFGCzUnpSesJV8qV5ADYoTbxVYZ4
         ZWaynBbhmu3AH5ClKb0QcSEobnSfZXesTBL/lyXqg+0dtuEV1RGy+CF/XBN+A5M9K8P2
         xpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683621471; x=1686213471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaH5bMyyF/pRBIEeFPGeW8T3yMB7Pu8EJCEKG63OvYQ=;
        b=WnDpnabuHozTBwxGAQnpWto8gpG4dH2PKOvW8HfAXzR1bn0vanKd1HVUO/bnVhbCbc
         Ic/aOrWumh9FMQonRM1uZBya4VJ+ZYzlgUhp6FBOaQNx3kaPcrcoebwx5t+6ez/KmuUV
         lo3tIMDUZzQnEiolwYeOGYd+LfBQAUT1byxygOuUK02B1kiWJ7UnRmeZEAg0q7yg/TrC
         Lw7k0zWvvCBfNhWyZm5pUpNuYOCAtzazcz9HY/+ykuMcJC7WnmKCTARZ4XOh81gxXd4s
         ZUFokp6uSOalDaGvynLc5EIYrSxW453Dbc+0wZQNxol4oI5uXlHLG4MdKLr0QifYX83s
         oCZw==
X-Gm-Message-State: AC+VfDyhgBFFtUV4QpO6FnzXgnzgHA9Y5u1hvfysWSOVJsACJFLizVK5
        jmcAtt0+ICivjXxW3TFyX7Gz4J6lNl8T8vK//tk/5Mw8bYcFlEmx7V8=
X-Google-Smtp-Source: ACHHUZ6t1Dtc91VFmGEDmqG1U5Gv9JfMO9EgpE482ZrIfsgizHH8p9LdXOKrvqucABNkj0B5Ae0xikR2XNzeSiSGUFM=
X-Received: by 2002:a1c:f209:0:b0:3f1:92aa:4eb8 with SMTP id
 s9-20020a1cf209000000b003f192aa4eb8mr8835278wmc.16.1683621470712; Tue, 09 May
 2023 01:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230509030136.1524860-1-quic_bjorande@quicinc.com>
In-Reply-To: <20230509030136.1524860-1-quic_bjorande@quicinc.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 9 May 2023 14:07:39 +0530
Message-ID: <CAH=2NtzV8JYAGvHgpimjFuGvB2TTXMvhjoAvR5hJ7ma_ZG35CA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: sdhci-msm: Document SC8280XP SDHCI
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 9 May 2023 at 08:31, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> Add compatible for the SDHCI block found in SC8280XP.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 4f2d9e8127dd..9a87c03937c7 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -41,6 +41,7 @@ properties:
>                - qcom,qcs404-sdhci
>                - qcom,sc7180-sdhci
>                - qcom,sc7280-sdhci
> +              - qcom,sc8280xp-sdhci
>                - qcom,sdm630-sdhci
>                - qcom,sdm670-sdhci
>                - qcom,sdm845-sdhci
> --
> 2.25.1

Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Thanks.
