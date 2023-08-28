Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8CB78B4B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 17:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbjH1Po7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 11:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbjH1Poa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 11:44:30 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93723CCC
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 08:44:15 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-58d41109351so59620707b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 08:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693237455; x=1693842255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FemZS8VWPOulUCmdGN9kQgxO+l7x46lH6UViND/XB8w=;
        b=VuyOvdEgp5Vdthot7iLwnrYTPCrxffA8kTgkypuSmszxRfwTJyNhWqwDimTmsqNQvV
         UlLTgyb7ivVaxjz9ZtzRHRUu4Pqbc/K0oYQFWsQA+Zo9NyfPt54Isy15+NigDZmfLBBG
         sAErRyNGkkAOygxUmAcym6q5fJa89zjb/py9sE8joh3wXksCGCzt8d1eHfOteKU+3fj7
         Cj/Q2FBoKTCDuKHYHpyTCkeWdnocSJ33UfvZBaF5kjZ2R6VPPPRVMD1ZkFIvTa5+FmKj
         Pr6DH74J7z4QzX12TauQgGM5tm9OUFCPMdkTyxCOwqlJTFX+nQtGhpqVBILYd75DHwsR
         RXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693237455; x=1693842255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FemZS8VWPOulUCmdGN9kQgxO+l7x46lH6UViND/XB8w=;
        b=DIcWhV/f72vFY9SwIecjYdQFQaEA4MoXbcoBCBGsGiO9wtuulpUY1+FLSESI1pv+v2
         /6VbgItYK1CSwlTq9gRfLdlqjdrsHny8ZTdEQ1cvpjx0bnTkVbVr0/XwOT3UG6jpPIx8
         0yfD0kZYxxP1Q4orkIVlTNQrf30pkpTmlTmV0X9DK4mP2VqtDTABeD9zogOgd4ZPmhXA
         oIcMb7RXf+PNQM5dpG3pFQz+duxW0dO49k09LqFSJzMSxBZS0VHLsPbvH89M9Ug7QdT8
         4HYlyN+WFIACMwXJBhA2dYCwpNAo+LRykOVtJ4FP/4ljJ4XQvvIPARNcJi/UCRHq4/JN
         Yxxw==
X-Gm-Message-State: AOJu0Ywv0Yhr7Is1fVie/qDdBIfEhVMxNJ7wN4yO5PoDJSV1oTKRlJko
        mYuzYm4N/QbB/fms+20YkoBLoeEOB/snIft+FKaaXQ==
X-Google-Smtp-Source: AGHT+IGKhafr0XWogGuIMMOOZIJPm0MmxxVwI28CARRyw0rUK4kSwJe9qcO6O/jXfXr8J8a/LK0vhFZ7W0tt64IlAPE=
X-Received: by 2002:a25:aa25:0:b0:d78:351b:8661 with SMTP id
 s34-20020a25aa25000000b00d78351b8661mr7874ybi.3.1693237454787; Mon, 28 Aug
 2023 08:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230828152353.16529-1-athierry@redhat.com> <20230828152353.16529-2-athierry@redhat.com>
In-Reply-To: <20230828152353.16529-2-athierry@redhat.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 28 Aug 2023 18:44:03 +0300
Message-ID: <CAA8EJpow=mZkp6zH-C7=kWY6W03zXyBWFdvifjir4EEa80=aAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] phy: qcom-qmp-usb: initialize PCS_USB registers
To:     Adrien Thierry <athierry@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
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

On Mon, 28 Aug 2023 at 18:24, Adrien Thierry <athierry@redhat.com> wrote:
>
> Currently, PCS_USB registers that have their initialization data in a
> pcs_usb_tbl table are never initialized. Fix that.
>
> Fixes: fc64623637da ("phy: qcom-qmp-combo,usb: add support for separate PCS_USB region")
> Signed-off-by: Adrien Thierry <athierry@redhat.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 4 ++++
>  1 file changed, 4 insertions(+)


-- 
With best wishes
Dmitry
