Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A25B556A3FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 15:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235871AbiGGNpC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 09:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235735AbiGGNo7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 09:44:59 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EFA2186C5
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 06:44:57 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id l23so721513ejr.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 06:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UG3BBJeQ9RIjyjrD9MOB3B5ohCStf2aBTETpevs+XUA=;
        b=X39mUG+jYTlLCiofyr0kiIG3mDhenlIh8E2uip6pT9ESNsQWC+IFZws1LCAOeKhmv2
         uMZOU76uVeoFJf0TVrVQej/MyqWt41MdhSk3TUzUTlJ/+jsZFtPuXwe/GO9aR4WfUsgy
         FwL4VdBDHlh1wInQKar1y4jfn6kh8wQDtQXrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UG3BBJeQ9RIjyjrD9MOB3B5ohCStf2aBTETpevs+XUA=;
        b=7dDWI5dIh0kTW8f7DuZfq4Y3ZBOBrMXFyx5BaM4xofTCf4shmnodMMDB78XIm4Cu72
         yyZOVdFnSpDMTDkdV2iHiQsKGyqdHeVt6nwxJNxprUUM1l0j3d0gxn5kZ203/nGQlMlw
         caF1JD/7ga9j/Gf4KubbZJ80TH7JqLOY8nPWk2Fw7hnHAt9ThzZTywylE0lHgTGiFSq+
         iOe9LwBFp+l2N6CBY/UrfHDtRAVLCbOpVWMnxqJh2VNFFbzOmtLsPWS8Su59Ux0+XmGj
         gLAbB3t/6183vXdV57JtrMZi7mSh6AIhNRgavAstLd8EipEHrw0m6Ym2oj1Ke/4JDYK5
         2qBg==
X-Gm-Message-State: AJIora9wF/H1zRcmeF3iznUMYEc7+duiuNjzi4g8Kg/QDH/qdAT3M1Re
        gpiaMpN0HWmprRmMTFRz80jcJzQxiElY5rrNxgM=
X-Google-Smtp-Source: AGRyM1scnXNyiRs/B1oLB3NjYyGftREn/kjGHx7wBX/T95dMk8zDgOuS4z8EuZjzewaREUQH+LAWHA==
X-Received: by 2002:a17:907:7f05:b0:726:9770:77d6 with SMTP id qf5-20020a1709077f0500b00726977077d6mr44568143ejc.464.1657201496134;
        Thu, 07 Jul 2022 06:44:56 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id d8-20020a056402000800b0043a71c376a2sm7677760edu.33.2022.07.07.06.44.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 06:44:55 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id q9so26391554wrd.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 06:44:54 -0700 (PDT)
X-Received: by 2002:adf:ead2:0:b0:21d:8b49:6138 with SMTP id
 o18-20020adfead2000000b0021d8b496138mr959496wrn.138.1657201493566; Thu, 07
 Jul 2022 06:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <1657197381-1271-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1657197381-1271-1-git-send-email-quic_srivasam@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 Jul 2022 06:44:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XD8vDPqkax1z6cB7ujOv_82YqkzZA1YNaPAGO+by4xJw@mail.gmail.com>
Message-ID: <CAD=FV=XD8vDPqkax1z6cB7ujOv_82YqkzZA1YNaPAGO+by4xJw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Move wcd specific pin conf
 to common file
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
        Judy Hsiao <judyhsiao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 7, 2022 at 5:36 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:
>
> Move wcd specific pin conf to common file to support various
> herbronie variant boards and to avoid duplicate nodes in dts files.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
> Changes Since V1:
>     -- Remove redundant documentation.
>     -- Update the pincontrol header comment.
>
>  .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   | 64 ++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts  | 61 ---------------------
>  2 files changed, 64 insertions(+), 61 deletions(-)

Looks fine to me now, thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
