Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD9456A6BB0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 12:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjCAL3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 06:29:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjCAL3m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 06:29:42 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD9B1C32C
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Mar 2023 03:29:41 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id d6so7509005pgu.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Mar 2023 03:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=so75AWYc+LDPBId0ihyF/Z4pXQ0Tben7XkRYW6Mi+Ow=;
        b=OEh0ykBYQAEXunvVTgTyGtXpk5/Onq+Sasev8EFdDboLSnzQ1O/VbK6QntgeDNct2I
         Mph516/nPvqGr8eEFi+OmhvMPQQxM+GJPMT/8UIyuA+qh5jJbhZUOmKYTs7yMgFOQ9C1
         tOdDiLQeEzdykeylHkkLl5e7F19uwbpb8QEFBMXBQ8Pu//taC9tuVajdRbPSOaIxmsM3
         8fqftq+3Tzh83pyUH8Q9YNucvPXy2Z3R1RFqKGHFtFMsWrPMyfjYf8LSVCIWeDMUKnlr
         OPcr9ENoXl9UuXjDgutzBb5QWAbbMPYxTEFybglqZ0ZrCnmRTuhed1nroy+SBkm7YEKt
         a96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=so75AWYc+LDPBId0ihyF/Z4pXQ0Tben7XkRYW6Mi+Ow=;
        b=MztLCsSSKXTx2B6AG0A08heQQ1aqcnleL8xtIzEBNRUMA4Mv9F9rHsBumFHsKMkLZO
         p+vW/X++N+zxpAh/p+LqyW74aUbbqqY4L29zZoKHHNHNHKgCGJVxA1n+2JZbllyO4Yhw
         K9s8LK4M0NvKwVKnliiaeWb0U81wh8xzStLiNaC4IX+tvdiGcFnBY48uj8r+ZIllwYeC
         oVi7eh7p/FTE9tyA+4DiZphU4CYg//sX9H9QAEVIV3yOGDbveyfOILLZcscyCpFwmWBl
         77cHUBakesiePNuoT2TxD11J7zipomTDWqm8nwrDPoCXG+RFLL2jOUxNOrA3+m+yOWZs
         RF2g==
X-Gm-Message-State: AO0yUKVhQxXwdcommXZ/zstkntUnPLJdUnvXbgPAUAp7XyuF7XwC7Utu
        kFwu7ubCWCQaeeEIWsrYR3+m
X-Google-Smtp-Source: AK7set8TKPEfZJEQkHUJEboXZF3OSzh4GQXOEMaoLHmy2UlSWgYwB0K9/qfV51IAclkkbotvSFmlPQ==
X-Received: by 2002:a62:5e43:0:b0:5d2:1d72:3b31 with SMTP id s64-20020a625e43000000b005d21d723b31mr5305084pfb.2.1677670180572;
        Wed, 01 Mar 2023 03:29:40 -0800 (PST)
Received: from thinkpad ([220.158.159.248])
        by smtp.gmail.com with ESMTPSA id x6-20020aa793a6000000b005e093020cabsm7642523pff.45.2023.03.01.03.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 03:29:40 -0800 (PST)
Date:   Wed, 1 Mar 2023 16:59:35 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] Qcom: Fix PCI I/O range defined in devicetree
Message-ID: <20230301112935.GD5409@thinkpad>
References: <20230228164752.55682-1-manivannan.sadhasivam@linaro.org>
 <c5e36887-f84d-40ef-bef9-8a3947bbb73f@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5e36887-f84d-40ef-bef9-8a3947bbb73f@app.fastmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 28, 2023 at 05:58:37PM +0100, Arnd Bergmann wrote:
> On Tue, Feb 28, 2023, at 17:47, Manivannan Sadhasivam wrote:
> > Hi,
> >
> > This series fixes the issue with PCI I/O ranges defined in devicetree of
> > Qualcomm SoCs as reported by Arnd [1]. Most of the Qualcomm SoCs define
> > identical mapping for the PCI I/O range. But the PCI device I/O ports
> > are usually located between 0x0 to 64KiB/1MiB. So the defined PCI addresses are
> > mostly bogus. The lack of bug report on this issue indicates that no one really
> > tested legacy PCI devices with these SoCs.
> >
> > This series also contains a couple of cleanup patches that aligns the entries of
> > ranges property.
> 
> Looks good to me. I already commented that we may also want to use
> 64KB everywhere instead of 1MB for the per-host window size.

I also spotted this discrepancy while working on this series, but the size
seems to be not universal across SoCs from many vendors. So I settled with
whatever range that was used before.

>  Regardless of that, please add
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> I would also prefer to do this in fewer patches, maybe one to
> change all the prefixes, and another one to change the location,
> or whichever way Bjorn prefers.
> 

Well, the only intention of doing a per-patch change is to backport them if
needed. But I'll defer it to Bjorn.

Thanks,
Mani

>      Arnd

-- 
மணிவண்ணன் சதாசிவம்
