Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8FAB6214B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 15:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbiKHOET (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 09:04:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235004AbiKHOES (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 09:04:18 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398C965EB
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 06:04:17 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id f7so22604727edc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 06:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pOuVUHGB/nt6SD3eKG4y+yC+LFY5psBIun28gN8DHxQ=;
        b=mraXDAzEvWUkYLdSfSn1oRI4J+qXiisU8WT7Qggw18Rw6Q+sh/JibKl07KdjgPOJWR
         qOnatlGuDYYIvmXex51fHCx8FJj9dLZhOdTX6/Cp1u/rZmfOkwRzLR+RpQtycVZhidkC
         69bcIS+EJi3YA2PEvE/LKqqpHV02CquDM1LwHhrma4He9YS13Y0zVFy5Bakb23/5gRXa
         2mYWTnktCFARrLKz8N69FgePGFflbub380jZFYyC7yI+R9ldALUj6QkzsSWmqapybZxr
         GamK8uzwUd+U56OyQWxqEm9o9APD69DrYlMB1NzPMxIU0EOm8J4Pv4ZGwdWh25vdW48d
         xfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOuVUHGB/nt6SD3eKG4y+yC+LFY5psBIun28gN8DHxQ=;
        b=kRD61GaQYNVwonaIFQrSmEAFT8Z2R8DhH2GK7n27KRrEyPdaHABRmNzlYJXXRylbqu
         O9gl5VBqF+bdAg0jE088W6bHTHu4a8MA+E13Zsq0NnxKZJl4Z9r36xtoOuVGNzuQ/TSh
         0iaj2Y1/2+bcLnfQc2OteXdqurZiKkoqxlsS3lK1j+F6AYMifNf5a0fPJr8RdhYg46m9
         EGDryspjVMWl4tdFz4/6lvB2BmLrormAiAbm4jzjsUQgQVYx74P4oIm2N85QLP94Ll0y
         Ye6HmYAmSFhk8kIXrFrcHrryEyX7Um6BXx4uc3U9HsOR+zVxZ6y/6dgbcDGHBb8Rfd6o
         gr+g==
X-Gm-Message-State: ACrzQf1mbRObBjiPRuluAwPZfvTAZTnUn8apE6ztOGhvaQb98oUsuuia
        tKOokYaFUClPFuGv9dfGSaNW+KV7Jex6V437gETaDg==
X-Google-Smtp-Source: AMsMyM6OmDm5JLRbBgRu649DZayk9rNcoLdssTC0WnZ1PiM9RebJDA8TA269o8C4w/BaRm2nHDaHmJfeCM/QsVkv0jU=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr56020551edb.46.1667916255780; Tue, 08
 Nov 2022 06:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20221103181051.26912-1-quic_bjorande@quicinc.com>
In-Reply-To: <20221103181051.26912-1-quic_bjorande@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 15:04:04 +0100
Message-ID: <CACRpkdbp=7qDYSy1cYX3J9J6BgUdu1pwgkxd-Jem5r2t=C96gA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc8280xp: Rectify UFS reset pins
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 3, 2022 at 7:11 PM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:

> From: Anjana Hari <quic_ahari@quicinc.com>
>
> UFS reset pin offsets are wrongly configured for SC8280XP,
> correcting the same for both UFS instances here.
>
> Signed-off-by: Anjana Hari <quic_ahari@quicinc.com>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Patch applied for fixes (looks to me like it should go into fixes
at least).

Yours,
Linus Walleij
