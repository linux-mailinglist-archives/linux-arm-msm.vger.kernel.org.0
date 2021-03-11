Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D99337979
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 17:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhCKQeW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 11:34:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhCKQeK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 11:34:10 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C293C061761
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 08:34:10 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id m1so1922467ote.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 08:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dyv9rjgRqHM3ISb3nAs9ey94KS30FCHaoxikKXq9PFU=;
        b=qmxzwoDEdf6SPjz94ihJ58wR3c7SGRVgwQrVYpj/wy2XoRX3njfO6Q6TrlsHp6zmCf
         bTZF5Odla5eCb5n1YjvyPVpq/kYKHL+l1EVLBLMIbplPhP6XE1QRIdxv0hjS1/s4WP0Z
         lEjuuTJixvzY5S/YgmZTIhIsaK0ojRujF5ZdTXjL9NhDidP9uC1sbiMoF9y8zLGbOGll
         4VkMO4elfInBgOT5Z1VqUeoAopDNzVbJ1bCSuqh2Ikc/qcwiROpEUPdOBYwHwgIS4MIJ
         DnlgSTtcOuF6mYTauHJ+VClcPOi6zz8z89BNDNcCMXbox2NHMSyNffSc8NaY0znCJG/7
         q6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dyv9rjgRqHM3ISb3nAs9ey94KS30FCHaoxikKXq9PFU=;
        b=pR8JG8/sbG2xUcclXtjf491jRBx9dTGzY6CSivx5LE6I32EPiKGp22xp9Le14N3GGU
         ULVHMWLxSp+xfW8FXO6fLz9wwYH4wfOFR0IdtzNnBelGEWpV8S/rxUic11QIaB5RJCxH
         dPASSOHxpFqzw0XgMTu9nY1nVXzcUQAfW0+ghaVpZhitlFwRrnkF1kKQ3UqGuIgvEWJH
         vVW9Mic461BUbMsEGz6bvksoOAZ3I2dDaZXpSWT0k4whTPex6MOEzw7lSDjA3VTRblOe
         I26Hn6foVzeGsuoDSDIcBg3g6TRS48SuACRkN6K3ORDyEaEAidLKUkcReci0UsnsAlfr
         1Vow==
X-Gm-Message-State: AOAM530bR1ZY96/1EBaoTaIETtPIRMPIoHGZJBfcKTS+MLprdHNlCfhS
        SqAFEccVAas+haSsm3yksc3MEg==
X-Google-Smtp-Source: ABdhPJwr4XiNBNu/8aosTUGLxLzFAawZykgwZN4DsnCAeb9XfwjN7rWoissS0her0NE/VkFlXgrgww==
X-Received: by 2002:a05:6830:1513:: with SMTP id k19mr7299144otp.51.1615480449874;
        Thu, 11 Mar 2021 08:34:09 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w7sm726987ote.52.2021.03.11.08.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 08:34:09 -0800 (PST)
Date:   Thu, 11 Mar 2021 10:34:07 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     schowdhu@codeaurora.org
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        sibis@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
Subject: Re: [PATCH V1 2/6] soc: qcom: dcc: Add driver support for Data
 Capture and Compare unit(DCC)
Message-ID: <YEpGf7kQS53pByqC@builder.lan>
References: <cover.1615393454.git.schowdhu@codeaurora.org>
 <48556129a02c9f7cd0b31b2e8ee0f168e6d211b7.1615393454.git.schowdhu@codeaurora.org>
 <YElUCaBUOx7hEuIh@builder.lan>
 <7c189355ca6c472b05151673d27481c3@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c189355ca6c472b05151673d27481c3@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Mar 04:06 CST 2021, schowdhu@codeaurora.org wrote:

> On 2021-03-11 04:49, Bjorn Andersson wrote:
> > On Wed 10 Mar 10:46 CST 2021, Souradeep Chowdhury wrote:
> > 
> > > The DCC is a DMA Engine designed to capture and store data
> > > during system crash or software triggers. The DCC operates
> > > based on link list entries which provides it with data and
> > > addresses and the function it needs to perform. These
> > > functions are read, write and loop. Added the basic driver
> > > in this patch which contains a probe method which instantiates
> > > the resources needed by the driver. DCC has it's own SRAM which
> > > needs to be instantiated at probe time as well.
> > > 
> > 
> > So to summarize, the DCC will upon a crash copy the configured region
> > into the dcc-ram, where it can be retrieved either by dumping the memory
> > over USB or from sysfs on the next boot?
> 
> Replied by Sai
> 

Thanks Souradeep and Sai, I'm definitely interested in learning more
about what the hardware block can do and how we can use it.

Regards,
Bjorn
