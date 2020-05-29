Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63AC41E864C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 20:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgE2SIt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 14:08:49 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:39405 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgE2SIt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 14:08:49 -0400
Received: by mail-il1-f196.google.com with SMTP id p5so2278985ile.6;
        Fri, 29 May 2020 11:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fAPMvdCxZ4POBY6nc3rFtmxuB69MEYTi1r/Uyy3CO6U=;
        b=CJ1gcnfHb0uqMNSviITu7tnUmxP1Kd7gxKvAxux5FfahvE26454qsxxreXIOVtr+BN
         9eV9MJbI3wKDr2DpMx7rnio/WRF5/jPqlwn9172hwCs28xjKTfnxgvJfwxVbt8EnHe5e
         3PzaCHTxb/9vSdSkcys1IuxbwPhnRUqKrFwETBhnCw2CJBB5teF4Gixev4KJ2m0/TLaS
         XWU2atkoEYuoyRwG58pNQC78vzMhTMMLs4T2juJI3J2Wok01D8XkhqhFNVR1Q2hj4G+u
         +CThok9NoUNTjMLB/aySncXh5PY/gk4qGi4CxZ/OyfGI5QNxJK/KKygJZIOwOI22rLzM
         jPYw==
X-Gm-Message-State: AOAM533YkVEWxTdhxmLC5EK0Vkz2cgfuZ/mAoT2LpjOhm8+VUUGh1seS
        VgX/1Qc6priYy1am7c10YK5VxSiTrg==
X-Google-Smtp-Source: ABdhPJzEmzJB88im0xX+IWa3CP3v6ng1HOhnw9shue3L5SsITUFoekqj4bb3cfmDpdg1x2MhNSNdFA==
X-Received: by 2002:a92:40dc:: with SMTP id d89mr7919510ill.170.1590775727092;
        Fri, 29 May 2020 11:08:47 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j63sm1233170ilg.50.2020.05.29.11.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 11:08:46 -0700 (PDT)
Received: (nullmailer pid 2675913 invoked by uid 1000);
        Fri, 29 May 2020 18:08:45 -0000
Date:   Fri, 29 May 2020 12:08:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     sboyd@kernel.org, robh+dt@kernel.org, agross@kernel.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH V6 3/5] clk: qcom: Add DT bindings for ipq6018 apss clock
 controller
Message-ID: <20200529180845.GA2675856@bogus>
References: <1590582292-13314-1-git-send-email-sivaprak@codeaurora.org>
 <1590582292-13314-4-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590582292-13314-4-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 27 May 2020 17:54:50 +0530, Sivaprakash Murugesan wrote:
> Add dt-binding for ipq6018 apss clock controller
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
> [V6]
>  * Addressed review comment from Stephen
>  include/dt-bindings/clock/qcom,apss-ipq.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,apss-ipq.h
> 

Acked-by: Rob Herring <robh@kernel.org>
