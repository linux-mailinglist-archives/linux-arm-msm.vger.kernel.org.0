Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2883D54E1C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 15:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376805AbiFPNU7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 09:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376425AbiFPNU5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 09:20:57 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DFF433AA
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 06:20:54 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id l11so2119644ybu.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 06:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lUc87Jap898y+IIalqVZO2gl5CnCzU2QyBG8NQVcmGM=;
        b=q88uiE0E1kg3prS5s8m72FF9o/VgEeIkZHBX7dcUXI31XCT6lwxPsHgs51tr53r2PA
         0Mj25we68MBLG04mnrcLWpDKu2yvTkdJ0kFcIIwsE8sOYHefWxi+GH4qIVU+S2Mt7TAc
         f0KmplnOOQ1iq9DRanS6RPoAoE+HUb2j5YxrX/5EHmgSgnV3QIaC7gvvtFWWL0VwHwtv
         s3Y+EYeWpwkUkJ3ViyJaQ6tQ9CON2+JsWRrNFr9iizaNltsZ2JvrcqS7BBW7DbZnaTZ9
         EbM7z0KihSrDBrJzRMycD8bZ0T4m3glrx/sUcbGVRXKHu+0rJczYWDoZCBqRENb1P6yc
         6vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lUc87Jap898y+IIalqVZO2gl5CnCzU2QyBG8NQVcmGM=;
        b=WsdHYYWvVkX7ksy2CvvrBdYqohhTF+UsKRFtvYVbztDN4p7R+wC5cRJSKy5dHY3jij
         IaSbyXLhKLWIHEslqGqw3CXi/WV7RkJaSxzHCJ6dGQP2q+KS6PXadtG52ceqgANGQ57R
         uvtxDtdx6NpOPbCIk9JfdXK/tcWnme/yCs7Tz2dIUNodOoLkJOplXkSZzowP18VfRIzV
         Ewq32fcJTxh33tTb1MJXKvlI0mo3bVFVGxti7jKJGXo0MxrFIEqrhdtiOJmgbn997xHB
         ngLFePKsCaN98iT0xbqwTKppTBMynSgJH7KCUj1Fxq23OfKSINLmfOOlzIu+A+OHX+5v
         zRcQ==
X-Gm-Message-State: AJIora8d86ngHi68YNTCmHOIrYbo85YkYW4CxgA2lbOfu0ArgPFRlXD3
        e8M/oO0zxu9cUq79FTGflzyX5QtYCNWFUpIeMjGvJGd5VH8=
X-Google-Smtp-Source: AGRyM1u2t1y+crLk3AHoDyDv4IsZ7WNZDTO6dDelMZMuSQjGCXA49t3VXN/k20a8ixUwj4L6zeUKsMoPoPZQ1VfCJZg=
X-Received: by 2002:a25:dc0b:0:b0:65d:e5d:a87a with SMTP id
 y11-20020a25dc0b000000b0065d0e5da87amr5244211ybe.295.1655385654096; Thu, 16
 Jun 2022 06:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <1654921357-16400-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1654921357-16400-1-git-send-email-quic_srivasam@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jun 2022 15:20:43 +0200
Message-ID: <CACRpkdbEi6MBPXTLfDPk+ksgN4Y_UHFVOcaiWy=sZMa9WZ3T-w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] [PATCH v4 0/2] Add pinctrl support adsp bypass platforms
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@quicinc.com, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        linux-gpio@vger.kernel.org
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

On Sat, Jun 11, 2022 at 6:23 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:

> This patch set is to make clock voting optinal for adsp bypass
> sc7280 platforms.
>
> Changes Since V3:

v4 looks really appetizing, just giving Bjorn some time to have a look
before applying!

Yours,
Linus Walleij
