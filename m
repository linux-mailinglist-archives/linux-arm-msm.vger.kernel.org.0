Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3574B7879A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 22:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243616AbjHXUws (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 16:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243613AbjHXUwo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 16:52:44 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63521993
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 13:52:42 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d7481bc4d6fso277862276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 13:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692910362; x=1693515162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=snNOUftMMjASJIKJGHYQ9YM1CGGiGnYpgHw5Js72Etc=;
        b=MgyZ3sQavbhgmXjrhf+agvkU+FRFhGR/uliXfSXSQvZMANFMuGYNinyrfc5NHcZg65
         GYqllsrzajsorzBoa4Ca6/q7/IjKRXlfrxo02iVd9Pqmza6uDtZA7MmAt3U3gwQtXyDd
         8Fvxuq2DWHbMLw/pA+1bXqZpbRt9W1e2PRx539sJsz5OW3WIgMTdwzW6bkMZPaw5Ocjn
         iw3XZ1kHC0cgXwznD3eQkVTSv9WiyNPpVjGX+tzrsk9NG4wfjBb9NkIO8w05SO7e6BUe
         z/TraWo1ICjnheIXGi9tWDArYzQvf1i2IL4ZR0dMfX83hFb/Db/9Sw5SPVkpHINvEsm+
         uEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692910362; x=1693515162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snNOUftMMjASJIKJGHYQ9YM1CGGiGnYpgHw5Js72Etc=;
        b=gzbMbZ274o3b9z1I/XCvTqsyhVSquubVVdlEnIgc10RA7xWykDFnwBui+bTkk6WNjT
         IyqQLZV1wJxaaN0BEzWfQomyDY3uuWfWvNV/SCOqU5SfqQYxRUVxWZcxCY9H53yELkbL
         wDxU0mmtNoQQn1kmWq2EU2g6He7xy8bZV2/lNQ2JrHM/AlhKYShkyxX+fYqMhY3Xvm8O
         7IS0/yQ1aeR2JHU84W9pDFm8lwupyJViOp4xi9IrxvDhRfuIOXvYuVze6G3q4WMK1OnT
         7LDOX1vKrbgXVjvZRh38v0poTIEN3qxrnVOEgv5ZFpe36r5yTzPQ54MErueYiFRG1mRK
         n79g==
X-Gm-Message-State: AOJu0Yy78Q3khCTze7iNxIMhdcGN4lG7iB5IiFrrTVChXEW0Ih/HNZPk
        qBZxt0RXtf74NL6SCSSYsDRSAVfAtVHJv3KZMSw6sA==
X-Google-Smtp-Source: AGHT+IG3ai13t2B1YUqTR0eg6pkgvtV/2Bbqcc99zhrB8CWvX/PsyjsEDfAnFcKt0RgFkK4lpfCBd5wk4j823h0GajQ=
X-Received: by 2002:a25:8183:0:b0:d78:be:6f02 with SMTP id p3-20020a258183000000b00d7800be6f02mr3093673ybk.11.1692910362037;
 Thu, 24 Aug 2023 13:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230823171208.18382-1-athierry@redhat.com> <20230823171208.18382-3-athierry@redhat.com>
In-Reply-To: <20230823171208.18382-3-athierry@redhat.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 24 Aug 2023 23:52:30 +0300
Message-ID: <CAA8EJprM4XmMWAOsf08kuVTWUO636OM2pYVTMT_1burMCp7m0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: qcom-qmp-usb: split PCS_USB init table for
 sc8280xp and sa8775p
To:     Adrien Thierry <athierry@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 23 Aug 2023 at 20:12, Adrien Thierry <athierry@redhat.com> wrote:
>
> For sc8280xp and sa8775p, PCS and PCS_USB initialization data is
> described in the same table, thus the pcs_usb offset is not being
> applied during initialization of PCS_USB registers. Fix this by adding
> the appropriate pcs_usb_tbl tables.
>
> Fixes: 8bd2d6e11c99 ("phy: qcom-qmp: Add SA8775P USB3 UNI phy")
> Fixes: c0c7769cdae2 ("phy: qcom-qmp: Add SC8280XP USB3 UNI phy")
> Signed-off-by: Adrien Thierry <athierry@redhat.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)


-- 
With best wishes
Dmitry
