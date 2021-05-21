Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5917F38CF4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 22:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhEUUsa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 16:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbhEUUs3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 16:48:29 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F81C0613ED
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:47:06 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id d21so20834126oic.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=TQcLiSVnKRJzenCwna7ngqxRsaLGZr+v2iY6EXgsM34=;
        b=RxV7PAPfAOW4VRWCsmjDUqu+14k1FN0EOjRQCi1xSa9voQD/0fwGKwju/JKybmgHH4
         tSPHk6AZ2iA+BGGxKCoaluylMdKll9vykrQc1o1Y5pzieScoktGva9Pk7Hvp1DnP93d9
         namjq3wKjEPWQ9MxTuJU0KgSNxtHrvHCAU02E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=TQcLiSVnKRJzenCwna7ngqxRsaLGZr+v2iY6EXgsM34=;
        b=obbLcIsCo3KhyFWGJJSzacq65welpkABjTRJJlo8Am1Gg7hO+cf6Y+bQWtx3QYqUzB
         Gfz62lrYNPpIWHe+vwMW2xBTm7hEPCKzhFX/ao3hicULQgWyihCZLoMhsrOfWNdfqBnY
         G/mEgDpE7iH56Fm/TwmpufpjEPFP4Tz4/oYpJwSofOIg1HLdTJj8yh6j6lFzRkB6tov/
         +/9DKMlH2xE11Aqz1XLWeuqVH6u0cDIcQIxjWKnWnc8z08KbET+JNptEKcvhFiLegrmc
         a3+Um+vjGKXvqsLkRmZTr3IWYYQQI0JkjGLfdW1tdxizZoehvqftGp2gkfuFPF2cK0Ro
         D+jw==
X-Gm-Message-State: AOAM532hMLcj6n/n4GE/xPjHqhwpD3aPpiukwViHNHfeLurI5+7xoxJp
        0NsAsnTXQXOnHhTQFnxQNHc8AagwwJcwxnJwkiBq5g==
X-Google-Smtp-Source: ABdhPJwAxNdSvrqf4vckEtp82I8zCxcDswz30BhHrCBYKGAA1KsXJKhSRvwPpYfWclMZWwJJXlpQ71zH6w0LGYnM3ug=
X-Received: by 2002:aca:654d:: with SMTP id j13mr3613806oiw.125.1621630025860;
 Fri, 21 May 2021 13:47:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 13:47:05 -0700
MIME-Version: 1.0
In-Reply-To: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 21 May 2021 13:47:05 -0700
Message-ID: <CAE-0n51JasjB5Hai6uM74kCCPNx4Xip1fW5v2aEqdz=edytf+w@mail.gmail.com>
Subject: Re: [PATCH v17 1/4] dt-bindings: msm: disp: add yaml schemas for DPU bindings
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        dianders@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
        sean@poorly.run, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-05-21 03:27:21)
> MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for DPU device tree bindings.
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>
> Changes in v2:
>     - Changed dpu to DPU (Sam Ravnborg)
>     - Fixed indentation issues (Sam Ravnborg)
>     - Added empty line between different properties (Sam Ravnborg)
>     - Replaced reference txt files with  their corresponding
>       yaml files (Sam Ravnborg)
>     - Modified the file to use "|" only when it is
>       necessary (Sam Ravnborg)
>
> Changes in v3:
>     - Corrected the license used (Rob Herring)
>     - Added maxItems for properties (Rob Herring)
>     - Dropped generic descriptions (Rob Herring)
>     - Added ranges property (Rob Herring)
>     - Corrected the indendation (Rob Herring)
>     - Added additionalProperties (Rob Herring)
>     - Split dsi file into two, one for dsi controller
>       and another one for dsi phy per target (Rob Herring)
>     - Corrected description for pinctrl-names (Rob Herring)
>     - Corrected the examples used in yaml file (Rob Herring)
>     - Delete dsi.txt and dpu.txt (Rob Herring)
>
> Changes in v4:
>     - Move schema up by one level (Rob Herring)
>     - Add patternProperties for mdp node (Rob Herring)
>     - Corrected description of some properties (Rob Herring)
>
> Changes in v5:
>     - Correct the indentation (Rob Herring)
>     - Remove unnecessary description from properties (Rob Herring)
>     - Correct the number of interconnect entries (Rob Herring)
>     - Add interconnect names for sc7180 (Rob Herring)
>     - Add description for ports (Rob Herring)
>     - Remove common properties (Rob Herring)
>     - Add unevalutatedProperties (Rob Herring)
>     - Reference existing dsi controller yaml in the common
>       dsi controller file (Rob Herring)
>     - Correct the description of clock names to include only the
>       clocks that are required (Rob Herring)
>     - Remove properties which are already covered under the common
>       binding (Rob Herring)
>     - Add dsi phy supply nodes which are required for sc7180 and
>       sdm845 targets (Rob Herring)
>     - Add type ref for syscon-sfpb (Rob Herring)
>
> Changes in v6:
>     - Fixed errors during dt_binding_check (Rob Herring)
>     - Add maxItems for phys and phys-names (Rob Herring)
>     - Use unevaluatedProperties wherever required (Rob Herring)
>     - Removed interrupt controller from required properties for
>       dsi controller (Rob Herring)
>     - Add constraints for dsi-phy reg-names based on the compatible
>       phy version (Rob Herring)
>     - Add constraints for dsi-phy supply nodes based on the
>       compatible phy version (Rob Herring)
>
> Changes in v7:
>     - Add default value for qcom,mdss-mdp-transfer-time-us (Rob Herring)
>     - Modify the schema for data-lanes (Rob Herring)
>     - Split the phy schema into separate schemas based on
>       the phy version (Rob Herring)
>
> Changes in v8:
>     - Resolve merge conflicts with latest dsi.txt file
>     - Include dp yaml change also in the same series
>
> Changes in v9:
>     - Combine target specific dsi controller yaml files
>       to a single yaml file (Rob Herring)
>     - Combine target specific dsi phy yaml files into a
>       single yaml file (Rob Herring)
>     - Use unevaluatedProperties and additionalProperties
>       wherever required
>     - Remove duplicate properties from common yaml files
>
> Changes in v10:
>     - Split the patch into separate patches for DPU, DSI and
>       PHY (Stephen Boyd)
>     - Drop unnecessary fullstop (Stephen Boyd)
>     - Add newline whereever required (Stephen Boyd)
>     - Add description for clock used (Stephen Boyd)
>     - Modify the description for interconnect entries  (Stephen Boyd)
>     - Drop assigned clock entries as it a generic property (Stephen Boyd)
>     - Correct the definition for interrupts (Stephen Boyd)
>     - Drop clock names from required properties (Stephen Boyd)
>     - Drop labels for display nodes from example (Stephen Boyd)
>     - Drop flags from interrupts entries (Stephen Boyd)
>
> Changes in v11:
>     - Drop maxItems for clocks (Stephen Boyd)
>
> Changes in v12:
>     - Add description for register property (Stephen Boyd)
>     - Add maxItems for interrupts (Stephen Boyd)
>     - Add description for iommus property (Stephen Boyd)
>     - Add description for interconnects (Stephen Boyd)
>     - Change display node name to display_controller (Stephen Boyd)
>
> Changes in v13:
>     - Add maxItems for reg property (Stephen Boyd)
>     - Add ranges property in example (Stephen Boyd)
>     - Modify description for iommus property (Stephen Boyd)
>     - Add Dp bindings for ports in the same patch (Stephen Boyd)
>     - Remove soc from examples and change address and size cells
>       accordingly (Stephen Boyd)
>     - Add reference for ports
>
> Changes in v14:
>     - Modify title for SC7180 and SDM845 yaml files (Stephen Boyd)
>     - Add required list for display-controller node (Stephen Boyd)
>
> Changes in v16:
>     - Add reference for port (Rob Herring)
>     - Make additionalProperties as false (Rob Herring)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
