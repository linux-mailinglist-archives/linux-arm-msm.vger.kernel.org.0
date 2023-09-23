Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C68157AC4E2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Sep 2023 21:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjIWTkb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Sep 2023 15:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjIWTka (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Sep 2023 15:40:30 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE59197
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 12:40:24 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d81dd7d76e0so4587432276.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 12:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695498023; x=1696102823; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wT8NcA0y1AMUmWyCInUSAwqrGAZb9JXNryfhTfON+tA=;
        b=lQu1bE6wB1ZLFS44AE8/DfHB6WH/Ev4aPbRTj/2P5Gm05HDF3UD3Z7ZBjxWbg8DwLW
         HB/E4jWa8efN9qm44MmMn+HEOf39C2J/cnX8OKw9DDivzZ9HeSYTY3ImLIQk9rRqxmSr
         VZPOYD4ZMCLn8PVsImbT1hd0Gpj/83ul4QfDxYIppUWoBytXrnFGkY11O2RrwDufbw6I
         xw1xEEYyjL2Yd7Sq60TDzcO1oloVCT9cxX5oud/Ss9ndy8XdIqi2EjteCdfEqcR3L48j
         CM6/SNXHYyxGw45FyuCVCCdUNgokwDYu04uILsvqnOumj/7/L9TwEERrJB5cLtCq5zBu
         m+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695498023; x=1696102823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wT8NcA0y1AMUmWyCInUSAwqrGAZb9JXNryfhTfON+tA=;
        b=vK5GDt+YkqYJfM7O0lZ54ukOId0Ayq1J7e5rWW+wg+puDbSeBckQqrWDH0TUZrrvIt
         YoIIXB8b2cyuSpkBrbt1tvy4iuAoFuDh8LgFS2oGMksDNl+jQw7Vyoae4wzO33Sas5AN
         JRm3qGhtvouKUySI/CKpBODiBZxEtE0MBJLQen9N2bbSr4hfbBYeQoqC+WcOjFtIeZwn
         2IEBvSbp768rOoG8CicqiXymMSVuuWuMM1PrSnj9dcZdd5G7gZDqISxNkSxNPWXqCQr7
         F9BBZRRP/sx3lVZtHH7Aho7z+PgYk3D2drbu2M8ixUMcI9QnRry8bO0sx7jz08ib/+vk
         CCiA==
X-Gm-Message-State: AOJu0YwPFl22ft0/XjbZePqge9W4CMMETflFMhdcAn+e1wVX6eHg4g9E
        Xqh5gdc7LuH2+3mg8gB4ndU8s/ds/CzAADWKs5x22A==
X-Google-Smtp-Source: AGHT+IGt16ZqM8IpsPbAvffNnhzKkeBKUQu3tObLJcRk4eEHrZmw1uF2gtqAHgXcUPdPwsDWctZKSRW6b6W3/2to7Fk=
X-Received: by 2002:a0d:df56:0:b0:59f:3c81:3a25 with SMTP id
 i83-20020a0ddf56000000b0059f3c813a25mr2583549ywe.14.1695498023697; Sat, 23
 Sep 2023 12:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230712-msm8226-dsi-clock-fixup-v1-1-71010b0b89ca@z3ntu.xyz>
In-Reply-To: <20230712-msm8226-dsi-clock-fixup-v1-1-71010b0b89ca@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 23 Sep 2023 22:40:12 +0300
Message-ID: <CAA8EJppstOof5SQz+fB1gDR2LPK8zs+tqJ99UUrYokZj8Z7J2g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom: msm8226: provide dsi phy clocks to mmcc
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 12 Jul 2023 at 10:53, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Some mmcc clocks have dsi0pll & dsi0pllbyte as clock parents so we
> should provide them in the dt, which I missed in the commit adding the
> mdss nodes.
>
> Fixes: d5fb01ad5eb4 ("ARM: dts: qcom: msm8226: Add mdss nodes")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
