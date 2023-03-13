Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F42F6B73D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 11:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjCMKYd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 06:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjCMKYL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 06:24:11 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0EA124BE5
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 03:24:09 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5418c2b8ef2so64883897b3.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 03:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678703049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+EtJ3bUB6vUCegzY8eIMKjQxrxoKTCdPqy41DuEhXLE=;
        b=GSi9d14eTuVck+DGZLDOl63Y51TtVhhZjWUQWcCnVi3zr1AYPo8L0/DphDYN9PAspw
         FS7unWqqmXlc6g5nlt9sc5zJoXHb0QJ3sKamAc70qCyUlxYzX3HvT2CiCK6Q61DvpSWw
         psZp0stjXefil92FUBy3DMXoGzKOkoeYyyXAt1gsQLQ78Gf7Tu8sKivg9C0ZVdDemtPQ
         JmP+mgc4wiMMxkE10Aglz+klIzXJSaq5mddSKHQsbt6WQOEImAa8gTI23Wa90sZmKRoe
         TuJ15t2qMLisYM2zGWc3OnuWaHgsWh0jjgJGAikh6YtKmuIxRDUT86jCrZw6e7JvMBbY
         pQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678703049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EtJ3bUB6vUCegzY8eIMKjQxrxoKTCdPqy41DuEhXLE=;
        b=oGxlwBxGFAjQ37A4dKrZp0bMBc1jfYrJM5063H3h7H2Ei+F3ZctWIuTiBnNssBUZPX
         xjvcEuOkZRZgW9wdUXzVT92xxJV87mikKErSeojeOd62cFWRB2RCe8N3+iBLMOUfFDZ2
         8RcQ11F/dkqsQRX4wssPcPQIsUQkaY3BduOASTeW6midx1ADEoka+iFBiVHWjLQj7Y9v
         U6cZ3jt6jNTlUegQolgDk3NifFHvujjTptqyEvVIcZ9Mz9/CEBNz87ky24o3SwT8uPpf
         rxLfps1atp/ZaSvSKajoWDyBiP3jk0xvkteDEBeryFnkBV+Me2Jpkh2YDJ4AXTehDtIc
         qTBw==
X-Gm-Message-State: AO0yUKXaYYXEK4sK8WXucjOgHFluE6piQicPmeqeII0Zwpky6Ojld/4n
        quC8+FOnOYn3vjNM4uvQg5wvSrhKPCc/dZK330HQUQ==
X-Google-Smtp-Source: AK7set81IySMbIhcp2Fp0qxELomKcOXvhsf9cROpbwZ7dJv/PRuH/dQq9bGa3FPnaqTfcFLdORfxcr7MsfLiyyuQDHs=
X-Received: by 2002:a81:ac51:0:b0:540:b6c9:66cd with SMTP id
 z17-20020a81ac51000000b00540b6c966cdmr5507916ywj.10.1678703048864; Mon, 13
 Mar 2023 03:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230308213651.647098-1-konrad.dybcio@linaro.org>
In-Reply-To: <20230308213651.647098-1-konrad.dybcio@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Mar 2023 11:23:57 +0100
Message-ID: <CACRpkdZFWaLZvD6uW6rO+oKGZw24S+dKD+TBBpkQJKceiSBnaw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: msm8998: Add MPM pin mappings
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, marijn.suijten@somainline.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Mar 8, 2023 at 10:36 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:

> Add MPM <-> TLMM pin mappings to allow for waking up the AP from sleep
> through MPM-connected pins.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Patch applied as nonurgent fix, tell me if it should rather be treated as
urgent (for the -rc:s and/or stable tags)

Yours,
Linus Walleij
