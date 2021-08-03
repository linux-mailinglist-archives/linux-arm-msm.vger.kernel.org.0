Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6E43DF61A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 22:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240395AbhHCUJc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 16:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240260AbhHCUJc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 16:09:32 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299C6C061764
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Aug 2021 13:09:21 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id c2-20020a0568303482b029048bcf4c6bd9so21842208otu.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Aug 2021 13:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=/KZKCjnFh5BKZu2KIsfFmmFiIjkF/h9tteMntf9BJ8Y=;
        b=hOFgqrrzW2IAV3YZCxNDNqnJZItMegMe1VI69lm8ik30j4B5rqVxr/IEGdnIQqnB4X
         Jq1Czj/KXh433bmpZoWbEFEylw/Pn4jdK7o90p7USNjCQxfW5eQZzRYuMpAiyjbvbPxG
         VVdEdfkw80xXk1oAS/1vOpZ1/rJpJguVg/p3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=/KZKCjnFh5BKZu2KIsfFmmFiIjkF/h9tteMntf9BJ8Y=;
        b=LqU7cYyIU6H8DNu1rwqazi9o3dcrO3cs2LjGcfz1Dvs8a4cbiwdMuM1flbovOqaJvx
         Q7GzFG/l91zWOwCRXyxtmFtVCu5lR3y5mAqgcwN7UoH/kNKNmrxpwKn40CM5hiKZ64DE
         x1AevLMxudUoIkbp3G+FIa9zCwlRffpi+ZsXWeVhUkgnaJcqGUGzDmkYHlOLop64OEld
         vE9t1uAKJWp/mqPjA9Byd4DlFh26KPrewq0LtulHMSqqvgKUz3oERX7zssdBVskshsV6
         G0Yko84OAI1y1V289yebJTY75utothLYIhMqzGb+Pggn8Vkh94Nv+Z4o61RpCwoIyYlR
         gbAA==
X-Gm-Message-State: AOAM53026LsZvuony8Ir2kMUsn57BpFDqJU6Q0twrAusDsAs7flP2OaR
        xhMcpmzLAZtp+0WLEkGQOV0AeUiFFE/Oq/BIKG0JtQ==
X-Google-Smtp-Source: ABdhPJysxfT1U9uGt9nsh5yQLTpopi/8CZ5Kck3OSg9MK8KloJG9UDSWBnr//f2uQIsAgC8G1VK1gNshpiJ3C/EmUo8=
X-Received: by 2002:a05:6830:1490:: with SMTP id s16mr447074otq.233.1628021360166;
 Tue, 03 Aug 2021 13:09:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Aug 2021 15:09:19 -0500
MIME-Version: 1.0
In-Reply-To: <1627995852-24505-1-git-send-email-skakit@codeaurora.org>
References: <1627995852-24505-1-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 3 Aug 2021 15:09:19 -0500
Message-ID: <CAE-0n51=GAb+B-46gH7MKwiMbP8EqNnFKNQr0X3JFeAMP4rPNg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Remove pm8350 and pmr735b for sc7280-idp
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        satya priya <skakit@codeaurora.org>
Cc:     rnayak@codeaurora.org, kgunda@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting satya priya (2021-08-03 06:04:12)
> Remove pm8350 and pmr735b die temp nodes as these pmics are
> not present on this board.
>
> Correct the tabbing for pmk8350_vadc node.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---

Fixes: fbd5a1d22607 ("arm64: dts: qcom: sc7280: Add ADC channel nodes
for PMIC temperatures to sc7280-idp")
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
