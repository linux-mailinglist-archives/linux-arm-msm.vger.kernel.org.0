Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A96996626E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 14:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237195AbjAINXG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 08:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237268AbjAINWa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 08:22:30 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F931EED0
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 05:21:59 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-4a2f8ad29d5so112112327b3.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 05:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rz+s0oOK9CGszhUZRgwbVwGCcwnWbJEMw7HwfNcRehg=;
        b=Uhaqe6JtG8smjHRfW6q0YXgFSuMHrQ7FEXbnllZyEQHWvSos4x0efXml1JbfC9AhiG
         zCvcYOJt3ev49tfYsZOoZPaLfhV2lS+f3kcy8uxoM6xKoII7cCfPuRSjpd2BhM6qzs6S
         helwI452iS0FzUQ4lBg3Ao20uZHrBzBF9Xo8sULwwyTyrEUdJbfcnlENqMsIpyg82nRy
         +w8hTC61leJJQsTg9DsSCqhXb5wO+LTvhBY4w7QzkuIPnVSjoO5/wwVy+chy1SJFBG2g
         O5CRfDbUAbKed7SQKJit/g3CMRRuAUYZ8y1gl7ciorubW4JJOPwJTcp25NyBjFvqyoLH
         jpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rz+s0oOK9CGszhUZRgwbVwGCcwnWbJEMw7HwfNcRehg=;
        b=R/CLUimh1hvpyoVseKaJbRHKbrI0lHmxGRtw8e2BQB4E1Woczn3nxVGcv3zoSq7Dn7
         Mr9BnO4SEGuF38Qtu65O8+o8mNgWMphR9fEH+2vKWfDdiLOoemV0AHiEyNiKqaTEJtip
         Vyxr+3FdIEP4f4PdHbEhoyErarY765u/anFagD94EXSv1H4B0VUXuqmcVWNIi0Mvn3e2
         hSpUJgjBa5uKpCVeY3GCWveOSbXT2vJS28ykMilQVese5FtDsDrsKUCaqbbwlaQM+5hq
         YnSfzyWfeJwOYKr6RSDsZQajtwyNHoufEqLZ4amP8yXFDq0HsAIyO7sP9MgRzQhsrYi+
         LdTw==
X-Gm-Message-State: AFqh2krjNFr31UWGOe9EBjpdE5sAGdnEPieMnL0Y0r2HcI/7GZOrpo8N
        +M4MXjwkTh3nqp3VVaJeryUfUJsoXZM3IYgKHtMpVw==
X-Google-Smtp-Source: AMrXdXu1lkDXxVcao7eCMarSE+B3B5cecYgPmEwE1aiQrJEPXeDNzyVa2f9Y6Mleh0SHKD7uD6qnqmE6kOF9fRHTwrg=
X-Received: by 2002:a81:9c52:0:b0:368:e8a:3b1d with SMTP id
 n18-20020a819c52000000b003680e8a3b1dmr865977ywa.469.1673270518295; Mon, 09
 Jan 2023 05:21:58 -0800 (PST)
MIME-Version: 1.0
References: <20221230203637.2539900-1-abel.vesa@linaro.org> <20221230203637.2539900-3-abel.vesa@linaro.org>
In-Reply-To: <20221230203637.2539900-3-abel.vesa@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Jan 2023 14:21:47 +0100
Message-ID: <CACRpkdbzh6oXhS_qLYHeKvk5cXE7RGS=5XtAzSLcxJ-5D9gJEw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add SM8550 pinctrl driver
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
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

On Fri, Dec 30, 2022 at 9:36 PM Abel Vesa <abel.vesa@linaro.org> wrote:

> Add pinctrl driver for TLMM block found in SM8550 SoC.
>
> Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Patch applied!
Also carried over Bjorns late arrived review-by from v3.

Yours,
Linus Walleij
