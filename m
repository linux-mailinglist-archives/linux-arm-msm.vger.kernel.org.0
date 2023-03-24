Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0E226C7D6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 12:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbjCXLpS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 07:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbjCXLpQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 07:45:16 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142561F4A2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 04:45:16 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id b18so1782204ybp.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 04:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679658315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q8La0xLWr6gLifT69tT50MzQgCi7mxaTvUmaB3nLYfU=;
        b=gg/+RIP5i9bEJIO5JfQQ0JWBTcP5RSxSH0aRa24dz0vsLvJSS7HQUSTcKU73n/IwWG
         W03jArsRTdAgv8O/TafI+jMoVkIl2PEc0LIqW0tUBW/Yo+tCVTi50WdA1RqZcVucrzeD
         vK+/hhNfB6gKlyblScmO3Kd+P5v66dyy1nlOmpY9Z9A43oi5H5eMvNWUcD52j8hkLZVV
         elRn1rYPAH7Z0zncI4C+pQcTVwbBsZ1Cekdp0/sw7K01yf6uSwaSClU98sr3mGoG1f69
         liCA/c13zLXG3P+UlFsCwBixp/T1AYgxWYGb354ldbCzBa5AF/jCdLGVtQQgV1XdlU1x
         O3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679658315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8La0xLWr6gLifT69tT50MzQgCi7mxaTvUmaB3nLYfU=;
        b=Oc0GHjqZgOEMvLHc1ft4dYRH3E0mR+eaflcREjaXB9k+z7nfqcqk6aPvMtK6H9nUSA
         EBV06Mw/zl30PJo0hQGyX8PXwOVVZh9mKJ4YFYnGPKusW0s+XDcc1xXMp+La7D0sNtSP
         RxyOo3t0z6eoMIcqS9P6z48AgcEsb3VytpgXAHisQiKiIf3FWKXYaGv5unyUrFqpI1oP
         jd/i2LqbLDQA64ekiU3MwINBs+As8265DmbA/MYJSGlCn6ZS/CM0Vj+H/EYyt6U7wEaZ
         kdAhUvXDRVCukXlIDforKFJOXCSqAlJBuKIclmRdhg6lP7eX5pUy/lKU8pub2xJYZpiA
         JSow==
X-Gm-Message-State: AAQBX9c8HvCr6pb9/C6WoSSBfgwcTJi5k7xuDJmM94tj4EXbfj/IFYDB
        7G1LgOSoYv8uAU9VXGwgt4xIQiyeL0zTQQqqo/pTiw==
X-Google-Smtp-Source: AKy350bnVsaKrHF+n3nfjfnGoH5sED0NRDkUMhCvoXdMDk6x/u1CuTavuk6oYVDQvR/CijiLs/zox8VArwd9N5T5Dgs=
X-Received: by 2002:a05:6902:102b:b0:b46:4a5e:3651 with SMTP id
 x11-20020a056902102b00b00b464a5e3651mr1114081ybt.9.1679658314955; Fri, 24 Mar
 2023 04:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
 <20230324022514.1800382-2-dmitry.baryshkov@linaro.org> <083a8dc6-71d0-bcf5-664a-66c4c729399e@kernel.org>
In-Reply-To: <083a8dc6-71d0-bcf5-664a-66c4c729399e@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 24 Mar 2023 13:45:03 +0200
Message-ID: <CAA8EJpq2AoR+MePE2CQQShq=KO3NO+Jd0gVhhDUYq1NfV67yvA@mail.gmail.com>
Subject: Re: [PATCH 01/41] dt-bindings: phy: migrate QMP USB PHY bindings to qcom,sc8280xp-qmp-usb3-uni-phy.yaml
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 24 Mar 2023 at 11:43, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 24/03/2023 03:24, Dmitry Baryshkov wrote:
> > Migrate legacy bindings (described in qcom,msm8996-qmp-usb3-phy.yaml)
> > to qcom,sc8280xp-qmp-usb3-uni-phy.yaml. This removes a need to declare
> > the child PHY node or split resource regions.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../phy/qcom,msm8996-qmp-usb3-phy.yaml        | 394 ------------------
> >  .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 236 ++++++++++-
> >  2 files changed, 226 insertions(+), 404 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> >
>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC.  It might happen, that command when run on an older
> kernel, gives you outdated entries.  Therefore please be sure you base
> your patches on recent Linux kernel.
>
> Since you skipped DT list, there will be no tests run, thus this is
> unfortunately a NAK.

Yeah, I should enforce a ban on me sending patches after midnight.


-- 
With best wishes
Dmitry
