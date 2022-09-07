Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B60515B0F32
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 23:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbiIGVdk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 17:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbiIGVdj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 17:33:39 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC1EC0E68
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 14:33:38 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id y25-20020a056830109900b0063b3c1fe018so11145146oto.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 14:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date;
        bh=QscqM0nV84svG7WCGc8n2xoost3b0ICJjoMuYYPkgIg=;
        b=l97wHQLTtkoC2yyIythJfrgytAdirbzW+UXcePOcQqT8dD1nyb2Orof9p/7oMQ9ElD
         tGJZ8qoD+j4jh3drrCMeXTNRJZggeV2RWHeaZ0hG0dFTTMuK9JY6Tk3/+LD16B+21Pye
         TxaXPNmWr68NJFbOPfTIhJATk5usDAC2SYpEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QscqM0nV84svG7WCGc8n2xoost3b0ICJjoMuYYPkgIg=;
        b=PuFQIFSgewlymYBEyn8VFZF/W/ijA+CbbL5dEUc6ZkRihngSi//puT7Esk6akpvFOQ
         4qrcd1a6GRzW5dtNlqq2h/KVClilKJEuRsTg2ZHERCyBETUXt3rH2A7nbY0W7n4gtkt4
         2VxyN/4wSPuJ7mPIDaZZbN3ja0XXRT07EH8w29ypD2Y9gpGw03ZXozeNibGpyiZ0hFsE
         eHFQ10qimVjGKSBmgyJoL/pDYbys0nzVDPOcSPFkis262OfHZwUPR/sXK3HBtPFDl+mN
         iAT8uDjXyrlvMFnTYgxs8JF8fKqUq2WT83JeIi2WOoNN5lFwY4ZX4+U2ffkUxNf9D9h4
         5DuA==
X-Gm-Message-State: ACgBeo1KseEXU7yn/dTLSOfYsa2oDvWtCpku03PexCOdyUoSNFxK3s97
        B689gJ5rG+l3v8f4bGAIH/G/RlgKzn0LZW+Esr0wQw==
X-Google-Smtp-Source: AA6agR6xMl6s69LJEe9/ANEpj86tS5Mf5dVXH93JXMx7uTBSPGstJb9qa0FXVFjAjOE1JVl+mNneubqBOO5h7W4c6Lw=
X-Received: by 2002:a9d:53cb:0:b0:637:1ddc:615c with SMTP id
 i11-20020a9d53cb000000b006371ddc615cmr2302282oth.3.1662586417672; Wed, 07 Sep
 2022 14:33:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Sep 2022 16:33:36 -0500
MIME-Version: 1.0
In-Reply-To: <20220902043511.17130-5-quic_rjendra@quicinc.com>
References: <20220902043511.17130-1-quic_rjendra@quicinc.com> <20220902043511.17130-5-quic_rjendra@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 7 Sep 2022 16:33:36 -0500
Message-ID: <CAE-0n50x=h_rBaWAcTk_BBCMLpD=XQ6=BKLGp5+m8i4Lvn4fyg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc7280: Add cpu and llcc BWMON
To:     Rajendra Nayak <quic_rjendra@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2022-09-01 21:35:11)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 13d7f267b289..a839ba968d13 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3275,6 +3275,82 @@
>                         };
>                 };
>
> +               pmu@9091000 {
> +                       compatible = "qcom,sc7280-llcc-bwmon";
> +                       reg = <0 0x9091000 0 0x1000>;
> +
[...]
> +                       };
> +               };
> +
> +               pmu@90b6000 {

This unit address

> +                       compatible = "qcom,sc7280-cpu-bwmon", "qcom,msm8998-bwmon";
> +                       reg = <0 0x090b6400 0 0x600>;

doesn't match this one. Please fix.
