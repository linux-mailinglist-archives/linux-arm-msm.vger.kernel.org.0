Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25C53B3128
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 16:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhFXOWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 10:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbhFXOWr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 10:22:47 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA648C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:20:27 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id v13so3030150ple.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eePxOylteKhPrwCmFLtrOPG3Jbi9jerQFSgyqSZqUn4=;
        b=vip/2UOViEktkOdwzuanBuKhWKbh4opOGgwV7tOKelwffEpwZ39caDyCkNsvuHBMAZ
         zjrhD5ieYH0K1VpyRGiux+2j2vR+wgMtQD/tibdAKs+X59WSDPR18rDvYixuqQSxBM+g
         yZWqsH1qOdEFthcBajmIZKGxcgRaeVEtyydjSf07uMbK9jqUKLG+bHLgF6lmc/A6Gyu4
         kUw2hLj12tMe537toJnbWLPx4DzlbGi9exqc4xNLwJ6niKpUW56Yt6XtsnAp/2pC+sUc
         DfKtTMSLR5GkljtQAbRl6WsU6JEwcURAOmx6qSmqV5oOBoUBxem/Abp0i1kDkYtTjz65
         5CXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eePxOylteKhPrwCmFLtrOPG3Jbi9jerQFSgyqSZqUn4=;
        b=taloxGs5Xjaz/x5daOxw11aOvnVHBvqEkMWPQTYIg9bSBtMyEGuqdUb3CK0AxXV5kg
         Q2clb+2M0NROJyLq7zZSdHOkcK3Qf/WEmW2iISCCos8HPjcvciiY2nPcJmnket6/849M
         Eq3p3L+owCEibw7+NiEpEljTEE85Y7iVZO+RqxNV0XBppzEqvrvddzmHKmXa/1Vh0G4J
         t0OkLuPyN0B0Gb5H8eEEwmxPOblpL0r818H7pWFvRd9kk2K+Bz5yGPmdys2Nkw+oC6QV
         qjZss48/D0g4noQacBB7ZiDeWUh7hnBOEifacFCSzFqNVbDbTYcJQW+h6VUzZskZqOUS
         MT/w==
X-Gm-Message-State: AOAM532ug58UayLnSS5e/3wgIve0Sl+yhYek0FpTbEx8auZJEsxXMo/k
        /T3ka6GwPt1I7KmdHmANvnWv
X-Google-Smtp-Source: ABdhPJzmvSCIQnC6b5rEPQbivKrVRN6tDUkGdG/pNSc8ZqPka4XTF0mpoM4Bwu4fXtBcYeiMnNkvUA==
X-Received: by 2002:a17:902:f212:b029:123:78c0:84a6 with SMTP id m18-20020a170902f212b029012378c084a6mr4552099plc.31.1624544426931;
        Thu, 24 Jun 2021 07:20:26 -0700 (PDT)
Received: from workstation ([120.138.12.173])
        by smtp.gmail.com with ESMTPSA id u5sm3095087pfi.179.2021.06.24.07.20.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Jun 2021 07:20:26 -0700 (PDT)
Date:   Thu, 24 Jun 2021 19:50:22 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH 0/8] MHI patches for v5.14
Message-ID: <20210624142022.GA6108@workstation>
References: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
 <YNSOq09BHPIPmmgF@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNSOq09BHPIPmmgF@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 24, 2021 at 03:54:51PM +0200, Greg KH wrote:
> On Mon, Jun 21, 2021 at 09:46:08PM +0530, Manivannan Sadhasivam wrote:
> > Hi Greg,
> > 
> > Here is the MHI patch series for v5.14.
> > 
> > Summary of the patches:
> 
> I took some of them :)
> 

Thanks! I'll send the left over ones after fixing the comments.

Thanks,
Mani
