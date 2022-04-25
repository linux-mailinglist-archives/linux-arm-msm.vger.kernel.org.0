Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9554450E654
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 18:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239122AbiDYQ7X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 12:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243662AbiDYQ7W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 12:59:22 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F044F27CF2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 09:56:16 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id k27so4008277edk.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 09:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YXo+ObBRhEePToAUIshvslaAhUHCrrCP+3VFCVvt/4I=;
        b=Rgajd143kZY1K05Q9IPBzZEAvOdKl5fnxOqPjswV36E0PnneOrdTDzlLXfk6kEff2p
         ZleTcs3nOA0IxBGmk1VYNU3WpY+ADRDhClHGbKOIHkIpq3ZO8o2kLyocP4GGHG9F4YKq
         dQz+eUcxWYQmasGuiAGMdUiluNB71N08enuC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YXo+ObBRhEePToAUIshvslaAhUHCrrCP+3VFCVvt/4I=;
        b=V96b+0tJZa8qZu7CJ3Wv5o69KRdrtwtn7uZTvQcr9vY8G26kUprstXu3HLMHG7dJLV
         Ek9kOEMaDbhwL2SxcunXjWYGEadyaj2f8xl4mJG7DQMi1y6Dr/u2DI0Ng2+KpivtIiZB
         u063k07bvLhC7RTkK8EVBCKOUBmw5joDOJM7JdUabH8Zc4h9UKaz0ninzRDBtOculUXS
         FKs++k4IdR1oWCS3VrV0ZZCXny3bnj/7B9ZM+7+9znTTOQsrNhU9QCK4g1nxCmS+eAME
         i1UqY5TPQz0jENb7PZgcWsjcHQiB3Y+yS5awT8J+kwweyg5IbhJ/bmR5tloSjxvYqEnQ
         mdxA==
X-Gm-Message-State: AOAM531HShZbd7yGHl3LmwMnpTnazxhM687eOM5mfc+zBzuZ2A5g081H
        NMKd7vwU3h7vwa6z+dfP/wcLQxCXQQ+5sQ==
X-Google-Smtp-Source: ABdhPJwAZrC2pJppHwvC9elxbWrM864D7QYyaegleUmZRG6yG6fnWwbWB/W5yz5LM/alSct5TgdfOw==
X-Received: by 2002:aa7:cd87:0:b0:41d:90a8:2670 with SMTP id x7-20020aa7cd87000000b0041d90a82670mr20023027edv.404.1650905775332;
        Mon, 25 Apr 2022 09:56:15 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id hr35-20020a1709073fa300b006e8b9907b38sm3873572ejc.177.2022.04.25.09.56.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 09:56:13 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id i5so2712354wrc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 09:56:12 -0700 (PDT)
X-Received: by 2002:adf:f50d:0:b0:20a:e096:ef with SMTP id q13-20020adff50d000000b0020ae09600efmr1827132wro.679.1650905772336;
 Mon, 25 Apr 2022 09:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <1650621734-10297-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1650621734-10297-1-git-send-email-quic_srivasam@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 25 Apr 2022 09:56:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VoKE7DwoqSffXCbmx6MvOUEs7LbHiYtaR42BkHAei0dQ@mail.gmail.com>
Message-ID: <CAD=FV=VoKE7DwoqSffXCbmx6MvOUEs7LbHiYtaR42BkHAei0dQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280-qcard: Add ldo_l17b regulator node
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        quic_rohkumar@quicinc.com,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 22, 2022 at 3:02 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:
>
> Add pm7325 ldo_l17b regulator, which is required for
> wcd codec vdd buck supply on sc7280-qcard board.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
