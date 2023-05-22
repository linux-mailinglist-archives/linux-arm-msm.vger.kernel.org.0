Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3CE870B966
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 11:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbjEVJvL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 05:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232505AbjEVJvC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 05:51:02 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DC2E9
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 02:50:52 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30781184e78so2288675f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 02:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684749051; x=1687341051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iSXoKW4svoPOIZA9jwOfVXwEQMw1P1DLgfEryZQY9O4=;
        b=gqGvi3LrZgQHit/+h+4Ey5bU0o6PwdO3GmnHc1rGRfq4d0VB0PKS3ancXXcuf9Ov9g
         2ooq7qvY1a2CwLfZIMvqttTGEpYxR5dpPfCRqTOE39loJIKkqJjIFmzPZBpdK5+ZyxPm
         UNarICUOrBOZdX7SVzVrTTnX2YbgsYDOM02I9WNrl7/3pTNYOv6QApGIXvGQ/FlgeUwX
         yMGKCBN5mt6XtDxrCbFvu4uPJXHE4SVmHF1S4vv2AE4IxPpccZDII5dDD8hTiS7okyAC
         +Y4DvXXAsEMbocKlKD3LSYyh8q3DVO2vaUnfsFOWR3LqW0X4J1oXbI1Wq1TpV0qwmR2y
         u+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684749051; x=1687341051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSXoKW4svoPOIZA9jwOfVXwEQMw1P1DLgfEryZQY9O4=;
        b=hG3HpnJElMjwmQjOwRVNoSh17JTyp7yiybbBObBFq7QaZbHPrGDpjPW95sT4ciXRvV
         oSyJuZVcvknKf25eYZj7z8V8GmBNOc7BXlRzLmSVYtndP0K2cznG0V5w/AkWayb2I/I1
         8kXJ9zV5+/vLrscb0YMbsOLfGq5shQGtghEpK0OrOV6Rp5yQGiUV8kJzqmhdL6W6W1uS
         clH3xb2v6G8D2ONLR4NNceEpOIRHVjHweOlZbc8XWnzLIeVhMfm5FV5Y1hVU3ZgydtrF
         McdnBJcuTpd/5Kxv+bT+2S0+b0gcZFlidcpn9TEFvEwM2m5K4gk9HgOrjK43itvso9Mg
         rkuA==
X-Gm-Message-State: AC+VfDxzQMxOom3wvhQ78BlrtsYl1h2XLzKTqoUhe+Pmo5ilXac1oymk
        R7gW2EWH2/cDlsli3lW45S8HUBGEItOE8GWAPhRtUQ==
X-Google-Smtp-Source: ACHHUZ7KVWWZo1XmM4Mv/pWB35mbIcyC7xtFyONKlm9eEk7VRc/+pfTtPeVMp42gunjjlwaCJ/HJQWue46rXtz4eeoE=
X-Received: by 2002:adf:ea82:0:b0:30a:8f9e:8ee6 with SMTP id
 s2-20020adfea82000000b0030a8f9e8ee6mr1995815wrm.22.1684749050893; Mon, 22 May
 2023 02:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230522093620.3568-1-quic_kbajaj@quicinc.com> <20230522093620.3568-2-quic_kbajaj@quicinc.com>
In-Reply-To: <20230522093620.3568-2-quic_kbajaj@quicinc.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 22 May 2023 15:20:39 +0530
Message-ID: <CAH=2NtzzoUuVDNBmeEk7r=7b+i8pnmuteMrYtZw9JTYegix9ow@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: sdhci-msm: Document the
 QDU1000/QRU1000 compatible
To:     Komal Bajaj <quic_kbajaj@quicinc.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 22 May 2023 at 15:06, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>
> Document the compatible for SDHCI on QDU1000 and QRU1000 SoCs.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 4f2d9e8127dd..af29d60ff0d6 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -39,6 +39,7 @@ properties:
>                - qcom,ipq9574-sdhci
>                - qcom,qcm2290-sdhci
>                - qcom,qcs404-sdhci
> +              - qcom,qdu1000-sdhci
>                - qcom,sc7180-sdhci
>                - qcom,sc7280-sdhci
>                - qcom,sdm630-sdhci
> --
> 2.17.1

Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Thanks.
