Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0764FEEB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 07:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbiDMFvk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 01:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232578AbiDMFvg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 01:51:36 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E8950077
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 22:49:13 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id ll10so947651pjb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 22:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=++WYL6Zt9T+pjnxfNGqRWUGNrfCfPTVdR2mFPpgsHyM=;
        b=cdrKuK+h/K6zHzr8fXTUAaQxO4P5qOJnyxchmmC453ZSXHQynpsHIPiyhBLk4oGpaO
         Eh1rpq2E7uZCV0NpRM+qLsYHQsXEs4jf9s9LRT5D1rkdC43N/W1JWNo7B6eEK+W+vV/C
         J6qkXgFWLXWMh0a9I82vVTbCR0zOgvafJAUPOzu4Nip4s4fsooQ5ym3bdOb7O5IaUSPT
         UyErhx8P4wiy018SH/Poslyy7cwZOWz1Wa1shwoFeh1S+lRB8fl6g92BCJrU6cgaluns
         d5YdLIIrxxkyHPp2fT0QU3bVXxSShjt1E4LvwvR0l2zzApgHN/XEBwEo0QD/ZbMAaByF
         SQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=++WYL6Zt9T+pjnxfNGqRWUGNrfCfPTVdR2mFPpgsHyM=;
        b=BSMb5iMIYVVvQqsv45ovpz1Avsqs0VjXTZqa9aj57LTxS71uo3sUIZEx2XU1I0qwHn
         9leZthyY//gJXJ5U8UMmX23A4yfw53iFh4ul08E0GqBX7hQAL/1nTVHH8lPJj08GGg7Y
         2xFvqraFv0WfrNuhl539649mM/+lTuQdrYrnx/8dqPcaCdElnxJk/lPyEOnxktjj12op
         Qg1Af62YDZNWUxKy2Ii28HDmfOQoyIAym3lsWtUZ8FUVUhT81DNV7NiMljyjeKm4W/6O
         6IW4fG/6fR5kJRdsz/b6v//mxROJ3Mje8Wqa7T8s9ZC522ymAIkFCcfsFp7EJ8vmNxGa
         lG+w==
X-Gm-Message-State: AOAM531jTV2VyPXtUciXKPuPbMJ7xExmsUQJ4FQxQb4ybRRePkLUPOUl
        /gcwNWDq1USh2y3TOpWovYj3
X-Google-Smtp-Source: ABdhPJwcc3PlIFBt3ZP5T+VE0u3r8B82BGVZ12UY01gRML95BVEK1gq3N81z6R3ZtvV9UGa5GBPwRg==
X-Received: by 2002:a17:90a:9313:b0:1cd:4053:9cf3 with SMTP id p19-20020a17090a931300b001cd40539cf3mr4621694pjo.182.1649828952972;
        Tue, 12 Apr 2022 22:49:12 -0700 (PDT)
Received: from thinkpad ([117.207.28.49])
        by smtp.gmail.com with ESMTPSA id r76-20020a632b4f000000b003820643e1c2sm4776893pgr.59.2022.04.12.22.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 22:49:12 -0700 (PDT)
Date:   Wed, 13 Apr 2022 11:19:04 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Kalle Valo <kvalo@kernel.org>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, lorenzo.pieralisi@arm.com,
        robh@kernel.org, kw@linux.com, bhelgaas@google.com,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, rajatja@google.com,
        refactormyself@gmail.com, quic_vbadigan@quicinc.com,
        quic_ramkri@quicinc.com, swboyd@chromium.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v4] PCI: qcom: Add system PM support
Message-ID: <20220413054904.GA2015@thinkpad>
References: <1646679306-4768-1-git-send-email-quic_pmaliset@quicinc.com>
 <20220412060144.GA41348@thinkpad>
 <87k0buoa9j.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k0buoa9j.fsf@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 12, 2022 at 01:40:08PM +0300, Kalle Valo wrote:
> + ath11k
> 
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
> > +Kalle, linux-wireless
> >
> > On Tue, Mar 08, 2022 at 12:25:06AM +0530, Prasad Malisetty wrote:
> >> Add suspend_noirq and resume_noirq callbacks to handle
> >> system suspend and resume in dwc PCIe controller driver.
> >> 
> >> When system suspends, send PME turnoff message to enter
> >> link into L2 state. Along with powerdown the PHY, disable
> >> pipe clock, switch gcc_pcie_1_pipe_clk_src to XO if mux is
> >> supported and disable the pcie clocks, regulators.
> >> 
> >
> > Kalle, is this behaviour appropriate for WLAN devices as well? The devices
> > will be put into poweroff state (assuming no Vaux provided in D3cold) during
> > system suspend.
> 
> ath11k leaves the firmware running during suspend. I don't fully
> understand what the patch is doing, but if it cuts the power from the
> WLAN chip during suspend that will break ath11k.
> 

Thanks Kalle for the confirmation. Yes the device will be put into D3cold state
and that will most likely equal to poweroff state.

Prasad, you should try to just turn off the host resources like clocks and
regulators (not refclk) and let the device be in the default state
(D3hot/L{0/1}?) during suspend.

Thanks,
Mani

> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
