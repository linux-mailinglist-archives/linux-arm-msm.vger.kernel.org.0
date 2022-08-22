Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76ACC59CB78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 00:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237882AbiHVWbN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 18:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234431AbiHVWbM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 18:31:12 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D572550733
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 15:31:10 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 53-20020a9d0838000000b006371d896343so8668597oty.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 15:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=Uze3mrVtxDFOcmt/i3yDaS8brRCL06O+UHridDKP8uo=;
        b=ZKpYpsYM/o2jCq4rm/aUeXUa93Rb0CMhl5VbaCfX6JMtiO3ennKIUovhafoX45YR9l
         i3Tep+H3h7UvRRZ4u6KuS+r3OCLFJjf2mIeEoenknI403RvbYjGG/kcs2lW5Mlp7iMu0
         9tbEi1zXfALiNre8cHiCTtHyOo/AReyfMAIWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=Uze3mrVtxDFOcmt/i3yDaS8brRCL06O+UHridDKP8uo=;
        b=b5/mO2rGktAKFfG/OH0rN+P/ldM7FhOMMQnSnL+SNbm3wIR4lSq00WAMdtEkcSUW9K
         Fpod45ES66yQOCN/8Or/Up+njPyeqI2Q7DXI8TrhNuQ5V/tEUpuIR42Z+wxz7JSz8rIp
         D1w5xXDatKGufrQAhEkCUa7ZWkKPWdHPA5XqKDl23sWAWl3VPKd8i5svO+Y1TZ2LeFcK
         dBgNYGjxUJS3E/dO/FarObRmyV8en//G61SwttiP+9tM2fce/lDlBvML/H8ncnu2VDjT
         4Mv3L/TmJ2QTAhddNTgreZoLiw3wwakF1eIjnWPlbbRvcyDMd+dtpOPFPWkboR63eN6t
         zw8A==
X-Gm-Message-State: ACgBeo0gdnG/Ic6+rDkjyo/HLR5fmOwxql3U+yu9QptjwAslh+jQ9Y6B
        HvMB1YlQd3jngxTEsPpDcl39cVz7t+beqXCNZJp7sw==
X-Google-Smtp-Source: AA6agR5yVAK+oIZ1GWb2i1iV3WJcnW9FOaXtzHjX2k5tPGFm581PTcReO2HhFtk6zsZQzHNkTiKAHHtDQDlSEEXMb0o=
X-Received: by 2002:a9d:53cb:0:b0:637:1ddc:615c with SMTP id
 i11-20020a9d53cb000000b006371ddc615cmr8858507oth.3.1661207470142; Mon, 22 Aug
 2022 15:31:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 17:31:09 -0500
MIME-Version: 1.0
In-Reply-To: <20220710084133.30976-7-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org> <20220710084133.30976-7-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 22 Aug 2022 17:31:09 -0500
Message-ID: <CAE-0n53rQ-_3wgH-QDyVnMhja2LW0_2nLUdy==6wQOTP9VA36g@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sc7280: drop unused clocks from
 eDP node
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-07-10 01:41:30)
> The eDP node includes two clocks which are used by the eDP PHY rather
> than eDP controller itself. Drop these clocks to remove extra difference
> between eDP and DP controllers.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
