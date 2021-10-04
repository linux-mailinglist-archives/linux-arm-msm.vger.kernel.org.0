Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D29AC420667
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 09:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbhJDHHX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 03:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhJDHHW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 03:07:22 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7326CC061745
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 00:05:34 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id pf6-20020a17090b1d8600b0019fa884ab85so2845421pjb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 00:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RPoe9yQ/p8JX2xrTYhiPsh6nCIk1jjrxqKzdQqWJyog=;
        b=Ka8y1AQQmTEFx8/r768QmfjGxG53lXA8UbkO6mDVZsaX+DQI8NaaDAcF3mBu9G9Xyd
         HUE6S7nv1P+pTi2De6WqhQC1deOIQ0Ke7YEYeLR5tuKrC1A05ShCiDTNwoLZxoOHW7Qx
         bLehQMyfGNeG/PjVcgu1gqrCRf40HaVU6o9scklcvA0BTypLghbyv8B43pyb5mChkEAb
         VEzNnd2+e72sLNEonol5rLBSnumCUUFEGUNO971Qi0B2/2tqyqMQuAZnSTlOkLLe1CiB
         WP04FkeCobT53WYfu4kl2vy9e9Wvbkyst6XAjIzAZb0kkWMLzU86rtsCf2FeqQqCZina
         efew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RPoe9yQ/p8JX2xrTYhiPsh6nCIk1jjrxqKzdQqWJyog=;
        b=iBO5kqaXflxwpN1sPw79N5KBwVd4QZV9fjQDatnBHtSmx1ek/MtDNlkZ/T2fEpT+27
         TZFGAVtiY6KoR56YuqCgf2cAOP/Ik0vG04ORG2INij5eduH2tIVck2GjWHyQDphW3ZxB
         tKOY9hsdVPtqzTY7AEgjCqvawX8XTs9oq2s/UQczIEeSB9Ab6BreH50fcFOzaZ0/C79F
         UyTbNH4ECZLEKKyBcJR1hKCUBqkRGUidTw8u0uPNQSgz8R2hL518NkWaabCov/GHripX
         7zfJm2qdUZpvNDlBCxG09sgh+wRNn1dXI3DsshLuplg3D+FQGzVyu/cMMLSojy4/CuIF
         838g==
X-Gm-Message-State: AOAM533Dc3rOgyc5VKk0naMIUdbdwvwjtqVQMEOQVMwoEWrZdn6O19uQ
        rwsILeUT/UnyOZjOjIG6gLf+Xw==
X-Google-Smtp-Source: ABdhPJyA+/zycYXtCrPiIKuHwWlHal7yChVygfvWDZI2GL/gExSMeDtDqVqRw5UZIxqD9vYgxtfCug==
X-Received: by 2002:a17:90b:4b49:: with SMTP id mi9mr36027415pjb.79.1633331133955;
        Mon, 04 Oct 2021 00:05:33 -0700 (PDT)
Received: from localhost ([122.171.247.18])
        by smtp.gmail.com with ESMTPSA id y15sm6631075pfa.64.2021.10.04.00.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 00:05:33 -0700 (PDT)
Date:   Mon, 4 Oct 2021 12:35:31 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     rafael@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: cpufreq: cpufreq-qcom-hw: Convert to YAML
 bindings
Message-ID: <20211004070531.sexvnqmnkoe4j6a2@vireshk-i7>
References: <20211004044317.34809-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004044317.34809-1-manivannan.sadhasivam@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-10-21, 10:13, Manivannan Sadhasivam wrote:
> Convert Qualcomm cpufreq devicetree binding to YAML.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

I am not sure if Rob ever gave this.

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Why double signed off ?

-- 
viresh
