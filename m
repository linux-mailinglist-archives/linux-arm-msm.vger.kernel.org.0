Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED8F422CDA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 17:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236105AbhJEPrL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 11:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236043AbhJEPrL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 11:47:11 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B24EC061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 08:45:20 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id e24so26769617oig.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DyGC1o0ExiPXVEzbLwM161zjxcLwXtL3mQFHYbOsiDo=;
        b=L9DrO2uUoQ/UpmFwlKvuVaRiu12KqmtBMCrJ2DKw5oxUJeW34nCAUCbRoMUM6Vk34w
         ZEn1A7xPxnl9G2tq4BMjqrXkoR4FGN/0sfLPauqPM5neqBW/CcBHVsADJLnA+lZ7mVFw
         9DD9epEqNj0CvNGEDlT7pmoNOmmBhaQpa3QpMAQjbsdvnfwwISp5B88IwHqK2dZFo7Xh
         bHzU0WBMncx9+eKP0uX+iaLmoCw8dixxGSFSzseCChZCE9hYyK5niUZYosyY5BYPkRSN
         DKYsTQM9tjlwCAvC8pZl5xAh7D9/yjgiUPUmC96sdR0cdjpy5xXgmxALmFMajHyfUX5D
         LQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DyGC1o0ExiPXVEzbLwM161zjxcLwXtL3mQFHYbOsiDo=;
        b=mYT6TI3pEV/UG1db6cGRNRFe7m28FgwEwnsnOC2qXSlQuBDqD7ggZD/JmF42zKUn0B
         E62vEp3Ta0kA2De4gVQ3Gqy1LLwvNjrd4h9pO23IvF8TUAw787+K87PSRFdASP4hZ1Bi
         9D7d6SbPDsNmh/ouCTiRkp+dyv9NiXUUIU+MUCvh78YQ1IF3WowM3YDTq5g4BoSrG3Ci
         y2SZH6klBkbPbsiN0I3e5Bfcpi8jiKmSZytzgP7Omn8A7sYoMqCk7jxBZiiZsGzUdXtr
         9KzgPDNuASMg514hUafYKZsEa7cPUNx2iftGevhklMRd+w/ECgUG5Nzh2yT/XsYDWCrC
         Aanw==
X-Gm-Message-State: AOAM530ucMJxoLnrh1Tecb7hyivkEspZ95PKU4sG1BAn503L76Z9rmxb
        r+Oq9BwTu6TO4YVU68dvc3IGYz+/HFGIWw==
X-Google-Smtp-Source: ABdhPJxcdpxGev1KAnRYwHDx/rf+AN5tzztCSHqw6+k+f4FyxvAWAqXGrACRtPVl44iPi8MVcXXF7Q==
X-Received: by 2002:aca:110e:: with SMTP id 14mr3093834oir.18.1633448719808;
        Tue, 05 Oct 2021 08:45:19 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id a3sm3345617oie.3.2021.10.05.08.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 08:45:19 -0700 (PDT)
Date:   Tue, 5 Oct 2021 08:47:02 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: phy: qcom,qmp: IPQ6018 and IPQ8074
 PCIe PHY require no supply
Message-ID: <YVxzdiVKWOF9AVVV@ripper>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
 <20210929034253.24570-3-shawn.guo@linaro.org>
 <YVvx9jEGS3g9LD8X@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVvx9jEGS3g9LD8X@matsya>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 04 Oct 23:34 PDT 2021, Vinod Koul wrote:

> On 29-09-21, 11:42, Shawn Guo wrote:
> > The qmp-phy driver suggests that 'vdda-phy-supply' and 'vdda-pll-supply'
> > are not required for IPQ6018 and IPQ8074 QMP PCIe PHY.  Update the
> > bindings to reflect it.
> > 
> > While at it, also correct the clock properies for IPQ8074 QMP PCIe PHY.
> > And as the result, 'qcom,ipq8074-qmp-pcie-phy' and
> > 'qcom,ipq6018-qmp-pcie-phy' share the same clock, reset and supply
> > bindings.
> 
> Acked-By: Vinod Koul <vkoul@kernel.org>
> 

I think it's better if you take the two dt-bindings through your tree,
so we avoid any potential merge conflicts related to possible other
changes.

Regards,
Bjorn
