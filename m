Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBDA3DBE52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 20:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhG3SZI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 14:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbhG3SZH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 14:25:07 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CFDBC061765
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 11:25:02 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id v8-20020a0568301bc8b02904d5b4e5ca3aso1257270ota.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 11:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XpB+LNmPBgnS5Lf6x+b5cG5d1sMq85HwbCnNpZE2zYo=;
        b=FLU28j8+ohjlgupR219GFzrIl9IH9/YzqxQJSUxHtE5VtGLhrgsFSje8to6mUj/aga
         x8nInA/4b1SZwqh/E285vMfeKvkbUkoZiHeV5oxS8JUVQLxRozEbb1HUzzi845CHrDBt
         bH1RLWLP2fGKQKmFMPdNozclJavXJ1RtQ9W1Ruat6YfxfmKna0mnbxpgJnpnz+MApimw
         JFI1/pM187pK04w61eo5JjNf2ZlDqDzDfs7YLwOWOmHFCAK24b6vFe2/nSOx/nPPc7fP
         IASY8hUWbtG53IMu3z7y0g2dS8huQ1EQq2BfmjIjTt84iWoT2Jk2MUoYLWoy37YbYT79
         fwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XpB+LNmPBgnS5Lf6x+b5cG5d1sMq85HwbCnNpZE2zYo=;
        b=ri7in0HB6PjjZO0FDIfgODDI5bY87ZD/OgG2uB9diuF4KmpbCMFbBkNas3B4nCVKsY
         791/P6u5tgbEM0iDKai4/UDX/uAtQptwpU+VlUXiDqLIdIhn3feM0LP1wykZ+Y9mv871
         kXoI9MBFzfCdJLWyld0sIal46s0hMLKl/RXqNkNAgzSrhNdXXKAitPK6z9F26IUzhaqx
         onK53mf6gadVg4+xzZmbkIHV/U3Rsldej38A1M4Z0WDjk84qKGmu1C9jblclFGag37tn
         iQXhVdgUrGZpam55qlmM2+ACfu10UrLvQkbR/TNFMsUSInyjUWPZvIkK4xajPHkXymu+
         mmWQ==
X-Gm-Message-State: AOAM5326cn+jX7oGvRpSvuGZ+rf6Re1nJC2U/LLy/uUoxynlUB5MHsmb
        6b+O4V1bqGWezqqQbWsBks6puQ==
X-Google-Smtp-Source: ABdhPJx4vNZHT6X7wQKRFb2JUuvmKANycbmxpNeZfUiQDWntbLArDTfaRDIDFIss/nuk9dA3LyoMKw==
X-Received: by 2002:a05:6830:25c6:: with SMTP id d6mr3126063otu.226.1627669501571;
        Fri, 30 Jul 2021 11:25:01 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i10sm357103ood.48.2021.07.30.11.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 11:25:01 -0700 (PDT)
Date:   Fri, 30 Jul 2021 13:24:58 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, robh+dt@kernel.org,
        will@kernel.org, saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 6/9] arm64: dts: qcom: sc7280: Update reserved memory map
Message-ID: <YQRD+va2mn9e+QKJ@builder.lan>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-7-git-send-email-sibis@codeaurora.org>
 <YNoQ1d1hUyIh/qxz@google.com>
 <f74c03b939dfd83a1013906e1c771666@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f74c03b939dfd83a1013906e1c771666@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 30 Jun 15:02 CDT 2021, Sibi Sankar wrote:

> On 2021-06-28 23:41, Matthias Kaehlcke wrote:
> > On Fri, Jun 25, 2021 at 01:17:35AM +0530, Sibi Sankar wrote:
> > 
> > > Subject: arm64: dts: qcom: sc7280: Update reserved memory map
> > 
> > That's very vague. Also personally I'm not a fan of patches that touch
> > SoC and board files with a commit message that only mentions the SoC, as
> > is frequently done for IDP boards. Why not split this in (at least) two,
> > one for adding the missing memory regions to the SoC, and one for the
> > IDP.
> > 
> 
> sure will split this up.
> 
> > > Add missing regions and remove unused regions from the reserved memory
> > > map, as described in version 1.
> > 
> > What is this 'version 1'?
> 
> lol, it's the memory map version number
> and it's not entirely internal to qc so
> we have been mentioning them in commit
> messages from older SoCs. I'll just drop
> it when I re-spin the series since it
> doesn't add much value.
> 

Every now and then we run into issues with the reserved-memory layout,
where knowing were the numbers comes from is useful information to have
in order to characterize the issue and come up with a fix.

So including information about where those numbers came from is useful,
even if it's referencing a version of a document that's not public.

Regards,
Bjorn
