Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37F1B373198
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 22:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhEDUrp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 16:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhEDUro (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 16:47:44 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E99C061763
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 May 2021 13:46:49 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id n16so5907088plf.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 May 2021 13:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2a6/ygkzqCiFjkJMxmFt1kL/6eCE5jLq9rBe6PegP00=;
        b=dgMyecZDYvD3M4Hgvkv4Eu1S1UQfVURdbejOrJeu/cZwL/dwCUBxxdFaEWnf0U0vJZ
         +HWphRk3stxZ1S89xn0/ClD1xNWSAVt0dTge88IvveKgMbVDEndWvtKGAz/jx6rAgrya
         7yvvFTqcqsMBT13EEWc6PPYrXE7WorzwgUOds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2a6/ygkzqCiFjkJMxmFt1kL/6eCE5jLq9rBe6PegP00=;
        b=XYPYePESXc+WdjMAWzTzrpTonN7Upw/7xIt8HNMvSr5fqG6oJ99D+5LDoZLur9SxQS
         Kqc1ji8YXkCxb1D+x+5+ch/YzX0kkzCx+6cBCoE8hxr2RjBrOVO3pDzM+WmSB5Q/hGbi
         yQfAMmvSYl1D1/XQA2czclT9xQ73KMbhF9YaV2/6viJjznCRP932F95ZUrvltyBed6bC
         CSge0lpnD7aF3PMKCR379Uxz5kyIyvVDI+CzCpowEWf+QxRGEyBlkFeoa85PAh7MOgIX
         fVet1r4nHEZiXEPJDW39SJp/wSMD42bLUA3FmPpkt9MM1/4+SpzBSeige8+E/PvqBNdT
         PimA==
X-Gm-Message-State: AOAM5320aPafTmc7rEsLDIif4jNjXjie4MMDSBX/lFGWUb+fbDpr2xU5
        1C7zproMYKKHeDsld2o9Fmg73Q==
X-Google-Smtp-Source: ABdhPJyfDVB4g3z0knD/LwR+gvIZ+Ero9hTSfnK7mpY7h82mp2xp8TGDseNPtwycdtUH1CxfgbvBYQ==
X-Received: by 2002:a17:902:eac2:b029:ee:a909:4f9f with SMTP id p2-20020a170902eac2b02900eea9094f9fmr23875075pld.8.1620161208800;
        Tue, 04 May 2021 13:46:48 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:4c2f:1f84:af45:6245])
        by smtp.gmail.com with UTF8SMTPSA id w1sm4500412pgp.31.2021.05.04.13.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 13:46:48 -0700 (PDT)
Date:   Tue, 4 May 2021 13:46:47 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     amitk@kernel.org, thara.gopinath@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sanm@codeaurora.org, manafm@codeaurora.org
Subject: Re: [PATCH V3 2/3] arm64: dts: qcom: SC7280:  Add device node
 support for TSENS
Message-ID: <YJGyt/OBBVVzdX2+@google.com>
References: <1619778592-8112-1-git-send-email-rkambl@codeaurora.org>
 <1619778592-8112-3-git-send-email-rkambl@codeaurora.org>
 <YJAz1iDM+cNAAcCX@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YJAz1iDM+cNAAcCX@google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 03, 2021 at 10:33:10AM -0700, Matthias Kaehlcke wrote:
> On Fri, Apr 30, 2021 at 03:59:51PM +0530, Rajeshwari wrote:
> > Adding device node for TSENS controller and critical interrupt support in SC7280.
> > 
> > Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> 
> Please add tags from previous versions, like my 'Reviewed-by' from v2,
> unless a patch underwent major changes.
> 
> Please also add a change log for v > 1, even if it just says 'no changes'
> for some patches in the series.

Forgot to re-add this:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
