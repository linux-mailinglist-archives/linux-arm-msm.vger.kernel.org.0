Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2896CEF92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 18:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbjC2Qhn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 12:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbjC2Qhl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 12:37:41 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E98F4C19
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 09:37:40 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso19118910pjb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 09:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680107860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OoXdOK1goXOGy6MZ8rknbj6m2i3M9YHQmrM9+mBU2UY=;
        b=Dnlj0NaO3jozqwAh888qho/XSqr/vyYPK9vAM54KCcu3e3R/+b/dEK0Qlo8b+bwQX/
         u7X5PKRrX+obOv0vY5JHQF/M3Kdthnk5pUvVYWNz3Qbcemvcx2Tunt+7/Xivla6yVv5L
         r9WE0wtG4leCyiolHaF3X3WpyrASgW/xfdlK5LB20hifgvDcIDWrQlTrSqLIkuDrN8Pz
         8Ma2AEAqDME474EQ9knNF12Mv33uxmKnh7e0xtwfNdz/rPUBeJFUXYMt3EomEdY03Ffy
         Zt8duwuHkvpYGS+YtUh+f1csmn/hZ7AS8H8aq/caDBsX2kv0zkGCbj7hDD4V2ADqLMCB
         CCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680107860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OoXdOK1goXOGy6MZ8rknbj6m2i3M9YHQmrM9+mBU2UY=;
        b=j+PFkLrYSC6LbUsf0+yCgjPutQFCZon8FHF7+bc4X2W6Gw2t3ZSeqFoZ69Dv4A01ve
         9Itiiy/qnddCC8Nt5ThRqBjD9fQeKdWQHU7JdAVzhlb+lbEg23U31RqCypXTLVyw22y/
         njeoInCNMi3jS49UIFntYTDw6Zxsy4iNwolLhlCNmsu7lYvNLcvo7RRwLxg1sU+bO3hC
         ANJoMy+InlOTzwW9ibag+cjVPqH/x9i1OLB/+ss+nqqRyZdmYG/i3YclcIep/orqwPb2
         e3p+2m+y9ipwuqvCFajrUTx6KMiKz3iBdhjPF17LRLuWHHhp8EZ5Kt0A9lsiKVJPDK/+
         LiEQ==
X-Gm-Message-State: AAQBX9c6hoKIDC+zeD0A/VFg2X3xaC0JEWE9p5rWes1WFS1zOSi+aQtc
        e3DnmqBU4RwZsZG4KayiTLu5
X-Google-Smtp-Source: AKy350aCjpdIf4TPenzEjeGnTEkM9ymR9mj602qgyVc2HTWndzL4dALVGtahR9nVk0sOtZ/wl7qC9g==
X-Received: by 2002:a17:903:210d:b0:1a0:53b3:ee87 with SMTP id o13-20020a170903210d00b001a053b3ee87mr15138590ple.62.1680107859849;
        Wed, 29 Mar 2023 09:37:39 -0700 (PDT)
Received: from thinkpad ([117.216.120.213])
        by smtp.gmail.com with ESMTPSA id g24-20020a170902869800b001a20b30e8b0sm11527315plo.243.2023.03.29.09.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 09:37:39 -0700 (PDT)
Date:   Wed, 29 Mar 2023 22:07:31 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_krichai@quicinc.com, johan+linaro@kernel.org, steev@kali.org,
        mka@chromium.org, Dhruva Gole <d-gole@ti.com>
Subject: Re: [PATCH v3 1/1] PCI: qcom: Add support for system suspend and
 resume
Message-ID: <20230329163731.GF5575@thinkpad>
References: <20230327133824.29136-1-manivannan.sadhasivam@linaro.org>
 <20230327133824.29136-2-manivannan.sadhasivam@linaro.org>
 <ZCQLWzqKPrusMro+@hovoldconsulting.com>
 <20230329125232.GB5575@thinkpad>
 <ZCQ69xyQ4mwTow1W@hovoldconsulting.com>
 <20230329140150.GE5575@thinkpad>
 <ZCROTyuxZ+dkrnx8@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCROTyuxZ+dkrnx8@hovoldconsulting.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 29, 2023 at 04:42:23PM +0200, Johan Hovold wrote:
> On Wed, Mar 29, 2023 at 07:31:50PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Mar 29, 2023 at 03:19:51PM +0200, Johan Hovold wrote:
> > > On Wed, Mar 29, 2023 at 06:22:32PM +0530, Manivannan Sadhasivam wrote:
> 
> > > Why would you need PCIe gen1 speed during suspend?
> > 
> > That's what the suggestion I got from Qcom PCIe team. But I didn't compare the
> > value you added during icc support patch with downstream. More below...
> > 
> > > These numbers are already somewhat random as, for example, the vendor
> > > driver is requesting 500 kBps (800 peak) during runtime, while we are
> > > now requesting five times that during suspend (the vendor driver gets a
> > > away with 0).
> > 
> > Hmm, then I should've asked you this question when you added icc support.
> > I thought you inherited those values from downstream but apparently not.
> > Even in downstream they are using different bw votes for different platforms.
> > I will touch base with PCIe and ICC teams to find out the actual value that
> > needs to be used.
> 
> We discussed things at length at the time, but perhaps it was before you
> joined to project.

Yeah, could be.

> As I alluded to above, we should not play the game of
> using arbitrary numbers but instead fix the interconnect driver so that
> it can map the interconnect values in kBps to something that makes sense
> for the Qualcomm hardware. Anything else is not acceptable for upstream.
> 

Agree. I've started the discussion regarding this and will get back once I have
answers.

- Mani

> Johan

-- 
மணிவண்ணன் சதாசிவம்
