Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8DC15F28F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 09:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiJCHEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 03:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiJCHEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 03:04:21 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0EEB13F53
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 00:04:20 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id e11-20020a17090a77cb00b00205edbfd646so14463836pjs.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 00:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=Jcb3UBBRzz+mGxXYoE2+emv0xptsMTPozlXn5m1i4W8=;
        b=N+rVwqMabhmxD8pIXwz/aVabWlGDyVggecTor4pV2g6UnfdhatAY4k3yl4wO98ZNfF
         a5McjKhjjdF3ibhdHmIGqcpg/jY5ffsrJyUnoevXC03WUY9v1izlQ/zx8LUtUdS45t5T
         GNqINUu/Qe437UUnwlEbjHFH1zRB7kJZRhj2ERboX5mnKf6rq6qlgUyWFic9o4KliFNw
         AMiXohlUkoTiqjqc8dnf01W+3f9pf6wRxCejvrqIXvj86VczTMXtENSNH/ejzxGy2iFS
         TXppcDEq2kiwydHXBmKa2ML3vJQJUXUQJIo5Vxm/3FJxEs76prujPaL2j5bIIKAsOyat
         zfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Jcb3UBBRzz+mGxXYoE2+emv0xptsMTPozlXn5m1i4W8=;
        b=TNH4NjuY6TmyKi/CXQ8SwNYUn1G+ynAITH6thw4vOuR8Lk26+Bsd5p4z1DJB439H7b
         QCdcM5JmB57ZPGZGTeuAZ+VSpLWWwNI/9ud1k5xObgGzndS/AFWJo551hL1Ax6R5/giW
         mbykIZplMGM7Hj5sVLZ/cDYPGR2lFnXPnDlbSj3Q0U7EeMZE+h6tNhOZozp6O7WzD/EW
         8KxY3gZ2QoYGi22Q3AasmTwedOFaq3pYrFSjsZ8uaMXJMv7kyRzG+XZcszj36/sqyHXz
         nkelQYXba1NytauJJEKi8sgTTMs/si2O1+uJxF/GJT9aP+SDy6r75yyWOzHI1C6GnN5o
         eUhA==
X-Gm-Message-State: ACrzQf3sBegPWIAVkaq8LN6+fMPPpZdLXaA+kRTB4PyfN8CHAdl+TX+2
        2w1NoymZkZouTv3p8qUYoeQd
X-Google-Smtp-Source: AMsMyM7D4iiJFu/+i+8olYH+0b+Wf+Ao6TXBxAphSavaF8S5gy8jINq4ng0gwpXE+DiZYA+RrINpCQ==
X-Received: by 2002:a17:902:e744:b0:178:6d7b:6d08 with SMTP id p4-20020a170902e74400b001786d7b6d08mr21355787plf.128.1664780660195;
        Mon, 03 Oct 2022 00:04:20 -0700 (PDT)
Received: from thinkpad ([220.158.159.17])
        by smtp.gmail.com with ESMTPSA id mn23-20020a17090b189700b00205d70ccfeesm6979092pjb.33.2022.10.03.00.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 00:04:19 -0700 (PDT)
Date:   Mon, 3 Oct 2022 12:34:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org, bp@alien8.de, mchehab@kernel.org
Cc:     james.morse@arm.com, rric@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tsoni@quicinc.com,
        quic_saipraka@quicinc.com
Subject: Re: [PATCH v3 0/5] Fix crash when using Qcom LLCC/EDAC drivers
Message-ID: <20221003070415.GC5398@thinkpad>
References: <20220825043859.30066-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220825043859.30066-1-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 25, 2022 at 10:08:54AM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This series fixes the crash seen on the Qualcomm SM8450 chipset with the
> LLCC/EDAC drivers. The problem was due to the Qcom EDAC driver using the
> fixed LLCC register offsets for detecting the LLCC errors.
> 
> This seems to have worked for SoCs till SM8450. But in SM8450, the LLCC
> register offsets were changed. So accessing the fixed offsets causes the
> crash on this platform.
> 
> So for fixing this issue, and also to make it work on future SoCs, let's
> pass the LLCC offsets from the Qcom LLCC driver based on the individual
> SoCs and let the EDAC driver make use of them.
> 
> This series has been tested on SM8450 based dev board.
> 

Since the LLCC patches are already merged, can we get the EDAC patches to be
merged for v6.1?

Thanks,
Mani

> Thanks,
> Mani
> 
> Changes in v3:
> 
> * Instead of using SoC specific register offset naming convention, used
>   LLCC version based as suggested by Sai
> * Fixed the existing reg_offset naming convention to clearly represent
>   the LLCC version from which the offsets were changed
> * Added Sai's Acked-by to MAINTAINERS patch
> * Added a new patch that removes an extra error no assignment
> 
> Changes in v2:
> 
> * Volunteered myself as a maintainer for the EDAC driver since the current
>   maintainers have left Qualcomm and I couldn't get hold of them.
> 
> Manivannan Sadhasivam (5):
>   soc: qcom: llcc: Rename reg_offset structs to reflect LLCC version
>   soc: qcom: llcc: Pass LLCC version based register offsets to EDAC
>     driver
>   EDAC/qcom: Get rid of hardcoded register offsets
>   EDAC/qcom: Remove extra error no assignment in qcom_llcc_core_setup()
>   MAINTAINERS: Add myself as the maintainer for qcom_edac driver
> 
>  MAINTAINERS                        |   3 +-
>  drivers/edac/qcom_edac.c           | 119 ++++++++++++++---------------
>  drivers/soc/qcom/llcc-qcom.c       |  92 +++++++++++++++++++---
>  include/linux/soc/qcom/llcc-qcom.h |  36 +++++++--
>  4 files changed, 170 insertions(+), 80 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
