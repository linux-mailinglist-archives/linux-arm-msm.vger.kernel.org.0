Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40AF8F5CD7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2019 02:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbfKIB5l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 20:57:41 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34595 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfKIB5l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 20:57:41 -0500
Received: by mail-pl1-f195.google.com with SMTP id k7so5113059pll.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2019 17:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wABmcIUMWqa+dvchqrcCmAVK5Fqcc0dVO4cUH6ycLOw=;
        b=vw1HQQNkKqAAL/e97In4V441WtCpDoo1dWsCAtylvAvld0m4gl3WvhUMz57VkU7MD6
         INXsxbXWV/nhZjUCMMHB6HDODS7AQiB8BVFwCXw78O6yHRsam7S3keYN36wSoXYMcBVx
         JWlkcx+NYX8U4fP22eBC8A8PcPrhkY0gREssaqwsfGqE1edZ+MZY5hxDeceYqZGUT7YC
         WZMxUjlNyH6YPlgAMGsn7d6dAdwueervyw/tH6go2EtHqaNsr/wr0F9M5EYjMng466ng
         5qzk89NywTn+L1AxJ36H4WrU6c3+dviIpEBv20Ni2JDuFx1hl5P2L4rvTX/jWmCBUnwe
         rHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wABmcIUMWqa+dvchqrcCmAVK5Fqcc0dVO4cUH6ycLOw=;
        b=WQDNG8Jo4GbwW6FDDELL3BmNM0OGhppShTtT+sniNRE95fFRlFe4WzS7wOWbUP4bJL
         Ymjqx+xkVTN0qkOvCvwJuKt665Wql9uTNcbEf235y8qkjGynIriksJv9WnHjJoBUW699
         gLCqszbbhUeavQxdC6R5Jd31W3YvbE9P0z0TdA2uMYj5o8cQPY25YGV1AbQYH1EG5QOt
         Q4qCnmgWIp2lIEXWzRHEvQE7sGHoxl12xthwb0LTAQ4yjdExiZyaMfCcEzDpR4gszxLk
         PIOGSsa8QdWnDBVIbIZYGI2rbNPa4TmucAJnBkiBiuoNnC8snXid8p/bhXP+XGLQn4Q8
         U+9A==
X-Gm-Message-State: APjAAAXWsrBC4hmtribkvI5w013ev9g3ui8tKS/ZbPczMr3UHHpHHdIC
        QjB3fBkcmxFu7m71A8OhOqnrQfmxcQA=
X-Google-Smtp-Source: APXvYqxpl+7pNkv2HTiAT0aIk1CC1Hfq/h+HZM4z6Q14XJeWhCwfLOpTT/n1edlNqbWV9FMcx9ta8g==
X-Received: by 2002:a17:902:7793:: with SMTP id o19mr14249657pll.335.1573264660540;
        Fri, 08 Nov 2019 17:57:40 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z62sm10131303pfz.135.2019.11.08.17.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 17:57:39 -0800 (PST)
Date:   Fri, 8 Nov 2019 17:57:37 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     georgi.djakov@linaro.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] ARM: qcom_defconfig: add msm8974 interconnect
 support
Message-ID: <20191109015737.GB5592@tuxbook-pro>
References: <20191024103140.10077-1-masneyb@onstation.org>
 <20191024103140.10077-2-masneyb@onstation.org>
 <20191109004310.GA4494@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191109004310.GA4494@onstation.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 08 Nov 16:43 PST 2019, Brian Masney wrote:

> On Thu, Oct 24, 2019 at 06:31:37AM -0400, Brian Masney wrote:
> > Add interconnect support for msm8974-based SoCs in order to support the
> > GPU on this platform.
> > 
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > ---
> > Changes since v1:
> > - Set CONFIG_INTERCONNECT=y since its now a bool instead of a tristate
> > 
> >  arch/arm/configs/qcom_defconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
> > index 9792dd0aae0c..cbe4e1d86f9a 100644
> > --- a/arch/arm/configs/qcom_defconfig
> > +++ b/arch/arm/configs/qcom_defconfig
> > @@ -252,6 +252,9 @@ CONFIG_PHY_QCOM_IPQ806X_SATA=y
> >  CONFIG_PHY_QCOM_USB_HS=y
> >  CONFIG_PHY_QCOM_USB_HSIC=y
> >  CONFIG_QCOM_QFPROM=y
> > +CONFIG_INTERCONNECT=y
> > +CONFIG_INTERCONNECT_QCOM=y
> > +CONFIG_INTERCONNECT_QCOM_MSM8974=m
> >  CONFIG_EXT2_FS=y
> >  CONFIG_EXT2_FS_XATTR=y
> >  CONFIG_EXT3_FS=y
> 
> Georgi: Since Greg wants to allow compiling the interconnect support as
> a module [1], should I change CONFIG_INTERCONNECT to be a module? Or
> leave this as is? The GPU works fine with interconnect as a module on my
> phone. I know it's more for the cpufreq case.
> 

This is the qcom_defconfig file, so it's fine to leave it =y. For the
multi-platform ones we should do the specific drivers =m, where
possible.

> [1] https://lore.kernel.org/lkml/20191107142111.GB109902@kroah.com/
> 

Thanks for the pointer, I don't think this is a good idea and did reply.

> Andy/Bjorn: This series didn't get picked up for this upcoming merge
> window. If it's too late for this window (which is fine), then I'll
> hold off on resubmitting this until rc4 since I'll most likely have
> more device tree changes by then.
> 

Sorry for missing it in the final preparation for v5.5.

I don't see anything among these patches that would require you to
repost the series, either we pick them up for another PR (although it's
rather late now) or we'll apply them as -rc1 lands (for v5.6).

Regards,
Bjorn
