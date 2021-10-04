Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 691F24207B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 10:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhJDJBo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 05:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbhJDJBn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 05:01:43 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126CAC061746
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 01:59:55 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id g14so13944660pfm.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 01:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xctOnjrfnqdPEoa3tip3/LlkAqa1IsoEyPkzXNFOgl4=;
        b=vD0cU/s1vm+3nN3lc+qpbOlY1NZ1fr0ctroE7oqMauOwCiUPyYuFmJq2iHdj2yHSx9
         EiHX3gnukAK5oNEdfYHdgNjabX0okaUXHKZV0xiX2RaGT2lLxg1fYfi//6zJGwUdt+SY
         6BOCQO3a9i70wemWlftieZo7eGP2Wr3PQ1ffejuZ3hT7lGtrevzshVjLoXv7AcKUJpli
         CGZSFFeFtfihedDziaakSFO46idMianbhp9G9y+bwfSdj8uOL7ppMkYEu7t8FlVnmkTn
         P36E16bLWmXY5v5vwxtlsKffKjhKBwedcJx4nIH4iyzzaXuacMz9J59SzoxdFULOmpYF
         QDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xctOnjrfnqdPEoa3tip3/LlkAqa1IsoEyPkzXNFOgl4=;
        b=nBmcWxiX2BRpRYw5lNouSe6NmBkgR/y56eDKGUTD9THocjC9yc1kdSWRAjNmSaqF+P
         oQ1mxMyVxQjtKxbKM6mIhAsFg6L3ss9R6tbzyniOf2y2+XF2uMJXgv+3B4yBpiIdEJKz
         zPulVhV4+ebHpkuqhw7HO15q0/i1pPD4EEciZuHtu2uXDRk2o/Vc/IoA2aEJG4GKZY1G
         fxJTs0F00xBfVSKdJ2OXYCr5qWiI86LdgJY8QFhYC6pK61U4ooOeqqBMGd4NVJ0lmMVj
         3B7OxmTMbk4P3t97VIrlxF6elwsVy8/bJBqPr+/3Bd+QI8hlEJ0vZ5OBHYLDrCRSw3NL
         sMgQ==
X-Gm-Message-State: AOAM5324j9UxvBXFyztXRrMNgn0jqBJe7PrLWvtSRtryTqwPB2Rle5Po
        JGNHCfl4vHPsmc63THfeRx+Qcw==
X-Google-Smtp-Source: ABdhPJwSNvRu3CTp59vBuvr4RaMFcbMupvPQgnOOoX2hPpfzNEnqMHeDbG4cz+HBTly8u85sYIveag==
X-Received: by 2002:a63:a03:: with SMTP id 3mr9931268pgk.326.1633337994442;
        Mon, 04 Oct 2021 01:59:54 -0700 (PDT)
Received: from localhost ([122.171.247.18])
        by smtp.gmail.com with ESMTPSA id d24sm13622896pgv.52.2021.10.04.01.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 01:59:53 -0700 (PDT)
Date:   Mon, 4 Oct 2021 14:29:52 +0530
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
Message-ID: <20211004085952.3k7efa3lxlll3ivy@vireshk-i7>
References: <20211004044317.34809-1-manivannan.sadhasivam@linaro.org>
 <20211004070531.sexvnqmnkoe4j6a2@vireshk-i7>
 <20211004072222.GE16442@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004072222.GE16442@workstation>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-10-21, 12:52, Manivannan Sadhasivam wrote:
> On Mon, Oct 04, 2021 at 12:35:31PM +0530, Viresh Kumar wrote:
> > On 04-10-21, 10:13, Manivannan Sadhasivam wrote:
> > > Convert Qualcomm cpufreq devicetree binding to YAML.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > 
> > I am not sure if Rob ever gave this.
> > 
> 
> I'm not fooling you :)
> https://patchwork.kernel.org/project/linux-pm/patch/20210701105730.322718-5-angelogioacchino.delregno@somainline.org/#24312445

I did read that email but somehow missed the RBY :)

-- 
viresh
