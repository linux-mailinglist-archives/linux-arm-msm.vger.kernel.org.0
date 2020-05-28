Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA46A1E64A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 16:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403785AbgE1Owb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 10:52:31 -0400
Received: from mail-il1-f171.google.com ([209.85.166.171]:46189 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391322AbgE1Owa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 10:52:30 -0400
Received: by mail-il1-f171.google.com with SMTP id h3so342667ilh.13;
        Thu, 28 May 2020 07:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ovujcsIda1tQu8DKvfSwPVMWXijBMsT5Rkxd+Yb9Dnk=;
        b=IIvWxR8xlD7wyUoW56uJAmAm5mPr7u8Axd+OQfy15opTwxB2L6qnMYL4sKSGr8VRym
         CtSorwgKWKGWIcIB/nulXwyvHpc8Cwf2CgsOzXrv4IOFoWfjoaWOflmhZyFbvpjUFqtR
         S1X/ex8mOjGpoNHlnDXwzUW5e+nZKSEvYXPBFuIvtXfcRO4S+dtkYUJV5ruI7ESa/ALZ
         9AsnRceAFcsRuLFaTY5pS0SNDPCtrIG1+LV1wn7U++NqsuoEHuUqMikWkm781dM8pfSP
         pGtbbvN+Avlcq8b+XIrhRAcVcSAbPusCv9Knwi37u/+kXurLCwEqHHbrrSCtnqRWm1GM
         4tbQ==
X-Gm-Message-State: AOAM533K/bW/tfgeX2UCe3JvRiRgdi0OmyoR3emniCnfGeh1TynKr+Iq
        cTS8pL/Sgz/SVttPkzs11Q==
X-Google-Smtp-Source: ABdhPJwJaHWbYr6tMVxKGIV9kSLXoW5j2Prp5ZBTkEyhui05nVoF73ZZHNCf37YB32pRpWomLQkBEw==
X-Received: by 2002:a92:b10c:: with SMTP id t12mr2979301ilh.158.1590677549086;
        Thu, 28 May 2020 07:52:29 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id v76sm3387048ill.73.2020.05.28.07.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:52:27 -0700 (PDT)
Received: (nullmailer pid 44393 invoked by uid 1000);
        Thu, 28 May 2020 14:52:26 -0000
Date:   Thu, 28 May 2020 08:52:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Tingwei Zhang <tingwei@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv3 2/2] dt-bindings: arm: coresight: Add support to skip
 trace unit power up
Message-ID: <20200528145226.GA44346@bogus>
References: <cover.1589558615.git.saiprakash.ranjan@codeaurora.org>
 <7b69c9752713ce22f04688e83ec78f8aa67c63dc.1589558615.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b69c9752713ce22f04688e83ec78f8aa67c63dc.1589558615.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 May 2020 21:52:33 +0530, Sai Prakash Ranjan wrote:
> From: Tingwei Zhang <tingwei@codeaurora.org>
> 
> Add "qcom,skip-power-up" property to identify systems which can
> skip powering up of trace unit since they share the same power
> domain as their CPU core. This is required to identify such
> systems with hardware errata which stops the CPU watchdog counter
> when the power up bit is set (TRCPDCR.PU).
> 
> Signed-off-by: Tingwei Zhang <tingwei@codeaurora.org>
> Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/coresight.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
