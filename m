Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43650365C5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 17:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbhDTPlw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 11:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbhDTPlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 11:41:49 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF69C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Apr 2021 08:41:17 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id h20so19895370plr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Apr 2021 08:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RftfUOzx6cuYVUbwyHqCRiPh7HztqAU4DiiO5zyA3ug=;
        b=fsVuqnPUMW3p/omuF7n1o4se+xOnZjrzVPiRse/XOC7wqPl2IbqcuN+ck/bjnmuuMz
         yksubT3cxv+iKgqnJk7WilF5ckB52ofvx7nRgJlokICnawZH83nVUJ42GqSJ2XWAKCSU
         VjImonYgA4W9Ecy29FUhtSqAWu5wFdtMsP+q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RftfUOzx6cuYVUbwyHqCRiPh7HztqAU4DiiO5zyA3ug=;
        b=i5tbnXooBZlYC51Ct26HaWfvwedlSTwODMqUDzhUhoX0ZZK55uZqWgRRJoZCODqCo+
         YcLRjko0Z0DdaACg5dXWtdqa0A4Fu2C8hZ2L1lm/kG6Bltw7IjAfWI88XxRKJ/VKK8Cl
         Ias3+H4YgabGQqDm9pETEf/lmLtH23N++vlFsJ2Z9rbtJfdqsn9CD7ac045uBRvTIp5P
         GDb9q2zodDrArflegj5H4DWpFjgEV4CX4UFL2krhPJMTJRmDhXzmtLA3tGz0LMzL4/1O
         z5pCXDt4O5FZfEKQv/zNn30pY4evs9OjhNnd4nBPKFLu2HutnjmcD2L/+iEL9vQ+cnRx
         QihQ==
X-Gm-Message-State: AOAM5312BWPfR/Ky7UIu87GqASxB6YjJrxk2DtNWgrWFi5BkOqTQrCc3
        VgR254w7+oecJjBmIVnDlINz3w==
X-Google-Smtp-Source: ABdhPJyWJPfsuWZo7IEr8dHnuW0/nVwSsCN/bl7cQL44qRDfQmhRVvVzLKpaT1eUJ/ohOgU3tpWf8A==
X-Received: by 2002:a17:90a:cb85:: with SMTP id a5mr5831006pju.124.1618933277027;
        Tue, 20 Apr 2021 08:41:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7a9:7e56:e9c3:13e8])
        by smtp.gmail.com with UTF8SMTPSA id w6sm2544287pfj.85.2021.04.20.08.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 08:41:16 -0700 (PDT)
Date:   Tue, 20 Apr 2021 08:41:15 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V3 1/5] arm64: dts: qcom: pm7325: Add pm7325 base dts file
Message-ID: <YH72G/Jj7LunQzLu@google.com>
References: <1618389266-5990-1-git-send-email-skakit@codeaurora.org>
 <1618389266-5990-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1618389266-5990-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 14, 2021 at 02:04:22PM +0530, satya priya wrote:
> Add base DTS file for pm7325 along with GPIOs and temp-alarm nodes.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
