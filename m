Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 602F350C01B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 21:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbiDVTGo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 15:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbiDVTG3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 15:06:29 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F7613AB56
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 11:55:37 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id f13-20020a4aa68d000000b0033a2c53d0baso1570884oom.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 11:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=OzJwbTlQ5CJq/RrC/jGJQpBejYRhRViMdibg0uOTI3E=;
        b=mTHk9DTfYvsaJW3PRKyUsqoHdHZD4IP6/MrS4TPvAs8Hk/8KxfkDCQW4MVG51y5ZTv
         9MKmLP+X7+XkN1eBTusqAiLA+vBjALdK9n1uTzxp9aC8stEiZofN7Kyn0TxUCIVHsN4U
         VmZRZFdWSCrUHgAy+XmlECriJewFQCzWvxZHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=OzJwbTlQ5CJq/RrC/jGJQpBejYRhRViMdibg0uOTI3E=;
        b=JkJ0p+p7SD7RhmKfY+tKiPzZ7h7pRdPPi+TjP/YxL6MBQi4H+xrt4BjExMb2w1nevj
         xwape2O2CzKAYrGj5+832b1VmItKZtLTAP/BNwJsuswpqSCLYSaFyzzNvkS1GXabJCOg
         HIzEGUi+w7eE7tpidlx5wDGBMcgumFmJJT0rK0b+dA3/yU0XShmmznro9bNF0pHi+R8c
         KRXxWhal+t25VzGdbmJlL8aCEJaHab7J8iDm4NOlq/ymUYfiLLH0tywf4M/WvQsXtKTf
         9xnN9AugIFgTv3dDi2ZnW11jQG2GDBfB6wvOkgzitw4JFbbfEH2idjLNwyS2GwLNuGMk
         ZSEg==
X-Gm-Message-State: AOAM533QgeGtCHroj7XOd3RDaCR4QKYayw4HsnY8y9YhhFL6OX+nqYxL
        aR/6n9EYCuLtonlY0D2BCBpaY6zq7m80HeJwD23mew==
X-Google-Smtp-Source: ABdhPJxybbIi1hEyAcfi/V3yEnSJipqITB3vlp/TaI8mUT8lmjCW3COZdZf3uW0sjb9k7ZQrODc2JlVXEK2EZJ8H9gw=
X-Received: by 2002:a4a:6f49:0:b0:35e:1902:1d3b with SMTP id
 i9-20020a4a6f49000000b0035e19021d3bmr1514867oof.1.1650653687684; Fri, 22 Apr
 2022 11:54:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Apr 2022 11:54:47 -0700
MIME-Version: 1.0
In-Reply-To: <1650621734-10297-1-git-send-email-quic_srivasam@quicinc.com>
References: <1650621734-10297-1-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 22 Apr 2022 11:54:47 -0700
Message-ID: <CAE-0n520B-+QK9vxWQdRV3ChMEN1mD3fBSEY+YG9N4EvGc9wwQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280-qcard: Add ldo_l17b regulator node
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rjendra@quicinc.com,
        quic_rohkumar@quicinc.com, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-04-22 03:02:14)
> Add pm7325 ldo_l17b regulator, which is required for
> wcd codec vdd buck supply on sc7280-qcard board.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
