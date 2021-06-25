Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA3063B4A3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 23:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhFYVde (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 17:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhFYVda (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 17:33:30 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC784C061768
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 14:31:07 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id 21so8486908pfp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 14:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CWYLOtSzf07pukGettLZc50AWqNx35k04qNjXA3uUb4=;
        b=i0XNMOQ4uz9CRdX9PQgd4duTYbpQRdBwZWydro5l1CSxhwXKjbM8rAQN7sOKGQ4oEn
         69Ea1kKbbeKN/sLulWYIDJbZPgOcM4CrDJbcAIUqD1AVR2PMQpIk95xy7p4WH9uywCKZ
         fMMINtS3sNFk67sVOjORHGjV6X+v1ecqDcHGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CWYLOtSzf07pukGettLZc50AWqNx35k04qNjXA3uUb4=;
        b=Wj/DKflasJvwkRtoe8UJNuH36ucnI5JTCtCVUQHpvcuKKRutbyyrSSQmyaGGNNyF/E
         QCmdEqlKhhBfHt8wPsByT1dTLKvJcDcEs5+0dNHpc9mHzNNx/UcAMWu6+pLnvxvM3dU9
         f2xUzHuVUPklS+iytjT6P2iaBKLKyvAu0g2ADPbq6G4ifDYQztHBCyTiNxiGu8vB/4yf
         ILIHfNnFymy0v2EkspMVZw0N6gAi4Mzc/WPEFv9TwtLDD5aRKsyHdCXWH/bsbKyKTsgN
         XEFMvgtCCelteBl11GrcWE1IUUAKxkkMfuAh1qOGUgbrqRNihVVFCsZc6SV8odjsSeJN
         KD8A==
X-Gm-Message-State: AOAM5315kUachMN7UPm3HiSbtBYF82peEeinRWyK/PxtxDXJzaT3hlf9
        qAmLonNPkXCgf+A1Al9I6gyH3Q==
X-Google-Smtp-Source: ABdhPJzSvBxJcV+ygLJWWnosjmUXSs4/lr7r94utpED/5DLwIo9VOQtTr5OTKEq2/LLDJ0XHGYZZPQ==
X-Received: by 2002:a05:6a00:26cc:b029:308:a51b:8077 with SMTP id p12-20020a056a0026ccb0290308a51b8077mr8615356pfw.11.1624656667204;
        Fri, 25 Jun 2021 14:31:07 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id p4sm6754839pff.148.2021.06.25.14.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 14:31:06 -0700 (PDT)
Date:   Fri, 25 Jun 2021 14:31:05 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        swboyd@chromium.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v3 01/13] dt-bindings: soc: qcom: aoss: Drop power-domain
 bindings
Message-ID: <YNZLGf1uqSqQ8zR8@google.com>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
 <1624560727-6870-2-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624560727-6870-2-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 25, 2021 at 12:21:55AM +0530, Sibi Sankar wrote:
> The power-domains exposed by AOSS QMP node are used to notify the Always
> on Subsystem (AOSS) that a particular co-processor is up/down. These
> co-processors enter low-power modes independent to that of the application
> processor and their states are expected to remain unaltered across system
> suspend/resume cycles. To achieve this behavior let's drop the power-domain
> bindings and replace them with generic qmp_send interface instead.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>

FWIW:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
