Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F298418D95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 04:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbhI0CCC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Sep 2021 22:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232360AbhI0CCB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Sep 2021 22:02:01 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38201C061575
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 19:00:24 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id g2so10277927pfc.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 19:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fRhfaZIMy0eMtR+WN6XwxZ3efkveVfiLx2hy6oKGqxQ=;
        b=dfcbR4kDhZ0gl4NR+Wc6aGJZHUXpkXjkImsqmPR3LqcilVOqtSdfDPG8Wa9sNm6uiZ
         g/iD5AHm5/10gZfKrT1xzPHrsSRcNIj7PDUAKbYzH9rwBC25Iz5G9jCl5MwBOxGuLsMs
         u2aUgSgoRzXcMBoduqJVxy6QMRYt21hn77PGH+3F5r7h+llUjtq2K4e655HmpuTlBICp
         S0QmHxdm3o/BPdWrkpYG02P+l2/gZ23DAUbTdgWMSroRAqLi9RRmlXymH4chRkJvuGYv
         Q8ZKHx/+heDK78gsarabaSYNobLd6Sg7JXPpQuNl2Ocz9PHiNawsNfxJKajVx5yJebKU
         r0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fRhfaZIMy0eMtR+WN6XwxZ3efkveVfiLx2hy6oKGqxQ=;
        b=YH0aG3VL0UAFuxWARu2FeqecqJaCoq/7wY38pvVxJh1Oa4eZddTbrTPx0ln5iR31Gy
         sU/bjy8tljimd5N4Qh0jJNr1MBaAZm5nGp2cxgRkNRSaVil6khmUuZCslln2f45J1+kS
         iWAEu6phmKJ1nbY+5O813Zq5mqYWSTgOWfRm5/BTZsjfjg/FsmIZYfhOoqAzCJ8vSoOi
         DLFxNcHYWci3PikTHya7T8U8CTSW4CtHse2wqFpT4mEenmjxku4sWvDsZZNJzkBRFaVm
         zFncwiuuZea+5Ql+53w0j+R18kXRCAdgcocwmCbH5E73NBaMoXaF1juyKfHmjEs6wAPJ
         cJuA==
X-Gm-Message-State: AOAM530UO3ocQfNNth+G5cmk/oqRILiCdmmyJB5IX68ls/FYrLiZkEps
        RYeAtrBSp9oTm27+Eeg3XRZvrJZYd3DCjg==
X-Google-Smtp-Source: ABdhPJz4jMv+ZFKHUgilpdzHEejF4xPeD0JX5Z31RfTCjSg8tVRfIxlzuVybruG/dRHHjmGAg4u3yg==
X-Received: by 2002:a63:ea44:: with SMTP id l4mr14464843pgk.210.1632708023631;
        Sun, 26 Sep 2021 19:00:23 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id x5sm8658762pfq.136.2021.09.26.19.00.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Sep 2021 19:00:23 -0700 (PDT)
Date:   Mon, 27 Sep 2021 10:00:08 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Caleb Connolly <caleb@connolly.tech>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop vdd-supply from qusb2-phy devices
Message-ID: <20210927020007.GF9901@dragon>
References: <20210926075951.28034-1-shawn.guo@linaro.org>
 <c8d61171-225f-ca1c-db9e-7ed3f91365b8@somainline.org>
 <20210927000715.GD9901@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927000715.GD9901@dragon>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 27, 2021 at 08:07:16AM +0800, Shawn Guo wrote:
> On Mon, Sep 27, 2021 at 12:58:19AM +0200, Konrad Dybcio wrote:
> > 
> > On 26.09.2021 09:59, Shawn Guo wrote:
> > > Looking at qcom,qusb2-phy.yaml bindings and qusb2_phy_vreg_names[] in
> > > qusb2-phy driver, vdd-supply is not a supported/valid property.  Drop it
> > > from qusb2-phy devices on various boards.
> > >
> > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > 
> > Why not add it to the regulators list instead? It's a valid regulator for this hw.
> 
> I do not have enough information to be sure.  Could you cook up a patch to
> update bindings and driver, if you think that's the case?  I will be
> happy as long as that DTS, bindings and driver are on the same page.

Aha, I checked downstream kernel and vdd is indeed a valid supply for
qusb2_phy.  Please disregard this patch, and I will update bindings and
driver instead.  Thanks, Konrad!

Shawn
