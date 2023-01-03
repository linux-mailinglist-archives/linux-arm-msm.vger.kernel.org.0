Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45D4E65C324
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 16:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237884AbjACPiS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 10:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbjACPiS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 10:38:18 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B9411C0E;
        Tue,  3 Jan 2023 07:38:16 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id m18so74537009eji.5;
        Tue, 03 Jan 2023 07:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qnD1cDOmNAJpkQ6T4dHEcYD9uVqliMR1LVDe+Z15bUE=;
        b=Iv1X7xuxVaFSptHgLbIWWfPN9wFmWy5OetaEGRHUYf+22Qc0pMRgXhMJR52ZpXUwrh
         XpifyNSEbtPqKt35Ofss4i2mxykqjemG0v3qLPLJP72K3ZtJzNb/94Qhz+fIlGHd3Jfq
         1ABhT9xZLiu8AImzZgkeD3Om/BLz4VVs05Vd3Er/4CBFggQswMloVJj3ttYWgm3FmwNE
         87X1puDaCguiScnZE4EhpNzr8EjnK6i6CI5ztjIdzFMSukLUP/DlPtncXIaQpbZsDVy/
         sKDIa3oc3s6nJT3BT2U3hWCY6lnwrBk3Ryxvg+hQwYxwy6pW1FLMYDQ+q+9xSsX9c+Dh
         27bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnD1cDOmNAJpkQ6T4dHEcYD9uVqliMR1LVDe+Z15bUE=;
        b=pV+9ccFLytlpLulJqY7caybps/tHn6Jh2DPnMWfgBtbs6A2uZ6SXophT3NbzClI3Yk
         hw1p9TA5wHmRvtGY9bfKFsMuQuibnk03lg48CF9lBv/A4rzHC/GjOVCD5GM4I5prztDL
         NbDNAiSPtrjfILfeLce50Z7zKBl7hWRpa7euR6UGk3Q3DiJ4LaFifB8FozB/VTAN4emI
         b1DmpBf+kmpLoB3Vc7Q1dAxdkd8YYrQAiSdib/UOos0ix2vf+DWSKfVLqDNl8rR5TScH
         aVMS/ynZb+dHA7e6El1WOXGv+ZmA+AVfF1uJVnF9o7FXjyzzam332azXEwDZpfTBe6kR
         8vKg==
X-Gm-Message-State: AFqh2kqyhn4qcMznGupwIzPxUoMULkW6LWlUSHwXA62TycZUAdiYujmQ
        u3BpKTtt9uN70L0V37Pz286o3rEwOFm3ChY+87M=
X-Google-Smtp-Source: AMrXdXsqsRWBmQm2rrCrJ26cXBP2shbcsB3baAFq/41tPZjRzMUN2eJ0DUIMQZfQvqKpoxQGfEpCn9x5+tmyeD1QNcM=
X-Received: by 2002:a17:906:a3cd:b0:7c1:9b74:d27a with SMTP id
 ca13-20020a170906a3cd00b007c19b74d27amr5362235ejb.601.1672760295330; Tue, 03
 Jan 2023 07:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org> <20221228133243.3052132-6-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221228133243.3052132-6-dmitry.baryshkov@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 3 Jan 2023 08:38:04 -0700
Message-ID: <CAOCk7Noa1A4mBqg3OAxk3hnnUg-qjCeCE0tyhq3ktbFcETicqw@mail.gmail.com>
Subject: Re: [PATCH 05/16] dt-bindings: clock: qcom,mmcc-msm8998: drop core_bi_pll_test_se
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 28, 2022 at 6:33 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The test clock apparently it's not used by anyone upstream. Remove it.

IMO, NACK,

This is not a valid justification.

The DT is supposed to describe the hardware, and should be complete in
that regard.  This clock exists in the hardware, so it should be
described.

DT is supposed to be separate from Linux, that is it doesn't matter
that Linux doesn't consume this clock.  Maybe FreeBSD does, or some
other OS.  Linux doesn't own Device Tree any more than it owns BIOS or
ACPI.

Also, I'm listed as a maintainer for this binding, yet this series is
not addressed to me.  Seems like you might need to review how you are
composing your patches.
