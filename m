Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6BE350A02C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 14:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiDUNCe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 09:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbiDUNCd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 09:02:33 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F420C326F9
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 05:59:43 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id s14-20020a17090a880e00b001caaf6d3dd1so7697174pjn.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 05:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VSJ2rJFM71/kL79jCnpAQ93KJ/x7JSaLjByZLJIvLis=;
        b=bQtAXsYrpcScFVSrq4QfayE0uHz89yJvJj+NWwQJz3uspPNZ7IfaI8i0n4MZTB3C2P
         q5X1w6+0UxgI7xuJsjLYgN2vxjbYCTgEuSwIrxO6btQEvZXb2kc9rX1GTF9c/da9lXb1
         7qzBHOjpjiInSMm/AEtcos16xxEb3L4VPFng5koQvwWdWcnOFcuM7RhhjV+RNVnY/Z7A
         wGIMq+5NiH3sxrQzNiP5Lqx25Ep/AkpKP5FQazdNeRVVFD3v3PzXKKrQU/gNqlBNM2hr
         An1M2YUl7YkKW9ubxieNdfg+dQBk+7RA186t2O7yi+zmPDuwravC2jbaC3rNWul1SQqY
         fqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VSJ2rJFM71/kL79jCnpAQ93KJ/x7JSaLjByZLJIvLis=;
        b=e5ddN7zXYT0qMkFUj34bxTAXIKPx1QYAsGgHF0joZjWAom25nF5adCEhYf5EqHQKm7
         h8rrLPxzDzS1IBCD8W2UY+0z17R7r3c7EIJz3ge02pc6uFP2epvJTZSJ9xLotfqgqhWM
         MpqfhqvbOO+8HmbrBCg6Faj3V5MtmhBXQ7A4XAP/sl46p9ake9/hnLBQVxkt+b7Vi5ts
         CTQ2fUxfpkswwpBtYDApmv3OWmgvoIcAPBpBtpo2fUg3/SCi2I/o4bg1ecNBFzUe6Dik
         TzO7uwZokH+QX/RNY05OvppSmfVhyCANxsyCcU8+8isWxAFrAnRjzdmdnpdtKCjK/u2R
         6WRA==
X-Gm-Message-State: AOAM531MKukt+pgAcGUEz57MIW0KbcO6EeWlBPXkbjhkPsf7Jv7lJ9hH
        9OlUcL6Zvrw3wbEFLbSdXnMBCaIKSARedWF0x8XHSA==
X-Google-Smtp-Source: ABdhPJwIQ+2mB3qv1xOCuDVLDbz2dL0D2KptMiV9MvVDYueNqS5LsR0SqIrxmiAg5fGEmFqcn+ZywX4Ga1cLAZuoQPg=
X-Received: by 2002:a17:90a:558a:b0:1c6:fad4:2930 with SMTP id
 c10-20020a17090a558a00b001c6fad42930mr10366902pji.159.1650545983470; Thu, 21
 Apr 2022 05:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220421092141.3984-1-slark_xiao@163.com>
In-Reply-To: <20220421092141.3984-1-slark_xiao@163.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 21 Apr 2022 14:59:07 +0200
Message-ID: <CAMZdPi9hsxGqiw11hUkN3dmXVUJ6CUXQdb6P7STPWyfPErpUhg@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: host: Add support for Cinterion MV32-WA/MV32-WB
To:     Slark Xiao <slark_xiao@163.com>
Cc:     mani@kernel.org, hemantk@codeaurora.org,
        gregkh@linuxfoundation.org, bbhatt@codeaurora.org,
        christophe.jaillet@wanadoo.fr, thomas.ulrich@thalesgroup.com,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 21 Apr 2022 at 11:22, Slark Xiao <slark_xiao@163.com> wrote:
>
> MV32-WA is designed based on Qualcomm SDX62, and
> MV32-WB is designed based on QUalcomm SDX65. Both
> products' enumeration would align with previous
> product MV31-W.So we merge MV31 and MV32 to MV3X
> for some common settings.
>
> Fixes: 87693e092bd0 ("bus: mhi: pci_generic: Add Cinterion MV31-W PCIe to MHI")

The patch does not fix a bug, but adds new hardware support.

> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Without the 'fixes' tag:

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
