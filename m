Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B91D127267
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 01:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfLTA3d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 19:29:33 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:34421 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbfLTA3d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 19:29:33 -0500
Received: by mail-pj1-f67.google.com with SMTP id s94so3194601pjc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2019 16:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eX0+hKMYcJo8oBSEwdDTOyo7vFKsKuywhqNqQ3gnd9c=;
        b=IXHYa4eu6/nT1cGBEnEO7gnNoLSOy6TN1udA1k99BPkuUvT8WFfQeaSMAEbmqUk6a7
         aQ1jaME3xR3qP/wFQFMFijqSey8bkl70nre6AH4Bei84xPZYE+Orx4KM/cQARiIifmnI
         7h+J+ZtUFn9dw4T0HwB3XBsQTtCmZt9qtd7mmAGrFmnZXUICmBHnugxU7JMI4TA9hC7m
         gPgJy9lLZMLZ/U1uYaOUIpP5LT/mLSOniOAAAbxk4hSeQxEb9xwbvAx5w0AgguXBcYWk
         Jm+jkLGiFeyscj9bjsXZx/skIY4/q3ZfEF8ek+MIEaV68EORn4YmPOQrp0XUoOwEFTRD
         EMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eX0+hKMYcJo8oBSEwdDTOyo7vFKsKuywhqNqQ3gnd9c=;
        b=c9SPvetVNkFnvLi28P91n8mf9z0LQzJ96vMnwAPcLl70/tJ55OCFbm+xh+8wnGXsJi
         ZSDLuielHaphgQ3I5eYUMKpLIF1FKX3WuEeBob49/EMG+t46ufPOAV8G9BtXxL8qjh2b
         3qfOKkBO0tTPm+hoOwfGTCoWjuEqTA5S4ONlY1O4h0FUhLtlfSS9SNEJyHyK+3s4r5yC
         Nj7xbb3WixE2bk57pd02r0X0MonAIHhTJSXxno+51Ni00j0DHLK4Ry/kgGnQlXtig79A
         p/yottJlByH7P9Wr6Z6j65GpCTvCdc6NgIh9TQPeFDAvzPqHum1+sq+u68CTILVDavTR
         2enw==
X-Gm-Message-State: APjAAAV1aiLv17CxBmx0suC0YSUvHVgUzVLOkqBAbh17AS7kpacGDH+o
        HlbOipwwXJlfU3YC7YaFuKX9zw==
X-Google-Smtp-Source: APXvYqzj4L30fXYvdhcn+1Z20UqVHtvyYJaC+EXHuHEQjLIsGtvvTqubS6mgEOKOe+0n+3Optp3Jvw==
X-Received: by 2002:a17:902:9302:: with SMTP id bc2mr12223170plb.148.1576801772778;
        Thu, 19 Dec 2019 16:29:32 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id gc1sm7676050pjb.20.2019.12.19.16.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 16:29:32 -0800 (PST)
Date:   Thu, 19 Dec 2019 16:29:29 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     sthella@codeaurora.org
Cc:     srinivas.kandagatla@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] nvmem: add QTI SDAM driver
Message-ID: <20191220002929.GJ448416@yoga>
References: <1576574432-9649-1-git-send-email-sthella@codeaurora.org>
 <20191218061400.GV3143381@builder>
 <17c718c483db710b32b2dbbcf4637783@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17c718c483db710b32b2dbbcf4637783@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 19 Dec 02:29 PST 2019, sthella@codeaurora.org wrote:

> On 2019-12-18 11:44, Bjorn Andersson wrote:
> > On Tue 17 Dec 01:20 PST 2019, Shyam Kumar Thella wrote:
[..]
> > > +subsys_initcall(sdam_init);
> > 
> > module_platform_driver(sdam_driver), unless you have some strong
> > arguments for why this needs to be subsys_initcall
> There are some critical sybsystems which depend on nvmem data. So I would
> prefer using subsys_initcall().

How critical? Needed to kernel module loading?

Can you please document this need somehow? (either a comment here or
something in the commit message). Be specific.

THanks,
Bjorn
