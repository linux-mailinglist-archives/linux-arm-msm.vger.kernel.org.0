Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526CE2C7E21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 07:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgK3GUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 01:20:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbgK3GUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 01:20:50 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38414C0613D4
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Nov 2020 22:20:10 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id r2so5928113pls.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Nov 2020 22:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e6/0gQdvLoVUNAqzND9z211r0JVYgRFA1dvP6rq7O2I=;
        b=Y6f4khUrZoLfQLqy69ifbfbcTpPOG3XcRlzw8TU3PDdfr87ez15ZoDz9Klr7Bi9pNN
         K0cUG+yBuv7eSOSHj2P+KOaBCiGLyFGQCV6IpiSinLzJIhVzwPh8UvTGJO7YUDCdk2MS
         rfkqiJw7k7A5x6bhLg8jn5hzXE/ycO2lP7jRmLrBTGfdc9bbTNUPIT5fBTKG1vAp/cmQ
         YuDFhkfCh4o+DtMuUHLLdU8HXv7HcSyljb9uLur7IPwYaKkuxFBhbmG3KSQve1ORQCEN
         Iwd7HIJOP/Y9mXB2pPn+rFUfExFksjiLIoGfqfTKe1DOjbn1eVRf/3suti2v+A9qUH1O
         yOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e6/0gQdvLoVUNAqzND9z211r0JVYgRFA1dvP6rq7O2I=;
        b=bD37ggWNvJWtBRiOvFyMYBiK5CpoNazectHCj1Wrg1gG24xx0CHoZrYBxI6gGF1g7s
         cVclSnHDuH+jxtfpcTuUKaRo45K4IqfxkkFChJaD68w8s1PCMp+WcBsxGl/AfddANwWa
         FV8aRb6C0wNzCpE2k9DOW1rNfhS3763OA4Hs0kybe34eUtcEAufMyCl2dM6ZqgUBAX+6
         zCo7Qf48LHNh0btql37I9P5jSaNsA28CEzzqSZtyTsNB0N+tZnmrXiy/N3bn0YMKPQ6O
         nkqcss+P+zEa8i+mqgn865JkEdoM068IVL1M87XQeANiXwbMNud4Y49OWOQjBF4p5cBK
         Qvow==
X-Gm-Message-State: AOAM530eTSvrSJs4C+H5biCkgt5JTyT/tp7DwLiFSN+i3oawAjSV2t6q
        l7sUj0Q3ifHIakG65++spJkqrQ==
X-Google-Smtp-Source: ABdhPJxPYNdR6BJ3iG7Ra34F3nFO3OcGXFwA4UclLlDhKqm+lE0TfNn/LO5gZblhCwsWtMAR0KM7RA==
X-Received: by 2002:a17:902:7488:b029:da:6be9:3aac with SMTP id h8-20020a1709027488b02900da6be93aacmr6634118pll.59.1606717209620;
        Sun, 29 Nov 2020 22:20:09 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 16sm19896139pjf.36.2020.11.29.22.20.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Nov 2020 22:20:09 -0800 (PST)
Date:   Mon, 30 Nov 2020 14:20:02 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Wolfram Sang <wsa@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] Revert "i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630"
Message-ID: <20201130062001.GB28578@dragon>
References: <20201124185743.401946-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124185743.401946-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 24, 2020 at 12:57:43PM -0600, Bjorn Andersson wrote:
> A combination of recent bug fixes by Doug Anderson and the proper
> definition of iommu streams means that this hack is no longer needed.
> Let's clean up the code by reverting '127068abe85b ("i2c: qcom-geni:
> Disable DMA processing on the Lenovo Yoga C630")'.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Shawn Guo <shawn.guo@linaro.org>
