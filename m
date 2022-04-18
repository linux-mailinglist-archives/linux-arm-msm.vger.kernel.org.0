Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97930505E62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 21:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347632AbiDRTXT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 15:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347645AbiDRTXS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 15:23:18 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6EE11EAE2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 12:20:37 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so15175180fac.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 12:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=cV6+6Ey7LaeWZPNbriTRkorx1rxnHKeq4jFNbHhfmco=;
        b=RfDcx726fSOkgilqjNNFdffOGia7ENNZq4jw6/IpNvYS2X96nsaU6+CizR0R0lVpip
         8XykJfQitz8Tf+qkrUP2a8h38iE5MNquXTF+M+ZfjDZxGruX0RF3tzwfYMTFDUujup9v
         vn+q0L54b59gb0Tdjc5oAILmSZnZrXXSh+Oi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=cV6+6Ey7LaeWZPNbriTRkorx1rxnHKeq4jFNbHhfmco=;
        b=Os+ZS7EovX7KBYroSS0mS2pjY8Rr+0HPncOVwLSG4V+rSHYgIRTa3fLMw867vbyqCt
         sGizK6ObI2X3oiHRYngU3be8BwSEchOzajVpcBKkvKIxoZw38xmJ0zM2upoFmxgQvpi3
         EUlxVIXRYGhZmErBgCY5hmPAQIPjWb3CLQ6oHoaPXaspAtP9n3WlFepY1eo0/p+/SNnk
         7DiHI86ybGcSthWTk/CZKeLjyQqny6BCyX/3sMyj8iHsfkEmwnyOh49lJWm6lyeVSlNg
         eijG4SURZF7d6ky40N37XoYu9pFUoqjWANyUVpRMR1CTDSowT1OWeJH70Tjrs8H+x4ay
         OCuA==
X-Gm-Message-State: AOAM531QiRoiLZNlBd5b0zYNQIC3ALX4ON862UZL87GMfxvCCgVVY63p
        jd2vlnJGuR9h+IDazYX3kXxj0a96Cy8KSU7Qi5SFhm1pqKk=
X-Google-Smtp-Source: ABdhPJzNf95/lk0150+WJSd18uvW1W5pdHmDXYK3zhdw8hZZpUZtdsFX7flLJWCbzkVJnlE9bwIuyJ0EGf7AjX1fhe8=
X-Received: by 2002:a05:6870:3907:b0:e5:a6fd:4047 with SMTP id
 b7-20020a056870390700b000e5a6fd4047mr4742504oap.193.1650309637020; Mon, 18
 Apr 2022 12:20:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Apr 2022 12:20:36 -0700
MIME-Version: 1.0
In-Reply-To: <1650285427-19752-8-git-send-email-quic_srivasam@quicinc.com>
References: <1650285427-19752-1-git-send-email-quic_srivasam@quicinc.com> <1650285427-19752-8-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 18 Apr 2022 12:20:36 -0700
Message-ID: <CAE-0n523c+X__wJwy=7e7WXGY3Crimne1-yUHM3Txf81n+bBVA@mail.gmail.com>
Subject: Re: [PATCH v13 7/7] pinctrl: qcom: Update clock voting as optional
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@quicinc.com, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-04-18 05:37:07)
> Update bulk clock voting to optional voting as ADSP bypass platform doesn't
> need macro and decodec clocks, as these macro and dcodec GDSC switches are
> maintained as power domains and operated from lpass clock drivers.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
