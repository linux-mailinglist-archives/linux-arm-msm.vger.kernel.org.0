Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C37202C1D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2020 21:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728751AbgFUTIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jun 2020 15:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728649AbgFUTIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jun 2020 15:08:51 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736DAC061796
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 12:08:50 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s10so7126268pgm.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S0b0ZtKOWPlzNq/G1azVX71YKnUMD0IovOZ8THJOPgs=;
        b=BVEtf+kYxEMuzMYYlyLRd35P70u1PZTRSwalr+MQXyoqvR9/rvVfvv6IdyKTD/j1mf
         1Su7XRdm3RVJ0bhNE1OjjK3GaK/HYsCcRZ3EhnlA0UoiMU9P1KzkGL1zufuuGs1fWE3E
         KWmD6iRGPL24DU+/PreGQVabmYTKF0lZGeebfqkie81ouu8sLtUMkCFARHvIWIbcUamd
         rS9ijGbYwHbz3MWfEdduy0EbgVTVwf64S90cFT9whaTbkrSie7+tTcmITGe7UAwI58SH
         /MZkCgEWfFZQ/mrNQsDzFoZV9bdGPVTZ3Kd4shxclb043u8sGCelVWgHE3RKiF3+GGKd
         MY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S0b0ZtKOWPlzNq/G1azVX71YKnUMD0IovOZ8THJOPgs=;
        b=lyf+IFcH3agPnOKBMgwufqqG549crZ6jxh2D/L7Ph1S/Hc9JHFjOmPj/q49z4Un80X
         gGLVngUxOs0nJ7arxaZuUFAjklvuTyFn94x5qzbv3R36ONm9RCim9WRg15tWjFxj5k42
         PDtP16OSpbM2n7k0WCC+uo9BNp+bOjT4Lzxi2Hpa5y4Ivm1w4hqYBODY6xQx5Cy8SI+9
         OgMWC0b0dpNJU6O0YSWPTOkG63OlRFBysjoxdhfg3iO5SZKsJPaPuDrHq1GIRFwSgImr
         IXjOKRtcicdkd6SbCQbgb8i13ta6LzvfpVHvGCA3DzPQd4HYVZY3nj8C6kGXG1M/Bp9z
         gDQw==
X-Gm-Message-State: AOAM530aOv/cS5nrhnnYy0+C+U0bX7hDcIn4ZkuuayKhhueazCQ/YRII
        KEDj0zHx3OVUEriGa1dST1Qudw==
X-Google-Smtp-Source: ABdhPJwowz3Qkey2wW0m5o/l81oVTa6RgAoYgrbWPkcWn2ieNzkJ+5o+CSU2K6ceSvlf4yNDwbu16g==
X-Received: by 2002:a63:1624:: with SMTP id w36mr10261738pgl.144.1592766529724;
        Sun, 21 Jun 2020 12:08:49 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id fa13sm10989997pjb.39.2020.06.21.12.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 12:08:48 -0700 (PDT)
Date:   Sun, 21 Jun 2020 12:06:02 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Rakesh Pillai <pillair@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v11] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
Message-ID: <20200621190602.GL128451@builder.lan>
References: <1589946996-31264-1-git-send-email-pillair@codeaurora.org>
 <CAE=gft5pcHwK8yjObNSSH=U_B6Pz++bDaeUxZhPyJfG2E7LRAg@mail.gmail.com>
 <CAE=gft5So9Uk2UqRWs2zFO_iD+6ofMy97bKP4HpgM1Wu6Duxvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE=gft5So9Uk2UqRWs2zFO_iD+6ofMy97bKP4HpgM1Wu6Duxvw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 17 Jun 15:45 PDT 2020, Evan Green wrote:

> On Thu, May 21, 2020 at 9:19 AM Evan Green <evgreen@chromium.org> wrote:
> >
> > On Tue, May 19, 2020 at 8:57 PM Rakesh Pillai <pillair@codeaurora.org> wrote:
> > >
> > > Add device node for the ath10k SNOC platform driver probe
> > > and add resources required for WCN3990 on sc7180 soc.
> > >
> > > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> >
> > Reviewed-by: Evan Green <evgreen@chromium.org>
> 
> Looks like this never landed anywhere. Is it blocked on something?

I remember waiting for some reviews, but I see those are in place. Then
as I was applying this I saw that a v12 had shown up, with regulators.

So, I applied v12.

Thanks,
Bjorn
