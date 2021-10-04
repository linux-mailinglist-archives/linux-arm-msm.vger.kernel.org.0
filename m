Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F48642068D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 09:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhJDHYV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 03:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbhJDHYT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 03:24:19 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E9BC061746
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 00:22:27 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id k26so13717563pfi.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 00:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7mKXXe3kx7Xg5YaGiLWPR8pCdxsfsItgH8LVPO+KjDE=;
        b=qVXhg8tF8dRzIKjnC2Jvyu3cK7Gy9wjYPsh5+baTMVFNAy5X0W8ldjw8pKbSde5vKf
         OS4cb9ul4d5492JScITqJFV0RPf7We/VTsbdOpUX4TIM5tOwtLHhp5BozB7Jkt2qz6lN
         ayre0eFOalNUaAIiGGmKmyMB4+vNPluQHd9SASkOa2GceZc4icghwY+MGH6ycMIJR4Xh
         KJ2ybQvlgKWiJi+Sksxy1rLzmpNkF97y1hldmDLVglnwbGyZR5ivQoDDy5eguFrb2tch
         ri7vOQ8LB9AZYvjrT+8k/GPYhNVJYI4wV5ekBcrHymVkOKhRISHmCuhyL8miWiKvEGRW
         96Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7mKXXe3kx7Xg5YaGiLWPR8pCdxsfsItgH8LVPO+KjDE=;
        b=sVuoFOBlu83LZMXADOqzqbD+I/obA8m7a9sRDAYDkpAgYCMdPBvF1+mu1Injq2h88/
         kJFtzem7Gao+7iX4GPMRgVpyOZTVw65elr8KuRhknLX3CzguS/6V38Jx8gxgtufL+cbL
         KMcx63DoyNd6TsAnwno36NY5H6wp3KHoZjnz+iOYJ4aVNFMrCjLEhe3ihEBvm3VhB3Xo
         8jXEW3osr5xUKaf9zDn23vZQQ6NcjteDCdcdkQQ5pxh87yZP97c8iXnOZkI81wBS3+10
         gHYwyVoBmMMcNbHibazhzmqT2r0wiVUSkv68ltjFYMufyGN9jOkpzrsJbVhKdb4QzhGH
         xN5g==
X-Gm-Message-State: AOAM53087VGRt1HwNvS1F+acpmkyV+mMd+MkVSPQyzqRCD9oZCRXjAlf
        LQ0e9S2INfoYaXGX45BjVo4jdrDO8yyp
X-Google-Smtp-Source: ABdhPJyzUrzIuLl1SlLOxM85x7EgYuuRcpxtQ52/DgMsDAAiUVEKaKayeFC1Jc1FXMWEsma5IL2LOw==
X-Received: by 2002:a63:724b:: with SMTP id c11mr9614019pgn.9.1633332147462;
        Mon, 04 Oct 2021 00:22:27 -0700 (PDT)
Received: from workstation ([120.138.13.170])
        by smtp.gmail.com with ESMTPSA id z23sm13444807pgv.45.2021.10.04.00.22.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Oct 2021 00:22:27 -0700 (PDT)
Date:   Mon, 4 Oct 2021 12:52:22 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     rafael@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: cpufreq: cpufreq-qcom-hw: Convert to YAML
 bindings
Message-ID: <20211004072222.GE16442@workstation>
References: <20211004044317.34809-1-manivannan.sadhasivam@linaro.org>
 <20211004070531.sexvnqmnkoe4j6a2@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004070531.sexvnqmnkoe4j6a2@vireshk-i7>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 04, 2021 at 12:35:31PM +0530, Viresh Kumar wrote:
> On 04-10-21, 10:13, Manivannan Sadhasivam wrote:
> > Convert Qualcomm cpufreq devicetree binding to YAML.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> I am not sure if Rob ever gave this.
> 

I'm not fooling you :)
https://patchwork.kernel.org/project/linux-pm/patch/20210701105730.322718-5-angelogioacchino.delregno@somainline.org/#24312445

> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Why double signed off ?
> 

Ah, it came while I applied the patch from Angelo's series. If you want
I can send a new version removing one or you can do that while applying.

Let me know.

Thanks,
Mani

> -- 
> viresh
