Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F50D5A1084
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 14:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241780AbiHYMbn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 08:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241770AbiHYMb3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 08:31:29 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4777DF64
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 05:31:25 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id c93so1188366edf.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=GpfgEoOH4Bk0o03BXzXfbjZSZHr+iWqvwXSXT6fbHDg=;
        b=aJDALMPobe0TjSh/jiJJfZku827C0K6keCQCIpXty6OvQ/1gDP0KEl3Zh1+tQCiUPN
         FZuZW5tsnab7jNTnlMJ4YZySqHgaNfqs5mwtbjlnIYr9M6+whBK7uftBtVEyvJnSBQ7z
         fuiyYX/H2NKWhlvR66MZOsHc3JZMgKzOBB3LkFy5M8Vo2t5aBv+i7++c3/g2BD2oq9o+
         vRPLQAMw89+BYM2XOvmulF/NB22gpgQeTopMu9SrsN31yNX0hZOccyckJT1Dzib+QcCC
         D2MzvJFyilBzpmtyGSDIDTWatSUSlyXjDtUXJA+JJVFR6ESHfTeqjTt9NDe1cD71Mgnn
         4pQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=GpfgEoOH4Bk0o03BXzXfbjZSZHr+iWqvwXSXT6fbHDg=;
        b=NNYXK9f5CaH1tL4+h34HGgDw1eMsuxq+Kq1rBckv6jTRaM5VAJS2dj8/Ry+u9deR3P
         BAenJWLDOSLDcrEHaQt8p7FlkgEmC678HhdcEsvNmVkRE9DsSICanG/0HktWYetkh0Rg
         3O0KvXiyNTV5XIW3SieDrqK1bbmg6i/qyzVIOHATkTbkUHt3hnMHOT8jVuABnDAL0Fut
         mMppkG5VPZYpvfXZh7ZjgsJcYK+nBJCJ5yJZ2bS/sUZAHT74AYwMEUAc0TYbKwErD8ws
         G7m01tQBlHgsRuZCDBb5ENeIF6nbBrlLlEGeQBHqKDRLw/jkOV3Fq45XsBzeyI3syOPB
         2mTQ==
X-Gm-Message-State: ACgBeo21twTtBWgBa13qlEvTPE/Nr6OHGQTjuEQnjLdMyJNk11FldSXO
        uEwFDHIZdYAYFR4r+R2aZEruxqcVPGWFmv1AJ1H2ww==
X-Google-Smtp-Source: AA6agR5AzWiEJVw97Qs0InhBJT1xWHu/mHYs4QXnlx7YgLLGzvNmzJPWmXmaE8ZpDzHKOuoj/4+kW5Z5Q4A2grdcxVM=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr3051832edb.133.1661430684201; Thu, 25
 Aug 2022 05:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220817113833.9625-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20220817113833.9625-1-srinivas.kandagatla@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Aug 2022 14:31:13 +0200
Message-ID: <CACRpkdaMyqtY+cQZSmcs6Hejoin7DKTVWbxTvfkSSM7ceo72NQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: add support for SM8450 LPASS LPI pinctrl
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 17, 2022 at 1:38 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> This patchset adds pinctrl driver to support pin configuration for LPASS
> (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl on SM8450.
>
> This IP is an additional pin control block for Audio Pins on top the
> existing SoC Top level pin-controller.
>
> Tested this on SM8450 MTP
>
> Thanks,
> Srini
>
> Changes since v2:
>         - removed unnecessary quotes in bindings
>         - remove lable in bindings
>         - fixed gpio pattern and remove an extra line

Patch applied, the patch looks innocent and bindings are reviewed.
If Bjorn has any further remarks I can always pull it out (or you can make
patches on top).

Yours,
Linus Walleij
