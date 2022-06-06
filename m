Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E712F53E77E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jun 2022 19:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239500AbiFFOUf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 10:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239832AbiFFOUL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 10:20:11 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52E413324B
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jun 2022 07:20:09 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id x65so10950621qke.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jun 2022 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dM396G/2QLfKioc1syDLOcBhUV6ELRzsPLGNpLhwVM4=;
        b=g/K66wRRBcNu+YwOGEtjZAqNUaihQbAWupXjLyzDpylwhn+yPd+Mi4ri/fttRxQhOV
         FZEjlrRRUKoNEb9thvv3KUAKQyteO+16cCf58RkrZtqwstKu8ubKTV/em7u6Pvwnlmu5
         dGTlkM9OMXw6qYx1ke5p9aubbbITIQlnl4BpIdzdo0969hwe2VLjxe8AuTYoirmeS7cs
         Ng3wpe8nR7oRUeq1Z0piMCn29dTuu0vZON050LeGxzCC1YoNb3LZJgqFj8VNUp9WGy6D
         lj6QNZ0MxL2MdDHGR5RFs/50yVpEJLfcPzKhpwwKfq1U3+HrkATdt55kq2aE6NlPx/9z
         69Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dM396G/2QLfKioc1syDLOcBhUV6ELRzsPLGNpLhwVM4=;
        b=4sXcsKBECm9tOxyAPLbZbspWfTjoqlDuaWgjkYO7Uc+W/dHv9kn4fIxMFJTTCeCXsw
         MzGWbcrxq6JszY2rd4GtWy/SXAxAL+RDhbYpeeAFTWGUQIv9ICgvlK71R+V0ZK4ALlzG
         H1NKHorC1bdWWmhssws4Qw7umPuqK9I+0GSwwD2v6fGSbD36zf6Yyzrzi4+0T8cJk38T
         tjUXj3b983XBBom3fhi8MrVq+T+JyqNwQSnRWoItiWQRzcWhuJUtjRY+PQmbPzUEpSO2
         xXaoIILceF1VNBJ2CRrSMmt4pP/u40uhO6BGLMiU3Wd/l4UN4CKDQXeAFTMRa8oU9C2F
         Xukw==
X-Gm-Message-State: AOAM5322zEuX1JxwuUancIxn16KfunC03xBiDQnhjEkaiOyATjqx0fCH
        JlrSPPa9uV9NGYKf2/MJaftOzc/HQe4J8EgOmkC5jA==
X-Google-Smtp-Source: ABdhPJwCgwyEqFtCYUGmUxfsE/3NhDjPqELI8Rn6UPGZ90g6qh5uCPgZURSpTtOodpN0uMsuaVhi3qToGDahMVVVHq8=
X-Received: by 2002:a37:b081:0:b0:6a6:7ae4:aa0c with SMTP id
 z123-20020a37b081000000b006a67ae4aa0cmr14350164qke.203.1654525208867; Mon, 06
 Jun 2022 07:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
 <20220602070909.1666068-3-dmitry.baryshkov@linaro.org> <Yp4HDG4Bus1FOHId@ripper>
In-Reply-To: <Yp4HDG4Bus1FOHId@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 6 Jun 2022 17:19:57 +0300
Message-ID: <CAA8EJpoj0ps=iBfx97XmaVrbMoXmzyM35QVS7MdB=_D8Y4p02g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/30] phy: qcom-qmp-combo: drop all non-combo
 compatibles support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 6 Jun 2022 at 16:51, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Thu 02 Jun 00:08 PDT 2022, Dmitry Baryshkov wrote:
> > -static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
> [..]
> > -     }, {
> > -             .compatible = "qcom,sdm845-qmp-usb3-phy",
>
> We have a few examples of these, where we have a compatible for the
> USB-half of the combo PHY. For backwards compatibility I think we would
> want to retain these, but if we move them to the UNI phy driver wouldn't
> we end up with duplicate USB configuration tables between the two files?

Yes. Unlike previous approaches (RFC v1, v2) this series ends up with
duplicate USB configuration tables for these three PHYs. We can export
them from -combo and use them in the -usb driver.
In previous attempts I tried to use the USB subdriver from the combo
one. However at this point I'd prefer first to sort out the combo PHY
init/reinit/switch issues, fix the register layout for the USB parts
and remove duplication afterwards.

>
> Should we keep the combo instances here as well?

We keep combo instances in qcom_qmp_combo_phy_of_match_table.

>
> Regards,
> Bjorn
>
> > -             .data = &qmp_v3_usb3phy_cfg,
> > -     }, {



-- 
With best wishes
Dmitry
