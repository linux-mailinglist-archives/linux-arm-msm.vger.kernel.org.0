Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B153EA838
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 18:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhHLQGS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 12:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhHLQGS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 12:06:18 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FAEC0617A8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 09:05:53 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id b7so7907691plh.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 09:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Atv8Vvc8zmZs7qz1+cYK+lFIwWM1M7nG99JAbjLrF4E=;
        b=YLBpW1dX3jsE7c7oMqrzlss5vSGGZs6u7+pnog4p6i2QHlY7s+MM8yFUpgnMjcnswI
         ni53NkrUhey0mDGFIAAM44Gu5KJjoPDDc9/ZTF1wlR1sv0i/UsDLXsOePa6/LkOryX+c
         TPtvVZVuubtiV8YUi6kELv08mDXeaxoCeEpbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Atv8Vvc8zmZs7qz1+cYK+lFIwWM1M7nG99JAbjLrF4E=;
        b=O+3X9YaphrAb6AXfFE+QPmX5pxkJfxTADs48+J2SDy/5M3IkVDyX/KowC2oFnU+MhP
         HjkSAmc/15aEb0+pVFqG/6hxmvnayrp0A4K6I4H9bLK2c5p0GG2HN7RaV0Mv0NkG+GYl
         oLZlcQaT0LxQBVHwOn3e93xDhKngsgtD5+lnZcqWOgzIdLKVw5M9WSl7WllwtJTRm2w+
         lyAEUXgK3/GVZRDUqQYs/zvx6zsVWXNhJR6f3TkigI534IuGd0wc/hi6+60/L0g1Bd+y
         GI1HDziRI9Byws1NFuyyNw4GR+kQAJR62Szglhhh4vtD+oXx3UQdzjN29Tc936SDimHD
         bzUw==
X-Gm-Message-State: AOAM5304ISUBQ9sB4+smdsmG5zm9U63eXQcfBJnBwH7CuHohsPv0ghLM
        mW+6rNVa134RM0TFgMzx3H/nT7xPKfEJQQ==
X-Google-Smtp-Source: ABdhPJwMArqBGrrc5EDHc20ZZRFqVySoMYl6/C4HpJy4i1kKUF6QYYb5i+Gvtmzolcq+1zcng9ID9A==
X-Received: by 2002:a63:ff51:: with SMTP id s17mr4473823pgk.415.1628784352580;
        Thu, 12 Aug 2021 09:05:52 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6683:43e5:ba4c:d76c])
        by smtp.gmail.com with UTF8SMTPSA id z9sm3723003pfa.2.2021.08.12.09.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 09:05:52 -0700 (PDT)
Date:   Thu, 12 Aug 2021 09:05:50 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org
Subject: Re: [PATCH V5 5/7] arm64: dts: sc7280: Configure debug uart for
 sc7280-idp
Message-ID: <YRVG3sK82lZhTAGL@google.com>
References: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
 <1628754078-29779-6-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1628754078-29779-6-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 12, 2021 at 01:11:16PM +0530, Rajesh Patil wrote:
> Configure uart5 as debug uart and split the pinctrl functions
> to match with SoC dt.
> 
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>

As I mentioned on '[4/7] arm64: dts: sc7280: Update QUPv3 UART5 DT node',
I think you need to squash the two patches to avoid breaking (temporarily)
the SC7280 IDP DT due to the undefined node 'qup_uart5_default'
