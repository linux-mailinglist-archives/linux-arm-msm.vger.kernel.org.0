Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2942850A540
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 18:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbiDUQ10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 12:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbiDUQXN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 12:23:13 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FBB21E39
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 09:20:23 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id g21so5803891iom.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 09:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jTmusAwV684aMFKs/ZUE0USXjWO4fp53UX1om3MGtII=;
        b=Nrnvl0OWGMELGK7BoERttSSU3k9U6KUVq6m6cjxcpQAup5ZK+dm2scxx+z9XbHF+uJ
         6W1kI6Fy8lOkCpoiQw8vSjLeEfD1yUtZys7Vy0amFGpgH/Xw8I3npCSLHXN8tOLVp462
         YlBxXXRt4ZYhilcS3X+45XAwxVTrloIy28gkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jTmusAwV684aMFKs/ZUE0USXjWO4fp53UX1om3MGtII=;
        b=nboBn2kRWvlb1cq1dgQo02D1jQjDrB7xapJhF2NYFVa5lon7bghSZEGUVQ+1Zaq6Ke
         zSBUyvJbfoaTqIOLexQY1XJPHar8VF7IWbPxBsf+jjrLWl3F6c0IJWlOvgP2qWdLW4Hn
         BLUQ0QmPrzcH/4sZaIp7DbjN9XdKdvIUi4FCDUJiEn+ylyi/Io5XuSE+WU3ux3v3mMR2
         6sBctqA9mX7vWCGjO9X/RwJPnwDBxUp6TICi52HM2NSVTUoTkd+1VTWU4RuM99fbNnoj
         L/LzeAVdqJX2tl9N9Toq2WaZALSgWwRiFZAXH00QbRvyFCOMT9vAHmNixZFjv0Dcpr/T
         epGQ==
X-Gm-Message-State: AOAM531pMAOugdXlNvPv5KPd/cyaDt09dhA6L7FS+PNMRtWrzGByKsVg
        L71hSCyFZjWZ5j9F4D1CxlfUvVEcZLydSpqQfTs=
X-Google-Smtp-Source: ABdhPJzThRKMlH47RHMK63y0JmmfR3dtx8iXGP8s2YjJZYGec6ZqDHxcaXJBDm4X+4JDby8IO0aquQ==
X-Received: by 2002:a05:6638:50f:b0:326:81a3:a474 with SMTP id i15-20020a056638050f00b0032681a3a474mr183751jar.197.1650558022280;
        Thu, 21 Apr 2022 09:20:22 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id h24-20020a6bfb18000000b006497692016bsm13645918iog.15.2022.04.21.09.20.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 09:20:21 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id p62so5879702iod.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 09:20:21 -0700 (PDT)
X-Received: by 2002:a05:6638:2607:b0:323:c9c9:e219 with SMTP id
 m7-20020a056638260700b00323c9c9e219mr200203jat.229.1650558021381; Thu, 21 Apr
 2022 09:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <1650550779-8133-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1650550779-8133-1-git-send-email-quic_srivasam@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 21 Apr 2022 09:20:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VODaTxu+c8cXWyy8Mw1Qm145vwt-UspirE6k-XL-MZdg@mail.gmail.com>
Message-ID: <CAD=FV=VODaTxu+c8cXWyy8Mw1Qm145vwt-UspirE6k-XL-MZdg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add ldo_l17b regulator node
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 21, 2022 at 7:20 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:
>
> Add ldo_l17b in pm7325 regulator, which is required for
> wcd codec vdd buck supply.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

The ${SUBJECT} should probably mention qcard somehow? Right now your
patch subject makes it sound like this applies to all sc7280 boards,
but this only affects those including the qcard dtsi file.


> diff --git a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> index b833ba1..17d0c05 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> @@ -113,6 +113,11 @@
>                         regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>                 };
>
> +               vreg_l17b_1p8: ldo17 {
> +                       regulator-min-microvolt = <1700000>;
> +                       regulator-max-microvolt = <1900000>;

All the other regulators in this file specify:

regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;

Why doesn't yours?
