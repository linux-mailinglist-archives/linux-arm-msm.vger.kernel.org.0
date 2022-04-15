Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9855501F70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Apr 2022 02:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347922AbiDOAGW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 20:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347910AbiDOAGT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 20:06:19 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7F9BBE2B
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 17:03:53 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id e4so7106309oif.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 17:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ro+gSfD7MjZ+mLIINFFkXoXNc/h+CjL8cuFVRh2byk8=;
        b=BFR5pAl2lEtAbigA2lyeUxNxd+VrlRZvDrD2+dCzsqu5BGthaWCGx8PGgAo5jQ6/n2
         36LLdQIOTS7fChlUT2/JWuBigQvtLEYAz+JK2UqhP5ueSlb8BEgRZV9Acw8mNXj/Mtff
         T49YhL2p8YcBr5smvMyAh0G2YCcgxAIW752eU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ro+gSfD7MjZ+mLIINFFkXoXNc/h+CjL8cuFVRh2byk8=;
        b=3al2eDUP/kdvdOssTCVpIqRCWdAeF24E92x0Tced0Tyx/wI37Sovg7Fn8JmkNycguk
         B5mbqJQQCWXhgFV+2uqTBsHkhSrt7dBglNlf624cvWvR4Fnd297OfpATugEJHOywYdfb
         S7dwbf7z52WDDyVP9wleYxmZLkNHt3AjZObjx0hpMLLsaMfQNl90DbWEK32kUcv0tuod
         1YxzQh5UFBclhQGuBBrlHa7Wd+9PF+I+YWDqtGbmrYbIyZ4nNYgdVN1hcsx5PYyTmZTg
         NXORehwk1kBD4vO+FhG/E0HAYzMoDkYRs8B3t0Kvz8DRvH5AU4NqpQNpY05GIydVf0iU
         M51g==
X-Gm-Message-State: AOAM533MGsNmiDJX4ECBkp2ad7ojdLLbydtxKaRlEz4oT+p2IfgvqDSe
        tUWJ4MXHhM4NSCaDYCZ2fuXepp5Tbn74NjcTo2NCNQ==
X-Google-Smtp-Source: ABdhPJyvlqfJpLh6LqpUZLTRAdRrRZ5O4NePRzZQuh/RNO0gZkwkRyFNFYkE75jZPHHTY70a+zi3S+y/ofsIwFxwS/c=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr504998oif.63.1649981032577; Thu, 14 Apr
 2022 17:03:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 17:03:52 -0700
MIME-Version: 1.0
In-Reply-To: <1649944827-6455-3-git-send-email-quic_srivasam@quicinc.com>
References: <1649944827-6455-1-git-send-email-quic_srivasam@quicinc.com> <1649944827-6455-3-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 14 Apr 2022 17:03:52 -0700
Message-ID: <CAE-0n51bQxX8pDeT-nArmt3x1Yv=2T6B8RrapfB4EgHtmdLT_Q@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] arm64: dts: qcom: sc7280: add lpass lpi pin
 controller node
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-04-14 07:00:27)
> Add LPASS LPI pinctrl node required for Audio functionality on sc7280
> based platforms.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
