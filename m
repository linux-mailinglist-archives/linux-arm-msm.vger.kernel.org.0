Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F113466D0AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 22:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbjAPVFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 16:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231987AbjAPVFn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 16:05:43 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E6782749D
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 13:05:42 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id e202so8292653ybh.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 13:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qi16rqRfpVxEIDPG8yaq6fMfKHFwbsCk0KPMN6hDEDQ=;
        b=PBMJZDaOQp1JclDMa/01hpziebOYPox2et3WTjTnSzGSEMZvGQT1Lbv+hPf02Z0MA4
         0YJH3/pd6X4vxKQqgqv5nogChYwIYBG5F4FgkPoydW22jCYyGZtcA3n0P2UhYdZElG+l
         r6a1c+qvdYN2mMWj/Fy9mdWXfJO5pZ5jbH4GdqPE+pXNYhKmzx3U2VUIM2XI/qftzDAH
         cFOoP+buTHBEH2OS7tk9Mitg01rfy/YYIszs6dzkiVnbByiIMeSfL/M3Nqt9o9oCA5/5
         AuIuWCxo05EF4CVHbfqRneJ5lPJqEwYcSTKKR79omXvE+St8fCQKd1ocTM8u6jbNA2wx
         STiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi16rqRfpVxEIDPG8yaq6fMfKHFwbsCk0KPMN6hDEDQ=;
        b=VBwMwmp9IfHgzzUVKPuC4CDhLsHnqmYvBlYpo3wx3TNtleyxN8qO3Dxn840gsrI0uM
         hMWhZiZdYigW/i8ZHfZhOZbR7xOZjc1XsgROSYuMZkMhg8R333Ud8+WrVU6lhV+WRS6W
         b//gVM9w73yhi5GFd9QaH952JLtlXWH3rFVTfRr5G0HkjuW0ahdeJLtZCZ+qdD09zb3d
         EmS3mEO5l+dlKg6zS96VYiEjZOpai2Bo9f/dwMN9WEsQ38xvnHB4drsfGJGmSKYMjJTX
         Jn11qg7zoUKaX5FdvPi6GHJIF/1ATC1zvtwM3lf8xbVjJsy5NeA32s9zTATiXmJsBgkL
         Zkew==
X-Gm-Message-State: AFqh2ko+dOJasMtz+IyeD333Ju7UWudqyrrMbpe1+wK0KIO4CJpBNshV
        0+KC9Vr+sS6IfvO1YjdY6eqboAgTags72n9a0ozs4A==
X-Google-Smtp-Source: AMrXdXvUFbKj/8VK1PqxF3SoqqhT54oJaVtabwef3rW+11qq+8X4WHWpCQjx3gPW4zHB70/sxyRjqRKMlHRycFgU+3s=
X-Received: by 2002:a25:9002:0:b0:7c2:d9f1:3b04 with SMTP id
 s2-20020a259002000000b007c2d9f13b04mr147791ybl.516.1673903141353; Mon, 16 Jan
 2023 13:05:41 -0800 (PST)
MIME-Version: 1.0
References: <20230116204751.23045-1-ansuelsmth@gmail.com> <20230116204751.23045-6-ansuelsmth@gmail.com>
In-Reply-To: <20230116204751.23045-6-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 16 Jan 2023 23:05:30 +0200
Message-ID: <CAA8EJprEOaduAd_OwpbW0m4aWwoFxNVqExTtMhTK4giPMkBGFA@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] ARM: dts: qcom: add and fix clock configuration
 for kpss-gcc nodes
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
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

On Mon, 16 Jan 2023 at 22:48, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> Add missing clock configuration by adding clocks, clock-names
> and #clock-cells bindings for each kpss-acc-v1 clock-controller
> node for apq8064 and msm8960 to reflect Documentation schema.
> Add missing #clock-cells binding and remove useless clock-output-names for
> ipq806x dtsi.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




-- 
With best wishes
Dmitry
