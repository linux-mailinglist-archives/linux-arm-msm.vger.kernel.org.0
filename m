Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA3A9DCBF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 18:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393254AbfJRQxM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 12:53:12 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37065 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409213AbfJRQxL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 12:53:11 -0400
Received: by mail-pf1-f193.google.com with SMTP id y5so4239715pfo.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2019 09:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NlVpUWWb77Jgx8c6AKiFTKsV64mXcIM59rzR3NbF5X0=;
        b=l/5bNc1UOgviL8cXU+xAaLQOtmOhi56H7mopre3Lu97/kYO2lo5DMOwuqzo16GPpU7
         en2sBDgJn/rwquPVBU6NOvsJuW2lX6njpbipp3wFM2DBhFIibFMM7Ji7fEC+5JJ3IyVd
         xmgPjfeDjfUjmiuPFwMOJKKQPuPQXWocZgmkWMoeUMAGd+Y1IMhD+QsOMDWHzASPJjmn
         lB5yUIilNr+WEfcrkyxzN7+9VZZe/t2KW0WOBj8DSGeKn0smaVryK+M4jM3Lud2alJ9k
         WAQharx87X1yFjofhhWaCKeNztbH7vyUakUyu1a+f2UZ/C/+XEK3z2xhCu3JouqnP4le
         Y57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NlVpUWWb77Jgx8c6AKiFTKsV64mXcIM59rzR3NbF5X0=;
        b=E5J5mQtWES0V7N8fFrUXM1FE7nlDSiXQVuoNeGoMIyO+4dFHELeq9P+T6eNHJ7qIx+
         F8SAcfPoNH7xZN0qFXZ+FDbb9TQnQro+hDOBg0hiQkUQs6M+wzkEbKFnMe/C4DEiZj36
         R9uH+nhp177I8DMDliul7Mey/fPs2BlUGbLhYWws5FycIR2wTTn/RzMI3o5CIdozdcl/
         X3biRQ3GUH1ar8gDxPzIE19cdy2ylzmTMRvsVnJOmklfITcEGtpZyxPKRbFcVxHfZOjw
         Xe9t7SUx1PuKn5AZ1ZMsMM9W7yMC6jNOH+KYKE5knuwsJ9F9/0pn/B1Ac38WzVjskMDY
         zhaw==
X-Gm-Message-State: APjAAAXBhgMAvqAfCHUrKm2QNF2MQ8M/AlwQZgiIswtNgjkj94ZSbQZE
        Lls8C3aokvZ+QuQSSN2PhVrPRQ==
X-Google-Smtp-Source: APXvYqy4EO909F7HnCUZ2Fmo7UCAUkdG66jUJnEgoxHT/sDHoXa2mMyp6Et3xVZh7h0kG3B3iUDOAg==
X-Received: by 2002:a17:90a:a00c:: with SMTP id q12mr12481013pjp.102.1571417590960;
        Fri, 18 Oct 2019 09:53:10 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k66sm6624950pjb.11.2019.10.18.09.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 09:53:10 -0700 (PDT)
Date:   Fri, 18 Oct 2019 09:53:07 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <mripard@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alex Elder <elder@linaro.org>,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm remoteproc dependencies
Message-ID: <20191018165307.GD1669@tuxbook-pro>
References: <20191009001442.15719-1-bjorn.andersson@linaro.org>
 <95a80ff0e89a568d223fab6eb1f9362a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95a80ff0e89a568d223fab6eb1f9362a@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 18 Oct 03:38 PDT 2019, Sibi Sankar wrote:

> On 2019-10-09 05:44, Bjorn Andersson wrote:
[..]
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
[..]
> > @@ -780,6 +783,8 @@ CONFIG_PWM_ROCKCHIP=y
> >  CONFIG_PWM_SAMSUNG=y
> >  CONFIG_PWM_SUN4I=m
> >  CONFIG_PWM_TEGRA=m
> > +CONFIG_RESET_QCOM_AOSS=y
> 
> I should probably fix this ^^
> 

Please do, afaict this driver should be tristate.

Regards,
Bjorn

> > +CONFIG_RESET_QCOM_PDC=m
> >  CONFIG_RESET_TI_SCI=y
> >  CONFIG_PHY_XGENE=y
> >  CONFIG_PHY_SUN4I_USB=y
> 
> -- 
> -- Sibi Sankar --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project.
