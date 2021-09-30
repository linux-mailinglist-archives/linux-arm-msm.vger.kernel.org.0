Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A3C41DB31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 15:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351500AbhI3Nhk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 09:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351261AbhI3Nh0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 09:37:26 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921EFC061772
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 06:35:35 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id b12so6820021ilf.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 06:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dbEKu1/TvJPQ4Z2h0b6Gx0hXWCi4B3ME4HJBi8xU2sI=;
        b=ebdsjkrcaH7CkAYfRMGMlQzpTq2ttq8JNlE78u35qQkb7PkZwKuDFMV65o/txFLLp6
         O32jnwJtMXpU7CjUtkTHO2YsgHGLkLMDHFanpI/nQ3c15cIU/zVKtXCa+bf/aDSH+FTU
         01mj/Gzz513YnIwm6spZEseoZAyNa/uWEovEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dbEKu1/TvJPQ4Z2h0b6Gx0hXWCi4B3ME4HJBi8xU2sI=;
        b=3DG3VGNKOCbvPQo4RlkJstMWZoctK6OvJxZHrn5xe5d6ODUW0kAGdSA5dGnZVJeM/J
         TlMrap150yhxeJqMsVOvCfcEiciG5DJnSXD7GvgdJCtA5+P+LUXOPHJtsTha0vw+IMBT
         0f3QSRtSWnfDTJe4UbhVnVfsDpxo+Cvti5oz1thnbZk03vTInr2/aWDfSdEoaPqCBjHS
         5ttH0d2iUSJxPM60907Cla9i+64ozUDBB3uascM4su4E53Q9Y2xAJ/f/k9NGuA6fv5vV
         h94BPpaN78S0IhFXjzSjvI3yRE2c1biYu6Q/Qqw6ZHAnr95E8apY3+NTm4xFNHSZk/Yo
         PFMg==
X-Gm-Message-State: AOAM533FJpOicWUlEwa6xtpUBgFafyOABcgt5M5uLT2duQ/vF+iDptI8
        V74+WtrzlNMgYQc3DJCihNV1ReHX2TJsqQ==
X-Google-Smtp-Source: ABdhPJwe/IgxUSiKz+phRwYA5IhdSuWzSAomY+Wb9EmreiNca/MA6BScd+9HHJYALI7e4E+5uYGJ5g==
X-Received: by 2002:a92:cd8d:: with SMTP id r13mr4250891ilb.244.1633008934913;
        Thu, 30 Sep 2021 06:35:34 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id d1sm1814490ils.25.2021.09.30.06.35.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 06:35:31 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id x2so6873513ilm.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 06:35:30 -0700 (PDT)
X-Received: by 2002:a05:6e02:1bad:: with SMTP id n13mr4196229ili.142.1633008929712;
 Thu, 30 Sep 2021 06:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <1632997450-32293-1-git-send-email-rajpat@codeaurora.org> <1632997450-32293-2-git-send-email-rajpat@codeaurora.org>
In-Reply-To: <1632997450-32293-2-git-send-email-rajpat@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 30 Sep 2021 06:35:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Veo+cRCRT6p=Di36mnO5cp7p+EGOUSo351-y=R1znGbQ@mail.gmail.com>
Message-ID: <CAD=FV=Veo+cRCRT6p=Di36mnO5cp7p+EGOUSo351-y=R1znGbQ@mail.gmail.com>
Subject: Re: [PATCH V1 1/2] dt-bindings: spi: Add sc7180 support
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 30, 2021 at 3:25 AM Rajesh Patil <rajpat@codeaurora.org> wrote:
>
> Add device tree compatible for sc7180 SoC.
>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
